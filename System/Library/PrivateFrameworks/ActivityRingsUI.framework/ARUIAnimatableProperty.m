@implementation ARUIAnimatableProperty

- (ARUIAnimatableProperty)initWithGetter:(id)a3 setter:(id)a4
{
  id v6;
  id v7;
  ARUIAnimatableProperty *v8;
  uint64_t v9;
  id getter;
  uint64_t v11;
  id setter;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ARUIAnimatableProperty;
  v8 = -[ARUIAnimatableProperty init](&v14, sel_init);
  if (v8)
  {
    v9 = MEMORY[0x2199A6364](v6);
    getter = v8->_getter;
    v8->_getter = (id)v9;

    v11 = MEMORY[0x2199A6364](v7);
    setter = v8->_setter;
    v8->_setter = (id)v11;

  }
  return v8;
}

- (void)setValueImmediate:(id)a3
{
  id v4;

  v4 = a3;
  -[ARUIAnimatableProperty removeAllPropertyAnimations](self, "removeAllPropertyAnimations");
  (*((void (**)(void))self->_setter + 2))();

}

- (void)addPropertyAnimation:(id)a3
{
  id v4;
  NSMutableArray *animations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  animations = self->_animations;
  v8 = v4;
  if (!animations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_animations;
    self->_animations = v6;

    v4 = v8;
    animations = self->_animations;
  }
  -[NSMutableArray addObject:](animations, "addObject:", v4);

}

- (void)removeAllPropertyAnimations
{
  id startValue;
  id endValue;
  id currentValue;

  -[NSMutableArray removeAllObjects](self->_animations, "removeAllObjects");
  startValue = self->_startValue;
  self->_startValue = 0;

  endValue = self->_endValue;
  self->_endValue = 0;

  currentValue = self->_currentValue;
  self->_currentValue = 0;

}

- (void)update:(double)a3
{
  ARUIAnimatableProperty *v4;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  int v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  int v17;
  int v18;
  void *currentValue;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  ARUIAnimatableProperty *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v4 = self;
  v38 = *MEMORY[0x24BDAC8D0];
  if (!-[NSMutableArray count](self->_animations, "count"))
    return;
  -[NSMutableArray firstObject](v4->_animations, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_startValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v7 = v4->_animations;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v8)
  {
    v9 = v8;
    v26 = v4;
    v27 = v5;
    v10 = 0;
    v11 = *(_QWORD *)v33;
    v12 = 1;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        v14 = v6;
        if (*(_QWORD *)v33 != v11)
          objc_enumerationMutation(v7);
        v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v16 = objc_msgSend(v15, "isFinishedAnimating", v26, v27);
        objc_msgSend(v15, "update:", a3);
        objc_msgSend(v15, "valueByAddingCurrentValueToValue:", v6);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = objc_msgSend(v15, "isFinishedAnimating");
        v18 = v17;
        if ((v16 & 1) == 0 && v17)
        {
          if (!v10)
            v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          objc_msgSend(v10, "addObject:", v15);
        }
        v12 &= v18;
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v9);

    if (!v12)
    {
      v20 = v6;
      v4 = v26;
      v5 = v27;
      currentValue = v26->_currentValue;
      v26->_currentValue = v20;
      goto LABEL_19;
    }
    v4 = v26;
    v5 = v27;
  }
  else
  {

    v10 = 0;
  }
  -[NSMutableArray lastObject](v4->_animations, "lastObject");
  currentValue = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(currentValue, "_endValue");
  v20 = (id)objc_claimAutoreleasedReturnValue();

  -[ARUIAnimatableProperty removeAllPropertyAnimations](v4, "removeAllPropertyAnimations");
LABEL_19:

  (*((void (**)(void))v4->_setter + 2))();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v21 = v10;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v29 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * j), "callAndReleaseCompletionHandler");
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v23);
  }

}

- (BOOL)isFinishedAnimating
{
  return -[NSMutableArray count](self->_animations, "count") == 0;
}

- (id)startValue
{
  void *v3;
  void *v4;

  -[NSMutableArray lastObject](self->_animations, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_startValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[ARUIAnimatableProperty currentValue](self, "currentValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)endValue
{
  void *v3;
  void *v4;

  -[NSMutableArray lastObject](self->_animations, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_endValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[ARUIAnimatableProperty currentValue](self, "currentValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)currentValue
{
  id currentValue;
  void *v4;
  id v5;

  currentValue = self->_currentValue;
  if (!currentValue)
  {
    (*((void (**)(void))self->_getter + 2))();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = self->_currentValue;
    self->_currentValue = v4;

    currentValue = self->_currentValue;
  }
  return currentValue;
}

- (void)setStartValue:(id)a3
{
  objc_storeStrong(&self->_startValue, a3);
}

- (void)setEndValue:(id)a3
{
  objc_storeStrong(&self->_endValue, a3);
}

- (void)setCurrentValue:(id)a3
{
  objc_storeStrong(&self->_currentValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_endValue, 0);
  objc_storeStrong(&self->_startValue, 0);
  objc_storeStrong(&self->_currentValue, 0);
  objc_storeStrong((id *)&self->_animations, 0);
  objc_storeStrong(&self->_setter, 0);
  objc_storeStrong(&self->_getter, 0);
}

@end
