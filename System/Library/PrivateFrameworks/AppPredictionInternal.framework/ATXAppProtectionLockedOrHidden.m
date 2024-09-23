@implementation ATXAppProtectionLockedOrHidden

- (ATXAppProtectionLockedOrHidden)initWithLockedApps:(id)a3 hiddenApps:(id)a4
{
  id v6;
  id v7;
  ATXAppProtectionLockedOrHidden *v8;
  uint64_t v9;
  NSSet *lockedApps;
  uint64_t v11;
  NSSet *hiddenApps;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXAppProtectionLockedOrHidden;
  v8 = -[ATXAppProtectionLockedOrHidden init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    lockedApps = v8->_lockedApps;
    v8->_lockedApps = (NSSet *)v9;

    v11 = objc_msgSend(v7, "copy");
    hiddenApps = v8->_hiddenApps;
    v8->_hiddenApps = (NSSet *)v11;

  }
  return v8;
}

- (NSSet)lockedApps
{
  return self->_lockedApps;
}

- (NSSet)hiddenApps
{
  return self->_hiddenApps;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hiddenApps, 0);
  objc_storeStrong((id *)&self->_lockedApps, 0);
}

@end
