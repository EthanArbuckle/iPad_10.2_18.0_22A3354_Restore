@implementation INCodableTimeIntervalAttributeMetadata

- (void)updateWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  int *v13;
  id v14;
  int64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  int64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  NSNumber *v28;
  NSNumber *defaultValue;
  void *v30;
  void *v31;
  NSNumber *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  NSNumber *minimumValue;
  void *v39;
  void *v40;
  NSNumber *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  NSNumber *maximumValue;
  objc_super v48;

  v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)INCodableTimeIntervalAttributeMetadata;
  -[INCodableAttributeMetadata updateWithDictionary:](&v48, sel_updateWithDictionary_, v4);
  -[INCodableTimeIntervalAttributeMetadata __INCodableDescriptionUnitKey](self, "__INCodableDescriptionUnitKey");
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

  if (objc_msgSend(v8, "isEqualToString:", CFSTR("Multiple")))
  {
    -[INCodableTimeIntervalAttributeMetadata __INCodableDescriptionDefaultUnitKey](self, "__INCodableDescriptionDefaultUnitKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

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
    v14 = v11;

    v15 = INCodableTimeIntervalAttributeMetadataUnitWithString(v14);
    self->_defaultUnit = v15;
    -[INCodableTimeIntervalAttributeMetadata __INCodableDescriptionMinimumUnitKey](self, "__INCodableDescriptionMinimumUnitKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = v17;
      else
        v18 = 0;
    }
    else
    {
      v18 = 0;
    }
    v19 = v18;

    v20 = INCodableTimeIntervalAttributeMetadataUnitWithString(v19);
    self->_minimumUnit = v20;
    -[INCodableTimeIntervalAttributeMetadata __INCodableDescriptionMaximumUnitKey](self, "__INCodableDescriptionMaximumUnitKey");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v23 = v22;
      else
        v23 = 0;
    }
    else
    {
      v23 = 0;
    }
    v24 = v23;

    v12 = (objc_class *)INCodableTimeIntervalAttributeMetadataUnitWithString(v24);
    v13 = &OBJC_IVAR___INCodableTimeIntervalAttributeMetadata__maximumUnit;
  }
  else
  {
    v12 = (objc_class *)INCodableTimeIntervalAttributeMetadataUnitWithString(v8);
    self->_defaultUnit = (int64_t)v12;
    self->_maximumUnit = (int64_t)v12;
    v13 = &OBJC_IVAR___INCodableTimeIntervalAttributeMetadata__minimumUnit;
  }
  *(Class *)((char *)&self->super.super.isa + *v13) = v12;
  -[INCodableTimeIntervalAttributeMetadata __INCodableDescriptionDefaultValueKey](self, "__INCodableDescriptionDefaultValueKey");
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

  -[INCodableTimeIntervalAttributeMetadata __INCodableDescriptionMinimumValueKey](self, "__INCodableDescriptionMinimumValueKey");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (!objc_msgSend(v31, "length"))
    {
      v32 = 0;
      goto LABEL_43;
    }
  }
  else
  {

    v31 = 0;
  }
  -[INCodableTimeIntervalAttributeMetadata __INCodableDescriptionMinimumValueKey](self, "__INCodableDescriptionMinimumValueKey");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v35 = v34;
    else
      v35 = 0;
  }
  else
  {
    v35 = 0;
  }
  v36 = v35;

  if (v36)
    v37 = v36;
  else
    v37 = &unk_1E23E9AD8;
  v32 = v37;

LABEL_43:
  minimumValue = self->_minimumValue;
  self->_minimumValue = v32;

  -[INCodableTimeIntervalAttributeMetadata __INCodableDescriptionMaximumValueKey](self, "__INCodableDescriptionMaximumValueKey");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (!objc_msgSend(v40, "length"))
    {
      v41 = 0;
      goto LABEL_57;
    }
  }
  else
  {

    v40 = 0;
  }
  -[INCodableTimeIntervalAttributeMetadata __INCodableDescriptionMaximumValueKey](self, "__INCodableDescriptionMaximumValueKey");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v44 = v43;
    else
      v44 = 0;
  }
  else
  {
    v44 = 0;
  }
  v45 = v44;

  if (v45)
    v46 = v45;
  else
    v46 = &unk_1E23E9AD8;
  v41 = v46;

LABEL_57:
  maximumValue = self->_maximumValue;
  self->_maximumValue = v41;

}

- (id)__INCodableDescriptionMinimumValueKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableTimeIntervalAttributeMetadataMinimumValueKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionMaximumValueKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableTimeIntervalAttributeMetadataMaximumValueKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionUnitKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableTimeIntervalAttributeMetadataUnitKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionDefaultValueKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableTimeIntervalAttributeMetadataDefaultValueKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  int64_t minimumUnit;
  unint64_t v5;
  const __CFString *v6;
  int64_t v7;
  const __CFString *v8;
  int64_t v9;
  const __CFString *v10;
  int64_t v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;
  _QWORD v33[7];
  _QWORD v34[9];

  v34[7] = *MEMORY[0x1E0C80C00];
  minimumUnit = self->_minimumUnit;
  if (minimumUnit == self->_maximumUnit)
  {
    v5 = minimumUnit - 1;
    if (v5 > 2)
      v6 = CFSTR("Seconds");
    else
      v6 = *(&off_1E228D850 + v5);
  }
  else
  {
    v6 = CFSTR("Multiple");
  }
  v32.receiver = self;
  v32.super_class = (Class)INCodableTimeIntervalAttributeMetadata;
  -[INCodableAttributeMetadata dictionaryRepresentationWithLocalizer:](&v32, sel_dictionaryRepresentationWithLocalizer_, a3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableTimeIntervalAttributeMetadata __INCodableDescriptionUnitKey](self, "__INCodableDescriptionUnitKey");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v31;
  v34[0] = v6;
  -[INCodableTimeIntervalAttributeMetadata __INCodableDescriptionDefaultUnitKey](self, "__INCodableDescriptionDefaultUnitKey");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v30;
  v7 = -[INCodableTimeIntervalAttributeMetadata defaultUnit](self, "defaultUnit");
  if ((unint64_t)(v7 - 1) > 2)
    v8 = CFSTR("Seconds");
  else
    v8 = *(&off_1E228D850 + v7 - 1);
  v34[1] = v8;
  -[INCodableTimeIntervalAttributeMetadata __INCodableDescriptionMinimumUnitKey](self, "__INCodableDescriptionMinimumUnitKey");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v29;
  v9 = -[INCodableTimeIntervalAttributeMetadata minimumUnit](self, "minimumUnit");
  if ((unint64_t)(v9 - 1) > 2)
    v10 = CFSTR("Seconds");
  else
    v10 = *(&off_1E228D850 + v9 - 1);
  v34[2] = v10;
  -[INCodableTimeIntervalAttributeMetadata __INCodableDescriptionMaximumUnitKey](self, "__INCodableDescriptionMaximumUnitKey");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v27;
  v11 = -[INCodableTimeIntervalAttributeMetadata maximumUnit](self, "maximumUnit");
  if ((unint64_t)(v11 - 1) > 2)
    v12 = CFSTR("Seconds");
  else
    v12 = *(&off_1E228D850 + v11 - 1);
  v34[3] = v12;
  -[INCodableTimeIntervalAttributeMetadata __INCodableDescriptionDefaultValueKey](self, "__INCodableDescriptionDefaultValueKey");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v33[4] = v26;
  -[INCodableTimeIntervalAttributeMetadata defaultValue](self, "defaultValue");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v13;
  v34[4] = v13;
  -[INCodableTimeIntervalAttributeMetadata __INCodableDescriptionMinimumValueKey](self, "__INCodableDescriptionMinimumValueKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33[5] = v15;
  -[INCodableTimeIntervalAttributeMetadata minimumValue](self, "minimumValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34[5] = v17;
  -[INCodableTimeIntervalAttributeMetadata __INCodableDescriptionMaximumValueKey](self, "__INCodableDescriptionMaximumValueKey");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v33[6] = v18;
  -[INCodableTimeIntervalAttributeMetadata maximumValue](self, "maximumValue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34[6] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "if_dictionaryByAddingEntriesFromDictionary:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  if (!v16)

  if (!v14)
  objc_msgSend(v22, "if_dictionaryWithNonEmptyValues");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (NSNumber)defaultValue
{
  if (self->_defaultValue)
    return self->_defaultValue;
  else
    return (NSNumber *)&unk_1E23E9AD8;
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
  v11.super_class = (Class)INCodableTimeIntervalAttributeMetadata;
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
    objc_msgSend(v6, "intents_setIntegerIfNonZero:forKey:", self->_defaultUnit, CFSTR("defaultUnit"));
    objc_msgSend(v6, "intents_setIntegerIfNonZero:forKey:", self->_minimumUnit, CFSTR("minimumUnit"));
    objc_msgSend(v6, "intents_setIntegerIfNonZero:forKey:", self->_maximumUnit, CFSTR("maximumUnit"));
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_defaultValue, CFSTR("defaultValue"));
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_minimumValue, CFSTR("minimumValue"));
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_maximumValue, CFSTR("maximumValue"));
    v9 = (void *)objc_msgSend(v6, "copy");
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INCodableTimeIntervalAttributeMetadata;
  v4 = a3;
  -[INCodableAttributeMetadata encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_defaultUnit, CFSTR("defaultUnit"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_minimumUnit, CFSTR("minimumUnit"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_maximumUnit, CFSTR("maximumUnit"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_defaultValue, CFSTR("defaultValue"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_minimumValue, CFSTR("minimumValue"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_maximumValue, CFSTR("maximumValue"));

}

- (INCodableTimeIntervalAttributeMetadata)initWithCoder:(id)a3
{
  id v4;
  INCodableTimeIntervalAttributeMetadata *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)INCodableTimeIntervalAttributeMetadata;
  v5 = -[INCodableAttributeMetadata initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    -[INCodableTimeIntervalAttributeMetadata setDefaultUnit:](v5, "setDefaultUnit:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("defaultUnit")));
    -[INCodableTimeIntervalAttributeMetadata setMinimumUnit:](v5, "setMinimumUnit:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("minimumUnit")));
    -[INCodableTimeIntervalAttributeMetadata setMaximumUnit:](v5, "setMaximumUnit:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maximumUnit")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultValue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableTimeIntervalAttributeMetadata setDefaultValue:](v5, "setDefaultValue:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minimumValue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableTimeIntervalAttributeMetadata setMinimumValue:](v5, "setMinimumValue:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maximumValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableTimeIntervalAttributeMetadata setMaximumValue:](v5, "setMaximumValue:", v8);

  }
  return v5;
}

- (int64_t)defaultUnit
{
  return self->_defaultUnit;
}

- (void)setDefaultUnit:(int64_t)a3
{
  self->_defaultUnit = a3;
}

- (int64_t)minimumUnit
{
  return self->_minimumUnit;
}

- (void)setMinimumUnit:(int64_t)a3
{
  self->_minimumUnit = a3;
}

- (int64_t)maximumUnit
{
  return self->_maximumUnit;
}

- (void)setMaximumUnit:(int64_t)a3
{
  self->_maximumUnit = a3;
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
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;
  id v16;

  v6 = a3;
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___INCodableTimeIntervalAttributeMetadata;
  v16 = 0;
  objc_msgSendSuper2(&v15, sel_makeFromWidgetPlistableRepresentation_error_, v6, &v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v16;
  v9 = v8;
  if (v8)
  {
    v10 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v8);
  }
  else
  {
    objc_msgSend(v7, "setDefaultUnit:", objc_msgSend(v6, "intents_intForKey:", CFSTR("defaultUnit")));
    objc_msgSend(v7, "setMinimumUnit:", objc_msgSend(v6, "intents_intForKey:", CFSTR("minimumUnit")));
    objc_msgSend(v7, "setMaximumUnit:", objc_msgSend(v6, "intents_intForKey:", CFSTR("maximumUnit")));
    objc_msgSend(v6, "intents_numberForKey:", CFSTR("defaultValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDefaultValue:", v11);

    objc_msgSend(v6, "intents_numberForKey:", CFSTR("minimumValue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMinimumValue:", v12);

    objc_msgSend(v6, "intents_numberForKey:", CFSTR("maximumValue"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMaximumValue:", v13);

    v10 = v7;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)__INTypeCodableDescriptionUnitKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableTimeIntervalAttributeMetadataUnitKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionMinimumValueKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableTimeIntervalAttributeMetadataMinimumValueKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionMinimumUnitKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableTimeIntervalAttributeMetadataMinimumUnitKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionMaximumValueKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableTimeIntervalAttributeMetadataMaximumValueKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionMaximumUnitKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableTimeIntervalAttributeMetadataMaximumUnitKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionDefaultValueKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableTimeIntervalAttributeMetadataDefaultValueKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionDefaultUnitKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableTimeIntervalAttributeMetadataDefaultUnitKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionUnitKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableTimeIntervalAttributeMetadataUnitKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionMinimumValueKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableTimeIntervalAttributeMetadataMinimumValueKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionMinimumUnitKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableTimeIntervalAttributeMetadataMinimumUnitKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionMaximumValueKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableTimeIntervalAttributeMetadataMaximumValueKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionMaximumUnitKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableTimeIntervalAttributeMetadataMaximumUnitKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionDefaultValueKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableTimeIntervalAttributeMetadataDefaultValueKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionDefaultUnitKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableTimeIntervalAttributeMetadataDefaultUnitKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionMinimumUnitKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableTimeIntervalAttributeMetadataMinimumUnitKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionMaximumUnitKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableTimeIntervalAttributeMetadataMaximumUnitKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionDefaultUnitKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableTimeIntervalAttributeMetadataDefaultUnitKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
