@implementation MFComposeRecipient

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.mobilemail.recipient");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.mobilemail.recipient")))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v8, 0);
    v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCoder:", v10);
    objc_msgSend(v10, "finishDecoding");

    if (!a5)
      goto LABEL_7;
  }
  else
  {
    v11 = 0;
    if (!a5)
      goto LABEL_7;
  }
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_7:

  return v11;
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", CFSTR("com.apple.mobilemail.recipient"));
  objc_msgSend((id)*MEMORY[0x1E0CEC638], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  objc_msgSend(MEMORY[0x1E0CB3940], "writableTypeIdentifiersForItemProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v4);

  return (NSArray *)v2;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.mobilemail.recipient")))
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v9, 0);

  }
  else
  {
    if (objc_msgSend(v8, "conformsToType:", *MEMORY[0x1E0CEC590]))
    {
      -[MFComposeRecipient commentedAddress](self, "commentedAddress");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "loadDataWithTypeIdentifier:forItemProviderCompletionHandler:", v6, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
    if (!objc_msgSend(v8, "conformsToType:", *MEMORY[0x1E0CEC638]))
    {
      v7[2](v7, 0, 0);
      v10 = 0;
      goto LABEL_10;
    }
    -[MFComposeRecipient contact](self, "contact");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      v16 = (void *)MEMORY[0x1E0C97200];
      -[MFComposeRecipient commentedAddress](self, "commentedAddress");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "em_contactFromEmailAddress:", v17);
      v14 = (id)objc_claimAutoreleasedReturnValue();

    }
    v18 = (void *)MEMORY[0x1E0C972A8];
    v23[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v18, "dataWithContacts:error:", v19, &v22);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v22;

    ((void (**)(id, void *, id))v7)[2](v7, v20, v21);
  }
  v10 = 0;
LABEL_10:

  return v10;
}

- (MFComposeRecipient)init
{
  return -[MFComposeRecipient initWithContact:address:kind:](self, "initWithContact:address:kind:", 0, 0, 5);
}

- (MFComposeRecipient)initWithContact:(id)a3 address:(id)a4 kind:(unint64_t)a5
{
  id v9;
  id v10;
  MFComposeRecipient *v11;
  MFComposeRecipient *v12;
  uint64_t v13;
  NSString *address;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MFComposeRecipient;
  v11 = -[MFComposeRecipient init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_contact, a3);
    v13 = objc_msgSend(v10, "copy");
    address = v12->_address;
    v12->_address = (NSString *)v13;

    v12->_kind = a5;
  }

  return v12;
}

+ (id)composeRecipientWithAutocompleteResult:(id)a3
{
  id v3;
  MFComposeRecipientGroup *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v3 = a3;
  if (objc_msgSend(v3, "resultType"))
  {
    if (objc_msgSend(v3, "resultType") == 1)
    {
      v4 = -[MFComposeRecipientGroup initWithChildren:displayString:]([MFComposeRecipientGroup alloc], "initWithChildren:displayString:", 0, 0);
      -[MFComposeRecipient setAutocompleteResult:](v4, "setAutocompleteResult:", v3);
    }
    else
    {
      v4 = 0;
    }
    goto LABEL_24;
  }
  objc_msgSend(v3, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "addressType");

  if ((unint64_t)(v6 - 1) >= 3)
    v7 = 5;
  else
    v7 = v6 - 1;
  objc_msgSend(v3, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "address");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && (objc_msgSend(v9, "ea_isLegalEmailAddress") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scheme");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length"))
    {
      if (objc_msgSend(CFSTR("mailto"), "isEqualToString:", v11))
      {
        objc_msgSend(v10, "resourceSpecifier");
        v12 = objc_claimAutoreleasedReturnValue();

        v7 = 0;
      }
      else
      {
        if (!objc_msgSend(CFSTR("tel"), "isEqualToString:", v11))
        {
          if (objc_msgSend(CFSTR("urn"), "isEqualToString:", v11))
            v7 = 4;
          goto LABEL_18;
        }
        objc_msgSend(v10, "resourceSpecifier");
        v12 = objc_claimAutoreleasedReturnValue();

        v7 = 1;
      }
      v9 = (void *)v12;
    }
