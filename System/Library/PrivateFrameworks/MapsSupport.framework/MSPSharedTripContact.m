@implementation MSPSharedTripContact

+ (void)setAdditionalKeyDescriptorsForContactFetching:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  MSPGetSharedTripLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138477827;
    v9 = v3;
    _os_log_impl(&dword_1B39C0000, v4, OS_LOG_TYPE_DEBUG, "[Contact] Setting additional keys for contact fetching: %{private}@", (uint8_t *)&v8, 0xCu);
  }

  v5 = (void *)qword_1ED328348;
  qword_1ED328348 = (uint64_t)v3;
  v6 = v3;

  v7 = (void *)_MergedGlobals_36;
  _MergedGlobals_36 = 0;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_originalHandle, CFSTR("contactHandle"));
}

- (MSPSharedTripContact)initWithCoder:(id)a3
{
  void *v4;
  MSPSharedTripContact *v5;

  objc_msgSend(a3, "decodeObjectForKey:", CFSTR("contactHandle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    self = -[MSPSharedTripContact initWithContactHandle:](self, "initWithContactHandle:", v4);
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  if (v4 && objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    objc_msgSend(v5, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSPSharedTripContact stringValue](self, "stringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      v10 = 1;
    }
    else
    {
      objc_msgSend(v5, "stringValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSPSharedTripContact stringValue](self, "stringValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MSPSharedTripContact stringValue](self, "stringValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  NSString *displayName;
  void *v6;
  void *v7;
  uint64_t v9;
  objc_super v10;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (self->_displayName)
  {
    v11.receiver = self;
    v11.super_class = (Class)MSPSharedTripContact;
    -[MSPSharedTripContact description](&v11, sel_description);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    displayName = self->_displayName;
    -[MSPSharedTripContact stringValue](self, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@ (%@)"), v4, displayName, v6);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MSPSharedTripContact;
    -[MSPSharedTripContact description](&v10, sel_description);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSPSharedTripContact stringValue](self, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@)"), v4, v6, v9);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_propertiesForFetching
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  int v20;
  uint64_t v21;
  _QWORD v22[18];

  v22[17] = *MEMORY[0x1E0C80C00];
  v2 = (void *)_MergedGlobals_36;
  if (!_MergedGlobals_36)
  {
    objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v3;
    objc_msgSend(MEMORY[0x1E0C972A8], "descriptorForRequiredKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0C96790];
    v22[1] = v4;
    v22[2] = v5;
    v6 = *MEMORY[0x1E0C96780];
    v22[3] = *MEMORY[0x1E0C966D0];
    v22[4] = v6;
    v7 = *MEMORY[0x1E0C96798];
    v22[5] = *MEMORY[0x1E0C966C0];
    v22[6] = v7;
    v8 = *MEMORY[0x1E0C967D8];
    v22[7] = *MEMORY[0x1E0C967A0];
    v22[8] = v8;
    v9 = *MEMORY[0x1E0C967D0];
    v22[9] = *MEMORY[0x1E0C967E0];
    v22[10] = v9;
    v10 = *MEMORY[0x1E0C96898];
    v22[11] = *MEMORY[0x1E0C967B8];
    v22[12] = v10;
    v11 = *MEMORY[0x1E0C966A8];
    v22[13] = *MEMORY[0x1E0C967C0];
    v22[14] = v11;
    v12 = *MEMORY[0x1E0C968A0];
    v22[15] = *MEMORY[0x1E0C967F0];
    v22[16] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 17);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)_MergedGlobals_36;
    _MergedGlobals_36 = v13;

    if (objc_msgSend((id)qword_1ED328348, "count"))
    {
      v15 = (void *)objc_msgSend((id)_MergedGlobals_36, "mutableCopy");
      objc_msgSend(v15, "addObjectsFromArray:", qword_1ED328348);
      v16 = objc_msgSend(v15, "copy");
      v17 = (void *)_MergedGlobals_36;
      _MergedGlobals_36 = v16;

    }
    MSPGetSharedTripLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v20 = 134217984;
      v21 = objc_msgSend((id)_MergedGlobals_36, "count");
      _os_log_impl(&dword_1B39C0000, v18, OS_LOG_TYPE_DEBUG, "[Contact] Recompiled %lu keys for contact fetching", (uint8_t *)&v20, 0xCu);
    }

    v2 = (void *)_MergedGlobals_36;
  }
  return v2;
}

- (void)_populateFromContactUsingHandle:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  CNLabeledValue *v16;
  void *v17;
  uint64_t v18;
  CNLabeledValue *i;
  void *v20;
  void *v21;
  int v22;
  CNLabeledValue *labeledValue;
  CNLabeledValue *v24;
  NSString *v25;
  NSString *displayName;
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
  v4 = a3;
  v5 = v4;
  if (self->_contact)
  {
    v6 = v4;
    if (v6)
    {
      v27 = v5;
      objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      -[CNContact phoneNumbers](self->_contact, "phoneNumbers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v33;
LABEL_5:
        v12 = 0;
        while (1)
        {
          if (*(_QWORD *)v33 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v12);
          objc_msgSend(v13, "value");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isLikePhoneNumber:", v7);

          if ((v15 & 1) != 0)
            break;
          if (v10 == ++v12)
          {
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
            if (v10)
              goto LABEL_5;
            goto LABEL_11;
          }
        }
        v16 = v13;

        if (v16)
          goto LABEL_25;
      }
      else
      {
LABEL_11:

      }
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      -[CNContact emailAddresses](self->_contact, "emailAddresses");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (CNLabeledValue *)objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      if (v16)
      {
        v18 = *(_QWORD *)v29;
        while (2)
        {
          for (i = 0; i != v16; i = (CNLabeledValue *)((char *)i + 1))
          {
            if (*(_QWORD *)v29 != v18)
              objc_enumerationMutation(v17);
            v20 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v20, "value");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "isEqualToString:", v6);

            if (v22)
            {
              v16 = v20;
              goto LABEL_24;
            }
          }
          v16 = (CNLabeledValue *)objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          if (v16)
            continue;
          break;
        }
      }
LABEL_24:

LABEL_25:
      v5 = v27;
    }
    else
    {
      v16 = 0;
    }
    labeledValue = self->_labeledValue;
    self->_labeledValue = v16;
    v24 = v16;

    objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", self->_contact, 1000);
    v25 = (NSString *)objc_claimAutoreleasedReturnValue();
    displayName = self->_displayName;
    self->_displayName = v25;

  }
}

- (MSPSharedTripContact)initWithContactHandle:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  MSPSharedTripContact *v13;
  _QWORD v15[5];
  id v16;
  uint8_t buf[8];
  uint8_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    if ((objc_msgSend(MEMORY[0x1E0C97298], "_maps_isAuthorized") & 1) != 0)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C97298]);
      v6 = objc_alloc(MEMORY[0x1E0C97210]);
      objc_msgSend((id)objc_opt_class(), "_propertiesForFetching");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v6, "initWithKeysToFetch:", v7);

      v9 = (void *)MEMORY[0x1E0C97200];
      v23[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "predicateForContactsMatchingHandleStrings:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setPredicate:", v11);

      objc_msgSend(v8, "setSortOrder:", 1);
      *(_QWORD *)buf = 0;
      v18 = buf;
      v19 = 0x3032000000;
      v20 = __Block_byref_object_copy_;
      v21 = __Block_byref_object_dispose_;
      v22 = 0;
      v15[4] = buf;
      v16 = 0;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __46__MSPSharedTripContact_initWithContactHandle___block_invoke;
      v15[3] = &unk_1E6651FB8;
      -[NSObject enumerateContactsWithFetchRequest:error:usingBlock:](v5, "enumerateContactsWithFetchRequest:error:usingBlock:", v8, &v16, v15);
      v12 = v16;
      self = -[MSPSharedTripContact initWithContact:handle:](self, "initWithContact:handle:", *((_QWORD *)v18 + 5), v4);
      _Block_object_dispose(buf, 8);

      v13 = self;
    }
    else
    {
      MSPGetSharedTripLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_ERROR, "[Contact] Asked to resolve handle to contact, but Maps is not authorised for Contacts", buf, 2u);
      }
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __46__MSPSharedTripContact_initWithContactHandle___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (MSPSharedTripContact)initWithContact:(id)a3 handle:(id)a4
{
  id v6;
  id v7;
  MSPSharedTripContact *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  MSPSharedTripContact *labeledValue;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MSPSharedTripContact;
  v8 = -[MSPSharedTripContact init](&v15, sel_init);
  if (!v8)
    goto LABEL_5;
  objc_msgSend((id)objc_opt_class(), "_propertiesForFetching");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "areKeysAvailable:", v9) & 1) == 0)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C97298]);
    objc_msgSend(v6, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unifiedContactWithIdentifier:keysToFetch:error:", v11, v9, 0);
    v12 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v12;
    if (!v12)
    {

      labeledValue = 0;
      goto LABEL_6;
    }
  }
  objc_storeStrong((id *)&v8->_contact, v6);
  objc_storeStrong((id *)&v8->_originalHandle, a4);
  -[MSPSharedTripContact _populateFromContactUsingHandle:](v8, "_populateFromContactUsingHandle:", v7);
  labeledValue = (MSPSharedTripContact *)v8->_labeledValue;

  if (labeledValue)
