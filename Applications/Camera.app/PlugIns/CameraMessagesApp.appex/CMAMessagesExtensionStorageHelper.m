@implementation CMAMessagesExtensionStorageHelper

+ (void)markFilePurgeableAtURL:(id)a3
{
  id v3;
  void *v4;
  id v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint8_t buf[4];
  id v11;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v9 = 66057;
    v5 = objc_retainAutorelease(v3);
    v6 = fsctl((const char *)objc_msgSend(v5, "fileSystemRepresentation"), 0xC0084A44uLL, &v9, 0);
    v7 = os_log_create("com.apple.camera", "CameraMessagesApp");
    v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_10000AEFC((uint64_t)v5, v6, v8);
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Marked file purgeable: %{public}@", buf, 0xCu);
    }

  }
}

+ (void)markFilesPurgeableForAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "providedFullsizeImageURL"));
  objc_msgSend(a1, "markFilePurgeableAtURL:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "providedFullsizeRenderImageURL"));
  objc_msgSend(a1, "markFilePurgeableAtURL:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "providedVideoURL"));
  objc_msgSend(a1, "markFilePurgeableAtURL:", v7);

  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "providedFullsizeRenderVideoURL"));
  objc_msgSend(a1, "markFilePurgeableAtURL:", v8);

}

@end
