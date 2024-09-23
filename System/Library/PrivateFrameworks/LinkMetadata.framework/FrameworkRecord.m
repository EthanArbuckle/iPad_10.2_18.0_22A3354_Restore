@implementation FrameworkRecord

- (_TtC12LinkMetadata15FrameworkRecord)init
{
  FrameworkRecord.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(char *, uint64_t);

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC12LinkMetadata15FrameworkRecord_frameworkURL;
  v4 = OUTLINED_FUNCTION_134();
  OUTLINED_FUNCTION_2_13((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11, v19, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8));
  OUTLINED_FUNCTION_2_13((uint64_t)self + OBJC_IVAR____TtC12LinkMetadata15FrameworkRecord_bundleURL, v12, v13, v14, v15, v16, v17, v18, v20, v21);
  v22((char *)self + OBJC_IVAR____TtC12LinkMetadata15FrameworkRecord_metadataURL, v4);
}

@end
