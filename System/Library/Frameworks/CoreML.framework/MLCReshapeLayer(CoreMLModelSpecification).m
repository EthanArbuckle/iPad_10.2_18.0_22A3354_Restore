@implementation MLCReshapeLayer(CoreMLModelSpecification)

+ (id)flattenLayerWithTensor:()CoreMLModelSpecification flattenParams:batchSize:error:
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = v9;
  if (*(_DWORD *)(a4 + 16) == 1)
  {
    if (a6)
    {
      +[MLModelErrorUtils errorWithCode:format:](MLModelErrorUtils, "errorWithCode:format:", 6, CFSTR("CHANNEL_LAST mode for flatten layer not supported"));
      v11 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    objc_msgSend(v9, "descriptor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shape");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "objectAtIndexedSubscript:", 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "unsignedIntegerValue");
    objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "unsignedIntegerValue");
    objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "unsignedIntegerValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v20;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17 * v15 * v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v21;
    v24[2] = &unk_1E3DA24E8;
    v24[3] = &unk_1E3DA24E8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    +[MLNeuralNetworkMLComputeLayer reshapeLayerWithChannelFirstOrderingAndTargetShape:](MLNeuralNetworkMLComputeLayer, "reshapeLayerWithChannelFirstOrderingAndTargetShape:", v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

+ (id)reshapeLayer:()CoreMLModelSpecification batchSize:error:
{
  int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  _QWORD v19[4];
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  if (*(_DWORD *)(a3 + 36) != 1)
  {
    v9 = *(_DWORD *)(a3 + 16);
    v10 = objc_alloc_init(MEMORY[0x1E0C99D20]);
    if (v9 == 3)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v11;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(a3 + 24) + 8));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18[1] = v12;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(a3 + 24) + 16));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18[2] = v13;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(a3 + 24) + 24));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18[3] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v9 != 4)
      {
        if (a5)
        {
          +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Target shape size is not valid. It must be either 3 or 4."));
          v16 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = 0;
        }
        goto LABEL_15;
      }
      if (*(_QWORD *)(*(_QWORD *)(a3 + 24) + 8) == 1)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = v11;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(a3 + 24) + 16));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v19[1] = v12;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(a3 + 24) + 24));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v19[2] = v13;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(a3 + 24) + 32));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v19[3] = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
        v15 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = v11;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(a3 + 24) + 24));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v20[1] = v12;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(a3 + 24) + 16));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v20[2] = v13;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(a3 + 24) + 8));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v20[3] = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 4);
        v15 = objc_claimAutoreleasedReturnValue();
      }
    }
    v17 = (void *)v15;

    +[MLNeuralNetworkMLComputeLayer reshapeLayerWithChannelFirstOrderingAndTargetShape:](MLNeuralNetworkMLComputeLayer, "reshapeLayerWithChannelFirstOrderingAndTargetShape:", v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v17;
LABEL_15:

    return v16;
  }
  if (a5)
  {
    +[MLModelErrorUtils errorWithCode:format:](MLModelErrorUtils, "errorWithCode:format:", 6, CFSTR("CHANNEL_LAST mode for reshape layer not supported"));
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

+ (id)reshapeStaticLayer:()CoreMLModelSpecification batchSize:error:
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v6 = *(unsigned int *)(a3 + 16);
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

  if ((int)v6 >= 1)
  {
    v9 = 0;
    do
    {
      if ((_DWORD)v6 != 4 || v9)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(a3 + 24) + v9 + 8));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v10);

      }
      v9 += 8;
    }
    while (8 * v6 != v9);
  }
  +[MLNeuralNetworkMLComputeLayer reshapeLayerWithChannelFirstOrderingAndTargetShape:](MLNeuralNetworkMLComputeLayer, "reshapeLayerWithChannelFirstOrderingAndTargetShape:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
