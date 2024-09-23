@implementation HMDSnapshotFile

- (HMDSnapshotFile)initWithImageDirectory:(id)a3
{
  id v5;
  HMDSnapshotFile *v6;
  HMDSnapshotFile *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDSnapshotFile;
  v6 = -[HMDSnapshotFile init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_directory, a3);

  return v7;
}

- (HMDSnapshotFile)initWithImageDirectory:(id)a3 snapshotData:(id)a4
{
  id v6;
  id v7;
  HMDSnapshotFile *v8;
  void *v9;
  _BOOL4 v10;
  HMDSnapshotFile *v11;

  v6 = a3;
  v7 = a4;
  v8 = -[HMDSnapshotFile initWithImageDirectory:](self, "initWithImageDirectory:", v6);
  if (!v8
    || (objc_msgSend(MEMORY[0x24BDBCE60], "date"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = -[HMDSnapshotFile prepareParametersWithFilePath:snapshotData:directory:snapshotTimestamp:resize:writeBack:](v8, "prepareParametersWithFilePath:snapshotData:directory:snapshotTimestamp:resize:writeBack:", 0, v7, v6, v9, 1, 1), v9, v11 = 0, v10))
  {
    v11 = v8;
  }

  return v11;
}

- (HMDSnapshotFile)initWithImageDirectory:(id)a3 filePath:(id)a4 snapshotTimestamp:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDSnapshotFile *v11;
  HMDSnapshotFile *v12;
  HMDSnapshotFile *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[HMDSnapshotFile initWithImageDirectory:](self, "initWithImageDirectory:", v8);
  v12 = v11;
  if (!v11
    || (v13 = 0,
        -[HMDSnapshotFile prepareParametersWithFilePath:snapshotData:directory:snapshotTimestamp:resize:writeBack:](v11, "prepareParametersWithFilePath:snapshotData:directory:snapshotTimestamp:resize:writeBack:", v9, 0, v8, v10, 0, 0)))
  {
    v13 = v12;
  }

  return v13;
}

- (HMDSnapshotFile)initWithImageDirectory:(id)a3 externalFilePath:(id)a4 snapshotTimestamp:(id)a5
{
  HMDSnapshotFile *result;

  result = -[HMDSnapshotFile initWithImageDirectory:filePath:snapshotTimestamp:](self, "initWithImageDirectory:filePath:snapshotTimestamp:", a3, a4, a5);
  if (result)
    result->_externalFilePath = 1;
  return result;
}

- (id)copyFileAtPath:(id)a3 snapshotTimestamp:(id)a4
{
  id v6;
  id v7;
  HMDCameraSnapshotData *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = -[HMDCameraSnapshotData initWithSnapshotFile:videoResolution:]([HMDCameraSnapshotData alloc], "initWithSnapshotFile:videoResolution:", v7, 0);

  -[HMDSnapshotFile directory](self, "directory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = -[HMDSnapshotFile prepareParametersWithFilePath:snapshotData:directory:snapshotTimestamp:resize:writeBack:](self, "prepareParametersWithFilePath:snapshotData:directory:snapshotTimestamp:resize:writeBack:", 0, v8, v9, v6, 0, 1);

  v10 = 0;
  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 1035);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  HMDSnapshotFile *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  HMDSnapshotFile *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  void *v24;
  HMDSnapshotFile *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  objc_super v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v32 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating HMDSnapshotFile", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDSnapshotFile slotIdentifier](v4, "slotIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[HMDSnapshotCATransactionHandler sharedHandler](HMDSnapshotCATransactionHandler, "sharedHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSnapshotFile slotIdentifier](v4, "slotIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSnapshotFile filePath](v4, "filePath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deleteSlotWithIdentifier:filePath:", v9, v10);

  }
  if (!-[HMDSnapshotFile externalFilePath](v4, "externalFilePath"))
  {
    -[HMDSnapshotFile filePath](v4, "filePath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSnapshotFile filePath](v4, "filePath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "fileExistsAtPath:", v13);

      if (v14)
      {
        v15 = (void *)MEMORY[0x227676638]();
        v16 = v4;
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDSnapshotFile filePath](v16, "filePath");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v32 = v18;
          v33 = 2112;
          v34 = v19;
          _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Deleting snapshot file at %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v15);
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDSnapshotFile filePath](v16, "filePath");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 0;
        v22 = objc_msgSend(v20, "removeItemAtPath:error:", v21, &v30);
        v23 = v30;

        if ((v22 & 1) == 0)
        {
          v24 = (void *)MEMORY[0x227676638]();
          v25 = v16;
          HMFGetOSLogHandle();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDSnapshotFile filePath](v25, "filePath");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v32 = v27;
            v33 = 2112;
            v34 = v28;
            v35 = 2112;
            v36 = v23;
            _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to delete snapshot file at %@: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v24);
        }

      }
    }
  }
  v29.receiver = v4;
  v29.super_class = (Class)HMDSnapshotFile;
  -[HMDSnapshotFile dealloc](&v29, sel_dealloc);
}

