@implementation MFUIDSet

- (void).cxx_destruct
{
  swift_getObjectType();
  sub_1A513A000((uint64_t)self + OBJC_IVAR___MFUIDSet_underlying);
}

- (NSArray)uids
{
  MFUIDSet *v3;
  id v6;

  swift_getObjectType();
  v3 = self;
  sub_1A5377004();

  sub_1A5139B78();
  v6 = (id)sub_1A594B94C();
  swift_bridgeObjectRelease();
  return (NSArray *)v6;
}

- (int64_t)count
{
  MFUIDSet *v3;
  int64_t v6;

  swift_getObjectType();
  v3 = self;
  v6 = sub_1A53771A4();

  return v6;
}

- (MFUIDSet)init
{
  swift_getObjectType();
  sub_1A537723C();
}

- (MFUIDSet)initWithWrapper:(id)a3
{
  id v3;

  swift_getObjectType();
  v3 = a3;
  return (MFUIDSet *)sub_1A5377388((char *)a3);
}

- (MFUIDSet)initWithUIDs:(id)a3
{
  id v3;
  uint64_t v4;
  MFUIDSet *v7;

  swift_getObjectType();
  v3 = a3;
  sub_1A5139B78();
  v4 = sub_1A594B958();
  v7 = (MFUIDSet *)sub_1A537753C(v4);

  return v7;
}

@end
