@implementation CCUIFlashlightBackgroundViewController

- (CCUIFlashlightBackgroundViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  CCUIFlashlightBackgroundViewController *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CCUIFlashlightBackgroundViewController;
  v4 = -[CCUIFlashlightBackgroundViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BEB0EE0], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:", v4);

  }
  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CCUIFlashlightBackgroundViewController;
  -[CCUIFlashlightBackgroundViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x24BEB0EE0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIFlashlightBackgroundViewController _updateGlyphForFlashlightLevel:](self, "_updateGlyphForFlashlightLevel:", objc_msgSend(v4, "level"));

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)flashlightLevelDidChange:(unint64_t)a3
{
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[CCUIFlashlightBackgroundViewController _updateGlyphForFlashlightLevel:](self, "_updateGlyphForFlashlightLevel:", a3);
}

- (void)_updateGlyphForFlashlightLevel:(unint64_t)a3
{
  __CFString *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  id v8;

  v4 = CFSTR("flashlight.on.fill");
  if (!a3)
    v4 = CFSTR("flashlight.off.fill");
  v5 = (void *)MEMORY[0x24BDF6AE0];
  v6 = v4;
  objc_msgSend(v5, "configurationWithPointSize:weight:scale:", 3, 2, 30.0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:withConfiguration:", v6, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CCUICustomContentModuleBackgroundViewController setHeaderGlyphImage:unscaledSymbolPointSize:](self, "setHeaderGlyphImage:unscaledSymbolPointSize:", v7, 30.0);
}

@end