LABEL_18:

  }
  if (objc_msgSend(v9, "length"))
  {
    v4 = -[MFComposeRecipient initWithContact:address:kind:]([MFComposeRecipient alloc], "initWithContact:address:kind:", 0, v9, v7);
    -[MFComposeRecipient setAutocompleteResult:](v4, "setAutocompleteResult:", v3);
    objc_msgSend(v3, "displayName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeRecipient setDisplayString:](v4, "setDisplayString:", v13);

    objc_msgSend(v3, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeRecipient setValueIdentifier:](v4, "setValueIdentifier:", v15);

    objc_msgSend(v3, "value");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "label");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeRecipient setUnlocalizedLabel:](v4, "setUnlocalizedLabel:", v17);

    -[MFComposeRecipient setSourceType:](v4, "setSourceType:", objc_msgSend(v3, "sourceType"));
    objc_msgSend(v3, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v3, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFComposeRecipient setContactIdentifier:](v4, "setContactIdentifier:", v19);

    }
  }
  else
  {
    v4 = 0;
  }

LABEL_24:
  return v4;
}

- (MFComposeRecipient)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const void *v12;
  ABRecordRef PersonWithRecordID;
  void *v15;
  void *v16;
  unsigned int v17;
  ABRecordID recordID;
  unsigned int v19;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contact"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("property"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -1431655766;
  objc_msgSend(v6, "getValue:size:", &v19, 4);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contactIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("address"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kind"));
  if (v5 || !objc_msgSend(v4, "containsValueForKey:", CFSTR("recordID")))
  {
    self = -[MFComposeRecipient initWithContact:address:kind:](self, "initWithContact:address:kind:", v5, v8, v9);
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recordID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("address"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFAddressBookManager sharedManager](MFAddressBookManager, "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (const void *)objc_msgSend(v11, "addressBook");

    recordID = -1431655766;
    objc_msgSend(v16, "getValue:size:", &recordID, 4);
    v17 = -1431655766;
    objc_msgSend(v15, "getValue:size:", &v17, 4);
    PersonWithRecordID = ABAddressBookGetPersonWithRecordID(v12, recordID);
    if (PersonWithRecordID)
      self = -[MFComposeRecipient initWithRecord:recordID:property:identifier:address:](self, "initWithRecord:recordID:property:identifier:address:", PersonWithRecordID, recordID, v19, v17, v10);

  }
  -[MFComposeRecipient setContactIdentifier:](self, "setContactIdentifier:", v7, v15);

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *address;
  unint64_t kind;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (*(_OWORD *)&self->_contact == 0)
  {
    if (self->_record)
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &self->_property, "i");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("property"));
      if (self->_recordID)
      {
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &self->_recordID, "i");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("recordID"));
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &self->_identifier, "i");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("identifier"));

      }
    }
  }
  else
  {
    objc_msgSend(v9, "encodeObject:forKey:");
  }
  address = self->_address;
  if (address)
    objc_msgSend(v9, "encodeObject:forKey:", address, CFSTR("address"));
  kind = self->_kind;
  if (kind)
    objc_msgSend(v9, "encodeInteger:forKey:", kind, CFSTR("kind"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MFComposeRecipient)initWithRecord:(void *)a3 recordID:(int)a4 property:(int)a5 identifier:(int)a6 address:(id)a7
{
  id v13;
  int v14;
  uint64_t v15;
  MFComposeRecipient *v16;
  uint64_t v17;

  v13 = a7;
  v14 = *MEMORY[0x1E0CF61A0];
  if (*MEMORY[0x1E0CF61A0] == a5)
  {
    v15 = 1;
  }
  else if (*MEMORY[0x1E0CF5F98] == a5)
  {
    v15 = 0;
  }
  else if (*MEMORY[0x1E0CF6020] == a5)
  {
    v15 = 2;
  }
  else
  {
    v15 = 5;
  }
  v16 = -[MFComposeRecipient initWithContact:address:kind:](self, "initWithContact:address:kind:", 0, v13, v15);
  if (v16)
  {
    if (a3)
    {
      v16->_record = (void *)CFRetain(a3);
      v16->_recordID = a4;
    }
    else
    {
      a6 = -1;
    }
    v16->_identifier = a6;
    objc_storeStrong((id *)&v16->_address, a7);
    v16->_property = a5;
    if (v14 == a5)
    {
      v17 = 1;
    }
    else if (*MEMORY[0x1E0CF5F98] == a5)
    {
      v17 = 0;
    }
    else
    {
      v17 = 5;
      if (*MEMORY[0x1E0CF6020] == a5)
        v17 = 2;
    }
    v16->_kind = v17;
  }

  return v16;
}

+ (id)recipientWithRecord:(void *)a3 recordID:(int)a4 property:(int)a5 identifier:(int)a6
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRecord:recordID:property:identifier:address:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, 0);
}

