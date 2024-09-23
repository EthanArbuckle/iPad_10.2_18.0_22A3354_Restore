@implementation NSMutableArray(AXExtras)

- (void)ax_removeObjectsFromArrayUsingBlock:()AXExtras
{
  id v2;

  objc_msgSend(a1, "indexesOfObjectsPassingTest:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "removeObjectsAtIndexes:", v2);

}

@end
