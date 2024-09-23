@implementation AGXGPURawCounterSourceGroup

- (AGXGPURawCounterSourceGroup)initWithAcceleratorPort:(unsigned int)a3
{
  AGXGPURawCounterSourceGroup *v3;
  AGXGPURawCounterSourceGroup *v4;
  uint64_t Instance;
  unsigned int v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  AGXGPURawCounterSource *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  char v24;
  char v25;
  AGXGPURawCounterSource *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  id v31;
  objc_super v32;
  _OWORD v33[32];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v32.receiver = self;
  v32.super_class = (Class)AGXGPURawCounterSourceGroup;
  v3 = -[_GPURawCounterSourceGroup initWithAcceleratorPort:](&v32, sel_initWithAcceleratorPort_, *(_QWORD *)&a3);
  v4 = v3;
  if (v3)
  {
    Instance = AGXGPURawCounter::createInstance((AGXGPURawCounter *)*(unsigned int *)((char *)&v3->super.super.isa
                                                                                    + (int)*MEMORY[0x24BE38F90]));
    v4->_impl = (AGXGPURawCounter *)Instance;
    if (Instance)
    {
      memset(v33, 0, sizeof(v33));
      v6 = (*(uint64_t (**)(uint64_t, _OWORD *, uint64_t))(*(_QWORD *)Instance + 24))(Instance, v33, 64);
      v31 = objc_alloc(MEMORY[0x24BDBCED8]);
      v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE38F78]), "initWithName:description:options:", CFSTR("TimerNClock"), CFSTR("Sample every 'n' n-clock ticks"), &unk_24FFE9478);
      v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE38F78]), "initWithName:description:options:", CFSTR("TimerFixed"), CFSTR("Sample every 'n' GPU clock ticks"), &unk_24FFE94A0);
      v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE38F78]), "initWithName:description:options:", CFSTR("KickBoundary"), CFSTR("Sample at kick start/end"), 0);
      v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE38F78]), "initWithName:description:options:", CFSTR("CPMS"), CFSTR("Sample when CPMS buffer is full"), 0);
      v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE38F78]), "initWithName:description:options:", CFSTR("KickTracing"), CFSTR("Enable APS kick tracing"), 0);
      sSourceGroupTriggerList = objc_msgSend(v31, "initWithObjectsAndKeys:", v7, CFSTR("TimerNClock"), v8, CFSTR("TimerFixed"), v9, CFSTR("KickBoundary"), v10, CFSTR("CPMS"), v11, CFSTR("KickTracing"), (id)objc_msgSend(objc_alloc(MEMORY[0x24BE38F78]), "initWithName:description:options:", CFSTR("KickAndStateTracing"), CFSTR("Enable APS kick and state tracing"), 0), CFSTR("KickAndStateTracing"),
                                  0);
      v12 = v6;
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v6);
      v14 = (void *)MEMORY[0x2348CE920]();
      if (v6)
      {
        if (v6 == 1)
        {
          v15 = *(_QWORD *)&v33[0];
          if ((*(unsigned int (**)(_QWORD))(**(_QWORD **)&v33[0] + 176))(*(_QWORD *)&v33[0]) > 0x3F)
            v16 = 0x4000000;
          else
            v16 = (unint64_t)(*(unsigned int (**)(_QWORD))(**(_QWORD **)&v33[0] + 176))(*(_QWORD *)&v33[0]) << 20;
          (*(void (**)(uint64_t, unint64_t))(*(_QWORD *)v15 + 136))(v15, v16);
          v19 = [AGXGPURawCounterSource alloc];
          objc_msgSend(v13, "setObject:atIndexedSubscript:", -[AGXGPURawCounterSource initWithSourceGroup:impl:](v19, "initWithSourceGroup:impl:", v4, *(_QWORD *)&v33[0]), 0);
        }
        else
        {
          v17 = *(_QWORD *)&v33[0];
          if ((*(unsigned int (**)(_QWORD))(**(_QWORD **)&v33[0] + 176))(*(_QWORD *)&v33[0]) > 0x7F)
            v18 = 0x4000000;
          else
            v18 = (unint64_t)(*(unsigned int (**)(_QWORD))(**(_QWORD **)&v33[0] + 176))(*(_QWORD *)&v33[0]) << 19;
          (*(void (**)(uint64_t, unint64_t))(*(_QWORD *)v17 + 136))(v17, v18);
          v27 = [AGXGPURawCounterSource alloc];
          objc_msgSend(v13, "setObject:atIndexedSubscript:", -[AGXGPURawCounterSource initWithSourceGroup:impl:](v27, "initWithSourceGroup:impl:", v4, *(_QWORD *)&v33[0]), 0);
          v28 = 1;
          do
          {
            v30 = *((_QWORD *)v33 + v28);
            if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v30 + 176))(v30) <= 0x3F)
              v29 = (unint64_t)(*(unsigned int (**)(_QWORD))(**((_QWORD **)v33 + v28) + 176))(*((_QWORD *)v33 + v28)) << 20;
            else
              v29 = 0x4000000;
            (*(void (**)(uint64_t, unint64_t))(*(_QWORD *)v30 + 136))(v30, v29);
            objc_msgSend(v13, "setObject:atIndexedSubscript:", -[AGXGPURawCounterSource initWithSourceGroup:impl:]([AGXGPURawCounterSource alloc], "initWithSourceGroup:impl:", v4, *((_QWORD *)v33 + v28)), v28);
            ++v28;
          }
          while (v12 != v28);
        }
      }
      objc_autoreleasePoolPop(v14);
      *(Class *)((char *)&v4->super.super.isa + (int)*MEMORY[0x24BE38FB0]) = (Class)v13;
      v20 = (int)*MEMORY[0x24BE38FA0];

      if ((MGGetBoolAnswer() & 1) == 0)
      {
        *(Class *)((char *)&v4->super.super.isa + v20) = (Class)(id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AppleGPU");
LABEL_17:
        v23 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        v24 = (*((uint64_t (**)(AGXGPURawCounter *))v4->_impl->var0 + 5))(v4->_impl);
        v25 = v24;
        if ((v24 & 2) != 0)
        {
          objc_msgSend(v23, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("SupportOption_DisableOverlap"));
          v25 &= ~2u;
          if ((v25 & 4) == 0)
          {
LABEL_19:
            if ((v25 & 8) == 0)
              goto LABEL_20;
            goto LABEL_27;
          }
        }
        else if ((v24 & 4) == 0)
        {
          goto LABEL_19;
        }
        objc_msgSend(v23, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("SupportOption_LockGPUPerfState"));
        v25 &= ~4u;
        if ((v25 & 8) == 0)
        {
LABEL_20:
          if ((v25 & 0x10) == 0)
            goto LABEL_21;
          goto LABEL_28;
        }
LABEL_27:
        objc_msgSend(v23, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("SupportOption_DisableMCH"));
        v25 &= ~8u;
        if ((v25 & 0x10) == 0)
        {
LABEL_21:
          if ((v25 & 0x20) == 0)
          {
LABEL_23:
            (*((void (**)(AGXGPURawCounter *, id))v4->_impl->var0 + 14))(v4->_impl, v23);
            *(Class *)((char *)&v4->super.super.isa + (int)*MEMORY[0x24BE38F98]) = (Class)v23;
            return v4;
          }
LABEL_22:
          objc_msgSend(v23, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("SupportOption_SingleVDMChannel"));
          goto LABEL_23;
        }
LABEL_28:
        objc_msgSend(v23, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("SupportOption_ReduceCDMCluster"));
        if ((v25 & 0x20) == 0)
          goto LABEL_23;
        goto LABEL_22;
      }
      v21 = (*((uint64_t (**)(AGXGPURawCounter *))v4->_impl->var0 + 2))(v4->_impl);
      if (v21)
      {
        v22 = (void *)v21;
        *(Class *)((char *)&v4->super.super.isa + v20) = (Class)(id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("AppleGPU_%s"), v21);
        free(v22);
        goto LABEL_17;
      }
    }

    return 0;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_impl)
  {
    AGXGPURawCounter::destroyInstance((AGXGPURawCounter *)self);
    self->_impl = 0;
  }

  sSourceGroupTriggerList = 0;
  v3.receiver = self;
  v3.super_class = (Class)AGXGPURawCounterSourceGroup;
  -[_GPURawCounterSourceGroup dealloc](&v3, sel_dealloc);
}

