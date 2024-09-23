@implementation AEFileAssetPackageGenerator

+ (id)generateAssetFromFileURLs:(id)a3 previewImage:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  AEMutableAssetPackage *v11;
  __CFString *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  NSObject *v30;
  int v31;
  NSObject *v32;
  _BOOL4 v33;
  id v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  __CFString *v38;
  void *v39;
  int v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  __CFString *v50;
  const __CFString *v52;
  void *v53;
  unsigned int v54;
  CMTime time;
  id v56;
  id v57;
  id v58;
  uint8_t buf[4];
  const __CFString *v60;
  __int16 v61;
  __CFString *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  const __CFString *v66;
  uint64_t v67;
  CGSize v68;
  CGSize v69;

  v67 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (!objc_msgSend(v7, "count"))
  {
    if (a5)
    {
      v9 = (void *)MEMORY[0x24BDD1540];
      v10 = 0;
      goto LABEL_7;
    }
LABEL_13:
    v11 = 0;
    goto LABEL_48;
  }
  if ((unint64_t)objc_msgSend(v7, "count") < 3)
  {
    v57 = 0;
    v58 = 0;
    v56 = 0;
    +[AEFileAssetPackageGenerator generateMetadataFromFileURLs:fileURL:videoComplementURL:metadata:](AEFileAssetPackageGenerator, "generateMetadataFromFileURLs:fileURL:videoComplementURL:metadata:", v7, &v58, &v57, &v56);
    v12 = (__CFString *)v58;
    v13 = v57;
    v14 = v56;
    v15 = v14;
    if (!v12 || !v14)
    {
      if (a5)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("AEFileAssetPackageGeneratorErrorDomain"), 2, 0);
        v11 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }
LABEL_47:

      goto LABEL_48;
    }
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v17 = objc_claimAutoreleasedReturnValue();

    v11 = -[AEMutableAssetPackage initWithAssetIdentifier:]([AEMutableAssetPackage alloc], "initWithAssetIdentifier:", v17);
    v18 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v54 = objc_msgSend(v15, "isImage");
    if (v54)
    {
      objc_msgSend((id)*MEMORY[0x24BDF8410], "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[AEMutableAssetPackage storeURL:forType:](v11, "storeURL:forType:", v12, v19);

      if (!v13)
      {
        v54 = 0;
LABEL_18:
        objc_msgSend(v15, "orientedPixelSize");
        v23 = v22;
        v25 = v24;
        objc_msgSend(v8, "size");
        v28 = v26;
        v29 = v27;
        v53 = (void *)v17;
        if (v8 && v23 == v26 && v25 == v27)
        {
          PLAssetExplorerGetLog();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21E23A000, v30, OS_LOG_TYPE_DEFAULT, "Using preview image from preview.", buf, 2u);
          }

          -[AEMutableAssetPackage setSidecarObject:forKey:](v11, "setSidecarObject:forKey:", v8, CFSTR("com.apple.assetexplorer.asset-preview-image"));
        }
        else
        {
          v31 = objc_msgSend(v15, "isImage");
          PLAssetExplorerGetLog();
          v32 = objc_claimAutoreleasedReturnValue();
          v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
          if (v31)
          {
            if (v33)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21E23A000, v32, OS_LOG_TYPE_DEFAULT, "Generating preview image.", buf, 2u);
            }

            v34 = objc_alloc(MEMORY[0x24BEBD640]);
            -[__CFString path](v12, "path");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = (void *)objc_msgSend(v34, "initWithContentsOfFile:", v35);

            -[AEMutableAssetPackage setSidecarObject:forKey:](v11, "setSidecarObject:forKey:", v36, CFSTR("com.apple.assetexplorer.asset-preview-image"));
          }
          else
          {
            if (v33)
            {
              v37 = CFSTR("not nil");
              if (!v8)
                v37 = CFSTR("nil");
              v52 = v37;
              v68.width = v23;
              v68.height = v25;
              NSStringFromCGSize(v68);
              v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v69.width = v28;
              v69.height = v29;
              NSStringFromCGSize(v69);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = objc_msgSend(v15, "isImage");
              v41 = CFSTR("NO");
              *(_DWORD *)buf = 138413058;
              v60 = v52;
              v61 = 2112;
              if (v40)
                v41 = CFSTR("YES");
              v62 = v38;
              v63 = 2112;
              v64 = v39;
              v65 = 2112;
              v66 = v41;
              _os_log_impl(&dword_21E23A000, v32, OS_LOG_TYPE_DEFAULT, "Not generating preview. previewImage = %@, size = %@, previewImage.size = %@, isImage = %@", buf, 0x2Au);

            }
          }
        }
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v23);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setValue:forKey:", v42, CFSTR("AEAssetPackageDisplayPixelWidth"));

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v25);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setValue:forKey:", v43, CFSTR("AEAssetPackageDisplayPixelHeight"));

        objc_msgSend(v15, "creationDate");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setValue:forKey:", v44, CFSTR("AEAssetPackageDisplayCreationDate"));

        if (objc_msgSend(v15, "isImage"))
          v45 = 1;
        else
          v45 = 2;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setValue:forKey:", v46, CFSTR("AEAssetPackageDisplayMediaType"));

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", +[AEFileAssetPackageGenerator playbackStyleFromMetadata:isLivePhoto:](AEFileAssetPackageGenerator, "playbackStyleFromMetadata:isLivePhoto:", v15, v54));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setValue:forKey:", v47, CFSTR("AEAssetPackageDisplayPlaybackStyle"));

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", +[AEFileAssetPackageGenerator mediaSubtypeFromMetadata:](AEFileAssetPackageGenerator, "mediaSubtypeFromMetadata:", v15));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setValue:forKey:", v48, CFSTR("AEAssetPackageDisplayMediaSubtypes"));

        -[AEMutableAssetPackage addSidecarEntriesFromDictionary:](v11, "addSidecarEntriesFromDictionary:", v18);
        PLAssetExplorerGetLog();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          if (v13)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" and video complement url %@"), v13);
            v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v50 = &stru_24E23C028;
          }
          *(_DWORD *)buf = 138412546;
          v60 = v12;
          v61 = 2112;
          v62 = v50;
          _os_log_impl(&dword_21E23A000, v49, OS_LOG_TYPE_DEFAULT, "Package generated from file url %@%@", buf, 0x16u);
          if (v13)

        }
        goto LABEL_47;
      }
      objc_msgSend((id)*MEMORY[0x24BDF84B8], "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[AEMutableAssetPackage storeURL:forType:](v11, "storeURL:forType:", v13, v20);
    }
    else
    {
      objc_msgSend((id)*MEMORY[0x24BDF84B8], "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[AEMutableAssetPackage storeURL:forType:](v11, "storeURL:forType:", v12, v21);

      objc_msgSend(v15, "duration");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CMTimeGetSeconds(&time));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setValue:forKey:", v20, CFSTR("AEAssetPackageDisplayDuration"));
    }

    goto LABEL_18;
  }
  if (!a5)
    goto LABEL_13;
  v9 = (void *)MEMORY[0x24BDD1540];
  v10 = 1;
