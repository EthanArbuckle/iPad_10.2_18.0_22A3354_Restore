@implementation VCPCNNPoolingBlockScalar

- (int)forward
{
  NSMutableArray **p_inputSize;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  int i;
  uint64_t j;
  int px;
  float v14;
  int v15;
  int v16;
  int v17;
  int k;
  id v19;
  uint64_t v20;
  int v21;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  uint64_t v28;
  int v29;

  p_inputSize = &self->super.super._inputSize;
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._inputSize);
  objc_msgSend(WeakRetained, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v5, "intValue");

  v6 = objc_loadWeakRetained((id *)p_inputSize);
  objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v7, "intValue");

  v8 = objc_loadWeakRetained((id *)p_inputSize);
  objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "intValue");

  if (v24 >= 1)
  {
    v27 = 0;
    v25 = 0;
    v26 = v23 / self->super._px;
    v28 = (v10 / *(_DWORD *)(&self->super.super._executedOnGPU + 3));
    do
    {
      if (v26 >= 1)
      {
        for (i = 0; i != v26; ++i)
        {
          if ((int)v28 >= 1)
          {
            for (j = 0; j != v28; ++j)
            {
              px = self->super._px;
              v14 = -1.0e10;
              if (px >= 1)
              {
                v15 = 0;
                v16 = *(_DWORD *)(&self->super.super._executedOnGPU + 3);
                v17 = v27;
                v14 = -1.0e10;
                do
                {
                  if (v16 >= 1)
                  {
                    v29 = v15;
                    for (k = 0; k < v16; ++k)
                    {
                      v19 = objc_loadWeakRetained((id *)&self->super.super._input);
                      v20 = objc_msgSend(v19, "data");
                      v21 = k
                          + v10 * (v17 + i * self->super._px)
                          + j * *(_DWORD *)(&self->super.super._executedOnGPU + 3);
                      if (v14 < *(float *)(v20 + 4 * v21))
                        v14 = *(float *)(v20 + 4 * v21);

                      v16 = *(_DWORD *)(&self->super.super._executedOnGPU + 3);
                    }
                    px = self->super._px;
                    v15 = v29;
                  }
                  ++v15;
                  ++v17;
                }
                while (v15 < px);
              }
              -[VCPCNNData data](self->super.super._output, "data")[4 * ((i + v25 * v26) * (int)v28 + (int)j)] = v14;
            }
          }
        }
      }
      v27 += v23;
      ++v25;
    }
    while (v25 != v24);
  }
  return 0;
}

@end
