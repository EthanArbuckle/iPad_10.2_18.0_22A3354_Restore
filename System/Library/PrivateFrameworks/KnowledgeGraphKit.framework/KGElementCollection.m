@implementation KGElementCollection

- (KGElementCollection)initWithIdentifiers:(id)a3 graph:(id)a4
{
  id v7;
  id v8;
  KGElementCollection *v9;
  KGElementCollection *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)KGElementCollection;
  v9 = -[KGElementCollection init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifiers, a3);
    objc_storeStrong((id *)&v10->_graph, a4);
  }

  return v10;
}

- (NSSet)set
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", -[KGElementCollection count](self, "count"));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __26__KGElementCollection_set__block_invoke;
  v6[3] = &unk_1E83E4D80;
  v4 = v3;
  v7 = v4;
  -[KGElementCollection enumerateElementsWithBatchSize:usingBlock:](self, "enumerateElementsWithBatchSize:usingBlock:", 256, v6);

  return (NSSet *)v4;
}

- (unint64_t)count
{
  return -[KGElementIdentifierSet count](self->_identifiers, "count");
}

- (KGElement)anyObject
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__4129;
  v9 = __Block_byref_object_dispose__4130;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__KGElementCollection_anyObject__block_invoke;
  v4[3] = &unk_1E83E4DA8;
  v4[4] = &v5;
  -[KGElementCollection enumerateElementsWithBatchSize:usingBlock:](self, "enumerateElementsWithBatchSize:usingBlock:", 1, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (KGElement *)v2;
}

- (NSArray)allObjects
{
  id v2;

  KGAbstractMethodException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)enumerateElementIdentifierBatchesWithBatchSize:(unint64_t)a3 usingBlock:(id)a4
{
  void (**v6)(id, void *, _BYTE *);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  unsigned __int8 v12;

  v6 = (void (**)(id, void *, _BYTE *))a4;
  -[KGElementCollection identifiers](self, "identifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  v12 = 0;
  do
  {
    if ((objc_msgSend(v8, "isEmpty") & 1) != 0)
      break;
    v9 = (void *)MEMORY[0x1CAA4B20C]();
    objc_msgSend(v8, "prefix:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "subtractIdentifierSet:", v10);
    v6[2](v6, v10, &v12);
    v11 = v12;

    objc_autoreleasePoolPop(v9);
  }
  while (!v11);

}

- (void)enumerateElementsWithBatchSize:(unint64_t)a3 usingBlock:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  KGAbstractMethodException(self, a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (void)enumeratePropertyValuesForKey:(id)a3 withBlock:(id)a4
{
  id v7;
  id v8;
  id v9;

  v7 = a3;
  v8 = a4;
  KGAbstractMethodException(self, a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

- (id)description
{
  void *v2;
  void *v3;

  -[KGElementCollection set](self, "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEqualToCollection:(id)a3
{
  id v4;
  KGElementIdentifierSet *identifiers;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  identifiers = self->_identifiers;
  objc_msgSend(v4, "identifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(identifiers) = -[KGElementIdentifierSet isEqualToElementIdentifierSet:](identifiers, "isEqualToElementIdentifierSet:", v6);

  if ((_DWORD)identifiers)
  {
    -[KGGraph implementation](self->_graph, "implementation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "graph");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "implementation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isEqual:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  KGElementCollection *v4;
  BOOL v5;
  objc_super v7;

  v4 = (KGElementCollection *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)KGElementCollection;
    if (-[KGElementCollection isEqual:](&v7, sel_isEqual_, v4))
      v5 = -[KGElementCollection isEqualToCollection:](self, "isEqualToCollection:", v4);
    else
      v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return -[KGElementIdentifierSet hash](self->_identifiers, "hash");
}

- (id)collectionByFormingUnionWithCollection:(id)a3
{
  KGElementIdentifierSet *identifiers;
  void *v5;
  void *v6;
  void *v7;

  identifiers = self->_identifiers;
  objc_msgSend(a3, "identifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[KGElementIdentifierSet identifierSetByFormingUnion:](identifiers, "identifierSetByFormingUnion:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIdentifiers:graph:", v6, self->_graph);
  return v7;
}

- (id)collectionByIntersectingCollection:(id)a3
{
  KGElementIdentifierSet *identifiers;
  void *v5;
  void *v6;
  void *v7;

  identifiers = self->_identifiers;
  objc_msgSend(a3, "identifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[KGElementIdentifierSet identifierSetByIntersectingIdentifierSet:](identifiers, "identifierSetByIntersectingIdentifierSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIdentifiers:graph:", v6, self->_graph);
  return v7;
}

- (id)collectionBySubtractingCollection:(id)a3
{
  KGElementIdentifierSet *identifiers;
  void *v5;
  void *v6;
  void *v7;

  identifiers = self->_identifiers;
  objc_msgSend(a3, "identifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[KGElementIdentifierSet identifierSetBySubtractingIdentifierSet:](identifiers, "identifierSetBySubtractingIdentifierSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIdentifiers:graph:", v6, self->_graph);
  return v7;
}

- (BOOL)intersectsCollection:(id)a3
{
  KGElementIdentifierSet *identifiers;
  void *v4;

  identifiers = self->_identifiers;
  objc_msgSend(a3, "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(identifiers) = -[KGElementIdentifierSet intersectsIdentifierSet:](identifiers, "intersectsIdentifierSet:", v4);

  return (char)identifiers;
}

- (BOOL)isSubsetOfCollection:(id)a3
{
  KGElementIdentifierSet *identifiers;
  void *v4;

  identifiers = self->_identifiers;
  objc_msgSend(a3, "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(identifiers) = -[KGElementIdentifierSet isSubsetOfIdentifierSet:](identifiers, "isSubsetOfIdentifierSet:", v4);

  return (char)identifiers;
}

- (BOOL)containsCollection:(id)a3
{
  KGElementIdentifierSet *identifiers;
  void *v4;

  identifiers = self->_identifiers;
  objc_msgSend(a3, "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(identifiers) = -[KGElementIdentifierSet containsIdentifierSet:](identifiers, "containsIdentifierSet:", v4);

  return (char)identifiers;
}

- (KGElementIdentifierSet)identifiers
{
  return self->_identifiers;
}

- (KGGraph)graph
{
  return self->_graph;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

void __32__KGElementCollection_anyObject__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

uint64_t __26__KGElementCollection_set__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

@end
