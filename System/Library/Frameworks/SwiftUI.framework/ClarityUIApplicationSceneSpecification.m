@implementation ClarityUIApplicationSceneSpecification

- (Class)settingsClass
{
  type metadata accessor for ClarityUIApplicationSceneSettings();
  return (Class)swift_getObjCClassFromMetadata();
}

- (Class)clientSettingsClass
{
  type metadata accessor for ClarityUIApplicationSceneClientSettings();
  return (Class)swift_getObjCClassFromMetadata();
}

- (NSString)uiSceneSessionRole
{
  uint64_t v2;
  _TtC7SwiftUI38ClarityUIApplicationSceneSpecification *v3;
  NSString *v4;

  v2 = one-time initialization token for clarityUI;
  v3 = self;
  if (v2 != -1)
    swift_once();
  v4 = (NSString *)(id)static UISceneSessionRole.clarityUI;

  return v4;
}

- (Class)uiSceneMinimumClass
{
  type metadata accessor for ClarityUIWindowScene();
  return (Class)swift_getObjCClassFromMetadata();
}

- (NSArray)initialSettingsDiffActions
{
  return (NSArray *)@objc ClarityUIApplicationSceneSpecification.initialSettingsDiffActions.getter(self, (uint64_t)a2, (void (*)(void))ClarityUIApplicationSceneSpecification.initialSettingsDiffActions.getter, &lazy cache variable for type metadata for _UISceneSettingsDiffAction);
}

- (NSArray)initialActionHandlers
{
  return (NSArray *)@objc ClarityUIApplicationSceneSpecification.initialSettingsDiffActions.getter(self, (uint64_t)a2, (void (*)(void))ClarityUIApplicationSceneSpecification.initialActionHandlers.getter, &lazy cache variable for type metadata for _UISceneBSActionHandler);
}

- (_TtC7SwiftUI38ClarityUIApplicationSceneSpecification)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ClarityUIApplicationSceneSpecification();
  return -[ClarityUIApplicationSceneSpecification init](&v3, sel_init);
}

@end
