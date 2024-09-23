@implementation WFCNContact

- (WFCNContact)initWithCNContact:(id)a3 propertyID:(int)a4 multivalueIndex:(int64_t)a5 fromVCard:(BOOL)a6
{
  id v11;
  WFCNContact *v12;
  uint64_t v13;
  CNContact *contact;
  WFCNContact *v15;
  void *v17;
  objc_super v18;

  v11 = a3;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCNContact.m"), 292, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contact"));

  }
  v18.receiver = self;
  v18.super_class = (Class)WFCNContact;
  v12 = -[WFCNContact init](&v18, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v11, "copy");
    contact = v12->_contact;
    v12->_contact = (CNContact *)v13;

    v12->_propertyID = a4;
    v12->_multivalueIndex = a5;
    v12->_fromVCard = a6;
    v15 = v12;
  }

  return v12;
}

- (void)refetchContact
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  CNContact *v8;
  NSObject *p_super;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (WFCNContactAuthorizationStatus() == 3)
  {
    getCNContactStoreClass();
    v3 = (void *)objc_opt_new();
    -[CNContact identifier](self->_contact, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "requiredKeysToFetch");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(v3, "unifiedContactWithIdentifier:keysToFetch:error:", v4, v5, &v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;

    if (v6)
    {
      v8 = v6;
      p_super = &self->_contact->super;
      self->_contact = v8;
    }
    else
    {
      getWFWFContactLogObject();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v12 = "-[WFCNContact refetchContact]";
        v13 = 2112;
        v14 = v7;
        _os_log_impl(&dword_20BBAD000, p_super, OS_LOG_TYPE_ERROR, "%s Failed to re-fetch contact with error %@", buf, 0x16u);
      }
    }

  }
}

- (id)valueForPropertyID:(int)a3
{
  void *v4;
  NSObject *v5;
  CNContact *contact;
  void *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  CNContact *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  CNContactPropertyKeyFromWFContactPropertyID(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
LABEL_10:
    v7 = 0;
    goto LABEL_11;
  }
  if (!-[CNContact isKeyAvailable:](self->_contact, "isKeyAvailable:", v4))
  {
    getWFWFContactLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      contact = self->_contact;
      v10 = 136315650;
      v11 = "-[WFCNContact valueForPropertyID:]";
      v12 = 2112;
      v13 = v4;
      v14 = 2112;
      v15 = contact;
      _os_log_impl(&dword_20BBAD000, v5, OS_LOG_TYPE_DEFAULT, "%s Required key %@ is not available for contact %@, re-fetching", (uint8_t *)&v10, 0x20u);
    }

    -[WFCNContact refetchContact](self, "refetchContact");
    if (!-[CNContact isKeyAvailable:](self->_contact, "isKeyAvailable:", v4))
    {
      getWFWFContactLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v10 = 136315394;
        v11 = "-[WFCNContact valueForPropertyID:]";
        v12 = 2112;
        v13 = v4;
        _os_log_impl(&dword_20BBAD000, v8, OS_LOG_TYPE_ERROR, "%s Required key %@ still not available, bailing", (uint8_t *)&v10, 0x16u);
      }

      goto LABEL_10;
    }
  }
  -[CNContact valueForKey:](self->_contact, "valueForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v7;
}

- (WFCNContact)contactWithPropertyID:(int)a3 multivalueIndex:(int64_t)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_opt_class();
  -[WFCNContact contact](self, "contact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contactWithCNContact:propertyID:multivalueIndex:", v8, v5, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (WFCNContact *)v9;
}

- (id)contactIdentifierForINPerson
{
  id v3;
  void *v4;
  id CNContactClass;
  void *v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  _QWORD v22[6];
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x24BDAC8D0];
  -[WFCNContact contactIdentifier](self, "contactIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  getCNContactStoreClass();
  v4 = (void *)objc_opt_new();
  if (v3)
  {
    CNContactClass = getCNContactClass();
    v40[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CNContactClass, "predicateForContactsWithIdentifiers:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "unifiedContactsMatchingPredicate:keysToFetch:error:", v7, MEMORY[0x24BDBD1A8], 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count") == 0;

    if (!v9)
      goto LABEL_11;

  }
  v10 = (void *)objc_opt_new();
  -[WFCNContact emailAddresses](self, "emailAddresses");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __43__WFCNContact_contactIdentifierForINPerson__block_invoke;
  v32[3] = &unk_24C4DF518;
  v13 = v10;
  v33 = v13;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v32);

  -[WFCNContact phoneNumbers](self, "phoneNumbers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v12;
  v30[1] = 3221225472;
  v30[2] = __43__WFCNContact_contactIdentifierForINPerson__block_invoke_2;
  v30[3] = &unk_24C4DF518;
  v7 = v13;
  v31 = v7;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v30);

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__10503;
  v28 = __Block_byref_object_dispose__10504;
  v29 = 0;
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(getCNContactClass(), "predicateForContactsMatchingHandleStrings:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc((Class)getCNContactFetchRequestClass());
    objc_msgSend((id)objc_opt_class(), "requiredKeysToFetch");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithKeysToFetch:", v17);

    objc_msgSend(v18, "setPredicate:", v15);
    v22[0] = v12;
    v22[1] = 3221225472;
    v22[2] = __43__WFCNContact_contactIdentifierForINPerson__block_invoke_82;
    v22[3] = &unk_24C4DF540;
    v22[5] = &v24;
    v23 = 0;
    v22[4] = self;
    LOBYTE(v17) = objc_msgSend(v4, "enumerateContactsWithFetchRequest:error:usingBlock:", v18, &v23, v22);
    v19 = v23;
    if ((v17 & 1) == 0)
    {
      getWFWFContactLogObject();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v35 = "-[WFCNContact contactIdentifierForINPerson]";
        v36 = 2112;
        v37 = v7;
        v38 = 2114;
        v39 = v19;
        _os_log_impl(&dword_20BBAD000, v20, OS_LOG_TYPE_ERROR, "%s Failed to enumerate contacts when fetching contact identifier for handleStrings %@: %{public}@", buf, 0x20u);
      }

    }
  }
  v3 = (id)v25[5];
  _Block_object_dispose(&v24, 8);

