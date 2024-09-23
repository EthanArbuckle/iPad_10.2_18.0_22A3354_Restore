@implementation GKBehavior

- (NSInteger)goalCount
{
  return -[NSMutableArray count](self->_goals, "count");
}

- (id)goals
{
  return self->_goals;
}

- (id)weights
{
  return self->_weights;
}

- (__n128)getTotalForce:(uint64_t)a3 agent:(void *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  float v10;
  float32x4_t v11;
  float32x4_t v13;
  float v14;

  v6 = a4;
  if (objc_msgSend(a1, "goalCount") < 1)
  {
    v13 = 0u;
  }
  else
  {
    v7 = 0;
    objc_msgSend(a1[1], "objectAtIndex:", 0, 0, 0);
    while (1)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[2], "objectAtIndex:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "floatValue");
      v14 = v10;

      if (v8)
      {
        objc_msgSend(v8, "getForce:agent:", v6, a2);
        v13 = vmlaq_n_f32(v13, v11, v14);
      }

      if (objc_msgSend(a1, "goalCount") <= ++v7)
        break;
      objc_msgSend(a1[1], "objectAtIndex:", v7, *(_OWORD *)&v13);
    }
  }

  return (__n128)v13;
}

- (GKBehavior)init
{
  GKBehavior *v2;
  uint64_t v3;
  NSMutableArray *goals;
  uint64_t v5;
  NSMutableArray *weights;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKBehavior;
  v2 = -[GKBehavior init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    goals = v2->_goals;
    v2->_goals = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    weights = v2->_weights;
    v2->_weights = (NSMutableArray *)v5;

  }
  return v2;
}

+ (GKBehavior)behaviorWithGoal:(GKGoal *)goal weight:(float)weight
{
  GKGoal *v5;
  GKBehavior *v6;
  double v7;
  GKBehavior *v8;

  v5 = goal;
  v6 = [GKBehavior alloc];
  *(float *)&v7 = weight;
  v8 = -[GKBehavior initWithGoal:weight:](v6, "initWithGoal:weight:", v5, v7);

  return v8;
}

- (GKBehavior)initWithGoal:(id)a3 weight:(float)a4
{
  id v6;
  GKBehavior *v7;
  double v8;
  GKBehavior *v9;

  v6 = a3;
  v7 = -[GKBehavior init](self, "init");
  v9 = v7;
  if (v7)
  {
    *(float *)&v8 = a4;
    -[GKBehavior setWeight:forGoal:](v7, "setWeight:forGoal:", v6, v8);
  }

  return v9;
}

+ (GKBehavior)behaviorWithGoals:(NSArray *)goals
{
  NSArray *v4;
  void *v5;

  v4 = goals;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithGoals:", v4);

  return (GKBehavior *)v5;
}

- (GKBehavior)initWithGoals:(id)a3
{
  id v4;
  GKBehavior *v5;
  id v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[GKBehavior init](self, "init");
  if (v5)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v9 = v7;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v6);
          LODWORD(v8) = 1.0;
          -[GKBehavior setWeight:forGoal:](v5, "setWeight:forGoal:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++), v8, (_QWORD)v13);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

  }
  return v5;
}

+ (GKBehavior)behaviorWithGoals:(NSArray *)goals andWeights:(NSArray *)weights
{
  NSArray *v6;
  NSArray *v7;
  void *v8;

  v6 = weights;
  v7 = goals;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithGoals:andWeights:", v7, v6);

  return (GKBehavior *)v8;
}

- (GKBehavior)initWithGoals:(id)a3 andWeights:(id)a4
{
  id v6;
  id v7;
  GKBehavior *v8;
  unint64_t v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  double v14;

  v6 = a3;
  v7 = a4;
  v8 = -[GKBehavior init](self, "init");
  if (v8 && objc_msgSend(v6, "count"))
  {
    v9 = 0;
    do
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "floatValue");
      v12 = v11;
      objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v14) = v12;
      -[GKBehavior setWeight:forGoal:](v8, "setWeight:forGoal:", v13, v14);

      ++v9;
    }
    while (objc_msgSend(v6, "count") > v9);
  }

  return v8;
}

