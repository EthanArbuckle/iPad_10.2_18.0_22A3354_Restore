@implementation ProtobufHelper

+ (void)processProtobuf:(id)a3 result:(id)a4 data:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;

  v8 = a3;
  swift_unknownObjectRetain();
  v9 = a5;
  v10 = sub_19A8C3E40();
  v12 = v11;

  swift_getObjCClassMetadata();
  swift_getObjectType();
  sub_19A853318(a3, a4, v10, v12);
  sub_19A833360(v10, v12);

  swift_unknownObjectRelease();
}

- (_TtC10CoreParsec14ProtobufHelper)init
{
  return (_TtC10CoreParsec14ProtobufHelper *)ProtobufHelper.init()();
}

@end
