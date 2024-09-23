@implementation AMSUIBundleViewController

- (AMSUIBundleViewController)initWithServiceType:(id)a3 placement:(id)a4 account:(id)a5 bag:(id)a6
{
  id v8;
  id v9;
  void *v10;
  AMSUIBundleViewController *v11;
  objc_super v13;

  v8 = a5;
  v9 = a6;
  objc_msgSend(v9, "URLForKey:", CFSTR("bundleDynamicUIUrl"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)AMSUIBundleViewController;
  v11 = -[AMSUIDynamicViewController initWithBag:bagValue:](&v13, sel_initWithBag_bagValue_, v9, v10);

  if (v11)
    -[AMSUIBundleViewController setAccount:](v11, "setAccount:", v8);

  return v11;
}

+ (AMSBagKeySet)bagKeySet
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x24BE08298]);
  objc_msgSend(v2, "addBagKey:valueType:defaultValue:", CFSTR("bundleDynamicUIUrl"), 5, CFSTR("bundle"));
  +[AMSUIDynamicViewController bagKeySet](AMSUIDynamicViewController, "bagKeySet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unionBagKeySet:", v3);

  return (AMSBagKeySet *)v2;
}

+ (NSString)bagSubProfile
{
  return (NSString *)CFSTR("AMSUIBundle");
}

+ (NSString)bagSubProfileVersion
{
  return (NSString *)CFSTR("1");
}

- (id)account
{
  return self->account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->account, a3);
}

- (NSString)placement
{
  return self->_placement;
}

- (void)setPlacement:(id)a3
{
  objc_storeStrong((id *)&self->_placement, a3);
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
  objc_storeStrong((id *)&self->_serviceType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_placement, 0);
  objc_storeStrong((id *)&self->account, 0);
}

@end
