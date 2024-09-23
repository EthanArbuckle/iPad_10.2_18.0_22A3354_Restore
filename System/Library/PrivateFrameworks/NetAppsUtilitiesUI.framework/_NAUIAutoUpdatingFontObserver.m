@implementation _NAUIAutoUpdatingFontObserver

- (_NAUIAutoUpdatingFontObserver)initWithTarget:(id)a3
{
  id v4;
  _NAUIAutoUpdatingFontObserver *v5;
  _NAUIAutoUpdatingFontObserver *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id notificationObserver;
  _NAUIAutoUpdatingFontObserver *v12;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;

  v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "canObserveFontsForTarget:", v4))
  {
    v17.receiver = self;
    v17.super_class = (Class)_NAUIAutoUpdatingFontObserver;
    v5 = -[_NAUIAutoUpdatingFontObserver init](&v17, sel_init);
    v6 = v5;
    if (v5)
    {
      objc_storeWeak(&v5->_target, v4);
      objc_initWeak(&location, v6);
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *MEMORY[0x24BDF7670];
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __48___NAUIAutoUpdatingFontObserver_initWithTarget___block_invoke;
      v14[3] = &unk_24D612608;
      objc_copyWeak(&v15, &location);
      objc_msgSend(v7, "addObserverForName:object:queue:usingBlock:", v9, 0, v8, v14);
      v10 = objc_claimAutoreleasedReturnValue();
      notificationObserver = v6->_notificationObserver;
      v6->_notificationObserver = (id)v10;

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
    self = v6;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)canObserveFontsForTarget:(id)a3
{
  id v3;
  void *v4;
  char v5;
  BOOL v6;

  v3 = a3;
  v6 = 1;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (objc_msgSend(v3, "viewForLastBaselineLayout"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v5 = objc_opt_respondsToSelector(),
          v4,
          (v5 & 1) == 0))
    {
      v6 = 0;
    }
  }

  return v6;
}

- (void)updateDyamicFontForCurrentContentSize
{
  id *p_target;
  id WeakRetained;
  char isKindOfClass;
  id v5;
  id v6;
  char v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  p_target = &self->_target;
  WeakRetained = objc_loadWeakRetained(&self->_target);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v5 = objc_loadWeakRetained(p_target);
    objc_msgSend(v5, "naui_dynamicFontTextStyleDescriptor");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    v6 = objc_loadWeakRetained(p_target);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained(p_target);
      objc_msgSend(v8, "naui_reloadDynamicFontWithTextStyleDescriptor:", v13);

    }
    v9 = objc_loadWeakRetained(p_target);
    objc_msgSend(v9, "viewForLastBaselineLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      +[NAUITextStyleDescriptor fontWithTextStyleDescriptor:](NAUITextStyleDescriptor, "fontWithTextStyleDescriptor:", v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setFont:", v11);

    }
    v12 = objc_loadWeakRetained(p_target);
    objc_msgSend(v12, "setNeedsLayout");

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_notificationObserver);

  v4.receiver = self;
  v4.super_class = (Class)_NAUIAutoUpdatingFontObserver;
  -[_NAUIAutoUpdatingFontObserver dealloc](&v4, sel_dealloc);
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong(&self->_notificationObserver, 0);
}

@end
