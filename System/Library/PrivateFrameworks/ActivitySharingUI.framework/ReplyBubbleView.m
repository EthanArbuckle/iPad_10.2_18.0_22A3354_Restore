@implementation ReplyBubbleView

- (_TtC17ActivitySharingUI15ReplyBubbleView)initWithFrame:(CGRect)a3
{
  _TtC17ActivitySharingUI15ReplyBubbleView *result;

  *(_QWORD *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_delegate) = 0;
  swift_unknownObjectWeakInit();

  result = (_TtC17ActivitySharingUI15ReplyBubbleView *)sub_226B5D2F4();
  __break(1u);
  return result;
}

- (_TtC17ActivitySharingUI15ReplyBubbleView)initWithCoder:(id)a3
{
  id v5;
  _TtC17ActivitySharingUI15ReplyBubbleView *result;

  *(_QWORD *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_delegate) = 0;
  swift_unknownObjectWeakInit();
  v5 = a3;

  result = (_TtC17ActivitySharingUI15ReplyBubbleView *)sub_226B5D2F4();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC17ActivitySharingUI15ReplyBubbleView *v2;

  v2 = self;
  ReplyBubbleView.layoutSubviews()();

}

- (void).cxx_destruct
{
  sub_226B588C0((uint64_t)self + OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_userMessageLabel));
  sub_226B4DE60((uint64_t)self + OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_reply);
}

@end
