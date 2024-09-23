@implementation SubmitButtonContainer

- (_TtC20ProductPageExtensionP33_47F3E09EDC9AF857AC4F1234D992C10921SubmitButtonContainer)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtensionP33_47F3E09EDC9AF857AC4F1234D992C10921SubmitButtonContainer *)sub_1005D51F0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtensionP33_47F3E09EDC9AF857AC4F1234D992C10921SubmitButtonContainer)initWithCoder:(id)a3
{
  id v4;
  _TtC20ProductPageExtensionP33_47F3E09EDC9AF857AC4F1234D992C10921SubmitButtonContainer *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtensionP33_47F3E09EDC9AF857AC4F1234D992C10921SubmitButtonContainer_submitButton) = 0;
  v4 = a3;

  result = (_TtC20ProductPageExtensionP33_47F3E09EDC9AF857AC4F1234D992C10921SubmitButtonContainer *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/PersonalizationFeedbackCollectionViewCell.swift", 68, 2, 466, 0);
  __break(1u);
  return result;
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  _TtC20ProductPageExtensionP33_47F3E09EDC9AF857AC4F1234D992C10921SubmitButtonContainer *v5;
  double v6;
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
  JUMeasurements result;

  swift_unknownObjectRetain(a4);
  v5 = self;
  v6 = sub_1005D741C();
  v8 = v7;
  v10 = v9;
  v12 = v11;
  swift_unknownObjectRelease();

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.var3 = v16;
  result.var2 = v15;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtensionP33_47F3E09EDC9AF857AC4F1234D992C10921SubmitButtonContainer *v2;

  v2 = self;
  sub_1005D5420();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtensionP33_47F3E09EDC9AF857AC4F1234D992C10921SubmitButtonContainer_submitButton));
}

@end
