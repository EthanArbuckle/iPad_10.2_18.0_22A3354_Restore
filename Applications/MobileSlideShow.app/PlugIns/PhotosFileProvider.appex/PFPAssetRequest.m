@implementation PFPAssetRequest

+ (void)requestFileForPhotosFileProviderURL:(id)a3 progressCreation:(id)a4 completion:(id)a5
{
  id v9;
  void (**v10)(id, void *);
  id v11;
  void *v12;
  PFPAssetRequestConfiguration *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  _QWORD v40[2];
  _QWORD v41[2];
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;

  v9 = a3;
  v10 = (void (**)(id, void *))a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_33:
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PFPAssetRequest.m"), 126, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("progressCreation"));

    if (v11)
      goto LABEL_4;
    goto LABEL_34;
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PFPAssetRequest.m"), 125, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fileProviderURL"));

  if (!v10)
    goto LABEL_33;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_34:
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PFPAssetRequest.m"), 127, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_4:
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSProgress progressWithTotalUnitCount:](NSProgress, "progressWithTotalUnitCount:", 100));
  v10[2](v10, v12);
  v13 = -[PFPAssetRequestConfiguration initWithFileProviderURL:]([PFPAssetRequestConfiguration alloc], "initWithFileProviderURL:", v9);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PFPAssetRequestConfiguration debugDescription](v13, "debugDescription"));
    *(_DWORD *)buf = 138412546;
    v43 = v14;
    v44 = 2112;
    v45 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Created configuration (%@) from file provider URL: %@", buf, 0x16u);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PFPAssetRequestConfiguration photoLibrary](v13, "photoLibrary"));
  if (v15)
  {
LABEL_11:
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PFPAssetRequestConfiguration localIdentifier](v13, "localIdentifier"));
    if (!v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[PFPAssetRequestConfiguration UUID](v13, "UUID"));
      v20 = objc_msgSend(v19, "length");

      if (v20)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[PFPAssetRequestConfiguration UUID](v13, "UUID"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[PHAsset localIdentifierWithUUID:](PHAsset, "localIdentifierWithUUID:", v21));

      }
      else
      {
        v18 = 0;
      }
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "px_fetchObjectWithLocalIdentifier:", v18));
    if (!v22)
    {
      v30 = v11;
      v40[0] = NSDebugDescriptionErrorKey;
      v40[1] = NSURLErrorKey;
      v41[0] = CFSTR("Failed to fetch PHObject");
      v41[1] = v9;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v41, v40, 2));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("PFPAssetRequestErrorDomain"), 0, v25));

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v18;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to fetch PHObject with localIdentifier: %@", buf, 0xCu);
      }
      v11 = v30;
      (*((void (**)(id, _QWORD, void *))v30 + 2))(v30, 0, v23);
      goto LABEL_30;
    }
    objc_msgSend(v12, "setCompletedUnitCount:", 1);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v43 = v22;
      v44 = 2112;
      v45 = v12;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Finished fetching object: %@ (progress: %@)", buf, 0x16u);
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[PFPAssetRequestConfiguration exportConfiguration](v13, "exportConfiguration"));
    v24 = objc_opt_class(PHAsset);
    if ((objc_opt_isKindOfClass(v22, v24) & 1) != 0)
    {
      if (-[PFPAssetRequestConfiguration thumbnailSize](v13, "thumbnailSize"))
      {
        objc_msgSend(a1, "_exportThumbnailForAsset:thumbnailSize:fileProviderURL:progress:completion:", v22, -[PFPAssetRequestConfiguration thumbnailSize](v13, "thumbnailSize"), v9, v12, v11);
LABEL_30:

        goto LABEL_31;
      }
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_1000058F8;
      v35[3] = &unk_100008280;
      v38 = a1;
      v36 = v9;
      v37 = v11;
      +[PXPhotosExportUtilities exportAsset:configuration:progress:completion:](PXPhotosExportUtilities, "exportAsset:configuration:progress:completion:", v22, v23, v12, v35);

      v26 = v36;
    }
    else
    {
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_10000591C;
      v31[3] = &unk_100008280;
      v34 = a1;
      v32 = v9;
      v33 = v11;
      +[PXPhotosExportUtilities exportAssetsInContainer:configuration:progress:completion:](PXPhotosExportUtilities, "exportAssetsInContainer:configuration:progress:completion:", v22, v23, v12, v31);

      v26 = v32;
    }

    goto LABEL_30;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Missing photo library so fallback to the system photo library.", buf, 2u);
  }
  v39 = 0;
  v16 = objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary openPhotoLibraryWithWellKnownIdentifier:error:](PHPhotoLibrary, "openPhotoLibraryWithWellKnownIdentifier:error:", 1, &v39));
  v17 = v39;
  v15 = v17;
  if (v16)
  {

    v15 = (void *)v16;
    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v43 = v15;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Can't open system photo library: %@", buf, 0xCu);
  }
  (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v15);
