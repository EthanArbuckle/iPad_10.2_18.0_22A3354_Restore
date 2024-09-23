@implementation StickerGlyphDataSource

- (BOOL)isEnabled
{
  char *v3;
  unsigned __int8 *v4;
  unsigned __int8 v5;
  char v6;

  swift_retain();
  v3 = (char *)sub_234657FE4();
  v4 = (unsigned __int8 *)(*(_QWORD *)&v3[OBJC_IVAR____TtC10StickerKit25ImageGlyphUIConfiguration_viewConfiguration]
                         + OBJC_IVAR___STKImageGlyphViewConfiguration_doesSupportImageGlyph);
  swift_beginAccess();
  LODWORD(v4) = *v4;

  if ((_DWORD)v4 == 1)
  {
    v5 = self->_deviceIsLocked[0];
    swift_release();
    v6 = v5 ^ 1;
  }
  else
  {
    swift_release();
    v6 = 0;
  }
  return v6 & 1;
}

- (int64_t)glyphType
{
  return 1;
}

- (NSArray)categories
{
  return (NSArray *)sub_23465DD10((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_234657CE8);
}

- (void)configureWith:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = (*((uint64_t (**)(_TtC10StickerKit22StickerGlyphDataSource *, SEL))self->super.isa + 25))(self, a2);
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
  sub_2346582CC();
  swift_release();
}

- (int64_t)numberOfSections
{
  return 1;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  int64_t v4;

  v4 = *(_QWORD *)&self->lastCount[7];
  swift_retain();
  if (v4 < 0)
  {
    sub_23465959C();
    v4 = *(_QWORD *)&self->lastCount[7];
  }
  swift_release();
  return v4;
}

- (int64_t)numberOfItems
{
  int64_t v3;

  v3 = *(_QWORD *)&self->lastCount[7];
  swift_retain();
  if (v3 < 0)
  {
    sub_23465959C();
    v3 = *(_QWORD *)&self->lastCount[7];
  }
  swift_release();
  return v3;
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  id v3;
  int64_t v4;

  swift_retain();
  v3 = sub_234657FE4();
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
  v4 = sub_234657FE4();
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
  char *v7;
  uint64_t v9;

  v3 = sub_234715B64();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_234715B1C();
  swift_retain();
  v7 = sub_2346586C8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7;
}

- (id)snapshotIdentifiersInSection:(int64_t)a3
{
  void *v4;

  swift_retain();
  sub_23465899C(a3);
  swift_release();
  v4 = (void *)sub_2347178A4();
  swift_bridgeObjectRelease();
  return v4;
}

- (id)indexPathForCategory:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t (*v8)(uint64_t);
  id v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256171710);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (uint64_t (*)(uint64_t))*((_QWORD *)self->super.isa + 28);
  v9 = a3;
  v10 = swift_retain();
  v11 = v8(v10);
  v12 = v9;
  LOBYTE(v9) = sub_23465E624(v11, (uint64_t)v12);
  swift_bridgeObjectRelease();

  if ((v9 & 1) != 0)
  {
    MEMORY[0x234941358](0, 0);
    v13 = sub_234715B64();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v7, 0, 1, v13);
  }
  else
  {
    v13 = sub_234715B64();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v7, 1, 1, v13);
  }

  swift_release();
  sub_234715B64();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v7, 1, v13) != 1)
  {
    v15 = (void *)sub_234715B10();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v7, v13);
  }
  return v15;
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
  sub_2346590C8(a3, (uint64_t)v6);
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
  sub_234659234(v8, v10, a4, (uint64_t)v7);
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
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  int64_t v7;
  uint64_t v9;

  v3 = sub_234715B64();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_234715B1C();
  if (sub_234715B4C() <= 0)
    v7 = 0;
  else
    v7 = -1;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7;
}

- (int64_t)numberOfItemsInCategory:(id)a3
{
  int64_t v4;
  id v5;

  v4 = *(_QWORD *)&self->lastCount[7];
  v5 = a3;
  swift_retain();
  if (v4 < 0)
  {
    sub_23465959C();
    v4 = *(_QWORD *)&self->lastCount[7];
  }

  swift_release();
  return v4;
}

- (void)fetchStickersWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2561718D0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_2347179AC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_256177A68;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_256177A70;
  v12[5] = v11;
  swift_retain();
  sub_2346F6DA0((uint64_t)v7, (uint64_t)&unk_256177A78, (uint64_t)v12);
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
  v13[4] = &unk_256177A48;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256177A50;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_2346F6DA0((uint64_t)v9, (uint64_t)&unk_256177A58, (uint64_t)v14);
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
  v13[4] = &unk_256177A28;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256177A30;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_2346F6DA0((uint64_t)v9, (uint64_t)&unk_256177A38, (uint64_t)v14);
  swift_release();
}

- (id)indexPathForItem:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256171710);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a3;
  swift_retain();
  sub_23465AE64((uint64_t)v7, (uint64_t)v6);

  swift_release();
  v8 = sub_234715B64();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    v10 = (void *)sub_234715B10();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }
  return v10;
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
  v13[4] = &unk_256177A08;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256177A10;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_2346F6DA0((uint64_t)v9, (uint64_t)&unk_256177A18, (uint64_t)v14);
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
  v15[4] = &unk_2561779E8;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2561779F0;
  v16[5] = v15;
  swift_retain();
  sub_2346F6DA0((uint64_t)v11, (uint64_t)&unk_2561779F8, (uint64_t)v16);
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
  v15[4] = &unk_2561779D0;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2561793D0;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  swift_retain();
  sub_2346F6DA0((uint64_t)v11, (uint64_t)&unk_2561779D8, (uint64_t)v16);
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
  v13[4] = &unk_2561779C0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256172BD8;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_2346F6DA0((uint64_t)v9, (uint64_t)&unk_256172BE0, (uint64_t)v14);
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
  v13[4] = &unk_2561779A0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2561779A8;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_2346F6DA0((uint64_t)v9, (uint64_t)&unk_2561779B0, (uint64_t)v14);
  swift_release();
}

@end
