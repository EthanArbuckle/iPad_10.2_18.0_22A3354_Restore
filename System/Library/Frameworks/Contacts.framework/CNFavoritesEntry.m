@implementation CNFavoritesEntry

- (NSString)actionType
{
  return self->_actionType;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

void __59__CNFavoritesEntry_initWithDictionaryRepresentation_store___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *MEMORY[0x1E0CF61A0]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v0;
  v8[0] = CFSTR("phoneNumbers");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *MEMORY[0x1E0CF5F98]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v1;
  v8[1] = CFSTR("emailAddresses");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *MEMORY[0x1E0CF6020]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v2;
  v8[2] = CFSTR("instantMessageAddresses");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *MEMORY[0x1E0CF6208]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[3] = v3;
  v8[3] = CFSTR("socialProfiles");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "copy");
  v6 = (void *)initWithDictionaryRepresentation_store__cn_once_object_2;
  initWithDictionaryRepresentation_store__cn_once_object_2 = v5;

}

- (CNContactProperty)contactProperty
{
  CNContact *contact;
  CNContact *p_super;
  void *v5;
  void *v6;
  NSString *propertyKey;
  void *v8;
  CNContact *v9;
  int v10;
  CNContactStore *contactStore;
  CNContactStore *v12;
  uint64_t v13;
  NSString *v14;
  NSString *v15;
  void *v16;
  uint64_t v17;
  NSString *name;
  NSString *labeledValueIdentifier;
  NSString *v20;
  NSString *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  int v27;
  void *v28;
  char v29;
  CNMutableContact *v30;
  void *v31;
  NSString *label;
  NSString *v33;
  uint64_t v34;
  NSString *v35;
  NSString *v36;
  void *v37;
  void *v38;
  void *v39;
  CNContact *v40;
  NSString *v41;
  NSString *v42;
  void *v43;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (self)
    contact = self->_contact;
  else
    contact = 0;
  p_super = contact;
  +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self)
    propertyKey = self->_propertyKey;
  else
    propertyKey = 0;
  objc_msgSend(v5, "objectForKeyedSubscript:", propertyKey);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!p_super
    || (!self ? (v9 = 0) : (v9 = self->_contact),
        v10 = -[CNContact iOSLegacyIdentifier](v9, "iOSLegacyIdentifier"),
        v10 != -[CNFavoritesEntry abUid](self, "abUid")))
  {
    if (self)
      contactStore = self->_contactStore;
    else
      contactStore = 0;
    v12 = contactStore;
    v13 = -[CNFavoritesEntry abUid](self, "abUid");
    if (self)
      v14 = self->_propertyKey;
    else
      v14 = 0;
    v15 = v14;
    +[CNFavoritesEntry descriptorsForRequiredKeysForPropertyKey:](CNFavoritesEntry, "descriptorsForRequiredKeysForPropertyKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    fetchContactMatchingLegacyIdentifier(v12, v13, v16);
    v17 = objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      name = self->_name;
      self->_name = 0;

      p_super = (CNContact *)v17;
LABEL_17:
      labeledValueIdentifier = self->_labeledValueIdentifier;
      goto LABEL_18;
    }
    p_super = 0;
  }
  if (self)
    goto LABEL_17;
  labeledValueIdentifier = 0;
LABEL_18:
  v20 = labeledValueIdentifier;
  if (p_super)
  {
    objc_msgSend(v8, "CNValueForContact:", p_super);
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v21 = (NSString *)(id)objc_claimAutoreleasedReturnValue();
    v22 = -[NSString countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v47;
      v45 = v8;
      while (2)
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v47 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          v27 = objc_msgSend(v26, "iOSLegacyIdentifier");
          if (v27 != -[CNFavoritesEntry abIdentifier](self, "abIdentifier"))
          {
            objc_msgSend(v26, "identifier");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "isEqual:", v20);

            if ((v29 & 1) == 0)
              continue;
          }
          objc_msgSend(v26, "identifier");
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          v37 = v21;
          v8 = v45;
          goto LABEL_35;
        }
        v23 = -[NSString countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
        v8 = v45;
        if (v23)
          continue;
        break;
      }
    }

  }
  v30 = objc_alloc_init(CNMutableContact);
  -[CNFavoritesEntry value](self, "value");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    label = self->_label;
  else
    label = 0;
  v33 = label;
  v34 = -[CNFavoritesEntry abIdentifier](self, "abIdentifier");
  if (self)
    v35 = self->_propertyKey;
  else
    v35 = 0;
  v36 = v35;
  +[CNFavoritesEntry createLabeledValueForFavoritesEntryValue:label:iOSLegacyIdentifier:propertyKey:]((uint64_t)CNFavoritesEntry, v31, v33, v34, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = v37;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCNValue:onContact:", v38, v30);

  objc_msgSend(v37, "identifier");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  p_super = &v30->super;
LABEL_35:

  -[CNFavoritesEntry setContact:]((uint64_t)self, p_super);
  -[CNFavoritesEntry setLabeledValueIdentifier:]((uint64_t)self, v39);
  if (self)
  {
    v40 = self->_contact;
    v41 = self->_propertyKey;
    v42 = self->_labeledValueIdentifier;
  }
  else
  {
    v41 = 0;
    v40 = 0;
    v42 = 0;
  }
  +[CNContactProperty contactPropertyWithContact:propertyKey:identifier:](CNContactProperty, "contactPropertyWithContact:propertyKey:identifier:", v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNContactProperty *)v43;
}

- (int)abIdentifier
{
  return self->_abIdentifier;
}

- (void)setLabeledValueIdentifier:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 112), a2);
}

- (void)setContact:(uint64_t)a1
{
  id v4;
  void *v5;
  id v6;

  v4 = a2;
  if (a1 && *(id *)(a1 + 104) != v4)
  {
    v6 = v4;
    objc_storeStrong((id *)(a1 + 104), a2);
    v5 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = 0;

    v4 = v6;
  }

}

- (int)abUid
{
  return self->_abUid;
}

