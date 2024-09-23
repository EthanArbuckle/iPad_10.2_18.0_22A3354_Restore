@implementation AWBProcessor

- (void)setMetalCommandQueue:(id)a3
{
  objc_storeStrong((id *)&self->_metalCommandQueue, a3);
}

- (int)setup
{
  _DWORD *v3;
  void *v4;
  FigMetalContext *v5;
  FigMetalContext *metalContext;
  id v7;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *stats;
  AWBStatistics *v12;
  AWBStatistics *awbStats;
  AWBAlgorithm *v14;
  AWBAlgorithm *awbAlgo;
  AWBIBPParams *v16;
  AWBIBPParams *awbParams;
  int v18;

  FigKTraceInit();
  v3 = (_DWORD *)MEMORY[0x24BDC0B48];
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work();
  fig_note_initialize_category_with_default_work();
  if (!v4)
    goto LABEL_10;
  v5 = (FigMetalContext *)objc_msgSend(objc_alloc(MEMORY[0x24BE11A10]), "initWithbundle:andOptionalCommandQueue:", v4, self->_metalCommandQueue);
  metalContext = self->_metalContext;
  self->_metalContext = v5;

  if (self->_metalContext)
  {
    v7 = objc_alloc(MEMORY[0x24BE11A00]);
    -[FigMetalContext device](self->_metalContext, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithDevice:allocatorType:", v8, 2);
    -[FigMetalContext setAllocator:](self->_metalContext, "setAllocator:", v9);

    if (self->_metalContext)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      stats = self->_stats;
      self->_stats = v10;

      if (self->_stats)
      {
        v12 = -[AWBStatistics initWithMetalContext:]([AWBStatistics alloc], "initWithMetalContext:", self->_metalContext);
        awbStats = self->_awbStats;
        self->_awbStats = v12;

        if (self->_awbStats)
        {
          v14 = -[AWBAlgorithm initWithMetalContext:]([AWBAlgorithm alloc], "initWithMetalContext:", self->_metalContext);
          awbAlgo = self->_awbAlgo;
          self->_awbAlgo = v14;

          if (self->_awbAlgo)
          {
            v16 = (AWBIBPParams *)objc_opt_new();
            awbParams = self->_awbParams;
            self->_awbParams = v16;

LABEL_10:
            v18 = 0;
            goto LABEL_11;
          }
        }
      }
    }
  }
  v18 = FigSignalErrorAt();
LABEL_11:
  if (*v3 == 1)
    kdebug_trace();

  return v18;
}

- (int)prepareToProcess:(unsigned int)a3
{
  _DWORD *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  CMIExternalMemoryResource *externalMemoryResource;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  AWBAlgorithm *v15;
  void *v16;
  void *v17;
  void *v18;
  AWBStatistics *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  AWBAlgorithm *awbAlgo;
  void *v25;
  void *v26;
  AWBStatistics *awbStats;
  void *v28;
  AWBStatistics *v29;
  AWBAlgorithm *v30;
  void *v31;
  void *v32;
  void *v33;
  AWBStatistics *v34;

  v5 = (_DWORD *)MEMORY[0x24BDC0B48];
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();
  if (!self->_allocatorSetupComplete)
  {
    v6 = objc_opt_new();
    if (!v6)
    {
      v13 = FigSignalErrorAt();
      v8 = 0;
      goto LABEL_34;
    }
    v7 = (void *)v6;
    v8 = (void *)objc_opt_new();

    objc_msgSend(v8, "setWireMemory:", 1);
    objc_msgSend(v8, "setResourceOptions:", 512);
    objc_msgSend(v8, "setLabel:", CFSTR("FigMetalAllocator_AWB"));
    externalMemoryResource = self->_externalMemoryResource;
    if (externalMemoryResource)
    {
      -[CMIExternalMemoryResource allocatorBackend](externalMemoryResource, "allocatorBackend");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10 && (unint64_t)objc_msgSend(v10, "memSize") >> 21)
      {
        objc_msgSend(v8, "setMemSize:", objc_msgSend(v11, "memSize"));
        -[FigMetalContext allocator](self->_metalContext, "allocator");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "setupWithDescriptor:allocatorBackend:", v8, v11);

        if (!v13)
        {

LABEL_11:
          if (objc_msgSend(v8, "memSize"))
          {
            self->_allocatorSetupComplete = 1;

            goto LABEL_13;
          }
          v13 = FigSignalErrorAt();
LABEL_34:

          goto LABEL_26;
        }
        FigSignalErrorAt();
      }
      else
      {
        v13 = FigSignalErrorAt();
      }

      goto LABEL_34;
    }
    objc_msgSend(v8, "setMemSize:", 0x200000);
    -[FigMetalContext allocator](self->_metalContext, "allocator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v14, "setupWithDescriptor:", v8);

    if (v13)
      goto LABEL_34;
    goto LABEL_11;
  }
