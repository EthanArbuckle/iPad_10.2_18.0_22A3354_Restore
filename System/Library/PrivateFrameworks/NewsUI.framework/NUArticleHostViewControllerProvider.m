@implementation NUArticleHostViewControllerProvider

- (NUArticleHostViewControllerProvider)initWithArticleHostViewController:(id)a3
{
  id v4;
  NUArticleHostViewControllerProvider *v5;
  NUArticleHostViewControllerProvider *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NUArticleHostViewControllerProvider;
  v5 = -[NUArticleHostViewControllerProvider init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_articleHostViewController, v4);

  return v6;
}

- (NUArticleHostViewController)articleHostViewController
{
  return (NUArticleHostViewController *)objc_loadWeakRetained((id *)&self->_articleHostViewController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_articleHostViewController);
}

@end
