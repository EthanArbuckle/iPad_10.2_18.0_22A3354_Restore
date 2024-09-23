@implementation ASDDSPAudioDevice

- (ASDDSPAudioDevice)initWithDeviceUID:(id)a3 underlyingDevice:(id)a4 deviceDSPDatabase:(id)a5 plugin:(id)a6
{
  id v11;
  id v12;
  ASDDSPAudioDevice *v13;
  ASDDSPAudioDevice *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  objc_super v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v12 = a5;
  v45.receiver = self;
  v45.super_class = (Class)ASDDSPAudioDevice;
  v13 = -[ASDAudioDevice initWithDeviceUID:withPlugin:](&v45, sel_initWithDeviceUID_withPlugin_, a3, a6);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_underlyingDevice, a4);
    objc_storeStrong((id *)&v14->_dspDatabase, a5);
    -[ASDAudioDeviceDSPDatabase referencedUnderlyingDeviceProperties](v14->_dspDatabase, "referencedUnderlyingDeviceProperties");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[ASDDSPAudioDevice underlyingDeviceHasAllProperties:](v14, "underlyingDeviceHasAllProperties:", v15);

    if (v16)
    {
      objc_msgSend(v11, "setConfigurationChangeDelegate:", v14);
      objc_msgSend(v11, "setPropertyChangedDelegate:", v14);
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      objc_msgSend(v11, "inputStreams");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v42 != v20)
              objc_enumerationMutation(v17);
            objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "setPropertyChangedDelegate:", v14);
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
        }
        while (v19);
      }

      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      objc_msgSend(v11, "outputStreams");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v38;
        do
        {
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v38 != v25)
              objc_enumerationMutation(v22);
            objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * j), "setPropertyChangedDelegate:", v14);
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
        }
        while (v24);
      }

      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      objc_msgSend(v11, "controls", 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v34;
        do
        {
          for (k = 0; k != v29; ++k)
          {
            if (*(_QWORD *)v34 != v30)
              objc_enumerationMutation(v27);
            objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * k), "setPropertyChangedDelegate:", v14);
          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
        }
        while (v29);
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ASDDSPAudioDevice initWithDeviceUID:underlyingDevice:deviceDSPDatabase:plugin:].cold.1(v14);
      v27 = v14;
      v14 = 0;
    }

  }
  return v14;
}

- (BOOL)underlyingDeviceHasAllProperties:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  uint64_t v27;
  __int128 v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  void *v40;
  uint64_t v41;
  int v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  int v52;
  __int16 v53;
  int v54;
  __int16 v55;
  int v56;
  __int16 v57;
  int v58;
  __int16 v59;
  int v60;
  __int16 v61;
  int v62;
  __int16 v63;
  int v64;
  __int16 v65;
  int v66;
  __int16 v67;
  int v68;
  __int16 v69;
  int v70;
  __int16 v71;
  int v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v43, v73, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v44;
    v9 = 1;
    v10 = MEMORY[0x24BDACB70];
    *(_QWORD *)&v6 = 138415362;
    v29 = v6;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v44 != v8)
          objc_enumerationMutation(v4);
        v12 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v11);
        v42 = 0;
        v41 = 0;
        v41 = objc_msgSend(v12, "audioObjectPropertyAddress", v29);
        v42 = v13;
        if (!-[ASDAudioDevice hasProperty:](self->_underlyingDevice, "hasProperty:", &v41))
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            -[ASDAudioDevice deviceUID](self, "deviceUID");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            if ((int)objc_msgSend(v12, "selector") < 0x20000000 || (int)objc_msgSend(v12, "selector") > 2130706431)
              v14 = 32;
            else
              v14 = (int)objc_msgSend(v12, "selector") >> 24;
            v39 = v14;
            if ((int)(objc_msgSend(v12, "selector") << 8) < 0x20000000
              || (int)(objc_msgSend(v12, "selector") << 8) > 2130706431)
            {
              v15 = 32;
            }
            else
            {
              v15 = (int)(objc_msgSend(v12, "selector") << 8) >> 24;
            }
            v38 = v15;
            if ((int)(objc_msgSend(v12, "selector") << 16) < 0x20000000
              || (int)(objc_msgSend(v12, "selector") << 16) > 2130706431)
            {
              v16 = 32;
            }
            else
            {
              v16 = (__int16)objc_msgSend(v12, "selector") >> 8;
            }
            v37 = v16;
            if ((int)(objc_msgSend(v12, "selector") << 24) < 520093697
              || objc_msgSend(v12, "selector") == 127)
            {
              v17 = 32;
            }
            else
            {
              v17 = (char)objc_msgSend(v12, "selector");
            }
            v36 = v17;
            if ((int)objc_msgSend(v12, "scope") < 0x20000000 || (int)objc_msgSend(v12, "scope") > 2130706431)
              v18 = 32;
            else
              v18 = (int)objc_msgSend(v12, "scope") >> 24;
            v35 = v18;
            if ((int)(objc_msgSend(v12, "scope") << 8) < 0x20000000
              || (int)(objc_msgSend(v12, "scope") << 8) > 2130706431)
            {
              v19 = 32;
            }
            else
            {
              v19 = (int)(objc_msgSend(v12, "scope") << 8) >> 24;
            }
            v34 = v19;
            if ((int)(objc_msgSend(v12, "scope") << 16) < 0x20000000
              || (int)(objc_msgSend(v12, "scope") << 16) > 2130706431)
            {
              v20 = 32;
            }
            else
            {
              v20 = (__int16)objc_msgSend(v12, "scope") >> 8;
            }
            v33 = v20;
            if ((int)(objc_msgSend(v12, "scope") << 24) < 520093697
              || objc_msgSend(v12, "scope") == 127)
            {
              v21 = 32;
            }
            else
            {
              v21 = (char)objc_msgSend(v12, "scope");
            }
            v32 = v21;
            if ((int)objc_msgSend(v12, "element") < 0x20000000 || (int)objc_msgSend(v12, "element") > 2130706431)
              v22 = 32;
            else
              v22 = (int)objc_msgSend(v12, "element") >> 24;
            v31 = v22;
            if ((int)(objc_msgSend(v12, "element") << 8) < 0x20000000
              || (int)(objc_msgSend(v12, "element") << 8) > 2130706431)
            {
              v23 = 32;
            }
            else
            {
              v23 = (int)(objc_msgSend(v12, "element") << 8) >> 24;
            }
            v30 = v23;
            v10 = MEMORY[0x24BDACB70];
            if ((int)(objc_msgSend(v12, "element") << 16) < 0x20000000)
            {
              v25 = 32;
              v24 = v37;
            }
            else
            {
              v24 = v37;
              if ((int)(objc_msgSend(v12, "element") << 16) > 2130706431)
                v25 = 32;
              else
                v25 = (__int16)objc_msgSend(v12, "element") >> 8;
            }
            if ((int)(objc_msgSend(v12, "element") << 24) < 520093697
              || objc_msgSend(v12, "element") == 127)
            {
              v26 = 32;
            }
            else
            {
              v26 = (char)objc_msgSend(v12, "element");
            }
            *(_DWORD *)buf = v29;
            v48 = v40;
            v49 = 1024;
            v50 = v39;
            v51 = 1024;
            v52 = v38;
            v53 = 1024;
            v54 = v24;
            v55 = 1024;
            v56 = v36;
            v57 = 1024;
            v58 = v35;
            v59 = 1024;
            v60 = v34;
            v61 = 1024;
            v62 = v33;
            v63 = 1024;
            v64 = v32;
            v65 = 1024;
            v66 = v31;
            v67 = 1024;
            v68 = v30;
            v69 = 1024;
            v70 = v25;
            v71 = 1024;
            v72 = v26;
            _os_log_error_impl(&dword_219C60000, v10, OS_LOG_TYPE_ERROR, "Underlying device '%@' is missing property %c%c%c%c %c%c%c%c %c%c%c%c", buf, 0x54u);

            v9 = 0;
          }
          else
          {
            v9 = 0;
          }
        }
        ++v11;
      }
      while (v7 != v11);
      v27 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v43, v73, 16);
      v7 = v27;
    }
    while (v27);
  }
  else
  {
    v9 = 1;
  }

  return v9 & 1;
}

