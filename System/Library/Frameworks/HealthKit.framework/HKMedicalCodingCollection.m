@implementation HKMedicalCodingCollection

+ (HKMedicalCodingCollection)collectionWithCodings:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCodingCollection.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("codings"));

  }
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCodings:", v5);

  return (HKMedicalCodingCollection *)v6;
}

+ (HKMedicalCodingCollection)collectionWithCoding:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMedicalCodingCollection.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("coding"));

  }
  v6 = objc_alloc((Class)a1);
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithCodings:", v7);

  return (HKMedicalCodingCollection *)v8;
}

- (HKMedicalCodingCollection)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKMedicalCodingCollection)initWithCodings:(id)a3
{
  id v5;
  HKMedicalCodingCollection *v6;
  uint64_t v7;
  NSOrderedSet *codingsOrderedSet;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMedicalCodingCollection.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("codings"));

  }
  v11.receiver = self;
  v11.super_class = (Class)HKMedicalCodingCollection;
  v6 = -[HKMedicalCodingCollection init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:", v5);
    codingsOrderedSet = v6->_codingsOrderedSet;
    v6->_codingsOrderedSet = (NSOrderedSet *)v7;

  }
  return v6;
}

- (id)collectionByAddingCodings:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  HKMedicalCodingCollection *v9;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = [v4 alloc];
  -[HKMedicalCodingCollection codings](self, "codings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithArray:", v7);

  objc_msgSend(v8, "addObjectsFromArray:", v5);
  v9 = -[HKMedicalCodingCollection initWithCodings:]([HKMedicalCodingCollection alloc], "initWithCodings:", v8);

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;

  -[HKMedicalCodingCollection codings](self, "codings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_map:", &__block_literal_global_21);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@:%p, codings = [%@]>"), v8, self, v5, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __40__HKMedicalCodingCollection_description__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "description");
}

- (id)codingsForCodingSystem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  -[HKMedicalCodingCollection codings](self, "codings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__HKMedicalCodingCollection_codingsForCodingSystem___block_invoke;
  v11[3] = &unk_1E37EB168;
  v12 = v4;
  v7 = v4;
  objc_msgSend(v6, "hk_filter:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __52__HKMedicalCodingCollection_codingsForCodingSystem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "codingSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)codingsExcludingCodingSystem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[HKMedicalCodingCollection codings](self, "codings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stripCodingsMatchingSystem:fromCodings:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)stripCodingsMatchingSystem:(id)a3 fromCodings:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__HKMedicalCodingCollection_stripCodingsMatchingSystem_fromCodings___block_invoke;
  v9[3] = &unk_1E37EB168;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a4, "hk_filter:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __68__HKMedicalCodingCollection_stripCodingsMatchingSystem_fromCodings___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(v3, "codingSystem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  if (v4 == v5)
  {
    v7 = 0;
  }
  else if (v5)
  {
    objc_msgSend(v3, "codingSystem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32)) ^ 1;

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (NSDictionary)codingsBySystem
{
  id v3;
  NSOrderedSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = self->_codingsOrderedSet;
  v5 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v9, "codingSystem");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          v12 = v10;
        }
        else
        {
          +[HKMedicalCodingSystem unknownSystem](HKMedicalCodingSystem, "unknownSystem");
          v12 = (id)objc_claimAutoreleasedReturnValue();
        }
        v13 = v12;

        objc_msgSend(v3, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          v15 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, v13);

        }
        objc_msgSend(v3, "objectForKeyedSubscript:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v9);

      }
      v6 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "allKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __44__HKMedicalCodingCollection_codingsBySystem__block_invoke;
  v21[3] = &unk_1E37EB190;
  v22 = v3;
  v18 = v3;
  objc_msgSend(v17, "hk_mapToDictionary:", v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v19;
}

void __44__HKMedicalCodingCollection_codingsBySystem__block_invoke(uint64_t a1, void *a2, void (**a3)(_QWORD, _QWORD, _QWORD))
{
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  id v7;
  void *v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v9, "copy");
  ((void (**)(_QWORD, id, void *))a3)[2](v6, v7, v8);

}

- (NSArray)codings
{
  return -[NSOrderedSet array](self->_codingsOrderedSet, "array");
}

- (NSSet)codingsSet
{
  return -[NSOrderedSet set](self->_codingsOrderedSet, "set");
}

- (int64_t)count
{
  return -[NSOrderedSet count](self->_codingsOrderedSet, "count");
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HKMedicalCodingCollection codings](self, "codings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HKMedicalCodingCollection *v4;
  HKMedicalCodingCollection *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  char v12;

  v4 = (HKMedicalCodingCollection *)a3;
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
      -[HKMedicalCodingCollection codings](self, "codings");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKMedicalCodingCollection codings](v5, "codings");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        LOBYTE(v11) = 0;
      }
      else
      {
        -[HKMedicalCodingCollection codings](v5, "codings");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          -[HKMedicalCodingCollection codings](self, "codings");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKMedicalCodingCollection codings](v5, "codings");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "isEqual:", v10) ^ 1;

        }
        else
        {
          LOBYTE(v11) = 1;
        }

      }
      v12 = v11 ^ 1;

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

- (HKMedicalCodingCollection)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  HKMedicalCodingCollection *v9;
  uint64_t v10;
  NSOrderedSet *codingsOrderedSet;
  HKMedicalCodingCollection *v12;
  objc_super v14;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("Codings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v14.receiver = self;
    v14.super_class = (Class)HKMedicalCodingCollection;
    v9 = -[HKMedicalCodingCollection init](&v14, sel_init);
    if (v9)
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:", v8);
      codingsOrderedSet = v9->_codingsOrderedSet;
      v9->_codingsOrderedSet = (NSOrderedSet *)v10;

    }
    self = v9;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HKMedicalCodingCollection codings](self, "codings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("Codings"));

}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSOrderedSet countByEnumeratingWithState:objects:count:](self->_codingsOrderedSet, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codingsOrderedSet, 0);
}

@end
