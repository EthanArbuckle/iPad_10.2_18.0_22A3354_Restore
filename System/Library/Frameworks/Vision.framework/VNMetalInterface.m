@implementation VNMetalInterface

- (VNMetalInterface)init
{
  VNMetalInterface *v2;
  MTLDevice *v3;
  MTLDevice *mtlDevice;
  uint64_t v5;
  MTLCommandQueue *mtlCommandQueue;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  MTLLibrary *mtlLibrary;
  uint64_t v12;
  MTLLibrary *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)VNMetalInterface;
  v2 = -[VNMetalInterface init](&v15, sel_init);
  if (v2)
  {
    v3 = (MTLDevice *)MTLCreateSystemDefaultDevice();
    mtlDevice = v2->mtlDevice;
    v2->mtlDevice = v3;

    v5 = -[MTLDevice newCommandQueue](v2->mtlDevice, "newCommandQueue");
    mtlCommandQueue = v2->mtlCommandQueue;
    v2->mtlCommandQueue = (MTLCommandQueue *)v5;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundlePath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("default.metallib"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = -[MTLDevice newLibraryWithFile:error:](v2->mtlDevice, "newLibraryWithFile:error:", v9, 0);
      mtlLibrary = v2->mtlLibrary;
      v2->mtlLibrary = (MTLLibrary *)v10;

    }
    if (!v2->mtlLibrary)
    {
      v12 = -[MTLDevice newDefaultLibrary](v2->mtlDevice, "newDefaultLibrary");
      v13 = v2->mtlLibrary;
      v2->mtlLibrary = (MTLLibrary *)v12;

    }
  }
  return v2;
}

- (id)textureFromCVPixelBuffer:(__CVBuffer *)a3
{
  CVPixelBufferGetPixelFormatType(a3);
  return 0;
}

- (id)textureWithPixelData:(vImage_Buffer *)a3 format:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;

  v6 = (void *)-[MTLDevice newBufferWithBytes:length:options:](self->mtlDevice, "newBufferWithBytes:length:options:", a3->data, a3->height * a3->rowBytes, 0);
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", a4, a3->width, a3->height, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "newTextureWithDescriptor:offset:bytesPerRow:", v7, 0, a3->rowBytes);

  return v8;
}

- (id)textureWithWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unint64_t)a5 usage:(unint64_t)a6
{
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", a5, a3, a4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUsage:", a6);
  v9 = (void *)-[MTLDevice newTextureWithDescriptor:](self->mtlDevice, "newTextureWithDescriptor:", v8);

  return v9;
}

- (void)performVotingImage:(id)a3 outputTex:(id)a4 subBuffer:(char *)a5
{
  id v7;
  id v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  MTLDevice *mtlDevice;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  MTLDevice *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  unint64_t v31;
  unint64_t v32;
  void *v33;
  id v34;
  __int128 v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  id v40;
  int v41;

  v7 = a3;
  v8 = a4;
  -[MTLCommandQueue commandBuffer](self->mtlCommandQueue, "commandBuffer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  v33 = (void *)-[MTLDevice newBufferWithBytes:length:options:](self->mtlDevice, "newBufferWithBytes:length:options:", &v41, 4, 0);
  v10 = objc_msgSend(v8, "width");
  v11 = objc_msgSend(v8, "height");
  v12 = (void *)-[MTLLibrary newFunctionWithName:](self->mtlLibrary, "newFunctionWithName:", CFSTR("updateVotingImage"));
  mtlDevice = self->mtlDevice;
  v40 = 0;
  v14 = (void *)-[MTLDevice newComputePipelineStateWithFunction:error:](mtlDevice, "newComputePipelineStateWithFunction:error:", v12, &v40);
  v15 = v40;
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "description");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    printf("  Metal computePipelineState error : %s\n", (const char *)objc_msgSend(v17, "UTF8String"));

  }
  objc_msgSend(v9, "computeCommandEncoder");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v7)
    objc_msgSend(v18, "setTexture:atIndex:", v7, 1);
  v31 = v11 >> 2;
  v32 = v10 >> 3;
  if (v8)
  {
    -[VNMetalInterface textureWithWidth:height:format:usage:](self, "textureWithWidth:height:format:usage:", objc_msgSend(v8, "width"), objc_msgSend(v8, "height"), objc_msgSend(v8, "pixelFormat"), 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTexture:atIndex:", v20, 0);
  }
  else
  {
    v20 = 0;
  }
  v21 = (void *)-[MTLDevice newBufferWithBytes:length:options:](self->mtlDevice, "newBufferWithBytes:length:options:", a5, 128, 0);
  objc_msgSend(v19, "setBuffer:offset:atIndex:", v21, 0, 0);
  objc_msgSend(v19, "setBuffer:offset:atIndex:", v33, 0, 1);
  objc_msgSend(v19, "setComputePipelineState:", v14);
  v37 = v32;
  v38 = v31;
  v39 = 1;
  v35 = xmmword_1A15FB5B0;
  v36 = 1;
  objc_msgSend(v19, "dispatchThreadgroups:threadsPerThreadgroup:", &v37, &v35);
  objc_msgSend(v19, "endEncoding");

  objc_msgSend(v9, "computeCommandEncoder");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)-[MTLLibrary newFunctionWithName:](self->mtlLibrary, "newFunctionWithName:", CFSTR("invertVotingImage"));
  v24 = self->mtlDevice;
  v34 = v16;
  v25 = (void *)-[MTLDevice newComputePipelineStateWithFunction:error:](v24, "newComputePipelineStateWithFunction:error:", v23, &v34);
  v26 = v34;

  if (v20)
    objc_msgSend(v22, "setTexture:atIndex:", v20, 1);
  if (v8)
    objc_msgSend(v22, "setTexture:atIndex:", v8, 0);
  objc_msgSend(v22, "setBuffer:offset:atIndex:", v33, 0, 0);
  objc_msgSend(v22, "setComputePipelineState:", v25);
  v37 = v32;
  v38 = v31;
  v39 = 1;
  v35 = xmmword_1A15FB5B0;
  v36 = 1;
  objc_msgSend(v22, "dispatchThreadgroups:threadsPerThreadgroup:", &v37, &v35);
  objc_msgSend(v22, "endEncoding");

  objc_msgSend(v9, "commit");
  objc_msgSend(v9, "waitUntilCompleted");
  objc_msgSend(v9, "error");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend(v9, "error");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "description");
    v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    printf("  Metal command buffer error : %s\n", (const char *)objc_msgSend(v29, "UTF8String"));

  }
}

