@implementation ConversationHUDEphemeralNotice

- (_TtC15ConversationKit30ConversationHUDEphemeralNotice)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  ConversationHUDEphemeralNotice.init(coder:)();
}

- (void)didTapEphemeralAlertStack
{
  _TtC15ConversationKit30ConversationHUDEphemeralNotice *v2;

  v2 = self;
  ConversationHUDEphemeralNotice.didTapEphemeralAlertStack()();

}

- (_TtC15ConversationKit30ConversationHUDEphemeralNotice)initWithFrame:(CGRect)a3
{
  ConversationHUDEphemeralNotice.init(frame:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit30ConversationHUDEphemeralNotice_controlsManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit30ConversationHUDEphemeralNotice____lazy_storage___ephemeralAlertStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit30ConversationHUDEphemeralNotice____lazy_storage___ephemeralAlertTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit30ConversationHUDEphemeralNotice____lazy_storage___ephemeralAlertSubtitleLabel));
}

@end
