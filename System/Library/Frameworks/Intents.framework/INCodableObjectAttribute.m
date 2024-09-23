@implementation INCodableObjectAttribute

- (id)__INCodableDescriptionTypeKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableObjectAttributeTypeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)updateWithDictionary:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  const __CFString *v7;
  NSString *originalTypeName;
  NSString *typeName;
  NSString *v10;
  objc_super v11;

  v4 = a3;
  -[INCodableObjectAttribute __INCodableDescriptionTypeKey](self, "__INCodableDescriptionTypeKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (-[NSString isEqualToString:](v6, "isEqualToString:", CFSTR("Decimal"))
    || -[NSString isEqualToString:](v6, "isEqualToString:", CFSTR("TimeInterval")))
  {
    v7 = CFSTR("Double");
  }
  else
  {
    if (!-[NSString isEqualToString:](v6, "isEqualToString:", CFSTR("Integer")))
      goto LABEL_5;
    v7 = CFSTR("Long");
  }
  originalTypeName = self->_originalTypeName;
  self->_originalTypeName = v6;

  v6 = (NSString *)v7;
LABEL_5:
  typeName = self->_typeName;
  self->_typeName = v6;
  v10 = v6;

  v11.receiver = self;
  v11.super_class = (Class)INCodableObjectAttribute;
  -[INCodableAttribute updateWithDictionary:](&v11, sel_updateWithDictionary_, v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  unsigned int v10;
  objc_super v12;

  v5 = a3;
  if (objc_msgSend(v5, "isMemberOfClass:", objc_opt_class()))
  {
    -[INCodableObjectAttribute typeName](self, "typeName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 || (objc_msgSend(v5, "typeName"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[INCodableObjectAttribute typeName](self, "typeName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "typeName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

      if (v6)
      {
LABEL_9:

        v12.receiver = self;
        v12.super_class = (Class)INCodableObjectAttribute;
        v10 = -[INCodableAttribute isEqual:](&v12, sel_isEqual_, v5) & v9;
        goto LABEL_10;
      }
    }
    else
    {
      v9 = 1;
    }

    goto LABEL_9;
  }
  LOBYTE(v10) = 0;
LABEL_10:

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  objc_super v7;

  -[INCodableObjectAttribute typeName](self, "typeName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v7.receiver = self;
  v7.super_class = (Class)INCodableObjectAttribute;
  v5 = -[INCodableAttribute hash](&v7, sel_hash) ^ v4;

  return v5;
}

- (NSValueTransformer)valueTransformer
{
  void *v2;
  void *v3;
  id v4;
  NSString *v5;
  objc_class *v6;
  void *v7;
  NSValueTransformer *v8;

  -[INCodableObjectAttribute typeName](self, "typeName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_IN%@ValueTransformer"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B20], "valueTransformerForName:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INIntent%@SlotValueTransformer"), v2);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = NSClassFromString(v5);
    if (v6)
    {
      v4 = objc_alloc_init(v6);
      objc_msgSend(MEMORY[0x1E0CB3B20], "setValueTransformer:forName:", v4, v5);
    }
    else
    {
      v4 = 0;
    }

  }
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (objc_msgSend((id)objc_opt_class(), "reverseTransformedValueClass"))
      v7 = v4;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  return v8;
}

- (NSString)typeName
{
  return self->_typeName;
}

- (void)setTypeName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INCodableObjectAttribute;
  v4 = a3;
  -[INCodableAttribute encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_typeName, CFSTR("typeName"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_originalTypeName, CFSTR("_originalTypeName"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeName, 0);
  objc_storeStrong((id *)&self->_originalTypeName, 0);
}

- (INCodableObjectAttribute)initWithCoder:(id)a3
{
  id v4;
  INCodableObjectAttribute *v5;
  uint64_t v6;
  NSString *typeName;
  uint64_t v8;
  NSString *originalTypeName;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)INCodableObjectAttribute;
  v5 = -[INCodableAttribute initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("typeName"));
    v6 = objc_claimAutoreleasedReturnValue();
    typeName = v5->_typeName;
    v5->_typeName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_originalTypeName"));
    v8 = objc_claimAutoreleasedReturnValue();
    originalTypeName = v5->_originalTypeName;
    v5->_originalTypeName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("className"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_storeStrong((id *)&v5->_typeName, v10);

  }
  return v5;
}

