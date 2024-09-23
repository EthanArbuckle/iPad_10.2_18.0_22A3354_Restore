@implementation HKMedicationSearchResult

- (HKMedicationSearchResult)initWithSeedHgId:(id)a3 specificProduct:(id)a4 traversedRelationships:(id)a5 traversedDepth:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  HKMedicationSearchResult *v13;
  uint64_t v14;
  NSNumber *seedHgId;
  uint64_t v16;
  HKConcept *specificProduct;
  uint64_t v18;
  HKIntegerSet *traversedRelationships;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)HKMedicationSearchResult;
  v13 = -[HKMedicationSearchResult init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    seedHgId = v13->_seedHgId;
    v13->_seedHgId = (NSNumber *)v14;

    v16 = objc_msgSend(v11, "copy");
    specificProduct = v13->_specificProduct;
    v13->_specificProduct = (HKConcept *)v16;

    v18 = objc_msgSend(v12, "copy");
    traversedRelationships = v13->_traversedRelationships;
    v13->_traversedRelationships = (HKIntegerSet *)v18;

    v13->_traversedDepth = a6;
    v13->_lock._os_unfair_lock_opaque = 0;
    v13->_lock_hasWalkedGraph = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSNumber hash](self->_seedHgId, "hash");
  v4 = -[HKConcept hash](self->_specificProduct, "hash") ^ v3;
  return v4 ^ -[HKIntegerSet hash](self->_traversedRelationships, "hash") ^ self->_traversedDepth;
}

- (BOOL)isEqual:(id)a3
{
  HKMedicationSearchResult *v4;
  HKMedicationSearchResult *v5;
  NSNumber *seedHgId;
  NSNumber *v7;
  HKConcept *specificProduct;
  HKConcept *v9;
  HKIntegerSet *traversedRelationships;
  HKIntegerSet *v11;
  BOOL v12;

  v4 = (HKMedicationSearchResult *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      seedHgId = self->_seedHgId;
      v7 = v5->_seedHgId;
      v12 = (seedHgId == v7 || v7 && -[NSNumber isEqual:](seedHgId, "isEqual:"))
         && ((specificProduct = self->_specificProduct, v9 = v5->_specificProduct, specificProduct == v9)
          || v9 && -[HKConcept isEqual:](specificProduct, "isEqual:"))
         && ((traversedRelationships = self->_traversedRelationships,
              v11 = v5->_traversedRelationships,
              traversedRelationships == v11)
          || v11 && -[HKIntegerSet isEqual:](traversedRelationships, "isEqual:"))
         && self->_traversedDepth == v5->_traversedDepth;

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *seedHgId;
  id v5;

  seedHgId = self->_seedHgId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", seedHgId, CFSTR("SeedHgId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_specificProduct, CFSTR("SpecificProduct"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_traversedRelationships, CFSTR("TraversedRelationships"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_traversedDepth, CFSTR("TraversedDepth"));

}

- (HKMedicationSearchResult)initWithCoder:(id)a3
{
  id v4;
  HKMedicationSearchResult *v5;
  uint64_t v6;
  NSNumber *seedHgId;
  uint64_t v8;
  HKConcept *specificProduct;
  uint64_t v10;
  HKIntegerSet *traversedRelationships;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKMedicationSearchResult;
  v5 = -[HKMedicationSearchResult init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SeedHgId"));
    v6 = objc_claimAutoreleasedReturnValue();
    seedHgId = v5->_seedHgId;
    v5->_seedHgId = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SpecificProduct"));
    v8 = objc_claimAutoreleasedReturnValue();
    specificProduct = v5->_specificProduct;
    v5->_specificProduct = (HKConcept *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TraversedRelationships"));
    v10 = objc_claimAutoreleasedReturnValue();
    traversedRelationships = v5->_traversedRelationships;
    v5->_traversedRelationships = (HKIntegerSet *)v10;

    v5->_traversedDepth = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("TraversedDepth"));
  }

  return v5;
}

- (NSNumber)seedHgId
{
  return self->_seedHgId;
}

- (HKConcept)specificProduct
{
  return self->_specificProduct;
}

- (HKIntegerSet)traversedRelationships
{
  return self->_traversedRelationships;
}

- (int64_t)traversedDepth
{
  return self->_traversedDepth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traversedRelationships, 0);
  objc_storeStrong((id *)&self->_specificProduct, 0);
  objc_storeStrong((id *)&self->_seedHgId, 0);
  objc_storeStrong((id *)&self->_lock_ingredientProducts, 0);
  objc_storeStrong((id *)&self->_lock_routedDoseFormProducts, 0);
  objc_storeStrong((id *)&self->_lock_clinicalProducts, 0);
  objc_storeStrong((id *)&self->_lock_tradeNameProduct, 0);
}

- (HKConcept)tradeNameProduct
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HKMedicationSearchResult _lock_tradeNameProduct](self, "_lock_tradeNameProduct");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (HKConcept *)v4;
}

