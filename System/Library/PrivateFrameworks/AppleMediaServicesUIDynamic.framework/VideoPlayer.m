@implementation VideoPlayer

- (void)dealloc
{
  _TtC27AppleMediaServicesUIDynamic11VideoPlayer *v2;

  v2 = self;
  VideoPlayer.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_1B9D6B278((uint64_t)self + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_videoUrl, &qword_1ED5CE100);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_videoObserver));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_playerItem));
  sub_1B9D6B278((uint64_t)self + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_failure, &qword_1EF243B78);
  swift_unknownObjectRelease();
  sub_1B9D5DB24((uint64_t)self + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic11VideoPlayer_delegate);
}

- (void)play
{
  _TtC27AppleMediaServicesUIDynamic11VideoPlayer *v2;

  v2 = self;
  VideoPlayer.play()();

}

- (void)pause
{
  _TtC27AppleMediaServicesUIDynamic11VideoPlayer *v2;

  v2 = self;
  VideoPlayer.pause()();

}

- (_TtC27AppleMediaServicesUIDynamic11VideoPlayer)init
{
  VideoPlayer.init()();
}

- (_TtC27AppleMediaServicesUIDynamic11VideoPlayer)initWithURL:(id)a3
{
  uint64_t v3;

  v3 = sub_1B9DE1554();
  MEMORY[0x1E0C80A78](v3);
  sub_1B9DE1518();
  VideoPlayer.init(url:)();
}

- (_TtC27AppleMediaServicesUIDynamic11VideoPlayer)initWithPlayerItem:(id)a3
{
  id v3;

  v3 = a3;
  VideoPlayer.init(playerItem:)();
}

@end
