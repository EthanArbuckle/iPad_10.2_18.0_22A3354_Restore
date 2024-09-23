@implementation AVPlaybackRateCollection

+ (AVPlaybackRateCollection)collectionWithDefaultRates
{
  void *v2;
  void *v3;

  +[AVPlaybackSpeed systemDefaultSpeeds](AVPlaybackRate, "systemDefaultSpeeds");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVPlaybackSpeedCollection collectionWithSpeeds:](AVPlaybackRateCollection, "collectionWithSpeeds:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AVPlaybackRateCollection *)v3;
}

+ (AVPlaybackRateCollection)collectionWithRates:(id)a3
{
  return +[AVPlaybackSpeedCollection collectionWithSpeeds:](AVPlaybackRateCollection, "collectionWithSpeeds:", a3);
}

@end