- (CNFavoritesEntry)initWithDictionaryRepresentation:(id)a3 store:(id)a4
{
  id v6;
  id v7;
  CNFavoritesEntry *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSString *propertyKey;
  void *v14;
  uint64_t v15;
  NSString *label;
  void *v17;
  SEL v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSString *abDatabaseUUID;
  void *v23;
  void *v24;
  NSString *v25;
  void *v26;
  id v27;
  NSString *actionType;
  NSString *v29;
  NSString *bundleIdentifier;
  void *v31;
  id v33;
  id v34;
  objc_super v35;

  v6 = a3;
  v7 = a4;
  v35.receiver = self;
  v35.super_class = (Class)CNFavoritesEntry;
  v8 = -[CNFavoritesEntry init](&v35, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("Property"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (initWithDictionaryRepresentation_store__cn_once_token_2 != -1)
        dispatch_once(&initWithDictionaryRepresentation_store__cn_once_token_2, &__block_literal_global_72_3);
      v10 = (id)initWithDictionaryRepresentation_store__cn_once_object_2;
      objc_msgSend(v6, "objectForKey:", CFSTR("Property"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v11);
      v12 = objc_claimAutoreleasedReturnValue();

      propertyKey = v8->_propertyKey;
      v8->_propertyKey = (NSString *)v12;

    }
    if (!v8->_propertyKey)
    {
      NSLog(CFSTR("[CNFavoritesEntry initWithDictionaryRepresentation:store:], Invalid property ID:%d"), objc_msgSend(v9, "intValue"));
      objc_storeStrong((id *)&v8->_propertyKey, CFSTR("emailAddresses"));
    }
    objc_msgSend(v6, "objectForKey:", CFSTR("Value"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFavoritesEntry setValue:](v8, "setValue:", v14);

    objc_msgSend(v6, "objectForKey:", CFSTR("Label"));
    v15 = objc_claimAutoreleasedReturnValue();
    label = v8->_label;
    v8->_label = (NSString *)v15;

    objc_msgSend(v6, "objectForKey:", CFSTR("Name"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_nonatomic_copy(v8, v18, v17, 96);

    objc_msgSend(v6, "objectForKey:", CFSTR("ABUid"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFavoritesEntry setAbUid:](v8, "setAbUid:", objc_msgSend(v19, "intValue"));

    objc_msgSend(v6, "objectForKey:", CFSTR("ABIdentifier"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFavoritesEntry setAbIdentifier:](v8, "setAbIdentifier:", objc_msgSend(v20, "intValue"));

    objc_msgSend(v6, "objectForKey:", CFSTR("ABDatabaseUUID"));
    v21 = objc_claimAutoreleasedReturnValue();
    abDatabaseUUID = v8->_abDatabaseUUID;
    v8->_abDatabaseUUID = (NSString *)v21;

    objc_storeStrong((id *)&v8->_contactStore, a4);
    objc_msgSend(v6, "objectForKey:", CFSTR("EntryType"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
      v8->_type = (int)objc_msgSend(v23, "intValue");
    objc_msgSend(v6, "objectForKey:", CFSTR("ActionType"));
    v25 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("BundleIdentifier"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v25)
    {
      v33 = v26;
      v34 = 0;
      -[CNFavoritesEntry _convertFromEntryType:toActionType:bundleIdentifier:](v8, -[CNFavoritesEntry type](v8, "type"), &v34, &v33);
      v25 = (NSString *)v34;
      v27 = v33;

      v26 = v27;
    }
    actionType = v8->_actionType;
    v8->_actionType = v25;
    v29 = v25;

    bundleIdentifier = v8->_bundleIdentifier;
    v8->_bundleIdentifier = (NSString *)v26;

    objc_msgSend(v6, "objectForKey:", CFSTR("ActionChannel"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFavoritesEntry setActionChannel:](v8, "setActionChannel:", v31);

  }
  return v8;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (void)setActionChannel:(id)a3
{
  objc_storeStrong((id *)&self->_actionChannel, a3);
}

- (void)setAbUid:(int)a3
{
  self->_abUid = a3;
}

- (void)setAbIdentifier:(int)a3
{
  self->_abIdentifier = a3;
}

- (id)_convertFromEntryType:(_QWORD *)a3 toActionType:(_QWORD *)a4 bundleIdentifier:
{
  id *v5;

  if (result)
  {
    if (a2 <= 2)
    {
      v5 = (id *)off_1E29FD848[a2];
      *a3 = objc_retainAutorelease(*off_1E29FD830[a2]);
      result = objc_retainAutorelease(*v5);
      *a4 = result;
    }
  }
  return result;
}

uint64_t __36__CNFavoritesEntry_contactFormatter__block_invoke()
{
  CNContactFormatter *v0;
  void *v1;

  v0 = objc_alloc_init(CNContactFormatter);
  v1 = (void *)contactFormatter___contactFormatter;
  contactFormatter___contactFormatter = (uint64_t)v0;

  objc_msgSend((id)contactFormatter___contactFormatter, "setStyle:", 0);
  return objc_msgSend((id)contactFormatter___contactFormatter, "setFallbackStyle:", -1);
}

+ (id)descriptorsForRequiredKeysForPropertyKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "addObject:", v3);
  +[CNFavoritesEntry contactFormatter]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "descriptorForRequiredKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v7);

  objc_msgSend(v5, "addObject:", CFSTR("iOSLegacyIdentifier"));
  +[CNGeminiManager descriptorForRequiredKeys](CNGeminiManager, "descriptorForRequiredKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v8);

  v9 = (void *)objc_msgSend(v5, "copy");
  return v9;
}

+ (id)contactFormatter
{
  objc_opt_self();
  if (contactFormatter_onceToken != -1)
    dispatch_once(&contactFormatter_onceToken, &__block_literal_global_118);
  return (id)contactFormatter___contactFormatter;
}

- (NSString)name
{
  NSString *name;
  void *v4;
  void *v5;
  void *v6;
  CNContact *v7;
  NSString *v8;
  NSString *v9;
  SEL v10;

  name = self->_name;
  if (!name)
  {
    if (!self->_contact)
    {
      -[CNFavoritesEntry contactProperty](self, "contactProperty");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "contact");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNFavoritesEntry setContact:]((uint64_t)self, v5);

    }
    +[CNFavoritesEntry contactFormatter]();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = self->_contact;
    objc_msgSend(v6, "stringFromContact:", v7);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v9 = self->_name;
    self->_name = v8;

    objc_setProperty_nonatomic_copy(self, v10, self->_name, 96);
    name = self->_name;
  }
  return name;
}

+ (void)initialize
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CNFavoritesEntry;
  objc_msgSendSuper2(&v2, sel_initialize);
  ABInitialize();
}

- (NSString)value
{
  return self->_value;
}

- (BOOL)isEqual:(id)a3
{
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id *v9;
  int64_t v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  NSString *v15;
  id v16;
  id v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSString *v24;
  NSString *v25;
  NSString *v26;
  int v27;
  id v28;
  id v29;
  int v30;
  BOOL v31;
  int v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  id v40;
  NSString *v41;
  int v42;
  NSString *v43;
  int v44;
  void *v45;
  NSString *v46;

  v9 = (id *)a3;
  v10 = -[CNFavoritesEntry type](self, "type");
  if (v10 != objc_msgSend(v9, "type"))
    goto LABEL_63;
  -[CNFavoritesEntry actionType](self, "actionType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 || (objc_msgSend(v9, "actionType"), (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CNFavoritesEntry actionType](self, "actionType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "actionType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
    {

      if (v11)
      else

      goto LABEL_63;
    }
    v12 = 1;
  }
  else
  {
    v12 = 0;
  }
  -[CNFavoritesEntry bundleIdentifier](self, "bundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(v9, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v44 = 0;
      if (!self)
        goto LABEL_20;
LABEL_17:
      v15 = self->_propertyKey;
      if (v15)
      {
        v43 = v15;
        v3 = self->_propertyKey;
        v42 = 0;
        if (!v9)
        {
          v17 = 0;
          goto LABEL_26;
        }
LABEL_25:
        v17 = v9[10];
LABEL_26:
        v40 = v17;
        if (!-[NSString isEqual:](v3, "isEqual:"))
        {
          v41 = v3;
          v14 = 0;
          goto LABEL_39;
        }
        v39 = v6;
        v38 = 1;
LABEL_30:
        v41 = v3;
        -[CNFavoritesEntry value](self, "value");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18 || (objc_msgSend(v9, "value"), (v34 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v36 = v5;
          v37 = v4;
          v19 = v12;
          v20 = v7;
          -[CNFavoritesEntry value](self, "value");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "value");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v21, "isEqual:", v22);

          if (v18)
          {

            v7 = v20;
            v12 = v19;
            if (v38)
            {
              v5 = v36;
              v4 = v37;
              v6 = v39;
              goto LABEL_39;
            }
            v5 = v36;
            v4 = v37;
            v6 = v39;
            goto LABEL_69;
          }
          v7 = v20;
          v12 = v19;
          v5 = v36;
          v4 = v37;
          v23 = (void *)v34;
        }
        else
        {
          v23 = 0;
          v14 = 1;
        }

        v6 = v39;
        if ((v38 & 1) != 0)
        {
LABEL_39:

          if ((v42 & 1) == 0)
            goto LABEL_41;
          goto LABEL_40;
        }
LABEL_69:
        if (!v42)
        {
LABEL_41:

          if (!v44)
            goto LABEL_43;
          goto LABEL_42;
        }
LABEL_40:

        goto LABEL_41;
      }
LABEL_20:
      if (!v9 || (v16 = v9[10]) == 0)
      {
        v39 = v6;
        v43 = 0;
        v35 = 0;
        v38 = 0;
        v42 = 1;
        goto LABEL_30;
      }
      v35 = v16;
      if (self)
        v3 = self->_propertyKey;
      else
        v3 = 0;
      v43 = 0;
      v42 = 1;
      goto LABEL_25;
    }
  }
  -[CNFavoritesEntry bundleIdentifier](self, "bundleIdentifier");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleIdentifier");
  v46 = v3;
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSString isEqual:](v3, "isEqual:"))
  {
    v44 = 1;
    if (!self)
      goto LABEL_20;
    goto LABEL_17;
  }
  v14 = 0;
LABEL_42:

LABEL_43:
  if (!v13)

  if (v12)
  {

  }
  if (v11)
  {

    if (!(_DWORD)v14)
      goto LABEL_63;
  }
  else
  {

    if ((v14 & 1) == 0)
    {
LABEL_63:
      v31 = 0;
      goto LABEL_64;
    }
  }
  if (!self || (v24 = self->_label) == 0)
  {
    if (!v9)
      goto LABEL_66;
    v28 = v9[9];
    if (!v28)
      goto LABEL_66;
    v14 = (uint64_t)v28;
    if (self)
      v26 = self->_label;
    else
      v26 = 0;
    v25 = 0;
    v27 = 1;
    goto LABEL_60;
  }
  v25 = v24;
  v26 = self->_label;
  v27 = 0;
  if (v9)
  {
LABEL_60:
    v29 = v9[9];
    goto LABEL_61;
  }
  v29 = 0;
LABEL_61:
  v30 = -[NSString isEqual:](v26, "isEqual:", v29);

  if (v27)
  {

    if ((v30 & 1) == 0)
      goto LABEL_63;
  }
  else
  {

    if (!v30)
      goto LABEL_63;
  }
LABEL_66:
  if (self && self->_label)
  {
    v33 = -[CNFavoritesEntry abUid](self, "abUid");
    v31 = v33 == objc_msgSend(v9, "abUid");
  }
  else
  {
    v31 = 1;
  }
LABEL_64:

  return v31;
}

+ (id)valueStringFromSocialProfile:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = a2;
  objc_opt_self();
  v3 = (void *)MEMORY[0x1E0CB38B0];
  objc_msgSend(v2, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "dataWithPropertyList:format:options:error:", v4, 100, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)favoritesEntryValueForLabeledValueValue:(void *)a3 propertyKey:
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v4 = a2;
  v5 = a3;
  objc_opt_self();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("phoneNumbers")))
  {
    objc_msgSend(v4, "stringValue");
    v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7 = v6;
    goto LABEL_16;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("emailAddresses")))
  {
    v6 = v4;
    goto LABEL_5;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("socialProfiles")))
  {
    objc_opt_class();
    v8 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("instantMessageAddresses")))
    {
      NSLog(&CFSTR("Attempting to create CNFavoritesEntry that is not a phone number, e-mail address, social profile or instant"
                   " message address").isa);
      v7 = 0;
      goto LABEL_16;
    }
    objc_opt_class();
    v8 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  v10 = v9;

  +[CNFavoritesEntry valueStringFromSocialProfile:]((uint64_t)CNFavoritesEntry, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
  return v7;
}