- (BOOL)updateDeviceDSPConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint8_t v32[128];
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  -[ASDDSPAudioDevice currentDSPConfiguration](self, "currentDSPConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDDSPAudioDevice findDSPConfigurationForCurrentState](self, "findDSPConfigurationForCurrentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", v3))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      -[ASDAudioDevice deviceUID](self, "deviceUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v34 = v5;
      _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "DSP configuration remains unchanged on device '%@'", buf, 0xCu);

    }
LABEL_8:
    v9 = 1;
    goto LABEL_32;
  }
  if (-[ASDDSPAudioDevice applyDeviceDSPConfiguration:](self, "applyDeviceDSPConfiguration:", v4))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASDAudioDevice deviceUID](self, "deviceUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v34 = v6;
      v35 = 2112;
      v36 = v7;
      v37 = 2112;
      v38 = v8;
      _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "DSP configuration changed from '%@' to '%@' on device '%@'", buf, 0x20u);

    }
    -[ASDDSPAudioDevice setCurrentDSPConfiguration:](self, "setCurrentDSPConfiguration:", v4);
    goto LABEL_8;
  }
  if (!-[ASDAudioDevice isRunning](self, "isRunning"))
  {
    -[ASDDSPAudioDevice setCurrentDSPConfiguration:](self, "setCurrentDSPConfiguration:", 0);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[ASDAudioDevice inputStreams](self, "inputStreams");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v15, "removeHardwareDSP");
            objc_msgSend(v15, "setCurrentDSPConfiguration:", 0);
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v12);
    }

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[ASDAudioDevice outputStreams](self, "outputStreams", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v24 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v21, "removeHardwareDSP");
            objc_msgSend(v21, "setCurrentDSPConfiguration:", 0);
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v18);
    }

  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[ASDDSPAudioDevice updateDeviceDSPConfiguration].cold.1(v4, self);
  v9 = 0;
LABEL_32:

  return v9;
}

- (id)findDSPConfigurationForCurrentState
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  ASDAudioDevice *underlyingDevice;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  -[ASDDSPAudioDevice dspDatabase](self, "dspDatabase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dspConfigurations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v29)
  {
    v28 = *(_QWORD *)v40;
LABEL_3:
    v5 = 0;
    while (1)
    {
      if (*(_QWORD *)v40 != v28)
        objc_enumerationMutation(v4);
      v30 = v5;
      v6 = *(id *)(*((_QWORD *)&v39 + 1) + 8 * v5);
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      objc_msgSend(v6, "underlyingDeviceProperties");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      v9 = v6;
      if (v8)
      {
        v10 = v8;
        v11 = *(_QWORD *)v36;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v36 != v11)
              objc_enumerationMutation(v7);
            v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
            underlyingDevice = self->_underlyingDevice;
            objc_msgSend(v13, "address");
            v15 = objc_claimAutoreleasedReturnValue();
            -[ASDAudioDevice getProperty:](underlyingDevice, "getProperty:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v13, "value");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v15) = objc_msgSend(v16, "isEqual:", v17);

            if ((v15 & 1) == 0)
            {

              v9 = 0;
              goto LABEL_16;
            }

          }
          v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
          if (v10)
            continue;
          break;
        }
        v9 = v6;
      }
LABEL_16:

      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      objc_msgSend(v6, "dspDeviceProperties");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v32;
        while (2)
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v32 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
            objc_msgSend(v23, "address");
            v24 = objc_claimAutoreleasedReturnValue();
            -[ASDAudioDevice getProperty:](self, "getProperty:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v23, "value");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v24) = objc_msgSend(v25, "isEqual:", v26);

            if ((v24 & 1) == 0)
            {

              goto LABEL_27;
            }

          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
          if (v20)
            continue;
          break;
        }
      }

      if (v9)
        break;
LABEL_27:
      v5 = v30 + 1;
      if (v30 + 1 == v29)
      {
        v29 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
        if (v29)
          goto LABEL_3;
        goto LABEL_29;
      }
    }
  }
  else
  {
LABEL_29:
    v9 = 0;
  }

  return v9;
}

- (BOOL)applyDeviceDSPConfiguration:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  BOOL v32;
  int v33;
  id obj;
  id obja;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[ASDAudioDevice inputStreams](self, "inputStreams");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
  v6 = &GCC_except_table13_5;
  if (!v5)
  {
    v18 = 1;
    goto LABEL_20;
  }
  v7 = v5;
  v8 = 0;
  v9 = *(_QWORD *)v41;
LABEL_3:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v41 != v9)
      objc_enumerationMutation(obj);
    v11 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v10);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        -[ASDAudioDevice deviceUID](self, "deviceUID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "streamName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v46 = v16;
        v47 = 2112;
        v48 = v17;
        _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: Stream '%@' isn't an ASDDSPStream, skipping.", buf, 0x16u);

      }
      goto LABEL_12;
    }
    objc_msgSend(v4, "inputDSP");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v8 + v10 >= v13)
      break;
    objc_msgSend(v4, "inputDSP");
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v14, "objectAtIndexedSubscript:", v8 + v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v14) = -[ASDDSPAudioDevice applyStreamDSPConfiguration:toStream:](self, "applyStreamDSPConfiguration:toStream:", v15, v11);
    if ((v14 & 1) == 0)
    {
      v18 = 0;
LABEL_19:
      v6 = &GCC_except_table13_5;
      goto LABEL_20;
    }
