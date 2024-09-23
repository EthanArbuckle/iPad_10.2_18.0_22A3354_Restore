@implementation MPCVocalAttenuationPowerLogConsumer

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.MediaPlaybackCore/vocalAttenuationPowerLog");
}

- (void)subscribeToEventStream:(id)a3
{
  id v5;
  uint64_t v6;
  MPCPlaybackEngineEventStreamSubscription *subscription;
  MPCPlaybackEngineEventStreamSubscription *v8;
  MPCPlaybackEngineEventStreamSubscription *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];

  objc_storeStrong((id *)&self->_subscription, a3);
  v5 = a3;
  v6 = MEMORY[0x24BDAC760];
  subscription = self->_subscription;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __62__MPCVocalAttenuationPowerLogConsumer_subscribeToEventStream___block_invoke;
  v12[3] = &unk_24CAB94A0;
  v12[4] = self;
  -[MPCPlaybackEngineEventStreamSubscription subscribeToEventType:handler:](subscription, "subscribeToEventType:handler:", CFSTR("item-resume"), v12);
  v8 = self->_subscription;
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __62__MPCVocalAttenuationPowerLogConsumer_subscribeToEventStream___block_invoke_2;
  v11[3] = &unk_24CAB94A0;
  v11[4] = self;
  -[MPCPlaybackEngineEventStreamSubscription subscribeToEventType:handler:](v8, "subscribeToEventType:handler:", CFSTR("item-vocal-attenuation-changed"), v11);
  v9 = self->_subscription;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __62__MPCVocalAttenuationPowerLogConsumer_subscribeToEventStream___block_invoke_3;
  v10[3] = &unk_24CAB94A0;
  v10[4] = self;
  -[MPCPlaybackEngineEventStreamSubscription subscribeToEventType:handler:](v9, "subscribeToEventType:handler:", CFSTR("item-pause"), v10);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCVocalAttenuationPowerLogConsumer reportVocalAttenuationIsActive:date:](self, "reportVocalAttenuationIsActive:date:", 0, v3);

  v4.receiver = self;
  v4.super_class = (Class)MPCVocalAttenuationPowerLogConsumer;
  -[MPCVocalAttenuationPowerLogConsumer dealloc](&v4, sel_dealloc);
}

- (void)unsubscribeFromEventStream:(id)a3
{
  MPCPlaybackEngineEventStreamSubscription *subscription;

  subscription = self->_subscription;
  self->_subscription = 0;

}

- (void)reportVocalAttenuationIsActive:(BOOL)a3 date:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  id v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v4 = a3;
  v19[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (-[MPCVocalAttenuationPowerLogConsumer lastVocalAttenuationIsActive](self, "lastVocalAttenuationIsActive") != v4)
  {
    v18[0] = CFSTR("Enabled");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = CFSTR("TimestampSent");
    v19[0] = v7;
    v8 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v6, "timeIntervalSince1970");
    objc_msgSend(v8, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    dispatch_get_global_queue(17, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __75__MPCVocalAttenuationPowerLogConsumer_reportVocalAttenuationIsActive_date___block_invoke;
    v16 = &unk_24CABA2D0;
    v17 = v10;
    v12 = v10;
    dispatch_async(v11, &v13);

    -[MPCVocalAttenuationPowerLogConsumer setLastVocalAttenuationIsActive:](self, "setLastVocalAttenuationIsActive:", v4, v13, v14, v15, v16);
  }

}

- (MPCPlaybackEngineEventStreamSubscription)subscription
{
  return self->_subscription;
}

- (BOOL)lastVocalAttenuationIsActive
{
  return self->_lastVocalAttenuationIsActive;
}

- (void)setLastVocalAttenuationIsActive:(BOOL)a3
{
  self->_lastVocalAttenuationIsActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscription, 0);
}

uint64_t __75__MPCVocalAttenuationPowerLogConsumer_reportVocalAttenuationIsActive_date___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_210BD8000, v2, OS_LOG_TYPE_DEFAULT, "PowerLog: Logging VocalAttenuation state change event with payload:\n%{public}@", (uint8_t *)&v5, 0xCu);
  }

  +[MPCVocalAttenuationPowerLogConsumer telemetryID](MPCVocalAttenuationPowerLogConsumer, "telemetryID");
  return PPSSendTelemetry();
}

uint64_t __62__MPCVocalAttenuationPowerLogConsumer_subscribeToEventStream___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("vocal-attenuation-enabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");
  objc_msgSend(v3, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "reportVocalAttenuationIsActive:date:", v6, v7);
  return 1;
}

uint64_t __62__MPCVocalAttenuationPowerLogConsumer_subscribeToEventStream___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("vocal-attenuation-enabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");
  objc_msgSend(v3, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "reportVocalAttenuationIsActive:date:", v6, v7);
  return 1;
}

uint64_t __62__MPCVocalAttenuationPowerLogConsumer_subscribeToEventStream___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reportVocalAttenuationIsActive:date:", 0, v3);

  return 1;
}

+ (PPSTelemetryIdentifier)telemetryID
{
  if (telemetryID_onceToken != -1)
    dispatch_once(&telemetryID_onceToken, &__block_literal_global_26577);
  return (PPSTelemetryIdentifier *)telemetryID_telemetryID;
}

uint64_t __50__MPCVocalAttenuationPowerLogConsumer_telemetryID__block_invoke()
{
  uint64_t result;

  result = PPSCreateTelemetryIdentifier();
  telemetryID_telemetryID = result;
  return result;
}

@end