+ (id)socialProfileForFavoritesEntryValue:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_opt_self();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v2, 0);

  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v3, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNSocialProfile socialProfileWithDictionaryRepresentation:](CNSocialProfile, "socialProfileWithDictionaryRepresentation:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)instantMessageAddressForFavoritesEntryValue:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_opt_self();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v2, 0);

  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v3, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNInstantMessageAddress instantMessageAddressWithDictionaryRepresentation:](CNInstantMessageAddress, "instantMessageAddressWithDictionaryRepresentation:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)labeledValueValueForFavoritesEntryValue:(void *)a3 propertyKey:
{
  id v4;
  id v5;
  id v6;
  void *v7;

  v4 = a2;
  v5 = a3;
  objc_opt_self();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("phoneNumbers")))
  {
    +[CNPhoneNumber phoneNumberWithStringValue:](CNPhoneNumber, "phoneNumberWithStringValue:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("emailAddresses")))
  {
    v6 = v4;
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("socialProfiles")))
  {
    +[CNFavoritesEntry socialProfileForFavoritesEntryValue:]((uint64_t)CNFavoritesEntry, v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("instantMessageAddresses")))
    {
      NSLog(&CFSTR("Attempting to create a labeled value for a CNFavoritesEntry that is not a phone number, e-mail address, soc"
                   "ial profile or instant message address").isa);
      v7 = 0;
      goto LABEL_10;
    }
    +[CNFavoritesEntry instantMessageAddressForFavoritesEntryValue:]((uint64_t)CNFavoritesEntry, v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
LABEL_10:

  return v7;
}

+ (CNLabeledValue)createLabeledValueForFavoritesEntryValue:(void *)a3 label:(uint64_t)a4 iOSLegacyIdentifier:(void *)a5 propertyKey:
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  CNLabeledValue *v13;

  v8 = a5;
  v9 = a3;
  v10 = a2;
  v11 = objc_opt_self();
  +[CNFavoritesEntry labeledValueValueForFavoritesEntryValue:propertyKey:](v11, v10, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[CNLabeledValue initWithLabel:value:]([CNLabeledValue alloc], "initWithLabel:value:", v9, v12);
  -[CNLabeledValue setIOSLegacyIdentifier:](v13, "setIOSLegacyIdentifier:", a4);

  return v13;
}

- (CNFavoritesEntry)initWithContact:(id)a3 propertyKey:(id)a4 identifier:(id)a5 type:(int64_t)a6
{
  return (CNFavoritesEntry *)-[CNFavoritesEntry _initWithContact:propertyKey:labeledValueIdentifier:entryType:actionType:bundleIdentifier:store:]((id *)&self->super.isa, a3, a4, a5, a6, 0, 0, 0);
}

- (id)_initWithContact:(void *)a3 propertyKey:(void *)a4 labeledValueIdentifier:(unint64_t)a5 entryType:(void *)a6 actionType:(void *)a7 bundleIdentifier:(void *)a8 store:
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  char v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v32;
  id v33;
  objc_super v34;
  _QWORD v35[5];

  v35[4] = *MEMORY[0x1E0C80C00];
  v15 = a2;
  v16 = a3;
  v17 = a4;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  if (a1)
  {
    v34.receiver = a1;
    v34.super_class = (Class)CNFavoritesEntry;
    a1 = (id *)objc_msgSendSuper2(&v34, sel_init);
    if (a1)
    {
      v35[0] = CFSTR("phoneNumbers");
      v35[1] = CFSTR("emailAddresses");
      v35[2] = CFSTR("socialProfiles");
      v35[3] = CFSTR("instantMessageAddresses");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "containsObject:", v16);

      if ((v22 & 1) != 0)
      {
        if (v18)
        {
          if ((_DWORD)a5 == -1)
            a5 = (int)-[CNFavoritesEntry _entryTypeForActionType:bundleIdentifier:]((uint64_t)a1, v18, v19);
        }
        else
        {
          v32 = v19;
          v33 = 0;
          -[CNFavoritesEntry _convertFromEntryType:toActionType:bundleIdentifier:](a1, a5, &v33, &v32);
          v18 = v33;
          v24 = v32;

          v19 = v24;
        }
        a1[7] = (id)a5;
        -[CNFavoritesEntry setActionType:]((uint64_t)a1, v18);
        -[CNFavoritesEntry setBundleIdentifier:]((uint64_t)a1, v19);
        -[CNFavoritesEntry setPropertyKey:]((uint64_t)a1, v16);
        +[CN sourceContactForValue:labeledValueIdentifier:propertyKey:inUnifiedContact:](CN, "sourceContactForValue:labeledValueIdentifier:propertyKey:inUnifiedContact:", 0, v17, v16, v15);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNFavoritesEntry setContact:]((uint64_t)a1, v25);

        -[CNFavoritesEntry setLabeledValueIdentifier:]((uint64_t)a1, v17);
        objc_msgSend(a1, "setAbUid:", objc_msgSend(a1[13], "iOSLegacyIdentifier"));
        objc_msgSend(a1, "setOldAbUid:", 0xFFFFFFFFLL);
        -[CNFavoritesEntry setContactStore:]((uint64_t)a1, v20);
        objc_msgSend(a1[13], "valueForKey:", v16);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[CNLabeledValue labeledValueWithIdentifier:inArray:](CNLabeledValue, "labeledValueWithIdentifier:inArray:", v17, v26);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          objc_msgSend(a1, "setAbIdentifier:", objc_msgSend(v23, "iOSLegacyIdentifier"));
          objc_msgSend(v23, "label");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNFavoritesEntry setLabel:]((uint64_t)a1, v27);

          objc_msgSend(v23, "value");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          +[CNFavoritesEntry favoritesEntryValueForLabeledValueValue:propertyKey:]((uint64_t)CNFavoritesEntry, v28, v16);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "setValue:", v29);

          objc_msgSend(a1[8], "identifierWithError:", 0);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNChangesNotifierProxy setCoalescingTimer:]((uint64_t)a1, v30);
        }
        else
        {
          v30 = a1;
          a1 = 0;
        }

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CNFavoritesEntryInvalidPropertyException"), CFSTR("The property %@ is not supported for favorites"), v16);
        v23 = a1;
        a1 = 0;
      }

    }
  }

  return a1;
}

