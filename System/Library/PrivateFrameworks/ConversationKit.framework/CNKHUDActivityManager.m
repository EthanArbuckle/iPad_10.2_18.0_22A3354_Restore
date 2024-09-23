@implementation CNKHUDActivityManager

+ (CNKHUDActivityManager)sharedManager
{
  return (CNKHUDActivityManager *)static HUDActivityManager.shared.getter();
}

- (CNKHUDActivityManager)init
{
  CNKHUDActivityManager *result;

  HUDActivityManager.init()();
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_unknownObjectWeakDestroy();
  swift_release();
  OUTLINED_FUNCTION_32_2();
}

@end
