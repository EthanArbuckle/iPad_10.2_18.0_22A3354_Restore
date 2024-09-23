@implementation _UIDocumentPickerModalManagementViewController

- (_UIDocumentPickerModalManagementViewController)initWithFileTypes:(id)a3 mode:(unint64_t)a4
{
  id v6;
  _UIDocumentPickerManagementViewController *v7;
  _UIDocumentPickerModalManagementViewController *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = -[_UIDocumentPickerManagementViewController initWithFileTypes:mode:]([_UIDocumentPickerManagementViewController alloc], "initWithFileTypes:mode:", v6, a4);

  v12.receiver = self;
  v12.super_class = (Class)_UIDocumentPickerModalManagementViewController;
  v8 = -[_UIDocumentPickerModalManagementViewController initWithRootViewController:](&v12, sel_initWithRootViewController_, v7);
  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 0, v8, sel__donePressed_);
    -[_UIDocumentPickerManagementViewController navigationItem](v7, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRightBarButtonItem:", v9);

  }
  return v8;
}

- (_UIDocumentPickerModalManagementViewController)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIDocumentPickerModalManagementViewController;
  return -[_UIDocumentPickerModalManagementViewController initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)_donePressed:(id)a3
{
  id v3;

  -[_UIDocumentPickerModalManagementViewController presentingViewController](self, "presentingViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

@end
