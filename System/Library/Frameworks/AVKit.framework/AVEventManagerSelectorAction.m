@implementation AVEventManagerSelectorAction

- (BOOL)isEqual:(id)a3
{
  AVEventManagerSelectorAction *v4;
  AVEventManagerSelectorAction *v5;
  id WeakRetained;
  id v7;
  BOOL v8;
  objc_super v10;

  v4 = (AVEventManagerSelectorAction *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v10.receiver = self;
      v10.super_class = (Class)AVEventManagerSelectorAction;
      if (-[AVEventManagerAction isEqual:](&v10, sel_isEqual_, v5))
      {
        WeakRetained = objc_loadWeakRetained(&self->_target);
        v7 = objc_loadWeakRetained(&v5->_target);
        v8 = WeakRetained == v7 && sel_isEqual(self->_selector, v5->_selector);

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
}

- (AVEventManagerSelectorAction)initWithTarget:(id)a3 selector:(SEL)a4 event:(id)a5
{
  id v8;
  AVEventManagerSelectorAction *v9;
  AVEventManagerSelectorAction *v10;
  void *v11;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AVEventManagerSelectorAction;
  v9 = -[AVEventManagerAction initWithEvent:](&v13, sel_initWithEvent_, a5);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak(&v9->_target, v8);
    v10->_selector = a4;
    objc_msgSend(v8, "methodSignatureForSelector:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_parameterCount = objc_msgSend(v11, "numberOfArguments") - 2;

  }
  return v10;
}

- (void)sendAction:(id)a3
{
  id WeakRetained;
  SEL selector;
  void (*v6)(id, SEL, id);
  unint64_t parameterCount;
  BOOL v8;
  id v9;

  v9 = a3;
  WeakRetained = objc_loadWeakRetained(&self->_target);
  selector = self->_selector;
  v6 = (void (*)(id, SEL, id))objc_msgSend(WeakRetained, "methodForSelector:", selector);
  parameterCount = self->_parameterCount;
  if (parameterCount == 1)
  {
    if (v9 && WeakRetained)
      v6(WeakRetained, selector, v9);
  }
  else
  {
    if (parameterCount)
      v8 = 1;
    else
      v8 = WeakRetained == 0;
    if (!v8)
      ((void (*)(id, SEL))v6)(WeakRetained, selector);
  }

}

- (BOOL)hasMatchingTarget:(id)a3 withSelector:(SEL)a4 forEvent:(id)a5
{
  id *p_target;
  id v8;
  id WeakRetained;
  BOOL v10;

  p_target = &self->_target;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained(p_target);

  v10 = WeakRetained == v8 && sel_isEqual(self->_selector, a4);
  return v10;
}

- (unint64_t)hash
{
  void *v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  objc_super v9;

  NSStringFromSelector(self->_selector);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained(&self->_target);
  v5 = objc_msgSend(WeakRetained, "hash");
  v6 = objc_msgSend(v3, "hash");
  v9.receiver = self;
  v9.super_class = (Class)AVEventManagerSelectorAction;
  v7 = v6 & v5 & -[AVEventManagerSelectorAction hash](&v9, sel_hash);

  return v7;
}

@end
