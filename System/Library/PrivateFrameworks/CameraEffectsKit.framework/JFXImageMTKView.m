@implementation JFXImageMTKView

- (void)dealloc
{
  objc_super v3;

  -[JFXImageMTKView cleanupTextures](self, "cleanupTextures");
  -[JFXImageMTKView cleanupTextureCache](self, "cleanupTextureCache");
  v3.receiver = self;
  v3.super_class = (Class)JFXImageMTKView;
  -[MTKView dealloc](&v3, sel_dealloc);
}

- (void)JFXImageMTKView_commonInit
{
  void *v3;
  CGFloat v4;
  CGFloat v5;
  void *v6;
  void *v7;
  MTLLibrary *v8;
  id v9;
  MTLLibrary *library;
  void *v11;
  MTLCommandQueue *v12;
  MTLCommandQueue *commandQueue;
  id v14;
  void *v15;
  MTKTextureLoader *v16;
  MTKTextureLoader *textureLoader;
  void *v18;
  MTLSamplerState *v19;
  MTLSamplerState *sampler;
  id v21;

  -[MTKView setEnableSetNeedsDisplay:](self, "setEnableSetNeedsDisplay:", 1);
  -[JFXImageMTKView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXImageMTKView setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[MTKView setColorPixelFormat:](self, "setColorPixelFormat:", 80);
  -[MTKView setClearColor:](self, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
  -[JFXImageMTKView bounds](self, "bounds");
  self->_viewSize.width = v4;
  self->_viewSize.height = v5;
  self->_textureSize = (CGSize)*MEMORY[0x24BDBF148];
  self->_needsUpdateVertices = 1;
  self->_needsUpdateTexture = 1;
  objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTKView device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v8 = (MTLLibrary *)objc_msgSend(v7, "newDefaultLibraryWithBundle:error:", v6, &v21);
  v9 = v21;
  library = self->_library;
  self->_library = v8;

  -[MTKView device](self, "device");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (MTLCommandQueue *)objc_msgSend(v11, "newCommandQueue");
  commandQueue = self->_commandQueue;
  self->_commandQueue = v12;

  v14 = objc_alloc(MEMORY[0x24BDDDB48]);
  -[MTKView device](self, "device");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (MTKTextureLoader *)objc_msgSend(v14, "initWithDevice:", v15);
  textureLoader = self->_textureLoader;
  self->_textureLoader = v16;

  -[JFXImageMTKView setupTextureCache](self, "setupTextureCache");
  -[MTKView device](self, "device");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[JFXImageMTKView buildSamplerStateWithDevice:addressMode:filter:](JFXImageMTKView, "buildSamplerStateWithDevice:addressMode:filter:", v18, 0, 1);
  v19 = (MTLSamplerState *)objc_claimAutoreleasedReturnValue();
  sampler = self->_sampler;
  self->_sampler = v19;

  self->_pixelBufferColorAttachments = 0;
  if (JFXImageMTKView_commonInit_onceToken != -1)
    dispatch_once(&JFXImageMTKView_commonInit_onceToken, &__block_literal_global_14);
  BYTE2(self->_jtImage) = JFXImageMTKView_commonInit_s_enableDebugDrawing;
  -[JFXImageMTKView setRenderingType:](self, "setRenderingType:", -1);

}

void __45__JFXImageMTKView_JFXImageMTKView_commonInit__block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "valueForKey:", CFSTR("JTImageViewDebugDraw"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    JFXImageMTKView_commonInit_s_enableDebugDrawing = objc_msgSend(v2, "BOOLForKey:", CFSTR("JTImageViewDebugDraw"));

  }
}

- (JFXImageMTKView)initWithFrame:(CGRect)a3 device:(id)a4
{
  JFXImageMTKView *v4;
  JFXImageMTKView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)JFXImageMTKView;
  v4 = -[MTKView initWithFrame:device:](&v7, sel_initWithFrame_device_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
    -[JFXImageMTKView JFXImageMTKView_commonInit](v4, "JFXImageMTKView_commonInit");
  return v5;
}

- (JFXImageMTKView)initWithCoder:(id)a3
{
  JFXImageMTKView *v3;
  JFXImageMTKView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)JFXImageMTKView;
  v3 = -[MTKView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[JFXImageMTKView JFXImageMTKView_commonInit](v3, "JFXImageMTKView_commonInit");
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)JFXImageMTKView;
  -[MTKView layoutSubviews](&v6, sel_layoutSubviews);
  -[JFXImageMTKView bounds](self, "bounds");
  if (self->_viewSize.width != v3 || self->_viewSize.height != v4)
  {
    self->_viewSize.width = v3;
    self->_viewSize.height = v4;
    self->_needsUpdateVertices = 1;
  }
}

