@implementation MAMultiStepRelation

- (MAMultiStepRelation)initWithBase:(id)a3 minNumberOfSteps:(unint64_t)a4 maxNumberOfSteps:(unint64_t)a5
{
  id v9;
  id *v10;
  MAMultiStepRelation *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MAMultiStepRelation;
  v10 = -[MARelation initForSubclassing](&v13, sel_initForSubclassing);
  v11 = (MAMultiStepRelation *)v10;
  if (v10)
  {
    objc_storeStrong(v10 + 1, a3);
    v11->_minNumberOfSteps = a4;
    v11->_maxNumberOfSteps = a5;
  }

  return v11;
}

- (MAMultiStepRelation)initWithBase:(id)a3 numberOfSteps:(unint64_t)a4
{
  return -[MAMultiStepRelation initWithBase:minNumberOfSteps:maxNumberOfSteps:](self, "initWithBase:minNumberOfSteps:maxNumberOfSteps:", a3, a4, a4);
}

- (id)inverse
{
  MAMultiStepRelation *v3;
  void *v4;
  MAMultiStepRelation *v5;

  v3 = [MAMultiStepRelation alloc];
  -[MARelation inverse](self->_base, "inverse");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MAMultiStepRelation initWithBase:minNumberOfSteps:maxNumberOfSteps:](v3, "initWithBase:minNumberOfSteps:maxNumberOfSteps:", v4, self->_minNumberOfSteps, self->_maxNumberOfSteps);

  return v5;
}

- (void)unionAdjacencySetFromSourceNodeIdentifiers:(id)a3 toTargetNodeIdentifiers:(id)a4 graph:(id)a5
{
  id v8;
  id v9;
  id v10;
  KGMutableElementIdentifierSet *v11;
  uint64_t v12;
  KGMutableElementIdentifierSet *v13;
  KGMutableElementIdentifierSet *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  KGMutableElementIdentifierSet *v20;
  void *v21;
  KGMutableElementIdentifierSet *v22;
  KGMutableElementIdentifierSet *v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (KGMutableElementIdentifierSet *)v8;
  v23 = v11;
  if (self->_minNumberOfSteps)
  {
    v12 = -1;
    v13 = v11;
    do
    {
      v14 = v13;
      v15 = (void *)MEMORY[0x1CAA4B20C]();
      v13 = objc_alloc_init(KGMutableElementIdentifierSet);
      -[MARelation unionAdjacencySetFromSourceNodeIdentifiers:toTargetNodeIdentifiers:graph:](self->_base, "unionAdjacencySetFromSourceNodeIdentifiers:toTargetNodeIdentifiers:graph:", v14, v13, v10);

      objc_autoreleasePoolPop(v15);
      v16 = v12 + 1;
      v17 = v12 + 2;
      ++v12;
    }
    while (v17 < self->_minNumberOfSteps);
    v18 = v16 + 2;
  }
  else
  {
    v18 = 1;
    v13 = v11;
  }
  v19 = objc_msgSend(v9, "unionWithIdentifierSet:", v13);
  if (v18 <= self->_maxNumberOfSteps)
  {
    do
    {
      v21 = (void *)MEMORY[0x1CAA4B20C](v19);
      v22 = objc_alloc_init(KGMutableElementIdentifierSet);
      -[MARelation unionAdjacencySetFromSourceNodeIdentifiers:toTargetNodeIdentifiers:graph:](self->_base, "unionAdjacencySetFromSourceNodeIdentifiers:toTargetNodeIdentifiers:graph:", v13, v22, v10);
      v20 = v22;

      objc_msgSend(v9, "unionWithIdentifierSet:", v20);
      objc_autoreleasePoolPop(v21);
      ++v18;
      v13 = v20;
    }
    while (v18 <= self->_maxNumberOfSteps);
  }
  else
  {
    v20 = v13;
  }

}

