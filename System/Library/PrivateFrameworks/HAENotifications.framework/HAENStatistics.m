@implementation HAENStatistics

+ (id)sharedInstance
{
  if (sharedInstance_once_0 != -1)
    dispatch_once(&sharedInstance_once_0, &__block_literal_global_0);
  return (id)sharedInstance_instance_0;
}

void __32__HAENStatistics_sharedInstance__block_invoke()
{
  HAENStatistics *v0;
  void *v1;

  v0 = objc_alloc_init(HAENStatistics);
  v1 = (void *)sharedInstance_instance_0;
  sharedInstance_instance_0 = (uint64_t)v0;

}

- (HAENStatistics)init
{
  HAENStatistics *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *eventQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HAENStatistics;
  v2 = -[HAENStatistics init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.coreaudio.hae.notifications.stats", 0);
    eventQueue = v2->_eventQueue;
    v2->_eventQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)processStatsForEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  int v8;
  NSObject *eventQueue;
  id v10;
  _QWORD v11[4];
  id v12;
  HAENStatistics *v13;
  uint64_t v14;
  int v15;

  v4 = a3;
  +[HAENVolumeControl sharedInstance](HAENVolumeControl, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "getStats");
  v8 = v7;

  eventQueue = self->_eventQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __39__HAENStatistics_processStatsForEvent___block_invoke;
  v11[3] = &unk_24D19F200;
  v13 = self;
  v14 = v6;
  v15 = v8;
  v12 = v4;
  v10 = v4;
  dispatch_async(eventQueue, v11);

}

void __39__HAENStatistics_processStatsForEvent___block_invoke(uint64_t a1)
{
  int v2;
  __CFString *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  __CFString *v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "eventType");
  v3 = CFSTR("loud");
  if (v2 == 2003133803)
    v3 = CFSTR("weekly");
  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = *(void **)(a1 + 32);
  v30 = v3;
  objc_msgSend(v5, "level");
  objc_msgSend(v4, "numberWithDouble:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = *(_DWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = *(_DWORD *)(a1 + 52);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "volumeActionString:", *(unsigned int *)(a1 + 56));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDD16E0];
  +[HAENDefaults sharedInstance](HAENDefaults, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithBool:", objc_msgSend(v12, "isHAENFeatureOptedIn"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BDD16E0];
  +[HAENDefaults sharedInstance](HAENDefaults, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberWithBool:", objc_msgSend(v14, "isHAENFeatureMandatory"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x24BDD16E0];
  +[HAENDefaults sharedInstance](HAENDefaults, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "numberWithBool:", objc_msgSend(v17, "isEUVolumeLimitOn"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x24BDD16E0];
  +[HAENDefaults sharedInstance](HAENDefaults, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "numberWithBool:", objc_msgSend(v20, "isSKVolumeLimitOn"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "metadata");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKey:", CFSTR("_HAENMetadataIdentifierWeeklyDosage"));
  v23 = objc_claimAutoreleasedReturnValue();

  if (v23)
    v24 = (void *)v23;
  else
    v24 = &unk_24D1A2FC0;
  v31 = (void *)v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v24, CFSTR("dose"), v28, CFSTR("level"), v30, CFSTR("event_type"), v15, CFSTR("feature_mandatory"), v18, CFSTR("eu_volume_limit"), v21, CFSTR("sk_volume_lmit"), v29, CFSTR("feature_opt_in"), v7, CFSTR("current_volume"), v9,
    CFSTR("target_volume"),
    v10,
    CFSTR("volume_action"),
    0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "_sendMessage:", v25);
  HAENotificationsLog();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v33 = v27;
    _os_log_impl(&dword_2144B3000, v26, OS_LOG_TYPE_DEFAULT, "HAENStatistics sent %@", buf, 0xCu);

  }
}

- (id)volumeActionString:(unsigned int)a3
{
  const __CFString *v3;
  const __CFString *v4;

  v3 = CFSTR("lowered");
  v4 = CFSTR("unknown");
  if (a3 == 1986814576)
    v4 = CFSTR("bypassed");
  if (a3 != 1986817143)
    v3 = v4;
  if (a3 == 561409132)
    return CFSTR("failed");
  else
    return (id)v3;
}

- (void)processStatsForLocationGating:(id *)a3
{
  NSObject *eventQueue;
  _QWORD block[5];
  id v7[4];

  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3254779904;
  block[2] = __48__HAENStatistics_processStatsForLocationGating___block_invoke;
  block[3] = &unk_24D19F228;
  __copy_constructor_8_8_s0_s8_s16_t24w2((uint64_t)v7, (uint64_t)a3);
  block[4] = self;
  dispatch_async(eventQueue, block);

  __destructor_8_s0_s8_s16(&a3->var0);
}

void __48__HAENStatistics_processStatsForLocationGating___block_invoke(uint64_t a1)
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint8_t buf[16];

  v2 = *(__CFString **)(a1 + 56);
  if (!v2)
    v2 = CFSTR("unknown");
  v3 = v2;
  v4 = *(__CFString **)(a1 + 40);
  if (!v4)
    v4 = CFSTR("unknown");
  v5 = v4;
  v6 = *(__CFString **)(a1 + 48);
  if (!v6)
    v6 = CFSTR("unknown");
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = v6;
  +[HAENDefaults sharedInstance](HAENDefaults, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithBool:", objc_msgSend(v9, "isSKVolumeLimitOn"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 64));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 65));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", v12, CFSTR("feature_mandatory"), v3, CFSTR("disposition"), v5, CFSTR("countryCode"), v8, CFSTR("source"), v13, CFSTR("eu_volume_limit"), v10, CFSTR("sk_volume_limit"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_sendMessage:", v14);
  HAENotificationsLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2144B3000, v15, OS_LOG_TYPE_DEFAULT, "HAENStatistics location gating stats sent", buf, 2u);
  }

}

- (void)processMessage:(id)a3
{
  id v4;
  NSObject *eventQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  eventQueue = self->_eventQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__HAENStatistics_processMessage___block_invoke;
  v7[3] = &unk_24D19F1B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(eventQueue, v7);

}

uint64_t __33__HAENStatistics_processMessage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendMessage:", *(_QWORD *)(a1 + 40));
}

- (void)_sendMessage:(id)a3
{
  objc_msgSend(MEMORY[0x24BED2F40], "sendSingleMessage:category:type:", a3, 16, 12);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventQueue, 0);
}

@end
