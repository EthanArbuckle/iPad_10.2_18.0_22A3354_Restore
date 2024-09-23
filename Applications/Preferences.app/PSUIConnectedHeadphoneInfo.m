@implementation PSUIConnectedHeadphoneInfo

- (PSUIConnectedHeadphoneInfo)initWithID:(id)a3 name:(id)a4 image:(id)a5 specifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PSUIConnectedHeadphoneInfo *v14;
  HPSConnectedHeadphoneInfo *v15;
  HPSConnectedHeadphoneInfo *implementation;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PSUIConnectedHeadphoneInfo;
  v14 = -[PSUIConnectedHeadphoneInfo init](&v18, "init");
  if (v14)
  {
    v15 = (HPSConnectedHeadphoneInfo *)objc_msgSend(objc_alloc((Class)HPSConnectedHeadphoneInfo), "initWithID:name:image:specifier:", v10, v11, v12, v13);
    implementation = v14->__implementation;
    v14->__implementation = v15;

  }
  return v14;
}

- (NSString)deviceID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PSUIConnectedHeadphoneInfo _implementation](self, "_implementation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "deviceID"));

  return (NSString *)v3;
}

- (NSString)deviceName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PSUIConnectedHeadphoneInfo _implementation](self, "_implementation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "deviceName"));

  return (NSString *)v3;
}

- (UIImage)deviceImage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PSUIConnectedHeadphoneInfo _implementation](self, "_implementation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "deviceImage"));

  return (UIImage *)v3;
}

- (PSSpecifier)deviceSpecifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PSUIConnectedHeadphoneInfo _implementation](self, "_implementation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "deviceSpecifier"));

  return (PSSpecifier *)v3;
}

- (HPSConnectedHeadphoneInfo)_implementation
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
