@implementation CPSAppClipRecord(ClipUIServicesExtras)

- (void)getApplicationIconForImageDescriptor:()ClipUIServicesExtras resultHandler:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "debug_fullApplicationIcon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v9 = objc_alloc(MEMORY[0x1E0D3A820]);
    v10 = objc_alloc(MEMORY[0x1E0D3A810]);
    v11 = objc_retainAutorelease(v8);
    v12 = objc_msgSend(v11, "CGImage");
    objc_msgSend(v11, "scale");
    v13 = (void *)objc_msgSend(v10, "initWithCGImage:scale:", v12);
    v19[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v9, "initWithImages:", v14);

    objc_msgSend(v15, "imageForImageDescriptor:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    sendResult(v16, v7);

  }
  else
  {
    v17 = (void *)objc_opt_class();
    objc_msgSend(a1, "bundleID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "getApplicationIconForBundleIdentifier:imageDescriptor:resultHandler:", v18, v6, v7);

  }
}

+ (void)getApplicationIconForBundleIdentifier:()ClipUIServicesExtras imageDescriptor:resultHandler:
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  char v15;
  _QWORD v16[4];
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v7, "length");
  if (v10)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A820]), "initWithBundleIdentifier:", v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D3A820], "genericApplicationIcon");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  objc_msgSend(v11, "imageForImageDescriptor:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  sendResult(v13, v9);
  v14 = objc_msgSend(v13, "placeholder");
  if (v10)
    v15 = v14;
  else
    v15 = 0;
  if ((v15 & 1) != 0)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __110__CPSAppClipRecord_ClipUIServicesExtras__getApplicationIconForBundleIdentifier_imageDescriptor_resultHandler___block_invoke;
    v16[3] = &unk_1E8E8AE10;
    v17 = v9;
    objc_msgSend(v12, "getImageForImageDescriptor:completion:", v8, v16);

  }
}

@end
