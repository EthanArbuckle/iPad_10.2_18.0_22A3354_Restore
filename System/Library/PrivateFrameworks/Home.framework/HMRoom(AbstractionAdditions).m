@implementation HMRoom(AbstractionAdditions)

- (id)hf_accessoryLikeObjects
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a1, "accessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_flatMap:", &__block_literal_global_46_1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