LABEL_11:
  return v3;
}

- (id)vCardRepresentationWithFullData:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  CNContact *contact;
  _QWORD *v8;
  void *v9;
  NSObject *v10;
  CNContact *v11;
  CNContact *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id CNContactVCardSerializationClass;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  CNContact *v31;
  void *v32;
  _BYTE buf[24];
  void *v34;
  uint64_t *v35;
  uint64_t v36;

  v3 = a3;
  v36 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(getCNContactVCardSerializationClass(), "descriptorForRequiredKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v32, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (WFCNContactAuthorizationStatus() == 3 && !-[CNContact areKeysAvailable:](self->_contact, "areKeysAvailable:", v6))
  {
    contact = self->_contact;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v8 = (_QWORD *)getCNContactIdentifierKeySymbolLoc_ptr;
    v34 = (void *)getCNContactIdentifierKeySymbolLoc_ptr;
    if (!getCNContactIdentifierKeySymbolLoc_ptr)
    {
      v9 = ContactsLibrary_10368();
      v8 = dlsym(v9, "CNContactIdentifierKey");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v8;
      getCNContactIdentifierKeySymbolLoc_ptr = (uint64_t)v8;
    }
    _Block_object_dispose(buf, 8);
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString * _Nonnull getCNContactIdentifierKey(void)");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("WFCNContact.m"), 48, CFSTR("%s"), dlerror());

      __break(1u);
    }
    if (-[CNContact isKeyAvailable:](contact, "isKeyAvailable:", *v8))
    {
      getWFWFContactLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = self->_contact;
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[WFCNContact vCardRepresentationWithFullData:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v11;
        _os_log_impl(&dword_20BBAD000, v10, OS_LOG_TYPE_DEFAULT, "%s Insufficient information available for serializing %@, re-fetching", buf, 0x16u);
      }

      -[WFCNContact refetchContact](self, "refetchContact");
    }
  }
  v12 = self->_contact;
  if (!-[CNContact areKeysAvailable:](v12, "areKeysAvailable:", v6))
  {
    getWFWFContactLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[WFCNContact vCardRepresentationWithFullData:]";
      _os_log_impl(&dword_20BBAD000, v13, OS_LOG_TYPE_DEFAULT, "%s Keys required for serialization still not available, a new copy generated", buf, 0xCu);
    }

    v14 = -[CNContact copyWithDistinctIdentifier](self->_contact, "copyWithDistinctIdentifier");
    v12 = (CNContact *)v14;
  }
  v27 = 0;
  v28 = &v27;
  v29 = 0x2050000000;
  v15 = (void *)getCNVCardWritingOptionsClass_softClass;
  v30 = getCNVCardWritingOptionsClass_softClass;
  if (!getCNVCardWritingOptionsClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getCNVCardWritingOptionsClass_block_invoke;
    v34 = &unk_24C4E3118;
    v35 = &v27;
    __getCNVCardWritingOptionsClass_block_invoke((uint64_t)buf);
    v15 = (void *)v28[3];
  }
  v16 = objc_retainAutorelease(v15);
  _Block_object_dispose(&v27, 8);
  objc_msgSend(v16, "optionsFromPreferences");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setShouldSuppressRegulatoryLogging:", 1);
  if (v3)
  {
    objc_msgSend(v17, "setIncludeNotes:", 1);
    objc_msgSend(v17, "setIncludePhotos:", 1);
    objc_msgSend(v17, "setIncludePrivateFields:", 1);
    objc_msgSend(v17, "setPrefersUncroppedPhotos:", 1);
  }
  CNContactVCardSerializationClass = getCNContactVCardSerializationClass();
  v31 = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v31, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CNContactVCardSerializationClass, "dataWithContacts:options:error:", v19, v17, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8638]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContact wfName](self, "wfName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFFileRepresentation fileWithData:ofType:proposedFilename:](WFFileRepresentation, "fileWithData:ofType:proposedFilename:", v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (NSString)contactIdentifier
{
  NSString *v3;
  void *v4;

  if (-[WFCNContact fromVCard](self, "fromVCard"))
  {
    v3 = self->_contactIdentifier;
  }
  else
  {
    -[WFCNContact contact](self, "contact");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)formattedName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  CNContact *contact;
  CNContact *v9;
  void *v10;
  id CNContactFormatterClass;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v17;
  CNContact *v18;
  void *v19;
  void *v20;
  void *v21;
  CNContact *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  CNContact *v37;
  _QWORD v38[4];

  v38[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(getCNContactFormatterClass(), "descriptorForRequiredKeysForStyle:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  getCNContactEmailAddressesKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  getCNContactPhoneNumbersKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v3;
  v38[1] = v4;
  v38[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNContact areKeysAvailable:](self->_contact, "areKeysAvailable:", v6))
    goto LABEL_5;
  getWFWFContactLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    contact = self->_contact;
    *(_DWORD *)buf = 136315650;
    v33 = "-[WFCNContact formattedName]";
    v34 = 2112;
    v35 = v6;
    v36 = 2112;
    v37 = contact;
    _os_log_impl(&dword_20BBAD000, v7, OS_LOG_TYPE_DEFAULT, "%s Required keys %@ are not available for contact %@, re-fetching", buf, 0x20u);
  }

  -[WFCNContact refetchContact](self, "refetchContact");
  v9 = self->_contact;
  v31 = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v31, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = -[CNContact areKeysAvailable:](v9, "areKeysAvailable:", v10);

  if ((v9 & 1) != 0)
  {
LABEL_5:
    CNContactFormatterClass = getCNContactFormatterClass();
    -[WFCNContact contact](self, "contact");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CNContactFormatterClass, "stringFromContact:style:", v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = v13;
    }
    else
    {
      WFLocalizedString(CFSTR("No Name"));
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v14;
    goto LABEL_9;
  }
  getWFWFContactLogObject();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "-[WFCNContact formattedName]";
    v34 = 2112;
    v35 = v3;
    _os_log_impl(&dword_20BBAD000, v17, OS_LOG_TYPE_ERROR, "%s Required key %@ still not available, falling back to other contact properties", buf, 0x16u);
  }

  v18 = self->_contact;
  v30 = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v30, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = -[CNContact areKeysAvailable:](v18, "areKeysAvailable:", v19);

  if (!(_DWORD)v18)
  {
LABEL_17:
    v22 = self->_contact;
    v29 = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v29, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v22) = -[CNContact areKeysAvailable:](v22, "areKeysAvailable:", v23);

    if ((_DWORD)v22)
    {
      -[WFCNContact contact](self, "contact");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "phoneNumbers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v13, "count"))
      {
        objc_msgSend(v13, "firstObject");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "value");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringValue");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        +[WFPhoneNumber phoneNumberWithPhoneNumberString:](WFPhoneNumber, "phoneNumberWithPhoneNumberString:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v28, "formattedPhoneNumber");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }

    }
    WFLocalizedString(CFSTR("No Name"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  -[WFCNContact contact](self, "contact");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "emailAddresses");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v13, "count"))
  {

    goto LABEL_17;
  }
  objc_msgSend(v13, "firstObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "value");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
LABEL_10:

  return v15;
}