+ (id)recipientWithRecord:(void *)a3 property:(int)a4 identifier:(int)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRecord:recordID:property:identifier:address:", a3, 0xFFFFFFFFLL, *(_QWORD *)&a4, *(_QWORD *)&a5, 0);
}

+ (id)recipientWithProperty:(int)a3 address:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRecord:recordID:property:identifier:address:", 0, 0xFFFFFFFFLL, v4, 0xFFFFFFFFLL, v6);

  return v7;
}

- (int)property
{
  return self->_property;
}

- (void)record
{
  return self->_record;
}

- (void)setRecord:(void *)a3 recordID:(int)a4 identifier:(int)a5
{
  NSString *label;

  if (a3)
  {
    if (!self->_record)
    {
      self->_record = (void *)CFRetain(a3);
      self->_recordID = a4;
      self->_identifier = a5;
      label = self->_label;
      self->_label = 0;

    }
  }
}

- (int)recordID
{
  return self->_recordID;
}

- (int)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(int)a3
{
  void *v5;
  CFTypeRef v6;
  const void *v7;
  NSString *label;

  if (self->_identifier != a3)
  {
    v5 = -[MFComposeRecipient record](self, "record");
    if (v5)
    {
      v6 = ABRecordCopyValue(v5, self->_property);
      if (v6)
      {
        v7 = v6;
        if (ABMultiValueGetCount(v6) >= 1 && ABMultiValueGetIndexForIdentifier(v7, a3) != -1)
        {
          self->_identifier = a3;
          label = self->_label;
          self->_label = 0;

        }
        CFRelease(v7);
      }
    }
  }
}

