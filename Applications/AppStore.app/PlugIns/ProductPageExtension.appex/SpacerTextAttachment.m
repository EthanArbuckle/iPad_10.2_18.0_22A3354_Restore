@implementation SpacerTextAttachment

- (_TtC20ProductPageExtensionP33_BBE9CE4405D81F204470D7CB156CD67520SpacerTextAttachment)initWithCoder:(id)a3
{
  _TtC20ProductPageExtensionP33_BBE9CE4405D81F204470D7CB156CD67520SpacerTextAttachment *result;

  result = (_TtC20ProductPageExtensionP33_BBE9CE4405D81F204470D7CB156CD67520SpacerTextAttachment *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/CrossLinkPresenter.swift", 45, 2, 147, 0);
  __break(1u);
  return result;
}

- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(int64_t)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  v6 = *(double *)((char *)&self->super.super.isa
                 + OBJC_IVAR____TtC20ProductPageExtensionP33_BBE9CE4405D81F204470D7CB156CD67520SpacerTextAttachment_width);
  v7 = 0.0;
  v8 = 0.0;
  v9 = 0.0;
  result.size.height = v9;
  result.size.width = v6;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (_TtC20ProductPageExtensionP33_BBE9CE4405D81F204470D7CB156CD67520SpacerTextAttachment)initWithData:(id)a3 ofType:(id)a4
{
  id v5;
  id v6;
  _TtC20ProductPageExtensionP33_BBE9CE4405D81F204470D7CB156CD67520SpacerTextAttachment *result;

  if (a3)
  {
    v5 = a4;
    v6 = a3;
    static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);

  }
  result = (_TtC20ProductPageExtensionP33_BBE9CE4405D81F204470D7CB156CD67520SpacerTextAttachment *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.SpacerTextAttachment", 41, "init(data:ofType:)", 18, 0);
  __break(1u);
  return result;
}

@end
