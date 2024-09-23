@implementation MLCLayer

- (MLCLayer)initWithLabel:(id)a3
{
  id v5;
  MLCLayer *v6;
  MLCLayer *v7;
  int64x2_t v8;
  void *v9;
  uint64_t v10;
  NSMutableArray *sourceTensors;
  uint64_t v12;
  NSMutableArray *resultTensors;
  uint64_t v14;
  NSMutableArray *sourceGradientTensors;
  uint64_t v16;
  NSMutableArray *resultGradientTensors;
  uint64_t v18;
  NSMutableArray *fusedLayers;
  MLCLayer *intermediateSumLayer;
  uint64_t v21;
  NSMutableArray *intermediateGradientTensors;
  MLCDevice *device;
  uint64_t v24;
  NSArray *deviceOps;
  MLCControlTreeNode *conditionalTreeNode;
  objc_super v28;

  v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)MLCLayer;
  v6 = -[MLCLayer init](&v28, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_label, a3);
    objc_storeStrong((id *)&v7->_originalLabel, a3);
    v8 = vdupq_n_s64(1uLL);
    *(int64x2_t *)&v7->_kernelWidth = v8;
    *(int64x2_t *)&v7->_dilationRateInX = v8;
    *(int64x2_t *)&v7->_strideInX = v8;
    v7->_paddingPolicy = 0;
    v7->_paddingSizeInX = 0;
    v7->_paddingSizeInY = 0;
    v9 = (void *)MEMORY[0x1E0C9AA60];
    v10 = objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    sourceTensors = v7->_sourceTensors;
    v7->_sourceTensors = (NSMutableArray *)v10;

    v12 = objc_msgSend(v9, "mutableCopy");
    resultTensors = v7->_resultTensors;
    v7->_resultTensors = (NSMutableArray *)v12;

    v14 = objc_msgSend(v9, "mutableCopy");
    sourceGradientTensors = v7->_sourceGradientTensors;
    v7->_sourceGradientTensors = (NSMutableArray *)v14;

    v16 = objc_msgSend(v9, "mutableCopy");
    resultGradientTensors = v7->_resultGradientTensors;
    v7->_resultGradientTensors = (NSMutableArray *)v16;

    v18 = objc_msgSend(v9, "mutableCopy");
    fusedLayers = v7->_fusedLayers;
    v7->_fusedLayers = (NSMutableArray *)v18;

    intermediateSumLayer = v7->_intermediateSumLayer;
    v7->_intermediateSumLayer = 0;

    v21 = objc_msgSend(v9, "mutableCopy");
    intermediateGradientTensors = v7->_intermediateGradientTensors;
    v7->_intermediateGradientTensors = (NSMutableArray *)v21;

    v7->_intermediateGradientTensorIndex = 0;
    v7->_zeroIntermediateGradientTensors = 0;
    device = v7->_device;
    v7->_device = 0;

    v24 = objc_msgSend(v9, "mutableCopy");
    deviceOps = v7->_deviceOps;
    v7->_deviceOps = (NSArray *)v24;

    *(_WORD *)&v7->_isDebuggingEnabled = 0;
    v7->_allocateGradientTensors = 1;
    v7->_compileForInferenceOnly = 0;
    *(_DWORD *)&v7->_isLastFusedLayer = 0;
    conditionalTreeNode = v7->_conditionalTreeNode;
    v7->_conditionalTreeNode = 0;

  }
  return v7;
}

