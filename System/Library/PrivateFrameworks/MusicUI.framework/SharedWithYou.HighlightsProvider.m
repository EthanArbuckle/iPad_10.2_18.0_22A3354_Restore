@implementation SharedWithYou.HighlightsProvider

- (void)highlightCenter:(id)a3 didRemoveHighlights:(id)a4
{
  _TtCO7MusicUI13SharedWithYou18HighlightsProvider *v6;
  id v7;

  sub_21D429AA0();
  sub_21D7C5310();
  v7 = a3;
  v6 = self;
  sub_21D42889C();
  swift_bridgeObjectRelease();

}

- (void)highlightCenterDidAddHighlights:(id)a3
{
  _TtCO7MusicUI13SharedWithYou18HighlightsProvider *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_21D428A28();

}

- (void)highlightCenterSettingsEnablementHasChanged:(id)a3
{
  _TtCO7MusicUI13SharedWithYou18HighlightsProvider *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_21D428A80();

}

- (_TtCO7MusicUI13SharedWithYou18HighlightsProvider)init
{
  sub_21D42973C();
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F5E2E8);
  OUTLINED_FUNCTION_1_21(v3);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCO7MusicUI13SharedWithYou18HighlightsProvider____lazy_storage___highlightCenter));
  swift_release();
  v4 = sub_21D7C4CEC();
  OUTLINED_FUNCTION_1_21(v4);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
