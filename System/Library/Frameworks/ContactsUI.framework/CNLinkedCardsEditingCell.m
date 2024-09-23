@implementation CNLinkedCardsEditingCell

+ (BOOL)wantsHorizontalLayout
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory") ^ 1;
}

@end
