@implementation MLCDeviceGPUHeapAllocator

- (id)imageForCommandBuffer:(id)a3 imageDescriptor:(id)a4 kernel:(id)a5
{
  id v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;

  v7 = a4;
  v8 = -[MLCDeviceGPUHeapAllocator resourceOffset](self, "resourceOffset");
  v9 = objc_msgSend(v7, "featureChannels");
  v10 = 125;
  if (v9 == 2)
    v10 = 105;
  if (v9 == 1)
    v11 = 55;
  else
    v11 = v10;
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v11, objc_msgSend(v7, "width"), objc_msgSend(v7, "height"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v7, "featureChannels") <= 4)
    v13 = 2;
  else
    v13 = 3;
  objc_msgSend(v12, "setTextureType:", v13);
  objc_msgSend(v12, "setArrayLength:", (unint64_t)(objc_msgSend(v7, "featureChannels") + 3) >> 2);
  objc_msgSend(v12, "setStorageMode:", 2);
  objc_msgSend(v12, "setUsage:", 3);
  -[MLCDeviceGPUHeapAllocator heap](self, "heap");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "newTextureWithDescriptor:offset:", v12, v8);

  v16 = objc_alloc(MEMORY[0x1E0CC6DF0]);
  v17 = objc_msgSend(v7, "featureChannels");

  v18 = (void *)objc_msgSend(v16, "initWithTexture:featureChannels:", v15, v17);
  if (!v18)
  {
    +[MLCLog framework](MLCLog, "framework");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[MLCDeviceGPUHeapAllocator imageForCommandBuffer:imageDescriptor:kernel:].cold.1(a2, v19);

  }
  v20 = -[MLCDeviceGPUHeapAllocator resourceOffset](self, "resourceOffset");
  v21 = -[MLCDeviceGPUHeapAllocator resourceSize](self, "resourceSize");
  if (v20 == (-[MLCDeviceGPUHeapAllocator numResources](self, "numResources") - 1) * v21)
  {
    v22 = 0;
  }
  else
  {
    v23 = -[MLCDeviceGPUHeapAllocator resourceSize](self, "resourceSize");
    v22 = -[MLCDeviceGPUHeapAllocator resourceOffset](self, "resourceOffset") + v23;
  }
  -[MLCDeviceGPUHeapAllocator setResourceOffset:](self, "setResourceOffset:", v22);

  return v18;
}

- (id)imageBatchForCommandBuffer:(id)a3 imageDescriptor:(id)a4 kernel:(id)a5 count:(unint64_t)a6
{
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  void *v31;
  id v32;
  NSObject *v33;
  unint64_t v36;
  void *v37;
  id v38;
  unint64_t v39;

  v38 = a4;
  v37 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v8 = -[MLCDeviceGPUHeapAllocator resourceOffset](self, "resourceOffset");
  v36 = a6;
  if (a6)
  {
    v9 = v8;
    v10 = 0;
    v11 = 125;
    while (1)
    {
      v12 = objc_msgSend(v38, "featureChannels");
      v13 = 55;
      if (v12 != 1)
        v13 = v11;
      v14 = v12 == 2 ? 105 : v13;
      objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v14, objc_msgSend(v38, "width"), objc_msgSend(v38, "height"), 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (unint64_t)objc_msgSend(v38, "featureChannels") <= 4 ? 2 : 3;
      objc_msgSend(v15, "setTextureType:", v16);
      objc_msgSend(v15, "setArrayLength:", (unint64_t)(objc_msgSend(v38, "featureChannels") + 3) >> 2);
      objc_msgSend(v15, "setStorageMode:", 2);
      objc_msgSend(v15, "setUsage:", 3);
      -[MLCDeviceGPUHeapAllocator heap](self, "heap");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v17, "newTextureWithDescriptor:offset:", v15, v9);

      v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC6DF0]), "initWithTexture:featureChannels:", v18, objc_msgSend(v38, "featureChannels"));
      if (!v19)
        break;
      v20 = (void *)v19;
      objc_msgSend(v37, "addObject:", v19);
      -[MLCDeviceGPUHeapAllocator heap](self, "heap");
      v39 = v9;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "device");
      v22 = v14;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "heapTextureSizeAndAlignWithDescriptor:", v15);
      v26 = v25;

      v11 = v22;
      v9 = v39 + (v24 + v26 - 1) / v26 * v26;

      if (v36 == ++v10)
        goto LABEL_13;
    }
    +[MLCLog framework](MLCLog, "framework");
    v33 = objc_claimAutoreleasedReturnValue();
    v31 = v37;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[MLCDeviceGPUHeapAllocator imageBatchForCommandBuffer:imageDescriptor:kernel:count:].cold.1(a2);

    v32 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
