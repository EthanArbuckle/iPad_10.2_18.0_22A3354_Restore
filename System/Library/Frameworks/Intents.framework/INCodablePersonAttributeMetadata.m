@implementation INCodablePersonAttributeMetadata

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
  v10.super_class = (Class)INCodablePersonAttributeMetadata;
  v4 = a3;
  -[INCodableAttributeMetadata updateWithDictionary:](&v10, sel_updateWithDictionary_, v4);
  -[INCodablePersonAttributeMetadata __INCodableDescriptionTypeKey](self, "__INCodableDescriptionTypeKey", v10.receiver, v10.super_class);
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

  v9 = INCodablePersonAttributeMetadataTypeWithString(v8);
  self->_type = v9;
}

- (id)__INCodableDescriptionTypeKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodablePersonAttributeMetadataTypeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  void *v4;
  void *v5;
  int64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)INCodablePersonAttributeMetadata;
  -[INCodableAttributeMetadata dictionaryRepresentationWithLocalizer:](&v12, sel_dictionaryRepresentationWithLocalizer_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodablePersonAttributeMetadata __INCodableDescriptionTypeKey](self, "__INCodableDescriptionTypeKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v5;
  v6 = -[INCodablePersonAttributeMetadata type](self, "type");
  if ((unint64_t)(v6 - 1) > 3)
    v7 = CFSTR("Contact");
  else
    v7 = off_1E228FB38[v6 - 1];
  v14[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_dictionaryByAddingEntriesFromDictionary:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "if_dictionaryWithNonEmptyValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
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
  v11.super_class = (Class)INCodablePersonAttributeMetadata;
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

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INCodablePersonAttributeMetadata;
  v4 = a3;
  -[INCodableAttributeMetadata encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, CFSTR("type"), v5.receiver, v5.super_class);

}

- (INCodablePersonAttributeMetadata)initWithCoder:(id)a3
{
  id v4;
  INCodablePersonAttributeMetadata *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)INCodablePersonAttributeMetadata;
  v5 = -[INCodableAttributeMetadata initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    -[INCodablePersonAttributeMetadata setType:](v5, "setType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type")));

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
  v12.super_class = (Class)&OBJC_METACLASS___INCodablePersonAttributeMetadata;
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
  objc_msgSend((id)objc_opt_class(), "__INCodablePersonAttributeMetadataTypeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodablePersonAttributeMetadataKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionTypeKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodablePersonAttributeMetadataTypeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodablePersonAttributeMetadataKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodablePersonAttributeMetadataKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
