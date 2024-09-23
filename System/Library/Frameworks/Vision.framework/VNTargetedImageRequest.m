@implementation VNTargetedImageRequest

- (VNTargetedImageRequest)initWithTargetedImageBuffer:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  VNTargetedImageRequest *v9;
  VNTargetedImageRequest *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  if (v7
    && (v12.receiver = self,
        v12.super_class = (Class)VNTargetedImageRequest,
        v9 = -[VNRequest initWithCompletionHandler:](&v12, sel_initWithCompletionHandler_, v8),
        (self = v9) != 0))
  {
    objc_storeStrong((id *)&v9->_targetedImageBuffer, a3);
    self = self;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (VNTargetedImageRequest)initWithTargetedCVPixelBuffer:(CVPixelBufferRef)pixelBuffer options:(NSDictionary *)options
{
  NSDictionary *v6;
  VNSession *v7;
  VNTargetedImageRequest *v8;

  v6 = options;
  v7 = objc_alloc_init(VNSession);
  v8 = -[VNTargetedImageRequest initWithTargetedCVPixelBuffer:orientation:options:session:completionHandler:](self, "initWithTargetedCVPixelBuffer:orientation:options:session:completionHandler:", pixelBuffer, 0, v6, v7, 0);

  return v8;
}

- (VNTargetedImageRequest)initWithTargetedCVPixelBuffer:(CVPixelBufferRef)pixelBuffer options:(NSDictionary *)options completionHandler:(VNRequestCompletionHandler)completionHandler
{
  NSDictionary *v8;
  VNRequestCompletionHandler v9;
  VNSession *v10;
  VNTargetedImageRequest *v11;

  v8 = options;
  v9 = completionHandler;
  v10 = objc_alloc_init(VNSession);
  v11 = -[VNTargetedImageRequest initWithTargetedCVPixelBuffer:orientation:options:session:completionHandler:](self, "initWithTargetedCVPixelBuffer:orientation:options:session:completionHandler:", pixelBuffer, 0, v8, v10, v9);

  return v11;
}

- (VNTargetedImageRequest)initWithTargetedCVPixelBuffer:(CVPixelBufferRef)pixelBuffer orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options
{
  uint64_t v5;
  NSDictionary *v8;
  VNSession *v9;
  VNTargetedImageRequest *v10;

  v5 = *(_QWORD *)&orientation;
  v8 = options;
  v9 = objc_alloc_init(VNSession);
  v10 = -[VNTargetedImageRequest initWithTargetedCVPixelBuffer:orientation:options:session:completionHandler:](self, "initWithTargetedCVPixelBuffer:orientation:options:session:completionHandler:", pixelBuffer, v5, v8, v9, 0);

  return v10;
}

- (VNTargetedImageRequest)initWithTargetedCVPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6
{
  return -[VNTargetedImageRequest initWithTargetedCVPixelBuffer:orientation:options:session:completionHandler:](self, "initWithTargetedCVPixelBuffer:orientation:options:session:completionHandler:", a3, *(_QWORD *)&a4, a5, a6, 0);
}

- (VNTargetedImageRequest)initWithTargetedCVPixelBuffer:(CVPixelBufferRef)pixelBuffer orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options completionHandler:(VNRequestCompletionHandler)completionHandler
{
  uint64_t v7;
  NSDictionary *v10;
  VNRequestCompletionHandler v11;
  VNSession *v12;
  VNTargetedImageRequest *v13;

  v7 = *(_QWORD *)&orientation;
  v10 = options;
  v11 = completionHandler;
  v12 = objc_alloc_init(VNSession);
  v13 = -[VNTargetedImageRequest initWithTargetedCVPixelBuffer:orientation:options:session:completionHandler:](self, "initWithTargetedCVPixelBuffer:orientation:options:session:completionHandler:", pixelBuffer, v7, v10, v12, v11);

  return v13;
}

- (VNTargetedImageRequest)initWithTargetedCVPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6 completionHandler:(id)a7
{
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  VNImageBuffer *v15;
  VNTargetedImageRequest *v16;

  v9 = *(_QWORD *)&a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = -[VNImageBuffer initWithCVPixelBuffer:orientation:options:session:]([VNImageBuffer alloc], "initWithCVPixelBuffer:orientation:options:session:", a3, v9, v12, v13);
  v16 = -[VNTargetedImageRequest initWithTargetedImageBuffer:completionHandler:](self, "initWithTargetedImageBuffer:completionHandler:", v15, v14);

  return v16;
}

- (VNTargetedImageRequest)initWithTargetedCGImage:(CGImageRef)cgImage options:(NSDictionary *)options
{
  NSDictionary *v6;
  VNSession *v7;
  VNTargetedImageRequest *v8;

  v6 = options;
  v7 = objc_alloc_init(VNSession);
  v8 = -[VNTargetedImageRequest initWithTargetedCGImage:orientation:options:session:completionHandler:](self, "initWithTargetedCGImage:orientation:options:session:completionHandler:", cgImage, 0, v6, v7, 0);

  return v8;
}

- (VNTargetedImageRequest)initWithTargetedCGImage:(CGImageRef)cgImage options:(NSDictionary *)options completionHandler:(VNRequestCompletionHandler)completionHandler
{
  NSDictionary *v8;
  VNRequestCompletionHandler v9;
  VNSession *v10;
  VNTargetedImageRequest *v11;

  v8 = options;
  v9 = completionHandler;
  v10 = objc_alloc_init(VNSession);
  v11 = -[VNTargetedImageRequest initWithTargetedCGImage:orientation:options:session:completionHandler:](self, "initWithTargetedCGImage:orientation:options:session:completionHandler:", cgImage, 0, v8, v10, v9);

  return v11;
}

- (VNTargetedImageRequest)initWithTargetedCGImage:(CGImageRef)cgImage orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options
{
  uint64_t v5;
  NSDictionary *v8;
  VNSession *v9;
  VNTargetedImageRequest *v10;

  v5 = *(_QWORD *)&orientation;
  v8 = options;
  v9 = objc_alloc_init(VNSession);
  v10 = -[VNTargetedImageRequest initWithTargetedCGImage:orientation:options:session:completionHandler:](self, "initWithTargetedCGImage:orientation:options:session:completionHandler:", cgImage, v5, v8, v9, 0);

  return v10;
}

- (VNTargetedImageRequest)initWithTargetedCGImage:(CGImageRef)cgImage orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options completionHandler:(VNRequestCompletionHandler)completionHandler
{
  uint64_t v7;
  NSDictionary *v10;
  VNRequestCompletionHandler v11;
  VNSession *v12;
  VNTargetedImageRequest *v13;

  v7 = *(_QWORD *)&orientation;
  v10 = options;
  v11 = completionHandler;
  v12 = objc_alloc_init(VNSession);
  v13 = -[VNTargetedImageRequest initWithTargetedCGImage:orientation:options:session:completionHandler:](self, "initWithTargetedCGImage:orientation:options:session:completionHandler:", cgImage, v7, v10, v12, v11);

  return v13;
}

- (VNTargetedImageRequest)initWithTargetedCGImage:(CGImage *)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6 completionHandler:(id)a7
{
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  VNImageBuffer *v15;
  VNTargetedImageRequest *v16;

  v9 = *(_QWORD *)&a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = -[VNImageBuffer initWithCGImage:orientation:options:session:]([VNImageBuffer alloc], "initWithCGImage:orientation:options:session:", a3, v9, v12, v13);
  v16 = -[VNTargetedImageRequest initWithTargetedImageBuffer:completionHandler:](self, "initWithTargetedImageBuffer:completionHandler:", v15, v14);

  return v16;
}

- (VNTargetedImageRequest)initWithTargetedCIImage:(CIImage *)ciImage options:(NSDictionary *)options
{
  CIImage *v6;
  NSDictionary *v7;
  VNSession *v8;
  VNTargetedImageRequest *v9;

  v6 = ciImage;
  v7 = options;
  v8 = objc_alloc_init(VNSession);
  v9 = -[VNTargetedImageRequest initWithTargetedCIImage:orientation:options:session:completionHandler:](self, "initWithTargetedCIImage:orientation:options:session:completionHandler:", v6, 0, v7, v8, 0);

  return v9;
}

- (VNTargetedImageRequest)initWithTargetedCIImage:(CIImage *)ciImage options:(NSDictionary *)options completionHandler:(VNRequestCompletionHandler)completionHandler
{
  CIImage *v8;
  NSDictionary *v9;
  VNRequestCompletionHandler v10;
  VNSession *v11;
  VNTargetedImageRequest *v12;

  v8 = ciImage;
  v9 = options;
  v10 = completionHandler;
  v11 = objc_alloc_init(VNSession);
  v12 = -[VNTargetedImageRequest initWithTargetedCIImage:orientation:options:session:completionHandler:](self, "initWithTargetedCIImage:orientation:options:session:completionHandler:", v8, 0, v9, v11, v10);

  return v12;
}

- (VNTargetedImageRequest)initWithTargetedCIImage:(CIImage *)ciImage orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options
{
  uint64_t v6;
  CIImage *v8;
  NSDictionary *v9;
  VNSession *v10;
  VNTargetedImageRequest *v11;

  v6 = *(_QWORD *)&orientation;
  v8 = ciImage;
  v9 = options;
  v10 = objc_alloc_init(VNSession);
  v11 = -[VNTargetedImageRequest initWithTargetedCIImage:orientation:options:session:completionHandler:](self, "initWithTargetedCIImage:orientation:options:session:completionHandler:", v8, v6, v9, v10, 0);

  return v11;
}

- (VNTargetedImageRequest)initWithTargetedCIImage:(CIImage *)ciImage orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options completionHandler:(VNRequestCompletionHandler)completionHandler
{
  uint64_t v8;
  CIImage *v10;
  NSDictionary *v11;
  VNRequestCompletionHandler v12;
  VNSession *v13;
  VNTargetedImageRequest *v14;

  v8 = *(_QWORD *)&orientation;
  v10 = ciImage;
  v11 = options;
  v12 = completionHandler;
  v13 = objc_alloc_init(VNSession);
  v14 = -[VNTargetedImageRequest initWithTargetedCIImage:orientation:options:session:completionHandler:](self, "initWithTargetedCIImage:orientation:options:session:completionHandler:", v10, v8, v11, v13, v12);

  return v14;
}

- (VNTargetedImageRequest)initWithTargetedCIImage:(id)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6 completionHandler:(id)a7
{
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  id v15;
  VNImageBuffer *v16;
  VNTargetedImageRequest *v17;

  v10 = *(_QWORD *)&a4;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = -[VNImageBuffer initWithCIImage:orientation:options:session:]([VNImageBuffer alloc], "initWithCIImage:orientation:options:session:", v12, v10, v13, v14);
  v17 = -[VNTargetedImageRequest initWithTargetedImageBuffer:completionHandler:](self, "initWithTargetedImageBuffer:completionHandler:", v16, v15);

  return v17;
}

- (VNTargetedImageRequest)initWithTargetedImageURL:(NSURL *)imageURL options:(NSDictionary *)options
{
  NSURL *v6;
  NSDictionary *v7;
  VNSession *v8;
  VNTargetedImageRequest *v9;

  v6 = imageURL;
  v7 = options;
  v8 = objc_alloc_init(VNSession);
  v9 = -[VNTargetedImageRequest initWithTargetedImageURL:orientation:options:session:completionHandler:](self, "initWithTargetedImageURL:orientation:options:session:completionHandler:", v6, 0, v7, v8, 0);

  return v9;
}

- (VNTargetedImageRequest)initWithTargetedImageURL:(NSURL *)imageURL options:(NSDictionary *)options completionHandler:(VNRequestCompletionHandler)completionHandler
{
  NSURL *v8;
  NSDictionary *v9;
  VNRequestCompletionHandler v10;
  VNSession *v11;
  VNTargetedImageRequest *v12;

  v8 = imageURL;
  v9 = options;
  v10 = completionHandler;
  v11 = objc_alloc_init(VNSession);
  v12 = -[VNTargetedImageRequest initWithTargetedImageURL:orientation:options:session:completionHandler:](self, "initWithTargetedImageURL:orientation:options:session:completionHandler:", v8, 0, v9, v11, v10);

  return v12;
}

- (VNTargetedImageRequest)initWithTargetedImageURL:(NSURL *)imageURL orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options
{
  uint64_t v6;
  NSURL *v8;
  NSDictionary *v9;
  VNSession *v10;
  VNTargetedImageRequest *v11;

  v6 = *(_QWORD *)&orientation;
  v8 = imageURL;
  v9 = options;
  v10 = objc_alloc_init(VNSession);
  v11 = -[VNTargetedImageRequest initWithTargetedImageURL:orientation:options:session:completionHandler:](self, "initWithTargetedImageURL:orientation:options:session:completionHandler:", v8, v6, v9, v10, 0);

  return v11;
}

- (VNTargetedImageRequest)initWithTargetedImageURL:(NSURL *)imageURL orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options completionHandler:(VNRequestCompletionHandler)completionHandler
{
  uint64_t v8;
  NSURL *v10;
  NSDictionary *v11;
  VNRequestCompletionHandler v12;
  VNSession *v13;
  VNTargetedImageRequest *v14;

  v8 = *(_QWORD *)&orientation;
  v10 = imageURL;
  v11 = options;
  v12 = completionHandler;
  v13 = objc_alloc_init(VNSession);
  v14 = -[VNTargetedImageRequest initWithTargetedImageURL:orientation:options:session:completionHandler:](self, "initWithTargetedImageURL:orientation:options:session:completionHandler:", v10, v8, v11, v13, v12);

  return v14;
}

- (VNTargetedImageRequest)initWithTargetedImageURL:(id)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6 completionHandler:(id)a7
{
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  id v15;
  VNImageBuffer *v16;
  VNTargetedImageRequest *v17;

  v10 = *(_QWORD *)&a4;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = -[VNImageBuffer initWithURL:orientation:options:session:]([VNImageBuffer alloc], "initWithURL:orientation:options:session:", v12, v10, v13, v14);
  v17 = -[VNTargetedImageRequest initWithTargetedImageBuffer:completionHandler:](self, "initWithTargetedImageBuffer:completionHandler:", v16, v15);

  return v17;
}

- (VNTargetedImageRequest)initWithTargetedImageData:(NSData *)imageData options:(NSDictionary *)options
{
  NSData *v6;
  NSDictionary *v7;
  VNSession *v8;
  VNTargetedImageRequest *v9;

  v6 = imageData;
  v7 = options;
  v8 = objc_alloc_init(VNSession);
  v9 = -[VNTargetedImageRequest initWithTargetedImageData:orientation:options:session:completionHandler:](self, "initWithTargetedImageData:orientation:options:session:completionHandler:", v6, 0, v7, v8, 0);

  return v9;
}

- (VNTargetedImageRequest)initWithTargetedImageData:(NSData *)imageData options:(NSDictionary *)options completionHandler:(VNRequestCompletionHandler)completionHandler
{
  NSData *v8;
  NSDictionary *v9;
  VNRequestCompletionHandler v10;
  VNSession *v11;
  VNTargetedImageRequest *v12;

  v8 = imageData;
  v9 = options;
  v10 = completionHandler;
  v11 = objc_alloc_init(VNSession);
  v12 = -[VNTargetedImageRequest initWithTargetedImageData:orientation:options:session:completionHandler:](self, "initWithTargetedImageData:orientation:options:session:completionHandler:", v8, 0, v9, v11, v10);

  return v12;
}

- (VNTargetedImageRequest)initWithTargetedImageData:(NSData *)imageData orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options
{
  uint64_t v6;
  NSData *v8;
  NSDictionary *v9;
  VNSession *v10;
  VNTargetedImageRequest *v11;

  v6 = *(_QWORD *)&orientation;
  v8 = imageData;
  v9 = options;
  v10 = objc_alloc_init(VNSession);
  v11 = -[VNTargetedImageRequest initWithTargetedImageData:orientation:options:session:completionHandler:](self, "initWithTargetedImageData:orientation:options:session:completionHandler:", v8, v6, v9, v10, 0);

  return v11;
}

- (VNTargetedImageRequest)initWithTargetedImageData:(NSData *)imageData orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options completionHandler:(VNRequestCompletionHandler)completionHandler
{
  uint64_t v8;
  NSData *v10;
  NSDictionary *v11;
  VNRequestCompletionHandler v12;
  VNSession *v13;
  VNTargetedImageRequest *v14;

  v8 = *(_QWORD *)&orientation;
  v10 = imageData;
  v11 = options;
  v12 = completionHandler;
  v13 = objc_alloc_init(VNSession);
  v14 = -[VNTargetedImageRequest initWithTargetedImageData:orientation:options:session:completionHandler:](self, "initWithTargetedImageData:orientation:options:session:completionHandler:", v10, v8, v11, v13, v12);

  return v14;
}

- (VNTargetedImageRequest)initWithTargetedImageData:(id)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6 completionHandler:(id)a7
{
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  id v15;
  VNImageBuffer *v16;
  VNTargetedImageRequest *v17;

  v10 = *(_QWORD *)&a4;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = -[VNImageBuffer initWithData:orientation:options:session:]([VNImageBuffer alloc], "initWithData:orientation:options:session:", v12, v10, v13, v14);
  v17 = -[VNTargetedImageRequest initWithTargetedImageBuffer:completionHandler:](self, "initWithTargetedImageBuffer:completionHandler:", v16, v15);

  return v17;
}

- (VNTargetedImageRequest)initWithTargetedCMSampleBuffer:(CMSampleBufferRef)sampleBuffer options:(NSDictionary *)options
{
  NSDictionary *v6;
  VNSession *v7;
  VNTargetedImageRequest *v8;

  v6 = options;
  v7 = objc_alloc_init(VNSession);
  v8 = -[VNTargetedImageRequest initWithTargetedCMSampleBuffer:orientation:options:session:completionHandler:](self, "initWithTargetedCMSampleBuffer:orientation:options:session:completionHandler:", sampleBuffer, 0, v6, v7, 0);

  return v8;
}

- (VNTargetedImageRequest)initWithTargetedCMSampleBuffer:(CMSampleBufferRef)sampleBuffer options:(NSDictionary *)options completionHandler:(VNRequestCompletionHandler)completionHandler
{
  NSDictionary *v8;
  VNRequestCompletionHandler v9;
  VNSession *v10;
  VNTargetedImageRequest *v11;

  v8 = options;
  v9 = completionHandler;
  v10 = objc_alloc_init(VNSession);
  v11 = -[VNTargetedImageRequest initWithTargetedCMSampleBuffer:orientation:options:session:completionHandler:](self, "initWithTargetedCMSampleBuffer:orientation:options:session:completionHandler:", sampleBuffer, 0, v8, v10, v9);

  return v11;
}

- (VNTargetedImageRequest)initWithTargetedCMSampleBuffer:(CMSampleBufferRef)sampleBuffer orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options
{
  uint64_t v5;
  NSDictionary *v8;
  VNSession *v9;
  VNTargetedImageRequest *v10;

  v5 = *(_QWORD *)&orientation;
  v8 = options;
  v9 = objc_alloc_init(VNSession);
  v10 = -[VNTargetedImageRequest initWithTargetedCMSampleBuffer:orientation:options:session:completionHandler:](self, "initWithTargetedCMSampleBuffer:orientation:options:session:completionHandler:", sampleBuffer, v5, v8, v9, 0);

  return v10;
}

- (VNTargetedImageRequest)initWithTargetedCMSampleBuffer:(CMSampleBufferRef)sampleBuffer orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options completionHandler:(VNRequestCompletionHandler)completionHandler
{
  uint64_t v7;
  NSDictionary *v10;
  VNRequestCompletionHandler v11;
  VNSession *v12;
  VNTargetedImageRequest *v13;

  v7 = *(_QWORD *)&orientation;
  v10 = options;
  v11 = completionHandler;
  v12 = objc_alloc_init(VNSession);
  v13 = -[VNTargetedImageRequest initWithTargetedCMSampleBuffer:orientation:options:session:completionHandler:](self, "initWithTargetedCMSampleBuffer:orientation:options:session:completionHandler:", sampleBuffer, v7, v10, v12, v11);

  return v13;
}

- (VNTargetedImageRequest)initWithTargetedCMSampleBuffer:(opaqueCMSampleBuffer *)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6 completionHandler:(id)a7
{
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  VNImageBuffer *v15;
  VNTargetedImageRequest *v16;

  v9 = *(_QWORD *)&a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = -[VNImageBuffer initWithCMSampleBuffer:orientation:options:session:]([VNImageBuffer alloc], "initWithCMSampleBuffer:orientation:options:session:", a3, v9, v12, v13);
  v16 = -[VNTargetedImageRequest initWithTargetedImageBuffer:completionHandler:](self, "initWithTargetedImageBuffer:completionHandler:", v15, v14);

  return v16;
}

- (id)targetedImageBuffer
{
  return self->_targetedImageBuffer;
}

- (id)requiredTargetedImageBufferReturningError:(id *)a3
{
  void *v4;
  void *v5;
  id v6;

  -[VNTargetedImageRequest targetedImageBuffer](self, "targetedImageBuffer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else if (a3)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("no valid initial image buffer was provided"));
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (BOOL)allowsCachingOfResults
{
  return 0;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  return 0;
}

- (id)sequencedRequestPreviousObservationsKey
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)VNTargetedImageRequest;
  -[VNRequest sequencedRequestPreviousObservationsKey](&v8, sel_sequencedRequestPreviousObservationsKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNImageBuffer sequencedRequestPreviousObservationsKey](self->_targetedImageBuffer, "sequencedRequestPreviousObservationsKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@:Trk=%@"), v4, v5);

  return v6;
}

- (id)newDuplicateInstance
{
  id v3;
  VNImageBuffer *targetedImageBuffer;
  void *v5;
  void *v6;

  v3 = objc_alloc((Class)objc_opt_class());
  targetedImageBuffer = self->_targetedImageBuffer;
  -[VNRequest completionHandler](self, "completionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithTargetedImageBuffer:completionHandler:", targetedImageBuffer, v5);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetedImageBuffer, 0);
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

@end
