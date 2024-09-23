@implementation SWClearMessagesAction

- (NSString)collaborationIdentifier
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_18B62A7A4();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (_TtC17SharedWithYouCore21SWClearMessagesAction)initWithCollaborationIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  objc_super v8;

  v4 = sub_18B62A7BC();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC17SharedWithYouCore21SWClearMessagesAction_collaborationIdentifier);
  *v5 = v4;
  v5[1] = v6;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SWClearMessagesAction();
  return -[SWAction init](&v8, sel_init);
}

- (_TtC17SharedWithYouCore21SWClearMessagesAction)initWithCoder:(id)a3
{
  return (_TtC17SharedWithYouCore21SWClearMessagesAction *)sub_18B62A0F8(a3);
}

- (_TtC17SharedWithYouCore21SWClearMessagesAction)init
{
  _TtC17SharedWithYouCore21SWClearMessagesAction *result;

  result = (_TtC17SharedWithYouCore21SWClearMessagesAction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
