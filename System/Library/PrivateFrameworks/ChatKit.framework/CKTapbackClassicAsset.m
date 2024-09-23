@implementation CKTapbackClassicAsset

- (id)stillImageByApplyingSelectionFilter:(BOOL)a3
{
  CKTapbackClassicAsset *v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  void *v9;

  v4 = self;
  sub_18E70D0CC();
  v6 = v5;
  if (*(Class *)((char *)&v4->super.isa + OBJC_IVAR___CKTapbackClassicAsset_primarySelectionColorFilterValueMatrix)
    && a3
    && v5)
  {
    v7 = (_QWORD *)sub_18E7669BC();
    sub_18E70D27C(v7);
    v9 = v8;

    swift_bridgeObjectRelease();
    v6 = v9;
  }
  else
  {

  }
  return v6;
}

- (CKTapbackClassicAsset)init
{
  CKTapbackClassicAsset *result;

  result = (CKTapbackClassicAsset *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_18E61B2A8(*(id *)((char *)&self->super.isa + OBJC_IVAR___CKTapbackClassicAsset____lazy_storage___stillImage));
}

@end
