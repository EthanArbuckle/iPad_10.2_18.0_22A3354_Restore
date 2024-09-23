@implementation STFIBPProvider

+ (id)STFStillIBPForVersion:(unsigned int)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%d"), CFSTR("STFStillProcessorV"), 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0CB34D0];
    v5 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(CFSTR("/System/Library/VideoProcessors"), "stringByAppendingString:", CFSTR("/STF.bundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fileURLWithPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleWithURL:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc_init((Class)objc_msgSend(v8, "classNamed:", v3));
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v3 = 0;
    v8 = 0;
    v9 = 0;
  }

  return v9;
}

+ (id)STFVideoProcessorForVersion:(unsigned int)a3 ringBufferSize:(unsigned int)a4 historySize:(unsigned int)a5 cmdQueue:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = *(_QWORD *)&a5;
  v7 = *(_QWORD *)&a4;
  v9 = a6;
  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%d"), CFSTR("STFVideoProcessorV"), 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0CB34D0];
    v12 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(CFSTR("/System/Library/VideoProcessors"), "stringByAppendingString:", CFSTR("/STF.bundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fileURLWithPath:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleWithURL:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v15, "classNamed:", v10)), "initWithRingBufferSize:historySize:cmdQueue:", v7, v6, v9);
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v10 = 0;
    v15 = 0;
    v16 = 0;
  }

  return v16;
}

@end