+ (id)_requiredKeyDescriptors
{
  void *v2;
  void *v3;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C974D8], "descriptorForRequiredKeys", *MEMORY[0x1E0C966A8], *MEMORY[0x1E0C967C0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CNContact)contact
{
  CNContact *contact;
  CNAutocompleteResult *autocompleteResult;
  void *v5;
  CNContact *v6;
  id v7;
  CNContact *v8;
  void *v9;
  void *v10;
  NSString *contactIdentifier;
  void *v12;
  CNContact *v13;
  id v14;
  CNContact *v15;
  NSObject *v16;
  void *v17;
  id v19;
  id v20;
  uint8_t buf[4];
  MFComposeRecipient *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  contact = self->_contact;
  if (contact)
    return contact;
  autocompleteResult = self->_autocompleteResult;
  if (!autocompleteResult)
  {
    v9 = 0;
    goto LABEL_6;
  }
  +[MFComposeRecipient _requiredKeyDescriptors](MFComposeRecipient, "_requiredKeyDescriptors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  -[CNAutocompleteResult contactWithKeysToFetch:error:](autocompleteResult, "contactWithKeysToFetch:error:", v5, &v20);
  v6 = (CNContact *)objc_claimAutoreleasedReturnValue();
  v7 = v20;
  v8 = self->_contact;
  self->_contact = v6;

  v9 = v7;
  if (!self->_contact)
  {
LABEL_6:
    if (self->_contactIdentifier)
    {
      objc_msgSend(MEMORY[0x1E0C97298], "storeWithOptions:", 3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      contactIdentifier = self->_contactIdentifier;
      +[MFComposeRecipient _requiredKeyDescriptors](MFComposeRecipient, "_requiredKeyDescriptors");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v9;
      objc_msgSend(v10, "unifiedContactWithIdentifier:keysToFetch:error:", contactIdentifier, v12, &v19);
      v13 = (CNContact *)objc_claimAutoreleasedReturnValue();
      v14 = v19;

      v15 = self->_contact;
      self->_contact = v13;

      v9 = v14;
    }
  }
  if (v9)
  {
    MFLogGeneral();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "localizedDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v22 = self;
      v23 = 2112;
      v24 = v17;
      _os_log_impl(&dword_1AB96A000, v16, OS_LOG_TYPE_DEFAULT, "#Warning Error fetching contact for recipient: %p, %@", buf, 0x16u);

    }
  }

  contact = self->_contact;
  return contact;
}

- (id)children
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)sortedChildren
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)childrenWithCompleteMatches
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)isGroup
{
  return 0;
}

- (BOOL)isRemovableFromSearchResults
{
  BOOL v3;

  v3 = (-[MFComposeRecipient sourceType](self, "sourceType") & 5) != 0;
  return (-[MFComposeRecipient sourceType](self, "sourceType") & 2) == 0 && v3;
}

- (BOOL)showsAccessoryButton
{
  return -[MFComposeRecipient isSuggestedRecipient](self, "isSuggestedRecipient")
      || -[MFComposeRecipient isRemovableFromSearchResults](self, "isRemovableFromSearchResults");
}

