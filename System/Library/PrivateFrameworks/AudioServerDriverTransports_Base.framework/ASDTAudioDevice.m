@implementation ASDTAudioDevice

+ (id)deviceForConfig:(id)a3 withDeviceManager:(id)a4 andPlugin:(id)a5
{
  id v7;
  id v8;
  id v9;
  objc_class *v10;
  void *v11;
  void *v12;
  uint8_t v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (objc_class *)objc_msgSend(v7, "asdtSubclass");
  if ((-[objc_class isSubclassOfClass:](v10, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
  {
    v11 = (void *)objc_msgSend([v10 alloc], "initWithConfig:withDeviceManager:andPlugin:", v7, v8, v9);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Subclass"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[ASDTAudioDevice deviceForConfig:withDeviceManager:andPlugin:].cold.1(v12, v14);
    }
    v11 = 0;
  }

  return v11;
}

+ (double)defaultSamplingRate
{
  return 48000.0;
}

- (ASDTAudioDevice)initWithConfig:(id)a3 withDeviceManager:(id)a4 andPlugin:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  char v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  BOOL v30;
  void *v31;
  uint64_t v32;
  void *v33;
  ASDTAudioDevice *v34;
  id v36;
  double v37;
  objc_super v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "asdtDeviceUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_15;
  v38.receiver = self;
  v38.super_class = (Class)ASDTAudioDevice;
  self = -[ASDAudioDevice initWithDeviceUID:withPlugin:](&v38, sel_initWithDeviceUID_withPlugin_, v11, v10);
  if (self)
  {
    -[ASDAudioDevice setCanBeDefaultInputDevice:](self, "setCanBeDefaultInputDevice:", objc_msgSend(v8, "asdtCanBeDefaultInputDevice"));
    -[ASDAudioDevice setCanBeDefaultOutputDevice:](self, "setCanBeDefaultOutputDevice:", objc_msgSend(v8, "asdtCanBeDefaultOutputDevice"));
    -[ASDAudioDevice setCanBeDefaultSystemDevice:](self, "setCanBeDefaultSystemDevice:", objc_msgSend(v8, "asdtCanBeDefaultSystemDevice"));
    -[ASDTAudioDevice setDeviceManager:](self, "setDeviceManager:", v9);
    -[ASDAudioDevice setClockDomain:](self, "setClockDomain:", objc_msgSend(v8, "asdtClockDomain"));
    objc_msgSend(v8, "asdtName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDAudioDevice setDeviceName:](self, "setDeviceName:", v12);

    -[ASDAudioDevice setManufacturerName:](self, "setManufacturerName:", CFSTR("Apple Inc."));
    objc_msgSend(v8, "asdtDeviceModel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDAudioDevice setModelName:](self, "setModelName:", v13);

    -[ASDAudioDevice setTransportType:](self, "setTransportType:", objc_msgSend(v8, "asdtTransportType"));
    -[ASDTAudioDevice setPmOrderPowerUp:](self, "setPmOrderPowerUp:", objc_msgSend(v8, "asdtPMOrderWithDefaultForPowerUp:", 1));
    -[ASDTAudioDevice setPmOrderPowerDown:](self, "setPmOrderPowerDown:", objc_msgSend(v8, "asdtPMOrderWithDefaultForPowerUp:", 0));
    -[ASDTAudioDevice setPmNoStateChangeOnFailure:](self, "setPmNoStateChangeOnFailure:", objc_msgSend(v8, "asdtPMNoStateChangeOnFailure"));
    -[ASDTAudioDevice setPowerState:](self, "setPowerState:", 0);
    objc_msgSend(v8, "asdtRelatedDeviceUIDs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTAudioDevice setRelatedDeviceUIDs:](self, "setRelatedDeviceUIDs:", v14);

    -[ASDAudioDevice modelName](self, "modelName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = v15 == 0;

    if ((_DWORD)v14)
    {
      -[ASDAudioDevice deviceUID](self, "deviceUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASDAudioDevice setModelName:](self, "setModelName:", v16);

    }
    -[ASDAudioDevice deviceName](self, "deviceName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17 == 0;

    if (v18)
    {
      -[ASDAudioDevice modelName](self, "modelName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASDAudioDevice setDeviceName:](self, "setDeviceName:", v19);

    }
    -[ASDTAudioDevice setWillDoReadInputInPlace:](self, "setWillDoReadInputInPlace:", 1);
    -[ASDTAudioDevice setWillDoWriteMixInPlace:](self, "setWillDoWriteMixInPlace:", 1);
    v37 = 0.0;
    objc_msgSend((id)objc_opt_class(), "defaultSamplingRate");
    v36 = 0;
    v20 = objc_msgSend(v8, "asdtSamplingRate:andSamplingRates:withDefault:", &v37, &v36);
    v21 = v36;
    if ((v20 & 1) == 0)
      goto LABEL_14;
    -[ASDTAudioDevice setSamplingRate:](self, "setSamplingRate:", v37);
    -[ASDAudioDevice setSamplingRates:](self, "setSamplingRates:", v21);
    -[ASDAudioDevice samplingRates](self, "samplingRates");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "asdtInputLatenciesForSamplingRates:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTAudioDevice setInputLatencies:](self, "setInputLatencies:", v23);

    -[ASDAudioDevice samplingRates](self, "samplingRates");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "asdtOutputLatenciesForSamplingRates:", v24);
    v25 = objc_claimAutoreleasedReturnValue();
    -[ASDTAudioDevice setOutputLatencies:](self, "setOutputLatencies:", v25);

    objc_msgSend(v8, "asdtCustomProperties");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v25) = -[ASDTAudioDevice addCustomProperties:](self, "addCustomProperties:", v26);

    if ((v25 & 1) == 0)
      goto LABEL_14;
    objc_msgSend(v8, "asdtControls");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[ASDTAudioDevice addControls:](self, "addControls:", v27);

    if (!v28)
      goto LABEL_14;
    objc_msgSend(v8, "asdtStreams");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[ASDTAudioDevice addStreams:](self, "addStreams:", v29);

    if (v30)
    {
      objc_msgSend(v8, "asdtPMDevices");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      +[ASDTPMSequencer pmSequencerWithPMDeviceConfig:withParent:](ASDTPMSequencer, "pmSequencerWithPMDeviceConfig:withParent:", v31, self);
      v32 = objc_claimAutoreleasedReturnValue();
      -[ASDTAudioDevice setPmSequencer:](self, "setPmSequencer:", v32);

      -[ASDTAudioDevice pmSequencer](self, "pmSequencer");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v32) = v33 == 0;

      if ((v32 & 1) == 0)
      {

        goto LABEL_13;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        -[ASDAudioDevice deviceUID](self, "deviceUID");
        objc_claimAutoreleasedReturnValue();
        -[ASDTAudioDevice initWithConfig:withDeviceManager:andPlugin:].cold.1();
      }

    }
    else
    {
LABEL_14:

    }
LABEL_15:
    v34 = 0;
    goto LABEL_16;
  }
LABEL_13:
  self = self;
  v34 = self;
LABEL_16:

  return v34;
}

- (BOOL)addCustomProperties:(id)a3
{
  uint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  BOOL v14;
  void *v16;
  unsigned int v17;
  int v18;
  int v19;
  int v20;
  unsigned int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  unsigned int v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  unsigned int v43;
  __int16 v44;
  int v45;
  __int16 v46;
  int v47;
  __int16 v48;
  int v49;
  __int16 v50;
  unsigned int v51;
  __int16 v52;
  int v53;
  __int16 v54;
  int v55;
  __int16 v56;
  int v57;
  __int16 v58;
  int v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = a3;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v61, 16);
  if (v3)
  {
    v27 = *(_QWORD *)v37;
    while (2)
    {
      v26 = v3;
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v37 != v27)
          objc_enumerationMutation(obj);
        +[ASDTCustomProperty customPropertyForConfig:](ASDTCustomProperty, "customPropertyForConfig:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i), v26);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v5)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            -[ASDAudioDevice deviceUID](self, "deviceUID");
            objc_claimAutoreleasedReturnValue();
            -[ASDTAudioDevice addCustomProperties:].cold.1();
          }
LABEL_20:

          v14 = 0;
          goto LABEL_22;
        }
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        -[ASDTAudioDevice customProperties](self, "customProperties");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v60, 16);
        if (v7)
        {
          v8 = *(_QWORD *)v33;
          while (2)
          {
            for (j = 0; j != v7; ++j)
            {
              if (*(_QWORD *)v33 != v8)
                objc_enumerationMutation(v6);
              v10 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
              objc_msgSend(v10, "address");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "address");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = objc_msgSend(v11, "isEqual:", v12);

              if (v13)
              {
                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                {
                  -[ASDAudioDevice deviceUID](self, "deviceUID");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v10, "selector") >> 29
                    && objc_msgSend(v10, "selector") >> 24 <= 0x7E)
                  {
                    v17 = objc_msgSend(v10, "selector") >> 24;
                  }
                  else
                  {
                    v17 = 32;
                  }
                  v30 = v17;
                  if ((objc_msgSend(v10, "selector") & 0xE00000) != 0
                    && (objc_msgSend(v10, "selector") >> 16) <= 0x7Eu)
                  {
                    v18 = (objc_msgSend(v10, "selector") >> 16);
                  }
                  else
                  {
                    v18 = 32;
                  }
                  v28 = v18;
                  if ((objc_msgSend(v10, "selector") & 0xE000) != 0
                    && ((unsigned __int16)objc_msgSend(v10, "selector") >> 8) <= 0x7Eu)
                  {
                    v19 = ((unsigned __int16)objc_msgSend(v10, "selector") >> 8);
                  }
                  else
                  {
                    v19 = 32;
                  }
                  if ((objc_msgSend(v10, "selector") & 0xE0) != 0
                    && objc_msgSend(v10, "selector") <= 0x7Eu)
                  {
                    v20 = objc_msgSend(v10, "selector");
                  }
                  else
                  {
                    v20 = 32;
                  }
                  if (objc_msgSend(v10, "scope") >> 29
                    && objc_msgSend(v10, "scope") >> 24 <= 0x7E)
                  {
                    v21 = objc_msgSend(v10, "scope") >> 24;
                  }
                  else
                  {
                    v21 = 32;
                  }
                  if ((objc_msgSend(v10, "scope") & 0xE00000) != 0
                    && (objc_msgSend(v10, "scope") >> 16) <= 0x7Eu)
                  {
                    v22 = (objc_msgSend(v10, "scope") >> 16);
                  }
                  else
                  {
                    v22 = 32;
                  }
                  if ((objc_msgSend(v10, "scope") & 0xE000) != 0
                    && ((unsigned __int16)objc_msgSend(v10, "scope") >> 8) <= 0x7Eu)
                  {
                    v23 = ((unsigned __int16)objc_msgSend(v10, "scope") >> 8);
                  }
                  else
                  {
                    v23 = 32;
                  }
                  if ((objc_msgSend(v10, "scope") & 0xE0) != 0 && objc_msgSend(v10, "scope") <= 0x7Eu)
                    v24 = objc_msgSend(v10, "scope");
                  else
                    v24 = 32;
                  v25 = objc_msgSend(v10, "element");
                  *(_DWORD *)buf = 138414594;
                  v41 = v16;
                  v42 = 1024;
                  v43 = v30;
                  v44 = 1024;
                  v45 = v28;
                  v46 = 1024;
                  v47 = v19;
                  v48 = 1024;
                  v49 = v20;
                  v50 = 1024;
                  v51 = v21;
                  v52 = 1024;
                  v53 = v22;
                  v54 = 1024;
                  v55 = v23;
                  v56 = 1024;
                  v57 = v24;
                  v58 = 1024;
                  v59 = v25;
                  _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%@: Device already has property '%c%c%c%c' with scope '%c%c%c%c' and element %u", buf, 0x42u);

                }
                goto LABEL_20;
              }
            }
            v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v60, 16);
            if (v7)
              continue;
            break;
          }
        }

        -[ASDTAudioDevice addCustomProperty:](self, "addCustomProperty:", v5);
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v61, 16);
      v14 = 1;
      if (v3)
        continue;
      break;
    }
  }
  else
  {
    v14 = 1;
  }
