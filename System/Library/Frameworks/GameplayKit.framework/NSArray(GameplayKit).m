@implementation NSArray(GameplayKit)

- (uint64_t)shuffledArrayWithRandomSource:()GameplayKit
{
  return objc_msgSend(a3, "arrayByShufflingObjectsInArray:", a1);
}

- (id)shuffledArray
{
  void *v2;
  void *v3;

  +[GKRandomSource sharedRandom](GKRandomSource, "sharedRandom");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "shuffledArrayWithRandomSource:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
