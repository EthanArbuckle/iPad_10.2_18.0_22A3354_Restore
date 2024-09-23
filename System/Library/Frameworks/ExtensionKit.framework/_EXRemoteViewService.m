@implementation _EXRemoteViewService

- (_EXRemoteViewService)initWithExtensionProcess:(id)a3 contextToken:(id)a4
{
  id v7;
  id v8;
  id *v9;
  _EXRemoteViewService *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_EXRemoteViewService;
  v9 = -[_UIRemoteViewService _init](&v12, sel__init);
  v10 = (_EXRemoteViewService *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 2, a3);
    objc_storeStrong((id *)&v10->_contextToken, a4);
  }

  return v10;
}

- (BOOL)overridesHostAppearance
{
  return 0;
}

- (id)identifier
{
  void *v2;
  void *v3;
  void *v4;

  -[_EXRemoteViewService extensionProcess](self, "extensionProcess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extensionIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)xpcServiceNameRoot
{
  void *v2;
  void *v3;
  void *v4;

  -[_EXRemoteViewService extensionProcess](self, "extensionProcess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extensionIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)multipleInstances
{
  return 0;
}

- (id)multipleInstancesUUID
{
  return 0;
}

- (int)processIdentifier
{
  void *v2;
  int v3;

  -[_EXRemoteViewService extensionProcess](self, "extensionProcess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "pid");

  return v3;
}

- (id)viewControllerClassName
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)beginUsing:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)endUsing:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (id)contextToken
{
  return self->_contextToken;
}

- (_EXExtensionProcessHandle)extensionProcess
{
  return (_EXExtensionProcessHandle *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionProcess, 0);
  objc_storeStrong((id *)&self->_contextToken, 0);
}

@end
