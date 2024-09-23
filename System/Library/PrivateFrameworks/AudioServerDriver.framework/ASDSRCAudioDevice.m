@implementation ASDSRCAudioDevice

- (ASDSRCAudioDevice)initWithDeviceUID:(id)a3 underlyingDevice:(id)a4 plugin:(id)a5
{
  id v8;
  id v9;
  char *v10;
  void *v11;
  void *v12;
  id *v13;
  id v14;
  dispatch_queue_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  objc_super v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v48.receiver = self;
  v48.super_class = (Class)ASDSRCAudioDevice;
  v10 = -[ASDAudioDevice initWithDeviceUID:withPlugin:](&v48, sel_initWithDeviceUID_withPlugin_, v8, a5);
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id *)(v10 + 520);
    objc_storeStrong((id *)v10 + 65, a4);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@.sampleRate"), v12, v8);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = dispatch_queue_create((const char *)objc_msgSend(v14, "UTF8String"), 0);
    v16 = (void *)*((_QWORD *)v10 + 60);
    *((_QWORD *)v10 + 60) = v15;

    *(_OWORD *)(v10 + 488) = 0u;
    *(_OWORD *)(v10 + 504) = 0u;
    if (v9)
    {
      v17 = (void *)MEMORY[0x24BDBCEB8];
      objc_msgSend(*v13, "samplingRates");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "arrayWithArray:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setSamplingRates:", v19);

      objc_msgSend(*v13, "samplingRate");
      objc_msgSend(v10, "setSamplingRate:");
      objc_msgSend(v9, "setConfigurationChangeDelegate:", v10);
      objc_msgSend(v9, "setPropertyChangedDelegate:", v10);
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      objc_msgSend(v9, "inputStreams");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v45 != v23)
              objc_enumerationMutation(v20);
            objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "setPropertyChangedDelegate:", v10);
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
        }
        while (v22);
      }

      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      objc_msgSend(v9, "outputStreams");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v41;
        do
        {
          for (j = 0; j != v27; ++j)
          {
            if (*(_QWORD *)v41 != v28)
              objc_enumerationMutation(v25);
            objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * j), "setPropertyChangedDelegate:", v10);
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
        }
        while (v27);
      }

      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      objc_msgSend(v9, "controls");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v37;
        do
        {
          for (k = 0; k != v32; ++k)
          {
            if (*(_QWORD *)v37 != v33)
              objc_enumerationMutation(v30);
            objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * k), "setPropertyChangedDelegate:", v10);
          }
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
        }
        while (v32);
      }
    }
    else
    {
      v30 = v10;
      v10 = 0;
    }

  }
  return (ASDSRCAudioDevice *)v10;
}

- (int)startIOForClient:(unsigned int)a3
{
  uint64_t v3;
  int v6;
  int v7;
  int v8;
  int v9;
  BOOL v10;
  int v11;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v3 = *(_QWORD *)&a3;
  v23 = *MEMORY[0x24BDAC8D0];
  v6 = -[ASDAudioDevice startIOForClient:](self->_underlyingDevice, "startIOForClient:");
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6 >> 24;
      if ((v6 - 0x20000000) >> 24 >= 0x5F)
        v7 = 32;
      v8 = v6 << 8 >> 24;
      if (((v6 << 8) - 0x20000000) >> 24 >= 0x5F)
        v8 = 32;
      if (((v6 << 16) - 0x20000000) >> 24 >= 0x5F)
        v9 = 32;
      else
        v9 = (__int16)v6 >> 8;
      *(_DWORD *)buf = 67109888;
      v16 = v7;
      v17 = 1024;
      v18 = v8;
      v10 = v6 << 24 == 2130706432 || v6 << 24 < 520093697;
      v19 = 1024;
      v20 = v9;
      if (v10)
        v11 = 32;
      else
        v11 = (char)v6;
      v21 = 1024;
      v22 = v11;
      _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Underlying device failed to start with error: %c%c%c%c", buf, 0x1Au);
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ASDSRCAudioDevice;
    if (-[ASDAudioDevice startIOForClient:](&v14, sel_startIOForClient_, v3))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDSRCAudioDevice.m"), 93, CFSTR("ASDAudioDevice startIOForClient must succeed"));

    }
  }
  return v6;
}

