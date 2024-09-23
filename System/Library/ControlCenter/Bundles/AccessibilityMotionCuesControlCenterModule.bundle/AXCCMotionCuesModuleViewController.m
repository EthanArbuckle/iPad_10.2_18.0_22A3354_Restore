@implementation AXCCMotionCuesModuleViewController

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)AXCCMotionCuesModuleViewController;
  -[AXCCMotionCuesModuleViewController dealloc](&v4, sel_dealloc);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AXCCMotionCuesModuleViewController;
  -[CCUIMenuModuleViewController viewDidLoad](&v10, sel_viewDidLoad);
  if (AXDeviceIsPad())
  {
    v3 = (void *)MEMORY[0x24BDF6AC8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageNamed:inBundle:", CFSTR("MotionCuesIcon"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithPointSize:", 30.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageByApplyingSymbolConfiguration:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUIMenuModuleViewController setGlyphImage:](self, "setGlyphImage:", v7);

  }
  else
  {
    -[AXCCMotionCuesModuleViewController _loadIcons](self, "_loadIcons");
    -[AXCCMotionCuesModuleViewController _updateGlyphImage](self, "_updateGlyphImage");
    -[CCUIMenuModuleViewController setIndentation:](self, "setIndentation:", 2);
    -[AXCCMotionCuesModuleViewController localizedStringForKey:](self, "localizedStringForKey:", CFSTR("MotionCuesTitle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUIMenuModuleViewController setTitle:](self, "setTitle:", v4);
  }

  objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIButtonModuleViewController setSelectedGlyphColor:](self, "setSelectedGlyphColor:", v8);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_232BFD4D4, (CFStringRef)*MEMORY[0x24BED28B0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_232BFD4D4, (CFStringRef)*MEMORY[0x24BED2690], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_232BFD4D4, (CFStringRef)*MEMORY[0x24BED2698], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)buttonTapped:(id)a3 forEvent:(id)a4
{
  int v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (AXDeviceIsPad())
  {
    v5 = _AXSMotionCuesActive();
    AXLogMotionCues();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = v5;
      _os_log_impl(&dword_232BFC000, v6, OS_LOG_TYPE_DEFAULT, "CC button tapped: current active=%{BOOL}d, changing to opposite.", (uint8_t *)v7, 8u);
    }

    -[CCUIButtonModuleViewController setSelected:](self, "setSelected:", v5 == 0);
    _AXSSetMotionCuesMode();
  }
}

- (BOOL)shouldExpandModuleOnTouch:(id)a3
{
  return AXDeviceIsPad() ^ 1;
}

- (BOOL)shouldBeginTransitionToExpandedContentModule
{
  return AXDeviceIsPad() ^ 1;
}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;
  objc_super v6;

  v3 = a3;
  if ((AXDeviceIsPad() & 1) == 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)AXCCMotionCuesModuleViewController;
    -[CCUIMenuModuleViewController willTransitionToExpandedContentMode:](&v6, sel_willTransitionToExpandedContentMode_, v3);
    if (v3)
    {
      -[AXCCMotionCuesModuleViewController _updateMenuItems](self, "_updateMenuItems");
      v5 = 0;
    }
    else
    {
      v5 = _AXSMotionCuesActive() != 0;
    }
    -[CCUIButtonModuleViewController setSelected:](self, "setSelected:", v5);
  }
}

- (void)_loadIcons
{
  void *v3;
  void *v4;
  UIImage *v5;
  UIImage *motionCuesIcon;
  void *v7;
  void *v8;
  UIImage *v9;
  UIImage *motionCuesAndCarIcon;
  void *v11;
  UIImage *v12;
  UIImage *motionCuesSlashIcon;
  id v14;

  v3 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageNamed:inBundle:", CFSTR("MotionCuesIcon"), v4);
  v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
  motionCuesIcon = self->_motionCuesIcon;
  self->_motionCuesIcon = v5;

  v7 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageNamed:inBundle:", CFSTR("MotionCuesAndCarIcon"), v8);
  v9 = (UIImage *)objc_claimAutoreleasedReturnValue();
  motionCuesAndCarIcon = self->_motionCuesAndCarIcon;
  self->_motionCuesAndCarIcon = v9;

  v11 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "imageNamed:inBundle:", CFSTR("MotionCuesSlashIcon"), v14);
  v12 = (UIImage *)objc_claimAutoreleasedReturnValue();
  motionCuesSlashIcon = self->_motionCuesSlashIcon;
  self->_motionCuesSlashIcon = v12;

}

