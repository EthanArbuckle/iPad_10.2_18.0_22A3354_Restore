@implementation MessageActionsViewController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for MessageActionsViewController();
  v4 = v8.receiver;
  -[MessageActionsViewController viewWillAppear:](&v8, "viewWillAppear:", v3);
  v5 = type metadata accessor for LocalPlayerAuthenticator();
  if (*(_BYTE *)(swift_initStaticObject(v5, &unk_100058760) + 16) == 2)
  {

  }
  else
  {
    v6 = swift_allocObject(&unk_1000519F8, 24, 7);
    *(_QWORD *)(v6 + 16) = v4;
    v7 = v4;
    sub_100013194(sub_1000064A8);

    swift_release(v6);
  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v4;
  int v5;

  v4 = a3;
  v5 = byte_100058770;

  return v5 == 2;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  _TtC26GameCenterMessageExtension28MessageActionsViewController *v17;
  void *v18;
  uint64_t v20;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin();
  v12 = (unint64_t *)((char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v15 = v14;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v16 = a3;
  v17 = self;
  v18 = (void *)sub_100006090((uint64_t)v16, v13, v15, v12);

  swift_bridgeObjectRelease(v15);
  (*(void (**)(unint64_t *, uint64_t))(v10 + 8))(v12, v9);
  return v18;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC26GameCenterMessageExtension28MessageActionsViewController *v12;
  char *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin();
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = sub_1000062CC();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (uint64_t)collectionView:(uint64_t)a3 shouldHighlightItemAtIndexPath:(uint64_t)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v5 = type metadata accessor for IndexPath(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  _TtC26GameCenterMessageExtension28MessageActionsViewController *v13;
  uint64_t v14;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR____TtC26GameCenterMessageExtension28MessageActionsViewController_delegate);
  if (v11)
  {
    v12 = a3;
    v13 = self;
    swift_unknownObjectRetain(v11, v14);
    sub_10002FD14();

    swift_unknownObjectRelease(v11);
  }
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (_TtC26GameCenterMessageExtension28MessageActionsViewController)initWithCollectionViewLayout:(id)a3
{
  _QWORD *v5;
  objc_class *v6;
  objc_super v8;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC26GameCenterMessageExtension28MessageActionsViewController_localPlayer) = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC26GameCenterMessageExtension28MessageActionsViewController_delegate);
  v6 = (objc_class *)type metadata accessor for MessageActionsViewController();
  *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[MessageActionsViewController initWithCollectionViewLayout:](&v8, "initWithCollectionViewLayout:", a3);
}

- (_TtC26GameCenterMessageExtension28MessageActionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  NSString v10;
  _QWORD *v11;
  id v12;
  _TtC26GameCenterMessageExtension28MessageActionsViewController *v13;
  objc_super v15;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC26GameCenterMessageExtension28MessageActionsViewController_localPlayer) = 0;
    v8 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC26GameCenterMessageExtension28MessageActionsViewController_delegate);
    *v8 = 0;
    v8[1] = 0;
    v9 = a4;
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC26GameCenterMessageExtension28MessageActionsViewController_localPlayer) = 0;
    v11 = (Class *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC26GameCenterMessageExtension28MessageActionsViewController_delegate);
    *v11 = 0;
    v11[1] = 0;
    v12 = a4;
    v10 = 0;
  }
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for MessageActionsViewController();
  v13 = -[MessageActionsViewController initWithNibName:bundle:](&v15, "initWithNibName:bundle:", v10, a4);

  return v13;
}

- (_TtC26GameCenterMessageExtension28MessageActionsViewController)initWithCoder:(id)a3
{
  _QWORD *v5;
  objc_class *v6;
  objc_super v8;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC26GameCenterMessageExtension28MessageActionsViewController_localPlayer) = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC26GameCenterMessageExtension28MessageActionsViewController_delegate);
  v6 = (objc_class *)type metadata accessor for MessageActionsViewController();
  *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[MessageActionsViewController initWithCoder:](&v8, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26GameCenterMessageExtension28MessageActionsViewController_localPlayer));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC26GameCenterMessageExtension28MessageActionsViewController_delegate));
}

@end
