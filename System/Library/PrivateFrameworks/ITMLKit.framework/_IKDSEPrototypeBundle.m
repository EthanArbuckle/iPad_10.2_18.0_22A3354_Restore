@implementation _IKDSEPrototypeBundle

- (_IKDSEPrototypeBundle)init
{
  _IKDSEPrototypeBundle *v2;
  uint64_t v3;
  NSMutableArray *prototypes;
  uint64_t v5;
  NSMutableArray *entries;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_IKDSEPrototypeBundle;
  v2 = -[_IKDSEPrototypeBundle init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
    v3 = objc_claimAutoreleasedReturnValue();
    prototypes = v2->_prototypes;
    v2->_prototypes = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
    v5 = objc_claimAutoreleasedReturnValue();
    entries = v2->_entries;
    v2->_entries = (NSMutableArray *)v5;

  }
  return v2;
}

- (id)prototypeForItemAtIndex:(unint64_t)a3
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v13;
  id v14;
  void *v15;

  if (self->_flags.areEntriesDirty)
    -[NSMutableArray sortUsingComparator:](self->_entries, "sortUsingComparator:", &__block_literal_global_21);
  v5 = -[NSMutableArray count](self->_entries, "count");
  if (!v5)
  {
    v14 = 0;
LABEL_22:
    v15 = 0;
    goto LABEL_23;
  }
  v6 = v5;
  v7 = 0;
  do
  {
    v8 = v7 + (v6 >> 1);
    -[NSMutableArray objectAtIndexedSubscript:](self->_entries, "objectAtIndexedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "range");
    if (a3 < v10 || a3 - v10 >= v11)
    {
      v13 = objc_msgSend(v9, "range");
      if (v13 <= a3)
        v6 += v7 + ~v8;
      else
        v6 >>= 1;
      if (v13 <= a3)
        v7 = v8 + 1;
      v14 = 0;
    }
    else
    {
      v14 = v9;
    }

  }
  while (!v14 && v6);
  if (!v14)
    goto LABEL_22;
  -[NSMutableArray objectAtIndexedSubscript:](self->_prototypes, "objectAtIndexedSubscript:", objc_msgSend(v14, "prototypeIndex"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:

  return v15;
}

- (id)allPrototypes
{
  return self->_prototypes;
}

- (void)addPrototype:(id)a3 forIndexes:(id)a4
{
  NSMutableArray *prototypes;
  id v7;
  uint64_t v8;
  NSMutableArray *v9;
  NSMutableArray *v10;
  _QWORD v11[4];
  NSMutableArray *v12;
  uint64_t v13;

  prototypes = self->_prototypes;
  v7 = a4;
  -[NSMutableArray addObject:](prototypes, "addObject:", a3);
  v8 = -[NSMutableArray count](self->_prototypes, "count") - 1;
  v9 = self->_entries;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49___IKDSEPrototypeBundle_addPrototype_forIndexes___block_invoke;
  v11[3] = &unk_1E9F4E398;
  v12 = v9;
  v13 = v8;
  v10 = v9;
  objc_msgSend(v7, "enumerateRangesUsingBlock:", v11);

  self->_flags.areEntriesDirty = 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_prototypes, 0);
}

@end