- (void)updateSlotIdentifier
{
  void *v3;
  void *v4;
  id v5;

  +[HMDSnapshotCATransactionHandler sharedHandler](HMDSnapshotCATransactionHandler, "sharedHandler");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDSnapshotFile filePath](self, "filePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createSlotWithFilePath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSnapshotFile setSlotIdentifier:](self, "setSlotIdentifier:", v4);

}

- (void)fillSlot
{
  void *v3;
  HMDSnapshotFile *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  HMDSnapshotFile *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (!-[HMDSnapshotFile isFilled](self, "isFilled"))
  {
    v3 = (void *)MEMORY[0x227676638]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v6;
      v12 = 2112;
      v13 = v4;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Filling snapshot slot for snapshot %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
    +[HMDSnapshotCATransactionHandler sharedHandler](HMDSnapshotCATransactionHandler, "sharedHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSnapshotFile slotIdentifier](v4, "slotIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSnapshotFile filePath](v4, "filePath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fillSlotWithIdentifier:filePath:", v8, v9);

    -[HMDSnapshotFile setFilled:](v4, "setFilled:", 1);
  }
}

- (void)clearSlot
{
  void *v3;
  HMDSnapshotFile *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  HMDSnapshotFile *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v6;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Clearing snapshot slot for snapshot %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  +[HMDSnapshotCATransactionHandler sharedHandler](HMDSnapshotCATransactionHandler, "sharedHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSnapshotFile slotIdentifier](v4, "slotIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clearSlotWithIdentifier:", v8);

  -[HMDSnapshotFile setFilled:](v4, "setFilled:", 0);
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDSnapshotFile filePath](self, "filePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("File Path"), v4);
  v17[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDSnapshotFile slotIdentifier](self, "slotIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Slot"), v7);
  v17[1] = v8;
  v9 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDSnapshotFile snapshotTimestamp](self, "snapshotTimestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Timestamp"), v10);
  v17[2] = v11;
  v12 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDSnapshotFile aspectRatio](self, "aspectRatio");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("Aspect Ratio"), v13);
  v17[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  HMDSnapshotFile *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = (HMDSnapshotFile *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HMDSnapshotFile filePath](self, "filePath");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSnapshotFile filePath](v4, "filePath");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v5 == v6;

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDSnapshotFile filePath](self, "filePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)prepareParametersWithFilePath:(id)a3 snapshotData:(id)a4 directory:(id)a5 snapshotTimestamp:(id)a6 resize:(BOOL)a7 writeBack:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL4 v9;
  double v14;
  HMDCameraSnapshotData *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  double v22;
  HMDCameraSnapshotData *v23;
  const __CFData *v24;
  CGImageSource *v25;
  CGImage *v26;
  CGImage *v27;
  size_t v28;
  size_t Height;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  unint64_t v38;
  void *v39;
  NSObject *v40;
  void *v41;
  __CFData *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  const char *v46;
  CGImageSource *v47;
  CGImageSource *v48;
  CGImage *ImageAtIndex;
  CGImage *v50;
  size_t Width;
  id v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  id v67;
  void *v68;
  double v69;
  HMDCameraSnapshotData *v70;
  id v71;
  double v72;
  void *v73;
  void *v74;
  void *v75;
  NSObject *v76;
  void *v77;
  void *v78;
  HMDCameraSnapshotData *v79;
  id v80;
  double v81;
  void *v82;
  void *v83;
  HMDSnapshotFile *v84;
  NSObject *v85;
  void *v86;
  BOOL v87;
  double v88;
  HMDCameraSnapshotData *v89;
  id v90;
  double v91;
  void *v92;
  void *v93;
  NSObject *v94;
  void *v95;
  CGColorSpaceRef ColorSpace;
  CGColorSpace *v97;
  float v98;
  float v99;
  size_t v100;
  size_t BitsPerComponent;
  size_t BytesPerRow;
  uint32_t AlphaInfo;
  CGContext *v104;
  CGContext *v105;
  CGImage *v106;
  __CFData *v107;
  CGImageDestination *v108;
  CGImageDestination *v109;
  _BOOL4 v110;
  NSObject *v111;
  NSObject *v112;
  CGImageSource *v113;
  void *v114;
  uint64_t v115;
  __CFData *v116;
  void *v117;
  NSObject *v118;
  void *v119;
  CGImage *v120;
  void *v122;
  NSObject *v123;
  void *v124;
  void *v125;
  NSObject *v126;
  void *v127;
  void *v128;
  void *context;
  __CFData *v130;
  CGImage *cf;
  id v132;
  id v133;
  CGImage *image;
  CGImageSource *v135;
  CGImageSource *v136;
  void *v137;
  void *v138;
  HMDCameraSnapshotData *v139;
  HMDCameraSnapshotData *v140;
  id v141;
  id obj;
  HMDSnapshotFile *v143;
  _BOOL4 v144;
  uint8_t buf[4];
  void *v146;
  __int16 v147;
  double v148;
  __int16 v149;
  double v150;
  __int16 v151;
  size_t v152;
  uint64_t v153;
  CGRect v154;

  v8 = a8;
  v9 = a7;
  v153 = *MEMORY[0x24BDAC8D0];
  v14 = COERCE_DOUBLE(a3);
  v15 = (HMDCameraSnapshotData *)a4;
  v16 = a5;
  v17 = a6;
  v18 = v17;
  if (v14 == 0.0)
  {
    v20 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v17, "hmd_snapshotFileName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("%@/%@"), v16, v19);
    v14 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
  }
  else
  {
    v19 = v15;
    v15 = -[HMDCameraSnapshotData initWithSnapshotFile:videoResolution:]([HMDCameraSnapshotData alloc], "initWithSnapshotFile:videoResolution:", *(_QWORD *)&v14, 0);
  }

  -[HMDCameraSnapshotData snapshotData](v15, "snapshotData");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v21, "length"))
  {
    v43 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v146 = v45;
      v147 = 2112;
      v148 = v14;
      v46 = "%{public}@Received file data for file path %@ is empty";
LABEL_67:
      _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_INFO, v46, buf, 0x16u);

    }
