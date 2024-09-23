@implementation PFPAssetRequestConfiguration

- (PFPAssetRequestConfiguration)initWithFileProviderURL:(id)a3
{
  id v4;
  PFPAssetRequestConfiguration *v5;
  PFPAssetRequestConfiguration *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  unsigned int v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  unsigned int v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  unsigned int v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  unsigned int v36;
  void *v37;
  void *v38;
  id v39;
  PHPhotoLibrary *v40;
  id v41;
  char *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  NSString *localIdentifier;
  PHPhotoLibrary *photoLibrary;
  PHPhotoLibrary *v48;
  void *v49;
  uint64_t v50;
  PXPhotosExportConfiguration *exportConfiguration;
  id v52;
  void *v53;
  void *v55;
  void *v56;
  PFPAssetRequestConfiguration *v57;
  id v58;
  id v59;
  void *v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  objc_super v66;
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  id v70;
  _BYTE v71[128];

  v4 = a3;
  v66.receiver = self;
  v66.super_class = (Class)PFPAssetRequestConfiguration;
  v5 = -[PFPAssetRequestConfiguration init](&v66, "init");
  v6 = v5;
  if (!v5)
    goto LABEL_41;
  v57 = v5;
  v7 = objc_alloc_init((Class)NSURLComponents);
  v58 = v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByDeletingPathExtension"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
  objc_msgSend(v7, "setQuery:", v9);

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v56 = v7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "queryItems"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
  if (!v11)
  {
    v59 = 0;
    v60 = 0;
    v13 = 0;
    v14 = 0;
    goto LABEL_23;
  }
  v12 = v11;
  v59 = 0;
  v60 = 0;
  v13 = 0;
  v14 = 0;
  v15 = *(_QWORD *)v63;
  do
  {
    v16 = 0;
    do
    {
      if (*(_QWORD *)v63 != v15)
        objc_enumerationMutation(v10);
      v17 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "name"));
      v19 = PXPhotosFileProviderURLQueryItemUUIDKey();
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      v21 = objc_msgSend(v18, "isEqualToString:", v20);

      if (v21)
      {
        v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "value"));

        v14 = (void *)v22;
        goto LABEL_17;
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "name"));
      v24 = PXPhotosFileProviderURLQueryItemIdentifierCodeKey();
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      v26 = objc_msgSend(v23, "isEqualToString:", v25);

      if (v26)
      {
        v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "value"));

        v13 = (void *)v27;
        goto LABEL_17;
      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "name"));
      v29 = PXPhotosFileProviderURLQueryItemLibraryIdentifierKey();
      v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
      v31 = objc_msgSend(v28, "isEqualToString:", v30);

      if (v31)
      {
        v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "value"));

        v60 = (void *)v32;
        goto LABEL_17;
      }
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "name"));
      v34 = PXPhotosFileProviderURLQueryItemThumbnailSizeKey();
      v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      v36 = objc_msgSend(v33, "isEqualToString:", v35);

      if (v36)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "value"));
        v59 = objc_msgSend(v37, "integerValue");
LABEL_15:

        goto LABEL_17;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "name"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "value"));
        *(_DWORD *)buf = 138412546;
        v68 = v37;
        v69 = 2112;
        v70 = v38;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unknown URL query item (name: %@, value: %@)", buf, 0x16u);

        goto LABEL_15;
      }
LABEL_17:
      v16 = (char *)v16 + 1;
    }
    while (v12 != v16);
    v39 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
    v12 = v39;
  }
  while (v39);
LABEL_23:

  if (objc_msgSend(v60, "isEqualToString:", CFSTR("cmm")))
  {
    v40 = (PHPhotoLibrary *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary sharedMomentSharePhotoLibrary](PHPhotoLibrary, "sharedMomentSharePhotoLibrary"));
    v41 = 0;
    v6 = v57;
    v4 = v58;
    if (!v40)
      goto LABEL_30;
  }
  else
  {
    v42 = (char *)objc_msgSend(v60, "integerValue");
    v6 = v57;
    v4 = v58;
    if ((unint64_t)(v42 - 1) > 2)
    {
      v41 = 0;
      goto LABEL_30;
    }
    v61 = 0;
    v40 = (PHPhotoLibrary *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary openPhotoLibraryWithWellKnownIdentifier:error:](PHPhotoLibrary, "openPhotoLibraryWithWellKnownIdentifier:error:", v42, &v61));
    v41 = v61;
    if (!v40)
    {
LABEL_30:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v68 = v60;
        v69 = 2112;
        v70 = v41;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Can't open photo library with identifier (%{public}@): %@", buf, 0x16u);
      }
      v40 = 0;
    }
  }
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pathExtension"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[PFUniformTypeUtilities typeWithFilenameExtension:](PFUniformTypeUtilities, "typeWithFilenameExtension:", v43));

  if (!v44 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pathExtension"));
    *(_DWORD *)buf = 138412290;
    v68 = v55;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Can't find possible content type with extension: %@", buf, 0xCu);

  }
  objc_storeStrong((id *)&v6->_UUID, v14);
  if (objc_msgSend(v14, "length") && objc_msgSend(v13, "length"))
  {
    v45 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/L0/%@"), v14, v13));
    localIdentifier = v6->_localIdentifier;
    v6->_localIdentifier = (NSString *)v45;
  }
  else
  {
    localIdentifier = v6->_localIdentifier;
    v6->_localIdentifier = 0;
  }

  photoLibrary = v6->_photoLibrary;
  v6->_photoLibrary = v40;
  v48 = v40;

  v6->_thumbnailSize = (int64_t)v59;
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "queryItems"));
  v50 = objc_claimAutoreleasedReturnValue(+[PXPhotosExportConfiguration configurationWithQueryItems:possibleContentType:](PXPhotosExportConfiguration, "configurationWithQueryItems:possibleContentType:", v49, v44));
  exportConfiguration = v6->_exportConfiguration;
  v6->_exportConfiguration = (PXPhotosExportConfiguration *)v50;

  v52 = objc_msgSend((id)objc_opt_class(v6), "analyticsActivityTypeFromFileProviderURL:", v4);
  v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
  -[PXPhotosExportConfiguration setActivityTypeForAssetExportAnalytics:](v6->_exportConfiguration, "setActivityTypeForAssetExportAnalytics:", v53);

LABEL_41:
  return v6;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PFPAssetRequestConfiguration UUID](self, "UUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PFPAssetRequestConfiguration photoLibrary](self, "photoLibrary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PFPAssetRequestConfiguration exportConfiguration](self, "exportConfiguration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("UUID: %@, PhotoLibrary: %@, ExportConfiguration: %@"), v3, v4, v5));

  return v6;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (int64_t)thumbnailSize
{
  return self->_thumbnailSize;
}

- (PXPhotosExportConfiguration)exportConfiguration
{
  return self->_exportConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportConfiguration, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

+ (id)analyticsActivityTypeFromFileProviderURL:(id)a3
{
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "URLByDeletingLastPathComponent"));
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));
  if (!-[__CFString length](v4, "length"))
  {

    v4 = CFSTR("unknown");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString lowercaseString](v4, "lowercaseString"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));

  if (!-[__CFString length](v7, "length"))
  {

    v7 = CFSTR("com.apple.PhotosFileProvider");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v7, v5));

  return v8;
}

@end