LABEL_22:

  return v14;
}

- (BOOL)addControls:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        +[ASDTControlFactory controlForConfig:withDevice:](ASDTControlFactory, "controlForConfig:withDevice:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), self, (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            -[ASDAudioDevice deviceUID](self, "deviceUID");
            objc_claimAutoreleasedReturnValue();
            -[ASDTAudioDevice addControls:].cold.1();
          }
          v9 = 0;
          goto LABEL_13;
        }
        -[ASDAudioDevice addControl:](self, "addControl:", v8);

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_13:

  return v9;
}

- (BOOL)addStreams:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        +[ASDTStream streamForConfig:withDevice:](ASDTStream, "streamForConfig:withDevice:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), self, (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (!v8)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            -[ASDAudioDevice deviceUID](self, "deviceUID");
            objc_claimAutoreleasedReturnValue();
            -[ASDTAudioDevice addStreams:].cold.1();
          }
          v10 = 0;
          goto LABEL_16;
        }
        if (objc_msgSend(v8, "direction") == 1768845428)
          -[ASDAudioDevice addInputStream:](self, "addInputStream:", v9);
        else
          -[ASDAudioDevice addOutputStream:](self, "addOutputStream:", v9);

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_16:

  return v10;
}

- (BOOL)addPMDevices:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[ASDTAudioDevice pmSequencer](self, "pmSequencer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "addPMDevicesWithConfig:", v4);

  return v6;
}

