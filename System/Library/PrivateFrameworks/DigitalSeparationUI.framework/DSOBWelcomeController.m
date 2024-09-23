@implementation DSOBWelcomeController

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DSOBWelcomeController;
  -[OBBaseWelcomeController viewDidLoad](&v3, sel_viewDidLoad);
  -[DSOBWelcomeController setShouldMoveHeaderViewTitleToNavigationTitleWhenScrolledOffScreen:](self, "setShouldMoveHeaderViewTitleToNavigationTitleWhenScrolledOffScreen:", 0);
}

- (void)presentErrorAlertWithTitle:(id)a3 message:(id)a4 continueHandler:(id)a5 tryAgainHandler:(id)a6
{
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v10 = (void *)MEMORY[0x24BEBD3B0];
  v11 = a6;
  v12 = a5;
  objc_msgSend(v10, "alertControllerWithTitle:message:preferredStyle:", a3, a4, 1);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BEBD3A8];
  DSUILocStringForKey(CFSTR("CONTINUE"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 0, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x24BEBD3A8];
  DSUILocStringForKey(CFSTR("TRY_AGAIN"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 0, v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "addAction:", v15);
  objc_msgSend(v19, "addAction:", v18);
  -[DSOBWelcomeController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v19, 1, 0);

}

- (void)presentErrorAlertController:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BEBD3A8];
  v5 = a3;
  DSUILocStringForKey(CFSTR("OK"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionWithTitle:style:handler:", v6, 0, &__block_literal_global);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addAction:", v7);
  -[DSOBWelcomeController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);

}

@end
