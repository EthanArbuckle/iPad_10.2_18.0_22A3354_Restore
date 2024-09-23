@implementation AMSUIWebToolbarModel

- (AMSUIWebToolbarModel)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  AMSUIWebToolbarModel *v8;
  AMSUIWebToolbarModel *v9;
  void *v10;
  id v11;
  AMSUIWebButtonModel *v12;
  AMSUIWebButtonModel *leftButton;
  void *v14;
  id v15;
  AMSUIWebButtonModel *v16;
  AMSUIWebButtonModel *rightButton;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v19.receiver = self;
    v19.super_class = (Class)AMSUIWebToolbarModel;
    v9 = -[AMSUIWebToolbarModel init](&v19, sel_init);
    if (v9)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("leftButton"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;

      if (v11)
      {
        v12 = -[AMSUIWebButtonModel initWithJSObject:context:]([AMSUIWebButtonModel alloc], "initWithJSObject:context:", v11, v7);
        leftButton = v9->_leftButton;
        v9->_leftButton = v12;

      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rightButton"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v14;
      else
        v15 = 0;

      if (v15)
      {
        v16 = -[AMSUIWebButtonModel initWithJSObject:context:]([AMSUIWebButtonModel alloc], "initWithJSObject:context:", v15, v7);
        rightButton = v9->_rightButton;
        v9->_rightButton = v16;

      }
    }
    self = v9;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[AMSUIWebToolbarModel leftButton](self, "leftButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AMSUIWebToolbarModel leftButton](self, "leftButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("leftButton"));

  }
  -[AMSUIWebToolbarModel rightButton](self, "rightButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AMSUIWebToolbarModel rightButton](self, "rightButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("rightButton"));

  }
  objc_msgSend(v3, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (AMSUIWebButtonModel)leftButton
{
  return self->_leftButton;
}

- (void)setLeftButton:(id)a3
{
  objc_storeStrong((id *)&self->_leftButton, a3);
}

- (AMSUIWebButtonModel)rightButton
{
  return self->_rightButton;
}

- (void)setRightButton:(id)a3
{
  objc_storeStrong((id *)&self->_rightButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightButton, 0);
  objc_storeStrong((id *)&self->_leftButton, 0);
}

@end
