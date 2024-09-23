@implementation AAUIViewServiceRootViewController

- (void)loadView
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc_init((Class)UIView);
  -[AAUIViewServiceRootViewController setView:](self, "setView:", v3);

  v5 = (id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AAUIViewServiceRootViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v5);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AAUIViewServiceRootViewController;
  -[AAUIViewServiceRootViewController viewDidLoad](&v3, "viewDidLoad");
  -[AAUIRemoteViewController prepareViewServiceForPresentation](self->_aauiRemoteViewController, "prepareViewServiceForPresentation");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AAUIViewServiceRootViewController;
  -[AAUIViewServiceRootViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[AAUIViewServiceRootViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_aauiRemoteViewController, 0, 0);
}

- (void)notifyFlowCompletionWithCancellation
{
  -[AAUIRemoteViewController handleCancellation](self->_aauiRemoteViewController, "handleCancellation");
}

- (AAUIRemoteViewController)aauiRemoteViewController
{
  return self->_aauiRemoteViewController;
}

- (void)setAauiRemoteViewController:(id)a3
{
  objc_storeStrong((id *)&self->_aauiRemoteViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aauiRemoteViewController, 0);
}

@end
