@implementation INCodableCustomObjectAttribute

- (void)updateWithDictionary:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *objectTypeName;
  void *v8;
  NSString *v9;
  NSString *objectTypeNamespace;
  objc_super v11;

  v4 = a3;
  -[INCodableCustomObjectAttribute __INCodableDescriptionObjectTypeKey](self, "__INCodableDescriptionObjectTypeKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  objectTypeName = self->_objectTypeName;
  self->_objectTypeName = v6;

  -[INCodableCustomObjectAttribute __INCodableDescriptionObjectTypeNamespaceKey](self, "__INCodableDescriptionObjectTypeNamespaceKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v8);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  objectTypeNamespace = self->_objectTypeNamespace;
  self->_objectTypeNamespace = v9;

  -[INCodableCustomObjectAttribute _assignCodableDescription](self, "_assignCodableDescription");
  v11.receiver = self;
  v11.super_class = (Class)INCodableCustomObjectAttribute;
  -[INCodableObjectAttribute updateWithDictionary:](&v11, sel_updateWithDictionary_, v4);

}

- (id)__INCodableDescriptionObjectTypeNamespaceKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableCustomObjectAttributeObjectTypeNamespaceKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionObjectTypeKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableCustomObjectAttributeObjectTypeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  objc_super v9;

  -[INCodableCustomObjectAttribute objectTypeNamespace](self, "objectTypeNamespace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[INCodableCustomObjectAttribute objectTypeName](self, "objectTypeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v9.receiver = self;
  v9.super_class = (Class)INCodableCustomObjectAttribute;
  v7 = v6 ^ -[INCodableObjectAttribute hash](&v9, sel_hash);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setCodableDescription:(id)a3
{
  objc_storeWeak((id *)&self->_codableDescription, a3);
}

- (NSString)objectTypeNamespace
{
  return self->_objectTypeNamespace;
}

- (NSString)objectTypeName
{
  return self->_objectTypeName;
}

- (void)_assignCodableDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "schema");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "_types");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableCustomObjectAttribute objectTypeNamespace](self, "objectTypeNamespace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableCustomObjectAttribute objectTypeName](self, "objectTypeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentDefinitionNamespacedName((uint64_t)v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v15, "isSystem") & 1) == 0 && !v8)
  {
    -[INCodableCustomObjectAttribute objectTypeNamespace](self, "objectTypeNamespace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("System"));

    if (v10)
    {
      +[INSchema systemSchema](INSchema, "systemSchema");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_types");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[INCodableCustomObjectAttribute objectTypeName](self, "objectTypeName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      INIntentDefinitionNamespacedName((uint64_t)CFSTR("System"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v14);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }
  }
  objc_storeWeak((id *)&self->_codableDescription, v8);

}

- (INCodableCustomObjectAttribute)initWithCoder:(id)a3
{
  id v4;
  INCodableCustomObjectAttribute *v5;
  uint64_t v6;
  NSString *objectTypeName;
  uint64_t v8;
  NSString *objectTypeNamespace;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)INCodableCustomObjectAttribute;
  v5 = -[INCodableObjectAttribute initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("objectTypeName"));
    v6 = objc_claimAutoreleasedReturnValue();
    objectTypeName = v5->_objectTypeName;
    v5->_objectTypeName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("objectTypeNamespace"));
    v8 = objc_claimAutoreleasedReturnValue();
    objectTypeNamespace = v5->_objectTypeNamespace;
    v5->_objectTypeNamespace = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("codableDescription"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_codableDescription, v10);

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectTypeNamespace, 0);
  objc_storeStrong((id *)&self->_objectTypeName, 0);
  objc_destroyWeak((id *)&self->_codableDescription);
}

- (int64_t)valueType
{
  return 225;
}

- (Class)resolutionResultClass
{
  return (Class)objc_opt_class();
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id WeakRetained;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)INCodableCustomObjectAttribute;
  v4 = a3;
  -[INCodableObjectAttribute encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_objectTypeName, CFSTR("objectTypeName"), v6.receiver, v6.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_objectTypeNamespace, CFSTR("objectTypeNamespace"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_codableDescription);
  objc_msgSend(v4, "encodeConditionalObject:forKey:", WeakRetained, CFSTR("codableDescription"));

}

