@implementation ParticipantContactView

- (_TtC15ConversationKit22ParticipantContactView)init
{
  ParticipantContactView.init()();
}

- (_TtC15ConversationKit22ParticipantContactView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  ParticipantContactView.init(coder:)();
}

- (_TtC15ConversationKit22ParticipantContactView)initWithFrame:(CGRect)a3
{
  ParticipantContactView.init(frame:)();
}

- (void)layoutSubviews
{
  _TtC15ConversationKit22ParticipantContactView *v2;

  v2 = self;
  ParticipantContactView.layoutSubviews()();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22ParticipantContactView_gradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22ParticipantContactView_contactMonogram));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22ParticipantContactView_contactImageView));
  outlined consume of ParticipantContactDetails?(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC15ConversationKit22ParticipantContactView_contactDetails), *(_QWORD *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC15ConversationKit22ParticipantContactView_contactDetails), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC15ConversationKit22ParticipantContactView_contactDetails));
}

@end
