@implementation AWBStatistics

- (AWBStatistics)initWithMetalContext:(id)a3
{
  id v5;
  _DWORD *v6;
  AWBStatistics *v7;
  AWBStatistics *v8;
  AWBStatistics *v9;
  objc_super v11;

  v5 = a3;
  v6 = (_DWORD *)MEMORY[0x24BDC0B48];
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();
  v11.receiver = self;
  v11.super_class = (Class)AWBStatistics;
  v7 = -[AWBStatistics init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v7->_metalContext, a3);
      if (!-[AWBStatistics _createShaders](v8, "_createShaders"))
      {
        v9 = v8;
        goto LABEL_7;
      }
    }
    else
    {
      FigSignalErrorAt();
    }
  }
  if (*v6 == 1)
    kdebug_trace();
  v9 = 0;
LABEL_7:

  return v9;
}

- (int)_createShaders
{
  _DWORD *v3;
  MTLComputePipelineState *v4;
  MTLComputePipelineState *resetMtlBufferPipelineState;
  MTLComputePipelineState *v6;
  MTLComputePipelineState *computeAWBStatsBayerPipelineState;
  MTLComputePipelineState *v8;
  MTLComputePipelineState *computeAWBStatsBayerFastPipelineState;
  MTLComputePipelineState *v10;
  MTLComputePipelineState *computeAWBStatsQuadraFastPipelineState;
  MTLComputePipelineState *v12;
  MTLComputePipelineState *normTileStatsPipelineState;
  MTLComputePipelineState *v14;
  MTLComputePipelineState *normWindowStatsPipelineState;
  MTLComputePipelineState *v16;
  MTLComputePipelineState *resizeANST;
  MTLComputePipelineState *v18;
  MTLComputePipelineState *fitWbTmRGBToANSTInput;
  int v20;

  v3 = (_DWORD *)MEMORY[0x24BDC0B48];
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();
  -[FigMetalContext computePipelineStateFor:constants:](self->_metalContext, "computePipelineStateFor:constants:", CFSTR("resetMtlBuffer"), 0);
  v4 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  resetMtlBufferPipelineState = self->_resetMtlBufferPipelineState;
  self->_resetMtlBufferPipelineState = v4;

  if (!self->_resetMtlBufferPipelineState)
    goto LABEL_15;
  -[FigMetalContext computePipelineStateFor:constants:](self->_metalContext, "computePipelineStateFor:constants:", CFSTR("awbStatsBayer"), 0);
  v6 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  computeAWBStatsBayerPipelineState = self->_computeAWBStatsBayerPipelineState;
  self->_computeAWBStatsBayerPipelineState = v6;

  if (!self->_computeAWBStatsBayerPipelineState)
    goto LABEL_15;
  -[FigMetalContext computePipelineStateFor:constants:](self->_metalContext, "computePipelineStateFor:constants:", CFSTR("awbStatsBayerFast"), 0);
  v8 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  computeAWBStatsBayerFastPipelineState = self->_computeAWBStatsBayerFastPipelineState;
  self->_computeAWBStatsBayerFastPipelineState = v8;

  if (!self->_computeAWBStatsBayerFastPipelineState)
    goto LABEL_15;
  -[FigMetalContext computePipelineStateFor:constants:](self->_metalContext, "computePipelineStateFor:constants:", CFSTR("awbStatsQuadraFast"), 0);
  v10 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  computeAWBStatsQuadraFastPipelineState = self->_computeAWBStatsQuadraFastPipelineState;
  self->_computeAWBStatsQuadraFastPipelineState = v10;

  if (!self->_computeAWBStatsQuadraFastPipelineState)
    goto LABEL_15;
  -[FigMetalContext computePipelineStateFor:constants:](self->_metalContext, "computePipelineStateFor:constants:", CFSTR("normTileStats"), 0);
  v12 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  normTileStatsPipelineState = self->_normTileStatsPipelineState;
  self->_normTileStatsPipelineState = v12;

  if (!self->_normTileStatsPipelineState)
    goto LABEL_15;
  -[FigMetalContext computePipelineStateFor:constants:](self->_metalContext, "computePipelineStateFor:constants:", CFSTR("normWindowStats"), 0);
  v14 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  normWindowStatsPipelineState = self->_normWindowStatsPipelineState;
  self->_normWindowStatsPipelineState = v14;

  if (!self->_normWindowStatsPipelineState)
    goto LABEL_15;
  -[FigMetalContext computePipelineStateFor:constants:](self->_metalContext, "computePipelineStateFor:constants:", CFSTR("resizeANST"), 0);
  v16 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  resizeANST = self->_resizeANST;
  self->_resizeANST = v16;

  if (!self->_resizeANST)
    goto LABEL_15;
  -[FigMetalContext computePipelineStateFor:constants:](self->_metalContext, "computePipelineStateFor:constants:", CFSTR("fitWbTmRGBToANSTInput"), 0);
  v18 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  fitWbTmRGBToANSTInput = self->_fitWbTmRGBToANSTInput;
  self->_fitWbTmRGBToANSTInput = v18;

  if (self->_fitWbTmRGBToANSTInput)
    v20 = 0;
  else
LABEL_15:
    v20 = FigSignalErrorAt();
  if (*v3 == 1)
    kdebug_trace();
  return v20;
}

