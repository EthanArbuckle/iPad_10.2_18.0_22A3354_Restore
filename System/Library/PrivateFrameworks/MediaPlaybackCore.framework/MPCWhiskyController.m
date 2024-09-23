@implementation MPCWhiskyController

- (void)engine:(id)a3 willChangeToItem:(id)a4 fromItem:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  if (v8 && (objc_msgSend(v8, "isPlaceholder") & 1) == 0)
  {
    -[MPCWhiskyController processor](self, "processor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resetAudioUnit");

    -[MPCWhiskyController recordingSession](self, "recordingSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "save");

    -[MPCWhiskyController _emitStatisticsEvent](self, "_emitStatisticsEvent");
  }

}

- (void)_emitStatisticsEvent
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  void *v23;
  _QWORD v24[6];
  _QWORD v25[7];

  v25[6] = *MEMORY[0x24BDAC8D0];
  -[MPCWhiskyController recordingSession](self, "recordingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentRecorder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfSamples");

  if (v5)
  {
    -[MPCWhiskyController recordingSession](self, "recordingSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentRecorder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[MPCSingleTrackAudioProcessor playbackEngine](self, "playbackEngine");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "eventStream");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = CFSTR("vocal-attenuation-statistics-mean");
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("mean"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v22;
    v24[1] = CFSTR("vocal-attenuation-statistics-max");
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("max"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v21;
    v24[2] = CFSTR("vocal-attenuation-statistics-stdev");
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("sigma"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2] = v20;
    v24[3] = CFSTR("vocal-attenuation-statistics-glitches");
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("glitches"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25[3] = v10;
    v24[4] = CFSTR("vocal-attenuation-statistics-samples");
    v11 = (void *)MEMORY[0x24BDD16E0];
    -[MPCWhiskyController recordingSession](self, "recordingSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentRecorder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "numberWithInt:", objc_msgSend(v13, "numberOfSamples"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[4] = v14;
    v24[5] = CFSTR("vocal-attenuation-statistics-thermal");
    v15 = (void *)MEMORY[0x24BDD16E0];
    -[MPCWhiskyController recordingSession](self, "recordingSession");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "currentRecorder");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "numberWithInt:", objc_msgSend(v17, "thermalLevel"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25[5] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "emitEventType:payload:", CFSTR("vocal-attenuation-statistics"), v19);

  }
}

- (MPCRecordingSession)recordingSession
{
  return self->_recordingSession;
}

- (void)_loadModel
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  uint8_t buf[4];
  MPCWhiskyController *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl(&dword_210BD8000, v3, OS_LOG_TYPE_INFO, "[AP] - %{public}@ - Loading model", buf, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_setupQueue);
  -[MPCWhiskyController _updateState:](self, "_updateState:", 1);
  -[MPCWhiskyController modelProvider](self, "modelProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __33__MPCWhiskyController__loadModel__block_invoke;
  v5[3] = &unk_24CAB2048;
  v5[4] = self;
  objc_msgSend(v4, "prepareWithCompletion:", v5);

}

void __33__MPCWhiskyController__loadModel__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (a2 != 2)
  {
    v7 = *(void **)(a1 + 32);
    goto LABEL_5;
  }
  v6 = v5;
  v7 = *(void **)(a1 + 32);
  if (v6)
  {
LABEL_5:
    v8 = 8;
    goto LABEL_6;
  }
  v8 = 2;
LABEL_6:
  objc_msgSend(v7, "_updateState:", v8);

}

- (void)_updateState:(int64_t)a3
{
  unint64_t state;
  MPCRecordingSession *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  MPCRecordingSession *v15;
  MPCRecordingSession *v16;
  MPCRecordingSession *recordingSession;
  __CFString *v18;
  NSObject *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  uint8_t buf[4];
  MPCWhiskyController *v28;
  __int16 v29;
  __CFString *v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  state = self->_state;
  if (state == a3)
    return;
  self->_state = a3;
  if (a3 == 6)
  {
    if (self->_recordingSession)
    {
      v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        if (state >= 9)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("undefined/%ld"), state);
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v20 = off_24CAB2068[state];
        }
        -[MPCRecordingSession sessionID](self->_recordingSession, "sessionID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v28 = self;
        v29 = 2114;
        v30 = v20;
        v31 = 2114;
        v32 = CFSTR("disabled");
        v33 = 2114;
        v34 = v22;
        _os_log_impl(&dword_210BD8000, v19, OS_LOG_TYPE_INFO, "[AP] - %{public}@ - State changed: %{public}@ -> %{public}@ - Flushing recording session: %{public}@", buf, 0x2Au);

      }
      -[MPCWhiskyController _emitStatisticsEvent](self, "_emitStatisticsEvent");
      -[MPCRecordingSession flush](self->_recordingSession, "flush");
      recordingSession = self->_recordingSession;
      self->_recordingSession = 0;
      goto LABEL_16;
    }
  }
  else if (a3 == 5)
  {
    v6 = [MPCRecordingSession alloc];
    -[MPCWhiskyController modelID](self, "modelID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCWhiskyController processor](self, "processor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sampleTime");
    v10 = v9;
    -[MPCWhiskyController processor](self, "processor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "renderingLimit");
    v13 = v12;
    objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[MPCRecordingSession initWithModelID:samplingTime:renderingLimit:shouldRecordSamples:](v6, "initWithModelID:samplingTime:renderingLimit:shouldRecordSamples:", v7, objc_msgSend(v14, "shouldRecordVocalAttenuationStatistics"), v10, v13);
    v16 = self->_recordingSession;
    self->_recordingSession = v15;

    recordingSession = (MPCRecordingSession *)os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(&recordingSession->super, OS_LOG_TYPE_INFO))
    {
      if (state >= 9)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("undefined/%ld"), state);
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = off_24CAB2068[state];
      }
      -[MPCRecordingSession sessionID](self->_recordingSession, "sessionID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v28 = self;
      v29 = 2114;
      v30 = v18;
      v31 = 2114;
      v32 = CFSTR("enabled");
      v33 = 2114;
      v34 = v21;
      _os_log_impl(&dword_210BD8000, &recordingSession->super, OS_LOG_TYPE_INFO, "[AP] - %{public}@ - State changed: %{public}@ -> %{public}@ - New recording session: %{public}@", buf, 0x2Au);

    }
LABEL_16:

  }
  v23 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    if (state >= 9)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("undefined/%ld"), state);
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = off_24CAB2068[state];
    }
    v25 = v24;
    if ((unint64_t)a3 >= 9)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("undefined/%ld"), a3);
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = off_24CAB2068[a3];
    }
    *(_DWORD *)buf = 138543874;
    v28 = self;
    v29 = 2114;
    v30 = v25;
    v31 = 2114;
    v32 = v26;
    _os_log_impl(&dword_210BD8000, v23, OS_LOG_TYPE_INFO, "[AP] - %{public}@ - State changed: %{public}@ -> %{public}@", buf, 0x20u);

  }
  msv_dispatch_on_main_queue();
}

