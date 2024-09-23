@implementation CVAFilterDiffusion

- (CVAFilterDiffusion)initWithDevice:(id)a3 library:(id)a4 pipelineLibrary:(id)a5 bufferWidth:(unint64_t)a6 bufferHeight:(unint64_t)a7 edgeVariance:(float)a8 stepSize:(float)a9 error:(id *)a10
{
  id v19;
  id v20;
  id v21;
  CVAFilterDiffusion *v22;
  CVAFilterDiffusion *v23;
  void **p_device;
  uint64_t width;
  uint64_t v26;
  MTLTexture *laplacian;
  uint64_t v28;
  MTLTexture *tmpOut16_0;
  uint64_t v30;
  MTLTexture *tmpOut16_1;
  uint64_t v32;
  MTLTexture *tmpOut32_0;
  uint64_t v34;
  MTLTexture *tmpOut32_1;
  uint64_t v36;
  MTLBuffer *edgeLaplacianConfigImmutable;
  uint64_t v38;
  MTLBuffer *jacobiConfigImmutable;
  uint64_t v40;
  MTLBuffer *davidConfigImmutable;
  CVAFilterDiffusion *v42;
  id v44;
  objc_super v45;

  v19 = a3;
  v20 = a4;
  v21 = a5;
  v45.receiver = self;
  v45.super_class = (Class)CVAFilterDiffusion;
  v22 = -[ImageSaverRegistrator init](&v45, sel_init);
  v23 = v22;
  if (v22)
  {
    v44 = v21;
    p_device = (void **)&v22->_device;
    objc_storeStrong((id *)&v22->_device, a3);
    objc_storeStrong((id *)&v23->_library, a4);
    objc_storeStrong((id *)&v23->_pipelineLibrary, a5);
    v23->_width = a6;
    v23->_height = a7;
    v23->_edgeVariance = a8;
    width = v23->_width;
    sub_1B56A2A64(*p_device, 115, width, a7, 0, a10);
    v26 = objc_claimAutoreleasedReturnValue();
    laplacian = v23->_laplacian;
    v23->_laplacian = (MTLTexture *)v26;

    sub_1B56A2A64(*p_device, 25, width, a7, 0, a10);
    v28 = objc_claimAutoreleasedReturnValue();
    tmpOut16_0 = v23->_tmpOut16_0;
    v23->_tmpOut16_0 = (MTLTexture *)v28;

    sub_1B56A2A64(*p_device, 25, width, a7, 0, a10);
    v30 = objc_claimAutoreleasedReturnValue();
    tmpOut16_1 = v23->_tmpOut16_1;
    v23->_tmpOut16_1 = (MTLTexture *)v30;

    sub_1B56A2A64(*p_device, 55, width, a7, 0, a10);
    v32 = objc_claimAutoreleasedReturnValue();
    tmpOut32_0 = v23->_tmpOut32_0;
    v23->_tmpOut32_0 = (MTLTexture *)v32;

    sub_1B56A2A64(*p_device, 55, width, a7, 0, a10);
    v34 = objc_claimAutoreleasedReturnValue();
    tmpOut32_1 = v23->_tmpOut32_1;
    v23->_tmpOut32_1 = (MTLTexture *)v34;

    v36 = objc_msgSend(*p_device, "newBufferWithLength:options:", 4, 0);
    edgeLaplacianConfigImmutable = v23->_edgeLaplacianConfigImmutable;
    v23->_edgeLaplacianConfigImmutable = (MTLBuffer *)v36;

    *(float *)-[MTLBuffer contents](v23->_edgeLaplacianConfigImmutable, "contents") = -1.0 / (float)(a8 + a8);
    v38 = objc_msgSend(*p_device, "newBufferWithLength:options:", 4, 0);
    jacobiConfigImmutable = v23->_jacobiConfigImmutable;
    v23->_jacobiConfigImmutable = (MTLBuffer *)v38;

    *(float *)-[MTLBuffer contents](v23->_jacobiConfigImmutable, "contents") = a9;
    v40 = objc_msgSend(*p_device, "newBufferWithLength:options:", 4, 0);
    davidConfigImmutable = v23->_davidConfigImmutable;
    v23->_davidConfigImmutable = (MTLBuffer *)v40;

    *(_DWORD *)-[MTLBuffer contents](v23->_davidConfigImmutable, "contents") = 1061997773;
    sub_1B5674B88((void **)&v23->_createEdgeLaplacianKernel, v23->_library, v23->_pipelineLibrary, *p_device, CFSTR("createEdgeLaplacian"), a10, 0);
    sub_1B5674B88((void **)&v23->_createDiffusionMapLaplacianKernel, v23->_library, v23->_pipelineLibrary, *p_device, CFSTR("createDiffusionMapLaplacian"), a10, 0);
    sub_1B5674B88((void **)&v23->_laplacianJacobiKernel, v23->_library, v23->_pipelineLibrary, *p_device, CFSTR("laplacianJacobi"), a10, 0);
    sub_1B5674B88((void **)&v23->_laplacianDavidKernel, v23->_library, v23->_pipelineLibrary, *p_device, CFSTR("laplacianDavid"), a10, 0);
    v42 = v23;
    v21 = v44;
  }

  return v23;
}

