@implementation JFXMediaDataReaderFactory

+ (JFXMediaDataReaderFactory)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_16);
  return (JFXMediaDataReaderFactory *)(id)sharedInstance_sInstance_0;
}

void __43__JFXMediaDataReaderFactory_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sInstance_0;
  sharedInstance_sInstance_0 = v0;

}

- (id)createARMetadataReaderWithCreationAttributesProvider:(id)a3 name:(id)a4
{
  id v5;
  void *v6;
  JFXAVMediaMetaDataReader *v7;
  void *v8;
  JFXAVMediaMetaDataReader *v9;
  JFXARMetadataMediaReader *v10;

  v5 = a4;
  objc_msgSend(a3, "arMetadataReaderAssetTrackAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = [JFXAVMediaMetaDataReader alloc];
    objc_msgSend(v6, "assetTrack");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[JFXAVMediaDataReader initWithAVAssetTrack:withName:](v7, "initWithAVAssetTrack:withName:", v8, v5);

    v10 = -[JFXARMetadataMediaReader initWithMetadataReader:]([JFXARMetadataMediaReader alloc], "initWithMetadataReader:", v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)createDepthDataReaderWithCreationAttributesProvider:(id)a3 name:(id)a4
{
  id v5;
  void *v6;
  JFXAVMediaVideoTrackReader *v7;
  void *v8;
  JFXAVMediaVideoTrackReader *v9;
  JFXDepthDataMediaReader *v10;

  v5 = a4;
  objc_msgSend(a3, "depthDataReaderAssetTrackAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = [JFXAVMediaVideoTrackReader alloc];
    objc_msgSend(v6, "assetTrack");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[JFXAVMediaDataReader initWithAVAssetTrack:withName:](v7, "initWithAVAssetTrack:withName:", v8, v5);

    v10 = -[JFXDepthDataMediaReader initWithVideoTrackReader:]([JFXDepthDataMediaReader alloc], "initWithVideoTrackReader:", v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
