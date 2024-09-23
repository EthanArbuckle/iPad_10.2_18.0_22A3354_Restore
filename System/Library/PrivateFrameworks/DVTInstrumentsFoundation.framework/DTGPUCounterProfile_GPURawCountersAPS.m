@implementation DTGPUCounterProfile_GPURawCountersAPS

+ (id)create:(id)a3 profile:(unint64_t)a4
{
  id v5;
  DTGPUCounterProfile_GPURawCountersAPS *v6;

  v5 = a3;
  v6 = -[DTGPUCounterProfile_GPURawCountersAPS initWithDevice:profile:]([DTGPUCounterProfile_GPURawCountersAPS alloc], "initWithDevice:profile:", v5, a4);

  return v6;
}

- (DTGPUCounterProfile_GPURawCountersAPS)initWithDevice:(id)a3 profile:(unint64_t)a4
{
  id v7;
  DTGPUCounterProfile_GPURawCountersAPS *v8;
  DTGPUCounterProfile_GPURawCountersAPS *v9;
  id v10;
  uint64_t v11;
  NSDictionary *gpuConfig;
  DTGPUCounterProfile_GPURawCountersAPS *v13;
  objc_super v15;

  v7 = a3;
  if ((objc_msgSend(v7, "supportsFamily:", 1009) & 1) != 0)
  {
    v15.receiver = self;
    v15.super_class = (Class)DTGPUCounterProfile_GPURawCountersAPS;
    v8 = -[DTGPUCounterProfile initWithProfile:device:](&v15, sel_initWithProfile_device_, a4, v7);
    v9 = v8;
    if (!v8)
      goto LABEL_4;
    objc_storeStrong((id *)&v8->_device, a3);
    v10 = v7;
    sub_222BA6080(v10);
    v11 = objc_claimAutoreleasedReturnValue();
    gpuConfig = v9->_gpuConfig;
    v9->_gpuConfig = (NSDictionary *)v11;

    v13 = (DTGPUCounterProfile_GPURawCountersAPS *)v9->_gpuConfig;
    if (!v13)
    {
      self = v9;
    }
    else
    {
LABEL_4:
      self = v9;
      v13 = self;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)prepare
{
  return MEMORY[0x24BEDD108](self, sel__validateAndConfigureRawCounters);
}

- (void)setAPSCounterConfig:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *rdeSelects;
  NSMutableArray *v6;
  NSMutableArray *apsSelects;
  unint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void **v22;
  uint64_t j;
  id v24;
  unsigned __int8 *v25;
  uint64_t v26;
  _QWORD *v27;
  DTGPUCounterProfile_GPURawCountersAPS *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  unint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  NSMutableArray *v46;
  void *v47;
  char *v48;
  char *v49;
  void *v50;
  void *v51;
  void *v52;
  NSMutableArray *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  DTGPUCounterProfile_GPURawCountersAPS *v58;
  id obj;
  id obja;
  void *v61;
  void *v62;
  char *v63;
  uint64_t v64;
  void *v65;
  char *v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  void *v76[2];
  __int128 v77;
  int v78;
  void *__p[2];
  __int128 v80;
  int v81;
  _OWORD v82[2];
  int v83;
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  v57 = a3;
  v4 = (NSMutableArray *)objc_opt_new();
  rdeSelects = self->_rdeSelects;
  self->_rdeSelects = v4;

  v6 = (NSMutableArray *)objc_opt_new();
  apsSelects = self->_apsSelects;
  v58 = self;
  self->_apsSelects = v6;

  objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("RawCounterGRCs"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  memset(v82, 0, sizeof(v82));
  v83 = 1065353216;
  while (v8 < objc_msgSend(v61, "count"))
  {
    objc_msgSend(v61, "objectAtIndexedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Name"));
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sub_222B349DC(v76, (char *)objc_msgSend(v10, "UTF8String"));
    *(_OWORD *)__p = *(_OWORD *)v76;
    v11 = v77;
    v76[1] = 0;
    *(_QWORD *)&v77 = 0;
    v76[0] = 0;
    *(_QWORD *)&v80 = v11;
    *((_QWORD *)&v80 + 1) = v8;
    sub_222BA8090((uint64_t)v82, (unsigned __int8 *)__p, (__int128 *)__p);
    if (SBYTE7(v80) < 0)
      operator delete(__p[0]);
    if (SBYTE7(v77) < 0)
      operator delete(v76[0]);

    ++v8;
  }
  *(_OWORD *)__p = 0u;
  v80 = 0u;
  v81 = 1065353216;
  *(_OWORD *)v76 = 0u;
  v77 = 0u;
  v78 = 1065353216;
  GRCReleaseAllCounterSourceGroup();
  v56 = (void *)GRCCopyAllCounterSourceGroup();
  if (objc_msgSend(v56, "count"))
  {
    objc_msgSend(v56, "firstObject");
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "sourceList");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v73;
      obj = v12;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v73 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
          objc_msgSend(v16, "name");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "hasPrefix:", CFSTR("APS_USC"));

          v70 = 0u;
          v71 = 0u;
          v68 = 0u;
          v69 = 0u;
          objc_msgSend(v16, "availableCounters");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
          if (v20)
          {
            v21 = *(_QWORD *)v69;
            if (v18)
              v22 = __p;
            else
              v22 = v76;
            do
            {
              for (j = 0; j != v20; ++j)
              {
                if (*(_QWORD *)v69 != v21)
                  objc_enumerationMutation(v19);
                objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * j), "name");
                v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                sub_222B349DC(&v65, (char *)objc_msgSend(v24, "UTF8String"));
                v25 = sub_222BA00B8(v82, (unsigned __int8 *)&v65);
                if (SHIBYTE(v67) < 0)
                  operator delete(v65);

                if (v25)
                  sub_222BA8358((uint64_t)v22, (unint64_t *)v25 + 5, (_QWORD *)v25 + 5);
              }
              v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
            }
            while (v20);
          }

        }
        v12 = obj;
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
      }
      while (v13);
    }

    v65 = 0;
    v66 = 0;
    v67 = 0;
    if ((_QWORD)v77)
    {
      v26 = 0;
      v27 = (_QWORD *)v77;
      v28 = v58;
      do
      {
        ++v26;
        v27 = (_QWORD *)*v27;
      }
      while (v27);
    }
    else
    {
      v26 = 0;
      v28 = v58;
    }
    sub_222BA8570((uint64_t)&v65, 0, (_QWORD *)v77, 0, v26);
    v29 = 126 - 2 * __clz((v66 - (_BYTE *)v65) >> 3);
    if (v66 == v65)
      v30 = 0;
    else
      v30 = v29;
    sub_222BA87D0((unint64_t *)v65, (unint64_t *)v66, v30, 1);
    v62 = 0;
    v63 = 0;
    v64 = 0;
    if ((_QWORD)v80)
    {
      v31 = 0;
      v32 = (_QWORD *)v80;
      do
      {
        ++v31;
        v32 = (_QWORD *)*v32;
      }
      while (v32);
    }
    else
    {
      v31 = 0;
    }
    sub_222BA8570((uint64_t)&v62, 0, (_QWORD *)v80, 0, v31);
    v33 = 126 - 2 * __clz((v63 - (_BYTE *)v62) >> 3);
    if (v63 == v62)
      v34 = 0;
    else
      v34 = v33;
    sub_222BA9148((unint64_t *)v62, (unint64_t *)v63, v34, 1);
    -[NSDictionary objectForKeyedSubscript:](v28->_gpuConfig, "objectForKeyedSubscript:", CFSTR("RawCounterWidth"));
    obja = (id)objc_claimAutoreleasedReturnValue();
    v35 = (char *)v65;
    v36 = v66;
    if (v65 != v66)
    {
      do
      {
        objc_msgSend(v61, "objectAtIndexedSubscript:", *(_QWORD *)v35);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("Name"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = (void *)MEMORY[0x24BDBCED8];
        objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("Options"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "dictionaryWithDictionary:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(obja, "objectForKeyedSubscript:", v38);
        v42 = objc_claimAutoreleasedReturnValue();
        v43 = (void *)v42;
        v44 = &unk_24EB4ED50;
        if (v42)
          v44 = (void *)v42;
        v45 = v44;

        objc_msgSend(v41, "setObject:forKeyedSubscript:", v45, CFSTR("Width"));
        if (v38)
        {
          v46 = v58->_rdeSelects;
          v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE38F60]), "initWithName:options:", v38, v41);
          -[NSMutableArray addObject:](v46, "addObject:", v47);

        }
        v35 += 8;
      }
      while (v35 != v36);
    }
    v48 = (char *)v62;
    v49 = v63;
    if (v62 != v63)
    {
      do
      {
        objc_msgSend(v61, "objectAtIndexedSubscript:", *(_QWORD *)v48);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("Name"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("Options"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (v51)
        {
          v53 = v58->_apsSelects;
          v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE38F60]), "initWithName:options:", v51, v52);
          -[NSMutableArray addObject:](v53, "addObject:", v54);

        }
        v48 += 8;
      }
      while (v48 != v49);
    }
    GRCReleaseAllCounterSourceGroup();

    if (v62)
    {
      v63 = (char *)v62;
      operator delete(v62);
    }
    if (v65)
    {
      v66 = (char *)v65;
      operator delete(v65);
    }

  }
  sub_222BA8310((uint64_t)v76);
  sub_222BA8310((uint64_t)__p);
  sub_222B9F818((uint64_t)v82);

}