- (CNFavoritesEntry)initWithContact:(id)a3 propertyKey:(id)a4 identifier:(id)a5 type:(int64_t)a6 store:(id)a7
{
  return (CNFavoritesEntry *)-[CNFavoritesEntry _initWithContact:propertyKey:labeledValueIdentifier:entryType:actionType:bundleIdentifier:store:]((id *)&self->super.isa, a3, a4, a5, a6, 0, 0, a7);
}

- (CNFavoritesEntry)initWithContact:(id)a3 propertyKey:(id)a4 labeledValueIdentifier:(id)a5 actionType:(id)a6 bundleIdentifier:(id)a7 store:(id)a8
{
  return (CNFavoritesEntry *)-[CNFavoritesEntry _initWithContact:propertyKey:labeledValueIdentifier:entryType:actionType:bundleIdentifier:store:]((id *)&self->super.isa, a3, a4, a5, 0xFFFFFFFFFFFFFFFFLL, a6, a7, a8);
}

- (uint64_t)_entryTypeForActionType:(void *)a3 bundleIdentifier:
{
  id v5;
  id v6;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("AudioCallActionType"))
      && (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.mobilephone")) & 1) != 0)
    {
      a1 = 0;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("VideoCallActionType"))
           && (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.facetime")) & 1) != 0)
    {
      a1 = 1;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("AudioCallActionType")))
    {
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.facetime")))
        a1 = 2;
      else
        a1 = 0xFFFFFFFFLL;
    }
    else
    {
      a1 = 0xFFFFFFFFLL;
    }
  }

  return a1;
}

- (void)setActionType:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 40), a2);
}

- (void)setBundleIdentifier:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 48), a2);
}

- (void)setPropertyKey:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 80), a2);
}

- (void)setContactStore:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 64), a2);
}

- (void)setLabel:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 72), a2);
}

