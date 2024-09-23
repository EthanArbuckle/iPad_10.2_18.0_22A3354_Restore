@implementation ParticipantCell

- (_TtC15ConversationKit15ParticipantView)participantView
{
  return (_TtC15ConversationKit15ParticipantView *)ParticipantCell.participantView.getter();
}

- (_TtC15ConversationKit15ParticipantCell)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKit15ParticipantCell *)ParticipantCell.init(frame:)();
}

- (_TtC15ConversationKit15ParticipantCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  ParticipantCell.init(coder:)();
}

- (void)prepareForReuse
{
  _TtC15ConversationKit15ParticipantCell *v2;

  v2 = self;
  ParticipantCell.prepareForReuse()();

}

- (NSString)accessibilityDisplayName
{
  uint64_t v2;
  void *v3;

  v2 = ParticipantCell.accessibilityDisplayName.getter();
  v3 = (void *)MEMORY[0x1C3B72E00](v2);
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setAccessibilityDisplayName:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC15ConversationKit15ParticipantCell *v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = v5;
  v7 = self;
  ParticipantCell.accessibilityDisplayName.setter(v4, v6);

}

- (void).cxx_destruct
{
  outlined destroy of UUID?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit15ParticipantCell_participantIdentifier);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit15ParticipantCell_participantView));
  swift_bridgeObjectRelease();
}

@end
