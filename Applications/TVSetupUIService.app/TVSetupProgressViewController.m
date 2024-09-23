@implementation TVSetupProgressViewController

- (void)viewDidLoad
{
  _TtC16TVSetupUIService29TVSetupProgressViewController *v2;

  v2 = self;
  sub_100007CE8();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSString v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TVSetupProgressViewController();
  v4 = v8.receiver;
  -[TVSetupProgressViewController viewWillAppear:](&v8, "viewWillAppear:", v3);
  sub_100011608(0x5F474E4954544553, (void *)0xEA00000000005055);
  v6 = v5;
  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  objc_msgSend(v4, "showActivityIndicatorWithStatus:", v7, v8.receiver, v8.super_class);

}

- (_TtC16TVSetupUIService29TVSetupProgressViewController)initWithContentView:(id)a3
{
  objc_super v5;

  *(_WORD *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16TVSetupUIService29TVSetupProgressViewController_deviceModelCode] = 256;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TVSetupProgressViewController();
  return -[TVSetupProgressViewController initWithContentView:](&v5, "initWithContentView:", a3);
}

@end
