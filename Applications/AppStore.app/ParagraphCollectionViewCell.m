@implementation ParagraphCollectionViewCell

- (_TtC8AppStore27ParagraphCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore27ParagraphCollectionViewCell *)sub_1006293B8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore27ParagraphCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  _TtC8AppStore27ParagraphCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC8AppStore27ParagraphCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0, a2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = OBJC_IVAR____TtC8AppStore27ParagraphCollectionViewCell_expandableTextView;
  sub_100008FE4(0, (unint64_t *)&qword_10082A430, UIColor_ptr);
  v8 = (void *)static UIColor.defaultBackground.getter(a3);
  v9 = objc_allocWithZone((Class)type metadata accessor for ExpandableTextView());
  *(Class *)((char *)&self->super.super.super.super.super.isa + v7) = (Class)sub_1004BFB98(v8, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC8AppStore27ParagraphCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/ParagraphCollectionViewCell.swift", 42, 2, 46, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  id v3;
  uint64_t v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double MinX;
  double MinY;
  objc_super v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  v17.receiver = self;
  v17.super_class = (Class)swift_getObjectType();
  v2 = (char *)v17.receiver;
  -[ParagraphCollectionViewCell layoutSubviews](&v17, "layoutSubviews");
  v3 = objc_msgSend(v2, "contentView", v17.receiver, v17.super_class);
  v4 = sub_100008FE4(0, (unint64_t *)&qword_10082B220, UIView_ptr);
  *(_QWORD *)&v5 = LayoutMarginsAware<>.layoutFrame.getter(v4).n128_u64[0];
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = *(void **)&v2[OBJC_IVAR____TtC8AppStore27ParagraphCollectionViewCell_expandableTextView];
  objc_msgSend(v12, "sizeThatFits:", v9, v11);
  v14 = v13;
  v18.origin.x = v5;
  v18.origin.y = v7;
  v18.size.width = v9;
  v18.size.height = v11;
  MinX = CGRectGetMinX(v18);
  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  MinY = CGRectGetMinY(v19);
  v20.origin.x = v5;
  v20.origin.y = v7;
  v20.size.width = v9;
  v20.size.height = v11;
  objc_msgSend(v12, "setFrame:", MinX, MinY, CGRectGetWidth(v20), v14);

}

- (void)prepareForReuse
{
  _TtC8AppStore27ParagraphCollectionViewCell *v2;

  v2 = self;
  sub_1006292AC();

}

- (_TtC8AppStore18ExpandableTextView)accessibilityExpandableTextView
{
  return (_TtC8AppStore18ExpandableTextView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                      + OBJC_IVAR____TtC8AppStore27ParagraphCollectionViewCell_expandableTextView));
}

- (void).cxx_destruct
{
  sub_10008D294((uint64_t)self + OBJC_IVAR____TtC8AppStore27ParagraphCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore27ParagraphCollectionViewCell_expandableTextView));
}

@end
