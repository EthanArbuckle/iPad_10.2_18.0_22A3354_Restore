@implementation STSMailComposeViewController

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STSMailComposeViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v6, "bounds");
  v8 = v7 * 0.5;

  if (v5 < v8)
    -[STSMailComposeViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
}

@end
