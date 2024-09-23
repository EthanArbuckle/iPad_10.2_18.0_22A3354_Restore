@implementation JFXAnimojiEffectRenderer

+ (CGSize)animojiBufferSizeWithImageSize:(CGSize)result interfaceOrientation:(int64_t)a4
{
  _BOOL4 v5;
  double height;
  double v7;

  v5 = result.height > result.width || (unint64_t)(a4 - 3) < 0xFFFFFFFFFFFFFFFELL;
  if (v5)
    height = result.height;
  else
    height = result.width;
  if (!v5)
    result.width = result.height;
  v7 = height;
  result.height = v7;
  return result;
}

+ (BOOL)isSupported
{
  if (isSupported_onceToken != -1)
    dispatch_once(&isSupported_onceToken, &__block_literal_global_7);
  return isSupported_isAnimojiCapableDevice;
}

uint64_t __39__JFXAnimojiEffectRenderer_isSupported__block_invoke()
{
  char v0;
  uint64_t result;

  v0 = objc_msgSend(MEMORY[0x24BDB14C0], "isSupported");
  result = objc_msgSend(MEMORY[0x24BDB14C0], "supportsFrameSemantics:", 1);
  isSupported_isAnimojiCapableDevice = v0 & result;
  return result;
}

- (JFXAnimojiEffectRenderer)init
{
  return -[JFXAnimojiEffectRenderer initWithConstrainedHeadPose:](self, "initWithConstrainedHeadPose:", 0);
}

- (JFXAnimojiEffectRenderer)initWithConstrainedHeadPose:(BOOL)a3
{
  char *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  id v16;
  dispatch_queue_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  id v25;
  dispatch_queue_t v26;
  void *v27;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)JFXAnimojiEffectRenderer;
  v4 = -[JFXAnimojiEffectRenderer init](&v29, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BE0B4A8]);
    objc_msgSend(v4, "setAvatarStore:", v5);

    v6 = objc_alloc_init(MEMORY[0x24BDD1648]);
    v7 = (void *)*((_QWORD *)v4 + 9);
    *((_QWORD *)v4 + 9) = v6;

    v8 = objc_alloc_init(MEMORY[0x24BDD1648]);
    v9 = (void *)*((_QWORD *)v4 + 8);
    *((_QWORD *)v4 + 8) = v8;

    *((_QWORD *)v4 + 12) = 0;
    *(_WORD *)(v4 + 25) = 256;
    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@.%@.puppetLoading"), v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_retainAutorelease(v15);
    v17 = dispatch_queue_create((const char *)objc_msgSend(v16, "UTF8String"), 0);
    v18 = (void *)*((_QWORD *)v4 + 1);
    *((_QWORD *)v4 + 1) = v17;

    v19 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bundleIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%@.%@.puppetRendering"), v21, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = objc_retainAutorelease(v24);
    v26 = dispatch_queue_create((const char *)objc_msgSend(v25, "UTF8String"), 0);
    v27 = (void *)*((_QWORD *)v4 + 2);
    *((_QWORD *)v4 + 2) = v26;

    v4[24] = 0;
    v4[27] = a3;
    objc_msgSend(v4, "createTextureCaches");

  }
  return (JFXAnimojiEffectRenderer *)v4;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferPoolRelease(self->_inputBufferPool);
  CFRelease(self->_metalTextureCache);
  if (!-[JFXAnimojiEffectRenderer constrainHeadPose](self, "constrainHeadPose")
    && -[JFXAnimojiEffectRenderer metalDepthTextureCache](self, "metalDepthTextureCache"))
  {
    CFRelease(-[JFXAnimojiEffectRenderer metalDepthTextureCache](self, "metalDepthTextureCache"));
  }
  v3.receiver = self;
  v3.super_class = (Class)JFXAnimojiEffectRenderer;
  -[JFXAnimojiEffectRenderer dealloc](&v3, sel_dealloc);
}

- (void)clear
{
  void *v3;
  __CVMetalTextureCache *metalTextureCache;
  __CVPixelBufferPool *inputBufferPool;
  id v6;

  -[JFXAnimojiEffectRenderer rendererLock](self, "rendererLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  -[JFXAnimojiEffectRenderer setCurrentPuppet:](self, "setCurrentPuppet:", 0);
  -[JFXAnimojiEffectRenderer clearRenderer_renderLocked](self, "clearRenderer_renderLocked");
  -[JFXAnimojiEffectRenderer setRenderer:](self, "setRenderer:", 0);
  -[JFXAnimojiEffectRenderer setAvatarStore:](self, "setAvatarStore:", 0);
  metalTextureCache = self->_metalTextureCache;
  if (metalTextureCache)
    CFRelease(metalTextureCache);
  if (!-[JFXAnimojiEffectRenderer constrainHeadPose](self, "constrainHeadPose")
    && -[JFXAnimojiEffectRenderer metalDepthTextureCache](self, "metalDepthTextureCache"))
  {
    CFRelease(-[JFXAnimojiEffectRenderer metalDepthTextureCache](self, "metalDepthTextureCache"));
  }
  -[JFXAnimojiEffectRenderer createTextureCaches](self, "createTextureCaches");
  inputBufferPool = self->_inputBufferPool;
  if (inputBufferPool)
    CVPixelBufferPoolFlush(inputBufferPool, 1uLL);
  -[JFXAnimojiEffectRenderer rendererLock](self, "rendererLock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

}

- (void)flush
{
  void *v3;
  __CVMetalTextureCache *metalTextureCache;
  __CVMetalTextureCache *metalDepthTextureCache;
  __CVPixelBufferPool *inputBufferPool;
  id v7;

  -[JFXAnimojiEffectRenderer rendererLock](self, "rendererLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  metalTextureCache = self->_metalTextureCache;
  if (metalTextureCache)
    CVMetalTextureCacheFlush(metalTextureCache, 0);
  if (!-[JFXAnimojiEffectRenderer constrainHeadPose](self, "constrainHeadPose"))
  {
    metalDepthTextureCache = self->_metalDepthTextureCache;
    if (metalDepthTextureCache)
      CVMetalTextureCacheFlush(metalDepthTextureCache, 0);
  }
  inputBufferPool = self->_inputBufferPool;
  if (inputBufferPool)
    CVPixelBufferPoolFlush(inputBufferPool, 1uLL);
  -[JFXAnimojiEffectRenderer rendererLock](self, "rendererLock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (void)clearRenderer_renderLocked
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[JFXAnimojiEffectRenderer renderer](self, "renderer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[JFXAnimojiEffectRenderer renderer](self, "renderer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEnableDepthMask:", 0);

    LODWORD(v4) = -[JFXAnimojiEffectRenderer constrainHeadPose](self, "constrainHeadPose");
    -[JFXAnimojiEffectRenderer renderer](self, "renderer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    if ((_DWORD)v4)
    {
      objc_msgSend(v5, "faceTracker");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "discardARFrameData");

    }
    else
    {
      objc_msgSend(v5, "setCapturedDepth:", 0);
    }

  }
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  -[NSLock lock](self->_rendererLock, "lock");
  -[JFXAnimojiEffectRenderer currentPuppet](self, "currentPuppet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSLock unlock](self->_rendererLock, "unlock");
  v8.receiver = self;
  v8.super_class = (Class)JFXAnimojiEffectRenderer;
  -[JFXAnimojiEffectRenderer description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(" %@"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (AVTAvatarStore)avatarStore
{
  AVTAvatarStore *avatarStore;
  id v4;

  avatarStore = self->_avatarStore;
  if (!avatarStore)
  {
    v4 = objc_alloc_init(MEMORY[0x24BE0B4A8]);
    -[JFXAnimojiEffectRenderer setAvatarStore:](self, "setAvatarStore:", v4);

    avatarStore = self->_avatarStore;
  }
  return avatarStore;
}

- (void)setupInputBufferPoolForSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[3];
  _QWORD v16[4];

  height = a3.height;
  width = a3.width;
  v16[3] = *MEMORY[0x24BDAC8D0];
  -[JFXAnimojiEffectRenderer workingSize](self, "workingSize");
  if (width != v7 || height != v6)
  {
    -[JFXAnimojiEffectRenderer setWorkingSize:](self, "setWorkingSize:", width, height);
    if (-[JFXAnimojiEffectRenderer inputBufferPool](self, "inputBufferPool"))
    {
      CVPixelBufferPoolRelease(-[JFXAnimojiEffectRenderer inputBufferPool](self, "inputBufferPool"));
      -[JFXAnimojiEffectRenderer setInputBufferPool:](self, "setInputBufferPool:", 0);
    }
    v9 = (void *)objc_opt_new();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_24EE9BA20, *MEMORY[0x24BDC56B8]);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDC5690]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", width);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BDC5708]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", height);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BDC5650]);

    objc_msgSend(MEMORY[0x24BE78FF8], "sRGBColorSpace");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "nclcTriplet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v15[0] = *MEMORY[0x24BDC5490];
    v16[0] = objc_msgSend(v13, "colorPrimary");
    v15[1] = *MEMORY[0x24BDC5510];
    v16[1] = objc_msgSend(v13, "transferFunction");
    v15[2] = *MEMORY[0x24BDC5570];
    v16[2] = objc_msgSend(v13, "ycbcrMatrix");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BDC53F8]);

    CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, (CFDictionaryRef)v9, &self->_inputBufferPool);
  }
}

