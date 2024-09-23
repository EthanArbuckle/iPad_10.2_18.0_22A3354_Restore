@implementation INCodableScalarAttribute

- (id)__INCodableDescriptionTypeKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableScalarAttributeTypeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)updateWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[INCodableScalarAttribute __INCodableDescriptionTypeKey](self, "__INCodableDescriptionTypeKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_type = INCodableScalarAttributeTypeFromString(v6, -[INCodableAttribute modifier](self, "modifier"));

  v7.receiver = self;
  v7.super_class = (Class)INCodableScalarAttribute;
  -[INCodableAttribute updateWithDictionary:](&v7, sel_updateWithDictionary_, v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int64_t v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (v8.receiver = self,
        v8.super_class = (Class)INCodableScalarAttribute,
        -[INCodableAttribute isEqual:](&v8, sel_isEqual_, v4)))
  {
    v5 = -[INCodableScalarAttribute type](self, "type");
    v6 = v5 == objc_msgSend(v4, "type");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[INCodableScalarAttribute type](self, "type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v7.receiver = self;
  v7.super_class = (Class)INCodableScalarAttribute;
  v5 = -[INCodableAttribute hash](&v7, sel_hash) ^ v4;

  return v5;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INCodableScalarAttribute;
  v4 = a3;
  -[INCodableAttribute encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, CFSTR("type"), v5.receiver, v5.super_class);

}

- (INCodableScalarAttribute)initWithCoder:(id)a3
{
  id v4;
  INCodableScalarAttribute *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)INCodableScalarAttribute;
  v5 = -[INCodableAttribute initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));

  return v5;
}

- (INCodableScalarAttribute)initWithPropertyName:(id)a3 type:(int64_t)a4
{
  id v6;
  INCodableScalarAttribute *v7;
  INCodableScalarAttribute *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)INCodableScalarAttribute;
  v7 = -[INCodableScalarAttribute init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_type = a4;
    -[INCodableAttribute setModifier:](v7, "setModifier:", 1);
    -[INCodableAttribute setPropertyName:](v8, "setPropertyName:", v6);
  }

  return v8;
}

- (int64_t)_attributeType
{
  return 2;
}

- (int64_t)valueType
{
  unint64_t v2;

  v2 = -[INCodableScalarAttribute type](self, "type");
  if (v2 > 7)
    return 0;
  else
    return qword_18C3119F8[v2];
}

- (Class)objectClass
{
  void *v2;

  if ((unint64_t)-[INCodableScalarAttribute type](self, "type") > 8)
  {
    v2 = 0;
  }
  else
  {
    objc_opt_class();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (Class)v2;
}

- (Class)resolutionResultClass
{
  void *v2;

  if ((unint64_t)-[INCodableScalarAttribute type](self, "type") > 8)
  {
    v2 = 0;
  }
  else
  {
    objc_opt_class();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (Class)v2;
}

- (Class)_relationshipValueTransformerClass
{
  void *v2;

  if (-[INCodableScalarAttribute type](self, "type") == 7)
  {
    objc_opt_class();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (Class)v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)INCodableScalarAttribute;
  v4 = -[INCodableAttribute copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setType:", -[INCodableScalarAttribute type](self, "type"));
  return v4;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  __CFString *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)INCodableScalarAttribute;
  -[INCodableAttribute dictionaryRepresentationWithLocalizer:](&v13, sel_dictionaryRepresentationWithLocalizer_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableScalarAttribute __INCodableDescriptionTypeKey](self, "__INCodableDescriptionTypeKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v5;
  v6 = -[INCodableScalarAttribute type](self, "type");
  if (v6 <= 8 && ((0x1CDu >> v6) & 1) != 0)
  {
    v8 = 0;
    v7 = off_1E228CF28[v6];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v8 = 1;
  }
  v15[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_dictionaryByAddingEntriesFromDictionary:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  objc_msgSend(v10, "if_dictionaryWithNonEmptyValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
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
  v11.super_class = (Class)INCodableScalarAttribute;
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
    objc_msgSend(v6, "intents_setIntegerIfNonZero:forKey:", self->_type, CFSTR("type"));
    v9 = v6;
  }

  return v9;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  _QWORD *v7;
  id v8;
  void *v9;
  _QWORD *v10;
  objc_super v12;
  id v13;

  v6 = a3;
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___INCodableScalarAttribute;
  v13 = 0;
  objc_msgSendSuper2(&v12, sel_makeFromWidgetPlistableRepresentation_error_, v6, &v13);
  v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  v9 = v8;
  if (v8)
  {
    v10 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v8);
  }
  else
  {
    v7[19] = objc_msgSend(v6, "intents_intForKey:", CFSTR("type"));
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
  objc_msgSend((id)objc_opt_class(), "__INCodableScalarAttributeTypeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableScalarAttributeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionTypeKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableScalarAttributeTypeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableScalarAttributeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableScalarAttributeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
