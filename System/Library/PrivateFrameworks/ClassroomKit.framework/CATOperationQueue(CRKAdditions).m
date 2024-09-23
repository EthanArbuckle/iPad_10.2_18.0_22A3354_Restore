@implementation CATOperationQueue(CRKAdditions)

+ (id)crk_backgroundQueue
{
  if (crk_backgroundQueue_onceToken != -1)
    dispatch_once(&crk_backgroundQueue_onceToken, &__block_literal_global_66);
  return (id)crk_backgroundQueue_backgroundQueue;
}

@end
