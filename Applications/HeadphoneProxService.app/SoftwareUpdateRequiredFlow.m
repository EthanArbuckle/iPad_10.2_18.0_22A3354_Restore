@implementation SoftwareUpdateRequiredFlow

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (**v6)(const void *);
  void (**v7)(const void *);
  void (*v8)(const void *);
  id v9;
  _TtC20HeadphoneProxService26SoftwareUpdateRequiredFlow *v10;

  v6 = (void (**)(const void *))_Block_copy(a4);
  if (v6)
  {
    v7 = v6;
    v8 = v6[2];
    v9 = a3;
    v10 = self;
    v8(v7);
    _Block_release(v7);

  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC20HeadphoneProxService26SoftwareUpdateRequiredFlow *v4;

  v4 = self;
  sub_1000267E8(a3, (uint64_t)v4);

}

- (unint64_t)supportedInterfaceOrientations
{
  return PRXSupportedInterfaceOrientations(self, 0);
}

- (_TtC20HeadphoneProxService26SoftwareUpdateRequiredFlow)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_class *ObjectType;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC20HeadphoneProxService26SoftwareUpdateRequiredFlow *v12;
  objc_super v14;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v9 = v8;
    v10 = a4;
    a3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
  }
  else
  {
    v11 = a4;
  }
  v14.receiver = self;
  v14.super_class = ObjectType;
  v12 = -[SoftwareUpdateRequiredFlow initWithNibName:bundle:](&v14, "initWithNibName:bundle:", a3, a4);

  return v12;
}

- (_TtC20HeadphoneProxService26SoftwareUpdateRequiredFlow)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self, a2);
  return -[SoftwareUpdateRequiredFlow initWithCoder:](&v5, "initWithCoder:", a3);
}

- (void)proxCardFlowDidDismiss
{
  void *v2;
  void *v3;
  _TtC20HeadphoneProxService26SoftwareUpdateRequiredFlow *v4;

  v4 = self;
  v2 = (void *)sub_1000266B8();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "dismiss");

    swift_unknownObjectRelease(v3);
  }
  else
  {

  }
}

@end
