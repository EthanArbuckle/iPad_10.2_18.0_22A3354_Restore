@implementation MLCTensorDescriptor

+ (NSUInteger)maxTensorDimensions
{
  return 4;
}

+ (MLCTensorDescriptor)descriptorWithWidth:(NSUInteger)width height:(NSUInteger)height featureChannelCount:(NSUInteger)featureChannels batchSize:(NSUInteger)batchSize
{
  return (MLCTensorDescriptor *)objc_msgSend((id)objc_opt_class(), "descriptorWithWidth:height:featureChannelCount:batchSize:dataType:", width, height, featureChannels, batchSize, 1);
}

+ (MLCTensorDescriptor)descriptorWithWidth:(NSUInteger)width height:(NSUInteger)height featureChannelCount:(NSUInteger)featureChannelCount batchSize:(NSUInteger)batchSize dataType:(MLCDataType)dataType
{
  uint64_t v8;

  LODWORD(v8) = dataType;
  return (MLCTensorDescriptor *)objc_msgSend((id)objc_opt_class(), "descriptorWithWidth:height:featureChannels:batchSize:strideForWidth:strideForHeight:strideForBatch:dataType:", width, height, featureChannelCount, batchSize, 0, 0, 0, v8);
}

+ (MLCTensorDescriptor)descriptorWithWidth:(unint64_t)a3 height:(unint64_t)a4 featureChannels:(unint64_t)a5 batchSize:(unint64_t)a6 strideForWidth:(unint64_t)a7 strideForHeight:(unint64_t)a8 strideForBatch:(unint64_t)a9 dataType:(int)a10
{
  uint64_t v11;

  LODWORD(v11) = a10;
  return (MLCTensorDescriptor *)(id)objc_msgSend(objc_alloc((Class)a1), "initNCHWTensorWithWidth:height:featureChannels:batchSize:strideForWidth:strideForHeight:strideForChannel:strideForBatch:fanIn:fanOut:dataType:", a3, a4, a5, a6, a7, a8, 0, a9, a4 * a3 * a5, a4 * a3, v11);
}

+ (MLCTensorDescriptor)descriptorWithShape:(NSArray *)shape sequenceLengths:(NSArray *)sequenceLengths sortedSequences:(BOOL)sortedSequences dataType:(MLCDataType)dataType
{
  NSArray *v11;
  NSArray *v12;
  void *v13;
  uint64_t v14;
  id v15;
  NSArray *v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v27;

  v11 = shape;
  v12 = sequenceLengths;
  if (!-[NSArray count](v12, "count"))
  {
    +[MLCLog framework](MLCLog, "framework");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      +[MLCTensorDescriptor descriptorWithShape:sequenceLengths:sortedSequences:dataType:].cold.1(a2);
    goto LABEL_15;
  }
  if (!sortedSequences)
  {
    +[MLCLog framework](MLCLog, "framework");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      +[MLCTensorDescriptor descriptorWithShape:sequenceLengths:sortedSequences:dataType:].cold.3(a2);
    goto LABEL_15;
  }
  if (-[NSArray count](v11, "count") != 3 && -[NSArray count](v11, "count") != 4)
  {
    +[MLCLog framework](MLCLog, "framework");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      +[MLCTensorDescriptor descriptorWithShape:sequenceLengths:sortedSequences:dataType:].cold.2(a2);
LABEL_15:

    v25 = 0;
    goto LABEL_16;
  }
  if (-[NSArray count](v11, "count") == 3)
  {
    -[NSArray objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "unsignedIntegerValue");

    v15 = objc_alloc((Class)a1);
    LODWORD(v27) = dataType;
    v16 = v11;
    v17 = v12;
    v18 = v14;
    v19 = 1;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "unsignedIntegerValue");

    -[NSArray objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "unsignedIntegerValue");

    v15 = objc_alloc((Class)a1);
    v18 = v24 * v22;
    LODWORD(v27) = dataType;
    v16 = v11;
    v17 = v12;
    v19 = v24;
  }
  v25 = (void *)objc_msgSend(v15, "initTensorWithShape:stride:sequenceLengths:sortedSequences:fanIn:fanOut:dataType:", v16, 0, v17, 1, v18, v19, v27);
