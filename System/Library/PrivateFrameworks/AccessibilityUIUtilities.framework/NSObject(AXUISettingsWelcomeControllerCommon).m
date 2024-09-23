@implementation NSObject(AXUISettingsWelcomeControllerCommon)

- (id)ax_buddyObservedTableViews
{
  return objc_getAssociatedObject(a1, &__NSObject__ax_buddyObservedTableViews);
}

- (uint64_t)ax_setBuddyObservedTableViews:()AXUISettingsWelcomeControllerCommon
{
  return __UIAccessibilitySetAssociatedObject();
}

- (id)ax_buddyDynamicHeightConstraints
{
  return objc_getAssociatedObject(a1, &__NSObject__ax_buddyDynamicHeightConstraints);
}

- (uint64_t)ax_setBuddyDynamicHeightConstraints:()AXUISettingsWelcomeControllerCommon
{
  return __UIAccessibilitySetAssociatedObject();
}

@end
