@implementation MATransitiveClosureRelation

- (MATransitiveClosureRelation)initWithBase:(id)a3
{
  id v5;
  id *v6;
  MATransitiveClosureRelation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MATransitiveClosureRelation;
  v6 = -[MARelation initForSubclassing](&v9, sel_initForSubclassing);
  v7 = (MATransitiveClosureRelation *)v6;
  if (v6)
    objc_storeStrong(v6 + 1, a3);

  return v7;
}

- (id)inverse
{
  MATransitiveClosureRelation *v3;
  void *v4;
  MATransitiveClosureRelation *v5;

  v3 = [MATransitiveClosureRelation alloc];
  -[MARelation inverse](self->_base, "inverse");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MATransitiveClosureRelation initWithBase:](v3, "initWithBase:", v4);

  return v5;
}

- (BOOL)isTransitive
{
  return 1;
}

- (void)unionAdjacencySetFromSourceNodeIdentifiers:(id)a3 toTargetNodeIdentifiers:(id)a4 graph:(id)a5
{
  id v8;
  id v9;
  id v10;
  KGMutableElementIdentifierSet *v11;
  KGMutableElementIdentifierSet *v12;
  void *v13;
  KGMutableElementIdentifierSet *v14;
  _BOOL4 v15;
  KGMutableElementIdentifierSet *v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(KGMutableElementIdentifierSet);
  v16 = (KGMutableElementIdentifierSet *)v8;
  v12 = v16;
  while (!-[KGElementIdentifierSet isEmpty](v12, "isEmpty"))
  {
    v13 = (void *)MEMORY[0x1CAA4B20C]();
    v14 = objc_alloc_init(KGMutableElementIdentifierSet);
    -[MARelation unionAdjacencySetFromSourceNodeIdentifiers:toTargetNodeIdentifiers:graph:](self->_base, "unionAdjacencySetFromSourceNodeIdentifiers:toTargetNodeIdentifiers:graph:", v12, v14, v10);
    -[KGMutableElementIdentifierSet subtractIdentifierSet:](v14, "subtractIdentifierSet:", v11);
    -[KGMutableElementIdentifierSet unionWithIdentifierSet:](v11, "unionWithIdentifierSet:", v14);

    v15 = -[MARelation isTransitive](self->_base, "isTransitive");
    objc_autoreleasePoolPop(v13);
    v12 = v14;
    if (v15)
      goto LABEL_6;
  }
  v14 = v12;
LABEL_6:
  objc_msgSend(v9, "unionWithIdentifierSet:", v11);

}

- (id)adjacencyWithStartNodeIdentifiers:(id)a3 graph:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  -[MARelation adjacencyWithStartNodeIdentifiers:graph:](self->_base, "adjacencyWithStartNodeIdentifiers:graph:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MARelation optionalStep](self->_base, "optionalStep");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "adjacencyByJoiningWithAdjacency:graph:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqual:", v9) & 1) != 0)
  {
    v10 = v7;
  }
  else
  {
    do
    {
      v10 = v9;

      objc_msgSend(v8, "adjacencyByJoiningWithAdjacency:graph:", v10, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v10;
    }
    while (!objc_msgSend(v10, "isEqual:", v9));
  }

  return v10;
}

- (id)adjacencyByJoiningWithAdjacency:(id)a3 graph:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  -[MARelation adjacencyByJoiningWithAdjacency:graph:](self->_base, "adjacencyByJoiningWithAdjacency:graph:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MARelation optionalStep](self->_base, "optionalStep");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "adjacencyByJoiningWithAdjacency:graph:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqual:", v9) & 1) != 0)
  {
    v10 = v7;
  }
  else
  {
    do
    {
      v10 = v9;

      objc_msgSend(v8, "adjacencyByJoiningWithAdjacency:graph:", v10, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v10;
    }
    while (!objc_msgSend(v10, "isEqual:", v9));
  }

  return v10;
}

- (id)visualString
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(CFSTR("-{"), "mutableCopy");
  -[MARelation visualString](self->_base, "visualString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  objc_msgSend(v3, "appendString:", CFSTR("}*"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  MATransitiveClosureRelation *v4;
  uint64_t v5;
  char v6;
  MARelation *base;
  void *v8;

  v4 = (MATransitiveClosureRelation *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      base = self->_base;
      -[MATransitiveClosureRelation base](v4, "base");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[MARelation isEqual:](base, "isEqual:", v8);

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return -[MARelation hash](self->_base, "hash");
}

- (MARelation)base
{
  return self->_base;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_base, 0);
}

+ (id)scanRelationWithScanner:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  MATransitiveClosureRelation *v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "scanLocation");
  if ((objc_msgSend(v3, "scanString:intoString:", CFSTR("-{"), 0) & 1) != 0)
  {
    +[MARelation scanRelationWithScanner:](MARelation, "scanRelationWithScanner:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5
      && (objc_msgSend(v3, "scanString:intoString:", CFSTR("}*"), 0) & 1) != 0
      && !objc_msgSend(v3, "scanInteger:", 0))
    {
      v6 = -[MATransitiveClosureRelation initWithBase:]([MATransitiveClosureRelation alloc], "initWithBase:", v5);
    }
    else
    {
      objc_msgSend(v3, "setScanLocation:", v4);
      v6 = 0;
    }

  }
  else
  {
    objc_msgSend(v3, "setScanLocation:", v4);
    v6 = 0;
  }

  return v6;
}

@end