- (void)_updateGlyphImage
{
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v3 = _AXSMotionCuesMode();
  if (v3)
  {
    if (v3 == 2)
    {
      v4 = 1264;
    }
    else
    {
      if (v3 != 1)
        return;
      v4 = 1248;
    }
  }
  else
  {
    v4 = 1256;
  }
  v5 = *(Class *)((char *)&self->super.super.super.super.super.isa + v4);
  objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithPointSize:", 30.0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageByApplyingSymbolConfiguration:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIMenuModuleViewController setGlyphImage:](self, "setGlyphImage:", v6);

}

- (id)trailingImageForMenuItem:(id)a3
{
  id v4;
  void *v5;
  char v6;
  int *v7;
  void *v8;
  int v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("AlwaysOn"));

  if ((v6 & 1) != 0)
  {
    v7 = &OBJC_IVAR___AXCCMotionCuesModuleViewController__motionCuesIcon;
  }
  else
  {
    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("OnInTheCar"));

    v7 = &OBJC_IVAR___AXCCMotionCuesModuleViewController__motionCuesSlashIcon;
    if (v9)
      v7 = &OBJC_IVAR___AXCCMotionCuesModuleViewController__motionCuesAndCarIcon;
  }
  v10 = *(id *)((char *)&self->super.super.super.super.super.isa + *v7);

  return v10;
}

- (id)localizedStringForKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v4, &stru_2503F9978, CFSTR("MotionCues"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_settingsDidChange
{
  int v3;
  NSObject *v4;
  _DWORD v5[2];
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = _AXSMotionCuesActive();
  AXLogMotionCues();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109632;
    v5[1] = v3;
    v6 = 1024;
    v7 = _AXSMotionCuesEnabled();
    v8 = 1024;
    v9 = _AXSMotionCuesMode();
    _os_log_impl(&dword_232BFC000, v4, OS_LOG_TYPE_DEFAULT, "CC setting did change: active=%{BOOL}d, enabled=%{BOOL}d, mode=%d", (uint8_t *)v5, 0x14u);
  }

  if (AXDeviceIsPad())
  {
    -[CCUIButtonModuleViewController setSelected:](self, "setSelected:", v3 != 0);
  }
  else
  {
    -[CCUIButtonModuleViewController setSelected:](self, "setSelected:", (v3 != 0) & ~-[CCUIButtonModuleViewController isExpanded](self, "isExpanded"));
    -[AXCCMotionCuesModuleViewController _updateGlyphImage](self, "_updateGlyphImage");
    if (-[CCUIButtonModuleViewController isExpanded](self, "isExpanded"))
      -[AXCCMotionCuesModuleViewController _updateMenuItems](self, "_updateMenuItems");
  }
}

- (void)_updateMenuItems
{
  int v3;
  id v4;
  uint64_t i;
  int v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  int v13;
  id location;

  if ((AXDeviceIsPad() & 1) == 0)
  {
    if (_AXSMotionCuesEnabled())
      v3 = _AXSMotionCuesMode();
    else
      v3 = 2;
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    for (i = 0; i != 48; i += 16)
    {
      v6 = *(_DWORD *)((char *)&off_2503F9860 + i + 8);
      objc_initWeak(&location, self);
      v7 = *(uint64_t *)((char *)&off_2503F9860 + i);
      -[AXCCMotionCuesModuleViewController localizedStringForKey:](self, "localizedStringForKey:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_alloc(MEMORY[0x24BE19B60]);
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = sub_232BFDC28;
      v11[3] = &unk_2503F9898;
      v13 = v6;
      objc_copyWeak(&v12, &location);
      v10 = (void *)objc_msgSend(v9, "initWithTitle:identifier:handler:", v8, v7, v11);
      objc_msgSend(v10, "setSelected:", v6 == v3);
      objc_msgSend(v4, "addObject:", v10);

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
    -[CCUIMenuModuleViewController setMenuItems:](self, "setMenuItems:", v4);

  }
}

- (CCUIToggleModule)module
{
  return (CCUIToggleModule *)objc_loadWeakRetained((id *)&self->_module);
}

- (void)setModule:(id)a3
{
  objc_storeWeak((id *)&self->_module, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_module);
  objc_storeStrong((id *)&self->_motionCuesSlashIcon, 0);
  objc_storeStrong((id *)&self->_motionCuesAndCarIcon, 0);
  objc_storeStrong((id *)&self->_motionCuesIcon, 0);
}

@end
