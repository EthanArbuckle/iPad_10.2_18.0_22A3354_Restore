@implementation STKImageGlyphDataSource

+ (STKImageGlyphDataSource)sharedInstance
{
  if (qword_256171748 != -1)
    swift_once();
  return (STKImageGlyphDataSource *)(id)qword_256171740;
}

- (NSDiffableDataSourceSnapshot)snapshot
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  os_unfair_lock_s *v7;
  os_unfair_lock_s *v8;
  STKImageGlyphDataSource *v9;
  void *v10;
  _BYTE v12[16];
  uint64_t (*v13)@<X0>(uint64_t@<X8>);
  char *v14;
  char v15;
  STKImageGlyphDataSource *v16;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256171820);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = *(os_unfair_lock_s **)((char *)&self->super.super.isa + OBJC_IVAR___STKImageGlyphDataSource_lock);
  v16 = self;
  v13 = sub_2346BBD64;
  v14 = &v15;
  v8 = v7 + 4;
  v9 = self;
  os_unfair_lock_lock(v8);
  sub_2346BBD7C();
  os_unfair_lock_unlock(v8);

  v10 = (void *)sub_234716320();
  (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
  return (NSDiffableDataSourceSnapshot *)v10;
}

- (void)setSnapshot:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  STKImageGlyphDataSource *v7;
  uint64_t v8;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256171820);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2345B0BE8(0, &qword_256170D00);
  sub_2346BB510();
  sub_23471632C();
  v7 = self;
  sub_2346B6120((uint64_t)v6);

}

- (STKImageGlyphDataSource)init
{
  return (STKImageGlyphDataSource *)ImageGlyphDataSource.init()();
}

- (void)dealloc
{
  STKImageGlyphDataSource *v2;

  v2 = self;
  ImageGlyphDataSource.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR___STKImageGlyphDataSource__currentSnapshot;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256171820);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)configureWith:(id)a3
{
  STKImageGlyphDataSource *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_2346B6E54(v5);

}

- (void)refresh
{
  uint64_t v2;
  uint64_t v3;
  STKImageGlyphDataSource *v4;

  v2 = qword_256171780;
  v4 = self;
  if (v2 != -1)
    swift_once();
  sub_2346DD0D8();
  qword_256188040 = v3;
  swift_bridgeObjectRelease();
  sub_2345E75F0();
  if (qword_256171DA8 != -1)
    swift_once();
  sub_2346D1C24();

}

- (BOOL)canShowMemoji
{
  return sub_2346B74D8(self, (uint64_t)a2, (char **)2);
}

- (BOOL)canShowStickers
{
  return sub_2346B74D8(self, (uint64_t)a2, (char **)1);
}

- (BOOL)canShowEmoji
{
  return sub_2346B74D8(self, (uint64_t)a2, (char **)1);
}

- (int64_t)memojiCategoryIndex
{
  STKImageGlyphDataSource *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  sub_2346B75B8();
  v4 = v3;

  return v4;
}

- (int64_t)stickersCategoryIndex
{
  STKImageGlyphDataSource *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  sub_2346B7730();
  v4 = v3;

  return v4;
}

- (int64_t)recentCategoryIndex
{
  STKImageGlyphDataSource *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  sub_2346B78A8();
  v4 = v3;

  return v4;
}

- (int64_t)emojiCategoryIndex
{
  STKImageGlyphDataSource *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  sub_2346B7A20();
  v4 = v3;

  return v4;
}

- (int64_t)emojiPrefixSectionCount
{
  STKImageGlyphDataSource *v2;
  unint64_t v3;
  int64_t v4;
  int64_t v5;

  v2 = self;
  v3 = sub_2345EBA84((char **)3);
  v5 = v4;

  if (!v3)
    return 0;
  swift_unknownObjectRelease();
  return v5;
}

- (BOOL)isEmojiSection:(int64_t)a3
{
  STKImageGlyphDataSource *v4;

  v4 = self;
  LOBYTE(a3) = sub_2346B7BF8(a3);

  return a3 & 1;
}

- (BOOL)isRecentSection:(int64_t)a3
{
  STKImageGlyphDataSource *v4;

  v4 = self;
  LOBYTE(a3) = sub_2346B7D6C(a3);

  return a3 & 1;
}

- (BOOL)isMemojiSection:(int64_t)a3
{
  STKImageGlyphDataSource *v4;

  v4 = self;
  LOBYTE(a3) = sub_2346B7EE0(a3);

  return a3 & 1;
}

- (BOOL)isStickerSection:(int64_t)a3
{
  STKImageGlyphDataSource *v4;

  v4 = self;
  LOBYTE(a3) = sub_2346B8054(a3);

  return a3 & 1;
}

- (id)indexPathForCategoryIndex:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  STKImageGlyphDataSource *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256171710);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = self;
  sub_2346B81C8(a3, (uint64_t)v7);

  v9 = sub_234715B64();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v7, 1, v9) != 1)
  {
    v11 = (void *)sub_234715B10();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
  }
  return v11;
}

- (void)makeSnapshot
{
  STKImageGlyphDataSource *v2;

  v2 = self;
  sub_2346B8428();

}

- (id)imageGlyphCompositionalLayout
{
  STKImageGlyphDataSource *v2;
  id v3;

  v2 = self;
  v3 = sub_2346BB13C();

  return v3;
}

- (STKImageGlyphDataSource)initWithDataSources:(id)a3
{
  STKImageGlyphDataSource *result;

  result = (STKImageGlyphDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
