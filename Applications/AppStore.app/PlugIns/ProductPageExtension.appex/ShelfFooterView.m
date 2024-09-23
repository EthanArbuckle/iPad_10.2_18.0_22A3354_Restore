@implementation ShelfFooterView

- (_TtC20ProductPageExtension15ShelfFooterView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension15ShelfFooterView *)sub_100141ADC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension15ShelfFooterView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100142A98();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC20ProductPageExtension15ShelfFooterView *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14[3];
  uint64_t v15;
  uint64_t v16;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  sub_100141F18(v14);
  v6 = v15;
  v7 = v16;
  sub_100010F08(v14, v15);
  v8 = -[ShelfFooterView traitCollection](v5, "traitCollection");
  v9 = dispatch thunk of Placeable.measure(toFit:with:)(v8, v6, v7, width, height);
  v11 = v10;

  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(v14);
  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)layoutSubviews
{
  objc_class *ObjectType;
  _TtC20ProductPageExtension15ShelfFooterView *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  uint64_t v15[3];
  uint64_t v16;
  uint64_t v17;
  objc_super v18;

  ObjectType = (objc_class *)swift_getObjectType();
  v18.receiver = self;
  v18.super_class = ObjectType;
  v4 = self;
  -[ShelfFooterView layoutSubviews](&v18, "layoutSubviews");
  sub_100141F18(v15);
  v5 = v16;
  v6 = v17;
  sub_100010F08(v15, v16);
  v7 = LayoutMarginsAware<>.layoutFrame.getter(ObjectType);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = -[ShelfFooterView traitCollection](v4, "traitCollection");
  dispatch thunk of Placeable.place(at:with:)(v14, v5, v6, v7, v9, v11, v13);

  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(v15);
}

- (void)prepareForReuse
{
  char *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  v2 = (char *)v8.receiver;
  -[ShelfFooterView prepareForReuse](&v8, "prepareForReuse");
  v3 = *(void **)&v2[OBJC_IVAR____TtC20ProductPageExtension15ShelfFooterView_separator];
  v4 = sub_100018B6C(0, (unint64_t *)&qword_100808850, UIColor_ptr);
  v6 = (void *)static UIColor.defaultLine.getter(v4, v5);
  objc_msgSend(v3, "setBackgroundColor:", v6, v8.receiver, v8.super_class);

  v7 = *(void **)&v2[OBJC_IVAR____TtC20ProductPageExtension15ShelfFooterView_titleButton];
  objc_msgSend(v7, "setHidden:", 0);
  objc_msgSend(v7, "setTitle:forState:", 0, 0);

}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (void)didTapWithTitleButton:(id)a3
{
  id v4;
  _TtC20ProductPageExtension15ShelfFooterView *v5;

  v4 = a3;
  v5 = self;
  sub_100142384((uint64_t)v4);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension15ShelfFooterView_separator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension15ShelfFooterView_titleButton));
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension15ShelfFooterView_footerAction), *(_QWORD *)&self->separator[OBJC_IVAR____TtC20ProductPageExtension15ShelfFooterView_footerAction]);
}

@end
