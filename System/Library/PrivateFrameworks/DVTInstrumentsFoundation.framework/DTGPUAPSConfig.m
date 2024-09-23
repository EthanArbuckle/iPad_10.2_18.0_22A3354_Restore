@implementation DTGPUAPSConfig

- (id)toDictionary
{
  unint64_t nRingBuffers;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[4];
  _QWORD v27[4];
  _QWORD v28[3];
  _QWORD v29[3];
  _QWORD v30[7];
  _QWORD v31[9];

  v31[7] = *MEMORY[0x24BDAC8D0];
  v20 = (void *)MEMORY[0x24BDBCED8];
  v30[0] = CFSTR("Duration");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_duration);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v23;
  v30[1] = CFSTR("BufferSizeInKB");
  nRingBuffers = self->_nRingBuffers;
  if (nRingBuffers <= 1)
    nRingBuffers = 1;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", nRingBuffers * self->_ringBufferSizeInKB);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v22;
  v30[2] = CFSTR("RingBufferSizeInKB");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_ringBufferSizeInKB);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v21;
  v30[3] = CFSTR("SystemTimePeriod");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_systemTimePeriod);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v19;
  v30[4] = CFSTR("ProfileControl");
  v28[0] = CFSTR("CliqueTraceLevel");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_cliqueTraceLevel);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v18;
  v28[1] = CFSTR("EmitPos");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_emitPos);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v17;
  v28[2] = CFSTR("EmitThreadControlFlow");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_emitThreadControlFlow);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v31[4] = v4;
  v31[5] = &unk_24EB4EB10;
  v30[5] = CFSTR("SyncDrainMode");
  v30[6] = CFSTR("KickAndStateTracing");
  v26[0] = CFSTR("PulsePeriod");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_pulsePeriod);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v5;
  v26[1] = CFSTR("CountPeriod");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_countPeriod);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v6;
  v26[2] = CFSTR("TileTracing");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_tileTracing);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v7;
  v26[3] = CFSTR("ESLInstTracing");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_eslInstTracing);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31[6] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "dictionaryWithDictionary:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_subSamplingMinTraced || self->_subSamplingTargetThreshold)
  {
    v24[0] = CFSTR("MinTraced");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = CFSTR("TargetThreshold");
    v25[0] = v12;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_subSamplingTargetThreshold);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("CliqueSubSampling"));

  }
  return v11;
}

- (DTGPUAPSConfig)init
{
  DTGPUAPSConfig *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DTGPUAPSConfig;
  result = -[DTGPUAPSConfig init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_ringBufferSizeInKB = xmmword_222BD2320;
    result->_emitPos = 0;
    result->_emitThreadControlFlow = 0;
    result->_cliqueTraceLevel = 2;
    *(int64x2_t *)&result->_subSamplingMinTraced = vdupq_n_s64(1uLL);
    *(_OWORD *)&result->_pulsePeriod = xmmword_222BD2330;
    result->_tileTracing = 0;
    result->_eslInstTracing = 0;
    result->_nRingBuffers = 10;
  }
  return result;
}

