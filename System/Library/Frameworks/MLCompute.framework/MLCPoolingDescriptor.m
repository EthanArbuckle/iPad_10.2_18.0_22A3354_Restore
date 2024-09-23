@implementation MLCPoolingDescriptor

- (id)description
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v7;

  v7 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: { poolingType=%d : kernelWidth=%lu : kernelHeight=%lu : strideInX=%lu : strideInY=%lu : dilationRateInX=%lu :  dilationRateInY=%lu : paddingPolicy=%d : paddingSizeInX=%lu : paddingSizeInY=%lu }"), v4, -[MLCPoolingDescriptor poolingType](self, "poolingType"), -[MLCPoolingDescriptor kernelWidth](self, "kernelWidth"), -[MLCPoolingDescriptor kernelHeight](self, "kernelHeight"), -[MLCPoolingDescriptor strideInX](self, "strideInX"), -[MLCPoolingDescriptor strideInY](self, "strideInY"), -[MLCPoolingDescriptor dilationRateInX](self, "dilationRateInX"), -[MLCPoolingDescriptor dilationRateInY](self, "dilationRateInY"), -[MLCPoolingDescriptor paddingPolicy](self, "paddingPolicy"), -[MLCPoolingDescriptor paddingSizeInX](self, "paddingSizeInX"), -[MLCPoolingDescriptor paddingSizeInY](self, "paddingSizeInY"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (MLCPoolingDescriptor)poolingDescriptorWithType:(MLCPoolingType)poolingType kernelSize:(NSUInteger)kernelSize stride:(NSUInteger)stride
{
  uint64_t v6;
  uint64_t v7;

  LOBYTE(v7) = 0;
  LODWORD(v6) = 0;
  return (MLCPoolingDescriptor *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithType:kernelWidth:kernelHeight:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:countIncludesPadding:", *(_QWORD *)&poolingType, kernelSize, kernelSize, stride, stride, 1, 1, v6, 0, 0, v7);
}

+ (MLCPoolingDescriptor)poolingDescriptorWithType:(int)a3 kernelSizes:(id)a4 strides:(id)a5 paddingPolicy:(int)a6 paddingSizes:(id)a7
{
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;

  v10 = *(_QWORD *)&a3;
  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = objc_alloc((Class)a1);
  objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v16, "unsignedIntegerValue");
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v17, "unsignedIntegerValue");
  objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v19, "unsignedIntegerValue");
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_msgSend(v20, "unsignedIntegerValue");
  if (v12)
  {
    v37 = v21;
    objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
    v38 = v17;
    v22 = v10;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v18;
    v25 = v15;
    v26 = v19;
    v27 = a6;
    v28 = objc_msgSend(v23, "unsignedIntegerValue");
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v39 = v12;
    v29 = v16;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "unsignedIntegerValue");
    LOBYTE(v36) = 0;
    LODWORD(v35) = v27;
    v19 = v26;
    v32 = v22;
    v17 = v38;
    v33 = (void *)objc_msgSend(v25, "initWithType:kernelWidth:kernelHeight:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:countIncludesPadding:", v32, v41, v24, v40, v37, 1, 1, v35, v28, v31, v36);

    v16 = v29;
    v12 = v39;

  }
  else
  {
    LOBYTE(v36) = 0;
    LODWORD(v35) = a6;
    v33 = (void *)objc_msgSend(v15, "initWithType:kernelWidth:kernelHeight:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:countIncludesPadding:", v10, v41, v18, v40, v21, 1, 1, v35, 0, 0, v36);
  }

  return (MLCPoolingDescriptor *)v33;
}

