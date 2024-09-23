@implementation AnimojiGlyphDataSource

- (BOOL)isEnabled
{
  return 1;
}

- (void)configureWith:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = *(_QWORD *)self->glyphType;
  v6 = objc_allocWithZone((Class)type metadata accessor for ImageGlyphUIConfiguration());
  v7 = a3;
  swift_retain();
  v8 = sub_2346B4CA4(a3, v5);
  v9 = *(id *)self->$__lazy_storage_$_uiConfig;
  *(_QWORD *)self->$__lazy_storage_$_uiConfig = v8;

  swift_release();
}

- (void)refresh
{
  swift_retain();
  sub_23468C604();
  swift_release();
}

- (int64_t)numberOfSections
{
  return *(_QWORD *)(*(_QWORD *)self->puppetNames + 16);
}

- (int64_t)numberOfItems
{
  int64_t v2;

  swift_retain();
  v2 = sub_23468D204();
  swift_release();
  return v2;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  unint64_t v4;

  swift_retain();
  v4 = sub_23468D2C0(a3);
  swift_release();
  return v4;
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  return sub_23468F390((uint64_t)self, (uint64_t)a2, a3, (uint64_t (*)(void))sub_23468C49C);
}

- (id)sectionLayoutForSectionIndex:(int64_t)a3 environment:(id)a4
{
  return sub_23468FA8C((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t))sub_23468C49C);
}

- (id)itemAtIndexPath:(id)a3
{
  return sub_23468F5D0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))sub_23468D3D4);
}

- (id)snapshotIdentifiersInSection:(int64_t)a3
{
  return sub_23468F720((uint64_t)self, (uint64_t)a2, a3, (void (*)(uint64_t))sub_23468D63C);
}

- (id)indexPathForCategory:(id)a3
{
  return sub_23468FDAC((uint64_t)self, (uint64_t)a2, a3, (void (*)(id))sub_23468D72C);
}

- (id)indexPathForItemAtIndex:(int64_t)a3
{
  return sub_23468FB9C((uint64_t)self, (uint64_t)a2, a3, (void (*)(uint64_t))sub_23468D920);
}

- (id)indexPathForIdentifier:(id)a3 ofType:(int64_t)a4
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256171710);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_234717754();
  v10 = v9;
  swift_retain();
  sub_23468DB44(v8, v10, a4, (uint64_t)v7);
  swift_release();
  swift_bridgeObjectRelease();
  v11 = sub_234715B64();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v7, 1, v11) != 1)
  {
    v13 = (void *)sub_234715B10();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v11);
  }
  return v13;
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
  v8 = *(_QWORD *)(*(_QWORD *)self->puppetNames + 16);
  if (sub_234715B4C() < v8)
    v9 = 0;
  else
    v9 = -1;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

- (int64_t)numberOfItemsInCategory:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  swift_retain();
  v4 = sub_23468D204();

  swift_release();
  return v4;
}

- (id)indexPathForItem:(id)a3
{
  return sub_23468FDAC((uint64_t)self, (uint64_t)a2, a3, (void (*)(id))sub_23468DE80);
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
  v13[4] = &unk_2561794C8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2561794D0;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_2346F6DA0((uint64_t)v9, (uint64_t)&unk_2561794D8, (uint64_t)v14);
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
  v15[4] = &unk_2561794A8;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2561794B0;
  v16[5] = v15;
  swift_retain();
  sub_2346F6DA0((uint64_t)v11, (uint64_t)&unk_2561794B8, (uint64_t)v16);
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
  v15[4] = &unk_256179488;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_256179490;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  swift_retain();
  sub_2346F6DA0((uint64_t)v11, (uint64_t)&unk_256179498, (uint64_t)v16);
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
  v13[4] = &unk_256179468;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256179470;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_2346F6DA0((uint64_t)v9, (uint64_t)&unk_256179478, (uint64_t)v14);
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
  v13[4] = &unk_256179448;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256179450;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_2346F6DA0((uint64_t)v9, (uint64_t)&unk_256179458, (uint64_t)v14);
  swift_release();
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
  v13[4] = &unk_256179428;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256179430;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_2346F6DA0((uint64_t)v9, (uint64_t)&unk_256179438, (uint64_t)v14);
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
  v13[4] = &unk_256179408;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256179410;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_2346F6DA0((uint64_t)v9, (uint64_t)&unk_256179418, (uint64_t)v14);
  swift_release();
}

- (id)categories
{
  void *v0;

  type metadata accessor for ImageGlyphCategory(0);
  swift_bridgeObjectRetain();
  v0 = (void *)sub_2347178A4();
  swift_bridgeObjectRelease();
  return v0;
}

- (uint64_t)setCategories:(uint64_t)a1
{
  type metadata accessor for ImageGlyphCategory(0);
  *(_QWORD *)(a1 + 32) = sub_2347178BC();
  swift_retain();
  swift_release();
  return swift_bridgeObjectRelease();
}

@end
