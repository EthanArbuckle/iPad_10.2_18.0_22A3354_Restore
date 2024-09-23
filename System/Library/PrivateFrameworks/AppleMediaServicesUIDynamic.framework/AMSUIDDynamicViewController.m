@implementation AMSUIDDynamicViewController

- (AMSUIDDynamicViewController)initWithBag:(id)a3 bagValue:(id)a4
{
  AMSUIDDynamicViewController *result;

  swift_unknownObjectRetain();
  DynamicViewController.init(bag:bagValue:)((uint64_t)a3, a4);
  return result;
}

- (AMSUIDDynamicViewController)initWithBag:(id)a3 URL:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v4 = sub_1B9DE1554();
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B9DE1518();
  v7 = swift_unknownObjectRetain();
  return (AMSUIDDynamicViewController *)DynamicViewController.init(bag:URL:)(v7, (uint64_t)v6);
}

- (AMSUIDDynamicViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B9D9559C();
}

- (void)dealloc
{
  AMSUIDDynamicViewController *v2;

  v2 = self;
  DynamicViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_29_0(OBJC_IVAR___AMSUIDDynamicViewController_clientInfo);
  OUTLINED_FUNCTION_138();
  sub_1B9D5DB24((uint64_t)self + OBJC_IVAR___AMSUIDDynamicViewController_delegate);
  sub_1B9D5DB24((uint64_t)self + OBJC_IVAR___AMSUIDDynamicViewController_mediaContentDelegate);
  OUTLINED_FUNCTION_138();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_29_0(OBJC_IVAR___AMSUIDDynamicViewController_child);
  OUTLINED_FUNCTION_102_0();
  OUTLINED_FUNCTION_29_0(OBJC_IVAR___AMSUIDDynamicViewController____lazy_storage___childNavigationController);
  OUTLINED_FUNCTION_102_0();
  OUTLINED_FUNCTION_102_0();
  swift_release();
  OUTLINED_FUNCTION_102_0();
  swift_release();
}

- (ACAccount)account
{
  id v2;

  DynamicViewController.account.getter();
  return (ACAccount *)v2;
}

- (void)setAccount:(id)a3
{
  id v5;
  AMSUIDDynamicViewController *v6;

  v5 = a3;
  v6 = self;
  DynamicViewController.account.setter(a3);

}

- (BOOL)anonymousMetrics
{
  return DynamicViewController.anonymousMetrics.getter() & 1;
}

- (void)setAnonymousMetrics:(BOOL)a3
{
  DynamicViewController.anonymousMetrics.setter(a3);
}

- (AMSBagProtocol)bag
{
  id v2;

  DynamicViewController.bag.getter();
  return (AMSBagProtocol *)v2;
}

- (void)setBag:(id)a3
{
  AMSUIDDynamicViewController *v5;

  swift_unknownObjectRetain();
  v5 = self;
  DynamicViewController.bag.setter((uint64_t)a3);

}

- (AMSProcessInfo)clientInfo
{
  id v2;

  DynamicViewController.clientInfo.getter();
  return (AMSProcessInfo *)v2;
}

- (void)setClientInfo:(id)a3
{
  id v5;
  AMSUIDDynamicViewController *v6;

  v5 = a3;
  v6 = self;
  DynamicViewController.clientInfo.setter(a3);

}

- (NSDictionary)clientOptions
{
  return (NSDictionary *)sub_1B9D96198((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))DynamicViewController.clientOptions.getter);
}

- (void)setClientOptions:(id)a3
{
  sub_1B9D9620C(self, (uint64_t)a2, (uint64_t)a3, DynamicViewController.clientOptions.setter);
}

- (AMSUIDDynamicViewControllerDelegate)delegate
{
  DynamicViewController.delegate.getter();
}

- (void)setDelegate:(id)a3
{
  AMSUIDDynamicViewController *v4;

  swift_unknownObjectRetain();
  v4 = self;
  DynamicViewController.delegate.setter();

}

- (AMSUIMediaContentDelegate)mediaContentDelegate
{
  DynamicViewController.mediaContentDelegate.getter();
}

- (void)setMediaContentDelegate:(id)a3
{
  AMSUIDDynamicViewController *v4;

  swift_unknownObjectRetain();
  v4 = self;
  DynamicViewController.mediaContentDelegate.setter();

}

