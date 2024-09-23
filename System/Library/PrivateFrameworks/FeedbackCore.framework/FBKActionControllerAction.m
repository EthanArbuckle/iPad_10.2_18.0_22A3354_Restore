@implementation FBKActionControllerAction

- (NSString)title
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_21DAC4810();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setTitle:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;

  v4 = sub_21DAC481C();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12FeedbackCore25FBKActionControllerAction_title);
  *v5 = v4;
  v5[1] = v6;
  swift_bridgeObjectRelease();
}

- (UIImage)image
{
  return (UIImage *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC12FeedbackCore25FBKActionControllerAction_image));
}

- (void)setImage:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12FeedbackCore25FBKActionControllerAction_image);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12FeedbackCore25FBKActionControllerAction_image) = (Class)a3;
  v3 = a3;

}

- (BOOL)destructive
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC12FeedbackCore25FBKActionControllerAction_destructive);
}

- (void)setDestructive:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC12FeedbackCore25FBKActionControllerAction_destructive) = a3;
}

- (id)actionHandler
{
  uint64_t v2;
  void *v3;
  _QWORD v5[6];

  v2 = *(_QWORD *)&self->title[OBJC_IVAR____TtC12FeedbackCore25FBKActionControllerAction_actionHandler];
  v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12FeedbackCore25FBKActionControllerAction_actionHandler);
  v5[5] = v2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 1107296256;
  v5[2] = sub_21DA60C54;
  v5[3] = &block_descriptor_5;
  v3 = _Block_copy(v5);
  swift_retain();
  swift_release();
  return v3;
}

- (void)setActionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t (**v6)();

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC12FeedbackCore25FBKActionControllerAction_actionHandler);
  *v6 = sub_21DA637D4;
  v6[1] = (uint64_t (*)())v5;
  swift_release();
}

- (_TtC12FeedbackCore25FBKActionControllerAction)initWithTitle:(id)a3 image:(id)a4 actionHandler:(id)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC12FeedbackCore25FBKActionControllerAction *v12;

  v6 = _Block_copy(a5);
  v7 = sub_21DAC481C();
  v9 = v8;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v6;
  v11 = a4;
  v12 = (_TtC12FeedbackCore25FBKActionControllerAction *)sub_21DA633C8(v7, v9, a4, (uint64_t)sub_21DA637D4, v10);

  swift_release();
  return v12;
}

- (_TtC12FeedbackCore25FBKActionControllerAction)init
{
  _TtC12FeedbackCore25FBKActionControllerAction *result;

  result = (_TtC12FeedbackCore25FBKActionControllerAction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();
}

@end
