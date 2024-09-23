@implementation VisualAssetCaptureController

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC11NotesEditor28VisualAssetCaptureController *v8;

  type metadata accessor for InfoKey(0);
  sub_1DD97DE68();
  v6 = sub_1DD9D20C8();
  v7 = a3;
  v8 = self;
  sub_1DD97D15C(v7, v6);

  swift_bridgeObjectRelease();
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  id v4;
  _TtC11NotesEditor28VisualAssetCaptureController *v5;

  v4 = a3;
  v5 = self;
  sub_1DD97DC7C(v4);

}

- (_TtC11NotesEditor28VisualAssetCaptureController)init
{
  _TtC11NotesEditor28VisualAssetCaptureController *result;

  result = (_TtC11NotesEditor28VisualAssetCaptureController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR____TtC11NotesEditor28VisualAssetCaptureController_delegate);

}

@end