- (id)renderWithTime:(id *)a3 metadata:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __CVBuffer *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;

  v5 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("JFXAnimojiRendererMetadata_JFXARMetadata"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("JFXAnimojiRendererMetadata_DepthData"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("JFXAnimojiRendererMetadata_Effect"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("JFXAnimojiRendererMetadata_DataRepresentation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("JFXAnimojiRendererMetadata_BackgroundColor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arFrame");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqualToData:", v10);

  v23 = v6;
  if (v11)
  {
    objc_msgSend(v6, "animojiPhysicsBlendShapes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("JFXAnimojiRendererMetadata_AVCaptureVideoOrientation"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "integerValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("JFXAnimojiRendererMetadata_UIInterfaceOrientation"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "integerValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("JFXAnimojiRendererMetadata_RenderSize"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "CGSizeValue");
  -[JFXAnimojiEffectRenderer setupInputBufferPoolForSize:](self, "setupInputBufferPoolForSize:");
  -[JFXAnimojiEffectRenderer renderPassLock](self, "renderPassLock");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "lock");

  kdebug_trace();
  v19 = -[JFXAnimojiEffectRenderer newPixelBufferRenderedFromARFrame:withEffect:depthData:captureOrientation:interfaceOrientation:preRecordedBlendShapes:backgroundColor:](self, "newPixelBufferRenderedFromARFrame:withEffect:depthData:captureOrientation:interfaceOrientation:preRecordedBlendShapes:backgroundColor:", v9, v7, v25, v14, v16, v12, v24);
  kdebug_trace();
  -[JFXAnimojiEffectRenderer renderPassLock](self, "renderPassLock");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "unlock");

  if (v19)
  {
    objc_msgSend(MEMORY[0x24BE79030], "imageWithCVPixelBuffer:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    CVPixelBufferRelease(v19);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)renderWithInputs:(id)a3 time:(id *)a4 userContext:(id)a5 compositeContext:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v15;

  v9 = a3;
  v15 = *a4;
  -[JFXAnimojiEffectRenderer renderWithTime:metadata:](self, "renderWithTime:metadata:", &v15, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
LABEL_3:
    v13 = v12;
    goto LABEL_4;
  }
  if (!v9)
  {
    v13 = 0;
    goto LABEL_4;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", &unk_24EE9BA38);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", &unk_24EE9BA38);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
LABEL_4:

  return v13;
}

- (id)createNewRendererForPuppet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v29;
  id v30;
  id v31;
  _QWORD v32[2];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "dataRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && objc_msgSend(MEMORY[0x24BE0B400], "canLoadDataRepresentation:", v5))
  {
    v31 = 0;
    objc_msgSend(MEMORY[0x24BE0B400], "avatarWithDataRepresentation:error:", v5, &v31);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v31;
  }
  else
  {
    v8 = (void *)MEMORY[0x24BE0B488];
    objc_msgSend(v4, "effectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "requestForAvatarWithIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[JFXAnimojiEffectRenderer avatarStore](self, "avatarStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    objc_msgSend(v11, "avatarsForFetchRequest:error:", v10, &v30);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v30;

    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x24BDD17C8];
    NSStringFromJFXEffectType(7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "effectID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("Unable to render effect - type: %@, name: %@, reason: An Animoji with the specified name does not exist"), v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(MEMORY[0x24BE0B498], "avatarForRecord:", v13);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      JFXLog_animoji();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[JFXAnimojiEffectRenderer createNewRendererForPuppet:].cold.1((uint64_t)v17, v18);

      v6 = 0;
    }

    v7 = v29;
  }
  v19 = (void *)MEMORY[0x24BE0B438];
  v32[0] = *MEMORY[0x24BE0B3E0];
  v20 = -[JFXAnimojiEffectRenderer constrainHeadPose](self, "constrainHeadPose");
  v21 = MEMORY[0x24BDBD1C8];
  v22 = MEMORY[0x24BDBD1C0];
  if (v20)
    v23 = MEMORY[0x24BDBD1C0];
  else
    v23 = MEMORY[0x24BDBD1C8];
  v33[0] = v23;
  v32[1] = *MEMORY[0x24BE0B3D8];
  if (-[JFXAnimojiEffectRenderer constrainHeadPose](self, "constrainHeadPose"))
    v24 = v21;
  else
    v24 = v22;
  v33[1] = v24;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "rendererWithDevice:options:", 0, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "setAvatar:", v6);
  v27 = (void *)objc_opt_new();
  objc_msgSend(v26, "setFaceTracker:", v27);

  if (!-[JFXAnimojiEffectRenderer constrainHeadPose](self, "constrainHeadPose"))
    objc_msgSend(v26, "setEnableDepthMask:withFlippedDepth:", 1, 1);

  return v26;
}

- (void)asyncLoadNewPuppet:(id)a3 currentPuppet:(id)a4 captureOrientation:(int64_t)a5 interfaceOrientation:(int64_t)a6 primeFrame:(id)a7 backgroundColor:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *puppetLoadingQ;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD block[5];
  id v24;
  id v25;
  id v26;
  id v27;
  int64_t v28;
  int64_t v29;

  v14 = a3;
  v15 = a4;
  v16 = a7;
  v17 = a8;
  puppetLoadingQ = self->_puppetLoadingQ;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __128__JFXAnimojiEffectRenderer_asyncLoadNewPuppet_currentPuppet_captureOrientation_interfaceOrientation_primeFrame_backgroundColor___block_invoke;
  block[3] = &unk_24EE58598;
  block[4] = self;
  v24 = v14;
  v28 = a5;
  v29 = a6;
  v25 = v16;
  v26 = v15;
  v27 = v17;
  v19 = v17;
  v20 = v15;
  v21 = v16;
  v22 = v14;
  dispatch_async(puppetLoadingQ, block);

}

void __128__JFXAnimojiEffectRenderer_asyncLoadNewPuppet_currentPuppet_captureOrientation_interfaceOrientation_primeFrame_backgroundColor___block_invoke(uint64_t a1)
{
  void *v2;
  Float64 v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  CMTime v7;
  _QWORD v8[5];
  id v9;
  id v10;
  CMTime v11;

  if (objc_msgSend(*(id *)(a1 + 32), "currentPuppetIsEqualTo:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 32), "createNewRendererForPuppet:", *(_QWORD *)(a1 + 40));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 32), "currentPuppetIsEqualTo:", *(_QWORD *)(a1 + 40)))
    {
      if ((objc_msgSend(*(id *)(a1 + 32), "setupHeadPoseAndBlendShapesForFrame:forRenderer:captureOrientation:interfaceOrientation:isInitialSetup:", *(_QWORD *)(a1 + 48), v2, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), 1) & 1) == 0)
      {
        JFXLog_animoji();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v11.value) = 0;
          _os_log_impl(&dword_2269A9000, v6, OS_LOG_TYPE_DEFAULT, "setupPuppetRenderer was not successful", (uint8_t *)&v11, 2u);
        }

        if ((objc_msgSend(*(id *)(a1 + 32), "currentPuppetIsEqualTo:", *(_QWORD *)(a1 + 40)) & 1) == 0)
          goto LABEL_11;
        goto LABEL_10;
      }
      if ((objc_msgSend(*(id *)(a1 + 32), "currentPuppetIsEqualTo:", *(_QWORD *)(a1 + 40)) & 1) != 0)
      {
        if (!*(_QWORD *)(a1 + 56))
        {
          memset(&v11, 0, sizeof(v11));
          objc_msgSend(*(id *)(a1 + 48), "timestamp");
          CMTimeMakeWithSeconds(&v11, v3, 1000000000);
          v4 = *(void **)(a1 + 32);
          v5 = *(_QWORD *)(a1 + 64);
          v8[0] = MEMORY[0x24BDAC760];
          v8[1] = 3221225472;
          v8[2] = __128__JFXAnimojiEffectRenderer_asyncLoadNewPuppet_currentPuppet_captureOrientation_interfaceOrientation_primeFrame_backgroundColor___block_invoke_45;
          v8[3] = &unk_24EE58570;
          v8[4] = v4;
          v9 = v2;
          v10 = *(id *)(a1 + 40);
          v7 = v11;
          objc_msgSend(v4, "renderAnimoji:withPresentationTime:frame:depthData:backgroundColor:completionBlock:", v9, &v7, 0, 0, v5, v8);

          goto LABEL_11;
        }
LABEL_10:
        objc_msgSend(*(id *)(a1 + 32), "updateCurrentRenderer:withPuppet:", v2, *(_QWORD *)(a1 + 40));
      }
    }
LABEL_11:

  }
}

uint64_t __128__JFXAnimojiEffectRenderer_asyncLoadNewPuppet_currentPuppet_captureOrientation_interfaceOrientation_primeFrame_backgroundColor___block_invoke_45(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateCurrentRenderer:withPuppet:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)updateCurrentRenderer:(id)a3 withPuppet:(id)a4
{
  id v6;
  id v7;
  NSObject *puppetRenderingQ;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  puppetRenderingQ = self->_puppetRenderingQ;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__JFXAnimojiEffectRenderer_updateCurrentRenderer_withPuppet___block_invoke;
  block[3] = &unk_24EE585C0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(puppetRenderingQ, block);

}

void __61__JFXAnimojiEffectRenderer_updateCurrentRenderer_withPuppet___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "rendererLock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lock");

  objc_msgSend(*(id *)(a1 + 32), "currentPuppet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 40));

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "clearRenderer_renderLocked");
    objc_msgSend(*(id *)(a1 + 32), "setRenderer:", *(_QWORD *)(a1 + 48));
  }
  objc_msgSend(*(id *)(a1 + 32), "rendererLock");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

}

