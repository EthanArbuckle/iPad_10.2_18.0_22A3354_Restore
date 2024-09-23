@implementation CNComposeRecipient

+ (OS_os_log)os_log
{
  if (os_log_cn_once_token_5 != -1)
    dispatch_once(&os_log_cn_once_token_5, &__block_literal_global_7);
  return (OS_os_log *)(id)os_log_cn_once_object_5;
}

void __28__CNComposeRecipient_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.autocomplete.ui", "compose-recipient");
  v1 = (void *)os_log_cn_once_object_5;
  os_log_cn_once_object_5 = (uint64_t)v0;

}

+ (OS_os_log)namingLog
{
  if (namingLog_cn_once_token_6 != -1)
    dispatch_once(&namingLog_cn_once_token_6, &__block_literal_global_30);
  return (OS_os_log *)(id)namingLog_cn_once_object_6;
}

void __31__CNComposeRecipient_namingLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.autocomplete.ui", "compose-recipient-naming");
  v1 = (void *)namingLog_cn_once_object_6;
  namingLog_cn_once_object_6 = (uint64_t)v0;

}

+ (id)descriptorsForRequiredKeysForContact
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0C967C0];
  v7[0] = *MEMORY[0x1E0C966A8];
  v7[1] = v2;
  objc_msgSend(MEMORY[0x1E0C974D8], "descriptorForRequiredKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v3;
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[3] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CNComposeRecipient)init
{
  return -[CNComposeRecipient initWithContact:address:kind:](self, "initWithContact:address:kind:", 0, 0, 5);
}

- (CNComposeRecipient)initWithContact:(id)a3 address:(id)a4 kind:(unint64_t)a5
{
  return -[CNComposeRecipient initWithContact:address:displayString:kind:](self, "initWithContact:address:displayString:kind:", a3, a4, 0, a5);
}

- (CNComposeRecipient)initWithContact:(id)a3 address:(id)a4 displayString:(id)a5 kind:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  CNComposeRecipient *v14;
  NSObject *v15;
  uint64_t v16;
  NSString *inputAddress;
  uint64_t v18;
  NSString *address;
  uint64_t v20;
  NSString *displayString;
  CNComposeRecipient *v22;
  objc_class *v24;
  void *v25;
  objc_super v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  CNComposeRecipient *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  unint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v26.receiver = self;
  v26.super_class = (Class)CNComposeRecipient;
  v14 = -[CNComposeRecipient init](&v26, sel_init);
  if (v14)
  {
    objc_msgSend((id)objc_opt_class(), "namingLog");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544387;
      v28 = v25;
      v29 = 2048;
      v30 = v14;
      v31 = 2113;
      v32 = v13;
      v33 = 2113;
      v34 = v12;
      v35 = 2048;
      v36 = a6;
      _os_log_debug_impl(&dword_1B10FF000, v15, OS_LOG_TYPE_DEBUG, "Initializing %{public}@ %p with displayString '%{private}@', address '%{private}@' (%lu)", buf, 0x34u);

    }
    objc_storeStrong((id *)&v14->_contact, a3);
    v16 = objc_msgSend(v12, "copy");
    inputAddress = v14->_inputAddress;
    v14->_inputAddress = (NSString *)v16;

    _displayableAddressOfKind(v12, a6);
    v18 = objc_claimAutoreleasedReturnValue();
    address = v14->_address;
    v14->_address = (NSString *)v18;

    if (v13)
    {
      v20 = objc_msgSend(v13, "copy");
      displayString = v14->_displayString;
      v14->_displayString = (NSString *)v20;
    }
    else
    {
      displayString = v14->_displayString;
      v14->_displayString = (NSString *)&stru_1E62C0368;
    }

    v14->_kind = a6;
    v22 = v14;
  }

  return v14;
}

