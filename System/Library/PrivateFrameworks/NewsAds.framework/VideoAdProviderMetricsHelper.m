@implementation VideoAdProviderMetricsHelper

- (_TtC7NewsAds28VideoAdProviderMetricsHelper)init
{
  _TtC7NewsAds28VideoAdProviderMetricsHelper *result;

  result = (_TtC7NewsAds28VideoAdProviderMetricsHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)playbackReadyToStart
{
  _TtC7NewsAds28VideoAdProviderMetricsHelper *v2;

  v2 = self;
  VideoAdProviderMetricsHelper.playbackReadyToStart()();

}

- (void)playbackStarted
{
  sub_1BA2BB79C((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_mediaStarted);
}

- (void)playbackPaused
{
  sub_1BA2BB708((char *)self, (uint64_t)a2, (SEL *)&selRef_mediaPausedAtPosition_);
}

- (void)playbackResumed
{
  sub_1BA2BB708((char *)self, (uint64_t)a2, (SEL *)&selRef_mediaPlayedAtPosition_);
}

- (void)playbackFinished
{
  sub_1BA2BB79C((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_mediaFinished);
}

- (void)playbackFailedWithError:(id)a3
{
  void *v5;
  _TtC7NewsAds28VideoAdProviderMetricsHelper *v6;
  id v7;
  _TtC7NewsAds28VideoAdProviderMetricsHelper *v8;
  void *v9;

  v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_diagnosticMetricsHelper);
  if (a3)
  {
    swift_getErrorValue();
    v6 = self;
    v7 = a3;
    sub_1BA2C26E4();
  }
  else
  {
    v8 = self;
  }
  v9 = (void *)sub_1BA2C212C();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_mediaPlaybackFailedWithReason_, v9);

}

- (void)enteredFullscreen
{
  sub_1BA2BB574((char *)self, (uint64_t)a2, (SEL *)&selRef_mediaExpandedAtPosition_fullScreen_, 1);
}

- (void)exitedFullscreen
{
  sub_1BA2BB574((char *)self, (uint64_t)a2, (SEL *)&selRef_mediaContractedAtPosition_fullScreen_, 0);
}

- (void)muteStateChanged:(BOOL)a3
{
  _TtC7NewsAds28VideoAdProviderMetricsHelper *v4;

  v4 = self;
  VideoAdProviderMetricsHelper.muteStateChanged(_:)(a3);

}

- (void)playbackPassedQuartile:(unint64_t)a3
{
  _TtC7NewsAds28VideoAdProviderMetricsHelper *v4;

  v4 = self;
  VideoAdProviderMetricsHelper.playbackPassed(quartile:)((id)a3);

}

- (void)tappedToToggleControlVisibility:(BOOL)a3
{
  void *v3;
  void *v4;
  _TtC7NewsAds28VideoAdProviderMetricsHelper *v5;

  if (!a3)
  {
    v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_mediaMetricsHelper);
    if (v3)
    {
      v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_metadata);
      v5 = self;
      objc_msgSend(v4, sel_time);
      objc_msgSend(v3, sel_mediaShowControlsAtPosition_);

    }
  }
}

- (void)skipped
{
  sub_1BA2BB708((char *)self, (uint64_t)a2, (SEL *)&selRef_mediaSkippedAtPosition_);
}

- (void)willUnload
{
  sub_1BA2BB79C((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_mediaUserExitedArticle);
}

@end
