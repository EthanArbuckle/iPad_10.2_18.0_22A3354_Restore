@implementation MABinaryAdjacency

- (MABinaryAdjacency)initWithAdjacency:(id)a3 graphReference:(id)a4 sourcesClass:(Class)a5 targetsClass:(Class)a6
{
  id v11;
  id v12;
  MABinaryAdjacency *v13;
  MABinaryAdjacency *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MABinaryAdjacency;
  v13 = -[MABinaryAdjacency init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_adjacency, a3);
    objc_storeStrong((id *)&v14->_graphReference, a4);
    objc_storeStrong((id *)&v14->_sourcesClass, a5);
    objc_storeStrong((id *)&v14->_targetsClass, a6);
  }

  return v14;
}

- (MABinaryAdjacency)initWithAdjacency:(id)a3 graph:(id)a4 sourcesClass:(Class)a5 targetsClass:(Class)a6
{
  id v10;
  void *v11;
  MABinaryAdjacency *v12;

  v10 = a3;
  objc_msgSend(a4, "graphReference");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MABinaryAdjacency initWithAdjacency:graphReference:sourcesClass:targetsClass:](self, "initWithAdjacency:graphReference:sourcesClass:targetsClass:", v10, v11, a5, a6);

  return v12;
}

- (MANodeCollection)sources
{
  id v3;
  MAGraphReference *graphReference;
  void *v5;
  void *v6;

  v3 = objc_alloc(self->_sourcesClass);
  graphReference = self->_graphReference;
  -[KGDirectedBinaryAdjacency sources](self->_adjacency, "sources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithGraphReference:elementIdentifiers:", graphReference, v5);

  return (MANodeCollection *)v6;
}

- (MANodeCollection)targets
{
  id v3;
  MAGraphReference *graphReference;
  void *v5;
  void *v6;

  v3 = objc_alloc(self->_targetsClass);
  graphReference = self->_graphReference;
  -[KGDirectedBinaryAdjacency targets](self->_adjacency, "targets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithGraphReference:elementIdentifiers:", graphReference, v5);

  return (MANodeCollection *)v6;
}

- (unint64_t)sourcesCount
{
  return -[KGDirectedBinaryAdjacency sourcesCount](self->_adjacency, "sourcesCount");
}

- (void)enumerateTargetsBySourceWithBlock:(id)a3
{
  id v4;
  KGDirectedBinaryAdjacency *adjacency;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  adjacency = self->_adjacency;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__MABinaryAdjacency_enumerateTargetsBySourceWithBlock___block_invoke;
  v7[3] = &unk_1E83E58A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[KGDirectedBinaryAdjacency enumerateTargetsBySourceWith:](adjacency, "enumerateTargetsBySourceWith:", v7);

}

- (id)targetsForSources:(id)a3
{
  objc_class *targetsClass;
  id v5;
  id v6;
  KGDirectedBinaryAdjacency *adjacency;
  KGDirectedBinaryAdjacency *v8;
  KGDirectedBinaryAdjacency **p_adjacency;
  void *v10;
  void *v11;
  void *v12;

  targetsClass = self->_targetsClass;
  v5 = a3;
  v6 = [targetsClass alloc];
  p_adjacency = &self->_adjacency;
  adjacency = self->_adjacency;
  v8 = p_adjacency[1];
  objc_msgSend(v5, "elementIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[KGDirectedBinaryAdjacency targetsForSources:](adjacency, "targetsForSources:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v6, "initWithGraphReference:elementIdentifiers:", v8, v11);

  return v12;
}

- (id)targetsForSourceIdentifier:(unint64_t)a3
{
  id v5;
  MAGraphReference *graphReference;
  void *v7;
  void *v8;

  v5 = objc_alloc(self->_targetsClass);
  graphReference = self->_graphReference;
  -[KGDirectedBinaryAdjacency targetsForSourceIdentifier:](self->_adjacency, "targetsForSourceIdentifier:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithGraphReference:elementIdentifiers:", graphReference, v7);

  return v8;
}

- (id)targetsWithMinimumCount:(unint64_t)a3
{
  id v5;
  MAGraphReference *graphReference;
  void *v7;
  void *v8;

  v5 = objc_alloc(self->_targetsClass);
  graphReference = self->_graphReference;
  -[KGDirectedBinaryAdjacency targetsWithMinimumCount:](self->_adjacency, "targetsWithMinimumCount:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithGraphReference:elementIdentifiers:", graphReference, v7);

  return v8;
}

- (id)transposed
{
  void *v3;
  void *v4;
  MABinaryAdjacency *v5;

  -[MABinaryAdjacency adjacency](self, "adjacency");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transposed");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[MABinaryAdjacency initWithAdjacency:graphReference:sourcesClass:targetsClass:]([MABinaryAdjacency alloc], "initWithAdjacency:graphReference:sourcesClass:targetsClass:", v4, self->_graphReference, self->_targetsClass, self->_sourcesClass);
  return v5;
}