- (void)updateInputLatency
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[ASDTAudioDevice inputLatencies](self, "inputLatencies");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    -[ASDAudioDevice samplingRate](self, "samplingRate");
    objc_msgSend(v4, "numberWithDouble:");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[ASDTAudioDevice inputLatencies](self, "inputLatencies");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDAudioDevice setInputLatency:](self, "setInputLatency:", objc_msgSend(v6, "unsignedIntValue"));

  }
}

- (void)updateOutputLatency
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[ASDTAudioDevice outputLatencies](self, "outputLatencies");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    -[ASDAudioDevice samplingRate](self, "samplingRate");
    objc_msgSend(v4, "numberWithDouble:");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[ASDTAudioDevice outputLatencies](self, "outputLatencies");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDAudioDevice setOutputLatency:](self, "setOutputLatency:", objc_msgSend(v6, "unsignedIntValue"));

  }
}

- (void)setInputLatencies:(id)a3
{
  objc_storeStrong((id *)&self->_inputLatencies, a3);
  -[ASDTAudioDevice updateInputLatency](self, "updateInputLatency");
}

- (void)setOutputLatencies:(id)a3
{
  objc_storeStrong((id *)&self->_outputLatencies, a3);
  -[ASDTAudioDevice updateOutputLatency](self, "updateOutputLatency");
}

- (void)_updateSafetyOffsets:(double)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  unsigned int v13;
  void *v14;
  BOOL v15;
  void *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  unsigned int v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  -[ASDAudioDevice outputStreams](self, "outputStreams", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[ASDAudioDevice outputStreams](self, "outputStreams");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v7)
    {
      v8 = 0;
      v9 = 0;
      v10 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v29 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v13 = objc_msgSend(v12, "safetyOffset");
            if (v13 <= v9)
              v9 = v9;
            else
              v9 = v13;
            v8 = 1;
          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v7);

      if ((v8 & 1) != 0)
      {
        -[ASDAudioDevice setOutputSafetyOffset:](self, "setOutputSafetyOffset:", v9);
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
          -[ASDTAudioDevice _updateSafetyOffsets:].cold.2(self);
      }
    }
    else
    {

    }
  }
  -[ASDAudioDevice inputStreams](self, "inputStreams");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count") == 0;

  if (!v15)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[ASDAudioDevice inputStreams](self, "inputStreams", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v17)
    {
      v18 = 0;
      v19 = 0;
      v20 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v25 != v20)
            objc_enumerationMutation(v16);
          v22 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v23 = objc_msgSend(v22, "safetyOffset");
            if (v23 <= v19)
              v19 = v19;
            else
              v19 = v23;
            v18 = 1;
          }
        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v17);

      if ((v18 & 1) != 0)
      {
        -[ASDAudioDevice setInputSafetyOffset:](self, "setInputSafetyOffset:", v19);
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
          -[ASDTAudioDevice _updateSafetyOffsets:].cold.1(self);
      }
    }
    else
    {

    }
  }
}