- (int)stopIOForClient:(unsigned int)a3
{
  uint64_t v3;
  int v6;
  int v7;
  int v8;
  int v9;
  BOOL v10;
  int v11;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v3 = *(_QWORD *)&a3;
  v23 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)ASDSRCAudioDevice;
  v6 = -[ASDAudioDevice stopIOForClient:](&v14, sel_stopIOForClient_);
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6 >> 24;
      if ((v6 - 0x20000000) >> 24 >= 0x5F)
        v7 = 32;
      v8 = v6 << 8 >> 24;
      if (((v6 << 8) - 0x20000000) >> 24 >= 0x5F)
        v8 = 32;
      if (((v6 << 16) - 0x20000000) >> 24 >= 0x5F)
        v9 = 32;
      else
        v9 = (__int16)v6 >> 8;
      *(_DWORD *)buf = 67109888;
      v16 = v7;
      v17 = 1024;
      v18 = v8;
      v10 = v6 << 24 == 2130706432 || v6 << 24 < 520093697;
      v19 = 1024;
      v20 = v9;
      if (v10)
        v11 = 32;
      else
        v11 = (char)v6;
      v21 = 1024;
      v22 = v11;
      _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ASDAudioDevice failed to stop with error: %c%c%c%c", buf, 0x1Au);
    }
  }
  else if (-[ASDAudioDevice stopIOForClient:](self->_underlyingDevice, "stopIOForClient:", v3))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDSRCAudioDevice.m"), 111, CFSTR("Underlying stopIOForClient must succeed"));

  }
  return v6;
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

- (void)setSamplingRate:(double)a3
{
  NSObject *sampleRateQueue;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD block[6];

  sampleRateQueue = self->_sampleRateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__ASDSRCAudioDevice_setSamplingRate___block_invoke;
  block[3] = &unk_24DBCA528;
  block[4] = self;
  *(double *)&block[5] = a3;
  dispatch_sync(sampleRateQueue, block);
  LODWORD(v7) = 0;
  -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x676C6F626E737274, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changedProperty:forObject:", &v6, self);

}

void __37__ASDSRCAudioDevice_setSamplingRate___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  double v26;
  double v27;
  uint64_t v28;
  double v29;
  double v30;
  uint64_t v31;
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
  __int128 v43;
  _BYTE v44[128];
  uint8_t v45[128];
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  uint64_t v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073330C]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "samplingRate");
  if (v3 != *(double *)(a1 + 40))
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "samplingRates");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v41;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v41 != v7)
            objc_enumerationMutation(v4);
          v9 = *(double *)(a1 + 40);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "doubleValue");
          if (vabdd_f64(v9, v10) < 0.001)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(*(id *)(a1 + 32), "underlyingDevice");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "deviceUID");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = *(_QWORD *)(a1 + 40);
              *(_DWORD *)buf = 138412546;
              v47 = v12;
              v48 = 2048;
              v49 = v13;
              _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Setting %@ sample rate to %f", buf, 0x16u);

            }
            v14 = *(double *)(a1 + 40);
            objc_msgSend(*(id *)(a1 + 32), "underlyingDevice");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setSamplingRate:", v14);

            goto LABEL_14;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_14:

  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 464) = *(_QWORD *)(a1 + 40);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "inputStreams");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v37 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * j), "deviceChangedToSamplingRate:", *(double *)(a1 + 40));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    }
    while (v18);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "outputStreams", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v33;
    do
    {
      for (k = 0; k != v23; ++k)
      {
        if (*(_QWORD *)v33 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * k), "deviceChangedToSamplingRate:", *(double *)(a1 + 40));
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
    }
    while (v23);
  }

  v26 = (double)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "inputLatency");
  objc_msgSend(*(id *)(a1 + 32), "sampleRateRatio");
  LODWORD(v28) = vcvtpd_u64_f64(v27 * v26);
  objc_msgSend(*(id *)(a1 + 32), "setInputLatency:", v28);
  v29 = (double)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "outputLatency");
  objc_msgSend(*(id *)(a1 + 32), "sampleRateRatio");
  LODWORD(v31) = vcvtpd_u64_f64(v30 * v29);
  objc_msgSend(*(id *)(a1 + 32), "setOutputLatency:", v31);
  objc_autoreleasePoolPop(v2);
}