LABEL_16:

  return (MLCTensorDescriptor *)v25;
}

+ (MLCTensorDescriptor)descriptorWithShape:(NSArray *)shape dataType:(MLCDataType)dataType
{
  return (MLCTensorDescriptor *)objc_msgSend(a1, "descriptorWithShape:stride:dataType:", shape, 0, *(_QWORD *)&dataType);
}

+ (MLCTensorDescriptor)descriptorWithShape:(id)a3 stride:(id)a4 dataType:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v8, "count");
  if (v10 == 4)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "unsignedIntegerValue");
    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v16, "unsignedIntegerValue") * v15;

    objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "unsignedIntegerValue") * v13;
  }
  else
  {
    if (v10 != 3)
    {
      v12 = 1;
      v13 = 1;
      goto LABEL_7;
    }
    objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "unsignedIntegerValue");
    v13 = 1;
  }

LABEL_7:
  v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "initTensorWithShape:stride:fanIn:fanOut:dataType:", v8, v9, v12, v13, v5);

  return (MLCTensorDescriptor *)v17;
}

- (id)initNCHWTensorWithWidth:(unint64_t)a3 height:(unint64_t)a4 featureChannels:(unint64_t)a5 batchSize:(unint64_t)a6 strideForWidth:(unint64_t)a7 strideForHeight:(unint64_t)a8 strideForChannel:(unint64_t)a9 strideForBatch:(unint64_t)a10 fanIn:(unint64_t)a11 fanOut:(unint64_t)a12 dataType:(int)a13
{
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  MLCTensorDescriptor *v33;
  unint64_t v35;
  _QWORD v36[4];
  _QWORD v37[5];

  v37[4] = *MEMORY[0x1E0C80C00];
  v20 = objc_msgSend((id)objc_opt_class(), "elementByteCount:", a13);
  if (v20)
  {
    v21 = a10;
    if (!a7)
      a7 = v20;
    if (!a8)
      a8 = a7 * a3;
    if (a9)
      v22 = a9;
    else
      v22 = a8 * a4;
    if (!a10)
      v21 = v22 * a5;
    v35 = v21;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v23;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v24;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v25;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v37[3] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v35);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v28;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v22);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v29;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a8);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2] = v30;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v36[3] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 4);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    self = (MLCTensorDescriptor *)-[MLCTensorDescriptor initTensorWithShape:stride:fanIn:fanOut:dataType:](self, "initTensorWithShape:stride:fanIn:fanOut:dataType:", v27, v32, a11, a12, a13);
    v33 = self;
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (id)initTensorWithShape:(id)a3 stride:(id)a4 fanIn:(unint64_t)a5 fanOut:(unint64_t)a6 dataType:(int)a7
{
  uint64_t v8;

  LODWORD(v8) = a7;
  return -[MLCTensorDescriptor initTensorWithShape:stride:sequenceLengths:sortedSequences:fanIn:fanOut:dataType:](self, "initTensorWithShape:stride:sequenceLengths:sortedSequences:fanIn:fanOut:dataType:", a3, a4, 0, 0, a5, a6, v8);
}

