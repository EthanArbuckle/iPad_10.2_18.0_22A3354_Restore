@implementation VCPCNNEspressoContext

+ (BOOL)supportGPU
{
  return SocType() - 247 < 0xA;
}

+ (void)createContextWithForceCPU
{
  void *context;
  int v3;
  os_log_type_t v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  __int16 v9;
  __int16 v10;

  context = (void *)espresso_create_context();
  v3 = MediaAnalysisLogLevel();
  if (context)
  {
    if (v3 >= 7)
    {
      v4 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v10 = 0;
        v5 = MEMORY[0x1E0C81028];
        v6 = "[VCPCNNEspressoContext] created CPU context";
        v7 = (uint8_t *)&v10;
LABEL_8:
        _os_log_impl(&dword_1B6C4A000, v5, v4, v6, v7, 2u);
      }
    }
  }
  else if (v3 >= 3)
  {
    v4 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v9 = 0;
      v5 = MEMORY[0x1E0C81028];
      v6 = "[VCPCNNEspressoContext] Failed to CPU context";
      v7 = (uint8_t *)&v9;
      goto LABEL_8;
    }
  }
  return context;
}

+ (void)createContextWithMPSGraph
{
  void *context;
  int v4;
  uint8_t v6[16];
  uint8_t buf[16];

  context = (void *)espresso_create_context();
  v4 = MediaAnalysisLogLevel();
  if (context)
  {
    if (v4 >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VCPCNNEspressoContext] created MPSGraph context", buf, 2u);
    }
  }
  else
  {
    if (v4 >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[VCPCNNEspressoContext] Failed to create MPSGraph context, fall back to CPU context", v6, 2u);
    }
    return (void *)objc_msgSend(a1, "createContextWithForceCPU");
  }
  return context;
}

+ (void)createContextPreferred
{
  void *context;
  int v4;
  uint8_t v6[16];
  uint8_t v7[16];
  uint8_t buf[16];

  context = (void *)espresso_create_context();
  v4 = MediaAnalysisLogLevel();
  if (context)
  {
    if (v4 >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VCPCNNEspressoContext] created preferred context", buf, 2u);
    }
  }
  else
  {
    if (v4 >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[VCPCNNEspressoContext] Failed to create ANE context, fall back to MPS context", v7, 2u);
    }
    context = (void *)espresso_create_context();
    if (!context)
    {
      if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[VCPCNNEspressoContext] Failed to create MPS context, fall back to CPU context", v6, 2u);
      }
      return (void *)objc_msgSend(a1, "createContextWithForceCPU");
    }
  }
  return context;
}

+ (void)sharedContextWithForceCPU:(BOOL)a3
{
  _QWORD block[5];

  if (a3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__VCPCNNEspressoContext_sharedContextWithForceCPU___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (+[VCPCNNEspressoContext sharedContextWithForceCPU:]::onceToken != -1)
      dispatch_once(&+[VCPCNNEspressoContext sharedContextWithForceCPU:]::onceToken, block);
  }
  return (void *)+[VCPCNNEspressoContext sharedContextWithForceCPU:]::espressoContext;
}

void __51__VCPCNNEspressoContext_sharedContextWithForceCPU___block_invoke(uint64_t a1)
{
  uint8_t v1[16];

  +[VCPCNNEspressoContext sharedContextWithForceCPU:]::espressoContext = objc_msgSend(*(id *)(a1 + 32), "createContextWithForceCPU");
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VCPCNNEspressoContext] sharing CPU context", v1, 2u);
  }
}

+ (void)sharedContextWithMPSGraph:(BOOL)a3
{
  _QWORD block[5];

  if (a3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__VCPCNNEspressoContext_sharedContextWithMPSGraph___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (+[VCPCNNEspressoContext sharedContextWithMPSGraph:]::onceToken != -1)
      dispatch_once(&+[VCPCNNEspressoContext sharedContextWithMPSGraph:]::onceToken, block);
  }
  return (void *)+[VCPCNNEspressoContext sharedContextWithMPSGraph:]::espressoContext;
}

void __51__VCPCNNEspressoContext_sharedContextWithMPSGraph___block_invoke(uint64_t a1)
{
  uint8_t v1[16];

  +[VCPCNNEspressoContext sharedContextWithMPSGraph:]::espressoContext = objc_msgSend(*(id *)(a1 + 32), "createContextWithMPSGraph");
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VCPCNNEspressoContext] sharing MPSGraph context", v1, 2u);
  }
}

