@implementation JFXPixelRotationSession

+ (void)rotateFrameSetToUIOrientation:(id *)a3 pixelRotationSession:(id *)a4
{
  id v7;

  objc_msgSend(*a3, "metadataObjectForKey:", *MEMORY[0x24BE79580]);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "JFX_rotateFrameSet:toOrientation:pixelRotationSession:", a3, objc_msgSend(v7, "interfaceOrientation"), a4);

}

+ (void)rotateFrameSetToDeviceOrientation:(id *)a3 pixelRotationSession:(id *)a4
{
  void *v7;
  uint64_t v8;

  objc_msgSend(*a3, "metadataObjectForKey:", CFSTR("PVFrameSetMetadataDeviceOrientationkey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  objc_msgSend(a1, "JFX_rotateFrameSet:toOrientation:pixelRotationSession:", a3, v8, a4);
}

+ (void)rotateFrameSet:(id *)a3 by:(int)a4 mirror:(BOOL)a5 pixelRotationSession:(id *)a6
{
  _BOOL8 v7;
  uint64_t v8;
  JFXPixelRotationSession *v10;
  JFXPixelRotationSession *v11;
  id v12;
  id v13;
  id v14;

  v7 = a5;
  v8 = *(_QWORD *)&a4;
  if (a4 || a5)
  {
    v10 = (JFXPixelRotationSession *)*a6;
    if (-[JFXPixelRotationSession rotationCardinalAngle](v10, "rotationCardinalAngle") != (_DWORD)v8
      || -[JFXPixelRotationSession mirror](v10, "mirror") != v7)
    {
      v11 = -[JFXPixelRotationSession initWithRotation:mirror:]([JFXPixelRotationSession alloc], "initWithRotation:mirror:", v8, v7);

      v10 = v11;
    }
    v12 = *a3;
    -[JFXPixelRotationSession createRotatedFrameSet:](v10, "createRotatedFrameSet:", v12);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a3 = v13;

  }
  else
  {
    v10 = 0;
  }
  v14 = *a6;
  *a6 = v10;

}

+ (void)JFX_rotateFrameSet:(id *)a3 toOrientation:(int64_t)a4 pixelRotationSession:(id *)a5
{
  uint64_t v9;
  id v10;

  objc_msgSend(*a3, "metadataObjectForKey:", *MEMORY[0x24BE79580]);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v10, "cameraPosition");
  objc_msgSend(a1, "rotateFrameSet:by:mirror:pixelRotationSession:", a3, +[JFXRotationTransforms rotationFromCaptureDevicePosition:captureVideoOrientation:toInterfaceOrientation:](JFXRotationTransforms, "rotationFromCaptureDevicePosition:captureVideoOrientation:toInterfaceOrientation:", v9, objc_msgSend(v10, "captureVideoOrientation"), a4), v9 == 2, a5);

}

+ (const)toVTRotation:(int)a3
{
  const __CFString **v3;

  switch(a3)
  {
    case 0:
      v3 = (const __CFString **)MEMORY[0x24BDF9860];
      goto LABEL_6;
    case 1:
      v3 = (const __CFString **)MEMORY[0x24BDF9878];
      goto LABEL_6;
    case 2:
      v3 = (const __CFString **)MEMORY[0x24BDF9868];
      goto LABEL_6;
    case 3:
      v3 = (const __CFString **)MEMORY[0x24BDF9870];
LABEL_6:
      result = *v3;
      break;
    default:
      return result;
  }
  return result;
}

- (JFXPixelRotationSession)initWithRotation:(int)a3 mirror:(BOOL)a4
{
  JFXPixelRotationSession *v6;
  JFXPixelRotationSession *v7;
  JFXPixelRotationSession *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)JFXPixelRotationSession;
  v6 = -[JFXPixelRotationSession init](&v10, sel_init);
  v7 = v6;
  if (v6
    && ((v6->_rotationCardinalAngle = a3,
         v6->_mirror = a4,
         VTPixelRotationSessionCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], &v6->_imageRotationSession))
     || VTSessionSetProperty(v7->_imageRotationSession, (CFStringRef)*MEMORY[0x24BDF9648], +[JFXPixelRotationSession toVTRotation:](JFXPixelRotationSession, "toVTRotation:", v7->_rotationCardinalAngle))|| v7->_mirror&& VTSessionSetProperty(v7->_imageRotationSession, (CFStringRef)*MEMORY[0x24BDF9638], (CFTypeRef)*MEMORY[0x24BDBD270])))
  {
    -[JFXPixelRotationSession JT_releaseImageRotationSession](v7, "JT_releaseImageRotationSession");
    v8 = 0;
  }
  else
  {
    v8 = v7;
  }

  return v8;
}

- (void)dealloc
{
  JFXPixelBufferPool *pixelBufferPool;
  objc_super v4;

  -[JFXPixelRotationSession JT_releaseImageRotationSession](self, "JT_releaseImageRotationSession");
  pixelBufferPool = self->_pixelBufferPool;
  self->_pixelBufferPool = 0;

  v4.receiver = self;
  v4.super_class = (Class)JFXPixelRotationSession;
  -[JFXPixelRotationSession dealloc](&v4, sel_dealloc);
}