- (id)namePrefix
{
  void *v2;
  void *v3;

  -[WFCNContact contact](self, "contact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "namePrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)firstName
{
  void *v2;
  void *v3;

  -[WFCNContact contact](self, "contact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "givenName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)middleName
{
  void *v2;
  void *v3;

  -[WFCNContact contact](self, "contact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "middleName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)lastName
{
  void *v2;
  void *v3;

  -[WFCNContact contact](self, "contact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "familyName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)nameSuffix
{
  void *v2;
  void *v3;

  -[WFCNContact contact](self, "contact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nameSuffix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)nickname
{
  void *v2;
  void *v3;

  -[WFCNContact contact](self, "contact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nickname");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)organization
{
  void *v2;
  void *v3;

  -[WFCNContact contact](self, "contact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "organizationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isPropertyIDRepresented:(int)a3
{
  if (-[WFCNContact propertyID](self, "propertyID") == -1)
    return 1;
  if (-[WFCNContact propertyID](self, "propertyID") == a3)
    return -[WFCNContact multivalueIndex](self, "multivalueIndex") != -1;
  return 0;
}

- (BOOL)hasValueForPropertyID:(int)a3
{
  uint64_t v3;
  void *v5;
  BOOL v6;
  BOOL v7;

  v3 = *(_QWORD *)&a3;
  if (!-[WFCNContact isPropertyIDRepresented:](self, "isPropertyIDRepresented:"))
    return 0;
  -[WFCNContact valueForPropertyID:](self, "valueForPropertyID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = objc_msgSend(v5, "count") == 0;
  else
    v6 = v5 == 0;
  v7 = !v6;

  return v7;
}

- (BOOL)hasImageData
{
  void *v2;
  char v3;

  -[WFCNContact contact](self, "contact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "imageDataAvailable");

  return v3;
}

- (id)imageData
{
  void *v2;
  void *v3;

  -[WFCNContact contact](self, "contact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)thumbnailImageData
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[WFCNContact contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "thumbnailImageData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[WFCNContact imageData](self, "imageData");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)birthday
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id CNContactClass;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  id result;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  if (!-[WFCNContact isPropertyIDRepresented:](self, "isPropertyIDRepresented:", 17))
    return 0;
  -[WFCNContact contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "birthday");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "wf_dateFromComponentsInCurrentTimeZone:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      CNContactClass = getCNContactClass();
      v15 = 0;
      v16 = &v15;
      v17 = 0x2020000000;
      v8 = (_QWORD *)getCNContactBirthdayKeySymbolLoc_ptr_10479;
      v18 = getCNContactBirthdayKeySymbolLoc_ptr_10479;
      if (!getCNContactBirthdayKeySymbolLoc_ptr_10479)
      {
        v9 = ContactsLibrary_10368();
        v8 = dlsym(v9, "CNContactBirthdayKey");
        v16[3] = (uint64_t)v8;
        getCNContactBirthdayKeySymbolLoc_ptr_10479 = (uint64_t)v8;
      }
      _Block_object_dispose(&v15, 8);
      if (!v8)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString * _Nonnull getCNContactBirthdayKey(void)");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("WFCNContact.m"), 49, CFSTR("%s"), dlerror());

        __break(1u);
        return result;
      }
      objc_msgSend(CNContactClass, "localizedStringForKey:", *v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFContactLabeledValue labeledValueWithLabel:value:](WFContactLabeledValue, "labeledValueWithLabel:value:", v10, v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)dates
{
  void *v3;
  void *v4;
  void *v5;

  if (-[WFCNContact isPropertyIDRepresented:](self, "isPropertyIDRepresented:", 12))
  {
    -[WFCNContact contact](self, "contact");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dates");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "if_map:", &__block_literal_global_93_10477);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v5;
}

- (id)phoneNumbers
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int64_t v16;
  void *v17;
  char v18;
  id CNLabeledValueClass;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  if (!-[WFCNContact isPropertyIDRepresented:](self, "isPropertyIDRepresented:", 3))
    return MEMORY[0x24BDBD1A8];
  v28 = (void *)objc_opt_new();
  -[WFCNContact contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "phoneNumbers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    obj = v5;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v10, "value");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFCNContact formattedName](self, "formattedName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "label");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[WFPhoneNumber phoneNumberWithPhoneNumberString:contactName:label:](WFPhoneNumber, "phoneNumberWithPhoneNumberString:contactName:label:", v12, v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          if (-[WFCNContact propertyID](self, "propertyID") == 3
            && (v16 = -[WFCNContact multivalueIndex](self, "multivalueIndex"),
                v16 == objc_msgSend(obj, "indexOfObject:", v10)))
          {
            -[WFCNContact formattedName](self, "formattedName");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = 1;
          }
          else
          {
            CNLabeledValueClass = getCNLabeledValueClass();
            objc_msgSend(v10, "label");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(CNLabeledValueClass, "localizedStringForLabel:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "capitalizedStringWithLocale:", v22);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            v18 = 0;
          }
          +[WFContactLabeledValue labeledValueWithLabel:value:](WFContactLabeledValue, "labeledValueWithLabel:value:", v17, v15);
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = (void *)v23;
          if ((v18 & 1) != 0)
          {
            v34 = v23;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v34, 1);
            v26 = (id)objc_claimAutoreleasedReturnValue();

            v5 = obj;
            v25 = v28;
            goto LABEL_19;
          }
          objc_msgSend(v28, "addObject:", v23);

        }
      }
      v5 = obj;
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v7)
        continue;
      break;
    }
  }

  v25 = v28;
  v26 = v28;
LABEL_19:

  return v26;
}

- (id)emailAddresses
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int64_t v15;
  _BOOL4 v16;
  void *v17;
  id CNLabeledValueClass;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  if (!-[WFCNContact isPropertyIDRepresented:](self, "isPropertyIDRepresented:", 4))
    return MEMORY[0x24BDBD1A8];
  v31 = (void *)objc_opt_new();
  -[WFCNContact contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "emailAddresses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v6)
  {
    v7 = v6;
    v32 = v5;
    v33 = *(_QWORD *)v35;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v35 != v33)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v9, "value", v30);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "length");

        if (v11)
        {
          objc_msgSend(v9, "value");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "label");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          +[WFEmailAddress addressWithEmailAddress:label:](WFEmailAddress, "addressWithEmailAddress:label:", v12, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (-[WFCNContact propertyID](self, "propertyID") == 4)
          {
            v15 = -[WFCNContact multivalueIndex](self, "multivalueIndex");
            v16 = v15 == objc_msgSend(v5, "indexOfObject:", v9);
          }
          else
          {
            v16 = 0;
          }
          objc_msgSend(v9, "label");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v17, "length"))
          {
            CNLabeledValueClass = getCNLabeledValueClass();
            objc_msgSend(v9, "label");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(CNLabeledValueClass, "localizedStringForLabel:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "capitalizedStringWithLocale:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v22 = 0;
          }

          if (v16)
          {
            -[WFCNContact formattedName](self, "formattedName");
            v23 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v23 = v22;
          }
          v24 = v23;
          +[WFContactLabeledValue labeledValueWithLabel:value:](WFContactLabeledValue, "labeledValueWithLabel:value:", v23, v14);
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = (void *)v25;
          if (v16)
          {
            v38 = v25;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v38, 1);
            v30 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v31, "addObject:", v25);
          }

          if (v16)
          {
            v5 = v32;

            v28 = (id)v30;
            v27 = v31;
            goto LABEL_27;
          }
          v5 = v32;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      if (v7)
        continue;
      break;
    }
  }

  v27 = v31;
  v28 = v31;
LABEL_27:

  return v28;
}

- (id)streetAddresses
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  _BOOL4 v14;
  id CNLabeledValueClass;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  if (!-[WFCNContact isPropertyIDRepresented:](self, "isPropertyIDRepresented:", 5))
    return MEMORY[0x24BDBD1A8];
  v28 = (void *)objc_opt_new();
  -[WFCNContact contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postalAddresses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v6)
  {
    v7 = v6;
    v29 = v5;
    v30 = *(_QWORD *)v32;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v32 != v30)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v9, "value", v27);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "label");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[WFStreetAddress streetAddressWithPostalAddress:label:](WFStreetAddress, "streetAddressWithPostalAddress:label:", v10, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (-[WFCNContact propertyID](self, "propertyID") == 5)
        {
          v13 = -[WFCNContact multivalueIndex](self, "multivalueIndex");
          v14 = v13 == objc_msgSend(v5, "indexOfObject:", v9);
        }
        else
        {
          v14 = 0;
        }
        CNLabeledValueClass = getCNLabeledValueClass();
        objc_msgSend(v9, "label");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CNLabeledValueClass, "localizedStringForLabel:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "capitalizedStringWithLocale:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          -[WFCNContact formattedName](self, "formattedName");
          v20 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v20 = v19;
        }
        v21 = v20;
        +[WFContactLabeledValue labeledValueWithLabel:value:](WFContactLabeledValue, "labeledValueWithLabel:value:", v20, v12);
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = (void *)v22;
        if (v14)
        {
          v35 = v22;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v35, 1);
          v27 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v28, "addObject:", v22);
        }

        if (v14)
        {
          v5 = v29;

          v25 = (id)v27;
          v24 = v28;
          goto LABEL_22;
        }
        v5 = v29;
      }
      v7 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (v7)
        continue;
      break;
    }
  }

  v24 = v28;
  v25 = v28;