LABEL_68:

    objc_autoreleasePoolPop(v43);
    v87 = 0;
    goto LABEL_69;
  }
  obj = a6;
  v143 = self;
  v22 = COERCE_DOUBLE(*(id *)&v14);
  v144 = v8;
  if (!v9)
  {
    v21 = v21;
    v47 = CGImageSourceCreateWithData((CFDataRef)v21, 0);
    if (v47)
    {
      v48 = v47;
      ImageAtIndex = CGImageSourceCreateImageAtIndex(v47, 0, 0);
      if (ImageAtIndex)
      {
        v50 = ImageAtIndex;
        Width = CGImageGetWidth(ImageAtIndex);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)Width / (double)CGImageGetHeight(v50));
        v52 = (id)objc_claimAutoreleasedReturnValue();
        CFRelease(v50);
      }
      else
      {
        v138 = v18;
        v75 = (void *)MEMORY[0x227676638]();
        HMFGetOSLogHandle();
        v76 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v146 = v77;
          v147 = 2112;
          v148 = v22;
          _os_log_impl(&dword_2218F0000, v76, OS_LOG_TYPE_ERROR, "%{public}@Failed to create image for file path %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v75);
        v52 = 0;
        v18 = v138;
      }
      CFRelease(v48);
    }
    else
    {
      v57 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v146 = v59;
        v147 = 2112;
        v148 = v22;
        _os_log_impl(&dword_2218F0000, v58, OS_LOG_TYPE_ERROR, "%{public}@Failed to create image source for file path %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v57);
      v52 = 0;
    }

    if (!v52)
    {
LABEL_65:
      v43 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v146 = v45;
        v147 = 2112;
        v148 = v22;
        v46 = "%{public}@Failed to find aspect ratio for snapshot file %@";
        goto LABEL_67;
      }
      goto LABEL_68;
    }
