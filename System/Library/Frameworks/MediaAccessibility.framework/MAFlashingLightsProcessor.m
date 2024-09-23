@implementation MAFlashingLightsProcessor

- (MAFlashingLightsProcessor)init
{
  MAFlashingLightsProcessor *v2;
  void *v3;
  objc_class *v4;
  id v5;
  objc_super v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v7.receiver = self;
  v7.super_class = (Class)MAFlashingLightsProcessor;
  v2 = -[MAFlashingLightsProcessor init](&v7, sel_init);
  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v3 = (void *)getPSEVideoProcessorClass_softClass;
  v12 = getPSEVideoProcessorClass_softClass;
  if (!getPSEVideoProcessorClass_softClass)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __getPSEVideoProcessorClass_block_invoke;
    v8[3] = &unk_1E69283D0;
    v8[4] = &v9;
    __getPSEVideoProcessorClass_block_invoke((uint64_t)v8);
    v3 = (void *)v10[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v9, 8);
  v5 = objc_alloc_init(v4);
  -[MAFlashingLightsProcessor setPse:](v2, "setPse:", v5);

  return v2;
}

- (BOOL)canProcessSurface:(IOSurfaceRef)surface
{
  void *v4;

  -[MAFlashingLightsProcessor pse](self, "pse");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(surface) = objc_msgSend(v4, "canProcessSurface:", surface);

  return (char)surface;
}

- (MAFlashingLightsProcessorResult)processSurface:(IOSurfaceRef)inSurface outSurface:(IOSurfaceRef)outSurface timestamp:(CFAbsoluteTime)timestamp options:(NSDictionary *)options
{
  NSDictionary *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  uint64_t v20;
  uint64_t v21;
  double *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double *v26;
  uint64_t v27;
  uint64_t v28;

  v10 = options;
  -[MAFlashingLightsProcessor pse](self, "pse");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "canProcessSurface:", inSurface);

  if ((v12 & 1) != 0)
  {
    v25 = 0;
    v26 = (double *)&v25;
    v27 = 0x2020000000;
    v28 = 0;
    v21 = 0;
    v22 = (double *)&v21;
    v23 = 0x2020000000;
    v24 = 0;
    -[MAFlashingLightsProcessor pse](self, "pse", MEMORY[0x1E0C809B0], 3221225472, __73__MAFlashingLightsProcessor_processSurface_outSurface_timestamp_options___block_invoke, &unk_1E6928708, &v25, &v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValidationCallback:", &v20);

    v14 = (void *)-[NSDictionary mutableCopy](v10, "mutableCopy");
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_1E692A748, CFSTR("sourceSurfaceEDR"));
    objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_1E692A748, CFSTR("displayEDRFactor"));
    objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_1E692A758, CFSTR("displayMaxNits"));
    -[MAFlashingLightsProcessor pse](self, "pse");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "processSourceSurface:withTimestamp:toDestinationSurface:options:", inSurface, outSurface, v14, timestamp);

    v16 = (void *)objc_opt_new();
    objc_msgSend(v16, "setSurfaceProcessed:", 1);
    v17 = v26[3];
    *(float *)&v17 = v17;
    objc_msgSend(v16, "setIntensityLevel:", v17);
    v18 = v22[3];
    *(float *)&v18 = v18;
    objc_msgSend(v16, "setMitigationLevel:", v18);

    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v25, 8);
  }
  else
  {
    v16 = (void *)objc_opt_new();
  }

  return (MAFlashingLightsProcessorResult *)v16;
}

uint64_t __73__MAFlashingLightsProcessor_processSurface_outSurface_timestamp_options___block_invoke(uint64_t result, double a2, double a3, double a4)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a3;
  *(double *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = a4;
  return result;
}

- (PSEVideoProcessor)pse
{
  return self->pse;
}

- (void)setPse:(id)a3
{
  objc_storeStrong((id *)&self->pse, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->pse, 0);
}

@end