- (void)setSamplingRate:(double)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASDTAudioDevice;
  -[ASDAudioDevice setSamplingRate:](&v4, sel_setSamplingRate_, a3);
  -[ASDTAudioDevice updateInputLatency](self, "updateInputLatency");
  -[ASDTAudioDevice updateOutputLatency](self, "updateOutputLatency");
}

- (BOOL)changeSamplingRate:(double)a3
{
  double v5;
  _QWORD v7[4];
  id v8[2];
  id location;

  objc_initWeak(&location, self);
  -[ASDAudioDevice samplingRate](self, "samplingRate");
  if (v5 != a3)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __38__ASDTAudioDevice_changeSamplingRate___block_invoke;
    v7[3] = &unk_250842388;
    objc_copyWeak(v8, &location);
    v8[1] = *(id *)&a3;
    -[ASDAudioDevice requestConfigurationChange:](self, "requestConfigurationChange:", v7);
    objc_destroyWeak(v8);
  }
  objc_destroyWeak(&location);
  return 1;
}

void __38__ASDTAudioDevice_changeSamplingRate___block_invoke(uint64_t a1)
{
  double v1;
  id WeakRetained;

  v1 = *(double *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setSamplingRate:", v1);

}

- (id)willDoReadInputBlock
{
  BOOL v3;
  BOOL v4;
  _QWORD aBlock[4];
  BOOL v7;
  BOOL v8;

  v3 = -[ASDAudioDevice hasInput](self, "hasInput");
  v4 = -[ASDTAudioDevice willDoReadInputInPlace](self, "willDoReadInputInPlace");
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __39__ASDTAudioDevice_willDoReadInputBlock__block_invoke;
  aBlock[3] = &__block_descriptor_34_e14_i28__0I8_12_20l;
  v7 = v3;
  v8 = v4;
  return _Block_copy(aBlock);
}

uint64_t __39__ASDTAudioDevice_willDoReadInputBlock__block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3, _BYTE *a4)
{
  *a3 = *(_BYTE *)(a1 + 32);
  *a4 = *(_BYTE *)(a1 + 33);
  return 0;
}

- (id)willDoWriteMixBlock
{
  BOOL v3;
  BOOL v4;
  _QWORD aBlock[4];
  BOOL v7;
  BOOL v8;

  v3 = -[ASDAudioDevice hasOutput](self, "hasOutput");
  v4 = -[ASDTAudioDevice willDoWriteMixInPlace](self, "willDoWriteMixInPlace");
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __38__ASDTAudioDevice_willDoWriteMixBlock__block_invoke;
  aBlock[3] = &__block_descriptor_34_e14_i28__0I8_12_20l;
  v7 = v3;
  v8 = v4;
  return _Block_copy(aBlock);
}

uint64_t __38__ASDTAudioDevice_willDoWriteMixBlock__block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3, _BYTE *a4)
{
  *a3 = *(_BYTE *)(a1 + 32);
  *a4 = *(_BYTE *)(a1 + 33);
  return 0;
}

- (id)allStreams
{
  void *v3;
  void *v4;
  void *v5;

  -[ASDAudioDevice inputStreams](self, "inputStreams");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDAudioDevice outputStreams](self, "outputStreams");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int)streamPowerStateTransition:(int)a3
{
  uint64_t v3;
  id v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = *(_QWORD *)&a3;
  v17 = *MEMORY[0x24BDAC8D0];
  -[ASDTAudioDevice allStreams](self, "allStreams");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = objc_msgSend(v9, "pmStateTransition:", v3, (_QWORD)v12);
        if (!v5)
          v5 = v10;
        if (v10 && (asdtPowerTransitionUpwards(v3) & 1) != 0)
          break;
      }
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

  return v5;
}

- (int)performPowerStateSleep
{
  return -[ASDTAudioDevice streamPowerStateTransition:](self, "streamPowerStateTransition:", 1685286000);
}

- (int)performPowerStateIdle:(int)a3
{
  uint64_t v3;
  unsigned int v5;
  int v6;
  BOOL v7;
  int v8;
  objc_super v10;

  v3 = *(_QWORD *)&a3;
  if (a3 == 1684628588 && -[ASDAudioDevice isRunning](self, "isRunning"))
  {
    v10.receiver = self;
    v10.super_class = (Class)ASDTAudioDevice;
    v5 = -[ASDAudioDevice performStopIO](&v10, sel_performStopIO);
  }
  else
  {
    v5 = 0;
  }
  v6 = -[ASDTAudioDevice streamPowerStateTransition:](self, "streamPowerStateTransition:", v3);
  if (v6)
    v7 = v5 == 0;
  else
    v7 = 0;
  if (v7)
    v8 = v6;
  else
    v8 = v5;
  -[ASDTAudioDevice setStatusProtocolObjects:](self, "setStatusProtocolObjects:", 0);
  return v8;
}

