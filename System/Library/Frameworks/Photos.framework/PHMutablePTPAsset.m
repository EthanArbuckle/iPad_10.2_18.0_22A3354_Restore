@implementation PHMutablePTPAsset

- (void)setDcfFilename:(id)a3
{
  NSString *v4;
  NSString *dcfFilename;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  dcfFilename = self->super._dcfFilename;
  self->super._dcfFilename = v4;

}

- (void)setCapturedFilename:(id)a3
{
  NSString *v4;
  NSString *capturedFilename;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  capturedFilename = self->super._capturedFilename;
  self->super._capturedFilename = v4;

}

- (void)setDeleted:(BOOL)a3
{
  self->super._deleted = a3;
}

- (void)setFileSystemFilename:(id)a3
{
  NSString *v4;
  NSString *fileSystemFilename;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  fileSystemFilename = self->super._fileSystemFilename;
  self->super._fileSystemFilename = v4;

}

- (void)setFullDirectoryPath:(id)a3
{
  NSString *v4;
  NSString *fullDirectoryPath;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  fullDirectoryPath = self->super._fullDirectoryPath;
  self->super._fullDirectoryPath = v4;

}

- (void)setObjectCompressedSize:(id)a3
{
  NSNumber *v4;
  NSNumber *objectCompressedSize;

  v4 = (NSNumber *)objc_msgSend(a3, "copy");
  objectCompressedSize = self->super._objectCompressedSize;
  self->super._objectCompressedSize = v4;

}

- (void)setFingerprint:(id)a3
{
  NSString *v4;
  NSString *fingerprint;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  fingerprint = self->super._fingerprint;
  self->super._fingerprint = v4;

}

- (void)setOriginatingAssetID:(id)a3
{
  NSString *v4;
  NSString *originatingAssetID;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  originatingAssetID = self->super._originatingAssetID;
  self->super._originatingAssetID = v4;

}

- (void)setThumbOffset:(id)a3
{
  NSNumber *v4;
  NSNumber *thumbOffset;

  v4 = (NSNumber *)objc_msgSend(a3, "copy");
  thumbOffset = self->super._thumbOffset;
  self->super._thumbOffset = v4;

}

- (void)setThumbCompressedSize:(id)a3
{
  NSNumber *v4;
  NSNumber *thumbCompressedSize;

  v4 = (NSNumber *)objc_msgSend(a3, "copy");
  thumbCompressedSize = self->super._thumbCompressedSize;
  self->super._thumbCompressedSize = v4;

}

- (void)setImagePixSize:(CGSize)a3
{
  self->super._imagePixSize = a3;
}

- (void)setThumbPixSize:(CGSize)a3
{
  self->super._thumbPixSize = a3;
}

- (void)setDesiredOrientation:(int64_t)a3
{
  self->super._desiredOrientation = a3;
}

- (void)setModificationDateString:(id)a3
{
  NSString *v4;
  NSString *modificationDateString;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  modificationDateString = self->super._modificationDateString;
  self->super._modificationDateString = v4;

}

- (void)setCaptureDateString:(id)a3
{
  NSString *v4;
  NSString *captureDateString;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  captureDateString = self->super._captureDateString;
  self->super._captureDateString = v4;

}

- (void)setDurationString:(id)a3
{
  NSString *v4;
  NSString *durationString;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  durationString = self->super._durationString;
  self->super._durationString = v4;

}

- (void)setLocationString:(id)a3
{
  NSString *v4;
  NSString *locationString;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  locationString = self->super._locationString;
  self->super._locationString = v4;

}

- (void)setGroupUUID:(id)a3
{
  NSString *v4;
  NSString *groupUUID;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  groupUUID = self->super._groupUUID;
  self->super._groupUUID = v4;

}

- (void)setBurstUUID:(id)a3
{
  NSString *v4;
  NSString *burstUUID;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  burstUUID = self->super._burstUUID;
  self->super._burstUUID = v4;

}

- (void)setBurstPicked:(BOOL)a3
{
  self->super._burstPicked = a3;
}

- (void)setBurstFavorite:(BOOL)a3
{
  self->super._burstFavorite = a3;
}

- (void)setBurstFirstPicked:(BOOL)a3
{
  self->super._burstFirstPicked = a3;
}

- (void)setHighFrameRateVideo:(BOOL)a3
{
  self->super._highFrameRateVideo = a3;
}

- (void)setTimeLapseVideo:(BOOL)a3
{
  self->super._timeLapseVideo = a3;
}

- (void)setConversionGroup:(int64_t)a3
{
  self->super._conversionGroup = a3;
}

- (void)setVideoCodec:(unsigned int)a3
{
  self->super._videoCodec = a3;
}

- (void)setContentType:(id)a3
{
  objc_storeStrong((id *)&self->super._contentType, a3);
}

- (void)setIsHDR:(BOOL)a3
{
  self->super._isHDR = a3;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->super._url, a3);
}

- (void)setOverflowURL:(id)a3
{
  objc_storeStrong((id *)&self->super._overflowURL, a3);
}

- (void)setResourceHandle:(id)a3
{
  objc_storeStrong((id *)&self->super._resourceHandle, a3);
}