LABEL_22:

  return v25;
}

- (id)URLs
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int64_t v20;
  void *v21;
  char v22;
  id CNLabeledValueClass;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  if (!-[WFCNContact isPropertyIDRepresented:](self, "isPropertyIDRepresented:", 22))
    return MEMORY[0x24BDBD1A8];
  v32 = (void *)objc_opt_new();
  -[WFCNContact contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "urlAddresses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v34;
    v9 = 0x24BDBC000uLL;
LABEL_4:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v34 != v8)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v10);
      v12 = *(void **)(v9 + 3912);
      objc_msgSend(v11, "value");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "URLWithString:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "scheme");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        if (v14)
          goto LABEL_11;
      }
      else
      {
        v16 = *(void **)(v9 + 3912);
        objc_msgSend(v11, "value");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFSTR("http://"), "stringByAppendingString:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "URLWithString:", v18);
        v19 = objc_claimAutoreleasedReturnValue();

        v9 = 0x24BDBC000;
        v14 = (void *)v19;
        if (v19)
        {
LABEL_11:
          if (-[WFCNContact propertyID](self, "propertyID") == 22
            && (v20 = -[WFCNContact multivalueIndex](self, "multivalueIndex"),
                v20 == objc_msgSend(v5, "indexOfObject:", v11)))
          {
            -[WFCNContact formattedName](self, "formattedName");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = 1;
          }
          else
          {
            CNLabeledValueClass = getCNLabeledValueClass();
            objc_msgSend(v11, "label");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(CNLabeledValueClass, "localizedStringForLabel:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "capitalizedStringWithLocale:", v26);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            v9 = 0x24BDBC000;
            v22 = 0;
          }
          +[WFContactLabeledValue labeledValueWithLabel:value:](WFContactLabeledValue, "labeledValueWithLabel:value:", v21, v14);
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = (void *)v27;
          if ((v22 & 1) != 0)
          {
            v37 = v27;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v37, 1);
            v30 = (id)objc_claimAutoreleasedReturnValue();

            v29 = v32;
            goto LABEL_22;
          }
          objc_msgSend(v32, "addObject:", v27);

        }
      }
      if (v7 == ++v10)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        if (v7)
          goto LABEL_4;
        break;
      }
    }
  }

  v29 = v32;
  v30 = v32;
