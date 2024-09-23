@implementation FASTChildSetupControllerProvider

- (id)newChildSetupControllerOnChildDeviceWithDSID:(id)a3 childAge:(id)a4 childName:(id)a5 introductionModelCompletionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)getSTChildSetupControllerClass()), "initOnChildDeviceWithDSID:childAge:childName:", v12, v11, v10);

  objc_msgSend(v13, "setCompletionHandlerWithIntroductionModel:", v9);
  return v13;
}

- (id)newChildSetupControllerWithDSID:(id)a3 updateExistingSettings:(BOOL)a4 childAge:(id)a5 childName:(id)a6 completionHandler:(id)a7
{
  _BOOL8 v9;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;

  v9 = a4;
  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a3;
  v15 = (void *)objc_msgSend(objc_alloc((Class)getSTChildSetupControllerClass()), "initWithDSID:updateExistingSettings:childAge:childName:", v14, v9, v13, v12);

  objc_msgSend(v15, "setCompletionHandler:", v11);
  return v15;
}

- (id)newChildSetupControllerWithDSID:(id)a3 updateExistingSettings:(BOOL)a4 childAge:(id)a5 childName:(id)a6 introductionModelCompletionHandler:(id)a7
{
  _BOOL8 v9;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;

  v9 = a4;
  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a3;
  v15 = (void *)objc_msgSend(objc_alloc((Class)getSTChildSetupControllerClass()), "initWithDSID:updateExistingSettings:childAge:childName:", v14, v9, v13, v12);

  objc_msgSend(v15, "setCompletionHandlerWithIntroductionModel:", v11);
  return v15;
}

@end
