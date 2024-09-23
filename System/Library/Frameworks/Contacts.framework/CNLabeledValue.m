@implementation CNLabeledValue

- (id)primitiveInitWithIdentifier:(id)a3 label:(id)a4 value:(id)a5
{
  id v9;
  id v10;
  id v11;
  CNLabeledValue *v12;
  CNLabeledValue *v13;
  CNLabelValuePair *v14;
  CNLabelValuePair *labelValuePair;
  CNLabeledValue *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    if (CNGuardOSLog_cn_once_token_0_1 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_1, &__block_literal_global_154);
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_1, OS_LOG_TYPE_FAULT))
      -[CNLabeledValue primitiveInitWithIdentifier:label:value:].cold.1();
  }
  v18.receiver = self;
  v18.super_class = (Class)CNLabeledValue;
  v12 = -[CNLabeledValue init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    v14 = -[CNLabelValuePair initWithLabel:value:]([CNLabelValuePair alloc], "initWithLabel:value:", v10, v11);
    labelValuePair = v13->_labelValuePair;
    v13->_labelValuePair = v14;

    v13->_iOSLegacyIdentifier = CNLabeledValueInvalidIOSIdentifier;
    objc_opt_class();
    v13->_isValueMutable = objc_opt_isKindOfClass() & 1;
    v16 = v13;
  }

  return v13;
}

- (void)setIOSLegacyIdentifier:(int)a3
{
  self->_iOSLegacyIdentifier = a3;
}

+ (id)emptyEntries
{
  return (id)MEMORY[0x1E0C9AA60];
}

uint64_t __50__CNLabeledValue_propertyDescriptionOwnersByLabel__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", *(_QWORD *)(a1 + 40), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedIdentifiers, 0);
  objc_storeStrong((id *)&self->_storeInfo, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_labelValuePair, 0);
}

+ (id)Value
{
  return &__block_literal_global_139;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v11;
  unint64_t v12;
  int v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (self == a3)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    v21 = v5;
    v22 = v4;
    v23 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (unint64_t)-[CNLabeledValue identifier](self, "identifier");
      v12 = (unint64_t)(id)objc_msgSend(a3, "identifier");
      if (!(v11 | v12) || (v13 = objc_msgSend((id)v11, "isEqual:", v12)) != 0)
      {
        v14 = (unint64_t)-[CNLabeledValue storeIdentifier](self, "storeIdentifier", v6, v21, v22, v23, v7, v8);
        v15 = (unint64_t)(id)objc_msgSend(a3, "storeIdentifier");
        if (!(v14 | v15) || (v13 = objc_msgSend((id)v14, "isEqual:", v15)) != 0)
        {
          v16 = (unint64_t)-[CNLabeledValue linkedIdentifiers](self, "linkedIdentifiers");
          v17 = (unint64_t)(id)objc_msgSend(a3, "linkedIdentifiers");
          if (!(v16 | v17) || (v13 = objc_msgSend((id)v16, "isEqual:", v17)) != 0)
          {
            v18 = (unint64_t)-[CNLabeledValue labelValuePair](self, "labelValuePair");
            v19 = (unint64_t)(id)objc_msgSend(a3, "labelValuePair");
            if (!(v18 | v19) || (v13 = objc_msgSend((id)v18, "isEqual:", v19)) != 0)
              LOBYTE(v13) = 1;
          }
        }
      }
    }
    else
    {
      LOBYTE(v13) = 0;
    }
  }
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  void *v5;
  void *v6;
  id v7;

  identifier = self->_identifier;
  v7 = a3;
  objc_msgSend(v7, "encodeObject:forKey:", identifier, CFSTR("_identifier"));
  -[CNLabelValuePair label](self->_labelValuePair, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("_label"));

  -[CNLabelValuePair value](self->_labelValuePair, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("_value"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_linkedIdentifiers, CFSTR("linkedIdentifiers"));
  objc_msgSend(v7, "encodeInt32:forKey:", self->_iOSLegacyIdentifier, CFSTR("iOSLegacyIdentifier"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_storeIdentifier, CFSTR("storeIdentifier"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_storeInfo, CFSTR("storeInfo"));

}

- (BOOL)isEqualIgnoringIdentifiers:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  int v7;

  if (self == a3)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = (unint64_t)-[CNLabeledValue labelValuePair](self, "labelValuePair");
      v6 = (unint64_t)(id)objc_msgSend(a3, "labelValuePair");
      if (!(v5 | v6) || (v7 = objc_msgSend((id)v5, "isEqual:", v6)) != 0)
        LOBYTE(v7) = 1;
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }
  return v7;
}