- (id)initTensorWithShape:(id)a3 stride:(id)a4 sequenceLengths:(id)a5 sortedSequences:(BOOL)a6 fanIn:(unint64_t)a7 fanOut:(unint64_t)a8 dataType:(int)a9
{
  _BOOL4 v11;
  id v15;
  id v16;
  id v17;
  unint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  unint64_t v32;
  void *v33;
  unint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  MLCTensorDescriptor *v41;
  MLCTensorDescriptor *v42;
  uint64_t v43;
  NSArray *shape;
  uint64_t v45;
  NSArray *stride;
  MLCTensorDescriptor *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  unint64_t v52;
  void *v53;
  uint64_t v54;
  NSArray *v55;
  BOOL v56;
  unint64_t v57;
  void *v58;
  uint64_t v59;
  unint64_t v60;
  void *v61;
  uint64_t v62;
  NSArray *batchSizePerSequenceStep;
  void *v64;
  NSArray *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  unint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  unint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  _QWORD v80[4];
  id v81;
  id v82;
  _BOOL4 v83;
  const char *v84;
  objc_super v85;
  uint8_t buf[4];
  void *v87;
  __int16 v88;
  uint64_t v89;
  __int16 v90;
  uint64_t v91;
  uint64_t v92;

  v11 = a6;
  v84 = a2;
  v92 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = +[MLCTensorDescriptor maxTensorDimensions](MLCTensorDescriptor, "maxTensorDimensions");
  if (objc_msgSend(v15, "count") > v18)
  {
    +[MLCLog framework](MLCLog, "framework");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(v84);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v87 = v20;
      v88 = 2048;
      v89 = objc_msgSend(v15, "count");
      v90 = 2048;
      v91 = v18;
      _os_log_error_impl(&dword_1D4999000, v19, OS_LOG_TYPE_ERROR, "%@: Requested (%lu) dimensions exceed max supported (%lu) dimensions", buf, 0x20u);

    }
    goto LABEL_57;
  }
  v83 = v11;
  v81 = a5;
  if (objc_msgSend(v15, "count"))
  {
    v21 = 0;
    while (1)
    {
      objc_msgSend(v15, "objectAtIndexedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "unsignedIntegerValue");

      if (!v23)
        break;
      if (++v21 >= (unint64_t)objc_msgSend(v15, "count"))
        goto LABEL_8;
    }
    +[MLCLog framework](MLCLog, "framework");
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      goto LABEL_57;
    NSStringFromSelector(v84);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", v21);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v87 = v37;
    v88 = 2048;
    v89 = objc_msgSend(v38, "unsignedIntegerValue");
    v90 = 2048;
    v91 = v21;
    _os_log_error_impl(&dword_1D4999000, v19, OS_LOG_TYPE_ERROR, "%@: Requested (%lu) value in size for dimension (%lu) is zero", buf, 0x20u);

    goto LABEL_26;
  }
LABEL_8:
  if (v16)
  {
    v24 = objc_msgSend(v16, "count");
    if (v24 != objc_msgSend(v15, "count"))
    {
      +[MLCLog framework](MLCLog, "framework");
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
LABEL_57:

        v47 = 0;
        goto LABEL_58;
      }
      NSStringFromSelector(v84);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v87 = v37;
      v88 = 2048;
      v89 = objc_msgSend(v15, "count");
      v90 = 2048;
      v91 = objc_msgSend(v16, "count");
      _os_log_error_impl(&dword_1D4999000, v19, OS_LOG_TYPE_ERROR, "%@: Size (%lu) dimensions do not match stride (%lu) dimensions", buf, 0x20u);
LABEL_26:

      goto LABEL_57;
    }
  }
  v82 = v16;
  if (v17)
  {
    if (!v83)
    {
      +[MLCLog framework](MLCLog, "framework");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[MLCTensorDescriptor initTensorWithShape:stride:sequenceLengths:sortedSequences:fanIn:fanOut:dataType:].cold.6(v84);
      goto LABEL_57;
    }
    if (!objc_msgSend(v17, "count"))
    {
      +[MLCLog framework](MLCLog, "framework");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        +[MLCTensorDescriptor descriptorWithShape:sequenceLengths:sortedSequences:dataType:].cold.1(v84);
      goto LABEL_57;
    }
    if (objc_msgSend(v15, "count") == 4)
    {
      objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "unsignedIntegerValue");
      v27 = objc_msgSend(v17, "count");

      if (v26 != v27)
      {
        +[MLCLog framework](MLCLog, "framework");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[MLCTensorDescriptor initTensorWithShape:stride:sequenceLengths:sortedSequences:fanIn:fanOut:dataType:].cold.5(v84);
        goto LABEL_57;
      }
    }
    objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "unsignedIntegerValue");

    if (!v29)
    {
      +[MLCLog framework](MLCLog, "framework");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[MLCTensorDescriptor initTensorWithShape:stride:sequenceLengths:sortedSequences:fanIn:fanOut:dataType:].cold.2(v84);
      goto LABEL_57;
    }
    v30 = 0;
    while (v30 < objc_msgSend(v17, "count") - 1)
    {
      objc_msgSend(v17, "objectAtIndexedSubscript:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "unsignedIntegerValue");
      objc_msgSend(v17, "objectAtIndexedSubscript:", ++v30);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "unsignedIntegerValue");

      if (v32 < v34)
      {
        +[MLCLog framework](MLCLog, "framework");
        v19 = objc_claimAutoreleasedReturnValue();
        v16 = v82;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[MLCTensorDescriptor initTensorWithShape:stride:sequenceLengths:sortedSequences:fanIn:fanOut:dataType:].cold.3(v84);
        goto LABEL_57;
      }
      objc_msgSend(v17, "objectAtIndexedSubscript:", v30);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "unsignedIntegerValue");

      v16 = v82;
      if (!v36)
      {
        +[MLCLog framework](MLCLog, "framework");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[MLCTensorDescriptor initTensorWithShape:stride:sequenceLengths:sortedSequences:fanIn:fanOut:dataType:].cold.4(v84, v30, v19);
        goto LABEL_57;
      }
    }
  }
  v39 = objc_msgSend((id)objc_opt_class(), "elementByteCount:", a9);
  if (v39)
  {
    v40 = v39;
    v85.receiver = self;
    v85.super_class = (Class)MLCTensorDescriptor;
    v41 = -[MLCTensorDescriptor init](&v85, sel_init);
    v42 = v41;
    if (v41)
    {
      v41->_dataType = a9;
      v43 = objc_msgSend(v15, "copy");
      shape = v42->_shape;
      v42->_shape = (NSArray *)v43;

      v42->_fanIn = a7;
      v42->_fanOut = a8;
      if (v82)
      {
        v45 = objc_msgSend(v82, "copy");
        stride = v42->_stride;
        v42->_stride = (NSArray *)v45;

      }
      else
      {
        v48 = objc_msgSend(v15, "count", 0, 0, 0, 0);
        if (v48)
        {
          v49 = v48 - 1;
          do
          {
            v80[v49] = v40;
            objc_msgSend(v15, "objectAtIndexedSubscript:", v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v40 *= objc_msgSend(v50, "unsignedIntegerValue");

            --v49;
          }
          while (v49 != -1);
        }
        v51 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
        if (objc_msgSend(v15, "count"))
        {
          v52 = 0;
          do
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v80[v52]);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "addObject:", v53);

            ++v52;
          }
          while (v52 < objc_msgSend(v15, "count"));
        }
        v54 = objc_msgSend(v51, "copy");
        v55 = v42->_stride;
        v42->_stride = (NSArray *)v54;

      }
      v56 = v83;
      if (v17 && v83)
      {
        v42->_variableLengthSequences = 0;
        if ((unint64_t)objc_msgSend(v17, "count") >= 2)
        {
          v57 = 1;
          while (1)
          {
            objc_msgSend(v17, "objectAtIndexedSubscript:", v57);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = objc_msgSend(v58, "unsignedIntegerValue");

            v60 = v57 - 1;
            objc_msgSend(v17, "objectAtIndexedSubscript:", v60);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = objc_msgSend(v61, "unsignedIntegerValue");

            if (v59 != v62)
              break;
            v57 = v60 + 2;
            if (v57 >= objc_msgSend(v17, "count"))
              goto LABEL_60;
          }
          v42->_variableLengthSequences = 1;
        }
LABEL_60:
        v66 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v67 = objc_msgSend(v17, "count");
        objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = objc_msgSend(v68, "unsignedIntegerValue");

        if (v69)
        {
          v70 = 0;
          do
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v67);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSArray setObject:atIndexedSubscript:](v66, "setObject:atIndexedSubscript:", v71, v70);

            ++v70;
            if (v67)
            {
              do
              {
                v72 = v67 - 1;
                objc_msgSend(v17, "objectAtIndexedSubscript:", v67 - 1);
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                v74 = objc_msgSend(v73, "unsignedIntegerValue");

                if (v74 != v70)
                  break;
                --v67;
              }
              while (v72);
            }
            objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            v76 = objc_msgSend(v75, "unsignedIntegerValue");

          }
          while (v70 < v76);
        }
        batchSizePerSequenceStep = v42->_batchSizePerSequenceStep;
        v42->_batchSizePerSequenceStep = v66;
        v64 = v81;
        v56 = v83;
      }
      else
      {
        batchSizePerSequenceStep = v42->_batchSizePerSequenceStep;
        v42->_batchSizePerSequenceStep = 0;
        v64 = v81;
      }

      v42->_sortedSequences = v56;
      objc_storeStrong((id *)&v42->_sequenceLengths, v64);
      -[NSArray objectAtIndexedSubscript:](v42->_stride, "objectAtIndexedSubscript:", 0);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = objc_msgSend(v77, "unsignedIntegerValue");
      -[NSArray objectAtIndexedSubscript:](v42->_shape, "objectAtIndexedSubscript:", 0);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v42->_tensorAllocationSizeInBytes = objc_msgSend(v79, "unsignedIntegerValue") * v78;

    }
    self = v42;
    v47 = self;
  }
  else
  {
    v47 = 0;
  }
  v16 = v82;
