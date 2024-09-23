@implementation VCPCNNConvBlockVector

+ (BOOL)isFilterSizeSupported:(int)a3
{
  return (a3 - 1) < 5;
}

- (VCPCNNConvBlockVector)initWithParameters:(int)a3 filterNum:(int)a4 chunk:(int)a5 reLU:(BOOL)a6 padding:(BOOL)a7 groups:(int)a8 stride:(int)a9 batchNorm:(BOOL)a10
{
  uint64_t v10;
  _BOOL8 v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  VCPCNNConvBlockVector *v16;
  VCPCNNConvBlockVector *v17;
  uint64_t v19;
  objc_super v20;

  v10 = *(_QWORD *)&a8;
  v11 = a7;
  v12 = a6;
  v13 = *(_QWORD *)&a5;
  v14 = *(_QWORD *)&a4;
  v15 = *(_QWORD *)&a3;
  v16 = self;
  if (+[VCPCNNConvBlockVector isFilterSizeSupported:](VCPCNNConvBlockVector, "isFilterSizeSupported:", *(unsigned int *)(&self->super.super._executedOnGPU + 3))&& (v16->super._filterSize & 3) == 0)
  {
    v20.receiver = v16;
    v20.super_class = (Class)VCPCNNConvBlockVector;
    BYTE4(v19) = a10;
    LODWORD(v19) = a9;
    v16 = -[VCPCNNConvBlock initWithParameters:filterNum:chunk:reLU:padding:groups:stride:batchNorm:](&v20, sel_initWithParameters_filterNum_chunk_reLU_padding_groups_stride_batchNorm_, v15, v14, v13, v12, v11, v10, v19);
    v17 = v16;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (int)readFromDisk:(__sFILE *)a3 quantFactor:(signed __int16)a4
{
  uint64_t v4;
  NSMutableArray **p_inputSize;
  id WeakRetained;
  uint64_t v9;
  id v10;
  void *v11;
  int v12;
  VCPCNNData *filter;
  int result;
  VCPCNNData *bias;
  __sFILE *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  uint64_t v30;
  int v31;
  size_t v32;
  float *v33;
  float *v34;
  unint64_t v35;
  float *v36;
  int v37;
  uint64_t chunk;
  float *v39;
  int i;
  uint64_t v41;
  uint64_t v42;
  float v43;
  __sFILE *__stream;

  v4 = a4;
  p_inputSize = &self->super.super._inputSize;
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._inputSize);
  v9 = objc_msgSend(WeakRetained, "count");

  if (!v9)
    return -50;
  v10 = objc_loadWeakRetained((id *)p_inputSize);
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "intValue") & 3;

  filter = self->super._filter;
  if (v12)
  {
    result = -[VCPCNNData readFromDisk:quantFactor:](filter, "readFromDisk:quantFactor:", a3, v4);
    if (result)
      return result;
    bias = self->super._bias;
    v16 = a3;
    goto LABEL_30;
  }
  -[VCPCNNData size](filter, "size");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18 != 4)
    return -50;
  -[VCPCNNData size](self->super._filter, "size");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  __stream = a3;
  v21 = objc_msgSend(v20, "intValue");

  -[VCPCNNData size](self->super._filter, "size");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectAtIndexedSubscript:", 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "intValue");

  -[VCPCNNData size](self->super._filter, "size");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectAtIndexedSubscript:", 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "intValue");
  -[VCPCNNData size](self->super._filter, "size");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectAtIndexedSubscript:", 3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "intValue") * v27;

  v31 = v24 * v21 * v30;
  if (v31 < 0)
    v32 = -1;
  else
    v32 = 4 * v31;
  v33 = (float *)operator new[](v32, MEMORY[0x1E0DE4E10]);
  if (!v33)
    return -108;
  v34 = v33;
  if ((int)v4 >= 2)
  {
    if (fread(v33, 2uLL, v31, __stream))
    {
      if (v31 >= 1)
      {
        v35 = (v24 * v21 * v30) + 1;
        do
        {
          v34[(v35 - 2)] = (float)*((__int16 *)v34 + (v35 - 2)) / (float)(int)v4;
          --v35;
        }
        while (v35 > 1);
      }
      goto LABEL_20;
    }
    return -19;
  }
  if (!fread(v33, 4uLL, v31, __stream))
    return -19;
