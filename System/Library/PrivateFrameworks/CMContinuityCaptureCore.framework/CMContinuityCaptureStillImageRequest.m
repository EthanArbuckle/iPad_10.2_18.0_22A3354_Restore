@implementation CMContinuityCaptureStillImageRequest

- (CMContinuityCaptureStillImageRequest)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMContinuityCaptureStillImageRequest;
  return -[CMContinuityCaptureStillImageRequest init](&v3, sel_init);
}

- (CMContinuityCaptureStillImageRequest)initWithCoder:(id)a3
{
  id v4;
  CMContinuityCaptureStillImageRequest *v5;
  uint64_t v6;
  NSString *compressedFormat;
  uint64_t v8;
  NSNumber *networkTimestamp;
  uint64_t v10;
  NSError *error;
  uint64_t v12;
  NSData *imageFileData;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CMContinuityCaptureStillImageRequest;
  v5 = -[CMContinuityCaptureStillImageRequest init](&v15, sel_init);
  if (v5)
  {
    v5->_uniqueID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("uniqueID"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("compressedFormat"));
    v6 = objc_claimAutoreleasedReturnValue();
    compressedFormat = v5->_compressedFormat;
    v5->_compressedFormat = (NSString *)v6;

    v5->_highResolutionPhotoEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("highResolutionEnabled"));
    v5->_flashMode = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("flashMode"));
    v5->_photoQualityPrioritization = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("photoQualityPrioritization"));
    v5->_maxPhotoDimensions.width = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("maxPhotoDimensionsWidth"));
    v5->_maxPhotoDimensions.height = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("maxPhotoDimensionsHeight"));
    v5->_captureComplete = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("captureComplete"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("networkTimestamp"));
    v8 = objc_claimAutoreleasedReturnValue();
    networkTimestamp = v5->_networkTimestamp;
    v5->_networkTimestamp = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
    v10 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageFileData"));
    v12 = objc_claimAutoreleasedReturnValue();
    imageFileData = v5->_imageFileData;
    v5->_imageFileData = (NSData *)v12;

    v5->_imageCodecType = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("imageCodecType"));
    v5->_imageWidth = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("imageWidth"));
    v5->_imageHeight = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("imageHeight"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: ID:%lld Format:%@ HiRes:%d, Flash:%d, QP:%d, Dimensions:%dx%d Complete:%d Timestamp:%@ Error:%@ Data:%@ [%p]"), v5, self->_uniqueID, self->_compressedFormat, self->_highResolutionPhotoEnabled, self->_flashMode, self->_photoQualityPrioritization, self->_maxPhotoDimensions.width, self->_maxPhotoDimensions.height, self->_captureComplete, self->_networkTimestamp, self->_error, self->_imageFileData, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t uniqueID;
  id v5;

  uniqueID = self->_uniqueID;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", uniqueID, CFSTR("uniqueID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_compressedFormat, CFSTR("compressedFormat"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_highResolutionPhotoEnabled, CFSTR("highResolutionEnabled"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_flashMode, CFSTR("flashMode"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_photoQualityPrioritization, CFSTR("photoQualityPrioritization"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_maxPhotoDimensions.width, CFSTR("maxPhotoDimensionsWidth"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_maxPhotoDimensions.height, CFSTR("maxPhotoDimensionsHeight"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_captureComplete, CFSTR("captureComplete"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_networkTimestamp, CFSTR("networkTimestamp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_error, CFSTR("error"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_imageFileData, CFSTR("imageFileData"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_imageCodecType, CFSTR("imageCodecType"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_imageWidth, CFSTR("imageWidth"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_imageHeight, CFSTR("imageHeight"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setUniqueID:", -[CMContinuityCaptureStillImageRequest uniqueID](self, "uniqueID"));
  -[CMContinuityCaptureStillImageRequest compressedFormat](self, "compressedFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setCompressedFormat:", v6);

  objc_msgSend(v4, "setHighResolutionPhotoEnabled:", -[CMContinuityCaptureStillImageRequest highResolutionPhotoEnabled](self, "highResolutionPhotoEnabled"));
  objc_msgSend(v4, "setFlashMode:", -[CMContinuityCaptureStillImageRequest flashMode](self, "flashMode"));
  objc_msgSend(v4, "setPhotoQualityPrioritization:", -[CMContinuityCaptureStillImageRequest photoQualityPrioritization](self, "photoQualityPrioritization"));
  objc_msgSend(v4, "setMaxPhotoDimensions:", -[CMContinuityCaptureStillImageRequest maxPhotoDimensions](self, "maxPhotoDimensions"));
  objc_msgSend(v4, "setCaptureComplete:", -[CMContinuityCaptureStillImageRequest captureComplete](self, "captureComplete"));
  -[CMContinuityCaptureStillImageRequest networkTimestamp](self, "networkTimestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setNetworkTimestamp:", v8);

  -[CMContinuityCaptureStillImageRequest error](self, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setError:", v10);

  -[CMContinuityCaptureStillImageRequest imageFileData](self, "imageFileData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setImageFileData:", v12);

  objc_msgSend(v4, "setImageCodecType:", -[CMContinuityCaptureStillImageRequest imageCodecType](self, "imageCodecType"));
  objc_msgSend(v4, "setImageWidth:", -[CMContinuityCaptureStillImageRequest imageWidth](self, "imageWidth"));
  objc_msgSend(v4, "setImageHeight:", -[CMContinuityCaptureStillImageRequest imageHeight](self, "imageHeight"));
  return v4;
}

- (int64_t)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(int64_t)a3
{
  self->_uniqueID = a3;
}

- (NSString)compressedFormat
{
  return self->_compressedFormat;
}

- (void)setCompressedFormat:(id)a3
{
  objc_storeStrong((id *)&self->_compressedFormat, a3);
}

- (BOOL)highResolutionPhotoEnabled
{
  return self->_highResolutionPhotoEnabled;
}

- (void)setHighResolutionPhotoEnabled:(BOOL)a3
{
  self->_highResolutionPhotoEnabled = a3;
}

- (int)flashMode
{
  return self->_flashMode;
}

- (void)setFlashMode:(int)a3
{
  self->_flashMode = a3;
}

- (int)photoQualityPrioritization
{
  return self->_photoQualityPrioritization;
}

- (void)setPhotoQualityPrioritization:(int)a3
{
  self->_photoQualityPrioritization = a3;
}

- ($2825F4736939C4A6D3AD43837233062D)maxPhotoDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_maxPhotoDimensions;
}

- (void)setMaxPhotoDimensions:(id)a3
{
  self->_maxPhotoDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (BOOL)captureComplete
{
  return self->_captureComplete;
}

- (void)setCaptureComplete:(BOOL)a3
{
  self->_captureComplete = a3;
}

- (NSNumber)networkTimestamp
{
  return self->_networkTimestamp;
}

- (void)setNetworkTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_networkTimestamp, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSData)imageFileData
{
  return self->_imageFileData;
}

- (void)setImageFileData:(id)a3
{
  objc_storeStrong((id *)&self->_imageFileData, a3);
}

- (unsigned)imageCodecType
{
  return self->_imageCodecType;
}

- (void)setImageCodecType:(unsigned int)a3
{
  self->_imageCodecType = a3;
}

- (int)imageWidth
{
  return self->_imageWidth;
}

- (void)setImageWidth:(int)a3
{
  self->_imageWidth = a3;
}

- (int)imageHeight
{
  return self->_imageHeight;
}

- (void)setImageHeight:(int)a3
{
  self->_imageHeight = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_imageFileData, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_networkTimestamp, 0);
  objc_storeStrong((id *)&self->_compressedFormat, 0);
}

@end
