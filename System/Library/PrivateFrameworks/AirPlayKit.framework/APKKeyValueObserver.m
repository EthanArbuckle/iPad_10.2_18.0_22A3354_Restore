@implementation APKKeyValueObserver

- (APKKeyValueObserver)initWithObservedObject:(id)a3 keyPath:(id)a4 options:(unint64_t)a5 changeHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  APKKeyValueObserver *v14;
  APKKeyValueObserver *v15;
  void *v16;
  id changeHandler;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)APKKeyValueObserver;
  v14 = -[APKKeyValueObserver init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong(&v14->_observeredObject, a3);
    objc_storeStrong((id *)&v15->_keyPath, a4);
    v15->_options = a5;
    v16 = _Block_copy(v13);
    changeHandler = v15->_changeHandler;
    v15->_changeHandler = v16;

    objc_msgSend(v15->_observeredObject, "addObserver:forKeyPath:options:context:", v15, v12, a5, v15);
  }

  return v15;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void (**v9)(void);
  void (**v10)(void);
  void *v11;
  int v12;
  void *v13;
  id v14;

  v14 = a3;
  v9 = (void (**)(void))a4;
  -[APKKeyValueObserver observeredObject](self, "observeredObject");
  v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v10 != v9)
    goto LABEL_2;
  -[APKKeyValueObserver keyPath](self, "keyPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v14, "isEqualToString:", v11);

  if (a6 == self)
  {
    if (v12)
    {
      objc_msgSend(a6, "changeHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(a6, "changeHandler");
        v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v10[2]();
LABEL_2:

      }
    }
  }

}

- (void)invalidate
{
  void *v3;
  void *v4;
  id observeredObject;
  id changeHandler;

  -[APKKeyValueObserver observeredObject](self, "observeredObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[APKKeyValueObserver keyPath](self, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, v4);

  observeredObject = self->_observeredObject;
  self->_observeredObject = 0;

  changeHandler = self->_changeHandler;
  self->_changeHandler = 0;

}

- (void)dealloc
{
  objc_super v3;

  -[APKKeyValueObserver invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)APKKeyValueObserver;
  -[APKKeyValueObserver dealloc](&v3, sel_dealloc);
}

- (id)observeredObject
{
  return self->_observeredObject;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (unint64_t)options
{
  return self->_options;
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changeHandler, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong(&self->_observeredObject, 0);
}

@end
