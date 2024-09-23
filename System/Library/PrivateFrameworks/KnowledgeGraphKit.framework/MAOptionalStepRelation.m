@implementation MAOptionalStepRelation

- (MAOptionalStepRelation)initWithBase:(id)a3
{
  id v5;
  id *v6;
  MAOptionalStepRelation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MAOptionalStepRelation;
  v6 = -[MARelation initForSubclassing](&v9, sel_initForSubclassing);
  v7 = (MAOptionalStepRelation *)v6;
  if (v6)
    objc_storeStrong(v6 + 1, a3);

  return v7;
}

- (id)inverse
{
  void *v2;
  void *v3;

  -[MARelation inverse](self->_base, "inverse");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "optionalStep");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)unionAdjacencySetFromSourceNodeIdentifiers:(id)a3 toTargetNodeIdentifiers:(id)a4 graph:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v9, "unionWithIdentifierSet:", v10);
  -[MARelation unionAdjacencySetFromSourceNodeIdentifiers:toTargetNodeIdentifiers:graph:](self->_base, "unionAdjacencySetFromSourceNodeIdentifiers:toTargetNodeIdentifiers:graph:", v10, v9, v8);

}

- (id)adjacencyWithStartNodeIdentifiers:(id)a3 graph:(id)a4
{
  MARelation *base;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  base = self->_base;
  v6 = a3;
  -[MARelation adjacencyWithStartNodeIdentifiers:graph:](base, "adjacencyWithStartNodeIdentifiers:graph:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  +[KGDirectedBinaryAdjacency identityWith:](KGDirectedBinaryAdjacency, "identityWith:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "formUnionWith:", v9);
  return v8;
}

- (id)adjacencyByJoiningWithAdjacency:(id)a3 graph:(id)a4
{
  MARelation *base;
  id v6;
  void *v7;
  void *v8;

  base = self->_base;
  v6 = a3;
  -[MARelation adjacencyByJoiningWithAdjacency:graph:](base, "adjacencyByJoiningWithAdjacency:graph:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "formUnionWith:", v6);
  return v8;
}

- (id)visualString
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(CFSTR("-{"), "mutableCopy");
  -[MARelation visualString](self->_base, "visualString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  objc_msgSend(v3, "appendString:", CFSTR("}?"));
  return v3;
}

- (id)transitiveClosure
{
  void *v2;
  void *v3;

  -[MARelation transitiveClosure](self->_base, "transitiveClosure");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "optionalStep");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  MAOptionalStepRelation *v4;
  uint64_t v5;
  char v6;
  MARelation *base;
  void *v8;

  v4 = (MAOptionalStepRelation *)a3;
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
      -[MAOptionalStepRelation base](v4, "base");
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
  MAOptionalStepRelation *v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "scanLocation");
  if ((objc_msgSend(v3, "scanString:intoString:", CFSTR("-{"), 0) & 1) != 0)
  {
    +[MARelation scanRelationWithScanner:](MARelation, "scanRelationWithScanner:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && (objc_msgSend(v3, "scanString:intoString:", CFSTR("}?"), 0) & 1) != 0)
    {
      v6 = -[MAOptionalStepRelation initWithBase:]([MAOptionalStepRelation alloc], "initWithBase:", v5);
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
