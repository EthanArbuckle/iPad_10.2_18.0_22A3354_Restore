@implementation GTMTLTextureRenderer

- (GTMTLTextureRenderer)initWithDevice:(id)a3
{
  id v5;
  GTMTLTextureRenderer *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *overlayPipelines;
  NSMutableDictionary *v9;
  NSMutableDictionary *texturePipelines;
  NSMutableDictionary *v11;
  NSMutableDictionary *depthStencilPipelines;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  MTLRenderPipelineDescriptor *v19;
  MTLRenderPipelineDescriptor *overlayPipelineDescriptor;
  void *v21;
  void *v22;
  MTLRenderPipelineDescriptor *v23;
  MTLRenderPipelineDescriptor *texturePipelineDescriptor;
  MTLRenderPipelineDescriptor *v25;
  MTLRenderPipelineDescriptor *depthStencilPipelineDescriptor;
  GTMTLTextureRenderer *v27;
  objc_super v29;

  v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)GTMTLTextureRenderer;
  v6 = -[GTMTLTextureRenderer init](&v29, "init");
  if (v6)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    overlayPipelines = v6->_overlayPipelines;
    v6->_overlayPipelines = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    texturePipelines = v6->_texturePipelines;
    v6->_texturePipelines = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    depthStencilPipelines = v6->_depthStencilPipelines;
    v6->_depthStencilPipelines = v11;

    objc_storeStrong((id *)&v6->_device, a3);
    v13 = GTMTLReplayController_defaultLibrary(v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = objc_msgSend(v14, "newFunctionWithName:", CFSTR("FullscreenVertex"));
    v16 = objc_msgSend(v14, "newFunctionWithName:", CFSTR("FullscreenFragmentOverlay"));
    v17 = objc_msgSend(v14, "newFunctionWithName:", CFSTR("FullscreenFragmentTexture"));
    v18 = objc_msgSend(v14, "newFunctionWithName:", CFSTR("FullscreenFragmentDepthStencil"));
    v19 = (MTLRenderPipelineDescriptor *)objc_alloc_init((Class)MTLRenderPipelineDescriptor);
    overlayPipelineDescriptor = v6->_overlayPipelineDescriptor;
    v6->_overlayPipelineDescriptor = v19;

    -[MTLRenderPipelineDescriptor setVertexFunction:](v6->_overlayPipelineDescriptor, "setVertexFunction:", v15);
    -[MTLRenderPipelineDescriptor setFragmentFunction:](v6->_overlayPipelineDescriptor, "setFragmentFunction:", v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTLRenderPipelineDescriptor colorAttachments](v6->_overlayPipelineDescriptor, "colorAttachments"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", 0));

    objc_msgSend(v22, "setBlendingEnabled:", 1);
    objc_msgSend(v22, "setSourceRGBBlendFactor:", 1);
    objc_msgSend(v22, "setRgbBlendOperation:", 0);
    objc_msgSend(v22, "setDestinationRGBBlendFactor:", 5);

    v23 = (MTLRenderPipelineDescriptor *)objc_alloc_init((Class)MTLRenderPipelineDescriptor);
    texturePipelineDescriptor = v6->_texturePipelineDescriptor;
    v6->_texturePipelineDescriptor = v23;

    -[MTLRenderPipelineDescriptor setVertexFunction:](v6->_texturePipelineDescriptor, "setVertexFunction:", v15);
    -[MTLRenderPipelineDescriptor setFragmentFunction:](v6->_texturePipelineDescriptor, "setFragmentFunction:", v17);
    v25 = (MTLRenderPipelineDescriptor *)objc_alloc_init((Class)MTLRenderPipelineDescriptor);
    depthStencilPipelineDescriptor = v6->_depthStencilPipelineDescriptor;
    v6->_depthStencilPipelineDescriptor = v25;

    -[MTLRenderPipelineDescriptor setVertexFunction:](v6->_depthStencilPipelineDescriptor, "setVertexFunction:", v15);
    -[MTLRenderPipelineDescriptor setFragmentFunction:](v6->_depthStencilPipelineDescriptor, "setFragmentFunction:", v18);
    v27 = v6;

  }
  return v6;
}

- (id)getPipelineStateFromCache:(id)a3 withDescriptor:(id)a4 withFormat:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  MTLDevice *device;
  void *v15;
  uint64_t v17;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v10));

  if (!v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "colorAttachments"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", 0));
    objc_msgSend(v13, "setPixelFormat:", a5);

    device = self->_device;
    v17 = 0;
    v11 = -[MTLDevice newRenderPipelineStateWithDescriptor:error:](device, "newRenderPipelineStateWithDescriptor:error:", v9, &v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, v15);

  }
  return v11;
}

