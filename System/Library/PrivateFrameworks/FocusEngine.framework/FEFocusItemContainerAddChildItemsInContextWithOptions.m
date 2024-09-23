@implementation FEFocusItemContainerAddChildItemsInContextWithOptions

_FEFocusRegionContainerProxy *___FEFocusItemContainerAddChildItemsInContextWithOptions_block_invoke(uint64_t a1)
{
  _FEFocusRegionContainerProxy *v1;

  v1 = -[_FEFocusRegionContainerProxy initWithEnvironmentContainer:]([_FEFocusRegionContainerProxy alloc], "initWithEnvironmentContainer:", *(_QWORD *)(a1 + 32));
  -[_FEFocusRegionContainerProxy setShouldCreateRegionForOwningItem:](v1, "setShouldCreateRegionForOwningItem:", 0);
  -[_FEFocusRegionContainerProxy setShouldCreateRegionForGuideBehavior:](v1, "setShouldCreateRegionForGuideBehavior:", 0);
  -[_FEFocusRegionContainerProxy setAllowsLazyLoading:](v1, "setAllowsLazyLoading:", 0);
  return v1;
}

@end
