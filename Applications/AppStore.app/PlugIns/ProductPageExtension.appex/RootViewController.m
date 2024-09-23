@implementation RootViewController

- (RootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (RootViewController *)sub_10060EAAC(v5, v7, a4);
}

- (RootViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1006142EC();
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RootViewController();
  v4 = v5.receiver;
  -[RootViewController viewWillAppear:](&v5, "viewWillAppear:", v3);
  sub_1006105C8();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RootViewController();
  v4 = v5.receiver;
  -[RootViewController viewDidAppear:](&v5, "viewDidAppear:", v3);
  v4[OBJC_IVAR___RootViewController_isViewAppeared] = 1;
  if (v4[OBJC_IVAR___RootViewController_isVisibleInClientWindow] == 1)
    dispatch thunk of Gate.Condition.isSatisfied.setter(1);
  sub_1006105C8();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  __n128 v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for RootViewController();
  v4 = v6.receiver;
  -[RootViewController viewWillDisappear:](&v6, "viewWillDisappear:", v3);
  if (*(_QWORD *)&v4[OBJC_IVAR___RootViewController_adAttributionManager])
  {
    v5 = swift_retain(*(_QWORD *)&v4[OBJC_IVAR___RootViewController_adAttributionManager]);
    dispatch thunk of AdAttributionManager.killTimer()(v5);
    swift_release();
  }
  v4[OBJC_IVAR___RootViewController_startedDisappearTransition] = 1;

}

- (void)viewDidDisappear:(BOOL)a3
{
  RootViewController *v4;

  v4 = self;
  sub_100610348(a3);

}

- (void)setupWithClientBundleID:(id)a3 bagType:(int64_t)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  RootViewController *v8;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = v6;
  v8 = self;
  sub_1006148C4(v5, v7);

  swift_bridgeObjectRelease(v7);
}

- (BOOL)lookupItemDidLoad:(id)a3 parameters:(id)a4
{
  uint64_t v6;
  id v7;
  RootViewController *v8;
  id v9;
  void *v10;
  id v11;

  v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  v7 = a3;
  v8 = self;
  v9 = sub_10060F69C(v7, v6);
  sub_100614170();
  v10 = *(void **)&v8->SKProductPageExtension_opaque[OBJC_IVAR___RootViewController_rootViewController];
  *(_QWORD *)&v8->SKProductPageExtension_opaque[OBJC_IVAR___RootViewController_rootViewController] = v9;
  v11 = v9;

  sub_100610428();
  if (qword_100806C80 != -1)
    swift_once(&qword_100806C80, sub_1005A6E64);
  qword_10082C6F8 = (uint64_t)&off_100761DA8;
  swift_unknownObjectWeakAssign();

  swift_bridgeObjectRelease(v6);
  return 0;
}

- (void)setupWithCustomNavigationItem:(id)a3 promptString:(id)a4 askToBuy:(BOOL)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  RootViewController *v12;

  if (a4)
  {
    v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v10 = v9;
  }
  else
  {
    v8 = 0;
    v10 = 0;
  }
  v11 = a3;
  v12 = self;
  sub_1006118B8(v11, v8, v10, a5);

  swift_bridgeObjectRelease(v10);
}

- (void)storeButtonPressed:(id)a3
{
  id v4;
  RootViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100614A54();

}

- (void)setVisibleInClientWindow:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for RootViewController();
  v4 = a3;
  v5 = v6.receiver;
  -[RootViewController setVisibleInClientWindow:](&v6, "setVisibleInClientWindow:", v4);
  sub_10060E84C((char)objc_msgSend(v4, "BOOLValue", v6.receiver, v6.super_class));

}

- (void)setPreview:(id)a3
{
  id v4;
  RootViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100611A80(v4);

}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_release();

  swift_bridgeObjectRelease(*(_QWORD *)&self->SKProductPageExtension_opaque[OBJC_IVAR___RootViewController_currentParameters]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->installAttributionGate[OBJC_IVAR___RootViewController_clientBundleId]);

  sub_100010F2C((uint64_t)&self->SKProductPageExtension_opaque[OBJC_IVAR___RootViewController_flowController], (uint64_t *)&unk_100809510);
  swift_release();
  swift_release();

  swift_bridgeObjectRelease(*(_QWORD *)&self->installAttributionGate[OBJC_IVAR___RootViewController_promptString]);
}

@end