- (NSDictionary)internalClientOptions
{
  return (NSDictionary *)sub_1B9D96198((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))DynamicViewController.internalClientOptions.getter);
}

- (void)setInternalClientOptions:(id)a3
{
  sub_1B9D9620C(self, (uint64_t)a2, (uint64_t)a3, DynamicViewController.internalClientOptions.setter);
}

- (NSString)mediaClientIdentifier
{
  uint64_t v2;
  void *v3;

  DynamicViewController.mediaClientIdentifier.getter();
  if (v2)
  {
    v3 = (void *)sub_1B9DE213C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setMediaClientIdentifier:(id)a3
{
  sub_1B9D96C1C(self, (uint64_t)a2, (uint64_t)a3, DynamicViewController.mediaClientIdentifier.setter);
}

- (NSDictionary)metricsOverlay
{
  return (NSDictionary *)sub_1B9D96198((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))DynamicViewController.metricsOverlay.getter);
}

- (void)setMetricsOverlay:(id)a3
{
  sub_1B9D9620C(self, (uint64_t)a2, (uint64_t)a3, DynamicViewController.metricsOverlay.setter);
}

- (id)preload
{
  AMSUIDDynamicViewController *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1B9D966B0();
  v4 = v3;

  return v4;
}

- (void)reloadContentViewImpressionItems
{
  AMSUIDDynamicViewController *v2;

  v2 = self;
  sub_1B9D9680C();

}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  AMSUIDDynamicViewController *v8;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_1B9D9E4E8;
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  DynamicViewController.dismiss(animated:completion:)(a3, v6, v7);
  sub_1B9D63180((uint64_t)v6);

}

- (UINavigationItem)navigationItem
{
  AMSUIDDynamicViewController *v2;
  id v3;

  v2 = self;
  v3 = DynamicViewController.navigationItem.getter();

  return (UINavigationItem *)v3;
}

- (NSString)title
{
  AMSUIDDynamicViewController *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  DynamicViewController.title.getter((uint64_t)v2);
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1B9DE213C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setTitle:(id)a3
{
  sub_1B9D96C1C(self, (uint64_t)a2, (uint64_t)a3, DynamicViewController.title.setter);
}

- (void)loadView
{
  AMSUIDDynamicViewController *v2;

  v2 = self;
  DynamicViewController.loadView()();

}

- (void)viewDidLoad
{
  AMSUIDDynamicViewController *v2;

  v2 = self;
  DynamicViewController.viewDidLoad()();

}

- (void)viewWillAppear:(BOOL)a3
{
  AMSUIDDynamicViewController *v4;

  v4 = self;
  DynamicViewController.viewWillAppear(_:)(a3);

}

- (void)viewWillLayoutSubviews
{
  AMSUIDDynamicViewController *v2;

  v2 = self;
  DynamicViewController.viewWillLayoutSubviews()();

}

- (void)viewDidDisappear:(BOOL)a3
{
  AMSUIDDynamicViewController *v4;

  v4 = self;
  DynamicViewController.viewDidDisappear(_:)(a3);

}

- (void)cancelButtonAction
{
  AMSUIDDynamicViewController *v2;

  v2 = self;
  sub_1B9D85700();

}

- (void)legacyPurchaseDidSucceed:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  AMSUIDDynamicViewController *v8;
  uint64_t v9;

  v4 = sub_1B9DE1404();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B9DE13E0();
  v8 = self;
  sub_1B9D9AEF8();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)didEnterBackground
{
  AMSUIDDynamicViewController *v2;

  v2 = self;
  sub_1B9D9CEE4();

}

- (void)willEnterForeground
{
  AMSUIDDynamicViewController *v2;

  v2 = self;
  sub_1B9D9D120();

}

- (AMSUIDDynamicViewController)init
{
  DynamicViewController.init()();
}

- (AMSUIDDynamicViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1B9DE2160();
  v5 = a4;
  DynamicViewController.init(nibName:bundle:)();
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4;
  AMSUIDDynamicViewController *v5;

  v4 = a3;
  v5 = self;
  DynamicViewController.animationController(forDismissed:)();

  return 0;
}

@end
