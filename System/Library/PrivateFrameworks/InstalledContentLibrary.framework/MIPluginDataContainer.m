@implementation MIPluginDataContainer

+ (id)pluginDataContainerWithIdentifier:(id)a3 forPersona:(id)a4 createIfNeeded:(BOOL)a5 created:(BOOL *)a6 error:(id *)a7
{
  _BOOL8 v9;
  id v11;
  id v12;
  void *v13;

  v9 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend((id)objc_opt_class(), "containerWithIdentifier:forPersona:ofContentClass:createIfNeeded:created:error:", v12, v11, 4, v9, a6, a7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSString)parentBundleID
{
  NSString *parentBundleID;
  void *v4;
  id v5;
  id v6;
  NSString *v7;
  NSString *v8;
  void *v10;
  id v11;

  parentBundleID = self->_parentBundleID;
  if (parentBundleID)
    return parentBundleID;
  v11 = 0;
  -[MIContainer infoValueForKey:error:](self, "infoValueForKey:error:", CFSTR("com.apple.MobileInstallation.ParentBundleID"), &v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v11;
  objc_opt_class();
  v6 = v4;
  v7 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = (NSString *)v6;

  if (v7)
  {
    v8 = self->_parentBundleID;
    self->_parentBundleID = v7;

    parentBundleID = self->_parentBundleID;
    return parentBundleID;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    -[MIContainer identifier](self, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

  }
  return (NSString *)0;
}

- (void)setParentBundleID:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSString *v7;
  NSString *parentBundleID;
  void *v9;
  id v10;

  v4 = a3;
  v10 = 0;
  v5 = -[MIContainer setInfoValue:forKey:error:](self, "setInfoValue:forKey:error:", v4, CFSTR("com.apple.MobileInstallation.ParentBundleID"), &v10);
  v6 = v10;
  if (v5)
  {
    v7 = (NSString *)v4;
    parentBundleID = self->_parentBundleID;
    self->_parentBundleID = v7;
  }
  else
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      -[MIContainer identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
    parentBundleID = self->_parentBundleID;
    self->_parentBundleID = 0;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentBundleID, 0);
}

@end
