@implementation INCodableEnumAttribute

- (id)__INCodableDescriptionEnumTypeKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableEnumAttributeEnumTypeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)valueWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[INCodableEnumAttribute codableEnum](self, "codableEnum", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "values");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v10, "name");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", v4);

          if ((v12 & 1) != 0)
          {
            v7 = v10;
            goto LABEL_12;
          }
        }
        v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)updateWithDictionary:(id)a3
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
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v4 = a3;
  -[INCodableEnumAttribute __INCodableDescriptionEnumTypeNamespaceKey](self, "__INCodableDescriptionEnumTypeNamespaceKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableEnumAttribute setEnumNamespace:](self, "setEnumNamespace:", v6);

  -[INCodableEnumAttribute __INCodableDescriptionEnumTypeKey](self, "__INCodableDescriptionEnumTypeKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "schema");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "_enums");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableEnumAttribute enumNamespace](self, "enumNamespace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentDefinitionNamespacedName((uint64_t)v12, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v10, "isSystem") & 1) == 0 && !v14)
  {
    -[INCodableEnumAttribute enumNamespace](self, "enumNamespace");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("System"));

    if (v16)
    {
      +[INSchema systemSchema](INSchema, "systemSchema");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_enums");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      INIntentDefinitionNamespacedName((uint64_t)CFSTR("System"), v8);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", v19);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }
  }
  -[INCodableEnumAttribute setCodableEnum:](self, "setCodableEnum:", v14);
  v20.receiver = self;
  v20.super_class = (Class)INCodableEnumAttribute;
  -[INCodableAttribute updateWithDictionary:](&v20, sel_updateWithDictionary_, v4);

}

- (id)__INCodableDescriptionEnumTypeNamespaceKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableEnumAttributeEnumTypeNamespaceKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setEnumNamespace:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void)setCodableEnum:(id)a3
{
  objc_storeStrong((id *)&self->_codableEnum, a3);
}

- (NSString)enumNamespace
{
  return self->_enumNamespace;
}

- (int64_t)_attributeType
{
  return 3;
}

- (int64_t)valueType
{
  void *v2;
  uint64_t v3;

  -[INCodableEnumAttribute codableEnum](self, "codableEnum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type");

  if (v3 == 1)
    return 204;
  else
    return 65;
}

- (INCodableEnum)codableEnum
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  INCodableEnum *v9;
  INCodableEnum *codableEnum;

  if (!self->_codableEnum)
  {
    -[INCodableEnumAttribute enumNamespace](self, "enumNamespace");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("System"));

    if (v4)
    {
      +[INSchema systemSchema](INSchema, "systemSchema");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_enums");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[INCodableEnumAttribute enumNamespace](self, "enumNamespace");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      INIntentDefinitionNamespacedName((uint64_t)CFSTR("System"), v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", v8);
      v9 = (INCodableEnum *)objc_claimAutoreleasedReturnValue();
      codableEnum = self->_codableEnum;
      self->_codableEnum = v9;

    }
  }
  return self->_codableEnum;
}

- (Class)resolutionResultClass
{
  return (Class)objc_opt_class();
}

- (Class)_relationshipValueTransformerClass
{
  return (Class)objc_opt_class();
}

