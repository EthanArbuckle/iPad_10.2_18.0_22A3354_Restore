@implementation DTGPUCounterProfile_GPURawCounters

+ (id)_supportedProfileNameFromEnum:(unint64_t)a3 vendor:(unsigned int)a4
{
  if (a3 == 4)
  {
    if (a4 == 2)
      return CFSTR("Set2");
    else
      return 0;
  }
  else if (a3 == 3 && a4 < 3)
  {
    return off_24EB2B158[a4];
  }
  else
  {
    return 0;
  }
}

+ (id)_sourceNameFromProfile:(unint64_t)a3
{
  if (a3 - 5 > 8)
    return 0;
  else
    return off_24EB2B170[a3 - 5];
}

+ (id)create:(id)a3 profile:(unint64_t)a4
{
  id v5;
  DTGPUCounterProfile_GPURawCounters *v6;
  void *v7;
  DTGPUCounterProfile_GPURawCounters *v8;
  DTGPUCounterProfile_GPURawCounters *v9;

  v5 = a3;
  v6 = 0;
  switch(a4)
  {
    case 1uLL:
    case 3uLL:
    case 4uLL:
      v8 = -[DTGPUCounterProfile_GPURawCounters initWithDevice:profile:]([DTGPUCounterProfile_GPURawCounters alloc], "initWithDevice:profile:", v5, a4);
      goto LABEL_14;
    case 2uLL:
      v8 = -[DTGPUCounterProfile_GPURawCounters initWithLimitersProfile:]([DTGPUCounterProfile_GPURawCounters alloc], "initWithLimitersProfile:", v5);
      goto LABEL_14;
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
      +[DTGPUCounterProfile_GPURawCounters _sourceNameFromProfile:](DTGPUCounterProfile_GPURawCounters, "_sourceNameFromProfile:", a4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7
        || +[DTGPUCounterProfile_GPURawCounters vendorFromDevice:](DTGPUCounterProfile_GPURawCounters, "vendorFromDevice:", v5))
      {
        goto LABEL_4;
      }
      v9 = -[DTGPUCounterProfile_GPURawCounters initWithDevice:sourceName:profile:]([DTGPUCounterProfile_GPURawCounters alloc], "initWithDevice:sourceName:profile:", v5, v7, a4);
      goto LABEL_7;
    case 0xCuLL:
      +[DTGPUCounterProfile_GPURawCounters _sourceNameFromProfile:](DTGPUCounterProfile_GPURawCounters, "_sourceNameFromProfile:", 12);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7
        && +[DTGPUCounterProfile_GPURawCounters vendorFromDevice:](DTGPUCounterProfile_GPURawCounters, "vendorFromDevice:", v5) == 1)
      {
        v9 = -[DTGPUCounterProfile_GPURawCounters initWithDevice:sourceName:profile:]([DTGPUCounterProfile_GPURawCounters alloc], "initWithDevice:sourceName:profile:", v5, v7, 12);
LABEL_7:
        v6 = v9;
      }
      else
      {
LABEL_4:
        v6 = 0;
      }

LABEL_15:
      return v6;
    case 0xDuLL:
      v8 = -[DTGPUCounterProfile initWithProfile:device:]([DTGPUCounterProfile_GPURawCountersAPS alloc], "initWithProfile:device:", 13, v5);
LABEL_14:
      v6 = v8;
      goto LABEL_15;
    default:
      goto LABEL_15;
  }
}

