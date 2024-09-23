@implementation FBAActionControllerAction

- (NSString)title
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->title[OBJC_IVAR____TtC18Feedback_Assistant25FBAActionControllerAction_title];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC18Feedback_Assistant25FBAActionControllerAction_title);
  v6 = *(_QWORD *)&self->title[OBJC_IVAR____TtC18Feedback_Assistant25FBAActionControllerAction_title];
  *v5 = v4;
  v5[1] = v7;
  swift_bridgeObjectRelease(v6);
}

- (UIImage)image
{
  return (UIImage *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC18Feedback_Assistant25FBAActionControllerAction_image));
}

- (void)setImage:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant25FBAActionControllerAction_image);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant25FBAActionControllerAction_image) = (Class)a3;
  v3 = a3;

}

- (BOOL)destructive
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant25FBAActionControllerAction_destructive);
}

- (void)setDestructive:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant25FBAActionControllerAction_destructive) = a3;
}

- (id)actionHandler
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[5];
  uint64_t v7;

  v2 = *(_QWORD *)&self->title[OBJC_IVAR____TtC18Feedback_Assistant25FBAActionControllerAction_actionHandler];
  v6[4] = *(Class *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC18Feedback_Assistant25FBAActionControllerAction_actionHandler);
  v7 = v2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256;
  v6[2] = sub_100065444;
  v6[3] = &unk_1000E9990;
  v3 = _Block_copy(v6);
  v4 = v7;
  swift_retain(v2);
  swift_release(v4);
  return v3;
}

- (void)setActionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t (**v6)();
  uint64_t v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1000E9978, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC18Feedback_Assistant25FBAActionControllerAction_actionHandler);
  v7 = *(_QWORD *)&self->title[OBJC_IVAR____TtC18Feedback_Assistant25FBAActionControllerAction_actionHandler];
  *v6 = sub_100072DC8;
  v6[1] = (uint64_t (*)())v5;
  swift_release(v7);
}

- (_TtC18Feedback_Assistant25FBAActionControllerAction)initWithTitle:(id)a3 image:(id)a4 actionHandler:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _TtC18Feedback_Assistant25FBAActionControllerAction *v13;

  v7 = _Block_copy(a5);
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = v9;
  v11 = swift_allocObject(&unk_1000E9950, 24, 7);
  *(_QWORD *)(v11 + 16) = v7;
  v12 = a4;
  v13 = (_TtC18Feedback_Assistant25FBAActionControllerAction *)sub_1000729DC(v8, v10, a4, (uint64_t)sub_100072DC8, v11);

  swift_release(v11);
  return v13;
}

- (_TtC18Feedback_Assistant25FBAActionControllerAction)init
{
  _TtC18Feedback_Assistant25FBAActionControllerAction *result;

  result = (_TtC18Feedback_Assistant25FBAActionControllerAction *)_swift_stdlib_reportUnimplementedInitializer("Feedback_Assistant.FBAActionControllerAction", 44, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->title[OBJC_IVAR____TtC18Feedback_Assistant25FBAActionControllerAction_title]);

  swift_release(*(_QWORD *)&self->title[OBJC_IVAR____TtC18Feedback_Assistant25FBAActionControllerAction_actionHandler]);
}

@end
