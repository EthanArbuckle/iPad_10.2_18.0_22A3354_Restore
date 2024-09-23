@implementation INCodableAttributeRelationship

- (INCodableAttributeRelationship)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  INCodableAttributeRelationship *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSDictionary *originalDictionary;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;
  objc_msgSend(v6, "_allowDecodingCyclesInSecureMode");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("codableAttribute"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[INCodableAttributeRelationship initWithCodableAttribute:](self, "initWithCodableAttribute:", v7);

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, v11, v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("_originalDictionary"));
    v14 = objc_claimAutoreleasedReturnValue();
    originalDictionary = v8->_originalDictionary;
    v8->_originalDictionary = (NSDictionary *)v14;

  }
  return v8;
}

- (void)_establishRelationship
{
  void *v3;
  NSDictionary *originalDictionary;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  NSDictionary *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  id v23;
  unint64_t v24;
  NSArray *v25;
  NSDictionary *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  NSDictionary *v36;
  void *v37;
  void *v38;
  NSArray *values;
  id v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (self->_originalDictionary)
  {
    -[INCodableAttributeRelationship codableAttribute](self, "codableAttribute");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    originalDictionary = self->_originalDictionary;
    -[INCodableAttributeRelationship __INCodableDescriptionParentNameKey](self, "__INCodableDescriptionParentNameKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](originalDictionary, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    objc_msgSend(v3, "_codableDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v47;
LABEL_4:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v47 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v13);
        objc_msgSend(v14, "propertyName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", v6);

        if ((v16 & 1) != 0)
          break;
        if (v11 == ++v13)
        {
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
          if (v11)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v17 = v14;
      objc_storeWeak((id *)&self->_parentCodableAttribute, v17);

      if (!v17)
        goto LABEL_49;
      v18 = self->_originalDictionary;
      -[INCodableAttributeRelationship __INCodableDescriptionPredicateNameKey](self, "__INCodableDescriptionPredicateNameKey");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = (objc_class *)objc_msgSend(v17, "_relationshipValueTransformerClass");
      if (v21)
        v22 = (void *)objc_msgSend([v21 alloc], "initWithCodableAttribute:", v17);
      else
        v22 = 0;
      v23 = v20;
      if ((objc_msgSend(v23, "hasSuffix:", CFSTR("HasAnyValue")) & 1) != 0)
      {
        v24 = 1;
      }
      else if ((objc_msgSend(v23, "hasSuffix:", CFSTR("HasExactValue")) & 1) != 0)
      {
        v24 = 2;
      }
      else if ((objc_msgSend(v23, "hasSuffix:", CFSTR("ValueIsNotEqual")) & 1) != 0)
      {
        v24 = 3;
      }
      else if ((objc_msgSend(v23, "hasSuffix:", CFSTR("ValueIsGreaterThan")) & 1) != 0)
      {
        v24 = 4;
      }
      else if ((objc_msgSend(v23, "hasSuffix:", CFSTR("ValueIsGreaterThanOrEqual")) & 1) != 0)
      {
        v24 = 5;
      }
      else if ((objc_msgSend(v23, "hasSuffix:", CFSTR("ValueIsLessThan")) & 1) != 0)
      {
        v24 = 6;
      }
      else if ((objc_msgSend(v23, "hasSuffix:", CFSTR("ValueIsLessThanOrEqual")) & 1) != 0)
      {
        v24 = 7;
      }
      else if ((objc_msgSend(v23, "hasSuffix:", CFSTR("ValueIsWithinRange")) & 1) != 0)
      {
        v24 = 8;
      }
      else if ((objc_msgSend(v23, "hasSuffix:", CFSTR("ValueContains")) & 1) != 0)
      {
        v24 = 9;
      }
      else if (objc_msgSend(v23, "hasSuffix:", CFSTR("ValueDoesNotContain")))
      {
        v24 = 10;
      }
      else
      {
        v24 = 0;
      }

      self->_relation = v24;
      v25 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v26 = self->_originalDictionary;
      -[INCodableAttributeRelationship __INCodableDescriptionPredicateValuesKey](self, "__INCodableDescriptionPredicateValuesKey");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKeyedSubscript:](v26, "objectForKeyedSubscript:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v29 = v28;
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
        if (v30)
        {
          v31 = v30;
          v40 = v23;
          v41 = v3;
          v32 = *(_QWORD *)v43;
          do
          {
            for (i = 0; i != v31; ++i)
            {
              if (*(_QWORD *)v43 != v32)
                objc_enumerationMutation(v29);
              objc_msgSend(v22, "transformedValue:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i), v40, v41, (_QWORD)v42);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSArray if_addObjectIfNonNil:](v25, "if_addObjectIfNonNil:", v34);

            }
            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
          }
          while (v31);
          v35 = v29;
          v23 = v40;
          v3 = v41;
        }
        else
        {
          v35 = v29;
        }
      }
      else
      {

        v36 = self->_originalDictionary;
        -[INCodableAttributeRelationship __INCodableDescriptionPredicateValueKey](self, "__INCodableDescriptionPredicateValueKey");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](v36, "objectForKeyedSubscript:", v35);
        v29 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "transformedValue:", v29);
        v37 = v3;
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray if_addObjectIfNonNil:](v25, "if_addObjectIfNonNil:", v38);

        v3 = v37;
      }

      values = self->_values;
      self->_values = v25;

    }
    else
    {
LABEL_10:
      v17 = v9;
    }

