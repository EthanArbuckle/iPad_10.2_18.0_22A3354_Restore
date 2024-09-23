@implementation CNPhotoPickerCoordinator

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC10ContactsUI24CNPhotoPickerCoordinator *v8;

  type metadata accessor for InfoKey(0);
  sub_18ACB7AD8((unint64_t *)&unk_1EDF99E70, (uint64_t (*)(uint64_t))type metadata accessor for InfoKey, (uint64_t)&unk_18AF84B84);
  v6 = sub_18AF4FBA8();
  v7 = a3;
  v8 = self;
  sub_18AD647CC(v6);

  swift_bridgeObjectRelease();
}

- (_TtC10ContactsUI24CNPhotoPickerCoordinator)init
{
  _TtC10ContactsUI24CNPhotoPickerCoordinator *result;

  result = (_TtC10ContactsUI24CNPhotoPickerCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_18AD64790((uint64_t)self + OBJC_IVAR____TtC10ContactsUI24CNPhotoPickerCoordinator_picker);
}

@end