- (INCodableDescription)codableDescription
{
  void *WeakRetained;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_codableDescription);
  if (!WeakRetained)
  {
    -[INCodableCustomObjectAttribute objectTypeNamespace](self, "objectTypeNamespace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("System"));

    if (v5)
    {
      +[INSchema systemSchema](INSchema, "systemSchema");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_types");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[INCodableCustomObjectAttribute objectTypeName](self, "objectTypeName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      INIntentDefinitionNamespacedName((uint64_t)CFSTR("System"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v9);
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      WeakRetained = 0;
    }
  }
  return (INCodableDescription *)WeakRetained;
}

- (int64_t)_attributeType
{
  return 5;
}

- (Class)objectClass
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *v11;
  void *v12;

  -[INCodableCustomObjectAttribute objectTypeNamespace](self, "objectTypeNamespace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("System"));

  if (!v4)
    goto LABEL_6;
  +[INSchema systemSchema](INSchema, "systemSchema");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_types");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableCustomObjectAttribute objectTypeName](self, "objectTypeName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentDefinitionNamespacedName((uint64_t)CFSTR("System"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "className");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {

LABEL_6:
    v12 = (void *)objc_opt_class();
    return (Class)v12;
  }
  objc_msgSend(v9, "className");
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  v12 = NSClassFromString(v11);

  if (!v12)
    goto LABEL_6;
  return (Class)v12;
}

- (Class)_relationshipValueTransformerClass
{
  return (Class)objc_opt_class();
}

- (Class)_unsafeObjectClass
{
  objc_class *v3;
  void *v4;
  NSString *v5;

  v3 = -[INCodableCustomObjectAttribute objectClass](self, "objectClass");
  if (v3 == (objc_class *)objc_opt_class())
  {
    -[INCodableCustomObjectAttribute codableDescription](self, "codableDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "className");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v3 = NSClassFromString(v5);

  }
  return v3;
}

- (id)valueTransformer
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  INCodableCustomObjectAttribute *v11;
  _QWORD v12[4];
  id v13;

  -[INCodableCustomObjectAttribute codableDescription](self, "codableDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3B20];
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __50__INCodableCustomObjectAttribute_valueTransformer__block_invoke;
  v12[3] = &unk_1E228F5A8;
  v13 = v3;
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __50__INCodableCustomObjectAttribute_valueTransformer__block_invoke_2;
  v9[3] = &unk_1E228F5D0;
  v10 = v13;
  v11 = self;
  v6 = v13;
  objc_msgSend(v4, "if_transformerUsingForwardTransformation:reverseTransformation:", v12, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)INCodableCustomObjectAttribute;
  if (-[INCodableObjectAttribute isEqual:](&v16, sel_isEqual_, v5))
  {
    -[INCodableCustomObjectAttribute objectTypeName](self, "objectTypeName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 || (objc_msgSend(v5, "objectTypeName"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[INCodableCustomObjectAttribute objectTypeName](self, "objectTypeName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectTypeName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

      if (v6)
      {
LABEL_9:

        -[INCodableCustomObjectAttribute objectTypeNamespace](self, "objectTypeNamespace");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11 || (objc_msgSend(v5, "objectTypeNamespace"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[INCodableCustomObjectAttribute objectTypeNamespace](self, "objectTypeNamespace");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectTypeNamespace");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqual:", v13);

          if (v11)
          {
LABEL_15:

            v10 = v9 & v14;
            goto LABEL_16;
          }
        }
        else
        {
          v14 = 1;
        }

        goto LABEL_15;
      }
    }
    else
    {
      v9 = 1;
    }

    goto LABEL_9;
  }
  v10 = 0;
LABEL_16:

  return v10;
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
  v15.super_class = (Class)INCodableCustomObjectAttribute;
  -[INCodableObjectAttribute dictionaryRepresentationWithLocalizer:](&v15, sel_dictionaryRepresentationWithLocalizer_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableCustomObjectAttribute __INCodableDescriptionObjectTypeNamespaceKey](self, "__INCodableDescriptionObjectTypeNamespaceKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  -[INCodableCustomObjectAttribute objectTypeNamespace](self, "objectTypeNamespace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[0] = v7;
  -[INCodableCustomObjectAttribute __INCodableDescriptionObjectTypeKey](self, "__INCodableDescriptionObjectTypeKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  -[INCodableCustomObjectAttribute objectTypeName](self, "objectTypeName");
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

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)INCodableCustomObjectAttribute;
  v4 = -[INCodableObjectAttribute copyWithZone:](&v9, sel_copyWithZone_, a3);
  -[INCodableCustomObjectAttribute objectTypeName](self, "objectTypeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObjectTypeName:", v5);

  -[INCodableCustomObjectAttribute objectTypeNamespace](self, "objectTypeNamespace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObjectTypeNamespace:", v6);

  -[INCodableCustomObjectAttribute codableDescription](self, "codableDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCodableDescription:", v7);

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
  v11.super_class = (Class)INCodableCustomObjectAttribute;
  v12 = 0;
  -[INCodableObjectAttribute widgetPlistableRepresentationWithParameters:error:](&v11, sel_widgetPlistableRepresentationWithParameters_error_, a3, &v12);
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
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_objectTypeName, CFSTR("objectTypeName"));
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_objectTypeNamespace, CFSTR("objectTypeNamespace"));
    v9 = v6;
  }

  return v9;
}

- (void)setObjectTypeName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void)setObjectTypeNamespace:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

