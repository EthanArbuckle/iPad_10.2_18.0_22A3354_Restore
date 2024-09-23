@implementation AVCapturePhotoPrivateClientMetadata

- (AVCapturePhotoPrivateClientMetadata)initWithMetadataDictionary:(id)a3
{
  AVCapturePhotoPrivateClientMetadata *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVCapturePhotoPrivateClientMetadata;
  v4 = -[AVCapturePhotoPrivateClientMetadata init](&v8, sel_init);
  v5 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D040D0]);
  if (v4 && (v6 = v5, objc_msgSend(v5, "count")))
  {
    v4->_inferenceAttachments = (NSDictionary *)objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D040E0]), "copy");
    v4->_detectedObjectInfo = (NSDictionary *)objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D040D8]), "copy");
  }
  else
  {

    return 0;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCapturePhotoPrivateClientMetadata;
  -[AVCapturePhotoPrivateClientMetadata dealloc](&v3, sel_dealloc);
}

- (AVCapturePhotoPrivateClientMetadata)initWithCoder:(id)a3
{
  AVCapturePhotoPrivateClientMetadata *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AVCapturePhotoPrivateClientMetadata;
  v4 = -[AVCapturePhotoPrivateClientMetadata init](&v15, sel_init);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v4->_inferenceAttachments = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0), *MEMORY[0x1E0D040E0]);
    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v4->_detectedObjectInfo = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, objc_opt_class(), 0), *MEMORY[0x1E0D040D8]);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_inferenceAttachments, *MEMORY[0x1E0D040E0]);
  objc_msgSend(a3, "encodeObject:forKey:", self->_detectedObjectInfo, *MEMORY[0x1E0D040D8]);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)inferenceAttachments
{
  return self->_inferenceAttachments;
}

- (NSDictionary)detectedObjectInfo
{
  return self->_detectedObjectInfo;
}

- (unsigned)spatialOverCaptureImageStitchingConfidenceScore
{
  return 0;
}

- (BOOL)spatialOverCaptureImageHorizonLinePresent
{
  return 0;
}

- (float)spatialOverCaptureImageHorizonLineAngleInDegrees
{
  return 0.0;
}

- (float)spatialOverCaptureImageHorizonLineVerticalCenterlineIntersection
{
  return 0.0;
}

- (NSString)captureFolderClientPath
{
  return 0;
}

@end
