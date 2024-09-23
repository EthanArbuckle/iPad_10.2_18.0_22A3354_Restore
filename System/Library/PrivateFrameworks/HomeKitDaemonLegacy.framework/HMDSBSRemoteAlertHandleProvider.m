@implementation HMDSBSRemoteAlertHandleProvider

- (id)createRemoteAlertHandleWithServiceName:(id)a3 viewControllerClassName:(id)a4 userInfo:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;

  v7 = (objc_class *)MEMORY[0x1E0DAAF78];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithServiceName:viewControllerClassName:", v10, v9);

  v12 = objc_alloc_init(MEMORY[0x1E0DAAF70]);
  objc_msgSend(v12, "setUserInfo:", v8);

  v13 = (void *)objc_msgSend(MEMORY[0x1E0DAAF88], "newHandleWithDefinition:configurationContext:", v11, v12);
  return v13;
}

@end
