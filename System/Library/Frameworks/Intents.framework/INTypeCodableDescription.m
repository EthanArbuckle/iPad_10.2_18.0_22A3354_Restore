@implementation INTypeCodableDescription

+ (id)__INCodableObjectAttributeTypeKey
{
  return CFSTR("INTypePropertyType");
}

+ (id)__INCodableAttributeNameKey
{
  return CFSTR("INTypePropertyName");
}

- (id)_attributeKey
{
  return (id)objc_msgSend((id)objc_opt_class(), "__PropertyKey");
}

+ (id)__PropertyKey
{
  return CFSTR("INTypeProperty");
}

+ (id)__INCodableAttributeWindowSizeKey
{
  return CFSTR("INTypePropertyWindowSize");
}

+ (id)__INCodableAttributeUnsupportedReasonsKey
{
  return CFSTR("INTypePropertyUnsupportedReasons");
}

+ (id)__INCodableAttributeSupportsSearchKey
{
  return CFSTR("INTypePropertySupportsSearch");
}

+ (id)__INCodableAttributeSupportsResolutionKey
{
  return CFSTR("INTypePropertySupportsResolution");
}

+ (id)__INCodableAttributeSupportsMultipleValuesKey
{
  return CFSTR("INTypePropertySupportsMultipleValues");
}

+ (id)__INCodableAttributeSupportsDynamicEnumerationKey
{
  return CFSTR("INTypePropertySupportsDynamicEnumeration");
}

+ (id)__INCodableAttributePromptDialogsKey
{
  return CFSTR("INTypePropertyPromptDialogs");
}

+ (id)__INCodableAttributeMetadataKey
{
  return CFSTR("INTypePropertyMetadata");
}

+ (id)__INCodableAttributeFixedSizeArrayKey
{
  return CFSTR("INTypePropertyFixedSizeArray");
}

+ (id)__INCodableAttributeDisplayPriorityKey
{
  return CFSTR("INTypePropertyDisplayPriority");
}

+ (id)__INCodableAttributeDisplayNameIDKey
{
  return CFSTR("INTypePropertyDisplayNameID");
}

+ (id)__INCodableAttributeDisplayNameKey
{
  return CFSTR("INTypePropertyDisplayName");
}

+ (id)__INCodableAttributeDefaultKey
{
  return CFSTR("INTypePropertyDefault");
}

+ (id)__INCodableAttributeConfigurableKey
{
  return CFSTR("INTypePropertyConfigurable");
}

+ (id)__INCodableAttributeArraySizesKey
{
  return CFSTR("INTypePropertyArraySizes");
}

+ (id)__INCodableAttributeTagKey
{
  return CFSTR("INTypePropertyTag");
}

+ (id)__INCodableAttributeRelationshipKey
{
  return CFSTR("INTypePropertyRelationship");
}

+ (id)__INCodableAttributeEntityKeypathKey
{
  return CFSTR("INTypePropertyEntityKeypath");
}

+ (id)__INCodableAttributeEnumTypeKey
{
  return CFSTR("INTypePropertyEnumType");
}

+ (id)__INCodableScalarAttributeTypeKey
{
  return CFSTR("INTypePropertyType");
}

+ (id)__INCodableAttributeMetadataPlaceholderIDKey
{
  return CFSTR("INTypePropertyMetadataPlaceholderID");
}

+ (id)__INCodableAttributeMetadataPlaceholderKey
{
  return CFSTR("INTypePropertyMetadataPlaceholder");
}

+ (id)__INCodableStringAttributeMetadataMultilineKey
{
  return CFSTR("INTypePropertyMetadataMultiline");
}

+ (id)__INCodableStringAttributeMetadataDisableSmartQuotesKey
{
  return CFSTR("INTypePropertyMetadataDisableSmartQuotes");
}

+ (id)__INCodableStringAttributeMetadataDisableSmartDashesKey
{
  return CFSTR("INTypePropertyMetadataDisableSmartDashes");
}

