@implementation INCodableDescription

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semanticRoot, 0);
  objc_storeStrong((id *)&self->_displayOrderedAttributes, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_typeName, 0);
  objc_storeStrong((id *)&self->_className, 0);
  objc_storeStrong((id *)&self->_intentDefinitionNamespace, 0);
  objc_destroyWeak((id *)&self->_schema);
  objc_storeStrong((id *)&self->_mainBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_customLocalizationTable, 0);
  objc_storeStrong((id *)&self->_localizationTable, 0);
  objc_storeStrong((id *)&self->_attributesByName, 0);
}

- (INCodableDescription)initWithCoder:(id)a3
{
  id v4;
  INCodableDescription *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSDictionary *attributes;
  uint64_t v16;
  NSString *className;
  uint64_t v18;
  NSString *typeName;
  uint64_t v20;
  NSString *intentDefinitionNamespace;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSOrderedSet *displayOrderedAttributes;
  uint64_t v30;
  INCodableLocalizationTable *localizationTable;
  uint64_t v32;
  INCodableLocalizationTable *customLocalizationTable;
  uint64_t v34;
  NSString *semanticRoot;
  uint64_t v36;
  NSString *mainBundleIdentifier;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  INCodableLocalizationTable *v46;
  void *v47;
  void *v48;
  INCodableLocalizationTable *v49;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[INCodableDescription init](self, "init");
  if (v5)
  {
    v51 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    objc_msgSend(v51, "setWithObjects:", v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("attributes"));
    v14 = objc_claimAutoreleasedReturnValue();
    attributes = v5->_attributes;
    v5->_attributes = (NSDictionary *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("className"));
    v16 = objc_claimAutoreleasedReturnValue();
    className = v5->_className;
    v5->_className = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("typeName"));
    v18 = objc_claimAutoreleasedReturnValue();
    typeName = v5->_typeName;
    v5->_typeName = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intentDefinitionNamespace"));
    v20 = objc_claimAutoreleasedReturnValue();
    intentDefinitionNamespace = v5->_intentDefinitionNamespace;
    v5->_intentDefinitionNamespace = (NSString *)v20;

    v22 = (void *)MEMORY[0x1E0C99E60];
    v23 = objc_opt_class();
    v24 = objc_opt_class();
    v25 = objc_opt_class();
    v26 = objc_opt_class();
    objc_msgSend(v22, "setWithObjects:", v23, v24, v25, v26, objc_opt_class(), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("displayOrderedAttributes"));
    v28 = objc_claimAutoreleasedReturnValue();
    displayOrderedAttributes = v5->_displayOrderedAttributes;
    v5->_displayOrderedAttributes = (NSOrderedSet *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_localizationTable"));
    v30 = objc_claimAutoreleasedReturnValue();
    localizationTable = v5->_localizationTable;
    v5->_localizationTable = (INCodableLocalizationTable *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_customLocalizationTable"));
    v32 = objc_claimAutoreleasedReturnValue();
    customLocalizationTable = v5->_customLocalizationTable;
    v5->_customLocalizationTable = (INCodableLocalizationTable *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("semanticRoot"));
    v34 = objc_claimAutoreleasedReturnValue();
    semanticRoot = v5->_semanticRoot;
    v5->_semanticRoot = (NSString *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mainBundleIdentifier"));
    v36 = objc_claimAutoreleasedReturnValue();
    mainBundleIdentifier = v5->_mainBundleIdentifier;
    v5->_mainBundleIdentifier = (NSString *)v36;

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    -[INCodableDescription attributes](v5, "attributes");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "allValues");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v53;
      do
      {
        v43 = 0;
        do
        {
          if (*(_QWORD *)v53 != v42)
            objc_enumerationMutation(v39);
          objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * v43), "relationship");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "_establishRelationship");

          ++v43;
        }
        while (v41 != v43);
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
      }
      while (v41);
    }

    -[INCodableDescription _updateAttributesByName](v5, "_updateAttributesByName");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizationTable"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      v46 = objc_alloc_init(INCodableLocalizationTable);
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizationTable"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[INCodableLocalizationTable setTableName:](v46, "setTableName:", v47);

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bundleIdentifier"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[INCodableLocalizationTable setBundleIdentifier:](v46, "setBundleIdentifier:", v48);

      v49 = v5->_localizationTable;
      v5->_localizationTable = v46;

    }
  }

  return v5;
}

+ (id)__INIntentResponseCodableCodeSuccessKey
{
  return CFSTR("INIntentResponseCodeSuccess");
}

+ (id)__INIntentResponseCodableCodeNameKey
{
  return CFSTR("INIntentResponseCodeName");
}

+ (id)__INIntentResponseCodableCodeFormatStringIDKey
{
  return CFSTR("INIntentResponseCodeFormatStringID");
}

+ (id)__INIntentResponseCodableCodeFormatStringKey
{
  return CFSTR("INIntentResponseCodeFormatString");
}

+ (id)__INIntentResponseCodableCodeConciseFormatStringIDKey
{
  return CFSTR("INIntentResponseCodeConciseFormatStringID");
}

+ (id)__INIntentResponseCodableCodeConciseFormatStringKey
{
  return CFSTR("INIntentResponseCodeConciseFormatString");
}

