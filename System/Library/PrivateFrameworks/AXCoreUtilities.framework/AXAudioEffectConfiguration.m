@implementation AXAudioEffectConfiguration

- (NSUUID)identifier
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___AXAudioEffectConfiguration_identifier);
  swift_beginAccess();
  return (NSUUID *)*v2;
}

- (void)setIdentifier:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___AXAudioEffectConfiguration_identifier);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (NSString)effectName
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_18EC6717C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setEffectName:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  v4 = sub_18EC671A0();
  v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___AXAudioEffectConfiguration_effectName);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (BOOL)enabled
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___AXAudioEffectConfiguration_enabled;
  swift_beginAccess();
  return *v2;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___AXAudioEffectConfiguration_enabled;
  swift_beginAccess();
  *v4 = a3;
}

- (NSDictionary)properties
{
  return (NSDictionary *)sub_18EC4B260();
}

- (void)setProperties:(id)a3
{
  sub_18EC4B304((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___AXAudioEffectConfiguration_properties);
}

- (NSDictionary)parameters
{
  return (NSDictionary *)sub_18EC4B260();
}

- (void)setParameters:(id)a3
{
  sub_18EC4B304((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___AXAudioEffectConfiguration_parameters);
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
