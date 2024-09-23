@implementation SearchBar

- (_TtC12MobileSafari9SearchBar)initWithFrame:(CGRect)a3
{
  return (_TtC12MobileSafari9SearchBar *)sub_18BA569B4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12MobileSafari9SearchBar)initWithCoder:(id)a3
{
  return (_TtC12MobileSafari9SearchBar *)sub_18BA56C98(a3);
}

- (void)didReceiveHover:(id)a3
{
  id v4;
  _TtC12MobileSafari9SearchBar *v5;

  v4 = a3;
  v5 = self;
  sub_18BA585EC(v4);

}

- (void)layoutMarginsDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SearchBar();
  v2 = v3.receiver;
  -[SearchBar layoutMarginsDidChange](&v3, sel_layoutMarginsDidChange);
  objc_msgSend(v2, sel_setNeedsUpdateConstraints, v3.receiver, v3.super_class);

}

- (void)layoutSubviews
{
  _TtC12MobileSafari9SearchBar *v2;

  v2 = self;
  sub_18BA587A0();

}

- (void)updateConstraints
{
  _TtC12MobileSafari9SearchBar *v2;

  v2 = self;
  sub_18BA588C4();

}

- (BOOL)becomeFirstResponder
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC12MobileSafari9SearchBar_searchField), sel_becomeFirstResponder);
}

- (void)textFieldDidBeginEditing:(id)a3
{
  sub_18BA58C40((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC12MobileSafari9SearchBar_didBeginSearching);
}

- (void)textFieldDidEndEditing:(id)a3
{
  sub_18BA58C40((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC12MobileSafari9SearchBar_didEndEditing);
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  uint64_t (*v4)(uint64_t);
  id v5;
  _TtC12MobileSafari9SearchBar *v6;
  uint64_t v7;
  char v8;

  if (*((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC12MobileSafari9SearchBar_isEnabled) == 1)
  {
    v4 = *(uint64_t (**)(uint64_t))((char *)&self->super.super.super.isa
                                           + OBJC_IVAR____TtC12MobileSafari9SearchBar_shouldBeginSearching);
    v5 = a3;
    v6 = self;
    v7 = sub_18BABFBB4();
    v8 = v4(v7);

    swift_release();
  }
  else
  {
    v8 = 0;
  }
  return v8 & 1;
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  objc_msgSend(a3, sel_resignFirstResponder);
  return 0;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari9SearchBar_searchFieldBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari9SearchBar____lazy_storage___searchFieldBackgroundToDoneButtonConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari9SearchBar____lazy_storage___searchFieldHeightConstraint));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari9SearchBar____lazy_storage___blurRadius));
}

@end
