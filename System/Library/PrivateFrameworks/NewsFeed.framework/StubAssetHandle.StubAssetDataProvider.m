@implementation StubAssetHandle.StubAssetDataProvider

- (NSData)data
{
  unint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = *(_QWORD *)&self->data[8];
  if (v2 >> 60 == 15)
  {
    v3 = 0;
  }
  else
  {
    v4 = *(_QWORD *)self->data;
    sub_1BA69D44C(v4, v2);
    v3 = (void *)sub_1BB86C6DC();
    sub_1BA69D490(v4, v2);
  }
  return (NSData *)v3;
}

- (NSString)filePath
{
  void *v2;

  if (*(_QWORD *)&self->filePath[8])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1BB872970();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (BOOL)isRawFileConsumable
{
  return 1;
}

@end
