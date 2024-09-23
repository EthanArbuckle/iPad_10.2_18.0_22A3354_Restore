@implementation PKMetalPencilShadowRenderer

- (PKMetalPencilShadowRenderer)initWithDevice:(id)a3 library:(id)a4
{
  id v7;
  PKMetalPencilShadowRenderer *v8;
  uint64_t v9;
  NSMutableDictionary *objectsCache;
  uint64_t v11;
  MTLCommandQueue *commandQueue;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
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
  void *v33;
  id v34;
  void *v35;
  void *v36;
  MTLDevice *device;
  uint64_t v38;
  id v39;
  MTLRenderPipelineState *blurPipelineState;
  NSObject *v41;
  uint64_t v42;
  MTLBuffer *blurVertexBuffer;
  void *v45;
  id v46;
  objc_super v47;
  id v48;
  uint8_t buf[16];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v46 = a3;
  v7 = a4;
  v47.receiver = self;
  v47.super_class = (Class)PKMetalPencilShadowRenderer;
  v8 = -[PKMetalPencilShadowRenderer init](&v47, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v46);
    v9 = objc_claimAutoreleasedReturnValue();
    objectsCache = v8->_objectsCache;
    v8->_objectsCache = (NSMutableDictionary *)v9;

    objc_storeStrong((id *)&v8->_device, a3);
    objc_storeStrong((id *)&v8->_library, a4);
    v8->_currentPixelFormat = 0;
    v11 = -[MTLDevice newCommandQueue](v8->_device, "newCommandQueue");
    commandQueue = v8->_commandQueue;
    v8->_commandQueue = (MTLCommandQueue *)v11;

    v13 = objc_alloc_init(MEMORY[0x1E0CC6BD8]);
    objc_msgSend(v13, "attributes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFormat:", 29);

    objc_msgSend(v13, "attributes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setOffset:", 0);

    objc_msgSend(v13, "attributes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBufferIndex:", 0);

    objc_msgSend(v13, "attributes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectAtIndexedSubscript:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFormat:", 29);

    objc_msgSend(v13, "attributes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectAtIndexedSubscript:", 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setOffset:", 8);

    objc_msgSend(v13, "attributes");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectAtIndexedSubscript:", 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setBufferIndex:", 0);

    objc_msgSend(v13, "layouts");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setStride:", 16);

    objc_msgSend(v13, "layouts");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setStepRate:", 1);

    objc_msgSend(v13, "layouts");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setStepFunction:", 1);

    objc_storeStrong((id *)&v8->_vertexDescriptor, v13);
    v32 = (void *)-[MTLLibrary newFunctionWithName:](v8->_library, "newFunctionWithName:", CFSTR("shadowBlurVertex"));
    v33 = (void *)-[MTLLibrary newFunctionWithName:](v8->_library, "newFunctionWithName:", CFSTR("shadowBlurFragment"));
    v34 = objc_alloc_init(MEMORY[0x1E0CC6B68]);
    objc_msgSend(v34, "setLabel:", CFSTR("Blur"));
    objc_msgSend(v34, "setRasterSampleCount:", 1);
    objc_msgSend(v34, "setVertexFunction:", v32);
    objc_msgSend(v34, "setFragmentFunction:", v33);
    objc_msgSend(v34, "setVertexDescriptor:", v8->_vertexDescriptor);
    objc_msgSend(v34, "colorAttachments");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setPixelFormat:", 10);

    device = v8->_device;
    v48 = 0;
    v38 = -[MTLDevice newRenderPipelineStateWithDescriptor:error:](device, "newRenderPipelineStateWithDescriptor:error:", v34, &v48);
    v39 = v48;
    blurPipelineState = v8->_blurPipelineState;
    v8->_blurPipelineState = (MTLRenderPipelineState *)v38;

    if (!v8->_blurPipelineState)
    {
      v41 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v39, "localizedDescription");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v45;
        _os_log_fault_impl(&dword_1BE213000, v41, OS_LOG_TYPE_FAULT, "Failed to create pipeline state: %@", buf, 0xCu);

      }
    }
    v51 = xmmword_1BE4FF404;
    v52 = unk_1BE4FF414;
    *(_OWORD *)buf = xmmword_1BE4FF3E4;
    v50 = unk_1BE4FF3F4;
    v42 = -[MTLDevice newBufferWithBytes:length:options:](v8->_device, "newBufferWithBytes:length:options:", buf, 64, 0);
    blurVertexBuffer = v8->_blurVertexBuffer;
    v8->_blurVertexBuffer = (MTLBuffer *)v42;

  }
  return v8;
}

- (PKMetalPencilShadowRenderer)initWithDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PKMetalPencilShadowRenderer *v7;

  v4 = a3;
  +[PKMetalResourceHandler sharedResourceHandlerWithDevice:]((uint64_t)PKMetalResourceHandler, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMetalResourceHandler shaderLibrary]((uint64_t)v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PKMetalPencilShadowRenderer initWithDevice:library:](self, "initWithDevice:library:", v4, v6);

  return v7;
}

