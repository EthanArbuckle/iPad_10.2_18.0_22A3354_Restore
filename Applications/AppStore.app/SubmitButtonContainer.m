@implementation SubmitButtonContainer

- (_TtC8AppStoreP33_5C0EFAE2C001F32C54795036AF9AFFE421SubmitButtonContainer)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStoreP33_5C0EFAE2C001F32C54795036AF9AFFE421SubmitButtonContainer *)sub_1006026A4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStoreP33_5C0EFAE2C001F32C54795036AF9AFFE421SubmitButtonContainer)initWithCoder:(id)a3
{
  id v4;
  _TtC8AppStoreP33_5C0EFAE2C001F32C54795036AF9AFFE421SubmitButtonContainer *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8AppStoreP33_5C0EFAE2C001F32C54795036AF9AFFE421SubmitButtonContainer_submitButton) = 0;
  v4 = a3;

  result = (_TtC8AppStoreP33_5C0EFAE2C001F32C54795036AF9AFFE421SubmitButtonContainer *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/PersonalizationFeedbackCollectionViewCell.swift", 56, 2, 466, 0);
  __break(1u);
  return result;
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  _TtC8AppStoreP33_5C0EFAE2C001F32C54795036AF9AFFE421SubmitButtonContainer *v6;
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
  v7 = sub_100604854();
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
  _TtC8AppStoreP33_5C0EFAE2C001F32C54795036AF9AFFE421SubmitButtonContainer *v2;

  v2 = self;
  sub_1006028D4();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStoreP33_5C0EFAE2C001F32C54795036AF9AFFE421SubmitButtonContainer_submitButton));
}

@end
