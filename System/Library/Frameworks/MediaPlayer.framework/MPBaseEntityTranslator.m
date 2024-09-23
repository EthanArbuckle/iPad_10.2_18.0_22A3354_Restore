@implementation MPBaseEntityTranslator

void __63__MPBaseEntityTranslator__objectForPropertySet_source_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "properties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prepareSource:context:properties:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(*(id *)(a1 + 56), "properties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "_valueForPropertyKey:source:context:", v14, v8, *(_QWORD *)(a1 + 48));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setValue:forModelKey:", v15, v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v11);
  }

  objc_msgSend(*(id *)(a1 + 56), "relationships");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __63__MPBaseEntityTranslator__objectForPropertySet_source_context___block_invoke_2;
  v19[3] = &unk_1E3158980;
  v17 = *(void **)(a1 + 40);
  v19[4] = *(_QWORD *)(a1 + 32);
  v20 = v17;
  v21 = *(id *)(a1 + 48);
  v22 = v3;
  v18 = v3;
  objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v19);

}

- (id)_valueForPropertyKey:(id)a3 source:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  -[MPBaseEntityTranslator propertyTranslatorForPropertyKey:]((id *)&self->super.isa, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueFromSource:context:", v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)propertyTranslatorForPropertyKey:(id *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  if (!a1 || (objc_msgSend(a1[4], "containsObject:", v3) & 1) != 0)
    goto LABEL_5;
  objc_msgSend(a1[1], "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = (void *)objc_msgSend(a1, "MPModelClass");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] Property mapping missing for %@ : %@"), objc_opt_class(), objc_msgSend(a1, "MPModelClass"), v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    MPModelPropertyMappingMissing(v5, v3, v6);

LABEL_5:
    v4 = 0;
  }

  return v4;
}

- (Class)MPModelClass
{
  return self->_MPModelClass;
}

- (id)prepareSource:(id)a3 context:(id)a4 properties:(id)a5
{
  id v7;
  void (**sourcePreprocessorBlock)(id, id, id);
  void *v9;

  v7 = a3;
  sourcePreprocessorBlock = (void (**)(id, id, id))self->_sourcePreprocessorBlock;
  v9 = v7;
  if (sourcePreprocessorBlock)
  {
    sourcePreprocessorBlock[2](sourcePreprocessorBlock, v7, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)_objectForPropertySet:(id)a3 source:(id)a4 context:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[MPBaseEntityTranslator identifiersForSource:context:](self, (uint64_t)v10, (uint64_t)v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPBaseEntityTranslator.m"), 177, CFSTR("No identifiers for model class: %@ from source: %@"), -[MPBaseEntityTranslator MPModelClass](self, "MPModelClass"), v10);

  }
  v13 = objc_alloc(-[MPBaseEntityTranslator MPModelClass](self, "MPModelClass"));
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __63__MPBaseEntityTranslator__objectForPropertySet_source_context___block_invoke;
  v20[3] = &unk_1E31589A8;
  v20[4] = self;
  v21 = v10;
  v22 = v11;
  v23 = v9;
  v14 = v9;
  v15 = v11;
  v16 = v10;
  v17 = (void *)objc_msgSend(v13, "initWithIdentifiers:block:", v12, v20);

  return v17;
}

- (id)identifiersForSource:(uint64_t)a3 context:
{
  if (a1)
  {
    objc_msgSend(a1, "_valueForPropertyKey:source:context:", CFSTR("_identifiers"), a2, a3);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)objectForPropertySet:(uint64_t)a3 source:(uint64_t)a4 context:
{
  if (a1)
  {
    objc_msgSend(a1, "_objectForPropertySet:source:context:", a2, a3, a4);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)mapPropertyKey:(void *)a3 toPropertyTranslator:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (a1)
  {
    if (objc_msgSend(a1[4], "containsObject:", v9))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel_mapPropertyKey_toPropertyTranslator_, a1, CFSTR("MPBaseEntityTranslator.m"), 138, CFSTR("[%@] Attempting to map an already unsupported property for %@ : %@"), objc_opt_class(), objc_msgSend(a1, "MPModelClass"), v9);

    }
    objc_msgSend(a1[1], "objectForKeyedSubscript:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel_mapPropertyKey_toPropertyTranslator_, a1, CFSTR("MPBaseEntityTranslator.m"), 139, CFSTR("[%@] Attempting to replace existing property translator for %@ : %@"), objc_opt_class(), objc_msgSend(a1, "MPModelClass"), v9);

    }
    objc_msgSend(a1[1], "setObject:forKeyedSubscript:", v5, v9);
  }

}

