@implementation _MFEmailAddress

- (_MFEmailAddress)initWithAddress:(id)a3 displayName:(id)a4
{
  id v6;
  id v7;
  _MFEmailAddress *v8;
  uint64_t v9;
  NSString *address;
  uint64_t v11;
  NSString *displayName;
  NSString *fullAddress;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_MFEmailAddress;
  v8 = -[_MFEmailAddress init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    address = v8->_address;
    v8->_address = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    displayName = v8->_displayName;
    v8->_displayName = (NSString *)v11;

    fullAddress = v8->_fullAddress;
    v8->_fullAddress = 0;

  }
  return v8;
}

- (_MFEmailAddress)initWithAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _MFEmailAddress *v16;

  v4 = a3;
  objc_msgSend(v4, "emailAddressValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "simpleAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(v4, "stringValue");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  objc_msgSend(v5, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "ef_stringByTrimmingOuterQuotes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByTrimmingCharactersInSet:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v5)
  {
    objc_msgSend(v10, "emailAddressValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {

      v10 = 0;
    }

  }
  v16 = -[_MFEmailAddress initWithAddress:displayName:](self, "initWithAddress:displayName:", v9, v10);

  return v16;
}

- (NSString)fullAddress
{
  _MFEmailAddress *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *fullAddress;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_fullAddress)
  {
    v3 = objc_alloc(MEMORY[0x1E0D1E6C0]);
    -[_MFEmailAddress address](v2, "address");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

    -[_MFEmailAddress displayName](v2, "displayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDisplayName:", v6);

    objc_msgSend(v5, "stringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      -[_MFEmailAddress address](v2, "address");
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    fullAddress = v2->_fullAddress;
    v2->_fullAddress = v9;

  }
  objc_sync_exit(v2);

  return v2->_fullAddress;
}

- (NSString)address
{
  return self->_address;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_fullAddress, 0);
}

@end
