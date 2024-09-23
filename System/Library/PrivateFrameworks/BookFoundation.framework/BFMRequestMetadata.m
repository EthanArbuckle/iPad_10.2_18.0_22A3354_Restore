@implementation BFMRequestMetadata

- (BFMRequestMetadata)initWithFileID:(id)a3 line:(int)a4
{
  uint64_t v6;
  char *v7;
  uint64_t v8;
  objc_super v10;

  v6 = sub_21C458E64();
  v7 = (char *)self + OBJC_IVAR___BFMRequestMetadata_impl;
  *(_QWORD *)v7 = v6;
  *((_QWORD *)v7 + 1) = v8;
  *((_DWORD *)v7 + 4) = a4;
  v10.receiver = self;
  v10.super_class = (Class)BFMRequestMetadata;
  return -[BFMRequestMetadata init](&v10, sel_init);
}

- (NSString)fileID
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_21C458E40();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (int)line
{
  return *(_DWORD *)&self->impl[OBJC_IVAR___BFMRequestMetadata_impl + 8];
}

- (BFMRequestMetadata)init
{
  BFMRequestMetadata *result;

  result = (BFMRequestMetadata *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
