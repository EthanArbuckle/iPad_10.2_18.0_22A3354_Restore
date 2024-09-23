@implementation CoverViewFollowSwitch

- (_TtC8NewsFeed21CoverViewFollowSwitch)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed21CoverViewFollowSwitch *)sub_1BB18D8B4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8NewsFeed21CoverViewFollowSwitch)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  Class v9;
  _TtC8NewsFeed21CoverViewFollowSwitch *result;

  v5 = OBJC_IVAR____TtC8NewsFeed21CoverViewFollowSwitch_titleLabel;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3990]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8NewsFeed21CoverViewFollowSwitch_borderColor) = 0;
  v8 = OBJC_IVAR____TtC8NewsFeed21CoverViewFollowSwitch_onTap;
  sub_1BA563554();
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(v9), sel_init);

  result = (_TtC8NewsFeed21CoverViewFollowSwitch *)sub_1BB873EAC();
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC8NewsFeed21CoverViewFollowSwitch *v6;
  _TtC8NewsFeed21CoverViewFollowSwitch *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  CoverViewFollowSwitch.traitCollectionDidChange(_:)(v8);

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed21CoverViewFollowSwitch_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed21CoverViewFollowSwitch_borderColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed21CoverViewFollowSwitch_onTap));
  v3 = (char *)self + OBJC_IVAR____TtC8NewsFeed21CoverViewFollowSwitch_toggleState;
  v4 = sub_1BB86F658();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
