@implementation InAppMessageContextProvider

- (id)contextPropertyWithName:(id)a3
{
  return 0;
}

- (BOOL)allowsModalMessageDisplay
{
  return 1;
}

- (id)viewControllerForModalPresentation
{
  void *v3;
  _TtC16NewsSubscriptionP33_2BC9D414A52E1C4290962E677FF5534227InAppMessageContextProvider *v4;
  id v5;
  id v6;
  _TtC16NewsSubscriptionP33_2BC9D414A52E1C4290962E677FF5534227InAppMessageContextProvider *v7;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_sharedApplication);
  v6 = objc_msgSend(v5, sel_key_window);

  if (v6)
  {
    v7 = (_TtC16NewsSubscriptionP33_2BC9D414A52E1C4290962E677FF5534227InAppMessageContextProvider *)objc_msgSend(v6, sel_rootViewController);

    if (v7)
    {
      v6 = (id)sub_1BA437F3C();

      v4 = v7;
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (_TtC16NewsSubscriptionP33_2BC9D414A52E1C4290962E677FF5534227InAppMessageContextProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[InAppMessageContextProvider init](&v3, sel_init);
}

@end