- (void)cleanupTextures
{
  __CVBuffer *texture_RGBA;
  __CVBuffer *texture_YUV_Luma;
  __CVBuffer *texture_YUV_Chroma;
  __CVMetalTextureCache *textureCache;

  self->_textureSize = (CGSize)*MEMORY[0x24BDBF148];
  texture_RGBA = self->_texture_RGBA;
  if (texture_RGBA)
  {
    CFRelease(texture_RGBA);
    self->_texture_RGBA = 0;
  }
  texture_YUV_Luma = self->_texture_YUV_Luma;
  if (texture_YUV_Luma)
  {
    CFRelease(texture_YUV_Luma);
    self->_texture_YUV_Luma = 0;
  }
  texture_YUV_Chroma = self->_texture_YUV_Chroma;
  if (texture_YUV_Chroma)
  {
    CFRelease(texture_YUV_Chroma);
    self->_texture_YUV_Chroma = 0;
  }
  textureCache = self->_textureCache;
  if (textureCache)
    CVMetalTextureCacheFlush(textureCache, 0);
}

- (void)cleanupTextureCache
{
  __CVMetalTextureCache *textureCache;

  textureCache = self->_textureCache;
  if (textureCache)
  {
    CVMetalTextureCacheFlush(textureCache, 0);
    CFRelease(self->_textureCache);
    self->_textureCache = 0;
  }
}

- (void)setupTextureCache
{
  const __CFAllocator *v3;
  id v4;

  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  -[MTKView device](self, "device");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  CVMetalTextureCacheCreate(v3, 0, v4, 0, &self->_textureCache);

}

