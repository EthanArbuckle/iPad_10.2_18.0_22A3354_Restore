@implementation PHPTPAsset

- (id)_resourceFilenameForFilename:(id)a3 assetResource:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint32_t v20;
  const __CFString *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "privateFileURL");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject pathExtension](v8, "pathExtension");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8)
    {
      if (v9)
      {
        v11 = objc_msgSend(v7, "type");
        if (v11 > 107)
        {
          switch(v11)
          {
            case 'q':
              v22 = CFSTR("DBG");
              goto LABEL_36;
            case 'n':
              v22 = CFSTR("DAT");
              goto LABEL_36;
            case 'l':
              goto LABEL_7;
          }
        }
        else if ((unint64_t)v11 <= 0x14)
        {
          if (((1 << v11) & 0x31F7E) != 0)
          {
LABEL_7:
            objc_msgSend(v10, "uppercaseString");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "_pl_stringByReplacingPathExtension:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_22:
            goto LABEL_23;
          }
          if (((1 << v11) & 0x18E000) != 0)
          {
            PLPTPGetLog();
            v16 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
              goto LABEL_21;
            v23 = 134217984;
            v24 = objc_msgSend(v7, "type");
            v17 = "Unexpected resource type %ld";
            v18 = v16;
            v19 = OS_LOG_TYPE_INFO;
            goto LABEL_27;
          }
          if (v11 == 7)
          {
            v22 = CFSTR("AAE");
LABEL_36:
            objc_msgSend(v5, "_pl_stringByReplacingPathExtension:", v22);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_22;
          }
        }
        PLPTPGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          goto LABEL_21;
        v23 = 134217984;
        v24 = objc_msgSend(v7, "type");
        v17 = "Unhandled resource type (%lu)";
        v18 = v16;
        v19 = OS_LOG_TYPE_FAULT;
LABEL_27:
        v20 = 12;
        goto LABEL_20;
      }
      PLPTPGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v23) = 0;
        v17 = "Unexpected nil extension";
        goto LABEL_16;
      }
    }
    else
    {
      v14 = objc_msgSend(v7, "isLocallyAvailable");
      PLPTPGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v14)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          LOWORD(v23) = 0;
          v17 = "Unexpected nil privateFileURL";
LABEL_16:
          v18 = v16;
          v19 = OS_LOG_TYPE_FAULT;
LABEL_19:
          v20 = 2;
LABEL_20:
          _os_log_impl(&dword_1991EC000, v18, v19, v17, (uint8_t *)&v23, v20);
        }
      }
      else if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        LOWORD(v23) = 0;
        v17 = "Resource has been pruned, ignoring";
        v18 = v16;
        v19 = OS_LOG_TYPE_INFO;
        goto LABEL_19;
      }
    }
LABEL_21:

    v13 = 0;
    goto LABEL_22;
  }
  PLPTPGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    LOWORD(v23) = 0;
    _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_FAULT, "Unexpected nil assetResource", (uint8_t *)&v23, 2u);
  }
  v13 = 0;
LABEL_23:

  return v13;
}