- (CNLabelValuePair)labelValuePair
{
  return (CNLabelValuePair *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLinkedIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSSet)linkedIdentifiers
{
  return self->_linkedIdentifiers;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)description
{
  void *v3;
  NSString *identifier;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  -[CNLabelValuePair label](self->_labelValuePair, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNLabelValuePair value](self->_labelValuePair, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendNamesAndObjects:", CFSTR("identifier"), identifier, CFSTR("label"), v5, CFSTR("value"), v6, 0);

  v8 = (id)objc_msgSend(v3, "appendName:intValue:", CFSTR("iOSLegacyIdentifier"), self->_iOSLegacyIdentifier);
  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (id)value
{
  _BOOL4 isValueMutable;
  CNLabelValuePair *labelValuePair;
  void *v4;
  id v5;

  isValueMutable = self->_isValueMutable;
  labelValuePair = self->_labelValuePair;
  if (isValueMutable)
  {
    -[CNLabelValuePair value](labelValuePair, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "copy");

  }
  else
  {
    v5 = labelValuePair->_value;
  }
  return v5;
}

- (NSString)label
{
  return self->_labelValuePair->_label;
}

void __36__CNLabeledValue_identifierProvider__block_invoke()
{
  CNUuidIdentifierProvider *v0;
  void *v1;

  v0 = -[CNUuidIdentifierProvider initWithSuffix:]([CNUuidIdentifierProvider alloc], "initWithSuffix:", 0);
  v1 = (void *)identifierProvider_cn_once_object_0;
  identifierProvider_cn_once_object_0 = (uint64_t)v0;

}

+ (CNLabeledValue)labeledValueWithLabel:(NSString *)label value:(id)value
{
  id v6;
  NSString *v7;
  id v8;
  void *v9;
  void *v10;

  v6 = value;
  v7 = label;
  v8 = objc_alloc((Class)a1);
  +[CNLabeledValue makeIdentifier]();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithIdentifier:label:value:", v9, v7, v6);

  return (CNLabeledValue *)v10;
}

- (CNLabeledValue)initWithIdentifier:(id)a3 label:(id)a4 value:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  CNLabeledValue *v13;

  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_msgSend(a3, "copy");
  v11 = (void *)objc_msgSend(v9, "copy");

  v12 = (void *)objc_msgSend(v8, "copy");
  v13 = -[CNLabeledValue primitiveInitWithIdentifier:label:value:](self, "primitiveInitWithIdentifier:label:value:", v10, v11, v12);

  return v13;
}

+ (id)makeIdentifier
{
  void *v0;
  void *v1;

  objc_opt_self();
  +[CNLabeledValue identifierProvider]();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "makeIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)identifierProvider
{
  objc_opt_self();
  if (identifierProvider_cn_once_token_0 != -1)
    dispatch_once(&identifierProvider_cn_once_token_0, &__block_literal_global_12);
  return (id)identifierProvider_cn_once_object_0;
}

+ (NSString)localizedStringForLabel:(NSString *)label
{
  NSString *v4;
  NSString *v5;

  v4 = label;
  +[CNLabeledValue propertyDescriptionLocalizationForLabel:]((uint64_t)a1, v4);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0D13A98], "localizedStringForString:class:returningNilIfNotFound:", v4, a1, 0);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (!v5)
      v5 = v4;
  }

  return v5;
}

+ (id)propertyDescriptionLocalizationForLabel:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = a2;
  objc_opt_self();
  +[CNLabeledValue propertyDescriptionOwnersByLabel]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "localizedStringForLabel:", v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)propertyDescriptionOwnersByLabel
{
  objc_opt_self();
  if (propertyDescriptionOwnersByLabel_onceToken != -1)
    dispatch_once(&propertyDescriptionOwnersByLabel_onceToken, &__block_literal_global_3_1);
  return (id)propertyDescriptionOwnersByLabel_result;
}

- (int)iOSLegacyIdentifier
{
  return self->_iOSLegacyIdentifier;
}

