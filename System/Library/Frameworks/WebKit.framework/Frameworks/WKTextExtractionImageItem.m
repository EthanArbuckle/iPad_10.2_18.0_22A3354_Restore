@implementation WKTextExtractionImageItem

- (NSString)name
{
  return (NSString *)sub_2354A1508();
}

- (NSString)altText
{
  return (NSString *)sub_2354A1508();
}

- (WKTextExtractionImageItem)initWithName:(id)a3 altText:(id)a4 rectInWebView:(CGRect)a5 children:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  objc_class *v17;
  objc_class *v18;
  uint64_t *v19;
  uint64_t *v20;
  CGFloat *v21;
  objc_super v23;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = sub_2354A3AA4();
  v13 = v12;
  v14 = sub_2354A3AA4();
  v16 = v15;
  v17 = (objc_class *)type metadata accessor for WKTextExtractionItem();
  v18 = (objc_class *)sub_2354A3AC8();
  v19 = (uint64_t *)((char *)self + OBJC_IVAR___WKTextExtractionImageItem_name);
  *v19 = v11;
  v19[1] = v13;
  v20 = (uint64_t *)((char *)self + OBJC_IVAR___WKTextExtractionImageItem_altText);
  *v20 = v14;
  v20[1] = v16;
  v21 = (CGFloat *)((char *)self + OBJC_IVAR___WKTextExtractionItem_rectInWebView);
  *v21 = x;
  v21[1] = y;
  v21[2] = width;
  v21[3] = height;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___WKTextExtractionItem_children) = v18;
  v23.receiver = self;
  v23.super_class = v17;
  return -[WKTextExtractionItem init](&v23, sel_init);
}

- (void).cxx_destruct
{
  sub_2354A185C();
}

@end
