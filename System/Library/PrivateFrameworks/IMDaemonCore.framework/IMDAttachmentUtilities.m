@implementation IMDAttachmentUtilities

+ (unint64_t)freeSpaceInHomeDirectory
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSHomeDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributesOfFileSystemForPath:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CB2B00]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "longLongValue");

  return v6;
}

+ (id)messageAttachmentSendableUTIs
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resourcePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "messageAttachmentSendableUTIsForResourcePath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)messageAttachmentSendableUTIsForResourcePath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v11;
  void *v12;

  v3 = a3;
  if (_IMWillLog())
  {
    v11 = v3;
    _IMAlwaysLog();
  }
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("MessageSendableUTIs"), v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathExtension:", CFSTR("plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (_IMWillLog())
  {
    v12 = v5;
    _IMAlwaysLog();
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fileExistsAtPath:", v5);

  if (_IMWillLog())
    _IMAlwaysLog();
  if (!v7)
    goto LABEL_14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (_IMWillLog())
    _IMAlwaysLog();
  if (v8)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("MessageSendableUTIs"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (_IMWillLog())
      _IMAlwaysLog();

  }
  else
  {
LABEL_14:
    v9 = 0;
  }

  return v9;
}

+ (id)fetchSizeLimitsForTransfer:(id)a3 mode:(unint64_t)a4
{
  return (id)MEMORY[0x1E0DE7D20](a1, sel__fetchSizeLimitsForTransfer_mode_);
}

+ (id)fetchSizeLimitsForTransfer:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](a1, sel__fetchSizeLimitsForTransfer_mode_);
}

+ (id)_fetchSizeLimitsForTransfer:(id)a3 mode:(unint64_t)a4
{
  id v6;
  unint64_t v7;
  char v8;
  const __CFString *v9;
  const __CFString *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void **v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  void *v29;
  void *v30;
  _QWORD v31[2];
  void *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v27 = 0;
  v28 = 0;
  objc_msgSend(a1, "_fetchStandardSizeLimit:highQualitySizeLimit:forTransfer:", &v28, &v27, v6);
  v7 = v28;
  v8 = objc_msgSend(v6, "isAuxVideo");
  v9 = (const __CFString *)objc_msgSend(v6, "type");
  v10 = (const __CFString *)*MEMORY[0x1E0CA5B90];
  if (UTTypeConformsTo(v9, (CFStringRef)*MEMORY[0x1E0CA5B90]))
  {
    if ((v8 & 1) == 0)
    {
      v11 = objc_msgSend(a1, "tinyImageQualitySizeLimit");
      if (v11 < v28)
        v7 = v11;
    }
  }
  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("ck-imessage-always-send-LQM-for-standard-size_overwrite"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  if (UTTypeConformsTo((CFStringRef)objc_msgSend(v6, "type"), v10))
  {
    if ((v14 & 1) == 0)
    {
      v28 = objc_msgSend(a1, "_smallerImageFileSize");
      if (_IMWillLog())
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v28);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        _IMAlwaysLog();

      }
    }
  }
  if (objc_msgSend(a1, "shouldEnablePreviewTranscodingQualityForTransfer:isSending:", v6, 1, v24))
  {
    if (_IMWillLog())
    {
      objc_msgSend(v6, "guid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "tinyImageQualitySizeLimit"));
      v25 = v15;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      _IMAlwaysLog();

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "tinyImageQualitySizeLimit", v25, v26));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_27;
  }
  if (a4 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v27);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v18;
    v19 = (void *)MEMORY[0x1E0C99D20];
    v20 = &v29;
  }
  else if (a4 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v18;
    v19 = (void *)MEMORY[0x1E0C99D20];
    v20 = &v30;
  }
  else
  {
    if (a4)
    {
      v21 = 0;
      goto LABEL_23;
    }
    if (!objc_msgSend(a1, "shouldSendLowResolutionOnly"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v28);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v18;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v27);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v31[1] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_21;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v18;
    v19 = (void *)MEMORY[0x1E0C99D20];
    v20 = &v32;
  }
  objc_msgSend(v19, "arrayWithObjects:count:", v20, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:

LABEL_23:
  if (_IMWillLog())
  {
    v25 = v21;
    _IMAlwaysLog();
  }
  objc_msgSend(v21, "__message_sortedDedupedNonZeroNumberArray", v25);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (_IMWillLog())
    _IMAlwaysLog();
LABEL_27:

  return v17;
}