LABEL_58:

  return v47;
}

- (id)initConvolutionWeightsDescriptorWithWidth:(unint64_t)a3 height:(unint64_t)a4 inputFeatureChannels:(unint64_t)a5 outputFeatureChannels:(unint64_t)a6 dataType:(int)a7
{
  uint64_t v8;

  LODWORD(v8) = a7;
  return -[MLCTensorDescriptor initNCHWTensorWithWidth:height:featureChannels:batchSize:strideForWidth:strideForHeight:strideForChannel:strideForBatch:fanIn:fanOut:dataType:](self, "initNCHWTensorWithWidth:height:featureChannels:batchSize:strideForWidth:strideForHeight:strideForChannel:strideForBatch:fanIn:fanOut:dataType:", 0, 0, a4 * a3 * a5, a4 * a3 * a6, v8);
}

+ (MLCTensorDescriptor)convolutionWeightsDescriptorWithWidth:(NSUInteger)width height:(NSUInteger)height inputFeatureChannelCount:(NSUInteger)inputFeatureChannelCount outputFeatureChannelCount:(NSUInteger)outputFeatureChannelCount dataType:(MLCDataType)dataType
{
  return (MLCTensorDescriptor *)(id)objc_msgSend(objc_alloc((Class)a1), "initConvolutionWeightsDescriptorWithWidth:height:inputFeatureChannels:outputFeatureChannels:dataType:", width, height, inputFeatureChannelCount, outputFeatureChannelCount, *(_QWORD *)&dataType);
}

