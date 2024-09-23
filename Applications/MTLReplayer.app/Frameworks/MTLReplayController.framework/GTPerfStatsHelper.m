@implementation GTPerfStatsHelper

- (GTPerfStatsHelper)initWithConfigurationVariables:(id)a3
{
  id v4;
  GTPerfStatsHelper *v5;
  NSDictionary *v6;
  NSDictionary *configVariables;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GTPerfStatsHelper;
  v5 = -[GTPerfStatsHelper init](&v9, "init");
  if (v5)
  {
    v6 = (NSDictionary *)objc_msgSend(v4, "copy");
    configVariables = v5->_configVariables;
    v5->_configVariables = v6;

  }
  return v5;
}

- (void)reset
{
  GTPerfStateGroup *begin;
  GTPerfStateGroup *end;

  begin = self->_perfStateGroups.__begin_;
  end = self->_perfStateGroups.__end_;
  while (begin != end)
  {
    objc_msgSend(*((id *)begin + 5), "removeAllObjects");
    *((_QWORD *)begin + 7) = *((_QWORD *)begin + 6);
    *((_QWORD *)begin + 11) = *((_QWORD *)begin + 10);
    begin = (GTPerfStateGroup *)((char *)begin + 152);
  }
}

- (GTPerfStatsHelper)initWithOutputPath:(id)a3
{
  id v5;
  GTPerfStatsHelper *v6;
  GTPerfStatsHelper *v7;
  GTPerfStatsHelper *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GTPerfStatsHelper;
  v6 = -[GTPerfStatsHelper init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_outputPath, a3);
    v8 = v7;
  }

  return v7;
}

- (id)_frequenciesForStateName:(const char *)a3 forReg:(unsigned int)a4
{
  const __CFString *v5;
  const __CFData *CFProperty;
  void *v7;
  uint64_t v8;
  unint64_t i;
  NSNumber *v10;
  void *v11;

  v5 = CFStringCreateWithCString(kCFAllocatorDefault, a3, 0x600u);
  CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(a4, v5, kCFAllocatorDefault, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 10));
  if (CFProperty)
  {
    CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    v8 = 0;
    for (i = 0; CFDataGetLength(CFProperty) >> 3 > i; ++i)
    {
      v10 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)&CFDataGetBytePtr(CFProperty)[v8]);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      objc_msgSend(v7, "addObject:", v11);

      v8 += 8;
    }
  }
  return v7;
}

