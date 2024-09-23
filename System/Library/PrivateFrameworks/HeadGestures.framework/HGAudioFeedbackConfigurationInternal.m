@implementation HGAudioFeedbackConfigurationInternal

+ (HGAudioFeedbackConfigurationInternal)defaultAudioConfiguration
{
  return (HGAudioFeedbackConfigurationInternal *)sub_23DA66CB8((uint64_t)a1, (uint64_t)a2, &qword_256CDAFB8, (id *)&qword_256CDB5A0);
}

- (BOOL)enableAudioFeedback
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_enableAudioFeedback;
  swift_beginAccess();
  return *v2;
}

- (void)setEnableAudioFeedback:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_enableAudioFeedback;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)invertedConfirmationAudioFeedbackMode
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_invertedConfirmationAudioFeedbackMode;
  swift_beginAccess();
  return *v2;
}

- (void)setInvertedConfirmationAudioFeedbackMode:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_invertedConfirmationAudioFeedbackMode;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)enableWaitingTone
{
  HGAudioFeedbackConfigurationInternal *v3;
  BOOL v5;

  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_23DA9B8F0();
  swift_release();
  swift_release();

  return v5;
}

- (void)setEnableWaitingTone:(BOOL)a3
{
  HGAudioFeedbackConfigurationInternal *v4;

  swift_getKeyPath();
  swift_getKeyPath();
  v4 = self;
  sub_23DA9B8FC();
}

- (unsigned)audioSessionID
{
  unsigned int *v2;

  v2 = (unsigned int *)((char *)self + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_audioSessionID);
  swift_beginAccess();
  return *v2;
}

- (void)setAudioSessionID:(unsigned int)a3
{
  unsigned int *v4;

  v4 = (unsigned int *)((char *)self + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_audioSessionID);
  swift_beginAccess();
  *v4 = a3;
}

- (HGAudioFeedbackConfigurationInternal)initWithEnableAudioFeedback:(BOOL)a3 enableWaitingTone:(BOOL)a4 audioSessionID:(unsigned int)a5
{
  return (HGAudioFeedbackConfigurationInternal *)HGAudioFeedbackConfiguration.init(enableAudioFeedback:enableWaitingTone:audioSessionID:)(a3, a4, a5);
}

- (void)enableAudioFeedbackForGestureWithGesture:(unint64_t)a3 enable:(BOOL)a4
{
  _BOOL4 v4;
  HGAudioFeedbackConfigurationInternal *v6;

  v4 = a4;
  v6 = self;
  sub_23DA66140(a3, v4);

}

- (void)enableAudioFeedbackForPartGestureWithPart:(unint64_t)a3 enable:(BOOL)a4
{
  _BOOL4 v4;
  HGAudioFeedbackConfigurationInternal *v6;

  v4 = a4;
  v6 = self;
  sub_23DA664B8(a3, v4);

}

- (HGAudioFeedbackConfigurationInternal)init
{
  HGAudioFeedbackConfigurationInternal *result;

  result = (HGAudioFeedbackConfigurationInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___HGAudioFeedbackConfigurationInternal__enableWaitingTone;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB350);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
