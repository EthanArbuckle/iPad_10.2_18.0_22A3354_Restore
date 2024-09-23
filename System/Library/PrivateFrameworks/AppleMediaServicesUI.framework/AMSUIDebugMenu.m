@implementation AMSUIDebugMenu

+ (void)presentDebugMenuWithPresentingVC:(id)a3 debugInfo:(id)a4
{
  uint64_t v4;
  id v6;

  v4 = (uint64_t)a4;
  if (a4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254A9B3C8);
    v4 = sub_2112464BC();
  }
  swift_getObjCClassMetadata();
  v6 = a3;
  static DebugMenu.presentDebugMenu(presentingVC:debugInfo:)((uint64_t)v6, v4);

  swift_bridgeObjectRelease();
}

- (AMSUIDebugMenu)init
{
  return (AMSUIDebugMenu *)DebugMenu.init()();
}

@end
