@implementation PlaybackHistoryConsumer

- (void)subscribeToEventStream:(id)a3
{
  _TtC17MediaPlaybackCore23PlaybackHistoryConsumer *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_210C48870(a3);
  swift_unknownObjectRelease();

}

+ (NSString)identifier
{
  void *v2;

  sub_210C48A04();
  v2 = (void *)sub_210E92B84();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)unsubscribeFromEventStream:(id)a3
{
  _TtC17MediaPlaybackCore23PlaybackHistoryConsumer *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_210C848DC();
  swift_unknownObjectRelease();

}

- (_TtC17MediaPlaybackCore23PlaybackHistoryConsumer)init
{
  sub_210C84930();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectRelease();
}

@end
