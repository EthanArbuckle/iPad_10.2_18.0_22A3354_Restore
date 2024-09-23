@implementation INCodableFileAttributeMetadata

- (void)updateWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *type;
  void *v10;
  void *v11;
  void *v12;
  NSArray *v13;
  NSArray *customUTIs;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)INCodableFileAttributeMetadata;
  -[INCodableAttributeMetadata updateWithDictionary:](&v15, sel_updateWithDictionary_, v4);
  -[INCodableFileAttributeMetadata __INCodableDescriptionTypeKey](self, "__INCodableDescriptionTypeKey");
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

  type = self->_type;
  self->_type = v8;

  -[INCodableFileAttributeMetadata __INCodableDescriptionCustomUTIsKey](self, "__INCodableDescriptionCustomUTIsKey");
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

  customUTIs = self->_customUTIs;
  self->_customUTIs = v13;

}

- (id)__INCodableDescriptionTypeKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableFileAttributeMetadataTypeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionCustomUTIsKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableFileAttributeMetadataCustomUTIsKey");
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
  void *v12;
  void *v13;
  objc_super v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)INCodableFileAttributeMetadata;
  -[INCodableAttributeMetadata dictionaryRepresentationWithLocalizer:](&v15, sel_dictionaryRepresentationWithLocalizer_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableFileAttributeMetadata __INCodableDescriptionTypeKey](self, "__INCodableDescriptionTypeKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  -[INCodableFileAttributeMetadata type](self, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[0] = v7;
  -[INCodableFileAttributeMetadata __INCodableDescriptionCustomUTIsKey](self, "__INCodableDescriptionCustomUTIsKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  -[INCodableFileAttributeMetadata customUTIs](self, "customUTIs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_dictionaryByAddingEntriesFromDictionary:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  if (!v6)

  objc_msgSend(v12, "if_dictionaryWithNonEmptyValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSArray)UTIs
{
  void *v3;
  id v4;
  void *v5;
  id *v6;
  void *v7;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  id v25;
  id v26;
  _QWORD v27[3];

  v27[1] = *MEMORY[0x1E0C80C00];
  -[INCodableFileAttributeMetadata type](self, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("PlainText")))
  {
    objc_msgSend((id)*MEMORY[0x1E0CEC590], "identifier");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v27[0] = v4;
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = (id *)v27;
LABEL_7:
    objc_msgSend(v5, "arrayWithObjects:count:", v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("RichText")))
  {
    objc_msgSend((id)*MEMORY[0x1E0CEC5C0], "identifier");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v26 = v4;
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = &v26;
    goto LABEL_7;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("Image")))
  {
    objc_msgSend((id)*MEMORY[0x1E0CEC520], "identifier");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v25 = v4;
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = &v25;
    goto LABEL_7;
  }
  if (!objc_msgSend(v3, "isEqualToString:", CFSTR("Custom")))
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_9;
  }
  v19 = v3;
  -[INCodableFileAttributeMetadata customUTIs](self, "customUTIs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = v9;
  v11 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v4);
        v15 = *(id *)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (v15)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v16 = v15;
          else
            v16 = 0;
        }
        else
        {
          v16 = 0;
        }
        v17 = v16;

        objc_msgSend(v17, "objectForKey:", CFSTR("UTI"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v10, "addObject:", v18);
        }

      }
      v12 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

  v7 = (void *)objc_msgSend(v10, "copy");
  v3 = v19;
LABEL_8:

LABEL_9:
  return (NSArray *)v7;
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
  v11.super_class = (Class)INCodableFileAttributeMetadata;
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
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_type, CFSTR("type"));
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_customUTIs, CFSTR("customUTIs"));
    v9 = (void *)objc_msgSend(v6, "copy");
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INCodableFileAttributeMetadata;
  v4 = a3;
  -[INCodableAttributeMetadata encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_type, CFSTR("type"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_customUTIs, CFSTR("customUTIs"));

}

- (INCodableFileAttributeMetadata)initWithCoder:(id)a3
{
  id v4;
  INCodableFileAttributeMetadata *v5;
  uint64_t v6;
  NSString *type;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSArray *customUTIs;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)INCodableFileAttributeMetadata;
  v5 = -[INCodableAttributeMetadata initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v6 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("customUTIs"));
    v12 = objc_claimAutoreleasedReturnValue();
    customUTIs = v5->_customUTIs;
    v5->_customUTIs = (NSArray *)v12;

  }
  return v5;
}

- (NSString)type
{
  return self->_type;
}

- (NSArray)customUTIs
{
  return self->_customUTIs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customUTIs, 0);
  objc_storeStrong((id *)&self->_type, 0);
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
  v16.super_class = (Class)&OBJC_METACLASS___INCodableFileAttributeMetadata;
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
    objc_msgSend(v6, "intents_stringForKey:", CFSTR("type"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v7[5];
    v7[5] = v11;

    objc_msgSend(v6, "intents_safeObjectForKey:ofType:", CFSTR("customUTIs"), objc_opt_class());
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v7[6];
    v7[6] = v13;

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
  objc_msgSend((id)objc_opt_class(), "__INCodableFileAttributeMetadataTypeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionCustomUTIsKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableFileAttributeMetadataCustomUTIsKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionTypeKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableFileAttributeMetadataTypeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionCustomUTIsKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableFileAttributeMetadataCustomUTIsKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