- (BOOL)_collectOperatingPoints
{
  io_registry_entry_t v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  char *v15;
  char *v16;
  char *v17;
  _QWORD *v18;
  _QWORD *v19;
  _OWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  void *v23;
  unsigned int v24;
  int v25;
  uint64_t v26;
  NSMutableDictionary *socBlockBandwidths;
  char *v28;
  unint64_t v29;
  uint64_t v30;
  char *v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  void *i;
  void *v42;
  _QWORD *v43;
  _QWORD *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  uint64_t v52;
  void *j;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *__p;
  void *v60;
  char *v61;
  void *v62;
  char *v63;
  char *v64;
  id v65;
  GTPerfStatsHelper *v66;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _QWORD v76[3];
  _QWORD v77[3];
  _QWORD v78[3];
  _QWORD v79[3];
  _QWORD v80[3];
  _QWORD v81[5];
  id v82;
  io_registry_entry_t v83;
  _BYTE v84[128];
  _BYTE v85[128];
  _QWORD v86[2];
  _QWORD v87[2];
  char __str[128];

  CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (snprintf(__str, 0x80uLL, "%s%s", "IODeviceTree", ":/arm-io/pmgr") > 0x80)
    return 0;
  v66 = self;
  v3 = IORegistryEntryFromPath(kIOMainPortDefault, __str);
  if (!v3)
    return 0;
  v86[0] = CFSTR("GPU");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "voltage-states9"));
  v86[1] = CFSTR("AFR");
  v87[0] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "voltage-states31"));
  v87[1] = v5;
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v87, v86, 2));

  v81[0] = _NSConcreteStackBlock;
  v81[1] = 3221225472;
  v81[2] = __44__GTPerfStatsHelper__collectOperatingPoints__block_invoke;
  v81[3] = &unk_7256D0;
  v81[4] = v66;
  v83 = v3;
  v65 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 10));
  v82 = v65;
  objc_msgSend(v62, "enumerateKeysAndObjectsUsingBlock:", v81);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v66->_configVariables, "objectForKeyedSubscript:", CFSTR("num_cores")));
  v7 = objc_msgSend(v6, "unsignedIntValue");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v66->_configVariables, "objectForKeyedSubscript:", CFSTR("num_mgpus")));
  v9 = objc_msgSend(v8, "unsignedIntValue");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v66->_configVariables, "objectForKeyedSubscript:", CFSTR("gpu_gen")));
  v11 = objc_msgSend(v10, "unsignedIntValue");

  if (v9 <= 1)
    v12 = 1;
  else
    v12 = v9;
  v13 = v7 / v12 + 1;
  if ((v13 & 0xFFFFFFFC) != 0)
    v14 = v13 & 0xFFFFFFFC;
  else
    v14 = 1;
  v15 = (char *)operator new(0x18uLL);
  *(_OWORD *)v15 = xmmword_4A85F8;
  v64 = v15;
  *((_QWORD *)v15 + 2) = 4266;
  v16 = (char *)operator new(0x18uLL);
  *(_OWORD *)v16 = xmmword_4A8610;
  v61 = v16;
  *((_QWORD *)v16 + 2) = 2933;
  v17 = (char *)operator new(0x28uLL);
  *(_OWORD *)v17 = xmmword_4A8628;
  *((_OWORD *)v17 + 1) = unk_4A8638;
  v63 = v17;
  *((_QWORD *)v17 + 4) = 6400;
  v18 = operator new(0x18uLL);
  v80[1] = v18 + 3;
  v80[2] = v18 + 3;
  v18[2] = 400;
  *(_OWORD *)v18 = xmmword_4A8650;
  v58 = v18;
  v80[0] = v18;
  v19 = operator new(0x18uLL);
  v79[1] = v19 + 3;
  v79[2] = v19 + 3;
  v19[2] = 900;
  *(_OWORD *)v19 = xmmword_4A8668;
  v57 = v19;
  v79[0] = v19;
  v20 = operator new(0x20uLL);
  v78[1] = v20 + 2;
  v78[2] = v20 + 2;
  *v20 = xmmword_4A8680;
  v20[1] = unk_4A8690;
  v56 = v20;
  v78[0] = v20;
  v21 = operator new(0x18uLL);
  v77[1] = v21 + 3;
  v77[2] = v21 + 3;
  v21[2] = 900;
  *(_OWORD *)v21 = xmmword_4A86A0;
  v55 = v21;
  v77[0] = v21;
  v22 = operator new(0x18uLL);
  v76[1] = v22 + 3;
  v76[2] = v22 + 3;
  v22[2] = 1068;
  *(_OWORD *)v22 = xmmword_4A86B8;
  __p = v22;
  v76[0] = v22;
  v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 5));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 5));
  v24 = v13 >> 2;
  if (v13 < 4)
    v25 = 1;
  else
    v25 = v13 >> 2;
  v26 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 4));
  socBlockBandwidths = v66->_socBlockBandwidths;
  v66->_socBlockBandwidths = (NSMutableDictionary *)v26;

  -[NSMutableDictionary setObject:forKeyedSubscript:](v66->_socBlockBandwidths, "setObject:forKeyedSubscript:", &off_738B08, CFSTR("WriteReadRatio"));
  v28 = v63 + 40;
  v29 = (v9 * v25) << 6;
  v30 = 2 * v29;
  if (v24 == 2)
  {
    if (v11 <= 0xD)
    {
      if (v11 != 13 || v9 < 2)
      {
        if (v11 == 13)
          v32 = v77;
        else
          v32 = v79;
LABEL_27:
        v28 = v64 + 24;
        v33 = 2 * v29;
        v30 = (v9 * v25) << 6;
LABEL_40:
        v31 = v64;
LABEL_41:
        v35 = 2000000 * v9 * v14;
        do
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v35 * *(_QWORD *)v31));
          objc_msgSend(v67, "addObject:", v36);

          v31 += 8;
        }
        while (v31 != v28);
        v29 = v30;
        goto LABEL_44;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](v66->_socBlockBandwidths, "setObject:forKeyedSubscript:", &off_738B20, CFSTR("WriteReadRatio"));
    }
    else if (v9 < 2)
    {
      v32 = v76;
      v33 = 2 * v29;
      v30 = (v9 * v25) << 6;
LABEL_35:
      v31 = v63;
      goto LABEL_41;
    }
    if (v11 <= 0xD)
      v33 = 2 * v29;
    else
      v33 = 4 * v29;
    v32 = v76;
    goto LABEL_35;
  }
  if (v24 != 1)
  {
    if (!v24)
    {
      v31 = v61;
      v28 = v61 + 24;
      v30 = v29 >> 1;
      v32 = v80;
      v33 = (v9 * v25) << 6;
      goto LABEL_41;
    }
    v32 = v79;
    goto LABEL_27;
  }
  if (v11 <= 0xD)
  {
    if (v11 == 10)
      v33 = (v9 * v25) << 6;
    else
      v33 = 2 * v29;
    v30 = v29 >> (v11 == 10);
    v32 = v79;
    v28 = v64 + 24;
    goto LABEL_40;
  }
  if (v11 == 14)
  {
    v28 = v64 + 24;
    v31 = v64;
  }
  else
  {
    v31 = v63;
  }
  v32 = v78;
  v33 = 2 * v29;
  if (v31 != v28)
  {
    v30 = (v9 * v25) << 6;
    goto LABEL_41;
  }
