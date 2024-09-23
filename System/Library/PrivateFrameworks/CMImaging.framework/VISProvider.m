@implementation VISProvider

+ (id)VISProcessorForVersion:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(_QWORD *)&a3;
  objc_msgSend((id)objc_opt_class(), "_loadVISBundleForVersion:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VISProcessorV%d"), v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init((Class)objc_msgSend(v4, "classNamed:", v5));
    if (!v6)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v6 = 0;
    v5 = 0;
  }

  return v6;
}

+ (id)VISConfigurationForVersion:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(_QWORD *)&a3;
  objc_msgSend((id)objc_opt_class(), "_loadVISBundleForVersion:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VISConfigurationV%d"), v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init((Class)objc_msgSend(v4, "classNamed:", v5));
    if (!v6)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v6 = 0;
    v5 = 0;
  }

  return v6;
}

+ (id)_loadVISBundleForVersion:(unsigned int)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/VideoStabilizationV%d.bundle"), CFSTR("/System/Library/VideoProcessors/"), *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if ((objc_msgSend(v5, "loadAndReturnError:", 0) & 1) == 0)
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      v5 = 0;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v5;
}

@end
