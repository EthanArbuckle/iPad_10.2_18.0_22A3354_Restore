@implementation _DPPrioAlgorithm

- (_DPPrioAlgorithm)initWithEpsilon:(double)a3 dimensionality:(unint64_t)a4
{
  _DPPrioAlgorithm *v5;
  _DPPrioAlgorithm *v8;
  uint64_t v9;
  _DPBiasedCoin *coin;
  NSObject *v11;
  $3E795846BAB0B0BE45D8E32B87DA34B9 *v12;
  _DPPrioAlgorithm *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  objc_super v21;

  v5 = self;
  if (a3 < 0.0 || a3 > 16.0)
    goto LABEL_15;
  v21.receiver = self;
  v21.super_class = (Class)_DPPrioAlgorithm;
  v8 = -[_DPPrioAlgorithm init](&v21, sel_init);
  v5 = v8;
  if (v8)
  {
    v8->_dimension = a4;
    v8->_epsilon = a3;
    +[_DPBiasedCoin coinWithBias:](_DPBiasedCoin, "coinWithBias:", (double)(1.0 / (exp(a3) + 1.0)));
    v9 = objc_claimAutoreleasedReturnValue();
    coin = v5->_coin;
    v5->_coin = (_DPBiasedCoin *)v9;

    if (2 * nextPowerOfTwo(a4 + 1) > 0x100000)
    {
      +[_DPLog framework](_DPLog, "framework");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[_DPPrioAlgorithm initWithEpsilon:dimensionality:].cold.1((uint64_t *)&v5->_dimension, v11);
LABEL_14:

LABEL_15:
      v13 = 0;
      goto LABEL_16;
    }
    v12 = ($3E795846BAB0B0BE45D8E32B87DA34B9 *)prio_memory_alloc(v5->_dimension);
    v5->_prioMemory = v12;
    if (!v12)
    {
      +[_DPLog framework](_DPLog, "framework");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[_DPPrioAlgorithm initWithEpsilon:dimensionality:].cold.2((uint64_t)&v5->_dimension, v11, v14, v15, v16, v17, v18, v19);
      goto LABEL_14;
    }
  }
  v5 = v5;
  v13 = v5;
LABEL_16:

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  prio_memory_free(self->_prioMemory);
  v3.receiver = self;
  v3.super_class = (Class)_DPPrioAlgorithm;
  -[_DPPrioAlgorithm dealloc](&v3, sel_dealloc);
}

+ (id)prioWithEpsilon:(double)a3 dimensionality:(unint64_t)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithEpsilon:dimensionality:", a4, a3);
}

- (id)privatizeDataWithBlock:(id)a3
{
  return -[_DPPrioAlgorithm privatizeDataWithLocalDP:withBlock:](self, "privatizeDataWithLocalDP:withBlock:", 1, a3);
}