- (BOOL)wasCompleteMatch
{
  void *v3;
  void *v4;
  BOOL v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[MFComposeRecipientOriginContext searchTerm](self->_originContext, "searchTerm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v5 = _fastCountOfCompleteMatches(v3, v4, &v7) != 0;

  return v5;
}

- (BOOL)isSuggestedRecipient
{
  return -[MFComposeRecipient sourceType](self, "sourceType") == 4
      || -[MFComposeRecipient sourceType](self, "sourceType") == 20;
}

- (BOOL)isDirectoryServerResult
{
  return -[MFComposeRecipient sourceType](self, "sourceType") == 8;
}

- (id)completelyMatchedAttributedStrings
{
  NSArray *cachedMatchedStrings;
  void *v4;
  void *v5;
  id v6;
  id v7;
  NSArray *v8;
  NSArray **p_cachedMatchedStrings;
  NSArray *v10;
  id v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  cachedMatchedStrings = self->_cachedMatchedStrings;
  if (!cachedMatchedStrings)
  {
    -[MFComposeRecipientOriginContext searchTerm](self->_originContext, "searchTerm");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = self;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v13 = 0;
    v6 = _sortedArrayByRelevancy(v4, v5, &v13, &v12);
    v7 = v13;
    v8 = (NSArray *)v12;

    v10 = self->_cachedMatchedStrings;
    p_cachedMatchedStrings = &self->_cachedMatchedStrings;
    *p_cachedMatchedStrings = v8;

    cachedMatchedStrings = *p_cachedMatchedStrings;
  }
  return cachedMatchedStrings;
}

- (id)preferredSendingAddress
{
  return (id)-[CNAutocompleteResult lastSendingAddress](self->_autocompleteResult, "lastSendingAddress");
}

- (NSString)address
{
  void *v3;
  unint64_t kind;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[MFComposeRecipient uncommentedAddress](self, "uncommentedAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  kind = self->_kind;
  v5 = v3;
  v6 = v5;
  v7 = v5;
  if (v5)
  {
    v7 = v5;
    if (kind == 1)
    {
      v8 = (void *)CPPhoneNumberCopyFormattedStringForTextMessage();
      v9 = v8;
      v7 = v6;
      if (v8)
      {
        v10 = v8;

        objc_msgSend(CFSTR("\u200E"), "stringByAppendingString:", v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }

  return (NSString *)v7;
}

- (void)setAddress:(id)a3
{
  NSString *v4;
  NSString *address;
  NSString *compositeName;
  id v7;

  v7 = a3;
  v4 = (NSString *)objc_msgSend(v7, "copy");
  address = self->_address;
  self->_address = v4;

  compositeName = self->_compositeName;
  self->_compositeName = 0;

}

- (NSString)normalizedAddress
{
  void *v3;
  unint64_t kind;
  id v5;
  void *v6;
  void *v7;
  id v8;
  char *v9;
  CFStringRef v10;
  const void *v11;
  const void *v12;
  uint64_t String;

  -[MFComposeRecipient uncommentedAddress](self, "uncommentedAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  kind = self->_kind;
  v5 = v3;
  v6 = v5;
  v7 = v5;
  if (!v5)
    goto LABEL_15;
  v7 = v5;
  if (kind != 1)
    goto LABEL_15;
  v8 = objc_retainAutorelease(v5);
  objc_msgSend(v8, "UTF8String");
  v9 = (char *)CPPhoneNumberCopyNormalized();
  if (!v9)
  {
    v7 = v8;
    goto LABEL_15;
  }
  v10 = CFStringCreateWithCString(0, v9, 0x8000100u);
  v11 = (const void *)CPPhoneNumberCopyHomeCountryCode();
  v12 = (const void *)CFPhoneNumberCreate();
  String = CFPhoneNumberCreateString();

  v7 = (void *)String;
  if (String)
  {
    if (!v12)
      goto LABEL_10;
    goto LABEL_9;
  }
  v7 = (void *)CFPhoneNumberCreateString();
  if (v12)
LABEL_9:
    CFRelease(v12);
LABEL_10:
  if (v11)
    CFRelease(v11);
  if (v10)
    CFRelease(v10);
  free(v9);
LABEL_15:

  return (NSString *)v7;
}

- (NSString)commentedAddress
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSString *address;
  void *v9;
  void *v10;

  if (self->_kind)
  {
    -[MFComposeRecipient address](self, "address");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MFComposeRecipient uncommentedAddress](self, "uncommentedAddress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeRecipient compositeName](self, "compositeName");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v4 && v5)
    {
      objc_msgSend(MEMORY[0x1E0D1E440], "formattedAddressWithName:email:useQuotes:", v5, v4, 1);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = v4;
    }
    v3 = v7;
    if (!v7)
    {
      address = self->_address;
      if (address)
      {
        -[NSString ea_uncommentedAddress](address, "ea_uncommentedAddress");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSString ea_addressComment](self->_address, "ea_addressComment");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D1E440], "formattedAddressWithName:email:useQuotes:", v10, v9, 1);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v3 = 0;
      }
    }

  }
  return (NSString *)v3;
}

- (NSString)label
{
  NSString *label;
  __CFString *v4;
  void *v5;
  NSString *v6;
  NSString *v7;

  label = self->_label;
  if (!label)
  {
    -[MFComposeRecipient unlocalizedLabel](self, "unlocalizedLabel");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[MFComposeRecipient contact](self, "contact");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(MEMORY[0x1E0C97338], "localizedStringForLabel:", v4);
        v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = (NSString *)ABAddressBookCopyLocalizedLabel(v4);
      }
      v7 = self->_label;
      self->_label = v6;

    }
    label = self->_label;
  }
  return label;
}

