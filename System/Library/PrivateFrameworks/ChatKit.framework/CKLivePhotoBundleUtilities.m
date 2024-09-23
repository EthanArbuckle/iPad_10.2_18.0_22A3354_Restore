@implementation CKLivePhotoBundleUtilities

+ (id)getLivePhotoBundleURL:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  uint64_t v15;

  v4 = a3;
  v5 = objc_msgSend(a1, "isLivePhotoAtURL:", v4);
  v6 = 0;
  if (v4 && v5)
  {
    objc_msgSend(a1, "calculateLivePhotoVideoPath:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "attachmentPreviewFileURL:extension:", v4, *MEMORY[0x1E0D75A78]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(a1, "fileExistsAtPath:", v6) & 1) == 0)
    {
      v8 = objc_alloc(MEMORY[0x1E0D75318]);
      objc_msgSend(v4, "path");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = MEMORY[0x193FF3C24]("kCMTimeInvalid", CFSTR("CoreMedia"));
      v11 = *(_QWORD *)(v10 + 16);
      v14 = *(_OWORD *)v10;
      v15 = v11;
      v12 = (void *)objc_msgSend(v8, "initWithPathToVideo:pathToImage:imageDisplayTime:pairingIdentifier:", v7, v9, &v14, 0);

      objc_msgSend(a1, "writeToBundle:atURL:", v12, v6);
    }

  }
  return v6;
}

+ (BOOL)isLivePhotoAtURL:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a1, "calculateLivePhotoVideoPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (id)calculateLivePhotoVideoPath:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(a3, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByDeletingPathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathExtension:", CFSTR("MOV"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fileExistsAtPath:", v5);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(v5, "stringByDeletingPathExtension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingPathExtension:", CFSTR("mov"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v10, "fileExistsAtPath:", v9);

    if (!(_DWORD)v8)
    {
      v11 = 0;
      goto LABEL_6;
    }
    v5 = v9;
  }
  v11 = v5;
  v9 = v11;
LABEL_6:

  return v11;
}

+ (id)attachmentPreviewFileURL:(id)a3 extension:(id)a4
{
  return (id)IMAttachmentPreviewFileURL();
}

+ (BOOL)fileExistsAtPath:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "fileExistsAtPath:", v6);
  return (char)v4;
}

+ (BOOL)writeToBundle:(id)a3 atURL:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  id v11;

  v5 = a3;
  v6 = a4;
  if (v5 && (v11 = 0, objc_msgSend(v5, "writeToBundleAtURL:error:", v6, &v11), (v7 = v11) != 0))
  {
    v8 = v7;
    _IMWarn();

    v9 = 0;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

@end