+ (unsigned)vendorFromDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;

  v3 = a3;
  objc_msgSend(v3, "vendorName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "supportsFamily:", 1001) & 1) != 0)
  {
    v6 = 2;
  }
  else if (objc_msgSend(v5, "rangeOfString:", CFSTR("intel")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(v5, "rangeOfString:", CFSTR("amd")) == 0x7FFFFFFFFFFFFFFFLL)
      v6 = 3;
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (DTGPUCounterProfile_GPURawCounters)initWithDevice:(id)a3 profile:(unint64_t)a4
{
  DTGPUCounterProfile_GPURawCounters *v6;
  DTGPUCounterProfile_GPURawCounters *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSMutableDictionary *gpuConfigurationVariables;
  NSMutableDictionary *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSMutableDictionary *v21;
  NSMutableDictionary *v22;
  NSMutableDictionary *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  int8x8_t v30;
  uint8x8_t v31;
  __int32 v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  uint64_t v38;
  void *v39;
  __CFString *v40;
  __CFString *v41;
  __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  int v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  unint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  _BOOL4 v68;
  void *v69;
  DTGPUCounterProfile_GPURawCounters *v70;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  NSString *sourceName;
  void *v81;
  void *v82;
  void *v83;
  DTGPUCounter *v84;
  void *v85;
  void *v86;
  void *v87;
  DTGPUCounter *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  int v92;
  void *v93;
  void *v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t k;
  uint64_t v99;
  void *v100;
  _BOOL4 v101;
  void *v102;
  BOOL v103;
  void *v104;
  uint64_t v105;
  DTGPURawCounter_GPURawCounter *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  id v115;
  void *v116;
  void *v117;
  __CFString *v118;
  void *CFProperty;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  id v123;
  void *v124;
  void *v125;
  void *v126;
  id v127;
  uint64_t j;
  id v129;
  id obj;
  void *v131;
  DTGPUCounter *v132;
  void *v133;
  DTGPUCounterProfile_GPURawCounters *v134;
  __CFString *v135;
  id *p_device;
  void *v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  objc_super v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  _BYTE v155[128];
  _BYTE v156[128];
  _BYTE v157[128];
  _QWORD v158[3];
  _BYTE v159[128];
  uint64_t v160;

  v160 = *MEMORY[0x24BDAC8D0];
  v150.receiver = self;
  v150.super_class = (Class)DTGPUCounterProfile_GPURawCounters;
  v127 = a3;
  v6 = -[DTGPUCounterProfile initWithProfile:device:](&v150, sel_initWithProfile_device_, a4);
  v7 = v6;
  v134 = v6;
  if (!v6)
    goto LABEL_74;
  p_device = (id *)&v6->_device;
  objc_storeStrong((id *)&v6->_device, a3);
  v7 = v134;
  v8 = +[DTGPUCounterProfile_GPURawCounters vendorFromDevice:](DTGPUCounterProfile_GPURawCounters, "vendorFromDevice:", v127);
  v134->_vendor = v8;
  if (a4 == 1)
  {
    -[DTGPUCounterProfile setDefaultSampleInterval:](v134, "setDefaultSampleInterval:", 10000, v8);
LABEL_74:
    v70 = v7;
    goto LABEL_75;
  }
  +[DTGPUCounterProfile_GPURawCounters _supportedProfileNameFromEnum:vendor:](DTGPUCounterProfile_GPURawCounters, "_supportedProfileNameFromEnum:vendor:", a4, v8);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  if (v116 || v134->_vendor != 2)
  {
    v123 = v127;
    CFProperty = (void *)IORegistryEntryCreateCFProperty(objc_msgSend(v123, "acceleratorPort"), CFSTR("MetalPluginName"), 0, 0);
    v122 = (void *)IORegistryEntryCreateCFProperty(objc_msgSend(v123, "acceleratorPort"), CFSTR("MetalStatisticsName"), 0, 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v122;
      if (objc_msgSend(v9, "count"))
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
        v135 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v135 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_14:
        v135 = CFSTR("MetalStatistics");
LABEL_15:
        v10 = (void *)GRCCopyAllCounterSourceGroup();
        v112 = v10;
        if (objc_msgSend(v10, "count"))
        {
          objc_msgSend(v10, "firstObject");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)MEMORY[0x24BDBCED8];
          objc_msgSend(v11, "features");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("ConstantAGX_CoreConfig"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "dictionaryWithDictionary:", v14);
          v15 = objc_claimAutoreleasedReturnValue();
          gpuConfigurationVariables = v134->_gpuConfigurationVariables;
          v134->_gpuConfigurationVariables = (NSMutableDictionary *)v15;

        }
        v17 = v134->_gpuConfigurationVariables;
        if (!v17 || !-[NSMutableDictionary count](v17, "count"))
        {
          v18 = (void *)MEMORY[0x24BDBCED8];
          v19 = (void *)IORegistryEntryCreateCFProperty(objc_msgSend(v123, "acceleratorPort"), CFSTR("GPUConfigurationVariable"), 0, 0);
          objc_msgSend(v18, "dictionaryWithDictionary:", v19);
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = v134->_gpuConfigurationVariables;
          v134->_gpuConfigurationVariables = (NSMutableDictionary *)v20;

        }
        GRCReleaseAllCounterSourceGroup();
        v22 = v134->_gpuConfigurationVariables;
        v23 = v22;
        if (v22)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", CFSTR("core_mask_list"));
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)objc_opt_new();
          if (v131 && objc_msgSend(v131, "count"))
          {
            v153 = 0u;
            v154 = 0u;
            v151 = 0u;
            v152 = 0u;
            v25 = v131;
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v151, v159, 16);
            v27 = 0;
            if (v26)
            {
              v28 = *(_QWORD *)v152;
              do
              {
                for (i = 0; i != v26; ++i)
                {
                  if (*(_QWORD *)v152 != v28)
                    objc_enumerationMutation(v25);
                  v30.i32[0] = objc_msgSend(*(id *)(*((_QWORD *)&v151 + 1) + 8 * i), "unsignedIntValue");
                  v31 = (uint8x8_t)vcnt_s8(v30);
                  v31.i16[0] = vaddlv_u8(v31);
                  v32 = v31.i32[0];
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v31.u32[0]);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "addObject:", v33);

                  v27 = (v32 + v27);
                }
                v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v151, v159, 16);
              }
              while (v26);
            }

            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v27);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v34, CFSTR("num_cores"));

            -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v24, CFSTR("num_cores_per_ringbuffer"));
          }

        }
        if (!v134->_vendor)
        {
          objc_msgSend(*p_device, "name");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "containsString:", CFSTR("Iris"));

          if (objc_msgSend(CFProperty, "rangeOfString:", CFSTR("KBL")) == 0x7FFFFFFFFFFFFFFFLL
            && objc_msgSend(CFProperty, "rangeOfString:", CFSTR("SKL")) == 0x7FFFFFFFFFFFFFFFLL
            && objc_msgSend(CFProperty, "rangeOfString:", CFSTR("BDW")) == 0x7FFFFFFFFFFFFFFFLL)
          {
            if (objc_msgSend(CFProperty, "rangeOfString:", CFSTR("HSW")) == 0x7FFFFFFFFFFFFFFFLL)
            {
              if (objc_msgSend(CFProperty, "rangeOfString:", CFSTR("ICL")) != 0x7FFFFFFFFFFFFFFFLL)
                -[NSMutableDictionary setObject:forKeyedSubscript:](v134->_gpuConfigurationVariables, "setObject:forKeyedSubscript:", &unk_24EB4EC78, CFSTR("EUCoreCount"));
              goto LABEL_43;
            }
            v37 = (void *)MEMORY[0x24BDD16E0];
            if (v36)
              v38 = 40;
            else
              v38 = 20;
          }
          else
          {
            v37 = (void *)MEMORY[0x24BDD16E0];
            if (v36)
              v38 = 48;
            else
              v38 = 24;
          }
          objc_msgSend(v37, "numberWithInt:", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v134->_gpuConfigurationVariables, "setObject:forKeyedSubscript:", v39, CFSTR("EUCoreCount"));

        }
LABEL_43:
        v40 = (__CFString *)IORegistryEntryCreateCFProperty(objc_msgSend(v123, "acceleratorPort"), CFSTR("AGXInternalPerfCounterResourcesPath"), 0, 0);
        v41 = v40;
        v42 = CFSTR("/AppleInternal/Library/AGX/Performance");
        if (v40)
          v42 = v40;
        v118 = v42;

        -[__CFString stringByAppendingPathComponent:](v118, "stringByAppendingPathComponent:", CFProperty);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v158[0] = v43;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/System/Library/Extensions/%@.bundle"), CFProperty);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v158[1] = v44;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/System/Library/Extensions/%@.bundle/Contents/Resources"), CFProperty);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v158[2] = v45;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v158, 3);
        v113 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        v148 = 0u;
        v149 = 0u;
        v146 = 0u;
        v147 = 0u;
        obj = v113;
        v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v146, v157, 16);
        if (v46)
        {
          v47 = 0;
          v48 = 0;
          v49 = *(_QWORD *)v147;
          while (2)
          {
            v50 = 0;
            v51 = (void *)v47;
            v52 = (void *)v48;
            do
            {
              if (*(_QWORD *)v147 != v49)
                objc_enumerationMutation(obj);
              objc_msgSend(*(id *)(*((_QWORD *)&v146 + 1) + 8 * v50), "stringByAppendingPathComponent:", v135);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "stringByAppendingString:", CFSTR("-counters.plist"));
              v54 = objc_claimAutoreleasedReturnValue();

              v55 = (void *)v54;
              objc_msgSend(v53, "stringByAppendingString:", CFSTR("-derived.js"));
              v56 = objc_claimAutoreleasedReturnValue();

              v57 = (void *)v56;
              if (objc_msgSend(v137, "fileExistsAtPath:", v55)
                && (objc_msgSend(v137, "fileExistsAtPath:", v56) & 1) != 0)
              {
                v47 = v56;
                v48 = (uint64_t)v55;
LABEL_60:

                goto LABEL_61;
              }
              objc_msgSend(v55, "stringByReplacingOccurrencesOfString:withString:", CFSTR("AGXMetalStatistics"), CFSTR("AGXMetalStatisticsExternal"));
              v48 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(v57, "stringByReplacingOccurrencesOfString:withString:", CFSTR("AGXMetalStatistics"), CFSTR("AGXMetalStatisticsExternal"));
              v47 = objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v137, "fileExistsAtPath:", v48)
                && objc_msgSend(v137, "fileExistsAtPath:", v47))
              {
                goto LABEL_60;
              }

              ++v50;
              v51 = (void *)v47;
              v52 = (void *)v48;
            }
            while (v46 != v50);
            v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v146, v157, 16);
            if (v46)
              continue;
            break;
          }