- (void)dealloc
{
  objc_super v3;

  -[CNFavoritesEntry setContact:]((uint64_t)self, 0);
  v3.receiver = self;
  v3.super_class = (Class)CNFavoritesEntry;
  -[CNFavoritesEntry dealloc](&v3, sel_dealloc);
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *propertyKey;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v23;

  v23 = 0;
  +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self)
    propertyKey = self->_propertyKey;
  else
    propertyKey = 0;
  objc_msgSend(v3, "objectForKeyedSubscript:", propertyKey);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "abPropertyID:", &v23);

  if ((v7 & 1) == 0)
    NSLog(CFSTR("[CNFavoritesEntry dictionaryRepresentation, Invalid Contact property to ABPropertyID conversion."));
  v8 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[CNFavoritesEntry abUid](self, "abUid"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[CNFavoritesEntry abIdentifier](self, "abIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v23);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[CNFavoritesEntry type](self, "type"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFavoritesEntry actionType](self, "actionType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFavoritesEntry bundleIdentifier](self, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryWithObjectsAndKeys:", v9, CFSTR("ABUid"), v10, CFSTR("ABIdentifier"), v11, CFSTR("Property"), v12, CFSTR("EntryType"), v13, CFSTR("ActionType"), v14, CFSTR("BundleIdentifier"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNFavoritesEntry value](self, "value");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[CNFavoritesEntry value](self, "value");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v17, CFSTR("Value"));

  }
  if (self && self->_label)
    objc_msgSend(v15, "setObject:forKey:", self->_label, CFSTR("Label"));
  -[CNFavoritesEntry name](self, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[CNFavoritesEntry name](self, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v19, CFSTR("Name"));

  }
  if (self && self->_abDatabaseUUID)
    objc_msgSend(v15, "setObject:forKey:", self->_abDatabaseUUID, CFSTR("ABDatabaseUUID"));
  -[CNFavoritesEntry actionChannel](self, "actionChannel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[CNFavoritesEntry actionChannel](self, "actionChannel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v21, CFSTR("ActionChannel"));

  }
  return v15;
}

- (void)dictionaryRepresentation:(id *)a3 isDirty:(BOOL *)a4
{
  -[CNFavoritesEntry dictionaryRepresentation](self, "dictionaryRepresentation");
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  *a4 = -[CNFavoritesEntry dirty](self, "dirty");
  -[CNFavoritesEntry setDirty:](self, "setDirty:", 0);
}

