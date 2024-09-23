@implementation ComposeReviewViewController

- (void)viewWillAppear:(BOOL)a3
{
  sub_1003C0108(self, (uint64_t)a2, a3, (const char **)&selRef_viewWillAppear_, (SEL *)&selRef_beginDelayingNotifications);
}

- (void)viewDidDisappear:(BOOL)a3
{
  sub_1003C0108(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidDisappear_, (SEL *)&selRef_endDelayingNotifications);
}

- (_TtC8AppStore27ComposeReviewViewController)initWithCompositionURL:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v4 = sub_10007B804((uint64_t *)&unk_10083AFC0);
  __chkstk_darwin(v4);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = type metadata accessor for URL(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 0, 1, v7);
  }
  else
  {
    v8 = type metadata accessor for URL(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v6, 1, 1, v8);
  }
  return (_TtC8AppStore27ComposeReviewViewController *)sub_1003C0198((uint64_t)v6);
}

- (_TtC8AppStore27ComposeReviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_class *ObjectType;
  uint64_t v8;
  uint64_t v9;
  id v10;
  double v11;
  id v12;
  _TtC8AppStore27ComposeReviewViewController *v13;
  objc_super v15;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v9 = v8;
    v10 = a4;
    a3 = String._bridgeToObjectiveC()();
    *(_QWORD *)&v11 = swift_bridgeObjectRelease(v9).n128_u64[0];
  }
  else
  {
    v12 = a4;
  }
  v15.receiver = self;
  v15.super_class = ObjectType;
  v13 = -[ComposeReviewViewController initWithNibName:bundle:](&v15, "initWithNibName:bundle:", a3, a4, v11);

  return v13;
}

- (_TtC8AppStore27ComposeReviewViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self, a2);
  return -[ComposeReviewViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
