@implementation GenerativePlaygroundPhotoLibrary

- (_TtC15ImagePlayground32GenerativePlaygroundPhotoLibrary)init
{
  _TtC15ImagePlayground32GenerativePlaygroundPhotoLibrary *result;

  result = (_TtC15ImagePlayground32GenerativePlaygroundPhotoLibrary *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ImagePlayground32GenerativePlaygroundPhotoLibrary_photoLibrary));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ImagePlayground32GenerativePlaygroundPhotoLibrary_writeQueue));
  swift_release();
}

- (void)photoLibraryDidChange:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  _TtC15ImagePlayground32GenerativePlaygroundPhotoLibrary *v10;
  id v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DDD2A0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23EFD1868();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_23EFD182C();
  v9 = a3;
  v10 = self;
  v11 = v9;
  v12 = sub_23EFD1820();
  v13 = (_QWORD *)swift_allocObject();
  v14 = MEMORY[0x24BEE6930];
  v13[2] = v12;
  v13[3] = v14;
  v13[4] = v10;
  v13[5] = v11;
  sub_23ECE1178((uint64_t)v7, (uint64_t)&unk_256DDED40, (uint64_t)v13);

  swift_release();
}

@end
