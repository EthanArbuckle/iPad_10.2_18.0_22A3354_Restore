@implementation MLHostResult

- (_TtC20LighthouseBackground12MLHostResult)init
{
  objc_class *ObjectType;
  _QWORD *v4;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC20LighthouseBackground12MLHostResult_status) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC20LighthouseBackground12MLHostResult_policy) = (Class)1;
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC20LighthouseBackground12MLHostResult_error);
  *v4 = 0;
  v4[1] = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return -[MLHostResult init](&v6, sel_init);
}

- (NSString)description
{
  return (NSString *)sub_2402AD23C(self, (uint64_t)a2, (void (*)(void))MLHostResult.description.getter);
}

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_256FE1081;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_256FE1081 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC20LighthouseBackground12MLHostResult *v5;

  v4 = a3;
  v5 = self;
  MLHostResult.encode(with:)((NSCoder)v4);

}

- (_TtC20LighthouseBackground12MLHostResult)initWithCoder:(id)a3
{
  return (_TtC20LighthouseBackground12MLHostResult *)MLHostResult.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