- (BOOL)isFirstLayer
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[MLCLayer sourceTensors](self, "sourceTensors");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "parentLayers", (_QWORD)v11);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "count");

        if (v8)
        {
          v9 = 0;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (BOOL)isLastLayer
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[MLCLayer resultTensors](self, "resultTensors");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "childLayers", (_QWORD)v11);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "count");

        if (v8)
        {
          v9 = 0;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (void)bindDevice:(id)a3 deviceOps:(id)a4
{
  id v6;

  v6 = a4;
  -[MLCLayer setDevice:](self, "setDevice:", a3);
  -[MLCLayer setDeviceOps:](self, "setDeviceOps:", v6);

}

- (void)assignLayerID:(unint64_t)a3
{
  uint64_t v5;
  id v6;

  -[MLCLayer setLayerID:](self, "setLayerID:");
  if (self->_label)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%lu"), self->_label, a3);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("layer-%lu"), a3, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MLCLayer setLabel:](self, "setLabel:", v6);

}

- (void)resetLayerID
{
  id v3;

  -[MLCLayer setLayerID:](self, "setLayerID:", 0);
  -[MLCLayer originalLabel](self, "originalLabel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MLCLayer setLabel:](self, "setLabel:", v3);

}

- (unint64_t)resultSizeFromSourceSize:(unint64_t)a3 dimension:(unint64_t)a4
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;

  if (a4 >= 2)
  {
    if (a4 == 3)
    {
      v6 = -[MLCLayer kernelWidth](self, "kernelWidth");
      v7 = -[MLCLayer dilationRateInX](self, "dilationRateInX");
      v8 = -[MLCLayer strideInX](self, "strideInX");
      v9 = -[MLCLayer paddingSizeInX](self, "paddingSizeInX");
    }
    else
    {
      v6 = -[MLCLayer kernelHeight](self, "kernelHeight");
      v7 = -[MLCLayer dilationRateInY](self, "dilationRateInY");
      v8 = -[MLCLayer strideInY](self, "strideInY");
      v9 = -[MLCLayer paddingSizeInY](self, "paddingSizeInY");
    }
    v10 = v9;
    if (-[MLCLayer paddingPolicy](self, "paddingPolicy"))
    {
      if (-[MLCLayer paddingPolicy](self, "paddingPolicy") != 1)
        return vcvtms_u32_f32((float)((float)(~(v7 * (v6 - 1)) + a3 + 2 * v10) / (float)v8) + 1.0);
      if (!v8)
        return 0;
      v11 = v6 - 1;
      if (v8 == 1)
      {
        a3 -= v11 * v7;
        return a3;
      }
      v12 = v8 + ((a3 - v11 * v7) & ~((uint64_t)(a3 - v11 * v7) >> 63));
      return (v12 - 1) / v8;
    }
    if (!v8)
      return 0;
    if (v8 != 1)
    {
      v12 = a3 + v8;
      return (v12 - 1) / v8;
    }
  }
  return a3;
}

- (unint64_t)resultSizeFromSourceSizes:(id)a3 dimension:(unint64_t)a4
{
  void *v6;
  unint64_t v7;

  objc_msgSend(a3, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MLCLayer resultSizeFromSourceSize:dimension:](self, "resultSizeFromSourceSize:dimension:", objc_msgSend(v6, "unsignedIntegerValue"), a4);

  return v7;
}

- (id)resultTensorFromSources:(id)a3
{
  id v4;
  void *v5;
  unint64_t i;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v4 = a3;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  for (i = 0; ; ++i)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "descriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "shape");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (i >= v10)
      break;
    v11 = i;
    if (i == 2)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "descriptor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "shape");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      if (v15 == 3)
        v11 = 3;
      else
        v11 = 2;
    }
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "descriptor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "shape");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectAtIndexedSubscript:", i);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[MLCLayer resultSizeFromSourceSize:dimension:](self, "resultSizeFromSourceSize:dimension:", objc_msgSend(v19, "unsignedIntegerValue"), v11);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:atIndexedSubscript:", v21, i);

  }
  v22 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "descriptor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v22, objc_msgSend(v24, "dataType"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  +[MLCTensor tensorWithDescriptor:](MLCTensor, "tensorWithDescriptor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)resultTensorsFromBroadcastableSources:(id)a3 resultTensorDataType:(int)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  void *v41;
  unint64_t v42;
  void *v43;
  unint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  unint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  unint64_t v72;
  void *v73;
  unint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v84;
  unsigned int v85;
  unint64_t v86;
  unint64_t v87;
  void *v88;
  unint64_t v89;

  v5 = a3;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "shape");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = objc_msgSend(v9, "count");

  v85 = a4;
  if ((unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "descriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "shape");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13 > v89)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "descriptor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "shape");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = objc_msgSend(v16, "count");

    }
  }
  if (objc_msgSend(v5, "count") != 1)
  {
    v24 = (void *)MEMORY[0x1E0C9AA60];
    v25 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    v26 = (void *)objc_msgSend(v24, "mutableCopy");
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "descriptor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "shape");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "count");

    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "descriptor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "shape");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    v88 = v5;
    v84 = v6;
    if (v89 == v30)
    {
      v35 = objc_msgSend(v33, "copy");

      v25 = (void *)v35;
    }
    else
    {
      v36 = objc_msgSend(v33, "count");

      if (v89)
      {
        v37 = 0;
        v38 = v89 - v36;
        v86 = v36 - v89;
        v39 = 0x1E0CB3000uLL;
        do
        {
          if (v37 >= v38)
          {
            objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
            v41 = v26;
            v42 = v38;
            v43 = v25;
            v44 = v39;
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "descriptor");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "shape");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "objectAtIndexedSubscript:", v86 + v37);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v48, "unsignedIntegerValue");

            v5 = v88;
            v39 = v44;
            v25 = v43;
            v38 = v42;
            v26 = v41;
          }
          else
          {
            v40 = 1;
          }
          objc_msgSend(*(id *)(v39 + 2024), "numberWithUnsignedInteger:", v40);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:atIndexedSubscript:", v49, v37);

          ++v37;
        }
        while (v89 != v37);
      }
    }
    objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "descriptor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "shape");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "count");

    v5 = v88;
    objc_msgSend(v88, "objectAtIndexedSubscript:", 1);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "descriptor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "shape");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v56;
    if (v89 == v53)
    {
      v58 = objc_msgSend(v56, "copy");

      v26 = (void *)v58;
    }
    else
    {
      v59 = objc_msgSend(v56, "count");

      if (!v89)
        goto LABEL_32;
      v60 = 0;
      v61 = v89 - v59;
      v87 = v59 - v89;
      v62 = 0x1E0CB3000uLL;
      do
      {
        if (v60 >= v61)
        {
          objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "descriptor");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "shape");
          v66 = v62;
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "objectAtIndexedSubscript:", v87 + v60);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = objc_msgSend(v68, "unsignedIntegerValue");

          v62 = v66;
          v5 = v88;

        }
        else
        {
          v63 = 1;
        }
        objc_msgSend(*(id *)(v62 + 2024), "numberWithUnsignedInteger:", v63);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:atIndexedSubscript:", v69, v60);

        ++v60;
      }
      while (v89 != v60);
    }
    if (v89)
    {
      v70 = 0;
      v6 = v84;
      do
      {
        objc_msgSend(v25, "objectAtIndexedSubscript:", v70);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = objc_msgSend(v71, "unsignedIntegerValue");
        objc_msgSend(v26, "objectAtIndexedSubscript:", v70);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = objc_msgSend(v73, "unsignedIntegerValue");

        v75 = (void *)MEMORY[0x1E0CB37E8];
        if (v72 >= v74)
          v76 = v25;
        else
          v76 = v26;
        objc_msgSend(v76, "objectAtIndexedSubscript:", v70);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "numberWithUnsignedInteger:", objc_msgSend(v77, "unsignedIntegerValue"));
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "setObject:atIndexedSubscript:", v78, v70);

        ++v70;
      }
      while (v89 != v70);
      v5 = v88;
      goto LABEL_33;
    }