LABEL_13:
  if (a3 == 2)
  {
    awbAlgo = self->_awbAlgo;
    -[AWBIBPParams setFileDict](self->_awbParams, "setFileDict");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[AWBIBPParams metadata](self->_awbParams, "metadata");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[AWBAlgorithm configWithSetFile:metadata:awbParams:](awbAlgo, "configWithSetFile:metadata:awbParams:", v25, v26, self->_awbParams);

    if (v13)
      goto LABEL_26;
    awbStats = self->_awbStats;
    -[AWBIBPParams registers](self->_awbParams, "registers");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[AWBStatistics configWithRegs:](awbStats, "configWithRegs:", v28);

    if (v13)
      goto LABEL_26;
    v29 = self->_awbStats;
    -[AWBIBPParams setFileDict](self->_awbParams, "setFileDict");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[AWBIBPParams metadata](self->_awbParams, "metadata");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[AWBIBPParams cameraInfo](self->_awbParams, "cameraInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[AWBStatistics configWithSetFile:metadata:cameraInfo:](v29, "configWithSetFile:metadata:cameraInfo:", v20, v21, v22);
  }
  else if (a3 == 1)
  {
    v30 = self->_awbAlgo;
    -[AWBIBPParams moduleConfig](self->_awbParams, "moduleConfig");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[AWBIBPParams metadata](self->_awbParams, "metadata");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[AWBIBPParams cameraInfo](self->_awbParams, "cameraInfo");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[AWBAlgorithm configWithModuleConfig:metadata:cameraInfo:awbParams:](v30, "configWithModuleConfig:metadata:cameraInfo:awbParams:", v31, v32, v33, self->_awbParams);

    if (v13)
      goto LABEL_26;
    v34 = self->_awbStats;
    -[AWBIBPParams moduleConfig](self->_awbParams, "moduleConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[AWBIBPParams metadata](self->_awbParams, "metadata");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[AWBIBPParams cameraInfo](self->_awbParams, "cameraInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[AWBStatistics configWithModuleConfig:metadata:cameraInfo:awbParams:](v34, "configWithModuleConfig:metadata:cameraInfo:awbParams:", v20, v21, v22, self->_awbParams);
  }
  else
  {
    if (a3)
    {
      v13 = 0;
      goto LABEL_26;
    }
    v15 = self->_awbAlgo;
    -[AWBIBPParams moduleConfig](self->_awbParams, "moduleConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AWBIBPParams metadata](self->_awbParams, "metadata");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AWBIBPParams cameraInfo](self->_awbParams, "cameraInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[AWBAlgorithm configWithModuleConfig:metadata:cameraInfo:awbParams:](v15, "configWithModuleConfig:metadata:cameraInfo:awbParams:", v16, v17, v18, self->_awbParams);

    if (v13)
      goto LABEL_26;
    v19 = self->_awbStats;
    -[AWBIBPParams registers](self->_awbParams, "registers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[AWBIBPParams metadata](self->_awbParams, "metadata");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[AWBIBPParams cameraInfo](self->_awbParams, "cameraInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[AWBStatistics configWithRegs:metadata:cameraInfo:](v19, "configWithRegs:metadata:cameraInfo:", v20, v21, v22);
  }
  v13 = v23;

  if (!v13)
    self->_configured = 1;
LABEL_26:
  if (*v5 == 1)
    kdebug_trace();
  return v13;
}

- (int)process
{
  _DWORD *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  _OWORD *v22;
  __int128 *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  const __CFDictionary *v44;
  BOOL v45;
  uint64_t v46;
  unsigned int v47;
  uint64_t v48;
  unsigned int v49;
  uint64_t v50;
  unsigned int v51;
  void *v52;
  void *v53;
  id v55;
  void *v56;
  AWBStatistics *awbStats;
  id v58;
  void *v59;
  id v60[2];
  id v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  CGRect rect;
  unsigned int v68;
  _QWORD v69[3];
  id v70;

  v70 = 0;
  v3 = (_DWORD *)MEMORY[0x24BDC0B48];
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();
  memset(v69, 0, sizeof(v69));
  v68 = 0;
  memset(&rect, 0, sizeof(rect));
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  if (!self->_configured)
    goto LABEL_16;
  createBufferFromMetal(self->_metalContext, (uint64_t)CFSTR("awb-stats-bfr"), 82112);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v70 = v4;
  if (!v4)
  {
    v13 = FigSignalErrorAt();
    v35 = 0;
    v39 = 0;
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 768);
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
LABEL_16:
    v13 = FigSignalErrorAt();
    v35 = 0;
    v39 = 0;
    v4 = 0;
LABEL_18:
    v20 = 0;
    goto LABEL_13;
  }
  v59 = (void *)v5;
  -[NSMutableDictionary removeAllObjects](self->_stats, "removeAllObjects");
  awbStats = self->_awbStats;
  -[AWBIBPParams imageTex](self->_awbParams, "imageTex");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWBIBPParams clippedTex](self->_awbParams, "clippedTex");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWBIBPParams lscGainsTex](self->_awbParams, "lscGainsTex");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWBIBPParams validRectInBufferCoords](self->_awbParams, "validRectInBufferCoords");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWBIBPParams validRectInSensorReadoutCoords](self->_awbParams, "validRectInSensorReadoutCoords");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWBIBPParams skinMask](self->_awbParams, "skinMask");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0;
  -[AWBIBPParams skyMask](self->_awbParams, "skyMask");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = 0;
  -[AWBIBPParams regionOfInterestRectInBufferCoords](self->_awbParams, "regionOfInterestRectInBufferCoords");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[AWBStatistics process:clipped:lscGainsTex:validRectInBufferCoords:validRectInSensorReadoutCoords:awbStatsBuffer:awbTileStatsConfig:anstSkinMask:anstSkinMaskData:skyMaskTex:skyMaskData:regionOfInterestRectInBufferCoords:downsizeFactor:](awbStats, "process:clipped:lscGainsTex:validRectInBufferCoords:validRectInSensorReadoutCoords:awbStatsBuffer:awbTileStatsConfig:anstSkinMask:anstSkinMaskData:skyMaskTex:skyMaskData:regionOfInterestRectInBufferCoords:downsizeFactor:", v56, v6, v7, v8, v9, v4, v69, v10, &v62, v11, &v61, v12, &v68);
  v55 = v62;
  v58 = v61;

  if (v13)
  {
    v4 = 0;
    v3 = (_DWORD *)MEMORY[0x24BDC0B48];
    v20 = v59;
LABEL_21:
    v39 = v55;
    v35 = v58;
    goto LABEL_13;
  }
  v14 = (void *)MEMORY[0x24BDBCE50];
  v15 = objc_retainAutorelease(v4);
  objc_msgSend(v14, "dataWithBytes:length:", objc_msgSend(v15, "contents"), 0x10000);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_stats, "setObject:forKeyedSubscript:", v16, CFSTR("tileStats"));

  v17 = (void *)MEMORY[0x24BDBCE50];
  v18 = objc_retainAutorelease(v15);
  objc_msgSend(v17, "dataWithBytes:length:", objc_msgSend(v18, "contents") + 0x10000, 192);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v59;
  if (!v19)
  {
    v13 = FigSignalErrorAt();
    v4 = 0;
    v3 = (_DWORD *)MEMORY[0x24BDC0B48];
    goto LABEL_21;
  }
  v21 = (void *)v19;
  v20 = objc_retainAutorelease(v59);
  v22 = (_OWORD *)objc_msgSend(v20, "bytes");
  v4 = objc_retainAutorelease(v21);
  v23 = (__int128 *)objc_msgSend(v4, "bytes");
  v24 = v23[3];
  v26 = *v23;
  v25 = v23[1];
  v22[14] = v23[2];
  v22[15] = v24;
  v22[12] = v26;
  v22[13] = v25;
  v27 = v23[7];
  v29 = v23[4];
  v28 = v23[5];
  v22[18] = v23[6];
  v22[19] = v27;
  v22[16] = v29;
  v22[17] = v28;
  v30 = v23[11];
  v32 = v23[8];
  v31 = v23[9];
  v22[22] = v23[10];
  v22[23] = v30;
  v22[20] = v32;
  v22[21] = v31;
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_stats, "setObject:forKeyedSubscript:", v20, CFSTR("windowStats"));
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", objc_msgSend(objc_retainAutorelease(v18), "contents") + 65728, 0x4000);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_stats, "setObject:forKeyedSubscript:", v33, CFSTR("histStats"));

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v69, 24);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_stats, "setObject:forKeyedSubscript:", v34, CFSTR("tileStatsConfig"));

  v35 = v58;
  if (-[NSMutableDictionary count](self->_stats, "count") == 4)
  {
    v65 = *MEMORY[0x24BDBEFB0];
    *(_OWORD *)v60 = v65;
    -[AWBIBPParams imageTex](self->_awbParams, "imageTex");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(double *)&v66 = (double)(unint64_t)objc_msgSend(v36, "width");

    -[AWBIBPParams imageTex](self->_awbParams, "imageTex");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *((double *)&v66 + 1) = (double)(unint64_t)objc_msgSend(v37, "height");

    objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", &v65);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_stats, "setObject:forKeyedSubscript:", v38, CFSTR("FESOutputSize"));

    v39 = v55;
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_stats, "setObject:forKeyedSubscript:", v55, CFSTR("anstSkinMask"));
    v63 = *(_OWORD *)v60;
    -[AWBIBPParams skyMask](self->_awbParams, "skyMask");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    *(double *)&v64 = (double)(unint64_t)objc_msgSend(v40, "width");

    -[AWBIBPParams skyMask](self->_awbParams, "skyMask");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *((double *)&v64 + 1) = (double)(unint64_t)objc_msgSend(v41, "height");

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_stats, "setObject:forKeyedSubscript:", v58, CFSTR("skyMaskData"));
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", &v63);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_stats, "setObject:forKeyedSubscript:", v42, CFSTR("skyMaskSize"));

    -[AWBAlgorithm setStats:](self->_awbAlgo, "setStats:", self->_stats);
    -[AWBIBPParams outputMetadata](self->_awbParams, "outputMetadata");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[AWBAlgorithm setOutputMetadata:](self->_awbAlgo, "setOutputMetadata:", v43);

    -[AWBIBPParams validRectInBufferCoords](self->_awbParams, "validRectInBufferCoords");
    v44 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v45 = CGRectMakeWithDictionaryRepresentation(v44, &rect);

    if (v45)
    {
      -[AWBAlgorithm setWinRegionWidth:](self->_awbAlgo, "setWinRegionWidth:", 4 * (rect.size.width / v68));
      -[AWBAlgorithm setWinRegionHeight:](self->_awbAlgo, "setWinRegionHeight:", 4 * (rect.size.height / v68));
      v13 = -[AWBAlgorithm process](self->_awbAlgo, "process");
      if (!v13)
      {
        v46 = -[AWBAlgorithm awbComboGains](self->_awbAlgo, "awbComboGains");
        -[AWBIBPParams setAwbComboGains:](self->_awbParams, "setAwbComboGains:", v46, v47);
        v48 = -[AWBAlgorithm awbComboGainsNormalized](self->_awbAlgo, "awbComboGainsNormalized");
        -[AWBIBPParams setAwbComboGainsNormalized:](self->_awbParams, "setAwbComboGainsNormalized:", v48, v49);
        v50 = -[AWBAlgorithm awbGains](self->_awbAlgo, "awbGains");
        -[AWBIBPParams setAwbGains:](self->_awbParams, "setAwbGains:", v50, v51);
        -[AWBAlgorithm outputMetadata](self->_awbAlgo, "outputMetadata");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[AWBIBPParams setOutputMetadata:](self->_awbParams, "setOutputMetadata:", v52);

      }
    }
    else
    {
      v13 = FigSignalErrorAt();
    }
    v3 = (_DWORD *)MEMORY[0x24BDC0B48];
  }
  else
  {
    v13 = FigSignalErrorAt();
    v3 = (_DWORD *)MEMORY[0x24BDC0B48];
    v39 = v55;
  }
