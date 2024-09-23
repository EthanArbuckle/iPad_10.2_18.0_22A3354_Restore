@implementation DataSourceTrain

- (DataSourceTrain)init
{

  return 0;
}

- (DataSourceTrain)initWithNumDataPoints:(unint64_t)a3 sequenceLength:(unint64_t)a4 noiseSize:(unint64_t)a5 batchSize:(unint64_t)a6 vocabSize:(unint64_t)a7 contextKey:(id)a8 targetKey:(id)a9 maskKey:(id)a10 noiseKey:(id)a11
{
  char *v17;
  id v18;
  uint64_t *v19;
  DataSourceTrain *v20;
  NoiseSampler *v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v31;
  id v32;
  id v33;
  id v34;
  int v35;
  objc_super v36;

  v34 = a8;
  v33 = a9;
  v32 = a10;
  v31 = a11;
  v36.receiver = self;
  v36.super_class = (Class)DataSourceTrain;
  v17 = -[DataSourceTrain init](&v36, sel_init);
  v18 = v17;
  if (!v17)
  {
LABEL_8:
    v20 = (DataSourceTrain *)v18;
    goto LABEL_9;
  }
  v19 = (uint64_t *)(v17 + 8);
  std::vector<std::vector<float>>::resize((uint64_t *)v17 + 1, 1uLL);
  std::vector<std::vector<float>>::resize((uint64_t *)v18 + 4, 1uLL);
  std::vector<float>::resize(*v19, a4);
  std::vector<float>::resize(*((_QWORD *)v18 + 4), a4);
  v20 = 0;
  *((_QWORD *)v18 + 13) = a4;
  if (a3 && a6)
  {
    *((_QWORD *)v18 + 14) = (a3 + a6 - 1) / a6;
    *((_QWORD *)v18 + 15) = a5;
    *((_QWORD *)v18 + 16) = a6;
    v21 = -[NoiseSampler initWithZipfOfSize:]([NoiseSampler alloc], "initWithZipfOfSize:", a7);
    v22 = (void *)*((_QWORD *)v18 + 17);
    *((_QWORD *)v18 + 17) = v21;

    std::vector<std::vector<float>>::resize((uint64_t *)v18 + 1, *((_QWORD *)v18 + 14));
    std::vector<std::vector<float>>::resize((uint64_t *)v18 + 4, *((_QWORD *)v18 + 14));
    std::vector<std::vector<float>>::resize((uint64_t *)v18 + 7, *((_QWORD *)v18 + 14));
    std::vector<std::vector<float>>::resize((uint64_t *)v18 + 10, *((_QWORD *)v18 + 14));
    if (*((_QWORD *)v18 + 14))
    {
      v23 = 0;
      v24 = 0;
      v25 = *((_QWORD *)v18 + 16) * a4;
      do
      {
        v26 = *v19 + v23;
        v35 = 0;
        std::vector<float>::resize(v26, v25, &v35);
        v27 = *((_QWORD *)v18 + 4) + v23;
        v35 = 0;
        std::vector<float>::resize(v27, v25, &v35);
        v28 = *((_QWORD *)v18 + 7) + v23;
        v35 = 0;
        std::vector<float>::resize(v28, v25, &v35);
        std::vector<float>::resize(*((_QWORD *)v18 + 10) + v23, *((_QWORD *)v18 + 15));
        ++v24;
        v23 += 24;
      }
      while (v24 < *((_QWORD *)v18 + 14));
    }
    objc_storeStrong((id *)v18 + 18, a8);
    objc_storeStrong((id *)v18 + 19, a9);
    objc_storeStrong((id *)v18 + 20, a10);
    objc_storeStrong((id *)v18 + 21, a11);
    goto LABEL_8;
  }
LABEL_9:

  return v20;
}

