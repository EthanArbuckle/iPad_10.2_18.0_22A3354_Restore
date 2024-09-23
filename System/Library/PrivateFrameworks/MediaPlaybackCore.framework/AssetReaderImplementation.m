@implementation AssetReaderImplementation

+ (NSString)identifier
{
  void *v2;

  sub_210C74A0C();
  v2 = (void *)sub_210E92B84();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

+ (void)setIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_210E92BA8();
  sub_210C74A70(v3, v4);
}

- (void)subscribeToEventStream:(id)a3
{
  _TtC17MediaPlaybackCore25AssetReaderImplementation *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_210C74AA4(a3);

  swift_unknownObjectRelease();
}

- (void)unsubscribeFromEventStream:(id)a3
{
  _TtC17MediaPlaybackCore25AssetReaderImplementation *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_210C74D40();
  swift_unknownObjectRelease();

}

- (void)engine:(id)a3 didChangeToItem:(id)a4
{
  id v6;
  _TtC17MediaPlaybackCore25AssetReaderImplementation *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  sub_210C74DA0(v8, a4);

}

- (_TtC17MediaPlaybackCore25AssetReaderImplementation)init
{
  sub_210C75A5C();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  OUTLINED_FUNCTION_123_0();
  OUTLINED_FUNCTION_123_0();
  OUTLINED_FUNCTION_123_0();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17MediaPlaybackCore25AssetReaderImplementation_currentItem));
  swift_unknownObjectRelease();
}

@end
