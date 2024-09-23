@implementation INCodableStringAttributeMetadata

- (INCodableStringAttributeMetadata)initWithCoder:(id)a3
{
  id v4;
  INCodableStringAttributeMetadata *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)INCodableStringAttributeMetadata;
  v5 = -[INCodableAttributeMetadata initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    -[INCodableStringAttributeMetadata setMultiline:](v5, "setMultiline:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("multiline")));
    -[INCodableStringAttributeMetadata setDisableAutocorrect:](v5, "setDisableAutocorrect:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("disableAutocorrect")));
    -[INCodableStringAttributeMetadata setDisableSmartDashes:](v5, "setDisableSmartDashes:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("disableSmartDashes")));
    -[INCodableStringAttributeMetadata setDisableSmartQuotes:](v5, "setDisableSmartQuotes:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("disableSmartQuotes")));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("defaultValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableStringAttributeMetadata setDefaultValue:](v5, "setDefaultValue:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultValueID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableStringAttributeMetadata setDefaultValueID:](v5, "setDefaultValueID:", v10);

    -[INCodableStringAttributeMetadata setCapitalization:](v5, "setCapitalization:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("capitalization")));
  }

  return v5;
}

- (void)setMultiline:(BOOL)a3
{
  self->_multiline = a3;
}

- (void)setDisableSmartQuotes:(BOOL)a3
{
  self->_disableSmartQuotes = a3;
}

- (void)setDisableSmartDashes:(BOOL)a3
{
  self->_disableSmartDashes = a3;
}

- (void)setDisableAutocorrect:(BOOL)a3
{
  self->_disableAutocorrect = a3;
}

- (void)setDefaultValueID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setDefaultValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setCapitalization:(int64_t)a3
{
  self->_capitalization = a3;
}

- (void)updateWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  NSString *v28;
  NSString *defaultValue;
  void *v30;
  void *v31;
  void *v32;
  NSString *v33;
  NSString *defaultValueID;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  int64_t v39;
  objc_super v40;

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)INCodableStringAttributeMetadata;
  -[INCodableAttributeMetadata updateWithDictionary:](&v40, sel_updateWithDictionary_, v4);
  -[INCodableStringAttributeMetadata __INCodableDescriptionMultilineKey](self, "__INCodableDescriptionMultilineKey");
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

  v9 = objc_msgSend(v8, "BOOLValue");
  self->_multiline = v9;
  -[INCodableStringAttributeMetadata __INCodableDescriptionDisableAutocorrectKey](self, "__INCodableDescriptionDisableAutocorrectKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
  }
  else
  {
    v12 = 0;
  }
  v13 = v12;

  v14 = objc_msgSend(v13, "BOOLValue");
  self->_disableAutocorrect = v14;
  -[INCodableStringAttributeMetadata __INCodableDescriptionDisableSmartDashesKey](self, "__INCodableDescriptionDisableSmartDashesKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
  }
  else
  {
    v17 = 0;
  }
  v18 = v17;

  v19 = objc_msgSend(v18, "BOOLValue");
  self->_disableSmartDashes = v19;
  -[INCodableStringAttributeMetadata __INCodableDescriptionDisableSmartQuotesKey](self, "__INCodableDescriptionDisableSmartQuotesKey");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v22 = v21;
    else
      v22 = 0;
  }
  else
  {
    v22 = 0;
  }
  v23 = v22;

  v24 = objc_msgSend(v23, "BOOLValue");
  self->_disableSmartQuotes = v24;
  -[INCodableStringAttributeMetadata __INCodableDescriptionDefaultValueKey](self, "__INCodableDescriptionDefaultValueKey");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v27 = v26;
    else
      v27 = 0;
  }
  else
  {
    v27 = 0;
  }
  v28 = v27;

  defaultValue = self->_defaultValue;
  self->_defaultValue = v28;

  -[INCodableStringAttributeMetadata __INCodableDescriptionDefaultValueIDKey](self, "__INCodableDescriptionDefaultValueIDKey");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v32 = v31;
    else
      v32 = 0;
  }
  else
  {
    v32 = 0;
  }
  v33 = v32;

  defaultValueID = self->_defaultValueID;
  self->_defaultValueID = v33;

  -[INCodableStringAttributeMetadata __INCodableDescriptionCapitalizationKey](self, "__INCodableDescriptionCapitalizationKey");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v37 = v36;
    else
      v37 = 0;
  }
  else
  {
    v37 = 0;
  }
  v38 = v37;

  v39 = INCodableStringAttributeMetadataCapitalizationWithString(v38);
  self->_capitalization = v39;

}

- (id)__INCodableDescriptionMultilineKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableStringAttributeMetadataMultilineKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionDisableSmartQuotesKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableStringAttributeMetadataDisableSmartQuotesKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionDisableSmartDashesKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableStringAttributeMetadataDisableSmartDashesKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionDisableAutocorrectKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableStringAttributeMetadataDisableAutocorrectKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionDefaultValueIDKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableStringAttributeMetadataDefaultValueIDKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionDefaultValueKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableStringAttributeMetadataDefaultValueKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionCapitalizationKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableStringAttributeMetadataCapitalizationKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INCodableStringAttributeMetadata;
  v4 = a3;
  -[INCodableAttributeMetadata encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_multiline, CFSTR("multiline"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_disableAutocorrect, CFSTR("disableAutocorrect"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_disableSmartDashes, CFSTR("disableSmartDashes"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_disableSmartQuotes, CFSTR("disableSmartQuotes"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_defaultValue, CFSTR("defaultValue"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_defaultValueID, CFSTR("defaultValueID"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_capitalization, CFSTR("capitalization"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultValueID, 0);
  objc_storeStrong((id *)&self->_defaultValue, 0);
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int64_t v17;
  const __CFString *v18;
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
  void *v33;
  void *v34;
  void *v35;
  objc_super v36;
  _QWORD v37[7];
  _QWORD v38[9];

  v38[7] = *MEMORY[0x1E0C80C00];
  v36.receiver = self;
  v36.super_class = (Class)INCodableStringAttributeMetadata;
  v4 = a3;
  -[INCodableAttributeMetadata dictionaryRepresentationWithLocalizer:](&v36, sel_dictionaryRepresentationWithLocalizer_, v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableStringAttributeMetadata __INCodableDescriptionMultilineKey](self, "__INCodableDescriptionMultilineKey");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v35;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INCodableStringAttributeMetadata isMultiline](self, "isMultiline"));
  v5 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v5;
  v38[0] = v5;
  -[INCodableStringAttributeMetadata __INCodableDescriptionDisableAutocorrectKey](self, "__INCodableDescriptionDisableAutocorrectKey");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v33;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INCodableStringAttributeMetadata disableAutocorrect](self, "disableAutocorrect"));
  v6 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v6;
  v38[1] = v6;
  -[INCodableStringAttributeMetadata __INCodableDescriptionDisableSmartDashesKey](self, "__INCodableDescriptionDisableSmartDashesKey");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v30;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INCodableStringAttributeMetadata disableSmartDashes](self, "disableSmartDashes"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v29 = v8;
  v24 = (void *)v7;
  v38[2] = v7;
  -[INCodableStringAttributeMetadata __INCodableDescriptionDisableSmartQuotesKey](self, "__INCodableDescriptionDisableSmartQuotesKey");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v28;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INCodableStringAttributeMetadata disableSmartQuotes](self, "disableSmartQuotes"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v9;
  v38[3] = v9;
  -[INCodableStringAttributeMetadata __INCodableDescriptionDefaultValueKey](self, "__INCodableDescriptionDefaultValueKey");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v37[4] = v27;
  -[INCodableStringAttributeMetadata localizedDefaultValueWithLocalizer:](self, "localizedDefaultValueWithLocalizer:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v38[4] = v12;
  -[INCodableStringAttributeMetadata __INCodableDescriptionDefaultValueIDKey](self, "__INCodableDescriptionDefaultValueIDKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v37[5] = v13;
  -[INCodableStringAttributeMetadata defaultValueID](self, "defaultValueID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v38[5] = v15;
  -[INCodableStringAttributeMetadata __INCodableDescriptionCapitalizationKey](self, "__INCodableDescriptionCapitalizationKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v37[6] = v16;
  v17 = -[INCodableStringAttributeMetadata capitalization](self, "capitalization");
  if ((unint64_t)(v17 - 1) > 2)
    v18 = CFSTR("None");
  else
    v18 = off_1E228D4C8[v17 - 1];
  v38[6] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "if_dictionaryByAddingEntriesFromDictionary:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  if (!v11)

  if (!v10)
  if (!v29)

  if (!v32)
  if (!v34)

  objc_msgSend(v20, "if_dictionaryWithNonEmptyValues");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (NSString)localizedDefaultValue
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[INCodableStringAttributeMetadata localizedDefaultValueWithLocalizer:](self, "localizedDefaultValueWithLocalizer:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)localizedDefaultValueWithLocalizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[INCodableStringAttributeMetadata defaultValueID](self, "defaultValueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableStringAttributeMetadata defaultValue](self, "defaultValue");
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
  v11.super_class = (Class)INCodableStringAttributeMetadata;
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
    objc_msgSend(v6, "intents_setBoolIfTrue:forKey:", self->_multiline, CFSTR("multiline"));
    objc_msgSend(v6, "intents_setBoolIfTrue:forKey:", self->_disableAutocorrect, CFSTR("disableAutocorrect"));
    objc_msgSend(v6, "intents_setBoolIfTrue:forKey:", self->_disableSmartDashes, CFSTR("disableSmartDashes"));
    objc_msgSend(v6, "intents_setBoolIfTrue:forKey:", self->_disableSmartQuotes, CFSTR("disableSmartQuotes"));
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_defaultValue, CFSTR("defaultValue"));
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_defaultValueID, CFSTR("defaultValueID"));
    objc_msgSend(v6, "intents_setIntegerIfNonZero:forKey:", self->_capitalization, CFSTR("capitalization"));
    v9 = (void *)objc_msgSend(v6, "copy");
  }

  return v9;
}

- (BOOL)isMultiline
{
  return self->_multiline;
}

- (BOOL)disableAutocorrect
{
  return self->_disableAutocorrect;
}

- (BOOL)disableSmartDashes
{
  return self->_disableSmartDashes;
}

- (BOOL)disableSmartQuotes
{
  return self->_disableSmartQuotes;
}

- (NSString)defaultValue
{
  return self->_defaultValue;
}

- (NSString)defaultValueID
{
  return self->_defaultValueID;
}

- (int64_t)capitalization
{
  return self->_capitalization;
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
  v14.super_class = (Class)&OBJC_METACLASS___INCodableStringAttributeMetadata;
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
    objc_msgSend(v7, "setMultiline:", objc_msgSend(v6, "intents_BOOLForKey:", CFSTR("multiline")));
    objc_msgSend(v7, "setDisableAutocorrect:", objc_msgSend(v6, "intents_BOOLForKey:", CFSTR("disableAutocorrect")));
    objc_msgSend(v7, "setDisableSmartDashes:", objc_msgSend(v6, "intents_BOOLForKey:", CFSTR("disableSmartDashes")));
    objc_msgSend(v7, "setDisableSmartQuotes:", objc_msgSend(v6, "intents_BOOLForKey:", CFSTR("disableSmartQuotes")));
    objc_msgSend(v6, "intents_stringForKey:", CFSTR("defaultValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDefaultValue:", v11);

    objc_msgSend(v6, "intents_stringForKey:", CFSTR("defaultValueID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDefaultValueID:", v12);

    objc_msgSend(v7, "setCapitalization:", objc_msgSend(v6, "intents_intForKey:", CFSTR("capitalization")));
    v10 = v7;
  }

  return v10;
}

- (id)__INTypeCodableDescriptionMultilineKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableStringAttributeMetadataMultilineKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionDisableSmartQuotesKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableStringAttributeMetadataDisableSmartQuotesKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionDisableSmartDashesKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableStringAttributeMetadataDisableSmartDashesKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionDisableAutocorrectKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableStringAttributeMetadataDisableAutocorrectKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionDefaultValueIDKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableStringAttributeMetadataDefaultValueIDKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionDefaultValueKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableStringAttributeMetadataDefaultValueKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionCapitalizationKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableStringAttributeMetadataCapitalizationKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionMultilineKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableStringAttributeMetadataMultilineKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionDisableSmartQuotesKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableStringAttributeMetadataDisableSmartQuotesKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionDisableSmartDashesKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableStringAttributeMetadataDisableSmartDashesKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionDisableAutocorrectKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableStringAttributeMetadataDisableAutocorrectKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionDefaultValueIDKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableStringAttributeMetadataDefaultValueIDKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionDefaultValueKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableStringAttributeMetadataDefaultValueKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionCapitalizationKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableStringAttributeMetadataCapitalizationKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
