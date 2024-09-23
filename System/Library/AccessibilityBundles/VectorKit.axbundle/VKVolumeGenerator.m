@implementation VKVolumeGenerator

- (VKVolumeGenerator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VKVolumeGenerator;
  return -[VKVolumeGenerator init](&v3, sel_init);
}

- (float)volumeForDepth:(int)a3 minDistanceThreshold:(int)a4 maxDistanceThreshold:(int)a5
{
  float result;

  result = 0.0;
  if ((a3 & 0x80000000) == 0)
  {
    result = 1.0;
    if (a3 >= a4)
    {
      result = 0.0;
      if (a3 <= a5)
      {
        result = (float)(a3 - a5) / (float)(a4 - a5);
        if (result < 0.1)
          return 0.1;
      }
    }
  }
  return result;
}

@end
