@implementation ARCoachingGeoTrackingRenderer

- (double)currentAnimationTime
{
  double result;

  -[ARCoachingAnimTime absoluteTime](self->_time, "absoluteTime");
  return result;
}

- (ARCoachingGlyphState)state
{
  return self->_state;
}

- (ARCoachingGeoTrackingRenderer)initWithLayer:(id)a3 device:(id)a4 pixelFormat:(unint64_t)a5 sampleCount:(int)a6 deviceMaskImage:(id)a7
{
  id v12;
  id v13;
  id v14;
  ARCoachingGeoTrackingRenderer *v15;
  ARCoachingGeoTrackingRenderer *v16;
  ARCoachingGlyphState *v17;
  ARCoachingGlyphState *state;
  ARCoachingAnimTime *v19;
  ARCoachingAnimTime *time;
  ARCoachingDeviceController *v21;
  ARCoachingDeviceController *deviceController;
  uint64_t v23;
  OS_dispatch_queue *queue;
  ARCoachingStateSpring *v25;
  ARCoachingStateSpring *cubeResolveSpring;
  double v27;
  double v28;
  double v29;
  ARCoachingStateSpring *v30;
  ARCoachingStateSpring *verticalResolvingSpring;
  ARCoachingBasicSpring *v32;
  double v33;
  double v34;
  uint64_t v35;
  ARCoachingBasicSpring *orientationSpring;
  id v37;
  uint64_t v38;
  MTLDepthStencilState *depthState;
  objc_super v41;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  v41.receiver = self;
  v41.super_class = (Class)ARCoachingGeoTrackingRenderer;
  v15 = -[ARCoachingGeoTrackingRenderer init](&v41, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_device, a4);
    v16->_pixelFormat = a5;
    objc_storeStrong((id *)&v16->_layer, a3);
    v17 = objc_alloc_init(ARCoachingGlyphState);
    state = v16->_state;
    v16->_state = v17;

    v19 = objc_alloc_init(ARCoachingAnimTime);
    time = v16->_time;
    v16->_time = v19;

    v21 = -[ARCoachingDeviceController initWithDeviceMaskImage:geoTrackingMode:]([ARCoachingDeviceController alloc], "initWithDeviceMaskImage:geoTrackingMode:", v14, 1);
    deviceController = v16->_deviceController;
    v16->_deviceController = v21;

    -[ARCoachingDeviceController setLayerParent:](v16->_deviceController, "setLayerParent:", v16->_layer);
    -[CAMetalLayer setAllowsGroupBlending:](v16->_layer, "setAllowsGroupBlending:", 1);
    ARCreateNonFixedPriorityDispatchQueue();
    v23 = objc_claimAutoreleasedReturnValue();
    queue = v16->_queue;
    v16->_queue = (OS_dispatch_queue *)v23;

    v25 = -[ARCoachingStateSpring initWithValue:]([ARCoachingStateSpring alloc], "initWithValue:", 0.0);
    cubeResolveSpring = v16->_cubeResolveSpring;
    v16->_cubeResolveSpring = v25;

    -[ARFLSpring parameters](v16->_cubeResolveSpring, "parameters");
    v28 = v27;
    -[ARFLSpring parameters](v16->_cubeResolveSpring, "parameters");
    ARFLSpringParametersMake(-[ARFLSpring parameters](v16->_cubeResolveSpring, "parameters"), v28, v29, 0.699999988);
    -[ARFLSpring setParameters:](v16->_cubeResolveSpring, "setParameters:");
    -[ARFLSpring setTarget:](v16->_cubeResolveSpring, "setTarget:", 0.0);
    -[ARFLSpring setValue:](v16->_cubeResolveSpring, "setValue:", 0.0);
    v30 = -[ARCoachingStateSpring initWithValue:]([ARCoachingStateSpring alloc], "initWithValue:", 0.0);
    verticalResolvingSpring = v16->_verticalResolvingSpring;
    v16->_verticalResolvingSpring = v30;

    -[ARFLSpring parameters](v16->_verticalResolvingSpring, "parameters");
    -[ARFLSpring setParameters:](v16->_verticalResolvingSpring, "setParameters:");
    -[ARFLSpring setTarget:](v16->_verticalResolvingSpring, "setTarget:", 0.0);
    -[ARFLSpring setValue:](v16->_verticalResolvingSpring, "setValue:", 0.0);
    v32 = [ARCoachingBasicSpring alloc];
    LODWORD(v33) = 1128792064;
    LODWORD(v34) = 22.0;
    v35 = -[ARCoachingBasicSpring initWithTension:friction:](v32, "initWithTension:friction:", v33, v34);
    orientationSpring = v16->_orientationSpring;
    v16->_orientationSpring = (ARCoachingBasicSpring *)v35;

    v37 = objc_alloc_init(MEMORY[0x1E0CC6A88]);
    objc_msgSend(v37, "setDepthCompareFunction:", 1);
    objc_msgSend(v37, "setDepthWriteEnabled:", 1);
    v38 = -[MTLDevice newDepthStencilStateWithDescriptor:](v16->_device, "newDepthStencilStateWithDescriptor:", v37);
    depthState = v16->_depthState;
    v16->_depthState = (MTLDepthStencilState *)v38;

  }
  return v16;
}