+ (void)sharedContextPreferred:(BOOL)a3
{
  _QWORD block[5];

  if (a3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__VCPCNNEspressoContext_sharedContextPreferred___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (+[VCPCNNEspressoContext sharedContextPreferred:]::onceToken != -1)
      dispatch_once(&+[VCPCNNEspressoContext sharedContextPreferred:]::onceToken, block);
  }
  return (void *)+[VCPCNNEspressoContext sharedContextPreferred:]::espressoContext;
}

void __48__VCPCNNEspressoContext_sharedContextPreferred___block_invoke(uint64_t a1)
{
  uint8_t v1[16];

  +[VCPCNNEspressoContext sharedContextPreferred:]::espressoContext = objc_msgSend(*(id *)(a1 + 32), "createContextPreferred");
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VCPCNNEspressoContext] sharing preferred context", v1, 2u);
  }
}

- (VCPCNNEspressoContext)initWithForceCPU:(BOOL)a3 forceNNGraph:(BOOL)a4 shared:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  VCPCNNEspressoContext *v8;
  uint64_t v9;
  VCPCNNEspressoContext *v10;
  VCPCNNEspressoContext *v11;
  objc_super v13;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VCPCNNEspressoContext;
  v8 = -[VCPCNNEspressoContext init](&v13, sel_init);
  if (v8)
  {
    if (v5)
    {
      if (v7)
      {
        v9 = objc_msgSend((id)objc_opt_class(), "sharedContextWithForceCPU:", 1);
      }
      else if (v6)
      {
        v9 = objc_msgSend((id)objc_opt_class(), "sharedContextWithMPSGraph:", 1);
      }
      else
      {
        v9 = objc_msgSend((id)objc_opt_class(), "sharedContextPreferred:", 1);
      }
    }
    else if (v7)
    {
      v9 = objc_msgSend((id)objc_opt_class(), "createContextWithForceCPU");
    }
    else if (v6)
    {
      v9 = objc_msgSend((id)objc_opt_class(), "createContextWithMPSGraph");
    }
    else
    {
      v9 = objc_msgSend((id)objc_opt_class(), "createContextPreferred");
    }
    v8->_espressoContext = (void *)v9;
  }
  else
  {
    v9 = MEMORY[8];
  }
  if (v9)
    v10 = v8;
  else
    v10 = 0;
  v11 = v10;

  return v11;
}

- (void)dealloc
{
  void *espressoContext;
  void *v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  objc_super v8;
  uint8_t buf[16];

  espressoContext = self->_espressoContext;
  if (!espressoContext)
  {
    if ((int)MediaAnalysisLogLevel() < 7 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      goto LABEL_16;
    *(_WORD *)buf = 0;
    v6 = MEMORY[0x1E0C81028];
    v7 = "[VCPCNNEspressoContext] No valid context; skip dealloc";
LABEL_15:
    _os_log_impl(&dword_1B6C4A000, v6, OS_LOG_TYPE_DEBUG, v7, buf, 2u);
    goto LABEL_16;
  }
  if (espressoContext == (void *)objc_msgSend((id)objc_opt_class(), "sharedContextWithForceCPU:", 0)
    || (v4 = self->_espressoContext, v4 == (void *)objc_msgSend((id)objc_opt_class(), "sharedContextWithMPSGraph:", 0))
    || (v5 = self->_espressoContext, v5 == (void *)objc_msgSend((id)objc_opt_class(), "sharedContextPreferred:", 0)))
  {
    if ((int)MediaAnalysisLogLevel() < 7 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      goto LABEL_16;
    *(_WORD *)buf = 0;
    v6 = MEMORY[0x1E0C81028];
    v7 = "[VCPCNNEspressoContext] dealloc shared context; keep alive";
    goto LABEL_15;
  }
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VCPCNNEspressoContext] dealloc context;",
      buf,
      2u);
  }
  espresso_context_destroy();
LABEL_16:
  v8.receiver = self;
  v8.super_class = (Class)VCPCNNEspressoContext;
  -[VCPCNNEspressoContext dealloc](&v8, sel_dealloc);
}

- (void)espressoContext
{
  return self->_espressoContext;
}

@end
