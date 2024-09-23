@implementation HKDisplayType(AddData)

- (id)wd_addDataViewControllerWithHealthStore:()AddData healthToolBox:initialStartDate:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v9, "profile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unitController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "profile");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "dateCache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wd_addDataViewControllerWithHealthStore:unitController:initialStartDate:dateCache:", v10, v12, v8, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)wd_addDataViewControllerWithHealthStore:()AddData unitController:initialStartDate:dateCache:
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "wd_addDataViewControllerClass")), "initWithDisplayType:healthStore:unitController:initialStartDate:dateCache:", a1, v13, v12, v11, v10);

  return v14;
}

@end
