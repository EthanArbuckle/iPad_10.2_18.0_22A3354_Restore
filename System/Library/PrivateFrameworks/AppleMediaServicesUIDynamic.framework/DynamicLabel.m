@implementation DynamicLabel

- (_TtC27AppleMediaServicesUIDynamic12DynamicLabel)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B9D8BD0C();
}

- (_TtC27AppleMediaServicesUIDynamic12DynamicLabel)initWithFrame:(CGRect)a3
{
  sub_1B9D8BDE0();
}

- (void)invalidateIntrinsicContentSize
{
  _TtC27AppleMediaServicesUIDynamic12DynamicLabel *v2;

  v2 = self;
  DynamicLabel.invalidateIntrinsicContentSize()();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC27AppleMediaServicesUIDynamic12DynamicLabel *v6;
  _TtC27AppleMediaServicesUIDynamic12DynamicLabel *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  DynamicLabel.traitCollectionDidChange(_:)(v8);

}

- (CGSize)intrinsicContentSize
{
  _TtC27AppleMediaServicesUIDynamic12DynamicLabel *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  DynamicLabel.intrinsicContentSize.getter();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (NSString)maximumContentSizeCategory
{
  _TtC27AppleMediaServicesUIDynamic12DynamicLabel *v2;
  id v3;

  v2 = self;
  v3 = DynamicLabel.maximumContentSizeCategory.getter();

  return (NSString *)v3;
}

- (void)setMaximumContentSizeCategory:(id)a3
{
  id v5;
  _TtC27AppleMediaServicesUIDynamic12DynamicLabel *v6;

  v5 = a3;
  v6 = self;
  DynamicLabel.maximumContentSizeCategory.setter(a3);

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  objc_class *v4;
  CGFloat y;
  CGFloat x;
  id v8;
  _TtC27AppleMediaServicesUIDynamic12DynamicLabel *v9;
  UIEvent_optional v11;

  v4 = (objc_class *)a4;
  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v11.value.super.isa = v4;
  LOBYTE(v4) = DynamicLabel.point(inside:with:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v11);

  return v4 & 1;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  _TtC27AppleMediaServicesUIDynamic12DynamicLabel *v5;
  CGSize v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = DynamicLabel.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  v7 = v6.width;
  v8 = v6.height;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  _TtC27AppleMediaServicesUIDynamic12DynamicLabel *v5;
  CGSize v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = DynamicLabel.systemLayoutSizeFitting(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  v7 = v6.width;
  v8 = v6.height;
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtC27AppleMediaServicesUIDynamic12DynamicLabel)init
{
  DynamicLabel.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic12DynamicLabel_defaultColor));
  __swift_destroy_boxed_opaque_existential_2((uint64_t)self + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic12DynamicLabel_defaultCustomTextStyle);
  sub_1B9D52A24((uint64_t)self + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic12DynamicLabel_dynamicText, &qword_1ED5CCB90);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic12DynamicLabel_label));
  swift_release();
}

- (void)textViewDidChangeSelection:(id)a3
{
  UITextView *v4;
  _TtC27AppleMediaServicesUIDynamic12DynamicLabel *v5;

  v4 = (UITextView *)a3;
  v5 = self;
  DynamicLabel.textViewDidChangeSelection(_:)(v4);

}

- (BOOL)textViewShouldBeginEditing:(id)a3
{
  return 0;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC27AppleMediaServicesUIDynamic12DynamicLabel *v13;
  uint64_t v15;

  v8 = sub_1B9DE1554();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B9DE1518();
  v12 = a3;
  v13 = self;
  LOBYTE(self) = DynamicLabel.textView(_:shouldInteractWith:in:interaction:)((uint64_t)v13, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return self & 1;
}

- (BOOL)hasContent
{
  _TtC27AppleMediaServicesUIDynamic12DynamicLabel *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = DynamicLabel.hasContent.getter();

  return v3 & 1;
}

- (CGRect)jet_focusedFrame
{
  _TtC27AppleMediaServicesUIDynamic12DynamicLabel *v2;
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
  DynamicLabel.focusedFrame.getter();
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

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  _TtC27AppleMediaServicesUIDynamic12DynamicLabel *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  JUMeasurements result;

  swift_unknownObjectRetain();
  v6 = self;
  DynamicLabel.measurements(fitting:in:)((uint64_t)a4);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  swift_unknownObjectRelease();

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.var3 = v18;
  result.var2 = v17;
  result.var1 = v16;
  result.var0 = v15;
  return result;
}

@end
