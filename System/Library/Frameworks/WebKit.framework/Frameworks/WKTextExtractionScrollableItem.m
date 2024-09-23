@implementation WKTextExtractionScrollableItem

- (CGSize)contentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *(double *)((char *)&self->super.super.isa + OBJC_IVAR___WKTextExtractionScrollableItem_contentSize);
  v3 = *(double *)&self->super.rectInWebView[OBJC_IVAR___WKTextExtractionScrollableItem_contentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (WKTextExtractionScrollableItem)initWithContentSize:(CGSize)a3 rectInWebView:(CGRect)a4 children:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v9;
  CGFloat v10;
  objc_class *v12;
  objc_class *v13;
  CGFloat *v14;
  CGFloat *v15;
  objc_super v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3.height;
  v10 = a3.width;
  v12 = (objc_class *)type metadata accessor for WKTextExtractionItem();
  v13 = (objc_class *)sub_2354A3AC8();
  v14 = (CGFloat *)((char *)self + OBJC_IVAR___WKTextExtractionScrollableItem_contentSize);
  *v14 = v10;
  v14[1] = v9;
  v15 = (CGFloat *)((char *)self + OBJC_IVAR___WKTextExtractionItem_rectInWebView);
  *v15 = x;
  v15[1] = y;
  v15[2] = width;
  v15[3] = height;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___WKTextExtractionItem_children) = v13;
  v17.receiver = self;
  v17.super_class = v12;
  return -[WKTextExtractionItem init](&v17, sel_init);
}

@end
