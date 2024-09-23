@implementation AXUIAlert

+ (id)alertWithType:(unint64_t)a3 text:(id)a4 subtitleText:(id)a5 iconImage:(id)a6 styleProvider:(id)a7 userInfo:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  AXStyleProviderUIAlert *v18;
  void *v20;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  if (a3 == 5)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    _AXAssert();

    v18 = 0;
  }
  else
  {
    v18 = -[AXStyleProviderUIAlert initWithType:text:subtitleText:iconImage:styleProvider:userInfo:]([AXStyleProviderUIAlert alloc], "initWithType:text:subtitleText:iconImage:styleProvider:userInfo:", a3, v13, v14, v15, v16, v17);
  }

  return v18;
}

- (AXUIAlertContext)context
{
  return (AXUIAlertContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (void)setContext:(id)a3
{
  objc_storeWeak((id *)&self->_context, a3);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_destroyWeak((id *)&self->_context);
}

@end
