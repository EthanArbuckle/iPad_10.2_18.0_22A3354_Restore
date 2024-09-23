@implementation SFSaveToFilesActivity

- (SFSaveToFilesActivity)initWithActivityItemProviderCollection:(id)a3 customizationController:(id)a4
{
  id v6;
  id v7;
  SFSaveToFilesActivity *v8;
  _SFSaveToFilesOperation *v9;
  _SFSaveToFilesOperation *operation;
  SFSaveToFilesActivity *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SFSaveToFilesActivity;
  v8 = -[UIActivity init](&v13, sel_init);
  if (v8)
  {
    v9 = -[_SFSaveToFilesOperation initWithActivityItemProviderCollection:]([_SFSaveToFilesOperation alloc], "initWithActivityItemProviderCollection:", v6);
    operation = v8->_operation;
    v8->_operation = v9;

    -[_SFSaveToFilesOperation setDelegate:](v8->_operation, "setDelegate:", v8);
    objc_storeStrong((id *)&v8->_customizationController, a4);
    v11 = v8;
  }

  return v8;
}

- (id)activityType
{
  return (id)*MEMORY[0x1E0CEB230];
}

- (BOOL)_managesOwnPresentation
{
  return 1;
}

- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  UIViewController **p_presenterViewController;
  id v8;
  void *v9;
  id presentationCompletionHandler;

  self->_presentAnimated = a4;
  p_presenterViewController = &self->_presenterViewController;
  v8 = a5;
  objc_storeWeak((id *)p_presenterViewController, a3);
  v9 = (void *)MEMORY[0x1A8598C40](v8);

  presentationCompletionHandler = self->_presentationCompletionHandler;
  self->_presentationCompletionHandler = v9;

  -[_SFSaveToFilesOperation start](self->_operation, "start");
  return 1;
}

- (BOOL)_dismissActivityFromViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(_QWORD);
  UIViewController *v10;
  BOOL v11;

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  if (v8)
  {
    v10 = (UIViewController *)v8;
LABEL_4:
    -[UIViewController dismissViewControllerAnimated:completion:](v10, "dismissViewControllerAnimated:completion:", v6, v9);

    v11 = 1;
    goto LABEL_5;
  }
  v10 = self->_presentedViewController;
  if (v10)
    goto LABEL_4;
  if (v9)
    v9[2](v9);
  v11 = 0;
LABEL_5:

  return v11;
}

- (void)saveToFilesOperation:(id)a3 presentViewController:(id)a4
{
  id WeakRetained;
  id presentationCompletionHandler;
  id v8;

  objc_storeStrong((id *)&self->_presentedViewController, a4);
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_presenterViewController);
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v8, self->_presentAnimated, self->_presentationCompletionHandler);

  presentationCompletionHandler = self->_presentationCompletionHandler;
  self->_presentationCompletionHandler = 0;

}

- (void)saveToFilesOperation:(id)a3 didFinishWithSuccess:(BOOL)a4
{
  _BOOL8 v4;
  _SFSaveToFilesOperation *operation;
  id presentationCompletionHandler;

  v4 = a4;
  operation = self->_operation;
  self->_operation = 0;

  presentationCompletionHandler = self->_presentationCompletionHandler;
  self->_presentationCompletionHandler = 0;

  -[_SFActivity activityDidFinish:](self, "activityDidFinish:", v4);
}

- (BOOL)saveToFilesOperationSupportsDownloads:(id)a3
{
  return self->_supportsDownloads;
}

- (id)customizationControllerForSaveToFilesOperation:(id)a3
{
  return self->_customizationController;
}

- (BOOL)saveToFilesOperationShouldDismissViewControllerAfterCompletion:(id)a3
{
  return 0;
}

- (BOOL)supportsDownloads
{
  return self->_supportsDownloads;
}

- (void)setSupportsDownloads:(BOOL)a3
{
  self->_supportsDownloads = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedViewController, 0);
  objc_storeStrong((id *)&self->_customizationController, 0);
  objc_storeStrong(&self->_presentationCompletionHandler, 0);
  objc_destroyWeak((id *)&self->_presenterViewController);
  objc_storeStrong((id *)&self->_operation, 0);
}

@end