+ (BOOL)favoritesEntryValueForLabeledValueValue:(void *)a3 propertyKey:(void *)a4 isEqualToValue:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _BOOL8 v10;

  v6 = a3;
  v7 = a4;
  v8 = a2;
  objc_opt_self();
  +[CNFavoritesEntry favoritesEntryValueForLabeledValueValue:propertyKey:]((uint64_t)CNFavoritesEntry, v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "isEqualToString:", v7) & 1) != 0)
  {
    v10 = 1;
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("phoneNumbers")))
  {
    v10 = CNFavoritesPhoneNumbersEqual(v9, v7) != 0;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)rematch
{
  CNContactStore *contactStore;
  CNContactStore *v4;
  NSString *abDatabaseUUID;
  NSString *v6;
  void *v7;
  int v8;
  char v9;
  CNContactStore *v10;
  CNContactStore *v11;
  BOOL v12;
  CNContactStore *v13;
  CNContactStore *v14;
  NSString *propertyKey;
  NSString *v16;
  void *v17;
  CNContactStore *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSString *v25;
  NSString *v26;
  _BOOL4 v27;
  id v28;
  int v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  CNContactStore *v34;
  CNContactStore *v35;
  BOOL v36;
  CNContactStore *v37;
  CNFavoritesEntry *v38;
  id *p_isa;
  void *v40;
  BOOL v41;
  CNContactFetchRequest *v42;
  id v43;
  void *v44;
  CNContactFetchRequest *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  int v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  NSString *v59;
  NSString *v60;
  void *v61;
  _BOOL4 v62;
  int v63;
  uint64_t v64;
  id v65;
  int v66;
  void *v67;
  id v68;
  int v69;
  void *v70;
  void *v71;
  BOOL v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  uint64_t *v78;
  id v79;
  int v80;
  void *v81;
  id v82;
  CNFavoritesLookupChangeRecord *v83;
  NSString *v84;
  NSString *v85;
  _BOOL4 v86;
  void *v87;
  void *v88;
  NSString *v89;
  NSString *v90;
  _BOOL4 v91;
  NSString *v92;
  NSString *v93;
  _BOOL4 v94;
  id v95;
  void *v96;
  id v97;
  NSString *v98;
  NSString *v99;
  _BOOL4 v100;
  NSString *v101;
  char v102;
  void *v103;
  uint64_t v104;
  int v105;
  NSString *v106;
  void *v107;
  NSString *label;
  NSString *v109;
  char v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  _BOOL8 v114;
  CNFavoritesLookupChangeRecord *v115;
  void *v116;
  void *v117;
  void *v118;
  int v120;
  int v121;
  _BOOL4 v122;
  void *v123;
  void *v124;
  void *v125;
  int v126;
  CNContactStore *obj;
  id obja;
  void *v129;
  void *v130;
  void *v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  _QWORD v140[4];
  id *v141;
  uint64_t *v142;
  uint64_t *v143;
  uint64_t *v144;
  uint64_t *v145;
  uint64_t v146;
  uint64_t *v147;
  uint64_t v148;
  uint64_t (*v149)(uint64_t, uint64_t);
  void (*v150)(uint64_t);
  id v151;
  uint64_t v152;
  uint64_t *v153;
  uint64_t v154;
  uint64_t (*v155)(uint64_t, uint64_t);
  void (*v156)(uint64_t);
  id v157;
  uint64_t v158;
  uint64_t *v159;
  uint64_t v160;
  uint64_t (*v161)(uint64_t, uint64_t);
  void (*v162)(uint64_t);
  id v163;
  uint64_t v164;
  uint64_t *v165;
  uint64_t v166;
  uint64_t (*v167)(uint64_t, uint64_t);
  void (*v168)(uint64_t);
  id v169;
  _BYTE v170[128];
  _BYTE v171[128];
  _QWORD v172[7];

  v172[5] = *MEMORY[0x1E0C80C00];
  if (self)
    contactStore = self->_contactStore;
  else
    contactStore = 0;
  v4 = contactStore;
  -[CNContactStore identifierWithError:](v4, "identifierWithError:", 0);
  v131 = (void *)objc_claimAutoreleasedReturnValue();

  if (v131)
  {
    if (self)
      abDatabaseUUID = self->_abDatabaseUUID;
    else
      abDatabaseUUID = 0;
    v6 = abDatabaseUUID;
    v126 = !-[NSString isEqualToString:](v6, "isEqualToString:", v131);

  }
  else
  {
    v126 = 0;
  }
  v172[0] = CFSTR("phoneNumbers");
  v172[1] = CFSTR("emailAddresses");
  v172[2] = CFSTR("socialProfiles");
  v172[3] = CFSTR("instantMessageAddresses");
  +[CNContactFormatter descriptorForRequiredKeysForStyle:](CNContactFormatter, "descriptorForRequiredKeysForStyle:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v172[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v172, 5);
  v125 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[CNFavoritesEntry abUid](self, "abUid");
  v9 = v126;
  if (v8 < 0)
    v9 = 1;
  if ((v9 & 1) != 0)
    goto LABEL_34;
  v10 = self ? self->_contactStore : 0;
  v11 = v10;
  v12 = v11 == 0;

  if (v12
    || (!self ? (v13 = 0) : (v13 = self->_contactStore),
        v14 = v13,
        fetchContactMatchingLegacyIdentifier(v14, -[CNFavoritesEntry abUid](self, "abUid"), v125),
        v129 = (void *)objc_claimAutoreleasedReturnValue(),
        v14,
        !v129))
  {
LABEL_34:
    v32 = 0;
    goto LABEL_35;
  }
  if (self)
    propertyKey = self->_propertyKey;
  else
    propertyKey = 0;
  v16 = propertyKey;
  objc_msgSend(v129, "valueForKey:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v138 = 0u;
  v139 = 0u;
  v136 = 0u;
  v137 = 0u;
  v18 = v17;
  v19 = -[CNContactStore countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v136, v171, 16);
  if (v19)
  {
    v20 = 0;
    v21 = *(_QWORD *)v137;
LABEL_21:
    v22 = 0;
    while (1)
    {
      if (*(_QWORD *)v137 != v21)
        objc_enumerationMutation(v18);
      v23 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * v22);
      objc_msgSend(v23, "label");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = self ? self->_label : 0;
      v26 = v25;
      v27 = objc_msgSend(v24, "localizedCaseInsensitiveCompare:", v26) == 0;

      if (v27)
      {
        v28 = v23;

        v29 = objc_msgSend(v28, "iOSLegacyIdentifier");
        v20 = v28;
        if (v29 == -[CNFavoritesEntry abIdentifier](self, "abIdentifier"))
          break;
      }
      if (v19 == ++v22)
      {
        v30 = -[CNContactStore countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v136, v171, 16);
        v19 = v30;
        v28 = v20;
        if (v30)
          goto LABEL_21;
        break;
      }
    }

    if (v28)
    {
      v31 = v129;
LABEL_83:

      v32 = v31;
      goto LABEL_84;
    }
  }
  else
  {

  }
  v134 = 0u;
  v135 = 0u;
  v132 = 0u;
  v133 = 0u;
  obj = v18;
  v53 = -[CNContactStore countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v132, v170, 16);
  if (!v53)
  {

    v32 = v129;
    goto LABEL_35;
  }
  v54 = 0;
  v55 = *(_QWORD *)v133;
LABEL_51:
  v56 = 0;
  while (1)
  {
    if (*(_QWORD *)v133 != v55)
      objc_enumerationMutation(obj);
    v57 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * v56);
    objc_msgSend(v57, "value");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = self ? self->_propertyKey : 0;
    v60 = v59;
    -[CNFavoritesEntry value](self, "value");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = +[CNFavoritesEntry favoritesEntryValueForLabeledValueValue:propertyKey:isEqualToValue:]((uint64_t)CNFavoritesEntry, v58, v60, v61);

    if (v62)
    {
      v28 = v57;

      v63 = objc_msgSend(v28, "iOSLegacyIdentifier");
      v54 = v28;
      if (v63 == -[CNFavoritesEntry abIdentifier](self, "abIdentifier"))
        break;
    }
    if (v53 == ++v56)
    {
      v64 = -[CNContactStore countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v132, v170, 16);
      v53 = v64;
      v28 = v54;
      if (v64)
        goto LABEL_51;
      break;
    }
  }

  v32 = v129;
  if (!v28)
  {
LABEL_35:
    v33 = v32;
    if (self)
      v34 = self->_contactStore;
    else
      v34 = 0;
    v35 = v34;
    v36 = v35 == 0;

    if (v36)
    {
      v28 = 0;
      v32 = v33;
      goto LABEL_84;
    }
    if (self)
      v37 = self->_contactStore;
    else
      v37 = 0;
    v18 = v37;
    v38 = self;
    p_isa = (id *)&v38->super.isa;
    v164 = 0;
    v165 = &v164;
    v166 = 0x3032000000;
    v167 = __Block_byref_object_copy__29;
    v168 = __Block_byref_object_dispose__29;
    v169 = 0;
    v158 = 0;
    v159 = &v158;
    v160 = 0x3032000000;
    v161 = __Block_byref_object_copy__29;
    v162 = __Block_byref_object_dispose__29;
    v163 = 0;
    v152 = 0;
    v153 = &v152;
    v154 = 0x3032000000;
    v155 = __Block_byref_object_copy__29;
    v156 = __Block_byref_object_dispose__29;
    v157 = 0;
    v146 = 0;
    v147 = &v146;
    v148 = 0x3032000000;
    v149 = __Block_byref_object_copy__29;
    v150 = __Block_byref_object_dispose__29;
    v151 = 0;
    if (!self
      || (-[CNFavoritesEntry value](v38, "value"),
          v40 = (void *)objc_claimAutoreleasedReturnValue(),
          v41 = v40 == 0,
          v40,
          v41))
    {
      v50 = 0;
      v31 = 0;
LABEL_82:
      _Block_object_dispose(&v146, 8);

      _Block_object_dispose(&v152, 8);
      _Block_object_dispose(&v158, 8);

      _Block_object_dispose(&v164, 8);
      v28 = v50;

      goto LABEL_83;
    }
    v42 = [CNContactFetchRequest alloc];
    v43 = p_isa[10];
    +[CNFavoritesEntry descriptorsForRequiredKeysForPropertyKey:](CNFavoritesEntry, "descriptorsForRequiredKeysForPropertyKey:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = -[CNContactFetchRequest initWithKeysToFetch:](v42, "initWithKeysToFetch:", v44);

    -[CNContactFetchRequest setUnifyResults:](v45, "setUnifyResults:", 0);
    v46 = p_isa[10];
    LODWORD(v44) = objc_msgSend(v46, "isEqualToString:", CFSTR("phoneNumbers"));

    if ((_DWORD)v44)
    {
      objc_msgSend(p_isa, "value");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNPhoneNumber phoneNumberWithStringValue:](CNPhoneNumber, "phoneNumberWithStringValue:", v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNContact predicateForContactsMatchingPhoneNumber:](CNContact, "predicateForContactsMatchingPhoneNumber:", v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactFetchRequest setPredicate:](v45, "setPredicate:", v49);

    }
    else
    {
      v51 = p_isa[10];
      v52 = objc_msgSend(v51, "isEqualToString:", CFSTR("emailAddresses"));

      if (v52)
      {
        objc_msgSend(p_isa, "value");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        +[CNContact predicateForContactsMatchingEmailAddress:](CNContact, "predicateForContactsMatchingEmailAddress:", v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactFetchRequest setPredicate:](v45, "setPredicate:", v48);
      }
      else
      {
        v65 = p_isa[10];
        v66 = objc_msgSend(v65, "isEqualToString:", CFSTR("socialProfiles"));

        if (v66)
        {
          objc_msgSend(p_isa, "value");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          +[CNFavoritesEntry socialProfileForFavoritesEntryValue:]((uint64_t)CNFavoritesEntry, v67);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          +[CNContact predicateForContactsMatchingSocialProfile:](CNContact, "predicateForContactsMatchingSocialProfile:", v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNContactFetchRequest setPredicate:](v45, "setPredicate:", v48);
        }
        else
        {
          v68 = p_isa[10];
          v69 = objc_msgSend(v68, "isEqualToString:", CFSTR("instantMessageAddresses"));

          if (!v69)
            goto LABEL_70;
          objc_msgSend(p_isa, "value");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          +[CNFavoritesEntry instantMessageAddressForFavoritesEntryValue:]((uint64_t)CNFavoritesEntry, v70);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          +[CNContact predicateForContactsMatchingInstantMessageAddress:](CNContact, "predicateForContactsMatchingInstantMessageAddress:", v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNContactFetchRequest setPredicate:](v45, "setPredicate:", v48);
        }
      }
    }

LABEL_70:
    -[CNContactFetchRequest predicate](v45, "predicate");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v71 == 0;

    if (v72)
    {
      v50 = 0;
      v31 = 0;
LABEL_81:

      goto LABEL_82;
    }
    v140[0] = MEMORY[0x1E0C809B0];
    v140[1] = 3221225472;
    v140[2] = ___findBestCandidateForFavorite_block_invoke;
    v140[3] = &unk_1E29F7AC0;
    v142 = &v152;
    v141 = p_isa;
    v143 = &v146;
    v144 = &v164;
    v145 = &v158;
    -[CNContactStore enumerateNonUnifiedContactsWithFetchRequest:error:usingBlock:](v18, "enumerateNonUnifiedContactsWithFetchRequest:error:usingBlock:", v45, 0, v140);
    v73 = (void *)v147[5];
    v74 = (void *)v165[5];
    if (v73)
    {
      if (v73 == v74)
        v75 = (void *)v159[5];
      else
        v75 = 0;
      v77 = v75;
      v78 = v147;
    }
    else
    {
      if (v74)
      {
        v31 = v74;
        v76 = (void *)v159[5];
        v77 = v76;
LABEL_80:
        v79 = v76;
        v50 = objc_retainAutorelease(v77);

        goto LABEL_81;
      }
      v77 = 0;
      v78 = v153;
    }
    v76 = (void *)v78[5];
    v31 = v76;
    goto LABEL_80;
  }
LABEL_84:
  if (!v32)
  {
    v81 = 0;
    obja = 0;
    v82 = 0;
    v83 = 0;
    goto LABEL_143;
  }
  v130 = v32;
  v121 = objc_msgSend(v32, "iOSLegacyIdentifier");
  v120 = -[CNFavoritesEntry abUid](self, "abUid");
  if (v28)
  {
    v80 = objc_msgSend(v28, "iOSLegacyIdentifier");
    v122 = v80 != -[CNFavoritesEntry abIdentifier](self, "abIdentifier");
  }
  else
  {
    v122 = 0;
  }
  -[CNFavoritesEntry name](self, "name");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactFormatter stringFromContact:style:](CNContactFormatter, "stringFromContact:style:", v130, 0);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v124, "isEqualToString:", v123) & 1) != 0)
    obja = 0;
  else
    obja = v124;
  if (self)
    v84 = self->_propertyKey;
  else
    v84 = 0;
  v85 = v84;
  v86 = -[NSString isEqualToString:](v85, "isEqualToString:", CFSTR("phoneNumbers"));

  if (v86)
  {
    objc_msgSend(v28, "value");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "stringValue");
    v88 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_114;
  }
  if (self)
    v89 = self->_propertyKey;
  else
    v89 = 0;
  v90 = v89;
  v91 = -[NSString isEqualToString:](v90, "isEqualToString:", CFSTR("emailAddresses"));

  if (v91)
  {
    objc_msgSend(v28, "value");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_114;
  }
  if (self)
    v92 = self->_propertyKey;
  else
    v92 = 0;
  v93 = v92;
  v94 = -[NSString isEqualToString:](v93, "isEqualToString:", CFSTR("socialProfiles"));

  if (v94)
  {
    objc_opt_class();
    objc_msgSend(v28, "value");
    v95 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v96 = v95;
    else
      v96 = 0;
LABEL_106:
    v97 = v96;

    +[CNFavoritesEntry valueStringFromSocialProfile:]((uint64_t)CNFavoritesEntry, v97);
    v88 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_114;
  }
  if (self)
    v98 = self->_propertyKey;
  else
    v98 = 0;
  v99 = v98;
  v100 = -[NSString isEqualToString:](v99, "isEqualToString:", CFSTR("instantMessageAddresses"));

  if (v100)
  {
    objc_opt_class();
    objc_msgSend(v28, "value");
    v95 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v96 = v95;
    else
      v96 = 0;
    goto LABEL_106;
  }
  v88 = 0;
