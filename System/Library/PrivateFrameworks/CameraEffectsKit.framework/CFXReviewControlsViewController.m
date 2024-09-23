@implementation CFXReviewControlsViewController

- (CFXReviewControlsViewController)init
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CFXReviewControlsViewController *v8;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDF6E00];
  objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storyboardWithName:bundle:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "instantiateViewControllerWithIdentifier:", v4);
  v8 = (CFXReviewControlsViewController *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