- (int64_t)valueType
{
  void *v2;
  int64_t v3;

  -[INCodableObjectAttribute valueTransformer](self, "valueTransformer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_respondsToSelector() & 1) != 0))
    v3 = objc_msgSend((id)objc_opt_class(), "_intents_valueType");
  else
    v3 = 225;

  return v3;
}

- (Class)resolutionResultClass
{
  void *v2;
  void *v3;

  -[INCodableObjectAttribute valueTransformer](self, "valueTransformer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_intents_resolutionResultClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v3;
}

- (int64_t)_attributeType
{
  return 4;
}

- (Class)objectClass
{
  void *v2;
  void *v3;

  -[INCodableObjectAttribute valueTransformer](self, "valueTransformer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "transformedValueClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v3;
}

- (Class)_relationshipValueTransformerClass
{
  objc_class *v3;
  void *v4;
  void *v5;
  NSString *v6;
  Class v7;
  void *v8;
  void *v9;
  objc_class *v10;

  v3 = -[INCodableObjectAttribute objectClass](self, "objectClass");
  if (v3 == (objc_class *)objc_opt_class())
    goto LABEL_4;
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[INCodableAttribute _typeString](self, "_typeString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("_INCodableObjectAttributeRelationship%@ValueTransformer"), v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = NSClassFromString(v6);

  if (!v7)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v9)
  {
    v10 = v7;
  }
  else
  {
LABEL_4:
    objc_opt_class();
    v10 = (objc_class *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *originalTypeName;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)INCodableObjectAttribute;
  -[INCodableAttribute dictionaryRepresentationWithLocalizer:](&v14, sel_dictionaryRepresentationWithLocalizer_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableObjectAttribute typeName](self, "typeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Double")) & 1) != 0)
  {
    v6 = CFSTR("Decimal");
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("Long")))
      goto LABEL_6;
    v6 = CFSTR("Integer");
  }

  v5 = (void *)v6;
LABEL_6:
  -[INCodableObjectAttribute __INCodableDescriptionTypeKey](self, "__INCodableDescriptionTypeKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v7;
  originalTypeName = self->_originalTypeName;
  if (originalTypeName)
  {
    v9 = 0;
  }
  else if (v5)
  {
    v9 = 0;
    originalTypeName = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    originalTypeName = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 1;
  }
  v16[0] = originalTypeName;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_dictionaryByAddingEntriesFromDictionary:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  objc_msgSend(v11, "if_dictionaryWithNonEmptyValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)INCodableObjectAttribute;
  v4 = -[INCodableAttribute copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[INCodableObjectAttribute typeName](self, "typeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTypeName:", v5);

  -[INCodableObjectAttribute _originalTypeName](self, "_originalTypeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setOriginalTypeName:", v6);

  return v4;
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
  v11.super_class = (Class)INCodableObjectAttribute;
  v12 = 0;
  -[INCodableAttribute widgetPlistableRepresentationWithParameters:error:](&v11, sel_widgetPlistableRepresentationWithParameters_error_, a3, &v12);
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
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_typeName, CFSTR("typeName"));
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_originalTypeName, CFSTR("_originalTypeName"));
    v9 = v6;
  }

  return v9;
}

- (NSString)_originalTypeName
{
  return self->_originalTypeName;
}

- (void)_setOriginalTypeName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
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
  objc_super v16;
  id v17;

  v6 = a3;
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___INCodableObjectAttribute;
  v17 = 0;
  objc_msgSendSuper2(&v16, sel_makeFromWidgetPlistableRepresentation_error_, v6, &v17);
  v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  v9 = v8;
  if (v8)
  {
    v10 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v8);
  }
  else
  {
    objc_msgSend(v6, "intents_stringForKey:", CFSTR("typeName"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v7[20];
    v7[20] = v11;

    objc_msgSend(v6, "intents_stringForKey:", CFSTR("_originalTypeName"));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v7[19];
    v7[19] = v13;

    v10 = v7;
  }

  return v10;
}

- (id)__INTypeCodableDescriptionTypeKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableObjectAttributeTypeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableObjectAttributeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionTypeKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableObjectAttributeTypeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableObjectAttributeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableObjectAttributeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