+ (int64_t)largeFileSizeFor:(id)a3 allowedLargerRepresentation:(BOOL *)a4
{
  id v5;
  void (*v6)(id, int64_t *, uint64_t *, void *, BOOL *);
  void *v7;
  int64_t v8;
  int64_t v10;
  uint64_t v11;

  v5 = a3;
  if (qword_1EFC63CC8 != -1)
    dispatch_once(&qword_1EFC63CC8, &unk_1E9229F00);
  v6 = (void (*)(id, int64_t *, uint64_t *, void *, BOOL *))off_1EFC63CC0;
  if (off_1EFC63CC0)
  {
    v10 = 0;
    v11 = 0;
    objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6(v5, &v10, &v11, v7, a4);

    v8 = v10;
  }
  else
  {
    v8 = IMiMessageMaxFileSizeForUTI();
  }

  return v8;
}

+ (void)maxTransferFileSizeForWifi:(unint64_t *)a3 cell:(unint64_t *)a4
{
  void *v6;
  id v7;

  v6 = (void *)MEMORY[0x1E0D39730];
  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "IMiMessageMaxTransferFileSizeForWifiForPhoneNumber:cellSize:serverConfigurationBag:phoneNumber:simID:", a3, a4, v7, 0, 0);

}

+ (unint64_t)maxTransferAudioFileSizeForWifi:(unint64_t *)a3 cell:(unint64_t *)a4
{
  void *v6;
  void *v7;
  unint64_t v8;

  v6 = (void *)MEMORY[0x1E0D39730];
  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "IMiMessageMaxTransferAudioFileSizeForWifiForPhoneNumber:cellSize:serverConfigurationBag:phoneNumber:simID:", a3, a4, v7, 0, 0);

  return v8;
}

+ (unint64_t)maxTransferVideoFileSizeForWifi:(unint64_t *)a3 cell:(unint64_t *)a4
{
  void *v6;
  void *v7;
  unint64_t v8;

  v6 = (void *)MEMORY[0x1E0D39730];
  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "IMiMessageMaxTransferVideoFileSizeForWifiForPhoneNumber:cellSize:serverConfigurationBag:phoneNumber:simID:", a3, a4, v7, 0, 0);

  return v8;
}

+ (unint64_t)minimumFreeSpace
{
  return 26214400;
}