- (void)updateWithDictionary:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *typeName;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  objc_class *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id obj;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "__NameKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  typeName = self->_typeName;
  self->_typeName = v6;

  -[INCodableDescription _attributesKey](self, "_attributesKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v4;
  objc_msgSend(v4, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v9;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v50;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v50 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v14);
        -[INCodableDescription _attributeKey](self, "_attributeKey");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v15;
        v18 = v16;
        objc_msgSend(v18, "stringByAppendingString:", CFSTR("EnumType"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v20)
        {
          objc_msgSend(v18, "stringByAppendingString:", CFSTR("SupportsMultipleValues"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "BOOLValue");

          v24 = v23 ^ 1u;
          objc_msgSend(v18, "stringByAppendingString:", CFSTR("Type"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = INCodableScalarAttributeTypeFromString(v26, v24);

          if (v27 == -1)
          {
            objc_msgSend(v18, "stringByAppendingString:", CFSTR("ObjectType"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectForKeyedSubscript:", v28);

          }
        }
        objc_opt_class();
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = v29;
        v31 = objc_alloc_init(v30);
        objc_msgSend(v31, "_setCodableDescription:", self);
        objc_msgSend(v31, "updateWithDictionary:", v17);
        objc_msgSend(v31, "_attributeTagKey");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v33, "integerValue"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v31, v34);

        objc_msgSend(v31, "propertyName");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (v35)
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_attributesByName, "setObject:forKeyedSubscript:", v31, v35);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    }
    while (v12);
  }

  objc_storeStrong((id *)&self->_attributes, v10);
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  -[INCodableDescription attributes](self, "attributes");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "allValues");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v46;
    do
    {
      v41 = 0;
      do
      {
        if (*(_QWORD *)v46 != v40)
          objc_enumerationMutation(v37);
        objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * v41), "relationship");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "_establishRelationship");

        ++v41;
      }
      while (v39 != v41);
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    }
    while (v39);
  }

}

+ (id)__INCodableObjectAttributeTypeKey
{
  return CFSTR("INIntentParameterType");
}

+ (id)__INCodableAttributeWindowSizeKey
{
  return CFSTR("INIntentParameterWindowSize");
}

+ (id)__INCodableAttributeUnsupportedReasonsKey
{
  return CFSTR("INIntentParameterUnsupportedReasons");
}

+ (id)__INCodableAttributeTagKey
{
  return CFSTR("INIntentParameterTag");
}

+ (id)__INCodableAttributeSupportsSearchKey
{
  return CFSTR("INIntentParameterSupportsSearch");
}

+ (id)__INCodableAttributeSupportsResolutionKey
{
  return CFSTR("INIntentParameterSupportsResolution");
}

+ (id)__INCodableAttributeSupportsMultipleValuesKey
{
  return CFSTR("INIntentParameterSupportsMultipleValues");
}

+ (id)__INCodableAttributeSupportsDynamicEnumerationKey
{
  return CFSTR("INIntentParameterSupportsDynamicEnumeration");
}

+ (id)__INCodableAttributeRelationshipKey
{
  return CFSTR("INIntentParameterRelationship");
}

+ (id)__INCodableAttributePromptDialogsKey
{
  return CFSTR("INIntentParameterPromptDialogs");
}

+ (id)__INCodableAttributeNameKey
{
  return CFSTR("INIntentParameterName");
}

+ (id)__INCodableAttributeMetadataKey
{
  return CFSTR("INIntentParameterMetadata");
}

+ (id)__INCodableAttributeFixedSizeArrayKey
{
  return CFSTR("INIntentParameterFixedSizeArray");
}

+ (id)__INCodableAttributeEntityKeypathKey
{
  return CFSTR("INIntentParameterEntityKeypath");
}

+ (id)__INCodableAttributeDisplayPriorityKey
{
  return CFSTR("INIntentParameterDisplayPriority");
}

+ (id)__INCodableAttributeDisplayNameIDKey
{
  return CFSTR("INIntentParameterDisplayNameID");
}

+ (id)__INCodableAttributeDisplayNameKey
{
  return CFSTR("INIntentParameterDisplayName");
}

+ (id)__INCodableAttributeDefaultKey
{
  return CFSTR("INIntentParameterDefault");
}

+ (id)__INCodableAttributeConfigurableKey
{
  return CFSTR("INIntentParameterConfigurable");
}

+ (id)__INCodableAttributeArraySizesKey
{
  return CFSTR("INIntentParameterArraySizes");
}

+ (id)__INCodableAttributeEnumTypeKey
{
  return CFSTR("INIntentParameterEnumType");
}

- (void)_updateAttributesByName
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  NSMutableDictionary *attributesByName;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSDictionary allValues](self->_attributes, "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "propertyName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          attributesByName = self->_attributesByName;
          objc_msgSend(v8, "propertyName");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](attributesByName, "setObject:forKeyedSubscript:", v8, v11);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

+ (id)__INCodableAttributeMetadataPlaceholderIDKey
{
  return CFSTR("INIntentParameterMetadataPlaceholderID");
}

+ (id)__INCodableAttributeMetadataPlaceholderKey
{
  return CFSTR("INIntentParameterMetadataPlaceholder");
}

+ (id)__INCodableEnumAttributeEnumTypeKey
{
  return CFSTR("INIntentParameterEnumType");
}

+ (id)__INCodableScalarAttributeTypeKey
{
  return CFSTR("INIntentParameterType");
}

+ (id)__INCodableAttributePromptDialogFormatStringKey
{
  return CFSTR("INIntentParameterPromptDialogFormatString");
}

+ (id)__INCodableStringAttributeMetadataMultilineKey
{
  return CFSTR("INIntentParameterMetadataMultiline");
}