+ (MLCTensorDescriptor)convolutionWeightsDescriptorWithInputFeatureChannelCount:(NSUInteger)inputFeatureChannelCount outputFeatureChannelCount:(NSUInteger)outputFeatureChannelCount dataType:(MLCDataType)dataType
{
  return (MLCTensorDescriptor *)(id)objc_msgSend(objc_alloc((Class)a1), "initConvolutionWeightsDescriptorWithWidth:height:inputFeatureChannels:outputFeatureChannels:dataType:", 1, 1, inputFeatureChannelCount, outputFeatureChannelCount, *(_QWORD *)&dataType);
}

+ (MLCTensorDescriptor)convolutionBiasesDescriptorWithFeatureChannelCount:(NSUInteger)featureChannelCount dataType:(MLCDataType)dataType
{
  return (MLCTensorDescriptor *)objc_msgSend((id)objc_opt_class(), "descriptorWithWidth:height:featureChannelCount:batchSize:dataType:", 1, 1, featureChannelCount, 1, *(_QWORD *)&dataType);
}

- (NSUInteger)dimensionCount
{
  void *v2;
  NSUInteger v3;

  -[MLCTensorDescriptor shape](self, "shape");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  NSUInteger v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MLCTensorDescriptor dataType](self, "dataType");
  v7 = -[MLCTensorDescriptor dimensionCount](self, "dimensionCount");
  -[MLCTensorDescriptor shape](self, "shape");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { dataType=%d : numberOfDimensions=%lu : size=%@ : tensorAllocationSizeInBytes=%lu }"), v5, v6, v7, v8, -[MLCTensorDescriptor tensorAllocationSizeInBytes](self, "tensorAllocationSizeInBytes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)updateStride:(id)a3 tensorAllocationSize:(unint64_t)a4
{
  void *v6;
  unint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  if (objc_msgSend(v9, "count"))
  {
    v7 = 0;
    do
    {
      objc_msgSend(v9, "objectAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:atIndexedSubscript:", v8, v7);

      ++v7;
    }
    while (v7 < objc_msgSend(v9, "count"));
  }
  -[MLCTensorDescriptor setStride:](self, "setStride:", v6);
  -[MLCTensorDescriptor setTensorAllocationSizeInBytes:](self, "setTensorAllocationSizeInBytes:", a4);

}

