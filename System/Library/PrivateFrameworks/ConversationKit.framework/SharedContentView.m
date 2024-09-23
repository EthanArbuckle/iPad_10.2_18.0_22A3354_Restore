@implementation SharedContentView

- (_TtC15ConversationKit17SharedContentView)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKit17SharedContentView *)SharedContentView.init(frame:)();
}

- (_TtC15ConversationKit17SharedContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  SharedContentView.init(coder:)();
}

- (void)layoutSubviews
{
  _TtC15ConversationKit17SharedContentView *v2;

  v2 = self;
  SharedContentView.layoutSubviews()();

}

- (CGRect)convertRect:(CGRect)a3 toCoordinateSpace:(id)a4
{
  _TtC15ConversationKit17SharedContentView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  swift_unknownObjectRetain();
  v6 = self;
  SharedContentView.convert(_:to:)((uint64_t)a4);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  swift_unknownObjectRelease();

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit17SharedContentView_contentView));
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit17SharedContentView_videoViewSnapshot);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit17SharedContentView_videoView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit17SharedContentView_videoOverlayView);
  v3 = (char *)self + OBJC_IVAR____TtC15ConversationKit17SharedContentView_loggingIdentifier;
  v4 = OUTLINED_FUNCTION_33_0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit17SharedContentView_participantIdentifier, (uint64_t *)&demangling cache variable for type metadata for UUID?);
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit17SharedContentView_delegate);
}

@end