LABEL_44:
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("AFR")));
  v60 = v37;
  if (v37)
  {
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v38 = v37;
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
    if (v39)
    {
      v40 = *(_QWORD *)v73;
      do
      {
        for (i = 0; i != v39; i = (char *)i + 1)
        {
          if (*(_QWORD *)v73 != v40)
            objc_enumerationMutation(v38);
          v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (_QWORD)objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)i), "unsignedLongLongValue")* v29));
          objc_msgSend(v23, "addObject:", v42);

        }
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
      }
      while (v39);
    }

  }
  else
  {
    v43 = (_QWORD *)*v32;
    v44 = (_QWORD *)v32[1];
    if (v43 != v44)
    {
      v45 = 1000000 * v29;
      do
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v45 * *v43));
        objc_msgSend(v23, "addObject:", v46);

        ++v43;
      }
      while (v43 != v44);
    }
  }
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("GPU")));
  v48 = v47;
  if (v47)
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v47, "count")));
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v50 = v48;
    v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
    if (v51)
    {
      v52 = *(_QWORD *)v69;
      do
      {
        for (j = 0; j != v51; j = (char *)j + 1)
        {
          if (*(_QWORD *)v69 != v52)
            objc_enumerationMutation(v50);
          v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (_QWORD)objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)j), "unsignedLongLongValue")* v33));
          objc_msgSend(v49, "addObject:", v54);

        }
        v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
      }
      while (v51);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](v66->_socBlockBandwidths, "setObject:forKeyedSubscript:", v49, CFSTR("GPU"));
    if (!v23)
      goto LABEL_68;
    goto LABEL_67;
  }
  v49 = 0;
  if (v23)
LABEL_67:
    -[NSMutableDictionary setObject:forKeyedSubscript:](v66->_socBlockBandwidths, "setObject:forKeyedSubscript:", v23, CFSTR("AFR"));
LABEL_68:
  if (v67)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v66->_socBlockBandwidths, "setObject:forKeyedSubscript:", v67, CFSTR("DCS"));

  operator delete(__p);
  operator delete(v55);
  operator delete(v56);
  operator delete(v57);
  operator delete(v58);
  operator delete(v63);
  operator delete(v61);
  operator delete(v64);

  return 1;
}

