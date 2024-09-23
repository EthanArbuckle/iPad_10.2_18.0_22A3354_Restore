@implementation AXSBServerVolumeControl

- (void)_effectiveVolumeChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BE64840]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v8 = v7;

  _CurrentVolume = v8;
  _LastVolumeDisplay = CFAbsoluteTimeGetCurrent();
  v9.receiver = self;
  v9.super_class = (Class)AXSBServerVolumeControl;
  -[AXSBServerVolumeControl _effectiveVolumeChanged:](&v9, sel__effectiveVolumeChanged_, v4);

}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBVolumeControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_presentVolumeHUDWithVolume:(float)a3
{
  void *v5;
  void *v6;
  char v7;
  double v8;
  objc_super v9;

  +[_AXSpringBoardServerInstance springBoardServerInstance](_AXSpringBoardServerInstance, "springBoardServerInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "springBoardActionOccurred:", 1);

  +[_AXSpringBoardServerInstance springBoardServerInstance](_AXSpringBoardServerInstance, "springBoardServerInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldBlockGestureActivation:", 4);

  if ((v7 & 1) == 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)AXSBServerVolumeControl;
    *(float *)&v8 = a3;
    -[AXSBServerVolumeControl _presentVolumeHUDWithVolume:](&v9, sel__presentVolumeHUDWithVolume_, v8);
  }
}

@end