LABEL_20:
  v36 = -[VCPCNNData data](self->super._filter, "data");
  if (v21 >= 1)
  {
    v37 = 0;
    chunk = self->super._chunk;
    v39 = v34;
    do
    {
      if (v24 >= 1)
      {
        for (i = 0; i != v24; ++i)
        {
          if ((int)v30 >= 1)
          {
            v41 = (i % (int)chunk) + i / (int)chunk * (int)chunk * (uint64_t)(int)v30;
            v42 = v30;
            do
            {
              v43 = *v39++;
              v36[v41] = v43;
              v41 += chunk;
              --v42;
            }
            while (v42);
          }
        }
      }
      ++v37;
      v36 += (int)v30 * v24;
    }
    while (v37 != v21);
  }
  MEMORY[0x1BCCA128C](v34, 0x1000C8052888210);
  bias = self->super._bias;
  v16 = __stream;
LABEL_30:
  result = -[VCPCNNData readFromDisk:quantFactor:](bias, "readFromDisk:quantFactor:", v16, v4);
  if (!result)
    return 0;
  return result;
}

- (int)straightForwardForChunkFour
{
  NSMutableArray **p_inputSize;
  id WeakRetained;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  float v20;
  float v21;
  int v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  id v28;
  float v29;
  float *v30;
  uint64_t v31;
  int chunk;
  int padSize;
  int v36;
  int v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  int v41;
  int v42;
  int v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  int v50;

  p_inputSize = &self->super.super._inputSize;
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._inputSize);
  objc_msgSend(WeakRetained, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  v7 = objc_loadWeakRetained((id *)p_inputSize);
  objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v8, "intValue");

  -[NSMutableArray objectAtIndexedSubscript:](self->super.super._outputSize, "objectAtIndexedSubscript:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "intValue");

  -[NSMutableArray objectAtIndexedSubscript:](self->super.super._outputSize, "objectAtIndexedSubscript:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v11, "intValue");

  v12 = objc_loadWeakRetained((id *)p_inputSize);
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v13, "intValue");

  -[NSMutableArray objectAtIndexedSubscript:](self->super.super._outputSize, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "intValue");

  if (self->super._chunk != 4)
    return -50;
  if (v15 >= 1)
  {
    v39 = 0;
    v44 = 0;
    v36 = 4 * v41 * v10;
    v16 = *(unsigned int *)(&self->super.super._executedOnGPU + 3);
    v47 = (v6 * v42);
    v17 = v16;
    v37 = v6;
    do
    {
      if ((int)v17 <= v6)
      {
        v38 = 0;
        v43 = 0;
        v40 = ((int)v44 % self->super._chunk) + v36 * (uint64_t)((int)v44 / self->super._chunk);
        do
        {
          if ((int)v17 <= v42)
          {
            v19 = 0;
            v46 = v38;
            v16 = v17;
            do
            {
              v45 = v19;
              v20 = 0.0;
              v21 = 0.0;
              if (v48 >= 1)
              {
                v22 = 0;
                v23 = v46;
                v24 = v39;
                v25 = v16;
                do
                {
                  v50 = v22;
                  v49 = v23;
                  if ((int)v25 < 1)
                  {
                    v31 = v25;
                  }
                  else
                  {
                    v26 = 0;
                    do
                    {
                      if ((int)v25 >= 1)
                      {
                        v27 = 0;
                        do
                        {
                          v28 = objc_loadWeakRetained((id *)&self->super.super._input);
                          v29 = *(float *)(objc_msgSend(v28, "data") + 4 * ((int)v23 + (int)v27));

                          v30 = -[VCPCNNData data](self->super._filter, "data");
                          v16 = *(int *)(&self->super.super._executedOnGPU + 3);
                          v21 = v21 + (float)(v29 * v30[v27 + (int)v16 * (v26 + v24 * (int)v16)]);
                          ++v27;
                        }
                        while (v27 < v16);
                      }
                      ++v26;
                      LODWORD(v23) = v23 + v42;
                      LODWORD(v25) = v16;
                      v31 = v16;
                    }
                    while (v26 < (int)v16);
                  }
                  v22 = v50 + 1;
                  ++v24;
                  v23 = v49 + v47;
                  v25 = v31;
                }
                while (v50 + 1 != v48);
              }
              chunk = self->super._chunk;
              padSize = self->super._padSize;
              if ((float)(v21 + -[VCPCNNData data](self->super._bias, "data")[4 * v44]) > 0.0)
                v20 = v21 + -[VCPCNNData data](self->super._bias, "data")[4 * v44];
              -[VCPCNNData data](self->super.super._output, "data")[4
                                                                  * (v40
                                                                   + chunk
                                                                   * (uint64_t)(padSize + v45 + (padSize + v43) * v41))] = v20;
              v16 = *(unsigned int *)(&self->super.super._executedOnGPU + 3);
              ++v46;
              v19 = v45 + 1;
            }
            while (v45 < v42 - (int)v16);
          }
          v6 = v37;
          v38 += v42;
          v17 = v16;
          v18 = v16;
        }
        while (v43++ < v37 - (int)v16);
      }
      else
      {
        v18 = v17;
      }
      v39 += v48;
      v17 = v18;
      ++v44;
    }
    while (v44 != v15);
  }
  return 0;
}

