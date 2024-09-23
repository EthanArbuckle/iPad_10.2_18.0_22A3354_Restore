@implementation DTGPUCounterProfile_GPURawCountersImport

+ (id)create:(id)a3
{
  id v3;
  DTGPUCounterProfile_GPURawCountersImport *v4;

  v3 = a3;
  v4 = -[DTGPUCounterProfile_GPURawCountersImport initWithImportAPSDataPath:]([DTGPUCounterProfile_GPURawCountersImport alloc], "initWithImportAPSDataPath:", v3);

  return v4;
}

- (DTGPUCounterProfile_GPURawCountersImport)initWithImportAPSDataPath:(id)a3
{
  id v4;
  DTGPUCounterProfile_GPURawCountersImport *v5;
  void *v6;
  uint64_t v7;
  DTGPUAPSDataContainer *container;
  DTGPUCounterProfile_GPURawCountersImport *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DTGPUCounterProfile_GPURawCountersImport;
  v5 = -[DTGPUCounterProfile initWithProfile:device:](&v11, sel_initWithProfile_device_, 13, 0);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[DTGPUAPSDataContainer fromData:error:](DTGPUAPSDataContainer, "fromData:error:", v6, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7)
    {

      v9 = 0;
      goto LABEL_6;
    }
    container = v5->_container;
    v5->_container = (DTGPUAPSDataContainer *)v7;

  }
  v9 = v5;
LABEL_6:

  return v9;
}

- (BOOL)prepare
{
  return MEMORY[0x24BEDD108](self, sel__validateAndConfigureRawCounters);
}

- (BOOL)_validateAndConfigureRawCounters
{
  return 1;
}

- (BOOL)start:(unint64_t)a3 vendorFeatures:(id)a4
{
  return 1;
}

- (void)stop
{
  self->_sampled = 0;
}

- (void)sampleAPS:(id)a3
{
  id v4;
  void *v5;
  DTGPUAPSDataContainer *container;
  uint64_t v7;
  id v8;
  DTGPUAPSDataContainer *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = v4;
  if (!self->_sampled)
  {
    container = self->_container;
    v7 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = sub_222B2C358;
    v12[3] = &unk_24EB288A0;
    v8 = v4;
    v13 = v8;
    -[DTGPUAPSDataContainer enumerateUSCData:](container, "enumerateUSCData:", v12);
    v9 = self->_container;
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = sub_222B2C3E0;
    v10[3] = &unk_24EB288C8;
    v11 = v8;
    -[DTGPUAPSDataContainer enumerateRDEData:](v9, "enumerateRDEData:", v10);
    self->_sampled = 1;

  }
}

- (id)counterProfileForHost
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  -[DTGPUAPSDataContainer config](self->_container, "config");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)sampleSizes
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[DTGPUAPSDataContainer config](self->_container, "config", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RDERawCounters"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v8), "count"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  v10 = (void *)MEMORY[0x24BDD16E0];
  -[DTGPUAPSDataContainer config](self->_container, "config");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("APSRawCounters"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v13);

  return v3;
}

- (id)ringBufferCounts
{
  void *v3;
  unint64_t i;
  unint64_t v5;
  DTGPUAPSDataContainer *container;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  for (i = 0; ; ++i)
  {
    v5 = -[DTGPUAPSDataContainer numRDEs](self->_container, "numRDEs");
    container = self->_container;
    if (i >= v5)
      break;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[DTGPUAPSDataContainer numBuffersAtRDEIndex:](container, "numBuffersAtRDEIndex:", i));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[DTGPUAPSDataContainer numUSCs](container, "numUSCs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  return v3;
}

- (BOOL)isAPS
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
}

@end
