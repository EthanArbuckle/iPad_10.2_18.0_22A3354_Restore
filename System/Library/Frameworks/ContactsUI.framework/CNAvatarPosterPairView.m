@implementation CNAvatarPosterPairView

- (_TtC10ContactsUI22CNAvatarPosterPairView)initWithFrame:(CGRect)a3
{
  return (_TtC10ContactsUI22CNAvatarPosterPairView *)sub_18ACD7A1C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10ContactsUI22CNAvatarPosterPairView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_18ACDA9E8();
}

- (void)dealloc
{
  _TtC10ContactsUI22CNAvatarPosterPairView *v3;
  _TtC10ContactsUI22CNAvatarPosterPairView *v4;
  objc_super v5;

  if (*(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10ContactsUI22CNAvatarPosterPairView_viewModelSubscriber))
  {
    v3 = self;
    swift_retain();
    sub_18AF4EB40();
    swift_release();
  }
  else
  {
    v4 = self;
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CNAvatarPosterPairView();
  -[CNAvatarPosterPairView dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ContactsUI22CNAvatarPosterPairView_viewModel));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ContactsUI22CNAvatarPosterPairView____lazy_storage___sensitiveContentManager));
  sub_18ACCDE68((uint64_t)self + OBJC_IVAR____TtC10ContactsUI22CNAvatarPosterPairView_displaySessionUUID, &qword_1EDF98DD8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ContactsUI22CNAvatarPosterPairView____lazy_storage___posterImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ContactsUI22CNAvatarPosterPairView____lazy_storage___avatarVC));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ContactsUI22CNAvatarPosterPairView____lazy_storage___sensitiveContentBlurView));
}

- (void)layoutSubviews
{
  _TtC10ContactsUI22CNAvatarPosterPairView *v2;

  v2 = self;
  sub_18ACD7EA8();

}

@end
