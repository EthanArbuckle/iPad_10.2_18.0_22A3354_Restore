@implementation MRUArtworkBackdropDataSource

- (void)addObserver:(id)a3
{
  MRUArtworkBackdropDataSource *v4;

  swift_unknownObjectRetain();
  v4 = self;
  ArtworkBackdropDataSource.addObserver(_:)();
  swift_unknownObjectRelease();

}

- (void)removeObserver:(id)a3
{
  unint64_t *v5;
  MRUArtworkBackdropDataSource *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = (unint64_t *)((char *)self + OBJC_IVAR___MRUArtworkBackdropDataSource_observers);
  swift_beginAccess();
  swift_unknownObjectRetain();
  v6 = self;
  v7 = sub_1AAAAA94C(v5, (uint64_t)a3);
  v8 = v7;
  if (*v5 >> 62)
  {
    swift_bridgeObjectRetain();
    v9 = sub_1AAABA808();
    swift_bridgeObjectRelease();
    if (v9 >= v8)
      goto LABEL_3;
  }
  else
  {
    v9 = *(_QWORD *)((*v5 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v9 >= v7)
    {
LABEL_3:
      sub_1AAAAAD68(v8, v9);
      swift_endAccess();
      swift_unknownObjectRelease();

      return;
    }
  }
  __break(1u);
}

- (id)backdropImageWithKey:(id)a3
{
  MRUArtworkBackdropDataSource *v4;
  void *v5;
  _BYTE v7[40];

  sub_1AAABA6F4();
  v4 = self;
  v5 = ArtworkBackdropDataSource.backdropImage(key:)((uint64_t)v7);

  sub_1AAAA310C((uint64_t)v7);
  return v5;
}

- (BOOL)hasLoadedBackdropImageFor:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  MRUArtworkBackdropDataSource *v6;
  char v7;
  _BYTE v9[40];

  sub_1AAABA6F4();
  v4 = (uint64_t *)((char *)self + OBJC_IVAR___MRUArtworkBackdropDataSource_loadedBackdropImageKeys);
  swift_beginAccess();
  v5 = *v4;
  v6 = self;
  swift_bridgeObjectRetain();
  v7 = sub_1AAAA5194((uint64_t)v9, v5);

  swift_bridgeObjectRelease();
  sub_1AAAA310C((uint64_t)v9);
  return v7 & 1;
}

- (void)cleanUpWithKey:(id)a3
{
  MRUArtworkBackdropDataSource *v4;
  _BYTE v5[40];

  sub_1AAABA6F4();
  v4 = self;
  ArtworkBackdropDataSource.cleanUp(key:)((uint64_t)v5);

  sub_1AAAA310C((uint64_t)v5);
}

- (void)loadBackdropImageWithArtworkImage:(id)a3 backdropSize:(CGSize)a4 key:(id)a5 overrideLoadedImage:(BOOL)a6
{
  double height;
  double width;
  id v10;
  MRUArtworkBackdropDataSource *v11;
  _BYTE v12[40];

  height = a4.height;
  width = a4.width;
  sub_1AAABA6F4();
  v10 = a3;
  v11 = self;
  _s13MediaControls25ArtworkBackdropDataSourceC04loadD5Image07artworkH012backdropSize3key014overrideLoadedH0ySo7UIImageCSg_So6CGSizeVs11AnyHashableVSbtF_0(a3, (uint64_t)v12, width, height);

  sub_1AAAA310C((uint64_t)v12);
}

- (void)loadBackdropImageWithArtworkImage:(id)a3 backdropSize:(CGSize)a4 key:(id)a5
{
  double height;
  double width;
  void (*v9)(id, _BYTE *, _QWORD, double, double);
  id v10;
  MRUArtworkBackdropDataSource *v11;
  _BYTE v12[40];

  height = a4.height;
  width = a4.width;
  sub_1AAABA6F4();
  v9 = *(void (**)(id, _BYTE *, _QWORD, double, double))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa)
                                                                  + 0x120);
  v10 = a3;
  v11 = self;
  v9(a3, v12, 0, width, height);

  sub_1AAAA310C((uint64_t)v12);
}

- (MRUArtworkBackdropDataSource)init
{
  objc_class *v2;
  objc_super v4;

  v2 = (objc_class *)MEMORY[0x1E0DEE9E0];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRUArtworkBackdropDataSource_backdropImages) = (Class)MEMORY[0x1E0DEE9E0];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRUArtworkBackdropDataSource_loadedArtworkImages) = v2;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRUArtworkBackdropDataSource_loadBackdropImageTasks) = v2;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRUArtworkBackdropDataSource_loadedBackdropImageKeys) = (Class)MEMORY[0x1E0DEE9E8];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRUArtworkBackdropDataSource_observers) = (Class)MEMORY[0x1E0DEE9D8];
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ArtworkBackdropDataSource();
  return -[MRUArtworkBackdropDataSource init](&v4, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