void __50__CNLabeledValue_propertyDescriptionOwnersByLabel__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  +[CN multiValueContactProperties](CN, "multiValueContactProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v15;
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v15 != v4)
          objc_enumerationMutation(v1);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v7, "managedLabels");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v11[0] = v5;
        v11[1] = 3221225472;
        v11[2] = __50__CNLabeledValue_propertyDescriptionOwnersByLabel__block_invoke_2;
        v11[3] = &unk_1E29F8668;
        v12 = v0;
        v13 = v7;
        objc_msgSend(v8, "_cn_each:", v11);

      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v3);
  }

  v9 = objc_msgSend(v0, "copy");
  v10 = (void *)propertyDescriptionOwnersByLabel_result;
  propertyDescriptionOwnersByLabel_result = v9;

}

- (BOOL)isSuggested
{
  void *v2;
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;

  -[CNLabeledValue storeIdentifier](self, "storeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[CNSuggestedContactStore storeIdentifier](CNSuggestedContactStore, "storeIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      v8 = 1;
      goto LABEL_14;
    }
  }
  -[CNLabeledValue storeIdentifier](self, "storeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNSuggestedContactStore storeIdentifier](CNSuggestedContactStore, "storeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqual:", v7) & 1) == 0)
  {
    -[CNLabeledValue storeIdentifier](self, "storeIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9
      || (+[CNDonationMapper mapperIdentifier](CNDonationMapper, "mapperIdentifier"),
          (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CNLabeledValue storeIdentifier](self, "storeIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNDonationMapper mapperIdentifier](CNDonationMapper, "mapperIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v10, "isEqual:", v11);

      if (v9)
      {

        goto LABEL_13;
      }
    }
    else
    {
      v8 = 1;
    }

LABEL_13:
    if (v5)
      goto LABEL_15;
LABEL_14:

    goto LABEL_15;
  }

  v8 = 1;
  if (!v5)
    goto LABEL_14;
LABEL_15:

  return v8;
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

- (CNLabeledValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  CNLabeledValue *v10;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_label"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("_value"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
  {
    v8 = os_log_create("com.apple.contacts", "data-access-error");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CNLabeledValue initWithCoder:].cold.1();
  }
  else if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = os_log_create("com.apple.contacts", "data-access-error");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[CNLabeledValue initWithCoder:].cold.3();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v12 = -[CNLabeledValue primitiveInitWithIdentifier:label:value:](self, "primitiveInitWithIdentifier:label:value:", v5, v6, v7);
        v13 = (void *)MEMORY[0x1E0C99E60];
        v14 = objc_opt_class();
        objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("linkedIdentifiers"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "copy");
        v18 = (void *)v12[6];
        v12[6] = v17;

        *((_DWORD *)v12 + 6) = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("iOSLegacyIdentifier"));
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storeIdentifier"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "copy");
        v21 = (void *)v12[4];
        v12[4] = v20;

        +[CNContact storeInfoFromCoder:storeIdentifier:key:](CNContact, "storeInfoFromCoder:storeIdentifier:key:", v4, v12[4], CFSTR("storeInfo"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "copy");
        v24 = (void *)v12[5];
        v12[5] = v23;

        self = v12;
        v10 = self;
        goto LABEL_14;
      }
      v8 = os_log_create("com.apple.contacts", "data-access-error");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[CNLabeledValue initWithCoder:].cold.4();
    }
  }
  else
  {
    v8 = os_log_create("com.apple.contacts", "data-access-error");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CNLabeledValue initWithCoder:].cold.2();
  }

  +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 2, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failWithError:", v9);

  v10 = 0;
LABEL_14:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)testMatchingIdentifier:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD aBlock[4];
  id v9;

  v3 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__CNLabeledValue_testMatchingIdentifier___block_invoke;
  aBlock[3] = &unk_1E29F8640;
  v9 = v3;
  v4 = v3;
  v5 = _Block_copy(aBlock);
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

uint64_t __41__CNLabeledValue_testMatchingIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

+ (id)entryForIdentifier:(id)a3 inArray:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v6 = a4;
  objc_msgSend(a1, "testMatchingIdentifier:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "indexOfObjectPassingTest:", v7);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)labelForIdentifier:(id)a3 inArray:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "entryForIdentifier:inArray:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)valueForIdentifier:(id)a3 inArray:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "entryForIdentifier:inArray:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)entryWithIdentifier:(id)a3 label:(id)a4 value:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:label:value:", v10, v9, v8);

  return v11;
}

