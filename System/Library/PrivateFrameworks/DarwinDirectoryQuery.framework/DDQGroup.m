@implementation DDQGroup

+ (NSSet)allGroups
{
  return (NSSet *)sub_23A243F88((uint64_t)a1, (uint64_t)a2, sub_23A245CFC);
}

+ (NSSet)mutableGroups
{
  return (NSSet *)sub_23A243F88((uint64_t)a1, (uint64_t)a2, sub_23A246114);
}

- (NSUUID)uuid
{
  return (NSUUID *)sub_23A244000(self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for Group, &OBJC_IVAR___DDQGroup__group);
}

- (unsigned)gid
{
  return sub_23A244140(self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for Group, &OBJC_IVAR___DDQGroup__group);
}

- (NSString)name
{
  return (NSString *)sub_23A244218(self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for Group, &OBJC_IVAR___DDQGroup__group);
}

- (NSSet)members
{
  DDQGroup *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_23A244370();

  type metadata accessor for DDQUser(v3);
  sub_23A24659C(&qword_256956490, v4, type metadata accessor for DDQUser, MEMORY[0x24BEE5BD8]);
  v5 = (void *)sub_23A251444();
  swift_bridgeObjectRelease();
  return (NSSet *)v5;
}

- (DDQGroup)groupWithUUID:(id)a3
{
  sub_23A244694();
}

- (DDQGroup)groupWithGID:(unsigned int)a3
{
  DDQGroup *result;

  result = (DDQGroup *)sub_23A25154C();
  __break(1u);
  return result;
}

- (DDQGroup)groupWithName:(id)a3
{
  DDQGroup *result;

  result = (DDQGroup *)sub_23A25154C();
  __break(1u);
  return result;
}

- (DDQGroup)init
{
  DDQGroup *result;

  result = (DDQGroup *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___DDQGroup__group);
}

+ (id)groupWithUUID:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  _QWORD *v16;
  id v17;
  _BYTE v19[40];
  _QWORD v20[5];

  v3 = type metadata accessor for DarwinDirectoryFilter(0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = &v19[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569563E0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = &v19[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256956488);
  MEMORY[0x24BDAC7A8](v9);
  v11 = &v19[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = sub_23A2513FC();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = &v19[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_23A2513D8();
  if (qword_256956330 != -1)
    swift_once();
  v20[3] = &type metadata for ProviderSideEffects;
  v20[4] = &off_250B32A58;
  v20[0] = swift_allocObject();
  sub_23A245CC0((uint64_t)&unk_256956760, v20[0] + 16);
  v16 = __swift_project_boxed_opaque_existential_1(v20, (uint64_t)&type metadata for ProviderSideEffects);
  __swift_project_boxed_opaque_existential_1(v16, v16[3]);
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v13 + 16))(v5, v15, v12);
  swift_storeEnumTagMultiPayload();
  sub_23A249460((uint64_t)v5, (uint64_t)v8);
  sub_23A242A04((uint64_t)v5, type metadata accessor for DarwinDirectoryFilter);
  sub_23A242980((uint64_t)v20, (uint64_t)v19);
  sub_23A240BF0((uint64_t)v8, (uint64_t)v19, (uint64_t)v11);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  v17 = sub_23A2463A8((uint64_t)v11, &qword_256956488, (uint64_t (*)(_QWORD))type metadata accessor for Group, (Class *)off_250B325A8, &OBJC_IVAR___DDQGroup__group);
  (*(void (**)(_BYTE *, uint64_t))(v13 + 8))(v15, v12);
  return v17;
}

+ (id)groupWithGID:(unsigned int)a3
{
  uint64_t v4;
  uint64_t v5;
  unsigned int *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  _QWORD *v13;
  _BYTE v15[40];
  _QWORD v16[5];

  v4 = type metadata accessor for DarwinDirectoryFilter(0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (unsigned int *)&v15[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569563E0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = &v15[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256956488);
  MEMORY[0x24BDAC7A8](v10);
  v12 = &v15[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_256956330 != -1)
    swift_once();
  v16[3] = &type metadata for ProviderSideEffects;
  v16[4] = &off_250B32A58;
  v16[0] = swift_allocObject();
  sub_23A245CC0((uint64_t)&unk_256956760, v16[0] + 16);
  v13 = __swift_project_boxed_opaque_existential_1(v16, (uint64_t)&type metadata for ProviderSideEffects);
  __swift_project_boxed_opaque_existential_1(v13, v13[3]);
  *v6 = a3;
  swift_storeEnumTagMultiPayload();
  sub_23A249460((uint64_t)v6, (uint64_t)v9);
  sub_23A242A04((uint64_t)v6, type metadata accessor for DarwinDirectoryFilter);
  sub_23A242980((uint64_t)v16, (uint64_t)v15);
  sub_23A240BF0((uint64_t)v9, (uint64_t)v15, (uint64_t)v12);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  return sub_23A2463A8((uint64_t)v12, &qword_256956488, (uint64_t (*)(_QWORD))type metadata accessor for Group, (Class *)off_250B325A8, &OBJC_IVAR___DDQGroup__group);
}

+ (id)groupWithName:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  _BYTE v18[40];
  _QWORD v19[5];

  v3 = type metadata accessor for DarwinDirectoryFilter(0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (uint64_t *)&v18[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569563E0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = &v18[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256956488);
  MEMORY[0x24BDAC7A8](v9);
  v11 = &v18[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = sub_23A251420();
  v14 = v13;
  if (qword_256956330 != -1)
    swift_once();
  v19[3] = &type metadata for ProviderSideEffects;
  v19[4] = &off_250B32A58;
  v19[0] = swift_allocObject();
  sub_23A245CC0((uint64_t)&unk_256956760, v19[0] + 16);
  v15 = __swift_project_boxed_opaque_existential_1(v19, (uint64_t)&type metadata for ProviderSideEffects);
  __swift_project_boxed_opaque_existential_1(v15, v15[3]);
  *v5 = v12;
  v5[1] = v14;
  swift_storeEnumTagMultiPayload();
  swift_bridgeObjectRetain();
  sub_23A249460((uint64_t)v5, (uint64_t)v8);
  sub_23A242A04((uint64_t)v5, type metadata accessor for DarwinDirectoryFilter);
  sub_23A242980((uint64_t)v19, (uint64_t)v18);
  sub_23A240BF0((uint64_t)v8, (uint64_t)v18, (uint64_t)v11);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  v16 = sub_23A2463A8((uint64_t)v11, &qword_256956488, (uint64_t (*)(_QWORD))type metadata accessor for Group, (Class *)off_250B325A8, &OBJC_IVAR___DDQGroup__group);
  swift_bridgeObjectRelease();
  return v16;
}

- (BOOL)isEqual:(id)a3
{
  return sub_23A245098(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))DDQGroup.isEqual(_:));
}

- (int64_t)hash
{
  DDQGroup *v2;
  int64_t v3;

  v2 = self;
  v3 = DDQGroup.hash.getter();

  return v3;
}

@end
