@implementation MFPodcastsPlaybackDefaults

- (BOOL)shouldPreroll
{
  char v2;

  sub_210C492A4();
  return v2 & 1;
}

- (void)setShouldPreroll:(BOOL)a3
{
  sub_210C492F4(a3);
}

- (BOOL)allowScreenRecording
{
  char v2;

  sub_210C493E8();
  return v2 & 1;
}

- (void)setAllowScreenRecording:(BOOL)a3
{
  sub_210C49438(a3);
}

- (double)rewindOnInterruptionDuration
{
  return sub_210C49524();
}

- (void)setRewindOnInterruptionDuration:(double)a3
{
  sub_210C49574(a3);
}

- (MFPodcastsPlaybackDefaults)init
{
  return (MFPodcastsPlaybackDefaults *)PodcastsPlaybackDefaults.init()();
}

@end