- (void)isEnabled
{
  void *v1;
  uint64_t v2;

  if (result)
  {
    objc_msgSend(result, "processor");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "isEnabled");

    return (void *)v2;
  }
  return result;
}

- (NSString)description
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  BOOL v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  __CFString *v13;
  void *v14;
  unint64_t v15;
  __CFString *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  unint64_t v26;
  uint64_t v27;

  v2 = (uint64_t)self;
  if (self)
  {
    switch(self->_state)
    {
      case 0:
      case 1:
        v3 = (void *)MEMORY[0x24BDD17C8];
        v4 = objc_opt_class();
        v7 = CFSTR("not loaded");
        switch(*(_QWORD *)(v2 + 72))
        {
          case 0:
            goto LABEL_38;
          case 1:
            v7 = CFSTR("loading model");
            break;
          case 2:
            v7 = CFSTR("model ready");
            break;
          case 3:
            v7 = CFSTR("loading processor");
            break;
          case 4:
            v7 = CFSTR("ready");
            break;
          case 5:
            v7 = CFSTR("enabled");
            break;
          case 6:
            v7 = CFSTR("disabled");
            break;
          case 7:
            v7 = CFSTR("unloading");
            break;
          case 8:
            v7 = CFSTR("unavailable");
            break;
          default:
            objc_msgSend((id)0x7C8, "stringWithFormat:", CFSTR("undefined/%ld"), *(_QWORD *)(v2 + 72));
            v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
            break;
        }
        goto LABEL_38;
      case 2:
      case 3:
      case 7:
        v3 = (void *)MEMORY[0x24BDD17C8];
        v4 = objc_opt_class();
        v5 = *(_QWORD *)(v2 + 72);
        v6 = v5 >= 9;
        goto LABEL_4;
      case 4:
      case 5:
      case 6:
        v8 = (void *)MEMORY[0x24BDD17C8];
        v9 = objc_opt_class();
        v10 = *(_QWORD *)(v2 + 72);
        if (v10 >= 9)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("undefined/%ld"), *(_QWORD *)(v2 + 72));
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v7 = off_24CAB2068[v10];
        }
        objc_msgSend((id)v2, "modelProvider");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v11, "state");
        if (v18 >= 4)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("undefined/%ld"), v18);
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v13 = off_24CAB20B0[v18];
        }
        objc_msgSend((id)v2, "processor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v14, "state");
        if (v19 >= 6)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("undefined/%ld"), v19);
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = off_24CAB20D0[v19];
        }
        objc_msgSend(*(id *)(v2 + 96), "modelName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringWithFormat:", CFSTR("<%p - %@> - %@ [M:%@ P:%@] - model: %@ - level: %3.2f"), v2, v9, v7, v13, v16, v17, *(float *)(v2 + 40));
        goto LABEL_26;
      case 8:
        -[MPCWhiskyController modelProvider](self, "modelProvider");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "model");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v3 = (void *)MEMORY[0x24BDD17C8];
        v4 = objc_opt_class();
        v5 = *(_QWORD *)(v2 + 72);
        v6 = v5 >= 9;
        if (v21)
        {
LABEL_4:
          if (v6)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("undefined/%ld"), v5);
            v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v7 = off_24CAB2068[v5];
          }
          objc_msgSend((id)v2, "modelProvider");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "state");
          if (v12 >= 4)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("undefined/%ld"), v12);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v13 = off_24CAB20B0[v12];
          }
          objc_msgSend((id)v2, "processor");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "state");
          if (v15 >= 6)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("undefined/%ld"), v15);
            v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v16 = off_24CAB20D0[v15];
          }
          objc_msgSend(*(id *)(v2 + 96), "modelName");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "stringWithFormat:", CFSTR("<%p - %@> - %@ [M:%@ P:%@] - model: %@"), v2, v4, v7, v13, v16, v17, v27);
