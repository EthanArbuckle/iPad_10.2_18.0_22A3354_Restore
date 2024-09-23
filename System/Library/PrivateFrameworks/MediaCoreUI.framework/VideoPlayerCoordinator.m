@implementation VideoPlayerCoordinator

- (void)didTap
{
  _TtC11MediaCoreUIP33_8A49DC2FB69555F909B7715363263FF722VideoPlayerCoordinator *v2;

  v2 = self;
  sub_2414869E0();

}

- (void)didPinch:(id)a3
{
  id v4;
  _TtC11MediaCoreUIP33_8A49DC2FB69555F909B7715363263FF722VideoPlayerCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_241486C54(v4);

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  _TtC11MediaCoreUIP33_8A49DC2FB69555F909B7715363263FF722VideoPlayerCoordinator *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_241486E1C((uint64_t)v6, v7);

  return v9 & 1;
}

- (void)playerViewController:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  id v6;
  _TtC11MediaCoreUIP33_8A49DC2FB69555F909B7715363263FF722VideoPlayerCoordinator *v7;

  v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  sub_241487D40(v6, a4);

  swift_unknownObjectRelease();
}

- (void)videoOutput:(id)a3 willBeginFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  objc_msgSend(a3, sel_setShowsPlaybackControls_, 1, a4);
}

- (void)videoOutput:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  _TtC11MediaCoreUIP33_8A49DC2FB69555F909B7715363263FF722VideoPlayerCoordinator *v7;

  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v7 = self;
  sub_241487E40((uint64_t)a3, a4);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

}

- (_TtC11MediaCoreUIP33_8A49DC2FB69555F909B7715363263FF722VideoPlayerCoordinator)init
{
  _TtC11MediaCoreUIP33_8A49DC2FB69555F909B7715363263FF722VideoPlayerCoordinator *result;

  result = (_TtC11MediaCoreUIP33_8A49DC2FB69555F909B7715363263FF722VideoPlayerCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MediaCoreUIP33_8A49DC2FB69555F909B7715363263FF722VideoPlayerCoordinator_tapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MediaCoreUIP33_8A49DC2FB69555F909B7715363263FF722VideoPlayerCoordinator_pinchGestureRecognizer));
}

@end