LABEL_61:
          v114 = (void *)v47;
          v117 = (void *)v48;

          v58 = 1;
          v60 = v48;
          if (!v48)
            goto LABEL_71;
          v61 = (void *)v47;
          if (!v47
            || !objc_msgSend(v137, "fileExistsAtPath:", v117)
            || !objc_msgSend(v137, "fileExistsAtPath:", v47))
          {
LABEL_72:

            v7 = v134;
            if (!v58)
              goto LABEL_74;
            goto LABEL_73;
          }
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v60);
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("DerivedCounters"));
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("Instruments"));
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v111, "objectForKeyedSubscript:", CFSTR("DefaultSamplingInterval"));
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = objc_msgSend(v63, "unsignedIntegerValue");

          v65 = 50;
          if (v64 > 0x32)
            v65 = v64;
          -[DTGPUCounterProfile setDefaultSampleInterval:](v134, "setDefaultSampleInterval:", 1000 * v65);
          objc_msgSend(v111, "objectForKeyedSubscript:", CFSTR("Profiles"));
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v110 = v66;
          if (objc_msgSend(v66, "count"))
          {
            if (!v116
              || (objc_msgSend(v66, "objectForKeyedSubscript:", v116),
                  v67 = (void *)objc_claimAutoreleasedReturnValue(),
                  v68 = v67 == 0,
                  v67,
                  v68))
            {
              objc_msgSend(v66, "allKeys");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "objectAtIndexedSubscript:", 0);
              v73 = objc_claimAutoreleasedReturnValue();

              v69 = (void *)v73;
              v66 = v110;
            }
            else
            {
              v69 = v116;
            }
            v116 = v69;
            objc_msgSend(v66, "objectForKeyedSubscript:");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            v75 = v74;
            if (v74)
            {
              v108 = v74;
              objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("DerivedCounters"));
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              if (v76)
              {
                v107 = v76;
                objc_msgSend(v75, "objectForKeyedSubscript:", CFSTR("Name"));
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                -[DTGPUCounterProfile setProfileName:](v134, "setProfileName:", v77);

                -[DTGPUCounterProfile profileName](v134, "profileName");
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v77) = v78 == 0;

                if ((_DWORD)v77)
                  -[DTGPUCounterProfile setProfileName:](v134, "setProfileName:", v116);
                -[DTGPUCounterProfile profileName](v134, "profileName");
                v79 = objc_claimAutoreleasedReturnValue();
                sourceName = v134->_sourceName;
                v134->_sourceName = (NSString *)v79;

                objc_msgSend(v108, "objectForKeyedSubscript:", CFSTR("RawCounterWidth"));
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                v144 = 0u;
                v145 = 0u;
                v142 = 0u;
                v143 = 0u;
                v115 = v107;
                v121 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v142, v156, 16);
                if (v121)
                {
                  v120 = *(_QWORD *)v143;
                  do
                  {
                    for (j = 0; j != v121; ++j)
                    {
                      if (*(_QWORD *)v143 != v120)
                        objc_enumerationMutation(v115);
                      v82 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * j);
                      objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("Name"));
                      v133 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("GroupIndex"));
                      v125 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("Multiplier"));
                      v126 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v62, "objectForKeyedSubscript:", v133);
                      v83 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v83)
                      {
                        v129 = v83;
                        objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("name"));
                        v124 = (void *)objc_claimAutoreleasedReturnValue();
                        v84 = [DTGPUCounter alloc];
                        if (v124)
                          v85 = v124;
                        else
                          v85 = v133;
                        v132 = -[DTGPUCounter initWithName:maxValue:](v84, "initWithName:maxValue:", v85, 0);
                        objc_msgSend(v129, "objectForKeyedSubscript:", CFSTR("description"));
                        v86 = (void *)objc_claimAutoreleasedReturnValue();
                        -[DTGPUCounter setCounterDescription:](v132, "setCounterDescription:", v86);

                        objc_msgSend(v129, "objectForKeyedSubscript:", CFSTR("type"));
                        v87 = (void *)objc_claimAutoreleasedReturnValue();
                        -[DTGPUCounter setType:](v132, "setType:", v87);

                        if (v125)
                        {
                          v88 = v132;
                          v89 = objc_msgSend(v125, "unsignedIntValue");
                        }
                        else
                        {
                          v89 = 0;
                          v88 = v132;
                        }
                        -[DTGPUCounter setGroupIndex:](v88, "setGroupIndex:", v89);
                        if (v126)
                          v90 = objc_msgSend(v126, "unsignedIntValue");
                        else
                          v90 = 1;
                        -[DTGPUCounter setMultiplier:](v88, "setMultiplier:", v90);
                        -[DTGPUCounter type](v88, "type");
                        v91 = (void *)objc_claimAutoreleasedReturnValue();
                        v92 = objc_msgSend(v91, "isEqualToString:", CFSTR("Percentage"));

                        if (v92)
                        {
                          -[DTGPUCounter setMaxValue:](v132, "setMaxValue:", 100);
                          -[DTGPUCounter setMultiplier:](v132, "setMultiplier:", 100);
                        }
                        else
                        {
                          -[DTGPUCounter setMaxValue:](v132, "setMaxValue:", 0x225C17D04);
                        }
                        -[DTGPUCounter setFunctionName:](v132, "setFunctionName:", v133);
                        v93 = (void *)objc_opt_new();
                        objc_msgSend(v129, "objectForKeyedSubscript:", CFSTR("counters"));
                        v94 = (void *)objc_claimAutoreleasedReturnValue();
                        v140 = 0u;
                        v141 = 0u;
                        v138 = 0u;
                        v139 = 0u;
                        v95 = v94;
                        v96 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v138, v155, 16);
                        if (v96)
                        {
                          v97 = *(_QWORD *)v139;
                          do
                          {
                            for (k = 0; k != v96; ++k)
                            {
                              if (*(_QWORD *)v139 != v97)
                                objc_enumerationMutation(v95);
                              v99 = *(_QWORD *)(*((_QWORD *)&v138 + 1) + 8 * k);
                              objc_msgSend(v62, "objectForKeyedSubscript:", v99);
                              v100 = (void *)objc_claimAutoreleasedReturnValue();
                              v101 = v100 == 0;

                              if (v101)
                              {
                                objc_msgSend(v81, "objectForKeyedSubscript:", v99);
                                v102 = (void *)objc_claimAutoreleasedReturnValue();
                                v103 = v102 == 0;

                                if (v103)
                                {
                                  v105 = 32;
                                }
                                else
                                {
                                  objc_msgSend(v81, "objectForKeyedSubscript:", v99);
                                  v104 = (void *)objc_claimAutoreleasedReturnValue();
                                  v105 = objc_msgSend(v104, "unsignedIntValue");

                                }
                                v106 = -[DTGPURawCounter_GPURawCounter initWithName:width:]([DTGPURawCounter_GPURawCounter alloc], "initWithName:width:", v99, v105);
                                objc_msgSend(v93, "addObject:", v106);

                              }
                            }
                            v96 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v138, v155, 16);
                          }
                          while (v96);
                        }

                        -[DTGPUCounter setRawCounters:](v132, "setRawCounters:", v93);
                        -[DTGPUCounterProfile addCounter:](v134, "addCounter:", v132);

                        v83 = v129;
                      }

                    }
                    v121 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v142, v156, 16);
                  }
                  while (v121);
                }

                -[DTGPUCounterProfile setDerivedCounterScriptPath:](v134, "setDerivedCounterScriptPath:", v114);
                v58 = 0;
                v76 = v107;
              }
              else
              {
                v58 = 1;
              }

              v75 = v108;
            }
            else
            {
              v58 = 1;
            }

            v66 = v110;
          }
          else
          {
            v58 = 1;
          }

          v59 = v109;
        }
        else
        {
          v117 = 0;
          v114 = 0;
          v58 = 1;
          v59 = obj;
        }

