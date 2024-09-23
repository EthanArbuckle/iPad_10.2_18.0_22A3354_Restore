@implementation ExtensionViewController

- (ExtensionViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (ExtensionViewController *)sub_1003EEA70(v5, v7, a4);
}

- (ExtensionViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1003EF350();
}

- (void)viewDidLoad
{
  id v2;
  id v3;
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v2 = v6.receiver;
  -[ExtensionViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = objc_msgSend(v2, "view", v6.receiver, v6.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend((id)objc_opt_self(UIColor), "clearColor");
    objc_msgSend(v4, "setBackgroundColor:", v5);

  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[ExtensionViewController viewDidAppear:](&v5, "viewDidAppear:", v3);
  dispatch thunk of Gate.Condition.isSatisfied.setter(1);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[ExtensionViewController viewWillAppear:](&v5, "viewWillAppear:", v3);
  sub_1003EEFD4();

}

- (void)setupWithParameters:(id)a3
{
  uint64_t v4;
  ExtensionViewController *v5;

  v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  v5 = self;
  sub_1003EF128(v4);

  swift_bridgeObjectRelease(v4);
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->SKStoreExtension_opaque[OBJC_IVAR___ExtensionViewController_presentationGate]);
  swift_release(*(_QWORD *)&self->SKStoreExtension_opaque[OBJC_IVAR___ExtensionViewController_viewAppeared]);
  swift_release(*(_QWORD *)&self->SKStoreExtension_opaque[OBJC_IVAR___ExtensionViewController_viewControllerConfigured]);
  swift_release(*(_QWORD *)&self->SKStoreExtension_opaque[OBJC_IVAR___ExtensionViewController_didPresentRootViewController]);

}

@end