- (id)privatizeDataWithLocalDP:(BOOL)a3 withBlock:(id)a4
{
  _BOOL4 v4;
  uint64_t (**v6)(_QWORD, uint64_t, uint64_t);
  uint64_t v7;
  unint64_t v8;
  size_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  const __SecRandom *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  _DWORD *v31;
  uint64_t v32;
  void *v33;
  int v34;
  NSObject *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int *v52;
  uint64_t (**v53)(_QWORD, uint64_t, uint64_t);
  _QWORD v54[3];
  _QWORD v55[4];

  v4 = a3;
  v55[3] = *MEMORY[0x1E0C80C00];
  v6 = (uint64_t (**)(_QWORD, uint64_t, uint64_t))a4;
  v7 = -[_DPPrioAlgorithm dimension](self, "dimension");
  v8 = prio_share_length(v7);
  v9 = +[_DPPrioSeedablePRNG seedLength](_DPPrioSeedablePRNG, "seedLength");
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 4 * v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v53 = v6;
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_retainAutorelease(v10);
    v13 = objc_msgSend(v12, "mutableBytes");
    v14 = (const __SecRandom *)*MEMORY[0x1E0CD7000];
    v15 = objc_retainAutorelease(v11);
    if (SecRandomCopyBytes(v14, v9, (void *)-[NSObject mutableBytes](v15, "mutableBytes")))
    {
      +[_DPLog framework](_DPLog, "framework");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[_DPPrioAlgorithm privatizeDataWithLocalDP:withBlock:].cold.4(v16, v17, v18, v19, v20, v21, v22, v23);
    }
    else
    {
      if ((v53[2](v53, v13, v7) & 1) != 0)
      {
        v52 = (int *)v13;
        if (v7 && v4)
        {
          v31 = (_DWORD *)v13;
          v32 = v7;
          do
          {
            -[_DPPrioAlgorithm coin](self, "coin");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v33, "flip");

            if (v34)
              *v31 = *v31 == 0;
            ++v31;
            --v32;
          }
          while (v32);
        }
        prio_encode(v7, v52, v8, (_QWORD *)-[_DPPrioAlgorithm prioMemory](self, "prioMemory"));
        +[_DPPrioSeedablePRNG randomDataFromSeed:length:](_DPPrioSeedablePRNG, "randomDataFromSeed:length:", v15, v8);
        v35 = objc_claimAutoreleasedReturnValue();
        v16 = v35;
        if (v35)
        {
          share_array_prng((unsigned int *)v52, (unsigned int *)-[NSObject bytes](objc_retainAutorelease(v35), "bytes"), v8);
          v54[0] = CFSTR("share1");
          v54[1] = CFSTR("share2");
          v55[0] = v12;
          v55[1] = v15;
          v54[2] = CFSTR("dimensionality");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v7);
          v36 = objc_claimAutoreleasedReturnValue();
          v55[2] = v36;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 3);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          +[_DPLog framework](_DPLog, "framework");
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            -[_DPPrioAlgorithm privatizeDataWithLocalDP:withBlock:].cold.2(v36, v45, v46, v47, v48, v49, v50, v51);
          v30 = 0;
        }
        v6 = v53;

        goto LABEL_20;
      }
      +[_DPLog framework](_DPLog, "framework");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[_DPPrioAlgorithm privatizeDataWithLocalDP:withBlock:].cold.3(v16, v37, v38, v39, v40, v41, v42, v43);
    }
    v30 = 0;
    v6 = v53;
LABEL_20:

    goto LABEL_21;
  }
  +[_DPLog framework](_DPLog, "framework");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[_DPPrioAlgorithm privatizeDataWithLocalDP:withBlock:].cold.1(v7, v15, v24, v25, v26, v27, v28, v29);
  v30 = 0;
LABEL_21:

  return v30;
}

- (double)epsilon
{
  return self->_epsilon;
}

- (unint64_t)dimension
{
  return self->_dimension;
}

- ($3E795846BAB0B0BE45D8E32B87DA34B9)prioMemory
{
  return self->_prioMemory;
}

- (_DPBiasedCoin)coin
{
  return self->_coin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coin, 0);
}

- (void)initWithEpsilon:(uint64_t *)a1 dimensionality:(NSObject *)a2 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 134218240;
  v4 = v2;
  v5 = 1024;
  v6 = 0x100000;
  _os_log_error_impl(&dword_1D3FAA000, a2, OS_LOG_TYPE_ERROR, "_DPPrioAlgorithm called with dimensionality %lu, need to be less than %u.", (uint8_t *)&v3, 0x12u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithEpsilon:(uint64_t)a3 dimensionality:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, a2, a3, "Failed to allocate memory for _DPPrioAlgorithm with dimensionality %lu.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)privatizeDataWithLocalDP:(uint64_t)a3 withBlock:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, a2, a3, "_DPPRioAlgorithm fail to allocate memory with dimension=%zu.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)privatizeDataWithLocalDP:(uint64_t)a3 withBlock:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1D3FAA000, a1, a3, "_DPPRioAlgorithm failed to generate random numbers from a seed.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

- (void)privatizeDataWithLocalDP:(uint64_t)a3 withBlock:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1D3FAA000, a1, a3, "_DPPRioAlgorithm's dataIntializationBlock aborted.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

- (void)privatizeDataWithLocalDP:(uint64_t)a3 withBlock:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1D3FAA000, a1, a3, "_DPPRioAlgorithm failed to generate a random seed.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

@end
