@implementation MLCTensorParameter

+ (MLCTensorParameter)parameterWithTensor:(MLCTensor *)tensor
{
  MLCTensor *v4;
  void *v5;

  v4 = tensor;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTensor:optimizerData:", v4, 0);

  return (MLCTensorParameter *)v5;
}

+ (MLCTensorParameter)parameterWithTensor:(MLCTensor *)tensor optimizerData:(NSArray *)optimizerData
{
  NSArray *v6;
  MLCTensor *v7;
  void *v8;

  v6 = optimizerData;
  v7 = tensor;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTensor:optimizerData:", v7, v6);

  return (MLCTensorParameter *)v8;
}

- (MLCTensorParameter)initWithTensor:(id)a3 optimizerData:(id)a4
{
  id v7;
  id v8;
  MLCTensorParameter *v9;
  MLCTensorParameter *v10;
  void *v11;
  MLCDevice *device;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MLCTensorParameter;
  v9 = -[MLCTensorParameter init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tensor, a3);
    if (v8)
    {
      v11 = (void *)objc_msgSend(v8, "copy");
      objc_msgSend(v7, "setOptimizerData:", v11);

    }
    device = v10->_device;
    v10->_device = 0;

    v10->_isUpdatable = 1;
  }

  return v10;
}

- (BOOL)allocateDataForOptimizer:(id)a3 device:(id)a4 isVector:(BOOL)a5
{
  uint64_t v5;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  size_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  BOOL v40;
  NSObject *v41;
  const char *v43;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v11 = objc_msgSend(v9, "numOptimizerDataBuffers");
  -[MLCTensorParameter tensor](self, "tensor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "optimizerData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (!v14)
  {
    v43 = a2;
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    -[MLCTensorParameter tensor](self, "tensor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "descriptor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "tensorAllocationSizeInBytes");

    if (v11)
    {
      v19 = 0;
      v20 = v18 >> 2;
      v21 = v18 & 0xFFFFFFFFFFFFFFFCLL;
      do
      {
        +[MLCTensorData dataWithBytesNoCopy:length:freeWhenDone:](MLCTensorData, "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc(v20, 4uLL, 0x100004052888210uLL), v21, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:atIndexedSubscript:", v22, v19);

        ++v19;
      }
      while (v11 != v19);
    }
    v23 = (void *)objc_msgSend(v15, "copy");
    -[MLCTensorParameter tensor](self, "tensor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setOptimizerData:", v23);

    a2 = v43;
    v5 = v5;
  }
  -[MLCTensorParameter tensor](self, "tensor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "optimizerDeviceData");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = (void *)v26;
    -[MLCTensorParameter tensor](self, "tensor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "optimizerDeviceData");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "count");

    if (v30)
    {
      -[MLCTensorParameter device](self, "device");
      v31 = objc_claimAutoreleasedReturnValue();
      if (!v31
        || (v32 = (void *)v31,
            -[MLCTensorParameter device](self, "device"),
            v33 = (id)objc_claimAutoreleasedReturnValue(),
            v33,
            v32,
            v33 == v10))
      {
        -[MLCTensorParameter setDevice:](self, "setDevice:", v10);
LABEL_15:
        v40 = 1;
        goto LABEL_19;
      }
    }
  }
  else
  {

  }
  objc_msgSend(v10, "computeEngine");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCTensorParameter tensor](self, "tensor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCTensorParameter tensor](self, "tensor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "optimizerData");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "createOptimizerDeviceDataForTensor:optimizer:optimizerData:isVector:", v35, v9, v37, v5);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38 && objc_msgSend(v38, "count"))
  {
    -[MLCTensorParameter setDevice:](self, "setDevice:", v10);
    -[MLCTensorParameter tensor](self, "tensor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setOptimizerDeviceData:", v38);

    goto LABEL_15;
  }
  +[MLCLog framework](MLCLog, "framework");
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    -[MLCTensorParameter allocateDataForOptimizer:device:isVector:].cold.1(a2, (uint64_t)v38, v41);

  v40 = 0;
LABEL_19:

  return v40;
}

- (MLCTensor)tensor
{
  return self->_tensor;
}

- (BOOL)isUpdatable
{
  return self->_isUpdatable;
}

- (void)setIsUpdatable:(BOOL)isUpdatable
{
  self->_isUpdatable = isUpdatable;
}

- (MLCDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_tensor, 0);
}

- (void)allocateDataForOptimizer:(const char *)a1 device:(uint64_t)a2 isVector:(NSObject *)a3 .cold.1(const char *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_1D4999000, a3, OS_LOG_TYPE_ERROR, "%@: failure to create deviceParameter=%@", (uint8_t *)&v6, 0x16u);

}

@end
