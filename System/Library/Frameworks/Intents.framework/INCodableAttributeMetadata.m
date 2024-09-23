@implementation INCodableAttributeMetadata

- (INCodableAttributeMetadata)initWithCoder:(id)a3
{
  id v4;
  INCodableAttributeMetadata *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSString *name;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSString *placeholder;
  uint64_t v16;
  NSString *placeholderID;
  void *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)INCodableAttributeMetadata;
  v5 = -[INCodableAttributeMetadata init](&v20, sel_init);
  if (v5)
  {
    v6 = v4;
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

    objc_msgSend(v8, "_allowDecodingCyclesInSecureMode");
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v9 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "decodeObjectOfClasses:forKey:", v13, CFSTR("placeholder"));
    v14 = objc_claimAutoreleasedReturnValue();
    placeholder = v5->_placeholder;
    v5->_placeholder = (NSString *)v14;

    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("placeholderID"));
    v16 = objc_claimAutoreleasedReturnValue();
    placeholderID = v5->_placeholderID;
    v5->_placeholderID = (NSString *)v16;

    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("codableAttribute"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_codableAttribute, v18);

  }
  return v5;
}

- (INCodableDescription)_codableDescription
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata codableAttribute](self, "codableAttribute");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_codableDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (INCodableDescription *)v3;
}

- (INCodableAttribute)codableAttribute
{
  return (INCodableAttribute *)objc_loadWeakRetained((id *)&self->_codableAttribute);
}

- (INCodableAttributeMetadata)initWithName:(id)a3 codableAttribute:(id)a4
{
  id v6;
  id v7;
  INCodableAttributeMetadata *v8;
  uint64_t v9;
  NSString *name;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)INCodableAttributeMetadata;
  v8 = -[INCodableAttributeMetadata init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v9;

    objc_storeWeak((id *)&v8->_codableAttribute, v7);
  }

  return v8;
}

- (void)updateWithDictionary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *placeholder;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  NSString *placeholderID;
  id v14;

  v14 = a3;
  -[INCodableAttributeMetadata __INCodableDescriptionPlaceholderKey](self, "__INCodableDescriptionPlaceholderKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v4);
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

  placeholder = self->_placeholder;
  self->_placeholder = v7;

  -[INCodableAttributeMetadata __INCodableDescriptionPlaceholderIDKey](self, "__INCodableDescriptionPlaceholderIDKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v9);
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
  v12 = v11;

  placeholderID = self->_placeholderID;
  self->_placeholderID = v12;

}

- (id)__INCodableDescriptionPlaceholderIDKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeMetadataPlaceholderIDKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionPlaceholderKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeMetadataPlaceholderKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;
  id WeakRetained;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_placeholder, CFSTR("placeholder"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_placeholderID, CFSTR("placeholderID"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_codableAttribute);
  objc_msgSend(v5, "encodeConditionalObject:forKey:", WeakRetained, CFSTR("codableAttribute"));

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_codableAttribute);
  objc_storeStrong((id *)&self->_placeholderID, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[INCodableAttributeMetadata dictionaryRepresentationWithLocalizer:](self, "dictionaryRepresentationWithLocalizer:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[INCodableAttributeMetadata __INCodableDescriptionPlaceholderKey](self, "__INCodableDescriptionPlaceholderKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  -[INCodableAttributeMetadata localizedPlaceholderWithLocalizer:](self, "localizedPlaceholderWithLocalizer:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[0] = v7;
  -[INCodableAttributeMetadata __INCodableDescriptionPlaceholderIDKey](self, "__INCodableDescriptionPlaceholderIDKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v8;
  -[INCodableAttributeMetadata placeholderID](self, "placeholderID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)

  if (!v6)
  objc_msgSend(v11, "if_dictionaryWithNonEmptyValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)description
{
  return (NSString *)-[INCodableAttributeMetadata descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INCodableAttributeMetadata;
  -[INCodableAttributeMetadata description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableAttributeMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (INCodableLocalizationTable)_localizationTable
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[INCodableAttributeMetadata codableAttribute](self, "codableAttribute");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_codableDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "_customLocalizationTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v3, "_localizationTable");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return (INCodableLocalizationTable *)v7;
}

- (NSString)localizedPlaceholder
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[INCodableAttributeMetadata localizedPlaceholderWithLocalizer:](self, "localizedPlaceholderWithLocalizer:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)localizedPlaceholderWithLocalizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[INCodableAttributeMetadata placeholderID](self, "placeholderID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableAttributeMetadata placeholder](self, "placeholder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableAttributeMetadata _localizationTable](self, "_localizationTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  INLocalizedStringFromCodable(v5, v6, v7, v4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_localizedDialogTokensWithLocalizer:(id)a3
{
  return 0;
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_name, CFSTR("name"));
  -[NSString intents_encodeForPlistRepresentationWithParameters:](self->_placeholder, "intents_encodeForPlistRepresentationWithParameters:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v8, CFSTR("placeholder"));
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_placeholderID, CFSTR("placeholderID"));
  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)placeholderID
{
  return self->_placeholderID;
}

- (void)setPlaceholderID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setCodableAttribute:(id)a3
{
  objc_storeWeak((id *)&self->_codableAttribute, a3);
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = a3;
  v6 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "intents_stringForKey:", CFSTR("name"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v6[1];
  v6[1] = v7;

  objc_msgSend(v5, "intents_stringForKey:", CFSTR("placeholder"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v6[2];
  v6[2] = v9;

  objc_msgSend(v5, "intents_stringForKey:", CFSTR("placeholderID"));
  v11 = objc_claimAutoreleasedReturnValue();

  v12 = (void *)v6[3];
  v6[3] = v11;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)__INTypeCodableDescriptionPlaceholderIDKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeMetadataPlaceholderIDKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionPlaceholderKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeMetadataPlaceholderKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionPlaceholderIDKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeMetadataPlaceholderIDKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionPlaceholderKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeMetadataPlaceholderKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
