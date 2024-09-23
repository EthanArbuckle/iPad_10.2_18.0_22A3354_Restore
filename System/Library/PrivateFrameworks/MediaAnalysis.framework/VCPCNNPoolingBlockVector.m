@implementation VCPCNNPoolingBlockVector

- (int)forward
{
  id WeakRetained;
  void *v4;
  int v5;
  id v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  int v11;
  int px;
  int v13;
  id v14;
  uint64_t v15;
  float *v16;
  uint64_t py;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  float32x4_t *v23;
  int v24;
  float32x4_t *v25;

  if (self->super._py != 4 || *(_DWORD *)(&self->super.super._executedOnGPU + 3) != 2 || self->super._px != 2)
    return -50;
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._inputSize);
  objc_msgSend(WeakRetained, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");

  v6 = objc_loadWeakRetained((id *)&self->super.super._inputSize);
  objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");

  v9 = objc_loadWeakRetained((id *)&self->super.super._inputSize);
  objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "intValue");

  px = self->super._px;
  v13 = *(_DWORD *)(&self->super.super._executedOnGPU + 3);
  v14 = objc_loadWeakRetained((id *)&self->super.super._input);
  v15 = objc_msgSend(v14, "data");

  v16 = -[VCPCNNData data](self->super.super._output, "data");
  LODWORD(py) = self->super._py;
  if (v5 / (int)py >= 1)
  {
    v18 = 0;
    v19 = v8 / px;
    v20 = v11 * v8 * (int)py;
    v21 = (int)py * v11;
    do
    {
      if (v19 >= 1)
      {
        v22 = 0;
        v23 = (float32x4_t *)v15;
        do
        {
          v24 = v11 / v13;
          v25 = v23;
          if (v11 / v13 >= 1)
          {
            do
            {
              *(float32x4_t *)v16 = vmaxq_f32(vmaxq_f32(*v25, *(float32x4_t *)((char *)v25 + 4 * v21)), vmaxq_f32(v25[1], *(float32x4_t *)((char *)v25 + 4 * v21 + 16)));
              py = self->super._py;
              v25 = (float32x4_t *)((char *)v25 + 8 * (int)py);
              v16 += py;
              --v24;
            }
            while (v24);
          }
          v23 = (float32x4_t *)((char *)v23 + 8 * v21);
          ++v22;
        }
        while (v22 != v19);
      }
      v15 += 4 * v20;
      ++v18;
    }
    while (v18 < v5 / (int)py);
  }
  return 0;
}

@end
