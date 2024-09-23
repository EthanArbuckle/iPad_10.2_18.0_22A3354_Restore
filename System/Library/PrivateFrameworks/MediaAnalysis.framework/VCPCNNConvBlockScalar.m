@implementation VCPCNNConvBlockScalar

- (int)readFromDisk:(__sFILE *)a3 quantFactor:(signed __int16)a4
{
  uint64_t v4;
  int result;

  v4 = a4;
  result = -[VCPCNNData readFromDisk:quantFactor:](self->super._filter, "readFromDisk:quantFactor:");
  if (!result)
    return -[VCPCNNData readFromDisk:quantFactor:](self->super._bias, "readFromDisk:quantFactor:", a3, v4);
  return result;
}

- (int)forward
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
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  float v18;
  float v19;
  int v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  id v26;
  float v27;
  float *v28;
  uint64_t v29;
  int v32;
  int v33;
  int v34;
  uint64_t v35;
  int v36;
  int v37;
  int v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  int v44;

  p_inputSize = &self->super.super._inputSize;
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._inputSize);
  objc_msgSend(WeakRetained, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v5, "intValue");

  v6 = objc_loadWeakRetained((id *)p_inputSize);
  objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v7, "intValue");

  -[NSMutableArray objectAtIndexedSubscript:](self->super.super._outputSize, "objectAtIndexedSubscript:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v8, "intValue");

  -[NSMutableArray objectAtIndexedSubscript:](self->super.super._outputSize, "objectAtIndexedSubscript:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v9, "intValue");

  v10 = objc_loadWeakRetained((id *)p_inputSize);
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v11, "intValue");

  -[NSMutableArray objectAtIndexedSubscript:](self->super.super._outputSize, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "intValue");

  if (v13 >= 1)
  {
    v36 = 0;
    v39 = 0;
    v14 = *(unsigned int *)(&self->super.super._executedOnGPU + 3);
    v15 = v14;
    do
    {
      if ((int)v15 <= v33)
      {
        v35 = 0;
        v34 = 0;
        do
        {
          if ((int)v15 <= v38)
          {
            v17 = 0;
            v41 = v35;
            v14 = v15;
            do
            {
              v40 = v17;
              v18 = 0.0;
              v19 = 0.0;
              if (v42 >= 1)
              {
                v20 = 0;
                v21 = v41;
                v22 = v36;
                v23 = v14;
                do
                {
                  v44 = v20;
                  v43 = v21;
                  if ((int)v23 < 1)
                  {
                    v29 = v23;
                  }
                  else
                  {
                    v24 = 0;
                    do
                    {
                      if ((int)v23 >= 1)
                      {
                        v25 = 0;
                        do
                        {
                          v26 = objc_loadWeakRetained((id *)&self->super.super._input);
                          v27 = *(float *)(objc_msgSend(v26, "data") + 4 * ((int)v21 + (int)v25));

                          v28 = -[VCPCNNData data](self->super._filter, "data");
                          v14 = *(int *)(&self->super.super._executedOnGPU + 3);
                          v19 = v19 + (float)(v27 * v28[v25 + (int)v14 * (v24 + v22 * (int)v14)]);
                          ++v25;
                        }
                        while (v25 < v14);
                      }
                      ++v24;
                      LODWORD(v21) = v21 + v38;
                      LODWORD(v23) = v14;
                      v29 = v14;
                    }
                    while (v24 < (int)v14);
                  }
                  v20 = v44 + 1;
                  ++v22;
                  v21 = v43 + (v33 * v38);
                  v23 = v29;
                }
                while (v44 + 1 != v42);
              }
              if ((float)(v19 + -[VCPCNNData data](self->super._bias, "data")[4 * v39]) > 0.0)
                v18 = v19 + -[VCPCNNData data](self->super._bias, "data")[4 * v39];
              -[VCPCNNData data](self->super.super._output, "data")[4
                                                                  * (self->super._padSize
                                                                   + v40
                                                                   + (v34 + v32 * (int)v39 + self->super._padSize) * v37)] = v18;
              v14 = *(unsigned int *)(&self->super.super._executedOnGPU + 3);
              ++v41;
              v17 = v40 + 1;
            }
            while (v40 < v38 - (int)v14);
          }
          v35 += v38;
          v15 = v14;
          v16 = v14;
        }
        while (v34++ < v33 - (int)v14);
      }
      else
      {
        v16 = v15;
      }
      v36 += v42;
      v15 = v16;
      ++v39;
    }
    while (v39 != v13);
  }
  return 0;
}

@end