LABEL_32:
    v6 = v84;
LABEL_33:

    goto LABEL_34;
  }
  if (v89)
  {
    for (i = 0; i != v89; ++i)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "descriptor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "shape");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectAtIndexedSubscript:", i);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "unsignedIntegerValue");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:atIndexedSubscript:", v23, i);

    }
  }
LABEL_34:
  v79 = v5;
  v80 = (void *)objc_msgSend(v6, "copy");
  +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v80, v85);
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  +[MLCTensor tensorWithDescriptor:](MLCTensor, "tensorWithDescriptor:", v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  return v82;
}

- (unint64_t)allocatedDataSizeForTraining:(BOOL)a3 optimizer:(id)a4
{
  return 0;
}

- (BOOL)allocateDataForOptimizer:(id)a3
{
  return 0;
}

- (unint64_t)deviceMemorySizeWithOptimizer:(id)a3 device:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;

  v6 = a3;
  v7 = a4;
  if (-[MLCLayer skipLayer](self, "skipLayer"))
  {
    v8 = 0;
    v9 = 0;
LABEL_25:
    v42 = 0;
    goto LABEL_26;
  }
  -[MLCLayer resultTensors](self, "resultTensors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    v12 = 0;
    v8 = 0;
    do
    {
      -[MLCLayer resultTensors](self, "resultTensors");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sharedMemoryTensor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        objc_msgSend(v7, "computeEngine");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCLayer resultTensors](self, "resultTensors");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectAtIndexedSubscript:", v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v8 += objc_msgSend(v16, "deviceMemorySizeForTensor:", v18);

      }
      ++v12;
      -[MLCLayer resultTensors](self, "resultTensors");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");

    }
    while (v12 < v20);
  }
  else
  {
    v8 = 0;
  }
  if (!-[MLCLayer isTrainable](self, "isTrainable"))
    goto LABEL_22;
  -[MLCLayer intermediateGradientTensors](self, "intermediateGradientTensors");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (v22)
  {
    -[MLCLayer intermediateGradientTensors](self, "intermediateGradientTensors");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");

    if (v24)
    {
      v25 = 0;
      v9 = 0;
      do
      {
        objc_msgSend(v7, "computeEngine");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCLayer intermediateGradientTensors](self, "intermediateGradientTensors");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectAtIndexedSubscript:", v25);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v9 += objc_msgSend(v26, "deviceMemorySizeForTensor:", v28);

        ++v25;
        -[MLCLayer intermediateGradientTensors](self, "intermediateGradientTensors");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "count");

      }
      while (v25 < v30);
      goto LABEL_23;
    }