LABEL_26:
          v2 = objc_claimAutoreleasedReturnValue();

          goto LABEL_46;
        }
        if (v5 >= 9)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("undefined/%ld"), *(_QWORD *)(v2 + 72));
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v7 = off_24CAB2068[v5];
        }
        objc_msgSend((id)v2, "modelProvider");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v11, "state");
        if (v26 >= 4)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("undefined/%ld"), v26);
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v13 = off_24CAB20B0[v26];
        }
        objc_msgSend((id)v2, "processor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v14, "state");
        if (v23 >= 6)
        {
          v24 = (void *)MEMORY[0x24BDD17C8];
          goto LABEL_44;
        }
        break;
      default:
        return (NSString *)(id)v2;
    }
  }
  else
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    v4 = objc_opt_class();
    v7 = CFSTR("not loaded");
LABEL_38:
    objc_msgSend((id)v2, "modelProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v11, "state");
    if (v22 >= 4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("undefined/%ld"), v22);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_24CAB20B0[v22];
    }
    objc_msgSend((id)v2, "processor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v14, "state");
    if (v23 >= 6)
    {
      v24 = (void *)MEMORY[0x24BDD17C8];
LABEL_44:
      objc_msgSend(v24, "stringWithFormat:", CFSTR("undefined/%ld"), v23);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_45;
    }
  }
  v16 = off_24CAB20D0[v23];
LABEL_45:
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%p - %@> - %@ [M:%@ P:%@]"), v2, v4, v7, v13, v16);
  v2 = objc_claimAutoreleasedReturnValue();
LABEL_46:

  return (NSString *)(id)v2;
}

- (MPCVocalAttenuationProcessor)processor
{
  return self->_processor;
}

- (MPCVocalAttenuationModelProvider)modelProvider
{
  return self->_modelProvider;
}

- (void)isVocalAttenuationAvailable
{
  void *v1;
  uint64_t v2;

  if (result)
  {
    objc_msgSend(result, "processor");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "isAvailable");

    return (void *)v2;
  }
  return result;
}

uint64_t __70__MPCWhiskyController_initWithPlaybackEngine_modelProvider_processor___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadModel");
}

- (MPCWhiskyController)initWithPlaybackEngine:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MPCWhiskyController *v7;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v7 = -[MPCWhiskyController initWithPlaybackEngine:modelProvider:processor:](self, "initWithPlaybackEngine:modelProvider:processor:", v4, v5, v6);

  return v7;
}

