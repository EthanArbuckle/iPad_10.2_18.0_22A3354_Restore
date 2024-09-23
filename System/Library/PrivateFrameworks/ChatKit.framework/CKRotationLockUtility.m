@implementation CKRotationLockUtility

- (CKRotationLockUtility)initWithWindow:(id)a3
{
  id v4;
  CKRotationLockUtility *v5;
  CKRotationLockUtility *v6;
  id v7;

  v4 = a3;
  v5 = -[CKRotationLockUtility init](self, "init");
  v6 = v5;
  if (v5)
  {
    v7 = objc_storeWeak((id *)&v5->_lockedWindow, v4);
    objc_msgSend(v4, "beginDisablingInterfaceAutorotation");

  }
  return v6;
}

- (void)releaseRotationLock
{
  UIWindow **p_lockedWindow;
  id WeakRetained;
  id v4;

  p_lockedWindow = &self->_lockedWindow;
  WeakRetained = objc_loadWeakRetained((id *)&self->_lockedWindow);

  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)p_lockedWindow);
    objc_msgSend(v4, "endDisablingInterfaceAutorotation");

    objc_storeWeak((id *)p_lockedWindow, 0);
  }
}

- (void)dealloc
{
  objc_super v3;

  -[CKRotationLockUtility releaseRotationLock](self, "releaseRotationLock");
  v3.receiver = self;
  v3.super_class = (Class)CKRotationLockUtility;
  -[CKRotationLockUtility dealloc](&v3, sel_dealloc);
}

- (UIWindow)lockedWindow
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_lockedWindow);
}

- (void)setLockedWindow:(id)a3
{
  objc_storeWeak((id *)&self->_lockedWindow, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_lockedWindow);
}

@end