- (void)prepareWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__ARCoachingGeoTrackingRenderer_prepareWithCompletionHandler___block_invoke;
  v7[3] = &unk_1EA586698;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __62__ARCoachingGeoTrackingRenderer_prepareWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v5 = 0;
  objc_msgSend(v2, "loadOutlineModelWith:", &v5);
  v3 = v5;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);

}

- (void)drawWithTimeDelta:(double)a3 drawable:(id)a4 commandBuffer:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  v9 = a4;
  -[ARCoachingGeoTrackingRenderer drawDeviceWithTimeDelta:drawable:commandBuffer:](self, "drawDeviceWithTimeDelta:drawable:commandBuffer:", v9, v8, a3);
  -[ARCoachingGeoTrackingRenderer drawBuildingOutlineWithTimeDelta:drawable:commandBuffer:](self, "drawBuildingOutlineWithTimeDelta:drawable:commandBuffer:", v9, v8, a3);

}

- (void)drawDeviceWithTimeDelta:(double)a3 drawable:(id)a4 commandBuffer:(id)a5
{
  ARCoachingAnimTime *time;
  double v8;
  ARCoachingDeviceController *deviceController;
  __int128 v10;
  uint64_t v11;

  time = self->_time;
  -[ARCoachingAnimTime absoluteTime](time, "absoluteTime", a4, a5);
  -[ARCoachingAnimTime setAbsoluteTime:](time, "setAbsoluteTime:", v8 + a3);
  v10 = kARCoachingDeviceRenderParamsHorizontalGeoTracking;
  v11 = 3233808384;
  deviceController = self->_deviceController;
  -[ARCoachingAnimTime absoluteTime](self->_time, "absoluteTime", kARCoachingDeviceRenderParamsHorizontalGeoTracking, 3233808384);
  -[ARCoachingDeviceController update:visibility:layer:renderParams:](deviceController, "update:visibility:layer:renderParams:", self->_layer, &v10);
}