- (MPCWhiskyController)initWithPlaybackEngine:(id)a3 modelProvider:(id)a4 processor:(id)a5
{
  id v8;
  id v9;
  id v10;
  MPCWhiskyController *v11;
  MPCWhiskyController *v12;
  void **p_modelProvider;
  id *p_processor;
  void *v15;
  float v16;
  void *v17;
  float v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *setupQueue;
  uint64_t v21;
  void *v22;
  MPCVocalAttenuationProcessorImplementation *v23;
  float v24;
  void *v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  MPCVocalAttenuationPolicyController *v33;
  MPCVocalAttenuationPolicyController *policyController;
  NSObject *v35;
  _QWORD block[4];
  MPCWhiskyController *v38;
  objc_super v39;
  _OWORD v40[2];
  uint64_t v41;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v39.receiver = self;
  v39.super_class = (Class)MPCWhiskyController;
  v11 = -[MPCSingleTrackAudioProcessor initWithPlaybackEngine:](&v39, sel_initWithPlaybackEngine_, v8);
  v12 = v11;
  if (v11)
  {
    v11->_state = 0;
    p_modelProvider = (void **)&v11->_modelProvider;
    objc_storeStrong((id *)&v11->_modelProvider, a4);
    p_processor = (id *)&v12->_processor;
    objc_storeStrong((id *)&v12->_processor, a5);
    objc_msgSend(v8, "addEngineObserver:", v12);
    objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "minVocalLevel");
    v12->_minVocalLevel = v16;

    v12->_maxVocalLevel = 100.0;
    objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "defaultVocalLevel");
    v12->_vocalLevel = v18;

    v19 = dispatch_queue_create("com.apple.MediaPlaybackCore.VAControllerSetupQueue", 0);
    setupQueue = v12->_setupQueue;
    v12->_setupQueue = (OS_dispatch_queue *)v19;

    v21 = objc_opt_new();
    v22 = *p_modelProvider;
    *p_modelProvider = (void *)v21;

    v23 = [MPCVocalAttenuationProcessorImplementation alloc];
    if (v23)
    {
      v24 = 100.0 - v12->_minVocalLevel;
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB1818]), "initWithCommonFormat:sampleRate:channels:interleaved:", 1, 2, 0, 44100.0);
      v26 = objc_msgSend(v25, "streamDescription");
      v27 = *(_OWORD *)v26;
      v28 = *(_OWORD *)(v26 + 16);
      v41 = *(_QWORD *)(v26 + 32);
      v40[0] = v27;
      v40[1] = v28;
      *(float *)&v27 = v24;
      v23 = -[MPCVocalAttenuationProcessorImplementation initWithMaxAttenuationLevel:audioFormat:maxFrames:](v23, "initWithMaxAttenuationLevel:audioFormat:maxFrames:", v40, 0x2000, *(double *)&v27);

    }
    v29 = *p_processor;
    *p_processor = v23;

    v30 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setThermalMonitor:", v31);

    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setLowPowerModeMonitor:", v32);

    objc_msgSend(*p_processor, "renderingLimit");
    objc_msgSend(v30, "setRenderingTimeLimit:");
    v33 = -[MPCVocalAttenuationPolicyController initWithDelegate:parameters:]([MPCVocalAttenuationPolicyController alloc], "initWithDelegate:parameters:", v12, v30);
    policyController = v12->_policyController;
    v12->_policyController = v33;

    v35 = v12->_setupQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __70__MPCWhiskyController_initWithPlaybackEngine_modelProvider_processor___block_invoke;
    block[3] = &unk_24CABA2D0;
    v38 = v12;
    dispatch_async(v35, block);

  }
  return v12;
}

void __36__MPCWhiskyController__updateState___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "playbackEngine");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setVocalAttenuationEnabled:", -[MPCWhiskyController isEnabled](*(void **)(a1 + 32)));
  objc_msgSend(v3, "eventObserver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "engineDidChangeVocalAttenuationState:", v3);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MPCWhiskyController;
  -[MPCSingleTrackAudioProcessor dealloc](&v4, sel_dealloc);
}

- (BOOL)shouldAttachAudioTapToItem:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  const char *v8;
  int v9;
  _BOOL4 v10;
  BOOL v11;
  int v13;
  MPCWhiskyController *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((-[MPCWhiskyController isVocalAttenuationAvailable](self) & 1) == 0)
  {
    v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138543618;
      v14 = self;
      v15 = 2114;
      v16 = v4;
      v8 = "[AP] - %{public}@ - Not attaching tap [VA is not available] - item: %{public}@";
      goto LABEL_16;
    }
