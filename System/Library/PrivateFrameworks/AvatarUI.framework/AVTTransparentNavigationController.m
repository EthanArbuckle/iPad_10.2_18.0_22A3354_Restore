@implementation AVTTransparentNavigationController

- (AVTTransparentNavigationController)initWithRootViewController:(id)a3
{
  AVTTransparentNavigationController *v3;
  AVTTransparentNavigationController *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVTTransparentNavigationController;
  v3 = -[AVTTransparentNavigationController initWithRootViewController:](&v10, sel_initWithRootViewController_, a3);
  v4 = v3;
  if (v3)
  {
    -[AVTTransparentNavigationController navigationBar](v3, "navigationBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(MEMORY[0x1E0CEA638]);
    objc_msgSend(v5, "setBackgroundImage:forBarMetrics:", v6, 0);

    v7 = objc_alloc_init(MEMORY[0x1E0CEA638]);
    -[AVTTransparentNavigationController navigationBar](v4, "navigationBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setShadowImage:", v7);

    -[AVTTransparentNavigationController setModalPresentationStyle:](v4, "setModalPresentationStyle:", 3);
  }
  return v4;
}

@end