- (unint64_t)elementCount
{
  unint64_t result;
  NSObject *v5;

  switch(-[MLCTensorDescriptor dataType](self, "dataType"))
  {
    case 1:
    case 7:
      result = -[MLCTensorDescriptor tensorAllocationSizeInBytes](self, "tensorAllocationSizeInBytes") >> 2;
      break;
    case 3:
      result = -[MLCTensorDescriptor tensorAllocationSizeInBytes](self, "tensorAllocationSizeInBytes") >> 1;
      break;
    case 4:
    case 6:
    case 8:
    case 9:
      result = -[MLCTensorDescriptor tensorAllocationSizeInBytes](self, "tensorAllocationSizeInBytes");
      break;
    case 5:
      result = -[MLCTensorDescriptor tensorAllocationSizeInBytes](self, "tensorAllocationSizeInBytes") >> 3;
      break;
    default:
      +[MLCLog framework](MLCLog, "framework");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[MLCDeviceGPU multiDeviceTensorReduction:sourceBuffer:targetBuffer:].cold.1(a2);

      result = 0;
      break;
  }
  return result;
}

+ (unint64_t)elementByteCount:(int)a3
{
  int v5;
  NSObject *v6;

  v5 = a3 - 1;
  if ((a3 - 1) < 9 && ((0x1FDu >> v5) & 1) != 0)
    return qword_1D4AB8B88[v5];
  +[MLCLog framework](MLCLog, "framework");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    +[MLCTensorDescriptor elementByteCount:].cold.1(a2, a3, v6);

  return 0;
}

- (unint64_t)elementByteCount
{
  return objc_msgSend((id)objc_opt_class(), "elementByteCount:", -[MLCTensorDescriptor dataType](self, "dataType"));
}

