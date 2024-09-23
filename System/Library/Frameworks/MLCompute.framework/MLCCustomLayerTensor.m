@implementation MLCCustomLayerTensor

+ (id)customLayerTensorWithDescriptor:(id)a3 gpuBuffer:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTensorDescriptor:cpuBuffer:gpuBuffer:", v7, 0, v6);

  return v8;
}

+ (id)customLayerTensorWithDescriptor:(id)a3 cpuBuffer:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTensorDescriptor:cpuBuffer:gpuBuffer:", v7, v6, 0);

  return v8;
}

- (MLCCustomLayerTensor)initWithTensorDescriptor:(id)a3 cpuBuffer:(id)a4 gpuBuffer:(id)a5
{
  id v9;
  id v10;
  id v11;
  MLCCustomLayerTensor *v12;
  MLCCustomLayerTensor *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MLCCustomLayerTensor;
  v12 = -[MLCCustomLayerTensor init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_descriptor, a3);
    objc_storeStrong((id *)&v13->_cpuBuffer, a4);
    objc_storeStrong(&v13->_gpuBuffer, a5);
  }

  return v13;
}

- (MLCTensorData)hostData
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[MLCCustomLayerTensor cpuBuffer](self, "cpuBuffer");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = objc_msgSend(v3, "bytes");
  -[MLCCustomLayerTensor cpuBuffer](self, "cpuBuffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCTensorData dataWithBytesNoCopy:length:](MLCTensorData, "dataWithBytesNoCopy:length:", v4, objc_msgSend(v5, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (MLCTensorData *)v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCCustomLayerTensor descriptor](self, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCCustomLayerTensor cpuBuffer](self, "cpuBuffer");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = objc_msgSend(v7, "bytes");
  -[MLCCustomLayerTensor gpuBuffer](self, "gpuBuffer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { tensorDescriptor=%@ : cpuBuffer=%@ : gpuBuffer=%@}"), v5, v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[MLCCustomLayerTensor descriptor](self, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCCustomLayerTensor cpuBuffer](self, "cpuBuffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCCustomLayerTensor gpuBuffer](self, "gpuBuffer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithTensorDescriptor:cpuBuffer:gpuBuffer:", v5, v6, v7);

  return v8;
}

- (MLCTensorDescriptor)descriptor
{
  return self->_descriptor;
}

- (NSData)cpuBuffer
{
  return self->_cpuBuffer;
}

- (void)setCpuBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_cpuBuffer, a3);
}

- (id)gpuBuffer
{
  return self->_gpuBuffer;
}

- (void)setGpuBuffer:(id)a3
{
  objc_storeStrong(&self->_gpuBuffer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_gpuBuffer, 0);
  objc_storeStrong((id *)&self->_cpuBuffer, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end