- (double)samplingRate
{
  NSObject *sampleRateQueue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  sampleRateQueue = self->_sampleRateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __33__ASDSRCAudioDevice_samplingRate__block_invoke;
  v5[3] = &unk_24DBCA398;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(sampleRateQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __33__ASDSRCAudioDevice_samplingRate__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 464);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)changeSamplingRate:(double)a3
{
  objc_class *v6;
  id v7;
  uint64_t v8;
  id v9;
  double v10;
  objc_class *v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  _QWORD v17[7];
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  ASDSRCAudioDevice *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = objc_msgSend(v7, "UTF8String");
    NSStringFromSelector(a2);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136315906;
    v19 = v8;
    v20 = 2048;
    v21 = self;
    v22 = 2080;
    v23 = objc_msgSend(v9, "UTF8String");
    v24 = 2048;
    v25 = a3;
    _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "+ %s(%p)::%s(%f)\n", buf, 0x2Au);

  }
  -[ASDSRCAudioDevice samplingRate](self, "samplingRate");
  if (v10 != a3)
  {
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __40__ASDSRCAudioDevice_changeSamplingRate___block_invoke;
    v17[3] = &unk_24DBCA668;
    v17[4] = self;
    *(double *)&v17[5] = a3;
    v17[6] = a2;
    -[ASDAudioDevice requestConfigurationChange:](self, "requestConfigurationChange:", v17);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = objc_msgSend(v12, "UTF8String");
    NSStringFromSelector(a2);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = objc_msgSend(v14, "UTF8String");
    *(_DWORD *)buf = 136315906;
    v19 = v13;
    v20 = 2048;
    v21 = self;
    v22 = 2080;
    v23 = v15;
    v24 = 1024;
    LODWORD(v25) = 1;
    _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "- %s(%p)::%s(%d)\n", buf, 0x26u);

  }
  return 1;
}

void __40__ASDSRCAudioDevice_changeSamplingRate___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "setSamplingRate:", *(double *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "samplingRate");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "samplingRate");
  if (v3 != v4)
  {
    v5 = *(double *)(a1 + 40)
       * (double)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "timestampPeriod");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "samplingRate");
    v7 = v5 / v6;
    *(float *)&v6 = v5 / v6;
    if (v7 != ceilf(*(float *)&v6))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(a1 + 48);
      v22 = *(void **)(a1 + 32);
      objc_msgSend(v22, "samplingRate");
      v24 = v23;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "samplingRate");
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", v21, v22, CFSTR("ASDSRCAudioDevice.m"), 218, CFSTR("Timestamp period is not an integer (%f) for sample rate combination %f (SRC) %f (Underlying)"), *(_QWORD *)&v7, v24, v25);

    }
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "inputStreams");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v13, "updateLatency");
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v10);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "outputStreams");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v27 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v19, "updateLatency");
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v16);
  }

}

- (void)setSamplingRates:(id)a3
{
  id v4;
  NSObject *sampleRateQueue;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t block;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  ASDSRCAudioDevice *v14;
  id v15;

  v4 = a3;
  sampleRateQueue = self->_sampleRateQueue;
  block = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __38__ASDSRCAudioDevice_setSamplingRates___block_invoke;
  v13 = &unk_24DBCA438;
  v14 = self;
  v15 = v4;
  v6 = v4;
  dispatch_sync(sampleRateQueue, &block);
  LODWORD(v9) = 0;
  -[ASDObject propertyChangedDelegate](self, "propertyChangedDelegate", 0x676C6F626E737223, v9, block, v11, v12, v13, v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "changedProperty:forObject:", &v8, self);

}

void __38__ASDSRCAudioDevice_setSamplingRates___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)MEMORY[0x22073330C]();
  v3 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 472);
  *(_QWORD *)(v4 + 472) = v3;

  objc_autoreleasePoolPop(v2);
}