LABEL_40:
    v141 = v21;
    if (v144)
    {
      +[HMDPersistentStore writeData:toStorePath:dataLabel:](HMDPersistentStore, "writeData:toStorePath:dataLabel:", v21, *(_QWORD *)&v22, *(_QWORD *)&v22);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v78, "unsignedIntegerValue"))
      {
        v88 = v14;
        v89 = v15;
        v90 = v16;
        v91 = v22;
        v92 = v18;
        v93 = (void *)MEMORY[0x227676638]();
        HMFGetOSLogHandle();
        v94 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v146 = v95;
          v147 = 2112;
          v148 = v91;
          _os_log_impl(&dword_2218F0000, v94, OS_LOG_TYPE_INFO, "%{public}@Failed to save the file %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v93);

        v87 = 0;
        v18 = v92;
        v16 = v90;
        v15 = v89;
        v14 = v88;
        goto LABEL_46;
      }

    }
    v79 = v15;
    v80 = v16;
    v81 = v22;
    v82 = v18;
    objc_storeStrong((id *)&v143->_filePath, *(id *)&v14);
    objc_storeStrong((id *)&v143->_snapshotTimestamp, obj);
    objc_storeStrong((id *)&v143->_aspectRatio, v52);
    v83 = (void *)MEMORY[0x227676638]();
    v84 = v143;
    HMFGetOSLogHandle();
    v85 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v146 = v86;
      v147 = 2112;
      v148 = v81;
      v149 = 2112;
      v150 = *(double *)&v82;
      v151 = 2112;
      v152 = (size_t)v52;
      _os_log_impl(&dword_2218F0000, v85, OS_LOG_TYPE_INFO, "%{public}@Initialized the snapshot file path %@, timestamp %@, aspect ratio %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v83);

    v87 = 1;
    v18 = v82;
    v16 = v80;
    v15 = v79;
LABEL_46:
    v21 = v141;
    goto LABEL_69;
  }
  v23 = v15;
  -[HMDCameraSnapshotData snapshotData](v23, "snapshotData");
  v24 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  v25 = CGImageSourceCreateWithData(v24, 0);

  if (v25)
  {
    v26 = CGImageSourceCreateImageAtIndex(v25, 0, 0);
    if (v26)
    {
      v27 = v26;
      v135 = v25;
      v137 = v18;
      v139 = v23;
      v132 = v16;
      *(double *)&v28 = COERCE_DOUBLE(CGImageGetWidth(v26));
      image = v27;
      Height = CGImageGetHeight(v27);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)v28 / (double)Height);
      v133 = (id)objc_claimAutoreleasedReturnValue();
      v30 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v146 = v32;
        v147 = 2112;
        v148 = v22;
        v149 = 2048;
        v150 = *(double *)&v28;
        v151 = 2048;
        v152 = Height;
        _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@Image at %@ is of width %lu, height %lu", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v30);
      -[HMDCameraSnapshotData videoResolution](v139, "videoResolution");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "imageWidth");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "unsignedIntegerValue");

      -[HMDCameraSnapshotData videoResolution](v139, "videoResolution");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "imageHeight");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "unsignedIntegerValue");

      if (Height == v38 && v28 == v35 || v28 == v38 && Height == v35)
      {
        v39 = (void *)MEMORY[0x227676638]();
        HMFGetOSLogHandle();
        v40 = objc_claimAutoreleasedReturnValue();
        v16 = v132;
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v146 = v41;
          v147 = 2112;
          v148 = v22;
          _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_INFO, "%{public}@Given data matches the expected resolution for file path %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v39);
        v23 = v139;
        -[HMDCameraSnapshotData snapshotData](v139, "snapshotData");
        v42 = (__CFData *)objc_claimAutoreleasedReturnValue();
        v18 = v137;
      }
      else
      {
        ColorSpace = CGImageGetColorSpace(image);
        if (ColorSpace)
        {
          v97 = ColorSpace;
          v98 = (float)(v38 * v28 / Height);
          v99 = (float)v38;
          v100 = (unint64_t)(float)v38;
          BitsPerComponent = CGImageGetBitsPerComponent(image);
          BytesPerRow = CGImageGetBytesPerRow(image);
          AlphaInfo = CGImageGetAlphaInfo(image);
          v104 = CGBitmapContextCreate(0, (unint64_t)v98, v100, BitsPerComponent, BytesPerRow, v97, AlphaInfo);
          if (v104)
          {
            v105 = v104;
            v154.origin.x = 0.0;
            v154.origin.y = 0.0;
            v154.size.width = v98;
            v154.size.height = v99;
            CGContextDrawImage(v104, v154, image);
            v106 = CGBitmapContextCreateImage(v105);
            CGContextRelease(v105);
            if (v106)
            {
              v107 = (__CFData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
              v108 = CGImageDestinationCreateWithData(v107, (CFStringRef)*MEMORY[0x24BDC17C0], 1uLL, 0);
              v16 = v132;
              cf = v106;
              if (v108)
              {
                v109 = v108;
                v130 = v107;
                CGImageDestinationAddImage(v108, v106, 0);
                v110 = CGImageDestinationFinalize(v109);
                context = (void *)MEMORY[0x227676638]();
                HMFGetOSLogHandle();
                v111 = objc_claimAutoreleasedReturnValue();
                v112 = v111;
                if (v110)
                {
                  v113 = v135;
                  v18 = v137;
                  if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
                  {
                    HMFGetLogIdentifier();
                    v114 = (void *)objc_claimAutoreleasedReturnValue();
                    v115 = -[__CFData length](v130, "length");
                    *(_DWORD *)buf = 138544130;
                    v146 = v114;
                    v147 = 2048;
                    v148 = v98;
                    v149 = 2048;
                    v150 = v99;
                    v151 = 2048;
                    v152 = v115;
                    _os_log_impl(&dword_2218F0000, v112, OS_LOG_TYPE_INFO, "%{public}@Returning JPEG image of width: %lf, height: %lf, %tu bytes", buf, 0x2Au);

                  }
                  objc_autoreleasePoolPop(context);
                  v116 = v130;
                  v42 = v130;
                }
                else
                {
                  v113 = v135;
                  v18 = v137;
                  if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
                  {
                    HMFGetLogIdentifier();
                    v128 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543362;
                    v146 = v128;
                    _os_log_impl(&dword_2218F0000, v112, OS_LOG_TYPE_ERROR, "%{public}@Failing to finalize destination", buf, 0xCu);

                  }
                  objc_autoreleasePoolPop(context);
                  v42 = 0;
                  v116 = v130;
                }

                CFRelease(v109);
                v23 = v139;
              }
              else
              {
                v125 = (void *)MEMORY[0x227676638]();
                HMFGetOSLogHandle();
                v126 = objc_claimAutoreleasedReturnValue();
                v23 = v139;
                if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v127 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v146 = v127;
                  v147 = 2112;
                  v148 = v22;
                  _os_log_impl(&dword_2218F0000, v126, OS_LOG_TYPE_ERROR, "%{public}@Failed to create image destination for file path %@", buf, 0x16u);

                }
                objc_autoreleasePoolPop(v125);

                v42 = 0;
                v113 = v135;
                v18 = v137;
              }
              v120 = image;
              CFRelease(cf);
LABEL_62:
              CFRelease(v120);
              CFRelease(v113);
              v64 = v133;
              if (v42)
                goto LABEL_63;
              goto LABEL_32;
            }
          }
        }
        v117 = (void *)MEMORY[0x227676638]();
        HMFGetOSLogHandle();
        v118 = objc_claimAutoreleasedReturnValue();
        v16 = v132;
        if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v146 = v119;
          v147 = 2112;
          v148 = v22;
          _os_log_impl(&dword_2218F0000, v118, OS_LOG_TYPE_ERROR, "%{public}@Failed to create resized image for file path %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v117);
        v42 = 0;
        v18 = v137;
        v23 = v139;
      }
      v120 = image;
      v113 = v135;
      goto LABEL_62;
    }
    v60 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v136 = v25;
      v62 = v18;
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v146 = v63;
      v147 = 2112;
      v148 = v22;
      _os_log_impl(&dword_2218F0000, v61, OS_LOG_TYPE_ERROR, "%{public}@Failed to create image for file path %@", buf, 0x16u);

      v18 = v62;
      v25 = v136;
    }

    objc_autoreleasePoolPop(v60);
    CFRelease(v25);
  }
  else
  {
    v53 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v55 = v18;
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v146 = v56;
      v147 = 2112;
      v148 = v22;
      _os_log_impl(&dword_2218F0000, v54, OS_LOG_TYPE_ERROR, "%{public}@Failed to create image source for file path %@", buf, 0x16u);

      v18 = v55;
    }

    objc_autoreleasePoolPop(v53);
  }
  v64 = 0;