+ (id)__INCodableStringAttributeMetadataDisableSmartQuotesKey
{
  return CFSTR("INIntentParameterMetadataDisableSmartQuotes");
}

+ (id)__INCodableStringAttributeMetadataDisableSmartDashesKey
{
  return CFSTR("INIntentParameterMetadataDisableSmartDashes");
}

+ (id)__INCodableStringAttributeMetadataDisableAutocorrectKey
{
  return CFSTR("INIntentParameterMetadataDisableAutocorrect");
}

+ (id)__INCodableStringAttributeMetadataDefaultValueIDKey
{
  return CFSTR("INIntentParameterMetadataDefaultValueID");
}

+ (id)__INCodableStringAttributeMetadataDefaultValueKey
{
  return CFSTR("INIntentParameterMetadataDefaultValue");
}

+ (id)__INCodableStringAttributeMetadataCapitalizationKey
{
  return CFSTR("INIntentParameterMetadataCapitalization");
}

+ (id)__INCodableEnumAttributeMetadataDefaultValueKey
{
  return CFSTR("INIntentParameterMetadataDefaultValue");
}

+ (id)__INCodableAttributeTypeKey
{
  return CFSTR("INIntentParameterType");
}

+ (id)__INCodableCustomObjectAttributeObjectTypeNamespaceKey
{
  return CFSTR("INIntentParameterObjectTypeNamespace");
}

+ (id)__INCodableCustomObjectAttributeObjectTypeKey
{
  return CFSTR("INIntentParameterObjectType");
}

uint64_t __48__INCodableDescription_displayOrderedAttributes__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "displayPriorityRank");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayPriorityRank");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

+ (id)__INCodableAttributePromptDialogTypeKey
{
  return CFSTR("INIntentParameterPromptDialogType");
}

+ (id)__INCodableAttributePromptDialogFormatStringIDKey
{
  return CFSTR("INIntentParameterPromptDialogFormatStringID");
}

+ (id)__INCodableAttributeUnsupportedReasonFormatStringIDKey
{
  return CFSTR("INIntentParameterUnsupportedReasonFormatStringID");
}

+ (id)__INCodableAttributeUnsupportedReasonFormatStringKey
{
  return CFSTR("INIntentParameterUnsupportedReasonFormatString");
}

+ (id)__INCodableAttributeUnsupportedReasonCodeKey
{
  return CFSTR("INIntentParameterUnsupportedReasonCode");
}