- (void)updateTexture
{
  void *v3;
  __CVBuffer *v4;
  unint64_t Width;
  unint64_t Height;
  CFTypeRef v7;
  const __CFAllocator *v8;
  __CVMetalTextureCache *textureCache;
  MTLTexture *v10;
  MTLTexture *mtlTexture_YUV_Luma;
  MTLTexture *v12;
  MTLTexture *mtlTexture_YUV_Chroma;
  MTLRenderPipelineState *renderPipelineState;
  MTLTexture *v15;
  MTLTexture *mtlTexture_RGBA;

  self->_needsUpdateTexture = 0;
  -[JFXImageMTKView cleanupTextures](self, "cleanupTextures");
  objc_msgSend((id)self->_renderingType, "pvImageBuffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (__CVBuffer *)objc_msgSend(v3, "cvPixelBuffer");

  if (v4)
  {
    Width = CVPixelBufferGetWidth(v4);
    Height = CVPixelBufferGetHeight(v4);
    self->_textureSize.width = (double)Width;
    self->_textureSize.height = (double)Height;
    v7 = CVBufferCopyAttachment(v4, (CFStringRef)*MEMORY[0x24BDC5570], 0);
    -[JFXImageMTKView configureRenderPipelineForColorAttachments:](self, "configureRenderPipelineForColorAttachments:", v7);
    v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    textureCache = self->_textureCache;
    if (v7)
    {
      CVMetalTextureCacheCreateTextureFromImage(v8, textureCache, v4, 0, MTLPixelFormatR8Unorm, Width, Height, 0, &self->_texture_YUV_Luma);
      CVMetalTextureGetTexture(self->_texture_YUV_Luma);
      v10 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
      mtlTexture_YUV_Luma = self->_mtlTexture_YUV_Luma;
      self->_mtlTexture_YUV_Luma = v10;

      CVMetalTextureCacheCreateTextureFromImage(v8, self->_textureCache, v4, 0, MTLPixelFormatRG8Unorm, Width >> 1, Height >> 1, 1uLL, &self->_texture_YUV_Chroma);
      CVMetalTextureGetTexture(self->_texture_YUV_Chroma);
      v12 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
      mtlTexture_YUV_Chroma = self->_mtlTexture_YUV_Chroma;
      self->_mtlTexture_YUV_Chroma = v12;

      CFRelease(v7);
    }
    else
    {
      CVMetalTextureCacheCreateTextureFromImage(v8, textureCache, v4, 0, MTLPixelFormatBGRA8Unorm, Width, Height, 0, &self->_texture_RGBA);
      CVMetalTextureGetTexture(self->_texture_RGBA);
      v15 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
      mtlTexture_RGBA = self->_mtlTexture_RGBA;
      self->_mtlTexture_RGBA = v15;

    }
  }
  else
  {
    -[JFXImageMTKView setRenderingType:](self, "setRenderingType:", -1);
    self->_pixelBufferColorAttachments = 0;
    renderPipelineState = self->_renderPipelineState;
    self->_renderPipelineState = 0;

  }
}

- (void)updateVertices
{
  if (+[JFXImageView normalizedQuadVertices:viewSize:textureSize:contentMode:](JFXImageView, "normalizedQuadVertices:viewSize:textureSize:contentMode:", &self->_anon_478[6], -[JFXImageMTKView contentMode](self, "contentMode"), self->_viewSize.width, self->_viewSize.height, self->_textureSize.width, self->_textureSize.height))
  {
    self->_needsUpdateVertices = 0;
  }
}

- (void)configureRenderPipelineForColorAttachments:(void *)a3
{
  MTLRenderPipelineState *renderPipelineState;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  MTLRenderPipelineState *v13;
  id v14;
  MTLRenderPipelineState *v15;
  id v16;

  if (self->_pixelBufferColorAttachments != a3)
  {
    self->_pixelBufferColorAttachments = a3;
    renderPipelineState = self->_renderPipelineState;
    self->_renderPipelineState = 0;

  }
  if (!self->_renderPipelineState)
  {
    v6 = (void *)-[MTLLibrary newFunctionWithName:](self->_library, "newFunctionWithName:", CFSTR("JFX_vertex_Pos2Tex2_transform"));
    v7 = 1;
    if ((void *)*MEMORY[0x24BDC5590] != a3)
      v7 = 2;
    v8 = CFSTR("JFX_fragment_YUV709_Pos4Tex2_texture2D");
    if ((void *)*MEMORY[0x24BDC5590] == a3)
      v8 = CFSTR("JFX_fragment_YUV601_Pos4Tex2_texture2D");
    if (a3)
      v9 = v7;
    else
      v9 = 0;
    if (a3)
      v10 = v8;
    else
      v10 = CFSTR("JFX_fragment_Pos4Tex2_texture2D");
    -[JFXImageMTKView setRenderingType:](self, "setRenderingType:", v9);
    v11 = (void *)-[MTLLibrary newFunctionWithName:](self->_library, "newFunctionWithName:", v10);
    -[MTKView device](self, "device");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    +[JFXImageMTKView buildRenderPipelineWithLabel:vertexFunction:fragmentFunction:device:view:error:](JFXImageMTKView, "buildRenderPipelineWithLabel:vertexFunction:fragmentFunction:device:view:error:", CFSTR("JFXImageMTKView Pipeline"), v6, v11, v12, self, &v16);
    v13 = (MTLRenderPipelineState *)objc_claimAutoreleasedReturnValue();
    v14 = v16;
    v15 = self->_renderPipelineState;
    self->_renderPipelineState = v13;

    if (v14)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("JFXImageMTKView failed to build render pipeline: %@"), v14);

    }
  }
}

