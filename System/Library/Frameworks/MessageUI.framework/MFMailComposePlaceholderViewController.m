@implementation MFMailComposePlaceholderViewController

- (void)loadView
{
  _MFMailComposePlaceholderView *v3;

  v3 = objc_alloc_init(_MFMailComposePlaceholderView);
  -[MFMailComposePlaceholderViewController setView:](self, "setView:");

}

- (void)setSubject:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MFMailComposePlaceholderViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSubject:", v5);

}

@end
