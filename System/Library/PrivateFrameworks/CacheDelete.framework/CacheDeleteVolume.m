@implementation CacheDeleteVolume

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bsdName, 0);
  objc_storeStrong((id *)&self->_thresholds, 0);
  objc_storeStrong((id *)&self->_mountPoint, 0);
  objc_storeStrong((id *)&self->_fsType, 0);
}

- (BOOL)validate
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  BOOL v9;

  v3 = (void *)MEMORY[0x1A8591C18](self, a2);
  v9 = -[CacheDeleteVolume isRoot](self, "isRoot");
  -[CacheDeleteVolume mountPoint](self, "mountPoint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _validateVolume();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0;
  if (!-[CacheDeleteVolume dev](self, "dev"))
  {
    if (v9 == -[CacheDeleteVolume isRoot](self, "isRoot"))
    {
      -[CacheDeleteVolume mountPoint](self, "mountPoint");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isEqualToString:", v7);

    }
    else
    {
      v6 = 0;
    }
  }

  objc_autoreleasePoolPop(v3);
  return v6;
}

- (BOOL)isRoot
{
  return self->_isRoot;
}

- (BOOL)amountIsRational:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  NSObject *v9;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  unint64_t v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  unint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  unint64_t v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  unint64_t v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  unint64_t v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  unint64_t v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "unsignedLongLongValue");
  v6 = -[CacheDeleteVolume freespace](self, "freespace") + v5;
  if (v6 >= -[CacheDeleteVolume effective_size](self, "effective_size")
    || (v7 = objc_msgSend(v4, "unsignedLongLongValue"), v7 >= -[CacheDeleteVolume used](self, "used")))
  {
    CDGetLogHandle((uint64_t)"client");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[CacheDeleteVolume mountPoint](self, "mountPoint");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v4, "unsignedLongLongValue");
      humanReadableNumber(objc_msgSend(v4, "unsignedLongLongValue"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[CacheDeleteVolume freespace](self, "freespace");
      humanReadableNumber(-[CacheDeleteVolume freespace](self, "freespace"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[CacheDeleteVolume freespace](self, "freespace");
      v21 = objc_msgSend(v4, "unsignedLongLongValue") + v13;
      humanReadableNumber(objc_msgSend(v4, "unsignedLongLongValue") + -[CacheDeleteVolume freespace](self, "freespace"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[CacheDeleteVolume effective_size](self, "effective_size");
      humanReadableNumber(-[CacheDeleteVolume effective_size](self, "effective_size"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[CacheDeleteVolume size](self, "size");
      humanReadableNumber(-[CacheDeleteVolume size](self, "size"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[CacheDeleteVolume used](self, "used");
      humanReadableNumber(-[CacheDeleteVolume used](self, "used"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138415362;
      v26 = v11;
      v27 = 2048;
      v28 = v12;
      v29 = 2112;
      v30 = v24;
      v31 = 2048;
      v32 = v23;
      v33 = 2112;
      v34 = v22;
      v35 = 2048;
      v36 = v21;
      v37 = 2112;
      v38 = v20;
      v39 = 2048;
      v40 = v19;
      v41 = 2112;
      v42 = v14;
      v43 = 2048;
      v44 = v18;
      v45 = 2112;
      v46 = v15;
      v47 = 2048;
      v48 = v16;
      v49 = 2112;
      v50 = v17;
      _os_log_error_impl(&dword_1A3662000, v9, OS_LOG_TYPE_ERROR, "Volume: %@ : Irrational amount: %llu (%@), plus freespace %llu (%@) = %llu (%@) > self.effective_size: %llu (%@), real size: %llu, (%@), amount used: %llu (%@)", buf, 0x84u);

    }
    v8 = 0;
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (unint64_t)freespace
{
  void *v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v8[16];

  v3 = (void *)MEMORY[0x1A8591C18](self, a2);
  if (-[CacheDeleteVolume validate](self, "validate"))
  {
    -[CacheDeleteVolume mountPoint](self, "mountPoint");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = volumeFreespace((const char *)objc_msgSend(v4, "fileSystemRepresentation"));

  }
  else
  {
    CDGetLogHandle((uint64_t)"client");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_1A3662000, v6, OS_LOG_TYPE_ERROR, "CacheDeleteVolume validate failed. Returning 0 free space", v8, 2u);
    }

    v5 = 0;
  }
  objc_autoreleasePoolPop(v3);
  return v5;
}

- (unint64_t)effective_size
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSString *v12;
  NSObject *v14;
  void *v15;
  NSString *mountPoint;
  void *v17;
  int v18;
  unint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  NSString *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (-[CacheDeleteVolume validate](self, "validate"))
  {
    v3 = -[CacheDeleteVolume size](self, "size");
    v4 = volumeUsed("/");
    -[CacheDeleteVolume mountPoint](self, "mountPoint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    disk();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    disk();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7)
      && (v8 = -[CacheDeleteVolume size](self, "size"), v8 == volumeSize("/")))
    {
      if (v3 <= v4)
      {
        CDGetLogHandle((uint64_t)"client");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          humanReadableNumber(v4);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          mountPoint = self->_mountPoint;
          humanReadableNumber(v3);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 134218754;
          v19 = v4;
          v20 = 2112;
          v21 = v15;
          v22 = 2112;
          v23 = mountPoint;
          v24 = 2112;
          v25 = v17;
          _os_log_error_impl(&dword_1A3662000, v14, OS_LOG_TYPE_ERROR, "CacheDeleteVolume effective_size: systemVolume used amount is greater than this volume's size. System used amount: %llu (%@), this volume: %@ : %@", (uint8_t *)&v18, 0x2Au);

        }
        effective_size_volume_effective_size = 0;
      }
      else
      {
        effective_size_volume_effective_size = v3 - v4;
        CDGetLogHandle((uint64_t)"client");
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          -[CacheDeleteVolume mountPoint](self, "mountPoint");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          humanReadableNumber(v3);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          humanReadableNumber(effective_size_volume_effective_size);
          v12 = (NSString *)objc_claimAutoreleasedReturnValue();
          v18 = 138412802;
          v19 = (unint64_t)v10;
          v20 = 2112;
          v21 = v11;
          v22 = 2112;
          v23 = v12;
          _os_log_impl(&dword_1A3662000, v9, OS_LOG_TYPE_DEFAULT, "CacheDeleteVolume effective_size: %@ container size: %@, effective size: %@", (uint8_t *)&v18, 0x20u);

        }
      }
    }
    else
    {
      effective_size_volume_effective_size = v3;
    }

  }
  return effective_size_volume_effective_size;
}

- (unint64_t)size
{
  id v3;
  uint64_t v4;

  if (!-[CacheDeleteVolume validate](self, "validate"))
    return 0;
  -[CacheDeleteVolume mountPoint](self, "mountPoint");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = volumeSize((const char *)objc_msgSend(v3, "fileSystemRepresentation"));

  return v4;
}

- (NSString)mountPoint
{
  return self->_mountPoint;
}

- (int)dev
{
  return self->_dev;
}

- (BOOL)mayContainPurgeableAmount:(id)a3 forService:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  BOOL v11;
  void *v12;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  id v17;
  __int16 v18;
  unint64_t v19;
  __int16 v20;
  id v21;
  __int16 v22;
  CacheDeleteVolume *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[CacheDeleteVolume size](self, "size");
  if (objc_msgSend(v6, "longLongValue") < 0 || v8 && objc_msgSend(v6, "unsignedLongLongValue") > v8)
  {
    CDGetLogHandle((uint64_t)"client");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67110146;
      v15 = 0;
      v16 = 2112;
      v17 = v6;
      v18 = 2048;
      v19 = v8;
      v20 = 2112;
      v21 = v7;
      v22 = 2112;
      v23 = self;
      _os_log_error_impl(&dword_1A3662000, v9, OS_LOG_TYPE_ERROR, "Received implausible purgeable amount. Returning: (%d) passed: (%@), volume max: (%llu), service ID: (%@), volume: (%@)", buf, 0x30u);
    }

    v10 = -[CacheDeleteVolume isRoot](self, "isRoot");
    v11 = 0;
    if (v7 && v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Service (%@) has reported (%@) purgeable for a root volume (%@) with max size (%llu)"), v7, v6, self, v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      CDSimulateCrash(195890387, v12);

      v11 = 0;
    }
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (NSDictionary)thresholds
{
  return self->_thresholds;
}

+ (CacheDeleteVolume)volumeWithPath:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPath:", v4);

  return (CacheDeleteVolume *)v5;
}

+ (id)validateVolumeAtPath:(id)a3
{
  void *v3;
  void *v4;

  if (!a3)
    return 0;
  mapVolume(a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _validateVolume();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (CacheDeleteVolume)volumeWithMountpoint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPath:", v4);
  objc_msgSend(v5, "mountPoint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByStandardizingPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByStandardizingPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "isEqualToString:", v8);
  if ((_DWORD)v4)
    v9 = v5;
  else
    v9 = 0;

  return (CacheDeleteVolume *)v9;
}

- (CacheDeleteVolume)initWithPath:(id)a3
{
  id v4;
  CacheDeleteVolume *v5;
  void *v6;
  uint64_t v7;
  NSString *mountPoint;
  uint64_t v9;
  NSString *fsType;
  uint64_t v11;
  NSString *bsdName;
  uint64_t v13;
  NSDictionary *v14;
  NSDictionary *thresholds;
  NSObject *v16;
  CacheDeleteVolume *v17;
  NSObject *v18;
  uint64_t v20;
  objc_super v21;
  void *v22;
  _QWORD block[6];
  _OWORD v24[2];
  __int128 buf;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CacheDeleteVolume;
  v22 = 0;
  v5 = -[CacheDeleteVolume init](&v21, sel_init);
  if (!v5)
  {
LABEL_17:
    v5 = v5;
    v17 = v5;
    goto LABEL_18;
  }
  if (v4)
  {
    memset(v24, 0, sizeof(v24));
    mapVolume(v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _validateVolume();
    v7 = objc_claimAutoreleasedReturnValue();
    mountPoint = v5->_mountPoint;
    v5->_mountPoint = (NSString *)v7;

    if (v5->_mountPoint)
    {
      if (v22)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
        v9 = objc_claimAutoreleasedReturnValue();
        fsType = v5->_fsType;
        v5->_fsType = (NSString *)v9;

      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v24);
      v11 = objc_claimAutoreleasedReturnValue();
      bsdName = v5->_bsdName;
      v5->_bsdName = (NSString *)v11;

      v13 = -[NSString UTF8String](v5->_mountPoint, "UTF8String");
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v26 = 0x3032000000;
      v27 = __Block_byref_object_copy__3;
      v28 = __Block_byref_object_dispose__3;
      v29 = 0;
      if (qword_1ECE242D8 != -1)
      {
        v20 = v13;
        dispatch_once(&qword_1ECE242D8, &__block_literal_global_5);
        v13 = v20;
      }
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __cdVolumeThresholdsForMountPoint_block_invoke_2;
      block[3] = &unk_1E4A32E38;
      block[4] = &buf;
      block[5] = v13;
      dispatch_sync((dispatch_queue_t)qword_1ECE242D0, block);
      v14 = (NSDictionary *)*(id *)(*((_QWORD *)&buf + 1) + 40);
      _Block_object_dispose(&buf, 8);

      thresholds = v5->_thresholds;
      v5->_thresholds = v14;

      v5->_initialFreespace = volumeFreespace(-[NSString fileSystemRepresentation](v5->_mountPoint, "fileSystemRepresentation"));
    }
    else
    {
      CDGetLogHandle((uint64_t)"client");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v4;
        _os_log_debug_impl(&dword_1A3662000, v18, OS_LOG_TYPE_DEBUG, "unable to validate volume: %@", (uint8_t *)&buf, 0xCu);
      }

      v5 = 0;
    }
    if (v22)
      free(v22);
    goto LABEL_17;
  }
  CDGetLogHandle((uint64_t)"client");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_error_impl(&dword_1A3662000, v16, OS_LOG_TYPE_ERROR, "path is NIL", (uint8_t *)&buf, 2u);
  }

  v17 = 0;
LABEL_18:

  return v17;
}

- (CacheDeleteVolume)initWithVolume:(id)a3
{
  id v4;
  CacheDeleteVolume *v5;
  void *v6;
  uint64_t v7;
  NSString *fsType;
  void *v9;
  uint64_t v10;
  NSString *mountPoint;
  void *v12;
  uint64_t v13;
  NSDictionary *thresholds;
  void *v15;
  uint64_t v16;
  NSString *bsdName;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CacheDeleteVolume;
  v5 = -[CacheDeleteVolume init](&v19, sel_init);
  if (v5)
  {
    v5->_isRoot = objc_msgSend(v4, "isRoot");
    objc_msgSend(v4, "fsType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    fsType = v5->_fsType;
    v5->_fsType = (NSString *)v7;

    objc_msgSend(v4, "mountPoint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    mountPoint = v5->_mountPoint;
    v5->_mountPoint = (NSString *)v10;

    v5->_initialFreespace = objc_msgSend(v4, "freespace");
    objc_msgSend(v4, "thresholds");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    thresholds = v5->_thresholds;
    v5->_thresholds = (NSDictionary *)v13;

    objc_msgSend(v4, "bsdName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    bsdName = v5->_bsdName;
    v5->_bsdName = (NSString *)v16;

    v5->_dev = objc_msgSend(v4, "dev");
    v5->_block_size = objc_msgSend(v4, "block_size");
  }

  return v5;
}

- (NSString)bsdName
{
  return self->_bsdName;
}

- (NSString)fsType
{
  return self->_fsType;
}

- (unsigned)block_size
{
  return self->_block_size;
}

- (int64_t)state
{
  id v3;
  int64_t v4;

  if (!-[CacheDeleteVolume validate](self, "validate"))
    return 0;
  -[CacheDeleteVolume mountPoint](self, "mountPoint");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = volumeLowDiskState(objc_msgSend(v3, "fileSystemRepresentation"));

  return v4;
}

- (id)description
{
  objc_class *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  const char *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  const char *v18;
  void *v19;
  void *v20;
  void *v21;

  v21 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CacheDeleteVolume mountPoint](self, "mountPoint");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CacheDeleteVolume bsdName](self, "bsdName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CacheDeleteVolume fsType](self, "fsType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CacheDeleteVolume validate](self, "validate");
  v7 = ", INVALID ";
  if (v6)
    v7 = "";
  v18 = v7;
  v8 = -[CacheDeleteVolume freespace](self, "freespace");
  humanReadableNumber(-[CacheDeleteVolume freespace](self, "freespace"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CacheDeleteVolume initialFreespace](self, "initialFreespace");
  humanReadableNumber(-[CacheDeleteVolume initialFreespace](self, "initialFreespace"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CacheDeleteVolume used](self, "used");
  humanReadableNumber(-[CacheDeleteVolume used](self, "used"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[CacheDeleteVolume size](self, "size");
  humanReadableNumber(-[CacheDeleteVolume size](self, "size"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("<%@> at: %@ [%@ : %@] %sfreespace: %llu (%@), initialFreespace: %llu (%@), used: %llu (%@), total size: %llu (%@)"), v20, v19, v4, v5, v18, v8, v9, v10, v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (unint64_t)used
{
  id v3;
  unint64_t v4;

  if (!-[CacheDeleteVolume validate](self, "validate"))
    return 0;
  -[CacheDeleteVolume mountPoint](self, "mountPoint");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = volumeUsed((const char *)objc_msgSend(v3, "fileSystemRepresentation"));

  return v4;
}

- (unint64_t)initialFreespace
{
  return self->_initialFreespace;
}

- (id)uuid
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[CacheDeleteVolume mountPoint](self, "mountPoint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  mapVolume(v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_retainAutorelease(v3);
  VolUUID((const char *)objc_msgSend(v4, "UTF8String"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[CacheDeleteVolume isEqualTo:](self, "isEqualTo:", v4);

  return v5;
}

- (BOOL)isEqualTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CacheDeleteVolume mountPoint](self, "mountPoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mountPoint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  return (char)v4;
}

- (BOOL)freespaceIsStale:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  const char *v13;
  int v14;
  unint64_t v15;
  __int16 v16;
  unint64_t v17;
  __int16 v18;
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = -[CacheDeleteVolume freespace](self, "freespace");
  if (v5 <= a3)
    v6 = a3 - v5;
  else
    v6 = v5 - a3;
  v7 = -[CacheDeleteVolume freespace](self, "freespace");
  if (v7 / 0x14 >= 0x40000000)
    v8 = 0x40000000;
  else
    v8 = v7 / 0x14;
  if (v8 <= 0x9600000)
    v9 = 157286400;
  else
    v9 = v8;
  CDGetLogHandle((uint64_t)"client");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v14 = 134218496;
    v15 = v8;
    v16 = 2048;
    v17 = v9;
    v18 = 2048;
    v19 = v6;
    _os_log_debug_impl(&dword_1A3662000, v10, OS_LOG_TYPE_DEBUG, "freespaceIsStale ceiling: %llu, freespace_diff_threshold: %llu, freespace_diff: %llu", (uint8_t *)&v14, 0x20u);
  }

  CDGetLogHandle((uint64_t)"client");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v13 = "NO";
    if (v6 >= v9)
      v13 = "YES";
    v14 = 136315138;
    v15 = (unint64_t)v13;
    _os_log_debug_impl(&dword_1A3662000, v11, OS_LOG_TYPE_DEBUG, "freespaceIsStale: %s", (uint8_t *)&v14, 0xCu);
  }

  return v6 >= v9;
}

- (BOOL)containsPath:(id)a3
{
  id v4;
  char *v5;
  char *v6;
  NSObject *v7;
  void *v8;
  char v9;
  uint64_t v11;
  int *v12;
  char *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  char *v17;
  char v18[1024];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = objc_retainAutorelease(a3);
  v5 = volRootFromPath((char *)objc_msgSend(v4, "UTF8String"), v18);
  if (v5)
  {
    v6 = v5;
    -[CacheDeleteVolume mountPoint](self, "mountPoint");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NSObject isEqualToString:](v7, "isEqualToString:", v8);

  }
  else
  {
    CDGetLogHandle((uint64_t)"client");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
      v12 = __error();
      v13 = strerror(*v12);
      v14 = 136315394;
      v15 = v11;
      v16 = 2080;
      v17 = v13;
      _os_log_error_impl(&dword_1A3662000, v7, OS_LOG_TYPE_ERROR, "Unable to get mount point for %s : %s", (uint8_t *)&v14, 0x16u);
    }
    v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CacheDeleteVolume initWithVolume:]([CacheDeleteVolume alloc], "initWithVolume:", self);
}

- (unint64_t)amountPurged
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  unint64_t v6;
  NSObject *v7;
  int v9;
  unint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!-[CacheDeleteVolume validate](self, "validate"))
    goto LABEL_6;
  -[CacheDeleteVolume mountPoint](self, "mountPoint");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = volumeFreespace((const char *)objc_msgSend(v3, "fileSystemRepresentation"));

  CDGetLogHandle((uint64_t)"client");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v9 = 134218240;
    v10 = -[CacheDeleteVolume initialFreespace](self, "initialFreespace");
    v11 = 2048;
    v12 = v4;
    _os_log_debug_impl(&dword_1A3662000, v5, OS_LOG_TYPE_DEBUG, "begin_freespace: %llu, cur_freespace: %llu", (uint8_t *)&v9, 0x16u);
  }

  if (v4 > -[CacheDeleteVolume initialFreespace](self, "initialFreespace"))
    v6 = v4 - -[CacheDeleteVolume initialFreespace](self, "initialFreespace");
  else
LABEL_6:
    v6 = 0;
  CDGetLogHandle((uint64_t)"client");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9 = 134217984;
    v10 = v6;
    _os_log_debug_impl(&dword_1A3662000, v7, OS_LOG_TYPE_DEBUG, "result: %llu", (uint8_t *)&v9, 0xCu);
  }

  return v6;
}

+ (CacheDeleteVolume)volumeWithUUID:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    getLocalVolumes();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v16;
LABEL_4:
      v8 = 0;
      while (1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        +[CacheDeleteVolume volumeWithMountpoint:](CacheDeleteVolume, "volumeWithMountpoint:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8), (_QWORD)v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          objc_msgSend(v9, "uuid");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "UUIDString");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", v3);

          if ((v13 & 1) != 0)
            break;
        }

        if (v6 == ++v8)
        {
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          if (v6)
            goto LABEL_4;
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return (CacheDeleteVolume *)v10;
}

+ (id)mountPointForUUID:(id)a3
{
  void *v3;
  void *v4;

  +[CacheDeleteVolume volumeWithUUID:](CacheDeleteVolume, "volumeWithUUID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mountPoint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)rootVolume
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__CacheDeleteVolume_rootVolume__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECE242C8 != -1)
    dispatch_once(&qword_1ECE242C8, block);
  return (id)_MergedGlobals_5;
}

void __31__CacheDeleteVolume_rootVolume__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  getRootVolume();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "volumeWithMountpoint:", v4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_MergedGlobals_5;
  _MergedGlobals_5 = v2;

}

+ (int64_t)stateForPath:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  +[CacheDeleteVolume validateVolumeAtPath:](CacheDeleteVolume, "validateVolumeAtPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = volumeLowDiskState(objc_msgSend(objc_retainAutorelease(v3), "fileSystemRepresentation"));
  else
    v5 = 0;

  return v5;
}

- (id)FSEventsUUID
{
  const __CFUUID *v3;
  const __CFUUID *v4;
  CFStringRef v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = FSEventsCopyUUIDForDevice(-[CacheDeleteVolume dev](self, "dev"));
  if (!v3)
  {
    CDGetLogHandle((uint64_t)"client");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[CacheDeleteVolume mountPoint](self, "mountPoint");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v13 = 136315138;
      v14 = objc_msgSend(v10, "UTF8String");
      _os_log_error_impl(&dword_1A3662000, v6, OS_LOG_TYPE_ERROR, "Unable to get FSEvents UUID for %s", (uint8_t *)&v13, 0xCu);

    }
    goto LABEL_11;
  }
  v4 = v3;
  v5 = CFUUIDCreateString(0, v3);
  if (!v5)
  {
    CDGetLogHandle((uint64_t)"client");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = (uint64_t)v4;
      _os_log_error_impl(&dword_1A3662000, v11, OS_LOG_TYPE_ERROR, "CFUUIDCreateString failed for: %@", (uint8_t *)&v13, 0xCu);
    }

    CFRelease(v4);
    v6 = 0;
LABEL_11:
    v9 = 0;
    goto LABEL_12;
  }
  v6 = v5;
  CFRelease(v4);
  CDGetLogHandle((uint64_t)"client");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[CacheDeleteVolume mountPoint](self, "mountPoint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412546;
    v14 = (uint64_t)v6;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_1A3662000, v7, OS_LOG_TYPE_DEFAULT, "CacheDeleteVolume FSEventsUUID: %@ for %@", (uint8_t *)&v13, 0x16u);

  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v6);
LABEL_12:

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CacheDeleteVolume mountPoint](self, "mountPoint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

@end
