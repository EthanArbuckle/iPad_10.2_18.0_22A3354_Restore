@implementation AMSUIWebNavigationBarModel

- (AMSUIWebNavigationBarModel)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  AMSUIWebNavigationBarModel *v8;
  AMSUIWebNavigationBarModel *v9;
  AMSUIWebBarButtonItemModel *v10;
  void *v11;
  uint64_t v12;
  AMSUIWebBarButtonItemModel *accessoryBarButtonItemModel;
  void *v14;
  NSString *v15;
  NSString *backButtonTitle;
  uint64_t v17;
  NSString *backgroundColor;
  void *v19;
  void *v20;
  void *v21;
  AMSUIWebBarButtonItemModel *v22;
  void *v23;
  uint64_t v24;
  AMSUIWebBarButtonItemModel *leftBarButtonItemModel;
  void *v26;
  id v27;
  uint64_t v28;
  NSArray *otherBarButtonItemModels;
  id v30;
  void *v31;
  id v32;
  AMSUIWebBarButtonItemModel *v33;
  uint64_t v34;
  NSArray *v35;
  AMSUIWebBarButtonItemModel *v36;
  void *v37;
  uint64_t v38;
  AMSUIWebBarButtonItemModel *rightBarButtonItemModel;
  void *v40;
  void *v41;
  NSString *v42;
  NSString *title;
  _QWORD v45[4];
  id v46;
  objc_super v47;

  v6 = a3;
  v7 = a4;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v47.receiver = self;
    v47.super_class = (Class)AMSUIWebNavigationBarModel;
    v9 = -[AMSUIWebNavigationBarModel init](&v47, sel_init);
    if (v9)
    {
      v10 = [AMSUIWebBarButtonItemModel alloc];
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("accessoryButton"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[AMSUIWebBarButtonItemModel initWithJSObject:context:](v10, "initWithJSObject:context:", v11, v7);
      accessoryBarButtonItemModel = v9->_accessoryBarButtonItemModel;
      v9->_accessoryBarButtonItemModel = (AMSUIWebBarButtonItemModel *)v12;

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("backButtonTitle"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v14;
      else
        v15 = 0;

      backButtonTitle = v9->_backButtonTitle;
      v9->_backButtonTitle = v15;

      +[AMSUIWebModel backgroundColorFromPageModel:](AMSUIWebModel, "backgroundColorFromPageModel:", v6);
      v17 = objc_claimAutoreleasedReturnValue();
      backgroundColor = v9->_backgroundColor;
      v9->_backgroundColor = (NSString *)v17;

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("backgroundStyle"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("backgroundStyle"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v9->_backgroundStyle = objc_msgSend(v20, "longLongValue");

      }
      else
      {
        v9->_backgroundStyle = 0;
      }

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hideBackButton"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v9->_hidesBackButton = objc_msgSend(v21, "BOOLValue");
      v22 = [AMSUIWebBarButtonItemModel alloc];
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("leftButton"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[AMSUIWebBarButtonItemModel initWithJSObject:context:](v22, "initWithJSObject:context:", v23, v7);
      leftBarButtonItemModel = v9->_leftBarButtonItemModel;
      v9->_leftBarButtonItemModel = (AMSUIWebBarButtonItemModel *)v24;

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("otherButtons"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v27 = v26;
      else
        v27 = 0;

      if (v27)
      {
        v45[0] = MEMORY[0x24BDAC760];
        v45[1] = 3221225472;
        v45[2] = __55__AMSUIWebNavigationBarModel_initWithJSObject_context___block_invoke;
        v45[3] = &unk_24CB51928;
        v46 = v7;
        objc_msgSend(v27, "ams_mapWithTransformIgnoresNil:", v45);
        v28 = objc_claimAutoreleasedReturnValue();
        otherBarButtonItemModels = v9->_otherBarButtonItemModels;
        v9->_otherBarButtonItemModels = (NSArray *)v28;

        v30 = v46;
      }
      else
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("otherButton"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v30 = v31;
        else
          v30 = 0;

        v32 = objc_alloc(MEMORY[0x24BDBCE30]);
        v33 = -[AMSUIWebBarButtonItemModel initWithJSObject:context:]([AMSUIWebBarButtonItemModel alloc], "initWithJSObject:context:", v30, v7);
        v34 = objc_msgSend(v32, "initWithObjects:", v33, 0);
        v35 = v9->_otherBarButtonItemModels;
        v9->_otherBarButtonItemModels = (NSArray *)v34;

      }
      v36 = [AMSUIWebBarButtonItemModel alloc];
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rightButton"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = -[AMSUIWebBarButtonItemModel initWithJSObject:context:](v36, "initWithJSObject:context:", v37, v7);
      rightBarButtonItemModel = v9->_rightBarButtonItemModel;
      v9->_rightBarButtonItemModel = (AMSUIWebBarButtonItemModel *)v38;

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("style"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v9->_style = objc_msgSend(v40, "integerValue");
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("title"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v42 = v41;
      else
        v42 = 0;

      title = v9->_title;
      v9->_title = v42;

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

AMSUIWebBarButtonItemModel *__55__AMSUIWebNavigationBarModel_initWithJSObject_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  AMSUIWebBarButtonItemModel *v4;

  v3 = a2;
  v4 = -[AMSUIWebBarButtonItemModel initWithJSObject:context:]([AMSUIWebBarButtonItemModel alloc], "initWithJSObject:context:", v3, *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)includesLeftItems
{
  void *v2;
  char v3;

  -[AMSUIWebNavigationBarModel leftBarButtonItemModel](self, "leftBarButtonItemModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEmpty") ^ 1;

  return v3;
}

- (BOOL)includesRightItems
{
  void *v2;
  char v3;

  -[AMSUIWebNavigationBarModel rightBarButtonItemModel](self, "rightBarButtonItemModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEmpty") ^ 1;

  return v3;
}

- (NSString)description
{
  void *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[5];
  _QWORD v27[6];

  v27[5] = *MEMORY[0x24BDAC8D0];
  v26[0] = CFSTR("backgroundStyle");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[AMSUIWebNavigationBarModel backgroundStyle](self, "backgroundStyle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v3;
  v26[1] = CFSTR("hidesBackButton");
  if (-[AMSUIWebNavigationBarModel hidesBackButton](self, "hidesBackButton"))
    v4 = CFSTR("true");
  else
    v4 = CFSTR("false");
  v27[1] = v4;
  v26[2] = CFSTR("includesLeftItems");
  if (-[AMSUIWebNavigationBarModel includesLeftItems](self, "includesLeftItems"))
    v5 = CFSTR("true");
  else
    v5 = CFSTR("false");
  v27[2] = v5;
  v26[3] = CFSTR("includesRightItems");
  if (-[AMSUIWebNavigationBarModel includesRightItems](self, "includesRightItems"))
    v6 = CFSTR("true");
  else
    v6 = CFSTR("false");
  v27[3] = v6;
  v26[4] = CFSTR("style");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[AMSUIWebNavigationBarModel style](self, "style"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  -[AMSUIWebNavigationBarModel accessoryBarButtonItemModel](self, "accessoryBarButtonItemModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[AMSUIWebNavigationBarModel accessoryBarButtonItemModel](self, "accessoryBarButtonItemModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("accessoryButton"));

  }
  -[AMSUIWebNavigationBarModel backButtonTitle](self, "backButtonTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[AMSUIWebNavigationBarModel backButtonTitle](self, "backButtonTitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v13, CFSTR("backButtonTitle"));

  }
  -[AMSUIWebNavigationBarModel backgroundColor](self, "backgroundColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[AMSUIWebNavigationBarModel backgroundColor](self, "backgroundColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v15, CFSTR("backgroundColor"));

  }
  -[AMSUIWebNavigationBarModel leftBarButtonItemModel](self, "leftBarButtonItemModel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[AMSUIWebNavigationBarModel leftBarButtonItemModel](self, "leftBarButtonItemModel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v17, CFSTR("leftButton"));

  }
  -[AMSUIWebNavigationBarModel otherBarButtonItemModels](self, "otherBarButtonItemModels");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[AMSUIWebNavigationBarModel otherBarButtonItemModels](self, "otherBarButtonItemModels");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v19, CFSTR("otherButtons"));

  }
  -[AMSUIWebNavigationBarModel rightBarButtonItemModel](self, "rightBarButtonItemModel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[AMSUIWebNavigationBarModel rightBarButtonItemModel](self, "rightBarButtonItemModel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v21, CFSTR("rightButton"));

  }
  -[AMSUIWebNavigationBarModel title](self, "title");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[AMSUIWebNavigationBarModel title](self, "title");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v23, CFSTR("title"));

  }
  objc_msgSend(v9, "description");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v24;
}

- (AMSUIWebBarButtonItemModel)accessoryBarButtonItemModel
{
  return self->_accessoryBarButtonItemModel;
}

- (void)setAccessoryBarButtonItemModel:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryBarButtonItemModel, a3);
}