LABEL_32:
  v65 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v66 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v140 = v23;
    v67 = v21;
    v68 = v18;
    v69 = v14;
    v70 = v15;
    v71 = v16;
    v72 = v22;
    v73 = v64;
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v146 = v74;
    _os_log_impl(&dword_2218F0000, v66, OS_LOG_TYPE_INFO, "%{public}@Could not resize image, returning back the original", buf, 0xCu);

    v64 = v73;
    v22 = v72;
    v16 = v71;
    v15 = v70;
    v14 = v69;
    v18 = v68;
    v21 = v67;
    v23 = v140;
  }

  objc_autoreleasePoolPop(v65);
  -[HMDCameraSnapshotData snapshotData](v23, "snapshotData");
  v42 = (__CFData *)objc_claimAutoreleasedReturnValue();
LABEL_63:

  v52 = v64;
  if (-[__CFData length](v42, "length"))
  {
    v21 = v42;
    if (!v52)
      goto LABEL_65;
    goto LABEL_40;
  }
  v122 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v123 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v123, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v146 = v124;
    v147 = 2112;
    v148 = v22;
    _os_log_impl(&dword_2218F0000, v123, OS_LOG_TYPE_INFO, "%{public}@Resizing file data for file path %@ resulted in 0 length data", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v122);

  v87 = 0;
  v21 = v42;
