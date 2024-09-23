@implementation CNAvatarPosterPairRemovalView

- (void)prepareForReuse
{
  _TtC10ContactsUI29CNAvatarPosterPairRemovalView *v2;

  v2 = self;
  sub_18ACD6FF8();

}

- (_TtC10ContactsUI29CNAvatarPosterPairRemovalView)initWithFrame:(CGRect)a3
{
  return (_TtC10ContactsUI29CNAvatarPosterPairRemovalView *)sub_18ACD70B8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10ContactsUI29CNAvatarPosterPairRemovalView)initWithCoder:(id)a3
{
  id v5;
  _TtC10ContactsUI29CNAvatarPosterPairRemovalView *result;

  *(_QWORD *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC10ContactsUI29CNAvatarPosterPairRemovalView_delegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10ContactsUI29CNAvatarPosterPairRemovalView_avatarPosterPair) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10ContactsUI29CNAvatarPosterPairRemovalView_deleteButton) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10ContactsUI29CNAvatarPosterPairRemovalView_deleteButtonDimension) = (Class)0x4051000000000000;
  v5 = a3;

  result = (_TtC10ContactsUI29CNAvatarPosterPairRemovalView *)sub_18AF50310();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC10ContactsUI29CNAvatarPosterPairRemovalView *v2;

  v2 = self;
  sub_18ACD7608();

}

- (void).cxx_destruct
{
  sub_18ACD7800((uint64_t)self + OBJC_IVAR____TtC10ContactsUI29CNAvatarPosterPairRemovalView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ContactsUI29CNAvatarPosterPairRemovalView_avatarPosterPair));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ContactsUI29CNAvatarPosterPairRemovalView_deleteButton));
}

@end