- (int)_loadANSTNetwork
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *context;
  void *plan;
  id v11;
  int v12;

  if (self->_espressoContext)
  {
    v3 = 0;
    v5 = 0;
    v7 = 0;
    v11 = 0;
  }
  else
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFD248]), "initWithVersion:", 0x10000);
    if (!v3)
    {
      v12 = FigSignalErrorAt();
      v5 = 0;
      v7 = 0;
      v11 = 0;
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLForResource:withExtension:subdirectory:", CFSTR("anst"), CFSTR("mlmodelc"), CFSTR("Models"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v12 = FigSignalErrorAt();
      v7 = 0;
      v11 = 0;
      goto LABEL_11;
    }
    objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("model.espresso.net"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6)
    {
      v12 = FigSignalErrorAt();
      v11 = 0;
      goto LABEL_11;
    }
    objc_msgSend(v6, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v11 = 0;
      v12 = FigSignalErrorAt();
      goto LABEL_11;
    }
    context = (void *)espresso_create_context();
    self->_espressoContext = context;
    if (!context
      || (plan = (void *)espresso_create_plan(), (self->_espressoPlan = plan) == 0)
      || (v11 = objc_retainAutorelease(v8), objc_msgSend(v11, "UTF8String"), espresso_plan_add_network())
      || espresso_plan_build())
    {
      v12 = FigSignalErrorAt();
      v11 = v8;
      goto LABEL_11;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (int)_purgeANSTNetwork
{
  void **p_espressoContext;

  p_espressoContext = &self->_espressoContext;
  if (self->_espressoContext)
  {
    if (!self->_espressoPlan || (espresso_plan_destroy(), *p_espressoContext))
      espresso_context_destroy();
    *p_espressoContext = 0;
    p_espressoContext[1] = 0;
  }
  return 0;
}

- (int)configWithRegs:(id)a3
{
  id v4;
  _DWORD *v5;
  int v6;
  int v8;
  char v9;
  char v10;

  v4 = a3;
  v5 = (_DWORD *)MEMORY[0x24BDC0B48];
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();
  if (!objc_msgSend(v4, "count"))
  {
    v8 = FigSignalErrorAt();
LABEL_23:
    v6 = v8;
    goto LABEL_17;
  }
  bzero(&self->_awbStatCfg, 0xA30uLL);
  self->_awbStatCfg.downsizeRatio = 4;
  v10 = 0;
  self->_awbStatCfg.firstPix = objc_msgSend(v4, "cmi_intValueForKey:defaultValue:found:", CFSTR("FirstPix"), 0, &v10);
  if (!v10)
  {
    v8 = FigSignalErrorAt();
    goto LABEL_23;
  }
  self->_awbStatCfg.layout = 1;
  v9 = 0;
  self->_awbStatCfg.greenAverage = objc_msgSend(v4, "cmi_intValueForKey:defaultValue:found:", CFSTR("GreenAverage"), 0, &v9);
  if (!v9)
  {
    v8 = FigSignalErrorAt();
    goto LABEL_23;
  }
  v6 = configCCM((float32x2_t *)&self->_anon_7c[4], v4);
  if (!v6)
  {
    v6 = configGAM((uint64_t)&self->_anon_7c[116], v4);
    if (!v6)
    {
      v6 = configCSC((float32x2_t *)&self->_anon_7c[772], v4);
      if (!v6)
      {
        v6 = configCSC2((float32x2_t *)&self->_anon_7c[900], v4);
        if (!v6)
        {
          v6 = configColorHist((float32x4_t *)&self->_anon_7c[1028], v4);
          if (!v6)
          {
            v6 = configPixFilt((uint64_t)&self->_anon_7c[1188], v4, 0);
            if (!v6)
            {
              v6 = configAWBStatsDB((float32x4_t *)&self->_anon_7c[1284], v4, 0);
              if (!v6)
              {
                v6 = configPixFilt((uint64_t)&self->_anon_7c[1232], v4, 1);
                if (!v6)
                {
                  v6 = configAWBStatsDB((float32x4_t *)&self->_anon_7c[1316], v4, 1);
                  if (!v6)
                  {
                    v6 = configTiles((uint64_t)&self->_anon_7c[1444], v4);
                    if (!v6)
                    {
                      v6 = 0;
                      *(_DWORD *)&self->_anon_7c[2592] = -[NSNumber intValue](self->_digitalFlash, "intValue");
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_17:
  if (*v5 == 1)
    kdebug_trace();

  return v6;
}

- (int)configWithRegs:(id)a3 metadata:(id)a4 cameraInfo:(id)a5
{
  id v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  float v19;
  int v20;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  char v27;
  char v28;
  char v29;
  char v30;
  char v31;
  char v32;
  char v33;
  char v34;
  char v35;
  char v36;

  v26 = a3;
  v8 = a4;
  v23 = a5;
  v22 = v8;
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();
  if (!objc_msgSend(v26, "count"))
  {
    v20 = FigSignalErrorAt();
    goto LABEL_55;
  }
  bzero(&self->_awbStatCfg, 0xA30uLL);
  self->_awbStatCfg.downsizeRatio = 4;
  v28 = 0;
  self->_awbStatCfg.firstPix = objc_msgSend(v26, "cmi_intValueForKey:defaultValue:found:", CFSTR("FirstPix"), 0, &v28);
  if (!v28)
  {
    v20 = FigSignalErrorAt();
    goto LABEL_55;
  }
  v27 = 0;
  self->_awbStatCfg.greenAverage = objc_msgSend(v26, "cmi_intValueForKey:defaultValue:found:", CFSTR("GreenAverage"), 0, &v27);
  if (!v27)
  {
    v20 = FigSignalErrorAt();
    goto LABEL_55;
  }
  v9 = configCCM((float32x2_t *)&self->_anon_7c[4], v26);
  if (!v9)
  {
    v9 = configGAM((uint64_t)&self->_anon_7c[116], v26);
    if (!v9)
    {
      v9 = configCSC((float32x2_t *)&self->_anon_7c[772], v26);
      if (!v9)
      {
        v9 = configCSC2((float32x2_t *)&self->_anon_7c[900], v26);
        if (!v9)
        {
          v9 = configColorHist((float32x4_t *)&self->_anon_7c[1028], v26);
          if (!v9)
          {
            v9 = configPixFilt((uint64_t)&self->_anon_7c[1188], v26, 0);
            if (!v9)
            {
              v9 = configAWBStatsDB((float32x4_t *)&self->_anon_7c[1284], v26, 0);
              if (!v9)
              {
                v9 = configPixFilt((uint64_t)&self->_anon_7c[1232], v26, 1);
                if (!v9)
                {
                  v9 = configAWBStatsDB((float32x4_t *)&self->_anon_7c[1316], v26, 1);
                  if (!v9)
                  {
                    v25 = v26;
                    if (*MEMORY[0x24BDC0B48] == 1)
                      kdebug_trace();
                    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("Config"));
                    v10 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v10, "count"))
                    {
                      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("AWBAEConfig"));
                      v11 = (void *)objc_claimAutoreleasedReturnValue();
                      if (objc_msgSend(v11, "count"))
                      {
                        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("AWBAEWindowStartXY"));
                        v12 = (void *)objc_claimAutoreleasedReturnValue();
                        if (objc_msgSend(v12, "count"))
                        {
                          objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("AWBAEWindowEndXY"));
                          v13 = (void *)objc_claimAutoreleasedReturnValue();
                          if (!objc_msgSend(v13, "count"))
                            goto LABEL_83;
                          v36 = 0;
                          self->_anon_7c[1389] = objc_msgSend(v10, "cmi_intValueForKey:defaultValue:found:", CFSTR("AWBAEStatsWindowBitDepth"), 0, &v36) != 0;
                          if (!v36)
                            goto LABEL_83;
                          v35 = 0;
                          self->_anon_7c[1388] = objc_msgSend(v11, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("Enable"), 0, 0, &v35) != 0;
                          if (!v35)
                            goto LABEL_83;
                          v34 = 0;
                          *(_DWORD *)&self->_anon_7c[1392] = objc_msgSend(v11, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("PF0Sel"), 0, 0, &v34);
                          if (!v34)
                            goto LABEL_83;
                          v33 = 0;
                          *(_DWORD *)&self->_anon_7c[1396] = objc_msgSend(v11, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("PF1Sel"), 0, 0, &v33);
                          if (!v33)
                            goto LABEL_83;
                          v32 = 0;
                          *(_DWORD *)&self->_anon_7c[1400] = objc_msgSend(v12, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("StartX"), 0, 0, &v32);
                          if (!v32)
                            goto LABEL_83;
                          v31 = 0;
                          *(_DWORD *)&self->_anon_7c[1404] = objc_msgSend(v12, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("StartY"), 0, 0, &v31);
                          if (v31
                            && (v30 = 0,
                                *(_DWORD *)&self->_anon_7c[1408] = objc_msgSend(v13, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("EndX"), 0, 0, &v30), v30)&& (v29 = 0, *(_DWORD *)&self->_anon_7c[1412] = objc_msgSend(v13, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("EndY"), 0, 0, &v29), v29))
                          {
                            v9 = 0;
                          }
                          else
                          {
LABEL_83:
                            v9 = FigSignalErrorAt();
                          }
                        }
                        else
                        {
                          v9 = FigSignalErrorAt();
                          v13 = 0;
                        }
                      }
                      else
                      {
                        v9 = FigSignalErrorAt();
                        v12 = 0;
                        v13 = 0;
                      }
                    }
                    else
                    {
                      v9 = FigSignalErrorAt();
                      v11 = 0;
                      v12 = 0;
                      v13 = 0;
                    }
                    if (*MEMORY[0x24BDC0B48] == 1)
                      kdebug_trace();

                    v8 = v22;
                    if (!v9)
                    {
                      v24 = v25;
                      if (*MEMORY[0x24BDC0B48] == 1)
                        kdebug_trace();
                      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("Config"));
                      v14 = (void *)objc_claimAutoreleasedReturnValue();
                      if (objc_msgSend(v14, "count"))
                      {
                        objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("AWBAEConfig"));
                        v15 = (void *)objc_claimAutoreleasedReturnValue();
                        if (objc_msgSend(v15, "count"))
                        {
                          objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("AWBAEWindowStartXY"));
                          v16 = (void *)objc_claimAutoreleasedReturnValue();
                          if (objc_msgSend(v16, "count"))
                          {
                            objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("AWBAEWindowEndXY"));
                            v17 = (void *)objc_claimAutoreleasedReturnValue();
                            if (!objc_msgSend(v17, "count"))
                              goto LABEL_84;
                            v36 = 0;
                            self->_anon_7c[1417] = objc_msgSend(v14, "cmi_intValueForKey:defaultValue:found:", CFSTR("AWBAEStatsWindowBitDepth"), 0, &v36) != 0;
                            if (!v36)
                              goto LABEL_84;
                            v35 = 0;
                            self->_anon_7c[1416] = objc_msgSend(v15, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("Enable"), 1, 0, &v35) != 0;
                            if (!v35)
                              goto LABEL_84;
                            v34 = 0;
                            *(_DWORD *)&self->_anon_7c[1420] = objc_msgSend(v15, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("PF0Sel"), 1, 0, &v34);
                            if (!v34)
                              goto LABEL_84;
                            v33 = 0;
                            *(_DWORD *)&self->_anon_7c[1424] = objc_msgSend(v15, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("PF1Sel"), 1, 0, &v33);
                            if (!v33)
                              goto LABEL_84;
                            v32 = 0;
                            *(_DWORD *)&self->_anon_7c[1428] = objc_msgSend(v16, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("StartX"), 1, 0, &v32);
                            if (!v32)
                              goto LABEL_84;
                            v31 = 0;
                            *(_DWORD *)&self->_anon_7c[1432] = objc_msgSend(v16, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("StartY"), 1, 0, &v31);
                            if (v31
                              && (v30 = 0,
                                  *(_DWORD *)&self->_anon_7c[1436] = objc_msgSend(v17, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("EndX"), 1, 0, &v30), v30)&& (v29 = 0, *(_DWORD *)&self->_anon_7c[1440] = objc_msgSend(v17, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("EndY"), 1, 0, &v29), v29))
                            {
                              v9 = 0;
                            }
                            else
                            {
LABEL_84:
                              v9 = FigSignalErrorAt();
                            }
                          }
                          else
                          {
                            v9 = FigSignalErrorAt();
                            v17 = 0;
                          }
                        }
                        else
                        {
                          v9 = FigSignalErrorAt();
                          v16 = 0;
                          v17 = 0;
                        }
                      }
                      else
                      {
                        v9 = FigSignalErrorAt();
                        v15 = 0;
                        v16 = 0;
                        v17 = 0;
                      }
                      if (*MEMORY[0x24BDC0B48] == 1)
                        kdebug_trace();

                      v8 = v22;
                      if (!v9)
                      {
                        v9 = configTiles((uint64_t)&self->_anon_7c[1444], v24);
                        if (!v9 && (!v23 || (v9 = configLSC((uint64_t)&self->_anon_7c[1348], v22, v23, 1)) == 0))
                        {
                          objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x24BE11A70]);
                          v18 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v18, "floatValue");
                          self->_awbStatCfg.ispDGain = v19 * 0.0039062;

                          *(_DWORD *)&self->_anon_7c[2592] = -[NSNumber intValue](self->_digitalFlash, "intValue");
                          v20 = configLinearRGBToANSTInput((uint64_t)&self->_anon_7c[1476], v22);
LABEL_55:
                          v9 = v20;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();

  return v9;
}

- (int)configWithSetFile:(id)a3 metadata:(id)a4 cameraInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  float v28;
  int v29;
  id v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE11D20]);
  v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = objc_msgSend(v31, "bytes");
  v12 = v11;
  if (!v11)
    goto LABEL_18;
  v13 = *(unsigned int *)(v11 + 28);
  if (!(_DWORD)v13)
    goto LABEL_18;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CSCConfig"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    goto LABEL_18;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ColorCalIdeal"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    goto LABEL_18;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AbsoluteColorCalibrationData"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
    goto LABEL_18;
  v17 = *MEMORY[0x24BE11C08];
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE11C08]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
    goto LABEL_18;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CSCConfig"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ColorCalIdeal"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AbsoluteColorCalibrationData"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *(_DWORD *)(v12 + v13 + 1700);
  objc_msgSend(v9, "objectForKeyedSubscript:", v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = configCCM((uint64_t)&self->_anon_7c[4], v19, v20, v21, objc_msgSend(v23, "intValue"), v9, (float)v22);

  if (v24)
    goto LABEL_15;
  v25 = *MEMORY[0x24BE11A70];
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE11A70]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
  {
LABEL_18:
    v29 = FigSignalErrorAt();
    goto LABEL_14;
  }
  if (!v10 || (v24 = configLSC((uint64_t)&self->_anon_7c[1348], v9, v10, 1)) == 0)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "floatValue");
    self->_awbStatCfg.ispDGain = v28 * 0.0039062;

    *(_DWORD *)&self->_anon_7c[2592] = -[NSNumber intValue](self->_digitalFlash, "intValue");
    v29 = configLinearRGBToANSTInput((uint64_t)&self->_anon_7c[1476], v9);
LABEL_14:
    v24 = v29;
  }
LABEL_15:
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();

  return v24;
}

- (int)configWithModuleConfig:(id)a3 metadata:(id)a4 cameraInfo:(id)a5 awbParams:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  NSNumber *v15;
  NSNumber *digitalFlash;
  NSNumber *v17;
  NSNumber *skipDemosaic;
  NSNumber *v19;
  NSNumber *lscMaxGain;
  NSNumber *v21;
  NSNumber *faceAssistedBehaviorMode;
  NSNumber *v23;
  NSNumber *downsizeFactor;
  void *v25;
  void *v26;
  void *v27;
  float v28;
  float v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  float v40;
  void *v41;
  id v42;
  uint64_t v43;
  unsigned __int8 *v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  float32x2_t v50;
  float32x2_t v51;
  float32x2_t v52;
  float v53;
  float32x2_t v54;
  float v55;
  uint64_t v56;
  int v57;
  __int128 v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  float32x2_t v64;
  float32x2_t v65;
  float32x2_t v66;
  float v67;
  float32x2_t v68;
  float v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  float32x4_t *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  float v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  void *v88;
  void *v89;
  id v90;
  uint64_t v91;
  float32x4_t *v92;
  uint64_t v93;
  id v94;
  void *v95;
  void *v96;
  id v97;
  uint64_t v98;
  float32x4_t *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  int v105;
  int v106;
  unsigned __int16 v107;
  NSNumber *v108;
  NSNumber *v109;
  NSNumber *v110;
  int v111;
  int v113;
  NSNumber *v114;
  NSNumber *v115;
  int v116;
  void *v117;
  id v118;
  id v119;
  void *v120;
  id v121;
  void *v122;
  __int128 v123;
  char v124;
  float32x2_t v125;
  float v126;
  float32x2_t v127;
  float v128;
  float32x2_t v129;
  float v130;
  uint64_t v131;

  v131 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v121 = a4;
  v118 = a5;
  v119 = a6;
  v117 = v10;
  if (v10 && v121 && v118 && v119)
  {
    if (*MEMORY[0x24BDC0B48] == 1)
      kdebug_trace();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AutoWhiteBalance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "firstPixel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "intValue");

    objc_msgSend(v119, "cfaLayout");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = objc_msgSend(v14, "intValue");

    objc_msgSend(v119, "digitalFlash");
    v15 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    digitalFlash = self->_digitalFlash;
    self->_digitalFlash = v15;

    objc_msgSend(v119, "skipDemosaic");
    v17 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    skipDemosaic = self->_skipDemosaic;
    self->_skipDemosaic = v17;

    objc_msgSend(v119, "lscMaxGain");
    v19 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    lscMaxGain = self->_lscMaxGain;
    self->_lscMaxGain = v19;

    objc_msgSend(v119, "faceAssistedBehaviorMode");
    v21 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    faceAssistedBehaviorMode = self->_faceAssistedBehaviorMode;
    self->_faceAssistedBehaviorMode = v21;

    objc_msgSend(v119, "downsizeFactor");
    v23 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    downsizeFactor = self->_downsizeFactor;
    self->_downsizeFactor = v23;

    v25 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v121, "objectForKeyedSubscript:", *MEMORY[0x24BE11C68]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "doubleValue");
    objc_msgSend(v25, "numberWithDouble:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v120 = v27;
    if (v27)
    {
      objc_msgSend(v27, "floatValue");
      v29 = v28 * 256.0;
    }
    else
    {
      v29 = 1.0;
    }
    bzero(&self->_awbStatCfg, 0xA30uLL);
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("CSC"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30
      && (objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("IdealColorCalibrations")),
          (v122 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v118, "objectForKeyedSubscript:", *MEMORY[0x24BE11A28]);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v31)
        goto LABEL_216;
      v32 = *MEMORY[0x24BE11C08];
      objc_msgSend(v121, "objectForKeyedSubscript:", *MEMORY[0x24BE11C08]);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v33)
        goto LABEL_216;
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("CSC"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "objectForKeyedSubscript:", v32);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = configCCM((uint64_t)&self->_anon_7c[4], v34, v122, v31, objc_msgSend(v35, "intValue"), v121, v29);

      if (v36)
        goto LABEL_188;
      v37 = *MEMORY[0x24BE11A70];
      objc_msgSend(v121, "objectForKeyedSubscript:", *MEMORY[0x24BE11A70]);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v38)
      {
LABEL_216:
        v111 = FigSignalErrorAt();
        goto LABEL_187;
      }
      objc_msgSend(v121, "objectForKeyedSubscript:", v37);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "floatValue");
      self->_awbStatCfg.ispDGain = v40 * 0.0039062;

      self->_awbStatCfg.firstPix = v13;
      self->_awbStatCfg.layout = v116;
      v125.i8[0] = 0;
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Stats"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      self->_awbStatCfg.greenAverage = objc_msgSend(v41, "cmi_intValueForKey:defaultValue:found:", CFSTR("GreenAverage"), 0, &v125);

      if (!v125.i8[0])
      {
        v111 = FigSignalErrorAt();
        goto LABEL_187;
      }
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Gamma"));
      v42 = (id)objc_claimAutoreleasedReturnValue();
      if (*MEMORY[0x24BDC0B48] == 1)
        kdebug_trace();
      v43 = 0;
      v44 = &self->_anon_7c[644];
      v125.i8[0] = 0;
      while (1)
      {
        *(_WORD *)&self->_anon_7c[2 * v43 + 116] = objc_msgSend(v42, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("LUT"), v43, 0, &v125);
        if (!v125.i8[0])
          break;
        if (++v43 == 257)
        {
          v45 = 0;
          v125.i8[0] = 0;
          while (1)
          {
            *(_DWORD *)&v44[4 * v45] = objc_msgSend(v42, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("OffsetIn"), v45, 0, &v125);
            if (!v125.i8[0])
              goto LABEL_203;
            if (++v45 == 3)
            {
              v46 = 0;
              v125.i8[0] = 0;
              while (1)
              {
                *(_DWORD *)&v44[4 * v46 + 16] = objc_msgSend(v42, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("OffsetOut"), v46, 0, &v125);
                if (!v125.i8[0])
                  goto LABEL_203;
                if (++v46 == 3)
                {
                  *(_WORD *)&self->_anon_7c[688] = 0;
                  self->_anon_7c[690] = 0;
                  *(_QWORD *)&self->_anon_7c[676] = 0;
                  self->_anon_7c[684] = 0;
                  *(_QWORD *)&self->_anon_7c[692] = 0x100000000FFFFLL;
                  *(_DWORD *)&self->_anon_7c[700] = 983297;
                  *(_WORD *)&self->_anon_7c[704] = 0;
                  *(_OWORD *)&self->_anon_7c[706] = numIntervalArrayFixedCfgLinear;
                  *(_OWORD *)&self->_anon_7c[722] = *(_OWORD *)algn_230930484;
                  memset_pattern16(&self->_anon_7c[738], asc_230930450, 0x20uLL);
                  v36 = 0;
                  goto LABEL_29;
                }
              }
            }
          }
        }
      }
LABEL_203:
      v36 = FigSignalErrorAt();
LABEL_29:
      if (*MEMORY[0x24BDC0B48] == 1)
        kdebug_trace();

      if (!v36)
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("CSC"));
        v47 = (id)objc_claimAutoreleasedReturnValue();
        if (*MEMORY[0x24BDC0B48] == 1)
          kdebug_trace();
        v48 = 0;
        v124 = 0;
        while (1)
        {
          v125.f32[v48] = (float)(int)objc_msgSend(v47, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("CSCCoef"), v48, 0, &v124);
          if (!v124)
            break;
          if (++v48 == 9)
          {
            v49 = 0;
            v50 = (float32x2_t)vdup_n_s32(0x39800000u);
            v51 = vmul_f32(v125, v50);
            v52 = vmul_f32(v127, v50);
            v53 = v128 * 0.00024414;
            v54 = vmul_f32(v129, v50);
            v55 = v130 * 0.00024414;
            *(float *)&self->_anon_7c[780] = v126 * 0.00024414;
            *(float32x2_t *)&self->_anon_7c[772] = v51;
            *(float *)&self->_anon_7c[796] = v53;
            *(float32x2_t *)&self->_anon_7c[788] = v52;
            *(float *)&self->_anon_7c[812] = v55;
            *(float32x2_t *)&self->_anon_7c[804] = v54;
            v125.i8[0] = 0;
            while (1)
            {
              *(float *)&v44[4 * v49 + 208] = (float)(int)objc_msgSend(v47, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("CSCOffsetIn"), v49, 0, &v125);
              if (!v125.i8[0])
                goto LABEL_192;
              if (++v49 == 3)
              {
                v56 = 0;
                v125.i8[0] = 0;
                while (1)
                {
                  v57 = objc_msgSend(v47, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("CSCOffset"), v56, 0, &v125);
                  v123 = *(_OWORD *)&self->_anon_7c[868];
                  *(float *)((unint64_t)&v123 & 0xFFFFFFFFFFFFFFF3 | (4 * (v56 & 3))) = (float)v57;
                  v58 = v123;
                  *(_DWORD *)&self->_anon_7c[876] = DWORD2(v123);
                  *(_QWORD *)&self->_anon_7c[868] = v58;
                  if (!v125.i8[0])
                    break;
                  if (++v56 == 3)
                  {
                    v59 = 0;
                    *(float *)&self->_anon_7c[876] = *((float *)&v58 + 2) + 7483.0;
                    *(float32x2_t *)&self->_anon_7c[868] = vadd_f32(*(float32x2_t *)&v58, (float32x2_t)vdup_n_s32(0x45E9D800u));
                    v125.i8[0] = 0;
                    while (1)
                    {
                      *(float *)&v44[4 * v59 + 176] = (float)(int)objc_msgSend(v47, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("CSCMin"), v59, 0, &v125);
                      if (!v125.i8[0])
                        goto LABEL_210;
                      if (++v59 == 3)
                      {
                        v60 = 0;
                        v125.i8[0] = 0;
                        while (1)
                        {
                          *(float *)&v44[4 * v60 + 192] = (float)(int)objc_msgSend(v47, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("CSCMax"), v60, 0, &v125);
                          if (!v125.i8[0])
                            goto LABEL_210;
                          if (++v60 == 3)
                          {
                            v125.i8[0] = 0;
                            *(float *)&self->_anon_7c[884] = (float)(int)objc_msgSend(v47, "cmi_intValueForKey:defaultValue:found:", CFSTR("CSCChromaScale0"), 0, &v125);
                            if (v125.i8[0])
                            {
                              v125.i8[0] = 0;
                              *(float *)&self->_anon_7c[888] = (float)(int)objc_msgSend(v47, "cmi_intValueForKey:defaultValue:found:", CFSTR("CSCChromaScale1"), 0, &v125);
                              if (v125.i8[0])
                              {
                                v36 = 0;
                                *(float32x2_t *)&self->_anon_7c[884] = vmul_f32(*(float32x2_t *)&self->_anon_7c[884], (float32x2_t)0x3900000039000000);
                                goto LABEL_52;
                              }
                            }
                            goto LABEL_210;
                          }
                        }
                      }
                    }
                  }
                }
LABEL_210:
                v113 = FigSignalErrorAt();
                goto LABEL_211;
              }
            }
          }
        }
LABEL_192:
        v113 = FigSignalErrorAt();
LABEL_211:
        v36 = v113;
LABEL_52:
        if (*MEMORY[0x24BDC0B48] == 1)
          kdebug_trace();

        if (!v36)
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("CSC2"));
          v61 = (id)objc_claimAutoreleasedReturnValue();
          if (*MEMORY[0x24BDC0B48] == 1)
            kdebug_trace();
          v62 = 0;
          v124 = 0;
          while (1)
          {
            v125.f32[v62] = (float)(int)objc_msgSend(v61, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("CSCCoeff"), v62, 0, &v124);
            if (!v124)
              break;
            if (++v62 == 9)
            {
              v63 = 0;
              v64 = (float32x2_t)vdup_n_s32(0x39800000u);
              v65 = vmul_f32(v125, v64);
              v66 = vmul_f32(v127, v64);
              v67 = v128 * 0.00024414;
              v68 = vmul_f32(v129, v64);
              v69 = v130 * 0.00024414;
              *(float *)&self->_anon_7c[908] = v126 * 0.00024414;
              *(float32x2_t *)&self->_anon_7c[900] = v65;
              *(float *)&self->_anon_7c[924] = v67;
              *(float32x2_t *)&self->_anon_7c[916] = v66;
              *(float *)&self->_anon_7c[940] = v69;
              *(float32x2_t *)&self->_anon_7c[932] = v68;
              v125.i8[0] = 0;
              while (1)
              {
                *(float *)&self->_anon_7c[4 * v63 + 980] = (float)(int)objc_msgSend(v61, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("CSCOffsetIn"), v63, 0, &v125);
                if (!v125.i8[0])
                  goto LABEL_212;
                if (++v63 == 3)
                {
                  v70 = 0;
                  v125.i8[0] = 0;
                  while (1)
                  {
                    *(float *)&self->_anon_7c[4 * v70 + 996] = (float)(int)objc_msgSend(v61, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("CSCOffsetOut"), v70, 0, &v125);
                    if (!v125.i8[0])
                      goto LABEL_212;
                    if (++v70 == 3)
                    {
                      v71 = 0;
                      v125.i8[0] = 0;
                      while (1)
                      {
                        *(float *)&self->_anon_7c[4 * v71 + 948] = (float)(int)objc_msgSend(v61, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("CSCMin"), v71, 0, &v125);
                        if (!v125.i8[0])
                          goto LABEL_212;
                        if (++v71 == 3)
                        {
                          v72 = 0;
                          v125.i8[0] = 0;
                          while (1)
                          {
                            *(float *)&self->_anon_7c[4 * v72 + 964] = (float)(int)objc_msgSend(v61, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("CSCMax"), v72, 0, &v125);
                            if (!v125.i8[0])
                              goto LABEL_212;
                            if (++v72 == 3)
                            {
                              v125.i8[0] = 0;
                              *(float *)&self->_anon_7c[1012] = (float)(int)objc_msgSend(v61, "cmi_intValueForKey:defaultValue:found:", CFSTR("CSCChromaScale0"), 0, &v125);
                              if (v125.i8[0])
                              {
                                v125.i8[0] = 0;
                                *(float *)&self->_anon_7c[1016] = (float)(int)objc_msgSend(v61, "cmi_intValueForKey:defaultValue:found:", CFSTR("CSCChromaScale1"), 0, &v125);
                                if (v125.i8[0])
                                {
                                  v36 = 0;
                                  *(float32x2_t *)&self->_anon_7c[1012] = vmul_f32(*(float32x2_t *)&self->_anon_7c[1012], (float32x2_t)0x3900000039000000);
                                  goto LABEL_75;
                                }
                              }
                              goto LABEL_212;
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
LABEL_212:
          v36 = FigSignalErrorAt();
LABEL_75:
          if (*MEMORY[0x24BDC0B48] == 1)
            kdebug_trace();

          if (!v36)
          {
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Histogram"));
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("Config"));
            v74 = (id)objc_claimAutoreleasedReturnValue();
            if (*MEMORY[0x24BDC0B48] == 1)
              kdebug_trace();
            v125.i8[0] = 0;
            self->_anon_7c[1028] = objc_msgSend(v74, "cmi_intValueForKey:defaultValue:found:", CFSTR("Enable"), 0, &v125) != 0;
            if (v125.i8[0])
            {
              v125.i8[0] = 0;
              self->_anon_7c[1029] = objc_msgSend(v74, "cmi_intValueForKey:defaultValue:found:", CFSTR("CountClipEnable"), 0, &v125) != 0;
              if (v125.i8[0])
              {
                v75 = 0;
                v125.i8[0] = 0;
                while (1)
                {
                  *(float *)&self->_anon_7c[4 * v75 + 1172] = (float)(int)objc_msgSend(v74, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("DBOffset"), v75, 0, &v125);
                  if (!v125.i8[0])
                    break;
                  if (++v75 == 3)
                  {
                    v76 = 0;
                    v125.i8[0] = 0;
                    while (1)
                    {
                      *(float *)&self->_anon_7c[4 * v76 + 1156] = (float)(int)objc_msgSend(v74, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("DBMin"), v76, 0, &v125);
                      if (!v125.i8[0])
                        goto LABEL_213;
                      if (++v76 == 3)
                      {
                        v77 = 0;
                        v125.i8[0] = 0;
                        while (1)
                        {
                          *(float *)&self->_anon_7c[4 * v77 + 1140] = (float)(int)objc_msgSend(v74, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("DBMax"), v77, 0, &v125);
                          if (!v125.i8[0])
                            goto LABEL_213;
                          if (++v77 == 3)
                          {
                            v78 = 0;
                            v125.i8[0] = 0;
                            v79 = (float32x4_t *)&self->_anon_7c[1124];
                            while (1)
                            {
                              v79->f32[v78] = (float)(int)objc_msgSend(v74, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("DBGain"), v78, 0, &v125);
                              if (!v125.i8[0])
                                goto LABEL_213;
                              if (++v78 == 3)
                              {
                                *v79 = vmulq_f32(*v79, (float32x4_t)vdupq_n_s32(0x38800000u));
                                v125.i8[0] = 0;
                                objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("Region"));
                                v80 = (void *)objc_claimAutoreleasedReturnValue();
                                *(_WORD *)&self->_anon_7c[1030] = objc_msgSend(v80, "cmi_intValueForKey:defaultValue:found:", CFSTR("StartX"), 0, &v125);

                                if (v125.i8[0])
                                {
                                  v125.i8[0] = 0;
                                  objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("Region"));
                                  v81 = (void *)objc_claimAutoreleasedReturnValue();
                                  *(_WORD *)&self->_anon_7c[1032] = objc_msgSend(v81, "cmi_intValueForKey:defaultValue:found:", CFSTR("StartY"), 0, &v125);

                                  if (v125.i8[0])
                                  {
                                    *(_WORD *)&self->_anon_7c[1030] >>= 2;
                                    *(_WORD *)&self->_anon_7c[1032] >>= 2;
                                    v125.i8[0] = 0;
                                    objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("Region"));
                                    v82 = (void *)objc_claimAutoreleasedReturnValue();
                                    *(_WORD *)&self->_anon_7c[1034] = objc_msgSend(v82, "cmi_intValueForKey:defaultValue:found:", CFSTR("EndX"), 0, &v125);

                                    if (v125.i8[0])
                                    {
                                      v125.i8[0] = 0;
                                      objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("Region"));
                                      v83 = (void *)objc_claimAutoreleasedReturnValue();
                                      *(_WORD *)&self->_anon_7c[1036] = objc_msgSend(v83, "cmi_intValueForKey:defaultValue:found:", CFSTR("EndY"), 0, &v125);

                                      if (v125.i8[0])
                                      {
                                        *(_WORD *)&self->_anon_7c[1034] >>= 2;
                                        *(_WORD *)&self->_anon_7c[1036] >>= 2;
                                        v125.i8[0] = 0;
                                        *(float *)&self->_anon_7c[1040] = (float)(int)objc_msgSend(v74, "cmi_intValueForKey:defaultValue:found:", CFSTR("C1Offset"), 0, &v125);
                                        if (v125.i8[0])
                                        {
                                          v125.i8[0] = 0;
                                          *(float *)&self->_anon_7c[1044] = (float)(int)objc_msgSend(v74, "cmi_intValueForKey:defaultValue:found:", CFSTR("C2Offset"), 0, &v125);
                                          if (v125.i8[0])
                                          {
                                            v125.i8[0] = 0;
                                            *(float *)&self->_anon_7c[1048] = (float)(int)objc_msgSend(v74, "cmi_intValueForKey:defaultValue:found:", CFSTR("C1Scale"), 0, &v125);
                                            if (v125.i8[0])
                                            {
                                              v125.i8[0] = 0;
                                              v84 = (float)(int)objc_msgSend(v74, "cmi_intValueForKey:defaultValue:found:", CFSTR("C2Scale"), 0, &v125);
                                              *(float *)&self->_anon_7c[1052] = v84;
                                              if (v125.i8[0])
                                              {
                                                v85 = 0;
                                                *(float *)&self->_anon_7c[1048] = *(float *)&self->_anon_7c[1048]
                                                                                * 0.000015259;
                                                *(float *)&self->_anon_7c[1052] = v84 * 0.000015259;
                                                v125.i8[0] = 0;
                                                while (1)
                                                {
                                                  *(_WORD *)&self->_anon_7c[2 * v85 + 1056] = objc_msgSend(v74, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("Count"), v85, 0, &v125);
                                                  if (!v125.i8[0])
                                                    break;
                                                  if (++v85 == 16)
                                                  {
                                                    v86 = 0;
                                                    v125.i8[0] = 0;
                                                    while (1)
                                                    {
                                                      *(_WORD *)&self->_anon_7c[2 * v86 + 1088] = objc_msgSend(v74, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("YThd"), v86, 0, &v125);
                                                      if (!v125.i8[0])
                                                        goto LABEL_213;
                                                      if (++v86 == 15)
                                                      {
                                                        v36 = 0;
                                                        *(_WORD *)&self->_anon_7c[1118] = -1;
                                                        goto LABEL_109;
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                                goto LABEL_213;
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
LABEL_213:
            v36 = FigSignalErrorAt();
LABEL_109:
            if (*MEMORY[0x24BDC0B48] == 1)
              kdebug_trace();

            if (!v36)
            {
              objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PixelFilter"));
              v87 = (id)objc_claimAutoreleasedReturnValue();
              if (*MEMORY[0x24BDC0B48] == 1)
                kdebug_trace();
              objc_msgSend(v87, "objectAtIndexedSubscript:", 0);
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              v125.i8[0] = 0;
              self->_anon_7c[1188] = objc_msgSend(v88, "cmi_intValueForKey:defaultValue:found:", CFSTR("CondSel"), 0, &v125);
              if (!v125.i8[0])
                goto LABEL_248;
              v125.i8[0] = 0;
              self->_anon_7c[1189] = objc_msgSend(v88, "cmi_intValueForKey:defaultValue:found:", CFSTR("StatSel"), 0, &v125);
              if (!v125.i8[0])
                goto LABEL_248;
              v125.i8[0] = 0;
              self->_anon_7c[1190] = objc_msgSend(v88, "cmi_intValueForKey:defaultValue:found:", CFSTR("CountClipEnable"), 0, &v125) != 0;
              if (!v125.i8[0])
                goto LABEL_248;
              v125.i8[0] = 0;
              *(_DWORD *)&self->_anon_7c[1192] = objc_msgSend(v88, "cmi_intValueForKey:defaultValue:found:", CFSTR("LumaMin"), 0, &v125);
              if (!v125.i8[0])
                goto LABEL_248;
              v125.i8[0] = 0;
              *(_DWORD *)&self->_anon_7c[1196] = objc_msgSend(v88, "cmi_intValueForKey:defaultValue:found:", CFSTR("LumaMax"), 0, &v125);
              if (!v125.i8[0])
                goto LABEL_248;
              v125.i8[0] = 0;
              *(_DWORD *)&self->_anon_7c[1200] = objc_msgSend(v88, "cmi_intValueForKey:defaultValue:found:", CFSTR("C1Min"), 0, &v125);
              if (!v125.i8[0])
                goto LABEL_248;
              v125.i8[0] = 0;
              *(_DWORD *)&self->_anon_7c[1204] = objc_msgSend(v88, "cmi_intValueForKey:defaultValue:found:", CFSTR("C1Max"), 0, &v125);
              if (!v125.i8[0])
                goto LABEL_248;
              v125.i8[0] = 0;
              *(_DWORD *)&self->_anon_7c[1208] = objc_msgSend(v88, "cmi_intValueForKey:defaultValue:found:", CFSTR("C2Min"), 0, &v125);
              if (!v125.i8[0])
                goto LABEL_248;
              v125.i8[0] = 0;
              *(_DWORD *)&self->_anon_7c[1212] = objc_msgSend(v88, "cmi_intValueForKey:defaultValue:found:", CFSTR("C2Max"), 0, &v125);
              if (!v125.i8[0])
                goto LABEL_248;
              v125.i8[0] = 0;
              *(_DWORD *)&self->_anon_7c[1216] = objc_msgSend(v88, "cmi_intValueForKey:defaultValue:found:", CFSTR("LineMax"), 0, &v125);
              if (!v125.i8[0])
                goto LABEL_248;
              v125.i8[0] = 0;
              *(_DWORD *)&self->_anon_7c[1220] = objc_msgSend(v88, "cmi_intValueForKey:defaultValue:found:", CFSTR("LineOffset"), 0, &v125);
              if (v125.i8[0]
                && (v125.i8[0] = 0,
                    *(_DWORD *)&self->_anon_7c[1224] = objc_msgSend(v88, "cmi_intValueForKey:defaultValue:found:", CFSTR("LineDeltaC1"), 0, &v125), v125.i8[0])&& (v125.i8[0] = 0, *(_DWORD *)&self->_anon_7c[1228] = objc_msgSend(v88, "cmi_intValueForKey:defaultValue:found:", CFSTR("LineDeltaC2"), 0, &v125), v125.i8[0]))
              {
                v36 = 0;
              }
              else
              {
LABEL_248:
                v36 = FigSignalErrorAt();
              }
              if (*MEMORY[0x24BDC0B48] == 1)
                kdebug_trace();

              if (!v36)
              {
                objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PixelFilter"));
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v89, "objectAtIndexedSubscript:", 0);
                v90 = (id)objc_claimAutoreleasedReturnValue();
                v91 = 0;
                v125.i8[0] = 0;
                v92 = (float32x4_t *)&self->_anon_7c[1300];
                while (1)
                {
                  v92->f32[v91] = (float)(int)objc_msgSend(v90, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("DBGain"), v91, 0, &v125);
                  if (!v125.i8[0])
                    break;
                  if (++v91 == 3)
                  {
                    v93 = 0;
                    *v92 = vmulq_f32(*v92, (float32x4_t)vdupq_n_s32(0x38800000u));
                    v125.i8[0] = 0;
                    while (1)
                    {
                      *(_DWORD *)&self->_anon_7c[4 * v93 + 1284] = objc_msgSend(v90, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("DBOffset"), v93, 0, &v125);
                      if (!v125.i8[0])
                        goto LABEL_201;
                      if (++v93 == 3)
                      {
                        v36 = 0;
                        goto LABEL_138;
                      }
                    }
                  }
                }
LABEL_201:
                v36 = FigSignalErrorAt();
LABEL_138:

                if (!v36)
                {
                  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PixelFilter"));
                  v94 = (id)objc_claimAutoreleasedReturnValue();
                  if (*MEMORY[0x24BDC0B48] == 1)
                    kdebug_trace();
                  objc_msgSend(v94, "objectAtIndexedSubscript:", 1);
                  v95 = (void *)objc_claimAutoreleasedReturnValue();
                  v125.i8[0] = 0;
                  self->_anon_7c[1232] = objc_msgSend(v95, "cmi_intValueForKey:defaultValue:found:", CFSTR("CondSel"), 0, &v125);
                  if (!v125.i8[0])
                    goto LABEL_249;
                  v125.i8[0] = 0;
                  self->_anon_7c[1233] = objc_msgSend(v95, "cmi_intValueForKey:defaultValue:found:", CFSTR("StatSel"), 0, &v125);
                  if (!v125.i8[0])
                    goto LABEL_249;
                  v125.i8[0] = 0;
                  self->_anon_7c[1234] = objc_msgSend(v95, "cmi_intValueForKey:defaultValue:found:", CFSTR("CountClipEnable"), 0, &v125) != 0;
                  if (!v125.i8[0])
                    goto LABEL_249;
                  v125.i8[0] = 0;
                  *(_DWORD *)&self->_anon_7c[1236] = objc_msgSend(v95, "cmi_intValueForKey:defaultValue:found:", CFSTR("LumaMin"), 0, &v125);
                  if (!v125.i8[0])
                    goto LABEL_249;
                  v125.i8[0] = 0;
                  *(_DWORD *)&self->_anon_7c[1240] = objc_msgSend(v95, "cmi_intValueForKey:defaultValue:found:", CFSTR("LumaMax"), 0, &v125);
                  if (!v125.i8[0])
                    goto LABEL_249;
                  v125.i8[0] = 0;
                  *(_DWORD *)&self->_anon_7c[1244] = objc_msgSend(v95, "cmi_intValueForKey:defaultValue:found:", CFSTR("C1Min"), 0, &v125);
                  if (!v125.i8[0])
                    goto LABEL_249;
                  v125.i8[0] = 0;
                  *(_DWORD *)&self->_anon_7c[1248] = objc_msgSend(v95, "cmi_intValueForKey:defaultValue:found:", CFSTR("C1Max"), 0, &v125);
                  if (!v125.i8[0])
                    goto LABEL_249;
                  v125.i8[0] = 0;
                  *(_DWORD *)&self->_anon_7c[1252] = objc_msgSend(v95, "cmi_intValueForKey:defaultValue:found:", CFSTR("C2Min"), 0, &v125);
                  if (!v125.i8[0])
                    goto LABEL_249;
                  v125.i8[0] = 0;
                  *(_DWORD *)&self->_anon_7c[1256] = objc_msgSend(v95, "cmi_intValueForKey:defaultValue:found:", CFSTR("C2Max"), 0, &v125);
                  if (!v125.i8[0])
                    goto LABEL_249;
                  v125.i8[0] = 0;
                  *(_DWORD *)&self->_anon_7c[1260] = objc_msgSend(v95, "cmi_intValueForKey:defaultValue:found:", CFSTR("LineMax"), 0, &v125);
                  if (!v125.i8[0])
                    goto LABEL_249;
                  v125.i8[0] = 0;
                  *(_DWORD *)&self->_anon_7c[1264] = objc_msgSend(v95, "cmi_intValueForKey:defaultValue:found:", CFSTR("LineOffset"), 0, &v125);
                  if (v125.i8[0]
                    && (v125.i8[0] = 0,
                        *(_DWORD *)&self->_anon_7c[1268] = objc_msgSend(v95, "cmi_intValueForKey:defaultValue:found:", CFSTR("LineDeltaC1"), 0, &v125), v125.i8[0])&& (v125.i8[0] = 0, *(_DWORD *)&self->_anon_7c[1272] = objc_msgSend(v95, "cmi_intValueForKey:defaultValue:found:", CFSTR("LineDeltaC2"), 0, &v125), v125.i8[0]))
                  {
                    v36 = 0;
                  }
                  else
                  {
LABEL_249:
                    v36 = FigSignalErrorAt();
                  }
                  if (*MEMORY[0x24BDC0B48] == 1)
                    kdebug_trace();

                  if (!v36)
                  {
                    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PixelFilter"));
                    v96 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v96, "objectAtIndexedSubscript:", 1);
                    v97 = (id)objc_claimAutoreleasedReturnValue();
                    v98 = 0;
                    v125.i8[0] = 0;
                    v99 = (float32x4_t *)&self->_anon_7c[1332];
                    while (1)
                    {
                      v99->f32[v98] = (float)(int)objc_msgSend(v97, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("DBGain"), v98, 0, &v125);
                      if (!v125.i8[0])
                        break;
                      if (++v98 == 3)
                      {
                        v100 = 0;
                        *v99 = vmulq_f32(*v99, (float32x4_t)vdupq_n_s32(0x38800000u));
                        v125.i8[0] = 0;
                        while (1)
                        {
                          *(_DWORD *)&self->_anon_7c[4 * v100 + 1316] = objc_msgSend(v97, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", CFSTR("DBOffset"), v100, 0, &v125);
                          if (!v125.i8[0])
                            goto LABEL_202;
                          if (++v100 == 3)
                          {
                            v36 = 0;
                            goto LABEL_165;
                          }
                        }
                      }
                    }
LABEL_202:
                    v36 = FigSignalErrorAt();
LABEL_165:

                    if (!v36)
                    {
                      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Tile"));
                      v101 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v119, "validRectInBufferCoords");
                      v102 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v119, "regionOfInterestRectInBufferCoords");
                      v103 = (void *)objc_claimAutoreleasedReturnValue();
                      v36 = -[AWBStatistics configWindowsV2:metadata:tilesConfig:validRect:regionOfInterestRect:](self, "configWindowsV2:metadata:tilesConfig:validRect:regionOfInterestRect:", &self->_anon_7c[1388], v121, v101, v102, v103);

                      if (!v36)
                      {
                        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Tile"));
                        v104 = (id)objc_claimAutoreleasedReturnValue();
                        if (*MEMORY[0x24BDC0B48] == 1)
                          kdebug_trace();
                        v125.i8[0] = 0;
                        self->_anon_7c[1444] = objc_msgSend(v104, "cmi_intValueForKey:defaultValue:found:", CFSTR("Bitdepth"), 0, &v125) != 0;
                        if (!v125.i8[0])
                          goto LABEL_247;
                        v125.i8[0] = 0;
                        *(_DWORD *)&self->_anon_7c[1448] = objc_msgSend(v104, "cmi_intValueForKey:defaultValue:found:", CFSTR("StartX"), 0, &v125);
                        if (!v125.i8[0])
                          goto LABEL_247;
                        v125.i8[0] = 0;
                        v105 = objc_msgSend(v104, "cmi_intValueForKey:defaultValue:found:", CFSTR("StartY"), 0, &v125);
                        *(_DWORD *)&self->_anon_7c[1452] = v105;
                        if (!v125.i8[0])
                          goto LABEL_247;
                        *(int *)&self->_anon_7c[1448] /= 4;
                        *(_DWORD *)&self->_anon_7c[1452] = v105 / 4;
                        v125.i8[0] = 0;
                        *(_DWORD *)&self->_anon_7c[1456] = objc_msgSend(v104, "cmi_intValueForKey:defaultValue:found:", CFSTR("EndX"), 0, &v125);
                        if (!v125.i8[0])
                          goto LABEL_247;
                        v125.i8[0] = 0;
                        v106 = objc_msgSend(v104, "cmi_intValueForKey:defaultValue:found:", CFSTR("EndY"), 0, &v125);
                        *(_DWORD *)&self->_anon_7c[1460] = v106;
                        if (!v125.i8[0])
                          goto LABEL_247;
                        *(int *)&self->_anon_7c[1456] /= 4;
                        *(_DWORD *)&self->_anon_7c[1460] = v106 / 4;
                        v125.i8[0] = 0;
                        *(_WORD *)&self->_anon_7c[1464] = objc_msgSend(v104, "cmi_intValueForKey:defaultValue:found:", CFSTR("IntervalX"), 0, &v125);
                        if (v125.i8[0]
                          && (v125.i8[0] = 0,
                              v107 = objc_msgSend(v104, "cmi_intValueForKey:defaultValue:found:", CFSTR("IntervalY"), 0, &v125), *(_WORD *)&self->_anon_7c[1466] = v107, v125.i8[0]))
                        {
                          v36 = 0;
                          *(_WORD *)&self->_anon_7c[1464] >>= 2;
                          *(_WORD *)&self->_anon_7c[1466] = v107 >> 2;
                        }
                        else
                        {
LABEL_247:
                          v36 = FigSignalErrorAt();
                        }
                        if (*MEMORY[0x24BDC0B48] == 1)
                          kdebug_trace();

                        if (!v36)
                        {
                          v36 = configLSC((uint64_t)&self->_anon_7c[1348], v121, v118, v116);
                          if (!v36)
                          {
                            *(_DWORD *)&self->_anon_7c[2592] = -[NSNumber intValue](self->_digitalFlash, "intValue");
                            v108 = self->_faceAssistedBehaviorMode;
                            if (!v108)
                            {
                              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
                              v114 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                              v115 = self->_faceAssistedBehaviorMode;
                              self->_faceAssistedBehaviorMode = v114;

                              FigSignalErrorAt();
                              v108 = self->_faceAssistedBehaviorMode;
                            }
                            if ((objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[NSNumber intValue](v108, "intValue")), v109 = (NSNumber *)objc_claimAutoreleasedReturnValue(), v110 = self->_faceAssistedBehaviorMode, self->_faceAssistedBehaviorMode = v109, v110, -[NSNumber intValue](self->_faceAssistedBehaviorMode, "intValue") != 2)&& -[NSNumber intValue](self->_faceAssistedBehaviorMode, "intValue") != 3|| (v36 = -[AWBStatistics _loadANSTNetwork](self, "_loadANSTNetwork")) == 0)
                            {
                              v111 = configLinearRGBToANSTInput((uint64_t)&self->_anon_7c[1476], v121);
LABEL_187:
                              v36 = v111;
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    else
    {
      v122 = 0;
      v36 = FigSignalErrorAt();
      v31 = 0;
    }
  }
  else
  {
    v122 = 0;
    v36 = FigSignalErrorAt();
    v31 = 0;
    v11 = 0;
    v120 = 0;
  }
LABEL_188:
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();

  return v36;
}

- (int)_adjustConfigToValidRectInBufferCoords:(id)a3 validRectInSensorReadoutCoords:(id)a4 regionOfInterestRectInBufferCoords:(id)a5
{
  id v8;
  id v9;
  id v10;
  unsigned int v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  double height;
  double width;
  unint64_t v20;
  int layout;
  unsigned __int8 v22;
  int v23;
  const __CFDictionary *v24;
  id v25;
  void *v26;
  int v27;
  void *v28;
  int v29;
  double y;
  float v31;
  float v32;
  float v33;
  int v35;
  char v36;
  double v37;
  const __CFDictionary *v38;
  const __CFDictionary *v39;
  double v40;
  unint64_t v41;
  uint64_t v42;
  CGFloat v43;
  unsigned int v44;
  int v45;
  double v46;
  double v47;
  double v48;
  double x;
  int v50;
  int v51;
  int v52;
  float64x2_t v53;
  CGRect *p_rect;
  int32x2_t v55;
  int64x2_t v56;
  int *v57;
  int v58;
  float64x2_t v59;
  float64x2_t v60;
  int64x2_t v68;
  float64x2_t v69;
  float64x2_t v71;
  int32x2_t v72;
  float64x2_t v73;
  char v74;
  double v75;
  int v76;
  double v77;
  int v78;
  __int32 v79;
  __int32 v80;
  int8x8_t v82;
  float64x2_t v83;
  float64x2_t v84;
  CGRect v85;
  CGRect rect;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[NSNumber unsignedIntValue](self->_downsizeFactor, "unsignedIntValue");
  v12 = v8;
  memset(&rect, 0, sizeof(rect));
  if (CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)v12, &rect))
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("FullWidth"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "intValue");

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("FullHeight"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "intValue");

    if (v14)
    {
      if (v16)
      {
        width = rect.size.width;
        height = rect.size.height;
        if (rect.size.width <= (double)v14 && rect.size.height <= (double)v16)
        {
          self->_awbStatCfg.downsizeRatio = v11;
          HIDWORD(v20) = v11;
          LODWORD(v20) = v11;
          if (((v20 >> 2) & 0xC000003F) <= 4)
          {
            if ((_BYTE)v11)
            {
LABEL_13:

              goto LABEL_15;
            }
            layout = self->_awbStatCfg.layout;
            if ((layout - 1) < 2)
            {
              v22 = 8;
LABEL_12:
              self->_awbStatCfg.downsizeRatio = v22;
              goto LABEL_13;
            }
            if (layout == 3)
            {
              self->_awbStatCfg.downsizeRatio = 8;
              v31 = width;
              v32 = height * v31 / 199584.0;
              v33 = sqrtf(v32);
              if (v33 <= 8.0 || v33 > 12.0)
              {
                if (v33 <= 12.0)
                  goto LABEL_13;
                v22 = 16;
              }
              else
              {
                v22 = 12;
              }
              goto LABEL_12;
            }
            self->_awbStatCfg.downsizeRatio = 0;
          }
        }
      }
    }
  }
  v23 = FigSignalErrorAt();

  if (v23)
    goto LABEL_76;
LABEL_15:
  v24 = (const __CFDictionary *)v12;
  v25 = v9;
  memset(&rect, 0, sizeof(rect));
  memset(&v85, 0, sizeof(v85));
  if (!CGRectMakeWithDictionaryRepresentation(v24, &rect))
    goto LABEL_34;
  -[__CFDictionary objectForKeyedSubscript:](v24, "objectForKeyedSubscript:", CFSTR("FullWidth"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "intValue");

  -[__CFDictionary objectForKeyedSubscript:](v24, "objectForKeyedSubscript:", CFSTR("FullHeight"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "intValue");

  if (!v27)
    goto LABEL_34;
  if (v29 && rect.size.width <= (double)v27 && rect.size.height <= (double)v29)
  {
    if (!v25)
      goto LABEL_40;
    if (CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)v25, &v85))
    {
      if (rect.size.width <= v85.size.width && rect.size.height <= v85.size.height)
      {
        y = v85.origin.y;
        *(_WORD *)&self->_anon_7c[1380] = (int)v85.origin.x;
LABEL_44:
        *(_WORD *)&self->_anon_7c[1382] = (int)y;

        goto LABEL_45;
      }
      FigSignalErrorAt();
LABEL_40:
      v36 = self->_awbStatCfg.layout == 3 && sqrtf((float)(v29 * v27 / 199584)) <= 8.0;
      v37 = rect.size.height;
      *(_WORD *)&self->_anon_7c[1380] = (int)(((double)(v27 << v36) - rect.size.width) * 0.5);
      y = ((double)(v29 << v36) - v37) * 0.5;
      goto LABEL_44;
    }
    v35 = FigSignalErrorAt();
  }
  else
  {
LABEL_34:
    v35 = FigSignalErrorAt();
  }
  v23 = v35;

  if (v23)
    goto LABEL_76;
LABEL_45:
  v38 = v24;
  v39 = (const __CFDictionary *)v10;
  memset(&rect, 0, sizeof(rect));
  memset(&v85, 0, sizeof(v85));
  if (!CGRectMakeWithDictionaryRepresentation(v38, &rect))
    goto LABEL_77;
  if (v39)
  {
    if (CGRectMakeWithDictionaryRepresentation(v39, &v85))
    {
      if (CGRectContainsRect(rect, v85))
      {
        LOBYTE(v41) = self->_awbStatCfg.downsizeRatio;
        *(double *)&v42 = (double)v41;
        v85.origin = (CGPoint)vdivq_f64((float64x2_t)v85.origin, (float64x2_t)vdupq_lane_s64(v42, 0));
        v43 = v85.size.width / *(double *)&v42;
        v40 = v85.size.height / *(double *)&v42;
        v85.size.width = v43;
        v85.size.height = v40;
        if (floor(v43 * 0.975 * 0.03125 * 0.25) * 4.0 <= 0.0)
        {
          v44 = 0;
        }
        else
        {
          v40 = floor(v40 * 0.975 * 0.03125 * 0.25) * 4.0;
          v44 = v40 > 0.0;
        }
        v45 = 1;
      }
      else
      {
        FigSignalErrorAt();
        v44 = 0;
        v45 = 0;
      }
      goto LABEL_54;
    }
LABEL_77:
    v23 = FigSignalErrorAt();

    if (v23)
      goto LABEL_76;
    v83 = 0u;
    v84 = 0u;
    goto LABEL_63;
  }
  v44 = 0;
  v45 = 0;
LABEL_54:
  rect.origin.x = 0.0;
  rect.origin.y = 0.0;
  LOBYTE(v40) = self->_awbStatCfg.downsizeRatio;
  v46 = (double)*(unint64_t *)&v40;
  v47 = rect.size.width / v46;
  v48 = rect.size.height / v46;
  rect.size.width = v47;
  rect.size.height = v48;
  if (v45)
  {
    x = v85.origin.x;
    v50 = (int)v85.origin.x;
    v45 = (int)v85.origin.y;
    v51 = (int)v85.size.width + (int)v85.origin.x;
    v52 = (int)v85.size.height + (int)v85.origin.y;
  }
  else
  {
    LOWORD(v50) = 0;
    v51 = (int)v47;
    v52 = (int)v48;
    x = v85.origin.x;
  }
  *(_WORD *)&self->_anon_7c[2580] = v50;
  *(_WORD *)&self->_anon_7c[2582] = v45;
  *(_WORD *)&self->_anon_7c[2584] = v51;
  *(_WORD *)&self->_anon_7c[2586] = v52;
  if (v44)
    v53.f64[0] = x;
  else
    v53.f64[0] = 0.0;
  p_rect = &rect;
  if (v44)
    p_rect = &v85;
  v55 = vdup_n_s32(v44);
  v56.i64[0] = v55.u32[0];
  v56.i64[1] = v55.u32[1];
  v53.f64[1] = *(float64_t *)((unint64_t)p_rect | 8);
  v83 = (float64x2_t)vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v56, 0x3FuLL)), (int8x16_t)v85.size, (int8x16_t)rect.size);
  v84 = v53;

LABEL_63:
  v57 = (int *)MEMORY[0x24BDC0B48];
  v58 = *MEMORY[0x24BDC0B48];
  if (*MEMORY[0x24BDC0B48] == 1)
  {
    kdebug_trace();
    v58 = *v57;
  }
  v59 = vaddq_f64(v83, v84);
  v60 = vmulq_f64(vmulq_f64(v83, (float64x2_t)vdupq_n_s64(0x3FEF333333333333uLL)), (float64x2_t)vdupq_n_s64(0x3FA0000000000000uLL));
  __asm
  {
    FMOV            V2.2D, #4.0
    FMOV            V3.2D, #0.25
    FMOV            V4.2D, #1.0
  }
  v82 = (int8x8_t)vmovn_s64((int64x2_t)vcvtq_n_u64_f64(vrndmq_f64((float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(_Q2, v60), _Q4, (int8x16_t)vmulq_f64(v60, _Q3))), 2uLL));
  *(int32x2_t *)&v60.f64[0] = vshl_n_s32((int32x2_t)vand_s8(v82, (int8x8_t)0xFFFF0000FFFFLL), 5uLL);
  v68.i64[0] = SLODWORD(v60.f64[0]);
  v68.i64[1] = SHIDWORD(v60.f64[0]);
  v69 = vrndmq_f64(vmulq_f64(vsubq_f64(v83, vcvtq_f64_s64(v68)), _Q3));
  __asm { FMOV            V3.2D, #2.0 }
  v71 = vmlaq_f64(v84, _Q3, v69);
  v72 = vmovn_s64(vcvtq_s64_f64((float64x2_t)vbicq_s8((int8x16_t)v71, (int8x16_t)vcltzq_f64(v71))));
  *(int32x2_t *)&v60.f64[0] = vadd_s32(*(int32x2_t *)&v60.f64[0], v72);
  v68.i64[0] = SLODWORD(v60.f64[0]);
  v68.i64[1] = SHIDWORD(v60.f64[0]);
  v73 = vcvtq_f64_s64(v68);
  *(int32x2_t *)&_Q3.f64[0] = vmovn_s64(vcgtq_f64(v59, v73));
  v74 = BYTE4(_Q3.f64[0]);
  if ((LOBYTE(_Q3.f64[0]) & 1) != 0)
    v75 = v73.f64[0];
  else
    v75 = v59.f64[0];
  v76 = (int)v75;
  v77 = v73.f64[1];
  if ((v74 & 1) == 0)
    v77 = v59.f64[1];
  v78 = (int)v77;
  v79 = v72.i32[1];
  v80 = v72.i32[0];
  *(_WORD *)&self->_anon_7c[1030] = v72.i16[0];
  *(_WORD *)&self->_anon_7c[1032] = v72.i16[2];
  *(_WORD *)&self->_anon_7c[1034] = v76;
  *(_WORD *)&self->_anon_7c[1036] = (int)v77;
  if (v58 == 1)
  {
    kdebug_trace();
    v58 = *v57;
    if (*v57 == 1)
    {
      kdebug_trace();
      v58 = *v57;
    }
  }
  *(_DWORD *)&self->_anon_7c[1448] = v80;
  *(_DWORD *)&self->_anon_7c[1452] = v79;
  *(_DWORD *)&self->_anon_7c[1456] = v76;
  *(_DWORD *)&self->_anon_7c[1460] = v78;
  *(_WORD *)&self->_anon_7c[1464] = v82.i16[0];
  *(_WORD *)&self->_anon_7c[1466] = v82.i16[2];
  if (v58 == 1)
    kdebug_trace();
  v23 = 0;
LABEL_76:

  return v23;
}

- (int)process:(id)a3 clipped:(id)a4 lscGainsTex:(id)a5 validRectInBufferCoords:(id)a6 validRectInSensorReadoutCoords:(id)a7 awbStatsBuffer:(id)a8 awbTileStatsConfig:(id *)a9 anstSkinMask:(id)a10 anstSkinMaskData:(id *)a11 skyMaskTex:(id)a12 skyMaskData:(id *)a13 regionOfInterestRectInBufferCoords:(id)a14 downsizeFactor:(unsigned int *)a15
{
  id v20;
  uint64_t v21;
  int v22;
  unsigned int downsizeRatio;
  unsigned __int16 v24;
  unsigned __int16 v25;
  int v26;
  int v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  unint64_t v34;
  void *v35;
  unint64_t v36;
  unint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  int v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  AWBStatistics *v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  unint64_t v84;
  uint64_t v85;
  unint64_t v86;
  unint64_t v87;
  unint64_t v88;
  unint64_t v89;
  unint64_t v90;
  uint64_t v91;
  unint64_t v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
  unint64_t v99;
  unint64_t v100;
  unint64_t v101;
  unint64_t v102;
  unint64_t v103;
  unint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  unint64_t v117;
  unint64_t v118;
  uint64_t v119;
  unint64_t v120;
  unint64_t v121;
  unint64_t v122;
  unint64_t v123;
  const __CFAllocator *v124;
  __CVBuffer *v125;
  __CVBuffer *v126;
  float *BaseAddress;
  _BYTE *v128;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  size_t v132;
  size_t v133;
  size_t v134;
  uint64_t i;
  uint64_t j;
  float v137;
  void *v138;
  id v139;
  void *v140;
  id v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  id v146;
  uint64_t v147;
  id v148;
  void *v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  void *v153;
  id v154;
  uint64_t v155;
  void *v157;
  id v158;
  id v159;
  id v160;
  id v161;
  const __CFDictionary *pixelBufferAttributes;
  id v163;
  id v164;
  _BOOL4 v165;
  id v166;
  id v167;
  void *v168;
  void *v169;
  void *v171;
  void *v172;
  _QWORD v173[6];
  _QWORD v174[6];
  __int128 v175;
  __int128 v176;
  __int128 v177;
  uint64_t v178;
  _QWORD v179[3];
  __int128 v180;
  uint64_t v181;
  _QWORD v182[3];
  _QWORD v183[3];
  _QWORD v184[3];
  __int128 v185;
  uint64_t v186;
  _QWORD v187[3];
  _QWORD v188[3];
  _QWORD v189[3];
  _QWORD v190[3];
  _QWORD v191[3];
  _QWORD v192[3];
  _QWORD v193[3];
  _QWORD v194[3];
  uint64_t v195;
  int64x2_t v196;
  unint64_t v197;
  int64x2_t v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  uint64_t v202;
  CVPixelBufferRef v203;
  CVPixelBufferRef v204;
  CVPixelBufferRef pixelBufferOut;
  id v206;
  id v207;
  _QWORD v208[2];
  _QWORD v209[5];

  v209[2] = *MEMORY[0x24BDAC8D0];
  v167 = a3;
  v159 = a4;
  v158 = a5;
  v160 = a6;
  v161 = a7;
  v163 = a8;
  v166 = a10;
  v164 = a12;
  v20 = a14;
  v206 = 0;
  v207 = 0;
  v21 = *MEMORY[0x24BDC55D0];
  v208[0] = *MEMORY[0x24BDC5668];
  v208[1] = v21;
  v209[0] = MEMORY[0x24BDBD1B8];
  v209[1] = &unk_24FECE378;
  v157 = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v209, v208, 2);
  pixelBufferAttributes = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v204 = 0;
  pixelBufferOut = 0;
  v203 = 0;
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();
  v202 = 0;
  v200 = 0u;
  v201 = 0u;
  v199 = 0u;
  objc_msgSend(v167, "pixelFormat");
  MTLPixelFormatGetInfo();
  v22 = -[AWBStatistics _adjustConfigToValidRectInBufferCoords:validRectInSensorReadoutCoords:regionOfInterestRectInBufferCoords:](self, "_adjustConfigToValidRectInBufferCoords:validRectInSensorReadoutCoords:regionOfInterestRectInBufferCoords:", v160, v161, v20);
  if (v22)
  {
    v28 = 0;
    v165 = 0;
    v171 = 0;
    v172 = 0;
    v115 = 0;
    v168 = 0;
    v169 = 0;
    objc_msgSend(0, "endEncoding");
    goto LABEL_89;
  }
  downsizeRatio = self->_awbStatCfg.downsizeRatio;
  v24 = *(_WORD *)&self->_anon_7c[1464] * downsizeRatio;
  v25 = *(_WORD *)&self->_anon_7c[1466] * downsizeRatio;
  a9->var0 = self->_anon_7c[1444];
  *(int32x4_t *)&a9->var1 = vmulq_s32(*(int32x4_t *)&self->_anon_7c[1448], vdupq_n_s32(downsizeRatio));
  a9->var5 = v24;
  a9->var6 = v25;
  if ((*(_DWORD *)&self->_anon_7c[1456] - *(_DWORD *)&self->_anon_7c[1448])
     / *(unsigned __int16 *)&self->_anon_7c[1464] >= 32)
    v26 = 32;
  else
    v26 = (*(_DWORD *)&self->_anon_7c[1456] - *(_DWORD *)&self->_anon_7c[1448])
        / *(unsigned __int16 *)&self->_anon_7c[1464];
  if ((*(_DWORD *)&self->_anon_7c[1460] - *(_DWORD *)&self->_anon_7c[1452])
     / *(unsigned __int16 *)&self->_anon_7c[1466] >= 32)
    v27 = 32;
  else
    v27 = (*(_DWORD *)&self->_anon_7c[1460] - *(_DWORD *)&self->_anon_7c[1452])
        / *(unsigned __int16 *)&self->_anon_7c[1466];
  *a15 = downsizeRatio;
  if (v166)
    v165 = -[NSNumber intValue](self->_faceAssistedBehaviorMode, "intValue") == 1;
  else
    v165 = 0;
  if (self->_espressoPlan)
    v28 = -[NSNumber intValue](self->_faceAssistedBehaviorMode, "intValue") == 2
       || -[NSNumber intValue](self->_faceAssistedBehaviorMode, "intValue") == 3;
  else
    v28 = 0;
  if (v165
    && ((unint64_t)objc_msgSend(v166, "width") <= 0xFF && (unint64_t)objc_msgSend(v166, "height") < 0xC0
     || objc_msgSend(v166, "pixelFormat") != 25
     && objc_msgSend(v166, "pixelFormat") != 55
     && objc_msgSend(v166, "pixelFormat") != 10
     && objc_msgSend(v166, "pixelFormat") != 20))
  {
    v22 = FigSignalErrorAt();
    v165 = 1;
    goto LABEL_143;
  }
  if (!v28)
  {
    v44 = 0;
    v168 = 0;
    goto LABEL_30;
  }
  v29 = (void *)objc_opt_new();
  v30 = v29;
  if (!v29)
  {
    v22 = FigSignalErrorAt();
    v28 = 1;
LABEL_143:
    v172 = 0;
    v115 = 0;
    v168 = 0;
    goto LABEL_144;
  }
  objc_msgSend(v29, "desc");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setTextureType:", 2);

  objc_msgSend(v30, "desc");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setPixelFormat:", 113);

  v33 = objc_msgSend(v167, "width");
  v34 = self->_awbStatCfg.downsizeRatio;
  objc_msgSend(v30, "desc");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setWidth:", v33 / v34);

  v36 = objc_msgSend(v167, "height");
  v37 = self->_awbStatCfg.downsizeRatio;
  objc_msgSend(v30, "desc");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setHeight:", v36 / v37);

  objc_msgSend(v30, "desc");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setDepth:", 1);

  objc_msgSend(v30, "desc");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setArrayLength:", 1);

  objc_msgSend(v30, "desc");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setStorageMode:", 0);

  objc_msgSend(v30, "desc");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setUsage:", 7);

  objc_msgSend(v30, "setLabel:", 0);
  -[FigMetalContext allocator](self->_metalContext, "allocator");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)objc_msgSend(v43, "newTextureWithDescriptor:", v30);
  v207 = v44;

  if (!v44)
  {
    v22 = FigSignalErrorAt();
    v28 = 1;
    v172 = 0;
    v115 = 0;
    v168 = v30;
    goto LABEL_144;
  }
  v168 = v30;
LABEL_30:
  -[FigMetalContext commandQueue](self->_metalContext, "commandQueue");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "commandBuffer");
  v169 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v169)
  {
    v22 = FigSignalErrorAt();
    v172 = 0;
    v115 = 0;
LABEL_144:
    v171 = 0;
    v169 = 0;
    objc_msgSend(0, "endEncoding");
    goto LABEL_89;
  }
  if (*MEMORY[0x24BDC0B48])
  {
    objc_msgSend(v169, "commandQueue");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "commandBuffer");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v47, "setLabel:", CFSTR("KTRACE_MTLCMDBUF"));
    objc_msgSend(v47, "addCompletedHandler:", &__block_literal_global_0);
    objc_msgSend(v47, "commit");
    objc_msgSend(v169, "addCompletedHandler:", &__block_literal_global_61);

  }
  objc_msgSend(v169, "computeCommandEncoder");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v48)
  {
    v22 = FigSignalErrorAt();
    v171 = 0;
    v172 = 0;
LABEL_150:
    v115 = 0;
    goto LABEL_88;
  }
  v49 = DWORD2(v199);
  v171 = v48;
  objc_msgSend(v48, "setComputePipelineState:", self->_resetMtlBufferPipelineState);
  objc_msgSend(v171, "setBuffer:offset:atIndex:", v163, 0, 1);
  v197 = (unint64_t)objc_msgSend(v163, "length") >> 2;
  v198 = vdupq_n_s64(1uLL);
  v195 = -[MTLComputePipelineState threadExecutionWidth](self->_resetMtlBufferPipelineState, "threadExecutionWidth");
  v196 = v198;
  objc_msgSend(v171, "dispatchThreads:threadsPerThreadgroup:", &v197, &v195);
  objc_msgSend(v171, "setTexture:atIndex:", v167, 0);
  objc_msgSend(v171, "setTexture:atIndex:", v159, 1);
  if ((v49 & 0x10000) != 0)
    objc_msgSend(v171, "setTexture:atIndex:", v158, 2);
  self->_anon_7c[2588] = -[NSNumber BOOLValue](self->_skipDemosaic, "BOOLValue");
  *(_DWORD *)&self->_anon_7c[2592] = -[NSNumber intValue](self->_digitalFlash, "intValue");
  -[NSNumber floatValue](self->_lscMaxGain, "floatValue");
  *(_DWORD *)&self->_anon_7c[1356] = v50;
  objc_msgSend(v171, "setBytes:length:atIndex:", &self->_awbStatCfg, 2608, 0);
  if (v28)
    objc_msgSend(v171, "setTexture:atIndex:", v44, 5);
  if ((v49 & 0x10000) != 0)
  {
    if (self->_awbStatCfg.layout == 3)
    {
      if (objc_msgSend(v158, "textureType") != 3)
      {
        v22 = FigSignalErrorAt();
        goto LABEL_149;
      }
      objc_msgSend(v171, "setComputePipelineState:", self->_computeAWBStatsQuadraFastPipelineState);
      v67 = -[MTLComputePipelineState threadExecutionWidth](self->_computeAWBStatsQuadraFastPipelineState, "threadExecutionWidth");
      v68 = objc_msgSend(v167, "width");
      v69 = self->_awbStatCfg.downsizeRatio;
      v70 = objc_msgSend(v167, "height");
      v71 = self->_awbStatCfg.downsizeRatio;
      if (v67 >= v68 / v69 * v70 / v71)
        v72 = v68 / v69 * v70 / v71;
      else
        v72 = v67;
      v73 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_computeAWBStatsQuadraFastPipelineState, "maxTotalThreadsPerThreadgroup");
      v58 = self;
      v74 = objc_msgSend(v167, "width");
      v75 = self->_awbStatCfg.downsizeRatio;
      v76 = objc_msgSend(v167, "height");
      v77 = self->_awbStatCfg.downsizeRatio;
      if (v73 / v72 >= v74 / v75 * v76 / v77 / v72)
        v78 = v74 / v75 * v76 / v77 / v72;
      else
        v78 = v73 / v72;
      v79 = objc_msgSend(v167, "width");
      v80 = self->_awbStatCfg.downsizeRatio;
      v81 = objc_msgSend(v167, "height") / v80;
      v194[0] = v79 / v80;
      v194[1] = v81;
      v194[2] = 1;
      v193[0] = v72;
      v193[1] = v78;
      v193[2] = 1;
      objc_msgSend(v171, "dispatchThreads:threadsPerThreadgroup:", v194, v193);
    }
    else
    {
      objc_msgSend(v171, "setComputePipelineState:", self->_computeAWBStatsBayerFastPipelineState);
      v82 = -[MTLComputePipelineState threadExecutionWidth](self->_computeAWBStatsBayerFastPipelineState, "threadExecutionWidth");
      v83 = objc_msgSend(v167, "width");
      v84 = self->_awbStatCfg.downsizeRatio;
      v85 = objc_msgSend(v167, "height");
      v86 = self->_awbStatCfg.downsizeRatio;
      if (v82 >= v83 / v84 * v85 / v86)
        v87 = v83 / v84 * v85 / v86;
      else
        v87 = v82;
      v88 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_computeAWBStatsBayerFastPipelineState, "maxTotalThreadsPerThreadgroup");
      v58 = self;
      v89 = objc_msgSend(v167, "width");
      v90 = self->_awbStatCfg.downsizeRatio;
      v91 = objc_msgSend(v167, "height");
      v92 = self->_awbStatCfg.downsizeRatio;
      if (v88 / v87 >= v89 / v90 * v91 / v92 / v87)
        v93 = v89 / v90 * v91 / v92 / v87;
      else
        v93 = v88 / v87;
      v94 = objc_msgSend(v167, "width");
      v95 = self->_awbStatCfg.downsizeRatio;
      v96 = objc_msgSend(v167, "height") / v95;
      v192[0] = v94 / v95;
      v192[1] = v96;
      v192[2] = 1;
      v191[0] = v87;
      v191[1] = v93;
      v191[2] = 1;
      objc_msgSend(v171, "dispatchThreads:threadsPerThreadgroup:", v192, v191);
    }
  }
  else
  {
    objc_msgSend(v171, "setComputePipelineState:", self->_computeAWBStatsBayerPipelineState);
    v51 = -[MTLComputePipelineState threadExecutionWidth](self->_computeAWBStatsBayerPipelineState, "threadExecutionWidth");
    v52 = objc_msgSend(v167, "width");
    v53 = self->_awbStatCfg.downsizeRatio;
    v54 = objc_msgSend(v167, "height");
    v55 = self->_awbStatCfg.downsizeRatio;
    if (v51 >= v52 / v53 * v54 / v55)
      v56 = v52 / v53 * v54 / v55;
    else
      v56 = v51;
    v57 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_computeAWBStatsBayerPipelineState, "maxTotalThreadsPerThreadgroup");
    v58 = self;
    v59 = objc_msgSend(v167, "width");
    v60 = self->_awbStatCfg.downsizeRatio;
    v61 = objc_msgSend(v167, "height");
    v62 = self->_awbStatCfg.downsizeRatio;
    if (v57 / v56 >= v59 / v60 * v61 / v62 / v56)
      v63 = v59 / v60 * v61 / v62 / v56;
    else
      v63 = v57 / v56;
    v64 = objc_msgSend(v167, "width");
    v65 = self->_awbStatCfg.downsizeRatio;
    v66 = objc_msgSend(v167, "height") / v65;
    v190[0] = v64 / v65;
    v190[1] = v66;
    v190[2] = 1;
    v189[0] = v56;
    v189[1] = v63;
    v189[2] = 1;
    objc_msgSend(v171, "dispatchThreads:threadsPerThreadgroup:", v190, v189);
  }
  objc_msgSend(v171, "setComputePipelineState:", v58->_normTileStatsPipelineState);
  v97 = -[MTLComputePipelineState threadExecutionWidth](self->_normTileStatsPipelineState, "threadExecutionWidth");
  v98 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_normTileStatsPipelineState, "maxTotalThreadsPerThreadgroup");
  LODWORD(v99) = v27 * v26;
  if (v97 >= v27 * v26)
    v99 = (int)v99;
  else
    v99 = v97;
  v188[0] = v26;
  v188[1] = v27;
  v100 = v27 * v26 / v99;
  v188[2] = 1;
  if (v98 / v99 < v100)
    v100 = v98 / v99;
  v187[0] = v99;
  v187[1] = v100;
  v187[2] = 1;
  objc_msgSend(v171, "dispatchThreads:threadsPerThreadgroup:", v188, v187);
  objc_msgSend(v171, "setComputePipelineState:", self->_normWindowStatsPipelineState);
  v101 = -[MTLComputePipelineState threadExecutionWidth](self->_normWindowStatsPipelineState, "threadExecutionWidth");
  v102 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_normWindowStatsPipelineState, "maxTotalThreadsPerThreadgroup");
  if (v101 >= 2)
    v103 = 2;
  else
    v103 = v101;
  v104 = 2 / v103;
  v185 = xmmword_230930420;
  if (v102 / v103 < v104)
    v104 = v102 / v103;
  v186 = 1;
  v184[0] = v103;
  v184[1] = v104;
  v184[2] = 1;
  objc_msgSend(v171, "dispatchThreads:threadsPerThreadgroup:", &v185, v184, COERCE_DOUBLE(2));
  if (!v165)
  {
    if (!v28)
    {
      v165 = 0;
      v172 = 0;
      v115 = 0;
      goto LABEL_87;
    }
    if (!CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0x200uLL, 0x180uLL, 0x42475241u, pixelBufferAttributes, &pixelBufferOut))
    {
      if (!pixelBufferOut)
      {
        v138 = 0;
        v22 = FigSignalErrorAt();
        v172 = 0;
        v115 = 0;
        goto LABEL_129;
      }
      -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](self->_metalContext, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", pixelBufferOut, 73, 7, 0);
      v119 = objc_claimAutoreleasedReturnValue();
      if (v119)
      {
        objc_msgSend(v171, "setComputePipelineState:", self->_fitWbTmRGBToANSTInput);
        objc_msgSend(v171, "setTexture:atIndex:", v44, 5);
        objc_msgSend(v171, "setTexture:atIndex:", v119, 6);
        v120 = -[MTLComputePipelineState threadExecutionWidth](self->_fitWbTmRGBToANSTInput, "threadExecutionWidth");
        v121 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_fitWbTmRGBToANSTInput, "maxTotalThreadsPerThreadgroup");
        if (v120 >= 0x30000)
          v122 = 196608;
        else
          v122 = v120;
        v123 = 0x30000 / v122;
        v180 = xmmword_230930430;
        if (v121 / v122 < v123)
          v123 = v121 / v122;
        v28 = 1;
        v181 = 1;
        v179[0] = v122;
        v179[1] = v123;
        v179[2] = 1;
        objc_msgSend(v171, "dispatchThreads:threadsPerThreadgroup:", &v180, v179, COERCE_DOUBLE(512));
        v165 = 0;
        v115 = 0;
        v22 = 0;
        v172 = (void *)v119;
        goto LABEL_88;
      }
    }
    v22 = FigSignalErrorAt();
    v165 = 0;
    v28 = 1;
    goto LABEL_149;
  }
  v105 = (void *)objc_opt_new();

  if (!v105)
  {
    v22 = FigSignalErrorAt();
    v165 = 1;
    v172 = 0;
    v115 = 0;
    v168 = 0;
    goto LABEL_88;
  }
  v168 = v105;
  objc_msgSend(v105, "desc");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "setTextureType:", 2);

  objc_msgSend(v168, "desc");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "setPixelFormat:", 10);

  objc_msgSend(v168, "desc");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "setWidth:", 256);

  objc_msgSend(v168, "desc");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "setHeight:", 192);

  objc_msgSend(v168, "desc");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "setDepth:", 1);

  objc_msgSend(v168, "desc");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "setArrayLength:", 1);

  objc_msgSend(v168, "desc");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "setUsage:", 7);

  objc_msgSend(v168, "desc");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "setStorageMode:", 0);

  objc_msgSend(v168, "setLabel:", 0);
  -[FigMetalContext allocator](self->_metalContext, "allocator");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = (void *)objc_msgSend(v114, "newTextureWithDescriptor:", v168);

  if (!v115)
  {
    v22 = FigSignalErrorAt();
    v165 = 1;
LABEL_149:
    v172 = 0;
    goto LABEL_150;
  }
  objc_msgSend(v171, "setComputePipelineState:", self->_resizeANST);
  v116 = -[MTLComputePipelineState threadExecutionWidth](self->_resizeANST, "threadExecutionWidth");
  v117 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_resizeANST, "maxTotalThreadsPerThreadgroup");
  v118 = v117 / -[MTLComputePipelineState threadExecutionWidth](self->_resizeANST, "threadExecutionWidth");
  objc_msgSend(v171, "setImageblockWidth:height:", v116, v118);
  objc_msgSend(v171, "setTexture:atIndex:", v166, 3);
  objc_msgSend(v171, "setTexture:atIndex:", v115, 4);
  v183[0] = objc_msgSend(v115, "width");
  v183[1] = objc_msgSend(v115, "height");
  v183[2] = 1;
  v182[0] = v116;
  v182[1] = v118;
  v165 = 1;
  v182[2] = 1;
  objc_msgSend(v171, "dispatchThreads:threadsPerThreadgroup:", v183, v182);
  v172 = 0;
LABEL_87:
  v22 = 0;
LABEL_88:
  objc_msgSend(v171, "endEncoding");
LABEL_89:
  objc_msgSend(v169, "commit");
  objc_msgSend(v169, "waitUntilCompleted");
  if (v28)
  {
    objc_msgSend(CFSTR("input_image"), "UTF8String");
    if (espresso_network_bind_cvpixelbuffer())
      goto LABEL_133;
    v124 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0x100uLL, 0xC0uLL, 0x4C303066u, pixelBufferAttributes, &v204))
    {
      goto LABEL_133;
    }
    if (!v204)
      goto LABEL_133;
    objc_msgSend(CFSTR("skin@output"), "UTF8String");
    if (espresso_network_bind_cvpixelbuffer())
      goto LABEL_133;
    if (espresso_plan_execute_sync())
      goto LABEL_133;
    if (CVPixelBufferCreate(v124, 0x100uLL, 0xC0uLL, 0x4C303038u, pixelBufferAttributes, &v203))
      goto LABEL_133;
    v125 = v203;
    if (!v203)
      goto LABEL_133;
    v126 = v204;
    if (!v204)
      goto LABEL_153;
    if (CVPixelBufferLockBaseAddress(v204, 1uLL))
      goto LABEL_153;
    if (CVPixelBufferLockBaseAddress(v125, 0))
      goto LABEL_153;
    BaseAddress = (float *)CVPixelBufferGetBaseAddress(v126);
    if (!BaseAddress)
      goto LABEL_153;
    v128 = CVPixelBufferGetBaseAddress(v125);
    if (!v128)
      goto LABEL_153;
    Width = CVPixelBufferGetWidth(v126);
    Height = CVPixelBufferGetHeight(v126);
    BytesPerRow = CVPixelBufferGetBytesPerRow(v126);
    v132 = CVPixelBufferGetWidth(v125);
    v133 = CVPixelBufferGetHeight(v125);
    v134 = CVPixelBufferGetBytesPerRow(v125);
    if (Width != v132 || Height != v133)
      goto LABEL_153;
    if (Height)
    {
      for (i = 0; i != Height; ++i)
      {
        if (Width)
        {
          for (j = 0; j != Width; ++j)
          {
            v137 = BaseAddress[j];
            if (v137 < 0.0)
              v137 = 0.0;
            v128[j] = (int)fminf(v137, 255.0);
          }
        }
        v128 += v134;
        BaseAddress = (float *)((char *)BaseAddress + BytesPerRow);
      }
    }
    if (CVPixelBufferUnlockBaseAddress(v126, 1uLL) || CVPixelBufferUnlockBaseAddress(v125, 0))
    {
LABEL_153:
      if (FigSignalErrorAt())
      {
LABEL_133:
        v22 = FigSignalErrorAt();
        v138 = 0;
        goto LABEL_129;
      }
    }
    -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](self->_metalContext, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", v203, 10, 1, 0);
    v22 = 0;
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v138)
      goto LABEL_129;
    v139 = v206;
  }
  else
  {
    v139 = 0;
    v138 = 0;
  }
  if (v165)
    v140 = v115;
  else
    v140 = v138;
  v141 = v140;
  v206 = v141;

  if (v141)
  {
    objc_msgSend(v141, "pixelFormat");
    v178 = 0;
    v176 = 0u;
    v177 = 0u;
    v175 = 0u;
    objc_msgSend(v141, "device");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    MTLPixelFormatGetInfoForDevice();

    objc_msgSend(v141, "width");
    v143 = (void *)MEMORY[0x24BDBCEC8];
    objc_msgSend(v141, "height");
    objc_msgSend(v143, "dataWithLength:", 0);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    v145 = v144;
    if (!v144
      || (v146 = objc_retainAutorelease(v144),
          v147 = objc_msgSend(v146, "mutableBytes"),
          memset(v174, 0, 24),
          v174[3] = objc_msgSend(v141, "width"),
          v174[4] = objc_msgSend(v141, "height"),
          v174[5] = 1,
          objc_msgSend(v141, "getBytes:bytesPerRow:fromRegion:mipmapLevel:", v147, 0, v174, 0),
          !a11))
    {

      goto LABEL_129;
    }
    v148 = objc_retainAutorelease(v146);
    *a11 = v148;

  }
  if (v164)
  {
    objc_msgSend(v164, "pixelFormat");
    v178 = 0;
    v176 = 0u;
    v177 = 0u;
    v175 = 0u;
    objc_msgSend(v164, "device");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    MTLPixelFormatGetInfoForDevice();

    v150 = *((_QWORD *)&v176 + 1);
    v151 = objc_msgSend(v164, "width") * v150;
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", objc_msgSend(v164, "height") * v151);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    v153 = v152;
    if (v152)
    {
      v154 = objc_retainAutorelease(v152);
      v155 = objc_msgSend(v154, "mutableBytes");
      memset(v173, 0, 24);
      v173[3] = objc_msgSend(v164, "width");
      v173[4] = objc_msgSend(v164, "height");
      v173[5] = 1;
      objc_msgSend(v164, "getBytes:bytesPerRow:fromRegion:mipmapLevel:", v155, v151, v173, 0);
      if (a13)
        *a13 = objc_retainAutorelease(v154);
    }

  }
LABEL_129:
  FigMetalDecRef();
  FigMetalDecRef();
  CVPixelBufferRelease(pixelBufferOut);
  CVPixelBufferRelease(v204);
  CVPixelBufferRelease(v203);
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();

  return v22;
}