- (PHPTPAsset)initWithPhotosAsset:(id)a3 photosResource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PHPTPAsset *v9;
  uint64_t v10;
  NSURL *url;
  void *v12;
  uint64_t v13;
  NSString *fingerprint;
  void *v15;
  uint64_t v16;
  NSString *originatingAssetID;
  void *v18;
  void *v19;
  uint64_t v20;
  UTType *contentType;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSString *dcfFilename;
  void *v33;
  uint64_t v34;
  NSString *fileSystemFilename;
  void *v36;
  uint64_t v37;
  NSString *capturedFilename;
  PHPTPAsset *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  double v43;
  double v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  NSNumber *objectCompressedSize;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSNumber *thumbCompressedSize;
  void *v55;
  void *v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSNumber *thumbOffset;
  void *v61;
  void *v62;
  CGFloat v63;
  void *v64;
  void *v65;
  unint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  NSString *burstUUID;
  void *v71;
  void *v72;
  void *v73;
  NSNumber *v74;
  CGFloat v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  NSString *durationString;
  void *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  NSString *locationString;
  void *v92;
  void *v93;
  uint64_t v94;
  NSString *groupUUID;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  unsigned int v103;
  void *v104;
  uint64_t v105;
  void *v107;
  void *v108;
  void *v109;
  PHPTPAsset *v110;
  void *v111;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "privateFileURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PHPTPAsset initWithPhotosAsset:url:resourceType:orientation:](self, "initWithPhotosAsset:url:resourceType:orientation:", v6, v8, objc_msgSend(v7, "type"), objc_msgSend(v7, "orientation"));

  if (v9)
  {
    objc_msgSend(v7, "privateFileURL");
    v10 = objc_claimAutoreleasedReturnValue();
    url = v9->_url;
    v9->_url = (NSURL *)v10;

    if (v9->_url)
    {
      objc_msgSend(v6, "ptpProperties");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "fingerprint");
      v13 = objc_claimAutoreleasedReturnValue();
      fingerprint = v9->_fingerprint;
      v9->_fingerprint = (NSString *)v13;

      objc_msgSend(v6, "ptpProperties");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "originatingAssetIdentifier");
      v16 = objc_claimAutoreleasedReturnValue();
      originatingAssetID = v9->_originatingAssetID;
      v9->_originatingAssetID = (NSString *)v16;

      v18 = (void *)MEMORY[0x1E0D752F0];
      objc_msgSend(v7, "uniformTypeIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "typeWithIdentifier:", v19);
      v20 = objc_claimAutoreleasedReturnValue();
      contentType = v9->_contentType;
      v9->_contentType = (UTType *)v20;

      objc_msgSend(v6, "ptpProperties");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "originalFilename");
      v23 = v7;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (!v24)
      {
        objc_msgSend(v6, "ptpProperties");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "filename");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v111 = v6;
      objc_msgSend(v6, "ptpProperties");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "dateCreated");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v23, "fileSize");
      -[PHPTPAssetHandle auxiliaryResourceFilenameMarker](v9->_resourceHandle, "auxiliaryResourceFilenameMarker");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHDCFUtilities dcfCompliantFileNameForFileName:createDate:fileSize:filenameMarker:](PHDCFUtilities, "dcfCompliantFileNameForFileName:createDate:fileSize:filenameMarker:", v25, v27, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v24)
      {

      }
      -[PHPTPAsset _resourceFilenameForFilename:assetResource:](v9, "_resourceFilenameForFilename:assetResource:", v30, v23);
      v31 = objc_claimAutoreleasedReturnValue();
      dcfFilename = v9->_dcfFilename;
      v9->_dcfFilename = (NSString *)v31;

      v7 = v23;
      v6 = v111;
      if (v9->_dcfFilename)
      {
        -[PHPTPAsset url](v9, "url");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "lastPathComponent");
        v34 = objc_claimAutoreleasedReturnValue();
        fileSystemFilename = v9->_fileSystemFilename;
        v9->_fileSystemFilename = (NSString *)v34;

        if (-[PHPTPAsset isPrimary](v9, "isPrimary"))
        {
          objc_msgSend(v23, "originalFilename");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[PHPTPAsset _resourceFilenameForFilename:assetResource:](v9, "_resourceFilenameForFilename:assetResource:", v36, v23);
          v37 = objc_claimAutoreleasedReturnValue();
          capturedFilename = v9->_capturedFilename;
          v9->_capturedFilename = (NSString *)v37;

        }
        else
        {
          v36 = v9->_capturedFilename;
          v9->_capturedFilename = 0;
        }

        objc_msgSend(v111, "ptpProperties");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "dateCreated");
        v41 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v111, "ptpProperties");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "timeZoneOffset");
        v44 = v43;

        objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", (uint64_t)v44);
        v45 = objc_claimAutoreleasedReturnValue();
        PFStringFromDateTimeZoneFormat();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong((id *)&v9->_modificationDateString, v46);
        objc_storeStrong((id *)&v9->_captureDateString, v46);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v7, "fileSize"));
        v47 = objc_claimAutoreleasedReturnValue();
        objectCompressedSize = v9->_objectCompressedSize;
        v9->_objectCompressedSize = (NSNumber *)v47;

        v107 = v46;
        if (-[PHPTPAsset isPrimary](v9, "isPrimary"))
        {
          objc_msgSend(v111, "ptpProperties");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "embeddedThumbnailLength");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend(v50, "integerValue");
          if (v51)
            v52 = v51;
          else
            v52 = 0x10000;

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v52);
          v53 = objc_claimAutoreleasedReturnValue();
          thumbCompressedSize = v9->_thumbCompressedSize;
          v9->_thumbCompressedSize = (NSNumber *)v53;

          objc_msgSend(v111, "ptpProperties");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "embeddedThumbnailOffset");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = objc_msgSend(v56, "integerValue");
          if (v57 <= 1)
            v58 = 1;
          else
            v58 = v57;

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v58);
          v59 = objc_claimAutoreleasedReturnValue();
          thumbOffset = v9->_thumbOffset;
          v9->_thumbOffset = (NSNumber *)v59;

          objc_msgSend(v111, "ptpProperties");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "embeddedThumbnailWidth");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = (double)(unint64_t)objc_msgSend(v62, "unsignedIntegerValue");
          objc_msgSend(v111, "ptpProperties");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "embeddedThumbnailHeight");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = objc_msgSend(v65, "unsignedIntegerValue");
          v9->_thumbPixSize.width = v63;
          v9->_thumbPixSize.height = (double)v66;

          v6 = v111;
          objc_msgSend(v111, "ptpProperties");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "burstIdentifier");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = objc_msgSend(v68, "copy");
          burstUUID = v9->_burstUUID;
          v9->_burstUUID = (NSString *)v69;

          objc_msgSend(v111, "ptpProperties");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v9->_burstPicked = objc_msgSend(v71, "isBurstPicked");

          objc_msgSend(v111, "ptpProperties");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v9->_burstFavorite = objc_msgSend(v72, "isBurstFavorite");

          objc_msgSend(v111, "ptpProperties");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v9->_burstFirstPicked = objc_msgSend(v73, "isBurstFirstPicked");
        }
        else
        {
          v74 = v9->_thumbCompressedSize;
          v9->_thumbCompressedSize = (NSNumber *)&unk_1E36548F8;

          v73 = v9->_thumbOffset;
          v9->_thumbOffset = (NSNumber *)&unk_1E3654910;
        }

        v75 = (double)objc_msgSend(v7, "pixelWidth");
        v76 = objc_msgSend(v7, "pixelHeight");
        v9->_imagePixSize.width = v75;
        v9->_imagePixSize.height = (double)v76;
        v9->_desiredOrientation = objc_msgSend(v7, "orientation");
        v108 = (void *)v45;
        v110 = (PHPTPAsset *)v41;
        if (-[PHPTPAsset isPrimary](v9, "isPrimary"))
        {
          objc_msgSend(v6, "ptpProperties");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "originalDuration");
          v78 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v79 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v6, "duration");
          objc_msgSend(v79, "numberWithDouble:");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v78, "stringValue");
        v80 = objc_claimAutoreleasedReturnValue();
        durationString = v9->_durationString;
        v9->_durationString = (NSString *)v80;

        objc_msgSend(v6, "ptpProperties");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "location");
        v83 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v83, "coordinate");
        v85 = v84;
        v87 = v86;
        v88 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v83, "altitude");
        objc_msgSend(v88, "stringWithFormat:", CFSTR("%+f,%+f,%+f"), v85, v87, v89);
        v90 = objc_claimAutoreleasedReturnValue();
        locationString = v9->_locationString;
        v9->_locationString = (NSString *)v90;

        objc_msgSend(v6, "ptpProperties");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "livePhotoPairingIdentifier");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = objc_msgSend(v93, "copy");
        groupUUID = v9->_groupUUID;
        v9->_groupUUID = (NSString *)v94;

        objc_msgSend(v6, "ptpProperties");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v9->_highFrameRateVideo = objc_msgSend(v96, "isHighFrameRateVideo");

        objc_msgSend(v6, "ptpProperties");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v9->_timeLapseVideo = objc_msgSend(v97, "isTimelapseVideo");

        objc_msgSend(v6, "ptpProperties");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        v9->_isPartOfLivePhoto = objc_msgSend(v98, "isLivePhoto");

        objc_msgSend(v6, "ptpProperties");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v9->_isHDR = objc_msgSend(v99, "isHDR");

        objc_msgSend(v6, "ptpProperties");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "codec");
        v101 = (void *)objc_claimAutoreleasedReturnValue();

        v102 = v7;
        if (v101)
          v103 = objc_msgSend(MEMORY[0x1E0D75130], "fourCharCodeFromString:", v101);
        else
          v103 = 0;
        v9->_videoCodec = v103;
        v6 = v111;
        objc_msgSend(v111, "ptpProperties");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        v105 = objc_msgSend(v104, "ptpTrashedState");
        v9->_deleted = (objc_msgSend((id)objc_opt_class(), "ptpTrashedStateForResourceType:", -[PHPTPAssetHandle resourceType](v9->_resourceHandle, "resourceType")) & v105) != 0;

        v7 = v102;
        v39 = v110;
      }
      else
      {
        v39 = v9;
        v9 = 0;
      }

    }
    else
    {
      v30 = v9;
      v9 = 0;
    }

  }
  return v9;
}