- (id)samplingRates
{
  NSObject *sampleRateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__4;
  v10 = __Block_byref_object_dispose__4;
  v11 = 0;
  sampleRateQueue = self->_sampleRateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __34__ASDSRCAudioDevice_samplingRates__block_invoke;
  v5[3] = &unk_24DBCA398;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(sampleRateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __34__ASDSRCAudioDevice_samplingRates__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

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
  double v3;
  unsigned int v4;
  double v5;
  unsigned int v6;
  double v7;

  -[ASDAudioDevice samplingRate](self->_underlyingDevice, "samplingRate");
  if (v3 == 0.0)
    return 0;
  v4 = -[ASDAudioDevice timestampPeriod](self->_underlyingDevice, "timestampPeriod");
  -[ASDSRCAudioDevice samplingRate](self, "samplingRate");
  v6 = v4 * v5;
  -[ASDAudioDevice samplingRate](self->_underlyingDevice, "samplingRate");
  return v6 / v7;
}

- (double)sampleRateRatio
{
  double v3;
  double samplingRate;
  double v5;

  -[ASDAudioDevice samplingRate](self->_underlyingDevice, "samplingRate");
  if (v3 == 0.0)
    return 1.0;
  samplingRate = self->_samplingRate;
  -[ASDAudioDevice samplingRate](self->_underlyingDevice, "samplingRate");
  return samplingRate / v5;
}

- (unsigned)inputSafetyOffset
{
  unsigned int v3;
  double v4;

  v3 = -[ASDAudioDevice inputSafetyOffset](self->_underlyingDevice, "inputSafetyOffset");
  -[ASDSRCAudioDevice sampleRateRatio](self, "sampleRateRatio");
  return v3 * vcvtpd_s64_f64(v4);
}

- (unsigned)outputSafetyOffset
{
  unsigned int v3;
  double v4;

  v3 = -[ASDAudioDevice outputSafetyOffset](self->_underlyingDevice, "outputSafetyOffset");
  -[ASDSRCAudioDevice sampleRateRatio](self, "sampleRateRatio");
  return v3 * vcvtpd_s64_f64(v4);
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

- (int)performStopIO
{
  int result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASDSRCAudioDevice;
  result = -[ASDAudioDevice performStopIO](&v4, sel_performStopIO);
  *(_OWORD *)&self->_lastTimestamp.valid = 0u;
  *(_OWORD *)&self->_lastTimestamp.hostTime = 0u;
  return result;
}

- (id)getZeroTimestampBlock
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  _QWORD v10[6];

  -[ASDSRCAudioDevice samplingRate](self, "samplingRate");
  v4 = v3;
  -[ASDAudioDevice samplingRate](self->_underlyingDevice, "samplingRate");
  v6 = v4 / v5;
  -[ASDAudioDevice getZeroTimestampBlock](self->_underlyingDevice, "getZeroTimestampBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __42__ASDSRCAudioDevice_getZeroTimestampBlock__block_invoke;
  v10[3] = &unk_24DBCA690;
  v10[4] = v7;
  *(double *)&v10[5] = v6;
  v8 = (void *)MEMORY[0x220733498](v10);

  return v8;
}

double __42__ASDSRCAudioDevice_getZeroTimestampBlock__block_invoke(uint64_t a1, double *a2, _QWORD *a3, _QWORD *a4)
{
  double result;

  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
  result = round(0.0 * *(double *)(a1 + 40));
  *a2 = result;
  *a3 = 0;
  *a4 = 0;
  return result;
}

- (id)willDoReadInputBlock
{
  BOOL v2;
  _QWORD v4[4];
  BOOL v5;

  v2 = -[ASDAudioDevice hasInput](self, "hasInput");
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __41__ASDSRCAudioDevice_willDoReadInputBlock__block_invoke;
  v4[3] = &__block_descriptor_33_e14_i28__0I8_12_20l;
  v5 = v2;
  return (id)MEMORY[0x220733498](v4);
}

uint64_t __41__ASDSRCAudioDevice_willDoReadInputBlock__block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3, _BYTE *a4)
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
  v4[2] = __40__ASDSRCAudioDevice_willDoWriteMixBlock__block_invoke;
  v4[3] = &__block_descriptor_33_e14_i28__0I8_12_20l;
  v5 = v2;
  return (id)MEMORY[0x220733498](v4);
}

uint64_t __40__ASDSRCAudioDevice_willDoWriteMixBlock__block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3, _BYTE *a4)
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
  _QWORD v9[4];
  id v10;

  v5 = a4;
  -[ASDObject plugin](self, "plugin");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __67__ASDSRCAudioDevice_requestConfigurationChangeForDevice_withBlock___block_invoke;
  v9[3] = &unk_24DBCA6D8;
  v10 = v5;
  v7 = v5;
  LOBYTE(self) = objc_msgSend(v6, "requestConfigurationChangeForDevice:withBlock:", self, v9);

  return (char)self;
}

uint64_t __67__ASDSRCAudioDevice_requestConfigurationChangeForDevice_withBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)changedProperty:(const AudioObjectPropertyAddress *)a3 forObject:(id)a4
{
  id v6;

  -[ASDObject plugin](self, "plugin", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "changedProperty:forObject:", a3, self);

}

- (ASDAudioDevice)underlyingDevice
{
  return self->_underlyingDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingDevice, 0);
  objc_storeStrong((id *)&self->_sampleRateQueue, 0);
  objc_storeStrong((id *)&self->_samplingRates, 0);
}

@end
