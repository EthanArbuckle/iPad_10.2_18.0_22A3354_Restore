@implementation AVTClassicPresentationConfiguration

- (AVTClassicPresentationConfiguration)init
{

  +[AVTClassicPresentationConfiguration sharedConfiguration](AVTClassicPresentationConfiguration, "sharedConfiguration");
  return (AVTClassicPresentationConfiguration *)objc_claimAutoreleasedReturnValue();
}

+ (id)sharedConfiguration
{
  if (sharedConfiguration_onceToken != -1)
    dispatch_once(&sharedConfiguration_onceToken, &__block_literal_global_23);
  return (id)sharedConfiguration_sharedConfiguration;
}

void __58__AVTClassicPresentationConfiguration_sharedConfiguration__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[AVTPresentationConfiguration _initWithStyle:]([AVTClassicPresentationConfiguration alloc], "_initWithStyle:", 0);
  v1 = (void *)sharedConfiguration_sharedConfiguration;
  sharedConfiguration_sharedConfiguration = (uint64_t)v0;

}

@end
