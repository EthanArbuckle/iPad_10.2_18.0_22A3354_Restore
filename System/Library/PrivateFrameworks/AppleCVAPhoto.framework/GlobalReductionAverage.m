@implementation GlobalReductionAverage

- (GlobalReductionAverage)initWithDevice:(id)a3 library:(id)a4 pipelineLibrary:(id)a5 textureSize:(CGSize)a6
{
  double height;
  double width;
  id v12;
  id v13;
  id v14;
  GlobalReductionAverage *v15;
  MTLComputePipelineState *parallelReductionAverageSimd;
  unint64_t v17;
  unint64_t v18;
  GlobalReductionAverage *v19;
  float v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  uint64_t v29;
  NSArray *simdTextures;
  id v32;
  objc_super v33;

  height = a6.height;
  width = a6.width;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v33.receiver = self;
  v33.super_class = (Class)GlobalReductionAverage;
  v15 = -[GlobalReductionAverage init](&v33, sel_init);
  if (v15 && (objc_msgSend(v12, "supportsFamily:", 1007) & 1) != 0)
  {
    objc_storeStrong((id *)&v15->_device, a3);
    objc_storeStrong((id *)&v15->_library, a4);
    objc_storeStrong((id *)&v15->_pipelineLibrary, a5);
    v15->_textureSize.width = width;
    v15->_textureSize.height = height;
    sub_1B5674B88((void **)&v15->_parallelReductionAverageSimd, v15->_library, v15->_pipelineLibrary, v15->_device, CFSTR("parallelReductionAverageSimd"), 0, 0);
    parallelReductionAverageSimd = v15->_parallelReductionAverageSimd;
    v32 = v13;
    if (width <= height)
    {
      v18 = (unint64_t)-[MTLComputePipelineState threadExecutionWidth](parallelReductionAverageSimd, "threadExecutionWidth") >> 2;
      v17 = 4;
    }
    else
    {
      v17 = (unint64_t)-[MTLComputePipelineState threadExecutionWidth](parallelReductionAverageSimd, "threadExecutionWidth") >> 2;
      v18 = 4;
    }
    v15->_simdReductionThreadsPerGroup.width = v17;
    v15->_simdReductionThreadsPerGroup.height = v18;
    v15->_simdReductionThreadsPerGroup.depth = 1;
    v20 = width * height;
    v15->_numberOfElements = v20;
    v21 = (void *)objc_opt_new();
    v22 = (unint64_t)width;
    v23 = (unint64_t)height;
    v24 = 2 * v15->_simdReductionThreadsPerGroup.width;
    v25 = 2 * v15->_simdReductionThreadsPerGroup.height;
    if (v24 < (unint64_t)width || v25 < v23)
    {
      do
      {
        v22 = (int)vcvtps_s32_f32((float)v22 / (float)v24);
        v23 = (int)vcvtps_s32_f32((float)v23 / (float)v25);
        objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 25, v22, v23, 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setUsage:", 19);
        objc_msgSend(v26, "setResourceOptions:", 0);
        v27 = (void *)-[MTLDeviceSPI newTextureWithDescriptor:](v15->_device, "newTextureWithDescriptor:", v26);
        objc_msgSend(v21, "addObject:", v27);

        v24 = 2 * v15->_simdReductionThreadsPerGroup.width;
        v25 = 2 * v15->_simdReductionThreadsPerGroup.height;
      }
      while (v24 < v22 || v25 < v23);
    }
    v29 = objc_msgSend(v21, "copy");
    simdTextures = v15->_simdTextures;
    v15->_simdTextures = (NSArray *)v29;

    v19 = v15;
    v13 = v32;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)parallelReductionAverage:(id)a3 inTexture:(id)a4 outGlobalAverage:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t i;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  double width;
  double height;
  id v19;
  void *v20;
  __int128 v21;
  unint64_t depth;
  _QWORD v23[3];
  uint8_t buf[4];
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v8 = a4;
  v9 = a5;
  if ((objc_msgSend(v8, "width") != (int)self->_textureSize.width
     || objc_msgSend(v8, "height") != (int)self->_textureSize.height)
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    width = self->_textureSize.width;
    height = self->_textureSize.height;
    *(_DWORD *)buf = 67109888;
    v25 = (int)width;
    v26 = 1024;
    v27 = (int)height;
    v28 = 1024;
    v29 = objc_msgSend(v8, "width");
    v30 = 1024;
    v31 = objc_msgSend(v8, "height");
    _os_log_error_impl(&dword_1B5656000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "TextureSize does not mathc input, expected w:%i h:%i got w:%i h:%i", buf, 0x1Au);
  }
  objc_msgSend(v19, "computeCommandEncoder", v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i <= -[NSArray count](self->_simdTextures, "count"); ++i)
  {
    if (i)
    {
      -[NSArray objectAtIndexedSubscript:](self->_simdTextures, "objectAtIndexedSubscript:", i - 1);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = v8;
    }
    v13 = v12;
    if (i == -[NSArray count](self->_simdTextures, "count"))
    {
      v14 = 0;
    }
    else
    {
      -[NSArray objectAtIndexedSubscript:](self->_simdTextures, "objectAtIndexedSubscript:", i);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15 = objc_msgSend(v13, "width");
    v16 = objc_msgSend(v13, "height");
    objc_msgSend(v10, "setComputePipelineState:", self->_parallelReductionAverageSimd);
    objc_msgSend(v10, "setTexture:atIndex:", v13, 0);
    objc_msgSend(v10, "setTexture:atIndex:", v14, 1);
    objc_msgSend(v10, "setBytes:length:atIndex:", &self->_numberOfElements, 4, 0);
    objc_msgSend(v10, "setBuffer:offset:atIndex:", v9, 0, 1);
    v23[0] = (unint64_t)(v15 + 1) >> 1;
    v23[1] = (unint64_t)(v16 + 1) >> 1;
    v23[2] = 1;
    v21 = *(_OWORD *)&self->_simdReductionThreadsPerGroup.width;
    depth = self->_simdReductionThreadsPerGroup.depth;
    objc_msgSend(v10, "dispatchThreads:threadsPerThreadgroup:", v23, &v21);

  }
  objc_msgSend(v10, "endEncoding");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parallelReductionAverageSimd, 0);
  objc_storeStrong((id *)&self->_simdTextures, 0);
  objc_storeStrong((id *)&self->_pipelineLibrary, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
