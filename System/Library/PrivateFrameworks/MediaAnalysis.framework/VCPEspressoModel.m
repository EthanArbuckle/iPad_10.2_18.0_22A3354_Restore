@implementation VCPEspressoModel

- (id)initModelWithName:(id)a3 andConfig:(id)a4
{
  id v6;
  void *v7;
  VCPEspressoModel *v8;
  VCPEspressoModel *v9;
  _BOOL4 v10;
  id v11;
  VCPEspressoModel *v12;
  VCPEspressoModel *v13;
  id v15;
  objc_super v16;

  v6 = a4;
  objc_msgSend(a3, "stringByAppendingFormat:", CFSTR(".espresso.net"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)VCPEspressoModel;
  v8 = -[VCPEspressoModel init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    v15 = 0;
    v10 = -[VCPEspressoModel prepareModelWithFile:engine:config:error:](v8, "prepareModelWithFile:engine:config:error:", v7, 10007, v6, &v15);
    v11 = v15;
    if (v10)
      v12 = v9;
    else
      v12 = 0;
  }
  else
  {
    v12 = 0;
    v11 = 0;
  }
  v13 = v12;

  return v13;
}

- (int)loadModel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  int v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "vcp_mediaAnalysisBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resourceURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "path");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v8, "UTF8String");
    v9 = espresso_plan_add_network();

  }
  else
  {
    v9 = -1;
  }

  return v9;
}

- (BOOL)prepareModelWithFile:(id)a3 engine:(int)a4 config:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  OS_dispatch_queue *v11;
  OS_dispatch_queue *callbackQueue;
  void *context;
  void *plan;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = (OS_dispatch_queue *)dispatch_queue_create("callback queue", 0);
  callbackQueue = self->_callbackQueue;
  self->_callbackQueue = v11;

  context = (void *)espresso_create_context();
  self->_context = context;
  if (context)
  {
    plan = (void *)espresso_create_plan();
    self->_plan = plan;
    if (plan)
    {
      if (-[VCPEspressoModel loadModel:](self, "loadModel:", v9))
      {
        if (a6)
        {
          v15 = (void *)MEMORY[0x1E0CB35C8];
          v25 = *MEMORY[0x1E0CB2D50];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ Load Error"), v9);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v16;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
          *a6 = v18;

          LOBYTE(a6) = 0;
        }
      }
      else if (-[VCPEspressoModel buildModelWithConfig:error:](self, "buildModelWithConfig:error:", v10, a6))
      {
        LOBYTE(a6) = 1;
      }
      else if (a6)
      {
        v21 = (void *)MEMORY[0x1E0CB35C8];
        v23 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Build Model Error"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
    }
    else if (a6)
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v27 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Create Plan Error"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
  }
  else if (a6)
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v29 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Create Context Error"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }

  return (char)a6;
}

- (BOOL)buildModelWithConfig:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5
    && (objc_msgSend(objc_retainAutorelease(v5), "UTF8String"), espresso_network_select_configuration()))
  {
    if (a4)
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v15 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Select Configuration Error"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      *a4 = v10;

      LOBYTE(a4) = 0;
    }
  }
  else
  {
    if (!espresso_plan_build())
    {
      LOBYTE(a4) = 1;
      goto LABEL_10;
    }
    if (a4)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v13 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Build Plan Error"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
LABEL_10:

  return (char)a4;
}

- (BOOL)updateModelWithConfig:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (espresso_plan_build_clean())
  {
    if (a4)
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v11 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Clean Plan Error"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v9);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a4) = 0;
    }
  }
  else
  {
    LOBYTE(a4) = -[VCPEspressoModel buildModelWithConfig:error:](self, "buildModelWithConfig:error:", v6, a4);
  }

  return (char)a4;
}

- (void)freeModel
{
  OS_dispatch_queue *callbackQueue;

  callbackQueue = self->_callbackQueue;
  self->_callbackQueue = 0;

  if (self->_plan)
    espresso_plan_destroy();
  if (self->_context)
    espresso_context_destroy();
}

- (void)dealloc
{
  objc_super v3;

  if (self->_plan)
    espresso_plan_destroy();
  if (self->_context)
    espresso_context_destroy();
  v3.receiver = self;
  v3.super_class = (Class)VCPEspressoModel;
  -[VCPEspressoModel dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

@end
