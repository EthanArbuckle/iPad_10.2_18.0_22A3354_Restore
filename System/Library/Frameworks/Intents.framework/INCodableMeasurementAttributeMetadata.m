@implementation INCodableMeasurementAttributeMetadata

- (void)updateWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSUnit *v9;
  NSUnit *unit;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSOrderedSet *v16;
  NSOrderedSet *defaultUnits;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  double v27;
  double v28;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)INCodableMeasurementAttributeMetadata;
  -[INCodableAttributeMetadata updateWithDictionary:](&v29, sel_updateWithDictionary_, v4);
  -[INCodableMeasurementAttributeMetadata __INCodableDescriptionUnitKey](self, "__INCodableDescriptionUnitKey");
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

  -[INCodableMeasurementAttributeMetadata _unitWithUnitName:](self, "_unitWithUnitName:", v8);
  v9 = (NSUnit *)objc_claimAutoreleasedReturnValue();

  unit = self->_unit;
  self->_unit = v9;

  if (!self->_unit)
  {
    -[INCodableMeasurementAttributeMetadata __INCodableDescriptionDefaultUnitKey](self, "__INCodableDescriptionDefaultUnitKey");
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

    objc_msgSend(v14, "componentsSeparatedByString:", CFSTR("/"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[INCodableMeasurementAttributeMetadata _defaultUnitWithNames:](self, "_defaultUnitWithNames:", v15);
    v16 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
    defaultUnits = self->_defaultUnits;
    self->_defaultUnits = v16;

  }
  -[INCodableMeasurementAttributeMetadata __INCodableDescriptionSupportsNegativeNumbersKey](self, "__INCodableDescriptionSupportsNegativeNumbersKey");
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

  v22 = objc_msgSend(v21, "BOOLValue");
  self->_supportsNegativeNumbers = v22;
  -[INCodableMeasurementAttributeMetadata __INCodableDescriptionDefaultValueKey](self, "__INCodableDescriptionDefaultValueKey");
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

  objc_msgSend(v26, "doubleValue");
  v28 = v27;

  self->_defaultValue = v28;
}

- (id)__INCodableDescriptionUnitKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableMeasurementAttributeMetadataUnitKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionSupportsNegativeNumbersKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableMeasurementAttributeMetadataSupportsNegativeNumbersKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionDefaultValueKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableMeasurementAttributeMetadataDefaultValueKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionDefaultUnitKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableMeasurementAttributeMetadataDefaultUnitKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_unitWithUnitName:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  NSString *v7;
  NSString *v8;

  v4 = a3;
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "isEqualToString:", CFSTR("Any")) & 1) == 0)
  {
    v6 = -[INCodableMeasurementAttributeMetadata _unitClass](self, "_unitClass");
    objc_msgSend(v5, "if_stringByLowercasingFirstCharacter");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      NSSelectorFromString(v7);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[objc_class valueForKey:](v6, "valueForKey:", v8);
        v6 = (objc_class *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = 0;
      }
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_defaultUnitWithNames:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        -[INCodableMeasurementAttributeMetadata _unitWithUnitName:](self, "_unitWithUnitName:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
    v12 = (void *)objc_msgSend(v5, "copy");
  else
    v12 = 0;

  return v12;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  uint64_t v4;
  const __CFString *v5;
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
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;
  _QWORD v28[4];
  _QWORD v29[6];

  v29[4] = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)INCodableMeasurementAttributeMetadata;
  -[INCodableAttributeMetadata dictionaryRepresentationWithLocalizer:](&v27, sel_dictionaryRepresentationWithLocalizer_, a3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableMeasurementAttributeMetadata __INCodableDescriptionUnitKey](self, "__INCodableDescriptionUnitKey");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v26;
  -[INCodableMeasurementAttributeMetadata unit](self, "unit");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "_intents_stringRepresentation");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("Any");
  v20 = (void *)v4;
  if (v4)
    v5 = (const __CFString *)v4;
  v29[0] = v5;
  -[INCodableMeasurementAttributeMetadata __INCodableDescriptionDefaultUnitKey](self, "__INCodableDescriptionDefaultUnitKey");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v24;
  -[NSOrderedSet array](self->_defaultUnits, "array");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "if_map:", &__block_literal_global_71111);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "componentsJoinedByString:", CFSTR("/"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v29[1] = v6;
  -[INCodableMeasurementAttributeMetadata __INCodableDescriptionSupportsNegativeNumbersKey](self, "__INCodableDescriptionSupportsNegativeNumbersKey", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INCodableMeasurementAttributeMetadata supportsNegativeNumbers](self, "supportsNegativeNumbers"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[2] = v10;
  -[INCodableMeasurementAttributeMetadata __INCodableDescriptionDefaultValueKey](self, "__INCodableDescriptionDefaultValueKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v11;
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[INCodableMeasurementAttributeMetadata defaultValue](self, "defaultValue");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "if_dictionaryByAddingEntriesFromDictionary:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  if (!v9)

  if (!v7)
  objc_msgSend(v16, "if_dictionaryWithNonEmptyValues");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)defaultValueForIntentDefaultValueProvider
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[INCodableMeasurementAttributeMetadata unit](self, "unit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    || (-[INCodableMeasurementAttributeMetadata defaultUnits](self, "defaultUnits"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "firstObject"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3))
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3758]);
    -[INCodableMeasurementAttributeMetadata defaultValue](self, "defaultValue");
    v6 = (void *)objc_msgSend(v5, "initWithDoubleValue:unit:", v3);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (Class)_unitClass
{
  objc_class *v3;
  void *v4;
  void *v5;
  NSString *v6;
  void *v7;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableAttributeMetadata name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v7;
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  objc_super v18;
  id v19;

  v18.receiver = self;
  v18.super_class = (Class)INCodableMeasurementAttributeMetadata;
  v19 = 0;
  -[INCodableAttributeMetadata widgetPlistableRepresentationWithParameters:error:](&v18, sel_widgetPlistableRepresentationWithParameters_error_, a3, &v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v19;
  v8 = v7;
  if (v7)
  {
    v9 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v7);
  }
  else
  {
    objc_msgSend(v6, "intents_setBoolIfTrue:forKey:", self->_supportsNegativeNumbers, CFSTR("supportsNegativeNumbers"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_defaultValue);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", v10, CFSTR("defaultValue"));

    -[INCodableMeasurementAttributeMetadata unit](self, "unit");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_intents_stringRepresentation");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      v14 = (const __CFString *)v12;
    else
      v14 = CFSTR("Any");
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", v14, CFSTR("unit"));

    -[NSOrderedSet if_map:](self->_defaultUnits, "if_map:", &__block_literal_global_76);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", v16, CFSTR("defaultUnits"));
    v9 = (void *)objc_msgSend(v6, "copy");

  }
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INCodableMeasurementAttributeMetadata;
  v4 = a3;
  -[INCodableAttributeMetadata encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_supportsNegativeNumbers, CFSTR("supportsNegativeNumbers"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("defaultValue"), self->_defaultValue);
  objc_msgSend(v4, "encodeObject:forKey:", self->_unit, CFSTR("unit"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_defaultUnits, CFSTR("defaultUnits"));

}

- (INCodableMeasurementAttributeMetadata)initWithCoder:(id)a3
{
  id v4;
  INCodableMeasurementAttributeMetadata *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)INCodableMeasurementAttributeMetadata;
  v5 = -[INCodableAttributeMetadata initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    -[INCodableMeasurementAttributeMetadata setSupportsNegativeNumbers:](v5, "setSupportsNegativeNumbers:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsNegativeNumbers")));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("defaultValue"));
    -[INCodableMeasurementAttributeMetadata setDefaultValue:](v5, "setDefaultValue:");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("unit"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableMeasurementAttributeMetadata setUnit:](v5, "setUnit:", v6);

    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("defaultUnits"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableMeasurementAttributeMetadata setDefaultUnits:](v5, "setDefaultUnits:", v10);

  }
  return v5;
}