- (MTLCommandQueue)commandQueue
{
  return self->_commandQueue;
}

+ (CGSize)maxBlurSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 50.0;
  v3 = 50.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)pixelSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 172.0;
  v3 = 950.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)grayscaleTextureFromCIImage:(void *)a3 context:(double)a4 extent:(double)a5
{
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  CGImage *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  _QWORD v49[2];
  _QWORD v50[2];
  uint8_t v51[4];
  void *v52;
  uint8_t buf[16];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v14 = a3;
  v45 = v13;
  v46 = v14;
  if (*(_QWORD *)(a1 + 216))
  {
    v15 = v14;
    v16 = 0;
  }
  else
  {
    *(_OWORD *)buf = xmmword_1BE4FF424;
    v54 = unk_1BE4FF434;
    v55 = xmmword_1BE4FF444;
    v56 = unk_1BE4FF454;
    v17 = objc_msgSend(*(id *)(a1 + 16), "newBufferWithBytes:length:options:", buf, 64, 0);
    v18 = *(void **)(a1 + 208);
    *(_QWORD *)(a1 + 208) = v17;

    v19 = (void *)objc_msgSend(*(id *)(a1 + 24), "newFunctionWithName:", CFSTR("pencilShadowVertex"));
    v20 = (void *)objc_msgSend(*(id *)(a1 + 24), "newFunctionWithName:", CFSTR("alphaToGrayscale"));
    v21 = objc_alloc_init(MEMORY[0x1E0CC6B68]);
    objc_msgSend(v21, "setLabel:", CFSTR("GrayscalePipeline"));
    objc_msgSend(v21, "setRasterSampleCount:", 1);
    objc_msgSend(v21, "setVertexFunction:", v19);
    objc_msgSend(v21, "setFragmentFunction:", v20);
    objc_msgSend(v21, "setVertexDescriptor:", *(_QWORD *)(a1 + 8));
    objc_msgSend(v21, "colorAttachments");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setPixelFormat:", 10);

    v24 = *(void **)(a1 + 16);
    v48 = 0;
    v25 = objc_msgSend(v24, "newRenderPipelineStateWithDescriptor:error:", v21, &v48);
    v16 = v48;
    v26 = *(void **)(a1 + 216);
    *(_QWORD *)(a1 + 216) = v25;

    if (!*(_QWORD *)(a1 + 216))
    {
      v27 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v16, "localizedDescription");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v51 = 138412290;
        v52 = v43;
        _os_log_fault_impl(&dword_1BE213000, v27, OS_LOG_TYPE_FAULT, "Failed to create pipeline state: %@", v51, 0xCu);

      }
    }

    v13 = v45;
    v15 = v46;
  }
  v28 = (CGImage *)objc_msgSend(v15, "createCGImage:fromRect:", v13, a4, a5, a6, a7);
  if (v28)
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6C40]), "initWithDevice:", *(_QWORD *)(a1 + 16));
    v30 = *MEMORY[0x1E0CC6C10];
    v49[0] = *MEMORY[0x1E0CC6C18];
    v49[1] = v30;
    v50[0] = &unk_1E77EC090;
    v50[1] = &unk_1E77EC0A8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v16;
    v32 = (void *)objc_msgSend(v29, "newTextureWithCGImage:options:error:", v28, v31, &v47);
    v44 = v47;

    if (!v32)
    {
      v33 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v44, "localizedDescription");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v42;
        _os_log_fault_impl(&dword_1BE213000, v33, OS_LOG_TYPE_FAULT, "Failed to create texture: %@", buf, 0xCu);

      }
    }
    CGImageRelease(v28);
    objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 10, (unint64_t)a6, (unint64_t)a7, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setTextureType:", 2);
    objc_msgSend(v34, "setSampleCount:", 1);
    objc_msgSend(v34, "setUsage:", 5);
    objc_msgSend(v34, "setStorageMode:", 2);
    v35 = (void *)objc_msgSend(*(id *)(a1 + 16), "newTextureWithDescriptor:", v34);
    v36 = objc_alloc_init(MEMORY[0x1E0CC6B50]);
    objc_msgSend(v36, "colorAttachments");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "objectAtIndexedSubscript:", 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v38, "setTexture:", v35);
    objc_msgSend(v38, "setLoadAction:", 0);
    objc_msgSend(v38, "setStoreAction:", 1);
    objc_msgSend(*(id *)(a1 + 168), "commandBuffer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "renderCommandEncoderWithDescriptor:", v36);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setRenderPipelineState:", *(_QWORD *)(a1 + 216));
    *(_OWORD *)buf = xmmword_1BE4FD980;
    v54 = xmmword_1BE4FE500;
    v55 = xmmword_1BE4FE510;
    v56 = xmmword_1BE4FE520;
    objc_msgSend(v40, "setVertexBuffer:offset:atIndex:", *(_QWORD *)(a1 + 208), 0, 0);
    objc_msgSend(v40, "setVertexBytes:length:atIndex:", buf, 64, 1);
    objc_msgSend(v40, "setFragmentTexture:atIndex:", v32, 0);
    objc_msgSend(v40, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
    objc_msgSend(v40, "endEncoding");
    objc_msgSend(v39, "commit");

    v16 = v44;
  }
  else
  {
    v35 = 0;
  }

  return v35;
}

