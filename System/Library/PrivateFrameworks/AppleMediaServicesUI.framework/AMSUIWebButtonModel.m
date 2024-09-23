@implementation AMSUIWebButtonModel

- (AMSUIWebButtonModel)initWithJSObject:(id)a3 context:(id)a4
{
  id v7;
  id v8;
  AMSUIWebButtonModel *v9;
  AMSUIWebButtonModel *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  NSString *v15;
  NSString *accessibilityLabel;
  void *v17;
  id v18;
  uint64_t v19;
  AMSUIWebActionRunnable *action;
  void *v21;
  id v22;
  AMSUIWebActivityIndicatorModel *v23;
  AMSUIWebActivityIndicatorModel *activityIndicator;
  void *v25;
  char v26;
  void *v27;
  char v28;
  void *v29;
  NSString *v30;
  NSString *identifier;
  void *v32;
  NSString *v33;
  NSString *keyEquivalent;
  void *v35;
  void *v36;
  objc_super v38;

  v7 = a3;
  v8 = a4;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v38.receiver = self;
    v38.super_class = (Class)AMSUIWebButtonModel;
    v10 = -[AMSUIWebButtonModel init](&v38, sel_init);
    if (v10)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("title"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v11;
      else
        v12 = 0;

      if (v12)
        v13 = v12;
      else
        v13 = &stru_24CB5A078;
      objc_storeStrong((id *)&v10->_title, v13);

      objc_storeStrong((id *)&v10->_underlyingJSObject, a3);
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("accessibilityLabel"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v14;
      else
        v15 = 0;

      accessibilityLabel = v10->_accessibilityLabel;
      v10->_accessibilityLabel = v15;

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("action"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = v17;
      else
        v18 = 0;

      +[AMSUIWebActionMapper actionFromJSObject:context:](AMSUIWebActionMapper, "actionFromJSObject:context:", v18, v8);
      v19 = objc_claimAutoreleasedReturnValue();
      action = v10->_action;
      v10->_action = (AMSUIWebActionRunnable *)v19;

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("activityIndicator"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v22 = v21;
      else
        v22 = 0;

      if (v22)
      {
        v23 = -[AMSUIWebActivityIndicatorModel initWithJSObject:context:]([AMSUIWebActivityIndicatorModel alloc], "initWithJSObject:context:", v22, v8);
        activityIndicator = v10->_activityIndicator;
        v10->_activityIndicator = v23;

      }
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("bold"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v26 = objc_msgSend(v25, "BOOLValue");
      else
        v26 = 0;
      v10->_bold = v26;
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("enabled"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v28 = objc_msgSend(v27, "BOOLValue");
      else
        v28 = 1;
      v10->_enabled = v28;
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("identifier"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v30 = v29;
      else
        v30 = 0;

      identifier = v10->_identifier;
      v10->_identifier = v30;

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("keyEquivalent"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v33 = v32;
      else
        v33 = 0;

      keyEquivalent = v10->_keyEquivalent;
      v10->_keyEquivalent = v33;

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("style"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("style"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v10->_style = objc_msgSend(v36, "integerValue");

      }
      else
      {
        v10->_style = 0;
      }

    }
    self = v10;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int64_t)_barButtonItemStyle
{
  if (-[AMSUIWebButtonModel bold](self, "bold"))
    return 2;
  else
    return 0;
}

- (id)_makeActivityIndicatorView
{
  void *v3;
  void *v4;
  int v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
  -[AMSUIWebButtonModel activityIndicator](self, "activityIndicator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "animate");

  if (v5)
    objc_msgSend(v3, "startAnimating");
  else
    objc_msgSend(v3, "stopAnimating");
  return v3;
}

- (id)_makeProxCardButtonWithActionBlock:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE7B3D0], "buttonWithProximityType:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BEBD388];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __58__AMSUIWebButtonModel__makeProxCardButtonWithActionBlock___block_invoke;
  v9[3] = &unk_24CB50BE0;
  v10 = v3;
  v6 = v3;
  objc_msgSend(v5, "actionWithHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAction:forControlEvents:", v7, 64);

  return v4;
}

uint64_t __58__AMSUIWebButtonModel__makeProxCardButtonWithActionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)createDialogAction
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x24BE08128];
  -[AMSUIWebButtonModel title](self, "title");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = &stru_24CB5A078;
  objc_msgSend(v3, "actionWithTitle:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSUIWebButtonModel identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[AMSUIWebButtonModel identifier](self, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIdentifier:", v9);

  }
  v10 = -[AMSUIWebButtonModel style](self, "style") - 1;
  if (v10 > 3)
    v11 = 0;
  else
    v11 = qword_211254820[v10];
  objc_msgSend(v7, "setStyle:", v11);
  -[AMSUIWebButtonModel underlyingJSObject](self, "underlyingJSObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");
  objc_msgSend(v7, "setUserInfo:", v13);

  return v7;
}

- (NSString)description
{
  void *v2;
  void *v3;

  -[AMSUIWebButtonModel underlyingJSObject](self, "underlyingJSObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)_imageForButtonWithNavStyle:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v8;
  void *v9;

  if (-[AMSUIWebButtonModel style](self, "style") == 3)
  {
    if (a3 == 7)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/AppleMediaServicesUI.framework"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "ams_imageForResource:", CFSTR("navigation-close-button"));
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v8 = (void *)v6;

      return v8;
    }
    return 0;
  }
  if (-[AMSUIWebButtonModel style](self, "style") == 4)
    return 0;
  -[AMSUIWebButtonModel systemImageName](self, "systemImageName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x24BEBD640];
    -[AMSUIWebButtonModel systemImageName](self, "systemImageName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "systemImageNamed:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  return v8;
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (void)setAccessibilityLabel:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilityLabel, a3);
}

- (AMSUIWebActionRunnable)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->_action, a3);
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setActionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (AMSUIWebActivityIndicatorModel)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (BOOL)bold
{
  return self->_bold;
}

- (void)setBold:(BOOL)a3
{
  self->_bold = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)keyEquivalent
{
  return self->_keyEquivalent;
}

- (void)setKeyEquivalent:(id)a3
{
  objc_storeStrong((id *)&self->_keyEquivalent, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (void)setSystemImageName:(id)a3
{
  objc_storeStrong((id *)&self->_systemImageName, a3);
}

- (NSDictionary)underlyingJSObject
{
  return self->_underlyingJSObject;
}

- (void)setUnderlyingJSObject:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingJSObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingJSObject, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_keyEquivalent, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong(&self->_actionBlock, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
}

@end