LABEL_17:
    v11 = 0;
    goto LABEL_18;
  }
  -[MPCWhiskyController processor](self, "processor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAvailable");

  if ((v6 & 1) == 0)
  {
    v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138543618;
      v14 = self;
      v15 = 2114;
      v16 = v4;
      v8 = "[AP] - %{public}@ - Not attaching tap [processor is not ready] - item: %{public}@";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if ((objc_msgSend(v4, "supportsVocalAttenuation") & 1) == 0)
  {
    v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138543618;
      v14 = self;
      v15 = 2114;
      v16 = v4;
      v8 = "[AP] - %{public}@ - Not attaching tap [VA not supported] - item: %{public}@";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if (objc_msgSend(v4, "loadedAudioAssetType") >= 3)
  {
    v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138543618;
      v14 = self;
      v15 = 2114;
      v16 = v4;
      v8 = "[AP] - %{public}@ - Not attaching tap [hls playback] - item: %{public}@";
LABEL_16:
      _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, 0x16u);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  v9 = objc_msgSend(v4, "isDownloadedAsset");
  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v10 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v10)
    {
      v13 = 138543618;
      v14 = self;
      v15 = 2114;
      v16 = v4;
      v8 = "[AP] - %{public}@ - Not attaching tap [download playback] - item: %{public}@";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if (v10)
  {
    v13 = 138543618;
    v14 = self;
    v15 = 2114;
    v16 = v4;
    _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Attaching tap to %{public}@", (uint8_t *)&v13, 0x16u);
  }
  v11 = 1;
LABEL_18:

  return v11;
}

- (unsigned)creationFlags
{
  if (MSVDeviceIsROSDevice())
    return 1;
  else
    return 9;
}

- (void)prepareTap:(opaqueMTAudioProcessingTap *)a3 maxFrames:(int64_t)a4 processingFormat:(const AudioStreamBasicDescription *)a5
{
  NSObject *v8;
  void *v9;
  int v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  int v14;
  void *v15;
  __int128 v16;
  char v17;
  _OWORD v18[2];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v18[0]) = 138543362;
    *(_QWORD *)((char *)v18 + 4) = self;
    _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Preparing tap", (uint8_t *)v18, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "disableAudioProcessing");

  if (v10)
  {
    v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v18[0]) = 138543362;
      *(_QWORD *)((char *)v18 + 4) = self;
      v12 = "[AP] - %{public}@ - Preparing tap - Canceling [audio processing disabled]";
LABEL_12:
      _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)v18, 0xCu);
    }
  }
  else
  {
    -[MPCWhiskyController processor](self, "processor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isAvailable");

    if ((v14 & 1) != 0)
    {
      -[MPCWhiskyController processor](self, "processor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_OWORD *)&a5->mBytesPerPacket;
      v18[0] = *(_OWORD *)&a5->mSampleRate;
      v18[1] = v16;
      v19 = *(_QWORD *)&a5->mBitsPerChannel;
      v17 = objc_msgSend(v15, "isCompatibleWithAudioFormat:maxFrames:", v18, a4);

      if ((v17 & 1) != 0)
        return;
      v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v18[0]) = 138543362;
        *(_QWORD *)((char *)v18 + 4) = self;
        v12 = "[AP] - %{public}@ - Preparing tap - Canceling [audio format not compatible with processor]";
        goto LABEL_12;
      }
    }
    else
    {
      v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v18[0]) = 138543362;
        *(_QWORD *)((char *)v18 + 4) = self;
        v12 = "[AP] - %{public}@ - Preparing tap - Canceling [processor not ready]";
        goto LABEL_12;
      }
    }
  }

}

- (void)unprepareTap:(opaqueMTAudioProcessingTap *)a3
{
  NSObject *v4;
  int v5;
  MPCWhiskyController *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Unpreparing tap", (uint8_t *)&v5, 0xCu);
  }

  -[MPCWhiskyController _tearDownTapData](self, "_tearDownTapData");
}

