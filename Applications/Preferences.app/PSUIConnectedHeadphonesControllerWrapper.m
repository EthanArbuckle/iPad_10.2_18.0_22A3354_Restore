@implementation PSUIConnectedHeadphonesControllerWrapper

- (PSUIConnectedHeadphonesControllerWrapper)init
{
  PSUIConnectedHeadphonesControllerWrapper *v2;
  HPSConnectedHeadphonesController *v3;
  HPSConnectedHeadphonesController *implementation;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PSUIConnectedHeadphonesControllerWrapper;
  v2 = -[PSUIConnectedHeadphonesControllerWrapper init](&v6, "init");
  if (v2)
  {
    v3 = (HPSConnectedHeadphonesController *)objc_alloc_init((Class)HPSConnectedHeadphonesController);
    implementation = v2->__implementation;
    v2->__implementation = v3;

  }
  return v2;
}

- (id)connectedHeadphoneInfo
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PSUIConnectedHeadphonesControllerWrapper _implementation](self, "_implementation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "connectedHeadphoneInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "na_map:", &stru_100147290));

  return v4;
}

- (void)setDeviceChangeHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PSUIConnectedHeadphonesControllerWrapper _implementation](self, "_implementation"));
  objc_msgSend(v5, "setDeviceChangeHandler:", v4);

}

- (HPSConnectedHeadphonesController)_implementation
{
  return self->__implementation;
}

- (void)set_implementation:(id)a3
{
  objc_storeStrong((id *)&self->__implementation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__implementation, 0);
}

@end