- (PHPTPAsset)initWithPhotosAsset:(id)a3 url:(id)a4 resourceType:(int64_t)a5 orientation:(unsigned int)a6
{
  uint64_t v6;
  id v9;
  PHPTPAsset *v10;
  PHPTPAssetHandle *v11;
  void *v12;
  uint64_t v13;
  PHPTPAssetHandle *resourceHandle;
  objc_super v16;

  v6 = *(_QWORD *)&a6;
  v9 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PHPTPAsset;
  v10 = -[PHPTPAsset init](&v16, sel_init);
  if (v10)
  {
    v11 = [PHPTPAssetHandle alloc];
    objc_msgSend(v9, "localIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PHPTPAssetHandle initWithResourceType:orientation:localIdentifier:requiresConversion:](v11, "initWithResourceType:orientation:localIdentifier:requiresConversion:", a5, v6, v12, 0);
    resourceHandle = v10->_resourceHandle;
    v10->_resourceHandle = (PHPTPAssetHandle *)v13;

  }
  return v10;
}

- (PHPTPAsset)initWithPTPAsset:(id)a3
{
  id *v4;
  PHPTPAsset *v5;
  PHPTPAsset *v6;
  uint64_t v7;
  NSString *captureDateString;
  uint64_t v9;
  NSString *modificationDateString;
  uint64_t v11;
  NSString *fingerprint;
  uint64_t v13;
  NSString *originatingAssetID;
  uint64_t v15;
  NSString *capturedFilename;
  uint64_t v17;
  NSString *dcfFilename;
  uint64_t v19;
  NSString *fileSystemFilename;
  uint64_t v21;
  NSNumber *objectCompressedSize;
  uint64_t v23;
  NSString *burstUUID;
  uint64_t v25;
  NSString *durationString;
  uint64_t v27;
  NSString *locationString;
  uint64_t v29;
  NSString *groupUUID;
  objc_super v32;

  v4 = (id *)a3;
  v32.receiver = self;
  v32.super_class = (Class)PHPTPAsset;
  v5 = -[PHPTPAsset init](&v32, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_url, v4[30]);
    objc_storeStrong((id *)&v6->_resourceHandle, v4[26]);
    v7 = objc_msgSend(v4[14], "copy");
    captureDateString = v6->_captureDateString;
    v6->_captureDateString = (NSString *)v7;

    v9 = objc_msgSend(v4[13], "copy");
    modificationDateString = v6->_modificationDateString;
    v6->_modificationDateString = (NSString *)v9;

    v11 = objc_msgSend(v4[4], "copy");
    fingerprint = v6->_fingerprint;
    v6->_fingerprint = (NSString *)v11;

    v13 = objc_msgSend(v4[5], "copy");
    originatingAssetID = v6->_originatingAssetID;
    v6->_originatingAssetID = (NSString *)v13;

    objc_storeStrong((id *)&v6->_contentType, v4[23]);
    v15 = objc_msgSend(v4[29], "copy");
    capturedFilename = v6->_capturedFilename;
    v6->_capturedFilename = (NSString *)v15;

    v17 = objc_msgSend(v4[27], "copy");
    dcfFilename = v6->_dcfFilename;
    v6->_dcfFilename = (NSString *)v17;

    v19 = objc_msgSend(v4[28], "copy");
    fileSystemFilename = v6->_fileSystemFilename;
    v6->_fileSystemFilename = (NSString *)v19;

    objc_storeStrong((id *)&v6->_overflowURL, v4[25]);
    objc_msgSend(v4, "objectCompressedSize");
    v21 = objc_claimAutoreleasedReturnValue();
    objectCompressedSize = v6->_objectCompressedSize;
    v6->_objectCompressedSize = (NSNumber *)v21;

    objc_storeStrong((id *)&v6->_thumbCompressedSize, v4[7]);
    objc_storeStrong((id *)&v6->_thumbOffset, v4[6]);
    v6->_thumbPixSize = (CGSize)*((_OWORD *)v4 + 5);
    v23 = objc_msgSend(v4[18], "copy");
    burstUUID = v6->_burstUUID;
    v6->_burstUUID = (NSString *)v23;

    v6->_burstPicked = *((_BYTE *)v4 + 152);
    v6->_burstFavorite = *((_BYTE *)v4 + 153);
    v6->_burstFirstPicked = *((_BYTE *)v4 + 154);
    v6->_imagePixSize = (CGSize)*((_OWORD *)v4 + 4);
    v6->_desiredOrientation = (int64_t)v4[12];
    v25 = objc_msgSend(v4[15], "copy");
    durationString = v6->_durationString;
    v6->_durationString = (NSString *)v25;

    v27 = objc_msgSend(v4[16], "copy");
    locationString = v6->_locationString;
    v6->_locationString = (NSString *)v27;

    v29 = objc_msgSend(v4[17], "copy");
    groupUUID = v6->_groupUUID;
    v6->_groupUUID = (NSString *)v29;

    v6->_highFrameRateVideo = *((_BYTE *)v4 + 155);
    v6->_timeLapseVideo = *((_BYTE *)v4 + 156);
    v6->_isPartOfLivePhoto = *((_BYTE *)v4 + 248);
    v6->_deleted = *((_BYTE *)v4 + 8);
    v6->_videoCodec = objc_msgSend(v4, "videoCodec");
    objc_storeStrong((id *)&v6->_contentType, v4[23]);
    v6->_isHDR = *((_BYTE *)v4 + 192);
    v6->_conversionGroup = (int64_t)v4[21];
  }

  return v6;
}