+ (GKBehavior)behaviorWithWeightedGoals:(NSDictionary *)weightedGoals
{
  NSDictionary *v4;
  void *v5;

  v4 = weightedGoals;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithWeightedGoals:", v4);

  return (GKBehavior *)v5;
}

- (GKBehavior)initWithWeightedGoals:(id)a3
{
  id v4;
  GKBehavior *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  double v13;

  v4 = a3;
  v5 = -[GKBehavior init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      v8 = 0;
      do
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "floatValue");
        v11 = v10;
        objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v13) = v11;
        -[GKBehavior setWeight:forGoal:](v5, "setWeight:forGoal:", v12, v13);

        ++v8;
      }
      while (objc_msgSend(v6, "count") > v8);
    }

  }
  return v5;
}

- (float)weightForGoal:(GKGoal *)goal
{
  uint64_t v4;
  void *v6;
  float v7;
  float v8;

  v4 = -[NSMutableArray indexOfObject:](self->_goals, "indexOfObject:", goal);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    return 0.0;
  -[NSMutableArray objectAtIndexedSubscript:](self->_weights, "objectAtIndexedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v8 = v7;

  return v8;
}

- (void)removeGoal:(GKGoal *)goal
{
  uint64_t v4;
  uint64_t v5;

  v4 = -[NSMutableArray indexOfObject:](self->_goals, "indexOfObject:", goal);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v4;
    -[NSMutableArray removeObjectAtIndex:](self->_goals, "removeObjectAtIndex:", v4);
    -[NSMutableArray removeObjectAtIndex:](self->_weights, "removeObjectAtIndex:", v5);
  }
}

- (void)removeAllGoals
{
  -[NSMutableArray removeAllObjects](self->_goals, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_weights, "removeAllObjects");
}

- (GKGoal)objectAtIndexedSubscript:(NSUInteger)idx
{
  return (GKGoal *)-[NSMutableArray objectAtIndexedSubscript:](self->_goals, "objectAtIndexedSubscript:", idx);
}

- (void)setObject:(NSNumber *)weight forKeyedSubscript:(GKGoal *)goal
{
  GKGoal *v6;

  v6 = goal;
  -[NSNumber floatValue](weight, "floatValue");
  -[GKBehavior setWeight:forGoal:](self, "setWeight:forGoal:", v6);

}

- (void)setWeight:(float)weight forGoal:(GKGoal *)goal
{
  uint64_t v6;
  double v7;
  NSMutableArray *weights;
  double v9;
  void *v10;
  uint64_t v11;
  GKGoal *v12;

  v12 = goal;
  v6 = -[NSMutableArray indexOfObject:](self->_goals, "indexOfObject:");
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray addObject:](self->_goals, "addObject:", v12);
    weights = self->_weights;
    *(float *)&v9 = weight;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](weights, "addObject:", v10);
  }
  else
  {
    v11 = v6;
    *(float *)&v7 = weight;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray setObject:atIndexedSubscript:](self->_weights, "setObject:atIndexedSubscript:", v10, v11);
  }

}

- (NSNumber)objectForKeyedSubscript:(GKGoal *)goal
{
  uint64_t v4;
  void *v5;

  v4 = -[NSMutableArray indexOfObject:](self->_goals, "indexOfObject:", goal);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_weights, "objectAtIndexedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSNumber *)v5;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSMutableArray countByEnumeratingWithState:objects:count:](self->_goals, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (id)copy
{
  return -[GKBehavior copyWithZone:](self, "copyWithZone:", MEMORY[0x22E2A4F5C](self, a2));
}

- (id)copyWithZone:(_NSZone *)a3
{
  GKBehavior *v4;
  uint64_t v5;
  NSMutableArray *goals;
  uint64_t v7;
  NSMutableArray *weights;

  v4 = objc_alloc_init(GKBehavior);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", self->_goals);
  v5 = objc_claimAutoreleasedReturnValue();
  goals = v4->_goals;
  v4->_goals = (NSMutableArray *)v5;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", self->_weights);
  v7 = objc_claimAutoreleasedReturnValue();
  weights = v4->_weights;
  v4->_weights = (NSMutableArray *)v7;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weights, 0);
  objc_storeStrong((id *)&self->_goals, 0);
}

@end
