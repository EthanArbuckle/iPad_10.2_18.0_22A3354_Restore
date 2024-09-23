@implementation CAMVideoLivePhotoMetadataWritingEnabledCommand

- (CAMVideoLivePhotoMetadataWritingEnabledCommand)initWithEnabled:(BOOL)a3
{
  CAMVideoLivePhotoMetadataWritingEnabledCommand *v4;
  CAMVideoLivePhotoMetadataWritingEnabledCommand *v5;
  CAMVideoLivePhotoMetadataWritingEnabledCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMVideoLivePhotoMetadataWritingEnabledCommand;
  v4 = -[CAMCaptureCommand init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->__livePhotoMetadataWritingEnabled = a3;
    v6 = v4;
  }

  return v5;
}

- (CAMVideoLivePhotoMetadataWritingEnabledCommand)initWithCoder:(id)a3
{
  id v4;
  CAMVideoLivePhotoMetadataWritingEnabledCommand *v5;
  CAMVideoLivePhotoMetadataWritingEnabledCommand *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMVideoLivePhotoMetadataWritingEnabledCommand;
  v5 = -[CAMCaptureCommand init](&v8, sel_init);
  if (v5)
  {
    v5->__livePhotoMetadataWritingEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CAMVideoWriteLivePhotoMetadataCommandEnabled"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMVideoLivePhotoMetadataWritingEnabledCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMVideoLivePhotoMetadataWritingEnabledCommand isLivePhotoMetadataWritingEnabled](self, "isLivePhotoMetadataWritingEnabled", v5.receiver, v5.super_class), CFSTR("CAMVideoWriteLivePhotoMetadataCommandEnabled"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMVideoLivePhotoMetadataWritingEnabledCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[24] = -[CAMVideoLivePhotoMetadataWritingEnabledCommand isLivePhotoMetadataWritingEnabled](self, "isLivePhotoMetadataWritingEnabled");
  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = -[CAMVideoLivePhotoMetadataWritingEnabledCommand isLivePhotoMetadataWritingEnabled](self, "isLivePhotoMetadataWritingEnabled");
  objc_msgSend(v4, "currentMovieFileOutput");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "connectionWithMediaType:", *MEMORY[0x1E0C8A808]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v5 || objc_msgSend(v6, "isLivePhotoMetadataWritingSupported"))
    objc_msgSend(v7, "setLivePhotoMetadataWritingEnabled:", v5);

}

- (BOOL)isLivePhotoMetadataWritingEnabled
{
  return self->__livePhotoMetadataWritingEnabled;
}

@end