- (void)setOptions:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AGXGPURawCounterSourceGroup;
  -[_GPURawCounterSourceGroup setOptions:](&v4, sel_setOptions_, a3);
  (*((void (**)(AGXGPURawCounter *, _QWORD))self->_impl->var0 + 4))(self->_impl, *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE38FA8]));
}

- (unint64_t)sampleMarker
{
  return 0x52544E4357525047;
}

- (BOOL)startSampling
{
  return (*((uint64_t (**)(AGXGPURawCounter *))self->_impl->var0 + 10))(self->_impl);
}

- (BOOL)stopSampling
{
  return (*((uint64_t (**)(AGXGPURawCounter *))self->_impl->var0 + 11))(self->_impl);
}

- (id)subDivideCounterList:(id)a3 withOptions:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unsigned int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  unsigned int v17;
  int v18;
  uint64_t v19;
  BOOL v20;
  void *v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unsigned int v26;
  uint64_t v27;
  int v28;
  void *v29;
  uint64_t v30;
  unsigned int v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  unsigned int v35;
  unint64_t v36;
  unsigned int v37;
  uint64_t v38;
  unint64_t v39;
  unsigned int v40;
  uint64_t v41;
  unsigned int v42;
  uint64_t v45;
  void *context;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  int v51;
  void *v52;
  unint64_t v53;
  void *v54;
  void *v55;
  _QWORD v56[3];

  v56[2] = *MEMORY[0x24BDAC8D0];
  if (!objc_msgSend(a3, "count")
    || ((*((uint64_t (**)(AGXGPURawCounter *))self->_impl->var0 + 12))(self->_impl) & 1) != 0)
  {
    return 0;
  }
  v48 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  context = (void *)MEMORY[0x2348CE920]();
  v50 = objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 16);
  v54 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  v56[0] = v54;
  v8 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  v56[1] = v8;
  v9 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  if (objc_msgSend(a3, "count"))
  {
    v10 = 0;
    v11 = 1;
    do
    {
      v12 = v9;
      if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v10), "name"), "hasPrefix:", CFSTR("GBL_USC_PROFILE_DATA_")) & 1) == 0)
      {
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v10), "name"), "hasPrefix:", CFSTR("GRC_SHADER_PROFILER_DATA_")))v12 = v9;
        else
          v12 = v8;
      }
      objc_msgSend(v12, "addObject:", objc_msgSend(a3, "objectAtIndexedSubscript:", v10));
      v10 = v11++;
    }
    while (objc_msgSend(a3, "count") > v10);
  }
  v13 = v8;
  v14 = v50;
  v15 = v54;
  if (objc_msgSend(v8, "count"))
  {
    v16 = 0;
    v17 = 1;
    do
    {
      v18 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v13, "objectAtIndexedSubscript:", v16), "name"), "hasPrefix:", CFSTR("GRC_"));
      v19 = objc_msgSend(v8, "objectAtIndexedSubscript:", v16);
      v20 = v18 == 0;
      v13 = v8;
      if (v20)
        v21 = v54;
      else
        v21 = (void *)v50;
      objc_msgSend(v21, "addObject:", v19);
      v16 = v17++;
    }
    while (objc_msgSend(v8, "count") > v16);
  }
  v45 = objc_msgSend(v54, "count");
  v47 = v9;
  if (v45)
  {
    v22 = v13;
    v23 = (int)*MEMORY[0x24BE38FB0];
    v51 = 0;
    v53 = objc_msgSend(*(id *)((char *)&self->super.super.isa + v23), "count");
    v24 = 0x24BDBC000uLL;
    v49 = v7;
    while (1)
    {
      v55 = (void *)objc_msgSend(*(id *)(v24 + 3768), "arrayWithCapacity:", objc_msgSend(*(id *)((char *)&self->super.super.isa + v23), "count", v45));
      (*((void (**)(AGXGPURawCounter *))self->_impl->var0 + 11))(self->_impl);
      v52 = v22;
      objc_msgSend(v22, "removeAllObjects");
      if (objc_msgSend(*(id *)((char *)&self->super.super.isa + v23), "count"))
      {
        v25 = 0;
        v26 = 1;
        do
        {
          v28 = objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.isa + v23), "objectAtIndexedSubscript:", v25), "requestCounters:firstErrorIndex:", v14, 0);
          v29 = *(void **)(v24 + 3768);
          if (v28)
            v27 = objc_msgSend(v29, "arrayWithArray:", v14);
          else
            v27 = objc_msgSend(v29, "array");
          objc_msgSend(v55, "addObject:", v27);
          v25 = v26++;
        }
        while (objc_msgSend(*(id *)((char *)&self->super.super.isa + v23), "count") > v25);
      }
      if (!objc_msgSend(v15, "count"))
        break;
      v30 = 0;
      v31 = 0;
      v32 = 0;
      do
      {
        v33 = v15;
        v34 = objc_msgSend(v15, "objectAtIndexedSubscript:", v30);
        v35 = v53 > 1;
        v36 = v53 > 1;
        if (objc_msgSend(*(id *)((char *)&self->super.super.isa + v23), "count") > v36)
        {
          v36 = v53 > 1;
          v37 = v53 > 1;
          while ((objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.isa + v23), "objectAtIndexedSubscript:", v36), "requestCounter:", v34) & 1) == 0)
          {
            v36 = ++v37;
            v35 = v37;
            if (objc_msgSend(*(id *)((char *)&self->super.super.isa + v23), "count") <= (unint64_t)v37)
              goto LABEL_35;
          }
          v35 = v37;
        }