- (void)setup
{
  GTPerfStatsHelper *v2;
  GTPerfStateGroup *begin;
  vector<GTPerfStateGroup, std::allocator<GTPerfStateGroup>> *p_perfStateGroups;
  char *v5;
  void *v6;
  void *v7;
  void *v8;
  GTPerfStateGroup *end;
  int v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  GTPerfStateGroup *v16;
  int v17;
  id v18;
  GTPerfStateGroup *v19;
  void *v20;
  void *v21;
  void *v22;
  GTPerfStateGroup *v23;
  int v24;
  id v25;
  GTPerfStateGroup *v26;
  GTPerfStateGroup *v27;
  GTPerfStateGroup *i;
  const void *v29;
  int ChannelCount;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  char *v41;
  char *v42;
  __int128 v43;
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[5];
  void *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void *v51;
  __compressed_pair<GTPerfStateGroup *, std::allocator<GTPerfStateGroup>> *p_end_cap;
  GTPerfStateGroup *v53;
  const __CFString *v54;
  void *v55;
  const __CFString *v56;
  void *v57;
  const __CFString *v58;
  void *v59;

  v2 = self;
  p_perfStateGroups = &self->_perfStateGroups;
  begin = self->_perfStateGroups.__begin_;
  if (0x86BCA1AF286BCA1BLL * ((self->_perfStateGroups.__end_cap_.__value_ - begin) >> 3) <= 2)
  {
    v5 = (char *)(self->_perfStateGroups.__end_ - begin);
    p_end_cap = &self->_perfStateGroups.__end_cap_;
    v48 = operator new(0x1C8uLL);
    v49 = (uint64_t)&v5[(_QWORD)v48];
    v50 = (uint64_t (*)(uint64_t, uint64_t))&v5[(_QWORD)v48];
    v51 = (char *)v48 + 456;
    std::vector<GTPerfStateGroup>::__swap_out_circular_buffer(p_perfStateGroups, &v48);
    std::__split_buffer<GTPerfStateGroup>::~__split_buffer((uint64_t)&v48);
    v2 = self;
  }
  v58 = CFSTR("Perf Counters");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("GFX"), 0));
  v59 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1));
  v8 = v7;
  end = v2->_perfStateGroups.__end_;
  v10 = 678152731 * ((unint64_t)(end - v2->_perfStateGroups.__begin_) >> 3);
  if (end >= v2->_perfStateGroups.__end_cap_.__value_)
  {
    v12 = std::vector<GTPerfStateGroup>::__emplace_back_slow_path<NSString * {__strong},NSDictionary * {__strong},GTPerfStateGroup::eGTPerfStateGroup,GTPerfStateGroup::eGTPerfStateGroupType>(p_perfStateGroups, CFSTR("AMC Stats"), v7, 678152731 * ((unint64_t)(end - v2->_perfStateGroups.__begin_) >> 3), 0);
  }
  else
  {
    v11 = v7;
    *(_QWORD *)end = 0;
    *((_QWORD *)end + 1) = 0;
    *((_QWORD *)end + 3) = CFSTR("AMC Stats");
    *((_QWORD *)end + 4) = v11;
    *(_OWORD *)((char *)end + 40) = 0u;
    *(_OWORD *)((char *)end + 56) = 0u;
    *((_DWORD *)end + 18) = v10;
    *((_OWORD *)end + 7) = 0u;
    *((_OWORD *)end + 8) = 0u;
    *(_QWORD *)((char *)end + 141) = 0;
    v12 = (uint64_t)end + 152;
    *(_QWORD *)((char *)end + 76) = 0;
    *(_QWORD *)((char *)end + 92) = 0;
    *(_QWORD *)((char *)end + 84) = 0;
    *((_DWORD *)end + 25) = 0;
    v2->_perfStateGroups.__end_ = (GTPerfStateGroup *)((char *)end + 152);
  }
  v2->_perfStateGroups.__end_ = (GTPerfStateGroup *)v12;

  v56 = CFSTR("GPU");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("GPUPH"), CFSTR("PWRCTRL"), 0));
  v57 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1));
  v15 = v14;
  v16 = self->_perfStateGroups.__end_;
  v17 = 678152731 * ((unint64_t)(v16 - self->_perfStateGroups.__begin_) >> 3);
  if (v16 >= self->_perfStateGroups.__end_cap_.__value_)
  {
    v19 = (GTPerfStateGroup *)std::vector<GTPerfStateGroup>::__emplace_back_slow_path<NSString * {__strong},NSDictionary * {__strong},GTPerfStateGroup::eGTPerfStateGroup,GTPerfStateGroup::eGTPerfStateGroupType>(p_perfStateGroups, CFSTR("GPU Stats"), v14, 678152731* ((unint64_t)(v16 - self->_perfStateGroups.__begin_) >> 3), 1);
  }
  else
  {
    v18 = v14;
    *(_QWORD *)v16 = 0;
    *((_QWORD *)v16 + 1) = 0;
    *((_QWORD *)v16 + 3) = CFSTR("GPU Stats");
    *((_QWORD *)v16 + 4) = v18;
    *(_OWORD *)((char *)v16 + 40) = 0u;
    *(_OWORD *)((char *)v16 + 56) = 0u;
    *((_DWORD *)v16 + 18) = v17;
    *((_DWORD *)v16 + 19) = 1;
    *((_QWORD *)v16 + 11) = 0;
    *((_QWORD *)v16 + 12) = 0;
    *((_QWORD *)v16 + 10) = 0;
    *((_OWORD *)v16 + 7) = 0u;
    *((_OWORD *)v16 + 8) = 0u;
    *(_QWORD *)((char *)v16 + 141) = 0;
    v19 = (GTPerfStateGroup *)((char *)v16 + 152);
    self->_perfStateGroups.__end_ = (GTPerfStateGroup *)((char *)v16 + 152);
  }
  self->_perfStateGroups.__end_ = v19;

  v54 = CFSTR("Events");
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("SOC"), CFSTR("DCS"), CFSTR("AFR"), 0));
  v55 = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1));
  v22 = v21;
  v23 = self->_perfStateGroups.__end_;
  v24 = 678152731 * ((unint64_t)(v23 - self->_perfStateGroups.__begin_) >> 3);
  if (v23 >= self->_perfStateGroups.__end_cap_.__value_)
  {
    v26 = (GTPerfStateGroup *)std::vector<GTPerfStateGroup>::__emplace_back_slow_path<NSString * {__strong},NSDictionary * {__strong},GTPerfStateGroup::eGTPerfStateGroup,GTPerfStateGroup::eGTPerfStateGroupType>(p_perfStateGroups, CFSTR("SoC Stats"), v21, 678152731* ((unint64_t)(v23 - self->_perfStateGroups.__begin_) >> 3), 2);
  }
  else
  {
    v25 = v21;
    *(_QWORD *)v23 = 0;
    *((_QWORD *)v23 + 1) = 0;
    *((_QWORD *)v23 + 3) = CFSTR("SoC Stats");
    *((_QWORD *)v23 + 4) = v25;
    *(_OWORD *)((char *)v23 + 40) = 0u;
    *(_OWORD *)((char *)v23 + 56) = 0u;
    *((_DWORD *)v23 + 18) = v24;
    *((_DWORD *)v23 + 19) = 2;
    *((_QWORD *)v23 + 11) = 0;
    *((_QWORD *)v23 + 12) = 0;
    *((_QWORD *)v23 + 10) = 0;
    *((_OWORD *)v23 + 7) = 0u;
    *((_OWORD *)v23 + 8) = 0u;
    *(_QWORD *)((char *)v23 + 141) = 0;
    v26 = (GTPerfStateGroup *)((char *)v23 + 152);
    self->_perfStateGroups.__end_ = (GTPerfStateGroup *)((char *)v23 + 152);
  }
  self->_perfStateGroups.__end_ = v26;

  v27 = self->_perfStateGroups.__begin_;
  for (i = self->_perfStateGroups.__end_; v27 != i; v27 = (GTPerfStateGroup *)((char *)v27 + 152))
  {
    v29 = (const void *)IOReportCopyChannelsInCategories(2, 0, 0);
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = ___ZN16GTPerfStateGroup5SetupEP14__CFDictionary_block_invoke;
    v47[3] = &__block_descriptor_40_e25_i16__0____CFDictionary__8l;
    v47[4] = v27;
    if ((IOReportPrune(v29, v47) & 1) == 0)
    {
      v45 = 0;
      v46 = 0;
      *((_QWORD *)v27 + 2) = IOReportCreateSubscription(0, v29, &v46, 0, &v45);
      ChannelCount = IOReportGetChannelCount(v46);
      v31 = (void *)*((_QWORD *)v27 + 1);
      *((_DWORD *)v27 + 36) = ChannelCount;
      *((_QWORD *)v27 + 1) = v46;

      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v27 + 1), "objectForKeyedSubscript:", CFSTR("IOReportChannels")));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_7391D0, "allKeys"));
      if (v32)
      {
        v34 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (*((_DWORD *)v27 + 36) + 1)));
        v35 = (void *)*((_QWORD *)v27 + 17);
        *((_QWORD *)v27 + 17) = v34;

        if (!*((_DWORD *)v27 + 19))
          objc_msgSend(*((id *)v27 + 17), "addObject:", CFSTR("Sample Time"));
        v36 = *((_QWORD *)v27 + 1);
        v48 = _NSConcreteStackBlock;
        v49 = 3221225472;
        v50 = ___ZN16GTPerfStateGroup27_FindSubscribedCounterNamesEv_block_invoke;
        v51 = &unk_725718;
        p_end_cap = (__compressed_pair<GTPerfStateGroup *, std::allocator<GTPerfStateGroup>> *)&off_7391D0;
        v53 = v27;
        IOReportPrune(v36, &v48);

      }
      if ((*((_DWORD *)v27 + 19) - 1) <= 1)
      {
        v37 = *((_QWORD *)v27 + 10);
        if (0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v27 + 12) - v37) >> 3) <= 0x3FF)
        {
          v38 = *((_QWORD *)v27 + 11);
          v39 = (char *)operator new(0x6000uLL);
          v40 = (char *)*((_QWORD *)v27 + 11);
          v41 = (char *)*((_QWORD *)v27 + 10);
          v42 = &v39[24 * ((v38 - v37) / 24)];
          if (v40 != v41)
          {
            do
            {
              v43 = *(_OWORD *)(v40 - 24);
              *((_QWORD *)v42 - 1) = *((_QWORD *)v40 - 1);
              *(_OWORD *)(v42 - 24) = v43;
              v42 -= 24;
              v40 -= 24;
            }
            while (v40 != v41);
            v40 = v41;
          }
          *((_QWORD *)v27 + 10) = v42;
          *((_QWORD *)v27 + 11) = &v39[24 * ((v38 - v37) / 24)];
          *((_QWORD *)v27 + 12) = v39 + 24576;
          if (v40)
            operator delete(v40);
        }
      }
    }
    CFRelease(v29);
  }
  -[GTPerfStatsHelper _collectOperatingPoints](self, "_collectOperatingPoints");
  mach_timebase_info(&self->_timebaseInfo);
}

