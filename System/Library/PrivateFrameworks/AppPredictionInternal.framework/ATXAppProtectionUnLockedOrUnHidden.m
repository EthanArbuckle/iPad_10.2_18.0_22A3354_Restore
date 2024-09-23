@implementation ATXAppProtectionUnLockedOrUnHidden

- (ATXAppProtectionUnLockedOrUnHidden)initWithUnLockedApps:(id)a3 unHiddenApps:(id)a4
{
  id v6;
  id v7;
  ATXAppProtectionUnLockedOrUnHidden *v8;
  uint64_t v9;
  NSSet *unLockedApps;
  uint64_t v11;
  NSSet *unHiddenApps;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXAppProtectionUnLockedOrUnHidden;
  v8 = -[ATXAppProtectionUnLockedOrUnHidden init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    unLockedApps = v8->_unLockedApps;
    v8->_unLockedApps = (NSSet *)v9;

    v11 = objc_msgSend(v7, "copy");
    unHiddenApps = v8->_unHiddenApps;
    v8->_unHiddenApps = (NSSet *)v11;

  }
  return v8;
}

- (NSSet)unLockedApps
{
  return self->_unLockedApps;
}

- (NSSet)unHiddenApps
{
  return self->_unHiddenApps;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unHiddenApps, 0);
  objc_storeStrong((id *)&self->_unLockedApps, 0);
}

@end