LABEL_22:

  return v30;
}

- (id)socialProfiles
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int64_t v12;
  void *v13;
  char v14;
  id CNLabeledValueClass;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (!-[WFCNContact isPropertyIDRepresented:](self, "isPropertyIDRepresented:", 46))
    return MEMORY[0x24BDBD1A8];
  v3 = (void *)objc_opt_new();
  -[WFCNContact contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "socialProfiles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v7)
  {
    v8 = v7;
    v24 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v24)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v10, "value");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[WFCNContact propertyID](self, "propertyID") == 46
          && (v12 = -[WFCNContact multivalueIndex](self, "multivalueIndex"),
              v12 == objc_msgSend(v6, "indexOfObject:", v10)))
        {
          -[WFCNContact formattedName](self, "formattedName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = 1;
        }
        else
        {
          CNLabeledValueClass = getCNLabeledValueClass();
          objc_msgSend(v10, "label");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(CNLabeledValueClass, "localizedStringForLabel:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
          v18 = v3;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "capitalizedStringWithLocale:", v19);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          v3 = v18;
          v14 = 0;
        }
        +[WFContactLabeledValue labeledValueWithLabel:value:](WFContactLabeledValue, "labeledValueWithLabel:value:", v13, v11);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)v20;
        if ((v14 & 1) != 0)
        {
          v29 = v20;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v29, 1);
          v22 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_17;
        }
        objc_msgSend(v3, "addObject:", v20);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v8)
        continue;
      break;
    }
  }

  v22 = v3;
LABEL_17:

  return v22;
}