LABEL_22:
    v9 = 0;
    goto LABEL_23;
  }
  -[MLCLayer sourceGradientTensors](self, "sourceGradientTensors");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "count");

  if (!v32)
    goto LABEL_22;
  v33 = 0;
  v9 = 0;
  do
  {
    -[MLCLayer sourceGradientTensors](self, "sourceGradientTensors");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectAtIndexedSubscript:", v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "sharedMemoryTensor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v36)
    {
      objc_msgSend(v7, "computeEngine");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCLayer sourceGradientTensors](self, "sourceGradientTensors");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "objectAtIndexedSubscript:", v33);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v9 += objc_msgSend(v37, "deviceMemorySizeForTensor:", v39);

    }
    ++v33;
    -[MLCLayer sourceGradientTensors](self, "sourceGradientTensors");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "count");

  }
  while (v33 < v41);
LABEL_23:
  if (!-[MLCLayer isUpdatable](self, "isUpdatable"))
    goto LABEL_25;
  v42 = -[MLCLayer allocatedDataSizeForTraining:optimizer:](self, "allocatedDataSizeForTraining:optimizer:", -[MLCLayer isTrainable](self, "isTrainable"), v6);
LABEL_26:
  v43 = v9 + v8 + v42;

  return v43;
}

- (unint64_t)deviceMemorySizeForForward
{
  void *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;

  if (-[MLCLayer skipLayer](self, "skipLayer"))
    return 0;
  -[MLCLayer resultTensors](self, "resultTensors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = 0;
    v7 = 0;
    do
    {
      -[MLCLayer resultTensors](self, "resultTensors");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sharedMemoryTensor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        -[MLCLayer device](self, "device");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "computeEngine");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCLayer resultTensors](self, "resultTensors");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectAtIndexedSubscript:", v6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v7 += objc_msgSend(v12, "deviceMemorySizeForTensor:", v14);

      }
      ++v6;
      -[MLCLayer resultTensors](self, "resultTensors");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

    }
    while (v6 < v16);
  }
  else
  {
    v7 = 0;
  }
  return -[MLCLayer allocatedDataSizeForTraining:optimizer:](self, "allocatedDataSizeForTraining:optimizer:", 0, 0)
       + v7;
}