- (BOOL)isFloatingPoint
{
  MLCDataType v2;

  v2 = -[MLCTensorDescriptor dataType](self, "dataType");
  return (v2 > MLCDataTypeCount) | (0x4Eu >> v2) & 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "dataType");
    if (v6 != -[MLCTensorDescriptor dataType](self, "dataType"))
      goto LABEL_18;
    v7 = objc_msgSend(v5, "dimensionCount");
    if (v7 != -[MLCTensorDescriptor dimensionCount](self, "dimensionCount"))
      goto LABEL_18;
    objc_msgSend(v5, "shape");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCTensorDescriptor shape](self, "shape");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToArray:", v9) & 1) != 0)
    {
      objc_msgSend(v5, "stride");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCTensorDescriptor stride](self, "stride");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isEqualToArray:", v11))
      {
        v12 = objc_msgSend(v5, "tensorAllocationSizeInBytes");
        if (v12 == -[MLCTensorDescriptor tensorAllocationSizeInBytes](self, "tensorAllocationSizeInBytes"))
        {
          v13 = objc_msgSend(v5, "sortedSequences");
          v14 = -[MLCTensorDescriptor sortedSequences](self, "sortedSequences");

          if (v13 == v14)
          {
            objc_msgSend(v5, "sequenceLengths");
            v15 = objc_claimAutoreleasedReturnValue();
            if (v15)
            {
              v16 = (void *)v15;
              -[MLCTensorDescriptor sequenceLengths](self, "sequenceLengths");
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if (v17)
              {
                objc_msgSend(v5, "sequenceLengths");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                -[MLCTensorDescriptor sequenceLengths](self, "sequenceLengths");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = objc_msgSend(v18, "isEqualToArray:", v19);

LABEL_11:
                objc_msgSend(v5, "batchSizePerSequenceStep");
                v21 = objc_claimAutoreleasedReturnValue();
                if (v21)
                {
                  v22 = (void *)v21;
                  -[MLCTensorDescriptor batchSizePerSequenceStep](self, "batchSizePerSequenceStep");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v23)
                  {
                    if (v20)
                    {
                      objc_msgSend(v5, "batchSizePerSequenceStep");
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      -[MLCTensorDescriptor batchSizePerSequenceStep](self, "batchSizePerSequenceStep");
                      v25 = (void *)objc_claimAutoreleasedReturnValue();
                      LOBYTE(v20) = objc_msgSend(v24, "isEqualToArray:", v25);

                    }
                    goto LABEL_19;
                  }
                }
                objc_msgSend(v5, "batchSizePerSequenceStep");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v27)
                {
                  -[MLCTensorDescriptor batchSizePerSequenceStep](self, "batchSizePerSequenceStep");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v29)
                    goto LABEL_19;
                  goto LABEL_18;
                }
                goto LABEL_25;
              }
            }
            objc_msgSend(v5, "sequenceLengths");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (v27)
            {
LABEL_25:

              goto LABEL_18;
            }
            -[MLCTensorDescriptor sequenceLengths](self, "sequenceLengths");
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v28)
            {
              v20 = 1;
              goto LABEL_11;
            }
          }
LABEL_18:
          LOBYTE(v20) = 0;
LABEL_19:

          goto LABEL_20;
        }
      }

    }
    goto LABEL_18;
  }
  LOBYTE(v20) = 0;
LABEL_20:

  return v20;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v15;
  unint64_t v16;

  v16 = 0;
  v15 = -[MLCTensorDescriptor dataType](self, "dataType");
  -[MLCTensorDescriptor dimensionCount](self, "dimensionCount");
  -[MLCTensorDescriptor shape](self, "shape");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hash");
  -[MLCTensorDescriptor stride](self, "stride");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hash");
  -[MLCTensorDescriptor tensorAllocationSizeInBytes](self, "tensorAllocationSizeInBytes");
  -[MLCTensorDescriptor sequenceLengths](self, "sequenceLengths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hash");
  -[MLCTensorDescriptor sortedSequences](self, "sortedSequences");
  -[MLCTensorDescriptor batchSizePerSequenceStep](self, "batchSizePerSequenceStep");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hash");
  hashCombine_1(&v16, v7, v8, v9, v10, v11, v12, v13, v15);

  return v16;
}

- (id)newShapeWithCount:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  -[MLCTensorDescriptor shape](self, "shape");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  -[MLCTensorDescriptor shape](self, "shape");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 == a3)
  {
    v10 = objc_msgSend(v8, "copy");

    v5 = (void *)v10;
  }
  else
  {
    v11 = objc_msgSend(v8, "count");

    if (a3)
    {
      v12 = 0;
      v13 = a3 - v11;
      v14 = v11 - a3;
      do
      {
        if (v12 >= v13)
        {
          -[MLCTensorDescriptor shape](self, "shape");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectAtIndexedSubscript:", v14 + v12);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v17, "unsignedIntegerValue");

        }
        else
        {
          v15 = 1;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:atIndexedSubscript:", v18, v12);

        ++v12;
      }
      while (a3 != v12);
    }
  }
  v19 = (void *)objc_msgSend(v5, "copy");

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v13;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[MLCTensorDescriptor shape](self, "shape");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCTensorDescriptor stride](self, "stride");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCTensorDescriptor sequenceLengths](self, "sequenceLengths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MLCTensorDescriptor sortedSequences](self, "sortedSequences");
  v9 = -[MLCTensorDescriptor fanIn](self, "fanIn");
  v10 = -[MLCTensorDescriptor fanOut](self, "fanOut");
  LODWORD(v13) = -[MLCTensorDescriptor dataType](self, "dataType");
  v11 = (void *)objc_msgSend(v4, "initTensorWithShape:stride:sequenceLengths:sortedSequences:fanIn:fanOut:dataType:", v5, v6, v7, v8, v9, v10, v13);

  return v11;
}