- (Class)objectClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)INCodableEnumAttribute;
  v4 = -[INCodableAttribute copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[INCodableEnumAttribute codableEnum](self, "codableEnum");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCodableEnum:", v5);

  -[INCodableEnumAttribute enumNamespace](self, "enumNamespace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnumNamespace:", v6);

  return v4;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  objc_super v7;

  -[INCodableEnumAttribute codableEnum](self, "codableEnum");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v7.receiver = self;
  v7.super_class = (Class)INCodableEnumAttribute;
  v5 = -[INCodableAttribute hash](&v7, sel_hash) ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  objc_super v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (v11.receiver = self,
        v11.super_class = (Class)INCodableEnumAttribute,
        -[INCodableAttribute isEqual:](&v11, sel_isEqual_, v4)))
  {
    -[INCodableEnumAttribute codableEnum](self, "codableEnum");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "codableEnum");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqual:", v6))
    {
      -[INCodableEnumAttribute enumNamespace](self, "enumNamespace");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "enumNamespace");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
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
  void *v14;
  objc_super v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)INCodableEnumAttribute;
  -[INCodableAttribute dictionaryRepresentationWithLocalizer:](&v16, sel_dictionaryRepresentationWithLocalizer_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableEnumAttribute __INCodableDescriptionEnumTypeNamespaceKey](self, "__INCodableDescriptionEnumTypeNamespaceKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  -[INCodableEnumAttribute enumNamespace](self, "enumNamespace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[0] = v7;
  -[INCodableEnumAttribute __INCodableDescriptionEnumTypeKey](self, "__INCodableDescriptionEnumTypeKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v8;
  -[INCodableEnumAttribute codableEnum](self, "codableEnum");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_dictionaryByAddingEntriesFromDictionary:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  if (!v6)

  objc_msgSend(v13, "if_dictionaryWithNonEmptyValues");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  objc_super v17;
  id v18;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)INCodableEnumAttribute;
  v18 = 0;
  -[INCodableAttribute widgetPlistableRepresentationWithParameters:error:](&v17, sel_widgetPlistableRepresentationWithParameters_error_, v6, &v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v18;
  if (!v8)
  {
    -[INCodableEnumAttribute codableEnum](self, "codableEnum");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v7, "intents_setWidgetPlistRepresentable:forKey:parameters:error:", v11, CFSTR("codableEnum"), v6, &v16);
    v9 = v16;

    if (!v9)
    {
      -[INCodableEnumAttribute codableEnum](self, "codableEnum");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v13, CFSTR("enumType"));

      -[INCodableEnumAttribute enumNamespace](self, "enumNamespace");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v14, CFSTR("enumNamespace"));

      v10 = v7;
      v9 = 0;
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
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)INCodableEnumAttribute;
  v4 = a3;
  -[INCodableAttribute encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[INCodableEnumAttribute codableEnum](self, "codableEnum", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("codableEnum"));

  -[INCodableEnumAttribute enumNamespace](self, "enumNamespace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("enumNamespace"));

}

- (INCodableEnumAttribute)initWithCoder:(id)a3
{
  id v4;
  INCodableEnumAttribute *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INCodableEnumAttribute;
  v5 = -[INCodableAttribute initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("codableEnum"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableEnumAttribute setCodableEnum:](v5, "setCodableEnum:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("enumNamespace"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableEnumAttribute setEnumNamespace:](v5, "setEnumNamespace:", v7);

  }
  return v5;
}

- (id)valueForIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[INCodableEnumAttribute codableEnum](self, "codableEnum");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enumNamespace, 0);
  objc_storeStrong((id *)&self->_codableEnum, 0);
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
  uint64_t v13;
  void *v14;
  id v16;
  objc_super v17;
  id v18;

  v6 = a3;
  v17.receiver = a1;
  v17.super_class = (Class)&OBJC_METACLASS___INCodableEnumAttribute;
  v18 = 0;
  objc_msgSendSuper2(&v17, sel_makeFromWidgetPlistableRepresentation_error_, v6, &v18);
  v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v8 = v18;
  if (!v8)
  {
    objc_msgSend(v6, "intents_stringForKey:", CFSTR("enumNamespace"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v7[20];
    v7[20] = v11;

    v16 = 0;
    +[NSObject intents_widgetPlistRepresentableInDict:key:error:](INCodableEnum, "intents_widgetPlistRepresentableInDict:key:error:", v6, CFSTR("codableEnum"), &v16);
    v13 = objc_claimAutoreleasedReturnValue();
    v9 = v16;
    v14 = (void *)v7[19];
    v7[19] = v13;

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

- (id)__INTypeCodableDescriptionEnumTypeNamespaceKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableEnumAttributeEnumTypeNamespaceKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionEnumTypeKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableEnumAttributeEnumTypeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionEnumTypeNamespaceKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableEnumAttributeEnumTypeNamespaceKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionEnumTypeKey
{
  void *v2;
  void *v3;

  -[INCodableAttribute _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableEnumAttributeEnumTypeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
