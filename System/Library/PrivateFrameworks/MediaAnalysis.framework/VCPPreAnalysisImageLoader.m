@implementation VCPPreAnalysisImageLoader

- (VCPPreAnalysisImageLoader)initWithMonochromeBufferCreator:(id)a3
{
  id v5;
  VCPPreAnalysisImageLoader *v6;
  uint64_t v7;
  VCPSceneProcessingImageManager *imageManager;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VCPPreAnalysisImageLoader;
  v6 = -[VCPPreAnalysisImageLoader init](&v10, sel_init);
  if (v6)
  {
    +[VCPSceneProcessingImageManager imageManager](VCPSceneProcessingImageManager, "imageManager");
    v7 = objc_claimAutoreleasedReturnValue();
    imageManager = v6->_imageManager;
    v6->_imageManager = (VCPSceneProcessingImageManager *)v7;

    objc_storeStrong((id *)&v6->_monochromeBufferCreator, a3);
  }

  return v6;
}

- (int)_createPixelBufferWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(int)a5 pixelBuffer:(__CVBuffer *)a6
{
  __CVBuffer **v6;
  const __CFDictionary *v10;
  uint64_t v12;
  _QWORD v13[2];

  v6 = a6;
  v13[1] = *MEMORY[0x1E0C80C00];
  *a6 = 0;
  v12 = *MEMORY[0x1E0CA8FF0];
  v13[0] = MEMORY[0x1E0C9AA70];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = CVPixelBufferCreate(0, a3, a4, a5, v10, v6);

  return (int)v6;
}

- (int)_convertFromBuffer:(__CVBuffer *)a3 toLumaPixelBuffer:(__CVBuffer *)a4 abnormalDimension:(unint64_t)a5
{
  VCPPreAnalysisImageLoader *v8;
  size_t Width;
  OSStatus v10;
  OSStatus v11;
  OpaqueVTPixelTransferSession *value;
  __CVBuffer *v13;
  CFTypeRef cf;

  *a4 = 0;
  cf = 0;
  v8 = self;
  objc_sync_enter(v8);
  if (a5)
  {
    Width = CVPixelBufferGetWidth(a3);
    v10 = -[VCPPreAnalysisImageLoader _createPixelBufferWithWidth:height:pixelFormat:pixelBuffer:](v8, "_createPixelBufferWithWidth:height:pixelFormat:pixelBuffer:", Width, CVPixelBufferGetHeight(a3), 1278226488, &cf);
  }
  else
  {
    v10 = -[VCPPoolBasedPixelBufferCreator createPixelBuffer:](v8->_monochromeBufferCreator, "createPixelBuffer:", &cf);
  }
  v11 = v10;
  if (v10)
    goto LABEL_11;
  value = v8->_transferSession.value_;
  if (!value)
  {
    v11 = VTPixelTransferSessionCreate(0, &v8->_transferSession.value_);
    if (v11)
      goto LABEL_11;
    value = v8->_transferSession.value_;
  }
  v11 = VTPixelTransferSessionTransferImage(value, a3, (CVPixelBufferRef)cf);
  if (v11)
  {
LABEL_11:
    objc_sync_exit(v8);
    goto LABEL_12;
  }
  v13 = (__CVBuffer *)cf;
  if (cf)
    v13 = (__CVBuffer *)CFRetain(cf);
  *a4 = v13;
  objc_sync_exit(v8);
  v11 = 0;
LABEL_12:

  CF<opaqueCMSampleBuffer *>::~CF(&cf);
  return v11;
}

- (int)loadImageURL:(id)a3 abnormalDimension:(unint64_t)a4 withNonPanoPreWarmSizes:(id)a5 toColorPixelBuffer:(__CVBuffer *)a6 lumaPixelBuffer:(__CVBuffer *)a7 andImage:(id *)a8
{
  id v14;
  int v15;
  VCPPreAnalysisImage *v17;
  uint64_t v18;
  size_t Width;
  size_t Height;
  __CVBuffer **v21;
  BOOL v22;
  size_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  id v32;
  double v33;
  double v34;
  double v35;
  __CVBuffer *v36;
  __CVBuffer **v37;
  VCPPreAnalysisImageLoader *v38;
  __CVBuffer **v39;
  id v40;
  const void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  CVPixelBufferRef pixelBuffer;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v14 = a5;
  pixelBuffer = 0;
  v15 = -[VCPSceneProcessingImageManager loadFullPixelBuffer:scaledPixelBuffer299:scaledPixelBuffer360:fromImageURL:abnormalDimension:](self->_imageManager, "loadFullPixelBuffer:scaledPixelBuffer299:scaledPixelBuffer360:fromImageURL:abnormalDimension:", &pixelBuffer, 0, 0, a3, a4);
  if (v15)
    goto LABEL_2;
  v37 = a6;
  v38 = self;
  v39 = a7;
  v40 = v14;
  v17 = [VCPPreAnalysisImage alloc];
  *a8 = -[VCPPreAnalysisImage initWithPixelBuffer:](v17, "initWithPixelBuffer:", pixelBuffer);
  v18 = 299;
  if (!a4)
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v26 = v14;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v43;
      while (2)
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v43 != v28)
            objc_enumerationMutation(v26);
          v30 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          v31 = (void *)MEMORY[0x1BCCA1B2C]();
          v32 = *a8;
          objc_msgSend(v30, "sizeValue");
          v34 = v33;
          objc_msgSend(v30, "sizeValue");
          v15 = objc_msgSend(v32, "preWarmWidth:andHeight:", (unint64_t)v34, (unint64_t)v35);
          objc_autoreleasePoolPop(v31);
          if (v15)
          {

            v14 = v40;
            goto LABEL_2;
          }
        }
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
        if (v27)
          continue;
        break;
      }
    }

    v25 = 299;
    a7 = v39;
    v14 = v40;
    v21 = v37;
    self = v38;
    goto LABEL_22;
  }
  Width = CVPixelBufferGetWidth(pixelBuffer);
  Height = CVPixelBufferGetHeight(pixelBuffer);
  v21 = v37;
  v22 = Width > Height;
  v23 = Height / Width;
  if (Width > Height)
    v23 = Width / Height;
  v24 = 299 * v23;
  if (Width <= Height)
    v25 = 299;
  else
    v25 = v24;
  if (!v22)
    v18 = v24;
  v15 = objc_msgSend(*a8, "preWarmWidth:andHeight:", v25, v18);
  if (!v15)
  {
LABEL_22:
    v41 = 0;
    objc_msgSend(*a8, "pixelBuffer:width:height:", &v41, v25, v18);
    v36 = pixelBuffer;
    if (pixelBuffer)
      v36 = (__CVBuffer *)CFRetain(pixelBuffer);
    *v21 = v36;
    v15 = -[VCPPreAnalysisImageLoader _convertFromBuffer:toLumaPixelBuffer:abnormalDimension:](self, "_convertFromBuffer:toLumaPixelBuffer:abnormalDimension:", v41, a7, a4);
    CF<opaqueCMSampleBuffer *>::~CF(&v41);
  }
LABEL_2:
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&pixelBuffer);

  return v15;
}

- (void).cxx_destruct
{
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_transferSession.value_);
  objc_storeStrong((id *)&self->_monochromeBufferCreator, 0);
  objc_storeStrong((id *)&self->_imageManager, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
