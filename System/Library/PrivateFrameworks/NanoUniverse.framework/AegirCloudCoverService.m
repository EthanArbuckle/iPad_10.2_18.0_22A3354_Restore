@implementation AegirCloudCoverService

- (NUNIFileConverter)fileConverter
{
  swift_beginAccess();
  return (NUNIFileConverter *)(id)swift_unknownObjectRetain();
}

- (void)setFileConverter:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_fileConverter);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (BOOL)disableFetch
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_disableFetch;
  swift_beginAccess();
  return *v2;
}

- (void)setDisableFetch:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_disableFetch;
  swift_beginAccess();
  *v4 = a3;
}

- (NSURL)directory
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  void *v9;
  uint64_t v11;

  v3 = sub_2134D8E18();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (char *)self + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_directory;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v8, v3);
  v9 = (void *)sub_2134D8DD0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  return (NSURL *)v9;
}

- (void)setDirectory:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  char *v13;
  void (*v14)(char *, _BYTE *, uint64_t);
  _TtC12NanoUniverse22AegirCloudCoverService *v15;
  void (*v16)(_BYTE *, uint64_t);
  _BYTE v17[24];

  v4 = sub_2134D8E18();
  v5 = *(_QWORD *)(v4 - 8);
  v7 = MEMORY[0x24BDAC7A8](v4, v6);
  v9 = &v17[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v7, v10);
  v12 = &v17[-v11];
  sub_2134D8DF4();
  v13 = (char *)self + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_directory;
  swift_beginAccess();
  (*(void (**)(_BYTE *, char *, uint64_t))(v5 + 16))(v9, v13, v4);
  swift_beginAccess();
  v14 = *(void (**)(char *, _BYTE *, uint64_t))(v5 + 24);
  v15 = self;
  v14(v13, v12, v4);
  swift_endAccess();
  sub_2134C7688();
  v16 = *(void (**)(_BYTE *, uint64_t))(v5 + 8);
  v16(v12, v4);
  v16(v9, v4);

}

- (_TtC12NanoUniverse22AegirCloudCoverService)initWithImageScale:(float)a3
{
  id v4;
  _TtC12NanoUniverse22AegirCloudCoverService *v5;
  _OWORD v7[2];
  uint64_t v8;
  uint64_t v9;
  _OWORD v10[2];
  uint64_t v11;
  uint64_t v12;

  static AegirCloudCoverService.Configuration.prodEnvironment.getter((unint64_t *)v10);
  v7[0] = v10[0];
  v7[1] = v10[1];
  v8 = v11;
  v9 = v12;
  v4 = objc_allocWithZone((Class)type metadata accessor for AegirCloudCoverService());
  v5 = (_TtC12NanoUniverse22AegirCloudCoverService *)AegirCloudCoverService.init(configuration:imageScale:)((uint64_t *)v7, a3);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v5;
}

- (void)retrieveCloudTextureURLsWithNotifyOn:(id)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC12NanoUniverse22AegirCloudCoverService *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_2134C8EEC(v8, (uint64_t)sub_2134D7DDC, v7);

  swift_release();
}

- (id)cloudTextureURLs
{
  _TtC12NanoUniverse22AegirCloudCoverService *v2;
  void *v3;

  v2 = self;
  sub_2134C91C4();

  sub_2134D8E18();
  v3 = (void *)sub_2134D9034();
  swift_bridgeObjectRelease();
  return v3;
}

- (BOOL)canFetchData
{
  _TtC12NanoUniverse22AegirCloudCoverService *v2;
  uint64_t v3;
  char v4;

  v2 = self;
  v4 = sub_2134C9770((uint64_t)v2, v3);

  return v4 & 1;
}

- (_TtC12NanoUniverse22AegirCloudCoverService)init
{
  _TtC12NanoUniverse22AegirCloudCoverService *result;

  result = (_TtC12NanoUniverse22AegirCloudCoverService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC12NanoUniverse22AegirCloudCoverService_directory;
  v4 = sub_2134D8E18();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

+ (NSString)cloudLevelPrefix
{
  return (NSString *)(id)sub_2134D8FE0();
}

+ (NSString)cloudLevelLowFileName
{
  return (NSString *)(id)sub_2134D8FE0();
}

+ (NSString)cloudLevelMidFileName
{
  return (NSString *)(id)sub_2134D8FE0();
}

+ (NSString)cloudLevelHighFileName
{
  return (NSString *)(id)sub_2134D8FE0();
}

- (id)urlForCloudLevelWith:(id)a3
{
  return sub_2134D2218(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))AegirCloudCoverService.urlForCloudLevel(with:));
}

- (id)currentURLForCloudLevelWith:(id)a3
{
  return sub_2134D2218(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))AegirCloudCoverService.currentURLForCloudLevel(with:));
}

- (NSArray)allCloudLevelFileNames
{
  void *v2;

  _s12NanoUniverse22AegirCloudCoverServiceC03allD14LevelFileNamesSaySSGvg_0();
  v2 = (void *)sub_2134D9034();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

@end
