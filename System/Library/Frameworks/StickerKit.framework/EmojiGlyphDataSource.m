@implementation EmojiGlyphDataSource

- (BOOL)isEnabled
{
  return self->isEnabled[0];
}

- (void)setIsEnabled:(BOOL)a3
{
  self->isEnabled[0] = a3;
}

- (int64_t)glyphType
{
  return *(_QWORD *)&self->glyphType[7];
}

- (void)setGlyphType:(int64_t)a3
{
  *(_QWORD *)&self->glyphType[7] = a3;
}

- (NSArray)categories
{
  void *v2;

  swift_retain();
  sub_2345B5F98();
  swift_release();
  type metadata accessor for ImageGlyphCategory(0);
  v2 = (void *)sub_2347178A4();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
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
  sub_2345B61E4();
  swift_release();
}

- (int64_t)numberOfSections
{
  return *(_QWORD *)(*(_QWORD *)&self->emojiCategories[7] + 16);
}

- (int64_t)numberOfItems
{
  int64_t v2;
  int64_t v3;

  swift_retain();
  sub_2345B6408();
  v3 = v2;
  swift_release();
  return v3;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  return sub_2345B6554(a3);
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  id v3;
  int64_t v4;

  swift_retain();
  v3 = sub_2345B5ED4();
  v4 = ImageGlyphUIConfiguration.numberOfRows.getter();
  swift_release();

  return v4;
}

- (id)sectionLayoutForSectionIndex:(int64_t)a3 environment:(id)a4
{
  id v4;
  id v5;

  swift_unknownObjectRetain();
  swift_retain();
  v4 = sub_2345B5ED4();
  v5 = _s10StickerKit25ImageGlyphUIConfigurationC6layout3forSo25NSCollectionLayoutSectionCSo0hI11Environment_p_tF_0();
  swift_unknownObjectRelease();
  swift_release();

  return v5;
}

- (id)itemAtIndexPath:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v9;

  v3 = sub_234715B64();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_234715B1C();
  swift_retain();
  v7 = (void *)sub_2345B6658((uint64_t)v6);
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7;
}

- (id)snapshotIdentifiersInSection:(int64_t)a3
{
  void *v4;

  swift_retain();
  sub_2345B68E8(a3);
  swift_release();
  v4 = (void *)sub_2347178A4();
  swift_bridgeObjectRelease();
  return v4;
}

- (id)indexPathForItemAtIndex:(int64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256171710);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_2345B6BF8(a3, (uint64_t)v6);
  swift_release();
  v7 = sub_234715B64();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
  {
    v9 = (void *)sub_234715B10();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
  }
  return v9;
}

- (int64_t)numberOfItemsInCategory:(id)a3
{
  return sub_2345B6D80((uint64_t)a3);
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
  v8 = *(_QWORD *)(*(_QWORD *)&self->emojiCategories[7] + 16);
  swift_retain();
  if (sub_234715B4C() >= v8)
    v9 = -1;
  else
    v9 = sub_234715B4C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

- (id)indexPathForCategory:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256171710);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2345B8520(*(_QWORD *)&self->emojiCategories[7], (uint64_t)a3);
  if ((v9 & 1) != 0)
  {
    v12 = sub_234715B64();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v7, 1, 1, v12);
  }
  else
  {
    v10 = v8;
    v11 = a3;
    swift_retain();
    MEMORY[0x234941358](0, v10);
    v12 = sub_234715B64();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v7, 0, 1, v12);

    swift_release();
  }
  sub_234715B64();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v7, 1, v12) != 1)
  {
    v14 = (void *)sub_234715B10();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v7, v12);
  }
  return v14;
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
  sub_2345B7050(v8, v10, a4, (unint64_t)v7);
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
  v13[4] = &unk_256172BF0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256172BF8;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_2346F6DA0((uint64_t)v9, (uint64_t)&unk_256172C00, (uint64_t)v14);
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
  v15[4] = &unk_256172BD0;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_256172BD8;
  v16[5] = v15;
  swift_retain();
  sub_2346F6DA0((uint64_t)v11, (uint64_t)&unk_256172BE0, (uint64_t)v16);
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
  v15[4] = &unk_256172BB8;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_256179390;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  swift_retain();
  sub_2346F6DA0((uint64_t)v11, (uint64_t)&unk_256172BC0, (uint64_t)v16);
  swift_release();
}

- (id)indexPathForItem:(id)a3
{
  return 0;
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
  v13[4] = &unk_256172B98;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256172BA0;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_2346F6DA0((uint64_t)v9, (uint64_t)&unk_256172BA8, (uint64_t)v14);
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
  v13[4] = &unk_256172B78;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256172B80;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_2346F6DA0((uint64_t)v9, (uint64_t)&unk_256172B88, (uint64_t)v14);
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
  v13[4] = &unk_256172B58;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256172B60;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_2346F6DA0((uint64_t)v9, (uint64_t)&unk_256172B68, (uint64_t)v14);
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
  v13[4] = &unk_256172B48;
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
