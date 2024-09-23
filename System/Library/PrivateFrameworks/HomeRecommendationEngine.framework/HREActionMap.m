@implementation HREActionMap

- (id)_initWithCondition:(id)a3 childMaps:(id)a4
{
  id v7;
  id v8;
  HREActionMap *v9;
  HREActionMap *v10;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  NSMutableArray *childMaps;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HREActionMap;
  v9 = -[HREActionMap init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_condition, a3);
    v11 = (void *)objc_msgSend(v8, "mutableCopy");
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    }
    childMaps = v10->_childMaps;
    v10->_childMaps = v13;

  }
  return v10;
}

+ (id)emptyMap
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __24__HREActionMap_emptyMap__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (emptyMap_onceToken != -1)
    dispatch_once(&emptyMap_onceToken, block);
  return (id)emptyMap_emptyMap;
}

void __24__HREActionMap_emptyMap__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_initWithCondition:childMaps:", 0, 0);
  v2 = (void *)emptyMap_emptyMap;
  emptyMap_emptyMap = v1;

}

+ (id)actionMapWithChildMaps:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithCondition:childMaps:", 0, v4);

  return v5;
}

- (BOOL)conditionSatisfiedByObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[HREActionMap condition](self, "condition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HREActionMap condition](self, "condition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "evaluateWithObject:", v4);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (id)flattenedMapEvaluatedForObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HREActionMap *v7;
  HREActionMap *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  if (-[HREActionMap conditionSatisfiedByObject:](self, "conditionSatisfiedByObject:", v4)
    || -[HREActionMap visitedByFlatten](self, "visitedByFlatten"))
  {
    -[HREActionMap setVisitedByFlatten:](self, "setVisitedByFlatten:", 1);
    -[HREActionMap childMaps](self, "childMaps");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __47__HREActionMap_flattenedMapEvaluatedForObject___block_invoke;
    v11[3] = &unk_24F216F20;
    v12 = v4;
    objc_msgSend(v5, "na_map:", v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[HREActionMap mergeWithActionMaps:](self, "mergeWithActionMaps:", v6);
    v7 = (HREActionMap *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 != self)
    {
      -[HREActionMap childMaps](v7, "childMaps");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeAllObjects");

    }
    -[HREActionMap setVisitedByFlatten:](self, "setVisitedByFlatten:", 0);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __47__HREActionMap_flattenedMapEvaluatedForObject___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "flattenedMapEvaluatedForObject:", *(_QWORD *)(a1 + 32));
}

- (id)mergeWithActionMaps:(id)a3
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "emptyMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HREActionMap isEqual:](self, "isEqual:", v6);

  if (v7)
  {
    objc_msgSend(v5, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mergeWithActionMaps:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HREActionMap.m"), 85, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HREActionMap mergeWithActionMaps:]", objc_opt_class());
    v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithCondition:childMaps:", self->_condition, self->_childMaps);
}

- (NSMutableArray)childMaps
{
  return self->_childMaps;
}

- (void)setChildMaps:(id)a3
{
  objc_storeStrong((id *)&self->_childMaps, a3);
}

- (NSPredicate)condition
{
  return self->_condition;
}

- (void)setCondition:(id)a3
{
  objc_storeStrong((id *)&self->_condition, a3);
}

- (BOOL)visitedByFlatten
{
  return self->_visitedByFlatten;
}

- (void)setVisitedByFlatten:(BOOL)a3
{
  self->_visitedByFlatten = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_condition, 0);
  objc_storeStrong((id *)&self->_childMaps, 0);
}

@end