LABEL_5:
    labeledValue = v8;
LABEL_6:

  return labeledValue;
}

- (MSPSharedTripContact)initWithContact:(id)a3 labeledValue:(id)a4
{
  id v7;
  id v8;
  MSPSharedTripContact *v9;
  MSPSharedTripContact *v10;
  uint64_t v11;
  NSString *displayName;
  uint64_t v13;
  NSString *originalHandle;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MSPSharedTripContact;
  v9 = -[MSPSharedTripContact init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contact, a3);
    objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v10->_contact, 1000);
    v11 = objc_claimAutoreleasedReturnValue();
    displayName = v10->_displayName;
    v10->_displayName = (NSString *)v11;

    objc_storeStrong((id *)&v10->_labeledValue, a4);
    -[MSPSharedTripContact _stringValue](v10, "_stringValue");
    v13 = objc_claimAutoreleasedReturnValue();
    originalHandle = v10->_originalHandle;
    v10->_originalHandle = (NSString *)v13;

  }
  return v10;
}

- (id)_stringValue
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  -[MSPSharedTripContact labeledValue](self, "labeledValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[MSPSharedTripContact labeledValue](self, "labeledValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "value");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!-[MSPSharedTripContact isPhoneNumber](self, "isPhoneNumber"))
    {
      v9 = 0;
      return v9;
    }
    -[MSPSharedTripContact labeledValue](self, "labeledValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "unformattedInternationalStringValue");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v7;

  return v9;
}

