@implementation ImagePickerView.Coordinator

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  uint64_t v6;
  id v7;
  _TtCV11MedicalIDUI15ImagePickerView11Coordinator *v8;

  type metadata accessor for InfoKey(0);
  sub_24159CE88(&qword_257139730, (uint64_t (*)(uint64_t))type metadata accessor for InfoKey, (uint64_t)&unk_2416BCB50);
  v6 = sub_2416BB044();
  v7 = a3;
  v8 = self;
  sub_24165AFD8(v6);

  swift_bridgeObjectRelease();
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtCV11MedicalIDUI15ImagePickerView11Coordinator *v11;
  uint64_t v12;

  v5 = sub_2416BA1C8();
  MEMORY[0x24BDAC7A8](v5);
  sub_2415C3694(0);
  v7 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a3;
  v11 = self;
  sub_2415C17A8((uint64_t)v9);
  MEMORY[0x242698604](v7);
  sub_2416BA1BC();
  sub_2416BAE1C();
  sub_2415A6154((uint64_t)v9, (uint64_t (*)(_QWORD))sub_2415C3694);

}

- (_TtCV11MedicalIDUI15ImagePickerView11Coordinator)init
{
  _TtCV11MedicalIDUI15ImagePickerView11Coordinator *result;

  result = (_TtCV11MedicalIDUI15ImagePickerView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2415A6154((uint64_t)self + OBJC_IVAR____TtCV11MedicalIDUI15ImagePickerView11Coordinator_parent, type metadata accessor for ImagePickerView);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtCV11MedicalIDUI15ImagePickerView11Coordinator_imageProcessor);
}

@end
