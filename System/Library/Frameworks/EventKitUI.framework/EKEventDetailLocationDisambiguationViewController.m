@implementation EKEventDetailLocationDisambiguationViewController

- (EKEventDetailLocationDisambiguationViewController)initWithLocation:(id)a3 pois:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  EKEventDetailLocationDisambiguationViewController *v11;
  EKEventDetailLocationDisambiguationContentViewController *v12;
  id v13;
  void *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)EKEventDetailLocationDisambiguationViewController;
  v11 = -[EKEventDetailLocationDisambiguationViewController init](&v16, sel_init);
  if (v11)
  {
    v12 = -[EKEventDetailLocationDisambiguationContentViewController initWithLocation:pois:completionBlock:]([EKEventDetailLocationDisambiguationContentViewController alloc], "initWithLocation:pois:completionBlock:", v8, v9, v10);
    -[EKEventDetailLocationDisambiguationViewController pushViewController:animated:](v11, "pushViewController:animated:", v12, 0);
    v13 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
    -[EKEventDetailLocationDisambiguationViewController navigationBar](v11, "navigationBar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setScrollEdgeAppearance:", v13);

  }
  return v11;
}

@end
