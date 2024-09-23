@implementation ViewController

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ViewController;
  -[ViewController viewDidLoad](&v2, "viewDidLoad");
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ViewController;
  -[ViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

@end