LABEL_69:

  return v87;
}

- (NSData)encodedDataForIDSSend
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  HMDSnapshotFile *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCE50];
  -[HMDSnapshotFile filePath](self, "filePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v3, "dataWithContentsOfFile:options:error:", v4, 2, &v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v16;

  if (v6)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSnapshotFile filePath](v8, "filePath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v18 = v10;
      v19 = 2112;
      v20 = v11;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to get data from file at path: %@ error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    v12 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSnapshotFile snapshotTimestamp](self, "snapshotTimestamp");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("timestamp"));

    objc_msgSend(v13, "setObject:forKeyedSubscript:", v5, CFSTR("imageData"));
    encodeRootObject();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSData *)v12;
}

- (BOOL)decodeIDSDataReceived:(id)a3 snapshotDataTransaction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  int v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  HMDCameraSnapshotData *v19;
  void *v20;
  BOOL v21;
  void *v22;
  HMDSnapshotFile *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  HMDSnapshotFile *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  HMDSnapshotFile *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  void *v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BDD1620];
  getIDSSessionOptionsAllowedClasses();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", v9, v6, &v37);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v37;

  if (v10)
  {
    v12 = v10;
    objc_opt_class();
    v13 = objc_opt_isKindOfClass() & 1;
    if (v13)
      v14 = v12;
    else
      v14 = 0;
    v15 = v14;

    if (v13)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("timestamp"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("imageData"));
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      if (v16 && v17)
      {
        v19 = -[HMDCameraSnapshotData initWithSnapshotData:videoResolution:snapshotDataTrasaction:]([HMDCameraSnapshotData alloc], "initWithSnapshotData:videoResolution:snapshotDataTrasaction:", v17, 0, v7);
        -[HMDSnapshotFile directory](self, "directory");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[HMDSnapshotFile prepareParametersWithFilePath:snapshotData:directory:snapshotTimestamp:resize:writeBack:](self, "prepareParametersWithFilePath:snapshotData:directory:snapshotTimestamp:resize:writeBack:", 0, v19, v20, v16, 0, 1);

      }
      else
      {
        v30 = (void *)MEMORY[0x227676638]();
        v31 = self;
        HMFGetOSLogHandle();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v36 = v30;
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v18, "length");
          *(_DWORD *)buf = 138543874;
          v39 = v33;
          v40 = 2112;
          v41 = v16;
          v42 = 2048;
          v43 = v34;
          _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Either file timestamp %@ or file data %tu is missing", buf, 0x20u);

          v30 = v36;
        }

        objc_autoreleasePoolPop(v30);
        v21 = 0;
      }

    }
    else
    {
      v26 = (void *)MEMORY[0x227676638]();
      v27 = self;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v39 = v29;
        v40 = 2112;
        v41 = v12;
        _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Decoded object: %@ is not of type dictionary", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v26);
      v21 = 0;
    }

  }
  else
  {
    v22 = (void *)MEMORY[0x227676638]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v39 = v25;
      v40 = 2112;
      v41 = v11;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive allowed IDS session options from relay data: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    v21 = 0;
  }

  return v21;
}

- (NSString)directory
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)filePath
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSDate)snapshotTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)slotIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSlotIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSNumber)aspectRatio
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)externalFilePath
{
  return self->_externalFilePath;
}

- (BOOL)isFilled
{
  return self->_filled;
}

- (void)setFilled:(BOOL)a3
{
  self->_filled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aspectRatio, 0);
  objc_storeStrong((id *)&self->_slotIdentifier, 0);
  objc_storeStrong((id *)&self->_snapshotTimestamp, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_directory, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_104084 != -1)
    dispatch_once(&logCategory__hmf_once_t0_104084, &__block_literal_global_104085);
  return (id)logCategory__hmf_once_v1_104086;
}

void __30__HMDSnapshotFile_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_104086;
  logCategory__hmf_once_v1_104086 = v0;

}

@end