LABEL_31:

}

+ (void)_exportThumbnailForAsset:(id)a3 thumbnailSize:(int64_t)a4 fileProviderURL:(id)a5 progress:(id)a6 completion:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  double v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (a4 == 1)
  {
    v17 = 120.0;
  }
  else
  {
    v17 = 360.0;
    if (!a4)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PFPAssetRequest.m"), 195, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("thumbnailSize != PXPhotosFileProviderThumbnailSizeUndefined"));

      v17 = 360.0;
    }
  }
  v19 = objc_alloc_init((Class)PHImageRequestOptions);
  objc_msgSend(v19, "setDeliveryMode:", 1);
  objc_msgSend(v19, "setNetworkAccessAllowed:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[PHImageManager defaultManager](PHImageManager, "defaultManager"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100005710;
  v24[3] = &unk_1000082A8;
  v25 = v14;
  v26 = v15;
  v27 = v16;
  v28 = a1;
  v21 = v16;
  v22 = v15;
  v23 = v14;
  objc_msgSend(v20, "requestNewCGImageForAsset:targetSize:contentMode:options:resultHandler:", v13, 0, v19, v24, v17, v17);

}

+ (void)_saveImageRef:(CGImage *)a3 toURL:(id)a4 completionHandler:(id)a5
{
  const __CFURL *v8;
  void (**v9)(id, _QWORD, void *);
  __CFString *v10;
  CGImageDestination *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSErrorUserInfoKey v16;
  const __CFString *v17;
  uint8_t buf[4];
  const __CFURL *v19;
  __int16 v20;
  void *v21;
  NSErrorUserInfoKey v22;
  const __CFString *v23;

  v8 = (const __CFURL *)a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeJPEG, "identifier"));
  v11 = CGImageDestinationCreateWithURL(v8, v10, 1uLL, 0);

  if (v11)
  {
    CGImageDestinationAddImage(v11, a3, 0);
    if (CGImageDestinationFinalize(v11))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v8;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Saved image ref at URL (%@).", buf, 0xCu);
      }
      objc_msgSend(a1, "_markURLAsPurgable:completionHandler:", v8, v9);
    }
    else
    {
      v22 = NSDebugDescriptionErrorKey;
      v23 = CFSTR("Failed to write image ref");
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("PFPAssetRequestErrorDomain"), -1, v14));

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v19 = v8;
        v20 = 2112;
        v21 = v15;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to saved image ref to URL (%@) with error: %@", buf, 0x16u);
      }
      v9[2](v9, 0, v15);

    }
    CFRelease(v11);
  }
  else
  {
    v16 = NSDebugDescriptionErrorKey;
    v17 = CFSTR("Failed to create destination ref");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("PFPAssetRequestErrorDomain"), -1, v12));

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v8;
      v20 = 2112;
      v21 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to saved image ref to URL (%@) with error: %@", buf, 0x16u);
    }
    v9[2](v9, 0, v13);

  }
}

+ (void)_replaceAssetAtURL:(id)a3 withItemAtURL:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, id);
  void *v11;
  unsigned int v12;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, id))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v14 = 0;
  v12 = objc_msgSend(v11, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", v8, v9, 0, 0, 0, &v14);
  v13 = v14;

  if (v12)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Replaced existing file at URL (%@) with URL (%@).", buf, 0x16u);
    }
    objc_msgSend(a1, "_markURLAsPurgable:completionHandler:", v8, v10);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      v19 = 2112;
      v20 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to replace file at URL (%@) with URL (%@) with error: %@", buf, 0x20u);
    }
    v10[2](v10, 0, v13);
  }

}

+ (void)_markURLAsPurgable:(id)a3 completionHandler:(id)a4
{
  id v5;
  void (**v6)(id, id, _QWORD);
  int v7;
  id v8;

  v5 = a3;
  v6 = (void (**)(id, id, _QWORD))a4;
  if (+[PLCacheDeleteSupport markPurgeableForFileAtURL:withUrgency:outInode:](PLCacheDeleteSupport, "markPurgeableForFileAtURL:withUrgency:outInode:", v5, 0, 0))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Marked file provider URL (%@) as purgeable.", (uint8_t *)&v7, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to mark file provider URL (%@) as purgeable.", (uint8_t *)&v7, 0xCu);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Successfully provided file at URL: %@", (uint8_t *)&v7, 0xCu);
  }
  v6[2](v6, v5, 0);

}

@end
