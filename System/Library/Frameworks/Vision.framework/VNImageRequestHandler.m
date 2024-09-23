@implementation VNImageRequestHandler

- (BOOL)performRequests:(NSArray *)requests error:(NSError *)error
{
  return -[VNImageRequestHandler performRequests:gatheredForensics:error:](self, "performRequests:gatheredForensics:error:", requests, 0, error);
}

- (VNImageRequestHandler)initWithCVPixelBuffer:(CVPixelBufferRef)pixelBuffer options:(NSDictionary *)options
{
  return -[VNImageRequestHandler initWithCVPixelBuffer:orientation:options:](self, "initWithCVPixelBuffer:orientation:options:", pixelBuffer, 0, options);
}

- (BOOL)performRequests:(id)a3 gatheredForensics:(id *)a4 error:(id *)a5
{
  id v8;
  VNRequestForensics *v9;
  void *v10;
  VNRequestPerformingContext *v11;
  VNRequestPerformer *requestPerformer;
  BOOL v13;
  id v14;
  char v15;
  id v17;

  v8 = a3;
  if (a4)
  {
    v9 = objc_retainAutorelease(-[VNRequestForensics initWithOriginalRequests:]([VNRequestForensics alloc], "initWithOriginalRequests:", v8));
    *a4 = v9;
  }
  else
  {
    v9 = 0;
  }
  v10 = (void *)MEMORY[0x1A1B0B060]();
  v11 = -[VNRequestPerformingContext initWithSession:requestPerformer:imageBuffer:forensics:observationsCache:]([VNRequestPerformingContext alloc], "initWithSession:requestPerformer:imageBuffer:forensics:observationsCache:", self->_session, self->_requestPerformer, self->_imageBuffer, v9, self->_observationsCache);
  -[VNRequestPerformingContext qosClass](v11, "qosClass");
  requestPerformer = self->_requestPerformer;
  v17 = 0;
  v13 = -[VNRequestPerformer performRequests:inContext:error:](requestPerformer, "performRequests:inContext:error:", v8, v11, &v17);
  v14 = v17;

  objc_autoreleasePoolPop(v10);
  if (a5)
    v15 = v13;
  else
    v15 = 1;
  if ((v15 & 1) == 0)
    *a5 = objc_retainAutorelease(v14);

  return v13;
}