+ (BOOL)isArrayOfEntries:(id)a3 equalToArrayOfEntriesIgnoringIdentifiers:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  BOOL v8;
  unint64_t i;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  char v16;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "count");
  if (v7 == objc_msgSend(v6, "count"))
  {
    if (v7)
    {
      v8 = 0;
      for (i = 0; i != v7; v8 = i >= v7)
      {
        objc_opt_class();
        objc_msgSend(v5, "objectAtIndex:", i);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v11 = v10;
          else
            v11 = 0;
          v12 = v11;
        }
        else
        {
          v12 = 0;
        }

        objc_opt_class();
        objc_msgSend(v6, "objectAtIndex:", i);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v14 = v13;
          else
            v14 = 0;
          v15 = v14;
        }
        else
        {
          v15 = 0;
        }

        v16 = objc_msgSend(v12, "isEqualIgnoringIdentifiers:", v15);
        if ((v16 & 1) == 0)
          break;
        ++i;
      }
    }
    else
    {
      v8 = 1;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)entriesByUnifyingEntryArrays:(id)a3 forProperty:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  +[CN unifyMultivalues:forProperty:options:](CN, "unifyMultivalues:forProperty:options:", v6, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)allValuesInArray:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "value", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

+ (CNLabeledValue)labeledValueWithIdentifier:(id)a3 inArray:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = a4;
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "identifier", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v5);

        if (v12)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return (CNLabeledValue *)v7;
}

+ (id)firstLabeledValueWithValue:(id)a3 inArray:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = a4;
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "value", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v5);

        if (v12)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (CNLabeledValue)init
{
  CNLabeledValue *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNLabeledValue)initWithLabel:(NSString *)label value:(id)value
{
  id v6;
  NSString *v7;
  void *v8;
  CNLabeledValue *v9;

  v6 = value;
  v7 = label;
  +[CNLabeledValue makeIdentifier]();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CNLabeledValue initWithIdentifier:label:value:](self, "initWithIdentifier:label:value:", v8, v7, v6);

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CNLabeledValue *v4;
  NSString *identifier;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v4 = [CNLabeledValue alloc];
  identifier = self->_identifier;
  -[CNLabeledValue label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNLabeledValue value](self, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CNLabeledValue initWithIdentifier:label:value:](v4, "initWithIdentifier:label:value:", identifier, v6, v7);

  v9 = -[NSString copy](self->_storeIdentifier, "copy");
  v10 = *(void **)(v8 + 32);
  *(_QWORD *)(v8 + 32) = v9;

  v11 = -[NSDictionary copy](self->_storeInfo, "copy");
  v12 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v11;

  v13 = -[NSSet copy](self->_linkedIdentifiers, "copy");
  v14 = *(void **)(v8 + 48);
  *(_QWORD *)(v8 + 48) = v13;

  *(_DWORD *)(v8 + 24) = self->_iOSLegacyIdentifier;
  return (id)v8;
}

