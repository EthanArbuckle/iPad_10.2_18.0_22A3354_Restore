@implementation ARUIAnimationKeyCoordinator

+ (id)animationKeyForType:(unint64_t)a3 ringIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if ((unint64_t)a4 > 2)
  {
    v9 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(a1, "animationKeyFormatForType:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v6, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "animationKeyCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

+ (id)animationKeyCache
{
  if (animationKeyCache_onceToken != -1)
    dispatch_once(&animationKeyCache_onceToken, &__block_literal_global);
  return (id)animationKeyCache___animationKeyCache;
}

void __48__ARUIAnimationKeyCoordinator_animationKeyCache__block_invoke()
{
  void *v0;

  v0 = (void *)animationKeyCache___animationKeyCache;
  animationKeyCache___animationKeyCache = (uint64_t)&unk_24CED3518;

}

+ (id)animationKeyFormatForType:(unint64_t)a3
{
  if (a3 - 1 > 5)
    return CFSTR("percentage-%lu");
  else
    return off_24CEC5D90[a3 - 1];
}

@end