- (int)performPowerStatePrepare:(int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  if (a3 == 1970303090)
    -[ASDTAudioDevice setupStatusProtocol](self, "setupStatusProtocol");
  return -[ASDTAudioDevice streamPowerStateTransition:](self, "streamPowerStateTransition:", v3);
}

- (int)performPowerStateOn
{
  int result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASDTAudioDevice;
  result = -[ASDAudioDevice performStartIO](&v4, sel_performStartIO);
  if (!result)
    return -[ASDTAudioDevice streamPowerStateTransition:](self, "streamPowerStateTransition:", 1970435438);
  return result;
}

- (int)performStartIO
{
  void *v2;
  int v3;

  -[ASDTAudioDevice pmSequencer](self, "pmSequencer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "executeSequenceToState:", 1920298606);

  return v3;
}

- (int)performStopIO
{
  void *v2;
  int v3;

  -[ASDTAudioDevice pmSequencer](self, "pmSequencer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "executeSequenceToState:", 1768189029);

  return v3;
}

- (int)systemSleepPending
{
  void *v2;
  int v3;

  -[ASDTAudioDevice pmSequencer](self, "pmSequencer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "executeSequenceToState:", 1936483696);

  return v3;
}

- (int)systemCompletedPowerOn
{
  void *v2;
  int v3;

  -[ASDTAudioDevice pmSequencer](self, "pmSequencer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "executeSequenceToState:", 1768189029);

  return v3;
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  BOOL v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  id obj;
  uint64_t v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  objc_super v74;
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v4 = a4;
  v78 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v74.receiver = self;
  v74.super_class = (Class)ASDTAudioDevice;
  -[ASDAudioDevice diagnosticDescriptionWithIndent:walkTree:](&v74, sel_diagnosticDescriptionWithIndent_walkTree_, v6, v4);
  v61 = (id)objc_claimAutoreleasedReturnValue();
  -[ASDTAudioDevice inputLatencies](self, "inputLatencies");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count") == 0;

  if (!v8)
  {
    objc_msgSend(v61, "appendFormat:", CFSTR("%@|    input latencies (sampeRate : frames):\n"), v6);
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    -[ASDTAudioDevice inputLatencies](self, "inputLatencies");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v70, v77, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v71 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
          -[ASDTAudioDevice inputLatencies](self, "inputLatencies");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "doubleValue");
          objc_msgSend(v61, "appendFormat:", CFSTR("%@|        %6.0lf : %u\n"), v6, v17, objc_msgSend(v16, "unsignedIntValue"));

        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v70, v77, 16);
      }
      while (v11);
    }

  }
  -[ASDTAudioDevice outputLatencies](self, "outputLatencies");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count") == 0;

  if (!v19)
  {
    objc_msgSend(v61, "appendFormat:", CFSTR("%@|    output latencies (sampleRate : frames):\n"), v6);
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    -[ASDTAudioDevice outputLatencies](self, "outputLatencies");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "allKeys");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v67;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v67 != v23)
            objc_enumerationMutation(v21);
          v25 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * j);
          -[ASDTAudioDevice outputLatencies](self, "outputLatencies");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectForKeyedSubscript:", v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v25, "doubleValue");
          objc_msgSend(v61, "appendFormat:", CFSTR("%@|        %6.0lf : %u\n"), v6, v28, objc_msgSend(v27, "unsignedIntValue"));

        }
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
      }
      while (v22);
    }

  }
  objc_msgSend(v61, "appendFormat:", CFSTR("%@|    Custom Properties:\n"), v6);
  -[ASDTAudioDevice customProperties](self, "customProperties");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "count") == 0;

  if (!v30)
  {
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    objc_opt_self();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "customProperties");
    obj = (id)objc_claimAutoreleasedReturnValue();

    v57 = v6;
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
    if (v32)
    {
      v59 = 0;
      v56 = *(_QWORD *)v63;
      do
      {
        v33 = 0;
        v58 = v32;
        do
        {
          if (*(_QWORD *)v63 != v56)
            objc_enumerationMutation(obj);
          v34 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v33);
          v60 = v59 + v33;
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            if (objc_msgSend(v34, "selector") >> 29
              && objc_msgSend(v34, "selector") >> 24 <= 0x7E)
            {
              v35 = objc_msgSend(v34, "selector") >> 24;
            }
            else
            {
              v35 = 32;
            }
            v55 = v35;
            if ((objc_msgSend(v34, "selector") & 0xE00000) != 0
              && (objc_msgSend(v34, "selector") >> 16) <= 0x7Eu)
            {
              v37 = (objc_msgSend(v34, "selector") >> 16);
            }
            else
            {
              v37 = 32;
            }
            if ((objc_msgSend(v34, "selector") & 0xE000) != 0
              && ((unsigned __int16)objc_msgSend(v34, "selector") >> 8) <= 0x7Eu)
            {
              v39 = ((unsigned __int16)objc_msgSend(v34, "selector") >> 8);
            }
            else
            {
              v39 = 32;
            }
            if ((objc_msgSend(v34, "selector") & 0xE0) != 0 && objc_msgSend(v34, "selector") <= 0x7Eu)
              v41 = objc_msgSend(v34, "selector");
            else
              v41 = 32;
            if (objc_msgSend(v34, "scope") >> 29
              && objc_msgSend(v34, "scope") >> 24 <= 0x7E)
            {
              v43 = objc_msgSend(v34, "scope") >> 24;
            }
            else
            {
              v43 = 32;
            }
            if ((objc_msgSend(v34, "scope") & 0xE00000) != 0
              && (objc_msgSend(v34, "scope") >> 16) <= 0x7Eu)
            {
              v44 = (objc_msgSend(v34, "scope") >> 16);
            }
            else
            {
              v44 = 32;
            }
            if ((objc_msgSend(v34, "scope") & 0xE000) != 0
              && ((unsigned __int16)objc_msgSend(v34, "scope") >> 8) <= 0x7Eu)
            {
              v47 = ((unsigned __int16)objc_msgSend(v34, "scope") >> 8);
            }
            else
            {
              v47 = 32;
            }
            if ((objc_msgSend(v34, "scope") & 0xE0) != 0 && objc_msgSend(v34, "scope") <= 0x7Eu)
              v49 = objc_msgSend(v34, "scope");
            else
              v49 = 32;
            v51 = objc_msgSend(v34, "element");
            objc_msgSend(v34, "value");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "appendFormat:", CFSTR("%@|        %u: %c%c%c%c (%c%c%c%c, %u): %@\n"), v57, v60, v55, v37, v39, v41, v43, v44, v47, v49, v51, v52);

          }
          else
          {
            if (objc_msgSend(v34, "selector") >> 29
              && objc_msgSend(v34, "selector") >> 24 <= 0x7E)
            {
              v36 = objc_msgSend(v34, "selector") >> 24;
            }
            else
            {
              v36 = 32;
            }
            if ((objc_msgSend(v34, "selector") & 0xE00000) != 0
              && (objc_msgSend(v34, "selector") >> 16) <= 0x7Eu)
            {
              v38 = (objc_msgSend(v34, "selector") >> 16);
            }
            else
            {
              v38 = 32;
            }
            if ((objc_msgSend(v34, "selector") & 0xE000) != 0
              && ((unsigned __int16)objc_msgSend(v34, "selector") >> 8) <= 0x7Eu)
            {
              v40 = ((unsigned __int16)objc_msgSend(v34, "selector") >> 8);
            }
            else
            {
              v40 = 32;
            }
            if ((objc_msgSend(v34, "selector") & 0xE0) != 0 && objc_msgSend(v34, "selector") <= 0x7Eu)
              v42 = objc_msgSend(v34, "selector");
            else
              v42 = 32;
            if (objc_msgSend(v34, "scope") >> 29
              && objc_msgSend(v34, "scope") >> 24 <= 0x7E)
            {
              v45 = objc_msgSend(v34, "scope") >> 24;
            }
            else
            {
              v45 = 32;
            }
            if ((objc_msgSend(v34, "scope") & 0xE00000) != 0
              && (objc_msgSend(v34, "scope") >> 16) <= 0x7Eu)
            {
              v46 = (objc_msgSend(v34, "scope") >> 16);
            }
            else
            {
              v46 = 32;
            }
            if ((objc_msgSend(v34, "scope") & 0xE000) != 0
              && ((unsigned __int16)objc_msgSend(v34, "scope") >> 8) <= 0x7Eu)
            {
              v48 = ((unsigned __int16)objc_msgSend(v34, "scope") >> 8);
            }
            else
            {
              v48 = 32;
            }
            if ((objc_msgSend(v34, "scope") & 0xE0) != 0 && objc_msgSend(v34, "scope") <= 0x7Eu)
              v50 = objc_msgSend(v34, "scope");
            else
              v50 = 32;
            objc_msgSend(v61, "appendFormat:", CFSTR("%@|        %u: %c%c%c%c (%c%c%c%c, %u) (value unknown)\n"), v57, v60, v36, v38, v40, v42, v45, v46, v48, v50, objc_msgSend(v34, "element"));
          }
          ++v33;
        }
        while (v58 != v33);
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
        v59 = (v59 + v33);
      }
      while (v32);
    }

    v6 = v57;
  }

  return v61;
}

