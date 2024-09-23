@implementation AATimestampGranularityFactory

+ (AATimestampGranularityFactory)shared
{
  if (qword_1ED1CB898 != -1)
    swift_once();
  return (AATimestampGranularityFactory *)(id)qword_1ED1CB888;
}

- (AATimestampGranularityFactory)initWithName:(id)a3
{
  AATimestampGranularityFactory *v4;
  AATimestampGranularityFactory *v5;

  sub_1A5F64130();
  v4 = self;
  v5 = (AATimestampGranularityFactory *)_s12AppAnalytics34BridgedTimestampGranularityFactoryC04makedE0yAA0cdE0OSSF_0();

  swift_bridgeObjectRelease();
  return v5;
}

- (AATimestampGranularityFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[AATimestampGranularityFactory init](&v3, sel_init);
}

@end