- (BOOL)currentPuppetIsEqualTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;

  v4 = a3;
  -[JFXAnimojiEffectRenderer rendererLock](self, "rendererLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[JFXAnimojiEffectRenderer currentPuppet](self, "currentPuppet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", v4);

  -[JFXAnimojiEffectRenderer rendererLock](self, "rendererLock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

  return v7;
}

- (BOOL)setupPoseForPreRecordedBlendShapes:(id)a3 forRenderer:(id)a4 captureOrientation:(int64_t)a5 interfaceOrientation:(int64_t)a6 withFrame:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *);
  void *v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  objc_msgSend(MEMORY[0x24BDE8290], "begin");
  objc_msgSend(MEMORY[0x24BDE8290], "setAnimationDuration:", 0.0);
  if (-[JFXAnimojiEffectRenderer constrainHeadPose](self, "constrainHeadPose"))
  {
    objc_msgSend(v13, "scene");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "rootNode");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __125__JFXAnimojiEffectRenderer_setupPoseForPreRecordedBlendShapes_forRenderer_captureOrientation_interfaceOrientation_withFrame___block_invoke;
    v35[3] = &unk_24EE585E8;
    v36 = v12;
    v37 = v13;
    objc_msgSend(v16, "enumerateHierarchyUsingBlock:", v35);

    v17 = 1;
    v18 = v36;
  }
  else
  {
    if ((unint64_t)(a5 - 1) > 3)
      v19 = 0;
    else
      v19 = qword_226AB7138[a5 - 1];
    objc_msgSend(v13, "faceTracker");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setInterfaceOrientation:", a6);

    objc_msgSend(MEMORY[0x24BE0B420], "trackingInfoWithARFrame:inputOrientation:outputOrientation:", v14, v19, a6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v18 != 0;
    if (v18)
    {
      objc_msgSend(v13, "avatar");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "pointOfView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "applyHeadPoseWithTrackingInfo:gazeCorrection:pointOfView:", v18, 0, v22);

      objc_msgSend(v13, "scene");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "rootNode");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = MEMORY[0x24BDAC760];
      v30 = 3221225472;
      v31 = __125__JFXAnimojiEffectRenderer_setupPoseForPreRecordedBlendShapes_forRenderer_captureOrientation_interfaceOrientation_withFrame___block_invoke_2;
      v32 = &unk_24EE585E8;
      v33 = v12;
      v25 = v13;
      v34 = v25;
      objc_msgSend(v24, "enumerateHierarchyUsingBlock:", &v29);

      objc_msgSend(v25, "avatar", v29, v30, v31, v32);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "pointOfView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "applyHeadPoseWithTrackingInfo:gazeCorrection:pointOfView:", v18, 0, v27);

      v17 = 1;
    }
  }

  objc_msgSend(MEMORY[0x24BDE8290], "commit");
  return v17;
}

