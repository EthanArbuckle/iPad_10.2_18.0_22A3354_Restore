@implementation SVSProxVideoView

- (_TtC18SharingViewService16SVSProxVideoView)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  _TtC18SharingViewService16SVSProxVideoView *result;

  v5 = OBJC_IVAR____TtC18SharingViewService16SVSProxVideoView_movieView;
  v6 = type metadata accessor for MediaPlayerView();
  v7 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v6));
  v8 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v7, "init");

  result = (_TtC18SharingViewService16SVSProxVideoView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100136660, "SharingViewService/SVSLoopingMovieView.swift", 44, 2, 135, 0);
  __break(1u);
  return result;
}

- (_TtC18SharingViewService16SVSProxVideoView)initWithFrame:(CGRect)a3
{
  _TtC18SharingViewService16SVSProxVideoView *result;

  result = (_TtC18SharingViewService16SVSProxVideoView *)_swift_stdlib_reportUnimplementedInitializer("SharingViewService.SVSProxVideoView", 35, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100025F28(*(void **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18SharingViewService16SVSProxVideoView_playing), *(void **)&self->playing[OBJC_IVAR____TtC18SharingViewService16SVSProxVideoView_playing], self->playing[OBJC_IVAR____TtC18SharingViewService16SVSProxVideoView_playing + 8]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService16SVSProxVideoView_movieView));
}

@end
