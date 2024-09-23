@implementation AccountDetailCollectionViewCell

- (BOOL)isSelected
{
  return sub_1005A26F8(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  sub_1005A274C(self, (uint64_t)a2, a3, (SEL *)&selRef_setSelected_, (SEL *)&selRef_isSelected);
}

- (BOOL)isHighlighted
{
  return sub_1005A26F8(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  sub_1005A274C(self, (uint64_t)a2, a3, (SEL *)&selRef_setHighlighted_, (SEL *)&selRef_isHighlighted);
}

- (_TtC8AppStore31AccountDetailCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore31AccountDetailCollectionViewCell *)sub_1005A2934(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore31AccountDetailCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1005A571C();
}

- (void)wasTapped
{
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  _TtC8AppStore31AccountDetailCollectionViewCell *v5;

  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore31AccountDetailCollectionViewCell_selectionHandler);
  if (v2)
  {
    v3 = *(_QWORD *)&self->titleLabel[OBJC_IVAR____TtC8AppStore31AccountDetailCollectionViewCell_selectionHandler];
    v5 = self;
    v4 = sub_10003A340((uint64_t)v2, v3);
    v2(v4);
    sub_10003A350((uint64_t)v2, v3);

  }
}

- (void)layoutSubviews
{
  _TtC8AppStore31AccountDetailCollectionViewCell *v2;

  v2 = self;
  sub_1005A33A8();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC8AppStore31AccountDetailCollectionViewCell *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = sub_1005A465C(width);
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
  _TtC8AppStore31AccountDetailCollectionViewCell *v7;
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
    sub_1005A490C();

}

- (void)didTapWithAccessoryView:(id)a3
{
  void (*v3)(_QWORD *);
  uint64_t v6;
  id v7;
  _TtC8AppStore31AccountDetailCollectionViewCell *v8;
  _QWORD v9[4];

  v3 = *(void (**)(_QWORD *))((char *)&self->super.super.super.super.super.isa
                                       + OBJC_IVAR____TtC8AppStore31AccountDetailCollectionViewCell_accessoryAction);
  if (v3)
  {
    v6 = *(_QWORD *)&self->titleLabel[OBJC_IVAR____TtC8AppStore31AccountDetailCollectionViewCell_accessoryAction];
    v9[3] = sub_100008FE4(0, &qword_100839400, UIControl_ptr);
    v9[0] = a3;
    v7 = a3;
    v8 = self;
    sub_10003A340((uint64_t)v3, v6);
    v3(v9);
    sub_10003A350((uint64_t)v3, v6);
    sub_1000057AC((uint64_t)v9, (uint64_t *)&unk_10082B490);

  }
}

- (void)prepareForReuse
{
  _TtC8AppStore31AccountDetailCollectionViewCell *v2;

  v2 = self;
  sub_1005A5094();

}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore31AccountDetailCollectionViewCell_titleLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore31AccountDetailCollectionViewCell_subtitleLabel));
}

- (UIView)accessibilityAccessoryView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                           + OBJC_IVAR____TtC8AppStore31AccountDetailCollectionViewCell_accessoryView));
}

- (BOOL)accessibilityDisabled
{
  return *((_BYTE *)&self->super.super.super.super.super.isa
         + OBJC_IVAR____TtC8AppStore31AccountDetailCollectionViewCell_disabled);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31AccountDetailCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31AccountDetailCollectionViewCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31AccountDetailCollectionViewCell_detailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31AccountDetailCollectionViewCell_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31AccountDetailCollectionViewCell_accessoryView));
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore31AccountDetailCollectionViewCell_accessory, &qword_1008346F0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31AccountDetailCollectionViewCell_topSeparatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31AccountDetailCollectionViewCell_bottomSeparatorView));
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC8AppStore31AccountDetailCollectionViewCell_accessoryAction), *(_QWORD *)&self->titleLabel[OBJC_IVAR____TtC8AppStore31AccountDetailCollectionViewCell_accessoryAction]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31AccountDetailCollectionViewCell_backgroundSelectionView));
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC8AppStore31AccountDetailCollectionViewCell_selectionHandler), *(_QWORD *)&self->titleLabel[OBJC_IVAR____TtC8AppStore31AccountDetailCollectionViewCell_selectionHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31AccountDetailCollectionViewCell_tapGestureRecognizer));
}

@end
