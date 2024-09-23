@implementation WKTextExtractionItem

- (CGRect)rectInWebView
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = sub_2354A18A4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___WKTextExtractionItem_rectInWebView);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (NSArray)children
{
  return (NSArray *)sub_2354A0E9C((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___WKTextExtractionItem_children, (void (*)(void))type metadata accessor for WKTextExtractionItem);
}

- (WKTextExtractionItem)init
{
  WKTextExtractionItem *result;

  result = (WKTextExtractionItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