+ (void)_fileTransferSizeForAuxVideoFromServerBag:(unint64_t *)a3 smallSize:(unint64_t *)a4 serverBag:(id)a5
{
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;

  v7 = a5;
  objc_msgSend(v7, "objectForKey:", CFSTR("att-aux-video-max-file-size"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  objc_msgSend(v7, "objectForKey:", CFSTR("att-aux-video-min-file-size"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "unsignedIntegerValue");
  if (_IMWillLog())
    _IMAlwaysLog();
  v12 = 0x100000;
  if (v11)
    v12 = v11;
  if (a3)
    *a3 = v9;
  if (a4)
    *a4 = v12;
}

+ (void)_fileTransferSizeForAAVideoFromServerBag:(unint64_t *)a3 smallSize:(unint64_t *)a4 serverBag:(id)a5
{
  void *v7;
  unint64_t v8;
  id v9;

  objc_msgSend(a5, "objectForKey:", CFSTR("att-aa-video-max-file-size"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  if (v7)
    v8 = objc_msgSend(v7, "unsignedIntegerValue");
  else
    v8 = 104857600;
  if (_IMWillLog())
    _IMAlwaysLog();
  if (a3)
    *a3 = v8;
  if (a4)
    *a4 = v8;

}

+ (unint64_t)_fileTransferSizeForSpatialImageFromServerBag:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  objc_msgSend(a3, "objectForKey:", CFSTR("att-spatial-image-max-file-size"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v5 = 20971520;
  if (_IMWillLog())
    _IMAlwaysLog();

  return v5;
}

+ (BOOL)shouldAllowHighQualityPhotoUploadForNetworkConditions
{
  void *v2;
  char v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0D36A68], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isWiFiUsable");

  objc_msgSend(MEMORY[0x1E0D36A68], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasLTEDataConnection");

  if (_IMWillLog())
    _IMAlwaysLog();
  return v3 | v5;
}

+ (unint64_t)modernHighQualityPhotoSizeLimit
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("hq-photo-size-limit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v5 = 104857600;
  if (_IMWillLog())
    _IMAlwaysLog();

  return v5;
}

+ (BOOL)commonCapabilitiesSupportHighQualityPhotos:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "objectForKey:", CFSTR("supports-high-quality-photo-file-sizes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 && (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v3, "integerValue") == 1;

  return v4;
}

+ (BOOL)shouldAllowBackwardsCompatibilitySizeOverride
{
  int v2;
  void *v3;
  void *v4;
  void *v5;

  LOBYTE(v2) = 1;
  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("disable-hq-photo-mmcs-reported-size-override"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v2 = objc_msgSend(v4, "BOOLValue") ^ 1;

  return v2;
}

+ (unint64_t)mmcsTargetReportSizeForHighQualityPhotoSize:(unint64_t)a3 commonCapabilities:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  int v10;
  int v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;

  v6 = (void *)MEMORY[0x1E0D34E78];
  v7 = a4;
  objc_msgSend(v6, "sharedInstanceForBagType:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend((id)v9, "isHighQualityPhotosEnabled");

  LOBYTE(v9) = objc_msgSend(a1, "commonCapabilitiesSupportHighQualityPhotos:", v7);
  v11 = objc_msgSend(a1, "shouldAllowBackwardsCompatibilitySizeOverride");
  v12 = objc_msgSend(a1, "modernHighQualityPhotoSizeLimit");
  v13 = a3;
  if ((v9 & 1) == 0)
  {
    v13 = a3;
    if (v10)
    {
      v13 = a3;
      if (v11)
      {
        v13 = a3;
        if (v12 >= a3)
        {
          objc_msgSend(v8, "objectForKey:", CFSTR("hq-photo-mmcs-reported-size-override"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v14)
            v16 = objc_msgSend(v14, "unsignedIntegerValue");
          else
            v16 = 0x100000;
          if (v16 >= a3)
            v13 = a3;
          else
            v13 = v16;

        }
      }
    }
  }
  if (_IMWillLog())
    _IMAlwaysLog();

  return v13;
}

+ (unint64_t)_minSizeForLargeAuxVideo
{
  void *v2;
  void *v3;
  char v4;
  int v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  unint64_t v11;

  objc_msgSend(MEMORY[0x1E0D36A68], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isWiFiEnabled") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D36A68], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isWiFiUsable");

    if ((v4 & 1) != 0)
    {
      v5 = 0;
      v6 = 0;
      goto LABEL_6;
    }
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x1E0D36A68], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v7, "hasLTEDataConnection");

  v6 = 1;
LABEL_6:
  objc_msgSend(MEMORY[0x1E0D36A68], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isWiFiUsable");

  if (_IMWillLog())
    _IMAlwaysLog();
  if (_IMWillLog())
    _IMAlwaysLog();
  if (_IMWillLog())
    _IMAlwaysLog();
  if (_IMWillLog())
    _IMAlwaysLog();
  if (_IMWillLog())
    _IMAlwaysLog();
  v10 = 0x200000;
  if (v5 ^ 1 | v9)
    v10 = 3145728;
  if (v6 ^ 1 | v5 | v9)
    v11 = v10;
  else
    v11 = 0x100000;
  if (_IMWillLog())
    _IMAlwaysLog();
  return v11;
}

+ (unint64_t)_maxAllowedStereoVideoSize
{
  return 104857600;
}

+ (unint64_t)_maxAllowedSpatialImageSize
{
  return 20971520;
}

+ (void)_fetchStandardSizeLimit:(unint64_t *)a3 highQualitySizeLimit:(unint64_t *)a4 forTransfer:(id)a5
{
  id v8;
  void *v9;
  int v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  int IsImage;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  unsigned int v35;
  uint64_t v36;
  void *v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;

  v8 = a5;
  v42 = 0;
  v43 = 0;
  objc_msgSend(v8, "localURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = IMIsAAVideoURL();

  if (!v10)
  {
    if (objc_msgSend(v8, "isAuxVideo"))
    {
      v40 = 0;
      v41 = 0;
      objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_fileTransferSizeForAuxVideoFromServerBag:smallSize:serverBag:", &v41, &v40, v14);

      v16 = v40;
      v15 = v41;
      v42 = v40;
      if (v15 <= objc_msgSend(a1, "_minSizeForLargeAuxVideo"))
        v17 = objc_msgSend(a1, "_minSizeForLargeAuxVideo");
      else
        v17 = v41;
      v43 = v17;
      if (!_IMWillLog())
        goto LABEL_30;
      objc_msgSend(v8, "guid");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v16;
      v39 = v17;
      v37 = v20;
      _IMAlwaysLog();
    }
    else
    {
      objc_msgSend(v8, "type");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      IsImage = IMUTTypeIsImage();

      objc_msgSend(v8, "type");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (IsImage)
      {
        objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isHighQualityPhotosEnabled");

        if (v22)
        {
          objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          IMiMessageSizeLimitsForTransferType();

          if (objc_msgSend(a1, "shouldAllowHighQualityPhotoUploadForNetworkConditions"))
            v43 = objc_msgSend(a1, "modernHighQualityPhotoSizeLimit");
        }
        else
        {
          objc_msgSend(v8, "localURL");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = IMIsSpatialMedia();

          if (v26)
          {
            if (_IMWillLog())
            {
              objc_msgSend(v8, "guid");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              _IMAlwaysLog();

            }
            objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1, v37);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(a1, "_fileTransferSizeForSpatialImageFromServerBag:", v27);

            if (v28 >= objc_msgSend(a1, "_maxAllowedSpatialImageSize"))
              v28 = objc_msgSend(a1, "_maxAllowedSpatialImageSize");
            v42 = v28;
            v43 = v28;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            IMiMessageSizeLimitsForTransferType();

          }
        }
        if (!_IMWillLog())
          goto LABEL_29;
        objc_msgSend(v8, "guid");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v43;
        v39 = v42;
        v37 = v24;
        _IMAlwaysLog();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        IMiMessageSizeLimitsForTransferType();
      }

    }
LABEL_29:

    goto LABEL_30;
  }
  if (_IMWillLog())
  {
    objc_msgSend(v8, "guid");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    _IMAlwaysLog();

  }
  v40 = 0;
  v41 = 0;
  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1, v37);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_fileTransferSizeForAAVideoFromServerBag:smallSize:serverBag:", &v41, &v40, v11);

  v12 = v41;
  if (v12 >= objc_msgSend(a1, "_maxAllowedStereoVideoSize"))
    v13 = objc_msgSend(a1, "_maxAllowedStereoVideoSize");
  else
    v13 = v41;
  v42 = v13;
  v43 = v13;
LABEL_30:
  objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance", v37, v38, v39);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "getValueFromDomain:forKey:", CFSTR("com.apple.imessage"), CFSTR("TranscodeSizeLimitsKB"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31 && objc_msgSend(v31, "count") == 2)
  {
    objc_msgSend(v31, "objectAtIndex:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v33) = objc_msgSend(v32, "unsignedIntValue");

    objc_msgSend(v31, "objectAtIndex:", 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "unsignedIntValue");

    if (v33 <= v35)
      v36 = v35;
    else
      v36 = v33;
    if (v33 >= v35)
      v33 = v35;
    else
      v33 = v33;
    if (_IMWillLog())
      _IMAlwaysLog();
    v42 = v33 << 10;
    v43 = v36 << 10;
  }
  if (a3)
    *a3 = v42;
  if (a4)
    *a4 = v43;

}

+ (unint64_t)_smallerImageFileSize
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("madrid-small-image-size"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  if (v4)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("madrid-small-image-size"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "unsignedIntegerValue");

    if (_IMWillLog())
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _IMAlwaysLog();

    }
  }
  else
  {
    v6 = 512000;
  }

  return v6;
}

+ (BOOL)didLQMSettingChanged
{
  return IMGetCachedDomainBoolForKey();
}

+ (BOOL)isPreviewAttachmentSizeEnabled
{
  void *v4;
  void *v5;
  char v6;

  if (objc_msgSend(MEMORY[0x1E0D39730], "IMReadEnablePreviewTranscodingQualityCarrierValueForPhoneNumber:simID:", 0, 0)&& !objc_msgSend(a1, "didLQMSettingChanged")|| (IMGetCachedDomainBoolForKey() & 1) != 0)
  {
    return 1;
  }
  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("send-preview-image"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

+ (BOOL)shouldEnablePreviewTranscodingQualityForTransfer:(id)a3 isSending:(BOOL)a4
{
  _BOOL8 v4;
  const __CFString *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  id v53;

  v4 = a4;
  v6 = (const __CFString *)objc_msgSend(a3, "type");
  v7 = UTTypeConformsTo(v6, (CFStringRef)*MEMORY[0x1E0CA5B90]);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D36A68], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isWiFiUsable");

    if (v9
      && objc_msgSend(MEMORY[0x1E0D39730], "IMReadDisablePreviewTranscodingQualityOnWiFiCarrierValueForPhoneNumber:simID:", 0, 0))
    {
      v7 = _IMWillLog();
      if (v7)
        goto LABEL_27;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isDynamicLQMDisabledByWRM");

      if (!v11)
        goto LABEL_25;
      v12 = objc_msgSend(a1, "updateAndReturnLQMStateAfterPreviewAttachmentSizeEnabled");
      if (!objc_msgSend(MEMORY[0x1E0D39730], "IMReadDisablePreviewTranscodingQualityOnWRMCarrierValueForPhoneNumber:simID:", 0, 0))goto LABEL_25;
      if (_IMWillLog())
        _IMAlwaysLog();
      v13 = (void *)objc_msgSend(a1, "_doesWRMRecommendDisablingLQM");
      objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isDataConnectionExpensive");

      objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "wrmNetworkPreference");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "intValue");

      if (v12)
      {
        IMLogHandleForCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          sub_1D1669454(v19, v20, v21, v22, v23, v24, v25, v26);

        IMLogHandleForCategory();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          sub_1D16693DC();

        IMLogHandleForCategory();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          sub_1D166936C(v28, v29, v30, v31, v32, v33, v34, v35);

        IMLogHandleForCategory();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          sub_1D16692F4();

        IMLogHandleForCategory();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          sub_1D166927C();

        IMLogHandleForCategory();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          sub_1D1669204();

        v53 = objc_alloc(MEMORY[0x1E0C99D80]);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = *MEMORY[0x1E0D38968];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = *MEMORY[0x1E0D38970];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = *MEMORY[0x1E0D38960];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v18 != 0);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = *MEMORY[0x1E0D38978];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
        v43 = (int)v13;
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = *MEMORY[0x1E0D38950];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v15);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = (void *)objc_msgSend(v53, "initWithObjectsAndKeys:", v52, v51, v50, v49, v39, v40, v41, v42, v13, v44, v45, *MEMORY[0x1E0D38958], 0);

        LODWORD(v13) = v43;
        objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "trackEvent:withDictionary:", *MEMORY[0x1E0D38948], v46);

      }
      if (((v13 ^ 1 | v15) & 1) == 0)
      {
        v7 = _IMWillLog();
        if (v7)
        {
LABEL_27:
          _IMAlwaysLog();
          LOBYTE(v7) = 0;
        }
      }
      else
      {
LABEL_25:
        LOBYTE(v7) = objc_msgSend(a1, "updateAndReturnLQMStateAfterPreviewAttachmentSizeEnabled");
      }
    }
  }
  return v7;
}

