@implementation BKUIDevice

- (BKUIDevice)init
{
  BKUIDevice *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKUIDevice;
  v2 = -[BKUIDevice init](&v5, sel_init);
  if (v2)
  {
    v2->_mainScreenClass = MGGetSInt32Answer();
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_isPad = objc_msgSend(v3, "userInterfaceIdiom") == 1;

  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_9);
  return (id)sharedInstance_environment;
}

void __28__BKUIDevice_sharedInstance__block_invoke()
{
  BKUIDevice *v0;
  void *v1;

  v0 = objc_alloc_init(BKUIDevice);
  v1 = (void *)sharedInstance_environment;
  sharedInstance_environment = (uint64_t)v0;

}

- (BOOL)isiPad21
{
  return self->_mainScreenClass == 21;
}

- (BOOL)isIPad2
{
  return self->_mainScreenClass == 4;
}

- (BOOL)isPad6
{
  return self->_mainScreenClass == 11;
}

- (BOOL)isPad7
{
  return self->_mainScreenClass == 14;
}

- (BOOL)isMini
{
  return self->_mainScreenClass == 7;
}

- (BOOL)isD10
{
  return self->_mainScreenClass == 8;
}

- (BOOL)isN69
{
  return self->_mainScreenClass == 5;
}

- (BOOL)isN84
{
  return self->_mainScreenClass == 19;
}

- (BOOL)isD33
{
  void *v2;
  double v3;
  void *v4;
  double v5;
  BOOL v6;

  if (self->_mainScreenClass != 18)
    return 0;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  if (v3 == 414.0)
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5 == 896.0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isD32Sized
{
  int mainScreenClass;

  mainScreenClass = self->_mainScreenClass;
  if (mainScreenClass == 18 || mainScreenClass == 15)
    return !-[BKUIDevice isD33](self, "isD33");
  else
    return 0;
}

- (BOOL)isZoomEnabled
{
  void *v2;
  void *v3;
  BOOL v4;

  if (!DisplayAndBrightnessSettingsLibraryCore_frameworkLibrary)
    DisplayAndBrightnessSettingsLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!DisplayAndBrightnessSettingsLibraryCore_frameworkLibrary)
    return 0;
  objc_msgSend(MEMORY[0x1E0D8D648], "defaultController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentDisplayZoomMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "displayZoomOption") == 1;

  return v4;
}

- (int)mainScreenClass
{
  return self->_mainScreenClass;
}

- (void)setMainScreenClass:(int)a3
{
  self->_mainScreenClass = a3;
}

- (BOOL)isPad
{
  return self->_isPad;
}

- (void)setIsPad:(BOOL)a3
{
  self->_isPad = a3;
}

@end