void __125__JFXAnimojiEffectRenderer_setupPoseForPreRecordedBlendShapes_forRenderer_captureOrientation_interfaceOrientation_withFrame___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = AVTMorphTargetNameDefinesPose(v3);

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v14, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "scene");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "rootNode");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "childNodeWithName:recursively:", v10, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "presentationNode");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "morpher");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setWeights:", v7);

    }
  }

}

void __125__JFXAnimojiEffectRenderer_setupPoseForPreRecordedBlendShapes_forRenderer_captureOrientation_interfaceOrientation_withFrame___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = AVTMorphTargetNameDefinesPose(v3);

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v14, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "scene");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "rootNode");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "childNodeWithName:recursively:", v10, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "presentationNode");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "morpher");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setWeights:", v7);

    }
  }

}

- (BOOL)setupHeadPoseAndBlendShapesForFrame:(id)a3 forRenderer:(id)a4 captureOrientation:(int64_t)a5 interfaceOrientation:(int64_t)a6 isInitialSetup:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  int v31;
  void *v32;
  uint64_t v33;

  v7 = a7;
  v33 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = v13;
  v15 = 0;
  if (v12 && v13)
  {
    objc_msgSend(MEMORY[0x24BDE8290], "begin");
    objc_msgSend(MEMORY[0x24BDE8290], "setAnimationDuration:", 0.0);
    if (-[JFXAnimojiEffectRenderer constrainHeadPose](self, "constrainHeadPose"))
    {
      v15 = 1;
    }
    else
    {
      if ((unint64_t)(a5 - 1) > 3)
        v16 = 0;
      else
        v16 = qword_226AB7138[a5 - 1];
      objc_msgSend(v14, "faceTracker");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setInterfaceOrientation:", a6);

      objc_msgSend(MEMORY[0x24BE0B420], "trackingInfoWithARFrame:inputOrientation:outputOrientation:", v12, v16, a6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v18 != 0;
      -[JFXAnimojiEffectRenderer trackingLossDelegate](self, "trackingLossDelegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "shouldShowAnimojiFaceReticle");

      if (v18)
      {
        if ((v20 & 1) == 0)
        {
          -[JFXAnimojiEffectRenderer trackingLossDelegate](self, "trackingLossDelegate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "hideAnimojiFaceReticleForTrackingGain");

        }
        objc_msgSend(v14, "avatar");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "pointOfView");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "applyHeadPoseWithTrackingInfo:gazeCorrection:pointOfView:", v18, 0, v23);

        objc_msgSend(v22, "applyBlendShapesWithTrackingInfo:", v18);
        if (v7)
        {
          objc_msgSend(v14, "pointOfView");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "applyHeadPoseWithTrackingInfo:gazeCorrection:pointOfView:", v18, 0, v24);

        }
        if (self->_logged_render_failed)
        {
          JFXLog_animoji();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            NSStringFromJFXEffectType(7);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = 138543362;
            v32 = v26;
            _os_log_impl(&dword_2269A9000, v25, OS_LOG_TYPE_DEFAULT, "Rendering effect - type: %{public}@", (uint8_t *)&v31, 0xCu);

          }
          self->_logged_render_failed = 0;
        }

      }
      else
      {
        if (v20)
        {
          -[JFXAnimojiEffectRenderer trackingLossDelegate](self, "trackingLossDelegate");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setupAnimojiFaceReticleForTrackingLoss");

          -[JFXAnimojiEffectRenderer trackingLossDelegate](self, "trackingLossDelegate");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "showAnimojiFaceReticleForTrackingLoss");

        }
        if (!self->_logged_render_failed)
        {
          JFXLog_animoji();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            -[JFXAnimojiEffectRenderer setupHeadPoseAndBlendShapesForFrame:forRenderer:captureOrientation:interfaceOrientation:isInitialSetup:].cold.1(self, v29);

          self->_logged_render_failed = 1;
        }
      }

    }
    objc_msgSend(MEMORY[0x24BDE8290], "commit");
  }

  return v15;
}

