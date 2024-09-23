@implementation HKModalNavigationController

- (HKModalNavigationController)initWithRootViewController:(id)a3
{
  id v4;
  HKModalNavigationController *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKModalNavigationController;
  v5 = -[HKModalNavigationController initWithRootViewController:](&v14, sel_initWithRootViewController_, v4);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0DC34F0]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("MODAL_NAVIGATION_DONE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithTitle:style:target:action:", v8, 2, v5, sel_dismissWithAnimation_);

    objc_msgSend(CFSTR("UIA.Health"), "stringByAppendingString:", CFSTR(".ModalNavigationItem.Done"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAccessibilityIdentifier:", v10);

    objc_msgSend(v4, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRightBarButtonItem:", v9);

    objc_msgSend(v4, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKModalNavigationController setTitle:](v5, "setTitle:", v12);

    -[HKModalNavigationController setCompletion:](v5, "setCompletion:", 0);
  }

  return v5;
}

- (void)dismissWithAnimation:(id)a3
{
  id v4;

  -[HKModalNavigationController completion](self, "completion", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HKModalNavigationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v4);

}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1416);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
}

@end
