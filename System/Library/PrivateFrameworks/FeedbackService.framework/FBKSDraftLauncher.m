@implementation FBKSDraftLauncher

- (FBKSDraftLauncher)initWithFeedbackForm:(id)a3
{
  id v4;
  FBKSDraftLauncher *v5;
  FBKSDraftLauncher_FrameworkPrivateName *v6;
  void *v7;
  uint64_t v8;
  FBKSDraftLauncher_FrameworkPrivateName *swiftObject;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FBKSDraftLauncher;
  v5 = -[FBKSDraftLauncher init](&v11, sel_init);
  if (v5)
  {
    v6 = [FBKSDraftLauncher_FrameworkPrivateName alloc];
    objc_msgSend(v4, "swiftObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[FBKSDraftLauncher_FrameworkPrivateName initWithFeedbackForm:](v6, "initWithFeedbackForm:", v7);
    swiftObject = v5->_swiftObject;
    v5->_swiftObject = (FBKSDraftLauncher_FrameworkPrivateName *)v8;

  }
  return v5;
}

- (void)collectFeedbackWithLaunchConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[FBKSDraftLauncher swiftObject](self, "swiftObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_swiftObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "collectFeedbackWithLaunchConfiguration:completion:", v8, v6);
}

- (FBKSDraftLauncher)form
{
  return self->_form;
}

- (FBKSDraftLauncher_FrameworkPrivateName)swiftObject
{
  return self->_swiftObject;
}

- (void)setSwiftObject:(id)a3
{
  objc_storeStrong((id *)&self->_swiftObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swiftObject, 0);
  objc_storeStrong((id *)&self->_form, 0);
}

@end
