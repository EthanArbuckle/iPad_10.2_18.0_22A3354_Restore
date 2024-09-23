@implementation _MLCANEWeightOps

+ (id)hexStringForData:(id)a3
{
  id v3;
  unsigned __int8 *v4;
  void *v5;
  void *v6;
  uint64_t i;
  unsigned __int8 md[32];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(a3);
  v4 = CC_SHA256((const void *)objc_msgSend(v3, "bytes"), objc_msgSend(v3, "length"), md);
  v5 = (void *)MEMORY[0x1D8263D2C](v4);
  v6 = (void *)objc_msgSend(&stru_1E9821EC0, "mutableCopy");
  for (i = 0; i != 32; ++i)
    objc_msgSend(v6, "appendFormat:", CFSTR("%02X"), md[i]);
  objc_autoreleasePoolPop(v5);

  return v6;
}

- (_MLCANEWeightOps)init
{
  _MLCANEWeightOps *v2;
  void *v3;
  uint64_t v4;
  NSMutableDictionary *weights;
  uint64_t v6;
  NSMutableArray *weightFiles;
  uint64_t v8;
  NSMutableDictionary *weightFileIndexMap;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  uint64_t v16;
  NSMutableDictionary *constantTensorMap;
  objc_super v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)_MLCANEWeightOps;
  v2 = -[_MLCANEWeightOps init](&v19, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0C9AA70];
    v4 = objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
    weights = v2->_weights;
    v2->_weights = (NSMutableDictionary *)v4;

    v6 = objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    weightFiles = v2->_weightFiles;
    v2->_weightFiles = (NSMutableArray *)v6;

    v8 = objc_msgSend(v3, "mutableCopy");
    weightFileIndexMap = v2->_weightFileIndexMap;
    v2->_weightFileIndexMap = (NSMutableDictionary *)v8;

    v10 = -[NSMutableDictionary count](v2->_weights, "count");
    objc_msgSend(kMLCANEWeightFileNamePrefix, "stringByAppendingFormat:", CFSTR("%lu"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v11;
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v2->_weights;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v13, v15);

    -[NSMutableArray addObject:](v2->_weightFiles, "addObject:", v11);
    v16 = objc_msgSend(v3, "mutableCopy");
    constantTensorMap = v2->_constantTensorMap;
    v2->_constantTensorMap = (NSMutableDictionary *)v16;

  }
  return v2;
}

- (BOOL)convertAndComputHashWithWeightData:(id)a3 weightDataType:(int)a4 hash:(id *)a5 convertedData:(id *)a6
{
  id v10;
  void *v11;
  id v12;
  BOOL v13;
  size_t v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;

  v10 = a3;
  v11 = v10;
  if (a4 > 9)
    goto LABEL_10;
  v12 = v10;
  if (((1 << a4) & 0x348) != 0)
  {
LABEL_3:
    objc_msgSend((id)objc_opt_class(), "hexStringForData:", v12);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_retainAutorelease(v12);
    *a6 = v12;
    v13 = 1;
    goto LABEL_4;
  }
  if (a4 == 1)
  {
    v15 = (unint64_t)objc_msgSend(v10, "length") >> 1;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_malloc(v15, 0xAF7DF5EFuLL), v15, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (unint64_t)objc_msgSend(v11, "length") >> 2;
    v18 = objc_msgSend(objc_retainAutorelease(v11), "bytes");
    v12 = objc_retainAutorelease(v16);
    if (+[MLCDataHelper convertFp32toFp16:fp32Values:fp16Values:](MLCDataHelper, "convertFp32toFp16:fp32Values:fp16Values:", v17, v18, objc_msgSend(v12, "bytes")))
    {
      goto LABEL_3;
    }
    +[MLCLog framework](MLCLog, "framework");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[_MLCANEWeightOps convertAndComputHashWithWeightData:weightDataType:hash:convertedData:].cold.2(a2);

    v13 = 0;
  }
  else
  {
LABEL_10:
    +[MLCLog framework](MLCLog, "framework");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[_MLCANEWeightOps convertAndComputHashWithWeightData:weightDataType:hash:convertedData:].cold.1(a2, a4, v20);

    v13 = 0;
    v12 = v11;
  }
LABEL_4:

  return v13;
}

