@implementation PodcastsPlayActivityFeedConsumer

- (void)dealloc
{
  _TtC17MediaPlaybackCore32PodcastsPlayActivityFeedConsumer *v2;

  v2 = self;
  sub_210C5145C();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectRelease();
}

+ (NSString)identifier
{
  void *v2;

  sub_210C51588();
  v2 = (void *)sub_210E92B84();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

+ (void)setIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_210E92BA8();
  sub_210C515EC(v3, v4);
}

- (void)subscribeToEventStream:(id)a3
{
  _TtC17MediaPlaybackCore32PodcastsPlayActivityFeedConsumer *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_210C51620((objc_class *)a3);
  swift_unknownObjectRelease();

}

- (void)unsubscribeFromEventStream:(id)a3
{
  _TtC17MediaPlaybackCore32PodcastsPlayActivityFeedConsumer *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_210C52844();
  swift_unknownObjectRelease();

}

- (_TtC17MediaPlaybackCore32PodcastsPlayActivityFeedConsumer)init
{
  sub_210C53BEC();
}

@end
