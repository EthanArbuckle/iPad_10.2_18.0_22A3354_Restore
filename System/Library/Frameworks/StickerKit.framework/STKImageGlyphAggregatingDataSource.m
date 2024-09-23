@implementation STKImageGlyphAggregatingDataSource

- (BOOL)isEnabled
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___STKImageGlyphAggregatingDataSource_isEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setIsEnabled:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___STKImageGlyphAggregatingDataSource_isEnabled;
  swift_beginAccess();
  *v4 = a3;
}

- (int64_t)glyphType
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___STKImageGlyphAggregatingDataSource_glyphType);
  swift_beginAccess();
  return *v2;
}

- (void)setGlyphType:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___STKImageGlyphAggregatingDataSource_glyphType);
  swift_beginAccess();
  *v4 = a3;
}

- (STKImageGlyphAggregatingDataSource)initWithDataSources:(id)a3
{
  objc_class *v4;
  objc_super v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256174998);
  v4 = (objc_class *)sub_2347178BC();
  *((_BYTE *)&self->super.isa + OBJC_IVAR___STKImageGlyphAggregatingDataSource_isEnabled) = 1;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___STKImageGlyphAggregatingDataSource_glyphType) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___STKImageGlyphAggregatingDataSource_dataSources) = v4;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ImageGlyphAggregatingDataSource();
  return -[STKImageGlyphAggregatingDataSource init](&v6, sel_init);
}

- (void)configureWith:(id)a3
{
  id v4;
  STKImageGlyphAggregatingDataSource *v5;

  v4 = a3;
  v5 = self;
  sub_2345E7494((uint64_t)v4);

}

- (void)refresh
{
  STKImageGlyphAggregatingDataSource *v2;

  v2 = self;
  sub_2345E75F0();

}

- (NSArray)categories
{
  STKImageGlyphAggregatingDataSource *v2;
  void *v3;

  v2 = self;
  sub_2345E776C();

  type metadata accessor for ImageGlyphCategory(0);
  v3 = (void *)sub_2347178A4();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (int64_t)numberOfSections
{
  STKImageGlyphAggregatingDataSource *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_2345E78B8();

  return v3;
}

- (int64_t)numberOfItems
{
  STKImageGlyphAggregatingDataSource *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_2345E78F4();

  return v3;
}

- (id)sectionLayoutForSectionIndex:(int64_t)a3 environment:(id)a4
{
  STKImageGlyphAggregatingDataSource *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;

  swift_unknownObjectRetain();
  v7 = self;
  v8 = sub_2345EB7FC(a3);
  if (v8)
  {
    v10 = objc_msgSend(v8, sel_sectionLayoutForSectionIndex_environment_, v9, a4);
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
  }
  else
  {
    v11 = objc_allocWithZone((Class)type metadata accessor for ImageGlyphUIConfiguration());
    v12 = sub_2346B4CA4(0, 3);
    v10 = _s10StickerKit25ImageGlyphUIConfigurationC6layout3forSo25NSCollectionLayoutSectionCSo0hI11Environment_p_tF_0();
    swift_unknownObjectRelease();

  }
  return v10;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  STKImageGlyphAggregatingDataSource *v4;
  id v5;

  v4 = self;
  v5 = sub_2345E7C14(a3);

  return (int64_t)v5;
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  STKImageGlyphAggregatingDataSource *v4;
  id v5;

  v4 = self;
  v5 = sub_2345E7C58(a3);

  return (int64_t)v5;
}

- (id)itemAtIndexPath:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  STKImageGlyphAggregatingDataSource *v8;
  id v9;
  uint64_t v11;

  v4 = sub_234715B64();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_234715B1C();
  v8 = self;
  v9 = sub_2345E7DD8();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

- (id)snapshotIdentifiersInSection:(int64_t)a3
{
  STKImageGlyphAggregatingDataSource *v4;
  void *v5;
  uint64_t v6;
  STKImageGlyphAggregatingDataSource *v7;
  void *v8;

  v4 = self;
  v5 = sub_2345EB7FC(a3);
  if (v5)
  {
    v7 = (STKImageGlyphAggregatingDataSource *)objc_msgSend(v5, sel_snapshotIdentifiersInSection_, v6);
    sub_2347178BC();

    swift_unknownObjectRelease();
    v4 = v7;
  }

  v8 = (void *)sub_2347178A4();
  swift_bridgeObjectRelease();
  return v8;
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
  STKImageGlyphAggregatingDataSource *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2561718D0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
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
  v13[4] = &unk_256174980;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256174988;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_2346F6DA0((uint64_t)v9, (uint64_t)&unk_256174990, (uint64_t)v14);
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
  STKImageGlyphAggregatingDataSource *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2561718D0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
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
  v13[4] = &unk_256174960;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256174968;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_2346F6DA0((uint64_t)v9, (uint64_t)&unk_256174970, (uint64_t)v14);
  swift_release();
}

- (id)indexPathForItem:(id)a3
{
  return sub_2345EA964(self, (uint64_t)a2, a3, (void (*)(id))sub_2345E8BC0);
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
  STKImageGlyphAggregatingDataSource *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2561718D0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
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
  v13[4] = &unk_256174940;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256174948;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_2346F6DA0((uint64_t)v9, (uint64_t)&unk_256174950, (uint64_t)v14);
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
  STKImageGlyphAggregatingDataSource *v17;
  uint64_t v18;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2561718D0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
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
  v15[4] = &unk_256174920;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_256174928;
  v16[5] = v15;
  v17 = self;
  sub_2346F6DA0((uint64_t)v11, (uint64_t)&unk_256174930, (uint64_t)v16);
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
  STKImageGlyphAggregatingDataSource *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2561718D0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
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
  v15[4] = &unk_256174900;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_256174908;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_2346F6DA0((uint64_t)v11, (uint64_t)&unk_256174910, (uint64_t)v16);
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
  STKImageGlyphAggregatingDataSource *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2561718D0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
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
  v13[4] = &unk_2561748E0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2561748E8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_2346F6DA0((uint64_t)v9, (uint64_t)&unk_2561748F0, (uint64_t)v14);
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
  STKImageGlyphAggregatingDataSource *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2561718D0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
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
  v13[4] = &unk_2561748D0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256179330;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_2346F6DA0((uint64_t)v9, (uint64_t)&unk_256176470, (uint64_t)v14);
  swift_release();
}

- (id)indexPathForCategory:(id)a3
{
  return sub_2345EA964(self, (uint64_t)a2, a3, (void (*)(id))sub_2345EA740);
}

- (id)indexPathForItemAtIndex:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  char **v7;
  STKImageGlyphAggregatingDataSource *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256171710);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char **)((char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = self;
  sub_2345EAA48(a3, v7);

  v9 = sub_234715B64();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = 0;
  if ((*(unsigned int (**)(char **, uint64_t, uint64_t))(v10 + 48))(v7, 1, v9) != 1)
  {
    v11 = (void *)sub_234715B10();
    (*(void (**)(char **, uint64_t))(v10 + 8))(v7, v9);
  }
  return v11;
}

- (id)indexPathForIdentifier:(id)a3 ofType:(int64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  STKImageGlyphAggregatingDataSource *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256171710);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_234717754();
  v9 = self;
  sub_2345EAE44((char **)a4, (uint64_t)v8);

  swift_bridgeObjectRelease();
  v10 = sub_234715B64();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1)
  {
    v12 = (void *)sub_234715B10();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
  }
  return v12;
}

