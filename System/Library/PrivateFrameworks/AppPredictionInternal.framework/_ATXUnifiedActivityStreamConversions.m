@implementation _ATXUnifiedActivityStreamConversions

+ (id)transitionPublisherFromSessionPublisher:(id)a3
{
  return (id)objc_msgSend(a3, "flatMapWithTransform:", &__block_literal_global_185);
}

+ (id)sessionPublisherFromTransitionPublisher:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0D81638];
  v4 = a3;
  objc_msgSend(v3, "tupleWithFirst:second:", 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scanWithInitial:nextPartialResult:", v5, &__block_literal_global_7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "filterWithIsIncluded:", &__block_literal_global_9_2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mapWithTransform:", &__block_literal_global_11_0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filterWithIsIncluded:", &__block_literal_global_14_2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