- (void)encodeToCommandBufferInternal:(id)a3 sourceTexture:(id)a4 destinationTexture:(id)a5
{
  id v8;
  id v9;
  void *v10;
  __int128 v11;
  uint64_t v12;
  _QWORD v13[3];

  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "computeCommandEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLabel:", CFSTR("_laplacianJacobiKernel"));
  objc_msgSend(v10, "setComputePipelineState:", self->_laplacianJacobiKernel);
  objc_msgSend(v10, "setTexture:atIndex:", self->_laplacian, 0);
  objc_msgSend(v10, "setTexture:atIndex:", v8, 1);
  objc_msgSend(v10, "setTexture:atIndex:", v9, 2);
  objc_msgSend(v10, "setBuffer:offset:atIndex:", self->_jacobiConfigImmutable, 0, 0);
  v13[0] = (unint64_t)(objc_msgSend(v8, "width") + 15) >> 4;
  v13[1] = (unint64_t)(objc_msgSend(v8, "height") + 15) >> 4;
  v13[2] = 1;
  v12 = 1;
  v11 = xmmword_1B56AC968;
  objc_msgSend(v10, "dispatchThreadgroups:threadsPerThreadgroup:", v13, &v11);
  objc_msgSend(v10, "endEncoding");

}

- (void)encodeDavidIterationToCommandBufferInternal:(id)a3 priorTexture:(id)a4 confidenceTexture:(id)a5 sourceTexture:(id)a6 destinationTexture:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  __int128 v17;
  uint64_t v18;
  _QWORD v19[3];

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(a3, "computeCommandEncoder");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setLabel:", CFSTR("_laplacianDavidKernel"));
  objc_msgSend(v16, "setComputePipelineState:", self->_laplacianDavidKernel);
  objc_msgSend(v16, "setTexture:atIndex:", self->_laplacian, 0);
  objc_msgSend(v16, "setTexture:atIndex:", v13, 1);
  objc_msgSend(v16, "setTexture:atIndex:", v12, 2);
  objc_msgSend(v16, "setTexture:atIndex:", v14, 3);
  objc_msgSend(v16, "setTexture:atIndex:", v15, 4);
  objc_msgSend(v16, "setBuffer:offset:atIndex:", self->_davidConfigImmutable, 0, 0);
  v19[0] = (unint64_t)(objc_msgSend(v14, "width") + 15) >> 4;
  v19[1] = (unint64_t)(objc_msgSend(v14, "height") + 15) >> 4;
  v19[2] = 1;
  v18 = 1;
  v17 = xmmword_1B56AC968;
  objc_msgSend(v16, "dispatchThreadgroups:threadsPerThreadgroup:", v19, &v17);
  objc_msgSend(v16, "endEncoding");

}

- (void)encodeEdgeLaplacianToCommandBuffer:(id)a3 colorTexture:(id)a4 outputLaplacian:(id)a5
{
  id v8;
  id v9;
  void *v10;
  __int128 v11;
  uint64_t v12;
  _QWORD v13[3];

  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "computeCommandEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLabel:", CFSTR("_createEdgeLaplacianKernel"));
  objc_msgSend(v10, "setComputePipelineState:", self->_createEdgeLaplacianKernel);
  objc_msgSend(v10, "setTexture:atIndex:", v8, 0);
  objc_msgSend(v10, "setTexture:atIndex:", v9, 1);
  objc_msgSend(v10, "setBuffer:offset:atIndex:", self->_edgeLaplacianConfigImmutable, 0, 0);
  v13[0] = (unint64_t)(objc_msgSend(v8, "width") + 15) >> 4;
  v13[1] = (unint64_t)(objc_msgSend(v8, "height") + 15) >> 4;
  v13[2] = 1;
  v12 = 1;
  v11 = xmmword_1B56AC968;
  objc_msgSend(v10, "dispatchThreadgroups:threadsPerThreadgroup:", v13, &v11);
  objc_msgSend(v10, "endEncoding");

}

