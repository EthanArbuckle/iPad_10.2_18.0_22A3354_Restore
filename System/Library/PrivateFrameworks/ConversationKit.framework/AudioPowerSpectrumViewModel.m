@implementation AudioPowerSpectrumViewModel

- (void)dealloc
{
  _TtC15ConversationKit27AudioPowerSpectrumViewModel *v2;

  v2 = self;
  AudioPowerSpectrumViewModel.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR____TtC15ConversationKit27AudioPowerSpectrumViewModel__localPowerSpectrum;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<[Float]>);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC15ConversationKit27AudioPowerSpectrumViewModel__remotePowerSpectrum, v4);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit27AudioPowerSpectrumViewModel_waveformColorRemote);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit27AudioPowerSpectrumViewModel_waveformColorLocal);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit27AudioPowerSpectrumViewModel_localWaveformFilter);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit27AudioPowerSpectrumViewModel_remoteWaveformFilter);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit27AudioPowerSpectrumViewModel_callCenter);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit27AudioPowerSpectrumViewModel_notificationCenter);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit27AudioPowerSpectrumViewModel_audioPowerTapQueue));
}

- (void)handleCallStatusChanged:(id)a3
{
  @objc AudioPowerSpectrumViewModel.handleCallStatusChanged(_:)(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))AudioPowerSpectrumViewModel.handleCallStatusChanged(_:));
}

- (_TtC15ConversationKit27AudioPowerSpectrumViewModel)init
{
  AudioPowerSpectrumViewModel.init()();
}

- (BOOL)isEqual:(id)a3
{
  _TtC15ConversationKit27AudioPowerSpectrumViewModel *v4;
  _TtC15ConversationKit27AudioPowerSpectrumViewModel *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = AudioPowerSpectrumViewModel.isEqual(_:)();

  outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)v8, &demangling cache variable for type metadata for Any?);
  return v6 & 1;
}

- (void)handleCallRecordingStateChanged:(id)a3
{
  @objc AudioPowerSpectrumViewModel.handleCallStatusChanged(_:)(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))AudioPowerSpectrumViewModel.handleCallRecordingStateChanged(_:));
}

@end
