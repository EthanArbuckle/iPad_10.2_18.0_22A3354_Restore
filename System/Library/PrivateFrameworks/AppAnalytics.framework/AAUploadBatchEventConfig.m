@implementation AAUploadBatchEventConfig

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR___AAUploadBatchEventConfig_directory;
  v3 = sub_1A5F63DD0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

+ (AAUploadBatchEventConfig)default
{
  if (qword_1ED1CE580 != -1)
    swift_once();
  return (AAUploadBatchEventConfig *)(id)qword_1ED1CE4E0;
}

- (int64_t)maxEventsPerSessionBatch
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___AAUploadBatchEventConfig_maxEventsPerSessionBatch);
}

- (int64_t)maxByteSizePerSessionBatch
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___AAUploadBatchEventConfig_maxByteSizePerSessionBatch);
}

- (BOOL)transparencyLoggingEnabled
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___AAUploadBatchEventConfig_transparencyLoggingEnabled);
}

- (BOOL)debuggingEnabled
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___AAUploadBatchEventConfig_debuggingEnabled);
}

- (int64_t)maxUploadTries
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___AAUploadBatchEventConfig_maxUploadTries);
}

- (NSURL)directory
{
  return (NSURL *)(id)sub_1A5F63D64();
}

- (AAUploadBatchEventConfig)initWithBatchSize:(int64_t)a3 enableDebugging:(BOOL)a4
{
  return (AAUploadBatchEventConfig *)UploadBatchEventConfig.init(batchSize:batchDebugging:)(a3, a4);
}

- (id)withMaxEventsPerSessionBatch:(int64_t)a3
{
  AAUploadBatchEventConfig *v4;
  id v5;

  v4 = self;
  v5 = UploadBatchEventConfig.with(maxEventsPerSessionBatch:)(a3);

  return v5;
}

- (id)withMaxByteSizePerSessionBatch:(int64_t)a3
{
  AAUploadBatchEventConfig *v4;
  id v5;

  v4 = self;
  v5 = UploadBatchEventConfig.with(maxByteSizePerSessionBatch:)(a3);

  return v5;
}

- (id)withTransparencyLoggingEnabled:(BOOL)a3
{
  _BOOL4 v3;
  AAUploadBatchEventConfig *v4;
  id v5;

  v3 = a3;
  v4 = self;
  v5 = UploadBatchEventConfig.with(transparencyLoggingEnabled:)(v3);

  return v5;
}

- (id)withDebuggingEnabled:(BOOL)a3
{
  _BOOL4 v3;
  AAUploadBatchEventConfig *v4;
  id v5;

  v3 = a3;
  v4 = self;
  v5 = UploadBatchEventConfig.with(debuggingEnabled:)(v3);

  return v5;
}

- (id)withMaxUploadTries:(int64_t)a3
{
  AAUploadBatchEventConfig *v4;
  id v5;

  v4 = self;
  v5 = UploadBatchEventConfig.with(maxUploadTries:)(a3);

  return v5;
}

- (id)withDirectory:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  AAUploadBatchEventConfig *v8;
  id v9;
  uint64_t v11;

  v4 = sub_1A5F63DD0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A5F63D94();
  v8 = self;
  v9 = UploadBatchEventConfig.with(directory:)((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

- (AAUploadBatchEventConfig)init
{
  AAUploadBatchEventConfig *result;

  result = (AAUploadBatchEventConfig *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