- (id)updateForTranscodeChoiceWithConversionResult:(id)a3
{
  id v4;
  UTType *v5;
  UTType *contentType;
  void *v7;
  PHPTPAssetHandle *v8;
  int64_t v9;
  uint64_t v10;
  void *v11;
  PHPTPAssetHandle *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  int v27;
  PHMutablePTPAsset *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->super._videoCodec = objc_msgSend(v4, "inputVideoCodec");
  objc_msgSend(v4, "inputContentType");
  v5 = (UTType *)objc_claimAutoreleasedReturnValue();
  contentType = self->super._contentType;
  self->super._contentType = v5;

  if (objc_msgSend(v4, "requiresConversion"))
  {
    self->super._conversionGroup = 1;
    v7 = (void *)-[PHMutablePTPAsset mutableCopy](self, "mutableCopy");
    if (v7)
    {
      v8 = [PHPTPAssetHandle alloc];
      v9 = -[PHPTPAssetHandle resourceType](self->super._resourceHandle, "resourceType");
      v10 = -[PHPTPAssetHandle orientation](self->super._resourceHandle, "orientation");
      -[PHPTPAssetHandle localIdentifier](self->super._resourceHandle, "localIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[PHPTPAssetHandle initWithResourceType:orientation:localIdentifier:requiresConversion:](v8, "initWithResourceType:orientation:localIdentifier:requiresConversion:", v9, v10, v11, 1);
      objc_msgSend(v7, "setResourceHandle:", v12);

      objc_msgSend(v7, "setConversionGroup:", 2);
      -[NSString stringByDeletingPathExtension](self->super._capturedFilename, "stringByDeletingPathExtension");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "pathExtension");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringByAppendingPathExtension:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setCapturedFilename:", v15);

      -[NSString stringByDeletingPathExtension](self->super._dcfFilename, "stringByDeletingPathExtension");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "pathExtension");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringByAppendingPathExtension:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDcfFilename:", v18);

      -[NSString stringByDeletingPathExtension](self->super._fileSystemFilename, "stringByDeletingPathExtension");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "pathExtension");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringByAppendingPathExtension:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFileSystemFilename:", v21);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "estimatedFileLength"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObjectCompressedSize:", v22);

      objc_msgSend(v7, "setVideoCodec:", objc_msgSend(v4, "outputVideoCodec"));
      objc_msgSend(v4, "outputContentType");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setContentType:", v23);

      v24 = v7;
    }
    else
    {
      PLPTPGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v27 = 138412290;
        v28 = self;
        _os_log_impl(&dword_1991EC000, v25, OS_LOG_TYPE_ERROR, "Expected a successful copy of %@", (uint8_t *)&v27, 0xCu);
      }

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)updateWithConversionResult:(id)a3
{
  UTType *v4;
  UTType *contentType;
  PHPTPAssetHandle *v6;
  int64_t v7;
  uint64_t v8;
  void *v9;
  PHPTPAssetHandle *v10;
  PHPTPAssetHandle *resourceHandle;
  void *v12;
  void *v13;
  NSString *v14;
  NSString *dcfFilename;
  void *v16;
  void *v17;
  NSString *v18;
  NSString *capturedFilename;
  void *v20;
  void *v21;
  NSString *v22;
  NSString *fileSystemFilename;
  NSNumber *v24;
  NSNumber *objectCompressedSize;
  id v26;

  v26 = a3;
  if (objc_msgSend(v26, "outputVideoCodec"))
    self->super._videoCodec = objc_msgSend(v26, "outputVideoCodec");
  objc_msgSend(v26, "outputContentType");
  v4 = (UTType *)objc_claimAutoreleasedReturnValue();
  contentType = self->super._contentType;
  self->super._contentType = v4;

  if (objc_msgSend(v26, "requiresConversion"))
  {
    v6 = [PHPTPAssetHandle alloc];
    v7 = -[PHPTPAssetHandle resourceType](self->super._resourceHandle, "resourceType");
    v8 = -[PHPTPAssetHandle orientation](self->super._resourceHandle, "orientation");
    -[PHPTPAssetHandle localIdentifier](self->super._resourceHandle, "localIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PHPTPAssetHandle initWithResourceType:orientation:localIdentifier:requiresConversion:](v6, "initWithResourceType:orientation:localIdentifier:requiresConversion:", v7, v8, v9, 1);
    resourceHandle = self->super._resourceHandle;
    self->super._resourceHandle = v10;

    -[NSString stringByDeletingPathExtension](self->super._dcfFilename, "stringByDeletingPathExtension");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "pathExtension");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingPathExtension:", v13);
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    dcfFilename = self->super._dcfFilename;
    self->super._dcfFilename = v14;

    -[NSString stringByDeletingPathExtension](self->super._capturedFilename, "stringByDeletingPathExtension");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "pathExtension");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByAppendingPathExtension:", v17);
    v18 = (NSString *)objc_claimAutoreleasedReturnValue();
    capturedFilename = self->super._capturedFilename;
    self->super._capturedFilename = v18;

    -[NSString stringByDeletingPathExtension](self->super._fileSystemFilename, "stringByDeletingPathExtension");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "pathExtension");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringByAppendingPathExtension:", v21);
    v22 = (NSString *)objc_claimAutoreleasedReturnValue();
    fileSystemFilename = self->super._fileSystemFilename;
    self->super._fileSystemFilename = v22;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v26, "estimatedFileLength"));
    v24 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    objectCompressedSize = self->super._objectCompressedSize;
    self->super._objectCompressedSize = v24;

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PHPTPAsset initWithPTPAsset:]([PHPTPAsset alloc], "initWithPTPAsset:", self);
}

@end
