@implementation NUArticleNavigationController

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NUArticleNavigationController;
  -[NUArticleNavigationController viewDidLoad](&v2, sel_viewDidLoad);
}

@end