- (void)startCollectingPerfStatsAtInterval:(unint64_t)a3 andPeriodicSamplesAtInterval:(unint64_t)a4
{
  GTPerfStateGroup *begin;
  GTPerfStateGroup *end;
  BOOL v8;
  int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t Samples;
  dispatch_queue_attr_t v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  dispatch_time_t v21;
  void *v22;
  _QWORD v23[8];
  _QWORD v24[3];
  int v25;
  _QWORD v26[6];

  begin = self->_perfStateGroups.__begin_;
  end = self->_perfStateGroups.__end_;
  if (begin != end)
  {
    v8 = a4 != 0;
    do
    {
      *((_BYTE *)begin + 148) = v8;
      v9 = *((_DWORD *)begin + 19);
      if (v9 != 1)
      {
        if (!a4)
          goto LABEL_18;
        if (!v9)
        {
          v10 = a4;
LABEL_9:
          v11 = *((unsigned int *)begin + 36);
          if ((int)v11 >= 1)
          {
            if (v9 == 2)
              v12 = v10 >> 2;
            else
              v12 = v10;
            v13 = *((_QWORD *)begin + 1);
            v14 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0x2540BE400 / v12 * v11));
            v15 = (void *)*((_QWORD *)begin + 5);
            *((_QWORD *)begin + 5) = v14;

            std::vector<unsigned long long>::reserve((void **)begin + 6, 0x2540BE400 / v12 * (*((_DWORD *)begin + 36) + 1));
            Samples = IOReportCreateSamples(*((_QWORD *)begin + 2), v13, 0);
            *((_QWORD *)begin + 13) = Samples;
            if (!*((_DWORD *)begin + 19))
            {
              v26[0] = _NSConcreteStackBlock;
              v26[1] = 3221225472;
              v26[2] = ___ZN16GTPerfStateGroup20StartCollectingStatsEy_block_invoke;
              v26[3] = &__block_descriptor_40_e25_v16__0____CFDictionary__8l;
              v26[4] = begin;
              IOReportIterate(Samples, v26);
            }
            v17 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
            v18 = objc_claimAutoreleasedReturnValue(v17);
            v19 = dispatch_queue_create("reporting_queue", v18);

            v24[0] = 0;
            v24[1] = v24;
            v24[2] = 0x2020000000;
            v25 = 0;
            v23[0] = _NSConcreteStackBlock;
            v23[1] = 3221225472;
            v23[2] = ___ZN16GTPerfStateGroup20StartCollectingStatsEy_block_invoke_2;
            v23[3] = &unk_725760;
            v23[4] = v24;
            v23[5] = begin;
            v23[6] = 0x2540BE400 / v12;
            v23[7] = v13;
            v20 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v19);
            if (v20)
            {
              v21 = dispatch_time(0, v12);
              dispatch_source_set_timer(v20, v21, v12, 0);
              dispatch_source_set_event_handler(v20, v23);
              dispatch_resume(v20);
            }
            v22 = *(void **)begin;
            *(_QWORD *)begin = v20;

            _Block_object_dispose(v24, 8);
          }
          goto LABEL_18;
        }
      }
      v10 = a3;
      if (a3)
        goto LABEL_9;
