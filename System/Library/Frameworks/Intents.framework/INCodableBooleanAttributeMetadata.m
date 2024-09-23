@implementation INCodableBooleanAttributeMetadata

- (void)updateWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSNumber *v9;
  NSNumber *defaultValue;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSString *v15;
  NSString *falseDisplayName;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSString *v21;
  NSString *falseDisplayNameID;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSString *v27;
  NSString *trueDisplayName;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSString *v33;
  NSString *trueDisplayNameID;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)INCodableBooleanAttributeMetadata;
  -[INCodableAttributeMetadata updateWithDictionary:](&v35, sel_updateWithDictionary_, v4);
  -[INCodableBooleanAttributeMetadata __INCodableDescriptionDefaultValueKey](self, "__INCodableDescriptionDefaultValueKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  v9 = (NSNumber *)objc_msgSend(v8, "copy");
  defaultValue = self->_defaultValue;
  self->_defaultValue = v9;

  -[INCodableBooleanAttributeMetadata __INCodableDescriptionFalseDisplayNameKey](self, "__INCodableDescriptionFalseDisplayNameKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
  }
  else
  {
    v13 = 0;
  }
  v14 = v13;

  v15 = (NSString *)objc_msgSend(v14, "copy");
  falseDisplayName = self->_falseDisplayName;
  self->_falseDisplayName = v15;

  -[INCodableBooleanAttributeMetadata __INCodableDescriptionFalseDisplayNameIDKey](self, "__INCodableDescriptionFalseDisplayNameIDKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
  }
  else
  {
    v19 = 0;
  }
  v20 = v19;

  v21 = (NSString *)objc_msgSend(v20, "copy");
  falseDisplayNameID = self->_falseDisplayNameID;
  self->_falseDisplayNameID = v21;

  -[INCodableBooleanAttributeMetadata __INCodableDescriptionTrueDisplayNameKey](self, "__INCodableDescriptionTrueDisplayNameKey");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v25 = v24;
    else
      v25 = 0;
  }
  else
  {
    v25 = 0;
  }
  v26 = v25;

  v27 = (NSString *)objc_msgSend(v26, "copy");
  trueDisplayName = self->_trueDisplayName;
  self->_trueDisplayName = v27;

  -[INCodableBooleanAttributeMetadata __INCodableDescriptionTrueDisplayNameIDKey](self, "__INCodableDescriptionTrueDisplayNameIDKey");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v31 = v30;
    else
      v31 = 0;
  }
  else
  {
    v31 = 0;
  }
  v32 = v31;

  v33 = (NSString *)objc_msgSend(v32, "copy");
  trueDisplayNameID = self->_trueDisplayNameID;
  self->_trueDisplayNameID = v33;

}