uint64_t __237__AWBStatistics_process_clipped_lscGainsTex_validRectInBufferCoords_validRectInSensorReadoutCoords_awbStatsBuffer_awbTileStatsConfig_anstSkinMask_anstSkinMaskData_skyMaskTex_skyMaskData_regionOfInterestRectInBufferCoords_downsizeFactor___block_invoke()
{
  uint64_t result;

  if (*MEMORY[0x24BDC0B48] == 1)
    return kdebug_trace();
  return result;
}

void __237__AWBStatistics_process_clipped_lscGainsTex_validRectInBufferCoords_validRectInSensorReadoutCoords_awbStatsBuffer_awbTileStatsConfig_anstSkinMask_anstSkinMaskData_skyMaskTex_skyMaskData_regionOfInterestRectInBufferCoords_downsizeFactor___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (objc_msgSend(v2, "status") == 4)
  {
    objc_msgSend(v2, "GPUEndTime");
    objc_msgSend(v2, "GPUStartTime");
  }
  else
  {
    objc_msgSend(v2, "status");
  }
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();

}

- (int)configWindowsV2:(id *)a3 metadata:(id)a4 tilesConfig:(id)a5 validRect:(id)a6 regionOfInterestRect:(id)a7
{
  id v11;
  const __CFDictionary *v12;
  void *v13;
  const __CFDictionary *v14;
  const __CFDictionary *v15;
  _BOOL4 v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  $CD33B8EB1AFD63113B358020E0B0A6EB *i;
  unint64_t v28;
  void *v29;
  void *v30;
  const __CFDictionary *v31;
  double v32;
  double width;
  double height;
  float v35;
  float v36;
  int v37;
  float32x2_t v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int32x2_t v43;
  int v44;
  uint32x2_t v45;
  unint64_t v46;
  int32x2_t v47;
  int v48;
  const __CFDictionary *v49;
  void *v51;
  void *v52;
  id v53;
  const __CFDictionary *v54;
  const __CFDictionary *v55;
  int32x2_t v57;
  CGPoint origin;
  float32x2_t v59;
  CGSize size;
  id v61;
  float64x2_t v62;
  const __CFDictionary *dict;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect rect;

  v11 = a4;
  v61 = a5;
  dict = (const __CFDictionary *)a6;
  v12 = (const __CFDictionary *)a7;
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BE11C30]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v14 = 0;
    goto LABEL_43;
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BE11D78]);
  v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
