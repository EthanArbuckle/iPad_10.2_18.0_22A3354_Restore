@implementation AccountInfo

- (BOOL)isEqual:(id)a3
{
  _TtC20FaceTimeMessageStore11AccountInfo *v4;
  _TtC20FaceTimeMessageStore11AccountInfo *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_23B3D5774();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = AccountInfo.isEqual(_:)((uint64_t)v8);

  sub_23B337418((uint64_t)v8);
  return v6 & 1;
}

- (NSString)description
{
  _TtC20FaceTimeMessageStore11AccountInfo *v2;
  void *v3;

  v2 = self;
  AccountInfo.description.getter();

  v3 = (void *)sub_23B3D5228();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC20FaceTimeMessageStore11AccountInfo)init
{
  AccountInfo.init()();
}

@end
