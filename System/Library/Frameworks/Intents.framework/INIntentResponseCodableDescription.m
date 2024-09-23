@implementation INIntentResponseCodableDescription

- (void)updateWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  INIntentResponseCodableCode *v16;
  void *v17;
  int v18;
  INIntentResponseCodableCode *v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)INIntentResponseCodableDescription;
  -[INCodableDescription updateWithDictionary:](&v29, sel_updateWithDictionary_, v4);
  objc_msgSend((id)objc_opt_class(), "__OutputKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponseCodableDescription _setOutputAttributeName:](self, "_setOutputAttributeName:", v6);

  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend((id)objc_opt_class(), "__CodesKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v4;
  objc_msgSend(v4, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v9;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    v13 = 100;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        v16 = objc_alloc_init(INIntentResponseCodableCode);
        -[INIntentResponseCodableCode _setCodableDescription:](v16, "_setCodableDescription:", self);
        -[INIntentResponseCodableCode updateWithDictionary:](v16, "updateWithDictionary:", v15);
        -[INIntentResponseCodableCode name](v16, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("failure"));

        v19 = v16;
        if (v18)
        {
          v20 = 5;
LABEL_10:
          -[INIntentResponseCodableCode setValue:](v19, "setValue:", v20);
          goto LABEL_12;
        }
        -[INIntentResponseCodableCode name](v16, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("success"));

        v19 = v16;
        if (v22)
        {
          v20 = 4;
          goto LABEL_10;
        }
        -[INIntentResponseCodableCode setValue:](v16, "setValue:", v13++);
LABEL_12:
        objc_msgSend(v7, "addObject:", v16);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v11);
  }

  -[INIntentResponseCodableDescription setResponseCodes:](self, "setResponseCodes:", v7);
}

+ (id)__INCodableObjectAttributeTypeKey
{
  return CFSTR("INIntentResponseParameterType");
}

- (void)setResponseCodes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void)_setOutputAttributeName:(id)a3
{
  objc_storeStrong((id *)&self->_outputAttributeName, a3);
}

- (id)_attributesKey
{
  return (id)objc_msgSend((id)objc_opt_class(), "__ParametersKey");
}

+ (id)__ParametersKey
{
  return CFSTR("INIntentResponseParameters");
}

+ (id)__OutputKey
{
  return CFSTR("INIntentResponseOutput");
}

+ (id)__NameKey
{
  return CFSTR("INIntentResponseName");
}

+ (id)__CodesKey
{
  return CFSTR("INIntentResponseCodes");
}

- (id)_attributeKey
{
  return (id)objc_msgSend((id)objc_opt_class(), "__ParameterKey");
}

+ (id)__ParameterKey
{
  return CFSTR("INIntentResponseParameter");
}

+ (id)__INCodableAttributeWindowSizeKey
{
  return CFSTR("INIntentResponseParameterWindowSize");
}

+ (id)__INCodableAttributeUnsupportedReasonsKey
{
  return CFSTR("INIntentResponseParameterUnsupportedReasons");
}

+ (id)__INCodableAttributeTagKey
{
  return CFSTR("INIntentResponseParameterTag");
}

+ (id)__INCodableAttributeSupportsSearchKey
{
  return CFSTR("INIntentResponseParameterSupportsSearch");
}

+ (id)__INCodableAttributeSupportsResolutionKey
{
  return CFSTR("INIntentResponseParameterSupportsResolution");
}

+ (id)__INCodableAttributeSupportsMultipleValuesKey
{
  return CFSTR("INIntentResponseParameterSupportsMultipleValues");
}

+ (id)__INCodableAttributeSupportsDynamicEnumerationKey
{
  return CFSTR("INIntentResponseParameterSupportsDynamicEnumeration");
}

+ (id)__INCodableAttributeRelationshipKey
{
  return CFSTR("INIntentResponseParameterRelationship");
}

+ (id)__INCodableAttributePromptDialogsKey
{
  return CFSTR("INIntentResponseParameterPromptDialogs");
}

+ (id)__INCodableAttributeNameKey
{
  return CFSTR("INIntentResponseParameterName");
}

+ (id)__INCodableAttributeMetadataKey
{
  return CFSTR("INIntentResponseParameterMetadata");
}

+ (id)__INCodableAttributeFixedSizeArrayKey
{
  return CFSTR("INIntentResponseParameterFixedSizeArray");
}

+ (id)__INCodableAttributeEntityKeypathKey
{
  return CFSTR("INIntentResponseParameterEntityKeypath");
}