LABEL_71:
        v61 = v114;
        goto LABEL_72;
      }
      v135 = v122;
    }
    if (v135)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_73:
  v70 = 0;
LABEL_75:

  return v70;
}

- (DTGPUCounterProfile_GPURawCounters)initWithLimitersProfile:(id)a3
{
  DTGPUCounterProfile_GPURawCounters *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  DTGPURawCounter_GPURawCounter *v24;
  uint64_t v25;
  DTGPURawCounter_GPURawCounter *v26;
  DTGPUCounter *v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  DTGPUCounterProfile_GPURawCounters *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *CFProperty;
  void *v40;
  id v41;
  void *v42;
  id obj;
  DTGPUCounterProfile_GPURawCounters *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  objc_super v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v50.receiver = self;
  v50.super_class = (Class)DTGPUCounterProfile_GPURawCounters;
  v41 = a3;
  v3 = -[DTGPUCounterProfile initWithProfile:device:](&v50, sel_initWithProfile_device_, 2);
  v44 = v3;
  if (!v3)
    goto LABEL_33;
  v38 = v41;
  v3->_vendor = +[DTGPUCounterProfile_GPURawCounters vendorFromDevice:](DTGPUCounterProfile_GPURawCounters, "vendorFromDevice:", v38);
  CFProperty = (void *)IORegistryEntryCreateCFProperty(objc_msgSend(v38, "acceleratorPort"), CFSTR("MetalPluginName"), 0, 0);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/System/Library/Extensions/%@.bundle"), CFProperty);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "enumeratorAtPath:", v4);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v42, "nextObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    while (objc_msgSend(v5, "rangeOfString:", CFSTR("MetalLimiters")) == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v42, "nextObject");
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
      if (!v6)
        goto LABEL_5;
    }
    v8 = (void *)MEMORY[0x24BDD17C8];
    v9 = v5;
    objc_msgSend(v8, "stringWithFormat:", CFSTR("/System/Library/Extensions/%@.bundle/%@"), CFProperty, v9);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v9;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/System/Library/Extensions/%@.bundle/AGXMetalPerfCounters.plist"), CFProperty);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v40, "fileExistsAtPath:", v37))
      goto LABEL_27;
    if (objc_msgSend(v40, "fileExistsAtPath:", v36))
    {
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v37);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v36);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("Configuration"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Timer Interval (microseconds)"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "unsignedIntegerValue");

      v13 = 50;
      if (v12 > 0x32)
        v13 = v12;
      -[DTGPUCounterProfile setDefaultSampleInterval:](v44, "setDefaultSampleInterval:", 1000 * v13);
      objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("Profiles"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("limiters"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Counters"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        obj = v33;
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
        if (v16)
        {
          v17 = *(_QWORD *)v47;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v47 != v17)
                objc_enumerationMutation(obj);
              v19 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
              objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Name"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Width"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "objectForKeyedSubscript:", v20);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              if (v22)
              {
                v23 = (void *)objc_opt_new();
                v24 = [DTGPURawCounter_GPURawCounter alloc];
                if (v21)
                  v25 = objc_msgSend(v21, "unsignedIntValue");
                else
                  v25 = 32;
                v26 = -[DTGPURawCounter_GPURawCounter initWithName:width:](v24, "initWithName:width:", v20, v25);
                objc_msgSend(v23, "addObject:", v26);

                v27 = -[DTGPUCounter initWithName:maxValue:]([DTGPUCounter alloc], "initWithName:maxValue:", v20, 0);
                -[DTGPUCounter setRawCounters:](v27, "setRawCounters:", v23);
                objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("Description"));
                v28 = objc_claimAutoreleasedReturnValue();
                v29 = (void *)v28;
                if (v28)
                  v30 = (const __CFString *)v28;
                else
                  v30 = &stru_24EB2CF78;
                -[DTGPUCounter setCounterDescription:](v27, "setCounterDescription:", v30);
                -[DTGPUCounter setFunctionName:](v27, "setFunctionName:", v20);
                -[DTGPUCounter setMaxValue:](v27, "setMaxValue:", 0x7FFFFFFFLL);
                -[DTGPUCounter setMultiplier:](v27, "setMultiplier:", 1);
                -[DTGPUCounter setGroupIndex:](v27, "setGroupIndex:", 1);
                -[DTGPUCounterProfile addCounter:](v44, "addCounter:", v27);

              }
            }
            v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
          }
          while (v16);
        }

        -[DTGPUCounterProfile setDerivedCounterScriptPath:](v44, "setDerivedCounterScriptPath:", 0);
        v7 = 0;
      }
      else
      {
        v7 = 1;
      }

    }
    else
    {
LABEL_27:
      v7 = 1;
    }

  }
  else
  {
LABEL_5:
    v7 = 1;
  }

  v3 = v44;
  if (v7)
    v31 = 0;
  else
LABEL_33:
    v31 = v3;

  return v31;
}

- (DTGPUCounterProfile_GPURawCounters)initWithDevice:(id)a3 sourceName:(id)a4 profile:(unint64_t)a5
{
  id v8;
  id v9;
  DTGPUCounterProfile_GPURawCounters *v10;
  uint64_t v11;
  NSString *sourceName;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DTGPUCounterProfile_GPURawCounters;
  v10 = -[DTGPUCounterProfile initWithProfile:device:](&v14, sel_initWithProfile_device_, a5, v8);
  if (v10)
  {
    objc_msgSend(v9, "lowercaseString");
    v11 = objc_claimAutoreleasedReturnValue();
    sourceName = v10->_sourceName;
    v10->_sourceName = (NSString *)v11;

    v10->_vendor = +[DTGPUCounterProfile_GPURawCounters vendorFromDevice:](DTGPUCounterProfile_GPURawCounters, "vendorFromDevice:", v8);
    -[DTGPUCounterProfile setDerivedCounterScriptPath:](v10, "setDerivedCounterScriptPath:", 0);
    -[DTGPUCounterProfile setDefaultSampleInterval:](v10, "setDefaultSampleInterval:", 50000);
  }

  return v10;
}

- (BOOL)prepare
{
  return MEMORY[0x24BEDD108](self, sel__validateAndConfigureRawCounters);
}