LABEL_12:
    if (v7 == ++v10)
    {
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
      v8 += v10;
      if (v7)
        goto LABEL_3;
      v18 = 1;
      goto LABEL_19;
    }
  }
  v6 = (_QWORD *)&GCC_except_table13_5;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[ASDDSPAudioDevice applyDeviceDSPConfiguration:].cold.2(self);
  v18 = 0;
LABEL_20:

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[ASDAudioDevice outputStreams](self, "outputStreams");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v19)
  {
    v20 = v19;
    v32 = v18;
    v21 = 0;
    v22 = *(_QWORD *)v37;
    v33 = v6[45];
    while (2)
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v37 != v22)
          objc_enumerationMutation(obja);
        v24 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v4, "outputDSP");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "count");

          if (v21 + i >= v26)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ASDDSPAudioDevice applyDeviceDSPConfiguration:].cold.1(self);
LABEL_36:
            v18 = 0;
            goto LABEL_37;
          }
          objc_msgSend(v4, "outputDSP");
          v27 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v27, "objectAtIndexedSubscript:", v21 + i);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          LOBYTE(v27) = -[ASDDSPAudioDevice applyStreamDSPConfiguration:toStream:](self, "applyStreamDSPConfiguration:toStream:", v28, v24);
          if ((v27 & 1) == 0)
            goto LABEL_36;
        }
        else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          -[ASDAudioDevice deviceUID](self, "deviceUID");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "streamName");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v33;
          v46 = v29;
          v47 = 2112;
          v48 = v30;
          _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: Stream '%@' isn't an ASDDSPStream, skipping.", buf, 0x16u);

        }
      }
      v20 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      v21 += i;
      if (v20)
        continue;
      break;
    }
    v18 = v32;
  }
LABEL_37:

  return v18;
}

- (BOOL)applyStreamDSPConfiguration:(id)a3 toStream:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  int v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  ASDDSPAudioDevice *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    objc_msgSend(v6, "hardwareDSP");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentDSPConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hardwareDSP");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[ASDDSPAudioDevice dspItemsInConfiguration:notInConfiguration:](ASDDSPAudioDevice, "dspItemsInConfiguration:notInConfiguration:", v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (+[ASDAUStripInfo containsOnlyAUStrips:](ASDAUStripInfo, "containsOnlyAUStrips:", v12))
    {
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      if (v14)
      {
        v15 = v14;
        v27 = self;
        v28 = v6;
        v16 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v30 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
            objc_msgSend(v8, "hardwareDSP");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = +[ASDDSPGraphLoader applyAUStrip:toGraph:](ASDDSPGraphLoader, "applyAUStrip:toGraph:", v18, v19);

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        }
        while (v15);
        self = v27;
        v6 = v28;
      }
      else
      {
        v20 = 0;
      }

      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      -[ASDAudioDevice deviceUID](self, "deviceUID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v34 = v23;
      _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: New StreamDSPConfiguration contained only AUStrip differences", buf, 0xCu);
    }
    else
    {
      objc_msgSend(v6, "hardwareDSP");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[ASDDSPGraphLoader graphWithConfiguration:](ASDDSPGraphLoader, "graphWithConfiguration:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v23, "name");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[ASDAudioDevice deviceUID](self, "deviceUID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v34 = v24;
          v35 = 2112;
          v36 = v25;
          _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "New DSPGraph '%@' created on device '%@'", buf, 0x16u);

        }
        v20 = objc_msgSend(v8, "addHardwareDSP:", v23);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ASDDSPAudioDevice applyStreamDSPConfiguration:toStream:].cold.2(self);
        v20 = 0;
      }
    }

LABEL_24:
    if (v20)
    {
      objc_msgSend(v8, "setCurrentDSPConfiguration:", v6);
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[ASDDSPAudioDevice applyStreamDSPConfiguration:toStream:].cold.1(self);
    }

    v21 = v20 != 0;
    goto LABEL_29;
  }
  v21 = 0;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ASDDSPAudioDevice currently only supports ASDDSPStreams.", buf, 2u);
    v21 = 0;
  }
LABEL_29:

  return v21;
}

+ (id)dspItemsInConfiguration:(id)a3 notInConfiguration:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t j;
  void *v19;
  id obj;
  id v21;
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
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v19 = v5;
  objc_msgSend(v5, "dspItems");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        objc_msgSend(v6, "dspItems");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (!v13)
        {

LABEL_16:
          objc_msgSend(v21, "addObject:", v11);
          continue;
        }
        v14 = v13;
        v15 = 0;
        v16 = *(_QWORD *)v23;
        do
        {
          for (j = 0; j != v14; ++j)
          {
            if (*(_QWORD *)v23 != v16)
              objc_enumerationMutation(v12);
            v15 |= objc_msgSend(v11, "isEqual:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j));
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        }
        while (v14);

        if ((v15 & 1) == 0)
          goto LABEL_16;
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v8);
  }

  return v21;
}

- (int)startIOForClient:(unsigned int)a3
{
  uint64_t v3;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  BOOL v13;
  int v14;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;
  objc_super v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v3 = *(_QWORD *)&a3;
  v31 = *MEMORY[0x24BDAC8D0];
  -[ASDDSPAudioDevice currentDSPConfiguration](self, "currentDSPConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDDSPAudioDevice.m"), 358, CFSTR("Starting IO without a DSP configuration"));

  }
  v7 = -[ASDAudioDevice startIOForClient:](self->_underlyingDevice, "startIOForClient:", v3);
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      -[ASDAudioDevice deviceUID](self->_underlyingDevice, "deviceUID");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      v10 = v7 >> 24;
      if ((v7 - 0x20000000) >> 24 >= 0x5F)
        v10 = 32;
      v11 = v7 << 8 >> 24;
      if (((v7 << 8) - 0x20000000) >> 24 >= 0x5F)
        v11 = 32;
      if (((v7 << 16) - 0x20000000) >> 24 >= 0x5F)
        v12 = 32;
      else
        v12 = (__int16)v7 >> 8;
      *(_DWORD *)buf = 138413314;
      v22 = v8;
      v23 = 1024;
      v24 = v10;
      v25 = 1024;
      v26 = v11;
      v13 = v7 << 24 == 2130706432 || v7 << 24 < 520093697;
      v27 = 1024;
      v28 = v12;
      if (v13)
        v14 = 32;
      else
        v14 = (char)v7;
      v29 = 1024;
      v30 = v14;
      _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Underlying device '%@' failed to start with error: %c%c%c%c", buf, 0x24u);

    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)ASDDSPAudioDevice;
    if (-[ASDAudioDevice startIOForClient:](&v20, sel_startIOForClient_, v3))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19.receiver = self;
      v19.super_class = (Class)ASDDSPAudioDevice;
      -[ASDAudioDevice deviceUID](&v19, sel_deviceUID);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDDSPAudioDevice.m"), 365, CFSTR("%@: ASDAudioDevice startIOForClient must succeed"), v18);

    }
  }
  return v7;
}