- (void)mapRelationshipKey:(uint64_t)a1 ofModelClass:(void *)a2 toRelationshipTranslator:(void *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (a1)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v9))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel_mapRelationshipKey_ofModelClass_toRelationshipTranslator_, a1, CFSTR("MPBaseEntityTranslator.m"), 144, CFSTR("[%@] Attempting to map an already unsupported relationship for %@ : %@"), objc_opt_class(), objc_msgSend((id)a1, "MPModelClass"), v9);

    }
    objc_msgSend(*(id *)(a1 + 16), "objectForKeyedSubscript:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel_mapRelationshipKey_ofModelClass_toRelationshipTranslator_, a1, CFSTR("MPBaseEntityTranslator.m"), 145, CFSTR("[%@] Attempting to replace existing relationship translator for %@ : %@"), objc_opt_class(), objc_msgSend((id)a1, "MPModelClass"), v9);

    }
    objc_msgSend(*(id *)(a1 + 16), "setObject:forKeyedSubscript:", v5, v9);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      *(_BYTE *)(a1 + 40) |= 1u;
  }

}

- (void)mapUnsupportedPropertyKey:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("_identifiers")))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPBaseEntityTranslator.m"), 163, CFSTR("[%@] Attempting to unsupport identifiers for %@"), objc_opt_class(), -[MPBaseEntityTranslator MPModelClass](self, "MPModelClass"));

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_propertiesToTranslators, "objectForKeyedSubscript:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPBaseEntityTranslator.m"), 164, CFSTR("[%@] Attempting to unsupport a property with an existing mapping: %@"), objc_opt_class(), v8);

  }
  -[NSMutableSet addObject:](self->_unsupportedKeys, "addObject:", v8);

}

- (void)mapIdentifiersToPropertyTranslator:(id *)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  if (a1)
  {
    v6 = v3;
    objc_msgSend(a1[1], "objectForKeyedSubscript:", CFSTR("_identifiers"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", sel_mapIdentifiersToPropertyTranslator_, a1, CFSTR("MPBaseEntityTranslator.m"), 133, CFSTR("[%@] Attempting to replace existing identifiers translator for %@"), objc_opt_class(), objc_msgSend(a1, "MPModelClass"));

    }
    objc_msgSend(a1[1], "setObject:forKeyedSubscript:", v6, CFSTR("_identifiers"));
    v3 = v6;
  }

}

+ (id)createTranslatorForMPModelClass:(Class)a3
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v16;

  v6 = objc_opt_class();
  __MPGetModelToTranslatorMap();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPBaseEntityTranslator.m"), 156, CFSTR("[%@] Already an existing translator for %@"), objc_opt_class(), a3);

  }
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMPModelClass:", a3);
  v11 = objc_opt_class();
  v12 = v10;
  __MPGetModelToTranslatorMap();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 10);
    objc_msgSend(v13, "setObject:forKey:", v14, v11);
  }
  objc_msgSend(v14, "setObject:forKey:", v12, a3);

  return v12;
}

void __63__MPBaseEntityTranslator__objectForPropertySet_source_context___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v8 = a2;
  objc_msgSend(v5, "_objectForRelationshipKey:propertySet:source:context:", v8, a3, v6, v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "setValue:forModelKey:", v9, v8);

}

