@implementation CKAbstractWriteBatch

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v5;
  id v6;
  _OWORD v7[2];

  if (a3)
  {
    v5 = a4;
    swift_retain();
    swift_unknownObjectRetain();
    sub_1A4921018();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
    v6 = a4;
    swift_retain();
  }
  sub_1A4920D3C();

  sub_1A490293C((uint64_t)v7);
  swift_release();
  swift_bridgeObjectRelease();
  sub_1A48D2CD0((uint64_t)v7, &qword_1ED0C7AB0);
}

@end
