@implementation VNSequenceRequestHandler

- (VNSequenceRequestHandler)initWithSession:(id)a3
{
  id v5;
  VNSequenceRequestHandler *v6;
  VNSequenceRequestHandler *v7;
  VNRequestPerformer *v8;
  VNRequestPerformer *requestPerformer;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VNSequenceRequestHandler;
  v6 = -[VNSequenceRequestHandler init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_session, a3);
    v8 = objc_alloc_init(VNRequestPerformer);
    requestPerformer = v7->_requestPerformer;
    v7->_requestPerformer = v8;

  }
  return v7;
}

- (BOOL)_performRequests:(id)a3 onImageBuffer:(id)a4 gatheredForensics:(id *)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  VNRequestForensics *v13;
  BOOL v14;
  VNObservationsCache *v15;
  VNRequestPerformingContext *v16;
  VNRequestPerformer *requestPerformer;
  id v18;
  id v20;

  v10 = a3;
  v11 = a4;
  if (v11)
  {
    v12 = (void *)MEMORY[0x1A1B0B060]();
    if (a5)
    {
      v13 = objc_retainAutorelease(-[VNRequestForensics initWithOriginalRequests:]([VNRequestForensics alloc], "initWithOriginalRequests:", v10));
      *a5 = v13;
    }
    else
    {
      v13 = 0;
    }
    v15 = objc_alloc_init(VNObservationsCache);
    v16 = -[VNRequestPerformingContext initWithSession:requestPerformer:imageBuffer:forensics:observationsCache:]([VNRequestPerformingContext alloc], "initWithSession:requestPerformer:imageBuffer:forensics:observationsCache:", self->_session, self->_requestPerformer, v11, v13, v15);
    -[VNRequestPerformingContext qosClass](v16, "qosClass");
    requestPerformer = self->_requestPerformer;
    v20 = 0;
    v14 = -[VNRequestPerformer performRequests:inContext:error:](requestPerformer, "performRequests:inContext:error:", v10, v16, &v20);
    v18 = v20;

    objc_autoreleasePoolPop(v12);
    if (a6)
      *a6 = objc_retainAutorelease(v18);

  }
  else if (a6)
  {
    +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", CFSTR("no image buffer available"));
    v14 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (VNSequenceRequestHandler)init
{
  void *v3;
  VNSequenceRequestHandler *v4;

  +[VNSession globalSession](VNSession, "globalSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[VNSequenceRequestHandler initWithSession:](self, "initWithSession:", v3);

  return v4;
}

- (void)dealloc
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[VNRequestPerformer getCurrentTrackersAndReset](self->_requestPerformer, "getCurrentTrackersAndReset");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        -[VNSession releaseTracker:](self->_session, "releaseTracker:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  v7.receiver = self;
  v7.super_class = (Class)VNSequenceRequestHandler;
  -[VNSequenceRequestHandler dealloc](&v7, sel_dealloc);
}

- (BOOL)performRequests:(NSArray *)requests onCVPixelBuffer:(CVPixelBufferRef)pixelBuffer error:(NSError *)error
{
  return -[VNSequenceRequestHandler performRequests:onCVPixelBuffer:orientation:gatheredForensics:error:](self, "performRequests:onCVPixelBuffer:orientation:gatheredForensics:error:", requests, pixelBuffer, 0, 0, error);
}

- (BOOL)performRequests:(id)a3 onCVPixelBuffer:(__CVBuffer *)a4 gatheredForensics:(id *)a5 error:(id *)a6
{
  return -[VNSequenceRequestHandler performRequests:onCVPixelBuffer:orientation:gatheredForensics:error:](self, "performRequests:onCVPixelBuffer:orientation:gatheredForensics:error:", a3, a4, 0, a5, a6);
}

- (BOOL)performRequests:(NSArray *)requests onCVPixelBuffer:(CVPixelBufferRef)pixelBuffer orientation:(CGImagePropertyOrientation)orientation error:(NSError *)error
{
  return -[VNSequenceRequestHandler performRequests:onCVPixelBuffer:orientation:gatheredForensics:error:](self, "performRequests:onCVPixelBuffer:orientation:gatheredForensics:error:", requests, pixelBuffer, *(_QWORD *)&orientation, 0, error);
}

- (BOOL)performRequests:(id)a3 onCVPixelBuffer:(__CVBuffer *)a4 orientation:(unsigned int)a5 gatheredForensics:(id *)a6 error:(id *)a7
{
  uint64_t v9;
  id v12;
  VNImageBuffer *v13;
  BOOL v14;

  v9 = *(_QWORD *)&a5;
  v12 = a3;
  v13 = -[VNImageBuffer initWithCVPixelBuffer:orientation:options:session:]([VNImageBuffer alloc], "initWithCVPixelBuffer:orientation:options:session:", a4, v9, 0, self->_session);
  if (v13)
  {
    v14 = -[VNSequenceRequestHandler _performRequests:onImageBuffer:gatheredForensics:error:](self, "_performRequests:onImageBuffer:gatheredForensics:error:", v12, v13, a6, a7);
  }
  else if (a7)
  {
    +[VNError errorForInvalidArgument:named:](VNError, "errorForInvalidArgument:named:", 0, CFSTR("pixelBuffer"));
    v14 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)performRequests:(NSArray *)requests onCGImage:(CGImageRef)image error:(NSError *)error
{
  return -[VNSequenceRequestHandler performRequests:onCGImage:orientation:gatheredForensics:error:](self, "performRequests:onCGImage:orientation:gatheredForensics:error:", requests, image, 0, 0, error);
}

- (BOOL)performRequests:(id)a3 onCGImage:(CGImage *)a4 gatheredForensics:(id *)a5 error:(id *)a6
{
  return -[VNSequenceRequestHandler performRequests:onCGImage:orientation:gatheredForensics:error:](self, "performRequests:onCGImage:orientation:gatheredForensics:error:", a3, a4, 0, a5, a6);
}

- (BOOL)performRequests:(NSArray *)requests onCGImage:(CGImageRef)image orientation:(CGImagePropertyOrientation)orientation error:(NSError *)error
{
  return -[VNSequenceRequestHandler performRequests:onCGImage:orientation:gatheredForensics:error:](self, "performRequests:onCGImage:orientation:gatheredForensics:error:", requests, image, *(_QWORD *)&orientation, 0, error);
}

- (BOOL)performRequests:(id)a3 onCGImage:(CGImage *)a4 orientation:(unsigned int)a5 gatheredForensics:(id *)a6 error:(id *)a7
{
  uint64_t v9;
  id v12;
  VNImageBuffer *v13;
  BOOL v14;

  v9 = *(_QWORD *)&a5;
  v12 = a3;
  v13 = -[VNImageBuffer initWithCGImage:orientation:options:session:]([VNImageBuffer alloc], "initWithCGImage:orientation:options:session:", a4, v9, 0, self->_session);
  if (v13)
  {
    v14 = -[VNSequenceRequestHandler _performRequests:onImageBuffer:gatheredForensics:error:](self, "_performRequests:onImageBuffer:gatheredForensics:error:", v12, v13, a6, a7);
  }
  else if (a7)
  {
    +[VNError errorForInvalidArgument:named:](VNError, "errorForInvalidArgument:named:", 0, CFSTR("cgImage"));
    v14 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)performRequests:(NSArray *)requests onCIImage:(CIImage *)image error:(NSError *)error
{
  return -[VNSequenceRequestHandler performRequests:onCIImage:orientation:gatheredForensics:error:](self, "performRequests:onCIImage:orientation:gatheredForensics:error:", requests, image, 0, 0, error);
}

- (BOOL)performRequests:(id)a3 onCIImage:(id)a4 gatheredForensics:(id *)a5 error:(id *)a6
{
  return -[VNSequenceRequestHandler performRequests:onCIImage:orientation:gatheredForensics:error:](self, "performRequests:onCIImage:orientation:gatheredForensics:error:", a3, a4, 0, a5, a6);
}

- (BOOL)performRequests:(NSArray *)requests onCIImage:(CIImage *)image orientation:(CGImagePropertyOrientation)orientation error:(NSError *)error
{
  return -[VNSequenceRequestHandler performRequests:onCIImage:orientation:gatheredForensics:error:](self, "performRequests:onCIImage:orientation:gatheredForensics:error:", requests, image, *(_QWORD *)&orientation, 0, error);
}

- (BOOL)performRequests:(id)a3 onCIImage:(id)a4 orientation:(unsigned int)a5 gatheredForensics:(id *)a6 error:(id *)a7
{
  uint64_t v9;
  id v12;
  id v13;
  VNImageBuffer *v14;
  BOOL v15;

  v9 = *(_QWORD *)&a5;
  v12 = a3;
  v13 = a4;
  v14 = -[VNImageBuffer initWithCIImage:orientation:options:session:]([VNImageBuffer alloc], "initWithCIImage:orientation:options:session:", v13, v9, 0, self->_session);
  if (v14)
  {
    v15 = -[VNSequenceRequestHandler _performRequests:onImageBuffer:gatheredForensics:error:](self, "_performRequests:onImageBuffer:gatheredForensics:error:", v12, v14, a6, a7);
  }
  else if (a7)
  {
    +[VNError errorForInvalidArgument:named:](VNError, "errorForInvalidArgument:named:", 0, CFSTR("ciImage"));
    v15 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)performRequests:(NSArray *)requests onImageURL:(NSURL *)imageURL error:(NSError *)error
{
  return -[VNSequenceRequestHandler performRequests:onImageURL:orientation:gatheredForensics:error:](self, "performRequests:onImageURL:orientation:gatheredForensics:error:", requests, imageURL, 0, 0, error);
}

- (BOOL)performRequests:(id)a3 onImageURL:(id)a4 gatheredForensics:(id *)a5 error:(id *)a6
{
  return -[VNSequenceRequestHandler performRequests:onImageURL:orientation:gatheredForensics:error:](self, "performRequests:onImageURL:orientation:gatheredForensics:error:", a3, a4, 0, a5, a6);
}

- (BOOL)performRequests:(NSArray *)requests onImageURL:(NSURL *)imageURL orientation:(CGImagePropertyOrientation)orientation error:(NSError *)error
{
  return -[VNSequenceRequestHandler performRequests:onImageURL:orientation:gatheredForensics:error:](self, "performRequests:onImageURL:orientation:gatheredForensics:error:", requests, imageURL, *(_QWORD *)&orientation, 0, error);
}

- (BOOL)performRequests:(id)a3 onImageURL:(id)a4 orientation:(unsigned int)a5 gatheredForensics:(id *)a6 error:(id *)a7
{
  uint64_t v9;
  id v12;
  id v13;
  VNImageBuffer *v14;
  BOOL v15;

  v9 = *(_QWORD *)&a5;
  v12 = a3;
  v13 = a4;
  v14 = -[VNImageBuffer initWithURL:orientation:options:session:]([VNImageBuffer alloc], "initWithURL:orientation:options:session:", v13, v9, 0, self->_session);
  if (v14)
  {
    v15 = -[VNSequenceRequestHandler _performRequests:onImageBuffer:gatheredForensics:error:](self, "_performRequests:onImageBuffer:gatheredForensics:error:", v12, v14, a6, a7);
  }
  else if (a7)
  {
    +[VNError errorForInvalidArgument:named:](VNError, "errorForInvalidArgument:named:", 0, CFSTR("url"));
    v15 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)performRequests:(NSArray *)requests onImageData:(NSData *)imageData error:(NSError *)error
{
  return -[VNSequenceRequestHandler performRequests:onImageData:orientation:gatheredForensics:error:](self, "performRequests:onImageData:orientation:gatheredForensics:error:", requests, imageData, 0, 0, error);
}

- (BOOL)performRequests:(id)a3 onImageData:(id)a4 gatheredForensics:(id *)a5 error:(id *)a6
{
  return -[VNSequenceRequestHandler performRequests:onImageData:orientation:gatheredForensics:error:](self, "performRequests:onImageData:orientation:gatheredForensics:error:", a3, a4, 0, a5, a6);
}

- (BOOL)performRequests:(NSArray *)requests onImageData:(NSData *)imageData orientation:(CGImagePropertyOrientation)orientation error:(NSError *)error
{
  return -[VNSequenceRequestHandler performRequests:onImageData:orientation:gatheredForensics:error:](self, "performRequests:onImageData:orientation:gatheredForensics:error:", requests, imageData, *(_QWORD *)&orientation, 0, error);
}

- (BOOL)performRequests:(id)a3 onImageData:(id)a4 orientation:(unsigned int)a5 gatheredForensics:(id *)a6 error:(id *)a7
{
  uint64_t v9;
  id v12;
  id v13;
  VNImageBuffer *v14;
  BOOL v15;

  v9 = *(_QWORD *)&a5;
  v12 = a3;
  v13 = a4;
  v14 = -[VNImageBuffer initWithData:orientation:options:session:]([VNImageBuffer alloc], "initWithData:orientation:options:session:", v13, v9, 0, self->_session);
  if (v14)
  {
    v15 = -[VNSequenceRequestHandler _performRequests:onImageBuffer:gatheredForensics:error:](self, "_performRequests:onImageBuffer:gatheredForensics:error:", v12, v14, a6, a7);
  }
  else if (a7)
  {
    +[VNError errorForInvalidArgument:named:](VNError, "errorForInvalidArgument:named:", 0, CFSTR("data"));
    v15 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)performRequests:(NSArray *)requests onCMSampleBuffer:(CMSampleBufferRef)sampleBuffer error:(NSError *)error
{
  return -[VNSequenceRequestHandler performRequests:onCMSampleBuffer:orientation:gatheredForensics:error:](self, "performRequests:onCMSampleBuffer:orientation:gatheredForensics:error:", requests, sampleBuffer, 0, 0, error);
}

- (BOOL)performRequests:(id)a3 onCMSampleBuffer:(opaqueCMSampleBuffer *)a4 gatheredForensics:(id *)a5 error:(id *)a6
{
  return -[VNSequenceRequestHandler performRequests:onCMSampleBuffer:orientation:gatheredForensics:error:](self, "performRequests:onCMSampleBuffer:orientation:gatheredForensics:error:", a3, a4, 0, a5, a6);
}

- (BOOL)performRequests:(NSArray *)requests onCMSampleBuffer:(CMSampleBufferRef)sampleBuffer orientation:(CGImagePropertyOrientation)orientation error:(NSError *)error
{
  return -[VNSequenceRequestHandler performRequests:onCMSampleBuffer:orientation:gatheredForensics:error:](self, "performRequests:onCMSampleBuffer:orientation:gatheredForensics:error:", requests, sampleBuffer, *(_QWORD *)&orientation, 0, error);
}

- (BOOL)performRequests:(id)a3 onCMSampleBuffer:(opaqueCMSampleBuffer *)a4 orientation:(unsigned int)a5 gatheredForensics:(id *)a6 error:(id *)a7
{
  uint64_t v9;
  id v12;
  VNImageBuffer *v13;
  BOOL v14;

  v9 = *(_QWORD *)&a5;
  v12 = a3;
  v13 = -[VNImageBuffer initWithCMSampleBuffer:orientation:options:session:]([VNImageBuffer alloc], "initWithCMSampleBuffer:orientation:options:session:", a4, v9, 0, self->_session);
  if (v13)
  {
    v14 = -[VNSequenceRequestHandler _performRequests:onImageBuffer:gatheredForensics:error:](self, "_performRequests:onImageBuffer:gatheredForensics:error:", v12, v13, a6, a7);
  }
  else if (a7)
  {
    +[VNError errorForInvalidArgument:named:](VNError, "errorForInvalidArgument:named:", 0, CFSTR("data"));
    v14 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)prepareForPerformingRequests:(id)a3 error:(id *)a4
{
  return -[VNSession prepareForPerformingRequests:error:](self->_session, "prepareForPerformingRequests:error:", a3, a4);
}

- (VNSession)session
{
  return self->_session;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestPerformer, 0);
  objc_storeStrong((id *)&self->_session, 0);
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