- (void)performAdaptiveBinarizationImage:(vImage_Buffer *)a3 output:(vImage_Buffer *)a4 sumTable:(vImage_Buffer *)a5 sumSqTable:(vImage_Buffer *)a6
{
  void *v11;
  uint64_t v12;
  MTLDevice *mtlDevice;
  void *v14;
  void *v15;
  __int128 v16;
  void *v17;
  void *v18;
  __int128 v19;
  void *v20;
  __int128 v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *data;
  size_t rowBytes;
  id v32;
  vImage_Buffer *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  id v41;

  -[MTLCommandQueue commandBuffer](self->mtlCommandQueue, "commandBuffer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MTLLibrary newFunctionWithName:](self->mtlLibrary, "newFunctionWithName:", CFSTR("generateAdaptiveBinarization"));
  mtlDevice = self->mtlDevice;
  v41 = 0;
  v34 = (void *)v12;
  v14 = (void *)-[MTLDevice newComputePipelineStateWithFunction:error:](mtlDevice, "newComputePipelineStateWithFunction:error:");
  v32 = v41;
  objc_msgSend(v11, "computeCommandEncoder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(_OWORD *)&a3->width;
  v35 = *(_OWORD *)&a3->data;
  v36 = v16;
  -[VNMetalInterface textureWithPixelData:format:](self, "textureWithPixelData:format:", &v35, 13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = a4;
  -[VNMetalInterface textureWithWidth:height:format:usage:](self, "textureWithWidth:height:format:usage:", a4->width, a4->height, 13, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *(_OWORD *)&a5->width;
  v35 = *(_OWORD *)&a5->data;
  v36 = v19;
  -[VNMetalInterface textureWithPixelData:format:](self, "textureWithPixelData:format:", &v35, 53);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = *(_OWORD *)&a6->width;
  v35 = *(_OWORD *)&a6->data;
  v36 = v21;
  -[VNMetalInterface textureWithPixelData:format:](self, "textureWithPixelData:format:", &v35, 55);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTexture:atIndex:", v18, 0);
  objc_msgSend(v15, "setTexture:atIndex:", v17, 1);
  objc_msgSend(v15, "setTexture:atIndex:", v20, 2);
  objc_msgSend(v15, "setTexture:atIndex:", v22, 3);
  v23 = (unint64_t)objc_msgSend(v18, "width") >> 3;
  v24 = (unint64_t)objc_msgSend(v18, "height") >> 2;
  objc_msgSend(v15, "setComputePipelineState:", v14);
  *(_QWORD *)&v35 = v23;
  *((_QWORD *)&v35 + 1) = v24;
  *(_QWORD *)&v36 = 1;
  v39 = xmmword_1A15FB5B0;
  v40 = 1;
  objc_msgSend(v15, "dispatchThreadgroups:threadsPerThreadgroup:", &v35, &v39);
  objc_msgSend(v15, "endEncoding");
  objc_msgSend(v11, "commit");
  objc_msgSend(v11, "waitUntilCompleted");
  objc_msgSend(v11, "error");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(v11, "error");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "description");
    v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    printf("  Metal command buffer error : %s\n", (const char *)objc_msgSend(v27, "UTF8String"));

  }
  v28 = objc_msgSend(v18, "width");
  v29 = objc_msgSend(v18, "height");
  data = v33->data;
  rowBytes = v33->rowBytes;
  v35 = 0uLL;
  *(_QWORD *)&v36 = 0;
  *((_QWORD *)&v36 + 1) = v28;
  v37 = v29;
  v38 = 1;
  objc_msgSend(v18, "getBytes:bytesPerRow:fromRegion:mipmapLevel:", data, rowBytes, &v35, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mtlLibrary, 0);
  objc_storeStrong((id *)&self->mtlCommandQueue, 0);
  objc_storeStrong((id *)&self->mtlDevice, 0);
}

@end
