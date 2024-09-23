@implementation MemojiGlyphDataSource

- (BOOL)isEnabled
{
  return (self->_deviceIsLocked[0] & 1) == 0;
}

- (int64_t)glyphType
{
  return *(_QWORD *)&self->glyphType[7];
}

- (void)setGlyphType:(int64_t)a3
{
  *(_QWORD *)&self->glyphType[7] = a3;
}

- (void)configureWith:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = *(_QWORD *)&self->glyphType[7];
  v6 = objc_allocWithZone((Class)type metadata accessor for ImageGlyphUIConfiguration());
  v7 = a3;
  swift_retain();
  v8 = sub_2346B4CA4(a3, v5);
  v9 = *(id *)&self->$__lazy_storage_$_uiConfig[7];
  *(_QWORD *)&self->$__lazy_storage_$_uiConfig[7] = v8;

  swift_release();
}

- (void)refresh
{
  swift_retain();
  self->_deviceIsLocked[0] = MKBGetDeviceLockState() - 1 < 2;
  sub_23469115C();
  swift_release();
}

- (int64_t)numberOfSections
{
  return *(_QWORD *)(*(_QWORD *)&self->puppetNames[7] + 16);
}

- (int64_t)numberOfItems
{
  uint64_t v2;
  uint64_t v3;
  int64_t result;

  v2 = *(_QWORD *)(*(_QWORD *)&self->puppetNames[7] + 16);
  v3 = *(_QWORD *)(*(_QWORD *)&self->poses[7] + 16);
  result = v2 * v3;
  if ((unsigned __int128)(v2 * (__int128)v3) >> 64 != (v2 * v3) >> 63)
    __break(1u);
  return result;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  return *(_QWORD *)(*(_QWORD *)&self->poses[7] + 16);
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  return sub_23468F390((uint64_t)self, (uint64_t)a2, a3, (uint64_t (*)(void))sub_23468F0D0);
}

- (id)itemAtIndexPath:(id)a3
{
  return sub_23468F5D0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))sub_23468F3E0);
}

- (id)snapshotIdentifiersInSection:(int64_t)a3
{
  return sub_23468F720((uint64_t)self, (uint64_t)a2, a3, (void (*)(uint64_t))sub_23468F680);
}

- (id)indexPathForCategory:(id)a3
{
  return sub_23468FDAC((uint64_t)self, (uint64_t)a2, a3, (void (*)(id))sub_23468F788);
}

- (id)indexPathForIdentifier:(id)a3 ofType:(int64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v18;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256171710);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_234717754();
  if (a4 != 2 || (v11 = sub_23462C4D8(v9, v10, *(_QWORD **)&self->puppetNames[7]), (v12 & 1) != 0))
  {
    v14 = sub_234715B64();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v8, 1, 1, v14);
  }
  else
  {
    v13 = v11;
    swift_retain();
    MEMORY[0x234941358](0, v13);
    v14 = sub_234715B64();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v8, 0, 1, v14);
    swift_release();
  }
  swift_bridgeObjectRelease();
  sub_234715B64();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v8, 1, v14) != 1)
  {
    v16 = (void *)sub_234715B10();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v8, v14);
  }
  return v16;
}

- (int64_t)numberOfItemsInCategory:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  int64_t result;

  v3 = *(_QWORD *)(*(_QWORD *)&self->puppetNames[7] + 16);
  v4 = *(_QWORD *)(*(_QWORD *)&self->poses[7] + 16);
  result = v3 * v4;
  if ((unsigned __int128)(v3 * (__int128)v4) >> 64 != (v3 * v4) >> 63)
    __break(1u);
  return result;
}

- (id)sectionLayoutForSectionIndex:(int64_t)a3 environment:(id)a4
{
  return sub_23468FA8C((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t))sub_23468F0D0);
}

- (id)indexPathForItemAtIndex:(int64_t)a3
{
  return sub_23468FB9C((uint64_t)self, (uint64_t)a2, a3, (void (*)(uint64_t))sub_23468FAF4);
}

- (id)indexPathForItem:(id)a3
{
  return sub_23468FDAC((uint64_t)self, (uint64_t)a2, a3, (void (*)(id))sub_23468FC74);
}

- (void)deleteItem:(STKImageGlyph *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  STKImageGlyph *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2561718D0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_2347179AC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2561793E8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2561793F0;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_2346F6DA0((uint64_t)v9, (uint64_t)&unk_2561793F8, (uint64_t)v14);
  swift_release();
}

- (void)moveItemFromIndex:(int64_t)a3 toIndex:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2561718D0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_2347179AC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_2561793C8;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2561793D0;
  v16[5] = v15;
  swift_retain();
  sub_2346F6DA0((uint64_t)v11, (uint64_t)&unk_2561779D8, (uint64_t)v16);
  swift_release();
}

- (void)moveItemFromIndexPath:(NSIndexPath *)a3 toIndexPath:(NSIndexPath *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSIndexPath *v17;
  NSIndexPath *v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2561718D0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_2347179AC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_2561793A8;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2561793B0;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  swift_retain();
  sub_2346F6DA0((uint64_t)v11, (uint64_t)&unk_2561793B8, (uint64_t)v16);
  swift_release();
}

- (int64_t)categoryIndexForIndexPath:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v11;

  v4 = sub_234715B64();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_234715B1C();
  v8 = *(_QWORD *)(*(_QWORD *)&self->puppetNames[7] + 16);
  if (sub_234715B4C() < v8)
    v9 = 0;
  else
    v9 = -1;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

- (void)imageAtIndexPath:(NSIndexPath *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSIndexPath *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2561718D0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_2347179AC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_256179388;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256179390;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_2346F6DA0((uint64_t)v9, (uint64_t)&unk_256172BC0, (uint64_t)v14);
  swift_release();
}

- (void)imageForImageGlyph:(STKImageGlyph *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  STKImageGlyph *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2561718D0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_2347179AC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_256179368;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256179370;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_2346F6DA0((uint64_t)v9, (uint64_t)&unk_256179378, (uint64_t)v14);
  swift_release();
}

- (void)stickerAtIndexPath:(NSIndexPath *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSIndexPath *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2561718D0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_2347179AC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_256179348;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256179350;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_2346F6DA0((uint64_t)v9, (uint64_t)&unk_256179358, (uint64_t)v14);
  swift_release();
}

- (void)stickerForImageGlyph:(STKImageGlyph *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  STKImageGlyph *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2561718D0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_2347179AC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_256179328;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256179330;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_2346F6DA0((uint64_t)v9, (uint64_t)&unk_256176470, (uint64_t)v14);
  swift_release();
}

@end
