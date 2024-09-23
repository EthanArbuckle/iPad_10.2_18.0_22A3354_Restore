@implementation GPServiceSideExportedObject

- (void)setPromptElements:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DDD2A0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23ECE4248(0, (unint64_t *)&qword_256DD13A0);
  v7 = sub_23EFD1700();
  v8 = sub_23EFD1868();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v6, 1, 1, v8);
  sub_23EFD182C();
  swift_retain_n();
  swift_bridgeObjectRetain();
  v9 = sub_23EFD1820();
  v10 = (_QWORD *)swift_allocObject();
  v11 = MEMORY[0x24BEE6930];
  v10[2] = v9;
  v10[3] = v11;
  v10[4] = self;
  v10[5] = v7;
  sub_23ECE1178((uint64_t)v6, (uint64_t)&unk_256DD99E0, (uint64_t)v10);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)setIsLoadingRecipe:(BOOL)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DDD2A0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23EFD1868();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_23EFD182C();
  swift_retain_n();
  v9 = sub_23EFD1820();
  v10 = swift_allocObject();
  v11 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v10 + 16) = v9;
  *(_QWORD *)(v10 + 24) = v11;
  *(_QWORD *)(v10 + 32) = self;
  *(_BYTE *)(v10 + 40) = a3;
  sub_23ECE12BC((uint64_t)v7, (uint64_t)&unk_256DD99D8, v10);
  swift_release();
  swift_release();
}

- (void)setRecipeData:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DDD2A0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  if (a3)
  {
    v8 = a3;
    v9 = sub_23EFCE094();
    v11 = v10;

  }
  else
  {
    v9 = 0;
    v11 = 0xF000000000000000;
  }
  v12 = sub_23EFD1868();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v7, 1, 1, v12);
  sub_23EFD182C();
  swift_retain();
  sub_23ED0448C(v9, v11);
  v13 = sub_23EFD1820();
  v14 = (_QWORD *)swift_allocObject();
  v15 = MEMORY[0x24BEE6930];
  v14[2] = v13;
  v14[3] = v15;
  v14[4] = self;
  v14[5] = v9;
  v14[6] = v11;
  sub_23ECE1178((uint64_t)v7, (uint64_t)&unk_256DD99D0, (uint64_t)v14);
  swift_release();
  sub_23ED0463C(v9, v11);
  swift_release();
}

- (void)setSourceImage:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DDD2A0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23EFD1868();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_23EFD182C();
  v9 = a3;
  swift_retain_n();
  v10 = v9;
  v11 = sub_23EFD1820();
  v12 = (_QWORD *)swift_allocObject();
  v13 = MEMORY[0x24BEE6930];
  v12[2] = v11;
  v12[3] = v13;
  v12[4] = a3;
  v12[5] = self;
  sub_23ECE1178((uint64_t)v7, (uint64_t)&unk_256DD99C8, (uint64_t)v12);

  swift_release();
  swift_release();
}

- (void)startUpscaling
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DDD2A0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23EFD1868();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  sub_23EFD182C();
  swift_retain_n();
  v7 = sub_23EFD1820();
  v8 = (_QWORD *)swift_allocObject();
  v9 = MEMORY[0x24BEE6930];
  v8[2] = v7;
  v8[3] = v9;
  v8[4] = self;
  sub_23ECE12BC((uint64_t)v5, (uint64_t)&unk_256DD99C0, (uint64_t)v8);
  swift_release();
  swift_release();
}

@end
