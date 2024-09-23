@implementation SNFileCopyingResult

- (NSString)filename
{
  void *v2;

  sub_1D44D425C();
  v2 = (void *)sub_1D451A6C8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (int64_t)fileSize
{
  return sub_1D44D42B4();
}

- (NSURL)itemURL
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t v8;

  v2 = sub_1D4519BC4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D44D4350((uint64_t)v5);
  v6 = (void *)sub_1D4519B28();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (NSURL *)v6;
}

- (SNFileCopyingResult)init
{
  SNFileCopyingResult.init()();
}

- (void).cxx_destruct
{
  sub_1D44D49C0((uint64_t)self + OBJC_IVAR___SNFileCopyingResult_impl);
}

@end