LABEL_18:
      begin = (GTPerfStateGroup *)((char *)begin + 152);
    }
    while (begin != end);
  }
}

- (void)stopCollectingStats
{
  GTPerfStateGroup *begin;
  GTPerfStateGroup *end;
  dispatch_source_t v4;

  begin = self->_perfStateGroups.__begin_;
  end = self->_perfStateGroups.__end_;
  while (begin != end)
  {
    if (*(_QWORD *)begin)
    {
      dispatch_source_cancel(*(dispatch_source_t *)begin);
      v4 = *(dispatch_source_t *)begin;
      *(_QWORD *)begin = 0;

    }
    begin = (GTPerfStateGroup *)((char *)begin + 152);
  }
}

- (void)gatherStats
{
  GTPerfStateGroup *begin;
  GTPerfStateGroup *end;
  int v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, uint64_t);
  void *v15;
  uint64_t *v16;
  GTPerfStateGroup *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void *v21;

  begin = self->_perfStateGroups.__begin_;
  end = self->_perfStateGroups.__end_;
  if (begin != end)
  {
    while (1)
    {
      v4 = *((_DWORD *)begin + 19);
      if (!v4)
        break;
      if (v4 == 2)
      {
        v18 = 0;
        v19 = &v18;
        v20 = 0x2020000000;
        v21 = 0;
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)begin + 5), "firstObject"));

        v21 = v10;
        v6 = objc_alloc_init((Class)NSNumberFormatter);
        objc_msgSend(v6, "setNumberStyle:", 1);
        v11 = (void *)*((_QWORD *)begin + 5);
        v12 = _NSConcreteStackBlock;
        v13 = 3221225472;
        v14 = ___ZN16GTPerfStateGroup29_GatherSampleDataSOCPerfStateERK18mach_timebase_info_block_invoke;
        v15 = &unk_7257D0;
        v16 = &v18;
        v17 = begin;
        objc_msgSend(v11, "enumerateObjectsUsingBlock:", &v12);
        goto LABEL_8;
      }
      if (v4 == 1)
      {
        v18 = 0;
        v19 = &v18;
        v20 = 0x2020000000;
        v21 = 0;
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)begin + 5), "firstObject"));

        v21 = v5;
        v6 = objc_alloc_init((Class)NSNumberFormatter);
        objc_msgSend(v6, "setNumberStyle:", 1);
        v7 = (void *)*((_QWORD *)begin + 5);
        v12 = _NSConcreteStackBlock;
        v13 = 3221225472;
        v14 = ___ZN16GTPerfStateGroup26_GatherSampleDataPerfStateERK18mach_timebase_info_block_invoke;
        v15 = &unk_7257D0;
        v16 = &v18;
        v17 = begin;
        objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v12);