LABEL_114:
  -[CNFavoritesEntry value](self, "value");
  v101 = (NSString *)objc_claimAutoreleasedReturnValue();
  v102 = objc_msgSend(v88, "isEqualToString:", v101);

  if ((v102 & 1) != 0)
    v82 = 0;
  else
    v82 = v88;
  objc_msgSend(v28, "label");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = *MEMORY[0x1E0D13848];
  v105 = (*(uint64_t (**)(_QWORD, void *))(*MEMORY[0x1E0D13848] + 16))(*MEMORY[0x1E0D13848], v103);
  if (v105)
  {
    v106 = self ? self->_label : 0;
    v101 = v106;
    if ((*(unsigned int (**)(uint64_t, NSString *))(v104 + 16))(v104, v101))
    {

LABEL_127:
      v81 = 0;
      goto LABEL_129;
    }
  }
  objc_msgSend(v28, "label");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    label = self->_label;
  else
    label = 0;
  v109 = label;
  v110 = objc_msgSend(v107, "isEqualToString:", v109);

  if (v105)
  if ((v110 & 1) != 0)
    goto LABEL_127;
  objc_msgSend(v28, "label");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_129:
  if (((v126 | v122) & 1) != 0 || obja || v121 != v120 || v82 || v81)
  {
    v83 = objc_alloc_init(CNFavoritesLookupChangeRecord);
    if (v122)
      v111 = objc_msgSend(v28, "iOSLegacyIdentifier");
    else
      v111 = 0xFFFFFFFFLL;
    -[CNFavoritesLookupChangeRecord setIdentifier:](v83, "setIdentifier:", v111);
    if (v121 == v120)
      v112 = 0xFFFFFFFFLL;
    else
      v112 = objc_msgSend(v130, "iOSLegacyIdentifier");
    -[CNFavoritesLookupChangeRecord setUid:](v83, "setUid:", v112);
    -[CNFavoritesLookupChangeRecord setValue:](v83, "setValue:", v82);
    -[CNFavoritesLookupChangeRecord setName:](v83, "setName:", obja);
    -[CNFavoritesLookupChangeRecord setLabel:](v83, "setLabel:", v81);
    -[CNFavoritesLookupChangeRecord setAbDatabaseUUID:](v83, "setAbDatabaseUUID:", v131);
  }
  else
  {
    v83 = 0;
  }

  v32 = v130;