- (NSString)handleForIDS
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  uint64_t v7;
  void *v8;

  -[MSPSharedTripContact labeledValue](self, "labeledValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[MSPSharedTripContact stringValue](self, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1B5E2AF78]();
  }
  else
  {
    if (!-[MSPSharedTripContact isPhoneNumber](self, "isPhoneNumber"))
    {
      v8 = 0;
      return (NSString *)v8;
    }
    -[MSPSharedTripContact stringValue](self, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = IDSCopyIDForPhoneNumber();
  }
  v8 = (void *)v7;

  return (NSString *)v8;
}

- (BOOL)isPhoneNumber
{
  void *v2;
  void *v3;
  char isKindOfClass;

  -[MSPSharedTripContact labeledValue](self, "labeledValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (NSString)displayName
{
  NSString *displayName;

  displayName = self->_displayName;
  if (displayName)
    return displayName;
  -[MSPSharedTripContact stringValue](self, "stringValue");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)contactsFromCNContact:(id)a3 matchingHandles:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  MSPSharedTripContact *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  MSPSharedTripContact *v29;
  void *v30;
  id obj;
  uint64_t v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint8_t v59[128];
  uint8_t buf[4];
  uint64_t v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  id v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v38 = a4;
  if (objc_msgSend(v38, "count"))
  {
    MSPGetSharedTripLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = objc_msgSend(v38, "count");
      objc_msgSend(v5, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218499;
      v61 = v7;
      v62 = 2113;
      v63 = v8;
      v64 = 2113;
      v65 = v38;
      _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_INFO, "Will attempt to match %lu handles for contact %{private}@ (%{private}@)", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    objc_msgSend(v5, "phoneNumbers");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v34 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
    if (v34)
    {
      v33 = *(_QWORD *)v53;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v53 != v33)
            objc_enumerationMutation(obj);
          v36 = v9;
          v10 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v9);
          objc_msgSend(v10, "value");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          v12 = v38;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v49;
            do
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v49 != v15)
                  objc_enumerationMutation(v12);
                v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97398]), "initWithStringValue:countryCode:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i), 0);
                if (objc_msgSend(v11, "isLikePhoneNumber:", v17))
                {
                  v18 = -[MSPSharedTripContact initWithContact:labeledValue:]([MSPSharedTripContact alloc], "initWithContact:labeledValue:", v5, v10);
                  if (v18)
                    objc_msgSend(v39, "addObject:", v18);

                }
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
            }
            while (v14);
          }

          v9 = v36 + 1;
        }
        while ((id)(v36 + 1) != v34);
        v34 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
      }
      while (v34);
    }

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    objc_msgSend(v5, "emailAddresses");
    v35 = (id)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
    if (v19)
    {
      v20 = v19;
      v37 = *(_QWORD *)v45;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v45 != v37)
            objc_enumerationMutation(v35);
          v22 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
          objc_msgSend(v22, "value");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          v24 = v38;
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
          if (v25)
          {
            v26 = v25;
            v27 = *(_QWORD *)v41;
            do
            {
              for (k = 0; k != v26; ++k)
              {
                if (*(_QWORD *)v41 != v27)
                  objc_enumerationMutation(v24);
                if (objc_msgSend(v23, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * k)))
                {
                  v29 = -[MSPSharedTripContact initWithContact:labeledValue:]([MSPSharedTripContact alloc], "initWithContact:labeledValue:", v5, v22);
                  if (v29)
                    objc_msgSend(v39, "addObject:", v29);

                }
              }
              v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
            }
            while (v26);
          }

        }
        v20 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
      }
      while (v20);
    }

    v30 = (void *)objc_msgSend(v39, "copy");
  }
  else
  {
    v30 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v30;
}

