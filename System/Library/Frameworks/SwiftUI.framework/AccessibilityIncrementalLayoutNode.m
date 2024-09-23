@implementation AccessibilityIncrementalLayoutNode

- (NSArray)accessibilityElements
{
  return (NSArray *)@objc AccessibilityNode._accessibilityNodeChildrenUnsorted.getter(self, (uint64_t)a2, 10, (uint64_t (*)(void))partial apply for implicit closure #1 in AccessibilityIncrementalLayoutNode.accessibilityElements.getter);
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

@end