- (id)wrapLinear:(id)a3
{
  id v3;
  char *v4;
  id v5;
  uint64_t v6;

  v3 = a3;
  v4 = (char *)objc_msgSend(v3, "pixelFormat");
  if ((uint64_t)v4 > 551)
  {
    if (v4 == (char *)&stru_1F8.offset)
    {
      v6 = 553;
      goto LABEL_10;
    }
    v5 = v3;
    if (v4 == (_BYTE *)&stru_1F8.offset + 2)
    {
      v6 = 555;
      goto LABEL_10;
    }
  }
  else
  {
    if (v4 == (_BYTE *)&stru_20.vmsize + 6)
    {
      v6 = 71;
      goto LABEL_10;
    }
    v5 = v3;
    if (v4 == (char *)&stru_20.filesize)
    {
      v6 = 81;
LABEL_10:
      v5 = objc_msgSend(v3, "newTextureViewWithPixelFormat:", v6);

    }
  }

  return v5;
}

- (void)renderOverlay:(id)a3 color:(unsigned int)a4 shrinkToFit:(BOOL)a5 withEncoder:(id)a6 withFormat:(unint64_t)a7 transform:(CATransform3D *)a8 anchor:(CGPoint)a9 bounds:(CGRect)a10 renderTargetSize:(CGSize)a11 viewContentsScale:(double)a12
{
  _BOOL4 v14;
  double height;
  double width;
  CGFloat v17;
  CGFloat v18;
  CGFloat y;
  CGFloat x;
  CGFloat v21;
  CGFloat v22;
  NSMutableDictionary *overlayPipelines;
  MTLRenderPipelineDescriptor *overlayPipelineDescriptor;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  float64x2_t v35;
  __int128 v36;
  float64x2_t v37;
  float64x2_t v38;
  double v39;
  id v40;
  void *v41;
  _OWORD v42[2];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _OWORD v49[7];
  float32x4_t v50;

  if (a3)
  {
    v14 = a5;
    height = a11.height;
    width = a11.width;
    v17 = a10.size.height;
    v18 = a10.size.width;
    y = a10.origin.y;
    x = a10.origin.x;
    v21 = a9.y;
    v22 = a9.x;
    v50 = vdivq_f32(vcvtq_f32_u32((uint32x4_t)vandq_s8((int8x16_t)vdupq_n_s32(a4), (int8x16_t)xmmword_4AA460)), (float32x4_t)xmmword_4AA470);
    overlayPipelines = self->_overlayPipelines;
    overlayPipelineDescriptor = self->_overlayPipelineDescriptor;
    v27 = a6;
    v28 = a3;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[GTMTLTextureRenderer getPipelineStateFromCache:withDescriptor:withFormat:](self, "getPipelineStateFromCache:withDescriptor:withFormat:", overlayPipelines, overlayPipelineDescriptor, a7));
    memset(v49, 0, sizeof(v49));
    v30 = objc_msgSend(v28, "width");
    v31 = objc_msgSend(v28, "height");
    v32 = *(_OWORD *)&a8->m33;
    v45 = *(_OWORD *)&a8->m31;
    v46 = v32;
    v33 = *(_OWORD *)&a8->m43;
    v47 = *(_OWORD *)&a8->m41;
    v48 = v33;
    v34 = *(_OWORD *)&a8->m13;
    v42[0] = *(_OWORD *)&a8->m11;
    v42[1] = v34;
    v36 = *(_OWORD *)&a8->m23;
    v43 = *(_OWORD *)&a8->m21;
    v35.f64[1] = *((float64_t *)&v43 + 1);
    v44 = v36;
    v35.f64[0] = v22;
    v37.f64[0] = x;
    v38.f64[0] = v18;
    v40 = -[GTMTLTextureRenderer wrapLinear:](self, "wrapLinear:", v28, GetTextureRendererUniform((uint64_t)v49, (float64_t *)v42, v14, (uint64_t)v30, (uint64_t)v31, v35, v21, v37, y, v38, v17, a12, v39, width, height));
    v41 = (void *)objc_claimAutoreleasedReturnValue(v40);

    objc_msgSend(v27, "setVertexBytes:length:atIndex:", v49, 112, 0);
    objc_msgSend(v27, "setRenderPipelineState:", v29);
    objc_msgSend(v27, "setFragmentTexture:atIndex:", v41, 0);
    objc_msgSend(v27, "setFragmentBytes:length:atIndex:", &v50, 16, 0);
    objc_msgSend(v27, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);

  }
}