LABEL_49:
  }
}

- (INCodableAttributeRelationship)initWithCodableAttribute:(id)a3
{
  id v4;
  INCodableAttributeRelationship *v5;
  INCodableAttributeRelationship *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)INCodableAttributeRelationship;
  v5 = -[INCodableAttributeRelationship init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_codableAttribute, v4);

  return v6;
}

- (void)updateWithDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_originalDictionary, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *originalDictionary;
  id v5;
  id WeakRetained;

  originalDictionary = self->_originalDictionary;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", originalDictionary, CFSTR("_originalDictionary"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_codableAttribute);
  objc_msgSend(v5, "encodeConditionalObject:forKey:", WeakRetained, CFSTR("codableAttribute"));

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_codableAttribute);
  objc_storeStrong((id *)&self->_values, 0);
  objc_destroyWeak((id *)&self->_parentCodableAttribute);
  objc_storeStrong((id *)&self->_originalDictionary, 0);
}

- (BOOL)compareValue:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  char v7;
  void *v8;
  objc_class *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;

  v4 = a3;
  v5 = -[INCodableAttributeRelationship relation](self, "relation");
  v6 = v5;
  if (v4 || v5 != 1)
  {
    -[INCodableAttributeRelationship parentCodableAttribute](self, "parentCodableAttribute");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_msgSend(v8, "_relationshipValueTransformerClass");
    if (v9)
      v10 = (void *)objc_msgSend([v9 alloc], "initWithCodableAttribute:", v8);
    else
      v10 = 0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v4;
      if (v4)
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
      v15 = v12;

      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __47__INCodableAttributeRelationship_compareValue___block_invoke;
      v22[3] = &unk_1E2293880;
      v23 = v10;
      objc_msgSend(v15, "if_flatMap:", v22);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v10, "transformedValue:", v4);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      if (v4 && !v13)
      {
        if ((v6 | 2) == 3)
        {
          v7 = 1;
LABEL_22:

          goto LABEL_23;
        }
        v14 = 0;
      }
    }
    -[INCodableAttributeRelationship values](self, "values");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");
    -[INCodableAttributeRelationship values](self, "values");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v17 > 1)
    {
      v7 = objc_msgSend(v14, "_intents_compareValue:relation:", v18, v6);
    }
    else
    {
      objc_msgSend(v18, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v14, "_intents_compareValue:relation:", v20, v6);

    }
    goto LABEL_22;
  }
  v7 = 0;