- (BOOL)_validateAndConfigureRawCounters
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  id v32;
  void *v33;
  GPURawCounterSource *source;
  uint64_t v35;
  void *v36;
  BOOL v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  _DWORD *v42;
  BOOL v43;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t k;
  void *v52;
  id v53;
  unsigned __int8 *v54;
  id v55;
  uint64_t v56;
  void *v57;
  _BOOL4 v58;
  void *v59;
  DTGPURawCounter_GPURawCounter *v60;
  DTGPURawCounter_GPURawCounter *v61;
  DTGPURawCounter_GPURawCounter *v62;
  DTGPURawCounter_GPURawCounter *v63;
  DTGPURawCounter_GPURawCounter *v64;
  void *v65;
  void *v66;
  NSArray *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t n;
  void *v71;
  DTGPUAGXCounterSourceGroup *v72;
  GPURawCounterSourceGroup *sourceGroup;
  uint64_t v74;
  uint64_t v75;
  DTGPUAGXCounterSourceGroup *agxSource;
  unsigned int m;
  void *v78;
  uint64_t v79;
  BOOL v80;
  void *v81;
  void *v82;
  DTGPURawCounter_GPURawCounter *v83;
  void *v84;
  DTGPURawCounter_GPURawCounter *v85;
  DTGPUCounter *v86;
  void *v87;
  DTGPUCounter *v88;
  void *v89;
  void *v90;
  const __CFString *v91;
  void *v92;
  void *v93;
  id obj;
  uint64_t v95;
  id v96;
  id v97;
  uint64_t v98;
  DTGPUCounterProfile_GPURawCounters *v99;
  id v100;
  id v101;
  id v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  id v109;
  id v110;
  id j;
  void *v112;
  uint64_t v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  _QWORD v118[5];
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _OWORD v127[2];
  int v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 *v145;
  _BYTE v146[128];
  DTGPURawCounter_GPURawCounter *v147;
  _BYTE v148[5];
  _BYTE v149[128];
  _BYTE __p[12];
  char v151;
  _BYTE v152[128];
  _BYTE v153[128];
  _BYTE v154[128];
  _BYTE v155[128];
  uint64_t v156;

  v156 = *MEMORY[0x24BDAC8D0];
  v93 = (void *)GRCCopyAllCounterSourceGroup();
  if (!objc_msgSend(v93, "count"))
    goto LABEL_58;
  v99 = self;
  if (self->_vendor != 2)
  {
    v143 = 0uLL;
    v144 = 0uLL;
    v141 = 0uLL;
    v142 = 0uLL;
    v101 = v93;
    v21 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v141, v155, 16);
    if (v21)
    {
      v107 = *(_QWORD *)v142;
      do
      {
        v113 = 0;
        v104 = v21;
        do
        {
          if (*(_QWORD *)v142 != v107)
            objc_enumerationMutation(v101);
          v22 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * v113);
          v137 = 0u;
          v138 = 0u;
          v139 = 0u;
          v140 = 0u;
          objc_msgSend(v22, "sourceList");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v137, v154, 16);
          v110 = v22;
          if (!v24)
          {
LABEL_36:

            goto LABEL_38;
          }
          v25 = *(_QWORD *)v138;
LABEL_30:
          v26 = 0;
          while (1)
          {
            if (*(_QWORD *)v138 != v25)
              objc_enumerationMutation(v23);
            v27 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * v26);
            objc_msgSend(v27, "name");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "lowercaseString");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSString lowercaseString](v99->_sourceName, "lowercaseString");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v29, "isEqualToString:", v30);

            if (v31)
              break;
            if (v24 == ++v26)
            {
              v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v137, v154, 16);
              if (!v24)
                goto LABEL_36;
              goto LABEL_30;
            }
          }
          objc_storeStrong((id *)&v99->_sourceGroup, v110);
          objc_storeStrong((id *)&v99->_source, v27);

LABEL_38:
          if (v99->_sourceGroup)
            goto LABEL_41;
          ++v113;
        }
        while (v113 != v104);
        v21 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v141, v155, 16);
      }
      while (v21);
    }
LABEL_41:

    goto LABEL_51;
  }
  v135 = 0uLL;
  v136 = 0uLL;
  v133 = 0uLL;
  v134 = 0uLL;
  obj = v93;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v133, v153, 16);
  if (!v3)
  {
    v109 = 0;
    v112 = 0;
    v100 = 0;
    v103 = 0;
    goto LABEL_44;
  }
  v109 = 0;
  v112 = 0;
  v100 = 0;
  v103 = 0;
  v95 = *(_QWORD *)v134;
  do
  {
    v4 = 0;
    v96 = (id)v3;
    do
    {
      if (*(_QWORD *)v134 != v95)
        objc_enumerationMutation(obj);
      v5 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * v4);
      v129 = 0u;
      v130 = 0u;
      v131 = 0u;
      v132 = 0u;
      objc_msgSend(v5, "sourceList");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v129, v152, 16);
      v98 = v4;
      if (v7)
      {
        v106 = *(_QWORD *)v130;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v130 != v106)
              objc_enumerationMutation(v6);
            v9 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * i);
            objc_msgSend(v9, "name");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = v6;
            v12 = objc_msgSend(v10, "rangeOfString:", CFSTR("RDE")) == 0;

            if (v12)
            {
              v16 = v100;
              v15 = v103;
              v18 = v109;
              v17 = v112;
              v100 = v9;
              v103 = v5;
LABEL_17:
              v19 = v9;

              v20 = v5;
              v109 = v18;
              v112 = v17;
              goto LABEL_18;
            }
            objc_msgSend(v9, "name");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("Firmware"));

            v16 = v109;
            v15 = v112;
            v17 = v5;
            v18 = v9;
            if ((v14 & 1) != 0)
              goto LABEL_17;
LABEL_18:
            v6 = v11;
          }
          v7 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v129, v152, 16);
        }
        while (v7);
      }

      v4 = v98 + 1;
    }
    while ((id)(v98 + 1) != v96);
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v133, v153, 16);
  }
  while (v3);
LABEL_44:

  v32 = v100 ? v100 : v109;
  objc_storeStrong((id *)&v99->_source, v32);
  v33 = v100 ? v103 : v112;
  objc_storeStrong((id *)&v99->_sourceGroup, v33);

