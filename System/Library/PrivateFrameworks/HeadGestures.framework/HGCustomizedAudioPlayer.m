@implementation HGCustomizedAudioPlayer

- (void)handleInterruptionWithNotification:(id)a3
{
  sub_23DA7787C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_23DA7770C);
}

- (void)handleAudioEngineConfigurationChangeWithNotification:(id)a3
{
  sub_23DA7787C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_23DA77724);
}

@end