+ (MLCPoolingDescriptor)poolingDescriptorWithType:(int)a3 kernelSizes:(id)a4 strides:(id)a5 dilationRates:(id)a6 paddingPolicy:(int)a7 paddingSizes:(id)a8
{
  uint64_t v12;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;

  v12 = *(_QWORD *)&a3;
  v14 = a8;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v43 = objc_alloc((Class)a1);
  objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v18, "unsignedIntegerValue");
  objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = objc_msgSend(v19, "unsignedIntegerValue");
  objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v20, "unsignedIntegerValue");
  objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend(v21, "unsignedIntegerValue");
  objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v40, "unsignedIntegerValue");
  objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_msgSend(v23, "unsignedIntegerValue");
  v25 = v24;
  if (v14)
  {
    objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
    v37 = v18;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v22;
    v27 = v19;
    v28 = objc_msgSend(v26, "unsignedIntegerValue");
    objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
    v36 = v14;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v34) = 0;
    v33 = v28;
    v19 = v27;
    LODWORD(v32) = a7;
    v30 = (void *)objc_msgSend(v43, "initWithType:kernelWidth:kernelHeight:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:countIncludesPadding:", v12, v42, v41, v39, v35, v38, v25, v32, v33, objc_msgSend(v29, "unsignedIntegerValue"), v34);

    v14 = v36;
    v18 = v37;
  }
  else
  {
    LOBYTE(v34) = 0;
    LODWORD(v32) = a7;
    v30 = (void *)objc_msgSend(v43, "initWithType:kernelWidth:kernelHeight:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:countIncludesPadding:", v12, v42, v41, v39, v22, v38, v24, v32, 0, 0, v34);
  }

  return (MLCPoolingDescriptor *)v30;
}

+ (MLCPoolingDescriptor)maxPoolingDescriptorWithKernelSizes:(NSArray *)kernelSizes strides:(NSArray *)strides paddingPolicy:(MLCPaddingPolicy)paddingPolicy paddingSizes:(NSArray *)paddingSizes
{
  NSArray *v10;
  NSArray *v11;
  NSArray *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  MLCPaddingPolicy v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSArray *v38;
  uint64_t v39;

  v10 = paddingSizes;
  v11 = strides;
  v12 = kernelSizes;
  v13 = objc_alloc((Class)a1);
  -[NSArray objectAtIndexedSubscript:](v12, "objectAtIndexedSubscript:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v12, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v18, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v19, "unsignedIntegerValue");
  if (v10)
  {
    v37 = v20;
    -[NSArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 1);
    v36 = v17;
    v21 = v16;
    v22 = paddingPolicy;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v15;
    v25 = v18;
    v26 = v13;
    v27 = objc_msgSend(v23, "unsignedIntegerValue");
    -[NSArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 0);
    v38 = v10;
    v28 = v14;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v35) = 0;
    v34 = objc_msgSend(v29, "unsignedIntegerValue");
    LODWORD(v33) = v22;
    v16 = v21;
    v30 = v26;
    v18 = v25;
    v31 = (void *)objc_msgSend(v30, "initWithType:kernelWidth:kernelHeight:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:countIncludesPadding:", 1, v24, v36, v39, v37, 1, 1, v33, v27, v34, v35);

    v14 = v28;
    v10 = v38;

  }
  else
  {
    LOBYTE(v35) = 0;
    LODWORD(v33) = paddingPolicy;
    v31 = (void *)objc_msgSend(v13, "initWithType:kernelWidth:kernelHeight:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:countIncludesPadding:", 1, v15, v17, v39, v20, 1, 1, v33, 0, 0, v35);
  }

  return (MLCPoolingDescriptor *)v31;
}