- (id)preRecordedBlendShapesForFrame:(id)a3 captureOrientation:(int64_t)a4 interfaceOrientation:(int64_t)a5 backgroundColor:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  void *v16;
  id v18;

  v18 = 0;
  v10 = a6;
  v11 = a3;
  -[JFXAnimojiEffectRenderer currentPuppet](self, "currentPuppet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXAnimojiEffectRenderer JFX_getRenderer:forAnimojiEffect:primeFrame:captureOrientation:interfaceOrientation:backgroundColor:](self, "JFX_getRenderer:forAnimojiEffect:primeFrame:captureOrientation:interfaceOrientation:backgroundColor:", &v18, v12, 0, a4, a5, v10);

  v13 = v18;
  LODWORD(a4) = -[JFXAnimojiEffectRenderer setupHeadPoseAndBlendShapesForFrame:forRenderer:captureOrientation:interfaceOrientation:isInitialSetup:](self, "setupHeadPoseAndBlendShapesForFrame:forRenderer:captureOrientation:interfaceOrientation:isInitialSetup:", v11, v13, a4, a5, 1);
  objc_msgSend(v11, "timestamp");
  v15 = v14;

  objc_msgSend(v13, "updateAtTime:", v15);
  v16 = 0;
  if ((_DWORD)a4)
  {
    -[JFXAnimojiEffectRenderer JFX_blendShapesForRenderer:](self, "JFX_blendShapesForRenderer:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (BOOL)JFX_getRenderer:(id *)a3 forAnimojiEffect:(id)a4 primeFrame:(id)a5 captureOrientation:(int64_t)a6 interfaceOrientation:(int64_t)a7 backgroundColor:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;

  v14 = a4;
  v15 = a5;
  v16 = a8;
  -[JFXAnimojiEffectRenderer rendererLock](self, "rendererLock");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "lock");

  -[JFXAnimojiEffectRenderer currentPuppet](self, "currentPuppet");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqual:", v14);

  if ((v19 & 1) == 0)
  {
    if (!-[JFXAnimojiEffectRenderer asynchronouslyLoadNewPuppets](self, "asynchronouslyLoadNewPuppets"))
    {
      -[JFXAnimojiEffectRenderer createNewRendererForPuppet:](self, "createNewRendererForPuppet:", v14);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[JFXAnimojiEffectRenderer setRenderer:](self, "setRenderer:", v22);

      -[JFXAnimojiEffectRenderer setCurrentPuppet:](self, "setCurrentPuppet:", v14);
      v21 = 1;
      goto LABEL_6;
    }
    -[JFXAnimojiEffectRenderer currentPuppet](self, "currentPuppet");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXAnimojiEffectRenderer setCurrentPuppet:](self, "setCurrentPuppet:", v14);
    -[JFXAnimojiEffectRenderer asyncLoadNewPuppet:currentPuppet:captureOrientation:interfaceOrientation:primeFrame:backgroundColor:](self, "asyncLoadNewPuppet:currentPuppet:captureOrientation:interfaceOrientation:primeFrame:backgroundColor:", v14, v20, a6, a7, v15, v16);

  }
  v21 = 0;
LABEL_6:
  -[JFXAnimojiEffectRenderer renderer](self, "renderer");
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  -[JFXAnimojiEffectRenderer rendererLock](self, "rendererLock");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "unlock");

  return v21;
}

- (void)renderFrame:(id)a3 withEffect:(id)a4 depthData:(id)a5 captureOrientation:(int64_t)a6 interfaceOrientation:(int64_t)a7 preRecordedBlendShapes:(id)a8 backgroundColor:(id)a9 completionBlock:(id)a10
{
  id v16;
  id v17;
  id v18;
  _BOOL8 v19;
  id v20;
  void *v21;
  BOOL v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  BOOL v27;
  NSObject *puppetRenderingQ;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  id v39;
  void *v40;
  char v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  _QWORD block[4];
  id v53;
  JFXAnimojiEffectRenderer *v54;
  id v55;
  id v56;
  id v57;
  id v58;
  uint64_t *v59;
  id v60;
  id location;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  char v69;
  id v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17 = a4;
  v50 = a5;
  v51 = a8;
  v18 = a9;
  v48 = v17;
  v49 = a10;
  v70 = 0;
  v19 = -[JFXAnimojiEffectRenderer JFX_getRenderer:forAnimojiEffect:primeFrame:captureOrientation:interfaceOrientation:backgroundColor:](self, "JFX_getRenderer:forAnimojiEffect:primeFrame:captureOrientation:interfaceOrientation:backgroundColor:", &v70, v17, v16, a6, a7, v18);
  v20 = v70;
  v66 = 0;
  v67 = &v66;
  v68 = 0x2020000000;
  v69 = 0;
  if (-[JFXAnimojiEffectRenderer constrainHeadPose](self, "constrainHeadPose"))
  {
    if (v20)
    {
      if (objc_msgSend(v16, "segmentationBuffer"))
      {
        objc_msgSend(v20, "faceTracker");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "updateWithARFrame:captureOrientation:interfaceOrientation:constrainHeadPose:mirroredDepthData:", v16, a6, a7, -[JFXAnimojiEffectRenderer constrainHeadPose](self, "constrainHeadPose"), 1);
      }
      else
      {
        objc_msgSend(v20, "faceTracker");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v47) = 1;
        objc_msgSend(v21, "updateWithARFrame:worldAlignment:fallBackDepthData:captureOrientation:interfaceOrientation:constrainHeadPose:mirroredDepthData:", v16, 2, v50, a6, a7, -[JFXAnimojiEffectRenderer constrainHeadPose](self, "constrainHeadPose"), v47);
      }

      if (v51)
      {
        v27 = -[JFXAnimojiEffectRenderer setupPoseForPreRecordedBlendShapes:forRenderer:captureOrientation:interfaceOrientation:withFrame:](self, "setupPoseForPreRecordedBlendShapes:forRenderer:captureOrientation:interfaceOrientation:withFrame:", v51, v20, a6, a7, v16);
LABEL_12:
        *((_BYTE *)v67 + 24) = v27;
        goto LABEL_13;
      }
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      objc_msgSend(v16, "anchors");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
      if (v35)
      {
        v36 = *(_QWORD *)v63;
        while (2)
        {
          for (i = 0; i != v35; ++i)
          {
            if (*(_QWORD *)v63 != v36)
              objc_enumerationMutation(v34);
            v38 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v39 = v38;
              if (objc_msgSend(v39, "isTracked"))
              {
                *((_BYTE *)v67 + 24) = 1;

                goto LABEL_26;
              }

            }
          }
          v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
          if (v35)
            continue;
          break;
        }
      }
