@implementation PKPaletteTapToRadarScreenshotsExecution

- (void)run
{
  void *v3;
  void *v4;
  PKTextInputDebugRadarViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPaletteTapToRadarScreenshotsExecution;
  -[PKPaletteTapToRadarCommandExecution run](&v9, "run");
  -[PKPaletteTapToRadarCommandExecution configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "debugSharpenerLog");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[PKTextInputDebugRadarViewController initWithSharpenerLog:]([PKTextInputDebugRadarViewController alloc], "initWithSharpenerLog:", v4);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v5);
  objc_msgSend(v6, "setModalPresentationStyle:", 2);
  -[PKPaletteTapToRadarCommandExecution configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentationViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentViewController:animated:completion:", v6, 1, 0);

}

@end
