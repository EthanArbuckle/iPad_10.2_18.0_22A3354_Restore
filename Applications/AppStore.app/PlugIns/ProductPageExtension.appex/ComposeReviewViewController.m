@implementation ComposeReviewViewController

- (void)viewWillAppear:(BOOL)a3
{
  sub_1001798E8(self, (uint64_t)a2, a3, (const char **)&selRef_viewWillAppear_, (SEL *)&selRef_beginDelayingNotifications);
}

- (void)viewDidDisappear:(BOOL)a3
{
  sub_1001798E8(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidDisappear_, (SEL *)&selRef_endDelayingNotifications);
}

- (_TtC20ProductPageExtension27ComposeReviewViewController)initWithCompositionURL:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v4 = sub_10000DAF8((uint64_t *)&unk_1008092A0);
  __chkstk_darwin(v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v9 = type metadata accessor for URL(0, v8);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 0, 1, v9);
  }
  else
  {
    v10 = type metadata accessor for URL(0, v5);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  }
  return (_TtC20ProductPageExtension27ComposeReviewViewController *)sub_100179978((uint64_t)v7);
}

- (_TtC20ProductPageExtension27ComposeReviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_class *ObjectType;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC20ProductPageExtension27ComposeReviewViewController *v12;
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
  v12 = -[ComposeReviewViewController initWithNibName:bundle:](&v14, "initWithNibName:bundle:", a3, a4);

  return v12;
}

- (_TtC20ProductPageExtension27ComposeReviewViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self, a2);
  return -[ComposeReviewViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
