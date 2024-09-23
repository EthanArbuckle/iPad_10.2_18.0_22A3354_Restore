@implementation AVMediaSelectionViewController

- (AVMediaSelectionViewController)initWithPlayerController:(id)a3 doneButtonTarget:(id)a4 doneButtonAction:(SEL)a5
{
  id v8;
  id v9;
  AVMediaSelectionTableViewController *v10;
  AVMediaSelectionViewController *v11;
  AVMediaSelectionViewController *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v8 = a4;
  v9 = a3;
  v10 = -[AVMediaSelectionTableViewController initWithStyle:]([AVMediaSelectionTableViewController alloc], "initWithStyle:", 1);
  -[AVMediaSelectionTableViewController setPlayerController:](v10, "setPlayerController:", v9);

  v19.receiver = self;
  v19.super_class = (Class)AVMediaSelectionViewController;
  v11 = -[AVMediaSelectionViewController initWithRootViewController:](&v19, sel_initWithRootViewController_, v10);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mediaSelectionTableViewController, v10);
    -[AVMediaSelectionTableViewController navigationItem](v10, "navigationItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, v8, a5);
    objc_msgSend(v13, "setRightBarButtonItem:", v14);

    -[AVMediaSelectionViewController setModalPresentationStyle:](v12, "setModalPresentationStyle:", 7);
    -[AVMediaSelectionViewController setModalPresentationCapturesStatusBarAppearance:](v12, "setModalPresentationCapturesStatusBarAppearance:", 1);
    -[AVMediaSelectionViewController navigationBar](v12, "navigationBar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBarStyle:", 1);

    -[AVMediaSelectionViewController navigationBar](v12, "navigationBar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTintColor:", v17);

    -[AVMediaSelectionViewController setOverrideUserInterfaceStyle:](v12, "setOverrideUserInterfaceStyle:", 2);
  }

  return v12;
}

- (id)mediaSelectionTableViewController
{
  return self->_mediaSelectionTableViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaSelectionTableViewController, 0);
}

@end