- (NSArray)routedDoseFormProducts
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HKMedicationSearchResult _lock_routedDoseFormProducts](self, "_lock_routedDoseFormProducts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSArray)ingredientProducts
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HKMedicationSearchResult _lock_ingredientProducts](self, "_lock_ingredientProducts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSArray)clinicalProducts
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HKMedicationSearchResult _lock_clinicalProducts](self, "_lock_clinicalProducts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (int64_t)debug_traversedNodeCount
{
  os_unfair_lock_s *p_lock;
  int64_t v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[HKMedicationSearchResult _lock_debug_traversedNodeCount](self, "_lock_debug_traversedNodeCount");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)_visit:(id)a3 ofRoot:(id)a4 withMaxDepth:(int64_t)a5 handler:(id)a6
{
  id v9;
  id v10;
  unsigned int (**v11)(id, void *);
  unint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  int64_t v25;
  void *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (unsigned int (**)(id, void *))a6;
  v12 = 0x1E0C99000uLL;
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = v10;
  objc_msgSend(v13, "addObject:", v10);
  v14 = 0;
  v15 = 0;
  v25 = a5 & ~(a5 >> 63);
  while (1)
  {
    v16 = v13;
    if (!objc_msgSend(v13, "count"))
      break;
    v27 = v14;

    v13 = objc_alloc_init(*(Class *)(v12 + 3560));
    while (objc_msgSend(v16, "count"))
    {
      objc_msgSend(v16, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeObjectAtIndex:", 0);
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      objc_msgSend(v17, "relationships");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v29;
        while (2)
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v29 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
            if (objc_msgSend(v9, "containsInteger:", objc_msgSend(v23, "type")))
            {
              objc_msgSend(v23, "destination");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v11[2](v11, v24))
              {

                goto LABEL_19;
              }
              objc_msgSend(v13, "addObject:", v24);

            }
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
          if (v20)
            continue;
          break;
        }
      }

    }
    v14 = v27 + 1;
    v15 = v16;
    v12 = 0x1E0C99000;
    if (v27 == v25)
      goto LABEL_19;
  }
  v16 = v15;
LABEL_19:

}

- (id)_lock_tradeNameProduct
{
  -[HKMedicationSearchResult _lock_walkGraphIfNecessary](self, "_lock_walkGraphIfNecessary");
  return self->_lock_tradeNameProduct;
}

- (id)_lock_routedDoseFormProducts
{
  -[HKMedicationSearchResult _lock_walkGraphIfNecessary](self, "_lock_walkGraphIfNecessary");
  return self->_lock_routedDoseFormProducts;
}

- (id)_lock_ingredientProducts
{
  -[HKMedicationSearchResult _lock_walkGraphIfNecessary](self, "_lock_walkGraphIfNecessary");
  return self->_lock_ingredientProducts;
}