- (void)renderTexture:(id)a3 isDepthStencil:(BOOL)a4 shrinkToFit:(BOOL)a5 withEncoder:(id)a6 withFormat:(unint64_t)a7 transform:(CATransform3D *)a8 anchor:(CGPoint)a9 bounds:(CGRect)a10 renderTargetSize:(CGSize)a11 viewContentsScale:(double)a12
{
  _BOOL4 v15;
  _BOOL4 v16;
  double height;
  double width;
  CGFloat v19;
  CGFloat v20;
  CGFloat y;
  CGFloat x;
  CGFloat v23;
  CGFloat v24;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  float64x2_t v36;
  __int128 v37;
  float64x2_t v38;
  float64x2_t v39;
  double v40;
  id v41;
  void *v42;
  _OWORD v43[2];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _OWORD v50[7];

  v15 = a5;
  v16 = a4;
  height = a11.height;
  width = a11.width;
  v19 = a10.size.height;
  v20 = a10.size.width;
  y = a10.origin.y;
  x = a10.origin.x;
  v23 = a9.y;
  v24 = a9.x;
  v26 = a3;
  v27 = a6;
  if (v26)
  {
    v28 = 48;
    if (v16)
      v28 = 56;
    v29 = 24;
    if (v16)
      v29 = 32;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[GTMTLTextureRenderer getPipelineStateFromCache:withDescriptor:withFormat:](self, "getPipelineStateFromCache:withDescriptor:withFormat:", *(Class *)((char *)&self->super.isa + v28), *(Class *)((char *)&self->super.isa + v29), a7));
    memset(v50, 0, sizeof(v50));
    v31 = objc_msgSend(v26, "width");
    v32 = objc_msgSend(v26, "height");
    v33 = *(_OWORD *)&a8->m33;
    v46 = *(_OWORD *)&a8->m31;
    v47 = v33;
    v34 = *(_OWORD *)&a8->m43;
    v48 = *(_OWORD *)&a8->m41;
    v49 = v34;
    v35 = *(_OWORD *)&a8->m13;
    v43[0] = *(_OWORD *)&a8->m11;
    v43[1] = v35;
    v37 = *(_OWORD *)&a8->m23;
    v44 = *(_OWORD *)&a8->m21;
    v36.f64[1] = *((float64_t *)&v44 + 1);
    v45 = v37;
    v36.f64[0] = v24;
    v38.f64[0] = x;
    v39.f64[0] = v20;
    v41 = -[GTMTLTextureRenderer wrapLinear:](self, "wrapLinear:", v26, GetTextureRendererUniform((uint64_t)v50, (float64_t *)v43, v15, (uint64_t)v31, (uint64_t)v32, v36, v23, v38, y, v39, v19, a12, v40, width, height));
    v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
    objc_msgSend(v27, "setVertexBytes:length:atIndex:", v50, 112, 0);
    objc_msgSend(v27, "setRenderPipelineState:", v30);
    objc_msgSend(v27, "setFragmentTexture:atIndex:", v42, 0);
    objc_msgSend(v27, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);

  }
}

- (void)render:(id)a3 withEncoder:(id)a4 withFormat:(unint64_t)a5 renderTargetSize:(CGSize)a6 viewContentsScale:(double)a7
{
  double height;
  double width;
  id v13;
  id v14;
  unsigned int v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  _OWORD v37[8];
  _OWORD v38[8];

  height = a6.height;
  width = a6.width;
  v13 = a3;
  v14 = a4;
  v15 = objc_msgSend(v13, "overlay");
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "texture"));
  if (v15)
  {
    v17 = objc_msgSend(v13, "rgb");
    v18 = objc_msgSend(v13, "shrinkToFit");
    if (v13)
      objc_msgSend(v13, "transform");
    else
      memset(v38, 0, sizeof(v38));
    objc_msgSend(v13, "anchor");
    v22 = v21;
    v24 = v23;
    objc_msgSend(v13, "bounds");
    -[GTMTLTextureRenderer renderOverlay:color:shrinkToFit:withEncoder:withFormat:transform:anchor:bounds:renderTargetSize:viewContentsScale:](self, "renderOverlay:color:shrinkToFit:withEncoder:withFormat:transform:anchor:bounds:renderTargetSize:viewContentsScale:", v16, v17, v18, v14, a5, v38, v22, v24, v25, v26, v27, v28, width, height, *(_QWORD *)&a7);
  }
  else
  {
    v19 = objc_msgSend(v13, "depthStencil");
    v20 = objc_msgSend(v13, "shrinkToFit");
    if (v13)
      objc_msgSend(v13, "transform");
    else
      memset(v37, 0, sizeof(v37));
    objc_msgSend(v13, "anchor");
    v30 = v29;
    v32 = v31;
    objc_msgSend(v13, "bounds");
    -[GTMTLTextureRenderer renderTexture:isDepthStencil:shrinkToFit:withEncoder:withFormat:transform:anchor:bounds:renderTargetSize:viewContentsScale:](self, "renderTexture:isDepthStencil:shrinkToFit:withEncoder:withFormat:transform:anchor:bounds:renderTargetSize:viewContentsScale:", v16, v19, v20, v14, a5, v37, v30, v32, v33, v34, v35, v36, width, height, *(_QWORD *)&a7);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_depthStencilPipelines, 0);
  objc_storeStrong((id *)&self->_texturePipelines, 0);
  objc_storeStrong((id *)&self->_overlayPipelines, 0);
  objc_storeStrong((id *)&self->_depthStencilPipelineDescriptor, 0);
  objc_storeStrong((id *)&self->_texturePipelineDescriptor, 0);
  objc_storeStrong((id *)&self->_overlayPipelineDescriptor, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