- (PHPTPAssetHandle)assetHandle
{
  return self->_resourceHandle;
}

- (NSString)relatedUUID
{
  return -[PHPTPAssetHandle localIdentifier](self->_resourceHandle, "localIdentifier");
}

- (NSString)fullDirectoryPath
{
  void *v2;
  void *v3;
  void *v4;

  -[PHPTPAsset url](self, "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByDeletingLastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)filename
{
  return self->_dcfFilename;
}

- (NSString)originalFilename
{
  return self->_fileSystemFilename;
}

- (NSString)createdFilename
{
  return self->_capturedFilename;
}

- (NSURL)url
{
  return self->_url;
}

- (BOOL)isPrimary
{
  unint64_t v4;
  NSObject *v5;
  int64_t v6;
  void *v9;
  uint8_t buf[4];
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = -[PHPTPAssetHandle resourceType](self->_resourceHandle, "resourceType");
  if (v4 > 0x14)
    goto LABEL_9;
  if (((1 << v4) & 0x31FF8) == 0)
  {
    if (((1 << v4) & 0x18E000) != 0)
    {
      PLPTPGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        v6 = -[PHPTPAssetHandle resourceType](self->_resourceHandle, "resourceType");
        *(_DWORD *)buf = 134217984;
        v11 = v6;
        _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_DEBUG, "Unsupported resource type %ld", buf, 0xCu);
      }

      return 0;
    }
    if (((1 << v4) & 6) != 0)
      return 1;
LABEL_9:
    if (v4 - 108 > 5 || ((1 << (v4 - 108)) & 0x25) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPTPAsset.m"), 309, CFSTR("Unhandled resource type (%lu) in %s"), -[PHPTPAssetHandle resourceType](self->_resourceHandle, "resourceType"), "-[PHPTPAsset isPrimary]");

    }
  }
  return 0;
}

