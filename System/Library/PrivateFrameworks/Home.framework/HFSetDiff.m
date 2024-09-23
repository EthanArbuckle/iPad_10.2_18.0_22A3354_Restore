@implementation HFSetDiff

+ (id)diffFromSet:(id)a3 toSet:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HFSetDiff *v11;
  void *v12;
  id v13;

  v5 = (void *)MEMORY[0x1E0C99E20];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "setWithSet:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minusSet:", v7);
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v6);
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minusSet:", v8);
  objc_msgSend(v10, "minusSet:", v9);
  v11 = [HFSetDiff alloc];
  v12 = (void *)objc_msgSend(v6, "mutableCopy");

  v13 = -[HFSetDiff _initWithFromSet:toSet:additions:deletions:updates:](v11, "_initWithFromSet:toSet:additions:deletions:updates:", v7, v12, v8, v9, v10);
  return v13;
}

- (id)_initWithFromSet:(id)a3 toSet:(id)a4 additions:(id)a5 deletions:(id)a6 updates:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HFSetDiff *v17;
  id *p_isa;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HFSetDiff;
  v17 = -[HFSetDiff init](&v21, sel_init);
  p_isa = (id *)&v17->super.isa;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_fromSet, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
    objc_storeStrong(p_isa + 4, a6);
    objc_storeStrong(p_isa + 5, a7);
  }

  return p_isa;
}

- (NSSet)additions
{
  return &self->_additions->super;
}

- (NSSet)deletions
{
  return &self->_deletions->super;
}

- (NSSet)updates
{
  return &self->_updates->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updates, 0);
  objc_storeStrong((id *)&self->_deletions, 0);
  objc_storeStrong((id *)&self->_additions, 0);
  objc_storeStrong((id *)&self->_toSet, 0);
  objc_storeStrong((id *)&self->_fromSet, 0);
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HFSetDiff fromSet](self, "fromSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)diffByMergingDiff:(id)a3 keyGenerator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HFSetDiff toSet](self, "toSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSetDiff deletions](self, "deletions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setByAddingObjectsFromSet:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "na_dictionaryWithKeyGenerator:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "toSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deletions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setByAddingObjectsFromSet:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "na_dictionaryWithKeyGenerator:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v11, "allKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v17;
  objc_msgSend(v15, "allKeys");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "na_arrayByFlattening");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)-[HFSetDiff mutableCopy](self, "mutableCopy");
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __44__HFSetDiff_diffByMergingDiff_keyGenerator___block_invoke;
  v29[3] = &unk_1EA73EC58;
  v30 = v11;
  v31 = v15;
  v32 = v6;
  v33 = v22;
  v23 = v22;
  v24 = v6;
  v25 = v15;
  v26 = v11;
  objc_msgSend(v21, "na_each:", v29);
  v27 = (void *)objc_msgSend(v23, "copy");

  return v27;
}

void __44__HFSetDiff_diffByMergingDiff_keyGenerator___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  char v7;
  id *v8;
  void *v9;
  BOOL v10;
  char v11;
  id v12;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKey:", v4);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "deletions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  if (v12 && v5)
  {
    v9 = *(void **)(a1 + 56);
    v8 = (id *)(a1 + 56);
    objc_msgSend(v9, "deleteObject:", v12);
    if ((v7 & 1) != 0)
      goto LABEL_14;
    goto LABEL_13;
  }
  if (v12)
    v10 = 1;
  else
    v10 = v5 == 0;
  if (v10)
    v11 = 1;
  else
    v11 = v7;
  if ((v11 & 1) == 0)
  {
    v8 = (id *)(a1 + 56);
LABEL_13:
    objc_msgSend(*v8, "addObject:", v5);
  }
LABEL_14:

}

- (BOOL)isEqual:(id)a3
{
  HFSetDiff *v4;
  HFSetDiff *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;

  v4 = (HFSetDiff *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HFSetDiff fromSet](v5, "fromSet");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFSetDiff fromSet](self, "fromSet");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v10 = 1;
      }
      else
      {
        -[HFSetDiff fromSet](v5, "fromSet");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFSetDiff fromSet](self, "fromSet");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

      }
      -[HFSetDiff toSet](v5, "toSet");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFSetDiff toSet](self, "toSet");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12 == v13)
      {
        v11 = v10 != 0;
      }
      else
      {
        -[HFSetDiff toSet](v5, "toSet");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFSetDiff toSet](self, "toSet");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isEqual:", v15);
        if (v10)
          v11 = v16;
        else
          v11 = 0;

      }
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HFMutableSetDiff *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v16;

  v4 = [HFMutableSetDiff alloc];
  -[HFSetDiff fromSet](self, "fromSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v16, "copy");
  -[HFSetDiff toSet](self, "toSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  -[HFSetDiff additions](self, "additions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  -[HFSetDiff deletions](self, "deletions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  -[HFSetDiff updates](self, "updates");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");
  v14 = -[HFSetDiff _initWithFromSet:toSet:additions:deletions:updates:](v4, "_initWithFromSet:toSet:additions:deletions:updates:", v5, v7, v9, v11, v13);

  return v14;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HFSetDiff fromSet](self, "fromSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSetDiff toSet](self, "toSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSetDiff additions](self, "additions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSetDiff deletions](self, "deletions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSetDiff updates](self, "updates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("From Set: %@\n To Set: %@\n Additions: %@\n Deletions: %@\n Updates:%@"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSSet)fromSet
{
  return self->_fromSet;
}

- (NSSet)toSet
{
  return &self->_toSet->super;
}

@end
