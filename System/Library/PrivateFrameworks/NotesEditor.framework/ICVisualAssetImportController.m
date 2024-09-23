@implementation ICVisualAssetImportController

- (ICVisualAssetImportController)initWithCoder:(id)a3
{
  ICVisualAssetImportController *result;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICVisualAssetImportController_paperImageInsertionController) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICVisualAssetImportController_captureController) = 0;
  *((_BYTE *)&self->super.isa
  + OBJC_IVAR___ICVisualAssetImportController_doNotAdvanceInsertionPointAfterInsertingAttachment) = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___ICVisualAssetImportController_isShowing) = 0;

  result = (ICVisualAssetImportController *)sub_1DD9D2CEC();
  __break(1u);
  return result;
}

- (ICVisualAssetImportController)initWithNote:(id)a3 textView:(id)a4
{
  id v5;
  id v6;
  ICVisualAssetImportController *v7;

  v5 = a3;
  v6 = a4;
  v7 = (ICVisualAssetImportController *)sub_1DD92A2F4((uint64_t)v5, v6);

  return v7;
}

- (BOOL)isShowing
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___ICVisualAssetImportController_isShowing;
  swift_beginAccess();
  return *v2;
}

- (void)setIsShowing:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___ICVisualAssetImportController_isShowing;
  swift_beginAccess();
  *v4 = a3;
}

- (void)presentVisualAssetPickerController
{
  ICVisualAssetImportController *v2;

  v2 = self;
  VisualAssetImportController.presentVisualAssetPickerController()();

}

- (void)presentVisualAssetCaptureControllerWithDisableAutorotate:(BOOL)a3
{
  ICVisualAssetImportController *v4;

  v4 = self;
  VisualAssetImportController.presentVisualAssetCaptureController(disableAutorotate:)(a3);

}

- (void)addImageData:(id)a3 typeIdentifier:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  ICVisualAssetImportController *v9;
  Swift::String_optional v10;

  v6 = sub_1DD9D22A8();
  if (a4)
  {
    v7 = sub_1DD9D2170();
    a4 = v8;
  }
  else
  {
    v7 = 0;
  }
  v9 = self;
  v10.value._countAndFlagsBits = v7;
  v10.value._object = a4;
  VisualAssetImportController.add(_:typeIdentifier:forceAddToPaper:)((Swift::OpaquePointer)v6, v10, 0);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)addImageData:(id)a3 typeIdentifier:(id)a4 forceAddToPaper:(BOOL)a5
{
  uint64_t v8;
  uint64_t v9;
  void *v10;
  ICVisualAssetImportController *v11;
  Swift::String_optional v12;

  v8 = sub_1DD9D22A8();
  if (a4)
  {
    v9 = sub_1DD9D2170();
    a4 = v10;
  }
  else
  {
    v9 = 0;
  }
  v11 = self;
  v12.value._countAndFlagsBits = v9;
  v12.value._object = a4;
  VisualAssetImportController.add(_:typeIdentifier:forceAddToPaper:)((Swift::OpaquePointer)v8, v12, a5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (ICVisualAssetImportController)init
{
  ICVisualAssetImportController *result;

  result = (ICVisualAssetImportController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectUnownedDestroy();
  swift_unknownObjectUnownedDestroy();

}

@end