+ (CNComposeRecipient)composeRecipientWithAutocompleteResult:(id)a3
{
  id v3;
  CNComposeRecipientGroup *v4;
  void *v5;
  CNComposeRecipient *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;

  v3 = a3;
  if (!objc_msgSend(v3, "resultType"))
  {
    objc_msgSend(v3, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "addressType");

    if ((unint64_t)(v8 - 1) > 4)
      v9 = 5;
    else
      v9 = qword_1B1144CD8[v8 - 1];
    objc_msgSend(v3, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "address");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11 || (objc_msgSend(v11, "ea_isLegalEmailAddress") & 1) != 0)
      goto LABEL_19;
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scheme");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "length"))
    {
      if (objc_msgSend(CFSTR("mailto"), "isEqualToString:", v13))
      {
        objc_msgSend(v12, "resourceSpecifier");
        v14 = objc_claimAutoreleasedReturnValue();

        v9 = 0;
      }
      else
      {
        if (!objc_msgSend(CFSTR("tel"), "isEqualToString:", v13))
        {
          if (objc_msgSend(CFSTR("urn"), "isEqualToString:", v13))
            v9 = 4;
          goto LABEL_18;
        }
        objc_msgSend(v12, "resourceSpecifier");
        v14 = objc_claimAutoreleasedReturnValue();

        v9 = 1;
      }
      v11 = (void *)v14;
    }
LABEL_18:

LABEL_19:
    if (objc_msgSend(v11, "length"))
    {
      v6 = -[CNComposeRecipient initWithContact:address:kind:]([CNComposeRecipient alloc], "initWithContact:address:kind:", 0, v11, v9);
      -[CNComposeRecipient setAutocompleteResult:](v6, "setAutocompleteResult:", v3);
      objc_msgSend(v3, "displayName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNComposeRecipient setDisplayString:](v6, "setDisplayString:", v15);

      objc_msgSend(v3, "value");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNComposeRecipient setValueIdentifier:](v6, "setValueIdentifier:", v17);

      objc_msgSend(v3, "value");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "label");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNComposeRecipient setUnlocalizedLabel:](v6, "setUnlocalizedLabel:", v19);

      objc_msgSend(v3, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_msgSend(v3, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNComposeRecipient setContactIdentifier:](v6, "setContactIdentifier:", v21);

      }
    }
    else
    {
      v6 = 0;
    }
    objc_msgSend(v3, "nameComponents");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = (void *)objc_opt_new();
      objc_msgSend(v22, "firstName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setGivenName:", v24);

      objc_msgSend(v22, "lastName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setFamilyName:", v25);

      objc_msgSend(v22, "nickname");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setNickname:", v26);

      objc_msgSend(v22, "nameSuffix");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setNameSuffix:", v27);

      -[CNComposeRecipient setNameComponents:](v6, "setNameComponents:", v23);
    }
    else
    {
      objc_msgSend(v3, "displayName");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      _normalizeAddressOfKind(v28, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v11, "isEqualToString:", v29);

      if ((v30 & 1) != 0)
      {
LABEL_28:

        goto LABEL_29;
      }
      v31 = (void *)MEMORY[0x1E0D13AD8];
      objc_msgSend(v3, "displayName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "componentsFromString:", v23);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNComposeRecipient setNameComponents:](v6, "setNameComponents:", v32);

    }
    goto LABEL_28;
  }
  if (objc_msgSend(v3, "resultType") == 1)
  {
    v4 = [CNComposeRecipientGroup alloc];
    objc_msgSend(v3, "displayName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CNComposeRecipientGroup initWithChildren:displayString:](v4, "initWithChildren:displayString:", 0, v5);

    -[CNComposeRecipient setAutocompleteResult:](v6, "setAutocompleteResult:", v3);
  }
  else
  {
    v6 = 0;
  }
LABEL_29:

  return v6;
}

