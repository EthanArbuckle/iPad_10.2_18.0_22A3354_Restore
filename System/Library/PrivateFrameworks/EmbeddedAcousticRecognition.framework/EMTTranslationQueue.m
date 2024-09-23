@implementation EMTTranslationQueue

+ (id)createTranslationQueue
{
  return dispatch_queue_create("com.apple.sequoia", 0);
}

+ (id)globalTranslationQueue
{
  if (+[EMTTranslationQueue globalTranslationQueue]::once != -1)
    dispatch_once(&+[EMTTranslationQueue globalTranslationQueue]::once, &__block_literal_global_5);
  return (id)+[EMTTranslationQueue globalTranslationQueue]::queue;
}

void __45__EMTTranslationQueue_globalTranslationQueue__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[EMTTranslationQueue createTranslationQueue](EMTTranslationQueue, "createTranslationQueue");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[EMTTranslationQueue globalTranslationQueue]::queue;
  +[EMTTranslationQueue globalTranslationQueue]::queue = v0;

}

@end