- (void)processTap:(opaqueMTAudioProcessingTap *)a3 sampleIndex:(int64_t)a4 numberFrames:(int64_t)a5 flags:(unsigned int)a6 audioBufferList:(AudioBufferList *)a7 numberFramesOut:(int64_t *)a8 flagsOut:(unsigned int *)a9
{
  void *v13;
  char v14;
  void *v15;
  int v16;
  __uint64_t v17;
  MPCVocalAttenuationProcessor *processor;
  char v19;
  id v20;
  NSObject *v21;
  double v22;
  MPCSample *v23;
  double vocalLevel;
  void *v25;
  void *v26;
  MPCSample *v27;
  void *v28;
  id v29;
  uint8_t buf[4];
  MPCWhiskyController *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults", a3, a4, a5, *(_QWORD *)&a6, a7, a8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "disableAudioProcessing");

  if ((v14 & 1) == 0)
  {
    -[MPCWhiskyController processor](self, "processor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEnabled");

    if (v16)
    {
      v17 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
      processor = self->_processor;
      v29 = 0;
      v19 = -[MPCVocalAttenuationProcessor processAudioBuffer:sampleIndex:numberFrames:error:](processor, "processAudioBuffer:sampleIndex:numberFrames:error:", a7, a4, a5, &v29);
      v20 = v29;
      if ((v19 & 1) == 0)
      {
        v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v31 = self;
          v32 = 2114;
          v33 = v20;
          _os_log_impl(&dword_210BD8000, v21, OS_LOG_TYPE_ERROR, "[AP] - %{public}@ - Rendering error: %{public}@", buf, 0x16u);
        }

      }
      v22 = (double)(clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) - v17) / 1000000000.0 * 1000.0;
      v23 = [MPCSample alloc];
      vocalLevel = self->_vocalLevel;
      -[MPCSingleTrackAudioProcessor playbackEngine](self, "playbackEngine");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "player");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[MPCSample initWithLevel:time:state:](v23, "initWithLevel:time:state:", objc_msgSend(v26, "state"), vocalLevel, v22);

      -[MPCWhiskyController recordingSession](self, "recordingSession");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "recordSample:", v27);

    }
  }
}

- (void)finalizeTap:(opaqueMTAudioProcessingTap *)a3
{
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  MPCWhiskyController *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v5.receiver = self;
  v5.super_class = (Class)MPCWhiskyController;
  -[MPCSingleTrackAudioProcessor finalizeTap:](&v5, sel_finalizeTap_, a3);
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Finalizing tap", buf, 0xCu);
  }

}

- (NSString)modelID
{
  void *v2;
  void *v3;

  -[MPCWhiskyController modelProvider](self, "modelProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)blockingPolicy
{
  void *v2;
  void *v3;

  -[MPCWhiskyController policyController](self, "policyController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "blockingEvaluation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)renderingTimeLimit
{
  void *v2;
  double v3;
  double v4;

  -[MPCWhiskyController processor](self, "processor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "renderingLimit");
  v4 = v3;

  return v4;
}

- (void)_tearDownTapData
{
  id v2;

  -[MPCWhiskyController processor](self, "processor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetAudioUnit");

}

- (float)_processorLevelForVocalLevel:(float)a3
{
  float minVocalLevel;
  float maxVocalLevel;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  NSObject *v13;
  int v15;
  MPCWhiskyController *v16;
  __int16 v17;
  double v18;
  __int16 v19;
  double v20;
  __int16 v21;
  double v22;
  __int16 v23;
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  minVocalLevel = self->_minVocalLevel;
  maxVocalLevel = self->_maxVocalLevel;
  -[MPCVocalAttenuationProcessor minLevel](self->_processor, "minLevel");
  v8 = 100.0 - v7;
  -[MPCVocalAttenuationProcessor maxLevel](self->_processor, "maxLevel");
  v10 = log10f((float)(100.0 - v9) / 100.0);
  v11 = (float)(v10 * 20.0)
      + (float)((float)((float)(0.0 - (float)(v10 * 20.0)) / (float)(maxVocalLevel - minVocalLevel))
              * (float)(a3 - minVocalLevel));
  v12 = v8 * __exp10f(v11 / 20.0);
  v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v15 = 138544386;
    v16 = self;
    v17 = 2048;
    v18 = a3;
    v19 = 2048;
    v20 = v11;
    v21 = 2048;
    v22 = v12;
    v23 = 2048;
    v24 = (float)(100.0 - v12);
    _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_INFO, "[AP] - %{public}@ - Mapping ui->db->au->p: %3.2fui -> %3.2fdB -> %3.2fau -> %3.2fp", (uint8_t *)&v15, 0x34u);
  }

  return 100.0 - v12;
}

- (float)_vocalLevelForProcessorLevel:(float)a3
{
  float minVocalLevel;
  float maxVocalLevel;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  NSObject *v13;
  int v15;
  MPCWhiskyController *v16;
  __int16 v17;
  double v18;
  __int16 v19;
  double v20;
  __int16 v21;
  double v22;
  __int16 v23;
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  minVocalLevel = self->_minVocalLevel;
  maxVocalLevel = self->_maxVocalLevel;
  -[MPCVocalAttenuationProcessor minLevel](self->_processor, "minLevel");
  v8 = 100.0 - v7;
  -[MPCVocalAttenuationProcessor maxLevel](self->_processor, "maxLevel");
  v10 = log10f((float)(100.0 - v9) / 100.0) * 20.0;
  v11 = log10f((float)(100.0 - a3) / v8) * 20.0;
  v12 = minVocalLevel
      + (float)((float)((float)(maxVocalLevel - minVocalLevel) * (float)(v11 - v10)) / (float)(0.0 - v10));
  v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v15 = 138544386;
    v16 = self;
    v17 = 2048;
    v18 = a3;
    v19 = 2048;
    v20 = (float)(100.0 - a3);
    v21 = 2048;
    v22 = v11;
    v23 = 2048;
    v24 = v12;
    _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_INFO, "[AP] - %{public}@ - Mapping p->au->db->ui: %3.2fp -> %3.2fau -> %3.2fdB -> %3.2fui", (uint8_t *)&v15, 0x34u);
  }

  return v12;
}

