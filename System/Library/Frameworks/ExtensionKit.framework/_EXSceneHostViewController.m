@implementation _EXSceneHostViewController

- (_EXSceneHostViewController)initWithExtensionProcess:(id)a3 sessionUUID:(id)a4 role:(id)a5
{
  id v9;
  id v10;
  id v11;
  _EXSceneHostViewController *v12;
  _EXSceneHostViewController *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_EXSceneHostViewController;
  v12 = -[_EXSceneHostViewController init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sessionUUID, a4);
    objc_storeStrong((id *)&v13->_extensionProcess, a3);
    objc_storeStrong((id *)&v13->_role, a5);
  }

  return v13;
}

- (void)loadView
{
  _EXSceneHostView *v3;
  void *v4;
  void *v5;
  _EXSceneHostView *v6;

  v3 = [_EXSceneHostView alloc];
  -[_EXSceneHostViewController extensionProcess](self, "extensionProcess");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EXSceneHostViewController sessionUUID](self, "sessionUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_EXSceneHostView initWithExtensionProcess:sessionUUID:role:](v3, "initWithExtensionProcess:sessionUUID:role:", v4, v5, self->_role);

  -[_EXSceneHostView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[_EXSceneHostView creatScene](v6, "creatScene");
  -[_EXSceneHostViewController setView:](self, "setView:", v6);

}

- (_EXExtensionProcessHandle)extensionProcess
{
  return (_EXExtensionProcessHandle *)objc_getProperty(self, a2, 968, 1);
}

- (void)setExtensionProcess:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 968);
}

- (NSUUID)sessionUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 976, 1);
}

- (void)setSessionUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 976);
}

- (NSString)role
{
  return (NSString *)objc_getProperty(self, a2, 984, 1);
}

- (void)setRole:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 984);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_extensionProcess, 0);
}

@end