- (NSString)description
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  NSUInteger v7;
  void *v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v16 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer sourceTensors](self, "sourceTensors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MLCLayer layerID](self, "layerID");
  -[MLCLayer label](self, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MLCLayer isFirstLayer](self, "isFirstLayer");
  v10 = -[MLCLayer isLastLayer](self, "isLastLayer");
  v11 = -[MLCLayer skipLayer](self, "skipLayer");
  -[MLCLayer conditionalTreeNode](self, "conditionalTreeNode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer resultTensors](self, "resultTensors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@: { device=%@ : sourceTensors=%@ : layerID=%lu : label=%@ : isFirstLayer=%d : isLastLayer=%d : skipLayer=%d : conditionalTreeNode=%@ : resultTensor=%@ }"), v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v14;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  return 0;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensors:(id)a5
{
  return 0;
}

- (id)getDeviceForTraining
{
  void *v4;
  NSObject *v5;

  -[MLCLayer device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    +[MLCLog framework](MLCLog, "framework");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[MLCLayer getDeviceForTraining].cold.1(a2);

  }
  -[MLCLayer device](self, "device");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)getDeviceForInference
{
  void *v4;
  NSObject *v5;

  -[MLCLayer device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    +[MLCLog framework](MLCLog, "framework");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[MLCLayer getDeviceForInference].cold.1(a2);

  }
  -[MLCLayer device](self, "device");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setBatchSize:(unint64_t)a3
{
  MLCLayer *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unint64_t v39;
  void *v40;
  unint64_t v41;
  void *v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  unint64_t v60;
  void *v61;
  void *v62;
  unint64_t v63;
  uint64_t v64;
  unint64_t v65;
  void *v66;
  uint64_t v67;
  unint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  unint64_t v72;
  void *v73;
  void *v74;
  uint64_t v75;
  unint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  unint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  unint64_t v93;
  void *v94;
  uint64_t v95;
  unint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  unint64_t v101;
  unint64_t v102;
  MLCLayer *v103;
  unint64_t v104;
  unint64_t v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;

  v3 = self;
  v4 = 0xFFFFFFFFLL;
  if (a3)
    v4 = a3;
  -[MLCLayer sourceTensors](self, "sourceTensors", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v103 = v3;
  if (v6 < 2)
  {
    v18 = 0;
  }
  else
  {
    v7 = 0;
    v8 = 1;
    do
    {
      -[MLCLayer sourceTensors](v3, "sourceTensors");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = v7;
      objc_msgSend(v9, "objectAtIndexedSubscript:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "descriptor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "shape");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = objc_msgSend(v12, "count");
      -[MLCLayer sourceTensors](v3, "sourceTensors");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "descriptor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "shape");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      v3 = v103;
      v18 = v8;
      if (v106 >= v17)
      {
        -[MLCLayer sourceTensors](v103, "sourceTensors");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectAtIndexedSubscript:", v104);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "descriptor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "shape");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v107 = objc_msgSend(v22, "count");
        -[MLCLayer sourceTensors](v103, "sourceTensors");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectAtIndexedSubscript:", v8);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "descriptor");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "shape");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "count");

        if (v107 == v27)
        {
          v3 = v103;
          -[MLCLayer sourceTensors](v103, "sourceTensors");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectAtIndexedSubscript:", v104);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "descriptor");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "shape");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "objectAtIndexedSubscript:", 0);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "unsignedIntegerValue");

          -[MLCLayer sourceTensors](v103, "sourceTensors");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "objectAtIndexedSubscript:", v8);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "descriptor");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "shape");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "objectAtIndexedSubscript:", 0);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "unsignedIntegerValue");

          if (v33 >= v39)
            v18 = v104;
          else
            v18 = v8;
        }
        else
        {
          v3 = v103;
          v18 = v104;
        }
      }
      ++v8;
      -[MLCLayer sourceTensors](v3, "sourceTensors");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "count");

      v7 = v18;
    }
    while (v8 < v41);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v18 = 0;
  -[MLCLayer sourceTensors](v3, "sourceTensors");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "count");

  v44 = v102;
  v45 = v102;
  if (v43)
  {
    -[MLCLayer sourceTensors](v3, "sourceTensors");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "objectAtIndexedSubscript:", v18);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "descriptor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "shape");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v49, "count") == 1)
    {

      v45 = 1;
    }
    else
    {
      -[MLCLayer sourceTensors](v3, "sourceTensors");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "objectAtIndexedSubscript:", v18);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "descriptor");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "shape");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "objectAtIndexedSubscript:", 0);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = objc_msgSend(v54, "unsignedIntegerValue");

      if (v108 == 1)
      {
        v45 = 1;
        v44 = v102;
        v3 = v103;
      }
      else
      {
        v3 = v103;
        -[MLCLayer sourceTensors](v103, "sourceTensors");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "objectAtIndexedSubscript:", v18);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "descriptor");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "shape");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "objectAtIndexedSubscript:", 0);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(v59, "unsignedIntegerValue");

        v44 = v102;
        if (v60 >= v102)
          v45 = v102;
        else
          v45 = v60;
      }
    }
  }
  -[MLCLayer device](v3, "device");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "computeEngine");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v62, "numDevices");

  v64 = 1;
  if (v45 != 1)
    v64 = v45 / v63;
  if (v63 >= 2)
    v65 = v64;
  else
    v65 = v45;
  -[MLCLayer deviceOps](v3, "deviceOps");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v66, "count");

  if (v67)
  {
    v68 = 0;
    do
    {
      -[MLCLayer deviceOps](v3, "deviceOps");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "objectAtIndexedSubscript:", v68);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "setBatchSize:", v65);

      ++v68;
      -[MLCLayer deviceOps](v3, "deviceOps");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend(v71, "count");

    }
    while (v68 < v72);
  }
  -[MLCLayer intermediateSumLayer](v3, "intermediateSumLayer");
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  if (v73)
  {
    -[MLCLayer resultTensors](v3, "resultTensors");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend(v74, "count");

    if (v75)
    {
      v105 = v63;
      v76 = 0;
      while (1)
      {
        -[MLCLayer resultTensors](v3, "resultTensors");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "objectAtIndexedSubscript:", v76);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "descriptor");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "shape");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v80, "count") == 1)
        {

        }
        else
        {
          -[MLCLayer resultTensors](v3, "resultTensors");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "objectAtIndexedSubscript:", v76);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "descriptor");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "shape");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "objectAtIndexedSubscript:", 0);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v109 = objc_msgSend(v85, "unsignedIntegerValue");

          v3 = v103;
          if (v109 != 1)
          {
            -[MLCLayer resultTensors](v103, "resultTensors");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v88, "objectAtIndexedSubscript:", v76);
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "descriptor");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v90, "shape");
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "objectAtIndexedSubscript:", 0);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            v93 = objc_msgSend(v92, "unsignedIntegerValue");

            v44 = v102;
            if (v93 < v102)
              v44 = v93;
            v63 = v105;
            break;
          }
        }
        ++v76;
        -[MLCLayer resultTensors](v3, "resultTensors");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = objc_msgSend(v86, "count");

        if (v76 >= v87)
        {
          v44 = 1;
          goto LABEL_47;
        }
      }
    }
    if (v63 >= 2 && v44 != 1)
      v44 /= v63;
