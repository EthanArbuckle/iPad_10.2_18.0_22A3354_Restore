@implementation SubmitButtonContainer

- (_TtC22SubscribePageExtensionP33_091EBE25195B1220BBDC30ECB0E4A36A21SubmitButtonContainer)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtensionP33_091EBE25195B1220BBDC30ECB0E4A36A21SubmitButtonContainer *)sub_1001A8B5C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtensionP33_091EBE25195B1220BBDC30ECB0E4A36A21SubmitButtonContainer)initWithCoder:(id)a3
{
  id v4;
  _TtC22SubscribePageExtensionP33_091EBE25195B1220BBDC30ECB0E4A36A21SubmitButtonContainer *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtensionP33_091EBE25195B1220BBDC30ECB0E4A36A21SubmitButtonContainer_submitButton) = 0;
  v4 = a3;

  result = (_TtC22SubscribePageExtensionP33_091EBE25195B1220BBDC30ECB0E4A36A21SubmitButtonContainer *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/PersonalizationFeedbackCollectionViewCell.swift", 70, 2, 466, 0);
  __break(1u);
  return result;
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  _TtC22SubscribePageExtensionP33_091EBE25195B1220BBDC30ECB0E4A36A21SubmitButtonContainer *v6;
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
  JUMeasurements result;

  swift_unknownObjectRetain(a4);
  v6 = self;
  v7 = sub_1001AAD88();
  v9 = v8;
  v11 = v10;
  v13 = v12;
  swift_unknownObjectRelease(a4);

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.var3 = v17;
  result.var2 = v16;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtensionP33_091EBE25195B1220BBDC30ECB0E4A36A21SubmitButtonContainer *v2;

  v2 = self;
  sub_1001A8D8C();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtensionP33_091EBE25195B1220BBDC30ECB0E4A36A21SubmitButtonContainer_submitButton));
}

@end
