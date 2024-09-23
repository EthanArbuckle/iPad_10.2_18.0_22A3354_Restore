@implementation MPCPodcastsDefaultsHelper

+ (MPCPodcastsDefaultsHelper)standard
{
  return (MPCPodcastsDefaultsHelper *)static PodcastsDefaultsHelper.standard.getter();
}

- (double)skipForwardInterval
{
  MPCPodcastsDefaultsHelper *v2;
  double v3;

  v2 = self;
  v3 = PodcastsDefaultsHelper.skipForwardInterval.getter();

  return v3;
}

- (double)skipBackwardInterval
{
  MPCPodcastsDefaultsHelper *v2;
  double v3;

  v2 = self;
  v3 = PodcastsDefaultsHelper.skipBackwardInterval.getter();

  return v3;
}

- (BOOL)remoteSkipInsteadOfNextTrack
{
  MPCPodcastsDefaultsHelper *v2;
  char v3;

  v2 = self;
  v3 = PodcastsDefaultsHelper.remoteSkipInsteadOfNextTrack.getter();

  return v3 & 1;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  MPCPodcastsDefaultsHelper *v14;
  void *v15;
  id v16;
  MPCPodcastsDefaultsHelper *v17;
  _OWORD v18[2];

  if (a3)
  {
    v10 = sub_210E92BA8();
    v12 = v11;
    if (a4)
      goto LABEL_3;
LABEL_6:
    memset(v18, 0, sizeof(v18));
    v16 = a5;
    v17 = self;
    if (a5)
      goto LABEL_4;
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  v10 = 0;
  v12 = 0;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  swift_unknownObjectRetain();
  v13 = a5;
  v14 = self;
  sub_210E93274();
  swift_unknownObjectRelease();
  if (!a5)
    goto LABEL_7;
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_210CD6FA0();
  v15 = (void *)sub_210E92B18();

LABEL_8:
  PodcastsDefaultsHelper.observeValue(forKeyPath:of:change:context:)(v10, v12, (uint64_t)v18, v15, (uint64_t)a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_210C33398((uint64_t)v18);
}

- (MPCPodcastsDefaultsHelper)init
{
  return (MPCPodcastsDefaultsHelper *)sub_210CD70F0();
}

- (void)dealloc
{
  MPCPodcastsDefaultsHelper *v2;

  v2 = self;
  PodcastsDefaultsHelper.__deallocating_deinit();
}

- (void).cxx_destruct
{

}

@end