LABEL_143:
  v113 = v32;
  v114 = v32 == 0;
  v115 = v83;
  v116 = (void *)MEMORY[0x1E0D13AF8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v114);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "pairWithFirst:second:", v115, v117);
  v118 = (void *)objc_claimAutoreleasedReturnValue();

  return v118;
}

- (BOOL)rematchWithContacts
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  BOOL v7;

  -[CNFavoritesEntry rematch](self, "rematch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "second");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    -[CNFavoritesEntry resetContactMatch](self, "resetContactMatch");
  }
  else
  {
    objc_msgSend(v3, "first");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFavoritesEntry applyChangeRecord:](self, "applyChangeRecord:", v6);

  }
  v7 = -[CNFavoritesEntry dirty](self, "dirty");

  return v7;
}

- (BOOL)rematchWithGeminiManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v15;
  char v16;

  v4 = a3;
  -[CNFavoritesEntry actionType](self, "actionType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("AudioCallActionType")) & 1) != 0)
    goto LABEL_6;
  -[CNFavoritesEntry actionType](self, "actionType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("MessageActionType")) & 1) != 0)
  {
LABEL_5:

LABEL_6:
    goto LABEL_7;
  }
  -[CNFavoritesEntry actionType](self, "actionType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("TTYCallActionType")))
  {

    goto LABEL_5;
  }
  -[CNFavoritesEntry actionType](self, "actionType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("TTYRelayCallActionType"));

  if ((v16 & 1) == 0)
  {
    v13 = 0;
    goto LABEL_10;
  }
LABEL_7:
  -[CNFavoritesEntry contactProperty](self, "contactProperty");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contact");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bestSenderIdentityForContact:error:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNGeminiManager channelStringFromSenderIdentity:](CNGeminiManager, "channelStringFromSenderIdentity:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFavoritesEntry actionChannel](self, "actionChannel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 != v11)
  {
    -[CNFavoritesEntry setActionChannel:](self, "setActionChannel:", v11);
    -[CNFavoritesEntry setDirty:](self, "setDirty:", 1);
  }
  v13 = -[CNFavoritesEntry dirty](self, "dirty");

LABEL_10:
  return v13;
}

- (void)resetContactMatch
{
  NSString *v3;
  int v4;
  _BOOL4 v5;

  if (self && (v3 = self->_label) != 0
    || (-[CNFavoritesEntry name](self, "name"), (v3 = (NSString *)objc_claimAutoreleasedReturnValue()) != 0)
    || (-[CNFavoritesEntry abUid](self, "abUid") & 0x80000000) == 0)
  {

    goto LABEL_6;
  }
  if ((-[CNFavoritesEntry abIdentifier](self, "abIdentifier") & 0x80000000) == 0)
  {
LABEL_6:
    v4 = -[CNFavoritesEntry abUid](self, "abUid");
    if ((v4 & 0x80000000) == 0)
      -[CNFavoritesEntry setAbUid:](self, "setAbUid:", 0xFFFFFFFFLL);
    if (-[CNFavoritesEntry abIdentifier](self, "abIdentifier") < 0)
    {
      v5 = v4 >= 0;
      if (!self)
        goto LABEL_13;
    }
    else
    {
      -[CNFavoritesEntry setAbIdentifier:](self, "setAbIdentifier:", 0xFFFFFFFFLL);
      v5 = 1;
      if (!self)
        goto LABEL_13;
    }
    if (self->_abDatabaseUUID)
    {
      -[CNChangesNotifierProxy setCoalescingTimer:]((uint64_t)self, 0);
LABEL_14:
      -[CNFavoritesEntry setDirty:](self, "setDirty:", 1);
      -[CNFavoritesEntry setContact:]((uint64_t)self, 0);
      return;
    }
LABEL_13:
    if (!v5)
      return;
    goto LABEL_14;
  }
}

- (void)applyChangeRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *name;
  SEL v10;
  void *v11;
  NSString *v12;
  NSString *label;
  NSString *v14;
  NSString *abDatabaseUUID;
  id v16;

  v4 = a3;
  if (v4)
  {
    v16 = v4;
    if ((objc_msgSend(v4, "identifier") & 0x80000000) == 0)
      -[CNFavoritesEntry setAbIdentifier:](self, "setAbIdentifier:", objc_msgSend(v16, "identifier"));
    if ((objc_msgSend(v16, "uid") & 0x80000000) == 0)
    {
      -[CNFavoritesEntry setOldAbUid:](self, "setOldAbUid:", self->_abUid);
      -[CNFavoritesEntry setAbUid:](self, "setAbUid:", objc_msgSend(v16, "uid"));
    }
    objc_msgSend(v16, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v16, "value");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNFavoritesEntry setValue:](self, "setValue:", v6);

    }
    objc_msgSend(v16, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v16, "name");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      name = self->_name;
      self->_name = v8;

      objc_setProperty_nonatomic_copy(self, v10, self->_name, 96);
    }
    objc_msgSend(v16, "label");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v16, "label");
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
      label = self->_label;
      self->_label = v12;

    }
    if ((self->_abUid & 0x80000000) == 0)
    {
      objc_msgSend(v16, "abDatabaseUUID");
      v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      abDatabaseUUID = self->_abDatabaseUUID;
      self->_abDatabaseUUID = v14;

    }
    -[CNFavoritesEntry setDirty:](self, "setDirty:", 1);
    v4 = v16;
  }

}

- (NSString)actionChannel
{
  return self->_actionChannel;
}

- (int)oldAbUid
{
  return self->_oldAbUid;
}

- (void)setOldAbUid:(int)a3
{
  self->_oldAbUid = a3;
}

- (BOOL)dirty
{
  return self->_dirty;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionChannel, 0);
  objc_storeStrong((id *)&self->_labeledValueIdentifier, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_originalName, 0);
  objc_storeStrong((id *)&self->_abDatabaseUUID, 0);
  objc_storeStrong((id *)&self->_propertyKey, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_actionType, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
