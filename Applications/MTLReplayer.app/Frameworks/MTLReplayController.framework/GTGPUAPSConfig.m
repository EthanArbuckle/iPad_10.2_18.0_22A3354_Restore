@implementation GTGPUAPSConfig

- (id)toDictionary
{
  void *v3;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[4];
  _QWORD v26[4];
  _QWORD v27[3];
  _QWORD v28[3];
  _QWORD v29[7];
  _QWORD v30[7];

  v29[0] = CFSTR("Duration");
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_duration));
  v30[0] = v22;
  v29[1] = CFSTR("RingBufferSizeInKB");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_ringBufferSizeInKb));
  v30[1] = v21;
  v29[2] = CFSTR("BufferSizeInKB");
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 10 * self->_ringBufferSizeInKb));
  v30[2] = v20;
  v29[3] = CFSTR("SystemTimePeriod");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_systemTimePeriod));
  v30[3] = v19;
  v29[4] = CFSTR("ProfileControl");
  v27[0] = CFSTR("CliqueTraceLevel");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_cliqueTraceLevel));
  v28[0] = v18;
  v27[1] = CFSTR("EmitPos");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_emitPos));
  v28[1] = v17;
  v27[2] = CFSTR("EmitThreadControlFlow");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_emitThreadControlFlow));
  v28[2] = v16;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 3));
  v30[4] = v15;
  v29[5] = CFSTR("SyncDrainMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_syncDrainMode));
  v30[5] = v3;
  v29[6] = CFSTR("KickAndStateTracing");
  v25[0] = CFSTR("PulsePeriod");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_pulsePeriod));
  v26[0] = v4;
  v25[1] = CFSTR("CountPeriod");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_countPeriod));
  v26[1] = v5;
  v25[2] = CFSTR("TileTracing");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_tileTracing));
  v26[2] = v6;
  v25[3] = CFSTR("ESLInstTracing");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_eslInstTracing));
  v26[3] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 4));
  v30[6] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 7));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v9));

  if (*(_OWORD *)&self->_subSamplingMinTraced != 0)
  {
    v23[0] = CFSTR("MinTraced");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
    v23[1] = CFSTR("TargetThreshold");
    v24[0] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_subSamplingTargetThreshold));
    v24[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 2));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("CliqueSubSampling"));

  }
  return v10;
}

- (id)initForProfiling
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GTGPUAPSConfig;
  result = -[GTGPUAPSConfig init](&v3, "init");
  if (result)
  {
    *((_QWORD *)result + 1) = 1;
    *(_OWORD *)((char *)result + 56) = xmmword_4AA480;
    *(_OWORD *)((char *)result + 72) = xmmword_4AA490;
    *((_QWORD *)result + 12) = 0;
    *((_QWORD *)result + 13) = 0;
    *((_QWORD *)result + 11) = 1;
    *(_OWORD *)((char *)result + 24) = xmmword_4AA4A0;
    *(int64x2_t *)((char *)result + 40) = vdupq_n_s64(1uLL);
  }
  return result;
}

- (id)initForCounters
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GTGPUAPSConfig;
  result = -[GTGPUAPSConfig init](&v3, "init");
  if (result)
  {
    *((_QWORD *)result + 1) = 1;
    *(_OWORD *)((char *)result + 56) = xmmword_4AA4B0;
    *((_QWORD *)result + 10) = 0;
    *((_QWORD *)result + 11) = 0;
    *((_QWORD *)result + 9) = 1;
    *((int64x2_t *)result + 6) = vdupq_n_s64(1uLL);
    *(_OWORD *)((char *)result + 24) = xmmword_4AA4C0;
    *(_OWORD *)((char *)result + 40) = xmmword_4AA4D0;
  }
  return result;
}

- (id)initForTimeline
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GTGPUAPSConfig;
  result = -[GTGPUAPSConfig init](&v3, "init");
  if (result)
  {
    *((_QWORD *)result + 1) = 1;
    *(_OWORD *)((char *)result + 56) = xmmword_4AA4B0;
    *(_OWORD *)((char *)result + 72) = xmmword_4AA4E0;
    *((_QWORD *)result + 12) = 0;
    *((_QWORD *)result + 13) = 0;
    *((_QWORD *)result + 11) = 1;
    *(_OWORD *)((char *)result + 24) = xmmword_4AA4C0;
    *(_OWORD *)((char *)result + 40) = xmmword_4AA4D0;
  }
  return result;
}

- (id)initForMinimumInfoTimeline
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GTGPUAPSConfig;
  result = -[GTGPUAPSConfig init](&v3, "init");
  if (result)
  {
    *((_QWORD *)result + 1) = 1;
    *(_OWORD *)((char *)result + 56) = xmmword_4AA4B0;
    *((_QWORD *)result + 10) = 0;
    *((_QWORD *)result + 11) = 0;
    *((_QWORD *)result + 9) = 1;
    *((int64x2_t *)result + 6) = vdupq_n_s64(1uLL);
    *(_OWORD *)((char *)result + 24) = xmmword_4AA4F0;
    *(_OWORD *)((char *)result + 40) = xmmword_4AA4D0;
  }
  return result;
}

