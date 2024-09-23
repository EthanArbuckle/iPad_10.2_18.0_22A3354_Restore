@implementation IPAppState

- (IPAppState)initWithAppStateSource:(id)a3 applicationIdentity:(id)a4 isInstalling:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  IPAppState *v10;
  IPAppState *v11;
  objc_super v13;

  v5 = a5;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IPAppState;
  v10 = -[IPInstallableState initWithStateSource:isInstalling:](&v13, sel_initWithStateSource_isInstalling_, a3, v5);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_launchServicesIdentity, a4);

  return v11;
}

- (LSApplicationIdentity)launchServicesIdentity
{
  return (LSApplicationIdentity *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchServicesIdentity, 0);
}

@end