LABEL_51:
  if (!v99->_sourceGroup || (source = v99->_source) == 0)
  {
LABEL_58:
    v43 = 0;
    goto LABEL_59;
  }
  v35 = 0;
  memset(v127, 0, sizeof(v127));
  v128 = 1065353216;
  while (1)
  {
    -[GPURawCounterSource availableCounters](source, "availableCounters");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "count") > (unint64_t)v35;

    if (!v37)
      break;
    -[GPURawCounterSource availableCounters](v99->_source, "availableCounters");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "objectAtIndexedSubscript:", v35);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = objc_msgSend(v39, "counterValueType");
    objc_msgSend(v39, "name");
    v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sub_222B349DC(__p, (char *)objc_msgSend(v41, "UTF8String"));
    v145 = (__int128 *)__p;
    v42 = sub_222B9F894((uint64_t)v127, __p, (uint64_t)&unk_222BD259D, &v145);
    v42[10] = v35;
    *((_QWORD *)v42 + 6) = v40;
    if (v151 < 0)
      operator delete(*(void **)__p);

    v35 = (v35 + 1);
    source = v99->_source;
  }
  v45 = (void *)objc_opt_new();
  v125 = 0u;
  v126 = 0u;
  v123 = 0u;
  v124 = 0u;
  -[DTGPUCounterProfile counters](v99, "counters");
  v97 = (id)objc_claimAutoreleasedReturnValue();
  v105 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v123, v149, 16);
  if (v105)
  {
    v102 = *(id *)v124;
    v46 = MEMORY[0x24BDACB70];
    do
    {
      for (j = 0; j != (id)v105; j = (char *)j + 1)
      {
        if (*(id *)v124 != v102)
          objc_enumerationMutation(v97);
        v47 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * (_QWORD)j);
        v35 = objc_opt_new();
        v121 = 0u;
        v122 = 0u;
        v119 = 0u;
        v120 = 0u;
        v108 = v47;
        objc_msgSend(v47, "rawCounters");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v119, v148, 16);
        if (v49)
        {
          v50 = *(_QWORD *)v120;
          do
          {
            for (k = 0; k != v49; ++k)
            {
              if (*(_QWORD *)v120 != v50)
                objc_enumerationMutation(v48);
              v52 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * k);
              objc_msgSend(v52, "name");
              v53 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              sub_222B349DC(__p, (char *)objc_msgSend(v53, "UTF8String"));
              v54 = sub_222BA00B8(v127, __p);
              if (v151 < 0)
                operator delete(*(void **)__p);

              if (v54)
              {
                objc_msgSend(v52, "setCounterIdx:", *((unsigned int *)v54 + 10));
                objc_msgSend(v52, "setValueType:", *((_QWORD *)v54 + 6));
                objc_msgSend(v45, "addObject:", v52);
                objc_msgSend((id)v35, "addObject:", v52);
              }
              else if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v52, "name");
                v55 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v56 = objc_msgSend(v55, "UTF8String");
                *(_DWORD *)__p = 136315138;
                *(_QWORD *)&__p[4] = v56;
                _os_log_impl(&dword_222B17000, v46, OS_LOG_TYPE_ERROR, "Failed to find counter: failed at %s", __p, 0xCu);

              }
            }
            v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v119, v148, 16);
          }
          while (v49);
        }

        objc_msgSend(v108, "setRawCounters:", v35);
      }
      v105 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v123, v149, 16);
    }
    while (v105);
  }

  if (v99->_vendor != 2)
  {
    -[DTGPUCounterProfile counters](v99, "counters");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "count") == 0;

    if (v58)
    {
      for (m = 0; ; m = v79 + 1)
      {
        -[GPURawCounterSource availableCounters](v99->_source, "availableCounters");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = m;
        v80 = objc_msgSend(v78, "count") > (unint64_t)m;

        if (!v80)
          break;
        -[GPURawCounterSource availableCounters](v99->_source, "availableCounters");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "objectAtIndexedSubscript:", v79);
        v82 = (void *)objc_claimAutoreleasedReturnValue();

        v83 = [DTGPURawCounter_GPURawCounter alloc];
        objc_msgSend(v82, "name");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = -[DTGPURawCounter_GPURawCounter initWithName:width:](v83, "initWithName:width:", v84, 64);

        -[DTGPURawCounter_GPURawCounter setCounterIdx:](v85, "setCounterIdx:", v79);
        -[DTGPURawCounter_GPURawCounter setValueType:](v85, "setValueType:", objc_msgSend(v82, "counterValueType"));
        objc_msgSend(v45, "addObject:", v85);
        v86 = [DTGPUCounter alloc];
        objc_msgSend(v82, "name");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = -[DTGPUCounter initWithName:maxValue:](v86, "initWithName:maxValue:", v87, 0x7FFFFFFFLL);

        v147 = v85;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v147, 1);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        -[DTGPUCounter setRawCounters:](v88, "setRawCounters:", v89);

        objc_msgSend(v82, "description");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        if (v90)
        {
          objc_msgSend(v82, "description");
          v35 = objc_claimAutoreleasedReturnValue();
          v91 = (const __CFString *)v35;
        }
        else
        {
          v91 = &stru_24EB2CF78;
        }
        -[DTGPUCounter setCounterDescription:](v88, "setCounterDescription:", v91);
        if (v90)

        objc_msgSend(v82, "name");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        -[DTGPUCounter setFunctionName:](v88, "setFunctionName:", v92);

        -[DTGPUCounter setMaxValue:](v88, "setMaxValue:", 0x7FFFFFFFLL);
        -[DTGPUCounter setMultiplier:](v88, "setMultiplier:", 1);
        -[DTGPUCounter setGroupIndex:](v88, "setGroupIndex:", 1);
        -[DTGPUCounterProfile addCounter:](v99, "addCounter:", v88);

      }
    }
  }
  v59 = (void *)objc_opt_new();
  if (v99->_vendor == 2)
  {
    v60 = -[DTGPURawCounter_GPURawCounter initWithName:]([DTGPURawCounter_GPURawCounter alloc], "initWithName:", CFSTR("GRC_TIMESTAMP"));
    objc_msgSend(v59, "addObject:", v60);

    v61 = -[DTGPURawCounter_GPURawCounter initWithName:]([DTGPURawCounter_GPURawCounter alloc], "initWithName:", CFSTR("GRC_GPU_CYCLES"));
    objc_msgSend(v59, "addObject:", v61);

    v62 = -[DTGPURawCounter_GPURawCounter initWithName:]([DTGPURawCounter_GPURawCounter alloc], "initWithName:", CFSTR("GRC_ENCODER_ID"));
    objc_msgSend(v59, "addObject:", v62);

    v63 = -[DTGPURawCounter_GPURawCounter initWithName:]([DTGPURawCounter_GPURawCounter alloc], "initWithName:", CFSTR("GRC_KICK_TRACE_ID"));
    objc_msgSend(v59, "addObject:", v63);

    v64 = -[DTGPURawCounter_GPURawCounter initWithName:]([DTGPURawCounter_GPURawCounter alloc], "initWithName:", CFSTR("GRC_SAMPLE_TYPE"));
    objc_msgSend(v59, "addObject:", v64);

  }
  objc_msgSend(v45, "allObjects");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "addObjectsFromArray:", v65);

  v99->_gpuTimeIndex = -1;
  if (v99->_vendor)
  {
    v99->_gpuTimeIndex = 0;
    goto LABEL_87;
  }
  objc_msgSend(v59, "sortUsingComparator:", &unk_24EB27A50);
  v118[0] = MEMORY[0x24BDAC760];
  v118[1] = 3221225472;
  v118[2] = sub_222B9DDF0;
  v118[3] = &unk_24EB2B110;
  v118[4] = v99;
  objc_msgSend(v59, "enumerateObjectsUsingBlock:", v118);
  if (v99->_gpuTimeIndex == -1)
  {
    v43 = 0;
  }
  else
  {
LABEL_87:
    objc_storeStrong((id *)&v99->_rawCounters, v59);
    v66 = (void *)objc_opt_new();
    v116 = 0u;
    v117 = 0u;
    v114 = 0u;
    v115 = 0u;
    v67 = v99->_rawCounters;
    v68 = -[NSArray countByEnumeratingWithState:objects:count:](v67, "countByEnumeratingWithState:objects:count:", &v114, v146, 16);
    if (v68)
    {
      v69 = *(_QWORD *)v115;
      do
      {
        for (n = 0; n != v68; ++n)
        {
          if (*(_QWORD *)v115 != v69)
            objc_enumerationMutation(v67);
          objc_msgSend(*(id *)(*((_QWORD *)&v114 + 1) + 8 * n), "rawCounterSelect");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "addObject:", v71);

        }
        v68 = -[NSArray countByEnumeratingWithState:objects:count:](v67, "countByEnumeratingWithState:objects:count:", &v114, v146, 16);
      }
      while (v68);
    }

    if (v99->_vendor == 2)
    {
      v72 = [DTGPUAGXCounterSourceGroup alloc];
      sourceGroup = v99->_sourceGroup;
      v74 = -[DTGPUCounterProfile profile](v99, "profile");
      v75 = -[DTGPUAGXCounterSourceGroup initWithSourceGroup:selects:apsSelects:profile:](v72, "initWithSourceGroup:selects:apsSelects:profile:", sourceGroup, v66, MEMORY[0x24BDBD1A8], v74);
      agxSource = v99->_agxSource;
      v99->_agxSource = (DTGPUAGXCounterSourceGroup *)v75;

    }
    v43 = 1;
  }

  sub_222B9F818((uint64_t)v127);