- (int)stopIOForClient:(unsigned int)a3
{
  uint64_t v3;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  BOOL v13;
  int v14;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;
  objc_super v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v3 = *(_QWORD *)&a3;
  v31 = *MEMORY[0x24BDAC8D0];
  -[ASDDSPAudioDevice currentDSPConfiguration](self, "currentDSPConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDDSPAudioDevice.m"), 378, CFSTR("Stopping IO without a DSP configuration"));

  }
  v20.receiver = self;
  v20.super_class = (Class)ASDDSPAudioDevice;
  v7 = -[ASDAudioDevice stopIOForClient:](&v20, sel_stopIOForClient_, v3);
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v19.receiver = self;
      v19.super_class = (Class)ASDDSPAudioDevice;
      -[ASDAudioDevice deviceUID](&v19, sel_deviceUID);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      v10 = v7 >> 24;
      if ((v7 - 0x20000000) >> 24 >= 0x5F)
        v10 = 32;
      v11 = v7 << 8 >> 24;
      if (((v7 << 8) - 0x20000000) >> 24 >= 0x5F)
        v11 = 32;
      if (((v7 << 16) - 0x20000000) >> 24 >= 0x5F)
        v12 = 32;
      else
        v12 = (__int16)v7 >> 8;
      *(_DWORD *)buf = 138413314;
      v22 = v8;
      v23 = 1024;
      v24 = v10;
      v25 = 1024;
      v26 = v11;
      v13 = v7 << 24 == 2130706432 || v7 << 24 < 520093697;
      v27 = 1024;
      v28 = v12;
      if (v13)
        v14 = 32;
      else
        v14 = (char)v7;
      v29 = 1024;
      v30 = v14;
      _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ASDAudioDevice '%@' failed to stop with error: %c%c%c%c", buf, 0x24u);

    }
  }
  else if (-[ASDAudioDevice stopIOForClient:](self->_underlyingDevice, "stopIOForClient:", v3))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDAudioDevice deviceUID](self->_underlyingDevice, "deviceUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDDSPAudioDevice.m"), 385, CFSTR("%@: Underlying stopIOForClient must succeed"), v18);

  }
  return v7;
}

- (void)addInputStream:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[ASDDSPAudioDevice setCurrentDSPConfiguration:](self, "setCurrentDSPConfiguration:", 0);
  v5.receiver = self;
  v5.super_class = (Class)ASDDSPAudioDevice;
  -[ASDAudioDevice addInputStream:](&v5, sel_addInputStream_, v4);

}

- (void)removeInputStream:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[ASDDSPAudioDevice setCurrentDSPConfiguration:](self, "setCurrentDSPConfiguration:", 0);
  v5.receiver = self;
  v5.super_class = (Class)ASDDSPAudioDevice;
  -[ASDAudioDevice removeInputStream:](&v5, sel_removeInputStream_, v4);

}

- (void)addOutputStream:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[ASDDSPAudioDevice setCurrentDSPConfiguration:](self, "setCurrentDSPConfiguration:", 0);
  v5.receiver = self;
  v5.super_class = (Class)ASDDSPAudioDevice;
  -[ASDAudioDevice addOutputStream:](&v5, sel_addOutputStream_, v4);

}

- (void)removeOutputStream:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[ASDDSPAudioDevice setCurrentDSPConfiguration:](self, "setCurrentDSPConfiguration:", 0);
  v5.receiver = self;
  v5.super_class = (Class)ASDDSPAudioDevice;
  -[ASDAudioDevice removeOutputStream:](&v5, sel_removeOutputStream_, v4);

}

- (id)deviceName
{
  return -[ASDAudioDevice deviceName](self->_underlyingDevice, "deviceName");
}

- (void)setDeviceName:(id)a3
{
  -[ASDAudioDevice setDeviceName:](self->_underlyingDevice, "setDeviceName:", a3);
}

- (id)manufacturerName
{
  return -[ASDAudioDevice manufacturerName](self->_underlyingDevice, "manufacturerName");
}

- (id)modelName
{
  return -[ASDAudioDevice modelName](self->_underlyingDevice, "modelName");
}

- (id)modelUID
{
  return -[ASDAudioDevice modelUID](self->_underlyingDevice, "modelUID");
}

- (double)samplingRate
{
  double result;

  -[ASDAudioDevice samplingRate](self->_underlyingDevice, "samplingRate");
  return result;
}

- (id)samplingRates
{
  return -[ASDAudioDevice samplingRates](self->_underlyingDevice, "samplingRates");
}

- (void)setSamplingRate:(double)a3
{
  -[ASDAudioDevice setSamplingRate:](self->_underlyingDevice, "setSamplingRate:", a3);
}

- (BOOL)changeSamplingRate:(double)a3
{
  return -[ASDAudioDevice changeSamplingRate:](self->_underlyingDevice, "changeSamplingRate:", a3);
}

- (BOOL)canBeDefaultDevice
{
  return -[ASDAudioDevice canBeDefaultDevice](self->_underlyingDevice, "canBeDefaultDevice");
}

- (BOOL)canBeDefaultInputDevice
{
  return -[ASDAudioDevice canBeDefaultInputDevice](self->_underlyingDevice, "canBeDefaultInputDevice");
}

- (BOOL)canBeDefaultOutputDevice
{
  return -[ASDAudioDevice canBeDefaultOutputDevice](self->_underlyingDevice, "canBeDefaultOutputDevice");
}

- (BOOL)canBeDefaultSystemDevice
{
  return -[ASDAudioDevice canBeDefaultSystemDevice](self->_underlyingDevice, "canBeDefaultSystemDevice");
}

- (BOOL)isHidden
{
  return -[ASDAudioDevice isHidden](self->_underlyingDevice, "isHidden");
}

- (unsigned)timestampPeriod
{
  return -[ASDAudioDevice timestampPeriod](self->_underlyingDevice, "timestampPeriod");
}

- (unsigned)inputSafetyOffset
{
  return -[ASDAudioDevice inputSafetyOffset](self->_underlyingDevice, "inputSafetyOffset");
}

