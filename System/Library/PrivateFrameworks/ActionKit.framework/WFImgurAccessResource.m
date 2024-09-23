@implementation WFImgurAccessResource

- (Class)accountClass
{
  return (Class)objc_opt_class();
}

- (void)setAction:(id)a3
{
  WFImgurUploadAction **p_action;
  id WeakRetained;
  id v6;
  id obj;

  p_action = &self->_action;
  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_action);
  objc_msgSend(WeakRetained, "removeEventObserver:", self);

  v6 = objc_storeWeak((id *)p_action, obj);
  objc_msgSend(obj, "addEventObserver:", self);

}

- (void)setUsesAccount:(BOOL)a3
{
  self->_usesAccount = a3;
  -[WFResource refreshAvailabilityWithForcedNotification](self, "refreshAvailabilityWithForcedNotification");
}

- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4
{
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("WFImgurAnonymous")))
  {
    objc_msgSend(v7, "parameterValueForKey:ofClass:", CFSTR("WFImgurAnonymous"), objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFImgurAccessResource setUsesAccount:](self, "setUsesAccount:", objc_msgSend(v6, "BOOLValue") ^ 1);

  }
}

- (unint64_t)status
{
  objc_super v4;

  if (!-[WFImgurAccessResource usesAccount](self, "usesAccount"))
    return 4;
  v4.receiver = self;
  v4.super_class = (Class)WFImgurAccessResource;
  return -[WFAccountAccessResource status](&v4, sel_status);
}

- (WFImgurUploadAction)action
{
  return (WFImgurUploadAction *)objc_loadWeakRetained((id *)&self->_action);
}

- (BOOL)usesAccount
{
  return self->_usesAccount;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_action);
}

@end