- (int64_t)numberOfItemsInCategory:(id)a3
{
  uint64_t (*v4)(id);
  id v5;
  STKImageGlyphAggregatingDataSource *v6;
  void *v7;
  id v8;

  v4 = *(uint64_t (**)(id))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.isa) + 0x1C0);
  v5 = a3;
  v6 = self;
  v7 = (void *)v4(v5);
  if (v7)
  {
    v8 = objc_msgSend(v7, sel_numberOfItemsInCategory_, v5);

    swift_unknownObjectRelease();
    return (int64_t)v8;
  }
  else
  {

    return 0;
  }
}

- (int64_t)numberOfItemsInCategoryIndex:(int64_t)a3
{
  _QWORD *v4;
  uint64_t (*v5)(void);
  STKImageGlyphAggregatingDataSource *v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  int64_t result;
  STKImageGlyphAggregatingDataSource *v11;
  STKImageGlyphAggregatingDataSource *v12;
  int64_t v13;

  v4 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v5 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.isa) + 0xD0);
  v6 = self;
  v7 = v5();
  if (v7 >> 62)
    v8 = sub_2347180CC();
  else
    v8 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
  v9 = swift_bridgeObjectRelease();
  if (v8 <= a3)
  {
    v13 = 0;
    goto LABEL_10;
  }
  result = ((uint64_t (*)(uint64_t))v5)(v9);
  if ((result & 0xC000000000000001) != 0)
  {
    v11 = (STKImageGlyphAggregatingDataSource *)MEMORY[0x234943800](a3, result);
    goto LABEL_8;
  }
  if (a3 < 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((result & 0xFFFFFFFFFFFFF8) + 0x10) > (unint64_t)a3)
  {
    v11 = (STKImageGlyphAggregatingDataSource *)*(id *)(result + 8 * a3 + 32);
LABEL_8:
    v12 = v11;
    swift_bridgeObjectRelease();
    v13 = (*(uint64_t (**)(STKImageGlyphAggregatingDataSource *))((*v4 & (uint64_t)v6->super.isa) + 0x170))(v12);

    v6 = v12;
LABEL_10:

    return v13;
  }
  __break(1u);
  return result;
}

- (int64_t)categoryIndexForIndexPath:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  STKImageGlyphAggregatingDataSource *v8;
  int64_t v9;
  uint64_t v11;

  v4 = sub_234715B64();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_234715B1C();
  v8 = self;
  v9 = sub_2345EB3D4((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

- (STKImageGlyphAggregatingDataSource)init
{
  STKImageGlyphAggregatingDataSource *result;

  result = (STKImageGlyphAggregatingDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