- (id)attributeByName:(id)a3
{
  if (!a3)
    return 0;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_attributesByName, "objectForKeyedSubscript:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setAttributes:(id)a3
{
  NSDictionary *v4;
  NSDictionary *attributes;

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  attributes = self->_attributes;
  self->_attributes = v4;

  -[INCodableDescription _updateAttributesByName](self, "_updateAttributesByName");
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

+ (id)__INCodableBooleanAttributeMetadataTrueDisplayNameIDKey
{
  return CFSTR("INIntentParameterMetadataTrueDisplayNameID");
}

+ (id)__INCodableBooleanAttributeMetadataTrueDisplayNameKey
{
  return CFSTR("INIntentParameterMetadataTrueDisplayName");
}

+ (id)__INCodableBooleanAttributeMetadataFalseDisplayNameIDKey
{
  return CFSTR("INIntentParameterMetadataFalseDisplayNameID");
}

+ (id)__INCodableBooleanAttributeMetadataFalseDisplayNameKey
{
  return CFSTR("INIntentParameterMetadataFalseDisplayName");
}

+ (id)__INCodableBooleanAttributeMetadataDefaultValueKey
{
  return CFSTR("INIntentParameterMetadataDefaultValue");
}

- (void)setSchema:(id)a3
{
  objc_storeWeak((id *)&self->_schema, a3);
}

- (void)setIntentDefinitionNamespace:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)_setLocalizationTable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (INCodableDescription)init
{
  INCodableDescription *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *attributesByName;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)INCodableDescription;
  v2 = -[INCodableDescription init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    attributesByName = v2->_attributesByName;
    v2->_attributesByName = v3;

    v2->_displayOrderedAttributesLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (NSString)className
{
  return self->_className;
}

- (NSString)typeName
{
  return self->_typeName;
}

- (void)setMainBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

id __105__INCodableDescription__calculateReferencedCodableDescriptionsFromAttributes_usingTypes_foundAttributes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v3, "objectTypeNamespace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectTypeName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    INIntentDefinitionNamespacedName((uint64_t)v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", v6);
    v9 = (void *)MEMORY[0x1E0C9AA60];
    if ((v8 & 1) == 0 && v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
      v16[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(void **)(a1 + 48);
      objc_msgSend(v7, "attributes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "allValues");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_calculateReferencedCodableDescriptionsFromAttributes:usingTypes:foundAttributes:", v13, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {

    v9 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v9;
}

+ (id)_calculateReferencedCodableDescriptionsFromAttributes:(id)a3 usingTypes:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0C99E20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_calculateReferencedCodableDescriptionsFromAttributes:usingTypes:foundAttributes:", v8, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_calculateReferencedCodableDescriptionsFromAttributes:(id)a3 usingTypes:(id)a4 foundAttributes:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a4;
  v9 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __105__INCodableDescription__calculateReferencedCodableDescriptionsFromAttributes_usingTypes_foundAttributes___block_invoke;
  v14[3] = &unk_1E228AE48;
  v15 = v8;
  v16 = v9;
  v17 = a1;
  v10 = v9;
  v11 = v8;
  objc_msgSend(a3, "if_flatMap:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)setClassName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)_nullable_schema
{
  return objc_loadWeakRetained((id *)&self->_schema);
}

- (INSchema)schema
{
  INSchema **p_schema;
  void *WeakRetained;
  NSString *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  p_schema = &self->_schema;
  WeakRetained = objc_loadWeakRetained((id *)&self->_schema);
  if (!WeakRetained)
  {
    -[INCodableDescription className](self, "className");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = NSClassFromString(v5);

    if (v6
      && (INIntentSchemaGetIntentDescriptionWithFacadeClass(v6),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          v7))
    {
      +[INSchema systemSchema](INSchema, "systemSchema");
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[INCodableDescription _localizationTable](self, "_localizationTable");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[INCodableDescription _localizationTable](self, "_localizationTable");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "bundleIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[INCodableDescription className](self, "className");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@.%@"), CFSTR("sirikit.intents.custom."), v11, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        INSchemaWithTypeName(v13, 0, 0);
        WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        WeakRetained = 0;
      }
    }
    objc_storeWeak((id *)p_schema, WeakRetained);
  }
  return (INSchema *)WeakRetained;
}

- (void)setSemanticRoot:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

+ (id)__INCodableEnumAttributeEnumTypeNamespaceKey
{
  return CFSTR("INIntentParameterEnumTypeNamespace");
}

- (void)encodeWithCoder:(id)a3
{
  NSString *intentDefinitionNamespace;
  id v5;
  id v6;

  intentDefinitionNamespace = self->_intentDefinitionNamespace;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", intentDefinitionNamespace, CFSTR("intentDefinitionNamespace"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_className, CFSTR("className"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attributes, CFSTR("attributes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_typeName, CFSTR("typeName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizationTable, CFSTR("_localizationTable"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_customLocalizationTable, CFSTR("_customLocalizationTable"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_semanticRoot, CFSTR("semanticRoot"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mainBundleIdentifier, CFSTR("mainBundleIdentifier"));
  -[INCodableDescription displayOrderedAttributes](self, "displayOrderedAttributes");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("displayOrderedAttributes"));

}

- (NSOrderedSet)displayOrderedAttributes
{
  void (**v3)(_QWORD);
  NSOrderedSet *displayOrderedAttributes;
  NSOrderedSet *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSOrderedSet **p_displayOrderedAttributes;
  NSOrderedSet *v14;
  NSOrderedSet *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[5];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock(&self->_displayOrderedAttributesLock);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __48__INCodableDescription_displayOrderedAttributes__block_invoke;
  v21[3] = &unk_1E2294DE0;
  v21[4] = self;
  v3 = (void (**)(_QWORD))MEMORY[0x18D7812C4](v21);
  displayOrderedAttributes = self->_displayOrderedAttributes;
  if (!displayOrderedAttributes)
  {
    v5 = (NSOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[INCodableDescription attributes](self, "attributes", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v11, "displayPriorityRank");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
            -[NSOrderedSet addObject:](v5, "addObject:", v11);
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v8);
    }

    -[NSOrderedSet sortUsingComparator:](v5, "sortUsingComparator:", &__block_literal_global_12104);
    v14 = self->_displayOrderedAttributes;
    p_displayOrderedAttributes = &self->_displayOrderedAttributes;
    *p_displayOrderedAttributes = v5;

    displayOrderedAttributes = *p_displayOrderedAttributes;
  }
  v15 = displayOrderedAttributes;
  v3[2](v3);

  return v15;
}

void __48__INCodableDescription_displayOrderedAttributes__block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
}

+ (id)__INCodablePlacemarkAttributeMetadataTypeKey
{
  return CFSTR("INIntentParameterMetadataType");
}

+ (id)__INCodableNumberAttributeMetadataMinimumValueKey
{
  return CFSTR("INIntentParameterMetadataMinimumValue");
}

+ (id)__INCodableNumberAttributeMetadataMaximumValueKey
{
  return CFSTR("INIntentParameterMetadataMaximumValue");
}

+ (id)__INCodableNumberAttributeMetadataTypeKey
{
  return CFSTR("INIntentParameterMetadataType");
}

+ (id)__INCodableNumberAttributeMetadataDefaultValueKey
{
  return CFSTR("INIntentParameterMetadataDefaultValue");
}

+ (id)__INCodableCurrencyAmountAttributeMetadataCurrencyCodesKey
{
  return CFSTR("INIntentParameterMetadataCurrencyCodes");
}

+ (id)__INCodablePersonAttributeMetadataTypeKey
{
  return CFSTR("INIntentParameterMetadataType");
}

+ (id)__INCodableAttributeUnsupportedReasonKey
{
  return CFSTR("INIntentParameterUnsupportedReason");
}

+ (id)__INCodableFileAttributeMetadataTypeKey
{
  return CFSTR("INIntentParameterMetadataType");
}

+ (id)__INCodableFileAttributeMetadataCustomUTIsKey
{
  return CFSTR("INIntentParameterMetadataCustomUTIs");
}

+ (id)__INCodableAttributeUnsupportedReasonFormatStringLanguageCodeKey
{
  return CFSTR("INIntentParameterUnsupportedReasonFormatStringLanguageCode");
}

+ (id)__INCodableAttributeUnsupportedReasonFormatStringDictionaryLanguageCodeKey
{
  return CFSTR("INIntentParameterUnsupportedReasonFormatStringDictionaryLanguageCode");
}

+ (id)__INCodableAttributeUnsupportedReasonFormatStringDictionaryKey
{
  return CFSTR("INIntentParameterUnsupportedReasonFormatStringDictionary");
}

+ (id)__INCodableAttributePromptDialogFormatStringLanguageCodeKey
{
  return CFSTR("INIntentParameterPromptDialogFormatStringLanguageCode");
}

+ (id)__INCodableAttributePromptDialogFormatStringDictionaryLanguageCodeKey
{
  return CFSTR("INIntentParameterPromptDialogFormatStringDictionaryLanguageCode");
}

+ (id)__INCodableAttributePromptDialogFormatStringDictionaryKey
{
  return CFSTR("INIntentParameterPromptDialogFormatStringDictionary");
}

+ (id)__INCodableAttributeDialogFormatStringLanguageCodeKey
{
  return CFSTR("INIntentParameterDialogFormatStringLanguageCode");
}

+ (id)__INCodableAttributeDialogFormatStringIDKey
{
  return CFSTR("INIntentParameterDialogFormatStringID");
}

+ (id)__INCodableAttributeDialogFormatStringDictionaryLanguageCodeKey
{
  return CFSTR("INIntentParameterDialogFormatStringDictionaryLanguageCode");
}

+ (id)__INCodableAttributeDialogFormatStringDictionaryKey
{
  return CFSTR("INIntentParameterDialogFormatStringDictionary");
}

+ (id)__INCodableAttributeDialogFormatStringKey
{
  return CFSTR("INIntentParameterDialogFormatString");
}

- (NSString)description
{
  return (NSString *)-[INCodableDescription descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INCodableDescription;
  -[INCodableDescription description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableDescription dictionaryRepresentation](self, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)codableDescriptionType
{
  return 1;
}

- (id)_ignoredAttributeTags
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (NSString)_attributeKey
{
  return 0;
}

- (NSString)_attributesKey
{
  return 0;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[INCodableDescription dictionaryRepresentationWithLocalizer:](self, "dictionaryRepresentationWithLocalizer:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  _QWORD v20[5];
  id v21;
  id v22;
  _QWORD *v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DE8];
  -[INCodableDescription attributes](self, "attributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__12107;
  v24[4] = __Block_byref_object_dispose__12108;
  v25 = 0;
  -[INCodableDescription attributes](self, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __62__INCodableDescription_dictionaryRepresentationWithLocalizer___block_invoke;
  v20[3] = &unk_1E228ADF8;
  v23 = v24;
  v20[4] = self;
  v10 = v4;
  v21 = v10;
  v11 = v7;
  v22 = v11;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v20);

  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __62__INCodableDescription_dictionaryRepresentationWithLocalizer___block_invoke_2;
  v19[3] = &unk_1E228AE20;
  v19[4] = v24;
  objc_msgSend(v11, "sortUsingComparator:", v19);
  objc_msgSend((id)objc_opt_class(), "__NameKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v12;
  -[INCodableDescription typeName](self, "typeName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[0] = v14;
  -[INCodableDescription _attributesKey](self, "_attributesKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v15;
  v27[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  objc_msgSend(v16, "if_dictionaryWithNonEmptyValues");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v24, 8);
  return v17;
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  INCodableLocalizationTable *localizationTable;
  id *v12;
  id *v13;
  INCodableLocalizationTable *customLocalizationTable;
  id v15;
  id v17;
  id obj;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_intentDefinitionNamespace, CFSTR("intentDefinitionNamespace"));
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_className, CFSTR("className"));
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_typeName, CFSTR("typeName"));
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_semanticRoot, CFSTR("semanticRoot"));
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_mainBundleIdentifier, CFSTR("mainBundleIdentifier"));
  -[INCodableDescription attributes](self, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__12107;
  v33 = __Block_byref_object_dispose__12108;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  v34 = (id)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__12107;
  v27 = __Block_byref_object_dispose__12108;
  v28 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __74__INCodableDescription_widgetPlistableRepresentationWithParameters_error___block_invoke;
  v19[3] = &unk_1E228AE70;
  v9 = v6;
  v20 = v9;
  v21 = &v23;
  v22 = &v29;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v19);
  v10 = (void *)v24[5];
  if (v10)
    goto LABEL_4;
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v30[5], CFSTR("attributes"));
  localizationTable = self->_localizationTable;
  v12 = (id *)(v24 + 5);
  obj = (id)v24[5];
  objc_msgSend(v7, "intents_setWidgetPlistRepresentable:forKey:error:", localizationTable, CFSTR("_localizationTable"), &obj);
  objc_storeStrong(v12, obj);
  v13 = (id *)(v24 + 5);
  v10 = (void *)v24[5];
  if (v10
    || (customLocalizationTable = self->_customLocalizationTable,
        v17 = 0,
        objc_msgSend(v7, "intents_setWidgetPlistRepresentable:forKey:error:", customLocalizationTable, CFSTR("_customLocalizationTable"), &v17), objc_storeStrong(v13, v17), (v10 = (void *)v24[5]) != 0))
  {
LABEL_4:
    v15 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v10);
  }
  else
  {
    v15 = v7;
  }

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v15;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_className, "hash");
  return -[NSString hash](self->_typeName, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  INCodableDescription *v4;
  INCodableDescription *v5;
  NSString *className;
  NSString *typeName;
  BOOL v8;

  v4 = (INCodableDescription *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      className = self->_className;
      v8 = 0;
      if (className == v5->_className || -[NSString isEqual:](className, "isEqual:"))
      {
        typeName = self->_typeName;
        if (typeName == v5->_typeName || -[NSString isEqual:](typeName, "isEqual:"))
          v8 = 1;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)attributeByKeyPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v4 = a3;
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableDescription attributeByName:](self, "attributeByName:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v6, "count") < 2)
    {
      v12 = v8;
      v9 = (uint64_t)v4;
    }
    else
    {
      objc_msgSend(v6, "removeObjectAtIndex:", 0);
      objc_msgSend(v6, "componentsJoinedByString:", CFSTR("."));
      v9 = objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = v8;
        if (v10)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v11 = v10;
          else
            v11 = 0;
        }
        else
        {
          v11 = 0;
        }
        v15 = v11;

        objc_msgSend(v15, "codableDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_20;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = v8;
        if (v13)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v14 = v13;
          else
            v14 = 0;
        }
        else
        {
          v14 = 0;
        }
        v17 = v14;

        +[INSchema systemSchema](INSchema, "systemSchema");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "_types");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "typeName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        INIntentDefinitionNamespacedName((uint64_t)CFSTR("System"), v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", v21);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          v12 = 0;
          goto LABEL_21;
        }
