@implementation HKIngredientSearchResult

- (HKIngredientSearchResult)initWithIngredientId:(id)a3 ingredientName:(id)a4 strengthQuantity:(id)a5 strengthUnit:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  HKIngredientSearchResult *v16;
  HKIngredientSearchResult *v17;
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
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMedicationsSearchResult.m"), 24, CFSTR("ingredientId cannot be nil"));

  }
  v20.receiver = self;
  v20.super_class = (Class)HKIngredientSearchResult;
  v16 = -[HKIngredientSearchResult init](&v20, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_ingredientId, a3);
    objc_storeStrong((id *)&v17->_ingredientName, a4);
    objc_storeStrong((id *)&v17->_strengthQuantity, a5);
    objc_storeStrong((id *)&v17->_strengthUnit, a6);
  }

  return v17;
}

- (id)dictionaryRepresentation
{
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  v17[0] = CFSTR("ingredientId");
  -[HKIngredientSearchResult ingredientId](self, "ingredientId");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (const __CFString *)v3;
  else
    v5 = CFSTR("(null)");
  v18[0] = v5;
  v17[1] = CFSTR("ingredientName");
  -[HKIngredientSearchResult ingredientName](self, "ingredientName");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (const __CFString *)v6;
  else
    v8 = CFSTR("(null)");
  v18[1] = v8;
  v17[2] = CFSTR("strengthQuantity");
  -[HKIngredientSearchResult strengthQuantity](self, "strengthQuantity");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = CFSTR("(null)");
  v18[2] = v11;
  v17[3] = CFSTR("strengthUnit");
  -[HKIngredientSearchResult strengthUnit](self, "strengthUnit");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = CFSTR("(null)");
  v18[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSString)ingredientId
{
  return self->_ingredientId;
}

- (NSString)ingredientName
{
  return self->_ingredientName;
}

- (NSString)strengthQuantity
{
  return self->_strengthQuantity;
}

- (NSString)strengthUnit
{
  return self->_strengthUnit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strengthUnit, 0);
  objc_storeStrong((id *)&self->_strengthQuantity, 0);
  objc_storeStrong((id *)&self->_ingredientName, 0);
  objc_storeStrong((id *)&self->_ingredientId, 0);
}

@end