- (unsigned)outputSafetyOffset
{
  return -[ASDAudioDevice outputSafetyOffset](self->_underlyingDevice, "outputSafetyOffset");
}

- (unsigned)transportType
{
  return -[ASDAudioDevice transportType](self->_underlyingDevice, "transportType");
}

- (unsigned)clockDomain
{
  return -[ASDAudioDevice clockDomain](self->_underlyingDevice, "clockDomain");
}

- (unsigned)clockAlgorithm
{
  return -[ASDAudioDevice clockAlgorithm](self->_underlyingDevice, "clockAlgorithm");
}

- (BOOL)clockIsStable
{
  return -[ASDAudioDevice clockIsStable](self->_underlyingDevice, "clockIsStable");
}

- (unsigned)inputLatency
{
  return -[ASDAudioDevice inputLatency](self->_underlyingDevice, "inputLatency");
}

- (unsigned)outputLatency
{
  return -[ASDAudioDevice outputLatency](self->_underlyingDevice, "outputLatency");
}

- (id)getZeroTimestampBlock
{
  return -[ASDAudioDevice getZeroTimestampBlock](self->_underlyingDevice, "getZeroTimestampBlock");
}

- (id)willDoReadInputBlock
{
  BOOL v2;
  _QWORD v4[4];
  BOOL v5;

  v2 = -[ASDAudioDevice hasInput](self, "hasInput");
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __41__ASDDSPAudioDevice_willDoReadInputBlock__block_invoke;
  v4[3] = &__block_descriptor_33_e14_i28__0I8_12_20l;
  v5 = v2;
  return (id)MEMORY[0x220733498](v4);
}

uint64_t __41__ASDDSPAudioDevice_willDoReadInputBlock__block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3, _BYTE *a4)
{
  *a3 = *(_BYTE *)(a1 + 32);
  *a4 = 1;
  return 0;
}

- (id)willDoWriteMixBlock
{
  BOOL v2;
  _QWORD v4[4];
  BOOL v5;

  v2 = -[ASDAudioDevice hasOutput](self, "hasOutput");
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __40__ASDDSPAudioDevice_willDoWriteMixBlock__block_invoke;
  v4[3] = &__block_descriptor_33_e14_i28__0I8_12_20l;
  v5 = v2;
  return (id)MEMORY[0x220733498](v4);
}

uint64_t __40__ASDDSPAudioDevice_willDoWriteMixBlock__block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3, _BYTE *a4)
{
  *a3 = *(_BYTE *)(a1 + 32);
  *a4 = 1;
  return 0;
}

- (BOOL)requestConfigurationChangeForDevice:(id)a3 withBlock:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v5 = a4;
  -[ASDObject plugin](self, "plugin");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __67__ASDDSPAudioDevice_requestConfigurationChangeForDevice_withBlock___block_invoke;
  v9[3] = &unk_24DBCA840;
  v9[4] = self;
  v10 = v5;
  v7 = v5;
  LOBYTE(self) = objc_msgSend(v6, "requestConfigurationChangeForDevice:withBlock:", self, v9);

  return (char)self;
}

uint64_t __67__ASDDSPAudioDevice_requestConfigurationChangeForDevice_withBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "updateDeviceDSPConfiguration");
}

