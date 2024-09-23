@implementation INCodableEnumAttributeMetadata

- (void)updateWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  INCodableEnumValue *v12;
  INCodableEnumValue *defaultValue;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)INCodableEnumAttributeMetadata;
  v4 = a3;
  -[INCodableAttributeMetadata updateWithDictionary:](&v14, sel_updateWithDictionary_, v4);
  -[INCodableAttributeMetadata codableAttribute](self, "codableAttribute", v14.receiver, v14.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  -[INCodableEnumAttributeMetadata __INCodableDescriptionDefaultValueKey](self, "__INCodableDescriptionDefaultValueKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  objc_msgSend(v7, "valueWithName:", v11);
  v12 = (INCodableEnumValue *)objc_claimAutoreleasedReturnValue();

  defaultValue = self->_defaultValue;
  self->_defaultValue = v12;

}

- (id)__INCodableDescriptionDefaultValueKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableEnumAttributeMetadataDefaultValueKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)INCodableEnumAttributeMetadata;
  -[INCodableAttributeMetadata dictionaryRepresentationWithLocalizer:](&v13, sel_dictionaryRepresentationWithLocalizer_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableEnumAttributeMetadata __INCodableDescriptionDefaultValueKey](self, "__INCodableDescriptionDefaultValueKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v5;
  -[INCodableEnumAttributeMetadata defaultValue](self, "defaultValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_dictionaryByAddingEntriesFromDictionary:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  objc_msgSend(v10, "if_dictionaryWithNonEmptyValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)defaultValueForIntentDefaultValueProvider
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[INCodableEnumAttributeMetadata defaultValue](self, "defaultValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithInteger:", objc_msgSend(v3, "index"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  INCodableEnumValue *defaultValue;
  id v13;
  objc_super v14;
  id v15;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)INCodableEnumAttributeMetadata;
  v15 = 0;
  -[INCodableAttributeMetadata widgetPlistableRepresentationWithParameters:error:](&v14, sel_widgetPlistableRepresentationWithParameters_error_, v6, &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v15;
  if (!v8)
  {
    defaultValue = self->_defaultValue;
    v13 = 0;
    objc_msgSend(v7, "intents_setWidgetPlistRepresentable:forKey:parameters:error:", defaultValue, CFSTR("defaultValue"), v6, &v13);
    v9 = v13;
    if (!v9)
    {
      v10 = (void *)objc_msgSend(v7, "copy");
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

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INCodableEnumAttributeMetadata;
  v4 = a3;
  -[INCodableAttributeMetadata encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_defaultValue, CFSTR("defaultValue"), v5.receiver, v5.super_class);

}

- (INCodableEnumAttributeMetadata)initWithCoder:(id)a3
{
  id v4;
  INCodableEnumAttributeMetadata *v5;
  uint64_t v6;
  INCodableEnumValue *defaultValue;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INCodableEnumAttributeMetadata;
  v5 = -[INCodableAttributeMetadata initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultValue"));
    v6 = objc_claimAutoreleasedReturnValue();
    defaultValue = v5->_defaultValue;
    v5->_defaultValue = (INCodableEnumValue *)v6;

  }
  return v5;
}

- (INCodableEnumValue)defaultValue
{
  return self->_defaultValue;
}

- (void)setDefaultValue:(id)a3
{
  objc_storeStrong((id *)&self->_defaultValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultValue, 0);
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  _QWORD *v7;
  id v8;
  id v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  id v14;
  objc_super v15;
  id v16;

  v6 = a3;
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___INCodableEnumAttributeMetadata;
  v16 = 0;
  objc_msgSendSuper2(&v15, sel_makeFromWidgetPlistableRepresentation_error_, v6, &v16);
  v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v8 = v16;
  if (!v8)
  {
    v14 = 0;
    +[NSObject intents_widgetPlistRepresentableInDict:key:error:](INCodableEnumValue, "intents_widgetPlistRepresentableInDict:key:error:", v6, CFSTR("defaultValue"), &v14);
    v11 = objc_claimAutoreleasedReturnValue();
    v9 = v14;
    v12 = (void *)v7[5];
    v7[5] = v11;

    if (!v9)
    {
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

- (id)__INTypeCodableDescriptionDefaultValueKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableEnumAttributeMetadataDefaultValueKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableEnumAttributeMetadataKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionDefaultValueKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableEnumAttributeMetadataDefaultValueKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableEnumAttributeMetadataKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableEnumAttributeMetadataKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
