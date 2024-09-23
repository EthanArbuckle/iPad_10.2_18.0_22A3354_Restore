@implementation CCUIMainViewControllerFactory

+ (id)mainViewControllerWithSystemAgent:(id)a3
{
  id v3;
  CCUIMainViewController *v4;

  v3 = a3;
  v4 = -[CCUIMainViewController initWithSystemAgent:]([CCUIMainViewController alloc], "initWithSystemAgent:", v3);

  return v4;
}

@end
