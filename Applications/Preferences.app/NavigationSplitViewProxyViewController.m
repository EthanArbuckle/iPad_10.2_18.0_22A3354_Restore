@implementation NavigationSplitViewProxyViewController

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for NavigationSplitViewProxyViewController();
  v4 = v6.receiver;
  -[NavigationSplitViewProxyViewController viewDidAppear:](&v6, "viewDidAppear:", v3);
  v5 = objc_msgSend(v4, "navigationItem", v6.receiver, v6.super_class);
  objc_msgSend(v5, "setHidesSearchBarWhenScrolling:", 1);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  void *v5;
  id v6;
  unsigned int v7;
  id v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for NavigationSplitViewProxyViewController();
  v4 = v9.receiver;
  -[NavigationSplitViewProxyViewController viewWillAppear:](&v9, "viewWillAppear:", v3);
  v5 = (void *)objc_opt_self(UIDevice);
  v6 = objc_msgSend(v5, "currentDevice", v9.receiver, v9.super_class);
  v7 = objc_msgSend(v6, "sf_isiPad");

  if (v7)
  {
    sub_10006E3D4();
  }
  else
  {
    v8 = objc_msgSend(v4, "navigationItem");
    objc_msgSend(v8, "setHidesSearchBarWhenScrolling:", 0);

    v4 = v8;
  }

}

- (_TtC11SettingsAppP33_D5FB2F106141AAB1D580745497402FE038NavigationSplitViewProxyViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  id v10;
  _TtC11SettingsAppP33_D5FB2F106141AAB1D580745497402FE038NavigationSplitViewProxyViewController *v11;
  objc_super v13;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    *((_BYTE *)&self->super.super.super.isa
    + OBJC_IVAR____TtC11SettingsAppP33_D5FB2F106141AAB1D580745497402FE038NavigationSplitViewProxyViewController____lazy_storage___oneTimeConfiguration) = 1;
    v8 = a4;
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    *((_BYTE *)&self->super.super.super.isa
    + OBJC_IVAR____TtC11SettingsAppP33_D5FB2F106141AAB1D580745497402FE038NavigationSplitViewProxyViewController____lazy_storage___oneTimeConfiguration) = 1;
    v10 = a4;
    v9 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for NavigationSplitViewProxyViewController();
  v11 = -[NavigationSplitViewProxyViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", v9, a4);

  return v11;
}

- (_TtC11SettingsAppP33_D5FB2F106141AAB1D580745497402FE038NavigationSplitViewProxyViewController)initWithCoder:(id)a3
{
  objc_super v5;

  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC11SettingsAppP33_D5FB2F106141AAB1D580745497402FE038NavigationSplitViewProxyViewController____lazy_storage___oneTimeConfiguration) = 1;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NavigationSplitViewProxyViewController();
  return -[NavigationSplitViewProxyViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
