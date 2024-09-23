@implementation FBATableViewControler

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FBATableViewControler;
  -[FBATableViewControler viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "reloadView", UIContentSizeCategoryDidChangeNotification, 0);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)FBATableViewControler;
  -[FBATableViewControler dealloc](&v4, "dealloc");
}

- (void)reloadView
{
  NSString *v2;
  id v3;

  v2 = NSStringFromSelector(a2);
  v3 = (id)objc_claimAutoreleasedReturnValue(v2);
  +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("Subclasses must override %@"), v3);

}

@end
