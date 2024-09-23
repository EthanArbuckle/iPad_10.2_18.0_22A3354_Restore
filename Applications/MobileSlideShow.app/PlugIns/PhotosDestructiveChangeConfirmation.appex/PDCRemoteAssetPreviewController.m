@implementation PDCRemoteAssetPreviewController

- (id)imagesWithTargetSize:(CGSize)a3 contentMode:(int64_t)a4 maximumCount:(unint64_t)a5
{
  double height;
  double width;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v25;
  id v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  uint8_t buf[4];
  id v34;
  _BYTE v35[128];

  height = a3.height;
  width = a3.width;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDCRemoteAssetPreviewController assetLocalIdentifiers](self, "assetLocalIdentifiers"));
  v11 = objc_alloc_init((Class)PHPhotoLibraryManager);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDCRemoteAssetPreviewController photoLibraryURL](self, "photoLibraryURL"));
  v32 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "openPhotoLibraryWithURL:options:error:", v12, 0, &v32));
  v14 = v32;

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", a5));
  if (v13)
  {
    v25 = v14;
    v26 = v11;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[PHFetchOptions fetchOptionsWithInclusiveDefaultsForPhotoLibrary:](PHFetchOptions, "fetchOptionsWithInclusiveDefaultsForPhotoLibrary:", v13));
    objc_msgSend(v16, "setFetchLimit:", a5);
    v27 = v10;
    v17 = objc_claimAutoreleasedReturnValue(+[PHAsset fetchAssetsWithLocalIdentifiers:options:](PHAsset, "fetchAssetsWithLocalIdentifiers:options:", v10, v16));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v18 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v29;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v29 != v20)
            objc_enumerationMutation(v17);
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[PDCRemoteAssetPreviewController imageForAsset:targetSize:contentMode:](self, "imageForAsset:targetSize:contentMode:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v21), a4, width, height));
          if (v22)
            objc_msgSend(v15, "addObject:", v22);

          v21 = (char *)v21 + 1;
        }
        while (v19 != v21);
        v19 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
      }
      while (v19);
    }

    v11 = v26;
    v10 = v27;
    v14 = v25;
  }
  else
  {
    v23 = PLUIGetLog();
    v17 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to open library %@", buf, 0xCu);
    }
  }

  return v15;
}

- (id)imageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5
{
  double height;
  double width;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  double v19;
  double v20;
  int64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  height = a4.height;
  width = a4.width;
  v8 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_100001EA0;
  v26 = sub_100001EB0;
  v27 = 0;
  v9 = objc_alloc_init((Class)PHImageRequestOptions);
  objc_msgSend(v9, "setDeliveryMode:", 1);
  objc_msgSend(v9, "setSynchronous:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[PHImageManager defaultManager](PHImageManager, "defaultManager"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100001EB8;
  v15[3] = &unk_100004210;
  v18 = &v22;
  v11 = v9;
  v16 = v11;
  v12 = v8;
  v17 = v12;
  v19 = width;
  v20 = height;
  v21 = a5;
  objc_msgSend(v10, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v12, a5, v11, v15, width, height);

  v13 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v13;
}

- (NSURL)photoLibraryURL
{
  return self->_photoLibraryURL;
}

- (void)setPhotoLibraryURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)assetLocalIdentifiers
{
  return self->_assetLocalIdentifiers;
}

- (void)setAssetLocalIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_photoLibraryURL, 0);
}

@end
