@implementation AccountPageViewController

- (void)viewWillAppear:(BOOL)a3
{
  sub_1003C0108(self, (uint64_t)a2, a3, (const char **)&selRef_viewWillAppear_, (SEL *)&selRef_beginDelayingNotifications);
}

- (void)viewDidDisappear:(BOOL)a3
{
  sub_1003C0108(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidDisappear_, (SEL *)&selRef_endDelayingNotifications);
}

- (_TtC8AppStore25AccountPageViewController)initWithAccountURL:(id)a3
{
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  NSURL *v14;
  void *v15;
  void *v16;
  _TtC8AppStore25AccountPageViewController *v17;
  objc_super v19;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = sub_10007B804((uint64_t *)&unk_10083AFC0);
  __chkstk_darwin(v6);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v11 = (char *)&v19 - v10;
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v12 = type metadata accessor for URL(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    v12 = type metadata accessor for URL(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  }
  sub_100075EF8((uint64_t)v11, (uint64_t)v8);
  type metadata accessor for URL(0);
  v13 = *(_QWORD *)(v12 - 8);
  v15 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v8, 1, v12) != 1)
  {
    URL._bridgeToObjectiveC()(v14);
    v15 = v16;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v12);
  }
  v19.receiver = self;
  v19.super_class = ObjectType;
  v17 = -[AccountPageViewController initWithAccountURL:](&v19, "initWithAccountURL:", v15);

  sub_100075EB8((uint64_t)v11);
  return v17;
}

- (_TtC8AppStore25AccountPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_class *ObjectType;
  uint64_t v8;
  uint64_t v9;
  id v10;
  double v11;
  id v12;
  _TtC8AppStore25AccountPageViewController *v13;
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
  v13 = -[AccountPageViewController initWithNibName:bundle:](&v15, "initWithNibName:bundle:", a3, a4, v11);

  return v13;
}

- (_TtC8AppStore25AccountPageViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self, a2);
  return -[AccountPageViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