- (int)chunkFourForward
{
  NSMutableArray **p_inputSize;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  int result;
  int v16;
  unsigned int v17;
  unsigned int v18;
  uint64_t v19;
  float *v20;
  float *v21;
  uint64_t v22;
  float *v23;
  uint64_t v24;
  int padSize;
  int v26;
  int v27;
  int v28;
  uint64_t chunk;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  int v34;
  float *v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  id v39;
  uint64_t v40;
  float *v41;
  int v42;
  int v43;
  uint64_t v44;
  int v45;
  float *v46;
  int v47;
  float *v48;
  int v49;
  float *v50;
  uint64_t v51;
  float v52;
  uint64_t v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  int v59;
  float *v60;
  unsigned int v61;
  uint64_t v62;
  int v63;
  uint64_t v64;
  int v65;
  int v66;
  int v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  float *v73;
  int v74;
  int v75;

  p_inputSize = &self->super.super._inputSize;
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._inputSize);
  objc_msgSend(WeakRetained, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v5, "intValue");

  v6 = objc_loadWeakRetained((id *)p_inputSize);
  objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = objc_msgSend(v7, "intValue");

  -[NSMutableArray objectAtIndexedSubscript:](self->super.super._outputSize, "objectAtIndexedSubscript:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v8, "intValue");

  -[NSMutableArray objectAtIndexedSubscript:](self->super.super._outputSize, "objectAtIndexedSubscript:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v9, "intValue");

  v10 = objc_loadWeakRetained((id *)p_inputSize);
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "intValue");

  -[NSMutableArray objectAtIndexedSubscript:](self->super.super._outputSize, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "intValue");

  result = -50;
  v16 = v72;
  if (self->super._chunk == 4 && (v12 & 3) == 0 && (v14 & 3) == 0)
  {
    v17 = *(_DWORD *)(&self->super.super._executedOnGPU + 3);
    if ((objc_msgSend((id)objc_opt_class(), "isFilterSizeSupported:", v17) & 1) != 0
      && (v18 = *(_DWORD *)(&self->super.super._executedOnGPU + 3) - 1, v18 <= 4)
      && ((0x17u >> v18) & 1) != 0)
    {
      v61 = v17;
      v63 = v12;
      v55 = v65 * v67;
      v57 = 4 * v65 * v67;
      self->CalculateDotProductOfChunk = off_1E6B16F00[v18];
      v19 = 4 * v65;
      v20 = -[VCPCNNData data](self->super._bias, "data");
      v58 = v14;
      if (v14 / self->super._chunk >= 1)
      {
        v21 = v20;
        v22 = 0;
        do
        {
          v23 = -[VCPCNNData data](self->super.super._output, "data");
          v24 = 92;
          padSize = self->super._padSize;
          if (self->super._padding)
          {
            v26 = (*(_DWORD *)(&self->super.super._executedOnGPU + 3) + ~padSize) & ~((*(_DWORD *)(&self->super.super._executedOnGPU
                                                                                                 + 3)
                                                                                     + ~padSize) >> 31);
            v27 = v67 - v26;
            v28 = v65 - v26;
          }
          else
          {
            v28 = v65;
            v27 = v67;
          }
          chunk = self->super._chunk;
          v69 = v22;
          if (padSize >= v27)
          {
            LODWORD(v36) = self->super._chunk;
          }
          else
          {
            v73 = &v23[v22 * v57];
            v30 = padSize;
            v31 = v27;
            do
            {
              v32 = v24;
              v33 = *(_DWORD *)((char *)&self->super.super.super.isa + v24);
              v34 = v28 - v33;
              if (v28 <= v33)
              {
                v36 = chunk;
              }
              else
              {
                v35 = &v73[v30 * v19 + (int)chunk * v33];
                do
                {
                  memcpy(v35, v21, 4 * (int)chunk);
                  v36 = self->super._chunk;
                  v35 += v36;
                  LODWORD(chunk) = self->super._chunk;
                  --v34;
                }
                while (v34);
              }
              ++v30;
              chunk = v36;
              v24 = v32;
            }
            while (v30 != v31);
          }
          v21 += (int)v36;
          v22 = v69 + 1;
          v14 = v58;
        }
        while (v69 + 1 < v58 / (int)v36);
      }
      v60 = -[VCPCNNData data](self->super._filter, "data");
      if (v14 >= 1)
      {
        v59 = 0;
        v37 = 4 * v75;
        v66 = v63 / 4;
        v56 = (int)(v61 * v61 * v63);
        v64 = (int)(4 * v61 * v61);
        v71 = v19;
        do
        {
          v38 = self->super._chunk;
          v39 = objc_loadWeakRetained((id *)&self->super.super._input);
          v40 = objc_msgSend(v39, "data");

          v41 = -[VCPCNNData data](self->super.super._output, "data");
          v42 = v75;
          if (v66 >= 1)
          {
            v43 = 0;
            v62 = (uint64_t)&v41[(int)v57 * (uint64_t)(v59 / v38)
                              + self->super._padSize * (uint64_t)(int)v19
                              + (v59 % v38)];
            LODWORD(v44) = self->super._chunk;
            v45 = *(_DWORD *)(&self->super.super._executedOnGPU + 3);
            v46 = v60;
            do
            {
              v68 = v43;
              v70 = v40;
              if (v45 <= v16)
              {
                v47 = 0;
                v48 = (float *)(v62 + 4 * self->super._padSize * (int)v44);
                do
                {
                  if (v45 <= v42)
                  {
                    v74 = v47;
                    v49 = -1;
                    v50 = v48;
                    v51 = v40;
                    do
                    {
                      v52 = ((float (*)(uint64_t, uint64_t, float *))self->CalculateDotProductOfChunk)(v51, v37, v46);
                      v42 = v75;
                      *v50 = v52 + *v50;
                      v44 = self->super._chunk;
                      v51 += 4 * v44;
                      v50 += v44;
                      v45 = *(_DWORD *)(&self->super.super._executedOnGPU + 3);
                      ++v49;
                    }
                    while (v49 < v75 - v45);
                    v16 = v72;
                    v47 = v74;
                    v19 = v71;
                  }
                  v40 += 4 * v37;
                  v48 += v19;
                }
                while (v47++ < v16 - v45);
              }
              v46 += v64;
              v40 = v70 + 16 * v75 * v72;
              v43 = v68 + 1;
            }
            while (v68 + 1 != v66);
          }
          v60 += v56;
          v14 = v58;
          ++v59;
        }
        while (v59 != v58);
      }
      if (self->super._reLU && v55 * v14 >= 1)
      {
        v54 = 0;
        do
        {
          if (-[VCPCNNData data](self->super.super._output, "data")[v54] < 0.0)
            -[VCPCNNData data](self->super.super._output, "data")[v54] = 0.0;
          result = 0;
          v54 += 4;
        }
        while (4 * (v55 * v14) != v54);
      }
      else
      {
        return 0;
      }
    }
    else
    {
      return -50;
    }
  }
  return result;
}