+ (MLCPoolingDescriptor)maxPoolingDescriptorWithKernelSizes:(NSArray *)kernelSizes strides:(NSArray *)strides dilationRates:(NSArray *)dilationRates paddingPolicy:(MLCPaddingPolicy)paddingPolicy paddingSizes:(NSArray *)paddingSizes
{
  NSArray *v12;
  NSArray *v13;
  NSArray *v14;
  NSArray *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSArray *v28;
  void *v29;
  void *v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;

  v12 = paddingSizes;
  v13 = dilationRates;
  v14 = strides;
  v15 = kernelSizes;
  v16 = objc_alloc((Class)a1);
  -[NSArray objectAtIndexedSubscript:](v15, "objectAtIndexedSubscript:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v17, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v15, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = objc_msgSend(v18, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v14, "objectAtIndexedSubscript:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v19, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v14, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_msgSend(v20, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v13, "objectAtIndexedSubscript:", 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v40, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v13, "objectAtIndexedSubscript:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_msgSend(v22, "unsignedIntegerValue");
  v24 = v23;
  if (v12)
  {
    -[NSArray objectAtIndexedSubscript:](v12, "objectAtIndexedSubscript:", 1);
    v37 = v17;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v21;
    v26 = v19;
    v27 = objc_msgSend(v25, "unsignedIntegerValue");
    -[NSArray objectAtIndexedSubscript:](v12, "objectAtIndexedSubscript:", 0);
    v36 = v18;
    v28 = v12;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v34) = 0;
    v33 = v27;
    v19 = v26;
    LODWORD(v32) = paddingPolicy;
    v30 = (void *)objc_msgSend(v16, "initWithType:kernelWidth:kernelHeight:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:countIncludesPadding:", 1, v42, v41, v39, v35, v38, v24, v32, v33, objc_msgSend(v29, "unsignedIntegerValue"), v34);

    v12 = v28;
    v18 = v36;

    v17 = v37;
  }
  else
  {
    LOBYTE(v34) = 0;
    LODWORD(v32) = paddingPolicy;
    v30 = (void *)objc_msgSend(v16, "initWithType:kernelWidth:kernelHeight:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:countIncludesPadding:", 1, v42, v41, v39, v21, v38, v23, v32, 0, 0, v34);
  }

  return (MLCPoolingDescriptor *)v30;
}

+ (MLCPoolingDescriptor)averagePoolingDescriptorWithKernelSizes:(NSArray *)kernelSizes strides:(NSArray *)strides paddingPolicy:(MLCPaddingPolicy)paddingPolicy paddingSizes:(NSArray *)paddingSizes countIncludesPadding:(BOOL)countIncludesPadding
{
  NSArray *v12;
  NSArray *v13;
  NSArray *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  MLCPaddingPolicy v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSArray *v37;
  uint64_t v38;
  uint64_t v39;

  v12 = paddingSizes;
  v13 = strides;
  v14 = kernelSizes;
  v15 = objc_alloc((Class)a1);
  -[NSArray objectAtIndexedSubscript:](v14, "objectAtIndexedSubscript:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v16, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v14, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v17, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v13, "objectAtIndexedSubscript:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v19, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v13, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_msgSend(v20, "unsignedIntegerValue");
  if (v12)
  {
    v36 = v21;
    -[NSArray objectAtIndexedSubscript:](v12, "objectAtIndexedSubscript:", 1);
    v35 = v15;
    v22 = v17;
    v23 = paddingPolicy;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v18;
    v26 = v19;
    v27 = objc_msgSend(v24, "unsignedIntegerValue");
    -[NSArray objectAtIndexedSubscript:](v12, "objectAtIndexedSubscript:", 0);
    v37 = v12;
    v28 = v16;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v34) = countIncludesPadding;
    v33 = v27;
    v19 = v26;
    LODWORD(v32) = v23;
    v17 = v22;
    v30 = (void *)objc_msgSend(v35, "initWithType:kernelWidth:kernelHeight:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:countIncludesPadding:", 2, v39, v25, v38, v36, 1, 1, v32, v33, objc_msgSend(v29, "unsignedIntegerValue"), v34);

    v16 = v28;
    v12 = v37;

  }
  else
  {
    LOBYTE(v34) = countIncludesPadding;
    LODWORD(v32) = paddingPolicy;
    v30 = (void *)objc_msgSend(v15, "initWithType:kernelWidth:kernelHeight:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:countIncludesPadding:", 2, v39, v18, v38, v21, 1, 1, v32, 0, 0, v34);
  }

  return (MLCPoolingDescriptor *)v30;
}

+ (MLCPoolingDescriptor)averagePoolingDescriptorWithKernelSizes:(NSArray *)kernelSizes strides:(NSArray *)strides dilationRates:(NSArray *)dilationRates paddingPolicy:(MLCPaddingPolicy)paddingPolicy paddingSizes:(NSArray *)paddingSizes countIncludesPadding:(BOOL)countIncludesPadding
{
  NSArray *v14;
  NSArray *v15;
  NSArray *v16;
  NSArray *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSArray *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;

  v14 = paddingSizes;
  v15 = dilationRates;
  v16 = strides;
  v17 = kernelSizes;
  v43 = objc_alloc((Class)a1);
  -[NSArray objectAtIndexedSubscript:](v17, "objectAtIndexedSubscript:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v18, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v17, "objectAtIndexedSubscript:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = objc_msgSend(v19, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v16, "objectAtIndexedSubscript:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v20, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v16, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend(v21, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v15, "objectAtIndexedSubscript:", 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v40, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v15, "objectAtIndexedSubscript:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_msgSend(v23, "unsignedIntegerValue");
  v25 = v24;
  if (v14)
  {
    -[NSArray objectAtIndexedSubscript:](v14, "objectAtIndexedSubscript:", 1);
    v37 = v18;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v22;
    v27 = v19;
    v28 = objc_msgSend(v26, "unsignedIntegerValue");
    -[NSArray objectAtIndexedSubscript:](v14, "objectAtIndexedSubscript:", 0);
    v36 = v14;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v34) = countIncludesPadding;
    v33 = v28;
    v19 = v27;
    LODWORD(v32) = paddingPolicy;
    v30 = (void *)objc_msgSend(v43, "initWithType:kernelWidth:kernelHeight:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:countIncludesPadding:", 2, v42, v41, v39, v35, v38, v25, v32, v33, objc_msgSend(v29, "unsignedIntegerValue"), v34);

    v14 = v36;
    v18 = v37;
  }
  else
  {
    LOBYTE(v34) = countIncludesPadding;
    LODWORD(v32) = paddingPolicy;
    v30 = (void *)objc_msgSend(v43, "initWithType:kernelWidth:kernelHeight:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:countIncludesPadding:", 2, v42, v41, v39, v22, v38, v24, v32, 0, 0, v34);
  }

  return (MLCPoolingDescriptor *)v30;
}

+ (MLCPoolingDescriptor)l2NormPoolingDescriptorWithKernelSizes:(NSArray *)kernelSizes strides:(NSArray *)strides paddingPolicy:(MLCPaddingPolicy)paddingPolicy paddingSizes:(NSArray *)paddingSizes
{
  NSArray *v10;
  NSArray *v11;
  NSArray *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  MLCPaddingPolicy v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSArray *v38;
  uint64_t v39;

  v10 = paddingSizes;
  v11 = strides;
  v12 = kernelSizes;
  v13 = objc_alloc((Class)a1);
  -[NSArray objectAtIndexedSubscript:](v12, "objectAtIndexedSubscript:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v12, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v18, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v19, "unsignedIntegerValue");
  if (v10)
  {
    v37 = v20;
    -[NSArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 1);
    v36 = v17;
    v21 = v16;
    v22 = paddingPolicy;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v15;
    v25 = v18;
    v26 = v13;
    v27 = objc_msgSend(v23, "unsignedIntegerValue");
    -[NSArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 0);
    v38 = v10;
    v28 = v14;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v35) = 0;
    v34 = objc_msgSend(v29, "unsignedIntegerValue");
    LODWORD(v33) = v22;
    v16 = v21;
    v30 = v26;
    v18 = v25;
    v31 = (void *)objc_msgSend(v30, "initWithType:kernelWidth:kernelHeight:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:countIncludesPadding:", 3, v24, v36, v39, v37, 1, 1, v33, v27, v34, v35);

    v14 = v28;
    v10 = v38;

  }
  else
  {
    LOBYTE(v35) = 0;
    LODWORD(v33) = paddingPolicy;
    v31 = (void *)objc_msgSend(v13, "initWithType:kernelWidth:kernelHeight:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:countIncludesPadding:", 3, v15, v17, v39, v20, 1, 1, v33, 0, 0, v35);
  }

  return (MLCPoolingDescriptor *)v31;
}

+ (MLCPoolingDescriptor)l2NormPoolingDescriptorWithKernelSizes:(NSArray *)kernelSizes strides:(NSArray *)strides dilationRates:(NSArray *)dilationRates paddingPolicy:(MLCPaddingPolicy)paddingPolicy paddingSizes:(NSArray *)paddingSizes
{
  NSArray *v12;
  NSArray *v13;
  NSArray *v14;
  NSArray *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;

  v12 = paddingSizes;
  v13 = dilationRates;
  v14 = strides;
  v15 = kernelSizes;
  v16 = objc_alloc((Class)a1);
  -[NSArray objectAtIndexedSubscript:](v15, "objectAtIndexedSubscript:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v17, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v15, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = objc_msgSend(v18, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v14, "objectAtIndexedSubscript:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v19, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v14, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_msgSend(v20, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v13, "objectAtIndexedSubscript:", 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v39, "unsignedIntegerValue");
  -[NSArray objectAtIndexedSubscript:](v13, "objectAtIndexedSubscript:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_msgSend(v22, "unsignedIntegerValue");
  v24 = v23;
  if (v12)
  {
    -[NSArray objectAtIndexedSubscript:](v12, "objectAtIndexedSubscript:", 1);
    v36 = v17;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v21;
    v26 = v19;
    v27 = objc_msgSend(v25, "unsignedIntegerValue");
    -[NSArray objectAtIndexedSubscript:](v12, "objectAtIndexedSubscript:", 0);
    v35 = v18;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v33) = 0;
    v32 = v27;
    v19 = v26;
    LODWORD(v31) = paddingPolicy;
    v29 = (void *)objc_msgSend(v16, "initWithType:kernelWidth:kernelHeight:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:countIncludesPadding:", 3, v41, v40, v38, v34, v37, v24, v31, v32, objc_msgSend(v28, "unsignedIntegerValue"), v33);

    v18 = v35;
    v17 = v36;
  }
  else
  {
    LOBYTE(v33) = 0;
    LODWORD(v31) = paddingPolicy;
    v29 = (void *)objc_msgSend(v16, "initWithType:kernelWidth:kernelHeight:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:countIncludesPadding:", 3, v41, v40, v38, v21, v37, v23, v31, 0, 0, v33);
  }

  return (MLCPoolingDescriptor *)v29;
}

- (MLCPoolingDescriptor)initWithType:(int)a3 kernelWidth:(unint64_t)a4 kernelHeight:(unint64_t)a5 strideInX:(unint64_t)a6 strideInY:(unint64_t)a7 dilationRateInX:(unint64_t)a8 dilationRateInY:(unint64_t)a9 paddingPolicy:(int)a10 paddingSizeInX:(unint64_t)a11 paddingSizeInY:(unint64_t)a12 countIncludesPadding:(BOOL)a13
{
  MLCPoolingDescriptor *result;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)MLCPoolingDescriptor;
  result = -[MLCPoolingDescriptor init](&v20, sel_init);
  if (result)
  {
    result->_kernelWidth = a4;
    result->_kernelHeight = a5;
    result->_strideInX = a6;
    result->_strideInY = a7;
    result->_dilationRateInX = a8;
    result->_dilationRateInY = a9;
    result->_poolingType = a3;
    result->_paddingPolicy = a10;
    result->_paddingSizeInX = a11;
    result->_paddingSizeInY = a12;
    result->_countIncludesPadding = a13;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "poolingType");
    if (v6 != -[MLCPoolingDescriptor poolingType](self, "poolingType"))
      goto LABEL_14;
    v7 = objc_msgSend(v5, "kernelWidth");
    if (v7 != -[MLCPoolingDescriptor kernelWidth](self, "kernelWidth"))
      goto LABEL_14;
    v8 = objc_msgSend(v5, "kernelHeight");
    if (v8 != -[MLCPoolingDescriptor kernelHeight](self, "kernelHeight"))
      goto LABEL_14;
    v9 = objc_msgSend(v5, "strideInX");
    if (v9 == -[MLCPoolingDescriptor strideInX](self, "strideInX")
      && (v10 = objc_msgSend(v5, "strideInY"), v10 == -[MLCPoolingDescriptor strideInY](self, "strideInY"))
      && (v11 = objc_msgSend(v5, "dilationRateInX"),
          v11 == -[MLCPoolingDescriptor dilationRateInX](self, "dilationRateInX"))
      && (v12 = objc_msgSend(v5, "dilationRateInY"),
          v12 == -[MLCPoolingDescriptor dilationRateInY](self, "dilationRateInY"))
      && (v13 = objc_msgSend(v5, "paddingPolicy"), v13 == -[MLCPoolingDescriptor paddingPolicy](self, "paddingPolicy"))
      && (v14 = objc_msgSend(v5, "paddingSizeInX"), v14 == -[MLCPoolingDescriptor paddingSizeInX](self, "paddingSizeInX"))&& (v15 = objc_msgSend(v5, "paddingSizeInY"), v15 == -[MLCPoolingDescriptor paddingSizeInY](self, "paddingSizeInY")))
    {
      v16 = objc_msgSend(v5, "countIncludesPadding");
      v17 = v16 ^ -[MLCPoolingDescriptor countIncludesPadding](self, "countIncludesPadding") ^ 1;
    }
    else
    {
LABEL_14:
      LOBYTE(v17) = 0;
    }

  }
  else
  {
    LOBYTE(v17) = 0;
  }

  return v17;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  unint64_t v12;

  v12 = 0;
  v11 = -[MLCPoolingDescriptor poolingType](self, "poolingType");
  -[MLCPoolingDescriptor kernelWidth](self, "kernelWidth");
  -[MLCPoolingDescriptor kernelHeight](self, "kernelHeight");
  -[MLCPoolingDescriptor strideInX](self, "strideInX");
  -[MLCPoolingDescriptor strideInY](self, "strideInY");
  -[MLCPoolingDescriptor dilationRateInX](self, "dilationRateInX");
  -[MLCPoolingDescriptor dilationRateInY](self, "dilationRateInY");
  -[MLCPoolingDescriptor paddingPolicy](self, "paddingPolicy");
  -[MLCPoolingDescriptor paddingSizeInX](self, "paddingSizeInX");
  -[MLCPoolingDescriptor paddingSizeInY](self, "paddingSizeInY");
  -[MLCPoolingDescriptor countIncludesPadding](self, "countIncludesPadding");
  hashCombine_0(&v12, v3, v4, v5, v6, v7, v8, v9, v11);
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  MLCPaddingPolicy v10;
  NSUInteger v11;
  NSUInteger v12;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v16 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  HIDWORD(v15) = -[MLCPoolingDescriptor poolingType](self, "poolingType");
  v4 = -[MLCPoolingDescriptor kernelWidth](self, "kernelWidth");
  v5 = -[MLCPoolingDescriptor kernelHeight](self, "kernelHeight");
  v6 = -[MLCPoolingDescriptor strideInX](self, "strideInX");
  v7 = -[MLCPoolingDescriptor strideInY](self, "strideInY");
  v8 = -[MLCPoolingDescriptor dilationRateInX](self, "dilationRateInX");
  v9 = -[MLCPoolingDescriptor dilationRateInY](self, "dilationRateInY");
  v10 = -[MLCPoolingDescriptor paddingPolicy](self, "paddingPolicy");
  v11 = -[MLCPoolingDescriptor paddingSizeInX](self, "paddingSizeInX");
  v12 = -[MLCPoolingDescriptor paddingSizeInY](self, "paddingSizeInY");
  LOBYTE(v15) = -[MLCPoolingDescriptor countIncludesPadding](self, "countIncludesPadding");
  LODWORD(v14) = v10;
  return (id)objc_msgSend(v16, "initWithType:kernelWidth:kernelHeight:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:countIncludesPadding:", HIDWORD(v15), v4, v5, v6, v7, v8, v9, v14, v11, v12, v15);
}

- (MLCPoolingType)poolingType
{
  return self->_poolingType;
}

- (NSUInteger)kernelWidth
{
  return self->_kernelWidth;
}

- (NSUInteger)kernelHeight
{
  return self->_kernelHeight;
}

- (NSUInteger)strideInX
{
  return self->_strideInX;
}

- (NSUInteger)strideInY
{
  return self->_strideInY;
}

- (NSUInteger)dilationRateInX
{
  return self->_dilationRateInX;
}

- (NSUInteger)dilationRateInY
{
  return self->_dilationRateInY;
}

- (MLCPaddingPolicy)paddingPolicy
{
  return self->_paddingPolicy;
}

- (NSUInteger)paddingSizeInX
{
  return self->_paddingSizeInX;
}

- (NSUInteger)paddingSizeInY
{
  return self->_paddingSizeInY;
}

- (BOOL)countIncludesPadding
{
  return self->_countIncludesPadding;
}

@end
