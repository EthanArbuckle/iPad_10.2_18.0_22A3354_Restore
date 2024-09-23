@implementation AXCCSoundDetectionModule

- (AXCCSoundDetectionModule)init
{
  AXCCSoundDetectionModule *v2;
  AXCCSoundDetectionModule *v3;
  void (**v4)(_QWORD);
  _QWORD v6[4];
  AXCCSoundDetectionModule *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AXCCSoundDetectionModule;
  v2 = -[AXCCSoundDetectionModule init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = sub_230F768D4;
    v6[3] = &unk_24FFC2B80;
    v7 = v2;
    v4 = (void (**)(_QWORD))MEMORY[0x2348CB65C](v6);
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      v4[2](v4);
    else
      AXPerformBlockAsynchronouslyOnMainThread();

  }
  return v3;
}

- (void)_initializeViewContent
{
  AXCCSoundDetectionModuleViewController *v3;
  AXCCSoundDetectionModuleViewController *contentViewController;
  AXCCSoundDetectionModuleViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  AXCCSoundDetectionModuleViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  AXCCSoundDetectionModuleViewController *v13;
  void *v14;

  v3 = -[CCUIMenuModuleViewController initWithNibName:bundle:]([AXCCSoundDetectionModuleViewController alloc], "initWithNibName:bundle:", 0, 0);
  contentViewController = self->_contentViewController;
  self->_contentViewController = v3;

  -[AXCCSoundDetectionModuleViewController setSoundDetectionDelegate:](self->_contentViewController, "setSoundDetectionDelegate:", self);
  -[AXCCSoundDetectionModuleViewController setModule:](self->_contentViewController, "setModule:", self);
  v5 = self->_contentViewController;
  v6 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageNamed:inBundle:", CFSTR("SoundDetectionIcon"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIMenuModuleViewController setGlyphImage:](v5, "setGlyphImage:", v8);

  v9 = self->_contentViewController;
  v10 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageNamed:inBundle:", CFSTR("SoundDetectionIcon"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIButtonModuleViewController setSelectedGlyphImage:](v9, "setSelectedGlyphImage:", v12);

  v13 = self->_contentViewController;
  objc_msgSend(MEMORY[0x24BDF6950], "systemPinkColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIButtonModuleViewController setSelectedGlyphColor:](v13, "setSelectedGlyphColor:", v14);

  if (!-[CCUIButtonModuleViewController isExpanded](self->_contentViewController, "isExpanded"))
    -[CCUIButtonModuleViewController setSelected:](self->_contentViewController, "setSelected:", -[AXCCSoundDetectionModule isSelected](self, "isSelected"));
}

- (void)expandModule
{
  id v2;

  -[AXCCSoundDetectionModule contentModuleContext](self, "contentModuleContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestExpandModule");

}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  -[AXCCSoundDetectionModule contentModuleContext](self, "contentModuleContext");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BE19B78];
  if (v3)
    v5 = CFSTR("status.running");
  else
    v5 = CFSTR("status.paused");
  if (v3)
    v6 = 1;
  else
    v6 = 2;
  sub_230F76B30(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "statusUpdateWithMessage:type:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "enqueueStatusUpdate:", v8);

}

- (BOOL)isSelected
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "soundDetectionState") == 2;

  return v3;
}

- (void)openSoundDetectionSettings
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=ACCESSIBILITY&path=SOUND_RECOGNITION_TITLE"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXCCSoundDetectionModule contentModuleContext](self, "contentModuleContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openURL:completionHandler:", v4, 0);

}

- (AXCCSoundDetectionModuleViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewController, a3);
}

- (CCUIContentModuleContext)contentModuleContext
{
  return self->_contentModuleContext;
}

- (void)setContentModuleContext:(id)a3
{
  objc_storeStrong((id *)&self->_contentModuleContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentModuleContext, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end