- (void)encodeDiffusionMapLaplacianToCommandBuffer:(id)a3 diffusionMapTexture:(id)a4 outputLaplacian:(id)a5
{
  id v8;
  id v9;
  void *v10;
  __int128 v11;
  uint64_t v12;
  _QWORD v13[3];

  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "computeCommandEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLabel:", CFSTR("_createDiffusionMapLaplacianKernel"));
  objc_msgSend(v10, "setComputePipelineState:", self->_createDiffusionMapLaplacianKernel);
  objc_msgSend(v10, "setTexture:atIndex:", v8, 0);
  objc_msgSend(v10, "setTexture:atIndex:", v9, 1);
  v13[0] = (unint64_t)(objc_msgSend(v8, "width") + 15) >> 4;
  v13[1] = (unint64_t)(objc_msgSend(v8, "height") + 15) >> 4;
  v13[2] = 1;
  v12 = 1;
  v11 = xmmword_1B56AC968;
  objc_msgSend(v10, "dispatchThreadgroups:threadsPerThreadgroup:", v13, &v11);
  objc_msgSend(v10, "endEncoding");

}

- (void)encodeToCommandBuffer:(id)a3 sourceTexture:(id)a4 destinationTexture:(id)a5 colorTexture:(id)a6 iterations:(unsigned int)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  int *v16;
  int *v17;
  id v18;
  id v19;
  unsigned int v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[3];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (a7)
  {
    v16 = &OBJC_IVAR___CVAFilterDiffusion__tmpOut32_1;
    v17 = &OBJC_IVAR___CVAFilterDiffusion__tmpOut32_0;
    if (objc_msgSend(v13, "pixelFormat") != 55 && objc_msgSend(v14, "pixelFormat") != 55)
    {
      v17 = &OBJC_IVAR___CVAFilterDiffusion__tmpOut16_0;
      v16 = &OBJC_IVAR___CVAFilterDiffusion__tmpOut16_1;
    }
    v18 = *(id *)((char *)&self->super.super.isa + *v17);
    v19 = *(id *)((char *)&self->super.super.isa + *v16);
    -[CVAFilterDiffusion encodeEdgeLaplacianToCommandBuffer:colorTexture:outputLaplacian:](self, "encodeEdgeLaplacianToCommandBuffer:colorTexture:outputLaplacian:", v12, v15, self->_laplacian);
    v20 = a7 - 1;
    if (a7 == 1)
    {
      -[CVAFilterDiffusion encodeToCommandBufferInternal:sourceTexture:destinationTexture:](self, "encodeToCommandBufferInternal:sourceTexture:destinationTexture:", v12, v13, v14);
    }
    else
    {
      -[CVAFilterDiffusion encodeToCommandBufferInternal:sourceTexture:destinationTexture:](self, "encodeToCommandBufferInternal:sourceTexture:destinationTexture:", v12, v13, v19);
      if (v20 < 2)
      {
        v22 = v18;
      }
      else
      {
        do
        {
          v22 = v19;
          v19 = v18;
          -[CVAFilterDiffusion encodeToCommandBufferInternal:sourceTexture:destinationTexture:](self, "encodeToCommandBufferInternal:sourceTexture:destinationTexture:", v12, v22, v18);
          --v20;
          v18 = v22;
        }
        while (v20 > 1);
      }
      v18 = v19;
      v23 = v19;
      v19 = v22;
      -[CVAFilterDiffusion encodeToCommandBufferInternal:sourceTexture:destinationTexture:](self, "encodeToCommandBufferInternal:sourceTexture:destinationTexture:", v12, v23, v14);
    }

  }
  else
  {
    objc_msgSend(v12, "blitCommandEncoder");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    memset(v26, 0, sizeof(v26));
    v25[0] = objc_msgSend(v13, "width");
    v25[1] = objc_msgSend(v13, "height");
    v25[2] = 1;
    memset(v24, 0, sizeof(v24));
    objc_msgSend(v21, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v13, 0, 0, v26, v25, v14, 0, 0, v24);
    objc_msgSend(v21, "endEncoding");

  }
}

