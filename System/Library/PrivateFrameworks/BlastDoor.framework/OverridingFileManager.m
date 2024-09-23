@implementation OverridingFileManager

- (NSURL)temporaryDirectory
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC9BlastDoor21OverridingFileManager *v7;
  void *v8;
  uint64_t v10;

  v3 = sub_1AD63AF28();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_1AD0DF310((uint64_t)v6);

  v8 = (void *)sub_1AD63AE98();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSURL *)v8;
}

- (id)URLForDirectory:(unint64_t)a3 inDomain:(unint64_t)a4 appropriateForURL:(id)a5 create:(BOOL)a6 error:(id *)a7
{
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  _TtC9BlastDoor21OverridingFileManager *v20;
  void *v21;
  _BYTE v23[16];

  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2E1A40);
  MEMORY[0x1E0C80A78](v12);
  v14 = &v23[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = sub_1AD63AF28();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15);
  v18 = &v23[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (a5)
  {
    sub_1AD63AED4();
    v19 = 0;
  }
  else
  {
    v19 = 1;
  }
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v14, v19, 1, v15);
  v20 = self;
  sub_1AD0DF5FC((void *)a3, a4, (uint64_t)v14, a6, v18);
  sub_1AD0D0888((uint64_t)v14);

  v21 = (void *)sub_1AD63AE98();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  return v21;
}

- (_TtC9BlastDoor21OverridingFileManager)init
{
  _TtC9BlastDoor21OverridingFileManager *result;

  result = (_TtC9BlastDoor21OverridingFileManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