LABEL_47:
    -[MLCLayer deviceOps](v3, "deviceOps");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = objc_msgSend(v94, "count");

    if (v95)
    {
      v96 = 0;
      do
      {
        -[MLCLayer intermediateSumLayer](v3, "intermediateSumLayer");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "deviceOps");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "objectAtIndexedSubscript:", v96);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "setBatchSize:", v44);

        ++v96;
        -[MLCLayer deviceOps](v3, "deviceOps");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        v101 = objc_msgSend(v100, "count");

      }
      while (v96 < v101);
    }
  }
}

- (void)setIsDebuggingEnabled:(BOOL)isDebuggingEnabled
{
  -[MLCLayer setIsDebuggingEnabled:isPrivate:](self, "setIsDebuggingEnabled:isPrivate:", isDebuggingEnabled, 0);
}

- (void)setIsDebuggingEnabled:(BOOL)a3 isPrivate:(BOOL)a4
{
  void *v8;
  NSObject *v9;

  -[MLCLayer device](self, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (!a4)
    {
      +[MLCLog framework](MLCLog, "framework");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[MLCLayer setIsDebuggingEnabled:isPrivate:].cold.1(a2);

    }
  }
  else
  {
    self->_isDebuggingEnabled = a3;
  }
}

- (BOOL)isSupportedShapeForTensorSources:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  BOOL v9;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = 0;
    do
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "descriptor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "shape");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

      v9 = v8 > 2;
      if (v8 <= 2)
        break;
      ++v4;
    }
    while (v4 < objc_msgSend(v3, "count"));
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)isValidTrainingParameters
{
  return 1;
}

- (BOOL)isStaticBatchSize
{
  return 1;
}

- (BOOL)isGradientNeededForTensor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;
  void *v9;
  unint64_t v10;

  v4 = a3;
  -[MLCLayer sourceTensors](self, "sourceTensors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    do
    {
      -[MLCLayer sourceTensors](self, "sourceTensors");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
      v8 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(v6) = v8 == v4;
      if (v8 == v4)
        break;
      ++v7;
      -[MLCLayer sourceTensors](self, "sourceTensors");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

    }
    while (v7 < v10);
  }

  return (char)v6;
}

