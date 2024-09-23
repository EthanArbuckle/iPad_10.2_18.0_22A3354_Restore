@implementation AMUIPosterExtensionSwitcherItem

+ (id)itemWithProviderBundleIdentifier:(void *)a3 configurations:(void *)a4 posterCategoryViewControllerDelegate:(void *)a5 dateProvider:
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = a2;
  v12 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_self()), "initWithProviderBundleIdentifier:configurations:posterCategoryViewControllerDelegate:dateProvider:", v11, v10, v9, v8);

  return v12;
}

- (uint64_t)setConfigurations:(uint64_t)result
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (result)
  {
    v2 = result;
    v3 = objc_msgSend(a2, "copy");
    v4 = *(void **)(v2 + 16);
    *(_QWORD *)(v2 + 16) = v3;

    return objc_msgSend(*(id *)(v2 + 8), "setConfigurations:", *(_QWORD *)(v2 + 16));
  }
  return result;
}

- (id)posterCategoryViewController
{
  id *v1;
  id v2;
  AMUIPosterCategoryViewController *v3;
  id v4;
  id v5;
  id WeakRetained;

  if (a1)
  {
    v1 = a1;
    v2 = a1[1];
    if (!v2)
    {
      v3 = objc_alloc_init(AMUIPosterCategoryViewController);
      v4 = v1[1];
      v1[1] = v3;

      objc_msgSend(v1[1], "setConfigurations:", v1[2]);
      v5 = v1[1];
      WeakRetained = objc_loadWeakRetained(v1 + 5);
      objc_msgSend(v5, "setDelegate:", WeakRetained);

      objc_msgSend(v1[1], "setDateProvider:", v1[3]);
      v2 = v1[1];
    }
    a1 = (id *)v2;
  }
  return a1;
}

- (void)setDateProvider:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    objc_storeStrong((id *)(a1 + 24), a2);
    objc_msgSend(*(id *)(a1 + 8), "setDateProvider:", *(_QWORD *)(a1 + 24));
  }

}

- (uint64_t)configurations
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (AMUIPosterExtensionSwitcherItem)initWithProviderBundleIdentifier:(id)a3 configurations:(id)a4 posterCategoryViewControllerDelegate:(id)a5 dateProvider:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  AMUIPosterExtensionSwitcherItem *v14;
  uint64_t v15;
  NSString *providerBundleIdentifier;
  uint64_t v17;
  NSArray *configurations;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)AMUIPosterExtensionSwitcherItem;
  v14 = -[AMUIPosterExtensionSwitcherItem init](&v20, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    providerBundleIdentifier = v14->_providerBundleIdentifier;
    v14->_providerBundleIdentifier = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    configurations = v14->_configurations;
    v14->_configurations = (NSArray *)v17;

    objc_storeWeak((id *)&v14->_posterCategoryViewControllerDelegate, v12);
    objc_storeStrong((id *)&v14->_dateProvider, a6);
  }

  return v14;
}

- (void)dealloc
{
  objc_super v3;

  -[AMUIPosterExtensionSwitcherItem invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)AMUIPosterExtensionSwitcherItem;
  -[AMUIPosterExtensionSwitcherItem dealloc](&v3, sel_dealloc);
}

- (NSObject)identifier
{
  if (self)
    self = (AMUIPosterExtensionSwitcherItem *)self->_providerBundleIdentifier;
  return self;
}

- (UIView)itemView
{
  void *v2;
  void *v3;
  void *v4;

  -[AMUIPosterExtensionSwitcherItem posterCategoryViewController]((id *)&self->super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsGroupOpacity:", 1);

  return (UIView *)v3;
}

- (void)invalidate
{
  AMUIPosterCategoryViewController *posterCategoryViewController;

  -[AMUIPosterCategoryViewController invalidate](self->_posterCategoryViewController, "invalidate");
  posterCategoryViewController = self->_posterCategoryViewController;
  self->_posterCategoryViewController = 0;

}

- (void)switcherItemWillAppear:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[AMUIPosterExtensionSwitcherItem itemView](self, "itemView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "displayCornerRadius");
  objc_msgSend(v7, "_setContinuousCornerRadius:");

  -[AMUIPosterExtensionSwitcherItem itemView](self, "itemView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClipsToBounds:", 1);

}

- (void)switcherItemDidAppear:(id)a3
{
  id v3;

  -[AMUIPosterExtensionSwitcherItem itemView](self, "itemView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClipsToBounds:", 0);

}

- (void)switcherItemWillDisappear:(id)a3
{
  id v3;

  -[AMUIPosterExtensionSwitcherItem itemView](self, "itemView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClipsToBounds:", 1);

}

- (void)switcherItemDidDisappear:(id)a3
{
  id v3;

  -[AMUIPosterExtensionSwitcherItem itemView](self, "itemView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClipsToBounds:", 0);

}

- (uint64_t)dateProvider
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_posterCategoryViewControllerDelegate);
  objc_storeStrong((id *)&self->_providerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_storeStrong((id *)&self->_posterCategoryViewController, 0);
}

@end
