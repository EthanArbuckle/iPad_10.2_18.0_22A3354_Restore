@implementation _MPCPodcastsPlaybackRateHelper

+ (NSArray)supportedPlaybackRates
{
  void *v2;

  static PodcastsPlaybackRateHelper.supportedPlaybackRates.getter(a1, a2);
  v2 = (void *)sub_210E92CBC();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

+ (float)standardRate
{
  return 1.0;
}

- (_MPCPodcastsPlaybackRateHelper)initWithCurrentRate:(float)a3 playerState:(int64_t)a4 defaults:(id)a5
{
  swift_unknownObjectRetain();
  return (_MPCPodcastsPlaybackRateHelper *)PodcastsPlaybackRateHelper.init(currentRate:playerState:defaults:)(a4, (uint64_t)a5, a3);
}

- (_MPCPodcastsPlaybackRateHelper)initWithCurrentRate:(float)a3 playbackState:(int64_t)a4
{
  return (_MPCPodcastsPlaybackRateHelper *)PodcastsPlaybackRateHelper.init(currentRate:playbackState:)(a4, *(double *)&a3);
}

- (BOOL)supportsRate:(float)a3
{
  _MPCPodcastsPlaybackRateHelper *v4;
  Swift::Bool v5;

  v4 = self;
  v5 = PodcastsPlaybackRateHelper.supportsRate(_:)(a3);

  return v5;
}

- (BOOL)canHandlePlaybackRateChangeForCommandEvent:(id)a3
{
  id v4;
  _MPCPodcastsPlaybackRateHelper *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = PodcastsPlaybackRateHelper.canHandlePlaybackRateChange(forCommandEvent:)((MPChangePlaybackRateCommandEvent)v4);

  return self & 1;
}

- (float)updatedPlaybackRateForChangePlaybackRateCommandEvent:(id)a3
{
  id v4;
  _MPCPodcastsPlaybackRateHelper *v5;
  float v6;

  v4 = a3;
  v5 = self;
  v6 = PodcastsPlaybackRateHelper.updatedPlaybackRate(forChangePlaybackRateCommandEvent:)((MPChangePlaybackRateCommandEvent)v4);

  return v6;
}

- (void)saveWithRate:(float)a3
{
  _MPCPodcastsPlaybackRateHelper *v4;

  v4 = self;
  PodcastsPlaybackRateHelper.save(rate:)(a3);

}

- (float)preferredPlaybackRateForDisplay
{
  _MPCPodcastsPlaybackRateHelper *v2;
  float v3;
  float v4;

  v2 = self;
  PodcastsPlaybackRateHelper.preferredPlaybackRateForDisplay.getter();
  v4 = v3;

  return v4;
}

+ (float)preferredPlaybackRate
{
  float result;

  swift_getObjCClassMetadata();
  static PodcastsPlaybackRateHelper.preferredPlaybackRate.getter();
  return result;
}

+ (void)setPreferredPlaybackRate:(float)a3
{
  swift_getObjCClassMetadata();
  static PodcastsPlaybackRateHelper.preferredPlaybackRate.setter();
}

- (_MPCPodcastsPlaybackRateHelper)init
{
  PodcastsPlaybackRateHelper.init()();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end
