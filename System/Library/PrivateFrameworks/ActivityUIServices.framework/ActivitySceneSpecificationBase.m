@implementation ActivitySceneSpecificationBase

- (Class)settingsClass
{
  type metadata accessor for ActivitySceneSettings();
  return (Class)swift_getObjCClassFromMetadata();
}

- (Class)clientSettingsClass
{
  type metadata accessor for ActivitySceneClientSettings();
  return (Class)swift_getObjCClassFromMetadata();
}

- (Class)uiSceneMinimumClass
{
  type metadata accessor for ActivityScene();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC18ActivityUIServices30ActivitySceneSpecificationBase)init
{
  return (_TtC18ActivityUIServices30ActivitySceneSpecificationBase *)sub_22D814D5C(self, (uint64_t)a2, type metadata accessor for ActivitySceneSpecificationBase);
}

@end
