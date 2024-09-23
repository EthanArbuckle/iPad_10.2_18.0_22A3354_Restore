@implementation OfferButton

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType(self, a2);
  -[OfferButton frame](&v6, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  _TtC20ProductPageExtension11OfferButton *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  objc_super v18;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v19.receiver = self;
  v19.super_class = ObjectType;
  v9 = self;
  -[OfferButton frame](&v19, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18.receiver = v9;
  v18.super_class = ObjectType;
  -[OfferButton setFrame:](&v18, "setFrame:", x, y, width, height);
  sub_1001A7E78(v11, v13, v15, v17);

}

- (_TtC20ProductPageExtension11OfferButton)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension11OfferButton *)sub_1001A83A8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension11OfferButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001A9C7C();
}

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC20ProductPageExtension11OfferButton *v5;
  id v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v4 = (void *)objc_opt_self(NSNotificationCenter);
  v5 = self;
  v6 = objc_msgSend(v4, "defaultCenter");
  objc_msgSend(v6, "removeObserver:", v5);

  v7.receiver = v5;
  v7.super_class = ObjectType;
  -[OfferButton dealloc](&v7, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension11OfferButton_effectShape));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension11OfferButton_outlineShape));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension11OfferButton_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension11OfferButton_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension11OfferButton_subtitleLabel));
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension11OfferButton_presenter, &qword_100813988);
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC20ProductPageExtension11OfferButton_objectGraph);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC20ProductPageExtension11OfferButton_layoutDelegate);
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension11OfferButton_isEnabledObserver, &qword_100808F20);
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((Class *)((char *)&self->super.super.super.super.isa
                                                                 + OBJC_IVAR____TtC20ProductPageExtension11OfferButton__configuration));
}

- (void)layoutSubviews
{
  objc_class *ObjectType;
  _TtC20ProductPageExtension11OfferButton *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD v19[3];
  uint64_t v20;
  uint64_t v21;
  objc_super v22;

  ObjectType = (objc_class *)swift_getObjectType();
  v22.receiver = self;
  v22.super_class = ObjectType;
  v4 = self;
  -[OfferButton layoutSubviews](&v22, "layoutSubviews");
  v5 = (uint64_t)v4 + OBJC_IVAR____TtC20ProductPageExtension11OfferButton__configuration;
  swift_beginAccess((char *)v4 + OBJC_IVAR____TtC20ProductPageExtension11OfferButton__configuration, &v18, 0, 0);
  sub_10000EF80(v5, (uint64_t)v19);
  v6 = v20;
  v7 = v21;
  sub_100010F08(v19, v20);
  -[OfferButton bounds](v4, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = objc_msgSend((id)objc_opt_self(UIView), "areAnimationsEnabled") ^ 1;
  v17 = sub_1001A9B70();
  dispatch thunk of OfferButtonConfiguration.layout<A>(button:in:disableAnimations:)(v4, v16, ObjectType, v17, v6, v7, v9, v11, v13, v15);
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(v19);

}

- (void)invalidateIntrinsicContentSize
{
  char *v2;
  char *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType(self, a2);
  v2 = (char *)v4.receiver;
  -[OfferButton invalidateIntrinsicContentSize](&v4, "invalidateIntrinsicContentSize");
  v3 = &v2[OBJC_IVAR____TtC20ProductPageExtension11OfferButton_cachedIntrinsicContentSize];
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0;
  v3[16] = 1;

}

- (CGSize)intrinsicContentSize
{
  _TtC20ProductPageExtension11OfferButton *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = sub_1001A92D4();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC20ProductPageExtension11OfferButton *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v3 = self;
  v4 = sub_1001A92D4();
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)isHighlighted
{
  return sub_100053CD8(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *ObjectType;
  _TtC20ProductPageExtension11OfferButton *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  unint64_t v18;
  uint64_t v19;
  _QWORD v20[3];
  uint64_t v21;
  uint64_t v22;
  objc_super v23;

  v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  v23.receiver = self;
  v23.super_class = ObjectType;
  v6 = self;
  -[OfferButton setHighlighted:](&v23, "setHighlighted:", v3);
  v7 = (uint64_t)v6 + OBJC_IVAR____TtC20ProductPageExtension11OfferButton__configuration;
  swift_beginAccess((char *)v6 + OBJC_IVAR____TtC20ProductPageExtension11OfferButton__configuration, &v19, 0, 0);
  sub_10000EF80(v7, (uint64_t)v20);
  v8 = v21;
  v9 = v22;
  sub_100010F08(v20, v21);
  -[OfferButton bounds](v6, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = sub_1001A9B70();
  dispatch thunk of OfferButtonConfiguration.layout<A>(button:in:disableAnimations:)(v6, 0, ObjectType, v18, v8, v9, v11, v13, v15, v17);
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(v20);

}

- (void)tintColorDidChange
{
  objc_class *ObjectType;
  _TtC20ProductPageExtension11OfferButton *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD v10[3];
  uint64_t v11;
  uint64_t v12;
  objc_super v13;

  ObjectType = (objc_class *)swift_getObjectType();
  v13.receiver = self;
  v13.super_class = ObjectType;
  v4 = self;
  -[OfferButton tintColorDidChange](&v13, "tintColorDidChange");
  v5 = (uint64_t)v4 + OBJC_IVAR____TtC20ProductPageExtension11OfferButton__configuration;
  swift_beginAccess((char *)v4 + OBJC_IVAR____TtC20ProductPageExtension11OfferButton__configuration, &v9, 0, 0);
  sub_10000EF80(v5, (uint64_t)v10);
  v6 = v11;
  v7 = v12;
  sub_100010F08(v10, v11);
  v8 = sub_1001A9B70();
  dispatch thunk of OfferButtonConfiguration.reapply<A>(colorsTo:)(v4, ObjectType, v8, v6, v7);
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(v10);

}

- (BOOL)isEnabled
{
  return sub_100053CD8(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *ObjectType;
  _TtC20ProductPageExtension11OfferButton *v6;
  objc_super v7;
  objc_super v8;

  v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = self;
  if (-[OfferButton isEnabled](&v8, "isEnabled") != v3)
    sub_1001A964C(v3);
  v7.receiver = v6;
  v7.super_class = ObjectType;
  -[OfferButton setEnabled:](&v7, "setEnabled:", v3);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC20ProductPageExtension11OfferButton *v6;

  v5 = a3;
  v6 = self;
  sub_1001A9778((uint64_t)a3);

}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityOfferLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension11OfferButton_label));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityOfferSubtitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension11OfferButton_subtitleLabel));
}

@end
