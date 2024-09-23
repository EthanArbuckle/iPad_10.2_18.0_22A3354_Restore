@implementation PHFaceTimeRemoteViewController

+ (id)viewControllerClassName
{
  return CFSTR("FTRemoteRecentsContainerViewController");
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHFaceTimeRemoteViewController;
  -[PHFaceTimeRemoteViewController viewDidLoad](&v3, "viewDidLoad");
  -[PHFaceTimeRemoteViewController setModalTransitionStyle:](self, "setModalTransitionStyle:", 14);
}

- (int64_t)backgroundStyle
{
  return 4;
}

@end