- (BOOL)isPhoto
{
  return +[PHPTPAsset isPhotoType:](PHPTPAsset, "isPhotoType:", -[PHPTPAssetHandle resourceType](self->_resourceHandle, "resourceType"));
}

- (BOOL)isMovie
{
  return +[PHPTPAsset isMovieType:](PHPTPAsset, "isMovieType:", -[PHPTPAssetHandle resourceType](self->_resourceHandle, "resourceType"));
}

- (BOOL)isRender
{
  unint64_t v4;
  NSObject *v5;
  int64_t v6;
  void *v9;
  uint8_t buf[4];
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = -[PHPTPAssetHandle resourceType](self->_resourceHandle, "resourceType");
  if (v4 > 0x14)
    goto LABEL_9;
  if (((1 << v4) & 0x31B9E) == 0)
  {
    if (((1 << v4) & 0x18E000) != 0)
    {
      PLPTPGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        v6 = -[PHPTPAssetHandle resourceType](self->_resourceHandle, "resourceType");
        *(_DWORD *)buf = 134217984;
        v11 = v6;
        _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_DEBUG, "Unsupported resource type %ld", buf, 0xCu);
      }

      return 0;
    }
    if (((1 << v4) & 0x460) != 0)
      return 1;
LABEL_9:
    if (v4 - 108 > 5 || ((1 << (v4 - 108)) & 0x25) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPTPAsset.m"), 422, CFSTR("Unhandled resource type (%lu) in %s"), -[PHPTPAssetHandle resourceType](self->_resourceHandle, "resourceType"), "-[PHPTPAsset isRender]");

    }
  }
  return 0;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[PHPTPAsset initWithPTPAsset:]([PHMutablePTPAsset alloc], "initWithPTPAsset:", self);
}