- (void)drawBuildingOutlineWithTimeDelta:(double)a3 drawable:(id)a4 commandBuffer:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  MTLTexture *depthTexture;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  unint64_t v29;
  void *v30;
  unint64_t v31;
  void *v32;
  unint64_t v33;
  void *v34;
  id v35;

  v35 = a4;
  v8 = a5;
  -[ARCoachingGeoTrackingRenderer updateFrameStateWithTimeDelta:](self, "updateFrameStateWithTimeDelta:", a3);
  objc_msgSend(MEMORY[0x1E0CC6B50], "renderPassDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "texture");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "colorAttachments");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTexture:", v10);

  objc_msgSend(v9, "colorAttachments");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setStoreAction:", 1);

  objc_msgSend(v9, "colorAttachments");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

  objc_msgSend(v9, "colorAttachments");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setLoadAction:", 2);

  objc_msgSend(v9, "colorAttachments");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setStoreAction:", 1);

  depthTexture = self->_depthTexture;
  objc_msgSend(v9, "depthAttachment");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTexture:", depthTexture);

  objc_msgSend(v9, "depthAttachment");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setLoadAction:", 2);

  objc_msgSend(v9, "depthAttachment");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setClearDepth:", 1.0);

  objc_msgSend(v9, "depthAttachment");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setDepthResolveFilter:", 0);

  objc_msgSend(v8, "renderCommandEncoderWithDescriptor:", v9);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setLabel:", CFSTR("Drawable Render Encoder"));
  objc_msgSend(v26, "setRenderPipelineState:", self->_inflatedHullPipeline);
  objc_msgSend(v26, "setDepthStencilState:", self->_depthState);
  objc_msgSend(v26, "setVertexBuffer:offset:atIndex:", self->_contentVertexPositions, 0, 0);
  objc_msgSend(v26, "setVertexBuffer:offset:atIndex:", self->_contentVertexGenerics, 0, 1);
  objc_msgSend(v26, "setVertexBytes:length:atIndex:", self->_anon_d0, 64, 2);
  objc_msgSend(v26, "setCullMode:", 1);
  if (-[NSMutableArray count](self->_contentIndexBuffers, "count"))
  {
    v27 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_contentIndexBuffers, "objectAtIndexedSubscript:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (unint64_t)objc_msgSend(v28, "length") >> 2;

      -[NSMutableArray objectAtIndexedSubscript:](self->_contentIndexBuffers, "objectAtIndexedSubscript:", v27);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", 3, v29, 1, v30, 0);

      ++v27;
    }
    while (v27 < -[NSMutableArray count](self->_contentIndexBuffers, "count"));
  }
  objc_msgSend(v26, "setCullMode:", 2);
  objc_msgSend(v26, "setRenderPipelineState:", self->_blockColorPipeline);
  if (-[NSMutableArray count](self->_contentIndexBuffers, "count"))
  {
    v31 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_contentIndexBuffers, "objectAtIndexedSubscript:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (unint64_t)objc_msgSend(v32, "length") >> 2;

      -[NSMutableArray objectAtIndexedSubscript:](self->_contentIndexBuffers, "objectAtIndexedSubscript:", v31);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", 3, v33, 1, v34, 0);

      ++v31;
    }
    while (v31 < -[NSMutableArray count](self->_contentIndexBuffers, "count"));
  }
  objc_msgSend(v26, "endEncoding");

}

- (void)resizeIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  float v18;
  float v19;
  void *v20;
  MTLTexture *v21;
  MTLTexture *depthTexture;
  int v23;
  void *v24;
  __int16 v25;
  ARCoachingGeoTrackingRenderer *v26;
  __int16 v27;
  double v28;
  __int16 v29;
  double v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_depthTexture)
  {
    objc_msgSend(v4, "texture");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "width");
    if (v7 == -[MTLTexture width](self->_depthTexture, "width"))
    {
      objc_msgSend(v5, "texture");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "height");
      v10 = -[MTLTexture height](self->_depthTexture, "height");

      if (v9 == v10)
        goto LABEL_9;
    }
    else
    {

    }
  }
  objc_msgSend(v5, "texture");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (double)(unint64_t)objc_msgSend(v11, "width");
  objc_msgSend(v5, "texture");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (double)(unint64_t)objc_msgSend(v13, "height");

  kdebug_trace();
  _ARLogCoaching_0();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138544130;
    v24 = v17;
    v25 = 2048;
    v26 = self;
    v27 = 2048;
    v28 = v12;
    v29 = 2048;
    v30 = v14;
    _os_log_impl(&dword_1DCC73000, v15, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Creating new depth texture because the drawable size has changed to %.0fx%.0f", (uint8_t *)&v23, 0x2Au);

  }
  v18 = v14;
  v19 = v12 / v18;
  *(_OWORD *)self->_anon_90 = COERCE_UNSIGNED_INT(1.5697 / v19);
  *(_OWORD *)&self->_anon_90[16] = xmmword_1DCCA0E20;
  *(_OWORD *)&self->_anon_90[32] = xmmword_1DCCA0E30;
  *(_OWORD *)&self->_anon_90[48] = xmmword_1DCCA0E40;
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 252, (unint64_t)v12, (unint64_t)v14, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setStorageMode:", 2);
  objc_msgSend(v20, "setUsage:", 4);
  v21 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v20);
  depthTexture = self->_depthTexture;
  self->_depthTexture = v21;

  -[MTLTexture setLabel:](self->_depthTexture, "setLabel:", CFSTR("Depth texture"));