+ (id)__INCodableAttributeDisplayPriorityKey
{
  return CFSTR("INIntentResponseParameterDisplayPriority");
}

+ (id)__INCodableAttributeDisplayNameIDKey
{
  return CFSTR("INIntentResponseParameterDisplayNameID");
}

+ (id)__INCodableAttributeDisplayNameKey
{
  return CFSTR("INIntentResponseParameterDisplayName");
}

+ (id)__INCodableAttributeDefaultKey
{
  return CFSTR("INIntentResponseParameterDefault");
}

+ (id)__INCodableAttributeConfigurableKey
{
  return CFSTR("INIntentResponseParameterConfigurable");
}

+ (id)__INCodableAttributeArraySizesKey
{
  return CFSTR("INIntentResponseParameterArraySizes");
}

+ (id)__INCodableAttributeEnumTypeKey
{
  return CFSTR("INIntentResponseParameterEnumType");
}

+ (id)__INCodableCustomObjectAttributeObjectTypeNamespaceKey
{
  return CFSTR("INIntentResponseParameterObjectTypeNamespace");
}

+ (id)__INCodableCustomObjectAttributeObjectTypeKey
{
  return CFSTR("INIntentResponseParameterObjectType");
}

+ (id)__INCodableAttributeMetadataPlaceholderIDKey
{
  return CFSTR("INIntentResponseParameterMetadataPlaceholderID");
}

+ (id)__INCodableAttributeMetadataPlaceholderKey
{
  return CFSTR("INIntentResponseParameterMetadataPlaceholder");
}

+ (id)__INCodableScalarAttributeTypeKey
{
  return CFSTR("INIntentResponseParameterType");
}

+ (id)__INCodableStringAttributeMetadataMultilineKey
{
  return CFSTR("INIntentResponseParameterMetadataMultiline");
}

+ (id)__INCodableStringAttributeMetadataDisableSmartQuotesKey
{
  return CFSTR("INIntentResponseParameterMetadataDisableSmartQuotes");
}

+ (id)__INCodableStringAttributeMetadataDisableSmartDashesKey
{
  return CFSTR("INIntentResponseParameterMetadataDisableSmartDashes");
}

+ (id)__INCodableStringAttributeMetadataDisableAutocorrectKey
{
  return CFSTR("INIntentResponseParameterMetadataDisableAutocorrect");
}

+ (id)__INCodableStringAttributeMetadataDefaultValueIDKey
{
  return CFSTR("INIntentResponseParameterMetadataDefaultValueID");
}

+ (id)__INCodableStringAttributeMetadataDefaultValueKey
{
  return CFSTR("INIntentResponseParameterMetadataDefaultValue");
}

+ (id)__INCodableStringAttributeMetadataCapitalizationKey
{
  return CFSTR("INIntentResponseParameterMetadataCapitalization");
}

+ (id)__INCodableEnumAttributeEnumTypeKey
{
  return CFSTR("INIntentResponseParameterEnumType");
}

+ (id)__INCodableEnumAttributeMetadataDefaultValueKey
{
  return CFSTR("INIntentResponseParameterMetadataDefaultValue");
}

+ (id)__INCodableAttributeTypeKey
{
  return CFSTR("INIntentResponseParameterType");
}

- (id)attributes
{
  void *v3;
  void *v4;
  void *v5;
  INCodableScalarAttribute *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)INIntentResponseCodableDescription;
  -[INCodableDescription attributes](&v9, sel_attributes);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", &unk_1E23E9A00);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = (void *)objc_msgSend(v3, "mutableCopy");
    v6 = objc_alloc_init(INCodableScalarAttribute);
    -[INCodableAttribute setModifier:](v6, "setModifier:", 1);
    -[INCodableAttribute setPropertyName:](v6, "setPropertyName:", CFSTR("_code"));
    -[INCodableScalarAttribute setType:](v6, "setType:", 2);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, &unk_1E23E9A00);

    v7 = objc_msgSend(v5, "copy");
    -[INCodableDescription setAttributes:](self, "setAttributes:", v7);

    v3 = (void *)v7;
  }
  return v3;
}

+ (id)__INCodableBooleanAttributeMetadataTrueDisplayNameIDKey
{
  return CFSTR("INIntentResponseParameterMetadataTrueDisplayNameID");
}

+ (id)__INCodableBooleanAttributeMetadataTrueDisplayNameKey
{
  return CFSTR("INIntentResponseParameterMetadataTrueDisplayName");
}