- (id)__INCodableDescriptionTrueDisplayNameIDKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableBooleanAttributeMetadataTrueDisplayNameIDKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionTrueDisplayNameKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableBooleanAttributeMetadataTrueDisplayNameKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionFalseDisplayNameIDKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableBooleanAttributeMetadataFalseDisplayNameIDKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionFalseDisplayNameKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableBooleanAttributeMetadataFalseDisplayNameKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionDefaultValueKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableBooleanAttributeMetadataDefaultValueKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
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
  objc_super v29;
  _QWORD v30[5];
  _QWORD v31[7];

  v31[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)INCodableBooleanAttributeMetadata;
  -[INCodableAttributeMetadata dictionaryRepresentationWithLocalizer:](&v29, sel_dictionaryRepresentationWithLocalizer_, v4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableBooleanAttributeMetadata __INCodableDescriptionDefaultValueKey](self, "__INCodableDescriptionDefaultValueKey");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v27;
  -[INCodableBooleanAttributeMetadata defaultValue](self, "defaultValue");
  v5 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v5;
  v31[0] = v5;
  -[INCodableBooleanAttributeMetadata __INCodableDescriptionTrueDisplayNameKey](self, "__INCodableDescriptionTrueDisplayNameKey");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v25;
  -[INCodableBooleanAttributeMetadata localizedTrueDisplayNameWithLocalizer:](self, "localizedTrueDisplayNameWithLocalizer:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v6;
  v31[1] = v6;
  -[INCodableBooleanAttributeMetadata __INCodableDescriptionTrueDisplayNameIDKey](self, "__INCodableDescriptionTrueDisplayNameIDKey");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v23;
  -[INCodableBooleanAttributeMetadata trueDisplayNameID](self, "trueDisplayNameID");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v31[2] = v8;
  -[INCodableBooleanAttributeMetadata __INCodableDescriptionFalseDisplayNameKey](self, "__INCodableDescriptionFalseDisplayNameKey", v8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v22;
  v28 = v4;
  -[INCodableBooleanAttributeMetadata localizedFalseDisplayNameWithLocalizer:](self, "localizedFalseDisplayNameWithLocalizer:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31[3] = v11;
  -[INCodableBooleanAttributeMetadata __INCodableDescriptionFalseDisplayNameIDKey](self, "__INCodableDescriptionFalseDisplayNameIDKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30[4] = v12;
  -[INCodableBooleanAttributeMetadata falseDisplayNameID](self, "falseDisplayNameID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31[4] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "if_dictionaryByAddingEntriesFromDictionary:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  if (!v10)

  if (!v9)
  if (!v7)

  if (!v26)
  objc_msgSend(v16, "if_dictionaryWithNonEmptyValues");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSString)localizedTrueDisplayName
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[INCodableBooleanAttributeMetadata localizedTrueDisplayNameWithLocalizer:](self, "localizedTrueDisplayNameWithLocalizer:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)localizedTrueDisplayNameWithLocalizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[INCodableBooleanAttributeMetadata trueDisplayNameID](self, "trueDisplayNameID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableBooleanAttributeMetadata trueDisplayName](self, "trueDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableAttributeMetadata _localizationTable](self, "_localizationTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  INLocalizedStringFromCodable(v5, v6, v7, v4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)localizedFalseDisplayName
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[INCodableBooleanAttributeMetadata localizedFalseDisplayNameWithLocalizer:](self, "localizedFalseDisplayNameWithLocalizer:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)localizedFalseDisplayNameWithLocalizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[INCodableBooleanAttributeMetadata falseDisplayNameID](self, "falseDisplayNameID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableBooleanAttributeMetadata falseDisplayName](self, "falseDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableAttributeMetadata _localizationTable](self, "_localizationTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  INLocalizedStringFromCodable(v5, v6, v7, v4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;
  id v12;

  v11.receiver = self;
  v11.super_class = (Class)INCodableBooleanAttributeMetadata;
  v12 = 0;
  -[INCodableAttributeMetadata widgetPlistableRepresentationWithParameters:error:](&v11, sel_widgetPlistableRepresentationWithParameters_error_, a3, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  v8 = v7;
  if (v7)
  {
    v9 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v7);
  }
  else
  {
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_defaultValue, CFSTR("defaultValue"));
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_falseDisplayName, CFSTR("falseDisplayName"));
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_falseDisplayNameID, CFSTR("falseDisplayNameID"));
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_trueDisplayName, CFSTR("trueDisplayName"));
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_trueDisplayNameID, CFSTR("trueDisplayNameID"));
    v9 = (void *)objc_msgSend(v6, "copy");
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INCodableBooleanAttributeMetadata;
  v4 = a3;
  -[INCodableAttributeMetadata encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_defaultValue, CFSTR("defaultValue"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_falseDisplayName, CFSTR("falseDisplayName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_falseDisplayNameID, CFSTR("falseDisplayNameID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_trueDisplayName, CFSTR("trueDisplayName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_trueDisplayNameID, CFSTR("trueDisplayNameID"));

}

- (INCodableBooleanAttributeMetadata)initWithCoder:(id)a3
{
  id v4;
  INCodableBooleanAttributeMetadata *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)INCodableBooleanAttributeMetadata;
  v5 = -[INCodableAttributeMetadata initWithCoder:](&v18, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultValue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableBooleanAttributeMetadata setDefaultValue:](v5, "setDefaultValue:", v6);

    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("falseDisplayName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableBooleanAttributeMetadata setFalseDisplayName:](v5, "setFalseDisplayName:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("falseDisplayNameID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableBooleanAttributeMetadata setFalseDisplayNameID:](v5, "setFalseDisplayNameID:", v11);

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("trueDisplayName"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableBooleanAttributeMetadata setTrueDisplayName:](v5, "setTrueDisplayName:", v15);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trueDisplayNameID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableBooleanAttributeMetadata setTrueDisplayNameID:](v5, "setTrueDisplayNameID:", v16);

  }
  return v5;
}

- (NSNumber)defaultValue
{
  return self->_defaultValue;
}

- (void)setDefaultValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)falseDisplayName
{
  return self->_falseDisplayName;
}

- (void)setFalseDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)falseDisplayNameID
{
  return self->_falseDisplayNameID;
}

- (void)setFalseDisplayNameID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)trueDisplayName
{
  return self->_trueDisplayName;
}

- (void)setTrueDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)trueDisplayNameID
{
  return self->_trueDisplayNameID;
}

- (void)setTrueDisplayNameID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trueDisplayNameID, 0);
  objc_storeStrong((id *)&self->_trueDisplayName, 0);
  objc_storeStrong((id *)&self->_falseDisplayNameID, 0);
  objc_storeStrong((id *)&self->_falseDisplayName, 0);
  objc_storeStrong((id *)&self->_defaultValue, 0);
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
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;
  id v18;

  v6 = a3;
  v17.receiver = a1;
  v17.super_class = (Class)&OBJC_METACLASS___INCodableBooleanAttributeMetadata;
  v18 = 0;
  objc_msgSendSuper2(&v17, sel_makeFromWidgetPlistableRepresentation_error_, v6, &v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v18;
  v9 = v8;
  if (v8)
  {
    v10 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v8);
  }
  else
  {
    objc_msgSend(v6, "intents_numberForKey:", CFSTR("defaultValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDefaultValue:", v11);

    objc_msgSend(v6, "intents_stringForKey:", CFSTR("falseDisplayName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFalseDisplayName:", v12);

    objc_msgSend(v6, "intents_stringForKey:", CFSTR("falseDisplayNameID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFalseDisplayNameID:", v13);

    objc_msgSend(v6, "intents_stringForKey:", CFSTR("trueDisplayName"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTrueDisplayName:", v14);

    objc_msgSend(v6, "intents_stringForKey:", CFSTR("trueDisplayNameID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTrueDisplayNameID:", v15);

    v10 = v7;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)__INTypeCodableDescriptionTrueDisplayNameIDKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableBooleanAttributeMetadataTrueDisplayNameIDKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionTrueDisplayNameKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableBooleanAttributeMetadataTrueDisplayNameKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionFalseDisplayNameIDKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableBooleanAttributeMetadataFalseDisplayNameIDKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionFalseDisplayNameKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableBooleanAttributeMetadataFalseDisplayNameKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionDefaultValueKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableBooleanAttributeMetadataDefaultValueKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionTrueDisplayNameIDKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableBooleanAttributeMetadataTrueDisplayNameIDKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionTrueDisplayNameKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableBooleanAttributeMetadataTrueDisplayNameKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionFalseDisplayNameIDKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableBooleanAttributeMetadataFalseDisplayNameIDKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionFalseDisplayNameKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableBooleanAttributeMetadataFalseDisplayNameKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionDefaultValueKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableBooleanAttributeMetadataDefaultValueKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
