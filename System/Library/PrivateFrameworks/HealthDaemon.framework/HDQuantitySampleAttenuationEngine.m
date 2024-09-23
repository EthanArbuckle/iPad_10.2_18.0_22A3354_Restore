@implementation HDQuantitySampleAttenuationEngine

- (HDQuantitySampleAttenuationEngine)initWithAttenuationEngineDelegate:(id)a3
{
  id v4;
  HDQuantitySampleAttenuationEngine *v5;
  HDQuantitySampleAttenuationEngine *v6;
  int64_t *p_sampleCountFromDelegate;
  NSError *delegateLoadFirstError;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDQuantitySampleAttenuationEngine;
  v5 = -[HDQuantitySampleAttenuationEngine init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    p_sampleCountFromDelegate = &v5->_sampleCountFromDelegate;
    objc_storeWeak((id *)&v5->_attenuationEngineDelegate, v4);
    *(_OWORD *)p_sampleCountFromDelegate = xmmword_1B7F41F10;
    v6->_noMoreDelegateSamples = 0;
    delegateLoadFirstError = v6->_delegateLoadFirstError;
    v6->_delegateLoadErrorCount = 0;
    v6->_delegateLoadFirstError = 0;

  }
  return v6;
}

- ($A3DB90B81A8072650F44011264F9C29D)attenuateSample:(SEL)a3
{
  $A3DB90B81A8072650F44011264F9C29D *v5;
  uint64_t *p_var1;
  __int128 v8;
  double var0;
  uint64_t v10;
  double var2;
  double i;
  double *p_var0;
  double v14;
  double var1;
  double v16;
  double v17;
  double v18;
  double v20;

  v5 = self;
  if (self)
  {
    p_var1 = (uint64_t *)&self[1024].var1;
    if (self[1024].var3)
    {
LABEL_3:
      v8 = *(_OWORD *)&a4->var2;
      *(_OWORD *)&retstr->var0 = *(_OWORD *)&a4->var0;
      *(_OWORD *)&retstr->var2 = v8;
      retstr->var4 = a4->var4;
      return self;
    }
    var0 = a4->var0;
    v10 = *p_var1;
    if (*p_var1 < 0)
    {
      -[HDQuantitySampleAttenuationEngine _loadSamplesFromDelegateAtLocation:]((char *)self, a4->var0);
      v10 = *p_var1;
      if (!*p_var1)
      {
LABEL_22:
        v5[1024].var3 = 1;
        goto LABEL_3;
      }
    }
    var2 = v5[1024].var2;
    for (i = v5[*(_QWORD *)&var2].var2; var0 >= i; i = v5[*(_QWORD *)&var2].var2)
    {
      ++*(_QWORD *)&var2;
      v5[1024].var2 = var2;
      if (*(uint64_t *)&var2 >= v10)
      {
        -[HDQuantitySampleAttenuationEngine _loadSamplesFromDelegateAtLocation:]((char *)v5, i);
        v10 = *p_var1;
        if (!*p_var1)
          goto LABEL_22;
        var2 = v5[1024].var2;
      }
    }
    if ((*(_QWORD *)&var2 & 0x8000000000000000) != 0)
      goto LABEL_3;
  }
  else
  {
    var2 = 0.0;
  }
  p_var0 = &v5[*(_QWORD *)&var2].var0;
  v14 = p_var0[1];
  var1 = a4->var1;
  if (var1 <= v14)
    goto LABEL_3;
  v17 = p_var0[2];
  v16 = p_var0[3];
  v18 = a4->var0;
  if (a4->var0 < v14 || var1 > v17)
  {
    *(_QWORD *)&retstr->var3 = 0;
    retstr->var0 = v18;
    if (v14 <= v18)
    {
      if (var1 >= v17)
        var1 = v17;
      v20 = a4->var2 - v16;
    }
    else
    {
      if (v14 < var1)
        var1 = v14;
      v20 = a4->var2;
    }
    retstr->var1 = var1;
    retstr->var2 = v20;
    retstr->var3 = a4->var3;
    retstr->var4 = 0;
  }
  else
  {
    retstr->var0 = v18;
    retstr->var1 = var1;
    retstr->var2 = a4->var2 - v16;
    *(_QWORD *)&retstr->var3 = 0;
    retstr->var4 = 0;
  }
  return self;
}

- (void)_loadSamplesFromDelegateAtLocation:(char *)a1
{
  id *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;

  v4 = (id *)(a1 + 40968);
  objc_msgSend(a1, "attenuationEngineDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v6 = objc_msgSend(v5, "loadAttenuationSamples:anchorTime:errorOut:", a1 + 8, &v9, a2);
  v7 = v9;
  v8 = v9;

  if (v6 < 0)
  {
    if (!v4[4])
      objc_storeStrong(v4 + 4, v7);
    v4[3] = (char *)v4[3] + 1;
  }
  else
  {
    *v4 = (id)v6;
  }
  v4[1] = 0;

}

- (BOOL)delegateLoadingWasSuccessful:(id *)a3
{
  int64_t delegateLoadErrorCount;
  NSError *v5;
  NSError *v6;

  delegateLoadErrorCount = self->_delegateLoadErrorCount;
  if (delegateLoadErrorCount >= 1)
  {
    v5 = self->_delegateLoadFirstError;
    v6 = v5;
    if (v5)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v5);
      else
        _HKLogDroppedError();
    }

  }
  return delegateLoadErrorCount < 1;
}

- (HDQuantitySampleAttenuationEngineDelegate)attenuationEngineDelegate
{
  return (HDQuantitySampleAttenuationEngineDelegate *)objc_loadWeakRetained((id *)&self->_attenuationEngineDelegate);
}

- (void)setAttenuationEngineDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_attenuationEngineDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_attenuationEngineDelegate);
  objc_storeStrong((id *)&self->_delegateLoadFirstError, 0);
}

@end