- (id)differenceWith:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MABinaryAdjacency *v8;

  v4 = a3;
  -[MABinaryAdjacency adjacency](self, "adjacency");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "adjacency");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "differenceWith:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[MABinaryAdjacency initWithAdjacency:graphReference:sourcesClass:targetsClass:]([MABinaryAdjacency alloc], "initWithAdjacency:graphReference:sourcesClass:targetsClass:", v7, self->_graphReference, self->_sourcesClass, self->_targetsClass);
  return v8;
}

- (id)intersectingTargetsWith:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MABinaryAdjacency *v8;

  v4 = a3;
  -[MABinaryAdjacency adjacency](self, "adjacency");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "elementIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "intersectingTargetsWith:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[MABinaryAdjacency initWithAdjacency:graphReference:sourcesClass:targetsClass:]([MABinaryAdjacency alloc], "initWithAdjacency:graphReference:sourcesClass:targetsClass:", v7, self->_graphReference, self->_sourcesClass, self->_targetsClass);
  return v8;
}

- (id)intersectingSourcesWith:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MABinaryAdjacency *v8;

  v4 = a3;
  -[MABinaryAdjacency adjacency](self, "adjacency");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "elementIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "intersectingSourcesWith:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[MABinaryAdjacency initWithAdjacency:graphReference:sourcesClass:targetsClass:]([MABinaryAdjacency alloc], "initWithAdjacency:graphReference:sourcesClass:targetsClass:", v7, self->_graphReference, self->_sourcesClass, self->_targetsClass);
  return v8;
}

- (id)subtractingTargetsWith:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MABinaryAdjacency *v8;

  v4 = a3;
  -[MABinaryAdjacency adjacency](self, "adjacency");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "elementIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "subtractingTargetsWith:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[MABinaryAdjacency initWithAdjacency:graphReference:sourcesClass:targetsClass:]([MABinaryAdjacency alloc], "initWithAdjacency:graphReference:sourcesClass:targetsClass:", v7, self->_graphReference, self->_sourcesClass, self->_targetsClass);
  return v8;
}

- (id)subtractingSourcesWith:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MABinaryAdjacency *v8;

  v4 = a3;
  -[MABinaryAdjacency adjacency](self, "adjacency");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "elementIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "subtractingSourcesWith:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[MABinaryAdjacency initWithAdjacency:graphReference:sourcesClass:targetsClass:]([MABinaryAdjacency alloc], "initWithAdjacency:graphReference:sourcesClass:targetsClass:", v7, self->_graphReference, self->_sourcesClass, self->_targetsClass);
  return v8;
}

- (BOOL)isEqualToAdjacency:(id)a3
{
  return (MAGraphReference *)*((_QWORD *)a3 + 2) == self->_graphReference
      && -[KGDirectedBinaryAdjacency isEqual:](self->_adjacency, "isEqual:", *((_QWORD *)a3 + 1));
}

- (BOOL)isEqual:(id)a3
{
  MABinaryAdjacency *v4;
  void *v5;
  char isKindOfClass;
  BOOL v7;

  v4 = (MABinaryAdjacency *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    v7 = (isKindOfClass & 1) != 0 && -[MABinaryAdjacency isEqualToAdjacency:](self, "isEqualToAdjacency:", v4);
  }

  return v7;
}

- (unint64_t)hash
{
  return -[KGDirectedBinaryAdjacency hash](self->_adjacency, "hash");
}

- (KGDirectedBinaryAdjacency)adjacency
{
  return self->_adjacency;
}

- (MAGraphReference)graphReference
{
  return self->_graphReference;
}

- (Class)sourcesClass
{
  return self->_sourcesClass;
}

- (Class)targetsClass
{
  return self->_targetsClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetsClass, 0);
  objc_storeStrong((id *)&self->_sourcesClass, 0);
  objc_storeStrong((id *)&self->_graphReference, 0);
  objc_storeStrong((id *)&self->_adjacency, 0);
}

void __55__MABinaryAdjacency_enumerateTargetsBySourceWithBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  KGElementIdentifierSet *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = (void *)MEMORY[0x1CAA4B20C]();
  v6 = -[KGElementIdentifierSet initWithElementIdentifier:]([KGElementIdentifierSet alloc], "initWithElementIdentifier:", a2);
  v7 = (void *)objc_msgSend(objc_alloc(*(Class *)(*(_QWORD *)(a1 + 32) + 24)), "initWithGraphReference:elementIdentifiers:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), v6);
  v8 = (void *)objc_msgSend(objc_alloc(*(Class *)(*(_QWORD *)(a1 + 32) + 32)), "initWithGraphReference:elementIdentifiers:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), v9);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  objc_autoreleasePoolPop(v5);
}

+ (id)adjacencyWithSources:(id)a3 relation:(id)a4 targetsClass:(Class)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "graphReference");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "concreteGraph");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "elementIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "adjacencyWithSources:relation:", v12, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc((Class)a1);
  v15 = objc_opt_class();

  v16 = (void *)objc_msgSend(v14, "initWithAdjacency:graphReference:sourcesClass:targetsClass:", v13, v10, v15, a5);
  return v16;
}

@end