- (NSString)unlocalizedLabel
{
  void *v3;
  __CFString *v4;
  CFTypeRef v5;
  const void *v6;
  CFIndex IndexForIdentifier;

  -[MFComposeRecipient contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = self->_unlocalizedLabel;
  }
  else if (-[MFComposeRecipient record](self, "record")
         && (v5 = ABRecordCopyValue(-[MFComposeRecipient record](self, "record"), self->_property), (v6 = v5) != 0))
  {
    if (ABMultiValueGetCount(v5) < 1
      || (IndexForIdentifier = ABMultiValueGetIndexForIdentifier(v6, self->_identifier), IndexForIdentifier == -1))
    {
      v4 = 0;
    }
    else
    {
      v4 = (__CFString *)ABMultiValueCopyLabelAtIndex(v6, IndexForIdentifier);
    }
    CFRelease(v6);
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (NSString)compositeName
{
  NSString *compositeName;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  void *v8;
  NSString *v9;
  NSString *v10;

  compositeName = self->_compositeName;
  if (!compositeName)
  {
    -[MFComposeRecipient contact](self, "contact");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = (void *)MEMORY[0x1E0C97218];
      -[MFComposeRecipient contact](self, "contact");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringFromContact:style:", v6, 0);
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        goto LABEL_7;
    }
    else if (!-[MFComposeRecipient record](self, "record")
           || (v7 = (NSString *)ABRecordCopyCompositeName(-[MFComposeRecipient record](self, "record"))) == 0)
    {
LABEL_7:
      if (self->_kind)
      {
        v7 = 0;
      }
      else
      {
        -[NSString ea_addressComment](self->_address, "ea_addressComment");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (NSString *)objc_msgSend(v8, "copy");

        if (v9 == self->_address)
          v7 = 0;
        else
          v7 = v9;

      }
    }
    v10 = self->_compositeName;
    self->_compositeName = v7;

    compositeName = self->_compositeName;
  }
  return compositeName;
}

- (NSString)shortName
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[MFComposeRecipient compositeName](self, "compositeName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    goto LABEL_3;
  objc_msgSend(v3, "ea_personNameComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0CB3858]);
  objc_msgSend(v6, "setStyle:", 1);
  objc_msgSend(v6, "stringFromPersonNameComponents:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_3:
    -[MFComposeRecipient address](self, "address");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      if (objc_msgSend(v8, "ea_isLegalEmailAddress"))
      {
        objc_msgSend(v9, "substringToIndex:", objc_msgSend(MEMORY[0x1E0D1E450], "rangeOfAddressDomainFromAddress:", v9) - 1);
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = v9;
      }
      v7 = v10;
    }
    else
    {
      v7 = 0;
    }

  }
  return (NSString *)v7;
}

- (NSString)displayString
{
  NSString *v3;
  uint64_t v4;

  v3 = self->_displayString;
  if (!-[NSString length](v3, "length"))
  {
    -[MFComposeRecipient compositeName](self, "compositeName");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (NSString *)v4;
    if (!v4)
    {
      -[MFComposeRecipient address](self, "address");
      v3 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (!v3)
      {
        -[MFComposeRecipient placeholderName](self, "placeholderName");
        v3 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  return v3;
}

- (NSString)placeholderName
{
  unint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = -[MFComposeRecipient sourceType](self, "sourceType");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2 == 1)
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("RECENT_PLACEHOLDER_NAME"), &stru_1E5A6A588, CFSTR("Main"));
  else
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("PLACEHOLDER_NAME"), &stru_1E5A6A588, CFSTR("Main"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)uncommentedAddress
{
  NSString *address;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  int v13;
  void *v15;
  CFTypeRef v16;
  const void *v17;
  ABMultiValueIdentifier identifier;
  CFIndex IndexForIdentifier;
  void *v20;
  void *v21;
  uint64_t v22;
  void *j;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  address = self->_address;
  if (address)
  {
    if (self->_kind)
    {
      v4 = address;
    }
    else
    {
      -[NSString ea_uncommentedAddress](address, "ea_uncommentedAddress");
      v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    v8 = v4;
    return (NSString *)v8;
  }
  -[MFComposeRecipient contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (self->_kind == 1)
    {
      v34 = 0uLL;
      v35 = 0uLL;
      v32 = 0uLL;
      v33 = 0uLL;
      -[MFComposeRecipient contact](self, "contact");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "phoneNumbers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v33;
        while (2)
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(_QWORD *)v33 != v9)
              objc_enumerationMutation(v7);
            v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v11, "identifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "isEqualToString:", self->_valueIdentifier);

            if (v13)
            {
              objc_msgSend(v11, "value");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "stringValue");
              v8 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_35;
            }
          }
          v8 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
          if (v8)
            continue;
          break;
        }
      }
LABEL_35:

    }
    else
    {
      v30 = 0uLL;
      v31 = 0uLL;
      *((_QWORD *)&v28 + 1) = 0;
      v29 = 0uLL;
      -[MFComposeRecipient contact](self, "contact", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "emailAddresses");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = (void *)objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      if (v8)
      {
        v22 = *(_QWORD *)v29;
        while (2)
        {
          for (j = 0; j != v8; j = (char *)j + 1)
          {
            if (*(_QWORD *)v29 != v22)
              objc_enumerationMutation(v21);
            v24 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)j);
            objc_msgSend(v24, "identifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "isEqualToString:", self->_valueIdentifier);

            if (v26)
            {
              objc_msgSend(v24, "value");
              v8 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_37;
            }
          }
          v8 = (void *)objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          if (v8)
            continue;
          break;
        }
      }
LABEL_37:

    }
    return (NSString *)v8;
  }
  v15 = -[MFComposeRecipient record](self, "record");
  if (v15)
  {
    v16 = ABRecordCopyValue(v15, self->_property);
    v17 = v16;
    if (v16)
    {
      if (ABMultiValueGetCount(v16) >= 1)
      {
        identifier = self->_identifier;
        if (identifier < 0)
        {
          IndexForIdentifier = 0;
        }
        else
        {
          IndexForIdentifier = ABMultiValueGetIndexForIdentifier(v17, identifier);
          if (IndexForIdentifier == -1)
            goto LABEL_23;
        }
        v8 = (void *)ABMultiValueCopyValueAtIndex(v17, IndexForIdentifier);
        goto LABEL_40;
      }
LABEL_23:
      v8 = 0;
LABEL_40:
      CFRelease(v17);
      return (NSString *)v8;
    }
  }
  return (NSString *)0;
}

