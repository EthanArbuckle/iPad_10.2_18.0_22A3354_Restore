@implementation FormatVideoPlayerManager

- (void)startPictureInPictureIfPossible
{
  _TtC8NewsFeed24FormatVideoPlayerManager *v2;

  v2 = self;
  sub_1BB281EDC();

}

- (void)willApplyBookmark
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8NewsFeed24FormatVideoPlayerManager_isBookmarkInProgress) = 1;
}

- (void)didApplyBookmark
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8NewsFeed24FormatVideoPlayerManager_isBookmarkInProgress) = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8NewsFeed24FormatVideoPlayerManager_isViewTransitionInProcess) = 0;
}

- (void)didStartCoveringWithNotification:(id)a3
{
  sub_1BA9D5FEC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1BB28203C);
}

- (void)didFinishCoveringWithNotification:(id)a3
{
  sub_1BA9D5FEC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1BB282228);
}

- (_TtC8NewsFeed24FormatVideoPlayerManager)init
{
  _TtC8NewsFeed24FormatVideoPlayerManager *result;

  result = (_TtC8NewsFeed24FormatVideoPlayerManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BA8FD860((uint64_t)self + OBJC_IVAR____TtC8NewsFeed24FormatVideoPlayerManager_delegate);
  sub_1BA8FD860((uint64_t)self + OBJC_IVAR____TtC8NewsFeed24FormatVideoPlayerManager_reuseDelegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8NewsFeed24FormatVideoPlayerManager_playerViewController));
  swift_release();

  sub_1BB28438C((uint64_t)self + OBJC_IVAR____TtC8NewsFeed24FormatVideoPlayerManager_cover);
  swift_bridgeObjectRelease();
  sub_1BA4A2E80((uint64_t)self + OBJC_IVAR____TtC8NewsFeed24FormatVideoPlayerManager_data, (uint64_t (*)(_QWORD))type metadata accessor for FormatVideoPlayerData);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed24FormatVideoPlayerManager_videoAdProviderFactory);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed24FormatVideoPlayerManager_coordinator);
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed24FormatVideoPlayerManager_sceneProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed24FormatVideoPlayerManager_offlineAlertControllerFactory);
}

- (void)videoPlayerViewControllerWillStartPictureInPicture:(id)a3
{
  id v4;
  _TtC8NewsFeed24FormatVideoPlayerManager *v5;

  v4 = a3;
  v5 = self;
  sub_1BB284778();

}

- (void)videoPlayerViewControllerDidStopPictureInPicture:(id)a3
{
  id v4;
  _TtC8NewsFeed24FormatVideoPlayerManager *v5;

  v4 = a3;
  v5 = self;
  sub_1BB282FF8(v4);

}

- (void)videoPlayerViewController:(id)a3 startedPlaybackOfVideo:(id)a4
{
  sub_1BB283528(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id))sub_1BB284904);
}

- (void)videoPlayerViewController:(id)a3 resumedPlaybackOfVideo:(id)a4
{
  sub_1BB283528(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id))sub_1BB284B04);
}

- (void)videoPlayerViewController:(id)a3 restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(id)a4
{
  void *v6;
  id v7;
  _TtC8NewsFeed24FormatVideoPlayerManager *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_1BB284B9C(v7, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)videoPlayerViewControllerDidExitFullscreen:(id)a3
{
  id v4;
  _TtC8NewsFeed24FormatVideoPlayerManager *v5;

  v4 = a3;
  v5 = self;
  sub_1BB283608(v4);

}

- (id)videoAdForVideoPlayerViewController:(id)a3
{
  id v4;
  _TtC8NewsFeed24FormatVideoPlayerManager *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_1BB2839AC((uint64_t)v4);

  return v6;
}

- (id)videoForVideoPlayerViewController:(id)a3
{
  id v4;
  _TtC8NewsFeed24FormatVideoPlayerManager *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1BB284D1C();

  return v6;
}

@end
