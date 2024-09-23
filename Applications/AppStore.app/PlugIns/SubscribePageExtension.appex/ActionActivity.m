@implementation ActionActivity

- (NSString)activityType
{
  _TtC22SubscribePageExtensionP33_932442DA714B10A6559014343396A9F814ActionActivity *v2;
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
  _TtC22SubscribePageExtensionP33_932442DA714B10A6559014343396A9F814ActionActivity *v2;
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
  _TtC22SubscribePageExtensionP33_932442DA714B10A6559014343396A9F814ActionActivity *v2;
  id v3;

  v2 = self;
  v3 = sub_1000F75BC();

  return (UIImage *)v3;
}

- (id)_systemImageName
{
  _TtC22SubscribePageExtensionP33_932442DA714B10A6559014343396A9F814ActionActivity *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSString v9;

  v2 = self;
  v3 = ShareSheetAction.Activity.action.getter();
  v4 = Action.artwork.getter(v3);
  v5 = swift_release(v3);
  if (!v4)
  {

    goto LABEL_7;
  }
  v6 = dispatch thunk of Artwork.isSystemImage.getter(v5);
  if ((v6 & 1) == 0)
  {

    swift_release(v4);
    goto LABEL_7;
  }
  dispatch thunk of Artwork.systemImageName.getter(v6);
  v8 = v7;
  swift_release(v4);

  if (!v8)
  {
LABEL_7:
    v9 = 0;
    return v9;
  }
  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v8);
  return v9;
}

- (void)performActivity
{
  _TtC22SubscribePageExtensionP33_932442DA714B10A6559014343396A9F814ActionActivity *v2;

  v2 = self;
  sub_1000F7724();

}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (_TtC22SubscribePageExtensionP33_932442DA714B10A6559014343396A9F814ActionActivity)init
{
  _TtC22SubscribePageExtensionP33_932442DA714B10A6559014343396A9F814ActionActivity *result;

  result = (_TtC22SubscribePageExtensionP33_932442DA714B10A6559014343396A9F814ActionActivity *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.ActionActivity", 37, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self
     + OBJC_IVAR____TtC22SubscribePageExtensionP33_932442DA714B10A6559014343396A9F814ActionActivity_activity;
  v4 = type metadata accessor for ShareSheetAction.Activity(0, a2);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectWeakDestroy((char *)self+ OBJC_IVAR____TtC22SubscribePageExtensionP33_932442DA714B10A6559014343396A9F814ActionActivity_responder);
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtensionP33_932442DA714B10A6559014343396A9F814ActionActivity_objectGraph));
}

@end