+ (id)__INCodableBooleanAttributeMetadataFalseDisplayNameIDKey
{
  return CFSTR("INIntentResponseParameterMetadataFalseDisplayNameID");
}

+ (id)__INCodableBooleanAttributeMetadataFalseDisplayNameKey
{
  return CFSTR("INIntentResponseParameterMetadataFalseDisplayName");
}

+ (id)__INCodableBooleanAttributeMetadataDefaultValueKey
{
  return CFSTR("INIntentResponseParameterMetadataDefaultValue");
}

+ (id)__INCodableEnumAttributeEnumTypeNamespaceKey
{
  return CFSTR("INIntentResponseParameterEnumTypeNamespace");
}

+ (id)__INCodableMeasurementAttributeMetadataUnitKey
{
  return CFSTR("INIntentResponseParameterMetadataUnit");
}

+ (id)__INCodableMeasurementAttributeMetadataSupportsNegativeNumbersKey
{
  return CFSTR("INIntentResponseParameterMetadataSupportsNegativeNumbers");
}

+ (id)__INCodableMeasurementAttributeMetadataDefaultValueKey
{
  return CFSTR("INIntentResponseParameterMetadataDefaultValue");
}

+ (id)__INCodableMeasurementAttributeMetadataDefaultUnitKey
{
  return CFSTR("INIntentResponseParameterMetadataDefaultUnit");
}

+ (id)__INCodableNumberAttributeMetadataMinimumValueKey
{
  return CFSTR("INIntentResponseParameterMetadataMinimumValue");
}

+ (id)__INCodableNumberAttributeMetadataMaximumValueKey
{
  return CFSTR("INIntentResponseParameterMetadataMaximumValue");
}

+ (id)__INCodableTimeIntervalAttributeMetadataMinimumValueKey
{
  return CFSTR("INIntentResponseParameterMetadataMinimumValue");
}

+ (id)__INCodableTimeIntervalAttributeMetadataMaximumValueKey
{
  return CFSTR("INIntentResponseParameterMetadataMaximumValue");
}

+ (id)__INCodableNumberAttributeMetadataTypeKey
{
  return CFSTR("INIntentResponseParameterMetadataType");
}

+ (id)__INCodableNumberAttributeMetadataDefaultValueKey
{
  return CFSTR("INIntentResponseParameterMetadataDefaultValue");
}

+ (id)__INCodableTimeIntervalAttributeMetadataUnitKey
{
  return CFSTR("INIntentResponseParameterMetadataUnit");
}

+ (id)__INCodableTimeIntervalAttributeMetadataDefaultValueKey
{
  return CFSTR("INIntentResponseParameterMetadataDefaultValue");
}

+ (id)__INCodableCurrencyAmountAttributeMetadataCurrencyCodesKey
{
  return CFSTR("INIntentResponseParameterMetadataCurrencyCodes");
}

+ (id)__INCodableAttributeUnsupportedReasonCodeKey
{
  return CFSTR("INIntentResponseParameterUnsupportedReasonCode");
}

+ (id)__INCodableAttributeUnsupportedReasonKey
{
  return CFSTR("INIntentResponseParameterUnsupportedReason");
}

+ (id)__INCodableFileAttributeMetadataTypeKey
{
  return CFSTR("INIntentResponseParameterMetadataType");
}

+ (id)__INCodableFileAttributeMetadataCustomUTIsKey
{
  return CFSTR("INIntentResponseParameterMetadataCustomUTIs");
}

+ (id)__Key
{
  return CFSTR("INIntentResponse");
}

- (int64_t)codableDescriptionType
{
  return 5;
}