- (id)customPropertyForAddress:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ASDTAudioDevice customProperties](self, "customProperties");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "address", (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "selector");
        if (v11 == objc_msgSend(v4, "selector"))
        {
          v12 = objc_msgSend(v10, "element");
          if (v12 == objc_msgSend(v4, "element"))
          {
            v13 = objc_msgSend(v10, "scope");
            if (v13 == objc_msgSend(v4, "scope"))
            {
              v6 = v9;

              goto LABEL_13;
            }
          }
        }

      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_13:

  return v6;
}

- (BOOL)updateCustomProperty:(id)a3 withAddress:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;
  void *v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "address");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "address");
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v9;
  }
  -[ASDTAudioDevice customPropertyForAddress:](self, "customPropertyForAddress:", v7);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if ((id)v10 == v6)
    goto LABEL_9;
  if (!v6)
  {
    -[ASDTAudioDevice removeCustomProperty:](self, "removeCustomProperty:", v10);
LABEL_13:
    v15 = 1;
    goto LABEL_14;
  }
  if (!v10)
  {
LABEL_12:
    -[ASDTAudioDevice addCustomProperty:](self, "addCustomProperty:", v6);
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    -[ASDTAudioDevice removeCustomProperty:](self, "removeCustomProperty:", v11);
    goto LABEL_12;
  }
  objc_msgSend(v11, "value");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqual:", v13);

  if ((v14 & 1) == 0)
  {
    objc_msgSend(v6, "propertyValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPropertyValue:", v17);

    goto LABEL_13;
  }
