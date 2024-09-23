@implementation QLLivePhotoItemTransformer

+ (id)allowedOutputClasses
{
  double v2;
  void *v3;

  v3 = (void *)MEMORY[0x24BDBCF20];
  gotLoadHelper_x8__OBJC_CLASS___PHLivePhoto(v2);
  return (id)objc_msgSend(v3, "setWithObjects:", objc_opt_class(), 0);
}

- (id)transformedContentsFromURL:(id)a3 context:(id)a4 error:(id *)a5
{
  id v6;
  double v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject **v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  id *v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v32;
  uint64_t v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;
  _QWORD v38[2];
  _QWORD v39[3];

  v39[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  gotLoadHelper_x8__OBJC_CLASS___PFVideoComplement(v7);
  v9 = (void *)objc_msgSend(objc_alloc(*(Class *)(v8 + 1144)), "initWithBundleAtURL:", v6);
  objc_msgSend(v9, "imagePath");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (NSObject **)MEMORY[0x24BE7BF48];
  if (v10
    && (v12 = (void *)v10,
        objc_msgSend(v9, "videoPath"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        v12,
        v13))
  {
    v14 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v9, "imagePath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fileURLWithPath:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v9, "videoPath");
    v18 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "fileURLWithPath:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    gotLoadHelper_x24__OBJC_CLASS___PHLivePhoto(v20);
    if ((objc_opt_respondsToSelector() & 1) != 0 && _os_feature_enabled_impl())
    {
      v21 = (void *)v18[181];
      v39[0] = v16;
      v39[1] = v19;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0;
      v23 = (id *)&v33;
      objc_msgSend(v21, "livePhotoWithResourceFileURLs:prefersHDR:error:", v22, 1, &v33);
      v24 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = (void *)v18[181];
      v38[0] = v16;
      v38[1] = v19;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0;
      v23 = (id *)&v32;
      objc_msgSend(v30, "livePhotoWithResourceFileURLs:error:", v22, &v32);
      v24 = objc_claimAutoreleasedReturnValue();
    }
    v27 = (id)v24;
    v26 = *v23;

    if (!v26 && v27)
    {
      v27 = v27;
      v26 = 0;
      v29 = v27;
      goto LABEL_22;
    }
  }
  else
  {
    v25 = *v11;
    if (!*v11)
    {
      QLSInitLogging();
      v25 = *v11;
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v6;
      _os_log_impl(&dword_20D4F5000, v25, OS_LOG_TYPE_INFO, "Could not generate a PFVideoComplement from the given url: %@ #PreviewItem", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.quicklook.QLLivePhotoItemTransformer"), 0, 0);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v27 = 0;
    v19 = 0;
  }
  v28 = *v11;
  if (!*v11)
  {
    QLSInitLogging();
    v28 = *v11;
  }
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v35 = v6;
    v36 = 2112;
    v37 = v26;
    _os_log_impl(&dword_20D4F5000, v28, OS_LOG_TYPE_ERROR, "Error creating PHLivePhoto for url(%@) error (%@) #PreviewItem", buf, 0x16u);
  }
  if (a5)
  {
    v26 = objc_retainAutorelease(v26);
    v29 = 0;
    *a5 = v26;
  }
  else
  {
    v29 = 0;
  }
LABEL_22:

  return v29;
}

@end
