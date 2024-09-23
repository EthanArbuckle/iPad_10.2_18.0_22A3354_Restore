@implementation _PHPickerOverlayStorage

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  unint64_t v6;
  id v7;
  _TtC8PhotosUIP33_E2E20DF4EAC1FCE07E5336962A6E0BEF23_PHPickerOverlayStorage *v8;

  sub_20D1EC458(0, &qword_2549AD610);
  v6 = sub_20D206E9C();
  v7 = a3;
  v8 = self;
  sub_20D1E9858((uint64_t)v7, v6);

  swift_bridgeObjectRelease();
}

- (_TtC8PhotosUIP33_E2E20DF4EAC1FCE07E5336962A6E0BEF23_PHPickerOverlayStorage)init
{
  sub_20D1E9AA4();
}

- (void).cxx_destruct
{
  sub_20D1EAC3C((uint64_t)self + OBJC_IVAR____TtC8PhotosUIP33_E2E20DF4EAC1FCE07E5336962A6E0BEF23_PHPickerOverlayStorage_configuration);
  sub_20D1EC3D8((uint64_t)self + OBJC_IVAR____TtC8PhotosUIP33_E2E20DF4EAC1FCE07E5336962A6E0BEF23_PHPickerOverlayStorage_delegate);
}

@end