- (NSUnit)unit
{
  return self->_unit;
}

- (void)setUnit:(id)a3
{
  objc_storeStrong((id *)&self->_unit, a3);
}

- (NSOrderedSet)defaultUnits
{
  return self->_defaultUnits;
}

- (void)setDefaultUnits:(id)a3
{
  objc_storeStrong((id *)&self->_defaultUnits, a3);
}

- (double)defaultValue
{
  return self->_defaultValue;
}

- (void)setDefaultValue:(double)a3
{
  self->_defaultValue = a3;
}

- (BOOL)supportsNegativeNumbers
{
  return self->_supportsNegativeNumbers;
}

- (void)setSupportsNegativeNumbers:(BOOL)a3
{
  self->_supportsNegativeNumbers = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultUnits, 0);
  objc_storeStrong((id *)&self->_unit, 0);
}

__CFString *__91__INCodableMeasurementAttributeMetadata_widgetPlistableRepresentationWithParameters_error___block_invoke(uint64_t a1, void *a2)
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(a2, "_intents_stringRepresentation");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("Any");
  v4 = v2;

  return v4;
}

uint64_t __79__INCodableMeasurementAttributeMetadata_dictionaryRepresentationWithLocalizer___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_intents_stringRepresentation");
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
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v20;
  _QWORD v21[4];
  id v22;
  objc_super v23;
  id v24;

  v6 = a3;
  v23.receiver = a1;
  v23.super_class = (Class)&OBJC_METACLASS___INCodableMeasurementAttributeMetadata;
  v24 = 0;
  objc_msgSendSuper2(&v23, sel_makeFromWidgetPlistableRepresentation_error_, v6, &v24);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v24;
  if (v8)
  {
    v9 = v8;
    if (a4)
    {
      v9 = objc_retainAutorelease(v8);
      v10 = 0;
      *a4 = v9;
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    objc_msgSend(v7, "setSupportsNegativeNumbers:", objc_msgSend(v6, "intents_BOOLForKey:", CFSTR("supportsNegativeNumbers")));
    objc_msgSend(v6, "intents_doubleForKey:", CFSTR("defaultValue"));
    objc_msgSend(v7, "setDefaultValue:");
    objc_msgSend(v6, "intents_stringForKey:", CFSTR("unit"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11
      || (objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to decode measurement unit: %@"), 0),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          INIntentError(8001, v20, 0),
          v9 = (id)objc_claimAutoreleasedReturnValue(),
          v20,
          !v9))
    {
      objc_msgSend(v7, "_unitWithUnitName:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setUnit:", v12);

      objc_msgSend(v6, "intents_safeObjectForKey:ofType:", CFSTR("defaultUnits"), objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __85__INCodableMeasurementAttributeMetadata_makeFromWidgetPlistableRepresentation_error___block_invoke;
      v21[3] = &unk_1E228FAA0;
      v14 = v7;
      v22 = v14;
      objc_msgSend(v13, "if_compactMap:", v21);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");
      if (v16 == objc_msgSend(v13, "count")
        || (objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to decode measurement units: %@"), v13),
            v17 = (void *)objc_claimAutoreleasedReturnValue(),
            INIntentError(8001, v17, 0),
            v9 = (id)objc_claimAutoreleasedReturnValue(),
            v17,
            !v9))
      {
        objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setDefaultUnits:", v18);

        v10 = v14;
        v9 = 0;
      }
      else if (a4)
      {
        v9 = objc_retainAutorelease(v9);
        v10 = 0;
        *a4 = v9;
      }
      else
      {
        v10 = 0;
      }

    }
    else if (a4)
    {
      v9 = objc_retainAutorelease(v9);
      v10 = 0;
      *a4 = v9;
    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

id __85__INCodableMeasurementAttributeMetadata_makeFromWidgetPlistableRepresentation_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_unitWithUnitName:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)__INTypeCodableDescriptionUnitKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableMeasurementAttributeMetadataUnitKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionSupportsNegativeNumbersKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableMeasurementAttributeMetadataSupportsNegativeNumbersKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionDefaultValueKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableMeasurementAttributeMetadataDefaultValueKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionDefaultUnitKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableMeasurementAttributeMetadataDefaultUnitKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionUnitKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableMeasurementAttributeMetadataUnitKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionSupportsNegativeNumbersKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableMeasurementAttributeMetadataSupportsNegativeNumbersKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionDefaultValueKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableMeasurementAttributeMetadataDefaultValueKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionDefaultUnitKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableMeasurementAttributeMetadataDefaultUnitKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