- (CNComposeRecipient)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  CNComposeRecipient *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contact"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contactIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("address"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kind"));

  v9 = -[CNComposeRecipient initWithContact:address:kind:](self, "initWithContact:address:kind:", v5, v7, v8);
  -[CNComposeRecipient setContactIdentifier:](v9, "setContactIdentifier:", v6);

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t kind;
  void *v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (self->_contact || self->_contactIdentifier)
    objc_msgSend(v4, "encodeObject:forKey:");
  -[CNComposeRecipient inputAddress](self, "inputAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CNComposeRecipient inputAddress](self, "inputAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("address"));

  }
  kind = self->_kind;
  v8 = v9;
  if (kind)
  {
    objc_msgSend(v9, "encodeInteger:forKey:", kind, CFSTR("kind"));
    v8 = v9;
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)addRecipientToPasteboard:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = (void *)MEMORY[0x1E0CB36F8];
  v5 = a3;
  objc_msgSend(v4, "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__CNComposeRecipient_addRecipientToPasteboard___block_invoke;
  v9[3] = &unk_1E62BF870;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", CFSTR("kCNPasteboardTypeComposeRecipient"), 0, v9);
  objc_msgSend(v5, "addObject:", v7);

}

uint64_t __47__CNComposeRecipient_addRecipientToPasteboard___block_invoke(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), 0);
  return 0;
}

- (id)contactWithKeysToFetch:(id)a3
{
  id v4;
  CNContact *v5;
  CNContact *contact;
  CNContact *v7;

  v4 = a3;
  if (!-[CNContact areKeysAvailable:](self->_contact, "areKeysAvailable:", v4))
  {
    -[CNComposeRecipient fetchContactWithKeys:](self, "fetchContactWithKeys:", v4);
    v5 = (CNContact *)objc_claimAutoreleasedReturnValue();
    contact = self->_contact;
    self->_contact = v5;

  }
  v7 = self->_contact;

  return v7;
}