LABEL_26:

      if (!*((_BYTE *)v67 + 24))
      {
        -[JFXAnimojiEffectRenderer trackingLossDelegate](self, "trackingLossDelegate");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "shouldShowAnimojiFaceReticle");

        if (v44)
        {
          -[JFXAnimojiEffectRenderer trackingLossDelegate](self, "trackingLossDelegate");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "setupAnimojiFaceReticleForTrackingLoss");

          -[JFXAnimojiEffectRenderer trackingLossDelegate](self, "trackingLossDelegate");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "showAnimojiFaceReticleForTrackingLoss");

        }
        v27 = -[JFXAnimojiEffectRenderer constrainHeadPose](self, "constrainHeadPose");
        goto LABEL_12;
      }
      -[JFXAnimojiEffectRenderer trackingLossDelegate](self, "trackingLossDelegate");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "shouldShowAnimojiFaceReticle");

      if ((v41 & 1) == 0)
      {
        -[JFXAnimojiEffectRenderer trackingLossDelegate](self, "trackingLossDelegate");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "hideAnimojiFaceReticleForTrackingGain");

      }
    }
  }
  else
  {
    if (v51)
      v22 = -[JFXAnimojiEffectRenderer setupPoseForPreRecordedBlendShapes:forRenderer:captureOrientation:interfaceOrientation:withFrame:](self, "setupPoseForPreRecordedBlendShapes:forRenderer:captureOrientation:interfaceOrientation:withFrame:", v51, v20, a6, a7, v16);
    else
      v22 = -[JFXAnimojiEffectRenderer setupHeadPoseAndBlendShapesForFrame:forRenderer:captureOrientation:interfaceOrientation:isInitialSetup:](self, "setupHeadPoseAndBlendShapesForFrame:forRenderer:captureOrientation:interfaceOrientation:isInitialSetup:", v16, v20, a6, a7, v19);
    *((_BYTE *)v67 + 24) = v22;
    -[JFXAnimojiEffectRenderer workingSize](self, "workingSize");
    -[JFXAnimojiEffectRenderer JFX_focalLengthForFrame:workingSize:interfaceOrientation:](self, "JFX_focalLengthForFrame:workingSize:interfaceOrientation:", v16, a7);
    v24 = v23;
    objc_msgSend(v20, "pointOfView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "camera");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFocalLength:", v24);

  }
LABEL_13:
  objc_initWeak(&location, self);
  puppetRenderingQ = self->_puppetRenderingQ;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __156__JFXAnimojiEffectRenderer_renderFrame_withEffect_depthData_captureOrientation_interfaceOrientation_preRecordedBlendShapes_backgroundColor_completionBlock___block_invoke;
  block[3] = &unk_24EE58610;
  objc_copyWeak(&v60, &location);
  v59 = &v66;
  v53 = v16;
  v54 = self;
  v55 = v20;
  v56 = v50;
  v57 = v18;
  v58 = v49;
  v29 = v49;
  v30 = v18;
  v31 = v50;
  v32 = v20;
  v33 = v16;
  dispatch_async(puppetRenderingQ, block);

  objc_destroyWeak(&v60);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v66, 8);

}

void __156__JFXAnimojiEffectRenderer_renderFrame_withEffect_depthData_captureOrientation_interfaceOrientation_preRecordedBlendShapes_backgroundColor_completionBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;
  Float64 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CMTime v11;
  CMTime v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
  {
    memset(&v12, 0, sizeof(v12));
    objc_msgSend(*(id *)(a1 + 32), "timestamp");
    CMTimeMakeWithSeconds(&v12, v3, 1000000000);
    v5 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 56);
    v8 = *(_QWORD *)(a1 + 64);
    v9 = *(_QWORD *)(a1 + 72);
    v11 = v12;
    objc_msgSend(v4, "renderAnimoji:withPresentationTime:frame:depthData:backgroundColor:completionBlock:", v6, &v11, v5, v7, v8, v9);
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 72);
    if (v10)
      (*(void (**)(uint64_t, _QWORD))(v10 + 16))(v10, 0);
    objc_msgSend(WeakRetained, "flush");
  }

}

- (__CVBuffer)newPixelBufferRenderedFromARFrame:(id)a3 withEffect:(id)a4 depthData:(id)a5 captureOrientation:(int64_t)a6 interfaceOrientation:(int64_t)a7 preRecordedBlendShapes:(id)a8 backgroundColor:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  __CVBuffer *v22;
  _QWORD v24[4];
  NSObject *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a8;
  v19 = a9;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  if (!v17)
  {
    objc_msgSend(v15, "capturedDepthData");
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v20 = dispatch_group_create();
  dispatch_group_enter(v20);
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __162__JFXAnimojiEffectRenderer_newPixelBufferRenderedFromARFrame_withEffect_depthData_captureOrientation_interfaceOrientation_preRecordedBlendShapes_backgroundColor___block_invoke;
  v24[3] = &unk_24EE58638;
  v26 = &v27;
  v21 = v20;
  v25 = v21;
  -[JFXAnimojiEffectRenderer renderFrame:withEffect:depthData:captureOrientation:interfaceOrientation:preRecordedBlendShapes:backgroundColor:completionBlock:](self, "renderFrame:withEffect:depthData:captureOrientation:interfaceOrientation:preRecordedBlendShapes:backgroundColor:completionBlock:", v15, v16, v17, a6, a7, v18, v19, v24);
  dispatch_group_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
  v22 = (__CVBuffer *)v28[3];

  _Block_object_dispose(&v27, 8);
  return v22;
}

