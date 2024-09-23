@implementation GKCompositeBehavior

- (__n128)getTotalForce:(uint64_t)a3 agent:(void *)a4
{
  id v6;
  float32x4_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  float v11;
  float32x4_t v12;
  float32x4_t v14;
  float v15;
  objc_super v16;

  v6 = a4;
  v16.receiver = a1;
  v16.super_class = (Class)GKCompositeBehavior;
  objc_msgSendSuper2(&v16, sel_getTotalForce_agent_, v6, a2);
  v14 = v7;
  if (objc_msgSend(a1, "behaviorCount") >= 1)
  {
    v8 = 0;
    do
    {
      objc_msgSend(a1[3], "objectAtIndex:", v8, *(_OWORD *)&v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "objectAtIndex:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "floatValue");
      v15 = v11;

      if (v9)
      {
        objc_msgSend(v9, "getTotalForce:agent:", v6, a2);
        v14 = vmlaq_n_f32(v14, v12, v15);
      }

      ++v8;
    }
    while (objc_msgSend(a1, "behaviorCount") > v8);
  }

  return (__n128)v14;
}

- (NSInteger)behaviorCount
{
  return -[NSMutableArray count](self->_subBehaviors, "count");
}

- (GKCompositeBehavior)init
{
  return -[GKCompositeBehavior initWithBehaviors:](self, "initWithBehaviors:", MEMORY[0x24BDBD1A8]);
}

+ (GKCompositeBehavior)behaviorWithBehaviors:(NSArray *)behaviors
{
  NSArray *v4;
  void *v5;

  v4 = behaviors;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBehaviors:", v4);

  return (GKCompositeBehavior *)v5;
}

- (GKCompositeBehavior)initWithBehaviors:(id)a3
{
  id v4;
  GKCompositeBehavior *v5;
  uint64_t v6;
  NSMutableArray *subBehaviors;
  uint64_t v8;
  NSMutableArray *subBehaviorWeights;
  double v10;
  unint64_t v11;
  NSMutableArray *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GKCompositeBehavior;
  v5 = -[GKBehavior init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    subBehaviors = v5->_subBehaviors;
    v5->_subBehaviors = (NSMutableArray *)v6;

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSMutableArray count](v5->_subBehaviors, "count"));
    v8 = objc_claimAutoreleasedReturnValue();
    subBehaviorWeights = v5->_subBehaviorWeights;
    v5->_subBehaviorWeights = (NSMutableArray *)v8;

    if (-[NSMutableArray count](v5->_subBehaviors, "count"))
    {
      v11 = 0;
      do
      {
        v12 = v5->_subBehaviorWeights;
        LODWORD(v10) = 1.0;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v12, "addObject:", v13);

        ++v11;
      }
      while (-[NSMutableArray count](v5->_subBehaviors, "count") > v11);
    }
  }

  return v5;
}

+ (GKCompositeBehavior)behaviorWithBehaviors:(NSArray *)behaviors andWeights:(NSArray *)weights
{
  NSArray *v6;
  NSArray *v7;
  void *v8;

  v6 = weights;
  v7 = behaviors;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBehaviors:andWeights:", v7, v6);

  return (GKCompositeBehavior *)v8;
}

- (GKCompositeBehavior)initWithBehaviors:(id)a3 andWeights:(id)a4
{
  id v6;
  GKCompositeBehavior *v7;
  unint64_t v8;
  void *v9;

  v6 = a4;
  v7 = -[GKCompositeBehavior initWithBehaviors:](self, "initWithBehaviors:", a3);
  if (v7 && objc_msgSend(v6, "count"))
  {
    v8 = 0;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray setObject:atIndexedSubscript:](v7->_subBehaviorWeights, "setObject:atIndexedSubscript:", v9, v8);

      ++v8;
    }
    while (objc_msgSend(v6, "count") > v8);
  }

  return v7;
}

- (void)setWeight:(float)weight forBehavior:(GKBehavior *)behavior
{
  uint64_t v6;
  double v7;
  NSMutableArray *subBehaviorWeights;
  double v9;
  void *v10;
  uint64_t v11;
  GKBehavior *v12;

  v12 = behavior;
  v6 = -[NSMutableArray indexOfObject:](self->_subBehaviors, "indexOfObject:");
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray addObject:](self->_subBehaviors, "addObject:", v12);
    subBehaviorWeights = self->_subBehaviorWeights;
    *(float *)&v9 = weight;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](subBehaviorWeights, "addObject:", v10);
  }
  else
  {
    v11 = v6;
    *(float *)&v7 = weight;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray setObject:atIndexedSubscript:](self->_subBehaviorWeights, "setObject:atIndexedSubscript:", v10, v11);
  }

}

- (float)weightForBehavior:(GKBehavior *)behavior
{
  uint64_t v4;
  void *v6;
  float v7;
  float v8;

  v4 = -[NSMutableArray indexOfObject:](self->_subBehaviors, "indexOfObject:", behavior);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    return 0.0;
  -[NSMutableArray objectAtIndexedSubscript:](self->_subBehaviorWeights, "objectAtIndexedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v8 = v7;

  return v8;
}

- (void)removeBehavior:(GKBehavior *)behavior
{
  uint64_t v4;
  uint64_t v5;

  v4 = -[NSMutableArray indexOfObject:](self->_subBehaviors, "indexOfObject:", behavior);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v4;
    -[NSMutableArray removeObjectAtIndex:](self->_subBehaviors, "removeObjectAtIndex:", v4);
    -[NSMutableArray removeObjectAtIndex:](self->_subBehaviorWeights, "removeObjectAtIndex:", v5);
  }
}

- (void)removeAllBehaviors
{
  -[NSMutableArray removeAllObjects](self->_subBehaviors, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_subBehaviorWeights, "removeAllObjects");
}

- (GKBehavior)objectAtIndexedSubscript:(NSUInteger)idx
{
  return (GKBehavior *)-[NSMutableArray objectAtIndexedSubscript:](self->_subBehaviors, "objectAtIndexedSubscript:", idx);
}

- (void)setObject:(NSNumber *)weight forKeyedSubscript:(GKBehavior *)behavior
{
  GKBehavior *v6;

  v6 = behavior;
  -[NSNumber floatValue](weight, "floatValue");
  -[GKCompositeBehavior setWeight:forBehavior:](self, "setWeight:forBehavior:", v6);

}

- (NSNumber)objectForKeyedSubscript:(GKBehavior *)behavior
{
  uint64_t v4;

  v4 = -[NSMutableArray indexOfObject:](self->_subBehaviors, "indexOfObject:", behavior);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -1);
  else
    -[NSMutableArray objectAtIndexedSubscript:](self->_subBehaviorWeights, "objectAtIndexedSubscript:", v4);
  return (NSNumber *)(id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subBehaviorWeights, 0);
  objc_storeStrong((id *)&self->_subBehaviors, 0);
}

@end