- (VNImageRequestHandler)initWithCVPixelBuffer:(CVPixelBufferRef)pixelBuffer orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options
{
  uint64_t v5;
  NSDictionary *v8;
  void *v9;
  VNImageRequestHandler *v10;

  v5 = *(_QWORD *)&orientation;
  v8 = options;
  +[VNSession globalSession](VNSession, "globalSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[VNImageRequestHandler initWithCVPixelBuffer:orientation:options:session:](self, "initWithCVPixelBuffer:orientation:options:session:", pixelBuffer, v5, v8, v9);

  return v10;
}

- (VNImageRequestHandler)initWithCVPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  void *v12;
  VNImageBuffer *v13;
  VNImageRequestHandler *v14;

  v7 = *(_QWORD *)&a4;
  v10 = a5;
  v11 = a6;
  v12 = (void *)MEMORY[0x1A1B0B060]();
  v13 = -[VNImageBuffer initWithCVPixelBuffer:orientation:options:session:]([VNImageBuffer alloc], "initWithCVPixelBuffer:orientation:options:session:", a3, v7, v10, v11);
  if (v13)
  {
    self = -[VNImageRequestHandler initWithSession:imageBuffer:](self, "initWithSession:imageBuffer:", v11, v13);
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  objc_autoreleasePoolPop(v12);
  return v14;
}

- (VNImageRequestHandler)initWithSession:(id)a3 imageBuffer:(id)a4
{
  id v7;
  id v8;
  VNImageRequestHandler *v9;
  VNImageRequestHandler *v10;
  VNRequestPerformer *v11;
  VNRequestPerformer *requestPerformer;
  VNObservationsCache *v13;
  VNObservationsCache *observationsCache;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)VNImageRequestHandler;
  v9 = -[VNImageRequestHandler init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_session, a3);
    objc_storeStrong((id *)&v10->_imageBuffer, a4);
    v11 = objc_alloc_init(VNRequestPerformer);
    requestPerformer = v10->_requestPerformer;
    v10->_requestPerformer = v11;

    v13 = objc_alloc_init(VNObservationsCache);
    observationsCache = v10->_observationsCache;
    v10->_observationsCache = v13;

  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observationsCache, 0);
  objc_storeStrong((id *)&self->_requestPerformer, 0);
  objc_storeStrong((id *)&self->_imageBuffer, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (VNImageRequestHandler)initWithCVPixelBuffer:(CVPixelBufferRef)pixelBuffer depthData:(AVDepthData *)depthData orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options
{
  uint64_t v7;
  AVDepthData *v10;
  NSDictionary *v11;
  void *v12;
  VNImageRequestHandler *v13;

  v7 = *(_QWORD *)&orientation;
  v10 = depthData;
  v11 = options;
  +[VNSession globalSession](VNSession, "globalSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[VNImageRequestHandler initWithCVPixelBuffer:depthData:orientation:options:session:](self, "initWithCVPixelBuffer:depthData:orientation:options:session:", pixelBuffer, v10, v7, v11, v12);

  return v13;
}

- (VNImageRequestHandler)initWithCGImage:(CGImageRef)image options:(NSDictionary *)options
{
  return -[VNImageRequestHandler initWithCGImage:orientation:options:](self, "initWithCGImage:orientation:options:", image, 0, options);
}

- (VNImageRequestHandler)initWithCGImage:(CGImageRef)image orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options
{
  uint64_t v5;
  NSDictionary *v8;
  void *v9;
  VNImageRequestHandler *v10;

  v5 = *(_QWORD *)&orientation;
  v8 = options;
  +[VNSession globalSession](VNSession, "globalSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[VNImageRequestHandler initWithCGImage:orientation:options:session:](self, "initWithCGImage:orientation:options:session:", image, v5, v8, v9);

  return v10;
}

- (VNImageRequestHandler)initWithCIImage:(CIImage *)image options:(NSDictionary *)options
{
  return -[VNImageRequestHandler initWithCIImage:orientation:options:](self, "initWithCIImage:orientation:options:", image, 0, options);
}

- (VNImageRequestHandler)initWithCIImage:(CIImage *)image orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options
{
  uint64_t v6;
  CIImage *v8;
  NSDictionary *v9;
  void *v10;
  VNImageRequestHandler *v11;

  v6 = *(_QWORD *)&orientation;
  v8 = image;
  v9 = options;
  +[VNSession globalSession](VNSession, "globalSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[VNImageRequestHandler initWithCIImage:orientation:options:session:](self, "initWithCIImage:orientation:options:session:", v8, v6, v9, v10);

  return v11;
}

- (VNImageRequestHandler)initWithURL:(NSURL *)imageURL options:(NSDictionary *)options
{
  return -[VNImageRequestHandler initWithURL:orientation:options:](self, "initWithURL:orientation:options:", imageURL, 0, options);
}

- (VNImageRequestHandler)initWithURL:(NSURL *)imageURL orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options
{
  uint64_t v6;
  NSURL *v8;
  NSDictionary *v9;
  void *v10;
  VNImageRequestHandler *v11;

  v6 = *(_QWORD *)&orientation;
  v8 = imageURL;
  v9 = options;
  +[VNSession globalSession](VNSession, "globalSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[VNImageRequestHandler initWithURL:orientation:options:session:](self, "initWithURL:orientation:options:session:", v8, v6, v9, v10);

  return v11;
}

- (VNImageRequestHandler)initWithData:(NSData *)imageData options:(NSDictionary *)options
{
  return -[VNImageRequestHandler initWithData:orientation:options:](self, "initWithData:orientation:options:", imageData, 0, options);
}

- (VNImageRequestHandler)initWithData:(NSData *)imageData orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options
{
  uint64_t v6;
  NSData *v8;
  NSDictionary *v9;
  void *v10;
  VNImageRequestHandler *v11;

  v6 = *(_QWORD *)&orientation;
  v8 = imageData;
  v9 = options;
  +[VNSession globalSession](VNSession, "globalSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[VNImageRequestHandler initWithData:orientation:options:session:](self, "initWithData:orientation:options:session:", v8, v6, v9, v10);

  return v11;
}

- (VNImageRequestHandler)initWithCMSampleBuffer:(CMSampleBufferRef)sampleBuffer options:(NSDictionary *)options
{
  return -[VNImageRequestHandler initWithCMSampleBuffer:orientation:options:](self, "initWithCMSampleBuffer:orientation:options:", sampleBuffer, 0, options);
}

- (VNImageRequestHandler)initWithCMSampleBuffer:(CMSampleBufferRef)sampleBuffer orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options
{
  uint64_t v5;
  NSDictionary *v8;
  void *v9;
  VNImageRequestHandler *v10;

  v5 = *(_QWORD *)&orientation;
  v8 = options;
  +[VNSession globalSession](VNSession, "globalSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[VNImageRequestHandler initWithCMSampleBuffer:orientation:options:session:](self, "initWithCMSampleBuffer:orientation:options:session:", sampleBuffer, v5, v8, v9);

  return v10;
}

- (VNImageRequestHandler)initWithCMSampleBuffer:(CMSampleBufferRef)sampleBuffer depthData:(AVDepthData *)depthData orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options
{
  uint64_t v7;
  AVDepthData *v10;
  NSDictionary *v11;
  void *v12;
  VNImageRequestHandler *v13;

  v7 = *(_QWORD *)&orientation;
  v10 = depthData;
  v11 = options;
  +[VNSession globalSession](VNSession, "globalSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[VNImageRequestHandler initWithCMSampleBuffer:depthData:orientation:options:session:](self, "initWithCMSampleBuffer:depthData:orientation:options:session:", sampleBuffer, v10, v7, v11, v12);

  return v13;
}

- (VNImageRequestHandler)initWithCVPixelBuffer:(__CVBuffer *)a3 options:(id)a4 session:(id)a5
{
  return -[VNImageRequestHandler initWithCVPixelBuffer:orientation:options:session:](self, "initWithCVPixelBuffer:orientation:options:session:", a3, 0, a4, a5);
}

- (VNImageRequestHandler)initWithCVPixelBuffer:(__CVBuffer *)a3 depthData:(id)a4 orientation:(unsigned int)a5 options:(id)a6 session:(id)a7
{
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  VNImageBuffer *v16;
  VNImageRequestHandler *v17;

  v9 = *(_QWORD *)&a5;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  v15 = (void *)MEMORY[0x1A1B0B060]();
  v16 = -[VNImageBuffer initWithCVPixelBuffer:depthData:orientation:options:session:]([VNImageBuffer alloc], "initWithCVPixelBuffer:depthData:orientation:options:session:", a3, v12, v9, v13, v14);
  if (v16)
  {
    self = -[VNImageRequestHandler initWithSession:imageBuffer:](self, "initWithSession:imageBuffer:", v14, v16);
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  objc_autoreleasePoolPop(v15);
  return v17;
}

- (VNImageRequestHandler)initWithCGImage:(CGImage *)a3 options:(id)a4 session:(id)a5
{
  return -[VNImageRequestHandler initWithCGImage:orientation:options:session:](self, "initWithCGImage:orientation:options:session:", a3, 0, a4, a5);
}

- (VNImageRequestHandler)initWithCGImage:(CGImage *)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  void *v12;
  VNImageBuffer *v13;
  VNImageRequestHandler *v14;

  v7 = *(_QWORD *)&a4;
  v10 = a5;
  v11 = a6;
  v12 = (void *)MEMORY[0x1A1B0B060]();
  v13 = -[VNImageBuffer initWithCGImage:orientation:options:session:]([VNImageBuffer alloc], "initWithCGImage:orientation:options:session:", a3, v7, v10, v11);
  if (v13)
  {
    self = -[VNImageRequestHandler initWithSession:imageBuffer:](self, "initWithSession:imageBuffer:", v11, v13);
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  objc_autoreleasePoolPop(v12);
  return v14;
}

- (VNImageRequestHandler)initWithCIImage:(id)a3 options:(id)a4 session:(id)a5
{
  return -[VNImageRequestHandler initWithCIImage:orientation:options:session:](self, "initWithCIImage:orientation:options:session:", a3, 0, a4, a5);
}

- (VNImageRequestHandler)initWithCIImage:(id)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  VNImageBuffer *v14;
  VNImageRequestHandler *v15;

  v8 = *(_QWORD *)&a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = (void *)MEMORY[0x1A1B0B060]();
  v14 = -[VNImageBuffer initWithCIImage:orientation:options:session:]([VNImageBuffer alloc], "initWithCIImage:orientation:options:session:", v10, v8, v11, v12);
  if (v14)
  {
    self = -[VNImageRequestHandler initWithSession:imageBuffer:](self, "initWithSession:imageBuffer:", v12, v14);
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  objc_autoreleasePoolPop(v13);
  return v15;
}

- (VNImageRequestHandler)initWithURL:(id)a3 options:(id)a4 session:(id)a5
{
  return -[VNImageRequestHandler initWithURL:orientation:options:session:](self, "initWithURL:orientation:options:session:", a3, 0, a4, a5);
}

- (VNImageRequestHandler)initWithURL:(id)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  VNImageBuffer *v14;
  VNImageRequestHandler *v15;

  v8 = *(_QWORD *)&a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = (void *)MEMORY[0x1A1B0B060]();
  v14 = -[VNImageBuffer initWithURL:orientation:options:session:]([VNImageBuffer alloc], "initWithURL:orientation:options:session:", v10, v8, v11, v12);
  if (v14)
  {
    self = -[VNImageRequestHandler initWithSession:imageBuffer:](self, "initWithSession:imageBuffer:", v12, v14);
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  objc_autoreleasePoolPop(v13);
  return v15;
}

- (VNImageRequestHandler)initWithData:(id)a3 options:(id)a4 session:(id)a5
{
  return -[VNImageRequestHandler initWithData:orientation:options:session:](self, "initWithData:orientation:options:session:", a3, 0, a4, a5);
}

- (VNImageRequestHandler)initWithData:(id)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  VNImageBuffer *v14;
  VNImageRequestHandler *v15;

  v8 = *(_QWORD *)&a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = (void *)MEMORY[0x1A1B0B060]();
  v14 = -[VNImageBuffer initWithData:orientation:options:session:]([VNImageBuffer alloc], "initWithData:orientation:options:session:", v10, v8, v11, v12);
  if (v14)
  {
    self = -[VNImageRequestHandler initWithSession:imageBuffer:](self, "initWithSession:imageBuffer:", v12, v14);
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  objc_autoreleasePoolPop(v13);
  return v15;
}

- (VNImageRequestHandler)initWithCMSampleBuffer:(opaqueCMSampleBuffer *)a3 options:(id)a4 session:(id)a5
{
  return -[VNImageRequestHandler initWithCMSampleBuffer:orientation:options:session:](self, "initWithCMSampleBuffer:orientation:options:session:", a3, 0, a4, a5);
}

- (VNImageRequestHandler)initWithCMSampleBuffer:(opaqueCMSampleBuffer *)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  void *v12;
  VNImageBuffer *v13;
  VNImageRequestHandler *v14;

  v7 = *(_QWORD *)&a4;
  v10 = a5;
  v11 = a6;
  v12 = (void *)MEMORY[0x1A1B0B060]();
  v13 = -[VNImageBuffer initWithCMSampleBuffer:orientation:options:session:]([VNImageBuffer alloc], "initWithCMSampleBuffer:orientation:options:session:", a3, v7, v10, v11);
  if (v13)
  {
    self = -[VNImageRequestHandler initWithSession:imageBuffer:](self, "initWithSession:imageBuffer:", v11, v13);
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  objc_autoreleasePoolPop(v12);
  return v14;
}

- (VNImageRequestHandler)initWithCMSampleBuffer:(opaqueCMSampleBuffer *)a3 depthData:(id)a4 orientation:(unsigned int)a5 options:(id)a6 session:(id)a7
{
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  VNImageBuffer *v16;
  VNImageRequestHandler *v17;

  v9 = *(_QWORD *)&a5;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  v15 = (void *)MEMORY[0x1A1B0B060]();
  v16 = -[VNImageBuffer initWithCMSampleBuffer:depthData:orientation:options:session:]([VNImageBuffer alloc], "initWithCMSampleBuffer:depthData:orientation:options:session:", a3, v12, v9, v13, v14);
  if (v16)
  {
    self = -[VNImageRequestHandler initWithSession:imageBuffer:](self, "initWithSession:imageBuffer:", v14, v16);
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  objc_autoreleasePoolPop(v15);
  return v17;
}

- (void)cancelAllRequests
{
  -[VNRequestPerformer cancelAllRequests](self->_requestPerformer, "cancelAllRequests");
}

- (BOOL)prepareForPerformingRequests:(id)a3 error:(id *)a4
{
  return -[VNSession prepareForPerformingRequests:error:](self->_session, "prepareForPerformingRequests:error:", a3, a4);
}

- (id)debugQuickLookObject
{
  return -[VNImageBuffer debugQuickLookObject](self->_imageBuffer, "debugQuickLookObject");
}

- (VNImageBuffer)imageBuffer
{
  return self->_imageBuffer;
}

- (VNSession)session
{
  return self->_session;
}

+ (void)requestForcedCleanup
{
  id v2;

  +[VNSession globalSession](VNSession, "globalSession");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "releaseCachedResources");

}

+ (void)forcedCleanup
{
  id v2;

  +[VNSession globalSession](VNSession, "globalSession");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "releaseCachedResources");

}

+ (void)requestForcedCleanupWithOptions:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  +[VNSession globalSession](VNSession, "globalSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "legacyForcedCleanupWithOptions:", v4);

}

+ (void)requestForcedCleanupWithOptions:(id)a3 completion:(id)a4
{
  void (**v5)(_QWORD);
  void *v6;
  id v7;

  v7 = a3;
  v5 = (void (**)(_QWORD))a4;
  +[VNSession globalSession](VNSession, "globalSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "legacyForcedCleanupWithOptions:", v7);
  v5[2](v5);

}

+ (void)forcedCleanupWithOptions:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  +[VNSession globalSession](VNSession, "globalSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "legacyForcedCleanupWithOptions:", v4);

}

@end
