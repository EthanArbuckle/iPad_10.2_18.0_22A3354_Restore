@implementation MUContentViewController

- (MUContentViewController)initWithNibName:(id)a3 bundle:(id)a4 delegate:(id)a5
{
  id v8;
  MUContentViewController *v9;
  MUContentViewController *v10;
  objc_super v12;

  v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)MUContentViewController;
  v9 = -[MUContentViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, a3, a4);
  v10 = v9;
  if (v9)
    objc_storeWeak((id *)&v9->_delegate, v8);

  return v10;
}

- (MUContentViewControllerDelegate)delegate
{
  return (MUContentViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AKController)annotationController
{
  return (AKController *)objc_getProperty(self, a2, 976, 1);
}

- (void)setAnnotationController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 976);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotationController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