LABEL_35:
        v38 = objc_msgSend(*(id *)((char *)&self->super.super.isa + v23), "count");
        if (v53 >= 2
          && v38 == v36
          && objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.isa + v23), "objectAtIndexedSubscript:", 0), "requestCounter:", v34))
        {
          v35 = 0;
        }
        v15 = v33;
        if (objc_msgSend(*(id *)((char *)&self->super.super.isa + v23), "count") <= (unint64_t)v35)
        {
          objc_msgSend(v52, "addObject:", v34);
        }
        else
        {
          objc_msgSend((id)objc_msgSend(v55, "objectAtIndexedSubscript:", v35), "addObject:", v34);
          v32 |= 1 << v35;
        }
        v30 = ++v31;
      }
      while (objc_msgSend(v33, "count") > (unint64_t)v31);
      v14 = v50;
      if (!v32)
        break;
      if (objc_msgSend(*(id *)((char *)&self->super.super.isa + v23), "count"))
      {
        v39 = 0;
        v40 = 1;
        do
        {
          if ((v32 & (1 << (v40 - 1))) == 0)
            objc_msgSend((id)objc_msgSend(v55, "objectAtIndexedSubscript:", v39), "removeAllObjects");
          v39 = v40++;
        }
        while (objc_msgSend(*(id *)((char *)&self->super.super.isa + v23), "count") > v39);
      }
      v7 = v49;
      objc_msgSend(v49, "addObject:", v55);
      v24 = 0x24BDBC000;
      if (!objc_msgSend(v52, "count"))
        goto LABEL_55;
      v15 = (void *)v56[++v51 & 1];
      v22 = (void *)v56[!(v51 & 1)];
    }
    objc_msgSend(v47, "addObjectsFromArray:", v15);
    v7 = v49;
  }
  else
  {
    v41 = (int)*MEMORY[0x24BE38FB0];
    objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(*(id *)((char *)&self->super.super.isa + v41), "count")));
    if (objc_msgSend(*(id *)((char *)&self->super.super.isa + v41), "count"))
    {
      v42 = 1;
      do
        objc_msgSend((id)objc_msgSend(v7, "objectAtIndexedSubscript:", 0, v45), "addObject:", v50);
      while (objc_msgSend(*(id *)((char *)&self->super.super.isa + v41), "count") > (unint64_t)v42++);
    }
    objc_msgSend(v48, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 1, v45), CFSTR("passNum"));
    objc_msgSend(v48, "setObject:forKeyedSubscript:", v7, CFSTR("passList"));
    if (!objc_msgSend(v9, "count"))
      goto LABEL_55;
  }
  objc_msgSend(v48, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v47, "count")), CFSTR("invalidNum"));
  objc_msgSend(v48, "setObject:forKeyedSubscript:", v47, CFSTR("invalidList"));
LABEL_55:
  objc_autoreleasePoolPop(context);
  if (!v45)
    return v48;
  (*((void (**)(AGXGPURawCounter *))self->_impl->var0 + 11))(self->_impl);
  v6 = v48;
  objc_msgSend(v48, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "count")), CFSTR("passNum"));
  objc_msgSend(v48, "setObject:forKeyedSubscript:", v7, CFSTR("passList"));
  return v6;
}

@end