- (id)createRotatedFrameSet:(id)a3
{
  id v4;
  void *v5;
  __CVBuffer *v6;
  __CVBuffer *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  CMTime v19;
  __int128 v20;
  uint64_t v21;
  CMTime v22;
  __int128 v23;
  uint64_t v24;

  v4 = a3;
  objc_msgSend(v4, "colorImageBuffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[JFXPixelRotationSession createRotatedPixelBuffer:](self, "createRotatedPixelBuffer:", objc_msgSend(v5, "cvPixelBuffer"));
  if (v6)
  {
    v7 = v6;
    objc_msgSend(MEMORY[0x24BE79030], "imageWithCVPixelBuffer:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CVPixelBufferRelease(v7);
    v23 = 0uLL;
    v24 = 0;
    if (v4)
      objc_msgSend(v4, "presentationTimeStamp");
    memset(&v22, 0, sizeof(v22));
    objc_msgSend(v4, "colorSampleBuffer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    CMSampleBufferGetDuration(&v22, (CMSampleBufferRef)objc_msgSend(v9, "sampleBufferRef"));

    v20 = v23;
    v21 = v24;
    v19 = v22;
    objc_msgSend(MEMORY[0x24BE78FF0], "sampleBufferWithPVImageBuffer:timestamp:frameDuration:", v8, &v20, &v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "metadataDict");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");

    objc_msgSend(v12, "objectForKey:", CFSTR("PVFrameSetMetadataARMetadataKey"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "arFrame");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCapturedImage:", objc_msgSend(v8, "cvPixelBuffer"));
    v15 = objc_alloc(MEMORY[0x24BE79020]);
    objc_msgSend(v4, "depthData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithColorBuffer:depthData:metadata:", v10, v16, v12);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (__CVBuffer)createRotatedPixelBuffer:(__CVBuffer *)a3
{
  return -[JFXPixelRotationSession createRotatedPixelBuffer:using:](self, "createRotatedPixelBuffer:using:", a3, 0);
}

- (__CVBuffer)createRotatedPixelBuffer:(__CVBuffer *)a3 using:(__CVBuffer *)a4
{
  size_t Width;
  size_t Height;
  __CVBuffer *v9;
  unint64_t v10;
  double v11;
  double v12;
  uint64_t PixelFormatType;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  JFXPixelBufferPool *v23;
  void *v24;
  OSStatus v25;
  __CVBuffer *result;

  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  v9 = a4;
  if (!a4)
  {
    v10 = Height;
    v11 = (double)Height;
    switch(-[JFXPixelRotationSession rotationCardinalAngle](self, "rotationCardinalAngle"))
    {
      case 0:
      case 2:
        v12 = (double)Width;
        break;
      case 1:
      case 3:
        v12 = (double)v10;
        v11 = (double)Width;
        break;
      default:
        v12 = *MEMORY[0x24BDBF148];
        v11 = *(double *)(MEMORY[0x24BDBF148] + 8);
        break;
    }
    PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    -[JFXPixelRotationSession pixelBufferPool](self, "pixelBufferPool");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      goto LABEL_12;
    -[JFXPixelRotationSession pixelBufferPool](self, "pixelBufferPool");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "type");

    -[JFXPixelRotationSession pixelBufferPool](self, "pixelBufferPool");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "size");
    v19 = v18;
    v21 = v20;

    if ((_DWORD)PixelFormatType != v16)
      goto LABEL_12;
    if (v19 != v12 || v21 != v11)
    {
LABEL_12:
      v23 = -[JFXPixelBufferPool initWithSize:type:]([JFXPixelBufferPool alloc], "initWithSize:type:", PixelFormatType, v12, v11);
      -[JFXPixelRotationSession setPixelBufferPool:](self, "setPixelBufferPool:", v23);

    }
    -[JFXPixelRotationSession pixelBufferPool](self, "pixelBufferPool");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (__CVBuffer *)objc_msgSend(v24, "createPixelBuffer");

  }
  CVBufferPropagateAttachments(a3, v9);
  v25 = VTPixelRotationSessionRotateImage(self->_imageRotationSession, a3, v9);
  if (v25)
    result = 0;
  else
    result = v9;
  if (!a4)
  {
    if (v25)
    {
      CVPixelBufferRelease(v9);
      return 0;
    }
  }
  return result;
}

- (void)JT_releaseImageRotationSession
{
  OpaqueVTPixelRotationSession *imageRotationSession;

  imageRotationSession = self->_imageRotationSession;
  if (imageRotationSession)
  {
    VTPixelRotationSessionInvalidate(imageRotationSession);
    CFRelease(self->_imageRotationSession);
    self->_imageRotationSession = 0;
  }
}

- (int)rotationCardinalAngle
{
  return self->_rotationCardinalAngle;
}

- (BOOL)mirror
{
  return self->_mirror;
}

- (JFXPixelBufferPool)pixelBufferPool
{
  return self->_pixelBufferPool;
}

- (void)setPixelBufferPool:(id)a3
{
  objc_storeStrong((id *)&self->_pixelBufferPool, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pixelBufferPool, 0);
}

@end
