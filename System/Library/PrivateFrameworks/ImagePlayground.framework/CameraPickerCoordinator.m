@implementation CameraPickerCoordinator

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC15ImagePlayground23CameraPickerCoordinator *v8;

  type metadata accessor for InfoKey(0);
  sub_23EDA7C00();
  v6 = sub_23EFD140C();
  v7 = a3;
  v8 = self;
  sub_23EDA7C48(v6);

  swift_bridgeObjectRelease();
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  _TtC15ImagePlayground23CameraPickerCoordinator *v10;
  uint64_t v11;

  v5 = sub_23EFCF930();
  MEMORY[0x24BDAC7A8](v5);
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256DD54E0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23ECDC9DC((uint64_t)self + OBJC_IVAR____TtC15ImagePlayground23CameraPickerCoordinator__presentationMode, (uint64_t)v8, (uint64_t *)&unk_256DD54E0);
  v9 = a3;
  v10 = self;
  MEMORY[0x242661A1C](v6);
  sub_23EFCF924();
  sub_23EFD0E30();
  sub_23ECDCA20((uint64_t)v8, (uint64_t *)&unk_256DD54E0);

}

- (_TtC15ImagePlayground23CameraPickerCoordinator)init
{
  _TtC15ImagePlayground23CameraPickerCoordinator *result;

  result = (_TtC15ImagePlayground23CameraPickerCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_23ECDCA20((uint64_t)self + OBJC_IVAR____TtC15ImagePlayground23CameraPickerCoordinator__selectedImage, (uint64_t *)&unk_256DD54F0);
  sub_23ECDCA20((uint64_t)self + OBJC_IVAR____TtC15ImagePlayground23CameraPickerCoordinator__presentationMode, (uint64_t *)&unk_256DD54E0);
}

@end
