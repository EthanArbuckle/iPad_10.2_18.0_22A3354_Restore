@implementation ParticipantVideoView

- (_TtC15ConversationKit20ParticipantVideoView)init
{
  return (_TtC15ConversationKit20ParticipantVideoView *)ParticipantVideoView.init()();
}

- (_TtC15ConversationKit20ParticipantVideoView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  ParticipantVideoView.init(coder:)();
}

- (_TtC15ConversationKit20ParticipantVideoView)initWithFrame:(CGRect)a3
{
  ParticipantVideoView.init(frame:)();
}

- (void)layoutSubviews
{
  _TtC15ConversationKit20ParticipantVideoView *v2;

  v2 = self;
  ParticipantVideoView.layoutSubviews()();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit20ParticipantVideoView_frontFacingCameraView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit20ParticipantVideoView_backFacingCameraView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit20ParticipantVideoView_previousVideoSnapshot));
  outlined destroy of ParticipantVideoProvider?((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit20ParticipantVideoView_pendingRegisterVideoLayerForFrontVideoProvider);
  outlined destroy of ParticipantVideoProvider?((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit20ParticipantVideoView_pendingRegisterVideoLayerForBackVideoProvider);
}

@end