- (void)drawRect:(CGRect)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v8;
  void *v9;
  void *v10;
  simd_float4x4 v11;
  float v12;
  float v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  int *v18;
  uint64_t v19;
  void *v20;
  _OWORD v21[4];

  v4 = (void *)MEMORY[0x2276A1DB0](self, a2, (__n128)a3.origin, *(__n128 *)&a3.origin.y, (__n128)a3.size, *(__n128 *)&a3.size.height);
  +[CFXApplicationState sharedInstance](CFXApplicationState, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "applicationState");

  if (v6 != 2)
  {
    if (!self->_needsUpdateTexture
      || (-[JFXImageMTKView updateTexture](self, "updateTexture"), !self->_needsUpdateTexture))
    {
      if (!self->_needsUpdateVertices
        || (-[JFXImageMTKView updateVertices](self, "updateVertices"), !self->_needsUpdateVertices))
      {
        if (self->_renderPipelineState
          && self[1].super.super.super.super.isa != (Class)-1
          && (self->_texture_RGBA || self->_texture_YUV_Luma && self->_texture_YUV_Chroma)
          && (self->_textureSize.width != *MEMORY[0x24BDBF148]
           || self->_textureSize.height != *(double *)(MEMORY[0x24BDBF148] + 8)))
        {
          -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[MTKView currentRenderPassDescriptor](self, "currentRenderPassDescriptor");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            objc_msgSend(v8, "renderCommandEncoderWithDescriptor:", v9);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setLabel:", CFSTR("JFXImageMTKView Encoder"));
            objc_msgSend(v10, "pushDebugGroup:", CFSTR("JFXImageMTKView"));
            objc_msgSend(v10, "setRenderPipelineState:", self->_renderPipelineState);
            objc_msgSend(v10, "setVertexBytes:length:atIndex:", &self->_anon_478[6], 64, 0);
            pv_simd_matrix_make_orthographic();
            if (LOBYTE(self->_jtImage))
              v12 = -1.0;
            else
              v12 = 1.0;
            if (BYTE1(self->_jtImage))
              v13 = -1.0;
            else
              v13 = 1.0;
            pv_simd_matrix_scale(v11, v12, v13, 1.0);
            v21[0] = v14;
            v21[1] = v15;
            v21[2] = v16;
            v21[3] = v17;
            objc_msgSend(v10, "setVertexBytes:length:atIndex:", v21, 64, 1);
            if (self[1].super.super.super.super.isa)
            {
              objc_msgSend(v10, "setFragmentTexture:atIndex:", self->_mtlTexture_YUV_Luma, 0);
              v18 = &OBJC_IVAR___JFXImageMTKView__mtlTexture_YUV_Chroma;
              v19 = 1;
            }
            else
            {
              v19 = 0;
              v18 = &OBJC_IVAR___JFXImageMTKView__mtlTexture_RGBA;
            }
            objc_msgSend(v10, "setFragmentTexture:atIndex:", *(Class *)((char *)&self->super.super.super.super.isa + *v18), v19);
            objc_msgSend(v10, "setFragmentSamplerState:atIndex:", self->_sampler, 0);
            objc_msgSend(v10, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
            objc_msgSend(v10, "popDebugGroup");
            objc_msgSend(v10, "endEncoding");
            -[MTKView currentDrawable](self, "currentDrawable");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20)
              objc_msgSend(v8, "presentDrawable:", v20);

          }
          objc_msgSend(v8, "commit");

        }
      }
    }
  }
  objc_autoreleasePoolPop(v4);
}

- (void)setJtImage:(id)a3
{
  id v5;
  int64_t *p_renderingType;
  void *v7;
  id v8;

  v5 = a3;
  p_renderingType = &self->_renderingType;
  if ((id)self->_renderingType != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_renderingType, a3);
    if (*p_renderingType)
    {
      objc_msgSend((id)*p_renderingType, "pvImageBuffer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "canCreateCVPixelBuffer");

    }
    self->_needsUpdateTexture = 1;
    self->_needsUpdateVertices = 1;
    -[JFXImageMTKView updateDebugDrawing](self, "updateDebugDrawing");
    -[JFXImageMTKView setNeedsDisplay](self, "setNeedsDisplay");
    v5 = v8;
  }

}

- (void)setRenderingType:(int64_t)a3
{
  if (self[1].super.super.super.super.isa != (Class)a3)
  {
    self[1].super.super.super.super.isa = (Class)a3;
    -[JFXImageMTKView updateDebugDrawing](self, "updateDebugDrawing");
  }
}