LABEL_59:

  return v43;
}

- (void)_releaseCounterSource
{
  GPURawCounterSourceGroup *sourceGroup;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  GPURawCounterSource *source;
  GPURawCounterSourceGroup *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  sourceGroup = self->_sourceGroup;
  if (sourceGroup)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[GPURawCounterSourceGroup sourceList](sourceGroup, "sourceList", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v11;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7++), "setEnabled:", 0);
        }
        while (v5 != v7);
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }

    -[GPURawCounterSourceGroup stopSampling](self->_sourceGroup, "stopSampling");
    source = self->_source;
    self->_source = 0;

    v9 = self->_sourceGroup;
    self->_sourceGroup = 0;

    GRCReleaseAllCounterSourceGroup();
  }
}

- (BOOL)start:(unint64_t)a3 vendorFeatures:(id)a4
{
  id v6;
  GPURawCounterSource *source;
  char v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  source = self->_source;
  if (!source || !self->_sourceGroup)
    goto LABEL_6;
  if (self->_vendor != 2)
  {
    -[GPURawCounterSource setOptions:](source, "setOptions:", v6);
    v25 = 0;
    v9 = (void *)objc_opt_new();
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = self->_rawCounters;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "rawCounterSelect", (_QWORD)v21);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v14);

        }
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
      }
      while (v11);
    }

    if ((-[GPURawCounterSource requestCounters:firstErrorIndex:](self->_source, "requestCounters:firstErrorIndex:", v9, &v25) & 1) != 0)
    {
      if ((-[GPURawCounterSource setEnabled:](self->_source, "setEnabled:", 1) & 1) != 0)
      {
        self->_startTime = mach_absolute_time();
        mach_timebase_info(&self->_timeBaseInfo);
        self->_firstGpuTime = 0;
        v8 = -[GPURawCounterSourceGroup startSampling](self->_sourceGroup, "startSampling");
LABEL_22:

        goto LABEL_23;
      }
      -[DTGPUCounterProfile_GPURawCounters _releaseDataSource](self, "_releaseDataSource");
    }
    else
    {
      v15 = (void *)objc_opt_new();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", v25);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "name");
        v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v18 = objc_msgSend(v17, "UTF8String");
        v19 = objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
        *(_DWORD *)buf = 136315394;
        v27 = v18;
        v28 = 2080;
        v29 = v19;
        _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to request counters: failed at %s (%s)", buf, 0x16u);

      }
      -[DTGPUCounterProfile_GPURawCounters _releaseDataSource](self, "_releaseDataSource", (_QWORD)v21);

    }
    v8 = 0;
    goto LABEL_22;
  }
  if (!-[DTGPUAGXCounterSourceGroup request:vendorFeatures:](self->_agxSource, "request:vendorFeatures:", a3, v6))
  {
LABEL_6:
    v8 = 0;
    goto LABEL_23;
  }
  -[GPURawCounterSourceGroup startSampling](self->_sourceGroup, "startSampling");
  -[DTGPUAGXCounterSourceGroup resume](self->_agxSource, "resume");
  v8 = 1;
LABEL_23:

  return v8;
}

- (void)_releaseDataSource
{
  GPURawCounterSourceGroup *sourceGroup;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  GPURawCounterSource *source;
  GPURawCounterSourceGroup *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  sourceGroup = self->_sourceGroup;
  if (sourceGroup)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[GPURawCounterSourceGroup sourceList](sourceGroup, "sourceList", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v11;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7++), "setEnabled:", 0);
        }
        while (v5 != v7);
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }

    -[GPURawCounterSourceGroup stopSampling](self->_sourceGroup, "stopSampling");
    source = self->_source;
    self->_source = 0;

    v9 = self->_sourceGroup;
    self->_sourceGroup = 0;

    GRCReleaseAllCounterSourceGroup();
  }
}

- (void)stop
{
  -[DTGPUAGXCounterSourceGroup stop](self->_agxSource, "stop");
  -[DTGPUCounterProfile_GPURawCounters _releaseDataSource](self, "_releaseDataSource");
}

- (void)sampleCounters:(unint64_t)a3 callback:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  GPURawCounterSource *source;
  _QWORD v10[5];
  id v11;
  mach_timebase_info info;

  v6 = a4;
  if (self->_vendor == 2)
  {
    -[DTGPUAGXCounterSourceGroup sampleCounters:callback:](self->_agxSource, "sampleCounters:callback:", a3, v6);
  }
  else
  {
    mach_timebase_info(&info);
    v7 = 0;
    v8 = MEMORY[0x24BDAC760];
    while (v7 < -[GPURawCounterSource ringBufferNum](self->_source, "ringBufferNum"))
    {
      source = self->_source;
      v10[0] = v8;
      v10[1] = 3221225472;
      v10[2] = sub_222B9E5D4;
      v10[3] = &unk_24EB2B138;
      v10[4] = self;
      v11 = v6;
      -[GPURawCounterSource pollCountersAtBufferIndex:withBlock:](source, "pollCountersAtBufferIndex:withBlock:", v7, v10);

      v7 = (v7 + 1);
    }
  }

}

