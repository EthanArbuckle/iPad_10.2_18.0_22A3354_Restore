@implementation EKRemoteUISerializedObject

- (NSDictionary)serializedObjectIDDictionary
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A2435A28();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (NSDictionary)objectIDToChangeSetDictionaryMap
{
  return (NSDictionary *)sub_1A2416A90();
}

- (NSDictionary)objectIDToPersistentDictionaryMap
{
  return (NSDictionary *)sub_1A2416A90();
}

- (_TtC8EventKit26EKRemoteUISerializedObject)init
{
  _TtC8EventKit26EKRemoteUISerializedObject *result;

  result = (_TtC8EventKit26EKRemoteUISerializedObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