LABEL_20:
        objc_msgSend(v16, "attributeByKeyPath:", v9);
        v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:

        goto LABEL_22;
      }
      v12 = 0;
    }
LABEL_22:

    v4 = (id)v9;
    goto LABEL_23;
  }
  v12 = 0;
LABEL_23:

  return v12;
}

- (unint64_t)highestAttributeTag
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[INCodableDescription attributes](self, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_79);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  return v6;
}

- (NSArray)referencedCodableEnums
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[INCodableDescription attributes](self, "attributes", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(id *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (v10)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v11 = v10;
          else
            v11 = 0;
        }
        else
        {
          v11 = 0;
        }
        v12 = v11;

        objc_msgSend(v12, "codableEnum");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "if_addObjectIfNonNil:", v13);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  v14 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v14;
}

- (NSString)localizationBundleIdentifier
{
  void *v2;
  void *v3;

  -[INCodableDescription _localizationTable](self, "_localizationTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (INCodableLocalizationTable)_localizationTable
{
  return self->_localizationTable;
}

- (INCodableLocalizationTable)_customLocalizationTable
{
  return self->_customLocalizationTable;
}

- (void)_setCustomLocalizationTable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)mainBundleIdentifier
{
  return self->_mainBundleIdentifier;
}

- (NSString)intentDefinitionNamespace
{
  return self->_intentDefinitionNamespace;
}

- (void)setTypeName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setDisplayOrderedAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)semanticRoot
{
  return self->_semanticRoot;
}