- (void)changedProperty:(const AudioObjectPropertyAddress *)a3 forObject:(id)a4
{
  id v6;

  -[ASDObject plugin](self, "plugin", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "changedProperty:forObject:", a3, self);

}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  signed int v23;
  void *v24;
  int v25;
  signed int v26;
  uint64_t v27;
  void *v28;
  signed int v29;
  uint64_t v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  ASDDSPAudioDevice *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  signed int v50;
  void *v51;
  int v52;
  signed int v53;
  uint64_t v54;
  void *v55;
  signed int v56;
  uint64_t v57;
  int v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  ASDDSPAudioDevice *v73;
  int v74;
  int v75;
  id obj;
  id obja;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  int v106;
  int v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  int v114;
  int v115;
  void *v116;
  void *v117;
  int v118;
  int v119;
  uint64_t v120;
  uint64_t v121;
  signed int v122;
  signed int v123;
  void *v124;
  void *v125;
  uint64_t v126;
  uint64_t v127;
  int v128;
  int v129;
  signed int v130;
  signed int v131;
  void *v132;
  void *v133;
  uint64_t v134;
  uint64_t v135;
  int v136;
  int v137;
  signed int v138;
  signed int v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  void *v143;
  int v144;
  int v145;
  uint64_t v146;
  uint64_t v147;
  int v148;
  int v149;
  void *v150;
  void *v151;
  int v152;
  int v153;
  uint64_t v154;
  uint64_t v155;
  signed int v156;
  signed int v157;
  void *v158;
  void *v159;
  int v160;
  int v161;
  signed int v162;
  signed int v163;
  void *v164;
  void *v165;
  int v166;
  int v167;
  int v168;
  int v169;
  void *v170;
  void *v171;
  int v172;
  int v173;
  int v174;
  int v175;
  void *v176;
  void *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  void *v182;
  id v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  objc_super v192;
  _BYTE v193[128];
  _BYTE v194[128];
  uint64_t v195;

  v4 = a4;
  v195 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v192.receiver = self;
  v192.super_class = (Class)ASDDSPAudioDevice;
  -[ASDAudioDevice diagnosticDescriptionWithIndent:walkTree:](&v192, sel_diagnosticDescriptionWithIndent_walkTree_, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDDSPAudioDevice currentDSPConfiguration](self, "currentDSPConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Current DSP Configuration: %s\n"), v6, objc_msgSend(v9, "UTF8String"));

  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    DSP Device Properties:\n"), v6);
  -[ASDDSPAudioDevice currentDSPConfiguration](self, "currentDSPConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dspDeviceProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  v183 = v6;
  v182 = v7;
  v73 = self;
  if (v12)
  {
    v190 = 0u;
    v191 = 0u;
    v188 = 0u;
    v189 = 0u;
    -[ASDDSPAudioDevice currentDSPConfiguration](self, "currentDSPConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dspDeviceProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v14;
    v102 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v188, v194, 16);
    if (v102)
    {
      v100 = *(_QWORD *)v189;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v189 != v100)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v188 + 1) + 8 * v15);
          v17 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v16, "value");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringWithFormat:", CFSTR("%@"), v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_24DBCB510);
          v178 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "address");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "selector");
          if (v21 < 0x20000000
            || (objc_msgSend(v16, "address"),
                v99 = (void *)objc_claimAutoreleasedReturnValue(),
                (int)objc_msgSend(v99, "selector") > 2130706431))
          {
            v172 = 0;
            v154 = 32;
          }
          else
          {
            objc_msgSend(v16, "address");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            v154 = ((int)objc_msgSend(v88, "selector") >> 24);
            v172 = 1;
          }
          objc_msgSend(v16, "address");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "selector") << 8;
          if (v23 < 0x20000000
            || (objc_msgSend(v16, "address"),
                v98 = (void *)objc_claimAutoreleasedReturnValue(),
                (int)(objc_msgSend(v98, "selector") << 8) > 2130706431))
          {
            v166 = 0;
            v146 = 32;
          }
          else
          {
            objc_msgSend(v16, "address");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            v146 = ((int)(objc_msgSend(v87, "selector") << 8) >> 24);
            v166 = 1;
          }
          objc_msgSend(v16, "address");
          v164 = (void *)objc_claimAutoreleasedReturnValue();
          v162 = objc_msgSend(v164, "selector") << 16;
          if (v162 < 0x20000000
            || (objc_msgSend(v16, "address"),
                v97 = (void *)objc_claimAutoreleasedReturnValue(),
                (int)(objc_msgSend(v97, "selector") << 16) > 2130706431))
          {
            v160 = 0;
            v140 = 32;
          }
          else
          {
            objc_msgSend(v16, "address");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            v140 = ((__int16)objc_msgSend(v86, "selector") >> 8);
            v160 = 1;
          }
          objc_msgSend(v16, "address");
          v158 = (void *)objc_claimAutoreleasedReturnValue();
          v156 = objc_msgSend(v158, "selector") << 24;
          if (v156 < 520093697
            || (objc_msgSend(v16, "address"),
                v96 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v96, "selector") == 127))
          {
            v152 = 0;
            v134 = 32;
          }
          else
          {
            objc_msgSend(v16, "address");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            v134 = (char)objc_msgSend(v85, "selector");
            v152 = 1;
          }
          objc_msgSend(v16, "address");
          v150 = (void *)objc_claimAutoreleasedReturnValue();
          v148 = objc_msgSend(v150, "scope");
          if (v148 < 0x20000000
            || (objc_msgSend(v16, "address"),
                v95 = (void *)objc_claimAutoreleasedReturnValue(),
                (int)objc_msgSend(v95, "scope") > 2130706431))
          {
            v144 = 0;
            v126 = 32;
          }
          else
          {
            objc_msgSend(v16, "address");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            v126 = ((int)objc_msgSend(v84, "scope") >> 24);
            v144 = 1;
          }
          objc_msgSend(v16, "address");
          v142 = (void *)objc_claimAutoreleasedReturnValue();
          v138 = objc_msgSend(v142, "scope") << 8;
          if (v138 < 0x20000000
            || (objc_msgSend(v16, "address"),
                v94 = (void *)objc_claimAutoreleasedReturnValue(),
                (int)(objc_msgSend(v94, "scope") << 8) > 2130706431))
          {
            v136 = 0;
            v120 = 32;
          }
          else
          {
            objc_msgSend(v16, "address");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            v120 = ((int)(objc_msgSend(v83, "scope") << 8) >> 24);
            v136 = 1;
          }
          objc_msgSend(v16, "address");
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          v130 = objc_msgSend(v132, "scope") << 16;
          if (v130 < 0x20000000
            || (objc_msgSend(v16, "address"),
                v93 = (void *)objc_claimAutoreleasedReturnValue(),
                (int)(objc_msgSend(v93, "scope") << 16) > 2130706431))
          {
            v128 = 0;
            v112 = 32;
          }
          else
          {
            objc_msgSend(v16, "address");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            v112 = ((__int16)objc_msgSend(v82, "scope") >> 8);
            v128 = 1;
          }
          objc_msgSend(v16, "address");
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          v122 = objc_msgSend(v124, "scope") << 24;
          if (v122 < 520093697
            || (objc_msgSend(v16, "address"),
                v92 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v92, "scope") == 127))
          {
            v118 = 0;
            v108 = 32;
          }
          else
          {
            objc_msgSend(v16, "address");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            v108 = (char)objc_msgSend(v81, "scope");
            v118 = 1;
          }
          objc_msgSend(v16, "address");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v114 = objc_msgSend(v24, "element");
          v180 = v15;
          v170 = v22;
          if (v114 < 0x20000000
            || (objc_msgSend(v16, "address"),
                v91 = (void *)objc_claimAutoreleasedReturnValue(),
                (int)objc_msgSend(v91, "element") > 2130706431))
          {
            v25 = 0;
            v104 = 32;
          }
          else
          {
            objc_msgSend(v16, "address");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            v104 = ((int)objc_msgSend(v80, "element") >> 24);
            v25 = 1;
          }
          objc_msgSend(v16, "address");
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v110, "element") << 8;
          v176 = v20;
          v174 = v21;
          v116 = v24;
          if (v26 < 0x20000000
            || (objc_msgSend(v16, "address"),
                v90 = (void *)objc_claimAutoreleasedReturnValue(),
                (int)(objc_msgSend(v90, "element") << 8) > 2130706431))
          {
            v106 = 0;
            v27 = 32;
          }
          else
          {
            objc_msgSend(v16, "address");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = ((int)(objc_msgSend(v79, "element") << 8) >> 24);
            v106 = 1;
          }
          objc_msgSend(v16, "address");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "element") << 16;
          v168 = v23;
          if (v29 < 0x20000000
            || (objc_msgSend(v16, "address"),
                v89 = (void *)objc_claimAutoreleasedReturnValue(),
                (int)(objc_msgSend(v89, "element") << 16) > 2130706431))
          {
            v31 = 0;
            v30 = 32;
          }
          else
          {
            objc_msgSend(v16, "address");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = ((__int16)objc_msgSend(v78, "element") >> 8);
            v31 = 1;
          }
          objc_msgSend(v16, "address");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if ((int)(objc_msgSend(v32, "element") << 24) < 520093697)
          {
            v34 = (void *)v178;
            v68 = v30;
            v6 = v183;
            v7 = v182;
            objc_msgSend(v182, "appendFormat:", CFSTR("%@|     - %c%c%c%c %c%c%c%c %c%c%c%c : %@\n"), v183, v154, v146, v140, v134, v126, v120, v112, v108, v104, v27, v68, 32, v178);
          }
          else
          {
            objc_msgSend(v16, "address");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v33, "element") == 127)
            {
              v34 = (void *)v178;
              v67 = v30;
              v7 = v182;
              objc_msgSend(v182, "appendFormat:", CFSTR("%@|     - %c%c%c%c %c%c%c%c %c%c%c%c : %@\n"), v183, v154, v146, v140, v134, v126, v120, v112, v108, v104, v27, v67, 32, v178);
            }
            else
            {
              objc_msgSend(v16, "address");
              v74 = v25;
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = (void *)v178;
              v69 = v30;
              v7 = v182;
              objc_msgSend(v182, "appendFormat:", CFSTR("%@|     - %c%c%c%c %c%c%c%c %c%c%c%c : %@\n"), v183, v154, v146, v140, v134, v126, v120, v112, v108, v104, v27, v69, (char)objc_msgSend(v35, "element"), v178);

              v25 = v74;
            }

            v6 = v183;
          }

          if (v31)
          if (v29 >= 0x20000000)

          if (v106)
          if (v26 >= 0x20000000)

          if (v25)
          if (v114 >= 0x20000000)

          if (v118)
          if (v122 >= 520093697)

          if (v128)
          if (v130 >= 0x20000000)

          if (v136)
          if (v138 >= 0x20000000)

          if (v144)
          if (v148 >= 0x20000000)

          if (v152)
          if (v156 >= 520093697)

          if (v160)
          if (v162 >= 0x20000000)

          if (v166)
          if (v168 >= 0x20000000)

          if (v172)
          if (v174 >= 0x20000000)

          v15 = v180 + 1;
        }
        while (v102 != v180 + 1);
        v102 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v188, v194, 16);
      }
      while (v102);
    }

    self = v73;
  }
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Underlying Device Properties:\n"), v6);
  -[ASDDSPAudioDevice currentDSPConfiguration](self, "currentDSPConfiguration");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "underlyingDeviceProperties");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "count");

  v39 = v73;
  if (v38)
  {
    v186 = 0u;
    v187 = 0u;
    v184 = 0u;
    v185 = 0u;
    -[ASDDSPAudioDevice currentDSPConfiguration](v73, "currentDSPConfiguration");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "underlyingDeviceProperties");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    obja = v41;
    v103 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v184, v193, 16);
    if (v103)
    {
      v101 = *(_QWORD *)v185;
      do
      {
        v42 = 0;
        do
        {
          if (*(_QWORD *)v185 != v101)
            objc_enumerationMutation(obja);
          v43 = *(void **)(*((_QWORD *)&v184 + 1) + 8 * v42);
          v44 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v43, "value");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "stringWithFormat:", CFSTR("%@"), v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v46, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_24DBCB510);
          v179 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v43, "address");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v47, "selector");
          if (v48 < 0x20000000
            || (objc_msgSend(v43, "address"),
                v99 = (void *)objc_claimAutoreleasedReturnValue(),
                (int)objc_msgSend(v99, "selector") > 2130706431))
          {
            v173 = 0;
            v155 = 32;
          }
          else
          {
            objc_msgSend(v43, "address");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            v155 = ((int)objc_msgSend(v88, "selector") >> 24);
            v173 = 1;
          }
          objc_msgSend(v43, "address");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v49, "selector") << 8;
          if (v50 < 0x20000000
            || (objc_msgSend(v43, "address"),
                v98 = (void *)objc_claimAutoreleasedReturnValue(),
                (int)(objc_msgSend(v98, "selector") << 8) > 2130706431))
          {
            v167 = 0;
            v147 = 32;
          }
          else
          {
            objc_msgSend(v43, "address");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            v147 = ((int)(objc_msgSend(v87, "selector") << 8) >> 24);
            v167 = 1;
          }
          objc_msgSend(v43, "address");
          v165 = (void *)objc_claimAutoreleasedReturnValue();
          v163 = objc_msgSend(v165, "selector") << 16;
          if (v163 < 0x20000000
            || (objc_msgSend(v43, "address"),
                v97 = (void *)objc_claimAutoreleasedReturnValue(),
                (int)(objc_msgSend(v97, "selector") << 16) > 2130706431))
          {
            v161 = 0;
            v141 = 32;
          }
          else
          {
            objc_msgSend(v43, "address");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            v141 = ((__int16)objc_msgSend(v86, "selector") >> 8);
            v161 = 1;
          }
          objc_msgSend(v43, "address");
          v159 = (void *)objc_claimAutoreleasedReturnValue();
          v157 = objc_msgSend(v159, "selector") << 24;
          if (v157 < 520093697
            || (objc_msgSend(v43, "address"),
                v96 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v96, "selector") == 127))
          {
            v153 = 0;
            v135 = 32;
          }
          else
          {
            objc_msgSend(v43, "address");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            v135 = (char)objc_msgSend(v85, "selector");
            v153 = 1;
          }
          objc_msgSend(v43, "address");
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          v149 = objc_msgSend(v151, "scope");
          if (v149 < 0x20000000
            || (objc_msgSend(v43, "address"),
                v95 = (void *)objc_claimAutoreleasedReturnValue(),
                (int)objc_msgSend(v95, "scope") > 2130706431))
          {
            v145 = 0;
            v127 = 32;
          }
          else
          {
            objc_msgSend(v43, "address");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            v127 = ((int)objc_msgSend(v84, "scope") >> 24);
            v145 = 1;
          }
          objc_msgSend(v43, "address");
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          v139 = objc_msgSend(v143, "scope") << 8;
          if (v139 < 0x20000000
            || (objc_msgSend(v43, "address"),
                v94 = (void *)objc_claimAutoreleasedReturnValue(),
                (int)(objc_msgSend(v94, "scope") << 8) > 2130706431))
          {
            v137 = 0;
            v121 = 32;
          }
          else
          {
            objc_msgSend(v43, "address");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            v121 = ((int)(objc_msgSend(v83, "scope") << 8) >> 24);
            v137 = 1;
          }
          objc_msgSend(v43, "address");
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          v131 = objc_msgSend(v133, "scope") << 16;
          if (v131 < 0x20000000
            || (objc_msgSend(v43, "address"),
                v93 = (void *)objc_claimAutoreleasedReturnValue(),
                (int)(objc_msgSend(v93, "scope") << 16) > 2130706431))
          {
            v129 = 0;
            v113 = 32;
          }
          else
          {
            objc_msgSend(v43, "address");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            v113 = ((__int16)objc_msgSend(v82, "scope") >> 8);
            v129 = 1;
          }
          objc_msgSend(v43, "address");
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          v123 = objc_msgSend(v125, "scope") << 24;
          if (v123 < 520093697
            || (objc_msgSend(v43, "address"),
                v92 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v92, "scope") == 127))
          {
            v119 = 0;
            v109 = 32;
          }
          else
          {
            objc_msgSend(v43, "address");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            v109 = (char)objc_msgSend(v81, "scope");
            v119 = 1;
          }
          objc_msgSend(v43, "address");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v115 = objc_msgSend(v51, "element");
          v181 = v42;
          v171 = v49;
          if (v115 < 0x20000000
            || (objc_msgSend(v43, "address"),
                v91 = (void *)objc_claimAutoreleasedReturnValue(),
                (int)objc_msgSend(v91, "element") > 2130706431))
          {
            v52 = 0;
            v105 = 32;
          }
          else
          {
            objc_msgSend(v43, "address");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            v105 = ((int)objc_msgSend(v80, "element") >> 24);
            v52 = 1;
          }
          objc_msgSend(v43, "address");
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = objc_msgSend(v111, "element") << 8;
          v177 = v47;
          v175 = v48;
          v117 = v51;
          if (v53 < 0x20000000
            || (objc_msgSend(v43, "address"),
                v90 = (void *)objc_claimAutoreleasedReturnValue(),
                (int)(objc_msgSend(v90, "element") << 8) > 2130706431))
          {
            v107 = 0;
            v54 = 32;
          }
          else
          {
            objc_msgSend(v43, "address");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = ((int)(objc_msgSend(v79, "element") << 8) >> 24);
            v107 = 1;
          }
          objc_msgSend(v43, "address");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend(v55, "element") << 16;
          v169 = v50;
          if (v56 < 0x20000000
            || (objc_msgSend(v43, "address"),
                v89 = (void *)objc_claimAutoreleasedReturnValue(),
                (int)(objc_msgSend(v89, "element") << 16) > 2130706431))
          {
            v58 = 0;
            v57 = 32;
          }
          else
          {
            objc_msgSend(v43, "address");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = ((__int16)objc_msgSend(v78, "element") >> 8);
            v58 = 1;
          }
          objc_msgSend(v43, "address");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          if ((int)(objc_msgSend(v59, "element") << 24) < 520093697)
          {
            v61 = (void *)v179;
            v71 = v57;
            v6 = v183;
            v7 = v182;
            objc_msgSend(v182, "appendFormat:", CFSTR("%@|     - %c%c%c%c %c%c%c%c %c%c%c%c : %@\n"), v183, v155, v147, v141, v135, v127, v121, v113, v109, v105, v54, v71, 32, v179);
          }
          else
          {
            objc_msgSend(v43, "address");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v60, "element") == 127)
            {
              v61 = (void *)v179;
              v70 = v57;
              v7 = v182;
              objc_msgSend(v182, "appendFormat:", CFSTR("%@|     - %c%c%c%c %c%c%c%c %c%c%c%c : %@\n"), v183, v155, v147, v141, v135, v127, v121, v113, v109, v105, v54, v70, 32, v179);
            }
            else
            {
              objc_msgSend(v43, "address");
              v75 = v52;
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              v61 = (void *)v179;
              v72 = v57;
              v7 = v182;
              objc_msgSend(v182, "appendFormat:", CFSTR("%@|     - %c%c%c%c %c%c%c%c %c%c%c%c : %@\n"), v183, v155, v147, v141, v135, v127, v121, v113, v109, v105, v54, v72, (char)objc_msgSend(v62, "element"), v179);

              v52 = v75;
            }

            v6 = v183;
          }

          if (v58)
          if (v56 >= 0x20000000)

          if (v107)
          if (v53 >= 0x20000000)

          if (v52)
          if (v115 >= 0x20000000)

          if (v119)
          if (v123 >= 520093697)

          if (v129)
          if (v131 >= 0x20000000)

          if (v137)
          if (v139 >= 0x20000000)

          if (v145)
          if (v149 >= 0x20000000)

          if (v153)
          if (v157 >= 520093697)

          if (v161)
          if (v163 >= 0x20000000)

          if (v167)
          if (v169 >= 0x20000000)

          if (v173)
          if (v175 >= 0x20000000)

          v42 = v181 + 1;
        }
        while (v103 != v181 + 1);
        v103 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v184, v193, 16);
      }
      while (v103);
    }

    v39 = v73;
  }
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Underlying device:\n"), v6);
  -[ASDDSPAudioDevice underlyingDevice](v39, "underlyingDevice");
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  if (v63)
  {
    -[ASDDSPAudioDevice underlyingDevice](v39, "underlyingDevice");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("%@|        Object ID: %u\n"), v6, objc_msgSend(v64, "objectID"));

  }
  v65 = v7;

  return v65;
}