LABEL_43:
    v55 = 0;
LABEL_44:
    v48 = 0;
    goto LABEL_49;
  }
  v15 = v14;
  v16 = CGRectMakeWithDictionaryRepresentation(v14, &rect);
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BE11B48]);
  v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v55 = v15;
  if (v14)
    v17 = v16;
  else
    v17 = 0;
  if (!v17)
    goto LABEL_44;
  v54 = v14;
  -[__CFDictionary objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", *MEMORY[0x24BE11B50]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v18, "count"))
  {
    v48 = 0;
    goto LABEL_48;
  }
  v52 = v13;
  v53 = v11;
  v51 = v18;
  objc_msgSend(v18, "sortedArrayUsingComparator:", &__block_literal_global_68);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = *MEMORY[0x24BE11D50];
  __asm { FMOV            V0.2D, #0.5 }
  v62 = _Q0;
  for (i = a3; ; ++i)
  {
    v28 = 2 * objc_msgSend(v19, "count");
    if (v28 >= 2)
      v28 = 2;
    if (v28 <= v20)
    {
      v48 = 0;
      v13 = v52;
      v11 = v53;
      v18 = v51;
      goto LABEL_46;
    }
    objc_msgSend(v19, "objectAtIndexedSubscript:", v20 >> 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (!v29)
    {
      i->var0 = 0;
      goto LABEL_40;
    }
    objc_msgSend(v29, "objectForKeyedSubscript:", v21);
    v31 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    if (!CGRectMakeWithDictionaryRepresentation(v31, &v66))
    {
      v48 = 0;
      goto LABEL_54;
    }
    v66.origin = (CGPoint)vmulq_f64((float64x2_t)v66.origin, (float64x2_t)rect.size);
    v66.size = (CGSize)vmulq_f64((float64x2_t)rect.size, (float64x2_t)v66.size);
    if (!CGRectMakeWithDictionaryRepresentation(dict, &v65))
      break;
    v32 = v66.origin.y - v65.origin.y;
    v66.origin.y = v32;
    if (v32 < 0.0)
    {
      v66.size.height = v32 + v66.size.height;
      v66.origin.y = 0.0;
    }
    if (v12)
    {
      if (!CGRectMakeWithDictionaryRepresentation(v12, &v64))
        break;
      if (CGRectContainsRect(v65, v64))
        v66 = CGRectIntersection(v66, v64);
      else
        FigSignalErrorAt();
    }
    width = v66.size.width;
    height = v66.size.height;
    i->var0 = 0;
    if (-[NSNumber intValue](self->_digitalFlash, "intValue"))
      v37 = 5000;
    else
      v37 = 50000;
    v35 = width;
    v36 = height;
    if (v37 < (int)(float)(v35 * v36))
    {
      size = v66.size;
      v38 = vcvt_f32_f64(vmulq_n_f64((float64x2_t)v66.size, *((float *)&qword_23092D7A0 + (v20 & 1))));
      origin = v66.origin;
      v59 = v38;
      v39 = (int)v38.f32[1];
      if ((int)v38.f32[0] >= 0)
        v40 = (int)v38.f32[0];
      else
        v40 = (int)v38.f32[0] + 1;
      if (v39 >= 0)
        v41 = (int)v38.f32[1];
      else
        v41 = v39 + 1;
      v42 = v41 >> 1;
      v43 = vmovn_s64(vcvtq_s64_f64(vmulq_f64((float64x2_t)rect.size, v62)));
      v57 = v43;
      if (v42 >= 9 * v43.i32[1] / 10)
        v44 = 9 * v43.i32[1] / 10;
      else
        v44 = v42;
      LOBYTE(v64.origin.x) = 0;
      a3->var1 = objc_msgSend(v61, "cmi_intValueForKey:defaultValue:found:", CFSTR("Bitdepth"), 0, &v64) != 0;
      if (!LOBYTE(v64.origin.x))
        break;
      v45 = (uint32x2_t)vcvt_s32_f32(vcvt_f32_f64(vaddq_f64(vaddq_f64(vmulq_f64((float64x2_t)size, v62), (float64x2_t)origin), vcvtq_f64_f32(vmul_f32(v59, (float32x2_t)0xBF000000BF000000)))));
      v46 = *(_QWORD *)&vshr_n_s32((int32x2_t)vsra_n_u32(v45, v45, 0x1FuLL), 1uLL) & 0xFFFFFFFCFFFFFFFCLL;
      v47.i32[0] = v40 >> 1;
      v47.i32[1] = v44;
      i->var0 = 1;
      *(_QWORD *)&i->var3 = v46;
      *(int32x2_t *)&i->var5 = vadd_s32(vmin_s32(vsub_s32(v57, (int32x2_t)v46), (int32x2_t)(*(_QWORD *)&vadd_s32(v47, (int32x2_t)0x300000003) & 0xFFFFFFFCFFFFFFFCLL)), (int32x2_t)v46);
    }
    memset_pattern16(i->var2, &unk_230930440, 8uLL);

LABEL_40:
    ++v20;
  }
  v48 = FigSignalErrorAt();
LABEL_54:
  v13 = v52;
  v11 = v53;
  v18 = v51;

LABEL_46:
LABEL_48:

  v14 = v54;
LABEL_49:
  if (*MEMORY[0x24BDC0B48] == 1)
  {
    v49 = v14;
    kdebug_trace();
    v14 = v49;
  }

  return v48;
}

uint64_t __85__AWBStatistics_configWindowsV2_metadata_tilesConfig_validRect_regionOfInterestRect___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  const __CFDictionary *v6;
  const __CFDictionary *v7;
  float v8;
  float v9;
  uint64_t v10;
  CGRect v12;
  CGRect rect;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "valueForKey:", CFSTR("Rect"));
  v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = 0;
LABEL_10:
    v10 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v5, "valueForKey:", CFSTR("Rect"));
  v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  if (!v7 || !CGRectMakeWithDictionaryRepresentation(v6, &rect) || !CGRectMakeWithDictionaryRepresentation(v7, &v12))
    goto LABEL_10;
  v8 = rect.size.width * rect.size.height;
  v9 = v12.size.width * v12.size.height;
  if (v8 <= v9)
    v10 = 1;
  else
    v10 = -1;