uint64_t __43__INCodableDescription_highestAttributeTag__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __74__INCodableDescription_widgetPlistableRepresentationWithParameters_error___block_invoke(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id obj;

  v7 = a2;
  v8 = a1[4];
  v9 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v9 + 40);
  v10 = a3;
  objc_msgSend(v10, "widgetPlistableRepresentationWithParameters:error:", v8, &obj);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v9 + 40), obj);
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  v13 = objc_msgSend(v10, "_attributeType");
  objc_msgSend(v12, "intents_setIntegerIfNonZero:forKey:", v13, CFSTR("_type"));
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    *a4 = 1;
  }
  else if (v12)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "intents_setPlistSafeObject:forKey:", v12, v7);
  }

}

void __62__INCodableDescription_dictionaryRepresentationWithLocalizer___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = a3;
  v6 = v5;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    objc_msgSend(v5, "_attributeDisplayPriorityKey");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  objc_msgSend(*(id *)(a1 + 32), "_ignoredAttributeTags");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v15);

  if ((v11 & 1) == 0)
  {
    objc_msgSend(v6, "dictionaryRepresentationWithLocalizer:", *(_QWORD *)(a1 + 40));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    objc_msgSend(v6, "_attributeTagKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v15, v14);

    objc_msgSend(*(id *)(a1 + 48), "addObject:", v13);
  }

}

uint64_t __62__INCodableDescription_dictionaryRepresentationWithLocalizer___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v6 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "compare:", v8);
  return v9;
}

