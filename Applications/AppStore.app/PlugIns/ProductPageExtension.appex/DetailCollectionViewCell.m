@implementation DetailCollectionViewCell

- (BOOL)isSelected
{
  return sub_10032E714(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  sub_10032E768(self, (uint64_t)a2, a3, (SEL *)&selRef_setSelected_, (SEL *)&selRef_isSelected);
}

- (BOOL)isHighlighted
{
  return sub_10032E714(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  sub_10032E768(self, (uint64_t)a2, a3, (SEL *)&selRef_setHighlighted_, (SEL *)&selRef_isHighlighted);
}

- (_TtC20ProductPageExtension24DetailCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension24DetailCollectionViewCell *)sub_10032E920(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension24DetailCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100330C8C();
}

- (void)wasTapped
{
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  _TtC20ProductPageExtension24DetailCollectionViewCell *v5;

  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC20ProductPageExtension24DetailCollectionViewCell_selectionHandler);
  if (v2)
  {
    v3 = *(_QWORD *)&self->previousTitleTextColor[OBJC_IVAR____TtC20ProductPageExtension24DetailCollectionViewCell_selectionHandler];
    v5 = self;
    v4 = sub_100018918((uint64_t)v2, v3);
    v2(v4);
    sub_100018908((uint64_t)v2, v3);

  }
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension24DetailCollectionViewCell *v2;

  v2 = self;
  sub_10032F314();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC20ProductPageExtension24DetailCollectionViewCell *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_10032FC54(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)didTapWithAccessoryView:(id)a3
{
  void (*v3)(_QWORD *);
  uint64_t v6;
  id v7;
  _TtC20ProductPageExtension24DetailCollectionViewCell *v8;
  _QWORD v9[4];

  v3 = *(void (**)(_QWORD *))((char *)&self->super.super.super.super.super.isa
                                       + OBJC_IVAR____TtC20ProductPageExtension24DetailCollectionViewCell_accessoryAction);
  if (v3)
  {
    v6 = *(_QWORD *)&self->previousTitleTextColor[OBJC_IVAR____TtC20ProductPageExtension24DetailCollectionViewCell_accessoryAction];
    v9[3] = sub_100018B6C(0, &qword_100810F80, UIControl_ptr);
    v9[0] = a3;
    v7 = a3;
    v8 = self;
    sub_100018918((uint64_t)v3, v6);
    v3(v9);
    sub_100018908((uint64_t)v3, v6);
    sub_100010F2C((uint64_t)v9, &qword_100808F20);

  }
}

- (void)prepareForReuse
{
  _TtC20ProductPageExtension24DetailCollectionViewCell *v2;

  v2 = self;
  sub_10032FF6C();

}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension24DetailCollectionViewCell_titleLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension24DetailCollectionViewCell_subtitleLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension24DetailCollectionViewCell_previousTitleTextColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension24DetailCollectionViewCell_previousSubtitleTextColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension24DetailCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension24DetailCollectionViewCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension24DetailCollectionViewCell_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension24DetailCollectionViewCell_accessoryView));
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension24DetailCollectionViewCell_accessory, (uint64_t *)&unk_100808F40);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension24DetailCollectionViewCell_topDivider));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension24DetailCollectionViewCell_bottomDivider));
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension24DetailCollectionViewCell_accessoryAction), *(_QWORD *)&self->previousTitleTextColor[OBJC_IVAR____TtC20ProductPageExtension24DetailCollectionViewCell_accessoryAction]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension24DetailCollectionViewCell_backgroundSelectionView));
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension24DetailCollectionViewCell_selectionHandler), *(_QWORD *)&self->previousTitleTextColor[OBJC_IVAR____TtC20ProductPageExtension24DetailCollectionViewCell_selectionHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension24DetailCollectionViewCell_tapGestureRecognizer));
}

@end