LABEL_8:

        _Block_object_dispose(&v18, 8);
      }
      begin = (GTPerfStateGroup *)((char *)begin + 152);
      if (begin == end)
        return;
    }
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)begin + 5), "firstObject"));

    v21 = v8;
    v6 = objc_alloc_init((Class)NSNumberFormatter);
    objc_msgSend(v6, "setNumberStyle:", 1);
    v9 = (void *)*((_QWORD *)begin + 5);
    v12 = _NSConcreteStackBlock;
    v13 = 3221225472;
    v14 = ___ZN16GTPerfStateGroup32_GatherSampleDataPeriodicSamplesERK18mach_timebase_info_block_invoke;
    v15 = &unk_725860;
    v16 = &v18;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", &v12);
    goto LABEL_8;
  }
}

- (id)exportStats
{
  void *v3;
  void *v4;
  void *v5;
  GTPerfStateGroup *begin;
  GTPerfStateGroup *end;
  char v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSMutableDictionary *socBlockBandwidths;
  void *v23;
  id v24;
  NSDictionary *configVariables;
  void *v26;
  id v27;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[2];

  v3 = objc_autoreleasePoolPush();
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0x86BCA1AF286BCA1BLL * ((self->_perfStateGroups.__end_ - self->_perfStateGroups.__begin_) >> 3) + 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0x86BCA1AF286BCA1BLL * ((self->_perfStateGroups.__end_ - self->_perfStateGroups.__begin_) >> 3)));
  begin = self->_perfStateGroups.__begin_;
  end = self->_perfStateGroups.__end_;
  if (begin == end)
    goto LABEL_13;
  v8 = 0;
  do
  {
    v9 = *((_DWORD *)begin + 19);
    if ((v9 - 1) < 2)
    {
      v10 = *((_QWORD *)begin + 10);
      v11 = *((_QWORD *)begin + 11);
      if (v10 == v11)
        goto LABEL_10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", v10, v11 - v10));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, *((_QWORD *)begin + 3));
      goto LABEL_9;
    }
    if (!v9)
    {
      v13 = *((_QWORD *)begin + 6);
      v14 = *((_QWORD *)begin + 7);
      if (v13 != v14)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", v13, v14 - v13));
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, *((_QWORD *)begin + 3));
        v8 = 1;
LABEL_9:

      }
    }