- (void)readConfig:(id)a3
{
  void *v4;
  void *v5;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  v36 = a3;
  objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("Duration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("Duration"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->_duration = objc_msgSend(v5, "unsignedIntegerValue");

  }
  objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("RingBufferSizeInKB"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("RingBufferSizeInKB"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self->_ringBufferSizeInKB = objc_msgSend(v7, "unsignedIntegerValue");

  }
  objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("SystemTimePeriod"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("SystemTimePeriod"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self->_systemTimePeriod = objc_msgSend(v9, "unsignedIntegerValue");

  }
  objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("NumRingBuffers"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("NumRingBuffers"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    self->_nRingBuffers = objc_msgSend(v11, "unsignedIntegerValue");

  }
  objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("ProfileControl"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("CliqueTraceLevel"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("CliqueTraceLevel"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      self->_cliqueTraceLevel = objc_msgSend(v15, "unsignedIntegerValue");

    }
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("EmitPos"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("EmitPos"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      self->_emitPos = objc_msgSend(v17, "unsignedIntegerValue");

    }
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("EmitThreadControlFlow"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("EmitThreadControlFlow"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      self->_emitThreadControlFlow = objc_msgSend(v19, "unsignedIntegerValue");

    }
  }
  objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("CliqueSubSampling"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("MinTraced"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("MinTraced"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      self->_subSamplingMinTraced = objc_msgSend(v23, "unsignedIntegerValue");

    }
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("TargetThreshold"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("TargetThreshold"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      self->_subSamplingTargetThreshold = objc_msgSend(v25, "unsignedIntegerValue");

    }
  }
  objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("KickAndStateTracing"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v26)
  {
    objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("PulsePeriod"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("PulsePeriod"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      self->_pulsePeriod = objc_msgSend(v29, "unsignedIntegerValue");

    }
    objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("CountPeriod"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("CountPeriod"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      self->_countPeriod = objc_msgSend(v31, "unsignedIntegerValue");

    }
    objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("TileTracing"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("TileTracing"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      self->_tileTracing = objc_msgSend(v33, "unsignedIntegerValue");

    }
    objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("ESLInstTracing"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("ESLInstTracing"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      self->_eslInstTracing = objc_msgSend(v35, "unsignedIntegerValue");

    }
  }

}

- (NSDictionary)grcTrigger
{
  void *v2;
  void *v3;

  -[DTGPUAPSConfig toDictionary](self, "toDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("KickAndStateTracing"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (void)setDuration:(unint64_t)a3
{
  self->_duration = a3;
}

- (unint64_t)pulsePeriod
{
  return self->_pulsePeriod;
}

- (void)setPulsePeriod:(unint64_t)a3
{
  self->_pulsePeriod = a3;
}

- (unint64_t)countPeriod
{
  return self->_countPeriod;
}

- (void)setCountPeriod:(unint64_t)a3
{
  self->_countPeriod = a3;
}

- (unint64_t)tileTracing
{
  return self->_tileTracing;
}

- (void)setTileTracing:(unint64_t)a3
{
  self->_tileTracing = a3;
}

- (unint64_t)eslInstTracing
{
  return self->_eslInstTracing;
}

- (void)setEslInstTracing:(unint64_t)a3
{
  self->_eslInstTracing = a3;
}

- (unint64_t)ringBufferSizeInKB
{
  return self->_ringBufferSizeInKB;
}

- (void)setRingBufferSizeInKB:(unint64_t)a3
{
  self->_ringBufferSizeInKB = a3;
}

- (unint64_t)systemTimePeriod
{
  return self->_systemTimePeriod;
}

- (void)setSystemTimePeriod:(unint64_t)a3
{
  self->_systemTimePeriod = a3;
}

- (unint64_t)cliqueTraceLevel
{
  return self->_cliqueTraceLevel;
}

- (void)setCliqueTraceLevel:(unint64_t)a3
{
  self->_cliqueTraceLevel = a3;
}

- (unint64_t)emitPos
{
  return self->_emitPos;
}

- (void)setEmitPos:(unint64_t)a3
{
  self->_emitPos = a3;
}

- (unint64_t)emitThreadControlFlow
{
  return self->_emitThreadControlFlow;
}

- (void)setEmitThreadControlFlow:(unint64_t)a3
{
  self->_emitThreadControlFlow = a3;
}

- (unint64_t)subSamplingMinTraced
{
  return self->_subSamplingMinTraced;
}

- (void)setSubSamplingMinTraced:(unint64_t)a3
{
  self->_subSamplingMinTraced = a3;
}

- (unint64_t)subSamplingTargetThreshold
{
  return self->_subSamplingTargetThreshold;
}

- (void)setSubSamplingTargetThreshold:(unint64_t)a3
{
  self->_subSamplingTargetThreshold = a3;
}

- (unint64_t)nRingBuffers
{
  return self->_nRingBuffers;
}

- (void)setNRingBuffers:(unint64_t)a3
{
  self->_nRingBuffers = a3;
}

@end
