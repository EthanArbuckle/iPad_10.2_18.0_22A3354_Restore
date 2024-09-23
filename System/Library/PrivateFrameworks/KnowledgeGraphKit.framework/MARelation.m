@implementation MARelation

- (id)initForSubclassing
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MARelation;
  return -[MARelation init](&v3, sel_init);
}

- (BOOL)isTransitive
{
  return 0;
}

- (void)unionAdjacencySetFromSourceNodeIdentifiers:(id)a3 toTargetNodeIdentifiers:(id)a4 graph:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  KGAbstractMethodException(self, a2);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v12);
}

- (id)adjacencyWithStartNodeIdentifiers:(id)a3 graph:(id)a4
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

- (id)adjacencyByJoiningWithAdjacency:(id)a3 graph:(id)a4
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

- (NSString)visualString
{
  id v2;

  KGAbstractMethodException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (MARelation)transitiveClosure
{
  return (MARelation *)-[MATransitiveClosureRelation initWithBase:]([MATransitiveClosureRelation alloc], "initWithBase:", self);
}

- (MARelation)optionalStep
{
  return (MARelation *)-[MAOptionalStepRelation initWithBase:]([MAOptionalStepRelation alloc], "initWithBase:", self);
}

- (MARelation)excludeSource
{
  return (MARelation *)-[MAExcludeSourceRelation initWithBase:]([MAExcludeSourceRelation alloc], "initWithBase:", self);
}

- (MARelation)inverse
{
  id v2;

  KGAbstractMethodException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)repeatWithCount:(unint64_t)a3
{
  return -[MAMultiStepRelation initWithBase:numberOfSteps:]([MAMultiStepRelation alloc], "initWithBase:numberOfSteps:", self, a3);
}

- (id)repeatWithMinCount:(unint64_t)a3 maxCount:(unint64_t)a4
{
  return -[MAMultiStepRelation initWithBase:minNumberOfSteps:maxNumberOfSteps:]([MAMultiStepRelation alloc], "initWithBase:minNumberOfSteps:maxNumberOfSteps:", self, a3, a4);
}

+ (id)_scanNonChainRelationWithScanner:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v3 = a3;
  +[MANeighborRelation scanRelationWithScanner:](MANeighborRelation, "scanRelationWithScanner:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    +[MANodeFilterRelation scanRelationWithScanner:](MANodeFilterRelation, "scanRelationWithScanner:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v6 = v7;
    }
    else
    {
      +[MAMultiStepRelation scanRelationWithScanner:](MAMultiStepRelation, "scanRelationWithScanner:", v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v6 = v9;
      }
      else
      {
        +[MATransitiveClosureRelation scanRelationWithScanner:](MATransitiveClosureRelation, "scanRelationWithScanner:", v3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          v6 = v11;
        }
        else
        {
          +[MAOptionalStepRelation scanRelationWithScanner:](MAOptionalStepRelation, "scanRelationWithScanner:", v3);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13)
          {
            v6 = v13;
          }
          else
          {
            +[MAExcludeSourceRelation scanRelationWithScanner:](MAExcludeSourceRelation, "scanRelationWithScanner:", v3);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v15;
            if (v15)
            {
              v17 = v15;
            }
            else
            {
              +[MAUnionRelation scanRelationWithScanner:](MAUnionRelation, "scanRelationWithScanner:", v3);
              v17 = (id)objc_claimAutoreleasedReturnValue();
            }
            v6 = v17;

          }
        }

      }
    }

  }
  return v6;
}

+ (id)scanRelationWithScanner:(id)a3
{
  return +[MAChainRelation scanRelationWithScanner:](MAChainRelation, "scanRelationWithScanner:", a3);
}

+ (MARelation)relationWithVisualString:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (objc_class *)MEMORY[0x1E0CB3900];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithString:", v5);

  objc_msgSend(a1, "scanRelationWithScanner:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isAtEnd"))
    v8 = v7;
  else
    v8 = 0;

  return (MARelation *)v8;
}

+ (id)chain:(id)a3
{
  id v3;
  MAChainRelation *v4;

  v3 = a3;
  v4 = -[MAChainRelation initWithSteps:]([MAChainRelation alloc], "initWithSteps:", v3);

  return v4;
}

+ (id)union:(id)a3
{
  id v3;
  MAUnionRelation *v4;

  v3 = a3;
  v4 = -[MAUnionRelation initWithRelations:]([MAUnionRelation alloc], "initWithRelations:", v3);

  return v4;
}

@end
