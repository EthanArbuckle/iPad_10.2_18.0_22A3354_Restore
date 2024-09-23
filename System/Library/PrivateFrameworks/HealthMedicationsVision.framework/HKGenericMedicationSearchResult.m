@implementation HKGenericMedicationSearchResult

- (HKGenericMedicationSearchResult)initWithGenericMedicationId:(id)a3 genericMedicationName:(id)a4 brandName:(id)a5 ingredients:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  HKGenericMedicationSearchResult *v16;
  HKGenericMedicationSearchResult *v17;
  void *v19;
  objc_super v20;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMedicationsSearchResult.m"), 55, CFSTR("genericMedicationId cannot be nil"));

  }
  v20.receiver = self;
  v20.super_class = (Class)HKGenericMedicationSearchResult;
  v16 = -[HKGenericMedicationSearchResult init](&v20, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_genericMedicationId, a3);
    objc_storeStrong((id *)&v17->_genericMedicationName, a4);
    objc_storeStrong((id *)&v17->_brandName, a5);
    objc_storeStrong((id *)&v17->_ingredients, a6);
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "genericMedicationId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKGenericMedicationSearchResult genericMedicationId](self, "genericMedicationId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HKGenericMedicationSearchResult genericMedicationId](self, "genericMedicationId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)copyByReplacingWithIngredients:(id)a3
{
  id v4;
  HKGenericMedicationSearchResult *v5;
  void *v6;
  void *v7;
  void *v8;
  HKGenericMedicationSearchResult *v9;

  v4 = a3;
  v5 = [HKGenericMedicationSearchResult alloc];
  -[HKGenericMedicationSearchResult genericMedicationId](self, "genericMedicationId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGenericMedicationSearchResult genericMedicationName](self, "genericMedicationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGenericMedicationSearchResult brandName](self, "brandName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HKGenericMedicationSearchResult initWithGenericMedicationId:genericMedicationName:brandName:ingredients:](v5, "initWithGenericMedicationId:genericMedicationName:brandName:ingredients:", v6, v7, v8, v4);

  return v9;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[4];
  _QWORD v26[4];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[HKGenericMedicationSearchResult ingredients](self, "ingredients", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "dictionaryRepresentation");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v6);
  }

  v25[0] = CFSTR("genericMedicationId");
  -[HKGenericMedicationSearchResult genericMedicationId](self, "genericMedicationId");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (const __CFString *)v10;
  else
    v12 = CFSTR("(null)");
  v26[0] = v12;
  v25[1] = CFSTR("genericMedicationName");
  -[HKGenericMedicationSearchResult genericMedicationName](self, "genericMedicationName");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (const __CFString *)v13;
  else
    v15 = CFSTR("(null)");
  v26[1] = v15;
  v25[2] = CFSTR("brandName");
  -[HKGenericMedicationSearchResult brandName](self, "brandName");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (const __CFString *)v16;
  else
    v18 = CFSTR("(null)");
  v25[3] = CFSTR("ingredients");
  v26[2] = v18;
  v26[3] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (NSString)genericMedicationId
{
  return self->_genericMedicationId;
}

- (NSString)genericMedicationName
{
  return self->_genericMedicationName;
}

- (NSString)brandName
{
  return self->_brandName;
}

- (NSArray)ingredients
{
  return self->_ingredients;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ingredients, 0);
  objc_storeStrong((id *)&self->_brandName, 0);
  objc_storeStrong((id *)&self->_genericMedicationName, 0);
  objc_storeStrong((id *)&self->_genericMedicationId, 0);
}

@end
