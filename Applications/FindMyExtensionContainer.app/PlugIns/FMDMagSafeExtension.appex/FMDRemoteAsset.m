@implementation FMDRemoteAsset

- (FMDRemoteAsset)initWithAccessoryType:(id)a3 style:(id)a4 type:(unint64_t)a5
{
  id v8;
  id v9;
  FMDRemoteAsset *v10;
  void *v11;
  uint64_t v12;
  NSString *accessoryType;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)FMDRemoteAsset;
  v10 = -[FMDRemoteAsset init](&v15, "init");
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("MFI4.0v1_%@"), v8));
    v12 = objc_claimAutoreleasedReturnValue(+[FMDExtHelper _computehash:](FMDExtHelper, "_computehash:", v11));
    accessoryType = v10->_accessoryType;
    v10->_accessoryType = (NSString *)v12;

    objc_storeStrong((id *)&v10->_style, a4);
    v10->_assetType = a5;
  }

  return v10;
}

- (id)name
{
  void *v3;
  NSString *v4;
  void *v5;

  switch(-[FMDRemoteAsset assetType](self, "assetType"))
  {
    case 0uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRemoteAsset style](self, "style"));
      v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@/pairing-video__3x.mov"), CFSTR("Wallet1,1"), v3);
      goto LABEL_7;
    case 1uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRemoteAsset style](self, "style"));
      v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@/pairing-video-adjustments__3x.plist"), CFSTR("Wallet1,1"), v3);
      goto LABEL_7;
    case 2uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRemoteAsset style](self, "style"));
      v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@/online-sourcelist__3x.png"), CFSTR("Wallet1,1"), v3);
      goto LABEL_7;
    case 3uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRemoteAsset style](self, "style"));
      v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@/online-nolocation_ipad__3x.png"), CFSTR("Wallet1,1"), v3);
LABEL_7:
      v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (id)assetURL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRemoteAsset name](self, "name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("https://statici.icloud.com/fmipmobile/deviceImages-9.0/Accessory/%@"), v2));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v3));
  return v4;
}

- (id)assetStorageLocation
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRemoteAsset name](self, "name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/var/mobile/Library/Caches/com.apple.icloud.findmydeviced/Assets/%@"), v2));

  return v3;
}

- (void)fetchAssetWithCompletion:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  FMDVideoAssetValidator *v9;
  unsigned int v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  FMDRemoteAssetValidator *v23;
  FMDRemoteAssetMIMETypeProvider *v24;
  FMDRemoteAssetValidator *v25;
  void *v26;
  id v27;
  FMDRemoteAssetValidator *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void **v32;
  uint64_t v33;
  void (*v34)(uint64_t, void *, void *, void *);
  void *v35;
  FMDRemoteAssetValidator *v36;
  id v37;
  id v38;
  id v39;
  void (**v40)(id, void *, _QWORD);
  id v41;
  uint8_t buf[4];
  void *v43;

  v4 = (void (**)(id, void *, _QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRemoteAsset assetStorageLocation](self, "assetStorageLocation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v7 = sub_100007B7C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v43 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FMDRemoteAsset: file location = %@", buf, 0xCu);
  }

  if (objc_msgSend(v6, "fileExistsAtPath:", v5))
  {
    if (-[FMDRemoteAsset assetType](self, "assetType")
      || (v9 = objc_opt_new(FMDVideoAssetValidator),
          v10 = -[FMDVideoAssetValidator isValidVideoAtFilePath:](v9, "isValidVideoAtFilePath:", v5),
          v9,
          v10))
    {
      v4[2](v4, v5, 0);
      goto LABEL_17;
    }
    v11 = sub_100007B7C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "FMDRemoteAsset: Removing invalid cached asset.", buf, 2u);
    }

    v41 = 0;
    objc_msgSend(v6, "removeItemAtPath:error:", v5, &v41);
    v13 = v41;
    if (v13)
    {
      v14 = sub_100007B7C();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_1000170D8((uint64_t)v13, v15, v16, v17, v18, v19, v20, v21);

    }
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRemoteAsset assetURL](self, "assetURL"));
  v23 = [FMDRemoteAssetValidator alloc];
  v24 = objc_opt_new(FMDRemoteAssetMIMETypeProvider);
  v25 = -[FMDRemoteAssetValidator initWithRequestURL:mimeTypeProvider:](v23, "initWithRequestURL:mimeTypeProvider:", v22, v24);

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sharedSession](NSURLSession, "sharedSession"));
  v32 = _NSConcreteStackBlock;
  v33 = 3221225472;
  v34 = sub_10001160C;
  v35 = &unk_1000256D8;
  v36 = v25;
  v40 = v4;
  v37 = v22;
  v38 = v5;
  v39 = v6;
  v27 = v22;
  v28 = v25;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "downloadTaskWithURL:completionHandler:", v27, &v32));

  v30 = sub_100007B7C();
  v31 = objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "FMDRemoteAsset: task resumed", buf, 2u);
  }

  objc_msgSend(v29, "resume", v32, v33, v34, v35);
LABEL_17:

}

- (id)getStoredAssetLocation
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  int v8;
  void *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRemoteAsset assetStorageLocation](self, "assetStorageLocation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = sub_100007B7C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMDRemoteAsset: file location = %@", (uint8_t *)&v8, 0xCu);
  }

  if (objc_msgSend(v3, "fileExistsAtPath:", v2))
    v6 = v2;
  else
    v6 = 0;

  return v6;
}

- (NSString)accessoryType
{
  return self->_accessoryType;
}

- (void)setAccessoryType:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryType, a3);
}

- (NSString)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
  objc_storeStrong((id *)&self->_style, a3);
}

- (unint64_t)assetType
{
  return self->_assetType;
}

- (void)setAssetType:(unint64_t)a3
{
  self->_assetType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_accessoryType, 0);
}

@end
