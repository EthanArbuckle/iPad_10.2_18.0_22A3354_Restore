@implementation WKTextExtractionTextItem

- (NSString)content
{
  return (NSString *)sub_2354A1508();
}

- (_NSRange)selectedRange
{
  char *v2;
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v2 = (char *)self + OBJC_IVAR___WKTextExtractionTextItem_selectedRange;
  v3 = *(NSUInteger *)((char *)&self->super.super.isa + OBJC_IVAR___WKTextExtractionTextItem_selectedRange);
  v4 = *((_QWORD *)v2 + 1);
  result.length = v4;
  result.location = v3;
  return result;
}

- (NSArray)links
{
  return (NSArray *)sub_2354A0E9C((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___WKTextExtractionTextItem_links, (void (*)(void))type metadata accessor for WKTextExtractionLink);
}

- (WKTextExtractionEditable)editable
{
  return (WKTextExtractionEditable *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                             + OBJC_IVAR___WKTextExtractionTextItem_editable));
}

- (WKTextExtractionTextItem)initWithContent:(id)a3 selectedRange:(_NSRange)a4 links:(id)a5 editable:(id)a6 rectInWebView:(CGRect)a7 children:(id)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  NSUInteger length;
  NSUInteger location;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  objc_class *v19;
  objc_class *v20;
  objc_class *v21;
  uint64_t *v22;
  NSUInteger *v23;
  CGFloat *v24;
  id v25;
  objc_super v27;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  length = a4.length;
  location = a4.location;
  v16 = sub_2354A3AA4();
  v18 = v17;
  type metadata accessor for WKTextExtractionLink();
  v19 = (objc_class *)sub_2354A3AC8();
  v20 = (objc_class *)type metadata accessor for WKTextExtractionItem();
  v21 = (objc_class *)sub_2354A3AC8();
  v22 = (uint64_t *)((char *)self + OBJC_IVAR___WKTextExtractionTextItem_content);
  *v22 = v16;
  v22[1] = v18;
  v23 = (NSUInteger *)((char *)self + OBJC_IVAR___WKTextExtractionTextItem_selectedRange);
  *v23 = location;
  v23[1] = length;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___WKTextExtractionTextItem_links) = v19;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___WKTextExtractionTextItem_editable) = (Class)a6;
  v24 = (CGFloat *)((char *)self + OBJC_IVAR___WKTextExtractionItem_rectInWebView);
  *v24 = x;
  v24[1] = y;
  v24[2] = width;
  v24[3] = height;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___WKTextExtractionItem_children) = v21;
  v27.receiver = self;
  v27.super_class = v20;
  v25 = a6;
  return -[WKTextExtractionItem init](&v27, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

@end
