@implementation SKTwoErrorEvent

- (NSString)eventName
{
  void *v2;

  sub_1AC051CC8();
  v2 = (void *)sub_1AC0F79A8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (id)createPayload
{
  _TtC8StoreKit15SKTwoErrorEvent *v2;
  _QWORD *v3;
  void *v4;

  v2 = self;
  v3 = sub_1AC051CE4();

  if (v3)
  {
    sub_1AC051FF8();
    v4 = (void *)sub_1AC0F78F4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (_TtC8StoreKit15SKTwoErrorEvent)init
{
  return (_TtC8StoreKit15SKTwoErrorEvent *)sub_1AC051F40();
}

@end
