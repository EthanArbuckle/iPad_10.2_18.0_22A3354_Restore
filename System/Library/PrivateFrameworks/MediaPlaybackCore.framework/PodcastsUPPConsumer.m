@implementation PodcastsUPPConsumer

+ (NSString)identifier
{
  void *v2;

  sub_210CD0888();
  v2 = (void *)sub_210E92B84();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

+ (void)setIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_210E92BA8();
  sub_210CD08EC(v3, v4);
}

- (_TtC17MediaPlaybackCore19PodcastsUPPConsumer)initWithPlaybackEngine:(id)a3 playbackPositionHandler:(id)a4
{
  void *v5;
  uint64_t v6;

  v5 = _Block_copy(a4);
  if (v5)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v5 = sub_210C80E58;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC17MediaPlaybackCore19PodcastsUPPConsumer *)sub_210CD0938(a3, (uint64_t)v5, v6);
}

- (void)subscribeToEventStream:(id)a3
{
  _TtC17MediaPlaybackCore19PodcastsUPPConsumer *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_210CD0AD4(a3);
  swift_unknownObjectRelease();

}

- (void)unsubscribeFromEventStream:(id)a3
{
  _TtC17MediaPlaybackCore19PodcastsUPPConsumer *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_210CD0E6C();
  swift_unknownObjectRelease();

}

- (_TtC17MediaPlaybackCore19PodcastsUPPConsumer)init
{
  sub_210CD2C68();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17MediaPlaybackCore19PodcastsUPPConsumer_playbackPositionController));
  sub_210C4ED40(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC17MediaPlaybackCore19PodcastsUPPConsumer_playbackPositionHandler));
}

@end