LABEL_9:
  v15 = 0;
LABEL_14:

  return v15;
}

- (NSSet)relatedDeviceObjectIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[ASDTAudioDevice objectID](self, "objectID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  -[ASDTAudioDevice plugin](self, "plugin");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDTAudioDevice relatedDeviceUIDs](self, "relatedDeviceUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectIDsForDeviceUIDs:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v7);

  v8 = (void *)objc_msgSend(v3, "copy");
  return (NSSet *)v8;
}

- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5
{
  void *v5;
  unsigned int v6;
  objc_super v8;

  if (!a3)
    return 0;
  if (a3->mSelector == 1634429294)
  {
    -[ASDTAudioDevice relatedDeviceObjectIDs](self, "relatedDeviceObjectIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 4 * objc_msgSend(v5, "count");

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ASDTAudioDevice;
    return -[ASDAudioDevice dataSizeForProperty:withQualifierSize:andQualifierData:](&v8, sel_dataSizeForProperty_withQualifierSize_andQualifierData_);
  }
  return v6;
}

- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8
{
  BOOL v8;
  _DWORD *v10;
  uint64_t v11;
  uint64_t v13;
  void *v16;
  int v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  objc_super v27;
  objc_super v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v8 = 0;
  v34 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    if (a6)
    {
      v10 = a7;
      if (a7)
      {
        v11 = *(_QWORD *)&a8;
        v13 = *(_QWORD *)&a4;
        if (a3->mSelector == 1936879204)
        {
          v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0A260]), "initWithAddress:", ((unint64_t)a3->mScope << 32) | 0x73726464, 0);
          -[ASDTAudioDevice customPropertyForAddress:](self, "customPropertyForAddress:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v23;
          if (v23)
          {
            v25 = objc_msgSend(v23, "getPropertyWithQualifierSize:qualifierData:dataSize:andData:forClient:", v13, a5, a6, v10, v11);
          }
          else
          {
            v28.receiver = self;
            v28.super_class = (Class)ASDTAudioDevice;
            v25 = -[ASDAudioDevice getProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:](&v28, sel_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient_, a3, v13, a5, a6, v10, v11);
          }
          v8 = v25;

        }
        else if (a3->mSelector == 1634429294)
        {
          -[ASDTAudioDevice relatedDeviceObjectIDs](self, "relatedDeviceObjectIDs");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "count");
          v8 = *a6 >= 4 * v17;
          if (*a6 >= 4 * v17)
          {
            *a6 = 4 * v17;
            v29 = 0u;
            v30 = 0u;
            v31 = 0u;
            v32 = 0u;
            v18 = v16;
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
            if (v19)
            {
              v20 = *(_QWORD *)v30;
              do
              {
                for (i = 0; i != v19; ++i)
                {
                  if (*(_QWORD *)v30 != v20)
                    objc_enumerationMutation(v18);
                  *v10++ = objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "unsignedIntValue");
                }
                v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
              }
              while (v19);
            }

          }
        }
        else
        {
          v27.receiver = self;
          v27.super_class = (Class)ASDTAudioDevice;
          return -[ASDAudioDevice getProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:](&v27, sel_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient_, a3, *(_QWORD *)&a4, a5, a6, a7, *(_QWORD *)&a8);
        }
      }
    }
  }
  return v8;
}

- (void)terminate
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  BOOL v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (!-[ASDTAudioDevice terminated](self, "terminated"))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      -[ASDAudioDevice deviceUID](self, "deviceUID");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v3;
      v13 = 2112;
      v14 = v5;
      _os_log_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: %@ Terminated.", (uint8_t *)&v11, 0x16u);

    }
    -[ASDTAudioDevice setTerminated:](self, "setTerminated:", 1);
    -[ASDTAudioDevice deviceManager](self, "deviceManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 == 0;

    if (v7)
    {
      -[ASDTAudioDevice plugin](self, "plugin");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9 == 0;

      if (v10)
        return;
      -[ASDTAudioDevice plugin](self, "plugin");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeAudioDevice:", self);
    }
    else
    {
      -[ASDTAudioDevice deviceManager](self, "deviceManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeAudioDevice:", self);
    }

  }
}

- (void)addStatusProtocolObject:(id)a3 toArray:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_256455FD8))
  {
    v6 = v8;
    objc_msgSend(v6, "status");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(v5, "addObject:", v6);

  }
}

- (void)setupStatusProtocol
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[ASDTAudioDevice allStreams](self, "allStreams");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v27;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v27 != v6)
          objc_enumerationMutation(v4);
        -[ASDTAudioDevice addStatusProtocolObject:toArray:](self, "addStatusProtocolObject:toArray:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v7++), v3);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v5);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[ASDTAudioDevice pmSequencer](self, "pmSequencer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pmDevicesPowerUp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v23;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v9);
        -[ASDTAudioDevice addStatusProtocolObject:toArray:](self, "addStatusProtocolObject:toArray:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v12++), v3);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
    }
    while (v10);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[ASDAudioDevice controls](self, "controls", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v19;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v13);
        -[ASDTAudioDevice addStatusProtocolObject:toArray:](self, "addStatusProtocolObject:toArray:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v16++), v3);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
    }
    while (v14);
  }

  if (objc_msgSend(v3, "count"))
  {
    v17 = (void *)objc_msgSend(v3, "copy");
    -[ASDTAudioDevice setStatusProtocolObjects:](self, "setStatusProtocolObjects:", v17);

  }
  else
  {
    -[ASDTAudioDevice setStatusProtocolObjects:](self, "setStatusProtocolObjects:", 0);
  }

}