+ (id)__INCodableStringAttributeMetadataDisableAutocorrectKey
{
  return CFSTR("INTypePropertyMetadataDisableAutocorrect");
}

+ (id)__INCodableStringAttributeMetadataDefaultValueIDKey
{
  return CFSTR("INTypePropertyMetadataDefaultValueID");
}

+ (id)__INCodableStringAttributeMetadataDefaultValueKey
{
  return CFSTR("INTypePropertyMetadataDefaultValue");
}

+ (id)__INCodableStringAttributeMetadataCapitalizationKey
{
  return CFSTR("INTypePropertyMetadataCapitalization");
}

+ (id)__NameKey
{
  return CFSTR("INTypeName");
}

- (id)_attributesKey
{
  return (id)objc_msgSend((id)objc_opt_class(), "__PropertiesKey");
}

+ (id)__PropertiesKey
{
  return CFSTR("INTypeProperties");
}

+ (id)__INCodableEnumAttributeEnumTypeKey
{
  return CFSTR("INTypePropertyEnumType");
}

+ (id)__INCodableCustomObjectAttributeObjectTypeNamespaceKey
{
  return CFSTR("INTypePropertyObjectTypeNamespace");
}

+ (id)__INCodableCustomObjectAttributeObjectTypeKey
{
  return CFSTR("INTypePropertyObjectType");
}

+ (id)__INCodableEnumAttributeMetadataDefaultValueKey
{
  return CFSTR("INTypePropertyMetadataDefaultValue");
}

+ (id)__INCodableAttributeTypeKey
{
  return CFSTR("INTypePropertyType");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)__INCodableBooleanAttributeMetadataTrueDisplayNameIDKey
{
  return CFSTR("INTypePropertyMetadataTrueDisplayNameID");
}

+ (id)__INCodableBooleanAttributeMetadataTrueDisplayNameKey
{
  return CFSTR("INTypePropertyMetadataTrueDisplayName");
}

+ (id)__INCodableBooleanAttributeMetadataFalseDisplayNameIDKey
{
  return CFSTR("INTypePropertyMetadataFalseDisplayNameID");
}

+ (id)__INCodableBooleanAttributeMetadataFalseDisplayNameKey
{
  return CFSTR("INTypePropertyMetadataFalseDisplayName");
}

+ (id)__INCodableBooleanAttributeMetadataDefaultValueKey
{
  return CFSTR("INTypePropertyMetadataDefaultValue");
}

- (void)updateWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  INCodableScalarAttribute *v21;
  INCodableObjectAttribute *v22;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)INTypeCodableDescription;
  -[INCodableDescription updateWithDictionary:](&v23, sel_updateWithDictionary_, v4);
  objc_msgSend((id)objc_opt_class(), "__ClassNameKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    v7 = v6;
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)objc_opt_class(), "__ClassPrefixKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (const __CFString *)v10;
    else
      v12 = &stru_1E2295770;
    -[INCodableDescription typeName](self, "typeName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@%@"), v12, v13);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[INCodableDescription setClassName:](self, "setClassName:", v7);
  objc_msgSend((id)objc_opt_class(), "__DisplayNameKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[INTypeCodableDescription setDisplayName:](self, "setDisplayName:", v15);

  objc_msgSend((id)objc_opt_class(), "__DisplayNameIDKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v16);
  v17 = objc_claimAutoreleasedReturnValue();
  -[INTypeCodableDescription setDisplayNameLocID:](self, "setDisplayNameLocID:", v17);

  -[INCodableDescription _nullable_schema](self, "_nullable_schema");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v17) = objc_msgSend(v18, "isSystem");

  if ((v17 & 1) == 0)
  {
    -[INCodableDescription attributes](self, "attributes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "mutableCopy");

    v21 = -[INCodableScalarAttribute initWithPropertyName:type:]([INCodableScalarAttribute alloc], "initWithPropertyName:type:", CFSTR("subtitleString"), 7);
    -[INCodableAttribute _setCodableDescription:](v21, "_setCodableDescription:", self);
    -[INCodableAttribute setDisplayPriorityRank:](v21, "setDisplayPriorityRank:", &unk_1E23E9A30);
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, &unk_1E23E9A48);

    v22 = objc_alloc_init(INCodableObjectAttribute);
    -[INCodableAttribute _setCodableDescription:](v22, "_setCodableDescription:", self);
    -[INCodableAttribute setModifier:](v22, "setModifier:", 1);
    -[INCodableAttribute setPropertyName:](v22, "setPropertyName:", CFSTR("displayImage"));
    -[INCodableObjectAttribute setTypeName:](v22, "setTypeName:", CFSTR("Image"));
    -[INCodableAttribute setDisplayPriorityRank:](v22, "setDisplayPriorityRank:", &unk_1E23E9A30);
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, &unk_1E23E9A60);

    -[INCodableDescription setAttributes:](self, "setAttributes:", v20);
  }

}