- (id)description
{
  return -[PHPTPAsset _prettyDescriptionWithIndent:](self, "_prettyDescriptionWithIndent:", 0);
}

- (id)_prettyDescriptionWithIndent:(int64_t)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D716C0], "prettyMultiLineDescriptionBuilderWithObject:indent:", self, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("resourceHandle"), "@", &self->_resourceHandle);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("dcfFilename"), "@", &self->_dcfFilename);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("capturedFilename"), "@", &self->_capturedFilename);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("deleted"), "B", &self->_deleted);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("fileSystemFilename"), "@", &self->_fileSystemFilename);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("fullDirectoryPath"), "@", &self->_fullDirectoryPath);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("objectCompressedSize"), "@", &self->_objectCompressedSize);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("fingerprint"), "@", &self->_fingerprint);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("originatingAssetID"), "@", &self->_originatingAssetID);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("thumbOffset"), "@", &self->_thumbOffset);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("thumbCompressedSize"), "@", &self->_thumbCompressedSize);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("imagePixSize"), "{CGSize=dd}", &self->_imagePixSize);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("thumbPixSize"), "{CGSize=dd}", &self->_thumbPixSize);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("desiredOrientation"), "q", &self->_desiredOrientation);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("modificationDateString"), "@", &self->_modificationDateString);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("captureDateString"), "@", &self->_captureDateString);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("durationString"), "@", &self->_durationString);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("locationString"), "@", &self->_locationString);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("groupUUID"), "@", &self->_groupUUID);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("burstUUID"), "@", &self->_burstUUID);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("burstPicked"), "B", &self->_burstPicked);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("burstFavorite"), "B", &self->_burstFavorite);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("burstFirstPicked"), "B", &self->_burstFirstPicked);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("highFrameRateVideo"), "B", &self->_highFrameRateVideo);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("timeLapseVideo"), "B", &self->_timeLapseVideo);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("relatedUUID"), "@", &self->_relatedUUID);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("conversionGroup"), "q", &self->_conversionGroup);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("videoCodec"), "I", &self->_videoCodec);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("contentType"), "@", &self->_contentType);
  objc_msgSend(v4, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isDeleted
{
  return self->_deleted;
}

- (NSString)fingerprint
{
  return self->_fingerprint;
}

- (NSString)originatingAssetID
{
  return self->_originatingAssetID;
}

- (NSNumber)thumbOffset
{
  return self->_thumbOffset;
}

- (NSNumber)thumbCompressedSize
{
  return self->_thumbCompressedSize;
}

- (CGSize)imagePixSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imagePixSize.width;
  height = self->_imagePixSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)thumbPixSize
{
  double width;
  double height;
  CGSize result;

  width = self->_thumbPixSize.width;
  height = self->_thumbPixSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)desiredOrientation
{
  return self->_desiredOrientation;
}