- (void)setOriginContext:(id)a3
{
  objc_storeStrong((id *)&self->_originContext, a3);
}

- (id)_unformattedAddress
{
  void *v3;
  uint64_t v4;

  -[MFComposeRecipient uncommentedAddress](self, "uncommentedAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_kind == 1)
  {
    UIUnformattedPhoneNumberFromString();
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return v3;
}

- (id)labeledValueIdentifier
{
  void *v3;
  NSString *address;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__1;
  v14 = __Block_byref_object_dispose__1;
  v15 = 0;
  -[MFComposeRecipient contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    address = self->_address;

    if (address)
    {
      -[MFComposeRecipient contact](self, "contact");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "emailAddresses");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __44__MFComposeRecipient_labeledValueIdentifier__block_invoke;
      v9[3] = &unk_1E5A65F88;
      v9[4] = self;
      v9[5] = &v10;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

    }
  }
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __44__MFComposeRecipient_labeledValueIdentifier__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));

  if (v7)
  {
    objc_msgSend(v11, "identifier");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    *a4 = 1;
  }

}

- (BOOL)isEqual:(id)a3
{
  MFComposeRecipient *v4;
  id v5;
  id v6;
  void *v7;
  const void *active;
  char v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (MFComposeRecipient *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    if (self->_kind == 1)
    {
      -[MFComposeRecipient _unformattedAddress](self, "_unformattedAddress");
      v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v5, "UTF8String");

      -[MFComposeRecipient _unformattedAddress](v4, "_unformattedAddress");
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v6, "UTF8String");

      -[MFComposeRecipient countryCode](self, "countryCode");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        active = (const void *)CPPhoneNumberCopyActiveCountryCode();
        CFAutorelease(active);
      }
      v9 = CPPhoneNumbersEqual();
    }
    else
    {
      -[MFComposeRecipient address](self, "address");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10
        || (-[MFComposeRecipient address](v4, "address"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v11,
            v10,
            !v11))
      {
        v9 = 0;
        goto LABEL_12;
      }
      -[MFComposeRecipient address](v4, "address");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFComposeRecipient address](self, "address");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v12, "ea_isEqualToEmailAddress:", v7);

    }
  }
