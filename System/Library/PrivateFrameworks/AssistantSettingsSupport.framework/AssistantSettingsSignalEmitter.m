@implementation AssistantSettingsSignalEmitter

- (void)emitDidSelectVoiceSignal
{
  -[AssistantSettingsSignalEmitter _emitDiscoverabilitySignalEventForIdentifier:](self, "_emitDiscoverabilitySignalEventForIdentifier:", CFSTR("com.apple.siri.voice.changed"));
}

- (void)emitCallHangUpEnabledSignal
{
  -[AssistantSettingsSignalEmitter _emitDiscoverabilitySignalEventForIdentifier:](self, "_emitDiscoverabilitySignalEventForIdentifier:", CFSTR("com.apple.siri.call-hang-up.enabled"));
}

- (void)_emitDiscoverabilitySignalEventForIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x24BE0CDB0];
  v4 = a3;
  objc_msgSend(v3, "discoverabilitySignal");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0CB70]), "initWithIdentifier:bundleID:context:", v4, CFSTR("com.apple.siri"), 0);

  objc_msgSend(v5, "sendEvent:", v6);
}

@end
