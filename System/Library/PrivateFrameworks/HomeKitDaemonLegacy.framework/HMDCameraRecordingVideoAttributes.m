@implementation HMDCameraRecordingVideoAttributes

- (HMDCameraRecordingVideoAttributes)initWithResolution:(int64_t)a3 frameRate:(id)a4
{
  id v7;
  HMDCameraRecordingVideoAttributes *v8;
  HMDCameraRecordingVideoAttributes *v9;
  int64_t v10;
  NSNumber *v11;
  NSNumber *v12;
  NSNumber *imageWidth;
  NSNumber *imageHeight;
  objc_super v16;

  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HMDCameraRecordingVideoAttributes;
  v8 = -[HMDCameraRecordingVideoAttributes init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_resolution = a3;
    objc_storeStrong((id *)&v8->_frameRate, a4);
    v10 = a3 - 1;
    if ((unint64_t)(a3 - 1) > 0x10)
    {
      v11 = 0;
      v12 = 0;
    }
    else
    {
      v11 = (NSNumber *)qword_1E89B6B70[v10];
      v12 = (NSNumber *)qword_1E89B6BF8[v10];
    }
    imageWidth = v9->_imageWidth;
    v9->_imageWidth = v11;

    imageHeight = v9->_imageHeight;
    v9->_imageHeight = v12;

  }
  return v9;
}

- (HMDCameraRecordingVideoAttributes)initWithImageWidth:(id)a3 imageHeight:(id)a4 frameRate:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDCameraRecordingVideoAttributes *v12;
  HMDCameraRecordingVideoAttributes *v13;
  uint64_t v15;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HMDCameraRecordingVideoAttributes;
  v12 = -[HMDCameraRecordingVideoAttributes init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_imageWidth, a3);
    objc_storeStrong((id *)&v13->_imageHeight, a4);
    v15 = 0;
    translateResolutionWidthHeight(v9, v10, &v15);
    v13->_resolution = v15;
    objc_storeStrong((id *)&v13->_frameRate, a5);
  }

  return v13;
}

- (BOOL)_parseFromTLVData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  NSNumber *v8;
  NSNumber *imageWidth;
  NSNumber *v10;
  NSNumber *imageHeight;
  NSNumber *v12;
  NSNumber *frameRate;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D16590], "wrappertlv:name:", 1, CFSTR("kVideoAttributesImageWidth"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D16590], "wrappertlv:name:", 2, CFSTR("kVideoAttributesImageHeight"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D16590], "wrappertlv:name:", 3, CFSTR("kVideoAttributesFrameRate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v15[1] = v4;
  v15[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HAPTLVBase _parse:](self, "_parse:", v6);
  if (v7)
  {
    objc_msgSend(v3, "field");
    v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    imageWidth = self->_imageWidth;
    self->_imageWidth = v8;

    objc_msgSend(v4, "field");
    v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    imageHeight = self->_imageHeight;
    self->_imageHeight = v10;

    objc_msgSend(v5, "field");
    v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    frameRate = self->_frameRate;
    self->_frameRate = v12;

    translateResolutionWidthHeight(self->_imageWidth, self->_imageHeight, &self->_resolution);
  }

  return v7;
}

- (NSData)tlvData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D165F8], "creator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingVideoAttributes imageWidth](self, "imageWidth");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:length:number:", 1, 2, v4);

  -[HMDCameraRecordingVideoAttributes imageHeight](self, "imageHeight");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:length:number:", 2, 2, v5);

  -[HMDCameraRecordingVideoAttributes frameRate](self, "frameRate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:length:number:", 3, 1, v6);

  objc_msgSend(v3, "serialize");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v7;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  -[HAPTLVBase tlvDatablob](self, "tlvDatablob");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n%@tlvDatablob = %@ "), v6, v8);

  -[HMDCameraRecordingVideoAttributes imageWidth](self, "imageWidth");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n%@imageWidth = %@ "), v6, v9);

  -[HMDCameraRecordingVideoAttributes imageHeight](self, "imageHeight");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n%@imageHeight = %@"), v6, v10);

  -[HMDCameraRecordingVideoAttributes frameRate](self, "frameRate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n%@frameRate = %@"), v6, v11);

}

- (HMDCameraRecordingVideoAttributes)initWithCoder:(id)a3
{
  id v4;
  HMDCameraRecordingVideoAttributes *v5;
  uint64_t v6;
  NSNumber *imageWidth;
  uint64_t v8;
  NSNumber *imageHeight;
  uint64_t v10;
  NSNumber *frameRate;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDCameraRecordingVideoAttributes;
  v5 = -[HMDCameraRecordingVideoAttributes init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kVideoAttributesImageWidth"));
    v6 = objc_claimAutoreleasedReturnValue();
    imageWidth = v5->_imageWidth;
    v5->_imageWidth = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kVideoAttributesImageHeight"));
    v8 = objc_claimAutoreleasedReturnValue();
    imageHeight = v5->_imageHeight;
    v5->_imageHeight = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kVideoAttributesFrameRate"));
    v10 = objc_claimAutoreleasedReturnValue();
    frameRate = v5->_frameRate;
    v5->_frameRate = (NSNumber *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HMDCameraRecordingVideoAttributes imageWidth](self, "imageWidth");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kVideoAttributesImageWidth"));

  -[HMDCameraRecordingVideoAttributes imageHeight](self, "imageHeight");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kVideoAttributesImageHeight"));

  -[HMDCameraRecordingVideoAttributes frameRate](self, "frameRate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kVideoAttributesFrameRate"));

}

- (NSNumber)imageWidth
{
  return self->_imageWidth;
}

- (NSNumber)imageHeight
{
  return self->_imageHeight;
}

- (int64_t)resolution
{
  return self->_resolution;
}

- (NSNumber)frameRate
{
  return self->_frameRate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameRate, 0);
  objc_storeStrong((id *)&self->_imageHeight, 0);
  objc_storeStrong((id *)&self->_imageWidth, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