LABEL_7:
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("AEFileAssetPackageGeneratorErrorDomain"), v10, 0);
  v11 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_48:

  return v11;
}

+ (void)generateMetadataFromFileURLs:(id)a3 fileURL:(id *)a4 videoComplementURL:(id *)a5 metadata:(id *)a6
{
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v16 = a3;
  v9 = objc_alloc(MEMORY[0x24BE72400]);
  objc_msgSend(v16, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithMediaURL:options:timeZoneLookup:shouldCache:", v10, 13, 0, 1);

  if (objc_msgSend(v16, "count") != 2
    || (v12 = objc_alloc(MEMORY[0x24BE72400]),
        objc_msgSend(v16, "lastObject"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = (void *)objc_msgSend(v12, "initWithMediaURL:options:timeZoneLookup:shouldCache:", v13, 13, 0, 1),
        v13,
        !v14))
  {
    objc_msgSend(v16, "firstObject");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    *a5 = 0;
    v15 = objc_retainAutorelease(v11);
    v14 = 0;
    goto LABEL_7;
  }
  if (objc_msgSend(v11, "isImage") && objc_msgSend(v14, "isMovie"))
  {
    objc_msgSend(v16, "firstObject");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lastObject");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_retainAutorelease(v11);
LABEL_7:
    *a6 = v15;
    goto LABEL_8;
  }
  if (objc_msgSend(v11, "isMovie") && objc_msgSend(v14, "isImage"))
  {
    objc_msgSend(v16, "lastObject");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_retainAutorelease(v14);
    v14 = v15;
    goto LABEL_7;
  }
LABEL_8:

}

+ (unint64_t)mediaSubtypeFromMetadata:(id)a3
{
  if (objc_msgSend(a3, "isSpatialMedia"))
    return 1024;
  else
    return 0;
}

+ (int64_t)playbackStyleFromMetadata:(id)a3 isLivePhoto:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  int v6;
  uint64_t v7;
  int64_t v8;

  v4 = a4;
  v5 = a3;
  if (objc_msgSend(v5, "isImage"))
  {
    v6 = objc_msgSend(v5, "isAnimatedImage");
    v7 = 3;
    if (!v4)
      v7 = 1;
    if (v6)
      v8 = 2;
    else
      v8 = v7;
  }
  else if (objc_msgSend(v5, "isMovie"))
  {
    if (objc_msgSend(v5, "isAutoloop"))
      v8 = 5;
    else
      v8 = 4;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)videoComplementFromFileURL:(id)a3 metadata:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  __int128 v12;
  uint64_t v13;

  v5 = a3;
  objc_msgSend(a4, "livePhotoPairingIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[AEFileAssetPackageGenerator calculateLivePhotoVideoPath:](AEFileAssetPackageGenerator, "calculateLivePhotoVideoPath:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = objc_alloc(MEMORY[0x24BE72478]);
      objc_msgSend(v5, "path");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *MEMORY[0x24BDC0D40];
      v13 = *(_QWORD *)(MEMORY[0x24BDC0D40] + 16);
      v10 = (void *)objc_msgSend(v8, "initWithPathToVideo:pathToImage:imageDisplayTime:pairingIdentifier:", v7, v9, &v12, 0);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
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

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fileExistsAtPath:", v5);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(v5, "stringByDeletingPathExtension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingPathExtension:", CFSTR("mov"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
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

@end