- (BOOL)_validateAndConfigureRawCounters
{
  void *agxSource;
  GPURawCounterSourceGroup *v4;
  GPURawCounterSourceGroup *sourceGroup;
  DTGPUAGXCounterSourceGroup *v6;
  BOOL v7;

  if (!-[NSMutableArray count](self->_apsSelects, "count") && !-[NSMutableArray count](self->_rdeSelects, "count"))
    return 0;
  if (!self->_sourceGroup)
  {
    GRCReleaseAllCounterSourceGroup();
    agxSource = (void *)GRCCopyAllCounterSourceGroup();
    if (!objc_msgSend(agxSource, "count"))
    {
      v7 = 0;
      goto LABEL_7;
    }
    objc_msgSend(agxSource, "firstObject");
    v4 = (GPURawCounterSourceGroup *)objc_claimAutoreleasedReturnValue();
    sourceGroup = self->_sourceGroup;
    self->_sourceGroup = v4;

  }
  v6 = -[DTGPUAGXCounterSourceGroup initWithSourceGroup:selects:apsSelects:profile:]([DTGPUAGXCounterSourceGroup alloc], "initWithSourceGroup:selects:apsSelects:profile:", self->_sourceGroup, self->_rdeSelects, self->_apsSelects, -[DTGPUCounterProfile profile](self, "profile"));
  agxSource = self->_agxSource;
  self->_agxSource = v6;
  v7 = 1;
LABEL_7:

  return v7;
}

