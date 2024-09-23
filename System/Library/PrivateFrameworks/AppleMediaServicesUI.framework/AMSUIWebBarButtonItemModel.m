@implementation AMSUIWebBarButtonItemModel

- (AMSUIWebBarButtonItemModel)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  AMSUIWebBarButtonItemModel *v8;
  id v9;
  id v10;
  AMSUIWebAppViewModel *v11;
  id appViewModel;
  id v13;
  AMSUIWebButtonModel *v14;
  uint64_t v15;
  NSArray *conditionalButtonModels;
  _QWORD v18[4];
  id v19;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)AMSUIWebBarButtonItemModel;
  v8 = -[AMSUIWebBarButtonItemModel init](&v20, sel_init);
  if (v8)
  {
    v9 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    if (v10)
    {
      if (+[AMSUIWebAppViewModel validateJSObject:](AMSUIWebAppViewModel, "validateJSObject:", v10))
      {
        v11 = -[AMSUIWebAppViewModel initWithJSObject:context:]([AMSUIWebAppViewModel alloc], "initWithJSObject:context:", v10, v7);
        appViewModel = v8->_appViewModel;
        v8->_appViewModel = v11;
      }
      else
      {
        v14 = -[AMSUIWebButtonModel initWithJSObject:context:]([AMSUIWebButtonModel alloc], "initWithJSObject:context:", v10, v7);
        appViewModel = v8->_buttonModel;
        v8->_buttonModel = v14;
      }
    }
    else
    {
      v13 = v9;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        appViewModel = v13;
      else
        appViewModel = 0;

      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __55__AMSUIWebBarButtonItemModel_initWithJSObject_context___block_invoke;
      v18[3] = &unk_24CB50BB8;
      v19 = v7;
      objc_msgSend(appViewModel, "ams_mapWithTransformIgnoresNil:", v18);
      v15 = objc_claimAutoreleasedReturnValue();
      conditionalButtonModels = v8->_conditionalButtonModels;
      v8->_conditionalButtonModels = (NSArray *)v15;

    }
  }

  return v8;
}

AMSUIWebConditionalButtonModel *__55__AMSUIWebBarButtonItemModel_initWithJSObject_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  AMSUIWebConditionalButtonModel *v4;

  v3 = a2;
  v4 = -[AMSUIWebConditionalButtonModel initWithJSObject:context:]([AMSUIWebConditionalButtonModel alloc], "initWithJSObject:context:", v3, *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)isEmpty
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  -[AMSUIWebBarButtonItemModel appViewModel](self, "appViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[AMSUIWebBarButtonItemModel buttonModel](self, "buttonModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v4 = 0;
    }
    else
    {
      -[AMSUIWebBarButtonItemModel conditionalButtonModels](self, "conditionalButtonModels");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "count") == 0;

    }
  }

  return v4;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[AMSUIWebBarButtonItemModel appViewModel](self, "appViewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AMSUIWebBarButtonItemModel appViewModel](self, "appViewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("appViewModel"));

  }
  -[AMSUIWebBarButtonItemModel buttonModel](self, "buttonModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AMSUIWebBarButtonItemModel buttonModel](self, "buttonModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("buttonModel"));

  }
  -[AMSUIWebBarButtonItemModel conditionalButtonModels](self, "conditionalButtonModels");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[AMSUIWebBarButtonItemModel conditionalButtonModels](self, "conditionalButtonModels");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("conditionalButtonModels"));

  }
  objc_msgSend(v3, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (AMSUIWebAppViewModel)appViewModel
{
  return self->_appViewModel;
}

- (void)setAppViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_appViewModel, a3);
}

- (AMSUIWebButtonModel)buttonModel
{
  return self->_buttonModel;
}

- (void)setButtonModel:(id)a3
{
  objc_storeStrong((id *)&self->_buttonModel, a3);
}

- (NSArray)conditionalButtonModels
{
  return self->_conditionalButtonModels;
}

- (void)setConditionalButtonModels:(id)a3
{
  objc_storeStrong((id *)&self->_conditionalButtonModels, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditionalButtonModels, 0);
  objc_storeStrong((id *)&self->_buttonModel, 0);
  objc_storeStrong((id *)&self->_appViewModel, 0);
}

@end
