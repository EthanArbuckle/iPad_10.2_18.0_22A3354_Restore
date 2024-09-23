@implementation SystemApertureNoticeView

- (_TtC15ConversationKit24SystemApertureNoticeView)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKit24SystemApertureNoticeView *)SystemApertureNoticeView.init(frame:)();
}

- (_TtC15ConversationKit24SystemApertureNoticeView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  SystemApertureNoticeView.init(coder:)();
}

- (void)layoutSubviews
{
  _TtC15ConversationKit24SystemApertureNoticeView *v2;

  v2 = self;
  SystemApertureNoticeView.layoutSubviews()();

}

- (void).cxx_destruct
{
  outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit24SystemApertureNoticeView_fullSentence, (uint64_t *)&demangling cache variable for type metadata for AttributedString?);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit24SystemApertureNoticeView_trailingButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit24SystemApertureNoticeView_leadingContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit24SystemApertureNoticeView_titleView));
}

@end
