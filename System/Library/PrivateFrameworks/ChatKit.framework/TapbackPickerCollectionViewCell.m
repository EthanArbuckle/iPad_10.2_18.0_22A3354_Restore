@implementation TapbackPickerCollectionViewCell

- (BOOL)isSelected
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TapbackPickerCollectionViewCell();
  return -[TapbackPickerCollectionViewCell isSelected](&v3, sel_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TapbackPickerCollectionViewCell();
  v4 = v5.receiver;
  -[TapbackPickerCollectionViewCell setSelected:](&v5, sel_setSelected_, v3);
  objc_msgSend(v4, sel_setNeedsLayout, v5.receiver, v5.super_class);

}

- (_TtC7ChatKit31TapbackPickerCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC7ChatKit31TapbackPickerCollectionViewCell *)TapbackPickerCollectionViewCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  _TtC7ChatKit31TapbackPickerCollectionViewCell *v2;

  v2 = self;
  sub_18E6A5D2C();

}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC7ChatKit31TapbackPickerCollectionViewCell *v8;
  uint64_t v9;

  v4 = sub_18E7667DC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18E7667D0();
  v8 = self;
  sub_18E6A5EEC();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC7ChatKit31TapbackPickerCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_18E6A86C8();
}

- (CGPoint)center
{
  double v2;
  double v3;
  objc_super v4;
  CGPoint result;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TapbackPickerCollectionViewCell();
  -[TapbackPickerCollectionViewCell center](&v4, sel_center);
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
  void *v7;
  objc_super v8;

  y = a3.y;
  x = a3.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TapbackPickerCollectionViewCell();
  v5 = (char *)v8.receiver;
  -[TapbackPickerCollectionViewCell setCenter:](&v8, sel_setCenter_, x, y);
  v6 = &v5[OBJC_IVAR____TtC7ChatKit31TapbackPickerCollectionViewCell_tapbackPickerCellDelegate];
  swift_beginAccess();
  v7 = (void *)MEMORY[0x193FF501C](v6);
  if (v7)
  {
    objc_msgSend(v7, sel_tapbackPickerCellCenterPointDidChange_, v5);

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

- (void)prepareForReuse
{
  _TtC7ChatKit31TapbackPickerCollectionViewCell *v2;

  v2 = self;
  sub_18E6A74B8();

}

- (CGRect)tapbackContentContainerRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[TapbackPickerCollectionViewCell bounds](self, sel_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit31TapbackPickerCollectionViewCell_tapbackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit31TapbackPickerCollectionViewCell_tapbackBlurContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit31TapbackPickerCollectionViewCell_selectionPlatter));
  sub_18E522F74((uint64_t)self + OBJC_IVAR____TtC7ChatKit31TapbackPickerCollectionViewCell_tapbackPickerCellDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit31TapbackPickerCollectionViewCell_gradientView));
  sub_18E522F74((uint64_t)self + OBJC_IVAR____TtC7ChatKit31TapbackPickerCollectionViewCell_gradientReferenceView);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit31TapbackPickerCollectionViewCell_tapbackViewLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit31TapbackPickerCollectionViewCell_tapbackViewTrailingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit31TapbackPickerCollectionViewCell_tapbackViewTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit31TapbackPickerCollectionViewCell_tapbackViewBottomConstraint));
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6;
  id v7;
  _TtC7ChatKit31TapbackPickerCollectionViewCell *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)_s7ChatKit26SendMenuCollectionViewCellC18pointerInteraction_8styleForSo14UIPointerStyleCSgSo0lI0C_So0L6RegionCtF_0();

  return v9;
}

@end
