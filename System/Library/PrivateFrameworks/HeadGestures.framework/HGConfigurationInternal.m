@implementation HGConfigurationInternal

+ (HGConfigurationInternal)defaultConfig
{
  return (HGConfigurationInternal *)sub_23DA66CB8((uint64_t)a1, (uint64_t)a2, &qword_256CDAFB0, (id *)&qword_256CDB598);
}

- (HGMLConfigurationInternal)mlConfig
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___HGConfigurationInternal_mlConfig);
  swift_beginAccess();
  return (HGMLConfigurationInternal *)*v2;
}

- (void)setMlConfig:(id)a3
{
  sub_23DA6469C((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___HGConfigurationInternal_mlConfig);
}

- (HGAudioFeedbackConfigurationInternal)audioFeedbackConfig
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___HGConfigurationInternal_audioFeedbackConfig);
  swift_beginAccess();
  return (HGAudioFeedbackConfigurationInternal *)*v2;
}

- (void)setAudioFeedbackConfig:(id)a3
{
  sub_23DA6469C((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___HGConfigurationInternal_audioFeedbackConfig);
}

- (BOOL)requestPartGestures
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___HGConfigurationInternal_requestPartGestures;
  swift_beginAccess();
  return *v2;
}

- (void)setRequestPartGestures:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___HGConfigurationInternal_requestPartGestures;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)singleDelivery
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___HGConfigurationInternal_singleDelivery;
  swift_beginAccess();
  return *v2;
}

- (void)setSingleDelivery:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___HGConfigurationInternal_singleDelivery;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)enableRawDataLogging
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___HGConfigurationInternal_enableRawDataLogging;
  swift_beginAccess();
  return *v2;
}

- (void)setEnableRawDataLogging:(BOOL)a3
{
  BOOL *v5;
  HGConfigurationInternal *v6;

  v5 = (BOOL *)self + OBJC_IVAR___HGConfigurationInternal_enableRawDataLogging;
  swift_beginAccess();
  *v5 = a3;
  v6 = self;
  sub_23DA64BE8();

}

- (float)gesturePartRepeatTimeout
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR___HGConfigurationInternal_gesturePartRepeatTimeout);
}

- (void)setGesturePartRepeatTimeout:(float)a3
{
  *(float *)((char *)&self->super.isa + OBJC_IVAR___HGConfigurationInternal_gesturePartRepeatTimeout) = a3;
}

- (float)gesturePartAcceptableNodVelocity
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR___HGConfigurationInternal_gesturePartAcceptableNodVelocity);
}

- (void)setGesturePartAcceptableNodVelocity:(float)a3
{
  *(float *)((char *)&self->super.isa + OBJC_IVAR___HGConfigurationInternal_gesturePartAcceptableNodVelocity) = a3;
}

- (float)gesturePartAcceptableShakeVelocity
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR___HGConfigurationInternal_gesturePartAcceptableShakeVelocity);
}

- (void)setGesturePartAcceptableShakeVelocity:(float)a3
{
  *(float *)((char *)&self->super.isa + OBJC_IVAR___HGConfigurationInternal_gesturePartAcceptableShakeVelocity) = a3;
}

- (HGConfigurationInternal)initWithMlConfig:(id)a3 audioFeedbackConfig:(id)a4 requestPartGestures:(BOOL)a5
{
  id v7;
  id v8;
  HGConfigurationInternal *v9;

  v7 = a3;
  v8 = a4;
  v9 = (HGConfigurationInternal *)sub_23DA681E4(v7, v8, a5);

  return v9;
}

- (HGConfigurationInternal)initWithML:(id)a3 audioFeedbackConfig:(id)a4
{
  return -[HGConfigurationInternal initWithMlConfig:audioFeedbackConfig:requestPartGestures:](self, sel_initWithMlConfig_audioFeedbackConfig_requestPartGestures_, a3, a4, 0);
}

- (HGConfigurationInternal)init
{
  HGConfigurationInternal *result;

  result = (HGConfigurationInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
