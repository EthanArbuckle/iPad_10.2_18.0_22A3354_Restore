@implementation BDSReadingHistoryServiceStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BDSReadingHistoryServiceStatus)initWithCoder:(id)a3
{
  BDSReadingHistoryServiceStatus *v4;

  swift_getObjectType();
  v4 = (BDSReadingHistoryServiceStatus *)sub_227DD338C(a3);
  swift_deallocPartialClassInstance();
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  BDSReadingHistoryServiceStatus *v5;

  v4 = a3;
  v5 = self;
  _s13BookDataStore27ReadingHistoryServiceStatusC6encode4withySo7NSCoderC_tF_0(v4);

}

- (BDSReadingHistoryServiceStatus)init
{
  BDSReadingHistoryServiceStatus *result;

  result = (BDSReadingHistoryServiceStatus *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BDSReadingHistoryServiceStatus)initWithIsLoaded:(BOOL)a3
{
  objc_class *ObjectType;
  _BYTE *v5;
  BDSReadingHistoryServiceStatus *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v5 = objc_allocWithZone(ObjectType);
  v5[OBJC_IVAR___BDSReadingHistoryServiceStatus_value] = a3;
  v8.receiver = v5;
  v8.super_class = ObjectType;
  v6 = -[BDSReadingHistoryServiceStatus init](&v8, sel_init);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v6;
}

- (BOOL)isLoaded
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___BDSReadingHistoryServiceStatus_value);
}

- (NSString)description
{
  BDSReadingHistoryServiceStatus *v2;
  void *v3;

  v2 = self;
  sub_227E6002C();
  swift_bridgeObjectRelease();
  sub_227E6002C();

  v3 = (void *)sub_227E5FF78();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end