- (BOOL)isTensorSharedAcrossMultipleTrainingLayers:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  unint64_t v12;
  BOOL v13;

  v3 = a3;
  objc_msgSend(v3, "childLayers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = 0;
    v7 = 0;
    do
    {
      objc_msgSend(v3, "childLayers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "compileForInferenceOnly");

      v7 += v10 ^ 1u;
      ++v6;
      objc_msgSend(v3, "childLayers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

    }
    while (v6 < v12);
    v13 = v7 > 1;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSString)summarizedDOTDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ (%lu)>"), v5, -[MLCLayer layerID](self, "layerID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (BOOL)supportsDataType:(MLCDataType)dataType onDevice:(MLCDevice *)device
{
  MLCDevice *v6;
  BOOL v7;

  v6 = device;
  if ((objc_msgSend(a1, "isEqual:", objc_opt_class()) & 1) != 0)
  {
    v7 = 0;
  }
  else if (-[MLCDevice type](v6, "type") == MLCDeviceTypeANE)
  {
    v7 = ((dataType - 1) & 0xFFFFFFFD) == 0;
  }
  else
  {
    v7 = dataType == MLCDataTypeFloat32;
  }

  return v7;
}

- (unint64_t)parametersCount
{
  return 0;
}

- (MLCDeviceType)deviceType
{
  void *v3;
  void *v4;
  MLCDeviceType v5;

  -[MLCLayer device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0x7FFFFFFF;
  -[MLCLayer device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "actualDeviceType");

  return v5;
}

- (NSNumber)key
{
  return (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self);
}

- (NSUInteger)layerID
{
  return self->_layerID;
}

- (void)setLayerID:(unint64_t)a3
{
  self->_layerID = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(NSString *)label
{
  objc_setProperty_nonatomic_copy(self, a2, label, 32);
}

- (BOOL)isDebuggingEnabled
{
  return self->_isDebuggingEnabled;
}

- (NSString)originalLabel
{
  return self->_originalLabel;
}

- (unint64_t)kernelWidth
{
  return self->_kernelWidth;
}

- (void)setKernelWidth:(unint64_t)a3
{
  self->_kernelWidth = a3;
}

- (unint64_t)kernelHeight
{
  return self->_kernelHeight;
}

- (void)setKernelHeight:(unint64_t)a3
{
  self->_kernelHeight = a3;
}

- (unint64_t)dilationRateInX
{
  return self->_dilationRateInX;
}

- (void)setDilationRateInX:(unint64_t)a3
{
  self->_dilationRateInX = a3;
}

- (unint64_t)dilationRateInY
{
  return self->_dilationRateInY;
}

- (void)setDilationRateInY:(unint64_t)a3
{
  self->_dilationRateInY = a3;
}

- (unint64_t)strideInX
{
  return self->_strideInX;
}

- (void)setStrideInX:(unint64_t)a3
{
  self->_strideInX = a3;
}

- (unint64_t)strideInY
{
  return self->_strideInY;
}

- (void)setStrideInY:(unint64_t)a3
{
  self->_strideInY = a3;
}

- (unint64_t)paddingSizeInX
{
  return self->_paddingSizeInX;
}

- (void)setPaddingSizeInX:(unint64_t)a3
{
  self->_paddingSizeInX = a3;
}

- (unint64_t)paddingSizeInY
{
  return self->_paddingSizeInY;
}

- (void)setPaddingSizeInY:(unint64_t)a3
{
  self->_paddingSizeInY = a3;
}

- (MLCDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (NSArray)deviceOps
{
  return self->_deviceOps;
}

- (void)setDeviceOps:(id)a3
{
  objc_storeStrong((id *)&self->_deviceOps, a3);
}

- (BOOL)skipLayer
{
  return self->_skipLayer;
}

- (void)setSkipLayer:(BOOL)a3
{
  self->_skipLayer = a3;
}

- (BOOL)allocateGradientTensors
{
  return self->_allocateGradientTensors;
}

- (void)setAllocateGradientTensors:(BOOL)a3
{
  self->_allocateGradientTensors = a3;
}

- (BOOL)isLastFusedLayer
{
  return self->_isLastFusedLayer;
}

- (void)setIsLastFusedLayer:(BOOL)a3
{
  self->_isLastFusedLayer = a3;
}

- (BOOL)disableUpdate
{
  return self->_disableUpdate;
}

- (void)setDisableUpdate:(BOOL)a3
{
  self->_disableUpdate = a3;
}

- (BOOL)isUpdatable
{
  return self->_isUpdatable;
}

- (void)setIsUpdatable:(BOOL)a3
{
  self->_isUpdatable = a3;
}

- (BOOL)isTrainable
{
  return self->_isTrainable;
}

- (void)setIsTrainable:(BOOL)a3
{
  self->_isTrainable = a3;
}

- (NSMutableArray)sourceTensors
{
  return self->_sourceTensors;
}

- (void)setSourceTensors:(id)a3
{
  objc_storeStrong((id *)&self->_sourceTensors, a3);
}

- (NSMutableArray)resultTensors
{
  return self->_resultTensors;
}

- (void)setResultTensors:(id)a3
{
  objc_storeStrong((id *)&self->_resultTensors, a3);
}

- (NSMutableArray)sourceGradientTensors
{
  return self->_sourceGradientTensors;
}

- (void)setSourceGradientTensors:(id)a3
{
  objc_storeStrong((id *)&self->_sourceGradientTensors, a3);
}

- (NSMutableArray)resultGradientTensors
{
  return self->_resultGradientTensors;
}

- (void)setResultGradientTensors:(id)a3
{
  objc_storeStrong((id *)&self->_resultGradientTensors, a3);
}

- (NSMutableArray)fusedLayers
{
  return self->_fusedLayers;
}

- (MLCLayer)intermediateSumLayer
{
  return self->_intermediateSumLayer;
}

- (void)setIntermediateSumLayer:(id)a3
{
  objc_storeStrong((id *)&self->_intermediateSumLayer, a3);
}

- (NSMutableArray)intermediateGradientTensors
{
  return self->_intermediateGradientTensors;
}

- (void)setIntermediateGradientTensors:(id)a3
{
  objc_storeStrong((id *)&self->_intermediateGradientTensors, a3);
}

- (unint64_t)intermediateGradientTensorIndex
{
  return self->_intermediateGradientTensorIndex;
}

- (void)setIntermediateGradientTensorIndex:(unint64_t)a3
{
  self->_intermediateGradientTensorIndex = a3;
}

- (BOOL)zeroIntermediateGradientTensors
{
  return self->_zeroIntermediateGradientTensors;
}

- (void)setZeroIntermediateGradientTensors:(BOOL)a3
{
  self->_zeroIntermediateGradientTensors = a3;
}

- (BOOL)compileForInferenceOnly
{
  return self->_compileForInferenceOnly;
}

- (void)setCompileForInferenceOnly:(BOOL)a3
{
  self->_compileForInferenceOnly = a3;
}

- (MLCControlTreeNode)conditionalTreeNode
{
  return self->_conditionalTreeNode;
}

- (void)setConditionalTreeNode:(id)a3
{
  objc_storeStrong((id *)&self->_conditionalTreeNode, a3);
}

- (int)paddingPolicy
{
  return self->_paddingPolicy;
}

- (void)setPaddingPolicy:(int)a3
{
  self->_paddingPolicy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditionalTreeNode, 0);
  objc_storeStrong((id *)&self->_intermediateGradientTensors, 0);
  objc_storeStrong((id *)&self->_intermediateSumLayer, 0);
  objc_storeStrong((id *)&self->_fusedLayers, 0);
  objc_storeStrong((id *)&self->_resultGradientTensors, 0);
  objc_storeStrong((id *)&self->_sourceGradientTensors, 0);
  objc_storeStrong((id *)&self->_resultTensors, 0);
  objc_storeStrong((id *)&self->_sourceTensors, 0);
  objc_storeStrong((id *)&self->_deviceOps, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_originalLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (void)getDeviceForTraining
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: no device specified.  The training graph that this layer is associated with may not have been compiled", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

- (void)getDeviceForInference
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: no device specified.  The inference graph that this layer is associated with may not have been compiled", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

- (void)setIsDebuggingEnabled:(const char *)a1 isPrivate:.cold.1(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: isDebuggingEnabled cannot be set once layer has been compiled", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

@end