+ (id)_codableDescriptionForTypedObject:(id)a3 inDictionary:(id)a4
{
  id v5;
  id v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v28;
  id v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v6;
  if (v9)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v28 = v9;
    objc_msgSend(v9, "attributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allValues");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v32;
      v29 = v6;
      v30 = v12;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v32 != v15)
            objc_enumerationMutation(v12);
          v17 = *(id *)(*((_QWORD *)&v31 + 1) + 8 * v16);
          if (v17)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v17, "propertyName");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "valueForKey:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              if (v19)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v19, "firstObject");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  +[INCodableDescription _codableDescriptionForTypedObject:inDictionary:](INCodableDescription, "_codableDescriptionForTypedObject:inDictionary:", v20, v10);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();

                }
                else
                {
                  +[INCodableDescription _codableDescriptionForTypedObject:inDictionary:](INCodableDescription, "_codableDescriptionForTypedObject:inDictionary:", v19, v10);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                }
                objc_msgSend(v21, "typeName");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "objectTypeName");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                if (v21 && (objc_msgSend(v22, "isEqualToString:", v23) & 1) == 0)
                {
                  objc_msgSend(v17, "setCodableDescription:", v21);
                  objc_msgSend(v21, "typeName");
                  v24 = v5;
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "setObjectTypeName:", v25);

                  v5 = v24;
                  v10 = v29;
                }

                v12 = v30;
              }
            }
          }

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v14);
    }

    v9 = v28;
    v26 = v28;
  }

  return v9;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  id *v10;
  id v11;
  void *v12;
  _QWORD *v13;
  id *v14;
  uint64_t v15;
  void *v16;
  id *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  id obj;
  _QWORD v43[4];
  id *v44;
  id v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init((Class)a1);
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__12107;
  v51 = __Block_byref_object_dispose__12108;
  v52 = 0;
  objc_msgSend(v6, "intents_safeObjectForKey:ofType:", CFSTR("attributes"), objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "count"))
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __68__INCodableDescription_makeFromWidgetPlistableRepresentation_error___block_invoke;
  v43[3] = &unk_1E228AE98;
  v46 = &v47;
  v10 = v7;
  v44 = v10;
  v11 = v9;
  v45 = v11;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v43);
  v12 = (void *)v48[5];
  if (v12)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v12);
  }
  else
  {
    objc_storeStrong(v10 + 10, v9);
  }

  if (v12)
  {
    v13 = 0;
  }
  else
  {
LABEL_8:
    v14 = (id *)(v48 + 5);
    obj = (id)v48[5];
    +[NSObject intents_widgetPlistRepresentableInDict:key:error:](INCodableLocalizationTable, "intents_widgetPlistRepresentableInDict:key:error:", v6, CFSTR("_localizationTable"), &obj);
    v15 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v14, obj);
    v16 = (void *)v7[3];
    v7[3] = v15;

    v17 = (id *)(v48 + 5);
    v41 = (id)v48[5];
    +[NSObject intents_widgetPlistRepresentableInDict:key:error:](INCodableLocalizationTable, "intents_widgetPlistRepresentableInDict:key:error:", v6, CFSTR("_customLocalizationTable"), &v41);
    v18 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v17, v41);
    v19 = (void *)v7[4];
    v7[4] = v18;

    objc_msgSend(v6, "intents_stringForKey:", CFSTR("className"));
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v7[8];
    v7[8] = v20;

    objc_msgSend(v6, "intents_stringForKey:", CFSTR("typeName"));
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v7[9];
    v7[9] = v22;

    objc_msgSend(v6, "intents_stringForKey:", CFSTR("intentDefinitionNamespace"));
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v7[7];
    v7[7] = v24;

    objc_msgSend(v6, "intents_stringForKey:", CFSTR("semanticRoot"));
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v7[12];
    v7[12] = v26;

    objc_msgSend(v6, "intents_stringForKey:", CFSTR("mainBundleIdentifier"));
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)v7[5];
    v7[5] = v28;

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend(v7, "attributes", 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "allValues");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
    if (v32)
    {
      v33 = *(_QWORD *)v38;
      do
      {
        v34 = 0;
        do
        {
          if (*(_QWORD *)v38 != v33)
            objc_enumerationMutation(v31);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v34), "relationship");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "_establishRelationship");

          ++v34;
        }
        while (v32 != v34);
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
      }
      while (v32);
    }

    objc_msgSend(v7, "_updateAttributesByName");
    v13 = v7;
  }

  _Block_object_dispose(&v47, 8);
  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __68__INCodableDescription_makeFromWidgetPlistableRepresentation_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id obj;

  v7 = a2;
  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;
      v10 = INCodableAttributeClassFromType(objc_msgSend(v9, "intents_intForKey:", CFSTR("_type")));
      if (v10)
      {
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        obj = *(id *)(v11 + 40);
        objc_msgSend(v10, "makeFromWidgetPlistableRepresentation:error:", v9, &obj);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong((id *)(v11 + 40), obj);
        if (v12)
        {
          objc_msgSend(v12, "_setCodableDescription:", *(_QWORD *)(a1 + 32));
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v12, v7);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to decode attribute from encoded: %@"), v9);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          INIntentError(8001, v17, 0);
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v20 = *(void **)(v19 + 40);
          *(_QWORD *)(v19 + 40) = v18;

          *a4 = 1;
        }

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to resolve attribute class from encoded: %@"), v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        INIntentError(8001, v13, 0);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v16 = *(void **)(v15 + 40);
        *(_QWORD *)(v15 + 40) = v14;

        *a4 = 1;
      }

    }
  }

}

+ (id)__INIntentCodablePhrasePronunciationHintIDKey
{
  return CFSTR("INIntentPhrasePronunciationHintID");
}

+ (id)__INIntentCodablePhrasePronunciationHintKey
{
  return CFSTR("INIntentPhrasePronunciationHint");
}

+ (id)__INIntentCodablePhrasePhraseIDKey
{
  return CFSTR("INIntentPhrasePhraseID");
}

+ (id)__INIntentCodablePhrasePhraseKey
{
  return CFSTR("INIntentPhrasePhrase");
}

+ (id)__INCodableObjectAttributeKey
{
  return CFSTR("INIntentParameter");
}

+ (id)__INCodableScalarAttributeKey
{
  return CFSTR("INIntentParameter");
}

+ (id)__INCodableAttributeArraySizeSizeClassKey
{
  return CFSTR("INIntentParameterArraySizeSizeClass");
}

+ (id)__INCodableAttributeArraySizeSizeKey
{
  return CFSTR("INIntentParameterArraySizeSize");
}