- (void)setDisplayNameLocID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

+ (id)__DisplayNameIDKey
{
  return CFSTR("INTypeDisplayNameID");
}

+ (id)__DisplayNameKey
{
  return CFSTR("INTypeDisplayName");
}

+ (id)__ClassNameKey
{
  return CFSTR("INTypeClassName");
}

+ (id)__INCodableEnumAttributeEnumTypeNamespaceKey
{
  return CFSTR("INTypePropertyEnumTypeNamespace");
}

+ (id)__ClassPrefixKey
{
  return CFSTR("INTypeClassPrefix");
}

+ (id)__INCodablePlacemarkAttributeMetadataTypeKey
{
  return CFSTR("INTypePropertyMetadataType");
}

+ (id)__INCodableDateComponentsAttributeMetadataTypeKey
{
  return CFSTR("INTypePropertyMetadataType");
}

+ (id)__INCodableDateComponentsAttributeMetadataTimeStyleKey
{
  return CFSTR("INTypePropertyMetadataTimeStyle");
}

+ (id)__INCodableDateComponentsAttributeMetadataTemplateIDKey
{
  return CFSTR("INTypePropertyMetadataTemplateID");
}

+ (id)__INCodableDateComponentsAttributeMetadataTemplateKey
{
  return CFSTR("INTypePropertyMetadataTemplate");
}

+ (id)__INCodableDateComponentsAttributeMetadataFormatKey
{
  return CFSTR("INTypePropertyMetadataFormat");
}

+ (id)__INCodableDateComponentsAttributeMetadataDateStyleKey
{
  return CFSTR("INTypePropertyMetadataDateStyle");
}

+ (id)__INCodableCurrencyAmountAttributeMetadataCurrencyCodesKey
{
  return CFSTR("INTypePropertyMetadataCurrencyCodes");
}

+ (id)__INCodableNumberAttributeMetadataMinimumValueKey
{
  return CFSTR("INTypePropertyMetadataMinimumValue");
}

+ (id)__INCodableNumberAttributeMetadataMaximumValueKey
{
  return CFSTR("INTypePropertyMetadataMaximumValue");
}

+ (id)__INCodableNumberAttributeMetadataTypeKey
{
  return CFSTR("INTypePropertyMetadataType");
}

+ (id)__INCodableNumberAttributeMetadataDefaultValueKey
{
  return CFSTR("INTypePropertyMetadataDefaultValue");
}

+ (id)__INCodableTimeIntervalAttributeMetadataMinimumValueKey
{
  return CFSTR("INTypePropertyMetadataMinimumValue");
}

+ (id)__INCodableTimeIntervalAttributeMetadataMaximumValueKey
{
  return CFSTR("INTypePropertyMetadataMaximumValue");
}

+ (id)__INCodableTimeIntervalAttributeMetadataUnitKey
{
  return CFSTR("INTypePropertyMetadataUnit");
}

