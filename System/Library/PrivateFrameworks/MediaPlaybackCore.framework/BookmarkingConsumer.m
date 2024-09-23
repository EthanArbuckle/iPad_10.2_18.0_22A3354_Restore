@implementation BookmarkingConsumer

- (void)subscribeToEventStream:(id)a3
{
  _TtC17MediaPlaybackCore19BookmarkingConsumer *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_210C3C14C();
  swift_unknownObjectRelease();

}

+ (NSString)identifier
{
  void *v2;

  sub_210C3C360();
  v2 = (void *)sub_210E92B84();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)unsubscribeFromEventStream:(id)a3
{
  _TtC17MediaPlaybackCore19BookmarkingConsumer *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_210CC0F44();
  swift_unknownObjectRelease();

}

- (_TtC17MediaPlaybackCore19BookmarkingConsumer)init
{
  sub_210CC14D4();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectRelease();
}

@end