- (void)setFlipX:(BOOL)a3
{
  if (LOBYTE(self->_jtImage) != a3)
  {
    LOBYTE(self->_jtImage) = a3;
    -[JFXImageMTKView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setFlipY:(BOOL)a3
{
  if (BYTE1(self->_jtImage) != a3)
  {
    BYTE1(self->_jtImage) = a3;
    -[JFXImageMTKView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setContentMode:(int64_t)a3
{
  uint64_t v5;
  objc_super v6;

  v5 = -[JFXImageMTKView contentMode](self, "contentMode");
  if (a3 != 3 && v5 != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)JFXImageMTKView;
    -[JFXImageMTKView setContentMode:](&v6, sel_setContentMode_, a3);
    self->_needsUpdateVertices = 1;
    -[JFXImageMTKView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setEnableDebugDrawing:(BOOL)a3
{
  if (BYTE2(self->_jtImage) != a3)
  {
    BYTE2(self->_jtImage) = a3;
    -[JFXImageMTKView updateDebugDrawing](self, "updateDebugDrawing");
  }
}

- (void)updateDebugDrawing
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  id v8;

  if (BYTE2(self->_jtImage))
  {
    +[JFXImageView colorFromRenderingType:](JFXImageView, "colorFromRenderingType:", self[1].super.super.super.super.isa);
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = objc_msgSend(v3, "CGColor");
    -[JFXImageMTKView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBorderColor:", v4);

    -[JFXImageMTKView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 4.0;
  }
  else
  {
    -[JFXImageMTKView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0.0;
  }
  v8 = v6;
  objc_msgSend(v6, "setBorderWidth:", v7);

}

+ (id)buildRenderPipelineWithLabel:(id)a3 vertexFunction:(id)a4 fragmentFunction:(id)a5 device:(id)a6 view:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;

  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = (void *)objc_opt_new();
  objc_msgSend(v18, "setLabel:", v17);

  objc_msgSend(v18, "setRasterSampleCount:", objc_msgSend(v13, "sampleCount"));
  objc_msgSend(v18, "setVertexFunction:", v16);

  objc_msgSend(v18, "setFragmentFunction:", v15);
  v19 = objc_msgSend(v13, "colorPixelFormat");
  objc_msgSend(v18, "colorAttachments");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setPixelFormat:", v19);

  v22 = objc_msgSend(v13, "depthStencilPixelFormat");
  objc_msgSend(v18, "setDepthAttachmentPixelFormat:", v22);
  v23 = (void *)objc_msgSend(v14, "newRenderPipelineStateWithDescriptor:error:", v18, a8);

  return v23;
}

+ (id)buildSamplerStateWithDevice:(id)a3 addressMode:(unint64_t)a4 filter:(unint64_t)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setSAddressMode:", a4);
  objc_msgSend(v8, "setTAddressMode:", a4);
  objc_msgSend(v8, "setMinFilter:", a5);
  objc_msgSend(v8, "setMagFilter:", a5);
  v9 = (void *)objc_msgSend(v7, "newSamplerStateWithDescriptor:", v8);

  return v9;
}

- (JTImage)jtImage
{
  return (JTImage *)self->_renderingType;
}

- (int64_t)renderingType
{
  return (int64_t)self[1].super.super.super.super.isa;
}

- (BOOL)flipX
{
  return (BOOL)self->_jtImage;
}

- (BOOL)flipY
{
  return BYTE1(self->_jtImage);
}

- (BOOL)enableDebugDrawing
{
  return BYTE2(self->_jtImage);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderingType, 0);
  objc_storeStrong((id *)&self->_sampler, 0);
  objc_storeStrong((id *)&self->_mtlTexture_YUV_Chroma, 0);
  objc_storeStrong((id *)&self->_mtlTexture_YUV_Luma, 0);
  objc_storeStrong((id *)&self->_mtlTexture_RGBA, 0);
  objc_storeStrong((id *)&self->_textureLoader, 0);
  objc_storeStrong((id *)&self->_renderPipelineState, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_library, 0);
}

@end