- (id)driverClassName
{
  return CFSTR("DSPAudioDevice");
}

- (ASDAudioDevice)underlyingDevice
{
  return self->_underlyingDevice;
}

- (ASDAudioDeviceDSPConfiguration)currentDSPConfiguration
{
  return self->_currentDSPConfiguration;
}

- (void)setCurrentDSPConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_currentDSPConfiguration, a3);
}

- (ASDAudioDeviceDSPDatabase)dspDatabase
{
  return self->_dspDatabase;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dspDatabase, 0);
  objc_storeStrong((id *)&self->_currentDSPConfiguration, 0);
  objc_storeStrong((id *)&self->_underlyingDevice, 0);
  objc_storeStrong((id *)&self->_resourcePath, 0);
}

- (void)initWithDeviceUID:(void *)a1 underlyingDevice:deviceDSPDatabase:plugin:.cold.1(void *a1)
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
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2(&dword_219C60000, MEMORY[0x24BDACB70], v2, "Underlying device '%@' doesn't have all properties specified in database.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_0();
}

- (void)updateDeviceDSPConfiguration
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "deviceUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  _os_log_error_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "DSP configuration '%@' couldn't be applied on device '%@'", (uint8_t *)&v5, 0x16u);

  OUTLINED_FUNCTION_4_0();
}

- (void)applyDeviceDSPConfiguration:(void *)a1 .cold.1(void *a1)
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
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2(&dword_219C60000, MEMORY[0x24BDACB70], v2, "Can't find an output stream configuration in database. The DSP device '%@' is now in an inconsistent state.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_0();
}

- (void)applyDeviceDSPConfiguration:(void *)a1 .cold.2(void *a1)
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
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2(&dword_219C60000, MEMORY[0x24BDACB70], v2, "Can't find an input stream configuration in database. The DSP device '%@' is now in an inconsistent state.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_0();
}

- (void)applyStreamDSPConfiguration:(void *)a1 toStream:.cold.1(void *a1)
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
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2(&dword_219C60000, MEMORY[0x24BDACB70], v2, "Error adding hardware DSP. The DSP device '%@' is now in an inconsistent state.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_0();
}

- (void)applyStreamDSPConfiguration:(void *)a1 toStream:.cold.2(void *a1)
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
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2(&dword_219C60000, MEMORY[0x24BDACB70], v2, "%@: Graph is nil", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_0();
}

@end
