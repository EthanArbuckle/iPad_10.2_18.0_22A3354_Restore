@implementation LUILegibilityObserver

+ (id)sharedInstance
{
  if (qword_100088D08 != -1)
    dispatch_once(&qword_100088D08, &stru_100068ED8);
  return (id)qword_100088D00;
}

- (LUILegibilityObserver)init
{
  LUILegibilityObserver *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  LUILegibilityObserver *v6;
  uint64_t v7;
  id mWallpaperObserver;
  _QWORD v10[4];
  LUILegibilityObserver *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)LUILegibilityObserver;
  v2 = -[LUILegibilityObserver init](&v12, "init");
  if (v2)
  {
    _SBFWallpaperRegisterForExternalChangeNotification();
    -[LUILegibilityObserver _refreshLegibilitySettings](v2, "_refreshLegibilitySettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v4 = SBFWallpaperDidChangeNotification;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100008330;
    v10[3] = &unk_100068F00;
    v6 = v2;
    v11 = v6;
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v4, 0, v5, v10));
    mWallpaperObserver = v6->mWallpaperObserver;
    v6->mWallpaperObserver = (id)v7;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  id mWallpaperObserver;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self->mWallpaperObserver);

  mWallpaperObserver = self->mWallpaperObserver;
  self->mWallpaperObserver = 0;

  v5.receiver = self;
  v5.super_class = (Class)LUILegibilityObserver;
  -[LUILegibilityObserver dealloc](&v5, "dealloc");
}

- (_UILegibilitySettings)lockScreenWallpaperLegibilitySettings
{
  _UILegibilitySettings *mLockScreenWallpaperLegibilitySettings;

  mLockScreenWallpaperLegibilitySettings = self->mLockScreenWallpaperLegibilitySettings;
  if (!mLockScreenWallpaperLegibilitySettings)
  {
    -[LUILegibilityObserver _refreshLegibilitySettings](self, "_refreshLegibilitySettings");
    mLockScreenWallpaperLegibilitySettings = self->mLockScreenWallpaperLegibilitySettings;
  }
  return mLockScreenWallpaperLegibilitySettings;
}

- (_UILegibilitySettings)homeScreenWallpaperLegibilitySettings
{
  _UILegibilitySettings *mHomeScreenWallpaperLegibilitySettings;

  mHomeScreenWallpaperLegibilitySettings = self->mHomeScreenWallpaperLegibilitySettings;
  if (!mHomeScreenWallpaperLegibilitySettings)
  {
    -[LUILegibilityObserver _refreshLegibilitySettings](self, "_refreshLegibilitySettings");
    mHomeScreenWallpaperLegibilitySettings = self->mHomeScreenWallpaperLegibilitySettings;
  }
  return mHomeScreenWallpaperLegibilitySettings;
}

- (void)_refreshLegibilitySettings
{
  uint64_t LegibilitySettings;
  _UILegibilitySettings *v4;
  _UILegibilitySettings *mLockScreenWallpaperLegibilitySettings;
  uint64_t v6;
  uint64_t v7;
  _UILegibilitySettings *v8;
  _UILegibilitySettings *mHomeScreenWallpaperLegibilitySettings;

  LegibilitySettings = SBSUIWallpaperGetLegibilitySettings(0, a2);
  v4 = (_UILegibilitySettings *)objc_claimAutoreleasedReturnValue(LegibilitySettings);
  mLockScreenWallpaperLegibilitySettings = self->mLockScreenWallpaperLegibilitySettings;
  self->mLockScreenWallpaperLegibilitySettings = v4;

  v7 = SBSUIWallpaperGetLegibilitySettings(1, v6);
  v8 = (_UILegibilitySettings *)objc_claimAutoreleasedReturnValue(v7);
  mHomeScreenWallpaperLegibilitySettings = self->mHomeScreenWallpaperLegibilitySettings;
  self->mHomeScreenWallpaperLegibilitySettings = v8;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mHomeScreenWallpaperLegibilitySettings, 0);
  objc_storeStrong((id *)&self->mLockScreenWallpaperLegibilitySettings, 0);
  objc_storeStrong(&self->mWallpaperObserver, 0);
}

@end
