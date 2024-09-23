@implementation _MPCPodcastsSharedDefaults

- (float)preferredPlaybackRate
{
  _MPCPodcastsSharedDefaults *v2;
  float v3;

  v2 = self;
  v3 = sub_210C507D0();

  return v3;
}

- (void)setPreferredPlaybackRate:(float)a3
{
  _MPCPodcastsSharedDefaults *v4;

  v4 = self;
  sub_210C50870(a3);

}

- (_MPCPodcastsSharedDefaults)init
{
  return (_MPCPodcastsSharedDefaults *)sub_210C508CC();
}

@end
