@implementation AEWrappedMediaProvider

- (AEWrappedMediaProvider)initWithMediaProvider:(id)a3
{
  id v5;
  AEWrappedMediaProvider *v6;
  AEWrappedMediaProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AEWrappedMediaProvider;
  v6 = -[AEWrappedMediaProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->__internalMediaProvider, a3);

  return v7;
}

- (int64_t)requestImageDataForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[AEWrappedMediaProvider _internalMediaProvider](self, "_internalMediaProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "photoKitRequestOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v9) = objc_msgSend(v11, "requestImageDataForAsset:options:resultHandler:", v10, v12, v8);
  return (int)v9;
}

- (int64_t)requestImageURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[AEWrappedMediaProvider _internalMediaProvider](self, "_internalMediaProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "photoKitRequestOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v9) = objc_msgSend(v11, "requestImageURLForAsset:options:resultHandler:", v10, v12, v8);
  return (int)v9;
}

- (int64_t)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[AEWrappedMediaProvider _internalMediaProvider](self, "_internalMediaProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "photoKitRequestOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v9) = objc_msgSend(v11, "requestPlayerItemForVideo:options:resultHandler:", v10, v12, v8);
  return (int)v9;
}

- (int64_t)requestLivePhotoForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height;
  double width;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;

  height = a4.height;
  width = a4.width;
  v13 = a7;
  v14 = a6;
  v15 = a3;
  -[AEWrappedMediaProvider _internalMediaProvider](self, "_internalMediaProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "photoKitRequestOptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v14) = objc_msgSend(v16, "requestLivePhotoForAsset:targetSize:contentMode:options:resultHandler:", v15, a5, v17, v13, width, height);
  return (int)v14;
}

- (int64_t)requestAnimatedImageForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[AEWrappedMediaProvider _internalMediaProvider](self, "_internalMediaProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "photoKitRequestOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v9) = objc_msgSend(v11, "requestAnimatedImageForAsset:options:resultHandler:", v10, v12, v8);
  return (int)v9;
}

- (void)cancelImageRequest:(int64_t)a3
{
  id v4;

  -[AEWrappedMediaProvider _internalMediaProvider](self, "_internalMediaProvider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelImageRequest:", a3);

}

- (int64_t)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height;
  double width;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;

  height = a4.height;
  width = a4.width;
  v13 = a7;
  v14 = a6;
  v15 = a3;
  -[AEWrappedMediaProvider _internalMediaProvider](self, "_internalMediaProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "photoKitRequestOptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v14) = objc_msgSend(v16, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v15, a5, v17, v13, width, height);
  return (int)v14;
}

- (PUMediaProvider)_internalMediaProvider
{
  return self->__internalMediaProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__internalMediaProvider, 0);
}

@end