- (id)counterProfileForHost
{
  unsigned int vendor;
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t k;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t m;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t n;
  void *v27;
  void *v28;
  BOOL v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  __CFString *v39;
  void *v40;
  void *v41;
  NSMutableDictionary *gpuConfigurationVariables;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t ii;
  void *v48;
  NSArray *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t jj;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  void *v60;
  void *v61;
  __CFString *v62;
  NSMutableDictionary *v63;
  void *v64;
  uint64_t v65;
  uint64_t v67;
  uint64_t v68;
  uint64_t j;
  id obj;
  id v72;
  void *v73;
  id v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _QWORD v107[4];
  _QWORD v108[4];
  void *v109;
  _QWORD v110[2];
  _BYTE v111[128];
  _BYTE v112[128];
  _QWORD v113[4];
  _QWORD v114[4];
  _BYTE v115[128];
  _BYTE v116[128];
  _QWORD v117[2];
  _BYTE v118[128];
  _BYTE v119[128];
  _BYTE v120[128];
  uint64_t v121;

  v121 = *MEMORY[0x24BDAC8D0];
  vendor = self->_vendor;
  v72 = (id)objc_opt_new();
  if (vendor == 2)
  {
    v78 = (void *)objc_opt_new();
    v105 = 0u;
    v106 = 0u;
    v103 = 0u;
    v104 = 0u;
    v3 = self->_rawCounters;
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v103, v120, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v104;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v104 != v5)
            objc_enumerationMutation(v3);
          v7 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * i);
          objc_msgSend(v7, "name");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "setObject:forKeyedSubscript:", v7, v8);

        }
        v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v103, v120, 16);
      }
      while (v4);
    }

    v101 = 0u;
    v102 = 0u;
    v99 = 0u;
    v100 = 0u;
    -[DTGPUAGXCounterSourceGroup sources](self->_agxSource, "sources");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v119, 16);
    if (v68)
    {
      v67 = *(_QWORD *)v100;
      do
      {
        for (j = 0; j != v68; ++j)
        {
          if (*(_QWORD *)v100 != v67)
            objc_enumerationMutation(obj);
          v76 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * j);
          v77 = (void *)objc_opt_new();
          v9 = (void *)objc_opt_new();
          v97 = 0u;
          v98 = 0u;
          v95 = 0u;
          v96 = 0u;
          objc_msgSend(v76, "selects");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v95, v118, 16);
          if (v11)
          {
            v12 = *(_QWORD *)v96;
            do
            {
              for (k = 0; k != v11; ++k)
              {
                if (*(_QWORD *)v96 != v12)
                  objc_enumerationMutation(v10);
                objc_msgSend(*(id *)(*((_QWORD *)&v95 + 1) + 8 * k), "name", v67);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v78, "objectForKeyedSubscript:", v14);
                v15 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v15, "name");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v117[0] = v16;
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v15, "valueType") == 1);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v117[1] = v17;
                objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v117, 2);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v77, "addObject:", v18);

                objc_msgSend(v15, "name");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v19);

              }
              v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v95, v118, 16);
            }
            while (v11);
          }

          v73 = (void *)objc_opt_new();
          v93 = 0u;
          v94 = 0u;
          v91 = 0u;
          v92 = 0u;
          -[DTGPUCounterProfile counters](self, "counters");
          v74 = (id)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v91, v116, 16);
          if (v20)
          {
            v75 = *(_QWORD *)v92;
            do
            {
              for (m = 0; m != v20; ++m)
              {
                if (*(_QWORD *)v92 != v75)
                  objc_enumerationMutation(v74);
                v22 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * m);
                v87 = 0u;
                v88 = 0u;
                v89 = 0u;
                v90 = 0u;
                objc_msgSend(v22, "rawCounters", v67);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v87, v115, 16);
                if (v24)
                {
                  v25 = *(_QWORD *)v88;
                  while (2)
                  {
                    for (n = 0; n != v24; ++n)
                    {
                      if (*(_QWORD *)v88 != v25)
                        objc_enumerationMutation(v23);
                      objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * n), "name");
                      v27 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v9, "objectForKeyedSubscript:", v27);
                      v28 = (void *)objc_claimAutoreleasedReturnValue();
                      v29 = v28 == 0;

                      if (v29)
                      {
                        v30 = 0;
                        goto LABEL_36;
                      }
                    }
                    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v87, v115, 16);
                    if (v24)
                      continue;
                    break;
                  }
                }
                v30 = 1;
LABEL_36:

                objc_msgSend(v76, "source");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "name");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v32, "hasPrefix:", CFSTR("BMPR")))
                {
                  objc_msgSend(v22, "name");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v34 = objc_msgSend(v33, "containsString:", CFSTR("Bandwidth"));

                }
                else
                {
                  v34 = 0;
                }

                if (((v30 | v34) & 1) != 0)
                {
                  objc_msgSend(v22, "infoArray");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v73, "addObject:", v35);

                }
              }
              v20 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v91, v116, 16);
            }
            while (v20);
          }

          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[DTGPUCounterProfile derivedCounterScriptPath](self, "derivedCounterScriptPath");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v36, "fileExistsAtPath:", v37);

          v39 = &stru_24EB2CF78;
          if (v38)
          {
            v40 = (void *)MEMORY[0x24BDD17C8];
            -[DTGPUCounterProfile derivedCounterScriptPath](self, "derivedCounterScriptPath");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "stringWithContentsOfFile:encoding:error:", v41, 4, 0);
            v39 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          v113[0] = &unk_24EB4EC48;
          v113[1] = &unk_24EB4EC90;
          v114[0] = v73;
          v114[1] = v77;
          gpuConfigurationVariables = self->_gpuConfigurationVariables;
          v113[2] = &unk_24EB4ECA8;
          v113[3] = &unk_24EB4ECC0;
          if (!gpuConfigurationVariables)
            gpuConfigurationVariables = (NSMutableDictionary *)MEMORY[0x24BDBD1B8];
          v114[2] = v39;
          v114[3] = gpuConfigurationVariables;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v114, v113, 4, v67);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "addObject:", v43);

        }
        v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v119, 16);
      }
      while (v68);
    }
  }
  else
  {
    obj = (id)objc_opt_new();
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    -[DTGPUCounterProfile counters](self, "counters");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v83, v112, 16);
    if (v45)
    {
      v46 = *(_QWORD *)v84;
      do
      {
        for (ii = 0; ii != v45; ++ii)
        {
          if (*(_QWORD *)v84 != v46)
            objc_enumerationMutation(v44);
          objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * ii), "infoArray");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "addObject:", v48);

        }
        v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v83, v112, 16);
      }
      while (v45);
    }

    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    v49 = self->_rawCounters;
    v50 = -[NSArray countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v79, v111, 16);
    if (v50)
    {
      v51 = *(_QWORD *)v80;
      do
      {
        for (jj = 0; jj != v50; ++jj)
        {
          if (*(_QWORD *)v80 != v51)
            objc_enumerationMutation(v49);
          v53 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * jj);
          objc_msgSend(v53, "name");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v110[0] = v54;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v53, "valueType") == 1);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v110[1] = v55;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v110, 2);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(obj, "addObject:", v56);

        }
        v50 = -[NSArray countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v79, v111, 16);
      }
      while (v50);
    }

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[DTGPUCounterProfile derivedCounterScriptPath](self, "derivedCounterScriptPath");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v57, "fileExistsAtPath:", v58);

    if (v59)
    {
      v60 = (void *)MEMORY[0x24BDD17C8];
      -[DTGPUCounterProfile derivedCounterScriptPath](self, "derivedCounterScriptPath");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "stringWithContentsOfFile:encoding:error:", v61, 4, 0);
      v62 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v62 = &stru_24EB2CF78;
    }
    v107[0] = &unk_24EB4EC48;
    v107[1] = &unk_24EB4EC90;
    v108[0] = v72;
    v108[1] = obj;
    v107[2] = &unk_24EB4ECA8;
    v107[3] = &unk_24EB4ECC0;
    v63 = self->_gpuConfigurationVariables;
    if (!v63)
      v63 = (NSMutableDictionary *)MEMORY[0x24BDBD1B8];
    v108[2] = v62;
    v108[3] = v63;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v108, v107, 4);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = v64;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v109, 1);
    v65 = objc_claimAutoreleasedReturnValue();

    v78 = v72;
    v72 = (id)v65;
  }

  return v72;
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
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  if (self->_vendor == 2)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[DTGPUAGXCounterSourceGroup sources](self->_agxSource, "sources", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v14;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v14 != v6)
            objc_enumerationMutation(v4);
          v8 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v7), "selects");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v10);

          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v5);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSArray count](self->_rawCounters, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  return v3;
}

- (id)ringBufferCounts
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v4 = v3;
  if (self->_vendor == 2)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[DTGPUAGXCounterSourceGroup sources](self->_agxSource, "sources", 0);
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
          v9 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v8), "source");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "ringBufferNum");

          if (v11 <= 1)
            v12 = 1;
          else
            v12 = v11;
          objc_msgSend(v9, "numberWithUnsignedInt:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v13);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v6);
    }

  }
  else
  {
    objc_msgSend(v3, "addObject:", &unk_24EB4EC60);
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gpuConfigurationVariables, 0);
  objc_storeStrong((id *)&self->_sourceName, 0);
  objc_storeStrong((id *)&self->_rawCounters, 0);
  objc_storeStrong((id *)&self->_agxSource, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_sourceGroup, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