LABEL_13:
  FigMetalDecRef();
  if (*v3 == 1)
    kdebug_trace();
  -[FigMetalContext allocator](self->_metalContext, "allocator");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "usedSizeAll");

  return v13;
}

- (int)finishProcessing
{
  return 0;
}

- (int)prewarm
{
  return 0;
}

- (int)purgeResources
{
  void *v3;
  void *v4;

  -[FigMetalContext allocator](self->_metalContext, "allocator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reset");

  if (!self->_externalMemoryResource)
  {
    -[FigMetalContext allocator](self->_metalContext, "allocator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "purgeResources");

  }
  self->_allocatorSetupComplete = 0;
  -[AWBStatistics _purgeANSTNetwork](self->_awbStats, "_purgeANSTNetwork");
  return 0;
}

- (int)resetState
{
  self->_configured = 0;
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[AWBProcessor resetState](self, "resetState");
  -[AWBProcessor purgeResources](self, "purgeResources");
  v3.receiver = self;
  v3.super_class = (Class)AWBProcessor;
  -[AWBProcessor dealloc](&v3, sel_dealloc);
}

+ (int)getColorCalibrationsUsingIdealColorCalbrations:(id)a3 absoluteColorCalibrations:(id)a4 colorCalibrationsOut:(id *)a5 awbConfig:(id)a6
{
  return +[AWBAlgorithm getColorCalibrationsUsingIdealColorCalbrations:absoluteColorCalibrations:colorCalibrationsOut:awbConfig:](AWBAlgorithm, "getColorCalibrationsUsingIdealColorCalbrations:absoluteColorCalibrations:colorCalibrationsOut:awbConfig:", a3, a4, a5, a6);
}

+ (int)calculateSTRBKeyFromWideCamera:(id *)a3 moduleConfig:(id)a4
{
  return +[AWBAlgorithm calculateSTRBKeyFromWideCamera:moduleConfig:](AWBAlgorithm, "calculateSTRBKeyFromWideCamera:moduleConfig:", a3, a4);
}

+ (int)getInternalAWBMetadataForMIWB:(id)a3 cameraInfo:(id)a4 metadata:(id)a5 validRect:(id)a6 secondaryModuleConfig:(id)a7 secondaryCameraInfo:(id)a8
{
  return +[AWBAlgorithm getInternalAWBMetadataForMIWB:cameraInfo:metadata:validRect:secondaryModuleConfig:secondaryCameraInfo:](AWBAlgorithm, "getInternalAWBMetadataForMIWB:cameraInfo:metadata:validRect:secondaryModuleConfig:secondaryCameraInfo:", a3, a4, a5, a6, a7, a8);
}

- (NSDictionary)tuningParameters
{
  return self->_tuningParameters;
}

- (void)setTuningParameters:(id)a3
{
  objc_storeStrong((id *)&self->_tuningParameters, a3);
}

- (MTLCommandQueue)metalCommandQueue
{
  return self->_metalCommandQueue;
}

- (AWBIBPParams)awbParams
{
  return self->_awbParams;
}

- (CMIExternalMemoryResource)externalMemoryResource
{
  return self->_externalMemoryResource;
}

- (void)setExternalMemoryResource:(id)a3
{
  objc_storeStrong((id *)&self->_externalMemoryResource, a3);
}

- (NSDictionary)cameraInfoByPortType
{
  return self->cameraInfoByPortType;
}

- (void)setCameraInfoByPortType:(id)a3
{
  objc_storeStrong((id *)&self->cameraInfoByPortType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_externalMemoryResource, 0);
  objc_storeStrong((id *)&self->_awbParams, 0);
  objc_storeStrong((id *)&self->_metalCommandQueue, 0);
  objc_storeStrong((id *)&self->_tuningParameters, 0);
  objc_storeStrong((id *)&self->_awbAlgo, 0);
  objc_storeStrong((id *)&self->_awbStats, 0);
  objc_storeStrong((id *)&self->_stats, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end