LABEL_13:
    v27 = -[MLCDeviceGPUHeapAllocator resourceOffset](self, "resourceOffset");
    v28 = -[MLCDeviceGPUHeapAllocator resourceSize](self, "resourceSize");
    if (v27 == (-[MLCDeviceGPUHeapAllocator numResources](self, "numResources") - 1) * v28)
    {
      v29 = 0;
    }
    else
    {
      v30 = -[MLCDeviceGPUHeapAllocator resourceSize](self, "resourceSize");
      v29 = -[MLCDeviceGPUHeapAllocator resourceOffset](self, "resourceOffset") + v30;
    }
    v31 = v37;
    -[MLCDeviceGPUHeapAllocator setResourceOffset:](self, "setResourceOffset:", v29);
    v32 = v37;
  }

  return v32;
}

- (id)allocateBuffer:(unint64_t)a3
{
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  NSObject *v11;
  unint64_t v12;
  id v13;

  -[MLCDeviceGPUHeapAllocator heap](self, "heap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "newBufferWithLength:options:offset:", a3, 544, -[MLCDeviceGPUHeapAllocator resourceOffset](self, "resourceOffset"));

  if (v7)
  {
    v8 = -[MLCDeviceGPUHeapAllocator resourceOffset](self, "resourceOffset");
    v9 = -[MLCDeviceGPUHeapAllocator resourceSize](self, "resourceSize");
    if (v8 == (-[MLCDeviceGPUHeapAllocator numResources](self, "numResources") - 1) * v9)
    {
      v10 = 0;
    }
    else
    {
      v12 = -[MLCDeviceGPUHeapAllocator resourceSize](self, "resourceSize");
      v10 = -[MLCDeviceGPUHeapAllocator resourceOffset](self, "resourceOffset") + v12;
    }
    -[MLCDeviceGPUHeapAllocator setResourceOffset:](self, "setResourceOffset:", v10);
    v13 = v7;
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[MLCDeviceGPUHeapAllocator allocateBuffer:].cold.1(a2);

  }
  return v7;
}

- (MLCDeviceGPUHeapAllocator)initWithDevice:(id)a3 heapSize:(unint64_t)a4 resourceSize:(unint64_t)a5 numResources:(unint64_t)a6
{
  id v10;
  MLCDeviceGPUHeapAllocator *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MLCDeviceGPUHeapAllocator;
  v11 = -[MLCDeviceGPUHeapAllocator init](&v15, sel_init);
  if (v11)
  {
    v12 = (void *)objc_opt_new();
    objc_msgSend(v12, "setType:", 1);
    objc_msgSend(v12, "setCpuCacheMode:", 0);
    objc_msgSend(v12, "setStorageMode:", 2);
    objc_msgSend(v12, "setHazardTrackingMode:", 2);
    objc_msgSend(v12, "setSize:", a4);
    v13 = (void *)objc_msgSend(v10, "newHeapWithDescriptor:", v12);
    if (v13)
      objc_storeStrong((id *)&v11->_heap, v13);
    v11->_heapSize = a4;
    v11->_resourceSize = a5;
    v11->_resourceOffset = 0;
    v11->_numResources = a6;

  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[MLCDeviceGPUHeapAllocator heap](self, "heap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithDevice:heapSize:resourceSize:numResources:", v6, -[MLCDeviceGPUHeapAllocator heapSize](self, "heapSize"), -[MLCDeviceGPUHeapAllocator resourceSize](self, "resourceSize"), -[MLCDeviceGPUHeapAllocator numResources](self, "numResources"));

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

- (MLCDeviceGPUHeapAllocator)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("heapSize"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("resourceSize"));
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("numResources"));

  return -[MLCDeviceGPUHeapAllocator initWithDevice:heapSize:resourceSize:numResources:](self, "initWithDevice:heapSize:resourceSize:numResources:", 0, v5, v6, v7);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[MLCDeviceGPUHeapAllocator heapSize](self, "heapSize"), CFSTR("heapSize"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[MLCDeviceGPUHeapAllocator resourceSize](self, "resourceSize"), CFSTR("resourceSize"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[MLCDeviceGPUHeapAllocator numResources](self, "numResources"), CFSTR("numResources"));

}

- (MTLHeap)heap
{
  return self->_heap;
}

- (unint64_t)heapSize
{
  return self->_heapSize;
}

- (unint64_t)resourceSize
{
  return self->_resourceSize;
}

- (unint64_t)resourceOffset
{
  return self->_resourceOffset;
}

- (void)setResourceOffset:(unint64_t)a3
{
  self->_resourceOffset = a3;
}

- (unint64_t)numResources
{
  return self->_numResources;
}

- (BOOL)isDebuggingEnabled
{
  return self->_isDebuggingEnabled;
}

- (void)setIsDebuggingEnabled:(BOOL)a3
{
  self->_isDebuggingEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heap, 0);
}

- (void)imageForCommandBuffer:(const char *)a1 imageDescriptor:(NSObject *)a2 kernel:.cold.1(const char *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1D4999000, a2, OS_LOG_TYPE_ERROR, "%@: Error allocating on MPSImage", (uint8_t *)&v4, 0xCu);

}

- (void)imageBatchForCommandBuffer:(const char *)a1 imageDescriptor:kernel:count:.cold.1(const char *a1)
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
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: Error allocating on MPSImage %lu", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)allocateBuffer:(const char *)a1 .cold.1(const char *a1)
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
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: Error allocating MTLBuffer from temporary heap of size %lu bytes", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

@end