+ (id)__INCodableTimeIntervalAttributeMetadataDefaultValueKey
{
  return CFSTR("INTypePropertyMetadataDefaultValue");
}

+ (id)__INCodablePersonAttributeMetadataTypeKey
{
  return CFSTR("INTypePropertyMetadataType");
}

+ (id)__INCodableFileAttributeMetadataTypeKey
{
  return CFSTR("INTypePropertyMetadataType");
}

+ (id)__INCodableFileAttributeMetadataCustomUTIsKey
{
  return CFSTR("INTypePropertyMetadataCustomUTIs");
}

+ (id)__INCodableURLAttributeMetadataDefaultValueKey
{
  return CFSTR("INTypePropertyMetadataDefaultValue");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayNameLocID, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

- (INTypeCodableDescription)initWithCoder:(id)a3
{
  id v4;
  INTypeCodableDescription *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)INTypeCodableDescription;
  v5 = -[INCodableDescription initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("displayName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[INTypeCodableDescription setDisplayName:](v5, "setDisplayName:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayNameLocID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[INTypeCodableDescription setDisplayNameLocID:](v5, "setDisplayNameLocID:", v10);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INTypeCodableDescription;
  v4 = a3;
  -[INCodableDescription encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_displayName, CFSTR("displayName"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_displayNameLocID, CFSTR("displayNameLocID"));

}

+ (id)__INCodableAttributeUnsupportedReasonCodeKey
{
  return CFSTR("INTypePropertyUnsupportedReasonCode");
}

+ (id)__INCodableAttributeUnsupportedReasonKey
{
  return CFSTR("INTypePropertyUnsupportedReason");
}

+ (id)__Key
{
  return CFSTR("INType");
}

- (int64_t)codableDescriptionType
{
  return 3;
}

- (NSString)localizedDisplayName
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[INTypeCodableDescription localizedDisplayNameWithLocalizer:](self, "localizedDisplayNameWithLocalizer:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)localizedDisplayNameWithLocalizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[INTypeCodableDescription displayNameLocID](self, "displayNameLocID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INTypeCodableDescription displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableDescription _localizationTable](self, "_localizationTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  INLocalizedStringFromCodable(v5, v6, v7, v4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  objc_super v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)INTypeCodableDescription;
  v4 = a3;
  -[INCodableDescription dictionaryRepresentationWithLocalizer:](&v20, sel_dictionaryRepresentationWithLocalizer_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__ClassNameKey");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v19;
  -[INCodableDescription className](self, "className");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v6;
  v22[0] = v6;
  objc_msgSend((id)objc_opt_class(), "__DisplayNameKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v8;
  -[INTypeCodableDescription localizedDisplayNameWithLocalizer:](self, "localizedDisplayNameWithLocalizer:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[1] = v10;
  objc_msgSend((id)objc_opt_class(), "__DisplayNameIDKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v11;
  -[INTypeCodableDescription displayNameLocID](self, "displayNameLocID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "if_dictionaryByAddingEntriesFromDictionary:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  if (!v9)

  if (!v7)
  objc_msgSend(v15, "if_dictionaryWithNonEmptyValues");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v13;
  id v14;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)INTypeCodableDescription;
  v14 = 0;
  -[INCodableDescription widgetPlistableRepresentationWithParameters:error:](&v13, sel_widgetPlistableRepresentationWithParameters_error_, v6, &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;
  v9 = v8;
  if (v8)
  {
    v10 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v8);
  }
  else
  {
    -[NSString intents_encodeForPlistRepresentationWithParameters:](self->_displayName, "intents_encodeForPlistRepresentationWithParameters:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v11, CFSTR("displayName"));

    objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_displayNameLocID, CFSTR("displayNameLocID"));
    v10 = v7;
  }

  return v10;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)displayNameLocID
{
  return self->_displayNameLocID;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  objc_super v14;
  id v15;

  v6 = a3;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___INTypeCodableDescription;
  v15 = 0;
  objc_msgSendSuper2(&v14, sel_makeFromWidgetPlistableRepresentation_error_, v6, &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v15;
  v9 = v8;
  if (v8)
  {
    v10 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v8);
  }
  else
  {
    objc_msgSend(v6, "intents_stringForKey:", CFSTR("displayName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDisplayName:", v11);

    objc_msgSend(v6, "intents_stringForKey:", CFSTR("displayNameLocID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDisplayNameLocID:", v12);

    v10 = v7;
  }

  return v10;
}

+ (id)__INCodableObjectAttributeKey
{
  return CFSTR("INTypeProperty");
}

+ (id)__INCodableScalarAttributeKey
{
  return CFSTR("INTypeProperty");
}

+ (id)__INCodableAttributeArraySizeSizeClassKey
{
  return CFSTR("INTypePropertyArraySizeSizeClass");
}

+ (id)__INCodableAttributeArraySizeSizeKey
{
  return CFSTR("INTypePropertyArraySizeSize");
}

+ (id)__INCodableTimeIntervalAttributeMetadataMinimumUnitKey
{
  return CFSTR("INTypePropertyMetadataMinimumUnit");
}

+ (id)__INCodableTimeIntervalAttributeMetadataMaximumUnitKey
{
  return CFSTR("INTypePropertyMetadataMaximumUnit");
}

+ (id)__INCodableTimeIntervalAttributeMetadataDefaultUnitKey
{
  return CFSTR("INTypePropertyMetadataDefaultUnit");
}

+ (id)__INCodableCurrencyAmountAttributeMetadataCurrencyCodeKey
{
  return CFSTR("INTypePropertyMetadataCurrencyCode");
}

+ (id)__INCodableEnumAttributeMetadataKey
{
  return CFSTR("INTypePropertyMetadata");
}

+ (id)__INCodableMeasurementAttributeMetadataUnitKey
{
  return CFSTR("INTypePropertyMetadataUnit");
}

+ (id)__INCodableMeasurementAttributeMetadataSupportsNegativeNumbersKey
{
  return CFSTR("INTypePropertyMetadataSupportsNegativeNumbers");
}

+ (id)__INCodableMeasurementAttributeMetadataDefaultValueKey
{
  return CFSTR("INTypePropertyMetadataDefaultValue");
}

+ (id)__INCodableMeasurementAttributeMetadataDefaultUnitKey
{
  return CFSTR("INTypePropertyMetadataDefaultUnit");
}

+ (id)__INCodablePlacemarkAttributeMetadataKey
{
  return CFSTR("INTypePropertyMetadata");
}

+ (id)__INCodablePersonAttributeMetadataKey
{
  return CFSTR("INTypePropertyMetadata");
}

+ (id)__INCodableNumberAttributeMetadataSupportsNegativeNumbersKey
{
  return CFSTR("INTypePropertyMetadataSupportsNegativeNumbers");
}

+ (id)__INCodableAttributePromptDialogTypeKey
{
  return CFSTR("INTypePropertyPromptDialogType");
}

+ (id)__INCodableAttributePromptDialogKey
{
  return CFSTR("INTypePropertyPromptDialog");
}

+ (id)__INCodableAttributeRelationshipPredicateValuesKey
{
  return CFSTR("INTypePropertyRelationshipPredicateValues");
}

+ (id)__INCodableAttributeRelationshipPredicateValueKey
{
  return CFSTR("INTypePropertyRelationshipPredicateValue");
}

+ (id)__INCodableAttributeRelationshipPredicateNameKey
{
  return CFSTR("INTypePropertyRelationshipPredicateName");
}

+ (id)__INCodableAttributeRelationshipParentNameKey
{
  return CFSTR("INTypePropertyRelationshipParentName");
}

+ (id)__INCodableURLAttributeMetadataKey
{
  return CFSTR("INTypePropertyMetadata");
}

@end