- (int)forward
{
  NSMutableArray **p_inputSize;
  id WeakRetained;
  uint64_t v5;
  id v6;
  void *v7;
  int v8;
  int result;
  id v10;
  void *v11;
  void *v12;
  int v13;

  p_inputSize = &self->super.super._inputSize;
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._inputSize);
  v5 = objc_msgSend(WeakRetained, "count");

  if (!v5)
    return -50;
  if (self->super._chunk == 4)
  {
    v6 = objc_loadWeakRetained((id *)p_inputSize);
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "intValue") & 3;

    if (v8)
    {
      result = -[VCPCNNConvBlockVector straightForwardForChunkFour](self, "straightForwardForChunkFour");
      if (result)
        return result;
      return 0;
    }
  }
  v10 = objc_loadWeakRetained((id *)p_inputSize);
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "intValue") & 3) != 0)
    goto LABEL_13;
  -[NSMutableArray objectAtIndexedSubscript:](self->super.super._outputSize, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "intValue") & 3) != 0 || self->super._chunk != 4)
  {

LABEL_13:
    return -50;
  }
  v13 = objc_msgSend((id)objc_opt_class(), "isFilterSizeSupported:", *(unsigned int *)(&self->super.super._executedOnGPU + 3));

  if (!v13)
    return -50;
  result = -[VCPCNNConvBlockVector chunkFourForward](self, "chunkFourForward");
  if (!result)
    return 0;
  return result;
}

@end