- (void)_updateShutdownSequence
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  -[MPCWhiskyController shutdownTimer](self, "shutdownTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MPCWhiskyController shutdownTimer](self, "shutdownTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[MPCWhiskyController setShutdownTimer:](self, "setShutdownTimer:", 0);
  }
  if (-[MPCWhiskyController isEnabled](self))
  {
    -[MPCSingleTrackAudioProcessor playbackEngine](self, "playbackEngine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "player");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "state");

    if (v7 <= 6 && ((1 << v7) & 0x43) != 0)
    {
      objc_initWeak(&location, self);
      v8 = (void *)MEMORY[0x24BE65CC8];
      objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "vocalAttenuationGracePeriodAfterPause");
      v11 = v10;
      v12 = MEMORY[0x24BDAC9B8];
      v13 = MEMORY[0x24BDAC9B8];
      v15 = MEMORY[0x24BDAC760];
      v16 = 3221225472;
      v17 = __46__MPCWhiskyController__updateShutdownSequence__block_invoke;
      v18 = &unk_24CABA2F8;
      objc_copyWeak(&v19, &location);
      objc_msgSend(v8, "timerWithInterval:repeats:queue:block:", 0, v12, &v15, v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCWhiskyController setShutdownTimer:](self, "setShutdownTimer:", v14, v15, v16, v17, v18);

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }
}

- (void)vocalAttenuationPolicyControllerDidChange:(id)a3
{
  id v4;
  MPCWhiskyControllerDisabledState *v5;
  void *v6;
  MPCWhiskyControllerDisabledState *v7;
  MPCWhiskyControllerDisabledState *disabledState;
  void *v9;
  MPCWhiskyControllerDisabledState *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  v5 = [MPCWhiskyControllerDisabledState alloc];
  objc_msgSend(v4, "blockingEvaluation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[MPCWhiskyControllerDisabledState initWithPolicyEvaluation:](v5, "initWithPolicyEvaluation:", v6);
  disabledState = self->_disabledState;
  self->_disabledState = v7;

  -[MPCSingleTrackAudioProcessor playbackEngine](self, "playbackEngine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = self->_disabledState;
  v13 = v9;
  objc_msgSend(v9, "eventObserver");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
    objc_msgSend(v11, "engineDidBlockVocalAttenuation:", v13);
  else
    objc_msgSend(v11, "engineDidUnblockVocalAttenuation:", v13);

}

- (void)engine:(id)a3 didChangeToState:(unint64_t)a4
{
  void *v5;

  if (a4 <= 4 && ((1 << a4) & 0x15) != 0)
  {
    -[MPCWhiskyController recordingSession](self, "recordingSession", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "save");

  }
  -[MPCWhiskyController _updateShutdownSequence](self, "_updateShutdownSequence");
}

- (void)engineDidResetMediaServices:(id)a3
{
  -[MPCWhiskyController _tearDownTapData](self, "_tearDownTapData", a3);
  -[MPCSingleTrackAudioProcessor recreateAudioTap](self, "recreateAudioTap");
}

- (void)engineDidReceiveMediaServicesPurge:(id)a3
{
  -[MPCWhiskyController _tearDownTapData](self, "_tearDownTapData", a3);
  -[MPCSingleTrackAudioProcessor recreateAudioTap](self, "recreateAudioTap");
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (MPCVocalAttenuationPolicyController)policyController
{
  return self->_policyController;
}

- (MSVTimer)shutdownTimer
{
  return self->_shutdownTimer;
}

- (void)setShutdownTimer:(id)a3
{
  objc_storeStrong((id *)&self->_shutdownTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shutdownTimer, 0);
  objc_storeStrong((id *)&self->_policyController, 0);
  objc_storeStrong((id *)&self->_processor, 0);
  objc_storeStrong((id *)&self->_modelProvider, 0);
  objc_storeStrong((id *)&self->_recordingSession, 0);
  objc_storeStrong((id *)&self->_disabledState, 0);
  objc_storeStrong((id *)&self->_shutdownSequenceStartDate, 0);
  objc_storeStrong((id *)&self->_setupQueue, 0);
}

void __46__MPCWhiskyController__updateShutdownSequence__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 138543362;
      v4 = WeakRetained;
      _os_log_impl(&dword_210BD8000, v2, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Disabling Vocal Attenuation [paused for a while]", (uint8_t *)&v3, 0xCu);
    }

    -[MPCWhiskyController setEnabled:](WeakRetained, 0);
  }

}

- (void)setEnabled:(void *)a1
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;

  if (a1)
  {
    objc_msgSend(a1, "processor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isAvailable");

    if (v5)
    {
      objc_msgSend(a1, "processor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setEnabled:", a2);

      objc_msgSend(a1, "processor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEnabled"))
        v8 = 5;
      else
        v8 = 6;
      objc_msgSend(a1, "_updateState:", v8);

      objc_msgSend(a1, "_updateShutdownSequence");
    }
  }
}

