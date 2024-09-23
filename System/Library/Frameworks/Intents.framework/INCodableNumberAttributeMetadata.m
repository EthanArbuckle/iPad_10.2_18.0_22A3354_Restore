@implementation INCodableNumberAttributeMetadata

- (int64_t)type
{
  return self->_type;
}

- (void)updateWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSNumber *v13;
  NSNumber *defaultValue;
  void *v15;
  void *v16;
  NSNumber *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  NSNumber *minimumValue;
  void *v24;
  void *v25;
  NSNumber *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  NSNumber *maximumValue;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)INCodableNumberAttributeMetadata;
  -[INCodableAttributeMetadata updateWithDictionary:](&v33, sel_updateWithDictionary_, v4);
  -[INCodableNumberAttributeMetadata __INCodableDescriptionTypeKey](self, "__INCodableDescriptionTypeKey");
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

  v9 = INCodableAttributeMetadataInputTypeWithString(v8);
  self->_type = v9;
  -[INCodableNumberAttributeMetadata __INCodableDescriptionDefaultValueKey](self, "__INCodableDescriptionDefaultValueKey");
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

  defaultValue = self->_defaultValue;
  self->_defaultValue = v13;

  -[INCodableNumberAttributeMetadata __INCodableDescriptionMinimumValueKey](self, "__INCodableDescriptionMinimumValueKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (!objc_msgSend(v16, "length"))
    {
      v17 = 0;
      goto LABEL_25;
    }
  }
  else
  {

    v16 = 0;
  }
  -[INCodableNumberAttributeMetadata __INCodableDescriptionMinimumValueKey](self, "__INCodableDescriptionMinimumValueKey");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = v19;
    else
      v20 = 0;
  }
  else
  {
    v20 = 0;
  }
  v21 = v20;

  if (v21)
    v22 = v21;
  else
    v22 = &unk_1E23E9CE8;
  v17 = v22;

LABEL_25:
  minimumValue = self->_minimumValue;
  self->_minimumValue = v17;

  -[INCodableNumberAttributeMetadata __INCodableDescriptionMaximumValueKey](self, "__INCodableDescriptionMaximumValueKey");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (!objc_msgSend(v25, "length"))
    {
      v26 = 0;
      goto LABEL_39;
    }
  }
  else
  {

    v25 = 0;
  }
  -[INCodableNumberAttributeMetadata __INCodableDescriptionMaximumValueKey](self, "__INCodableDescriptionMaximumValueKey");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v29 = v28;
    else
      v29 = 0;
  }
  else
  {
    v29 = 0;
  }
  v30 = v29;

  if (v30)
    v31 = v30;
  else
    v31 = &unk_1E23E9CE8;
  v26 = v31;

LABEL_39:
  maximumValue = self->_maximumValue;
  self->_maximumValue = v26;

}

- (id)__INCodableDescriptionMinimumValueKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableNumberAttributeMetadataMinimumValueKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionMaximumValueKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableNumberAttributeMetadataMaximumValueKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionTypeKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableNumberAttributeMetadataTypeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionDefaultValueKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableNumberAttributeMetadataDefaultValueKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  int64_t v4;
  __CFString *v5;
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
  __CFString *v25;
  void *v26;
  objc_super v27;
  _QWORD v28[5];
  _QWORD v29[7];

  v29[5] = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)INCodableNumberAttributeMetadata;
  -[INCodableAttributeMetadata dictionaryRepresentationWithLocalizer:](&v27, sel_dictionaryRepresentationWithLocalizer_, a3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableNumberAttributeMetadata __INCodableDescriptionTypeKey](self, "__INCodableDescriptionTypeKey");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v26;
  v4 = -[INCodableNumberAttributeMetadata type](self, "type");
  v5 = CFSTR("Field");
  if (v4 == 1)
    v5 = CFSTR("Stepper");
  if (v4 == 2)
    v5 = CFSTR("Slider");
  v25 = v5;
  v29[0] = v25;
  -[INCodableNumberAttributeMetadata __INCodableDescriptionSupportsNegativeNumbersKey](self, "__INCodableDescriptionSupportsNegativeNumbersKey");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v24;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INCodableNumberAttributeMetadata supportsNegativeNumbers](self, "supportsNegativeNumbers"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v6;
  v29[1] = v6;
  -[INCodableNumberAttributeMetadata __INCodableDescriptionDefaultValueKey](self, "__INCodableDescriptionDefaultValueKey");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v22;
  -[INCodableNumberAttributeMetadata defaultValue](self, "defaultValue");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v29[2] = v8;
  -[INCodableNumberAttributeMetadata __INCodableDescriptionMinimumValueKey](self, "__INCodableDescriptionMinimumValueKey", v8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v21;
  -[INCodableNumberAttributeMetadata minimumValue](self, "minimumValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[3] = v11;
  -[INCodableNumberAttributeMetadata __INCodableDescriptionMaximumValueKey](self, "__INCodableDescriptionMaximumValueKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28[4] = v12;
  -[INCodableNumberAttributeMetadata maximumValue](self, "maximumValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[4] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "if_dictionaryByAddingEntriesFromDictionary:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  if (!v10)

  if (!v9)
  if (!v7)

  objc_msgSend(v16, "if_dictionaryWithNonEmptyValues");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (BOOL)supportsNegativeNumbers
{
  NSNumber *minimumValue;
  double v3;

  minimumValue = self->_minimumValue;
  if (!minimumValue)
    return 1;
  -[NSNumber doubleValue](minimumValue, "doubleValue");
  return v3 < 0.0;
}

- (id)_localizedDialogTokensWithLocalizer:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("minimumValue");
  -[INCodableNumberAttributeMetadata minimumValue](self, "minimumValue", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = &stru_1E2295770;
  v14[1] = CFSTR("maximumValue");
  v15[0] = v7;
  -[INCodableNumberAttributeMetadata maximumValue](self, "maximumValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = &stru_1E2295770;
  v15[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;
  objc_super v11;
  id v12;

  v11.receiver = self;
  v11.super_class = (Class)INCodableNumberAttributeMetadata;
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
    objc_msgSend(v6, "intents_setIntegerIfNonZero:forKey:", self->_type, CFSTR("type"));
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_defaultValue, CFSTR("defaultValue"));
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_minimumValue, CFSTR("minimumValue"));
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_maximumValue, CFSTR("maximumValue"));
    v9 = v6;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INCodableNumberAttributeMetadata;
  v4 = a3;
  -[INCodableAttributeMetadata encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, CFSTR("type"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_defaultValue, CFSTR("defaultValue"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_minimumValue, CFSTR("minimumValue"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_maximumValue, CFSTR("maximumValue"));

}

- (INCodableNumberAttributeMetadata)initWithCoder:(id)a3
{
  id v4;
  INCodableNumberAttributeMetadata *v5;
  uint64_t v6;
  NSNumber *defaultValue;
  uint64_t v8;
  NSNumber *minimumValue;
  uint64_t v10;
  NSNumber *maximumValue;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)INCodableNumberAttributeMetadata;
  v5 = -[INCodableAttributeMetadata initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultValue"));
    v6 = objc_claimAutoreleasedReturnValue();
    defaultValue = v5->_defaultValue;
    v5->_defaultValue = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minimumValue"));
    v8 = objc_claimAutoreleasedReturnValue();
    minimumValue = v5->_minimumValue;
    v5->_minimumValue = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maximumValue"));
    v10 = objc_claimAutoreleasedReturnValue();
    maximumValue = v5->_maximumValue;
    v5->_maximumValue = (NSNumber *)v10;

  }
  return v5;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSNumber)defaultValue
{
  return self->_defaultValue;
}

- (void)setDefaultValue:(id)a3
{
  objc_storeStrong((id *)&self->_defaultValue, a3);
}

- (NSNumber)minimumValue
{
  return self->_minimumValue;
}

- (void)setMinimumValue:(id)a3
{
  objc_storeStrong((id *)&self->_minimumValue, a3);
}

- (NSNumber)maximumValue
{
  return self->_maximumValue;
}

- (void)setMaximumValue:(id)a3
{
  objc_storeStrong((id *)&self->_maximumValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumValue, 0);
  objc_storeStrong((id *)&self->_minimumValue, 0);
  objc_storeStrong((id *)&self->_defaultValue, 0);
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  _QWORD *v7;
  id v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_super v18;
  id v19;

  v6 = a3;
  v18.receiver = a1;
  v18.super_class = (Class)&OBJC_METACLASS___INCodableNumberAttributeMetadata;
  v19 = 0;
  objc_msgSendSuper2(&v18, sel_makeFromWidgetPlistableRepresentation_error_, v6, &v19);
  v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v8 = v19;
  v9 = v8;
  if (v8)
  {
    v10 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v8);
  }
  else
  {
    v7[5] = objc_msgSend(v6, "intents_intForKey:", CFSTR("type"));
    objc_msgSend(v6, "intents_numberForKey:", CFSTR("defaultValue"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v7[6];
    v7[6] = v11;

    objc_msgSend(v6, "intents_numberForKey:", CFSTR("minimumValue"));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v7[7];
    v7[7] = v13;

    objc_msgSend(v6, "intents_numberForKey:", CFSTR("maximumValue"));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v7[8];
    v7[8] = v15;

    v10 = v7;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)__INTypeCodableDescriptionTypeKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableNumberAttributeMetadataTypeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionSupportsNegativeNumbersKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableNumberAttributeMetadataSupportsNegativeNumbersKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionMinimumValueKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableNumberAttributeMetadataMinimumValueKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionMaximumValueKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableNumberAttributeMetadataMaximumValueKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionDefaultValueKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableNumberAttributeMetadataDefaultValueKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionTypeKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableNumberAttributeMetadataTypeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionSupportsNegativeNumbersKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableNumberAttributeMetadataSupportsNegativeNumbersKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionMinimumValueKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableNumberAttributeMetadataMinimumValueKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionMaximumValueKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableNumberAttributeMetadataMaximumValueKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionDefaultValueKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableNumberAttributeMetadataDefaultValueKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionSupportsNegativeNumbersKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableNumberAttributeMetadataSupportsNegativeNumbersKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
