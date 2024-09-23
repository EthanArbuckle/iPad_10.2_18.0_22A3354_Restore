@implementation AccountDetailCollectionViewCell

- (BOOL)isSelected
{
  return sub_10034CAC8(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  sub_10034CB1C(self, (uint64_t)a2, a3, (SEL *)&selRef_setSelected_, (SEL *)&selRef_isSelected);
}

- (BOOL)isHighlighted
{
  return sub_10034CAC8(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  sub_10034CB1C(self, (uint64_t)a2, a3, (SEL *)&selRef_setHighlighted_, (SEL *)&selRef_isHighlighted);
}

- (_TtC20ProductPageExtension31AccountDetailCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension31AccountDetailCollectionViewCell *)sub_10034CD04(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension31AccountDetailCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10034FAEC();
}

- (void)wasTapped
{
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  _TtC20ProductPageExtension31AccountDetailCollectionViewCell *v5;

  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC20ProductPageExtension31AccountDetailCollectionViewCell_selectionHandler);
  if (v2)
  {
    v3 = *(_QWORD *)&self->titleLabel[OBJC_IVAR____TtC20ProductPageExtension31AccountDetailCollectionViewCell_selectionHandler];
    v5 = self;
    v4 = sub_100018918((uint64_t)v2, v3);
    v2(v4);
    sub_100018908((uint64_t)v2, v3);

  }
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension31AccountDetailCollectionViewCell *v2;

  v2 = self;
  sub_10034D778();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC20ProductPageExtension31AccountDetailCollectionViewCell *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = sub_10034EA2C(width);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)preferredContentSizeDidChangeWithView:(id)a3 previousTraitCollection:(id)a4
{
  id v6;
  _TtC20ProductPageExtension31AccountDetailCollectionViewCell *v7;
  id v8;
  int v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = self;
  v8 = -[AccountDetailCollectionViewCell traitCollection](v7, "traitCollection");
  v9 = UITraitCollection.prefersAccessibilityLayouts.getter(v8) & 1;

  if (v9 != (UITraitCollection.prefersAccessibilityLayouts.getter(v10) & 1))
    sub_10034ECDC();

}

- (void)didTapWithAccessoryView:(id)a3
{
  void (*v3)(_QWORD *);
  uint64_t v6;
  id v7;
  _TtC20ProductPageExtension31AccountDetailCollectionViewCell *v8;
  _QWORD v9[4];

  v3 = *(void (**)(_QWORD *))((char *)&self->super.super.super.super.super.isa
                                       + OBJC_IVAR____TtC20ProductPageExtension31AccountDetailCollectionViewCell_accessoryAction);
  if (v3)
  {
    v6 = *(_QWORD *)&self->titleLabel[OBJC_IVAR____TtC20ProductPageExtension31AccountDetailCollectionViewCell_accessoryAction];
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
  _TtC20ProductPageExtension31AccountDetailCollectionViewCell *v2;

  v2 = self;
  sub_10034F464();

}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension31AccountDetailCollectionViewCell_titleLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension31AccountDetailCollectionViewCell_subtitleLabel));
}

- (UIView)accessibilityAccessoryView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                           + OBJC_IVAR____TtC20ProductPageExtension31AccountDetailCollectionViewCell_accessoryView));
}

- (BOOL)accessibilityDisabled
{
  return *((_BYTE *)&self->super.super.super.super.super.isa
         + OBJC_IVAR____TtC20ProductPageExtension31AccountDetailCollectionViewCell_disabled);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31AccountDetailCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31AccountDetailCollectionViewCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31AccountDetailCollectionViewCell_detailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31AccountDetailCollectionViewCell_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31AccountDetailCollectionViewCell_accessoryView));
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension31AccountDetailCollectionViewCell_accessory, (uint64_t *)&unk_100808F40);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31AccountDetailCollectionViewCell_topSeparatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31AccountDetailCollectionViewCell_bottomSeparatorView));
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension31AccountDetailCollectionViewCell_accessoryAction), *(_QWORD *)&self->titleLabel[OBJC_IVAR____TtC20ProductPageExtension31AccountDetailCollectionViewCell_accessoryAction]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31AccountDetailCollectionViewCell_backgroundSelectionView));
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension31AccountDetailCollectionViewCell_selectionHandler), *(_QWORD *)&self->titleLabel[OBJC_IVAR____TtC20ProductPageExtension31AccountDetailCollectionViewCell_selectionHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31AccountDetailCollectionViewCell_tapGestureRecognizer));
}

@end
