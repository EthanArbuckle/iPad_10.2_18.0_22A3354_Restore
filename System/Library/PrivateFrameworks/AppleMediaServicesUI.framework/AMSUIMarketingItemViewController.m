@implementation AMSUIMarketingItemViewController

- (AMSUIMarketingItemViewController)initWithMarketingItem:(id)a3 bag:(id)a4
{
  id v6;
  id v7;
  void *v8;
  AMSUIMarketingItemViewController *v9;
  void *v10;
  void *v11;
  objc_super v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "URLForKey:", CFSTR("marketingItemDynamicUIUrl"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)AMSUIMarketingItemViewController;
  v9 = -[AMSUIDynamicViewController initWithBag:bagValue:](&v13, sel_initWithBag_bagValue_, v7, v8);

  if (v9)
  {
    v14 = CFSTR("marketingItem");
    objc_msgSend(v6, "rawValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIDynamicViewController setInternalClientOptions:](v9, "setInternalClientOptions:", v11);

  }
  return v9;
}

- (AMSUIMarketingItemViewController)initWithServiceType:(id)a3 placement:(id)a4 bag:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  AMSUIMarketingItemViewController *v12;
  void *v13;
  objc_super v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "URLForKey:", CFSTR("marketingItemDynamicUIUrl"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)AMSUIMarketingItemViewController;
  v12 = -[AMSUIDynamicViewController initWithBag:bagValue:](&v15, sel_initWithBag_bagValue_, v10, v11);

  if (v12)
  {
    v16[0] = CFSTR("serviceType");
    v16[1] = CFSTR("placement");
    v17[0] = v8;
    v17[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIDynamicViewController setInternalClientOptions:](v12, "setInternalClientOptions:", v13);

  }
  return v12;
}

- (NSString)offerHints
{
  void *v2;
  void *v3;

  -[AMSUIDynamicViewController internalClientOptions](self, "internalClientOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("offerHints"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)seed
{
  void *v2;
  void *v3;

  -[AMSUIDynamicViewController internalClientOptions](self, "internalClientOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("seed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setOfferHints:(id)a3
{
  -[AMSUIMarketingItemViewController _setInternalClientOptionsValue:forKey:](self, "_setInternalClientOptionsValue:forKey:", a3, CFSTR("offerHints"));
}

- (void)setSeed:(id)a3
{
  -[AMSUIMarketingItemViewController _setInternalClientOptionsValue:forKey:](self, "_setInternalClientOptionsValue:forKey:", a3, CFSTR("seed"));
}

- (void)_setInternalClientOptionsValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[AMSUIDynamicViewController internalClientOptions](self, "internalClientOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, v6);
  -[AMSUIDynamicViewController setInternalClientOptions:](self, "setInternalClientOptions:", v9);

}

+ (AMSBagKeySet)bagKeySet
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x24BE08298]);
  objc_msgSend(v2, "addBagKey:valueType:defaultValue:", CFSTR("marketingItemDynamicUIUrl"), 5, CFSTR("https://amsui.apple.com/dynamic/marketing#route=marketingItem"));
  +[AMSUIDynamicViewController bagKeySet](AMSUIDynamicViewController, "bagKeySet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unionBagKeySet:", v3);

  return (AMSBagKeySet *)v2;
}

+ (NSString)bagSubProfile
{
  return (NSString *)CFSTR("AMSUIMarketingItem");
}

+ (NSString)bagSubProfileVersion
{
  return (NSString *)CFSTR("1");
}

+ (id)createBagForSubProfile
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)MEMORY[0x24BE08060];
  objc_msgSend((id)objc_opt_class(), "bagKeySet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "bagSubProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "bagSubProfileVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerBagKeySet:forProfile:profileVersion:", v3, v4, v5);

  v6 = (void *)MEMORY[0x24BE08050];
  objc_msgSend((id)objc_opt_class(), "bagSubProfile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "bagSubProfileVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bagForProfile:profileVersion:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (AMSUIMarketingItemViewController)initWithServiceType:(id)a3 placement:(id)a4 account:(id)a5 bag:(id)a6
{
  id v10;
  AMSUIMarketingItemViewController *v11;
  AMSUIMarketingItemViewController *v12;

  v10 = a5;
  v11 = -[AMSUIMarketingItemViewController initWithServiceType:placement:bag:](self, "initWithServiceType:placement:bag:", a3, a4, a6);
  v12 = v11;
  if (v11)
    -[AMSUIDynamicViewController setAccount:](v11, "setAccount:", v10);

  return v12;
}

- (NSDictionary)contextInfo
{
  return self->_contextInfo;
}

- (void)setContextInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 992);
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
  objc_storeStrong((id *)&self->_contextInfo, 0);
}

@end
