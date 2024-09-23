@implementation MRLNeuralNetworkWrapper

- (BOOL)load:(id)a3
{
  void *v4;
  void *v5;
  MontrealNeuralNetwork *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BE68F98];
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (MontrealNeuralNetwork *)MRLNeuralNetworkCreate();
  self->model = v6;
  if (!v6)
  {
    NSLog(CFSTR("Montreal model failed to load from '%@': %@"), v4, 0);

  }
  return v6 != 0;
}

- (id)lstmPredictions:(id)a3 embeddingDimension:(unint64_t)a4 classSize:(unint64_t)a5 seqLen:(unint64_t)a6
{
  id v10;
  void *v11;
  char *v12;
  unint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  const void *v21;
  int *Output;
  void *v23;
  id v24;
  double v25;
  unint64_t i;
  int v27;
  void *v28;
  _QWORD v30[2];
  void *v31;
  _QWORD v32[3];
  _QWORD v33[4];

  v33[3] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = v10;
  if (self->model)
  {
    v30[1] = v30;
    v12 = (char *)v30 - ((4 * objc_msgSend(v10, "count") + 15) & 0xFFFFFFFFFFFFFFF0);
    if (objc_msgSend(v11, "count"))
    {
      v13 = 0;
      do
      {
        objc_msgSend(v11, "objectAtIndexedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "floatValue");
        *(_DWORD *)&v12[4 * v13] = v15;

        ++v13;
      }
      while (v13 < objc_msgSend(v11, "count"));
    }
    v16 = *MEMORY[0x24BE68FC0];
    v33[0] = &unk_24F10FE00;
    v17 = *MEMORY[0x24BE68FB0];
    v32[0] = v16;
    v32[1] = v17;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v18;
    v32[2] = *MEMORY[0x24BE68FB8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (const void *)MRLNeuralNetworkTensorCreate();
    MRLNeuralNetworkTensorAppendData();
    v31 = 0;
    MRLNeuralNetworkSetInputTensor();
    MRLNeuralNetworkPredict();
    Output = (int *)MRLNeuralNetworkGetOutput();
    CFRelease(v21);
    v23 = v31;
    if (v31)
    {
      NSLog(CFSTR("Montreal inference error: %@"), v31);

    }
    if (Output)
    {
      v24 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      for (i = a6 * a5; i; --i)
      {
        v27 = *Output++;
        LODWORD(v25) = v27;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v25);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addObject:", v28);

      }
      MRLNeuralNetworkClear();
    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    NSLog(CFSTR("Montreal model missing."));
    v24 = 0;
  }

  return v24;
}

@end