- (NSDictionary)status
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[ASDTAudioDevice statusProtocolObjects](self, "statusProtocolObjects", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6), "status");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          if (!v3)
          {
            objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
            v3 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v3, "addEntriesFromDictionary:", v7);
        }

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  v8 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v8;
}

- (BOOL)configurationChangesPending
{
  void *v3;
  int v4;
  void *v5;
  char v6;

  -[ASDAudioDevice configurationChangeDelegate](self, "configurationChangeDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_256454508);

  if (!v4)
    return 0;
  -[ASDAudioDevice configurationChangeDelegate](self, "configurationChangeDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "configurationChangePendingForObject:", self);

  return v6;
}

- (int)powerState
{
  return self->powerState;
}

- (void)setPowerState:(int)a3
{
  self->powerState = a3;
}

- (NSDictionary)inputLatencies
{
  return self->_inputLatencies;
}

- (NSDictionary)outputLatencies
{
  return self->_outputLatencies;
}

- (unsigned)pmOrderPowerUp
{
  return self->_pmOrderPowerUp;
}

- (void)setPmOrderPowerUp:(unsigned int)a3
{
  self->_pmOrderPowerUp = a3;
}

- (unsigned)pmOrderPowerDown
{
  return self->_pmOrderPowerDown;
}

- (void)setPmOrderPowerDown:(unsigned int)a3
{
  self->_pmOrderPowerDown = a3;
}

- (BOOL)pmNoStateChangeOnFailure
{
  return self->_pmNoStateChangeOnFailure;
}

- (void)setPmNoStateChangeOnFailure:(BOOL)a3
{
  self->_pmNoStateChangeOnFailure = a3;
}

- (ASDTPMSequencer)pmSequencer
{
  return self->_pmSequencer;
}

- (void)setPmSequencer:(id)a3
{
  objc_storeStrong((id *)&self->_pmSequencer, a3);
}

- (ASDTDeviceManager)deviceManager
{
  return self->_deviceManager;
}

- (void)setDeviceManager:(id)a3
{
  objc_storeStrong((id *)&self->_deviceManager, a3);
}

- (BOOL)willDoReadInputInPlace
{
  return self->_willDoReadInputInPlace;
}

- (void)setWillDoReadInputInPlace:(BOOL)a3
{
  self->_willDoReadInputInPlace = a3;
}

- (BOOL)willDoWriteMixInPlace
{
  return self->_willDoWriteMixInPlace;
}

- (void)setWillDoWriteMixInPlace:(BOOL)a3
{
  self->_willDoWriteMixInPlace = a3;
}

- (NSSet)relatedDeviceUIDs
{
  return self->_relatedDeviceUIDs;
}

- (void)setRelatedDeviceUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_relatedDeviceUIDs, a3);
}

- (NSArray)statusProtocolObjects
{
  return self->_statusProtocolObjects;
}

- (void)setStatusProtocolObjects:(id)a3
{
  objc_storeStrong((id *)&self->_statusProtocolObjects, a3);
}

- (BOOL)terminated
{
  return self->_terminated;
}

- (void)setTerminated:(BOOL)a3
{
  self->_terminated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusProtocolObjects, 0);
  objc_storeStrong((id *)&self->_relatedDeviceUIDs, 0);
  objc_storeStrong((id *)&self->_deviceManager, 0);
  objc_storeStrong((id *)&self->_pmSequencer, 0);
  objc_storeStrong((id *)&self->_outputLatencies, 0);
  objc_storeStrong((id *)&self->_inputLatencies, 0);
}

+ (void)deviceForConfig:(void *)a1 withDeviceManager:(uint8_t *)buf andPlugin:.cold.1(void *a1, uint8_t *buf)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Invalid subclass name: %@", buf, 0xCu);

  OUTLINED_FUNCTION_1_5();
}

- (void)initWithConfig:withDeviceManager:andPlugin:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_6(&dword_236CEE000, MEMORY[0x24BDACB70], v4, "%@: Failed creating PM seqeucner with config: %@", v5);

  OUTLINED_FUNCTION_1_5();
}

- (void)addCustomProperties:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_6(&dword_236CEE000, MEMORY[0x24BDACB70], v4, "%@: Failed creating custom property with config: %@", v5);

  OUTLINED_FUNCTION_1_5();
}

- (void)addControls:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_6(&dword_236CEE000, MEMORY[0x24BDACB70], v4, "%@: Failed creating control with config: %@", v5);

  OUTLINED_FUNCTION_1_5();
}

- (void)addStreams:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_6(&dword_236CEE000, MEMORY[0x24BDACB70], v4, "%@: Failed to create stream for config:\n%@", v5);

  OUTLINED_FUNCTION_1_5();
}

- (void)_updateSafetyOffsets:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "deviceUID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_7(&dword_236CEE000, MEMORY[0x24BDACB70], v2, "%@: Input safety offset: %u frames", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_0_1();
}

- (void)_updateSafetyOffsets:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "deviceUID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_7(&dword_236CEE000, MEMORY[0x24BDACB70], v2, "%@: Output safety offset: %u frames", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_0_1();
}

@end
