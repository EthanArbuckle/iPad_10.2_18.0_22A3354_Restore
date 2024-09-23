@implementation AVExecutionEnvironment

+ (id)sharedExecutionEnvironment
{
  if (sharedExecutionEnvironment_onceToken != -1)
    dispatch_once(&sharedExecutionEnvironment_onceToken, &__block_literal_global_18);
  return (id)sharedExecutionEnvironment_sSharedExecutionEnvironment;
}

- (NSString)platformIdentifier
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "currentPlatformIdentifier");
}

+ (id)currentPlatformIdentifier
{
  id result;

  result = dispatch_get_specific(CFSTR("AVExecutionEnvironmentCurrentPlatformIdentifierKey"));
  if (!result)
    return CFSTR("AVPlatformIdentifierIOS");
  return result;
}

+ (void)initialize
{
  objc_opt_class();
}

AVExecutionEnvironment *__52__AVExecutionEnvironment_sharedExecutionEnvironment__block_invoke()
{
  AVExecutionEnvironment *result;

  result = objc_alloc_init(AVExecutionEnvironment);
  sharedExecutionEnvironment_sSharedExecutionEnvironment = (uint64_t)result;
  return result;
}

+ (void)setPlatformIdentifier:(id)a3 forQueue:(id)a4
{
  dispatch_queue_set_specific((dispatch_queue_t)a4, CFSTR("AVExecutionEnvironmentCurrentPlatformIdentifierKey"), a3, AVExecutionEnvironmentReleaseObject);
}

+ (void)resetPlatformIdentifierForQueue:(id)a3
{
  dispatch_queue_set_specific((dispatch_queue_t)a3, CFSTR("AVExecutionEnvironmentCurrentPlatformIdentifierKey"), 0, 0);
}

@end