- (void)encodeToCommandBuffer:(id)a3 priorTexture:(id)a4 sourceTexture:(id)a5 destinationTexture:(id)a6 diffusionMapTexture:(id)a7 confidenceTexture:(id)a8 iterations:(unsigned int)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  int *v20;
  int *v21;
  id v22;
  id v23;
  unsigned int v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[3];

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v30 = a7;
  v19 = a8;
  if (a9)
  {
    v29 = v18;
    v20 = &OBJC_IVAR___CVAFilterDiffusion__tmpOut32_1;
    v21 = &OBJC_IVAR___CVAFilterDiffusion__tmpOut32_0;
    if (objc_msgSend(v17, "pixelFormat") != 55 && objc_msgSend(v29, "pixelFormat") != 55)
    {
      v21 = &OBJC_IVAR___CVAFilterDiffusion__tmpOut16_0;
      v20 = &OBJC_IVAR___CVAFilterDiffusion__tmpOut16_1;
    }
    v22 = *(id *)((char *)&self->super.super.isa + *v21);
    v23 = *(id *)((char *)&self->super.super.isa + *v20);
    -[CVAFilterDiffusion encodeDiffusionMapLaplacianToCommandBuffer:diffusionMapTexture:outputLaplacian:](self, "encodeDiffusionMapLaplacianToCommandBuffer:diffusionMapTexture:outputLaplacian:", v15, v30, self->_laplacian);
    v24 = a9 - 1;
    if (a9 == 1)
    {
      -[CVAFilterDiffusion encodeDavidIterationToCommandBufferInternal:priorTexture:confidenceTexture:sourceTexture:destinationTexture:](self, "encodeDavidIterationToCommandBufferInternal:priorTexture:confidenceTexture:sourceTexture:destinationTexture:", v15, v16, v19, v17, v29);
    }
    else
    {
      -[CVAFilterDiffusion encodeDavidIterationToCommandBufferInternal:priorTexture:confidenceTexture:sourceTexture:destinationTexture:](self, "encodeDavidIterationToCommandBufferInternal:priorTexture:confidenceTexture:sourceTexture:destinationTexture:", v15, v16, v19, v17, v23);
      if (v24 < 2)
      {
        v27 = v22;
        v26 = v29;
      }
      else
      {
        v26 = v29;
        do
        {
          v27 = v23;
          v23 = v22;
          -[CVAFilterDiffusion encodeDavidIterationToCommandBufferInternal:priorTexture:confidenceTexture:sourceTexture:destinationTexture:](self, "encodeDavidIterationToCommandBufferInternal:priorTexture:confidenceTexture:sourceTexture:destinationTexture:", v15, v16, v19, v27, v22);
          --v24;
          v22 = v27;
        }
        while (v24 > 1);
      }
      v22 = v23;
      v28 = v23;
      v23 = v27;
      -[CVAFilterDiffusion encodeDavidIterationToCommandBufferInternal:priorTexture:confidenceTexture:sourceTexture:destinationTexture:](self, "encodeDavidIterationToCommandBufferInternal:priorTexture:confidenceTexture:sourceTexture:destinationTexture:", v15, v16, v19, v28, v26);
    }

    v18 = v29;
  }
  else
  {
    objc_msgSend(v15, "blitCommandEncoder");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    memset(v33, 0, sizeof(v33));
    v32[0] = objc_msgSend(v17, "width");
    v32[1] = objc_msgSend(v17, "height");
    v32[2] = 1;
    memset(v31, 0, sizeof(v31));
    objc_msgSend(v25, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v17, 0, 0, v33, v32, v18, 0, 0, v31);
    objc_msgSend(v25, "endEncoding");

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_laplacianDavidKernel, 0);
  objc_storeStrong((id *)&self->_laplacianJacobiKernel, 0);
  objc_storeStrong((id *)&self->_createDiffusionMapLaplacianKernel, 0);
  objc_storeStrong((id *)&self->_createEdgeLaplacianKernel, 0);
  objc_storeStrong((id *)&self->_jacobiConfigImmutable, 0);
  objc_storeStrong((id *)&self->_edgeLaplacianConfigImmutable, 0);
  objc_storeStrong((id *)&self->_davidConfigImmutable, 0);
  objc_storeStrong((id *)&self->_tmpOut32_1, 0);
  objc_storeStrong((id *)&self->_tmpOut32_0, 0);
  objc_storeStrong((id *)&self->_tmpOut16_1, 0);
  objc_storeStrong((id *)&self->_tmpOut16_0, 0);
  objc_storeStrong((id *)&self->_laplacian, 0);
  objc_storeStrong((id *)&self->_pipelineLibrary, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
