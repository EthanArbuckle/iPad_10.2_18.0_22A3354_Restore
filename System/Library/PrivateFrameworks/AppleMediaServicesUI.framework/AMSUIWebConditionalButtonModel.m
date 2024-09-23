@implementation AMSUIWebConditionalButtonModel

- (AMSUIWebConditionalButtonModel)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  AMSUIWebConditionalButtonModel *v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  id v14;
  AMSUIWebButtonModel *v15;
  AMSUIWebButtonModel *button;
  AMSUIWebButtonModel *v17;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  if (!v6)
    goto LABEL_3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_3;
  v19.receiver = self;
  v19.super_class = (Class)AMSUIWebConditionalButtonModel;
  self = -[AMSUIWebConditionalButtonModel init](&v19, sel_init);
  if (!self)
    goto LABEL_15;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hideOnPush"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (objc_opt_respondsToSelector() & 1) != 0 ? objc_msgSend(v9, "BOOLValue") : 0;
  self->_hideOnPush = v10;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hideOnModal"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (objc_opt_respondsToSelector() & 1) != 0 ? objc_msgSend(v11, "BOOLValue") : 0;
  self->_hideOnModal = v12;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("button"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v14 = (objc_opt_isKindOfClass() & 1) != 0 ? v13 : 0;

  v15 = -[AMSUIWebButtonModel initWithJSObject:context:]([AMSUIWebButtonModel alloc], "initWithJSObject:context:", v14, v7);
  button = self->_button;
  self->_button = v15;

  v17 = self->_button;
  if (!v17)
  {
LABEL_3:
    v8 = 0;
  }
  else
  {
LABEL_15:
    self = self;
    v8 = self;
  }

  return v8;
}

- (NSString)description
{
  void *v3;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("button");
  -[AMSUIWebConditionalButtonModel button](self, "button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("hideOnPush");
  if (-[AMSUIWebConditionalButtonModel hideOnPush](self, "hideOnPush"))
    v4 = CFSTR("true");
  else
    v4 = CFSTR("false");
  v10[1] = v4;
  v9[2] = CFSTR("hideOnModal");
  if (-[AMSUIWebConditionalButtonModel hideOnModal](self, "hideOnModal"))
    v5 = CFSTR("true");
  else
    v5 = CFSTR("false");
  v10[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (AMSUIWebButtonModel)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (BOOL)hideOnModal
{
  return self->_hideOnModal;
}

- (void)setHideOnModal:(BOOL)a3
{
  self->_hideOnModal = a3;
}

- (BOOL)hideOnPush
{
  return self->_hideOnPush;
}

- (void)setHideOnPush:(BOOL)a3
{
  self->_hideOnPush = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
}

@end
