@implementation SendMenuCollectionViewCell

- (_TtC7ChatKit26SendMenuCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC7ChatKit26SendMenuCollectionViewCell *)SendMenuCollectionViewCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SendMenuCollectionViewCell();
  v4 = a3;
  v5 = v6.receiver;
  -[SendMenuCollectionViewCell traitCollectionDidChange:](&v6, sel_traitCollectionDidChange_, v4);
  sub_18E60B5F0();
  sub_18E60D274();

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v8;
  _TtC7ChatKit26SendMenuCollectionViewCell *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_18E60C4AC((uint64_t)a4, x, y);

  return v10;
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC7ChatKit26SendMenuCollectionViewCell *v8;
  uint64_t v9;

  v4 = sub_18E7667DC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18E7667D0();
  v8 = self;
  sub_18E60C6F8((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (CGRect)accessibilityFrame
{
  _TtC7ChatKit26SendMenuCollectionViewCell *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v2 = self;
  sub_18E60C308();
  -[SendMenuCollectionViewCell convertRect:toView:](v2, sel_convertRect_toView_, 0);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (_TtC7ChatKit26SendMenuCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_18E610CCC();
}

- (void)layoutSubviews
{
  _TtC7ChatKit26SendMenuCollectionViewCell *v2;

  v2 = self;
  sub_18E60D8CC();

}

- (CGPoint)center
{
  double v2;
  double v3;
  objc_super v4;
  CGPoint result;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SendMenuCollectionViewCell();
  -[SendMenuCollectionViewCell center](&v4, sel_center);
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  double y;
  double x;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t ObjectType;
  objc_super v9;

  y = a3.y;
  x = a3.x;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for SendMenuCollectionViewCell();
  v5 = (char *)v9.receiver;
  -[SendMenuCollectionViewCell setCenter:](&v9, sel_setCenter_, x, y);
  v6 = &v5[OBJC_IVAR____TtC7ChatKit26SendMenuCollectionViewCell_sendMenuCellDelegate];
  swift_beginAccess();
  if (MEMORY[0x193FF501C](v6))
  {
    v7 = *((_QWORD *)v6 + 1);
    ObjectType = swift_getObjectType();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 8))(v5, ObjectType, v7);

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

- (void)prepareForReuse
{
  _TtC7ChatKit26SendMenuCollectionViewCell *v2;

  v2 = self;
  sub_18E60FF2C();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit26SendMenuCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit26SendMenuCollectionViewCell_titleBlurContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit26SendMenuCollectionViewCell_iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit26SendMenuCollectionViewCell_iconBlurContainerView));
  sub_18E522F74((uint64_t)self + OBJC_IVAR____TtC7ChatKit26SendMenuCollectionViewCell_sendMenuCellDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit26SendMenuCollectionViewCell_iconWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit26SendMenuCollectionViewCell_iconHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit26SendMenuCollectionViewCell_iconToEdgeHorizontalConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit26SendMenuCollectionViewCell_iconToLabelHorizontalConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit26SendMenuCollectionViewCell_iconToTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit26SendMenuCollectionViewCell_iconToBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit26SendMenuCollectionViewCell_sendMenuItemImageForLightMode));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit26SendMenuCollectionViewCell_sendMenuCustomIconLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit26SendMenuCollectionViewCell_sendMenuItemImageForDarkMode));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit26SendMenuCollectionViewCell_sendMenuItemImageCompositingFilterForLightMode));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit26SendMenuCollectionViewCell_sendMenuItemImageCompositingFilterForDarkMode));
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6;
  id v7;
  _TtC7ChatKit26SendMenuCollectionViewCell *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)_s7ChatKit26SendMenuCollectionViewCellC18pointerInteraction_8styleForSo14UIPointerStyleCSgSo0lI0C_So0L6RegionCtF_0();

  return v9;
}

@end