- (NSString)captureDateString
{
  return self->_captureDateString;
}

- (NSString)modificationDateString
{
  return self->_modificationDateString;
}

- (NSString)durationString
{
  return self->_durationString;
}

- (NSString)locationString
{
  return self->_locationString;
}

- (NSString)groupUUID
{
  return self->_groupUUID;
}

- (NSString)burstUUID
{
  return self->_burstUUID;
}

- (BOOL)isBurstPicked
{
  return self->_burstPicked;
}

- (BOOL)isBurstFavorite
{
  return self->_burstFavorite;
}

- (BOOL)isBurstFirstPicked
{
  return self->_burstFirstPicked;
}

- (BOOL)isHighFrameRateVideo
{
  return self->_highFrameRateVideo;
}

- (BOOL)isTimeLapseVideo
{
  return self->_timeLapseVideo;
}

- (int64_t)conversionGroup
{
  return self->_conversionGroup;
}

- (unsigned)videoCodec
{
  return self->_videoCodec;
}

- (UTType)contentType
{
  return self->_contentType;
}

- (BOOL)isHDR
{
  return self->_isHDR;
}

- (NSNumber)objectCompressedSize
{
  return self->_objectCompressedSize;
}

- (NSString)spatialOverCaptureGroupIdentifier
{
  return self->_spatialOverCaptureGroupIdentifier;
}

- (BOOL)isPartOfLivePhoto
{
  return self->_isPartOfLivePhoto;
}

- (NSURL)overflowURL
{
  return self->_overflowURL;
}

- (PHPTPAssetHandle)resourceHandle
{
  return self->_resourceHandle;
}

- (NSString)dcfFilename
{
  return self->_dcfFilename;
}

- (NSString)fileSystemFilename
{
  return self->_fileSystemFilename;
}

- (NSString)capturedFilename
{
  return self->_capturedFilename;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spatialOverCaptureGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_capturedFilename, 0);
  objc_storeStrong((id *)&self->_fileSystemFilename, 0);
  objc_storeStrong((id *)&self->_dcfFilename, 0);
  objc_storeStrong((id *)&self->_resourceHandle, 0);
  objc_storeStrong((id *)&self->_overflowURL, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_relatedUUID, 0);
  objc_storeStrong((id *)&self->_burstUUID, 0);
  objc_storeStrong((id *)&self->_groupUUID, 0);
  objc_storeStrong((id *)&self->_locationString, 0);
  objc_storeStrong((id *)&self->_durationString, 0);
  objc_storeStrong((id *)&self->_captureDateString, 0);
  objc_storeStrong((id *)&self->_modificationDateString, 0);
  objc_storeStrong((id *)&self->_thumbCompressedSize, 0);
  objc_storeStrong((id *)&self->_thumbOffset, 0);
  objc_storeStrong((id *)&self->_originatingAssetID, 0);
  objc_storeStrong((id *)&self->_fingerprint, 0);
  objc_storeStrong((id *)&self->_objectCompressedSize, 0);
  objc_storeStrong((id *)&self->_fullDirectoryPath, 0);
}

