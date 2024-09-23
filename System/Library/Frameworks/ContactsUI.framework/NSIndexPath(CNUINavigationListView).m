@implementation NSIndexPath(CNUINavigationListView)

+ (uint64_t)indexPathForNavigationListItemIndex:()CNUINavigationListView
{
  return objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a3, 0);
}

@end