void __162__JFXAnimojiEffectRenderer_newPixelBufferRenderedFromARFrame_withEffect_depthData_captureOrientation_interfaceOrientation_preRecordedBlendShapes_backgroundColor___block_invoke(uint64_t a1, CVPixelBufferRef texture)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CVPixelBufferRetain(texture);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)renderAnimoji:(id)a3 withPresentationTime:(id *)a4 frame:(id)a5 depthData:(id)a6 backgroundColor:(id)a7 completionBlock:(id)a8
{
  id v14;
  id v15;
  const __CFAllocator *v16;
  uint64_t v17;
  void *BaseAddress;
  size_t BytesPerRow;
  size_t Height;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  uint64_t TextureFromImage;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  __CVBuffer *v54;
  void *v55;
  __CVBuffer *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  id v60;
  id v61;
  id v62;
  id v63;
  _QWORD v64[5];
  id v65;
  id v66[4];
  id location;
  double v68;
  double v69;
  double v70;
  double v71;
  CMTime time;
  CVPixelBufferRef pixelBufferOut;

  v14 = a3;
  v61 = a5;
  v63 = a6;
  v15 = a7;
  v62 = a8;
  pixelBufferOut = 0;
  time = *(CMTime *)a4;
  -[JFXAnimojiEffectRenderer setSystemTimeForAVTRenderer:](self, "setSystemTimeForAVTRenderer:", CMTimeGetSeconds(&time));
  v16 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v17 = CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x24BDBD240], self->_inputBufferPool, &pixelBufferOut);
  CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
  BaseAddress = CVPixelBufferGetBaseAddress(pixelBufferOut);
  BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBufferOut);
  Height = CVPixelBufferGetHeight(pixelBufferOut);
  bzero(BaseAddress, Height * BytesPerRow);
  CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
  if ((_DWORD)v17)
  {
    JFXLog_effects();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[JFXAnimojiEffectRenderer renderAnimoji:withPresentationTime:frame:depthData:backgroundColor:completionBlock:].cold.2(v17, v21, v22, v23, v24, v25, v26, v27);

  }
  time.value = 0;
  WidthOfPlane = CVPixelBufferGetWidthOfPlane(pixelBufferOut, 0);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(pixelBufferOut, 0);
  TextureFromImage = CVMetalTextureCacheCreateTextureFromImage(v16, self->_metalTextureCache, pixelBufferOut, 0, MTLPixelFormatBGRA8Unorm_sRGB, WidthOfPlane, HeightOfPlane, 0, (CVMetalTextureRef *)&time);
  if ((_DWORD)TextureFromImage)
  {
    v31 = TextureFromImage;
    JFXLog_effects();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      -[JFXAnimojiEffectRenderer renderAnimoji:withPresentationTime:frame:depthData:backgroundColor:completionBlock:].cold.1(v31, v32, v33, v34, v35, v36, v37, v38);

  }
  objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 81, WidthOfPlane, HeightOfPlane, 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setStorageMode:", 3);
  objc_msgSend(v39, "setUsage:", 5);
  objc_msgSend(MEMORY[0x24BDDD690], "renderPassDescriptor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "colorAttachments");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "objectAtIndexedSubscript:", 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setLoadAction:", 2);

  v70 = 0.0;
  v71 = 0.0;
  v68 = 0.0;
  v69 = 0.0;
  if (v15)
  {
    objc_msgSend(v15, "getRed:green:blue:alpha:", &v71, &v70, &v69, &v68);
    v43 = v70;
    v44 = v71;
    v45 = v68;
    v46 = v69;
  }
  else
  {
    v45 = 0.0;
    v46 = 0.0;
    v43 = 0.0;
    v44 = 0.0;
  }
  objc_msgSend(v40, "colorAttachments");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "objectAtIndexedSubscript:", 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setClearColor:", v44, v43, v46, v45);

  CVMetalTextureGetTexture((CVMetalTextureRef)time.value);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "colorAttachments");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "objectAtIndexedSubscript:", 0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setTexture:", v49);

  objc_msgSend(v14, "commandQueue");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "commandBuffer");
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = 0;
  if (!-[JFXAnimojiEffectRenderer constrainHeadPose](self, "constrainHeadPose"))
  {
    v55 = v63;
    if (!v63)
      goto LABEL_18;
    v56 = -[JFXAnimojiEffectRenderer JFX_depthDataToTexture:](self, "JFX_depthDataToTexture:", v63);
    v54 = v56;
    if (!v56)
      goto LABEL_18;
    CVMetalTextureGetTexture(v56);
    v57 = objc_claimAutoreleasedReturnValue();
    if (v57)
    {
      v58 = (void *)v57;
      objc_msgSend(v14, "setCapturedDepth:", v57);

    }
  }
  v55 = v63;
LABEL_18:
  if (-[JFXAnimojiEffectRenderer allowAntialiasing](self, "allowAntialiasing"))
    v59 = 2;
  else
    v59 = 0;
  objc_msgSend(v14, "setAvt_antialiasingMode:", v59);
  objc_msgSend(MEMORY[0x24BDE8290], "flush");
  -[JFXAnimojiEffectRenderer systemTimeForAVTRenderer](self, "systemTimeForAVTRenderer");
  objc_msgSend(v14, "renderAtTime:viewport:commandBuffer:passDescriptor:", v53, v40);
  objc_initWeak(&location, self);
  v64[0] = MEMORY[0x24BDAC760];
  v64[1] = 3221225472;
  v64[2] = __111__JFXAnimojiEffectRenderer_renderAnimoji_withPresentationTime_frame_depthData_backgroundColor_completionBlock___block_invoke;
  v64[3] = &unk_24EE58660;
  objc_copyWeak(v66, &location);
  v60 = v62;
  v66[1] = pixelBufferOut;
  v66[2] = (id)time.value;
  v64[4] = self;
  v65 = v60;
  v66[3] = v54;
  objc_msgSend(v53, "addCompletedHandler:", v64);
  objc_msgSend(v53, "commit");

  objc_destroyWeak(v66);
  objc_destroyWeak(&location);

}

void __111__JFXAnimojiEffectRenderer_renderAnimoji_withPresentationTime_frame_depthData_backgroundColor_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 56));
  CFRelease(*(CFTypeRef *)(a1 + 64));
  if ((objc_msgSend(*(id *)(a1 + 32), "constrainHeadPose") & 1) == 0)
    CVBufferRelease(*(CVBufferRef *)(a1 + 72));
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 56));
  objc_msgSend(WeakRetained, "flush");

}

- (id)JFX_blendShapesForRenderer:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "scene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "rootNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __55__JFXAnimojiEffectRenderer_JFX_blendShapesForRenderer___block_invoke;
  v10[3] = &unk_24EE58688;
  v7 = v4;
  v11 = v7;
  objc_msgSend(v6, "enumerateHierarchyUsingBlock:", v10);

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __55__JFXAnimojiEffectRenderer_JFX_blendShapesForRenderer___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v14, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = AVTMorphTargetNameDefinesPose(v4);

    if (v5)
    {
      objc_msgSend(v14, "presentationNode");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "morpher");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "weights");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v9 = *(void **)(a1 + 32);
        objc_msgSend(v14, "presentationNode");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "morpher");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "weights");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKey:", v12, v13);

      }
    }
  }

}

- (void)createTextureCaches
{
  id v3;
  const __CFDictionary *v4;
  uint64_t v5;
  const __CFDictionary *v6;
  const __CFAllocator *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v3 = MTLCreateSystemDefaultDevice();
  v12 = *MEMORY[0x24BDC55C0];
  v13[0] = &unk_24EE9C120;
  v4 = (const __CFDictionary *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v5 = *MEMORY[0x24BDC55C8];
  v10 = *MEMORY[0x24BDC55C8];
  v11 = &unk_24EE9BA50;
  v6 = (const __CFDictionary *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  CVMetalTextureCacheCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v4, v3, v6, &self->_metalTextureCache);
  if (!-[JFXAnimojiEffectRenderer constrainHeadPose](self, "constrainHeadPose"))
  {
    v8 = v5;
    v9 = &unk_24EE9BA68;
    CVMetalTextureCacheCreate(v7, v4, v3, (CFDictionaryRef)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1), &self->_metalDepthTextureCache);
  }

}

- (BOOL)JFX_inputBufferIsPortraitAspect:(CGSize)a3
{
  return a3.height > a3.width;
}

- (__CVBuffer)JFX_depthDataToTexture:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  __CVBuffer *v9;
  size_t Width;
  size_t Height;
  __CVBuffer *v12;
  CVMetalTextureRef textureOut;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  v6 = v4;
  if (objc_msgSend(v6, "depthDataType") != 1717855600)
  {
    objc_msgSend(v6, "depthDataByConvertingToDepthDataType:", 1717855600);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v7;
  }
  v8 = objc_retainAutorelease(v6);
  v9 = (__CVBuffer *)objc_msgSend(v8, "depthDataMap");
  Width = CVPixelBufferGetWidth(v9);
  Height = CVPixelBufferGetHeight(v9);
  textureOut = 0;
  LODWORD(v9) = CVMetalTextureCacheCreateTextureFromImage((CFAllocatorRef)*MEMORY[0x24BDBD240], self->_metalDepthTextureCache, v9, 0, MTLPixelFormatR32Float, Width, Height, 0, &textureOut);
  v12 = textureOut;

  if ((_DWORD)v9)
