@implementation HMIMemorySampler

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_45 != -1)
    dispatch_once(&sharedInstance_onceToken_45, &__block_literal_global_46);
  return (id)sharedInstance_sharedInstance_44;
}

void __34__HMIMemorySampler_sharedInstance__block_invoke()
{
  HMIMemorySampler *v0;
  void *v1;

  v0 = objc_alloc_init(HMIMemorySampler);
  v1 = (void *)sharedInstance_sharedInstance_44;
  sharedInstance_sharedInstance_44 = (uint64_t)v0;

}

- (HMIMemorySampler)init
{
  HMIMemorySampler *v2;
  uint64_t v3;
  HMFTimer *tick;
  MovingAverage *v5;
  MovingAverage *average;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMIMemorySampler;
  v2 = -[HMIMemorySampler init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 28, 0.25);
    tick = v2->_tick;
    v2->_tick = (HMFTimer *)v3;

    -[HMFTimer setDelegate:](v2->_tick, "setDelegate:", v2);
    v5 = -[MovingAverage initWithWindowSize:]([MovingAverage alloc], "initWithWindowSize:", 128);
    average = v2->_average;
    v2->_average = v5;

  }
  return v2;
}

- (void)start
{
  id v2;

  -[HMIMemorySampler tick](self, "tick");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resume");

}

- (void)stop
{
  id v2;

  -[HMIMemorySampler tick](self, "tick");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "suspend");

}

- (void)timerDidFire:(id)a3
{
  id v4;
  void *v5;
  pid_t v6;
  unint64_t v7;
  MovingAverage *average;
  void *v9;
  double v10;
  unint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  HMIMemorySampler *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  rusage_info_t buffer[4];
  __int128 v28;
  __int128 v29;
  __int128 v30;
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
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x220735570]();
  v6 = getpid();
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v28 = 0u;
  memset(buffer, 0, sizeof(buffer));
  if (!proc_pid_rusage(v6, 6, buffer))
  {
    v7 = *((_QWORD *)&v30 + 1);
    v25 = v41;
    average = self->_average;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *((_QWORD *)&v30 + 1));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MovingAverage addNumber:](average, "addNumber:", v9);

    -[MovingAverage movingAverage](self->_average, "movingAverage");
    v11 = (unint64_t)v10;
    v12 = objc_alloc_init(MEMORY[0x24BDD1490]);
    objc_msgSend(v12, "setZeroPadsFractionDigits:", 1);
    objc_msgSend(v12, "setAllowedUnits:", 4);
    objc_msgSend(v12, "setCountStyle:", 1);
    objc_msgSend(v12, "setAllowsNonnumericFormatting:", 0);
    v13 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v12, "stringFromByteCount:", v7);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%9s"), objc_msgSend(v14, "UTF8String"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v12, "stringFromByteCount:", v11);
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%9s"), objc_msgSend(v16, "UTF8String"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v12, "stringFromByteCount:", v25);
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v18, "stringWithFormat:", CFSTR("%9s"), objc_msgSend(v19, "UTF8String"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x220735570]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buffer[0]) = 138544130;
      *(rusage_info_t *)((char *)buffer + 4) = v24;
      WORD2(buffer[1]) = 2112;
      *(rusage_info_t *)((char *)&buffer[1] + 6) = v26;
      HIWORD(buffer[2]) = 2112;
      buffer[3] = v17;
      LOWORD(v28) = 2112;
      *(_QWORD *)((char *)&v28 + 2) = v20;
      _os_log_impl(&dword_219D45000, v23, OS_LOG_TYPE_DEBUG, "%{public}@Footprint: %@, Average: %@, Peak: %@", (uint8_t *)buffer, 0x2Au);

    }
    objc_autoreleasePoolPop(v21);
    if ((-[HMIMemorySampler highWaterMark](v22, "highWaterMark") & 0x8000000000000000) == 0
      && v7 > -[HMIMemorySampler highWaterMark](v22, "highWaterMark"))
    {
      objc_exception_throw((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE88]), "initWithName:reason:userInfo:", CFSTR("OutOfMemory"), CFSTR("Reached high water mark."), 0));
    }

  }
  objc_autoreleasePoolPop(v5);

}

- (int64_t)highWaterMark
{
  return self->_highWaterMark;
}

- (void)setHighWaterMark:(int64_t)a3
{
  self->_highWaterMark = a3;
}

- (HMFTimer)tick
{
  return (HMFTimer *)objc_getProperty(self, a2, 16, 1);
}

- (MovingAverage)average
{
  return (MovingAverage *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_average, 0);
  objc_storeStrong((id *)&self->_tick, 0);
}

@end
