@implementation ActionActivity

- (NSString)activityType
{
  _TtC20ProductPageExtensionP33_FDFF98F3DEFBD62812CE468C53A31FA514ActionActivity *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  ShareSheetAction.Activity.activityType.getter();
  v4 = v3;
  v5 = String._bridgeToObjectiveC()();

  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (NSString)activityTitle
{
  _TtC20ProductPageExtensionP33_FDFF98F3DEFBD62812CE468C53A31FA514ActionActivity *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  NSString v7;

  v2 = self;
  v3 = ShareSheetAction.Activity.action.getter();
  Action.title.getter();
  v5 = v4;
  swift_release(v3);

  if (v5)
    v6 = v5;
  else
    v6 = 0xE000000000000000;
  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  return (NSString *)v7;
}

- (UIImage)activityImage
{
  _TtC20ProductPageExtensionP33_FDFF98F3DEFBD62812CE468C53A31FA514ActionActivity *v2;
  id v3;

  v2 = self;
  v3 = sub_10005AD08();

  return (UIImage *)v3;
}

- (id)_systemImageName
{
  _TtC20ProductPageExtensionP33_FDFF98F3DEFBD62812CE468C53A31FA514ActionActivity *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;

  v2 = self;
  v3 = ShareSheetAction.Activity.action.getter();
  v4 = Action.artwork.getter();
  v5 = swift_release(v3);
  if (!v4)
  {

    goto LABEL_7;
  }
  if ((dispatch thunk of Artwork.isSystemImage.getter(v5) & 1) == 0)
  {

    swift_release(v4);
    goto LABEL_7;
  }
  dispatch thunk of Artwork.systemImageName.getter();
  v7 = v6;
  swift_release(v4);

  if (!v7)
  {
LABEL_7:
    v8 = 0;
    return v8;
  }
  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  return v8;
}

- (void)performActivity
{
  _TtC20ProductPageExtensionP33_FDFF98F3DEFBD62812CE468C53A31FA514ActionActivity *v2;

  v2 = self;
  sub_10005AE70();

}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (_TtC20ProductPageExtensionP33_FDFF98F3DEFBD62812CE468C53A31FA514ActionActivity)init
{
  _TtC20ProductPageExtensionP33_FDFF98F3DEFBD62812CE468C53A31FA514ActionActivity *result;

  result = (_TtC20ProductPageExtensionP33_FDFF98F3DEFBD62812CE468C53A31FA514ActionActivity *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.ActionActivity", 35, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self
     + OBJC_IVAR____TtC20ProductPageExtensionP33_FDFF98F3DEFBD62812CE468C53A31FA514ActionActivity_activity;
  v4 = type metadata accessor for ShareSheetAction.Activity(0, a2);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC20ProductPageExtensionP33_FDFF98F3DEFBD62812CE468C53A31FA514ActionActivity_responder);
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC20ProductPageExtensionP33_FDFF98F3DEFBD62812CE468C53A31FA514ActionActivity_objectGraph));
}

@end
