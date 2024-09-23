@implementation EKUIManagedNavigationController

- (BOOL)wantsManagement
{
  void *v3;
  char isKindOfClass;
  void *v6;
  int v7;
  void *v8;
  char v9;

  EKWeakLinkClass();
  -[EKUIManagedNavigationController topViewController](self, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    return 1;
  -[EKUIManagedNavigationController topViewController](self, "topViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "conformsToProtocol:", &unk_1EEE7BBE8);

  if (!v7)
    return 0;
  -[EKUIManagedNavigationController topViewController](self, "topViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "wantsManagement");

  return v9;
}

- (BOOL)canManagePresentationStyle
{
  return 1;
}

- (BOOL)canBeDirectlyManaged
{
  char v3;
  void *v4;
  void *v5;
  char v6;

  if (-[EKUIManagedNavigationController forceCanBeDirectlyManagedToNo](self, "forceCanBeDirectlyManagedToNo"))
    return 0;
  -[EKUIManagedNavigationController topViewController](self, "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EEE7BBE8))
  {
    -[EKUIManagedNavigationController topViewController](self, "topViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) == 0)
      return 1;
    -[EKUIManagedNavigationController topViewController](self, "topViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "canBeDirectlyManaged");
  }
  else
  {
    v3 = 1;
  }

  return v3;
}

- (BOOL)prefersPushForSizeClass:(int64_t)a3
{
  return 0;
}

- (BOOL)forceCanBeDirectlyManagedToNo
{
  return self->_forceCanBeDirectlyManagedToNo;
}

- (void)setForceCanBeDirectlyManagedToNo:(BOOL)a3
{
  self->_forceCanBeDirectlyManagedToNo = a3;
}

@end