LABEL_23:

  return v7;
}

- (Class)valueClass
{
  void *v2;
  void *v3;

  -[INCodableAttributeRelationship parentCodableAttribute](self, "parentCodableAttribute");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_msgSend(v2, "_relationshipValueTransformerClass"), "transformedValueClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v3;
}

- (NSString)description
{
  return (NSString *)-[INCodableAttributeRelationship descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INCodableAttributeRelationship;
  -[INCodableAttributeRelationship description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableAttributeRelationship dictionaryRepresentation](self, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intents_setPlistSafeObject:forKey:", self->_originalDictionary, CFSTR("_originalDictionary"));
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

- (INCodableDescription)_codableDescription
{
  void *v2;
  void *v3;

  -[INCodableAttributeRelationship codableAttribute](self, "codableAttribute");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_codableDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (INCodableDescription *)v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[INCodableAttributeRelationship dictionaryRepresentationWithLocalizer:](self, "dictionaryRepresentationWithLocalizer:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  return self->_originalDictionary;
}

- (NSDictionary)_originalDictionary
{
  return self->_originalDictionary;
}

- (void)_setOriginalDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_originalDictionary, a3);
}

- (INCodableAttribute)parentCodableAttribute
{
  return (INCodableAttribute *)objc_loadWeakRetained((id *)&self->_parentCodableAttribute);
}

- (void)setParentCodableAttribute:(id)a3
{
  objc_storeWeak((id *)&self->_parentCodableAttribute, a3);
}

- (unint64_t)relation
{
  return self->_relation;
}

- (void)setRelation:(unint64_t)a3
{
  self->_relation = a3;
}

- (NSArray)values
{
  return self->_values;
}

- (void)setValues:(id)a3
{
  objc_storeStrong((id *)&self->_values, a3);
}

- (INCodableAttribute)codableAttribute
{
  return (INCodableAttribute *)objc_loadWeakRetained((id *)&self->_codableAttribute);
}

- (void)setCodableAttribute:(id)a3
{
  objc_storeWeak((id *)&self->_codableAttribute, a3);
}

id __47__INCodableAttributeRelationship_compareValue___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(*(id *)(a1 + 32), "transformedValue:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_arrayWithObjectIfNonNil:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v4;
  INCodableAttributeRelationship *v5;
  uint64_t v6;
  NSDictionary *originalDictionary;

  v4 = a3;
  v5 = objc_alloc_init(INCodableAttributeRelationship);
  objc_msgSend(v4, "intents_safeObjectForKey:ofType:", CFSTR("_originalDictionary"), objc_opt_class());
  v6 = objc_claimAutoreleasedReturnValue();

  originalDictionary = v5->_originalDictionary;
  v5->_originalDictionary = (NSDictionary *)v6;

  return v5;
}

- (id)__INTypeCodableDescriptionPredicateValuesKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeRelationship _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeRelationshipPredicateValuesKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionPredicateValueKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeRelationship _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeRelationshipPredicateValueKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionPredicateNameKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeRelationship _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeRelationshipPredicateNameKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionParentNameKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeRelationship _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeRelationshipParentNameKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionPredicateValuesKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeRelationship _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeRelationshipPredicateValuesKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionPredicateValueKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeRelationship _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeRelationshipPredicateValueKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionPredicateNameKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeRelationship _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeRelationshipPredicateNameKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionParentNameKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeRelationship _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeRelationshipParentNameKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionPredicateValuesKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeRelationship _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeRelationshipPredicateValuesKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionPredicateValueKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeRelationship _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeRelationshipPredicateValueKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionPredicateNameKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeRelationship _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeRelationshipPredicateNameKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionParentNameKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeRelationship _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeRelationshipParentNameKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
