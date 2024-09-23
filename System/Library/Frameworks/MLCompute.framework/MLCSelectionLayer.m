@implementation MLCSelectionLayer

+ (MLCSelectionLayer)layer
{
  return (MLCSelectionLayer *)objc_alloc_init((Class)a1);
}

- (MLCSelectionLayer)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MLCSelectionLayer;
  return -[MLCLayer initWithLabel:](&v3, sel_initWithLabel_, CFSTR("Selection"));
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  char v16;
  void *v17;
  NSObject *v18;
  void *v19;
  char v20;
  NSObject *v21;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v10)
  {
    +[MLCLog framework](MLCLog, "framework");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[MLCSelectionLayer compileForDevice:sourceTensors:resultTensor:].cold.1(a2);
    goto LABEL_18;
  }
  if (objc_msgSend(v10, "count") != 3)
  {
    +[MLCLog framework](MLCLog, "framework");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[MLCSelectionLayer compileForDevice:sourceTensors:resultTensor:].cold.4(a2);
    goto LABEL_18;
  }
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "descriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "dataType");

  if (v14 != 4)
  {
    +[MLCLog framework](MLCLog, "framework");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[MLCSelectionLayer compileForDevice:sourceTensors:resultTensor:].cold.3(a2);
    goto LABEL_18;
  }
  objc_msgSend(v9, "computeEngine");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) == 0)
  {
    v18 = 0;
LABEL_15:
    +[MLCLog framework](MLCLog, "framework");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[MLCScatterLayer compileForDevice:sourceTensors:resultTensor:].cold.2(a2, (uint64_t)v18, v21);

LABEL_18:
    v20 = 0;
    goto LABEL_19;
  }
  objc_msgSend(v9, "computeEngine");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "selectLayer");
  v18 = objc_claimAutoreleasedReturnValue();

  if (!v18 || !-[NSObject count](v18, "count"))
    goto LABEL_15;
  objc_msgSend(v9, "computeEngine");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "compileLayerDeviceOps:sourceTensors:resultTensor:", v18, v10, v11);

  v23.receiver = self;
  v23.super_class = (Class)MLCSelectionLayer;
  -[MLCLayer bindDevice:deviceOps:](&v23, sel_bindDevice_deviceOps_, v9, v18);
LABEL_19:

  return v20;
}

- (id)resultTensorFromSources:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *context;
  objc_super v20;
  objc_super v21;
  objc_super v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  context = (void *)MEMORY[0x1D8263D2C]();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "dataType");

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v9;
  objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22.receiver = self;
  v22.super_class = (Class)MLCSelectionLayer;
  -[MLCLayer resultTensorsFromBroadcastableSources:resultTensorDataType:](&v22, sel_resultTensorsFromBroadcastableSources_resultTensorDataType_, v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:atIndexedSubscript:", v12, 0);

  objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v13;
  objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)MLCSelectionLayer;
  -[MLCLayer resultTensorsFromBroadcastableSources:resultTensorDataType:](&v21, sel_resultTensorsFromBroadcastableSources_resultTensorDataType_, v15, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:atIndexedSubscript:", v16, 1);

  v20.receiver = self;
  v20.super_class = (Class)MLCSelectionLayer;
  -[MLCLayer resultTensorsFromBroadcastableSources:resultTensorDataType:](&v20, sel_resultTensorsFromBroadcastableSources_resultTensorDataType_, v8, v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(context);
  return v17;
}

- (BOOL)isSupportedShapeForTensorSources:(id)a3
{
  return 1;
}

+ (BOOL)supportsDataType:(int)a3 onDevice:(id)a4
{
  return a3 == 1 || a3 == 4;
}

- (id)description
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)summarizedDOTDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\"></FONT>>"), v5, -[MLCLayer layerID](self, "layerID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.1(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: no source tensors specified", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.3(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: data type for the condition tensor must be BOOLean", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.4(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: source tensors count must be 3", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

@end
