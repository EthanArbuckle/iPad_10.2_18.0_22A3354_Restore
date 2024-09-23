@implementation EKRemoteUIDeserializedObject

- (EKObject)deserializedObject
{
  return (EKObject *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC8EventKit28EKRemoteUIDeserializedObject_deserializedObject));
}

- (NSDictionary)tempObjectIDMap
{
  void *v2;

  sub_1A2424D0C(0, &qword_1EE667958);
  sub_1A2424CC0(&qword_1EE667968, &qword_1EE667958);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A2435A28();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (_TtC8EventKit28EKRemoteUIDeserializedObject)init
{
  _TtC8EventKit28EKRemoteUIDeserializedObject *result;

  result = (_TtC8EventKit28EKRemoteUIDeserializedObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8EventKit28EKRemoteUIDeserializedObject_deserializedObject));
  swift_bridgeObjectRelease();
}

@end