+ (id)contactsFromCNContact:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  MSPSharedTripContact *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  MSPSharedTripContact *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  MSPGetSharedTripLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138477827;
    v32 = v5;
    _os_log_impl(&dword_1B39C0000, v4, OS_LOG_TYPE_INFO, "Will prepare contact values for contact %{private}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v3, "phoneNumbers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v7);
        v12 = -[MSPSharedTripContact initWithContact:labeledValue:]([MSPSharedTripContact alloc], "initWithContact:labeledValue:", v3, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v11));
        if (v12)
          objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v9);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v3, "emailAddresses", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        v18 = -[MSPSharedTripContact initWithContact:labeledValue:]([MSPSharedTripContact alloc], "initWithContact:labeledValue:", v3, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v17));
        if (v18)
          objc_msgSend(v6, "addObject:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v15);
  }

  v19 = (void *)objc_msgSend(v6, "copy");
  return v19;
}

+ (id)contactsFromHandles:(id)a3
{
  id v3;
  char v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_msgSend(MEMORY[0x1E0C97298], "_maps_isAuthorized");
    MSPGetSharedTripLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if ((v4 & 1) != 0)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218243;
        v21 = objc_msgSend(v3, "count");
        v22 = 2113;
        v23 = v3;
        _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_INFO, "Will attempt to fetch contacts for %lu handles (%{private}@)", buf, 0x16u);
      }

      v6 = objc_alloc_init(MEMORY[0x1E0C97298]);
      v7 = objc_alloc(MEMORY[0x1E0C97210]);
      objc_msgSend((id)objc_opt_class(), "_propertiesForFetching");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v7, "initWithKeysToFetch:", v8);

      objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingHandleStrings:", v3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setPredicate:", v10);

      objc_msgSend(v9, "setSortOrder:", 1);
      v11 = objc_alloc_init(MEMORY[0x1E0C99E10]);
      v19 = 0;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __44__MSPSharedTripContact_contactsFromHandles___block_invoke;
      v16[3] = &unk_1E6651FE0;
      v17 = v3;
      v18 = v11;
      v12 = v11;
      -[NSObject enumerateContactsWithFetchRequest:error:usingBlock:](v6, "enumerateContactsWithFetchRequest:error:usingBlock:", v9, &v19, v16);
      v13 = v19;
      objc_msgSend(v12, "array");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_ERROR, "[Contact] Asked to resolve handles to contacts, but Maps is not authorised for Contacts", buf, 2u);
      }
      v14 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v14 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v14;
}

void __44__MSPSharedTripContact_contactsFromHandles___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  +[MSPSharedTripContact contactsFromCNContact:matchingHandles:](MSPSharedTripContact, "contactsFromCNContact:matchingHandles:", a2, *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v3);

}

