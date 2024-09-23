@implementation AmbientAvatarView

- (CNContact)contact
{
  return (CNContact *)AmbientAvatarView.contact.getter();
}

- (void)setContact:(id)a3
{
  id v4;
  _TtC13InCallService17AmbientAvatarView *v5;

  v4 = a3;
  v5 = self;
  AmbientAvatarView.contact.setter(v4);

}

- (_TtC13InCallService17AmbientAvatarView)initWithContact:(id)a3
{
  return (_TtC13InCallService17AmbientAvatarView *)AmbientAvatarView.init(contact:)(a3);
}

- (_TtC13InCallService17AmbientAvatarView)initWithCoder:(id)a3
{
  sub_100124F1C();
}

- (_TtC13InCallService17AmbientAvatarView)initWithFrame:(CGRect)a3
{
  AmbientAvatarView.init(frame:)();
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13InCallService17AmbientAvatarView_avatarView));
}

@end