+ (id)__INCodableTimeIntervalAttributeMetadataUnitKey
{
  return CFSTR("INIntentParameterMetadataUnit");
}

+ (id)__INCodableTimeIntervalAttributeMetadataMinimumValueKey
{
  return CFSTR("INIntentParameterMetadataMinimumValue");
}

+ (id)__INCodableTimeIntervalAttributeMetadataMinimumUnitKey
{
  return CFSTR("INIntentParameterMetadataMinimumUnit");
}

+ (id)__INCodableTimeIntervalAttributeMetadataMaximumValueKey
{
  return CFSTR("INIntentParameterMetadataMaximumValue");
}

+ (id)__INCodableTimeIntervalAttributeMetadataMaximumUnitKey
{
  return CFSTR("INIntentParameterMetadataMaximumUnit");
}

+ (id)__INCodableTimeIntervalAttributeMetadataDefaultValueKey
{
  return CFSTR("INIntentParameterMetadataDefaultValue");
}

+ (id)__INCodableTimeIntervalAttributeMetadataDefaultUnitKey
{
  return CFSTR("INIntentParameterMetadataDefaultUnit");
}

+ (id)__INCodableCurrencyAmountAttributeMetadataCurrencyCodeKey
{
  return CFSTR("INIntentParameterMetadataCurrencyCode");
}

+ (id)__INCodableEnumAttributeMetadataKey
{
  return CFSTR("INIntentParameterMetadata");
}

+ (id)__INCodableMeasurementAttributeMetadataUnitKey
{
  return CFSTR("INIntentParameterMetadataUnit");
}

+ (id)__INCodableMeasurementAttributeMetadataSupportsNegativeNumbersKey
{
  return CFSTR("INIntentParameterMetadataSupportsNegativeNumbers");
}

+ (id)__INCodableMeasurementAttributeMetadataDefaultValueKey
{
  return CFSTR("INIntentParameterMetadataDefaultValue");
}

+ (id)__INCodableMeasurementAttributeMetadataDefaultUnitKey
{
  return CFSTR("INIntentParameterMetadataDefaultUnit");
}

+ (id)__INCodablePlacemarkAttributeMetadataKey
{
  return CFSTR("INIntentParameterMetadata");
}

+ (id)__INCodablePersonAttributeMetadataKey
{
  return CFSTR("INIntentParameterMetadata");
}

+ (id)__INCodableDateComponentsAttributeMetadataTypeKey
{
  return CFSTR("INIntentParameterMetadataType");
}

+ (id)__INCodableDateComponentsAttributeMetadataTimeStyleKey
{
  return CFSTR("INIntentParameterMetadataTimeStyle");
}

+ (id)__INCodableDateComponentsAttributeMetadataTemplateIDKey
{
  return CFSTR("INIntentParameterMetadataTemplateID");
}

+ (id)__INCodableDateComponentsAttributeMetadataTemplateKey
{
  return CFSTR("INIntentParameterMetadataTemplate");
}

+ (id)__INCodableDateComponentsAttributeMetadataFormatKey
{
  return CFSTR("INIntentParameterMetadataFormat");
}

+ (id)__INCodableDateComponentsAttributeMetadataDateStyleKey
{
  return CFSTR("INIntentParameterMetadataDateStyle");
}

+ (id)__INCodableNumberAttributeMetadataSupportsNegativeNumbersKey
{
  return CFSTR("INIntentParameterMetadataSupportsNegativeNumbers");
}

+ (id)__INIntentResponseCodableCodeFormatStringLanguageCodeKey
{
  return CFSTR("INIntentResponseCodeFormatStringLanguageCode");
}

+ (id)__INIntentResponseCodableCodeFormatStringDictionaryLanguageCodeKey
{
  return CFSTR("INIntentResponseCodeFormatStringDictionaryLanguageCode");
}

+ (id)__INIntentResponseCodableCodeFormatStringDictionaryKey
{
  return CFSTR("INIntentResponseCodeFormatStringDictionary");
}

+ (id)__INIntentResponseCodableCodeConciseFormatStringLanguageCodeKey
{
  return CFSTR("INIntentResponseCodeConciseFormatStringLanguageCode");
}

+ (id)__INIntentResponseCodableCodeConciseFormatStringDictionaryLanguageCodeKey
{
  return CFSTR("INIntentResponseCodeConciseFormatStringDictionaryLanguageCode");
}

+ (id)__INIntentResponseCodableCodeConciseFormatStringDictionaryKey
{
  return CFSTR("INIntentResponseCodeConciseFormatStringDictionary");
}

+ (id)__INCodableAttributePromptDialogKey
{
  return CFSTR("INIntentParameterPromptDialog");
}

+ (id)__INCodableAttributeRelationshipPredicateValuesKey
{
  return CFSTR("INIntentParameterRelationshipPredicateValues");
}

+ (id)__INCodableAttributeRelationshipPredicateValueKey
{
  return CFSTR("INIntentParameterRelationshipPredicateValue");
}

+ (id)__INCodableAttributeRelationshipPredicateNameKey
{
  return CFSTR("INIntentParameterRelationshipPredicateName");
}

+ (id)__INCodableAttributeRelationshipParentNameKey
{
  return CFSTR("INIntentParameterRelationshipParentName");
}

+ (id)__INCodableURLAttributeMetadataDefaultValueKey
{
  return CFSTR("INIntentParameterMetadataDefaultValue");
}

+ (id)__INCodableURLAttributeMetadataKey
{
  return CFSTR("INIntentParameterMetadata");
}

@end
