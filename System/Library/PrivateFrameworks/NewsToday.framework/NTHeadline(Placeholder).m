@implementation NTHeadline(Placeholder)

- (BOOL)isHiddenFromAutoFavorites
{
  return 0;
}

- (NSArray)topicIDs
{
  return (NSArray *)MEMORY[0x24BDBD1A8];
}

@end