- (id)instantMessageAddresses
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int64_t v12;
  void *v13;
  char v14;
  id CNLabeledValueClass;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (!-[WFCNContact isPropertyIDRepresented:](self, "isPropertyIDRepresented:", 13))
    return MEMORY[0x24BDBD1A8];
  v3 = (void *)objc_opt_new();
  -[WFCNContact contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "instantMessageAddresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v7)
  {
    v8 = v7;
    v24 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v24)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v10, "value");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[WFCNContact propertyID](self, "propertyID") == 13
          && (v12 = -[WFCNContact multivalueIndex](self, "multivalueIndex"),
              v12 == objc_msgSend(v6, "indexOfObject:", v10)))
        {
          -[WFCNContact formattedName](self, "formattedName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = 1;
        }
        else
        {
          CNLabeledValueClass = getCNLabeledValueClass();
          objc_msgSend(v10, "label");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(CNLabeledValueClass, "localizedStringForLabel:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
          v18 = v3;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "capitalizedStringWithLocale:", v19);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          v3 = v18;
          v14 = 0;
        }
        +[WFContactLabeledValue labeledValueWithLabel:value:](WFContactLabeledValue, "labeledValueWithLabel:value:", v13, v11);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)v20;
        if ((v14 & 1) != 0)
        {
          v29 = v20;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v29, 1);
          v22 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_17;
        }
        objc_msgSend(v3, "addObject:", v20);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v8)
        continue;
      break;
    }
  }

  v22 = v3;
LABEL_17:

  return v22;
}