- (unint64_t)addWeightData:(id)a3 hash:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  id v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v24[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "length"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MLCANEWeightOps weightFileIndexMap](self, "weightFileIndexMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[_MLCANEWeightOps weightFileIndexMap](self, "weightFileIndexMap");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "unsignedIntegerValue");
  }
  else
  {
    -[_MLCANEWeightOps weights](self, "weights");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v15, "count");

    objc_msgSend(kMLCANEWeightFileNamePrefix, "stringByAppendingFormat:", CFSTR("%lu"), v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MLCANEWeightOps weightFileIndexMap](self, "weightFileIndexMap");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v9);

    v22 = v12;
    v23 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MLCANEWeightOps weights](self, "weights");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, v20);

    -[_MLCANEWeightOps weightFiles](self, "weightFiles");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v12);
  }

  return v14;
}

- (unint64_t)addWeightData:(id)a3 weightDataType:(int)a4
{
  BOOL v6;
  id v7;
  id v8;
  unint64_t v9;
  NSObject *v10;
  id v12;
  id v13;

  v12 = 0;
  v13 = 0;
  v6 = -[_MLCANEWeightOps convertAndComputHashWithWeightData:weightDataType:hash:convertedData:](self, "convertAndComputHashWithWeightData:weightDataType:hash:convertedData:", a3, *(_QWORD *)&a4, &v13, &v12);
  v7 = v13;
  v8 = v12;
  if (v6)
  {
    v9 = -[_MLCANEWeightOps addWeightData:hash:](self, "addWeightData:hash:", v8, v7);
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[_MLCANEWeightOps addWeightData:weightDataType:].cold.1(a2);

    v9 = -1;
  }

  return v9;
}

- (id)queryConstantTensor:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v21;
  id v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = 0;
  v8 = -[_MLCANEWeightOps convertAndComputHashWithWeightData:weightDataType:hash:convertedData:](self, "convertAndComputHashWithWeightData:weightDataType:hash:convertedData:", v6, objc_msgSend(v7, "dataType"), &v22, &v21);
  v9 = v22;
  v10 = v21;

  if (v8)
  {
    v24[0] = v9;
    objc_msgSend(v5, "descriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v12 = objc_claimAutoreleasedReturnValue();

    -[_MLCANEWeightOps constantTensorMap](self, "constantTensorMap");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[_MLCANEWeightOps constantTensorMap](self, "constantTensorMap");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v14)
    {
      objc_msgSend(v15, "objectForKeyedSubscript:", v12);
      v17 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v5, v12);

      v23[0] = v9;
      v23[1] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deviceMemory");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:atIndexedSubscript:", v18, objc_msgSend(v5, "deviceIndex"));

      v17 = v5;
    }
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[_MLCANEWeightOps queryConstantTensor:].cold.1(a2, (uint64_t)v5, v12);
    v17 = 0;
  }

  return v17;
}

- (void)reset
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1D8263D2C](self, a2);
  -[_MLCANEWeightOps weights](self, "weights");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[_MLCANEWeightOps weightFiles](self, "weightFiles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[_MLCANEWeightOps weightFileIndexMap](self, "weightFileIndexMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  -[_MLCANEWeightOps constantTensorMap](self, "constantTensorMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

  objc_autoreleasePoolPop(v3);
}

- (NSMutableDictionary)weights
{
  return self->_weights;
}

- (NSMutableArray)weightFiles
{
  return self->_weightFiles;
}

- (NSMutableDictionary)weightFileIndexMap
{
  return self->_weightFileIndexMap;
}

- (NSMutableDictionary)constantTensorMap
{
  return self->_constantTensorMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constantTensorMap, 0);
  objc_storeStrong((id *)&self->_weightFileIndexMap, 0);
  objc_storeStrong((id *)&self->_weightFiles, 0);
  objc_storeStrong((id *)&self->_weights, 0);
}

- (void)convertAndComputHashWithWeightData:(NSObject *)a3 weightDataType:hash:convertedData:.cold.1(const char *a1, int a2, NSObject *a3)
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
  _os_log_error_impl(&dword_1D4999000, a3, OS_LOG_TYPE_ERROR, "%@: unsupported data type=%d", v6, 0x12u);

  OUTLINED_FUNCTION_4_1();
}

- (void)convertAndComputHashWithWeightData:(const char *)a1 weightDataType:hash:convertedData:.cold.2(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: failed to convert FP32 data", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)addWeightData:(const char *)a1 weightDataType:.cold.1(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: failed to convert and compute hash with weights data", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)queryConstantTensor:(NSObject *)a3 .cold.1(const char *a1, uint64_t a2, NSObject *a3)
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
  v7 = 2112;
  v8 = a2;
  _os_log_error_impl(&dword_1D4999000, a3, OS_LOG_TYPE_ERROR, "%@: failed to convert and compute hash with the data of constant tensor=%@", v6, 0x16u);

  OUTLINED_FUNCTION_4_1();
}

@end
