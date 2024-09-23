@implementation MPModelMediaClip(MPCModelQueueFeederAdditions)

+ (id)mqf_requiredItemPlaybackProperties
{
  return +[MPCModelMediaClipAVItem requiredMediaClipProperties](MPCModelMediaClipAVItem, "requiredMediaClipProperties");
}

@end