- (NSString)accountIdentifier
{
  NSString *accountIdentifier;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSString *v19;
  NSString *v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  accountIdentifier = self->_accountIdentifier;
  if (!accountIdentifier)
  {
    getCNContactStoreClass();
    v4 = (void *)objc_opt_new();
    v27 = 0;
    v28 = &v27;
    v29 = 0x2050000000;
    v5 = (void *)getCNContainerClass_softClass;
    v30 = getCNContainerClass_softClass;
    if (!getCNContainerClass_softClass)
    {
      v22 = MEMORY[0x24BDAC760];
      v23 = 3221225472;
      v24 = __getCNContainerClass_block_invoke;
      v25 = &unk_24C4E3118;
      v26 = &v27;
      __getCNContainerClass_block_invoke((uint64_t)&v22);
      v5 = (void *)v28[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v27, 8);
    -[WFCNContact contact](self, "contact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "predicateForContainerOfContactWithIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "containersMatchingPredicate:error:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v10, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0;
      v28 = &v27;
      v29 = 0x2050000000;
      v13 = (void *)getCNAccountClass_softClass;
      v30 = getCNAccountClass_softClass;
      if (!getCNAccountClass_softClass)
      {
        v22 = MEMORY[0x24BDAC760];
        v23 = 3221225472;
        v24 = __getCNAccountClass_block_invoke;
        v25 = &unk_24C4E3118;
        v26 = &v27;
        __getCNAccountClass_block_invoke((uint64_t)&v22);
        v13 = (void *)v28[3];
      }
      v14 = objc_retainAutorelease(v13);
      _Block_object_dispose(&v27, 8);
      objc_msgSend(v12, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "predicateForAccountForContainerWithIdentifier:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "accountsMatchingPredicate:error:", v16, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "externalIdentifierString");
      v19 = (NSString *)objc_claimAutoreleasedReturnValue();
      v20 = self->_accountIdentifier;
      self->_accountIdentifier = v19;

    }
    accountIdentifier = self->_accountIdentifier;
  }
  return accountIdentifier;
}

- (id)attributionSetWithCachingIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BDD9BD0]);
  v6 = (void *)objc_msgSend(v5, "initWithBundleIdentifier:", *MEMORY[0x24BEC16B0]);
  objc_msgSend(MEMORY[0x24BDD9BF0], "sharedResolver");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resolvedAppMatchingDescriptor:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFCNContact accountIdentifier](self, "accountIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[WFCNContact accountIdentifier](self, "accountIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFContentAttributionSet attributionSetWithAccountBasedAppDescriptor:accountIdentifier:disclosureLevel:originalItemIdentifier:](WFContentAttributionSet, "attributionSetWithAccountBasedAppDescriptor:accountIdentifier:disclosureLevel:originalItemIdentifier:", v8, v10, 1, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[WFContentAttributionSet attributionSetWithAppDescriptor:disclosureLevel:originalItemIdentifier:](WFContentAttributionSet, "attributionSetWithAppDescriptor:disclosureLevel:originalItemIdentifier:", v8, 1, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  -[WFCNContact contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash") ^ self->_propertyID ^ self->_multivalueIndex ^ 0xCCC;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  WFCNContact *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  BOOL v11;

  v4 = (WFCNContact *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFCNContact contact](v4, "contact");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFCNContact contact](self, "contact");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v8)
        && (v9 = -[WFCNContact propertyID](v4, "propertyID"), v9 == -[WFCNContact propertyID](self, "propertyID")))
      {
        v10 = -[WFCNContact multivalueIndex](v4, "multivalueIndex");
        v11 = v10 == -[WFCNContact multivalueIndex](self, "multivalueIndex");
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[WFCNContact contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithCNContact:propertyID:multivalueIndex:fromVCard:", v5, -[WFCNContact propertyID](self, "propertyID"), -[WFCNContact multivalueIndex](self, "multivalueIndex"), -[WFCNContact fromVCard](self, "fromVCard"));

  return v6;
}

- (WFCNContact)initWithCoder:(id)a3
{
  id v4;
  WFCNContact *v5;
  uint64_t v6;
  NSString *contactIdentifier;
  WFCNContact *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFCNContact;
  v5 = -[WFContact initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contactIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFCNContact;
  v4 = a3;
  -[WFContact encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[WFCNContact contactIdentifier](self, "contactIdentifier", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("contactIdentifier"));

}

- (int)propertyID
{
  return self->_propertyID;
}

- (int64_t)multivalueIndex
{
  return self->_multivalueIndex;
}

- (CNContact)contact
{
  return self->_contact;
}

- (BOOL)fromVCard
{
  return self->_fromVCard;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

id __20__WFCNContact_dates__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id CNLabeledValueClass;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v2 = (void *)MEMORY[0x24BDBCE48];
  v3 = a2;
  objc_msgSend(v2, "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wf_dateFromComponentsInCurrentTimeZone:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  CNLabeledValueClass = getCNLabeledValueClass();
  objc_msgSend(v3, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(CNLabeledValueClass, "localizedStringForLabel:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "capitalizedStringWithLocale:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[WFContactLabeledValue labeledValueWithLabel:value:](WFContactLabeledValue, "labeledValueWithLabel:value:", v11, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __43__WFCNContact_contactIdentifierForINPerson__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "value");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __43__WFCNContact_contactIdentifierForINPerson__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "value");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "normalizedPhoneNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __43__WFCNContact_contactIdentifierForINPerson__block_invoke_82(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;

  v5 = a2;
  objc_msgSend(v5, "identifier");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  objc_msgSend(*(id *)(a1 + 32), "contact");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualIgnoringIdentifiers:", v5);

  if (v10)
    *a3 = 1;
}

+ (id)requiredKeysToFetch
{
  void *v2;
  void *v3;
  id *v4;
  void *v5;
  id v6;
  id *v7;
  void *v8;
  id v9;
  id *v10;
  void *v11;
  id v12;
  id *v13;
  void *v14;
  id v15;
  id *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[6];
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(getCNContactVCardSerializationClass(), "descriptorForRequiredKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v2;
  objc_msgSend(getCNContactFormatterClass(), "descriptorForRequiredKeysForStyle:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v3;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v4 = (id *)getCNContactImageDataAvailableKeySymbolLoc_ptr;
  v36 = getCNContactImageDataAvailableKeySymbolLoc_ptr;
  if (!getCNContactImageDataAvailableKeySymbolLoc_ptr)
  {
    v5 = ContactsLibrary_10368();
    v4 = (id *)dlsym(v5, "CNContactImageDataAvailableKey");
    v34[3] = (uint64_t)v4;
    getCNContactImageDataAvailableKeySymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v33, 8);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString * _Nonnull getCNContactImageDataAvailableKey(void)");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("WFCNContact.m"), 43, CFSTR("%s"), dlerror());

    goto LABEL_22;
  }
  v6 = *v4;
  v37[2] = v6;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v7 = (id *)getCNContactImageDataKeySymbolLoc_ptr;
  v36 = getCNContactImageDataKeySymbolLoc_ptr;
  if (!getCNContactImageDataKeySymbolLoc_ptr)
  {
    v8 = ContactsLibrary_10368();
    v7 = (id *)dlsym(v8, "CNContactImageDataKey");
    v34[3] = (uint64_t)v7;
    getCNContactImageDataKeySymbolLoc_ptr = (uint64_t)v7;
  }
  _Block_object_dispose(&v33, 8);
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString * _Nonnull getCNContactImageDataKey(void)");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("WFCNContact.m"), 44, CFSTR("%s"), dlerror());

    goto LABEL_22;
  }
  v9 = *v7;
  v37[3] = v9;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v10 = (id *)getCNContactThumbnailImageDataKeySymbolLoc_ptr;
  v36 = getCNContactThumbnailImageDataKeySymbolLoc_ptr;
  if (!getCNContactThumbnailImageDataKeySymbolLoc_ptr)
  {
    v11 = ContactsLibrary_10368();
    v10 = (id *)dlsym(v11, "CNContactThumbnailImageDataKey");
    v34[3] = (uint64_t)v10;
    getCNContactThumbnailImageDataKeySymbolLoc_ptr = (uint64_t)v10;
  }
  _Block_object_dispose(&v33, 8);
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString * _Nonnull getCNContactThumbnailImageDataKey(void)");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, CFSTR("WFCNContact.m"), 45, CFSTR("%s"), dlerror());

    goto LABEL_22;
  }
  v12 = *v10;
  v37[4] = v12;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v13 = (id *)getCNContactModificationDateKeySymbolLoc_ptr_10538;
  v36 = getCNContactModificationDateKeySymbolLoc_ptr_10538;
  if (!getCNContactModificationDateKeySymbolLoc_ptr_10538)
  {
    v14 = ContactsLibrary_10368();
    v13 = (id *)dlsym(v14, "CNContactModificationDateKey");
    v34[3] = (uint64_t)v13;
    getCNContactModificationDateKeySymbolLoc_ptr_10538 = (uint64_t)v13;
  }
  _Block_object_dispose(&v33, 8);
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString * _Nonnull getCNContactModificationDateKey(void)");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, CFSTR("WFCNContact.m"), 46, CFSTR("%s"), dlerror());

    goto LABEL_22;
  }
  v15 = *v13;
  v37[5] = v15;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v16 = (id *)getCNContactCreationDateKeySymbolLoc_ptr_10541;
  v36 = getCNContactCreationDateKeySymbolLoc_ptr_10541;
  if (!getCNContactCreationDateKeySymbolLoc_ptr_10541)
  {
    v17 = ContactsLibrary_10368();
    v16 = (id *)dlsym(v17, "CNContactCreationDateKey");
    v34[3] = (uint64_t)v16;
    getCNContactCreationDateKeySymbolLoc_ptr_10541 = (uint64_t)v16;
  }
  _Block_object_dispose(&v33, 8);
  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString * _Nonnull getCNContactCreationDateKey(void)");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, CFSTR("WFCNContact.m"), 47, CFSTR("%s"), dlerror());

LABEL_22:
    __break(1u);
  }
  v38 = *v16;
  v18 = v38;
  getCNContactPhoneNumbersKey();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v19;
  getCNContactEmailAddressesKey();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)contactsWithVCardData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v4 = a3;
  objc_msgSend(getCNContactVCardSerializationClass(), "contactsWithData:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __37__WFCNContact_contactsWithVCardData___block_invoke;
  v8[3] = &__block_descriptor_40_e22__24__0__CNContact_8Q16l;
  v8[4] = a1;
  objc_msgSend(v5, "if_map:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)contactWithVCardData:(id)a3 propertyID:(int)a4 multivalueIndex:(int64_t)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 0;
  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v16 = 0;
  objc_msgSend(getCNContactVCardSerializationClass(), "contactsWithData:error:", v8, &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v16;
  objc_msgSend(v9, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = objc_alloc((Class)a1);
    objc_msgSend(v9, "firstObject");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithCNContact:propertyID:multivalueIndex:fromVCard:", v13, v6, a5, 1);
  }
  else
  {
    getWFWFContactLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "+[WFCNContact contactWithVCardData:propertyID:multivalueIndex:]";
      v19 = 2114;
      v20 = v10;
      _os_log_impl(&dword_20BBAD000, v13, OS_LOG_TYPE_ERROR, "%s Contact failed to deserialize from vCard data: %{public}@", buf, 0x16u);
    }
    v14 = 0;
  }

  return v14;
}

+ (id)contactWithCNContact:(id)a3
{
  return (id)objc_msgSend(a1, "contactWithCNContact:propertyID:multivalueIndex:", a3, 0xFFFFFFFFLL, -1);
}

+ (id)contactWithCNContact:(id)a3 propertyID:(int)a4 multivalueIndex:(int64_t)a5
{
  uint64_t v6;
  id v8;
  void *v9;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCNContact:propertyID:multivalueIndex:fromVCard:", v8, v6, a5, 0);

  return v9;
}

+ (id)lock_changeObservers
{
  if (lock_changeObservers_onceToken != -1)
    dispatch_once(&lock_changeObservers_onceToken, &__block_literal_global_103);
  return (id)lock_changeObservers_changeObservers;
}

+ (void)lock_updateContactStoreObservation
{
  void *v3;
  uint64_t v4;
  int v5;
  char v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "lock_changeObservers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  v5 = lock_updateContactStoreObservation_observingChanges;
  if (v4)
    v6 = lock_updateContactStoreObservation_observingChanges;
  else
    v6 = 1;
  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    getCNContactStoreDidChangeNotification();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", a1, sel_contactStoreDidChange_, v8, 0);
    goto LABEL_10;
  }
  if (v4)
    v5 = 0;
  if (v5 == 1)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    getCNContactStoreDidChangeNotification();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:name:object:", a1, v8, 0);
LABEL_10:

    lock_updateContactStoreObservation_observingChanges = v6 ^ 1;
  }
}

+ (void)contactStoreDidChange:(id)a3
{
  void *v4;
  id v5;

  os_unfair_lock_lock(&WFChangeObserversLock);
  objc_msgSend(a1, "lock_changeObservers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "copy");

  os_unfair_lock_unlock(&WFChangeObserversLock);
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_109);

}

+ (id)addContactsChangeObserver:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x24BDD1880];
  v5 = a3;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&WFChangeObserversLock);
  objc_msgSend(a1, "lock_changeObservers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = _Block_copy(v5);

  objc_msgSend(v7, "setObject:forKey:", v8, v6);
  objc_msgSend(a1, "lock_updateContactStoreObservation");
  os_unfair_lock_unlock(&WFChangeObserversLock);
  return v6;
}

+ (void)removeContactsChangeObserver:(id)a3
{
  id v4;
  void *v5;

  if (a3)
  {
    v4 = a3;
    os_unfair_lock_lock(&WFChangeObserversLock);
    objc_msgSend(a1, "lock_changeObservers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v4);

    objc_msgSend(a1, "lock_updateContactStoreObservation");
    os_unfair_lock_unlock(&WFChangeObserversLock);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __37__WFCNContact_contactStoreDidChange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
}

void __35__WFCNContact_lock_changeObservers__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)lock_changeObservers_changeObservers;
  lock_changeObservers_changeObservers = v0;

}

id __37__WFCNContact_contactsWithVCardData___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = *(objc_class **)(a1 + 32);
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithCNContact:propertyID:multivalueIndex:fromVCard:", v3, 0xFFFFFFFFLL, -1, 1);

  return v4;
}

@end