- (id)_lock_clinicalProducts
{
  -[HKMedicationSearchResult _lock_walkGraphIfNecessary](self, "_lock_walkGraphIfNecessary");
  return self->_lock_clinicalProducts;
}

- (int64_t)_lock_debug_traversedNodeCount
{
  -[HKMedicationSearchResult _lock_walkGraphIfNecessary](self, "_lock_walkGraphIfNecessary");
  return self->_lock_traversedNodeCount;
}

- (void)_lock_walkGraphIfNecessary
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_lock_hasWalkedGraph)
  {
    -[HKMedicationSearchResult _lock_walkGraph](self, "_lock_walkGraph");
    self->_lock_hasWalkedGraph = 1;
  }
}

- (void)_lock_walkGraph
{
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  HKIntegerSet *traversedRelationships;
  HKConcept *specificProduct;
  int64_t traversedDepth;
  id v11;
  id v12;
  id v13;
  NSArray *v14;
  NSArray *lock_routedDoseFormProducts;
  NSArray *v16;
  NSArray *lock_ingredientProducts;
  NSArray *v18;
  NSArray *lock_clinicalProducts;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(_QWORD *, void *);
  void *v23;
  HKMedicationSearchResult *v24;
  id v25;
  id v26;
  id v27;

  os_unfair_lock_assert_owner(&self->_lock);
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HKConcept identifier](self->_specificProduct, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "rawIdentifier");

  if (v7 == 842)
    objc_msgSend(v3, "addObject:", self->_specificProduct);
  specificProduct = self->_specificProduct;
  traversedRelationships = self->_traversedRelationships;
  traversedDepth = self->_traversedDepth;
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __54__HKMedicationSearchResult_Traversal___lock_walkGraph__block_invoke;
  v23 = &unk_1E6CD5D48;
  v24 = self;
  v25 = v4;
  v26 = v5;
  v27 = v3;
  v11 = v3;
  v12 = v5;
  v13 = v4;
  -[HKMedicationSearchResult _visit:ofRoot:withMaxDepth:handler:](self, "_visit:ofRoot:withMaxDepth:handler:", traversedRelationships, specificProduct, traversedDepth, &v20);
  v14 = (NSArray *)objc_msgSend(v13, "copy", v20, v21, v22, v23, v24);
  lock_routedDoseFormProducts = self->_lock_routedDoseFormProducts;
  self->_lock_routedDoseFormProducts = v14;

  v16 = (NSArray *)objc_msgSend(v12, "copy");
  lock_ingredientProducts = self->_lock_ingredientProducts;
  self->_lock_ingredientProducts = v16;

  v18 = (NSArray *)objc_msgSend(v11, "copy");
  lock_clinicalProducts = self->_lock_clinicalProducts;
  self->_lock_clinicalProducts = v18;

}

uint64_t __54__HKMedicationSearchResult_Traversal___lock_walkGraph__block_invoke(_QWORD *a1, void *a2)
{
  id v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  void *v8;

  v4 = a2;
  ++*(_QWORD *)(a1[4] + 48);
  if (objc_msgSend(v4, "meds_isTradeNameProduct"))
  {
    v5 = a1[4];
    v7 = *(_QWORD *)(v5 + 16);
    v6 = (id *)(v5 + 16);
    if (!v7)
    {
      objc_storeStrong(v6, a2);
      goto LABEL_11;
    }
  }
  if (objc_msgSend(v4, "meds_isRoutedDoseFormProduct"))
  {
    v8 = (void *)a1[5];
LABEL_9:
    objc_msgSend(v8, "addObject:", v4);
    goto LABEL_11;
  }
  if (objc_msgSend(v4, "meds_isIngredientProduct"))
  {
    v8 = (void *)a1[6];
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "meds_isClinicalProduct"))
  {
    v8 = (void *)a1[7];
    goto LABEL_9;
  }
LABEL_11:

  return 1;
}

@end