- (void)render3DModel:(void *)a3 oldObject:(double)a4 rollAngle:(double)a5 altitudeAngle:(double)a6 blendFactor:
{
  void *v11;
  id *v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  __int128 v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int64x2_t v40;
  __int128 v41;
  unint64_t v42;
  unint64_t v43;
  float v44;
  float v45;
  uint64_t v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  id v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  __int128 v60;
  _BYTE v61[12];
  int v62;
  float v63;
  uint64_t v64;
  int v65;
  float v66;
  float v67;
  uint64_t v68;
  float v69;
  float v70;
  uint64_t v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v53 = a2;
  v54 = a3;
  if (a1)
  {
    v12 = (id *)(a1 + 32);
    v11 = *(void **)(a1 + 32);
    *(double *)(a1 + 176) = a4;
    *(double *)(a1 + 184) = a5;
    v56 = v11;
    v59 = a1;
    if (!v56 || objc_msgSend(v56, "width") != 172 || objc_msgSend(v56, "height") != 950)
    {
      objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 10, 172, 950, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setTextureType:", 2);
      objc_msgSend(v13, "setSampleCount:", 1);
      objc_msgSend(v13, "setUsage:", 23);
      objc_msgSend(v13, "setStorageMode:", 2);
      v14 = (void *)objc_msgSend(*(id *)(a1 + 16), "newTextureWithDescriptor:", v13);

      objc_storeStrong(v12, v14);
      v56 = v14;
      a1 = v59;
    }
    objc_msgSend(*(id *)(a1 + 168), "commandBuffer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _ZF = a6 >= 0.99 || v54 == 0;
    v17 = _ZF;
    if (_ZF)
    {
      *(double *)(a1 + 248) = a4;
      *(double *)(a1 + 256) = a5;
      a6 = 1.0;
      v18 = v56;
    }
    else
    {
      *(int64x2_t *)(a1 + 248) = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
      v18 = v56;
      -[PKMetal3DObject renderIntoTexture:commandBuffer:rollAngle:altitudeAngle:blendFactor:clear:]((uint64_t)v54, v56, v15, 1, a4, a5, 1.0 - a6);
    }
    -[PKMetal3DObject renderIntoTexture:commandBuffer:rollAngle:altitudeAngle:blendFactor:clear:]((uint64_t)v53, v18, v15, v17, a4, a5, a6);
    v52 = v18;
    v58 = v15;
    objc_storeStrong(v12, v18);
    v19 = objc_msgSend(v52, "width");
    v20 = objc_msgSend(v52, "height");
    v21 = v52;
    v22 = 0;
    v57 = v59 + 40;
    *(_QWORD *)&v23 = 1.0;
    v60 = v23;
    v55 = v21;
    do
    {
      v24 = *(id *)(v57 + v22);
      v25 = v24;
      if (v19 >= 0)
        v26 = v19;
      else
        v26 = v19 + 1;
      v27 = v26 >> 1;
      if (v20 >= 0)
        v28 = v20;
      else
        v28 = v20 + 1;
      v29 = v28 >> 1;
      if (v24 && objc_msgSend(v24, "width") == v27 && objc_msgSend(v25, "height") == v29)
      {
        v30 = v25;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 10, v27, v29, 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setTextureType:", 2);
        objc_msgSend(v31, "setSampleCount:", 1);
        objc_msgSend(v31, "setUsage:", 7);
        objc_msgSend(v31, "setStorageMode:", 2);
        v30 = (void *)objc_msgSend(*(id *)(v59 + 16), "newTextureWithDescriptor:", v31);

        objc_storeStrong((id *)(v57 + v22), v30);
      }
      v32 = objc_alloc_init(MEMORY[0x1E0CC6B50]);
      objc_msgSend(v32, "colorAttachments");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setTexture:", v30);

      objc_msgSend(v32, "colorAttachments");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setLoadAction:", 0);

      objc_msgSend(v32, "colorAttachments");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectAtIndexedSubscript:", 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setStoreAction:", 1);

      objc_msgSend(v58, "renderCommandEncoderWithDescriptor:", v32);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setRenderPipelineState:", *(_QWORD *)(v59 + 200));
      v40.i64[0] = v19;
      v40.i64[1] = v20;
      *(float32x2_t *)v61 = vcvt_f32_f64(vdivq_f64((float64x2_t)vdupq_lane_s64(v60, 0), vcvtq_f64_s64(v40)));
      *(_DWORD *)&v61[8] = 1065353216;
      objc_msgSend(v39, "setFragmentBytes:length:atIndex:", v61, 16, 0);
      objc_msgSend(v39, "setVertexBuffer:offset:atIndex:", *(_QWORD *)(v59 + 192), 0, 0);
      objc_msgSend(v39, "setFragmentTexture:atIndex:", v21, 0);
      objc_msgSend(v39, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
      objc_msgSend(v39, "endEncoding");

      v22 += 8;
      *((_QWORD *)&v41 + 1) = *((_QWORD *)&v60 + 1);
      *(double *)&v41 = *(double *)&v60 * 1.2;
      v60 = v41;
      v19 = v27;
      v20 = v29;
      v21 = v30;
    }
    while (v22 != 32);
    v42 = objc_msgSend(v55, "width");
    v43 = objc_msgSend(v55, "height");
    v44 = (double)v42 * 0.8;
    *(float *)v61 = v44 * -0.5;
    v45 = (double)v43 * 0.8;
    *(_QWORD *)&v61[4] = 3259498496;
    v62 = 0;
    v63 = v44 * 0.5;
    v64 = 0x3F800000C2480000;
    v65 = 0;
    v66 = v44 * -0.5;
    v67 = v45 + -50.0;
    v68 = 0x3F80000000000000;
    v69 = v44 * 0.5;
    v70 = v45 + -50.0;
    __asm { FMOV            V2.2S, #1.0 }
    v71 = _D2;
    *(double *)(v59 + 88) = (float)(v44 * -0.5);
    *(_QWORD *)(v59 + 96) = 0xC049000000000000;
    *(double *)(v59 + 104) = v44;
    *(double *)(v59 + 112) = v45;
    v50 = objc_msgSend(*(id *)(v59 + 16), "newBufferWithBytes:length:options:", v61, 64, 0);
    v51 = *(void **)(v59 + 80);
    *(_QWORD *)(v59 + 80) = v50;

    objc_msgSend(v58, "commit");
  }

}

- (void)updateInk:(id)a3
{
  -[PKMetalPencilShadowRenderer updateInk:oldInk:rollAngle:altitudeAngle:progress:](self, "updateInk:oldInk:rollAngle:altitudeAngle:progress:", a3, 0, self->_currentRoll, self->_currentAltitude, 1.0);
}

- (id)objectForModel:(uint64_t)a1
{
  id v3;
  void *v4;
  PKMetal3DObject *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 232), "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v5 = [PKMetal3DObject alloc];
      v6 = *(void **)(a1 + 168);
      v7 = *(void **)(a1 + 24);
      +[PKMetalPencilShadowRenderer pixelSize](PKMetalPencilShadowRenderer, "pixelSize");
      v4 = -[PKMetal3DObject initWithCommandQueue:modelFile:library:pixelSize:maxTextureBlur:](v5, v6, v3, v7, v8, v9, 50.0);
      objc_msgSend(*(id *)(a1 + 232), "setObject:forKeyedSubscript:", v4, v3);
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)updateInk:(id)a3 oldInk:(id)a4 rollAngle:(double)a5 altitudeAngle:(double)a6 progress:(double)a7
{
  id v12;
  __CFString *v13;
  int v14;
  void *v15;
  void *v16;
  CIImage *genericShadowImage;
  __CFString *v18;
  void *v19;
  id v20;
  uint64_t v21;
  CIImage *v22;
  NSObject *v23;
  CIImage *v24;
  CIImage *v25;
  id v26;
  CIImage *v27;
  void *v28;
  double x;
  double y;
  double width;
  double height;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void **v39;
  void *v40;
  float v41;
  float v42;
  float v43;
  MTLBuffer *v49;
  MTLBuffer *vertexBuffer;
  NSObject *v51;
  NSObject *v52;
  CIImage *v53;
  id v54;
  __CFString *v55;
  id v56;
  uint8_t buf[4];
  float v58;
  uint64_t v59;
  float v60;
  float v61;
  uint64_t v62;
  float v63;
  float v64;
  uint64_t v65;
  float v66;
  float v67;
  uint64_t v68;
  uint64_t v69;
  CGRect v70;
  CGRect v71;

  v69 = *MEMORY[0x1E0C80C00];
  v56 = a3;
  v12 = a4;
  v54 = v12;
  if (v56)
  {
    objc_msgSend(v56, "_shadowModel");
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
LABEL_3:
      objc_msgSend(v12, "_shadowModel");
      v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  else
  {
    v13 = CFSTR("BallpointPen3");
    if (v12)
      goto LABEL_3;
  }
  v55 = CFSTR("BallpointPen3");
LABEL_6:
  v14 = -[__CFString isEqual:](v13, "isEqual:", self->_currentModel) ^ 1;
  if (v12)
    LOBYTE(v14) = 1;
  if ((v14 & 1) != 0 || self->_currentRenderedRoll != a5 || self->_currentRenderedAltitude != a6)
  {
    objc_storeStrong((id *)&self->_currentModel, v13);
    if (-[__CFString length](v13, "length") && -[__CFString length](v55, "length"))
    {
      -[PKMetalPencilShadowRenderer objectForModel:]((uint64_t)self, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (a7 >= 1.0)
      {
        v16 = 0;
      }
      else
      {
        -[PKMetalPencilShadowRenderer objectForModel:]((uint64_t)self, v55);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[PKMetalPencilShadowRenderer render3DModel:oldObject:rollAngle:altitudeAngle:blendFactor:]((uint64_t)self, v15, v16, a5, a6, a7);

    }
    else
    {
      genericShadowImage = self->_genericShadowImage;
      if (!genericShadowImage)
      {
        v18 = CFSTR("Outline Default");
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", CFSTR("Outline Default"), v19);
        v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v21 = objc_msgSend(v20, "CGImage");
        if (v21)
        {
          objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCGImage:", v21);
          v22 = (CIImage *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v23 = os_log_create("com.apple.pencilkit", ");
          if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1BE213000, v23, OS_LOG_TYPE_FAULT, "Unable to load pencil shadow texture", buf, 2u);
          }

          v22 = 0;
        }

        v24 = self->_genericShadowImage;
        self->_genericShadowImage = v22;

        genericShadowImage = self->_genericShadowImage;
      }
      v25 = genericShadowImage;
      v26 = objc_alloc_init(MEMORY[0x1E0C9DD90]);
      v27 = v25;
      -[CIImage imageByApplyingGaussianBlurWithSigma:](v27, "imageByApplyingGaussianBlurWithSigma:", 20.0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "extent");
      v71 = CGRectInset(v70, -20.0, -20.0);
      x = v71.origin.x;
      y = v71.origin.y;
      width = v71.size.width;
      height = v71.size.height;
      -[PKMetalPencilShadowRenderer grayscaleTextureFromCIImage:context:extent:]((uint64_t)self, v27, v26, v71.origin.x, v71.origin.y, v71.size.width, v71.size.height);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKMetalPencilShadowRenderer grayscaleTextureFromCIImage:context:extent:]((uint64_t)self, v28, v26, x, y, width, height);
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = (void *)v34;
      if (v33 && v34)
      {
        v53 = v25;
        objc_storeStrong((id *)self->_textures, v33);
        objc_storeStrong((id *)&self->_textures[4], v35);
        v36 = 5;
        while (1)
        {
          -[CIImage imageByApplyingGaussianBlurWithSigma:](v27, "imageByApplyingGaussianBlurWithSigma:", (double)((int)v36 - 4) * 20.0 * 0.25, v53);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKMetalPencilShadowRenderer grayscaleTextureFromCIImage:context:extent:]((uint64_t)self, v37, v26, x, y, width, height);
          v38 = objc_claimAutoreleasedReturnValue();
          v39 = (void **)(&self->super.isa + v36);
          v40 = *v39;
          *v39 = (void *)v38;

          if (!*v39)
            break;

          if (++v36 == 8)
          {
            v41 = width;
            v42 = y;
            *(float *)buf = v41 * -0.5;
            v58 = v42;
            v43 = height;
            v59 = 0;
            v60 = v41 * 0.5;
            v61 = v42;
            v62 = 1065353216;
            v63 = v41 * -0.5;
            v64 = v42 + v43;
            v65 = 0x3F80000000000000;
            v66 = v41 * 0.5;
            v67 = v42 + v43;
            __asm { FMOV            V4.2S, #1.0 }
            v68 = _D4;
            self->_imageMaxBlurredExtent.origin.x = x;
            self->_imageMaxBlurredExtent.origin.y = y;
            self->_imageMaxBlurredExtent.size.width = width;
            self->_imageMaxBlurredExtent.size.height = height;
            self->_vertexBufferBounds.origin.x = (float)(v41 * -0.5);
            self->_vertexBufferBounds.origin.y = v42;
            self->_vertexBufferBounds.size.width = v41;
            self->_vertexBufferBounds.size.height = v43;
            v49 = (MTLBuffer *)-[MTLDevice newBufferWithBytes:length:options:](self->_device, "newBufferWithBytes:length:options:", buf, 64, 0);
            vertexBuffer = self->_vertexBuffer;
            self->_vertexBuffer = v49;

            goto LABEL_36;
          }
        }
        v52 = os_log_create("com.apple.pencilkit", ");
        if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1BE213000, v52, OS_LOG_TYPE_FAULT, "Unable to create intermediate texture", buf, 2u);
        }

      }
      else
      {
        v51 = os_log_create("com.apple.pencilkit", ");
        if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1BE213000, v51, OS_LOG_TYPE_FAULT, "Unable to create initial textures", buf, 2u);
        }

      }
LABEL_36:

      v12 = v54;
    }
  }

}

- (id)current3DModel
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    a1 = (id *)objc_msgSend(a1[30], "length");
    if (a1)
    {
      objc_msgSend(v1[29], "objectForKeyedSubscript:", v1[30]);
      a1 = (id *)objc_claimAutoreleasedReturnValue();
    }
  }
  return a1;
}