- (MLCDataType)dataType
{
  return self->_dataType;
}

- (NSArray)shape
{
  return self->_shape;
}

- (NSArray)stride
{
  return self->_stride;
}

- (void)setStride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSUInteger)tensorAllocationSizeInBytes
{
  return self->_tensorAllocationSizeInBytes;
}

- (void)setTensorAllocationSizeInBytes:(unint64_t)a3
{
  self->_tensorAllocationSizeInBytes = a3;
}

- (NSArray)sequenceLengths
{
  return self->_sequenceLengths;
}

- (BOOL)sortedSequences
{
  return self->_sortedSequences;
}

- (NSArray)batchSizePerSequenceStep
{
  return self->_batchSizePerSequenceStep;
}

- (unint64_t)fanIn
{
  return self->_fanIn;
}

- (unint64_t)fanOut
{
  return self->_fanOut;
}

- (BOOL)variableLengthSequences
{
  return self->_variableLengthSequences;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batchSizePerSequenceStep, 0);
  objc_storeStrong((id *)&self->_sequenceLengths, 0);
  objc_storeStrong((id *)&self->_stride, 0);
  objc_storeStrong((id *)&self->_shape, 0);
}

+ (void)descriptorWithShape:(const char *)a1 sequenceLengths:sortedSequences:dataType:.cold.1(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: sequenceLengths is empty", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

+ (void)descriptorWithShape:(const char *)a1 sequenceLengths:sortedSequences:dataType:.cold.2(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: sequenceLengths can only be used for 3D tensors for TNC/NTC layout or 4D tensor with NC1W layout", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

+ (void)descriptorWithShape:(const char *)a1 sequenceLengths:sortedSequences:dataType:.cold.3(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: unsorted sequences are not supported", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initTensorWithShape:(const char *)a1 stride:sequenceLengths:sortedSequences:fanIn:fanOut:dataType:.cold.2(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: sequenceLengths[0] has a non-positive value", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initTensorWithShape:(const char *)a1 stride:sequenceLengths:sortedSequences:fanIn:fanOut:dataType:.cold.3(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: sequenceLengths is not sorted in descending order", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initTensorWithShape:(NSObject *)a3 stride:sequenceLengths:sortedSequences:fanIn:fanOut:dataType:.cold.4(const char *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  v7 = 2048;
  v8 = a2;
  _os_log_error_impl(&dword_1D4999000, a3, OS_LOG_TYPE_ERROR, "%@: sequenceLengths[%lu] has a non-positive value", v6, 0x16u);

  OUTLINED_FUNCTION_4_1();
}

- (void)initTensorWithShape:(const char *)a1 stride:sequenceLengths:sortedSequences:fanIn:fanOut:dataType:.cold.5(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: the number of elements in sequenceLengths does not match batchSize", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initTensorWithShape:(const char *)a1 stride:sequenceLengths:sortedSequences:fanIn:fanOut:dataType:.cold.6(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: Unsorted seqeunces are not supported", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

+ (void)elementByteCount:(NSObject *)a3 .cold.1(const char *a1, int a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  v7 = 1024;
  v8 = a2;
  _os_log_error_impl(&dword_1D4999000, a3, OS_LOG_TYPE_ERROR, "%@: Unsupported dataType=%d", v6, 0x12u);

  OUTLINED_FUNCTION_4_1();
}

@end