- (id)adjacencyWithStartNodeIdentifiers:(id)a3 graph:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  +[KGDirectedBinaryAdjacency identityWith:](KGDirectedBinaryAdjacency, "identityWith:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAMultiStepRelation adjacencyByJoiningWithAdjacency:graph:](self, "adjacencyByJoiningWithAdjacency:graph:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)adjacencyByJoiningWithAdjacency:(id)a3 graph:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *i;
  void *v14;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v8;
  v10 = 0;
  if (self->_minNumberOfSteps)
  {
    v11 = v8;
    do
    {
      -[MARelation adjacencyByJoiningWithAdjacency:graph:](self->_base, "adjacencyByJoiningWithAdjacency:graph:", v11, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      ++v10;
      v11 = v12;
    }
    while (v10 < self->_minNumberOfSteps);
  }
  else
  {
    v12 = v8;
  }
  for (i = (void *)objc_msgSend(v12, "mutableCopy"); v10 < self->_maxNumberOfSteps; ++v10)
  {
    -[MARelation adjacencyByJoiningWithAdjacency:graph:](self->_base, "adjacencyByJoiningWithAdjacency:graph:", i, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(i, "formUnionWith:", v14);

  }
  return i;
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
  objc_msgSend(v3, "appendFormat:", CFSTR("%lu"), self->_minNumberOfSteps);
  if (self->_minNumberOfSteps != self->_maxNumberOfSteps)
    objc_msgSend(v3, "appendFormat:", CFSTR("..%lu"), self->_maxNumberOfSteps);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  MAMultiStepRelation *v4;
  MAMultiStepRelation *v5;
  unint64_t minNumberOfSteps;
  unint64_t maxNumberOfSteps;
  MARelation *base;
  void *v9;
  char v10;

  v4 = (MAMultiStepRelation *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      minNumberOfSteps = self->_minNumberOfSteps;
      if (minNumberOfSteps == -[MAMultiStepRelation minNumberOfSteps](v5, "minNumberOfSteps")
        && (maxNumberOfSteps = self->_maxNumberOfSteps,
            maxNumberOfSteps == -[MAMultiStepRelation maxNumberOfSteps](v5, "maxNumberOfSteps")))
      {
        base = self->_base;
        -[MAMultiStepRelation base](v5, "base");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[MARelation isEqual:](base, "isEqual:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;

  v3 = -[MARelation hash](self->_base, "hash");
  v4 = (self->_minNumberOfSteps + ((v3 + 2654435769) << 6) + ((unint64_t)(v3 + 2654435769) >> 2) + 2654435769u) ^ (v3 + 2654435769);
  return (self->_maxNumberOfSteps + (v4 << 6) + (v4 >> 2) + 2654435769u) ^ v4;
}

- (MARelation)base
{
  return self->_base;
}

- (unint64_t)minNumberOfSteps
{
  return self->_minNumberOfSteps;
}

- (unint64_t)maxNumberOfSteps
{
  return self->_maxNumberOfSteps;
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
  MAMultiStepRelation *v6;
  MAMultiStepRelation *v7;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  v4 = objc_msgSend(v3, "scanLocation");
  if ((objc_msgSend(v3, "scanString:intoString:", CFSTR("-{"), 0) & 1) != 0)
  {
    +[MARelation scanRelationWithScanner:](MARelation, "scanRelationWithScanner:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5
      && (objc_msgSend(v3, "scanString:intoString:", CFSTR("}*"), 0) & 1) != 0
      && (v10 = 0, (objc_msgSend(v3, "scanInteger:", &v10) & 1) != 0))
    {
      v9 = v10;
      if (objc_msgSend(v3, "scanString:intoString:", CFSTR(".."), 0)
        && (objc_msgSend(v3, "scanInteger:", &v9) & 1) == 0)
      {
        objc_msgSend(v3, "setScanLocation:", v4);
      }
      v6 = [MAMultiStepRelation alloc];
      v7 = -[MAMultiStepRelation initWithBase:minNumberOfSteps:maxNumberOfSteps:](v6, "initWithBase:minNumberOfSteps:maxNumberOfSteps:", v5, v10, v9);
    }
    else
    {
      objc_msgSend(v3, "setScanLocation:", v4);
      v7 = 0;
    }

  }
  else
  {
    objc_msgSend(v3, "setScanLocation:", v4);
    v7 = 0;
  }

  return v7;
}

@end