+ (unint64_t)tinyImageQualitySizeLimit
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;

  v2 = IMGetCachedDomainIntForKeyWithDefaultValue();
  if (!v2)
  {
    v5 = objc_msgSend(MEMORY[0x1E0D39730], "IMReadAttachmentPreviewTranscodingQualitySizeCarrierValueForPhoneNumber:simID:", 0, 0);
    if (v5)
    {
      v4 = v5;
      if (!_IMWillLog())
        return v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", CFSTR("preview-attachment-photo-size"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v7, "integerValue");

      v8 = _IMWillLog();
      if (v4)
      {
        if (!v8)
          return v4;
      }
      else
      {
        v4 = 358400;
        if (!v8)
          return v4;
      }
    }
    _IMAlwaysLog();
    return v4;
  }
  v3 = v2;
  if (_IMWillLog())
    _IMAlwaysLog();
  return v3 << 10;
}

+ (BOOL)updateAndReturnLQMStateAfterPreviewAttachmentSizeEnabled
{
  int v3;
  char v4;
  void *v6;
  void *v7;
  char v8;

  v3 = objc_msgSend(MEMORY[0x1E0D39730], "IMReadEnablePreviewTranscodingQualityCarrierValueForPhoneNumber:simID:", 0, 0);
  v4 = objc_msgSend(a1, "didLQMSettingChanged");
  if (v3)
  {
    if ((v4 & 1) == 0)
    {
      IMSetDomainBoolForKey();
      return 1;
    }
  }
  else if ((v4 & 1) == 0)
  {
    IMSetDomainBoolForKey();
  }
  if ((IMGetCachedDomainBoolForKey() & 1) != 0)
    return 1;
  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("send-preview-image"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  return v8;
}

+ (BOOL)_doesWRMRecommendDisablingLQM
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  BOOL v10;
  _BOOL4 v12;
  void *v14;
  void *v15;

  if (_IMWillLog())
  {
    objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "wrmNetworkPreference");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "wrmCellScore");
    v14 = v3;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _IMAlwaysLog();

  }
  objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance", v14, v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wrmCellScore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");

  objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "wrmNetworkPreference");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "intValue"))
    v10 = 0;
  else
    v10 = v7 < 3;
  v12 = v10 && v7 > 0;

  if (v12 && _IMWillLog())
    _IMAlwaysLog();
  if (_IMWillLog())
    _IMAlwaysLog();
  return v12;
}

@end
