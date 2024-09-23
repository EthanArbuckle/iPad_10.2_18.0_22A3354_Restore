@implementation ZN2re29AudioManagerTelemetryReporter19initializeTimerWithEPNS

const __CFString *___ZN2re29AudioManagerTelemetryReporter19initializeTimerWithEPNS_18AudioManager_PHASEEPU28objcproto17OS_dispatch_queue8NSObject_block_invoke_2(re *ReverbPreset)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  id v4;
  void *v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(*((_QWORD *)ReverbPreset + 4) + 40);
  if (v1)
  {
    ReverbPreset = (re *)re::AudioManager_PHASE_Async::getReverbPreset(*(pthread_rwlock_t ***)(v1 + 520));
    v2 = (uint64_t)ReverbPreset;
  }
  else
  {
    v2 = -1;
  }
  v3 = *re::audioLogObjects(ReverbPreset);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134217984;
    v8 = v2;
    _os_log_impl(&dword_224FE9000, v3, OS_LOG_TYPE_DEFAULT, "[AudioManagerTelemetryReporter::immersion] - Report: reverbPreset: %lld", (uint8_t *)&v7, 0xCu);
  }
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("reverbPreset"));

  return CFSTR("immersion");
}

const __CFString *___ZN2re29AudioManagerTelemetryReporter19initializeTimerWithEPNS_18AudioManager_PHASEEPU28objcproto17OS_dispatch_queue8NSObject_block_invoke_11(uint64_t a1)
{
  uint64_t v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _OWORD __s2[3];
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[20];
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v30 = 0;
  memset(__s2, 0, sizeof(__s2));
  v31 = xmmword_226100BF0;
  v32 = xmmword_226100C00;
  v33 = xmmword_226100C10;
  if (memcmp((const void *)(v1 + 48), __s2, 0x68uLL))
  {
    if (*(_DWORD *)(v1 + 96))
    {
      v3 = *(double *)(v1 + 104);
      v2 = *(double *)(v1 + 112);
      v4 = *(double *)(v1 + 120);
    }
    else
    {
      v4 = -100.0;
      v2 = -100.0;
      v3 = -100.0;
    }
    if (*(_DWORD *)(v1 + 100))
    {
      v5 = *(double *)(v1 + 128);
      v6 = *(double *)(v1 + 112);
      v7 = *(double *)(v1 + 144);
    }
    else
    {
      v7 = -100.0;
      v6 = -100.0;
      v5 = -100.0;
    }
    v34[0] = CFSTR("play");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", *(unsigned int *)(v1 + 48));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v28;
    v34[1] = CFSTR("maxConcurrentPlayCount");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", *(unsigned int *)(v1 + 52));
    v36 = objc_claimAutoreleasedReturnValue();
    v34[2] = CFSTR("prepare");
    v27 = (void *)v36;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", *(unsigned int *)(v1 + 60));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v26;
    v34[3] = CFSTR("maxConcurrentPrepareCount");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", *(unsigned int *)(v1 + 56));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v25;
    v34[4] = CFSTR("channelComponent");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", *(unsigned int *)(v1 + 64));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v24;
    v34[5] = CFSTR("ambientComponent");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", *(unsigned int *)(v1 + 72));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v23;
    v34[6] = CFSTR("spatialComponent");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", *(unsigned int *)(v1 + 68));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v22;
    v34[7] = CFSTR("spatialComponentOmniCount");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", *(unsigned int *)(v1 + 76));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v21;
    v34[8] = CFSTR("spatialComponentHumanDirectivityCount");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", *(unsigned int *)(v1 + 80));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v20;
    v34[9] = CFSTR("spatialComponentBeamDirectivityCount");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", *(unsigned int *)(v1 + 84));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v19;
    v34[10] = CFSTR("spatialComponentSphericalApproximationDirectivityCount");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", *(unsigned int *)(v1 + 88));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v18;
    v34[11] = CFSTR("calibrationModeNoneCount");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", *(unsigned int *)(v1 + 92));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v17;
    v34[12] = CFSTR("calibrationModeRelativeSplCount");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", *(unsigned int *)(v1 + 96));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v16;
    v34[13] = CFSTR("calibrationModeAbsoluteSplCount");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", *(unsigned int *)(v1 + 100));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v8;
    v34[14] = CFSTR("calibrationModeRelativeSplMinValue");
    objc_msgSend(MEMORY[0x24BDD1518], "numberWithDouble:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v9;
    v34[15] = CFSTR("calibrationModeRelativeSplAverage");
    objc_msgSend(MEMORY[0x24BDD1518], "numberWithDouble:", v2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v10;
    v34[16] = CFSTR("calibrationModeRelativeSplMaxValue");
    objc_msgSend(MEMORY[0x24BDD1518], "numberWithDouble:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v11;
    v34[17] = CFSTR("calibrationModeAbsoluteSplMinValue");
    objc_msgSend(MEMORY[0x24BDD1518], "numberWithDouble:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v12;
    v34[18] = CFSTR("calibrationModeAbsoluteSplAverage");
    objc_msgSend(MEMORY[0x24BDD1518], "numberWithDouble:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v13;
    v34[19] = CFSTR("calibrationModeAbsoluteSplMaxValue");
    objc_msgSend(MEMORY[0x24BDD1518], "numberWithDouble:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v35, v34, 20);
    objc_claimAutoreleasedReturnValue();

  }
  *(_QWORD *)(v1 + 96) = 0;
  *(_OWORD *)(v1 + 64) = 0u;
  *(_OWORD *)(v1 + 80) = 0u;
  *(_OWORD *)(v1 + 48) = 0u;
  *(_OWORD *)(v1 + 104) = xmmword_226100BF0;
  *(_OWORD *)(v1 + 120) = xmmword_226100C00;
  *(_OWORD *)(v1 + 136) = xmmword_226100C10;
  return CFSTR("system_usage");
}

@end