+ (BOOL)isPhotoType:(int64_t)a3
{
  NSObject *v6;
  void *v8;
  uint8_t buf[4];
  int64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)a3 > 0x14)
    goto LABEL_9;
  if (((1 << a3) & 0x31ECC) == 0)
  {
    if (((1 << a3) & 0x18E000) != 0)
    {
      PLPTPGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v10 = a3;
        _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_DEBUG, "Unsupported resource type %ld", buf, 0xCu);
      }

      return 0;
    }
    if (((1 << a3) & 0x132) != 0)
      return 1;
LABEL_9:
    if ((unint64_t)(a3 - 108) > 5 || ((1 << (a3 - 108)) & 0x25) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHPTPAsset.m"), 348, CFSTR("Unhandled resource type (%lu) in %s"), a3, "+[PHPTPAsset isPhotoType:]");

    }
  }
  return 0;
}

+ (BOOL)isMovieType:(int64_t)a3
{
  NSObject *v7;
  void *v8;
  uint8_t buf[4];
  int64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)a3 > 0x14)
    goto LABEL_9;
  if (((1 << a3) & 0x301BA) == 0)
  {
    if (((1 << a3) & 0x1E44) != 0)
      return 1;
    if (((1 << a3) & 0x18E000) != 0)
    {
      PLPTPGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v10 = a3;
        _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_DEBUG, "Unsupported resource type %ld", buf, 0xCu);
      }

      return 0;
    }
LABEL_9:
    if ((unint64_t)(a3 - 108) > 5 || ((1 << (a3 - 108)) & 0x25) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHPTPAsset.m"), 387, CFSTR("Unhandled resource type (%lu) in %s"), a3, "+[PHPTPAsset isMovieType:]");

    }
  }
  return 0;
}

+ (int64_t)ptpTrashedStateForResourceType:(int64_t)a3
{
  int64_t result;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a3 > 107)
  {
    switch(a3)
    {
      case 'l':
        PLPTPGetLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 108);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v12 = (int64_t)v9;
          _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_INFO, "Unexpected request for trashed state of resource type %@", buf, 0xCu);

        }
        break;
      case 'n':
        return 0x10000;
      case 'q':
        return 0x8000;
      default:
LABEL_28:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHPTPAsset.m"), 472, CFSTR("Unhandled resource type (%lu) in %s"), a3, "+[PHPTPAsset ptpTrashedStateForResourceType:]");

        break;
    }
    return 0;
  }
  else
  {
    result = 1;
    switch(a3)
    {
      case 1:
      case 2:
        return result;
      case 3:
        result = 512;
        break;
      case 4:
        result = 2048;
        break;
      case 5:
        result = 4;
        break;
      case 6:
        result = 8;
        break;
      case 7:
        result = 2;
        break;
      case 8:
        result = 128;
        break;
      case 9:
        result = 4096;
        break;
      case 10:
        result = 1024;
        break;
      case 11:
        result = 0x4000;
        break;
      case 12:
        result = 256;
        break;
      case 13:
      case 14:
      case 15:
      case 19:
      case 20:
        PLPTPGetLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          v12 = a3;
          _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_DEBUG, "Unsupported resource type %ld", buf, 0xCu);
        }

        return 0;
      case 16:
        result = 64;
        break;
      case 17:
        result = 0x2000;
        break;
      default:
        goto LABEL_28;
    }
  }
  return result;
}

+ (BOOL)isSupportedResourceType:(int64_t)a3
{
  BOOL result;
  void *v7;

  result = 1;
  if ((unint64_t)a3 <= 0x14)
  {
    if (((1 << a3) & 0x31FFE) != 0)
      return result;
    if (((1 << a3) & 0x18E000) != 0)
      return 0;
  }
  if ((unint64_t)(a3 - 108) > 5 || ((1 << (a3 - 108)) & 0x25) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHPTPAsset.m"), 505, CFSTR("Unhandled resource type (%lu) in %s"), a3, "+[PHPTPAsset isSupportedResourceType:]");

    return 0;
  }
  return result;
}

@end