LABEL_9:

}

- (void)setOrientationAngle:(float)a3
{
  -[ARCoachingBasicSpring setInput:](self->_orientationSpring, "setInput:");
}

- (void)resetAnimationTime:(double)a3
{
  ARCoachingAnimTime *v5;
  ARCoachingAnimTime *time;

  v5 = objc_alloc_init(ARCoachingAnimTime);
  time = self->_time;
  self->_time = v5;

  -[ARCoachingAnimTime setAbsoluteTime:](self->_time, "setAbsoluteTime:", a3);
}

- (BOOL)loadOutlineModelWith:(id *)a3
{
  void *v5;
  void *v6;
  GTMeshData *v7;
  GTMeshData *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  MTLBuffer *v15;
  MTLBuffer *contentVertexPositions;
  MTLBuffer *v17;
  MTLBuffer *contentVertexGenerics;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  int *v23;
  _DWORD *v24;
  int v25;
  NSMutableArray *v26;
  NSMutableArray *contentIndexBuffers;
  void *v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  unint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  MTLDevice *v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  NSObject *v69;
  ARCoachingGeoTrackingRenderer *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  unint64_t pixelFormat;
  void *v76;
  void *v77;
  MTLRenderPipelineState *v78;
  MTLRenderPipelineState *inflatedHullPipeline;
  void *v80;
  void *v81;
  MTLRenderPipelineState *v82;
  MTLRenderPipelineState *blockColorPipeline;
  NSObject *v84;
  objc_class *v85;
  void *v86;
  id v87;
  void *v89;
  void *v90;
  MTLDevice *v91;
  id *v92;
  void *v93;
  void *v94;
  id v95;
  uint8_t buf[4];
  void *v97;
  __int16 v98;
  ARCoachingGeoTrackingRenderer *v99;
  __int16 v100;
  uint64_t v101;
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  ARKitUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLForResource:withExtension:", CFSTR("OutlineModel"), CFSTR("obj"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[GTMeshData initWithURL:error:]([GTMeshData alloc], "initWithURL:error:", v6, a3);
  v8 = v7;
  if (!*a3)
  {
    v92 = a3;
    v94 = v5;
    v13 = 16 * -[GTMeshData vertexCount](v7, "vertexCount");
    v14 = 20 * -[GTMeshData vertexCount](v8, "vertexCount");
    v15 = (MTLBuffer *)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", v13, 0);
    contentVertexPositions = self->_contentVertexPositions;
    self->_contentVertexPositions = v15;

    v17 = (MTLBuffer *)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", v14, 0);
    contentVertexGenerics = self->_contentVertexGenerics;
    self->_contentVertexGenerics = v17;

    v19 = -[MTLBuffer contents](self->_contentVertexPositions, "contents");
    v20 = -[MTLBuffer contents](self->_contentVertexGenerics, "contents");
    v21 = -[GTMeshData vertexData](v8, "vertexData");
    if (-[GTMeshData vertexCount](v8, "vertexCount"))
    {
      v22 = 0;
      v23 = (int *)(v21 + 24);
      v24 = (_DWORD *)(v20 + 16);
      do
      {
        *(_OWORD *)(v19 + 16 * v22) = *(_OWORD *)(v23 - 6);
        *(v24 - 2) = *(v23 - 2);
        *(v24 - 1) = *(v23 - 1);
        v25 = *v23;
        v23 += 12;
        *v24 = v25;
        v24 += 5;
        ++v22;
      }
      while (v22 < -[GTMeshData vertexCount](v8, "vertexCount"));
    }
    v93 = v6;
    v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    contentIndexBuffers = self->_contentIndexBuffers;
    self->_contentIndexBuffers = v26;

    -[GTMeshData submeshes](v8, "submeshes");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "allValues");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "count");

    if (v30)
    {
      v31 = 0;
      do
      {
        -[GTMeshData submeshes](v8, "submeshes");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "allValues");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectAtIndexedSubscript:", v31);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        v35 = (void *)-[MTLDevice newBufferWithBytes:length:options:](self->_device, "newBufferWithBytes:length:options:", objc_msgSend(v34, "indexData"), 4 * objc_msgSend(v34, "indexCount"), 0);
        -[NSMutableArray setObject:atIndexedSubscript:](self->_contentIndexBuffers, "setObject:atIndexedSubscript:", v35, v31);

        ++v31;
        -[GTMeshData submeshes](v8, "submeshes");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "allValues");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "count");

      }
      while (v31 < v38);
    }
    v9 = objc_alloc_init(MEMORY[0x1E0CC6BD8]);
    -[NSObject attributes](v9, "attributes");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "objectAtIndexedSubscript:", 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setFormat:", 30);

    -[NSObject attributes](v9, "attributes");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "objectAtIndexedSubscript:", 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setOffset:", 0);

    -[NSObject attributes](v9, "attributes");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectAtIndexedSubscript:", 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setBufferIndex:", 0);

    -[NSObject attributes](v9, "attributes");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "objectAtIndexedSubscript:", 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setFormat:", 30);

    -[NSObject attributes](v9, "attributes");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "objectAtIndexedSubscript:", 1);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setOffset:", 8);

    -[NSObject attributes](v9, "attributes");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "objectAtIndexedSubscript:", 1);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setBufferIndex:", 1);

    -[NSObject layouts](v9, "layouts");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "objectAtIndexedSubscript:", 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setStride:", 16);

    -[NSObject layouts](v9, "layouts");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "objectAtIndexedSubscript:", 0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setStepRate:", 1);

    -[NSObject layouts](v9, "layouts");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "objectAtIndexedSubscript:", 0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setStepFunction:", 1);

    -[NSObject layouts](v9, "layouts");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "objectAtIndexedSubscript:", 1);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setStride:", 20);

    -[NSObject layouts](v9, "layouts");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "objectAtIndexedSubscript:", 1);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setStepRate:", 1);

    -[NSObject layouts](v9, "layouts");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "objectAtIndexedSubscript:", 1);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setStepFunction:", 1);

    v63 = (void *)objc_opt_new();
    v64 = self->_device;
    ARKitUIBundle();
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "URLForResource:withExtension:", CFSTR("default"), CFSTR("metallib"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (v66)
    {
      v95 = 0;
      v67 = (void *)-[MTLDevice newLibraryWithURL:error:](v64, "newLibraryWithURL:error:", v66, &v95);
      v68 = v95;
      objc_msgSend(v67, "setLabel:", CFSTR("com.apple.arkit.coachinganimation.library"));
      if (v68)
      {
        _ARLogCoaching_0();
        v69 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
        {
          -[NSObject localizedDescription](v68, "localizedDescription");
          v91 = v64;
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject localizedFailureReason](v68, "localizedFailureReason");
          v90 = v67;
          v70 = (ARCoachingGeoTrackingRenderer *)objc_claimAutoreleasedReturnValue();
          -[NSObject localizedRecoverySuggestion](v68, "localizedRecoverySuggestion");
          v71 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v97 = v89;
          v98 = 2112;
          v99 = v70;
          v100 = 2112;
          v101 = v71;
          v72 = (void *)v71;
          _os_log_impl(&dword_1DCC73000, v69, OS_LOG_TYPE_ERROR, "Error while loading metal library for coaching animation\n\tError: %@\n\tReason: %@\n\tSuggestion: %@", buf, 0x20u);

          v67 = v90;
          v64 = v91;
        }

      }
    }
    else
    {
      _ARLogCoaching_0();
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DCC73000, v68, OS_LOG_TYPE_ERROR, "Failed to find metal library for coaching animations", buf, 2u);
      }
      v67 = 0;
    }

    v73 = (void *)objc_msgSend(v67, "newFunctionWithName:", CFSTR("inflatedInverseHullVertexShader"));
    v74 = (void *)objc_msgSend(v67, "newFunctionWithName:", CFSTR("solidWhiteFragmentShader"));
    objc_msgSend(v63, "setVertexDescriptor:", v9);
    objc_msgSend(v63, "setVertexFunction:", v73);
    objc_msgSend(v63, "setFragmentFunction:", v74);
    pixelFormat = self->_pixelFormat;
    objc_msgSend(v63, "colorAttachments");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "objectAtIndexedSubscript:", 0);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setPixelFormat:", pixelFormat);

    objc_msgSend(v63, "setDepthAttachmentPixelFormat:", 252);
    objc_msgSend(v63, "setLabel:", CFSTR("Inflated Hull Pipeline"));
    v78 = (MTLRenderPipelineState *)-[MTLDevice newRenderPipelineStateWithDescriptor:error:](self->_device, "newRenderPipelineStateWithDescriptor:error:", v63, v92);
    inflatedHullPipeline = self->_inflatedHullPipeline;
    self->_inflatedHullPipeline = v78;

    if (self->_inflatedHullPipeline)
    {
      objc_msgSend(v63, "setLabel:", CFSTR("Block Color Pipeline"));
      v80 = (void *)objc_msgSend(v67, "newFunctionWithName:", CFSTR("simplePositionVertexShader"));
      objc_msgSend(v63, "setVertexFunction:", v80);

      v81 = (void *)objc_msgSend(v67, "newFunctionWithName:", CFSTR("solidBlackFragmentShader"));
      objc_msgSend(v63, "setFragmentFunction:", v81);

      v82 = (MTLRenderPipelineState *)-[MTLDevice newRenderPipelineStateWithDescriptor:error:](self->_device, "newRenderPipelineStateWithDescriptor:error:", v63, v92);
      blockColorPipeline = self->_blockColorPipeline;
      self->_blockColorPipeline = v82;

      v5 = v94;
      if (self->_blockColorPipeline)
      {
        v12 = 1;
LABEL_27:

        v6 = v93;
        goto LABEL_28;
      }
      _ARLogGeneral();
      v84 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
        goto LABEL_25;
    }
    else
    {
      _ARLogGeneral();
      v84 = objc_claimAutoreleasedReturnValue();
      v5 = v94;
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
      {
LABEL_25:
        v85 = (objc_class *)objc_opt_class();
        NSStringFromClass(v85);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = *v92;
        *(_DWORD *)buf = 138543874;
        v97 = v86;
        v98 = 2048;
        v99 = self;
        v100 = 2112;
        v101 = (uint64_t)v87;
        _os_log_impl(&dword_1DCC73000, v84, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create content render pipeline state, error: %@.", buf, 0x20u);

      }
    }

    v12 = 0;
    goto LABEL_27;
  }
  _ARLogGeneral();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v97 = v11;
    v98 = 2048;
    v99 = self;
    _os_log_impl(&dword_1DCC73000, v9, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Loading the outline model failed.", buf, 0x16u);

  }
  v12 = 0;
