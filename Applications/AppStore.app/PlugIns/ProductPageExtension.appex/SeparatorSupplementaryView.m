@implementation SeparatorSupplementaryView

- (_TtC20ProductPageExtension26SeparatorSupplementaryView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension26SeparatorSupplementaryView *)sub_10052E6A8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension26SeparatorSupplementaryView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10052ED90();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC20ProductPageExtension26SeparatorSupplementaryView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = sub_10052E8B4(width);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  objc_class *v7;
  _TtC20ProductPageExtension26SeparatorSupplementaryView *v8;
  void *v9;
  char *v10;
  __n128 v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  char v20[24];
  objc_super v21;

  v3 = type metadata accessor for ComponentSeparator(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v7 = (objc_class *)type metadata accessor for SeparatorSupplementaryView(0);
  v21.receiver = self;
  v21.super_class = v7;
  v8 = self;
  -[SeparatorSupplementaryView layoutSubviews](&v21, "layoutSubviews");
  v9 = *(Class *)((char *)&v8->super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension26SeparatorSupplementaryView_lineView);
  v10 = (char *)v8 + OBJC_IVAR____TtC20ProductPageExtension26SeparatorSupplementaryView_separator;
  v11 = swift_beginAccess((char *)v8 + OBJC_IVAR____TtC20ProductPageExtension26SeparatorSupplementaryView_separator, v20, 0, 0);
  (*(void (**)(char *, char *, uint64_t, __n128))(v4 + 16))(v6, v10, v3, v11);
  -[SeparatorSupplementaryView bounds](v8, "bounds");
  v12 = ComponentSeparator.frame(forBoundingRect:in:)(v8);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  objc_msgSend(v9, "setFrame:", v12, v14, v16, v18);

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension26SeparatorSupplementaryView_separator;
  v4 = type metadata accessor for ComponentSeparator(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension26SeparatorSupplementaryView_lineView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension26SeparatorSupplementaryView_lineColor));
}

@end
