@implementation PlaybackStatisticsConsumer

- (void)subscribeToEventStream:(id)a3
{
  _TtC17MediaPlaybackCore26PlaybackStatisticsConsumer *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_210C4830C();
  swift_unknownObjectRelease();

}

+ (NSString)identifier
{
  void *v2;

  sub_210C484E4();
  v2 = (void *)sub_210E92B84();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)unsubscribeFromEventStream:(id)a3
{
  _TtC17MediaPlaybackCore26PlaybackStatisticsConsumer *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_210CFCB54();
  swift_unknownObjectRelease();

}

- (_TtC17MediaPlaybackCore26PlaybackStatisticsConsumer)init
{
  sub_210CFCBA8();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectRelease();
}

@end