- (void)updateRoll:(double)a3 altitudeAngle:(double)a4
{
  id v7;

  self->_currentRoll = a3;
  self->_currentAltitude = a4;
  -[PKMetalPencilShadowRenderer current3DModel]((id *)&self->super.isa);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 && (self->_currentRenderedRoll != a3 || self->_currentRenderedAltitude != a4))
    -[PKMetalPencilShadowRenderer render3DModel:oldObject:rollAngle:altitudeAngle:blendFactor:]((uint64_t)self, v7, 0, a3, a4, 1.0);

}

- (CGRect)renderInto:(id)a3 commandBuffer:(id)a4 position:(CGPoint)a5 azimuth:(double)a6 altitude:(double)a7 height:(double)a8 alpha:(double)a9 scale:(double)a10 clearFramebuffer:(BOOL)a11 grayscale:(double)a12
{
  _BOOL4 v13;
  double y;
  double x;
  id v23;
  double v24;
  unint64_t v25;
  unint64_t v26;
  MTLRenderPipelineState *currentPipelineState;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  MTLDevice *device;
  MTLRenderPipelineState *v35;
  id v36;
  MTLRenderPipelineState *v37;
  NSObject *v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  unint64_t v44;
  double v45;
  float v46;
  float32x4_t v47;
  float32_t v48;
  __double2 v49;
  uint64_t v50;
  unsigned int v51;
  unsigned int v52;
  unint64_t v53;
  unsigned int v54;
  uint64_t v55;
  unint64_t v56;
  float32x4_t v57;
  float32x4_t v58;
  float32x4_t v59;
  float32x4_t v60;
  uint64_t v61;
  float32x4_t v62;
  float32x4_t v63;
  void *v64;
  BOOL v65;
  void *v66;
  double v67;
  float v68;
  float v69;
  float v70;
  NSObject *v71;
  CGFloat v72;
  CGFloat v73;
  CGFloat width;
  CGFloat height;
  float v76;
  float v77;
  float v78;
  float v79;
  float v80;
  float32x4_t v81;
  uint64_t i;
  uint64_t v83;
  float64x2_t *v84;
  float32x4_t v85;
  double v86;
  double v87;
  double v88;
  double v89;
  void *v90;
  float32x4_t v91;
  double v92;
  id v93;
  void *v94;
  CGAffineTransform v95;
  CGAffineTransform v96;
  CGAffineTransform v97;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v100;
  float v101;
  float v102;
  float v103;
  float32x4_t v104;
  CGAffineTransform v105;
  float32x4_t v106;
  CGAffineTransform v107;
  float32x4_t v108;
  id v109;
  CATransform3D v110;
  CGAffineTransform v111;
  float32x4_t v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  uint64_t v117;
  CGRect vertexBufferBounds;
  CGRect v119;
  CGRect result;

  v13 = a11;
  y = a5.y;
  x = a5.x;
  v117 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v93 = a4;
  v94 = v23;
  if (!self->_vertexBuffer || !self->_textures[0])
  {
    v71 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v71, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v111.a) = 0;
      _os_log_fault_impl(&dword_1BE213000, v71, OS_LOG_TYPE_FAULT, "Shadow Renderer not set up", (uint8_t *)&v111, 2u);
    }

    goto LABEL_31;
  }
  v24 = 1.57079633 - a7;
  if (1.57079633 - a7 < 0.3)
  {
    v24 = pow(v24 * 3.33333333, 4.0);
    a9 = v24 * a9;
  }
  v25 = objc_msgSend(v23, "pixelFormat", v24);
  v26 = v25;
  currentPipelineState = self->_currentPipelineState;
  if (self->_currentPixelFormat != v25 || !currentPipelineState)
  {
    self->_currentPixelFormat = v25;
    self->_currentPipelineState = 0;

    v28 = objc_alloc_init(MEMORY[0x1E0CC6B68]);
    objc_msgSend(v28, "colorAttachments");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "setPixelFormat:", v26);
    objc_msgSend(v30, "setBlendingEnabled:", 1);
    objc_msgSend(v30, "setRgbBlendOperation:", 0);
    objc_msgSend(v30, "setAlphaBlendOperation:", 0);
    objc_msgSend(v30, "setSourceRGBBlendFactor:", 1);
    objc_msgSend(v30, "setSourceAlphaBlendFactor:", 1);
    objc_msgSend(v30, "setDestinationRGBBlendFactor:", 5);
    objc_msgSend(v30, "setDestinationAlphaBlendFactor:", 5);
    objc_msgSend(v28, "setVertexDescriptor:", self->_vertexDescriptor);
    v31 = (void *)-[MTLLibrary newFunctionWithName:](self->_library, "newFunctionWithName:", CFSTR("pencilShadowVertex"));
    v32 = -[MTLLibrary newFunctionWithName:](self->_library, "newFunctionWithName:", CFSTR("pencilShadowFragment"));
    v33 = (void *)v32;
    if (v31 && v32)
    {
      objc_msgSend(v28, "setVertexFunction:", v31);
      objc_msgSend(v28, "setFragmentFunction:", v33);
      device = self->_device;
      v109 = 0;
      v35 = (MTLRenderPipelineState *)-[MTLDevice newRenderPipelineStateWithDescriptor:error:](device, "newRenderPipelineStateWithDescriptor:error:", v28, &v109);
      v36 = v109;
      v37 = self->_currentPipelineState;
      self->_currentPipelineState = v35;

      if (!self->_currentPipelineState)
      {
        v38 = os_log_create("com.apple.pencilkit", ");
        if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(v36, "localizedDescription");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v111.a) = 138412290;
          *(_QWORD *)((char *)&v111.a + 4) = v90;
          _os_log_fault_impl(&dword_1BE213000, v38, OS_LOG_TYPE_FAULT, "Unable to create pipeline state: %@", (uint8_t *)&v111, 0xCu);

        }
      }

    }
    if (!self->_currentPipelineState)
    {
LABEL_31:
      v72 = *MEMORY[0x1E0C9D628];
      v73 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      width = *(double *)(MEMORY[0x1E0C9D628] + 16);
      height = *(double *)(MEMORY[0x1E0C9D628] + 24);
      goto LABEL_38;
    }
  }
  v39 = objc_alloc_init(MEMORY[0x1E0CC6B50]);
  objc_msgSend(v39, "colorAttachments");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = a8;
  objc_msgSend(v40, "objectAtIndexedSubscript:", 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v41, "setTexture:", v94);
  if (v13)
    v42 = 2;
  else
    v42 = 1;
  objc_msgSend(v41, "setLoadAction:", v42);
  objc_msgSend(v41, "setStoreAction:", 1);
  if (v13)
    objc_msgSend(v41, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v93, "renderCommandEncoderWithDescriptor:", v39);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setRenderPipelineState:", self->_currentPipelineState);
  v44 = objc_msgSend(v94, "width");
  v45 = a12;
  v46 = (float)(unint64_t)objc_msgSend(v94, "height");
  v47.f32[0] = x;
  v48 = v46 - y;
  v47.f32[1] = v48;
  v47.i32[2] = 0;
  v47.i32[3] = 1.0;
  v91 = v47;
  v49 = __sincos_stret(3.14159265 - a6);
  v50 = 0;
  *(float *)&v51 = v49.__cosval;
  *(float *)&v52 = v49.__sinval;
  *(float *)&v53 = -*(float *)&v52;
  HIDWORD(v53) = v51;
  *(_OWORD *)&v110.m11 = __PAIR64__(v52, v51);
  *(_OWORD *)&v110.m13 = v53;
  *(_OWORD *)&v110.m21 = xmmword_1BE4FE510;
  *(_OWORD *)&v110.m23 = xmmword_1BE4FE520;
  do
  {
    *(float32x4_t *)((char *)&v111.a + v50) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1BE4FD980, COERCE_FLOAT(*(_OWORD *)((char *)&v110.m11 + v50))), (float32x4_t)xmmword_1BE4FE500, *(float32x2_t *)((char *)&v110.m11 + v50), 1), (float32x4_t)xmmword_1BE4FE510, *(float32x4_t *)((char *)&v110.m11 + v50), 2), v91, *(float32x4_t *)((char *)&v110.m11 + v50), 3);
    v50 += 16;
  }
  while (v50 != 64);
  v55 = 0;
  LODWORD(v56) = 0;
  *((float *)&v56 + 1) = a10;
  v57 = *(float32x4_t *)&v111.a;
  v58 = *(float32x4_t *)&v111.c;
  v59 = *(float32x4_t *)&v111.tx;
  v60 = v112;
  *(float *)&v54 = a10;
  *(_OWORD *)&v110.m11 = v54;
  *(_OWORD *)&v110.m13 = v56;
  *(_OWORD *)&v110.m21 = xmmword_1BE4FE510;
  *(_OWORD *)&v110.m23 = xmmword_1BE4FE520;
  do
  {
    *(float32x4_t *)((char *)&v111.a + v55) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v57, COERCE_FLOAT(*(_OWORD *)((char *)&v110.m11 + v55))), v58, *(float32x2_t *)((char *)&v110.m11 + v55), 1), v59, *(float32x4_t *)((char *)&v110.m11 + v55), 2), v60, *(float32x4_t *)((char *)&v110.m11 + v55), 3);
    v55 += 16;
  }
  while (v55 != 64);
  v61 = 0;
  v62.i32[1] = 0;
  v62.i64[1] = 0;
  v63.i32[0] = 0;
  v63.i64[1] = 0;
  v107 = v111;
  v108 = v112;
  *(_OWORD *)&v110.m11 = *(_OWORD *)&v111.a;
  *(_OWORD *)&v110.m13 = *(_OWORD *)&v111.c;
  *(_OWORD *)&v110.m21 = *(_OWORD *)&v111.tx;
  *(float32x4_t *)&v110.m23 = v112;
  do
  {
    v62.f32[0] = 2.0 / (float)v44;
    v63.f32[1] = 2.0 / v46;
    *(float32x4_t *)((char *)&v111.a + v61) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v62, COERCE_FLOAT(*(_OWORD *)((char *)&v110.m11 + v61))), v63, *(float32x2_t *)((char *)&v110.m11 + v61), 1), (float32x4_t)xmmword_1BE4FE510, *(float32x4_t *)((char *)&v110.m11 + v61), 2), (float32x4_t)xmmword_1BE4FF3D0, *(float32x4_t *)((char *)&v110.m11 + v61), 3);
    v61 += 16;
  }
  while (v61 != 64);
  v105 = v111;
  v106 = v112;
  -[PKMetalPencilShadowRenderer current3DModel]((id *)&self->super.isa);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v64 == 0;

  +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "toolPreviewMaxZDistance");
  if (v65)
  {
    v76 = v92 / v67;
    v101 = v76;

    v77 = a7 * 10.0 / 1.57079633;
    v102 = v77;
    v70 = -self->_imageMaxBlurredExtent.origin.y / self->_imageMaxBlurredExtent.size.height;
  }
  else
  {
    v68 = v92 / v67 * 1.5;
    v101 = v68;

    v69 = a7 * 32.0 / 1.57079633;
    v102 = v69;
    v70 = 0.094737;
  }
  v103 = v70;
  v78 = v45;
  v79 = v78;
  v80 = a9;
  v81 = vmulq_n_f32((float32x4_t)LODWORD(v79), v80);
  v81.f32[3] = v80;
  v104 = v81;
  objc_msgSend(v43, "setVertexBuffer:offset:atIndex:", self->_vertexBuffer, 0, 0, *(_OWORD *)&v91);
  objc_msgSend(v43, "setVertexBytes:length:atIndex:", &v105, 64, 1);
  for (i = 0; i != 5; ++i)
    objc_msgSend(v43, "setFragmentTexture:atIndex:", self->_textures[i], i);
  objc_msgSend(v43, "setFragmentBytes:length:atIndex:", &v101, 32, 1);
  objc_msgSend(v43, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
  objc_msgSend(v43, "endEncoding");
  v83 = 0;
  memset(&v100, 0, sizeof(v100));
  v84 = (float64x2_t *)&v111;
  do
  {
    v85 = *(float32x4_t *)((char *)&v107.a + v83);
    *v84 = vcvtq_f64_f32(*(float32x2_t *)v85.f32);
    v84[1] = vcvt_hight_f64_f32(v85);
    v84 += 2;
    v83 += 16;
  }
  while (v83 != 64);
  *(_OWORD *)&v110.m31 = v113;
  *(_OWORD *)&v110.m33 = v114;
  *(_OWORD *)&v110.m41 = v115;
  *(_OWORD *)&v110.m43 = v116;
  *(_OWORD *)&v110.m11 = *(_OWORD *)&v111.a;
  *(_OWORD *)&v110.m13 = *(_OWORD *)&v111.c;
  *(_OWORD *)&v110.m21 = *(_OWORD *)&v111.tx;
  *(float32x4_t *)&v110.m23 = v112;
  CATransform3DGetAffineTransform(&v100, &v110);
  memset(&v111, 0, sizeof(v111));
  CGAffineTransformMakeScale(&t1, 1.0, -1.0);
  CGAffineTransformMakeTranslation(&t2, 0.0, (double)(unint64_t)objc_msgSend(v94, "height"));
  CGAffineTransformConcat(&v111, &t1, &t2);
  memset(&v110, 0, 48);
  v97 = v100;
  v96 = v111;
  CGAffineTransformConcat((CGAffineTransform *)&v110, &v97, &v96);
  vertexBufferBounds = self->_vertexBufferBounds;
  *(_OWORD *)&v95.a = *(_OWORD *)&v110.m11;
  *(_OWORD *)&v95.c = *(_OWORD *)&v110.m13;
  *(_OWORD *)&v95.tx = *(_OWORD *)&v110.m21;
  v119 = CGRectApplyAffineTransform(vertexBufferBounds, &v95);
  v72 = v119.origin.x;
  v73 = v119.origin.y;
  width = v119.size.width;
  height = v119.size.height;

LABEL_38:
  v86 = v72;
  v87 = v73;
  v88 = width;
  v89 = height;
  result.size.height = v89;
  result.size.width = v88;
  result.origin.y = v87;
  result.origin.x = v86;
  return result;
}

- (void).cxx_destruct
{
  uint64_t i;

  objc_storeStrong((id *)&self->_currentModel, 0);
  objc_storeStrong((id *)&self->_objectsCache, 0);
  objc_storeStrong((id *)&self->_genericShadowImage, 0);
  objc_storeStrong((id *)&self->_grayscalePipelineState, 0);
  objc_storeStrong((id *)&self->_grayscaleVertexBuffer, 0);
  objc_storeStrong((id *)&self->_blurPipelineState, 0);
  objc_storeStrong((id *)&self->_blurVertexBuffer, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_currentPipelineState, 0);
  objc_storeStrong((id *)&self->_vertexBuffer, 0);
  objc_storeStrong((id *)&self->_pyramidTexture, 0);
  for (i = 64; i != 24; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_vertexDescriptor, 0);
}

@end