- (CNContact)contact
{
  CNContact *contact;
  void *v4;
  BOOL v5;
  void *v6;
  CNContact *v7;
  CNContact *v8;

  contact = self->_contact;
  if (!contact
    || (+[CNComposeRecipient descriptorsForRequiredKeysForContact](CNComposeRecipient, "descriptorsForRequiredKeysForContact"), v4 = (void *)objc_claimAutoreleasedReturnValue(), v5 = -[CNContact areKeysAvailable:](contact, "areKeysAvailable:", v4), v4, !v5))
  {
    +[CNComposeRecipient descriptorsForRequiredKeysForContact](CNComposeRecipient, "descriptorsForRequiredKeysForContact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNComposeRecipient fetchContactWithKeys:](self, "fetchContactWithKeys:", v6);
    v7 = (CNContact *)objc_claimAutoreleasedReturnValue();
    v8 = self->_contact;
    self->_contact = v7;

  }
  return self->_contact;
}

- (id)fetchContactWithKeys:(id)a3
{
  id v4;
  CNAutocompleteResult *autocompleteResult;
  void *v6;
  id v7;
  NSString *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  CNContact *contact;
  id v15;
  id v16;
  uint8_t buf[4];
  CNComposeRecipient *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  autocompleteResult = self->_autocompleteResult;
  if (autocompleteResult)
  {
    v16 = 0;
    -[CNAutocompleteResult contactWithKeysToFetch:error:](autocompleteResult, "contactWithKeysToFetch:error:", v4, &v16);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v16;
    if (v6)
      goto LABEL_7;
  }
  else
  {
    v7 = 0;
  }
  v8 = self->_contactIdentifier;
  if (v8
    || (contact = self->_contact) != 0
    && -[CNContact hasBeenPersisted](contact, "hasBeenPersisted")
    && (-[CNContact identifier](self->_contact, "identifier"),
        (v8 = (NSString *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    CNAutocompleteSharedContactStore();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v7;
    objc_msgSend(v9, "unifiedContactWithIdentifier:keysToFetch:error:", v8, v4, &v15);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v15;

    v7 = v10;
LABEL_7:
    if (!v7)
      goto LABEL_11;
    goto LABEL_8;
  }
  v6 = 0;
  if (!v7)
    goto LABEL_11;
LABEL_8:
  objc_msgSend((id)objc_opt_class(), "os_log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "localizedDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v18 = self;
    v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_1B10FF000, v11, OS_LOG_TYPE_DEFAULT, "Error fetching contact for recipient: %p, %@", buf, 0x16u);

  }
LABEL_11:

  return v6;
}

- (unint64_t)sourceType
{
  void *v2;
  unint64_t v3;

  -[CNComposeRecipient autocompleteResult](self, "autocompleteResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sourceType");

  return v3;
}

- (NSString)displayString
{
  if (self->_displayString)
    return self->_displayString;
  else
    return (NSString *)&stru_1E62C0368;
}

- (void)setDisplayString:(id)a3
{
  __CFString *v3;

  if (a3)
    v3 = (__CFString *)a3;
  else
    v3 = &stru_1E62C0368;
  objc_storeStrong((id *)&self->_displayString, v3);
}

- (id)rawDisplayString
{
  return self->_displayString;
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
  unint64_t v3;
  char v4;
  BOOL result;

  v3 = -[CNComposeRecipient sourceType](self, "sourceType") & 5;
  v4 = -[CNComposeRecipient sourceType](self, "sourceType");
  result = 0;
  if (v3)
  {
    if ((v4 & 2) == 0)
      return !-[CNComposeRecipient isMemberOfGroup](self, "isMemberOfGroup");
  }
  return result;
}

- (BOOL)showsAccessoryButton
{
  return -[CNComposeRecipient isSuggestedRecipient](self, "isSuggestedRecipient")
      || -[CNComposeRecipient isRemovableFromSearchResults](self, "isRemovableFromSearchResults");
}

- (BOOL)wasCompleteMatch
{
  CNComposeRecipient *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v2 = self;
  v7[1] = *MEMORY[0x1E0C80C00];
  -[CNComposeRecipientOriginContext searchTerm](self->_originContext, "searchTerm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  LOBYTE(v2) = _fastCountOfCompleteMatches(v3, v4, &v6) != 0;

  return (char)v2;
}

- (BOOL)isSuggestedRecipient
{
  return -[CNComposeRecipient sourceType](self, "sourceType") == 4
      || -[CNComposeRecipient sourceType](self, "sourceType") == 20;
}

- (BOOL)showsChevronButton
{
  return 0;
}

- (BOOL)isDirectoryServerResult
{
  return -[CNComposeRecipient sourceType](self, "sourceType") == 8;
}

- (id)completelyMatchedAttributedStrings
{
  NSArray *cachedMatchedStrings;
  void *v4;
  void *v5;
  id v6;
  id v7;
  NSArray *v8;
  NSArray *v9;
  id v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  cachedMatchedStrings = self->_cachedMatchedStrings;
  if (!cachedMatchedStrings)
  {
    -[CNComposeRecipientOriginContext searchTerm](self->_originContext, "searchTerm");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = self;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v12 = 0;
    v6 = _sortedArrayByRelevancy(v4, v5, &v12, &v11);
    v7 = v12;
    v8 = (NSArray *)v11;

    v9 = self->_cachedMatchedStrings;
    self->_cachedMatchedStrings = v8;

    cachedMatchedStrings = self->_cachedMatchedStrings;
  }
  return cachedMatchedStrings;
}

- (id)preferredSendingAddress
{
  return (id)-[CNAutocompleteResult lastSendingAddress](self->_autocompleteResult, "lastSendingAddress");
}

- (void)setAddress:(id)a3
{
  NSString *v4;
  NSString *inputAddress;
  void *v6;
  NSString *v7;
  NSString *address;
  NSString *compositeName;
  NSString *shortName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  inputAddress = self->_inputAddress;
  self->_inputAddress = v4;

  -[CNComposeRecipient uncommentedAddress](self, "uncommentedAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _displayableAddressOfKind(v6, self->_kind);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  address = self->_address;
  self->_address = v7;

  compositeName = self->_compositeName;
  self->_compositeName = 0;

  shortName = self->_shortName;
  self->_shortName = 0;

}

- (NSString)normalizedAddress
{
  void *v3;
  void *v4;

  -[CNComposeRecipient uncommentedAddress](self, "uncommentedAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _normalizeAddressOfKind(v3, self->_kind);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)unifiedHandles
{
  NSSet *cachedHandles;
  id v4;
  void *v5;
  NSSet *v6;
  NSSet *v7;

  cachedHandles = self->_cachedHandles;
  if (!cachedHandles)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99E60]);
    -[CNComposeRecipient associatedHandles](self, "associatedHandles");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSSet *)objc_msgSend(v4, "initWithArray:", v5);
    v7 = self->_cachedHandles;
    self->_cachedHandles = v6;

    cachedHandles = self->_cachedHandles;
  }
  return cachedHandles;
}

- (id)associatedHandles
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0C967C0];
  v17[0] = *MEMORY[0x1E0C966A8];
  v17[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNComposeRecipient contactWithKeysToFetch:](self, "contactWithKeysToFetch:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "emailAddresses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_cn_map:", &__block_literal_global_63);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "phoneNumbers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_cn_map:", &__block_literal_global_64);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNComposeRecipient normalizedAddress](self, "normalizedAddress");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CNComposeRecipient normalizedAddress](self, "normalizedAddress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

uint64_t __39__CNComposeRecipient_associatedHandles__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

uint64_t __39__CNComposeRecipient_associatedHandles__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

- (NSString)commentedAddress
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (self->_kind)
  {
    -[CNComposeRecipient address](self, "address");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CNComposeRecipient uncommentedAddress](self, "uncommentedAddress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNComposeRecipientNamer nameForComposeRecipient:sources:]((uint64_t)CNComposeRecipientNamer, self, 2147483615);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 && objc_msgSend(v4, "length") && v5 && objc_msgSend(v5, "length"))
    {
      objc_msgSend(MEMORY[0x1E0D1E440], "formattedAddressWithName:email:useQuotes:", v5, v4, 1);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = v4;
    }
    v3 = v6;
    if (!v6)
    {
      -[CNComposeRecipient inputAddress](self, "inputAddress");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        -[CNComposeRecipient inputAddress](self, "inputAddress");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "ea_uncommentedAddress");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        -[CNComposeRecipient inputAddress](self, "inputAddress");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "ea_addressComment");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D1E440], "formattedAddressWithName:email:useQuotes:", v10, v8, 1);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }

  }
  return (NSString *)v3;
}