- (id)dataPointAtIndex:(unint64_t)a3 error:(id *)a4
{
  unint64_t batchSize;
  unint64_t sequenceLength;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  _QWORD v40[5];
  _QWORD v41[5];
  _QWORD v42[5];
  _QWORD v43[7];

  v43[5] = *MEMORY[0x1E0C80C00];
  if (self->_numBatches <= a3)
    return MEMORY[0x1E0C9AA70];
  v39 = (id)objc_opt_new();
  batchSize = self->_batchSize;
  sequenceLength = self->_sequenceLength;
  v43[0] = &unk_1E5D5BE58;
  v43[1] = &unk_1E5D5BE58;
  v43[2] = &unk_1E5D5BE58;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", batchSize);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_sequenceLength);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v43[4] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 5);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = sequenceLength * batchSize;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", sequenceLength * batchSize);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_sequenceLength);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v14;
  v42[4] = &unk_1E5D5BE58;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 5);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F490]), "initWithData:type:shape:strides:", *((_QWORD *)self->_contextData.__begin_ + 3 * a3), 2, v37, v38);
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v15, self->_contextKey);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "objectForKeyedSubscript:", self->_contextKey);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setMaxNumberOfElements:", v16);

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F490]), "initWithData:type:shape:strides:", *((_QWORD *)self->_targetData.__begin_ + 3 * a3), 2, v37, v38);
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v18, self->_targetKey);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "objectForKeyedSubscript:", self->_targetKey);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setMaxNumberOfElements:", v19);

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F490]), "initWithData:type:shape:strides:", *((_QWORD *)self->_maskData.__begin_ + 3 * a3), 2, v37, v38);
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v21, self->_maskKey);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "objectForKeyedSubscript:", self->_maskKey);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setMaxNumberOfElements:", v22);

  v24 = objc_alloc(MEMORY[0x1E0D1F490]);
  v25 = *((_QWORD *)self->_noiseData.__begin_ + 3 * a3);
  v41[0] = &unk_1E5D5BE58;
  v41[1] = &unk_1E5D5BE58;
  v41[2] = &unk_1E5D5BE58;
  v41[3] = &unk_1E5D5BE58;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_noiseSize);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v41[4] = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_noiseSize);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v27;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_noiseSize);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v28;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_noiseSize);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v29;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_noiseSize);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v40[3] = v30;
  v40[4] = &unk_1E5D5BE58;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 5);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v24, "initWithData:type:shape:strides:", v25, 2, v26, v31);
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v32, self->_noiseKey);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_noiseSize);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "objectForKeyedSubscript:", self->_noiseKey);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setMaxNumberOfElements:", v33);

  return v39;
}

- (void)setVectorsWithProcessor:(id)a3
{
  void *v4;
  unint64_t batchSize;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  int v11;
  unint64_t sequenceLength;
  void *v13;
  unint64_t v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  unint64_t noiseSize;
  unint64_t v21;
  unint64_t numBatches;
  uint64_t v23;
  unint64_t i;
  id v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  objc_msgSend(v25, "textSequence");
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v28)
  {
    LODWORD(v30) = 0;
    v27 = *(_QWORD *)v32;
    do
    {
      v29 = 0;
      v30 = (int)v30;
      do
      {
        if (*(_QWORD *)v32 != v27)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v29);
        batchSize = self->_batchSize;
        objc_msgSend(v4, "sequence");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "target");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "mask");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 0;
        v10 = (int)(v30 % batchSize);
        v11 = v30 / batchSize;
        while (v9 < objc_msgSend(v6, "count"))
        {
          sequenceLength = self->_sequenceLength;
          objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "floatValue");
          v14 = v9 + sequenceLength * v10;
          *(_DWORD *)(*((_QWORD *)self->_contextData.__begin_ + 3 * v11) + 4 * v14) = v15;

          objc_msgSend(v7, "objectAtIndexedSubscript:", v9);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "floatValue");
          *(_DWORD *)(*((_QWORD *)self->_targetData.__begin_ + 3 * v11) + 4 * v14) = v17;

          objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "floatValue");
          *(_DWORD *)(*((_QWORD *)self->_maskData.__begin_ + 3 * v11) + 4 * v14) = v19;

          ++v9;
        }

        ++v29;
        ++v30;
      }
      while (v29 != v28);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v28);
  }

  noiseSize = self->_noiseSize;
  if (noiseSize)
  {
    v21 = 0;
    numBatches = self->_numBatches;
    do
    {
      if (numBatches)
      {
        v23 = 0;
        for (i = 0; i < numBatches; ++i)
        {
          *(float *)(*(_QWORD *)((char *)self->_noiseData.__begin_ + v23) + 4 * v21) = (float)-[NoiseSampler drawNoise](self->_sampler, "drawNoise");
          numBatches = self->_numBatches;
          v23 += 24;
        }
        noiseSize = self->_noiseSize;
      }
      ++v21;
    }
    while (v21 < noiseSize);
  }

}

- (unint64_t)numberOfDataPoints
{
  return self->_numBatches;
}

- (void)setNumBatches:(int)a3
{
  self->_numBatches = a3;
}

- (void).cxx_destruct
{
  vector<std::vector<float>, std::allocator<std::vector<float>>> *p_noiseData;

  objc_storeStrong((id *)&self->_noiseKey, 0);
  objc_storeStrong((id *)&self->_maskKey, 0);
  objc_storeStrong((id *)&self->_targetKey, 0);
  objc_storeStrong((id *)&self->_contextKey, 0);
  objc_storeStrong((id *)&self->_sampler, 0);
  p_noiseData = &self->_noiseData;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_noiseData);
  p_noiseData = &self->_maskData;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_noiseData);
  p_noiseData = &self->_targetData;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_noiseData);
  p_noiseData = &self->_contextData;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_noiseData);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