- (void)prepareForProcessing
{
  NSObject *v2;
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[4];
  _QWORD *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v6 = a1;
      _os_log_impl(&dword_210BD8000, v2, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Preparing for processing", buf, 0xCu);
    }

    if (a1[9] == 2)
    {
      objc_msgSend(a1, "_updateState:", 3);
      v3 = a1[4];
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __43__MPCWhiskyController_prepareForProcessing__block_invoke;
      block[3] = &unk_24CABA2D0;
      block[4] = a1;
      dispatch_async(v3, block);
    }
  }
}

void __43__MPCWhiskyController_prepareForProcessing__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "processor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "modelProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43__MPCWhiskyController_prepareForProcessing__block_invoke_2;
  v5[3] = &unk_24CAB2048;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "prepareWithModel:completion:", v4, v5);

}

void __43__MPCWhiskyController_prepareForProcessing__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  double v17;
  double v18;
  void *v19;
  int v20;
  _DWORD *v21;
  double v22;
  int v23;
  int v24;
  void *v25;
  double v26;
  int v27;
  uint64_t v28;
  __int16 v29;
  double v30;
  __int16 v31;
  double v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (a2 != 2)
  {
    v8 = *(void **)(a1 + 32);
    goto LABEL_5;
  }
  v7 = *(void **)(a1 + 32);
  if (v5)
  {
    v8 = *(void **)(a1 + 32);
LABEL_5:
    v9 = 8;
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 32), "processor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "maxLevel");
  objc_msgSend(v7, "_vocalLevelForProcessorLevel:");
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 56) = v11;

  v12 = *(void **)(a1 + 32);
  objc_msgSend(v12, "processor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "minLevel");
  objc_msgSend(v12, "_vocalLevelForProcessorLevel:");
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 60) = v14;

  v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(float *)(v16 + 56);
    v18 = *(float *)(v16 + 60);
    v27 = 138543874;
    v28 = v16;
    v29 = 2048;
    v30 = v17;
    v31 = 2048;
    v32 = v18;
    _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Vocal level range: [%3.2f, %3.2f]", (uint8_t *)&v27, 0x20u);
  }

  objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "defaultVocalLevel");
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 40) = v20;

  v21 = *(_DWORD **)(a1 + 32);
  LODWORD(v22) = v21[10];
  objc_msgSend(v21, "_processorLevelForVocalLevel:", v22);
  v24 = v23;
  objc_msgSend(*(id *)(a1 + 32), "processor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v26) = v24;
  objc_msgSend(v25, "setLevel:", v26);

  v8 = *(void **)(a1 + 32);
  v9 = 4;
LABEL_6:
  objc_msgSend(v8, "_updateState:", v9);

}

void __37__MPCWhiskyController_setVocalLevel___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "playbackEngine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "eventObserver");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "engineDidChangeVocalAttenuationLevel:", v2);

}

@end