INCodable *__50__INCodableCustomObjectAttribute_valueTransformer__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  INCodable *v4;
  void *v5;
  void *v6;
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
  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    v4 = -[INCodable initWithCodableDescription:data:]([INCodable alloc], "initWithCodableDescription:data:", *(_QWORD *)(a1 + 32), 0);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "attributes", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

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
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "propertyName");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "valueForKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[INCodable setValue:forPropertyNamed:](v4, "setValue:forPropertyNamed:", v12, v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id __50__INCodableCustomObjectAttribute_valueTransformer__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  _BOOL4 v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  NSString *v31;
  objc_class *v32;
  id obj;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  objc_class *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v34 = a2;
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v3, "className");
    v31 = (NSString *)objc_claimAutoreleasedReturnValue();
    v4 = NSClassFromString(v31);
    v32 = v4;
    if (v4)
      v5 = objc_alloc_init(v4);
    else
      v5 = -[INCustomObject _initWithCodableDescription:]([INCustomObject alloc], "_initWithCodableDescription:", *(_QWORD *)(a1 + 32));
    v6 = v5;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "attributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v8;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v36;
      v12 = 0x1E0CB3000uLL;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v36 != v11)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "propertyName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "valueForPropertyNamed:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            objc_msgSend(*(id *)(v12 + 1232), "bundleForClass:", objc_opt_class());
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v17 = v6;
              v18 = v17;
              if (v6)
              {
                if (objc_msgSend(v17, "conformsToProtocol:", &unk_1EE039340))
                  v19 = v18;
                else
                  v19 = 0;
              }
              else
              {
                v19 = 0;
              }
              v25 = v19;

              if (objc_msgSend(&unk_1E23F9918, "containsObject:", v14))
              {
                objc_msgSend(v18, "setValue:forKey:", v15, v14);
              }
              else if (v25)
              {
                objc_msgSend(v25, "setValue:forProperty:", v15, v14);
              }

              v12 = 0x1E0CB3000;
            }
            else
            {
              objc_msgSend(*(id *)(v12 + 1232), "bundleForClass:", objc_opt_class());
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              if (v16 != v20)
              {
                objc_msgSend(v16, "bundlePath");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = objc_msgSend(v21, "hasPrefix:", CFSTR("/System/Library/"));

                v23 = (void *)INSiriLogContextIntents;
                v24 = os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_FAULT);
                if (!v22)
                {
                  v12 = 0x1E0CB3000;
                  if (v24)
                  {
                    v28 = v23;
                    v12 = 0x1E0CB3000;
                    v29 = objc_opt_class();
                    *(_DWORD *)buf = 136315650;
                    v40 = "-[INCodableCustomObjectAttribute valueTransformer]_block_invoke";
                    v41 = 2114;
                    v42 = v29;
                    v43 = 2114;
                    v44 = v32;
                    _os_log_fault_impl(&dword_18BEBC000, v28, OS_LOG_TYPE_FAULT, "%s Use of %{public}@ on a class outside of system frameworks: %{public}@", buf, 0x20u);

                  }
                  goto LABEL_30;
                }
                v12 = 0x1E0CB3000;
                if (v24)
                {
                  v26 = v23;
                  v12 = 0x1E0CB3000;
                  v27 = objc_opt_class();
                  *(_DWORD *)buf = 136315650;
                  v40 = "-[INCodableCustomObjectAttribute valueTransformer]_block_invoke_2";
                  v41 = 2114;
                  v42 = v27;
                  v43 = 2114;
                  v44 = v32;
                  _os_log_fault_impl(&dword_18BEBC000, v26, OS_LOG_TYPE_FAULT, "%s Use of %{public}@ on a class outside of Intents framework: %{public}@", buf, 0x20u);

                }
              }
              objc_msgSend(v6, "setValue:forKey:", v15, v14);
            }
LABEL_30:

          }
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
      }
      while (v10);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
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
  v16.super_class = (Class)&OBJC_METACLASS___INCodableCustomObjectAttribute;
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
    objc_msgSend(v6, "intents_stringForKey:", CFSTR("objectTypeName"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v7[22];
    v7[22] = v11;

    objc_msgSend(v6, "intents_stringForKey:", CFSTR("objectTypeNamespace"));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v7[23];
    v7[23] = v13;

    v10 = v7;
  }

  return v10;
}

- (id)__INTypeCodableDescriptionObjectTypeNamespaceKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableCustomObjectAttributeObjectTypeNamespaceKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionObjectTypeKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableCustomObjectAttributeObjectTypeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionObjectTypeNamespaceKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableCustomObjectAttributeObjectTypeNamespaceKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionObjectTypeKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableCustomObjectAttributeObjectTypeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
