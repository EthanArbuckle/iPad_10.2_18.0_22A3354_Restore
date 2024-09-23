@implementation BCUIUtilities

+ (BOOL)isAX3PlusLayoutRequiredForContentSizeCategory:(id)a3
{
  return UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)a3, (UIContentSizeCategory)*MEMORY[0x1E0DC48D0]) == NSOrderedDescending;
}

+ (BOOL)isAX1PlusLayoutRequiredForContentSizeCategory:(id)a3
{
  NSString *v3;
  NSString *v4;
  BOOL v5;

  v3 = (NSString *)a3;
  v4 = (NSString *)*MEMORY[0x1E0DC48D8];
  if (UIContentSizeCategoryCompareToCategory(v3, (UIContentSizeCategory)*MEMORY[0x1E0DC48D8]))
    v5 = UIContentSizeCategoryCompareToCategory(v3, v4) == NSOrderedDescending;
  else
    v5 = 1;

  return v5;
}

@end
