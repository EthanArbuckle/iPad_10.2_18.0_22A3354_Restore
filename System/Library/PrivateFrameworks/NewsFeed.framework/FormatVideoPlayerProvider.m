@implementation FormatVideoPlayerProvider

- (id)loadWithCompletionBlock:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t (**v11)(void *, void *);
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  _TtC8NewsFeed25FormatVideoPlayerProvider *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  _QWORD aBlock[6];

  sub_1BA4B07F0(0, (unint64_t *)&qword_1ED3D2E70, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)aBlock - v9;
  v11 = (uint64_t (**)(void *, void *))_Block_copy(a3);
  v12 = (char *)self + OBJC_IVAR____TtC8NewsFeed25FormatVideoPlayerProvider_data;
  v13 = &v12[*(int *)(type metadata accessor for FormatVideoPlayerData() + 36)];
  v14 = sub_1BB86C67C();
  v15 = *(_QWORD *)(v14 - 8);
  (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v10, v13, v14);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v10, 0, 1, v14);
  sub_1BA7E8428((uint64_t)v10, (uint64_t)v7);
  v16 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48))(v7, 1, v14);
  v17 = self;
  v18 = 0;
  if (v16 != 1)
  {
    v18 = (void *)sub_1BB86C58C();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v7, v14);
  }
  v19 = (objc_class *)(id)v11[2](v11, v18);

  sub_1BA7F0A80((uint64_t)v10);
  *(Class *)((char *)&v17->super.isa + OBJC_IVAR____TtC8NewsFeed25FormatVideoPlayerProvider_metadata) = v19;
  swift_unknownObjectRelease();
  _Block_release(v11);

  aBlock[4] = nullsub_1;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BA4F1DD8;
  aBlock[3] = &block_descriptor_28;
  v20 = _Block_copy(aBlock);
  swift_release();
  return v20;
}

- (double)impressionThreshold
{
  return 2.0;
}

- (void)playbackInitiatedWithButtonTapped:(BOOL)a3
{
  _TtC8NewsFeed25FormatVideoPlayerProvider *v3;

  v3 = self;
  _s8NewsFeed25FormatVideoPlayerProviderC17playbackInitiated16withButtonTappedySb_tF_0();

}

- (void)playbackReadyToStart
{
  uint64_t v2;
  _TtC8NewsFeed25FormatVideoPlayerProvider *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = qword_1ED3BB670;
  v3 = self;
  if (v2 != -1)
    swift_once();
  v4 = (void *)qword_1ED4768A8;
  sub_1BA4B07F0(0, (unint64_t *)&qword_1ED3D4470, (uint64_t (*)(uint64_t))sub_1BA81BA70, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1BB87CE70;
  type metadata accessor for FormatVideoPlayerData();
  v6 = v4;
  v7 = sub_1BB86C538();
  v9 = v8;
  *(_QWORD *)(v5 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v5 + 64) = sub_1BA6A2D8C();
  *(_QWORD *)(v5 + 32) = v7;
  *(_QWORD *)(v5 + 40) = v9;
  v10 = sub_1BB87330C();
  sub_1BB86EF44("Video playback ready to start for %{public}@", 44, 2, &dword_1BA493000, v6, v10, v5);

  swift_bridgeObjectRelease();
}

- (void)playbackStarted
{
  _TtC8NewsFeed25FormatVideoPlayerProvider *v2;

  v2 = self;
  FormatVideoPlayerProvider.playbackStarted()();

}

- (void)playbackPaused
{
  _TtC8NewsFeed25FormatVideoPlayerProvider *v2;

  v2 = self;
  FormatVideoPlayerProvider.playbackPaused()();

}

- (void)playbackResumed
{
  _TtC8NewsFeed25FormatVideoPlayerProvider *v2;

  v2 = self;
  FormatVideoPlayerProvider.playbackResumed()();

}

- (void)playbackFinished
{
  _TtC8NewsFeed25FormatVideoPlayerProvider *v2;

  v2 = self;
  FormatVideoPlayerProvider.playbackFinished()();

}

- (void)playbackFailedWithError:(id)a3
{
  _TtC8NewsFeed25FormatVideoPlayerProvider *v4;
  id v5;

  v4 = self;
  v5 = a3;
  _s8NewsFeed25FormatVideoPlayerProviderC23playbackFailedWithErroryys0J0_pSgF_0();

}

- (void)startedPictureInPicture
{
  _TtC8NewsFeed25FormatVideoPlayerProvider *v2;

  v2 = self;
  FormatVideoPlayerProvider.startedPictureInPicture()();

}

- (void)stoppedPictureInPicture
{
  _TtC8NewsFeed25FormatVideoPlayerProvider *v2;

  v2 = self;
  FormatVideoPlayerProvider.stoppedPictureInPicture()();

}

- (_TtC8NewsFeed25FormatVideoPlayerProvider)init
{
  _TtC8NewsFeed25FormatVideoPlayerProvider *result;

  result = (_TtC8NewsFeed25FormatVideoPlayerProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BA4A2E80((uint64_t)self + OBJC_IVAR____TtC8NewsFeed25FormatVideoPlayerProvider_data, (uint64_t (*)(_QWORD))type metadata accessor for FormatVideoPlayerData);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed25FormatVideoPlayerProvider_coordinator);
  swift_unknownObjectRelease();
}

@end
