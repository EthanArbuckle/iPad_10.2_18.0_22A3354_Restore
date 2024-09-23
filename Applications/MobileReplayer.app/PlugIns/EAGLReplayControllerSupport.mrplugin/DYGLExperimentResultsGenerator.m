@implementation DYGLExperimentResultsGenerator

- (void)startTiming
{
  void *v3;
  void *v4;
  unsigned int v5;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLExperimentResultsGenerator functionPlayer](self, "functionPlayer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLExperimentResultsGenerator experiment](self, "experiment"));
  v5 = objc_msgSend(v4, "enableExperimentFinish");

  if (v5)
    (*((void (**)(id))objc_msgSend(v3, "gliDispatch") + 89))(objc_msgSend(v3, "gliContext"));
  v6.receiver = self;
  v6.super_class = (Class)DYGLExperimentResultsGenerator;
  -[DYGLExperimentResultsGenerator startTiming](&v6, "startTiming");

}

- (void)stopTiming
{
  void *v3;
  void *v4;
  unsigned int v5;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLExperimentResultsGenerator functionPlayer](self, "functionPlayer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLExperimentResultsGenerator experiment](self, "experiment"));
  v5 = objc_msgSend(v4, "enableExperimentFinish");

  if (v5)
    (*((void (**)(id))objc_msgSend(v3, "gliDispatch") + 89))(objc_msgSend(v3, "gliContext"));
  v6.receiver = self;
  v6.super_class = (Class)DYGLExperimentResultsGenerator;
  -[DYGLExperimentResultsGenerator stopTiming](&v6, "stopTiming");

}

- (void)begin
{
  uint64_t v2;
  NSMutableArray *v3;
  NSMutableArray *overrides;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *i;
  void *v12;
  DYEAGLFunctionPlayerOverride *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];

  v19.receiver = self;
  v19.super_class = (Class)DYGLExperimentResultsGenerator;
  -[DYGLExperimentResultsGenerator begin](&v19, "begin");
  v3 = (NSMutableArray *)objc_opt_new(NSMutableArray, v2);
  overrides = self->_overrides;
  self->_overrides = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLExperimentResultsGenerator functionPlayer](self, "functionPlayer"));
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLExperimentResultsGenerator experiment](self, "experiment"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "overrideTypeStrings"));

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    v10 = kDYFunctionPlayerOverrideDisablePresentKey;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v12, "isEqualToString:", v10))
        {
          DYDisableBufferSwaps(1);
          v13 = 0;
        }
        else
        {
          v13 = -[DYEAGLFunctionPlayerOverride initWithFunctionPlayer:overrideKey:]([DYEAGLFunctionPlayerOverride alloc], "initWithFunctionPlayer:overrideKey:", v5, v12);
          if (v13)
            -[NSMutableArray addObject:](self->_overrides, "addObject:", v13);
        }

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v8);
  }

}

- (void)end
{
  NSMutableArray *overrides;
  objc_super v4;

  overrides = self->_overrides;
  self->_overrides = 0;

  v4.receiver = self;
  v4.super_class = (Class)DYGLExperimentResultsGenerator;
  -[DYGLExperimentResultsGenerator end](&v4, "end");
}

- (void)onGraphicsFunctionEnd
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLExperimentResultsGenerator experiment](self, "experiment"));
  v4 = objc_msgSend(v3, "profilingFlags");

  if ((v4 & 0x40) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLExperimentResultsGenerator functionPlayer](self, "functionPlayer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "context"));
    DYAddPerFunctionProfilingData(v6, objc_msgSend(v5, "ctxID"), objc_msgSend(v5, "currentFileFunctionIndex"));

  }
  v7.receiver = self;
  v7.super_class = (Class)DYGLExperimentResultsGenerator;
  -[DYGLExperimentResultsGenerator onGraphicsFunctionEnd](&v7, "onGraphicsFunctionEnd");
}

- (void)onPlatformFunctionEnd
{
  NSMutableArray *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  unsigned int v10;
  void *v11;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = self->_overrides;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v14;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v6), "onPlatformFunctionEnd");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLExperimentResultsGenerator experiment](self, "experiment"));
  v8 = ((unint64_t)objc_msgSend(v7, "profilingFlags") & 0x40) == 0;

  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLExperimentResultsGenerator functionPlayer](self, "functionPlayer"));
    v10 = -[DYGLExperimentResultsGenerator prevFileFunctionIndex](self, "prevFileFunctionIndex");
    if (v10 != objc_msgSend(v9, "currentFileFunctionIndex"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "context"));
      DYAddPerFunctionProfilingData(v11, objc_msgSend(v9, "ctxID"), objc_msgSend(v9, "currentFileFunctionIndex"));

    }
  }
  v12.receiver = self;
  v12.super_class = (Class)DYGLExperimentResultsGenerator;
  -[DYGLExperimentResultsGenerator onPlatformFunctionEnd](&v12, "onPlatformFunctionEnd");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrides, 0);
}

@end