- (NSString)backButtonTitle
{
  return self->_backButtonTitle;
}

- (void)setBackButtonTitle:(id)a3
{
  objc_storeStrong((id *)&self->_backButtonTitle, a3);
}

- (NSString)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void)setBackgroundStyle:(int64_t)a3
{
  self->_backgroundStyle = a3;
}

- (BOOL)hidesBackButton
{
  return self->_hidesBackButton;
}

- (void)setHidesBackButton:(BOOL)a3
{
  self->_hidesBackButton = a3;
}

- (AMSUIWebBarButtonItemModel)leftBarButtonItemModel
{
  return self->_leftBarButtonItemModel;
}

- (void)setLeftBarButtonItemModel:(id)a3
{
  objc_storeStrong((id *)&self->_leftBarButtonItemModel, a3);
}

- (NSArray)otherBarButtonItemModels
{
  return self->_otherBarButtonItemModels;
}

- (void)setOtherBarButtonItemModels:(id)a3
{
  objc_storeStrong((id *)&self->_otherBarButtonItemModels, a3);
}

- (AMSUIWebBarButtonItemModel)rightBarButtonItemModel
{
  return self->_rightBarButtonItemModel;
}

- (void)setRightBarButtonItemModel:(id)a3
{
  objc_storeStrong((id *)&self->_rightBarButtonItemModel, a3);
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_rightBarButtonItemModel, 0);
  objc_storeStrong((id *)&self->_otherBarButtonItemModels, 0);
  objc_storeStrong((id *)&self->_leftBarButtonItemModel, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_backButtonTitle, 0);
  objc_storeStrong((id *)&self->_accessoryBarButtonItemModel, 0);
}

@end
