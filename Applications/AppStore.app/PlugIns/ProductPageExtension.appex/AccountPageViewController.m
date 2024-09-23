@implementation AccountPageViewController

- (void)viewWillAppear:(BOOL)a3
{
  sub_1001798E8(self, (uint64_t)a2, a3, (const char **)&selRef_viewWillAppear_, (SEL *)&selRef_beginDelayingNotifications);
}

- (void)viewDidDisappear:(BOOL)a3
{
  sub_1001798E8(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidDisappear_, (SEL *)&selRef_endDelayingNotifications);
}

- (_TtC20ProductPageExtension25AccountPageViewController)initWithAccountURL:(id)a3
{
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSURL *v17;
  void *v18;
  void *v19;
  _TtC20ProductPageExtension25AccountPageViewController *v20;
  objc_super v22;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = sub_10000DAF8((uint64_t *)&unk_1008092A0);
  __chkstk_darwin(v6);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v12 = (char *)&v22 - v11;
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v14 = type metadata accessor for URL(0, v13);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v12, 0, 1, v14);
  }
  else
  {
    v14 = type metadata accessor for URL(0, v10);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v12, 1, 1, v14);
  }
  sub_10005AACC((uint64_t)v12, (uint64_t)v8);
  type metadata accessor for URL(0, v15);
  v16 = *(_QWORD *)(v14 - 8);
  v18 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v8, 1, v14) != 1)
  {
    URL._bridgeToObjectiveC()(v17);
    v18 = v19;
    (*(void (**)(char *, uint64_t))(v16 + 8))(v8, v14);
  }
  v22.receiver = self;
  v22.super_class = ObjectType;
  v20 = -[AccountPageViewController initWithAccountURL:](&v22, "initWithAccountURL:", v18);

  sub_1000A83C0((uint64_t)v12);
  return v20;
}

- (_TtC20ProductPageExtension25AccountPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_class *ObjectType;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC20ProductPageExtension25AccountPageViewController *v12;
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
  v12 = -[AccountPageViewController initWithNibName:bundle:](&v14, "initWithNibName:bundle:", a3, a4);

  return v12;
}

- (_TtC20ProductPageExtension25AccountPageViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self, a2);
  return -[AccountPageViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
