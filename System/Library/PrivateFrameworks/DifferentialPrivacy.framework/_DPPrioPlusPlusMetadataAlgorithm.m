@implementation _DPPrioPlusPlusMetadataAlgorithm

+ (id)initializeWithDimensionality:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithDimensionality:", a3);
}

- (_DPPrioPlusPlusMetadataAlgorithm)initWithDimensionality:(unint64_t)a3
{
  _DPPrioPlusPlusMetadataAlgorithm *v4;
  uint64_t *v5;
  NSObject *v6;
  _DPPrioPlusPlusMetadataAlgorithm *v7;
  _QWORD *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_DPPrioPlusPlusMetadataAlgorithm;
  v4 = -[_DPPrioPlusPlusMetadataAlgorithm init](&v10, sel_init);
  v5 = (uint64_t *)v4;
  if (!v4)
    goto LABEL_8;
  v4->_dimension = a3;
  if (a3 && 2 * nextPowerOfTwo(a3 + 1) <= 0x100000)
  {
    v8 = prio_memory_alloc(v5[1]);
    v5[2] = (uint64_t)v8;
    if (!v8)
    {
      +[_DPLog framework](_DPLog, "framework");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[_DPPrioPlusPlusMetadataAlgorithm initWithDimensionality:].cold.2(v5 + 1, v6);
      goto LABEL_6;
    }
LABEL_8:
    v7 = v5;
    goto LABEL_9;
  }
  +[_DPLog framework](_DPLog, "framework");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[_DPPrioPlusPlusMetadataAlgorithm initWithDimensionality:].cold.1(v5 + 1, v6);
LABEL_6:

  v7 = 0;
LABEL_9:

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  prio_memory_free(self->_prioMemory);
  v3.receiver = self;
  v3.super_class = (Class)_DPPrioPlusPlusMetadataAlgorithm;
  -[_DPPrioPlusPlusMetadataAlgorithm dealloc](&v3, sel_dealloc);
}

- (id)randomize:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  id v7;
  int *v8;
  id v9;
  unsigned __int8 *v10;
  int *v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
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
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v35[3];
  _QWORD v36[4];

  v36[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_DPPrioPlusPlusMetadataAlgorithm dimension](self, "dimension");
  v6 = prio_share_length(v5);
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 4 * v6);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = (int *)objc_msgSend(v7, "mutableBytes");
  v9 = objc_retainAutorelease(v4);
  v10 = (unsigned __int8 *)objc_msgSend(v9, "bytes");
  if (v5)
  {
    v11 = v8;
    v12 = v5;
    while (1)
    {
      v14 = *v10++;
      v13 = v14;
      if (v14 >= 2)
        break;
      *v11++ = v13;
      if (!--v12)
        goto LABEL_5;
    }
    +[_DPLog framework](_DPLog, "framework");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[_DPPrioPlusPlusMetadataAlgorithm randomize:].cold.2(v15, v20, v21, v22, v23, v24, v25, v26);
    v19 = 0;
  }
  else
  {
LABEL_5:
    prio_encode(v5, v8, v6, (_QWORD *)-[_DPPrioPlusPlusMetadataAlgorithm prioMemory](self, "prioMemory"));
    +[_DPPrioSeedablePRNG generateSeed](_DPPrioSeedablePRNG, "generateSeed");
    v15 = objc_claimAutoreleasedReturnValue();
    +[_DPPrioSeedablePRNG randomDataFromSeed:length:](_DPPrioSeedablePRNG, "randomDataFromSeed:length:", v15, v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      share_array_prng((unsigned int *)v8, (unsigned int *)objc_msgSend(objc_retainAutorelease(v16), "bytes"), v6);
      v35[0] = CFSTR("share1");
      v35[1] = CFSTR("share2");
      v36[0] = v7;
      v36[1] = v15;
      v35[2] = CFSTR("dimensionality");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v5);
      v18 = objc_claimAutoreleasedReturnValue();
      v36[2] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[_DPLog framework](_DPLog, "framework");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[_DPPrioPlusPlusMetadataAlgorithm randomize:].cold.1(v18, v27, v28, v29, v30, v31, v32, v33);
      v19 = 0;
    }

  }
  return v19;
}

- (unint64_t)dimension
{
  return self->_dimension;
}

- ($3E795846BAB0B0BE45D8E32B87DA34B9)prioMemory
{
  return self->_prioMemory;
}

- (void)initWithDimensionality:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
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
  _os_log_error_impl(&dword_1D3FAA000, a2, OS_LOG_TYPE_ERROR, "_DPPrioPlusPlusMetadataAlgorithm called with dimensionality %lu, need to be more than 0 and less than %u.", (uint8_t *)&v3, 0x12u);
}

- (void)initWithDimensionality:(uint64_t *)a1 .cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 134217984;
  v4 = v2;
  _os_log_error_impl(&dword_1D3FAA000, a2, OS_LOG_TYPE_ERROR, "Failed to allocate memory for _DPPrioPlusPlusMetadataAlgorithm with dimensionality %lu.", (uint8_t *)&v3, 0xCu);
}

- (void)randomize:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1D3FAA000, a1, a3, "_DPPrioPlusPlusMetadataAlgorithm failed to generate random numbers from a seed.", a5, a6, a7, a8, 0);
}

- (void)randomize:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1D3FAA000, a1, a3, "_DPPrioPlusPlusMetadataAlgorithm received invalid bit vector.", a5, a6, a7, a8, 0);
}

@end