LABEL_28:

  return v12;
}

- (void)updateFrameStateWithTimeDelta:(double)a3
{
  float v4;
  float v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  unint64_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float v15;
  __float2 v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  unint64_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  unint64_t v27;
  unint64_t v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  float32x4_t v36;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  float32x4_t v45;
  float32x4_t v46;
  float32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  float32x4_t v51;
  float32x4_t v52;
  float32x4_t v53;
  float32x4_t v54;
  float32x4_t v55;

  v4 = self->_ftime + a3;
  self->_ftime = v4;
  v5 = (float)(v4 * 0.25) * 3.14159265 + (float)(v4 * 0.25) * 3.14159265;
  *(double *)v6.i64 = simd_matrix4x4((float32x4_t)_PromotedConst);
  v45 = v6;
  v46 = v7;
  v47 = v8;
  v43 = v9;
  ARMatrix4x4FromRotationAndTranslation();
  v10 = 0;
  v48 = v11;
  v49 = v12;
  v50 = v13;
  v51 = v14;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v52 + v10) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v45, COERCE_FLOAT(*(_OWORD *)((char *)&v48 + v10))), v46, *(float32x2_t *)&v48.f32[v10 / 4], 1), v47, *(float32x4_t *)((char *)&v48 + v10), 2), v43, *(float32x4_t *)((char *)&v48 + v10), 3);
    v10 += 16;
  }
  while (v10 != 64);
  v15 = sinf(v5);
  v42 = v53;
  v44 = v52;
  v40 = v55;
  v41 = v54;
  v16 = __sincosf_stret((float)((float)(v15 * -0.083333) + -2.15) * 0.5);
  v17 = vmulq_n_f32((float32x4_t)xmmword_1DCCA0E60, v16.__sinval);
  v17.i32[3] = LODWORD(v16.__cosval);
  *(double *)v18.i64 = simd_matrix4x4(v17);
  v38 = v19;
  v39 = v18;
  v36 = v21;
  v37 = v20;
  ARMatrix4x4FromRotationAndTranslation();
  v22 = 0;
  v48 = v23;
  v49 = v24;
  v50 = v25;
  v51 = v26;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v52 + v22) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v39, COERCE_FLOAT(*(_OWORD *)((char *)&v48 + v22))), v38, *(float32x2_t *)&v48.f32[v22 / 4], 1), v37, *(float32x4_t *)((char *)&v48 + v22), 2), v36, *(float32x4_t *)((char *)&v48 + v22), 3);
    v22 += 16;
  }
  while (v22 != 64);
  v27 = 0;
  v48 = v52;
  v49 = v53;
  v50 = v54;
  v51 = v55;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v52 + v27) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v44, COERCE_FLOAT(*(_OWORD *)((char *)&v48 + v27))), v42, *(float32x2_t *)&v48.f32[v27 / 4], 1), v41, *(float32x4_t *)((char *)&v48 + v27), 2), v40, *(float32x4_t *)((char *)&v48 + v27), 3);
    v27 += 16;
  }
  while (v27 != 64);
  v28 = 0;
  v29 = *(float32x4_t *)self->_anon_90;
  v30 = *(float32x4_t *)&self->_anon_90[16];
  v31 = *(float32x4_t *)&self->_anon_90[32];
  v32 = *(float32x4_t *)&self->_anon_90[48];
  v48 = v52;
  v49 = v53;
  v50 = v54;
  v51 = v55;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v52 + v28) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v29, COERCE_FLOAT(*(_OWORD *)((char *)&v48 + v28))), v30, *(float32x2_t *)&v48.f32[v28 / 4], 1), v31, *(float32x4_t *)((char *)&v48 + v28), 2), v32, *(float32x4_t *)((char *)&v48 + v28), 3);
    v28 += 16;
  }
  while (v28 != 64);
  v33 = v53;
  v34 = v54;
  v35 = v55;
  *(float32x4_t *)self->_anon_d0 = v52;
  *(float32x4_t *)&self->_anon_d0[16] = v33;
  *(float32x4_t *)&self->_anon_d0[32] = v34;
  *(float32x4_t *)&self->_anon_d0[48] = v35;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_depthTexture, 0);
  objc_storeStrong((id *)&self->_contentIndexBuffers, 0);
  objc_storeStrong((id *)&self->_contentVertexGenerics, 0);
  objc_storeStrong((id *)&self->_contentVertexPositions, 0);
  objc_storeStrong((id *)&self->_blockColorPipeline, 0);
  objc_storeStrong((id *)&self->_inflatedHullPipeline, 0);
  objc_storeStrong((id *)&self->_depthState, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_deviceController, 0);
  objc_storeStrong((id *)&self->_orientationSpring, 0);
  objc_storeStrong((id *)&self->_verticalResolvingSpring, 0);
  objc_storeStrong((id *)&self->_cubeResolveSpring, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_layer, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