+ (id)contactsFromIDSHandles:(id)a3
{
  void *v4;
  void *v5;

  MapsMap(a3, &__block_literal_global_3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "contactsFromHandles:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __47__MSPSharedTripContact_contactsFromIDSHandles___block_invoke()
{
  return (id)IDSCopyRawAddressForDestination();
}

+ (BOOL)isHandleBlocked:(id)a3
{
  const void *CMFItemFromString;
  BOOL v4;

  CMFItemFromString = (const void *)CreateCMFItemFromString();
  v4 = CMFBlockListIsItemBlocked() != 0;
  CFRelease(CMFItemFromString);
  return v4;
}

- (BOOL)isHandleBlocked
{
  double v3;
  double v4;
  double lastCheckedBlocked;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  _BOOL4 isBlocked;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v4 = v3;
  lastCheckedBlocked = self->_lastCheckedBlocked;
  if (lastCheckedBlocked > 0.0 && v4 - lastCheckedBlocked < 30.0)
  {
    return self->_isBlocked;
  }
  else
  {
    MSPGetSharedTripLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      -[MSPSharedTripContact stringValue](self, "stringValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      v25 = v8;
      _os_log_impl(&dword_1B39C0000, v7, OS_LOG_TYPE_DEBUG, "[Contact] Checking if %{private}@ is blocked", buf, 0xCu);

    }
    self->_isBlocked = 0;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 2);
    v10 = v9;
    if (self->_originalHandle)
      objc_msgSend(v9, "addObject:");
    -[MSPSharedTripContact stringValue](self, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(v10, "addObject:", v11);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          if (objc_msgSend((id)objc_opt_class(), "isHandleBlocked:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), (_QWORD)v19))
          {
            self->_isBlocked = 1;
            goto LABEL_22;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v14)
          continue;
        break;
      }
    }
LABEL_22:

    self->_lastCheckedBlocked = v4;
    isBlocked = self->_isBlocked;

  }
  return isBlocked;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (CNLabeledValue)labeledValue
{
  return self->_labeledValue;
}

- (void)setLabeledValue:(id)a3
{
  objc_storeStrong((id *)&self->_labeledValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labeledValue, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_originalHandle, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

+ (BOOL)isVirtualReceiver:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (unint64_t)capabilityTypeForVirtualReceiver:(id)a3
{
  id v4;
  void *v5;
  unint64_t CapabilityType;

  v4 = a3;
  if (objc_msgSend(a1, "isVirtualReceiver:", v4))
  {
    objc_msgSend(v4, "handleForIDS");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CapabilityType = MSPSharedTripVirtualReceiverHandleGetCapabilityType(v5);

  }
  else
  {
    CapabilityType = 0;
  }

  return CapabilityType;
}

+ (id)capabilityVersionsForVirtualReceiver:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(a1, "isVirtualReceiver:", v4))
  {
    objc_msgSend(v4, "handleForIDS");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    MSPSharedTripVirtualReceiverHandleGetReceiverCapabilityVersions(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

+ (id)virtualReceiverWithHandle:(id)a3
{
  id v3;
  MSPSharedTripVirtualContact *v4;

  v3 = a3;
  if (MSPSharedTripVirtualReceiverIsValid(v3))
    v4 = -[MSPSharedTripVirtualContact initWithVirtualReceiverHandle:]([MSPSharedTripVirtualContact alloc], "initWithVirtualReceiverHandle:", v3);
  else
    v4 = 0;

  return v4;
}

+ (id)contactsFromVirtualReceiverHandles:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __77__MSPSharedTripContact_VirtualReceivers__contactsFromVirtualReceiverHandles___block_invoke;
  v4[3] = &__block_descriptor_40_e43___MSPSharedTripContact_24__0__NSString_8Q16l;
  v4[4] = a1;
  MapsMap(a3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __77__MSPSharedTripContact_VirtualReceivers__contactsFromVirtualReceiverHandles___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "virtualReceiverWithHandle:", a2);
}

+ (id)mapsVirtualReceiverWithName:(id)a3
{
  return (id)objc_msgSend(a1, "mapsVirtualReceiverWithName:receiverCapabilityVersion:", a3, MEMORY[0x1E0C9AA60]);
}

+ (id)mapsVirtualReceiverWithName:(id)a3 receiverCapabilityVersion:(id)a4
{
  void *v5;
  void *v6;

  MSPSharedTripVirtualReceiverHandleMake(a3, 4, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "virtualReceiverWithHandle:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)iMessageVirtualReceiverWithName:(id)a3
{
  void *v4;
  void *v5;

  MSPSharedTripVirtualReceiverHandleMake(a3, 3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "virtualReceiverWithHandle:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)smsVirtualReceiverWithName:(id)a3
{
  void *v4;
  void *v5;

  MSPSharedTripVirtualReceiverHandleMake(a3, 2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "virtualReceiverWithHandle:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)handleForDeviceVersion:(unint64_t)a3
{
  void *v5;

  if (objc_msgSend((id)objc_opt_class(), "isVirtualReceiver:", self))
  {
    -[MSPSharedTripContact _deviceHandleForVersion:](self, "_deviceHandleForVersion:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)startLiveUpdatesForCapabilityVersion:(unint64_t)a3
{
  void *v3;
  id v4;

  -[MSPSharedTripContact handleForDeviceVersion:](self, "handleForDeviceVersion:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("MSPSharedTripVirtualReceiverStartLiveUpdates"), v4);

  }
}

- (void)stopLiveUpdatesForCapabilityVersion:(unint64_t)a3
{
  void *v3;
  id v4;

  -[MSPSharedTripContact handleForDeviceVersion:](self, "handleForDeviceVersion:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("MSPSharedTripVirtualReceiverStopLiveUpdates"), v4);

  }
}

@end