LABEL_8:

  return v10;
}

- (NSNumber)digitalFlash
{
  return self->_digitalFlash;
}

- (void)setDigitalFlash:(id)a3
{
  objc_storeStrong((id *)&self->_digitalFlash, a3);
}

- (NSNumber)skipDemosaic
{
  return self->_skipDemosaic;
}

- (void)setSkipDemosaic:(id)a3
{
  objc_storeStrong((id *)&self->_skipDemosaic, a3);
}

- (NSNumber)lscMaxGain
{
  return self->_lscMaxGain;
}

- (void)setLscMaxGain:(id)a3
{
  objc_storeStrong((id *)&self->_lscMaxGain, a3);
}

- (NSNumber)faceAssistedBehaviorMode
{
  return self->_faceAssistedBehaviorMode;
}

- (void)setFaceAssistedBehaviorMode:(id)a3
{
  objc_storeStrong((id *)&self->_faceAssistedBehaviorMode, a3);
}

- (NSNumber)downsizeFactor
{
  return self->_downsizeFactor;
}

- (void)setDownsizeFactor:(id)a3
{
  objc_storeStrong((id *)&self->_downsizeFactor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downsizeFactor, 0);
  objc_storeStrong((id *)&self->_faceAssistedBehaviorMode, 0);
  objc_storeStrong((id *)&self->_lscMaxGain, 0);
  objc_storeStrong((id *)&self->_skipDemosaic, 0);
  objc_storeStrong((id *)&self->_digitalFlash, 0);
  objc_storeStrong((id *)&self->_fitWbTmRGBToANSTInput, 0);
  objc_storeStrong((id *)&self->_resizeANST, 0);
  objc_storeStrong((id *)&self->_normWindowStatsPipelineState, 0);
  objc_storeStrong((id *)&self->_normTileStatsPipelineState, 0);
  objc_storeStrong((id *)&self->_resetMtlBufferPipelineState, 0);
  objc_storeStrong((id *)&self->_computeAWBStatsQuadraFastPipelineState, 0);
  objc_storeStrong((id *)&self->_computeAWBStatsBayerFastPipelineState, 0);
  objc_storeStrong((id *)&self->_computeAWBStatsBayerPipelineState, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end
