@implementation SharePlayWelcomeViewController

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SharePlayWelcomeViewController();
  v2 = v3.receiver;
  -[SharePlayWelcomeViewController viewDidLoad](&v3, "viewDidLoad");
  sub_100006088();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  _BYTE v5[24];
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for SharePlayWelcomeViewController();
  v4 = v7.receiver;
  -[SharePlayWelcomeViewController viewDidAppear:](&v7, "viewDidAppear:", v3);
  if (qword_100010CB0 != -1)
    swift_once(&qword_100010CB0, sub_1000054E8);
  v6 = &type metadata for Bool;
  v5[0] = 0;
  sub_100005540((uint64_t)v5);
  sub_10000693C((uint64_t)v5, &qword_100010DA0);

}

- (void)viewWillLayoutSubviews
{
  _TtC18RemotePeoplePicker30SharePlayWelcomeViewController *v2;

  v2 = self;
  sub_100005F60();

}

- (void)didTapContinueButton
{
  _TtC18RemotePeoplePicker30SharePlayWelcomeViewController *v2;

  v2 = self;
  sub_100006370();

}

- (_TtC18RemotePeoplePicker30SharePlayWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  v11 = v9;
  if (!a4)
  {
    v12 = 0;
    if (a5)
      goto LABEL_3;
LABEL_5:
    v13 = 0;
    v15 = 0;
    return (_TtC18RemotePeoplePicker30SharePlayWelcomeViewController *)sub_100006444(v10, v11, (uint64_t)a4, v12, v13, v15, a6);
  }
  a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4, v9);
  v12 = v9;
  if (!a5)
    goto LABEL_5;
LABEL_3:
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5, v9);
  v15 = v14;
  return (_TtC18RemotePeoplePicker30SharePlayWelcomeViewController *)sub_100006444(v10, v11, (uint64_t)a4, v12, v13, v15, a6);
}

- (_TtC18RemotePeoplePicker30SharePlayWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  v11 = v9;
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4, v9);
    v13 = v12;
  }
  else
  {
    v13 = 0;
  }
  v14 = a5;
  return (_TtC18RemotePeoplePicker30SharePlayWelcomeViewController *)sub_100006618(v10, v11, (uint64_t)a4, v13, a5, a6);
}

- (void).cxx_destruct
{
  sub_10000693C((uint64_t)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController_delegate], (uint64_t *)&unk_100010F00);

  swift_bridgeObjectRelease(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC18RemotePeoplePicker30SharePlayWelcomeViewController____lazy_storage___onboardingImageAssetName]);
}

@end
