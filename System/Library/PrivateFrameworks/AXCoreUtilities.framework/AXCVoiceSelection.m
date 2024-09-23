@implementation AXCVoiceSelection

- (NSString)voiceId
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___AXCVoiceSelection_voiceId;
  swift_beginAccess();
  if (!*((_QWORD *)v2 + 1))
    return (NSString *)0;
  swift_bridgeObjectRetain();
  v3 = (void *)sub_18EC6717C();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setVoiceId:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  if (a3)
  {
    v4 = sub_18EC671A0();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___AXCVoiceSelection_voiceId);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSNumber)rate
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___AXCVoiceSelection_rate);
  swift_beginAccess();
  return (NSNumber *)*v2;
}

- (void)setRate:(id)a3
{
  sub_18EC24B90((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___AXCVoiceSelection_rate);
}

- (NSNumber)pitch
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___AXCVoiceSelection_pitch);
  swift_beginAccess();
  return (NSNumber *)*v2;
}

- (void)setPitch:(id)a3
{
  sub_18EC24B90((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___AXCVoiceSelection_pitch);
}

- (NSNumber)volume
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___AXCVoiceSelection_volume);
  swift_beginAccess();
  return (NSNumber *)*v2;
}

- (void)setVolume:(id)a3
{
  sub_18EC24B90((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___AXCVoiceSelection_volume);
}

- (NSDictionary)voiceSettings
{
  _QWORD *v2;
  void *v3;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___AXCVoiceSelection_voiceSettings);
  swift_beginAccess();
  if (!*v2)
    return (NSDictionary *)0;
  sub_18EC1A6F0(0, &qword_1EE13AC48);
  swift_bridgeObjectRetain();
  v3 = (void *)sub_18EC67104();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

- (void)setVoiceSettings:(id)a3
{
  uint64_t v3;
  uint64_t *v5;

  v3 = (uint64_t)a3;
  if (a3)
  {
    sub_18EC1A6F0(0, &qword_1EE13AC48);
    v3 = sub_18EC67110();
  }
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___AXCVoiceSelection_voiceSettings);
  swift_beginAccess();
  *v5 = v3;
  swift_bridgeObjectRelease();
}

- (NSArray)effects
{
  _QWORD *v2;
  void *v3;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___AXCVoiceSelection_effects);
  swift_beginAccess();
  if (!*v2)
    return (NSArray *)0;
  type metadata accessor for AXAudioEffectConfiguration(0);
  swift_bridgeObjectRetain();
  v3 = (void *)sub_18EC672F0();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)setEffects:(id)a3
{
  uint64_t v3;
  uint64_t *v5;

  v3 = (uint64_t)a3;
  if (a3)
  {
    type metadata accessor for AXAudioEffectConfiguration(0);
    v3 = sub_18EC672FC();
  }
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___AXCVoiceSelection_effects);
  swift_beginAccess();
  *v5 = v3;
  swift_bridgeObjectRelease();
}

- (AXCVoiceSelection)initWithVoiceId:(id)a3 rate:(id)a4 pitch:(id)a5 volume:(id)a6 voiceSettings:(id)a7 effects:(id)a8
{
  uint64_t v9;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  AXCVoiceSelection *v19;

  v9 = (uint64_t)a7;
  if (a3)
  {
    v13 = sub_18EC671A0();
    v15 = v14;
    if (!v9)
      goto LABEL_4;
    goto LABEL_3;
  }
  v13 = 0;
  v15 = 0;
  if (a7)
  {
LABEL_3:
    sub_18EC1A6F0(0, &qword_1EE13AC48);
    v9 = sub_18EC67110();
  }
LABEL_4:
  if (a8)
  {
    type metadata accessor for AXAudioEffectConfiguration(0);
    a8 = (id)sub_18EC672FC();
  }
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = (AXCVoiceSelection *)sub_18EC25C98(v13, v15, a4, a5, a6, v9, (uint64_t)a8);

  return v19;
}

- (AXCVoiceSelection)init
{
  AXCVoiceSelection *result;

  result = (AXCVoiceSelection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