- (id)initForMinimumInfoCounters
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GTGPUAPSConfig;
  result = -[GTGPUAPSConfig init](&v3, "init");
  if (result)
  {
    *((_QWORD *)result + 1) = 1;
    *(_OWORD *)((char *)result + 56) = xmmword_4AA4B0;
    *((_QWORD *)result + 10) = 0;
    *((_QWORD *)result + 11) = 0;
    *((_QWORD *)result + 9) = 1;
    *((int64x2_t *)result + 6) = vdupq_n_s64(1uLL);
    *(_OWORD *)((char *)result + 24) = xmmword_4AA4F0;
    *(_OWORD *)((char *)result + 40) = xmmword_4AA4D0;
  }
  return result;
}

- (id)initForMinimumInfoProfiling
{
  id result;
  int64x2_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GTGPUAPSConfig;
  result = -[GTGPUAPSConfig init](&v4, "init");
  if (result)
  {
    *((_QWORD *)result + 1) = 1;
    *(_OWORD *)((char *)result + 56) = xmmword_4AA480;
    *((_QWORD *)result + 10) = 0;
    *((_QWORD *)result + 11) = 0;
    v3 = vdupq_n_s64(1uLL);
    *((_QWORD *)result + 9) = 3;
    *((int64x2_t *)result + 6) = v3;
    *(_OWORD *)((char *)result + 24) = xmmword_4AA4F0;
    *(int64x2_t *)((char *)result + 40) = v3;
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
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("SyncDrainMode")));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("SyncDrainMode")));
    self->_syncDrainMode = (unint64_t)objc_msgSend(v5, "unsignedIntegerValue");

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("Duration")));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("Duration")));
    self->_duration = (unint64_t)objc_msgSend(v7, "unsignedIntegerValue");

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("RingBufferSizeInKB")));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("RingBufferSizeInKB")));
    self->_ringBufferSizeInKb = (unint64_t)objc_msgSend(v9, "unsignedIntegerValue");

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("SystemTimePeriod")));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("SystemTimePeriod")));
    self->_systemTimePeriod = (unint64_t)objc_msgSend(v11, "unsignedIntegerValue");

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("ProfileControl")));
  v13 = v12;
  if (v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("CliqueTraceLevel")));
    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("CliqueTraceLevel")));
      self->_cliqueTraceLevel = (unint64_t)objc_msgSend(v15, "unsignedIntegerValue");

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("EmitPos")));
    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("EmitPos")));
      self->_emitPos = (unint64_t)objc_msgSend(v17, "unsignedIntegerValue");

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("EmitThreadControlFlow")));
    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("EmitThreadControlFlow")));
      self->_emitThreadControlFlow = (unint64_t)objc_msgSend(v19, "unsignedIntegerValue");

    }
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("CliqueSubSampling")));
  v21 = v20;
  if (v20)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("MinTraced")));
    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("MinTraced")));
      self->_subSamplingMinTraced = (unint64_t)objc_msgSend(v23, "unsignedIntegerValue");

    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("TargetThreshold")));
    if (v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("TargetThreshold")));
      self->_subSamplingTargetThreshold = (unint64_t)objc_msgSend(v25, "unsignedIntegerValue");

    }
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("KickAndStateTracing")));
  v27 = v26;
  if (v26)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("PulsePeriod")));
    if (v28)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("PulsePeriod")));
      self->_pulsePeriod = (unint64_t)objc_msgSend(v29, "unsignedIntegerValue");

    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("CountPeriod")));
    if (v30)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("CountPeriod")));
      self->_countPeriod = (unint64_t)objc_msgSend(v31, "unsignedIntegerValue");

    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("TileTracing")));
    if (v32)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("TileTracing")));
      self->_tileTracing = (unint64_t)objc_msgSend(v33, "unsignedIntegerValue");

    }
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("ESLInstTracing")));
    if (v34)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("ESLInstTracing")));
      self->_eslInstTracing = (unint64_t)objc_msgSend(v35, "unsignedIntegerValue");

    }
  }

}

- (NSDictionary)grcTrigger
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GTGPUAPSConfig toDictionary](self, "toDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("KickAndStateTracing")));

  return (NSDictionary *)v3;
}

- (unint64_t)syncDrainMode
{
  return self->_syncDrainMode;
}

- (void)setSyncDrainMode:(unint64_t)a3
{
  self->_syncDrainMode = a3;
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

- (unint64_t)bufferSizeInKb
{
  return self->_ringBufferSizeInKb;
}

- (void)setBufferSizeInKb:(unint64_t)a3
{
  self->_ringBufferSizeInKb = a3;
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

@end