- (NSString)label
{
  NSString *label;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *v7;

  label = self->_label;
  if (!label)
  {
    -[CNComposeRecipient unlocalizedLabel](self, "unlocalizedLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[CNComposeRecipient contact](self, "contact");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(MEMORY[0x1E0C97338], "localizedStringForLabel:", v4);
        v6 = (NSString *)objc_claimAutoreleasedReturnValue();
        v7 = self->_label;
        self->_label = v6;

      }
    }

    label = self->_label;
  }
  return label;
}

- (NSString)unlocalizedLabel
{
  void *v3;
  NSString *v4;

  -[CNComposeRecipient contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = self->_unlocalizedLabel;
  else
    v4 = 0;
  return v4;
}

- (NSString)compositeName
{
  NSString *v3;
  NSString *v4;
  NSString *compositeName;

  v3 = self->_compositeName;
  if (!v3)
  {
    +[CNComposeRecipientNamer nameForComposeRecipient:]((uint64_t)CNComposeRecipientNamer, self);
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    v4 = (NSString *)-[NSString copy](v3, "copy");
    compositeName = self->_compositeName;
    self->_compositeName = v4;

  }
  return v3;
}

- (NSString)shortName
{
  NSString *v3;
  NSString *v4;
  NSString *shortName;

  v3 = self->_shortName;
  if (!v3)
  {
    +[CNComposeRecipientShortNamer shortNameForComposeRecipient:]((uint64_t)CNComposeRecipientShortNamer, self);
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    v4 = (NSString *)-[NSString copy](v3, "copy");
    shortName = self->_shortName;
    self->_shortName = v4;

  }
  return v3;
}

- (NSString)placeholderName
{
  unint64_t v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = -[CNComposeRecipient sourceType](self, "sourceType");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2 == 1)
    v5 = CFSTR("RECENT_PLACEHOLDER_NAME");
  else
    v5 = CFSTR("PLACEHOLDER_NAME");
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E62C0368, CFSTR("Localized"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSPersonNameComponents)nameComponents
{
  NSPersonNameComponents *v3;
  NSPersonNameComponents *v4;
  NSPersonNameComponents *v5;

  v3 = self->_nameComponents;
  if (!v3)
  {
    -[CNComposeRecipient nameComponentsFromContact](self, "nameComponentsFromContact");
    v3 = (NSPersonNameComponents *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      -[CNComposeRecipient nameComponentsFromAddress](self, "nameComponentsFromAddress");
      v4 = (NSPersonNameComponents *)objc_claimAutoreleasedReturnValue();
      v3 = v4;
      if (v4)
        v5 = v4;

    }
  }
  return v3;
}

- (id)nameComponentsFromContact
{
  void *v2;

  if (self->_contact)
  {
    objc_msgSend(MEMORY[0x1E0CB3850], "componentsForContact:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)nameComponentsFromAddress
{
  NSString *address;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  address = self->_address;
  if (address && !self->_kind)
  {
    -[NSString ea_addressComment](address, "ea_addressComment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && (objc_msgSend(v5, "isEqualToString:", self->_address) & 1) == 0)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0CB3858]);
      objc_msgSend(v7, "personNameComponentsFromString:", v6);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (NSString)uncommentedAddress
{
  void *v3;
  unint64_t kind;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
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
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  -[CNComposeRecipient inputAddress](self, "inputAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    kind = self->_kind;
    -[CNComposeRecipient inputAddress](self, "inputAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!kind)
    {
      objc_msgSend(v5, "ea_uncommentedAddress");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      return (NSString *)v7;
    }
  }
  else
  {
    v9 = *MEMORY[0x1E0C967C0];
    v38[0] = *MEMORY[0x1E0C966A8];
    v38[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNComposeRecipient contactWithKeysToFetch:](self, "contactWithKeysToFetch:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      if (self->_kind == 1)
      {
        v34 = 0uLL;
        v35 = 0uLL;
        v32 = 0uLL;
        v33 = 0uLL;
        objc_msgSend(v11, "phoneNumbers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v33;
          while (2)
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v33 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
              objc_msgSend(v17, "identifier");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "isEqualToString:", self->_valueIdentifier);

              if (v19)
              {
                objc_msgSend(v17, "value");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "stringValue");
                v6 = (void *)objc_claimAutoreleasedReturnValue();

                goto LABEL_27;
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
            if (v14)
              continue;
            break;
          }
        }
      }
      else
      {
        v30 = 0uLL;
        v31 = 0uLL;
        *((_QWORD *)&v28 + 1) = 0;
        v29 = 0uLL;
        objc_msgSend(v11, "emailAddresses", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v29;
          while (2)
          {
            for (j = 0; j != v21; ++j)
            {
              if (*(_QWORD *)v29 != v22)
                objc_enumerationMutation(v12);
              v24 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
              objc_msgSend(v24, "identifier");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v25, "isEqualToString:", self->_valueIdentifier);

              if (v26)
              {
                objc_msgSend(v24, "value");
                v6 = (void *)objc_claimAutoreleasedReturnValue();
                goto LABEL_27;
              }
            }
            v21 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            if (v21)
              continue;
            break;
          }
        }
      }
      v6 = 0;
LABEL_27:

    }
    else
    {
      v6 = 0;
    }

  }
  return (NSString *)v6;
}

- (NSString)stringForEqualityTesting
{
  void *v3;
  uint64_t v4;

  -[CNComposeRecipient address](self, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), self);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return (NSString *)v3;
}

- (NSString)pasteboardString
{
  void *v3;

  -[CNComposeRecipient uncommentedAddress](self, "uncommentedAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[CNComposeRecipient address](self, "address");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      -[CNComposeRecipient compositeName](self, "compositeName");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return (NSString *)v3;
}

- (BOOL)supportsPasteboardUnarchiving
{
  void *v3;
  BOOL v4;
  void *v5;

  -[CNComposeRecipient contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[CNComposeRecipient inputAddress](self, "inputAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v4 = 1;
    else
      v4 = -[CNComposeRecipient isGroup](self, "isGroup");

  }
  return v4;
}

- (void)setOriginContext:(id)a3
{
  objc_storeStrong((id *)&self->_originContext, a3);
}

- (id)_unformattedAddress
{
  void *v3;
  uint64_t v4;

  -[CNComposeRecipient uncommentedAddress](self, "uncommentedAddress");
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
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  v16 = 0;
  v17[0] = *MEMORY[0x1E0C966A8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNComposeRecipient contactWithKeysToFetch:](self, "contactWithKeysToFetch:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNComposeRecipient inputAddress](self, "inputAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 == 0;

    if (!v6)
    {
      objc_msgSend(v4, "emailAddresses");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __44__CNComposeRecipient_labeledValueIdentifier__block_invoke;
      v10[3] = &unk_1E62BF8D8;
      v10[4] = self;
      v10[5] = &v11;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

    }
  }
  v8 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v8;
}

void __44__CNComposeRecipient_labeledValueIdentifier__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "inputAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    objc_msgSend(v12, "identifier");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    *a4 = 1;
  }

}

- (BOOL)isEquivalentAddressToRecipient:(id)a3
{
  CNComposeRecipient *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;

  v4 = (CNComposeRecipient *)a3;
  v5 = -[CNComposeRecipient kind](self, "kind");
  if (v5 == -[CNComposeRecipient kind](v4, "kind"))
  {
    if (self == v4)
    {
      v13 = 1;
    }
    else
    {
      if (-[CNComposeRecipient kind](self, "kind"))
      {
        if (-[CNComposeRecipient kind](self, "kind") == 1)
        {
          v6 = (void *)MEMORY[0x1E0C97398];
          -[CNComposeRecipient address](self, "address");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "phoneNumberWithStringValue:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          v9 = (void *)MEMORY[0x1E0C97398];
          -[CNComposeRecipient address](v4, "address");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "phoneNumberWithStringValue:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          v12 = objc_msgSend(v8, "isEqual:", v11);
        }
        else
        {
          -[CNComposeRecipient normalizedAddress](v4, "normalizedAddress");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNComposeRecipient normalizedAddress](self, "normalizedAddress");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v8, "isEqualToString:", v11);
        }
      }
      else
      {
        -[CNComposeRecipient address](self, "address");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNComposeRecipient address](v4, "address");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v8, "_cn_caseInsensitiveIsEqual:", v11);
      }
      v13 = v12;

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  CNComposeRecipient *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (CNComposeRecipient *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      && (-[CNComposeRecipient address](self, "address"), (v5 = objc_claimAutoreleasedReturnValue()) != 0)
      && (v6 = (void *)v5,
          -[CNComposeRecipient address](v4, "address"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          v6,
          v7))
    {
      -[CNComposeRecipient address](v4, "address");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNComposeRecipient address](self, "address");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "ea_isEqualToEmailAddress:", v8);

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  -[CNComposeRecipient address](self, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNComposeRecipient address](self, "address");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hash");

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CNComposeRecipient;
    return -[CNComposeRecipient hash](&v7, sel_hash);
  }
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
  if ((-[CNComposeRecipient sourceType](self, "sourceType") & 2) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("Contact"));
  if ((-[CNComposeRecipient sourceType](self, "sourceType") & 0x10) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("Prediction"));
  if ((-[CNComposeRecipient sourceType](self, "sourceType") & 1) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("Recent"));
  if ((-[CNComposeRecipient sourceType](self, "sourceType") & 0x48) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("Server"));
  if ((-[CNComposeRecipient sourceType](self, "sourceType") & 4) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("Suggestion"));
  if (!-[CNComposeRecipient sourceType](self, "sourceType"))
    objc_msgSend(v3, "addObject:", CFSTR("<undefined>"));
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("+"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNComposeRecipient displayString](self, "displayString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNComposeRecipient address](self, "address");
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

- (void)setCompositeName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (CNComposeRecipientOriginContext)originContext
{
  return self->_originContext;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (NSString)address
{
  return self->_address;
}

- (unint64_t)kind
{
  return self->_kind;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setUnlocalizedLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)cachedCompleteMatches
{
  return self->_cachedCompleteMatches;
}

- (void)setCachedCompleteMatches:(id)a3
{
  objc_storeStrong((id *)&self->_cachedCompleteMatches, a3);
}

- (NSArray)cachedMatchedStrings
{
  return self->_cachedMatchedStrings;
}

- (void)setCachedMatchedStrings:(id)a3
{
  objc_storeStrong((id *)&self->_cachedMatchedStrings, a3);
}

- (NSArray)cachedSortedMembers
{
  return self->_cachedSortedMembers;
}

- (void)setCachedSortedMembers:(id)a3
{
  objc_storeStrong((id *)&self->_cachedSortedMembers, a3);
}

- (NSSet)cachedHandles
{
  return self->_cachedHandles;
}

- (void)setCachedHandles:(id)a3
{
  objc_storeStrong((id *)&self->_cachedHandles, a3);
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)valueIdentifier
{
  return self->_valueIdentifier;
}

- (void)setValueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)inputAddress
{
  return self->_inputAddress;
}

- (void)setInputAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (BOOL)isMemberOfGroup
{
  return self->_isMemberOfGroup;
}

- (void)setIsMemberOfGroup:(BOOL)a3
{
  self->_isMemberOfGroup = a3;
}

- (CNAutocompleteResult)autocompleteResult
{
  return self->_autocompleteResult;
}

- (void)setAutocompleteResult:(id)a3
{
  objc_storeStrong((id *)&self->_autocompleteResult, a3);
}

- (void)setNameComponents:(id)a3
{
  objc_storeStrong((id *)&self->_nameComponents, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameComponents, 0);
  objc_storeStrong((id *)&self->_autocompleteResult, 0);
  objc_storeStrong((id *)&self->_inputAddress, 0);
  objc_storeStrong((id *)&self->_valueIdentifier, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedHandles, 0);
  objc_storeStrong((id *)&self->_cachedSortedMembers, 0);
  objc_storeStrong((id *)&self->_cachedMatchedStrings, 0);
  objc_storeStrong((id *)&self->_cachedCompleteMatches, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_unlocalizedLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_originContext, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_shortName, 0);
  objc_storeStrong((id *)&self->_compositeName, 0);
}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.contactsui.composerecipient");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v12;

  v7 = a3;
  if (!UTTypeConformsTo((CFStringRef)a4, CFSTR("com.apple.contactsui.composerecipient")))
  {
    v8 = 0;
    if (!a5)
      goto LABEL_11;
    goto LABEL_9;
  }
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;
  if (v9)
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[CNComposeRecipient(NSItemProvider) objectWithItemProviderData:typeIdentifier:error:].cold.1(v9, v10);

  }
  if (a5)
  {
LABEL_9:
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_11:

  return v8;
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", CFSTR("com.apple.contactsui.composerecipient"));
  objc_msgSend(v2, "addObject:", *MEMORY[0x1E0CA5CB0]);
  objc_msgSend(MEMORY[0x1E0CB3940], "writableTypeIdentifiersForItemProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  return (NSArray *)v2;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  __CFString *v6;
  void (**v7)(id, id, _QWORD);
  id v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  v7 = (void (**)(id, id, _QWORD))a4;
  if (-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("com.apple.contactsui.composerecipient")))
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v8, 0);
  }
  else
  {
    if (UTTypeConformsTo(v6, (CFStringRef)*MEMORY[0x1E0CA5C20]))
    {
      -[CNComposeRecipient commentedAddress](self, "commentedAddress");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "loadDataWithTypeIdentifier:forItemProviderCompletionHandler:", v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    if (!UTTypeConformsTo(v6, (CFStringRef)*MEMORY[0x1E0CA5CB0]))
    {
      v7[2](v7, 0, 0);
      goto LABEL_4;
    }
    -[CNComposeRecipient contact](self, "contact");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v8 = v12;
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0C97200];
      -[CNComposeRecipient commentedAddress](self, "commentedAddress");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "em_contactFromEmailAddress:", v15);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    v16 = (void *)MEMORY[0x1E0C972A8];
    v21[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(v16, "dataWithContacts:error:", v17, &v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v20;

    ((void (**)(id, id, id))v7)[2](v7, v18, v19);
  }

LABEL_4:
  v9 = 0;
LABEL_7:

  return v9;
}

@end