LABEL_12:

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  void *v5;
  objc_super v7;
  char v8;

  if (-[MFComposeRecipient record](self, "record") && *MEMORY[0x1E0CF61A0] == self->_property)
  {
    -[MFComposeRecipient _unformattedAddress](self, "_unformattedAddress");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v8 = 0;
      CPPhoneNumberGetLastFour();
    }
    v4 = 0;
    goto LABEL_10;
  }
  -[MFComposeRecipient address](self, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MFComposeRecipient address](self, "address");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hash");
LABEL_10:

    return v4;
  }
  v7.receiver = self;
  v7.super_class = (Class)MFComposeRecipient;
  return -[MFComposeRecipient hash](&v7, sel_hash);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[MFComposeRecipient sourceType](self, "sourceType") & 2) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("Contact"));
  if ((-[MFComposeRecipient sourceType](self, "sourceType") & 0x10) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("Prediction"));
  if ((-[MFComposeRecipient sourceType](self, "sourceType") & 1) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("Recent"));
  if ((-[MFComposeRecipient sourceType](self, "sourceType") & 0x48) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("Server"));
  if ((-[MFComposeRecipient sourceType](self, "sourceType") & 4) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("Suggestion"));
  if (!-[MFComposeRecipient sourceType](self, "sourceType"))
    objc_msgSend(v3, "addObject:", CFSTR("<undefined>"));
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("+"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeRecipient displayString](self, "displayString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeRecipient address](self, "address");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p; displayString: %@; address: %@; autocompleteSource: %@>"),
    v7,
    self,
    v8,
    v9,
    v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (MFComposeRecipientOriginContext)originContext
{
  return self->_originContext;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setUnlocalizedLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void)setDisplayString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)valueIdentifier
{
  return self->_valueIdentifier;
}

- (void)setValueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (unint64_t)sourceType
{
  return self->_sourceType;
}

- (void)setSourceType:(unint64_t)a3
{
  self->_sourceType = a3;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (CNAutocompleteResult)autocompleteResult
{
  return self->_autocompleteResult;
}

- (void)setAutocompleteResult:(id)a3
{
  objc_storeStrong((id *)&self->_autocompleteResult, a3);
}

- (unint64_t)kind
{
  return self->_kind;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originContext, 0);
  objc_storeStrong((id *)&self->_unlocalizedLabel, 0);
  objc_storeStrong((id *)&self->_compositeName, 0);
  objc_storeStrong((id *)&self->_valueIdentifier, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_autocompleteResult, 0);
  objc_storeStrong((id *)&self->_cachedSortedMembers, 0);
  objc_storeStrong((id *)&self->_cachedMatchedStrings, 0);
  objc_storeStrong((id *)&self->_cachedCompleteMatches, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end
