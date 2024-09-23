@implementation INCodablePlacemarkAttributeMetadata

- (void)updateWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  int64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)INCodablePlacemarkAttributeMetadata;
  v4 = a3;
  -[INCodableAttributeMetadata updateWithDictionary:](&v10, sel_updateWithDictionary_, v4);
  -[INCodablePlacemarkAttributeMetadata __INCodableDescriptionTypeKey](self, "__INCodableDescriptionTypeKey", v10.receiver, v10.super_class);
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

  v9 = INCodablePlacemarkAttributeMetadataTypeWithString(v8);
  self->_type = v9;
}

- (id)__INCodableDescriptionTypeKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodablePlacemarkAttributeMetadataTypeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (INCodablePlacemarkAttributeMetadata)initWithCoder:(id)a3
{
  id v4;
  INCodablePlacemarkAttributeMetadata *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)INCodablePlacemarkAttributeMetadata;
  v5 = -[INCodableAttributeMetadata initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    -[INCodablePlacemarkAttributeMetadata setType:](v5, "setType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type")));

  return v5;
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
  v5.super_class = (Class)INCodablePlacemarkAttributeMetadata;
  v4 = a3;
  -[INCodableAttributeMetadata encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, CFSTR("type"), v5.receiver, v5.super_class);

}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  void *v4;
  void *v5;
  int64_t v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)INCodablePlacemarkAttributeMetadata;
  -[INCodableAttributeMetadata dictionaryRepresentationWithLocalizer:](&v14, sel_dictionaryRepresentationWithLocalizer_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodablePlacemarkAttributeMetadata __INCodableDescriptionTypeKey](self, "__INCodableDescriptionTypeKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v5;
  v6 = -[INCodablePlacemarkAttributeMetadata type](self, "type");
  v7 = CFSTR("Name");
  if (v6 == 1)
    v7 = CFSTR("Address");
  if (v6 == 2)
    v7 = CFSTR("City");
  v16[0] = v7;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = v7;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "if_dictionaryByAddingEntriesFromDictionary:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "if_dictionaryWithNonEmptyValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
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
  v11.super_class = (Class)INCodablePlacemarkAttributeMetadata;
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
    v9 = (void *)objc_msgSend(v6, "copy");
  }

  return v9;
}

- (int64_t)type
{
  return self->_type;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  objc_super v12;
  id v13;

  v6 = a3;
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___INCodablePlacemarkAttributeMetadata;
  v13 = 0;
  objc_msgSendSuper2(&v12, sel_makeFromWidgetPlistableRepresentation_error_, v6, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
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
    objc_msgSend(v7, "setType:", objc_msgSend(v6, "intents_intForKey:", CFSTR("type")));
    v10 = v7;
  }

  return v10;
}

- (id)__INTypeCodableDescriptionTypeKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodablePlacemarkAttributeMetadataTypeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodablePlacemarkAttributeMetadataKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionTypeKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodablePlacemarkAttributeMetadataTypeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodablePlacemarkAttributeMetadataKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodablePlacemarkAttributeMetadataKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