LABEL_10:
    objc_msgSend(v5, "setObject:forKeyedSubscript:", *((_QWORD *)begin + 17), *((_QWORD *)begin + 3));
    begin = (GTPerfStateGroup *)((char *)begin + 152);
  }
  while (begin != end);
  if ((v8 & 1) != 0)
  {
    v33 = 0;
    v15 = objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v33));
    v16 = v33;
    v29 = (void *)v15;
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("Group Counters"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_timebaseInfo.numer));
    v34[0] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_timebaseInfo.denom));
    v34[1] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 2));

    v32 = v16;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v19, 1, &v32));
    v21 = v32;

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("Time Base Info"));
    socBlockBandwidths = self->_socBlockBandwidths;
    v31 = v21;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", socBlockBandwidths, 1, &v31));
    v24 = v31;

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("BW Info"));
    configVariables = self->_configVariables;
    v30 = v24;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", configVariables, 1, &v30));
    v27 = v30;

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, CFSTR("Configuration"));
  }
LABEL_13:

  objc_autoreleasePoolPop(v3);
  return v4;
}

- (void).cxx_destruct
{
  GTPerfStateGroup *begin;
  GTPerfStateGroup *end;
  GTPerfStateGroup *v5;

  objc_storeStrong((id *)&self->_socBlockBandwidths, 0);
  objc_storeStrong((id *)&self->_configVariables, 0);
  begin = self->_perfStateGroups.__begin_;
  if (begin)
  {
    end = self->_perfStateGroups.__end_;
    v5 = self->_perfStateGroups.__begin_;
    if (end != begin)
    {
      do
        GTPerfStateGroup::~GTPerfStateGroup((GTPerfStateGroup *)((char *)end - 152));
      while (end != begin);
      v5 = self->_perfStateGroups.__begin_;
    }
    self->_perfStateGroups.__end_ = begin;
    operator delete(v5);
  }
  objc_storeStrong((id *)&self->_outputPath, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

void __44__GTPerfStatsHelper__collectOperatingPoints__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = objc_retainAutorelease(v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_frequenciesForStateName:forReg:", objc_msgSend(v7, "UTF8String"), *(unsigned int *)(a1 + 48)));
  if (objc_msgSend(v8, "count"))
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, v9);

}

@end
