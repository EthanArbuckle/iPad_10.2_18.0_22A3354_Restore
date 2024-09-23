@implementation LPAudio

- (LPAudio)init
{

  return 0;
}

- (id)_initWithAudio:(id)a3
{
  id *v4;
  LPAudio *v5;
  LPAudio *v6;
  uint64_t v7;
  NSData *data;
  uint64_t v9;
  NSString *MIMEType;
  uint64_t v11;
  LPAudioProperties *properties;
  LPAudio *v13;
  objc_super v15;

  v4 = (id *)a3;
  v15.receiver = self;
  v15.super_class = (Class)LPAudio;
  v5 = -[LPAudio init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_streamingURL, v4[6]);
    v7 = objc_msgSend(v4[1], "copy");
    data = v6->_data;
    v6->_data = (NSData *)v7;

    v9 = objc_msgSend(v4[7], "copy");
    MIMEType = v6->_MIMEType;
    v6->_MIMEType = (NSString *)v9;

    objc_storeStrong((id *)&v6->_fileURL, v4[5]);
    v11 = objc_msgSend(v4[4], "copy");
    properties = v6->_properties;
    v6->_properties = (LPAudioProperties *)v11;

    v13 = v6;
  }

  return v6;
}

- (id)initByReferencingFileURL:(id)a3 MIMEType:(id)a4 properties:(id)a5
{
  id v8;
  id v9;
  id v10;
  LPAudio *v11;
  uint64_t v12;
  LPAudioProperties *properties;
  LPAudio *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)LPAudio;
  v11 = -[LPAudio init](&v16, sel_init);
  if (v11 && objc_msgSend(v8, "isFileURL"))
  {
    -[LPAudio setFileURL:](v11, "setFileURL:", v8);
    objc_storeStrong((id *)&v11->_MIMEType, a4);
    v12 = objc_msgSend(v10, "copy");
    properties = v11->_properties;
    v11->_properties = (LPAudioProperties *)v12;

    v14 = v11;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (LPAudio)initWithStreamingURL:(id)a3 properties:(id)a4
{
  id v7;
  id v8;
  LPAudio *v9;
  LPAudio *v10;
  LPAudio *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)LPAudio;
  v9 = -[LPAudio init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_streamingURL, a3);
    objc_storeStrong((id *)&v10->_properties, a4);
    v11 = v10;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPAudio)initWithCoder:(id)a3
{
  id v4;
  LPAudio *v5;
  uint64_t v6;
  NSURL *streamingURL;
  uint64_t v8;
  NSData *data;
  uint64_t v10;
  NSString *MIMEType;
  LPAudioProperties *v12;
  LPAudioProperties *properties;
  void *v14;
  LPAudio *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)LPAudio;
  v5 = -[LPAudio init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("streamingURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    streamingURL = v5->_streamingURL;
    v5->_streamingURL = (NSURL *)v6;

    objc_msgSend(v4, "_lp_strictlyDecodeNSDataForKey:", CFSTR("data"));
    v8 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v8;

    objc_msgSend(v4, "_lp_strictlyDecodeNSStringForKey:", CFSTR("MIMEType"));
    v10 = objc_claimAutoreleasedReturnValue();
    MIMEType = v5->_MIMEType;
    v5->_MIMEType = (NSString *)v10;

    v12 = objc_alloc_init(LPAudioProperties);
    properties = v5->_properties;
    v5->_properties = v12;

    objc_msgSend(v4, "_lp_strictlyDecodeNSStringForKey:", CFSTR("accessibilityText"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPAudioProperties setAccessibilityText:](v5->_properties, "setAccessibilityText:", v14);

    v15 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "_lp_encodeURLIfNotNilOrLocalFile:forKey:", self->_streamingURL, CFSTR("streamingURL"));
  if (!-[LPAudio _isSubstitute](self, "_isSubstitute"))
  {
    -[LPAudio data](self, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_lp_encodeObjectIfNotNil:forKey:", v4, CFSTR("data"));

  }
  objc_msgSend(v6, "_lp_encodeStringIfNotNil:forKey:", self->_MIMEType, CFSTR("MIMEType"));
  -[LPAudioProperties accessibilityText](self->_properties, "accessibilityText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_lp_encodeStringIfNotNil:forKey:", v5, CFSTR("accessibilityText"));

}

- (BOOL)_canEncodeWithoutComputation
{
  LPAudio *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_data)
    v3 = 1;
  else
    v3 = v2->_streamingURL != 0;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  void **v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPAudio;
  if (-[LPAudio isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void **)v4;
      if ((objectsAreEqual_2(v6[6], self->_streamingURL) & 1) != 0
        && objectsAreEqual_2(v6[1], self->_data)
        && objectsAreEqual_2(v6[7], self->_MIMEType)
        && objectsAreEqual_2(v6[5], self->_fileURL))
      {
        v5 = objectsAreEqual_2(v6[4], self->_properties);
      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)_encodedSize
{
  LPAudio *v2;
  unint64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NSData length](v2->_data, "length");
  objc_sync_exit(v2);

  return v3;
}

- (void)setFileURL:(id)a3
{
  LPAudio *v4;
  NSURL *v5;
  NSURL *fileURL;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if ((objc_msgSend(v7, "isFileURL") & 1) != 0)
    v5 = (NSURL *)v7;
  else
    v5 = 0;
  fileURL = v4->_fileURL;
  v4->_fileURL = v5;

  objc_sync_exit(v4);
}

- (NSData)data
{
  LPAudio *v2;
  NSData *data;
  NSURL *fileURL;
  uint64_t v5;
  id v6;
  NSData *v7;
  NSObject *v8;
  NSData *v9;
  id v11;

  v2 = self;
  objc_sync_enter(v2);
  data = v2->_data;
  if (!data)
  {
    fileURL = v2->_fileURL;
    if (fileURL)
    {
      v11 = 0;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", fileURL, 1, &v11);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = v11;
      v7 = v2->_data;
      v2->_data = (NSData *)v5;

      if (v6)
      {
        v8 = LPLogChannelUI();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          -[LPAudio data].cold.1((uint64_t)v6, v8);
      }

      data = v2->_data;
    }
    else
    {
      data = 0;
    }
  }
  v9 = data;
  objc_sync_exit(v2);

  return v9;
}

- (LPAudioProperties)properties
{
  return (LPAudioProperties *)(id)-[LPAudioProperties copy](self->_properties, "copy");
}

- (BOOL)_isSubstitute
{
  return 0;
}

- (AVAsset)_asset
{
  AVURLAsset *asset;
  AVURLAsset *v3;
  NSURL *streamingURL;
  NSURL *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  AVURLAsset *v10;
  AVURLAsset *v11;
  void *v12;
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
  AVURLAsset *v23;
  NSObject *v24;
  OS_dispatch_queue *v25;
  OS_dispatch_queue *mediaLoadingQueue;
  void *v27;
  AVURLAsset *v28;

  asset = self->_asset;
  if (asset)
  {
    v3 = asset;
  }
  else
  {
    streamingURL = self->_streamingURL;
    if (streamingURL)
    {
      v6 = streamingURL;
      +[LPTestingOverrides customLoader](LPTestingOverrides, "customLoader");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        +[LPTestingOverrides customLoader](LPTestingOverrides, "customLoader");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "overrideURLForMediaURL:", v6);
        v9 = objc_claimAutoreleasedReturnValue();

        v6 = (NSURL *)v9;
      }
      objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", v6);
      v10 = (AVURLAsset *)objc_claimAutoreleasedReturnValue();
      v11 = self->_asset;
      self->_asset = v10;

      +[LPTestingOverrides customLoader](LPTestingOverrides, "customLoader");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        +[LPTestingOverrides customLoader](LPTestingOverrides, "customLoader");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVURLAsset resourceLoader](self->_asset, "resourceLoader");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "installCustomMediaLoader:", v14);

      }
    }
    else
    {
      -[LPAudio data](self, "data");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        v3 = 0;
        return (AVAsset *)v3;
      }
      v16 = (void *)MEMORY[0x1E0C8B3C0];
      v17 = (void *)MEMORY[0x1E0C99E98];
      v18 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "UUIDString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("link-presentation-audio://audio/%@"), v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "URLWithString:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "URLAssetWithURL:options:", v22, 0);
      v23 = (AVURLAsset *)objc_claimAutoreleasedReturnValue();

      if (!self->_mediaLoadingQueue)
      {
        dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.LinkPresentation.AudioFetching", v24);
        mediaLoadingQueue = self->_mediaLoadingQueue;
        self->_mediaLoadingQueue = v25;

      }
      -[AVURLAsset resourceLoader](v23, "resourceLoader");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setDelegate:queue:", self, self->_mediaLoadingQueue);

      v28 = self->_asset;
      self->_asset = v23;
      v6 = v23;

    }
    v3 = self->_asset;

  }
  return (AVAsset *)v3;
}

- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSUInteger v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSUInteger v17;
  NSUInteger v18;
  unint64_t v19;
  void *v20;
  BOOL v21;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "contentInformationRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    +[LPMIMETypeRegistry UTIForMIMEType:](LPMIMETypeRegistry, "UTIForMIMEType:", self->_MIMEType);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentInformationRequest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setContentType:", v9);

    v11 = -[NSData length](self->_data, "length");
    objc_msgSend(v7, "contentInformationRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setContentLength:", v11);

    objc_msgSend(v7, "contentInformationRequest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setByteRangeAccessSupported:", 1);

  }
  objc_msgSend(v7, "dataRequest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v7, "dataRequest");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "requestedOffset");
    v17 = -[NSData length](self->_data, "length");
    v18 = v17 - objc_msgSend(v15, "requestedOffset");
    if (!v18)
      goto LABEL_11;
    if ((objc_msgSend(v15, "requestsAllDataToEndOfResource") & 1) == 0)
    {
      v19 = objc_msgSend(v15, "requestedLength");
      if (v19 < v18)
        v18 = v19;
    }
    -[NSData subdataWithRange:](self->_data, "subdataWithRange:", v16, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
LABEL_11:

      v21 = 0;
      goto LABEL_12;
    }
    objc_msgSend(v15, "respondWithData:", v20);

  }
  objc_msgSend(v7, "finishLoading");
  v21 = 1;
LABEL_12:

  return v21;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (NSURL)streamingURL
{
  return self->_streamingURL;
}

- (NSString)MIMEType
{
  return self->_MIMEType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_MIMEType, 0);
  objc_storeStrong((id *)&self->_streamingURL, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_mediaLoadingQueue, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (void)data
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A0C41000, a2, OS_LOG_TYPE_ERROR, "LPAudio: Failed to load data: %@", (uint8_t *)&v2, 0xCu);
}

@end
