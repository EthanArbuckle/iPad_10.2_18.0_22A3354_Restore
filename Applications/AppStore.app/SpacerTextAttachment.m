@implementation SpacerTextAttachment

- (_TtC8AppStoreP33_D572B0067BF63E82624B4FEE97AFF75B20SpacerTextAttachment)initWithCoder:(id)a3
{
  _TtC8AppStoreP33_D572B0067BF63E82624B4FEE97AFF75B20SpacerTextAttachment *result;

  result = (_TtC8AppStoreP33_D572B0067BF63E82624B4FEE97AFF75B20SpacerTextAttachment *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/CrossLinkPresenter.swift", 33, 2, 147, 0);
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
                 + OBJC_IVAR____TtC8AppStoreP33_D572B0067BF63E82624B4FEE97AFF75B20SpacerTextAttachment_width);
  v7 = 0.0;
  v8 = 0.0;
  v9 = 0.0;
  result.size.height = v9;
  result.size.width = v6;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (_TtC8AppStoreP33_D572B0067BF63E82624B4FEE97AFF75B20SpacerTextAttachment)initWithData:(id)a3 ofType:(id)a4
{
  id v5;
  id v6;
  _TtC8AppStoreP33_D572B0067BF63E82624B4FEE97AFF75B20SpacerTextAttachment *result;

  if (a3)
  {
    v5 = a4;
    v6 = a3;
    static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);

  }
  result = (_TtC8AppStoreP33_D572B0067BF63E82624B4FEE97AFF75B20SpacerTextAttachment *)_swift_stdlib_reportUnimplementedInitializer("AppStore.SpacerTextAttachment", 29, "init(data:ofType:)", 18, 0);
  __break(1u);
  return result;
}

@end