- (CNLabeledValue)labeledValueBySettingLabel:(NSString *)label
{
  NSString *v4;
  CNLabeledValue *v5;
  NSString *identifier;
  void *v7;
  CNLabeledValue *v8;
  void *v9;
  void *v10;

  v4 = label;
  v5 = [CNLabeledValue alloc];
  identifier = self->_identifier;
  -[CNLabelValuePair value](self->_labelValuePair, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CNLabeledValue initWithIdentifier:label:value:](v5, "initWithIdentifier:label:value:", identifier, v4, v7);

  -[CNLabeledValue linkedIdentifiers](self, "linkedIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  -[CNLabeledValue setLinkedIdentifiers:](v8, "setLinkedIdentifiers:", v10);

  -[CNLabeledValue setIOSLegacyIdentifier:](v8, "setIOSLegacyIdentifier:", -[CNLabeledValue iOSLegacyIdentifier](self, "iOSLegacyIdentifier"));
  return v8;
}

- (CNLabeledValue)labeledValueBySettingValue:(id)value
{
  id v4;
  CNLabeledValue *v5;
  NSString *identifier;
  void *v7;
  CNLabeledValue *v8;
  void *v9;
  void *v10;

  v4 = value;
  v5 = [CNLabeledValue alloc];
  identifier = self->_identifier;
  -[CNLabelValuePair label](self->_labelValuePair, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CNLabeledValue initWithIdentifier:label:value:](v5, "initWithIdentifier:label:value:", identifier, v7, v4);

  -[CNLabeledValue linkedIdentifiers](self, "linkedIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  -[CNLabeledValue setLinkedIdentifiers:](v8, "setLinkedIdentifiers:", v10);

  -[CNLabeledValue setIOSLegacyIdentifier:](v8, "setIOSLegacyIdentifier:", -[CNLabeledValue iOSLegacyIdentifier](self, "iOSLegacyIdentifier"));
  return v8;
}

- (CNLabeledValue)labeledValueBySettingLabel:(NSString *)label value:(id)value
{
  id v6;
  NSString *v7;
  CNLabeledValue *v8;
  void *v9;
  void *v10;

  v6 = value;
  v7 = label;
  v8 = -[CNLabeledValue initWithIdentifier:label:value:]([CNLabeledValue alloc], "initWithIdentifier:label:value:", self->_identifier, v7, v6);

  -[CNLabeledValue linkedIdentifiers](self, "linkedIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  -[CNLabeledValue setLinkedIdentifiers:](v8, "setLinkedIdentifiers:", v10);

  -[CNLabeledValue setIOSLegacyIdentifier:](v8, "setIOSLegacyIdentifier:", -[CNLabeledValue iOSLegacyIdentifier](self, "iOSLegacyIdentifier"));
  return v8;
}

- (void)addStoreInfo:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = *MEMORY[0x1E0D13820];
  -[CNLabeledValue storeInfo](self, "storeInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  if ((_DWORD)v4)
  {
    -[CNLabeledValue setStoreInfo:](self, "setStoreInfo:", v8);
  }
  else
  {
    -[CNLabeledValue storeInfo](self, "storeInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v7, "addEntriesFromDictionary:", v8);
    -[CNLabeledValue setStoreInfo:](self, "setStoreInfo:", v7);

  }
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;

  v3 = (void *)MEMORY[0x1E0D13A78];
  -[CNLabeledValue identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "objectHash:", v4);

  v6 = (void *)MEMORY[0x1E0D13A78];
  -[CNLabeledValue storeIdentifier](self, "storeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "objectHash:", v7) - v5 + 32 * v5;

  v9 = (void *)MEMORY[0x1E0D13A78];
  -[CNLabeledValue labelValuePair](self, "labelValuePair");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "objectHash:", v10) - v8 + 32 * v8 + 506447;

  return v11;
}

- (void)setStoreIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDictionary)storeInfo
{
  return self->_storeInfo;
}

- (void)setStoreInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (SGRecordId)suggestionRecordId
{
  void *v2;
  void *v3;

  -[CNLabeledValue storeInfo](self, "storeInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CNSuggestedContactRecordIdKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SGRecordId *)v3;
}

- (NSString)suggestionFoundInBundleId
{
  void *v2;
  void *v3;

  -[CNLabeledValue storeInfo](self, "storeInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CNSuggestedContactFoundInBundle);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (CNValueOrigin)valueOrigin
{
  void *v2;
  void *v3;

  -[CNLabeledValue storeInfo](self, "storeInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("valueOrigin"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNValueOrigin *)v3;
}

- (NSString)localizedAppName
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;

  objc_opt_class();
  -[CNLabeledValue value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = *MEMORY[0x1E0D13850];
  objc_msgSend(v5, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (*(uint64_t (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  v9 = 0;
  if (v8)
  {
    objc_msgSend(v5, "service");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v9;
}

- (BOOL)isBirthday
{
  void *v2;
  char v3;

  -[CNLabeledValue label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0D19D80]);

  return v3;
}

- (void)primitiveInitWithIdentifier:label:value:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_5();
  _os_log_fault_impl(&dword_18F8BD000, v0, OS_LOG_TYPE_FAULT, "parameter ‘value’ must be nonnull", v1, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)initWithCoder:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_18F8BD000, v0, v1, "Error decoding CNLabeledValue: no identifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)initWithCoder:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_18F8BD000, v0, v1, "Error decoding CNLabeledValue: no value", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)initWithCoder:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_18F8BD000, v0, v1, "Error decoding CNLabeledValue: labeled-value value", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)initWithCoder:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_18F8BD000, v0, v1, "Error decoding CNLabeledValue: array value", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
