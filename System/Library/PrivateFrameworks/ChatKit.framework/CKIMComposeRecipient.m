@implementation CKIMComposeRecipient

- (CKIMComposeRecipient)initWithHandle:(id)a3
{
  id v5;
  CKIMComposeRecipient *v6;
  CKIMComposeRecipient *v7;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_super v18;
  objc_super v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CKIMComposeRecipient;
  v6 = -[CKIMComposeRecipient init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_handle, a3);
    objc_msgSend(v5, "ID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length") == 0;

    if (v9 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v5;
        _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Handle passed to CKIMComposeRecipient was nil or has no address: %@", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0D397A8], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fetchCNContactForHandleWithID:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "ID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "_appearsToBePhoneNumber") & 1) != 0)
    {
      v15 = 1;
    }
    else if (objc_msgSend(v14, "_appearsToBeEmail"))
    {
      v15 = 0;
    }
    else
    {
      v15 = 2;
    }
    -[IMHandle ID](v7->_handle, "ID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18.receiver = v7;
    v18.super_class = (Class)CKIMComposeRecipient;
    v7 = -[CKIMComposeRecipient initWithContact:address:kind:](&v18, sel_initWithContact_address_kind_, v13, v16, v15);

  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKIMComposeRecipient;
  v4 = a3;
  -[CKIMComposeRecipient encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[CKIMComposeRecipient handle](self, "handle", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("handle"));

}

- (CKIMComposeRecipient)initWithCoder:(id)a3
{
  id v4;
  CKIMComposeRecipient *v5;
  uint64_t v6;
  IMHandle *handle;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKIMComposeRecipient;
  v5 = -[CKIMComposeRecipient initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("handle"));
    v6 = objc_claimAutoreleasedReturnValue();
    handle = v5->_handle;
    v5->_handle = (IMHandle *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)address
{
  return (id)-[IMHandle ID](self->_handle, "ID");
}

- (id)commentedAddress
{
  return (id)-[IMHandle nameAndID](self->_handle, "nameAndID");
}

- (id)unlocalizedLabel
{
  return 0;
}

- (id)compositeName
{
  return (id)-[IMHandle fullName](self->_handle, "fullName");
}

- (id)displayString
{
  uint64_t v3;
  int v4;
  IMHandle *handle;
  void *v6;
  void *v7;

  if (-[CKIMComposeRecipient useAbbreviatedDisplayName](self, "useAbbreviatedDisplayName"))
  {
    -[IMHandle _displayNameWithAbbreviation](self->_handle, "_displayNameWithAbbreviation");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CKIsRunningInMacCatalyst();
    handle = self->_handle;
    if (v4)
      -[IMHandle name](handle, "name");
    else
      -[IMHandle fullName](handle, "fullName");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v3;
  if (!v3)
  {
    CKFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NO_NAME"), &stru_1E276D870, CFSTR("ChatKit"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)uncommentedAddress
{
  return (id)-[IMHandle ID](self->_handle, "ID");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[CKIMComposeRecipient handle](self, "handle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqual:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CKIMComposeRecipient handle](self, "handle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)supportedDragTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *MEMORY[0x1E0D13600]);
}

- (BOOL)isRemovableFromSearchResults
{
  return 0;
}

- (IMHandle)handle
{
  return self->_handle;
}

- (BOOL)useAbbreviatedDisplayName
{
  return self->_useAbbreviatedDisplayName;
}

- (void)setUseAbbreviatedDisplayName:(BOOL)a3
{
  self->_useAbbreviatedDisplayName = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
