@implementation WFReferenceLibraryViewController

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFReferenceLibraryViewController;
  -[WFReferenceLibraryViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[WFReferenceLibraryViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "libraryControllerDidDismiss:", self);

}

- (WFReferenceLibraryViewControllerDelegate)delegate
{
  return (WFReferenceLibraryViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
