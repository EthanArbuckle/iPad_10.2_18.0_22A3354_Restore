@implementation PHQueryChangeDetectionCriteria

- (PHQueryChangeDetectionCriteria)init
{
  PHQueryChangeDetectionCriteria *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *attributeIndexValuesByEntityName;
  NSMutableDictionary *v5;
  NSMutableDictionary *relationshipIndexValuesByEntityName;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHQueryChangeDetectionCriteria;
  v2 = -[PHQueryChangeDetectionCriteria init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    attributeIndexValuesByEntityName = v2->_attributeIndexValuesByEntityName;
    v2->_attributeIndexValuesByEntityName = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    relationshipIndexValuesByEntityName = v2->_relationshipIndexValuesByEntityName;
    v2->_relationshipIndexValuesByEntityName = v5;

  }
  return v2;
}

- (PHQueryChangeDetectionCriteria)initWithPLQueryChangeDetectionCriteria:(id)a3
{
  id v4;
  PHQueryChangeDetectionCriteria *v5;
  PHQueryChangeDetectionCriteria *v6;
  PHQueryChangeDetectionCriteria *v7;
  uint64_t v8;
  PHQueryChangeDetectionCriteria *v9;
  _QWORD v11[4];
  PHQueryChangeDetectionCriteria *v12;
  _QWORD v13[4];
  PHQueryChangeDetectionCriteria *v14;

  v4 = a3;
  v5 = -[PHQueryChangeDetectionCriteria init](self, "init");
  if (v5)
  {
    v6 = v5;
    if ((objc_msgSend(v4, "isEmpty") & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      v8 = MEMORY[0x1E0C809B0];
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __73__PHQueryChangeDetectionCriteria_initWithPLQueryChangeDetectionCriteria___block_invoke;
      v13[3] = &unk_1E35D8B08;
      v9 = v6;
      v14 = v9;
      objc_msgSend(v4, "enumerateEntitiesAndAttributesUsingBlock:", v13);
      v11[0] = v8;
      v11[1] = 3221225472;
      v11[2] = __73__PHQueryChangeDetectionCriteria_initWithPLQueryChangeDetectionCriteria___block_invoke_2;
      v11[3] = &unk_1E35D8B08;
      v7 = v9;
      v12 = v7;
      objc_msgSend(v4, "enumerateEntitiesAndRelationshipsUsingBlock:", v11);

      v6 = v14;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = -[NSMutableDictionary mutableCopy](self->_attributeIndexValuesByEntityName, "mutableCopy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[NSMutableDictionary mutableCopy](self->_relationshipIndexValuesByEntityName, "mutableCopy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id *v5;
  char v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (id *)v4;
    if (objc_msgSend(v5[1], "isEqual:", self->_attributeIndexValuesByEntityName))
      v6 = objc_msgSend(v5[2], "isEqual:", self->_relationshipIndexValuesByEntityName);
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSMutableDictionary hash](self->_attributeIndexValuesByEntityName, "hash");
  return -[NSMutableDictionary hash](self->_relationshipIndexValuesByEntityName, "hash") + v3;
}

- (id)changeDetectionCriteriaByAddingChangeDetectionCriteria:(id)a3
{
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[5];

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHQueryChangeDetectionCriteria.m"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("criteria"));

  }
  v6 = (void *)-[PHQueryChangeDetectionCriteria copy](self, "copy");
  v7 = MEMORY[0x1E0C809B0];
  v8 = (void *)v5[1];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __89__PHQueryChangeDetectionCriteria_changeDetectionCriteriaByAddingChangeDetectionCriteria___block_invoke;
  v14[3] = &unk_1E35DB138;
  v14[4] = v6;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v14);
  v9 = (void *)v5[2];
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __89__PHQueryChangeDetectionCriteria_changeDetectionCriteriaByAddingChangeDetectionCriteria___block_invoke_2;
  v13[3] = &unk_1E35DB138;
  v13[4] = v6;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v13);
  v10 = v6;

  return v10;
}

- (void)enumerateEntitiesAndAttributeIndexesUsingBlock:(id)a3
{
  id v4;
  NSMutableDictionary *attributeIndexValuesByEntityName;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  attributeIndexValuesByEntityName = self->_attributeIndexValuesByEntityName;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__PHQueryChangeDetectionCriteria_enumerateEntitiesAndAttributeIndexesUsingBlock___block_invoke;
  v7[3] = &unk_1E35D8B30;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](attributeIndexValuesByEntityName, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (void)enumerateEntitiesAndRelationshipIndexesBlock:(id)a3
{
  id v4;
  NSMutableDictionary *relationshipIndexValuesByEntityName;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  relationshipIndexValuesByEntityName = self->_relationshipIndexValuesByEntityName;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__PHQueryChangeDetectionCriteria_enumerateEntitiesAndRelationshipIndexesBlock___block_invoke;
  v7[3] = &unk_1E35D8B30;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](relationshipIndexValuesByEntityName, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relationshipIndexValuesByEntityName, 0);
  objc_storeStrong((id *)&self->_attributeIndexValuesByEntityName, 0);
}

void __79__PHQueryChangeDetectionCriteria_enumerateEntitiesAndRelationshipIndexesBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  objc_msgSend(a3, "unsignedLongLongValue");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __81__PHQueryChangeDetectionCriteria_enumerateEntitiesAndAttributeIndexesUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  objc_msgSend(a3, "unsignedLongLongValue");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __89__PHQueryChangeDetectionCriteria_changeDetectionCriteriaByAddingChangeDetectionCriteria___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v5 = a2;
  v6 = objc_msgSend(a3, "unsignedLongLongValue");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedLongLongValue") | v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v9, v5);

}

void __89__PHQueryChangeDetectionCriteria_changeDetectionCriteriaByAddingChangeDetectionCriteria___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v5 = a2;
  v6 = objc_msgSend(a3, "unsignedLongLongValue");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedLongLongValue") | v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", v9, v5);

}

void __73__PHQueryChangeDetectionCriteria_initWithPLQueryChangeDetectionCriteria___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v5 = (void *)MEMORY[0x1E0D71A28];
  v6 = a2;
  objc_msgSend(a3, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "indexValueForAttributeNames:entity:", v7, v6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v9, v6);

}

void __73__PHQueryChangeDetectionCriteria_initWithPLQueryChangeDetectionCriteria___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v5 = (void *)MEMORY[0x1E0D71A28];
  v6 = a2;
  objc_msgSend(a3, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "indexValueForRelationshipNames:entity:", v7, v6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", v9, v6);

}

@end