- (id)_objectForRelationshipKey:(id)a3 propertySet:(id)a4 source:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  objc_class *v20;
  void *v21;
  objc_class *v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v10;
  if (!self)
  {
    v15 = 0;
    goto LABEL_4;
  }
  if ((-[NSMutableSet containsObject:](self->_unsupportedKeys, "containsObject:", v14) & 1) != 0)
  {
    v15 = 0;
    self = 0;
LABEL_4:
    v16 = v14;
    goto LABEL_15;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_relationshipsToTranslators, "objectForKeyedSubscript:", v14);
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v15 = (void *)v17;

    v16 = v12;
    if ((*(_BYTE *)&self->_optionalHooks & 1) != 0)
    {
      objc_msgSend(v15, "prepareSource:context:", v16, v13);
      v18 = objc_claimAutoreleasedReturnValue();

      v16 = (id)v18;
    }
    if (!v16)
    {
      self = 0;
      goto LABEL_15;
    }
    objc_msgSend((id)objc_opt_class(), "translatorForMPModelClass:", objc_msgSend(v15, "relatedMPModelClass"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      v20 = -[MPBaseEntityTranslator MPModelClass](self, "MPModelClass");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing entity translator for model class: %@"), objc_msgSend(v15, "relatedMPModelClass"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      MPModelPropertyMappingMissing(v20, v14, v21);

    }
    objc_msgSend(v19, "_objectForPropertySet:source:context:", v11, v16, v13);
    self = (MPBaseEntityTranslator *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = -[MPBaseEntityTranslator MPModelClass](self, "MPModelClass");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] Relationship mapping missing for %@ : %@"), objc_opt_class(), -[MPBaseEntityTranslator MPModelClass](self, "MPModelClass"), v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    MPModelPropertyMappingMissing(v22, v14, v19);
    v15 = 0;
    self = 0;
    v16 = v14;
  }

LABEL_15:
  return self;
}

+ (id)translatorForMPModelClass:(Class)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "buildSchemaIfNeeded");
  v4 = objc_opt_class();
  __MPGetModelToTranslatorMap();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MPBaseEntityTranslator)initWithMPModelClass:(Class)a3
{
  MPBaseEntityTranslator *v4;
  MPBaseEntityTranslator *v5;
  uint64_t v6;
  NSMutableDictionary *propertiesToTranslators;
  uint64_t v8;
  NSMutableDictionary *relationshipsToTranslators;
  uint64_t v10;
  NSMutableSet *unsupportedKeys;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MPBaseEntityTranslator;
  v4 = -[MPBaseEntityTranslator init](&v13, sel_init);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_MPModelClass, a3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    propertiesToTranslators = v5->_propertiesToTranslators;
    v5->_propertiesToTranslators = (NSMutableDictionary *)v6;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    relationshipsToTranslators = v5->_relationshipsToTranslators;
    v5->_relationshipsToTranslators = (NSMutableDictionary *)v8;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    unsupportedKeys = v5->_unsupportedKeys;
    v5->_unsupportedKeys = (NSMutableSet *)v10;

  }
  return v5;
}

- (Class)classForRelationshipKey:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_relationshipsToTranslators, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "relatedMPModelClass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v4;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p modelClass=%@>"), objc_opt_class(), self, -[MPBaseEntityTranslator MPModelClass](self, "MPModelClass"));
}

- (void)setSourcePreprocessorBlock:(id)a3
{
  void *v5;
  id sourcePreprocessorBlock;
  void *v7;
  id v8;

  v8 = a3;
  if (self->_sourcePreprocessorBlock)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPBaseEntityTranslator.m"), 128, CFSTR("[%@] Attempting to set a source preprocessor for %@, but one is already set."), objc_opt_class(), -[MPBaseEntityTranslator MPModelClass](self, "MPModelClass"));

  }
  v5 = (void *)MEMORY[0x19403A810]();
  sourcePreprocessorBlock = self->_sourcePreprocessorBlock;
  self->_sourcePreprocessorBlock = v5;

}

- (void)mapUnsupportedRelationshipKey:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_relationshipsToTranslators, "objectForKeyedSubscript:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPBaseEntityTranslator.m"), 169, CFSTR("[%@] Attempting to unsupport a relationship with an existing mapping: %@"), objc_opt_class(), v7);

  }
  -[NSMutableSet addObject:](self->_unsupportedKeys, "addObject:", v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_MPModelClass, 0);
  objc_storeStrong((id *)&self->_unsupportedKeys, 0);
  objc_storeStrong(&self->_sourcePreprocessorBlock, 0);
  objc_storeStrong((id *)&self->_relationshipsToTranslators, 0);
  objc_storeStrong((id *)&self->_propertiesToTranslators, 0);
}

+ (void)buildSchemaIfNeeded
{
  uint64_t v4;
  objc_class *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2);
  if (v4 == objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPBaseEntityTranslator.m"), 96, CFSTR("Subclass %@ must implement -%@ defined in %@."), v6, v7, CFSTR("[MPBaseEntityTranslator class]"));

  }
}

@end