LABEL_5:
    v12 = 0;

  return v12;
}

- (double)JFX_focalLengthForFrame:(id)a3 workingSize:(CGSize)a4 interfaceOrientation:(int64_t)a5
{
  double height;
  double width;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  simd_float3 v17;
  simd_float3 v18;
  simd_float3 v19;
  float v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v28;
  simd_float3 v29;
  double v30;
  simd_float3 v31;
  double v32;
  simd_float3 v33;
  simd_float3x3 v34;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  objc_msgSend(v9, "camera");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "intrinsics");
  v30 = v12;
  v32 = v11;
  v28 = v13;
  objc_msgSend(v9, "camera");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "imageResolution");
  +[JFXFaceTrackingUtilities adjustIntrinsics:forRenderSize:capturedSize:interfaceOrientation:](JFXFaceTrackingUtilities, "adjustIntrinsics:forRenderSize:capturedSize:interfaceOrientation:", a5, v32, v30, v28, width, height, v15, v16);
  v31 = v18;
  v33 = v17;
  v29 = v19;

  if (-[JFXAnimojiEffectRenderer JFX_inputBufferIsPortraitAspect:](self, "JFX_inputBufferIsPortraitAspect:", width, height))
  {
    height = width;
  }
  v34.columns[2] = v29;
  v34.columns[1] = v31;
  v34.columns[2].i32[3] = 0;
  v34.columns[1].i32[3] = 0;
  v34.columns[0] = v33;
  v34.columns[0].i32[3] = 0;
  pv_focal_length_from_intrinsics(v34);
  v21 = v20;
  -[JFXAnimojiEffectRenderer renderer](self, "renderer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "pointOfView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "camera");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sensorHeight");
  v26 = v25 * v21 / height;

  return v26;
}

- (BOOL)asynchronouslyLoadNewPuppets
{
  return self->_asynchronouslyLoadNewPuppets;
}

- (void)setAsynchronouslyLoadNewPuppets:(BOOL)a3
{
  self->_asynchronouslyLoadNewPuppets = a3;
}

- (JFXAnimojiTrackingLossDelegate)trackingLossDelegate
{
  return (JFXAnimojiTrackingLossDelegate *)objc_loadWeakRetained((id *)&self->_trackingLossDelegate);
}

- (void)setTrackingLossDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_trackingLossDelegate, a3);
}

- (BOOL)allowAntialiasing
{
  return self->_allowAntialiasing;
}

- (void)setAllowAntialiasing:(BOOL)a3
{
  self->_allowAntialiasing = a3;
}

- (AVTRenderer)renderer
{
  return self->_renderer;
}

- (void)setRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_renderer, a3);
}

- (void)setAvatarStore:(id)a3
{
  objc_storeStrong((id *)&self->_avatarStore, a3);
}

- (JFXAnimojiEffect)currentPuppet
{
  return self->_currentPuppet;
}

- (void)setCurrentPuppet:(id)a3
{
  objc_storeStrong((id *)&self->_currentPuppet, a3);
}

- (NSLock)renderPassLock
{
  return self->_renderPassLock;
}

- (NSLock)rendererLock
{
  return self->_rendererLock;
}

- (void)setRendererLock:(id)a3
{
  objc_storeStrong((id *)&self->_rendererLock, a3);
}

- (__CVMetalTextureCache)metalTextureCache
{
  return self->_metalTextureCache;
}

- (void)setMetalTextureCache:(__CVMetalTextureCache *)a3
{
  self->_metalTextureCache = a3;
}

- (CGSize)workingSize
{
  double width;
  double height;
  CGSize result;

  width = self->_workingSize.width;
  height = self->_workingSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setWorkingSize:(CGSize)a3
{
  self->_workingSize = a3;
}

- (__CVPixelBufferPool)inputBufferPool
{
  return self->_inputBufferPool;
}

- (void)setInputBufferPool:(__CVPixelBufferPool *)a3
{
  self->_inputBufferPool = a3;
}

- (double)systemTimeForAVTRenderer
{
  return self->_systemTimeForAVTRenderer;
}

- (void)setSystemTimeForAVTRenderer:(double)a3
{
  self->_systemTimeForAVTRenderer = a3;
}

- (__CVMetalTextureCache)metalDepthTextureCache
{
  return self->_metalDepthTextureCache;
}

- (void)setMetalDepthTextureCache:(__CVMetalTextureCache *)a3
{
  self->_metalDepthTextureCache = a3;
}

- (BOOL)constrainHeadPose
{
  return self->_constrainHeadPose;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rendererLock, 0);
  objc_storeStrong((id *)&self->_renderPassLock, 0);
  objc_storeStrong((id *)&self->_currentPuppet, 0);
  objc_storeStrong((id *)&self->_avatarStore, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_destroyWeak((id *)&self->_trackingLossDelegate);
  objc_storeStrong((id *)&self->_puppetRenderingQ, 0);
  objc_storeStrong((id *)&self->_puppetLoadingQ, 0);
}

- (void)createNewRendererForPuppet:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2269A9000, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

- (void)setupHeadPoseAndBlendShapesForFrame:(void *)a1 forRenderer:(NSObject *)a2 captureOrientation:interfaceOrientation:isInitialSetup:.cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  NSStringFromJFXEffectType(7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "currentPuppet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "effectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v4;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_2269A9000, a2, OS_LOG_TYPE_ERROR, "Unable to render effect - type: %{public}@, name: %{public}@, reason: No tracked face anchors for the current frame", (uint8_t *)&v7, 0x16u);

}

- (void)renderAnimoji:(uint64_t)a3 withPresentationTime:(uint64_t)a4 frame:(uint64_t)a5 depthData:(uint64_t)a6 backgroundColor:(uint64_t)a7 completionBlock:(uint64_t)a8 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_2269A9000, a2, a3, "CVMetalTextureCacheCreateTextureFromImage returned error %d", a5, a6, a7, a8, 0);
}

- (void)renderAnimoji:(uint64_t)a3 withPresentationTime:(uint64_t)a4 frame:(uint64_t)a5 depthData:(uint64_t)a6 backgroundColor:(uint64_t)a7 completionBlock:(uint64_t)a8 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_2269A9000, a2, a3, "CVPixelBufferPoolCreatePixelBuffer returned error %d", a5, a6, a7, a8, 0);
}

@end