- (BOOL)start:(unint64_t)a3 vendorFeatures:(id)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  unint64_t v9;
  unint64_t v10;
  BOOL v11;

  v6 = a4;
  if (!self->_sourceGroup)
    goto LABEL_10;
  -[NSDictionary objectForKeyedSubscript:](self->_gpuConfig, "objectForKeyedSubscript:", CFSTR("RDESampleInterval"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntValue");

  v9 = v8;
  if (v8 <= a3)
    v9 = a3;
  v10 = v9 ? v9 : 50000;
  if (-[DTGPUAGXCounterSourceGroup request:vendorFeatures:](self->_agxSource, "request:vendorFeatures:", v10, v6)
    && -[GPURawCounterSourceGroup startSampling](self->_sourceGroup, "startSampling"))
  {
    -[DTGPUAGXCounterSourceGroup resume](self->_agxSource, "resume");
    v11 = 1;
  }
  else
  {
LABEL_10:
    v11 = 0;
  }

  return v11;
}

- (void)stop
{
  GPURawCounterSourceGroup *sourceGroup;

  if (self->_sourceGroup)
  {
    -[DTGPUAGXCounterSourceGroup stop](self->_agxSource, "stop");
    -[GPURawCounterSourceGroup stopSampling](self->_sourceGroup, "stopSampling");
    sourceGroup = self->_sourceGroup;
    self->_sourceGroup = 0;

    GRCReleaseAllCounterSourceGroup();
  }
}

- (void)sampleCounters:(unint64_t)a3 callback:(id)a4
{
  -[DTGPUAGXCounterSourceGroup sampleCounters:callback:](self->_agxSource, "sampleCounters:callback:", a3, a4);
}

- (void)sampleAPS:(id)a3
{
  -[DTGPUAGXCounterSourceGroup sampleAPS:](self->_agxSource, "sampleAPS:", a3);
}

- (id)counterProfileForHost
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
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
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  void *v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _QWORD v45[2];
  _QWORD v46[4];

  v46[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCED8];
  v45[0] = CFSTR("GPUConfigurationVariables");
  -[NSDictionary objectForKeyedSubscript:](self->_gpuConfig, "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = CFSTR("AcceleratorID");
  v46[0] = v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[MTLDevice registryID](self->_device, "registryID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = (void *)objc_opt_new();
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[DTGPUAGXCounterSourceGroup sources](self->_agxSource, "sources");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v8;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v39;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v39 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = v12;
          objc_msgSend(v13, "apsConfig");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "toDictionary");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, CFSTR("APSConfig"));

          v16 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v13, "apsConfig");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v17, "countPeriod"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, CFSTR("CountPeriod"));

          v19 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v13, "apsConfig");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v20, "pulsePeriod"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v21, CFSTR("PulsePeriod"));

          v22 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v13, "apsConfig");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "numberWithUnsignedInteger:", objc_msgSend(v23, "systemTimePeriod"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v24, CFSTR("SystemTimePeriod"));

        }
        else
        {
          v13 = (id)objc_opt_new();
          v36 = 0u;
          v37 = 0u;
          v34 = 0u;
          v35 = 0u;
          objc_msgSend(v12, "selects");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
          if (v26)
          {
            v27 = *(_QWORD *)v35;
            do
            {
              v28 = 0;
              do
              {
                if (*(_QWORD *)v35 != v27)
                  objc_enumerationMutation(v25);
                objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v28), "name");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "addObject:", v29);

                ++v28;
              }
              while (v26 != v28);
              v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
            }
            while (v26);
          }

          objc_msgSend(v32, "addObject:", v13);
        }

        ++v11;
      }
      while (v11 != v9);
      v8 = obj;
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v9);
  }

  if (v32)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v32, CFSTR("RDERawCounters"));
  v42 = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v42, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (id)sampleSizes
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[DTGPUAGXCounterSourceGroup sources](self->_agxSource, "sources", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v7), "selects");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  return v3;
}

- (id)ringBufferCounts
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[DTGPUAGXCounterSourceGroup sources](self->_agxSource, "sources", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v7), "source");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "numberWithUnsignedInt:", objc_msgSend(v9, "ringBufferNum"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  return v3;
}

- (BOOL)isAPS
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rdeSelects, 0);
  objc_storeStrong((id *)&self->_apsSelects, 0);
  objc_storeStrong((id *)&self->_gpuConfig, 0);
  objc_storeStrong((id *)&self->_agxSource, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_sourceGroup, 0);
}

@end