- (id)intentResponseCodeWithCode:(int64_t)a3
{
  NSMutableDictionary *intentResponseCodableCodes;
  NSMutableDictionary *v5;
  NSMutableDictionary *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  void *v16;
  int64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  intentResponseCodableCodes = self->_intentResponseCodableCodes;
  if (!intentResponseCodableCodes)
  {
    v18 = a3;
    v5 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSArray count](self->_responseCodes, "count"));
    v6 = self->_intentResponseCodableCodes;
    self->_intentResponseCodableCodes = v5;

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = self->_responseCodes;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          v13 = self->_intentResponseCodableCodes;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v12, "value"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v12, v14);

        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v9);
    }

    intentResponseCodableCodes = self->_intentResponseCodableCodes;
    a3 = v18;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](intentResponseCodableCodes, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (INCodableAttribute)outputAttribute
{
  void *v3;
  void *v4;
  void *v5;

  -[INIntentResponseCodableDescription _outputAttributeName](self, "_outputAttributeName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[INIntentResponseCodableDescription _outputAttributeName](self, "_outputAttributeName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableDescription attributeByName:](self, "attributeByName:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (INCodableAttribute *)v5;
}

- (id)_ignoredAttributeTags
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", &unk_1E23E9A00);
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[2];
  _QWORD v29[2];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DE8];
  -[INIntentResponseCodableDescription responseCodes](self, "responseCodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[INIntentResponseCodableDescription responseCodes](self, "responseCodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "dictionaryRepresentationWithLocalizer:", v4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v10);
  }

  v23.receiver = self;
  v23.super_class = (Class)INIntentResponseCodableDescription;
  -[INCodableDescription dictionaryRepresentationWithLocalizer:](&v23, sel_dictionaryRepresentationWithLocalizer_, v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__OutputKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v15;
  -[INIntentResponseCodableDescription _outputAttributeName](self, "_outputAttributeName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[0] = v17;
  objc_msgSend((id)objc_opt_class(), "__CodesKey");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v18;
  v29[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "if_dictionaryByAddingEntriesFromDictionary:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  objc_msgSend(v20, "if_dictionaryWithNonEmptyValues");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v13;
  objc_super v14;
  id v15;

  v14.receiver = self;
  v14.super_class = (Class)INIntentResponseCodableDescription;
  v15 = 0;
  -[INRootCodableDescription widgetPlistableRepresentationWithParameters:error:](&v14, sel_widgetPlistableRepresentationWithParameters_error_, a3, &v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v15;
  if (!v7)
  {
    -[INIntentResponseCodableDescription responseCodes](self, "responseCodes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    objc_msgSend(v6, "intents_setArrayOfWidgetPlistRepresentable:forKey:error:", v10, CFSTR("responseCodes"), &v13);
    v8 = v13;

    if (!v8)
    {
      -[INIntentResponseCodableDescription _outputAttributeName](self, "_outputAttributeName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", v11, CFSTR("_outputAttributeName"));

      v9 = v6;
      goto LABEL_8;
    }
    if (a4)
      goto LABEL_3;
LABEL_6:
    v9 = 0;
    goto LABEL_8;
  }
  v8 = v7;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  v8 = objc_retainAutorelease(v8);
  v9 = 0;
  *a4 = v8;
LABEL_8:

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)INIntentResponseCodableDescription;
  v4 = a3;
  -[INRootCodableDescription encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[INIntentResponseCodableDescription responseCodes](self, "responseCodes", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("responseCodes"));

  -[INIntentResponseCodableDescription _outputAttributeName](self, "_outputAttributeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("_outputAttributeName"));

}

- (INIntentResponseCodableDescription)initWithCoder:(id)a3
{
  id v4;
  INIntentResponseCodableDescription *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)INIntentResponseCodableDescription;
  v5 = -[INRootCodableDescription initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("responseCodes"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[INIntentResponseCodableDescription setResponseCodes:](v5, "setResponseCodes:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_outputAttributeName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[INIntentResponseCodableDescription _setOutputAttributeName:](v5, "_setOutputAttributeName:", v10);

  }
  return v5;
}

- (NSString)_outputAttributeName
{
  return self->_outputAttributeName;
}

- (NSArray)responseCodes
{
  return self->_responseCodes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseCodes, 0);
  objc_storeStrong((id *)&self->_outputAttributeName, 0);
  objc_storeStrong((id *)&self->_intentResponseCodableCodes, 0);
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v14;
  objc_super v15;
  id v16;

  v6 = a3;
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___INIntentResponseCodableDescription;
  v16 = 0;
  objc_msgSendSuper2(&v15, sel_makeFromWidgetPlistableRepresentation_error_, v6, &v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v16;
  if (!v8)
  {
    v14 = 0;
    +[NSObject intents_arrayOfWidgetPlistRepresentableInDict:key:error:resultTransformer:](INIntentResponseCodableCode, "intents_arrayOfWidgetPlistRepresentableInDict:key:error:resultTransformer:", v6, CFSTR("responseCodes"), &v14, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v14;
    objc_msgSend(v7, "setResponseCodes:", v11);

    if (!v9)
    {
      objc_msgSend(v6, "intents_stringForKey:", CFSTR("_outputAttributeName"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_setOutputAttributeName:", v12);

      v10 = v7;
      goto LABEL_8;
    }
    if (a4)
      goto LABEL_3;
LABEL_6:
    v10 = 0;
    goto LABEL_8;
  }
  v9 = v8;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  v9 = objc_retainAutorelease(v9);
  v10 = 0;
  *a4 = v9;
LABEL_8:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)__INCodableObjectAttributeKey
{
  return CFSTR("INIntentResponseParameter");
}

+ (id)__INCodableScalarAttributeKey
{
  return CFSTR("INIntentResponseParameter");
}

+ (id)__INCodableAttributeArraySizeSizeClassKey
{
  return CFSTR("INIntentResponseParameterArraySizeSizeClass");
}

+ (id)__INCodableAttributeArraySizeSizeKey
{
  return CFSTR("INIntentResponseParameterArraySizeSize");
}

+ (id)__INCodableTimeIntervalAttributeMetadataMinimumUnitKey
{
  return CFSTR("INIntentResponseParameterMetadataMinimumUnit");
}

+ (id)__INCodableTimeIntervalAttributeMetadataMaximumUnitKey
{
  return CFSTR("INIntentResponseParameterMetadataMaximumUnit");
}

+ (id)__INCodableTimeIntervalAttributeMetadataDefaultUnitKey
{
  return CFSTR("INIntentResponseParameterMetadataDefaultUnit");
}

+ (id)__INCodableCurrencyAmountAttributeMetadataCurrencyCodeKey
{
  return CFSTR("INIntentResponseParameterMetadataCurrencyCode");
}

+ (id)__INCodableEnumAttributeMetadataKey
{
  return CFSTR("INIntentResponseParameterMetadata");
}

+ (id)__INCodablePlacemarkAttributeMetadataTypeKey
{
  return CFSTR("INIntentResponseParameterMetadataType");
}

+ (id)__INCodablePlacemarkAttributeMetadataKey
{
  return CFSTR("INIntentResponseParameterMetadata");
}

+ (id)__INCodablePersonAttributeMetadataTypeKey
{
  return CFSTR("INIntentResponseParameterMetadataType");
}

+ (id)__INCodablePersonAttributeMetadataKey
{
  return CFSTR("INIntentResponseParameterMetadata");
}

+ (id)__INCodableDateComponentsAttributeMetadataTypeKey
{
  return CFSTR("INIntentResponseParameterMetadataType");
}

+ (id)__INCodableDateComponentsAttributeMetadataTimeStyleKey
{
  return CFSTR("INIntentResponseParameterMetadataTimeStyle");
}

+ (id)__INCodableDateComponentsAttributeMetadataTemplateIDKey
{
  return CFSTR("INIntentResponseParameterMetadataTemplateID");
}

+ (id)__INCodableDateComponentsAttributeMetadataTemplateKey
{
  return CFSTR("INIntentResponseParameterMetadataTemplate");
}

+ (id)__INCodableDateComponentsAttributeMetadataFormatKey
{
  return CFSTR("INIntentResponseParameterMetadataFormat");
}

+ (id)__INCodableDateComponentsAttributeMetadataDateStyleKey
{
  return CFSTR("INIntentResponseParameterMetadataDateStyle");
}

+ (id)__INCodableNumberAttributeMetadataSupportsNegativeNumbersKey
{
  return CFSTR("INIntentResponseParameterMetadataSupportsNegativeNumbers");
}

+ (id)__INCodableAttributePromptDialogTypeKey
{
  return CFSTR("INIntentResponseParameterPromptDialogType");
}

+ (id)__INCodableAttributePromptDialogKey
{
  return CFSTR("INIntentResponseParameterPromptDialog");
}

+ (id)__INCodableAttributeRelationshipPredicateValuesKey
{
  return CFSTR("INIntentResponseParameterRelationshipPredicateValues");
}

+ (id)__INCodableAttributeRelationshipPredicateValueKey
{
  return CFSTR("INIntentResponseParameterRelationshipPredicateValue");
}

+ (id)__INCodableAttributeRelationshipPredicateNameKey
{
  return CFSTR("INIntentResponseParameterRelationshipPredicateName");
}

+ (id)__INCodableAttributeRelationshipParentNameKey
{
  return CFSTR("INIntentResponseParameterRelationshipParentName");
}

+ (id)__INCodableURLAttributeMetadataDefaultValueKey
{
  return CFSTR("INIntentResponseParameterMetadataDefaultValue");
}

+ (id)__INCodableURLAttributeMetadataKey
{
  return CFSTR("INIntentResponseParameterMetadata");
}

@end
