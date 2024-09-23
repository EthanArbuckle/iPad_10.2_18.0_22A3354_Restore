@implementation MRUPopoverPresentationController

- (MRUPopoverPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  MRUPopoverPresentationController *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MRUPopoverPresentationController;
  v4 = -[MRUPopoverPresentationController initWithPresentedViewController:presentingViewController:](&v7, sel_initWithPresentedViewController_presentingViewController_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUPopoverPresentationController setOverrideTraitCollection:](v4, "setOverrideTraitCollection:", v5);

    +[UIPopoverPresentationController _setAlwaysAllowPopoverPresentations:](MRUPopoverPresentationController, "_setAlwaysAllowPopoverPresentations:", 1);
  }
  return v4;
}

- (BOOL)_centersPopoverIfSourceViewNotSet
{
  return 1;
}

@end
