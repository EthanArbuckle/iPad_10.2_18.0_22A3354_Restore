id serviceForFSPurgeableType(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  fsPurgeableTypeToServiceMap();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __cdVolumeThresholdsForMountPoint_block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  char *v14;
  statfs v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  bzero(&v15, 0x878uLL);
  if (statfs(*(const char **)(a1 + 40), &v15))
  {
    CDGetLogHandle((uint64_t)"client");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = *(_QWORD *)(a1 + 40);
      v4 = __error();
      v5 = strerror(*v4);
      *(_DWORD *)buf = 136315394;
      v12 = v3;
      v13 = 2080;
      v14 = v5;
      _os_log_error_impl(&dword_1A3662000, v2, OS_LOG_TYPE_ERROR, "unable to stat volume: %s : %s", buf, 0x16u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v15.f_blocks * v15.f_bsize, CFSTR("CACHE_DELETE_VOLUME_SIZE"));
    v2 = objc_claimAutoreleasedReturnValue();
    v10[0] = v2;
    v10[1] = &unk_1E4A38CE0;
    v9[1] = CFSTR("DESIRED_DISK_THRESHOLD");
    v9[2] = CFSTR("NEAR_LOW_DISK_THRESHOLD");
    v10[2] = &unk_1E4A38CF8;
    v10[3] = &unk_1E4A38D10;
    v9[3] = CFSTR("LOW_DISK_THRESHOLD");
    v9[4] = CFSTR("VERY_LOW_DISK_THRESHOLD");
    v10[4] = &unk_1E4A38D28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

id evaluateUrgencyLimit(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v1 = a1;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_URGENCY"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  evaluateNumberProperty(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_URGENCY_LIMIT"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  evaluateNumberProperty(v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if (v3)
      v5 = v3;
    else
      v5 = &unk_1E4A38B90;
  }
  if (objc_msgSend(v5, "intValue") - 5 <= 0xFFFFFFFB)
  {

    v5 = &unk_1E4A38B90;
  }

  return v5;
}

id evaluateUrgency(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v1 = a1;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_URGENCY"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  evaluateNumberProperty(v2);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_URGENCY_LIMIT"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  evaluateNumberProperty(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    if (v5)
      v3 = v5;
    else
      v3 = &unk_1E4A38B78;
  }
  if (objc_msgSend(v3, "intValue") - 5 <= 0xFFFFFFFB)
  {

    v3 = &unk_1E4A38B78;
  }

  return v3;
}

id evaluatePurgeableUrgency(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  id v8;

  v1 = a1;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_URGENCY"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  evaluateNumberProperty(v2);
  v3 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_URGENCY_LIMIT"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  evaluateNumberProperty(v4);
  v5 = objc_claimAutoreleasedReturnValue();

  if (v3 && v5)
  {
    v6 = objc_msgSend((id)v5, "intValue");
    if (v6 <= (int)objc_msgSend((id)v3, "intValue"))
      v7 = (void *)v3;
    else
      v7 = (void *)v5;
  }
  else
  {
    if (v3)
      v7 = (void *)v3;
    else
      v7 = (void *)v5;
    if (!(v3 | v5))
      goto LABEL_12;
  }
  v8 = v7;
  if (objc_msgSend(v8, "intValue") - 5 <= 0xFFFFFFFB)
  {

LABEL_12:
    v8 = &unk_1E4A38B90;
  }

  return v8;
}

id evaluateNumberProperty(void *a1)
{
  id v1;
  id v2;
  NSObject *v3;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = v1;
  }
  else
  {
    CDGetLogHandle((uint64_t)"client");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v5 = 138412290;
      v6 = v1;
      _os_log_debug_impl(&dword_1A3662000, v3, OS_LOG_TYPE_DEBUG, "value %@ is not an NSNumber, returning nil", (uint8_t *)&v5, 0xCu);
    }

    v2 = 0;
  }

  return v2;
}

id fsPurgeableTypeForService(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v1 = a1;
  fsPurgeableTypeToServiceMap();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", v1);

  if (v4)
  {
    objc_msgSend(v2, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "indexOfObject:", v1);

    objc_msgSend(v2, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __disk_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a1 + 1152;
  v8 = a2;
  objc_msgSend(v6, "stringWithUTF8String:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "range");
  v12 = v11;

  objc_msgSend(v9, "substringWithRange:", v10, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  CDGetLogHandle((uint64_t)"client");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v19 = 138412546;
    v20 = v17;
    v21 = 2112;
    v22 = v18;
    _os_log_debug_impl(&dword_1A3662000, v16, OS_LOG_TYPE_DEBUG, "CacheDeleteVolume disk for %@ : %@", (uint8_t *)&v19, 0x16u);

  }
  *a4 = 1;
}

id CDGetLogHandle(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __CDGetLogHandle_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECE24278 != -1)
    dispatch_once(&qword_1ECE24278, block);
  return (id)qword_1ECE24268;
}

id fsPurgeableTypeToServiceMap()
{
  _QWORD v1[11];
  _QWORD v2[12];

  v2[11] = *MEMORY[0x1E0C80C00];
  v1[0] = &unk_1E4A38C08;
  v1[1] = &unk_1E4A38B78;
  v2[0] = CFSTR("CACHE_DELETE_TOTAL_FSPURGEABLE");
  v2[1] = CFSTR("com.apple.assetsd.cacheDelete");
  v1[2] = &unk_1E4A38C20;
  v1[3] = &unk_1E4A38B90;
  v2[2] = CFSTR("com.apple.MUSIC");
  v2[3] = CFSTR("com.apple.mobilemail.CacheDelete");
  v1[4] = &unk_1E4A38C38;
  v1[5] = &unk_1E4A38C50;
  v2[4] = CFSTR("com.apple.fspurgeable_document");
  v2[5] = CFSTR("com.apple.fspurgeable_data");
  v1[6] = &unk_1E4A38C68;
  v1[7] = &unk_1E4A38C80;
  v2[6] = CFSTR("com.apple.PODCAST");
  v2[7] = CFSTR("com.apple.VIDEO");
  v1[8] = &unk_1E4A38C98;
  v1[9] = &unk_1E4A38CB0;
  v2[8] = CFSTR("com.apple.MOVIE");
  v2[9] = CFSTR("com.apple.imagent.cache-delete");
  v1[10] = &unk_1E4A38CC8;
  v2[10] = CFSTR("com.apple.BOOKS");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v2, v1, 11);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t volumeFreespace(const char *a1)
{
  NSObject *v2;
  uint64_t v3;
  int *v5;
  char *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  statfs v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  memset(&v11, 0, 512);
  if (statfs(a1, &v11))
  {
    CDGetLogHandle((uint64_t)"client");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v5 = __error();
      v6 = strerror(*v5);
      v7 = 136315394;
      v8 = (uint64_t)a1;
      v9 = 2080;
      v10 = v6;
      _os_log_error_impl(&dword_1A3662000, v2, OS_LOG_TYPE_ERROR, "statfs failed for %s : %s", (uint8_t *)&v7, 0x16u);
    }
    v3 = -1;
LABEL_8:

    return v3;
  }
  v3 = v11.f_bavail * v11.f_bsize;
  if (v3 + 1 <= 1)
  {
    CDGetLogHandle((uint64_t)"client");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v7 = 134218242;
      v8 = v3;
      v9 = 2080;
      v10 = (void *)a1;
      _os_log_error_impl(&dword_1A3662000, v2, OS_LOG_TYPE_ERROR, "statfs returning %llu for %s", (uint8_t *)&v7, 0x16u);
    }
    goto LABEL_8;
  }
  return v3;
}

id humanReadableNumber(unint64_t a1)
{
  if (a1 < 0x3B9ACA01)
  {
    if (a1 < 0xF4241)
    {
      if (a1 < 0x3E9)
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu Bytes"), a1);
      else
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0.2f KB"), (double)a1 / 1000.0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0.2f MB"), (double)a1 / 1000000.0);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0.2f GB"), (double)a1 / 1000000000.0);
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t volumeSize(const char *a1)
{
  NSObject *v2;
  int *v4;
  char *v5;
  int v6;
  const char *v7;
  __int16 v8;
  char *v9;
  statfs v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  memset(&v10, 0, 512);
  if (!statfs(a1, &v10))
    return v10.f_blocks * v10.f_bsize;
  CDGetLogHandle((uint64_t)"client");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = __error();
    v5 = strerror(*v4);
    v6 = 136315394;
    v7 = a1;
    v8 = 2080;
    v9 = v5;
    _os_log_error_impl(&dword_1A3662000, v2, OS_LOG_TYPE_ERROR, "statfs failed for %s : %s", (uint8_t *)&v6, 0x16u);
  }

  return -1;
}

char *_validateVolume()
{
  void *v0;
  char *v1;
  char *v2;
  size_t v3;
  size_t v4;
  uint32_t *v5;
  uint32_t *v6;
  dev_t *v7;
  dev_t *v8;
  char **v9;
  char **v10;
  _BYTE *v11;
  _BYTE *v12;
  id v13;
  id v14;
  uint64_t v15;
  char *v16;
  char *v17;
  NSObject *v18;
  char *v19;
  NSObject *v20;
  char *v21;
  NSObject *v22;
  const char *v23;
  char *v24;
  NSObject *v25;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  int *v30;
  char *v31;
  const char *v32;
  NSObject *v33;
  uint32_t v34;
  NSObject *v35;
  int *v36;
  char *v37;
  void *v38;
  stat v39;
  statfs v40;
  uint8_t v41[4];
  int v42;
  __int16 v43;
  id v44;
  uint8_t buf[4];
  size_t v46;
  __int16 v47;
  char *f_mntfromname;
  char v49[1024];
  uint64_t v50;

  v0 = (void *)MEMORY[0x1E0C80A78]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v50 = *MEMORY[0x1E0C80C00];
  v13 = v0;
  memset(&v40, 0, 512);
  memset(&v39, 0, sizeof(v39));
  if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    CDGetLogHandle((uint64_t)"client");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      getbacktrace_short();
      v24 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v46 = (size_t)v13;
      v47 = 2112;
      f_mntfromname = v24;
      _os_log_error_impl(&dword_1A3662000, v20, OS_LOG_TYPE_ERROR, "volume validation failed for <<%@>> %@", buf, 0x16u);

    }
    v17 = 0;
    goto LABEL_16;
  }
  v14 = v13;
  v15 = objc_msgSend(v14, "lengthOfBytesUsingEncoding:", 4);
  if ((unint64_t)(v15 - 1) > 0x3FF)
  {
    CDGetLogHandle((uint64_t)"client");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    *(_DWORD *)v41 = 67109378;
    v42 = 222;
    v43 = 2112;
    v44 = v14;
    v23 = "%d normalizeUserMountpoint: strLen is zero for %@!";
LABEL_23:
    _os_log_error_impl(&dword_1A3662000, v22, OS_LOG_TYPE_ERROR, v23, v41, 0x12u);
    goto LABEL_24;
  }
  if (!objc_msgSend(v14, "getCString:maxLength:encoding:", buf, v15 + 1, 4))
  {
    CDGetLogHandle((uint64_t)"client");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    *(_DWORD *)v41 = 67109378;
    v42 = 219;
    v43 = 2112;
    v44 = v14;
    v23 = "%d normalizeUserMountpoint: Unable to get CString for: %@";
    goto LABEL_23;
  }
  v16 = volRootFromPath((char *)buf, v49);
  if (!v16)
  {
    CDGetLogHandle((uint64_t)"client");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v41 = 67109378;
      v42 = 214;
      v43 = 2112;
      v44 = v14;
      v23 = "%d normalizeUserMountpoint: volRoot failed for %@";
      goto LABEL_23;
    }
LABEL_24:

    v17 = 0;
LABEL_25:
    CDGetLogHandle((uint64_t)"client");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v46 = (size_t)v14;
      v47 = 2112;
      f_mntfromname = v17;
      _os_log_error_impl(&dword_1A3662000, v25, OS_LOG_TYPE_ERROR, "unable to normalize volume: \"%@\", tmp_result: %@", buf, 0x16u);
    }

    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v16);
  v17 = (char *)objc_claimAutoreleasedReturnValue();

  if (!v17
    || (objc_msgSend(v17, "isEqualToString:", CFSTR("/dev")) & 1) != 0
    || objc_msgSend(v17, "isEqualToString:", &stru_1E4A34440))
  {
    goto LABEL_25;
  }
  v17 = objc_retainAutorelease(v17);
  if (!statfs((const char *)objc_msgSend(v17, "fileSystemRepresentation"), &v40))
  {
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v40.f_mntonname);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      mapVolume(v38, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      *v12 = objc_msgSend(v27, "isEqualToString:", CFSTR("/"));
    }
    if ((filterVolumes((uint64_t)&v40, 4) & 1) == 0)
    {
      CDGetLogHandle((uint64_t)"client");
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v32 = "Not Valid";
        v33 = v28;
        v34 = 2;
        goto LABEL_51;
      }
LABEL_41:

LABEL_28:
      v21 = 0;
      goto LABEL_29;
    }
    if (v10)
      *v10 = strdup(v40.f_fstypename);
    if (v8)
    {
      if (stat((const char *)objc_msgSend(objc_retainAutorelease(v14), "UTF8String"), &v39))
      {
        CDGetLogHandle((uint64_t)"client");
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v29 = objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
          v30 = __error();
          v31 = strerror(*v30);
          *(_DWORD *)buf = 136315394;
          v46 = v29;
          v47 = 2080;
          f_mntfromname = v31;
          v32 = "Stat failed for %s : %s";
          v33 = v28;
          v34 = 22;
LABEL_51:
          _os_log_error_impl(&dword_1A3662000, v33, OS_LOG_TYPE_ERROR, v32, buf, v34);
          goto LABEL_41;
        }
        goto LABEL_41;
      }
      *v8 = v39.st_dev;
    }
    if (v2 && strlcpy(v2, v40.f_mntfromname, v4) >= v4)
    {
      CDGetLogHandle((uint64_t)"client");
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        v46 = v4;
        v47 = 2080;
        f_mntfromname = v40.f_mntfromname;
        _os_log_error_impl(&dword_1A3662000, v35, OS_LOG_TYPE_ERROR, "bsd_name_len (%lu) too short for: %s", buf, 0x16u);
      }

      v2[v4 - 1] = 0;
    }
    if (v6)
      *v6 = v40.f_bsize;
LABEL_16:
    v17 = v17;
    v21 = v17;
LABEL_29:
    v19 = v21;
    goto LABEL_30;
  }
  CDGetLogHandle((uint64_t)"client");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v36 = __error();
    v37 = strerror(*v36);
    *(_DWORD *)buf = 138412546;
    v46 = (size_t)v14;
    v47 = 2080;
    f_mntfromname = v37;
    _os_log_error_impl(&dword_1A3662000, v18, OS_LOG_TYPE_ERROR, "statfs failed for %@ : %s", buf, 0x16u);
  }

  v19 = 0;
LABEL_30:

  return v19;
}

__CFString *mapVolume(void *a1, int a2)
{
  id v3;
  void *v4;
  __CFString *v5;

  v3 = a1;
  v4 = v3;
  if (a2)
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("/System/Volumes/Data")) & 1) != 0)
    {
      v5 = CFSTR("/");
      goto LABEL_9;
    }
LABEL_8:
    v5 = v4;
    goto LABEL_9;
  }
  if (!objc_msgSend(v3, "isEqualToString:", CFSTR("/")))
    goto LABEL_8;
  if (hasUserVolume())
    v5 = CFSTR("/private/var/mobile");
  else
    v5 = CFSTR("/private/var");
LABEL_9:

  return v5;
}

id disk()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  int *v7;
  char *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  _QWORD v20[5];
  uint8_t v21[2168];
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  char *v25;
  statfs __src;
  uint64_t v27;

  v0 = (void *)MEMORY[0x1E0C80A78]();
  v27 = *MEMORY[0x1E0C80C00];
  v1 = v0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2;
  v18 = __Block_byref_object_dispose__2;
  v19 = 0;
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("disk\\d+"), 1, &v13);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v13;
  bzero(&__src, 0x878uLL);
  v4 = objc_retainAutorelease(v1);
  if (statfs((const char *)objc_msgSend(v4, "UTF8String"), &__src))
  {
    CDGetLogHandle((uint64_t)"client");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
      v7 = __error();
      v8 = strerror(*v7);
      *(_DWORD *)buf = 136315394;
      v23 = v6;
      v24 = 2080;
      v25 = v8;
      _os_log_error_impl(&dword_1A3662000, v5, OS_LOG_TYPE_ERROR, "CacheDeleteVolume disk(): statfs failed for %s : %s", buf, 0x16u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", __src.f_mntfromname);
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", __src.f_mntfromname);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __disk_block_invoke;
    v20[3] = &unk_1E4A32D88;
    v20[4] = &v14;
    memcpy(v21, &__src, sizeof(v21));
    objc_msgSend(v2, "enumerateMatchesInString:options:range:usingBlock:", v5, 0, 0, v10, v20);

  }
  v11 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v11;
}

void sub_1A3666B98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t filterVolumes(uint64_t a1, int a2)
{
  char v2;
  uint64_t v4;
  NSObject *v5;
  int v6;
  int v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  char v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v2 = a2;
  v18 = *MEMORY[0x1E0C80C00];
  LODWORD(v4) = a2 | ((*(_BYTE *)(a1 + 65) & 0x10) >> 4);
  if (!(a2 & 1 | ((*(_BYTE *)(a1 + 65) & 0x10) != 0)))
  {
    CDGetLogHandle((uint64_t)"client");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v16) = 0;
      _os_log_debug_impl(&dword_1A3662000, v5, OS_LOG_TYPE_DEBUG, "!MNT_LOCAL && !AllowNonLocal", (uint8_t *)&v16, 2u);
    }

  }
  v6 = strcmp("devfs", (const char *)(a1 + 72));
  if ((v2 & 0x10) == 0 && !v6)
  {
    CDGetLogHandle((uint64_t)"client");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEBUG))
    {
      v16 = 136315138;
      v17 = a1 + 72;
      _os_log_debug_impl(&dword_1A3662000, (os_log_t)v4, OS_LOG_TYPE_DEBUG, "devfs && !AllowDevFS (%s)", (uint8_t *)&v16, 0xCu);
    }

    LOBYTE(v4) = 0;
  }
  v7 = strcmp("routefs", (const char *)(a1 + 72));
  if ((v2 & 0x20) == 0 && !v7)
  {
    CDGetLogHandle((uint64_t)"client");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEBUG))
    {
      v16 = 136315138;
      v17 = a1 + 72;
      _os_log_debug_impl(&dword_1A3662000, (os_log_t)v4, OS_LOG_TYPE_DEBUG, "routefs && !AllowRouteFS (%s)", (uint8_t *)&v16, 0xCu);
    }

    LOBYTE(v4) = 0;
  }
  if ((*(_BYTE *)(a1 + 2136) & 2) != 0)
  {
    CDGetLogHandle((uint64_t)"client");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEBUG))
    {
      v16 = 136315138;
      v17 = a1 + 72;
      _os_log_debug_impl(&dword_1A3662000, (os_log_t)v4, OS_LOG_TYPE_DEBUG, "FSKit: (%s)", (uint8_t *)&v16, 0xCu);
    }

    LOBYTE(v4) = 0;
  }
  v8 = *(_DWORD *)(a1 + 64);
  if ((v2 & 2) == 0 && (v8 & 1) != 0)
  {
    CDGetLogHandle((uint64_t)"client");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v16) = 0;
      _os_log_debug_impl(&dword_1A3662000, v9, OS_LOG_TYPE_DEBUG, "readonly && !AllowReadOnly", (uint8_t *)&v16, 2u);
    }

    LOBYTE(v4) = 0;
    v8 = *(_DWORD *)(a1 + 64);
  }
  if ((v2 & 4) == 0 && (v8 & 0x4000) != 0)
  {
    CDGetLogHandle((uint64_t)"client");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v16) = 0;
      _os_log_debug_impl(&dword_1A3662000, v10, OS_LOG_TYPE_DEBUG, "root_fs && !AllowRoot", (uint8_t *)&v16, 2u);
    }

    LOBYTE(v4) = 0;
    v8 = *(_DWORD *)(a1 + 64);
  }
  if ((v8 & 0x100000) != 0)
  {
    v11 = allowNoBrowse(a1);
    if ((v2 & 8) == 0 && (v11 & 1) == 0)
    {
      CDGetLogHandle((uint64_t)"client");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v16) = 0;
        _os_log_debug_impl(&dword_1A3662000, v12, OS_LOG_TYPE_DEBUG, "nobrowse && !AllowNoBrowse", (uint8_t *)&v16, 2u);
      }

      LOBYTE(v4) = 0;
    }
  }
  if ((v2 & 0x40) != 0 && (*(_DWORD *)(a1 + 64) & 0x4000) == 0)
  {
    CDGetLogHandle((uint64_t)"client");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v16) = 0;
      _os_log_debug_impl(&dword_1A3662000, v13, OS_LOG_TYPE_DEBUG, "!root_fs && OnlyRoot", (uint8_t *)&v16, 2u);
    }

    LOBYTE(v4) = 0;
  }
  if (v2 < 0 && (char *)(a1 + 88) != strstr((char *)(a1 + 88), "/private/var"))
  {
    CDGetLogHandle((uint64_t)"client");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v16) = 0;
      _os_log_debug_impl(&dword_1A3662000, v14, OS_LOG_TYPE_DEBUG, "Not Under private/var && only_under_private_var", (uint8_t *)&v16, 2u);
    }

    LOBYTE(v4) = 0;
  }
  return v4 & 1;
}

char *volRootFromPath(char *a1, char *a2)
{
  NSObject *v4;
  dev_t st_dev;
  int v6;
  NSObject *v7;
  NSObject *v8;
  char *i;
  int v11;
  char *v12;
  const char *v13;
  uint8_t *v14;
  char *v15;
  int *v16;
  char *v17;
  stat v18;
  statfs v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  memset(&v18, 0, sizeof(v18));
  if (volRootFromPath_rootDev == -1)
  {
    memset(&v19, 0, 144);
    if (stat("/private/var", (stat *)&v19) == -1)
    {
      CDGetLogHandle((uint64_t)"client");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v16 = __error();
        v17 = strerror(*v16);
        *(_DWORD *)buf = 136315394;
        v21 = "/private/var";
        v22 = 2080;
        v23 = v17;
        _os_log_error_impl(&dword_1A3662000, v4, OS_LOG_TYPE_ERROR, "stat failed for %s : %s", buf, 0x16u);
      }

    }
    else
    {
      volRootFromPath_rootDev = v19.f_bsize;
    }
  }
  if (!realpath_DARWIN_EXTSN(a1, a2))
  {
    memset(&v19, 0, 512);
    if (!statfs(a1, &v19))
    {
      strlcpy(a2, v19.f_mntonname, 0x400uLL);
      return a2;
    }
    v6 = *__error();
    CDGetLogHandle((uint64_t)"client");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v15 = strerror(v6);
      *(_DWORD *)buf = 136315394;
      v21 = a1;
      v22 = 2080;
      v23 = v15;
      v13 = "statfs %s (%s)";
      v14 = buf;
LABEL_30:
      _os_log_error_impl(&dword_1A3662000, v7, OS_LOG_TYPE_ERROR, v13, v14, 0x16u);
    }
LABEL_13:

    return 0;
  }
  if (lstat(a2, &v18) == -1)
  {
    CDGetLogHandle((uint64_t)"client");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v19.f_bsize = 136315138;
      *(_QWORD *)&v19.f_iosize = a2;
      _os_log_error_impl(&dword_1A3662000, v8, OS_LOG_TYPE_ERROR, "lstat %s", (uint8_t *)&v19, 0xCu);
    }

    return 0;
  }
  st_dev = v18.st_dev;
  if (v18.st_dev == volRootFromPath_rootDev)
  {
    strcpy(a2, "/private/var");
  }
  else
  {
    for (i = &a2[strlen(a2) - 1]; i > a2; --i)
    {
      if (*i == 47)
      {
        *i = 0;
        if (lstat(a2, &v18) == -1)
        {
          v11 = *__error();
          CDGetLogHandle((uint64_t)"client");
          v7 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
            goto LABEL_13;
          v12 = strerror(v11);
          v19.f_bsize = 136315394;
          *(_QWORD *)&v19.f_iosize = a1;
          WORD2(v19.f_blocks) = 2080;
          *(uint64_t *)((char *)&v19.f_blocks + 6) = (uint64_t)v12;
          v13 = "lstat %s (%s)";
          v14 = (uint8_t *)&v19;
          goto LABEL_30;
        }
        if (v18.st_dev != st_dev)
        {
          *i = 47;
          return a2;
        }
      }
    }
  }
  return a2;
}

uint64_t volumeUsed(const char *a1)
{
  NSObject *v2;
  NSObject *v4;
  unint64_t v5;
  uint32_t f_bsize;
  int *v7;
  char *v8;
  int *v9;
  char *v10;
  _BYTE v11[12];
  int v12;
  statfs v13;
  uint8_t v14[4];
  char *f_mntonname;
  __int16 v16;
  char *v17;
  _BYTE buf[24];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  memset(&v13, 0, 512);
  if (statfs(a1, &v13))
  {
    CDGetLogHandle((uint64_t)"client");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v7 = __error();
      v8 = strerror(*v7);
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = a1;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = v8;
      _os_log_error_impl(&dword_1A3662000, v2, OS_LOG_TYPE_ERROR, "CacheDeleteVolume volumeUsed(): statfs failed for %s : %s", buf, 0x16u);
    }

    return -1;
  }
  else
  {
    v12 = 0;
    if (!usedblks_blocksize)
      getbsize(&v12, &usedblks_blocksize);
    memset(v11, 0, sizeof(v11));
    *(_QWORD *)buf = 5;
    *(_QWORD *)&buf[8] = 2155872256;
    *(_QWORD *)&buf[16] = 0;
    if (getattrlist(v13.f_mntonname, buf, v11, 0xCuLL, 0))
    {
      CDGetLogHandle((uint64_t)"client");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v9 = __error();
        v10 = strerror(*v9);
        *(_DWORD *)v14 = 136315394;
        f_mntonname = v13.f_mntonname;
        v16 = 2080;
        v17 = v10;
        _os_log_error_impl(&dword_1A3662000, v4, OS_LOG_TYPE_ERROR, "CacheDeleteVolume usedBlks(): getattrlist failed for %s : %s", v14, 0x16u);
      }

      v5 = v13.f_blocks - v13.f_bfree;
      f_bsize = v13.f_bsize;
    }
    else
    {
      f_bsize = v13.f_bsize;
      if (v13.f_bsize)
        v5 = *(_QWORD *)&v11[4] / (unint64_t)v13.f_bsize;
      else
        v5 = *(_QWORD *)&v11[4] / (unint64_t)usedblks_blocksize;
    }
    return v5 * f_bsize;
  }
}

uint64_t allowNoBrowse(uint64_t a1)
{
  int v2;
  _BOOL8 v3;
  NSObject *v4;
  _BOOL4 v5;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!glinked_to_daemon)
    return 1;
  v2 = APFSVolumeRole();
  v3 = v2 == 0;
  CDGetLogHandle((uint64_t)"client");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v5)
    {
      *(_DWORD *)buf = 136315138;
      v8 = a1 + 88;
      _os_log_debug_impl(&dword_1A3662000, v4, OS_LOG_TYPE_DEBUG, "APFSVolumeRole error for %s", buf, 0xCu);
    }

  }
  else
  {
    if (v5)
    {
      *(_DWORD *)buf = 136315394;
      v8 = a1 + 88;
      v9 = 1024;
      v10 = 0;
      _os_log_debug_impl(&dword_1A3662000, v4, OS_LOG_TYPE_DEBUG, "%s role: %d", buf, 0x12u);
    }

    return 0;
  }
  return v3;
}

BOOL hasUserVolume()
{
  NSObject *v0;
  int *v4;
  char *v5;
  int v6;
  const char *v7;
  __int16 v8;
  char *v9;
  statfs v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  bzero(&v10, 0x878uLL);
  if (!statfs("/private/var/mobile", &v10))
    return *(_QWORD *)v10.f_mntonname == 0x657461766972702FLL
        && *(_QWORD *)&v10.f_mntonname[8] == 0x626F6D2F7261762FLL
        && *(_DWORD *)&v10.f_mntonname[16] == 6646889;
  CDGetLogHandle((uint64_t)"client");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    v4 = __error();
    v5 = strerror(*v4);
    v6 = 136315394;
    v7 = "/private/var/mobile";
    v8 = 2080;
    v9 = v5;
    _os_log_error_impl(&dword_1A3662000, v0, OS_LOG_TYPE_ERROR, "unable to stat volume: %s : %s", (uint8_t *)&v6, 0x16u);
  }

  return 0;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

id evaluateStringProperty(void *a1)
{
  id v1;
  id v2;
  NSObject *v3;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = v1;
  }
  else
  {
    CDGetLogHandle((uint64_t)"client");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v5 = 138412290;
      v6 = v1;
      _os_log_debug_impl(&dword_1A3662000, v3, OS_LOG_TYPE_DEBUG, "value %@ is not an NSString, returning nil", (uint8_t *)&v5, 0xCu);
    }

    v2 = 0;
  }

  return v2;
}

void sub_1A3668720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getSiblings(void *a1)
{
  id v1;
  void *v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  __int128 v21;
  id v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "mountPoint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  disk();
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  CDGetLogHandle((uint64_t)"client");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v23;
    _os_log_impl(&dword_1A3662000, v3, OS_LOG_TYPE_DEFAULT, "getSiblings: finding volumes that belong to %@ ", buf, 0xCu);
  }

  objc_msgSend(v1, "fsType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("apfs"));

  if (v5)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    getLocalVolumes();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v7)
    {
      v9 = v7;
      v10 = *(_QWORD *)v25;
      *(_QWORD *)&v8 = 138412546;
      v21 = v8;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v6);
          +[CacheDeleteVolume volumeWithMountpoint:](CacheDeleteVolume, "volumeWithMountpoint:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v11), v21);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v1)
          {
            objc_msgSend(v12, "mountPoint");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            disk();
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqualToString:", v23);

            if (v16)
            {
              CDGetLogHandle((uint64_t)"client");
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v13, "mountPoint");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "bsdName");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v21;
                v29 = v18;
                v30 = 2112;
                v31 = v19;
                _os_log_impl(&dword_1A3662000, v17, OS_LOG_TYPE_DEFAULT, "getSiblings: adding %@ %@ ", buf, 0x16u);

              }
              objc_msgSend(v22, "addObject:", v13);
            }
          }

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v9);
    }

  }
  return v22;
}

void getfsstat_b(int a1, void *a2)
{
  unsigned int (**v3)(id, uint64_t);
  int v4;
  int v5;
  statfs *v6;
  statfs *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t i;
  NSObject *v12;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  int v17;
  int *v18;
  char *v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  int v23;
  int *v24;
  char *v25;
  uint8_t buf[4];
  _DWORD v27[7];

  *(_QWORD *)&v27[5] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = getfsstat(0, 0, 2);
  if (v4 == -1)
  {
    CDGetLogHandle((uint64_t)"client");
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
LABEL_23:

      goto LABEL_28;
    }
    v17 = *__error();
    v18 = __error();
    v19 = strerror(*v18);
    *(_DWORD *)buf = 67109378;
    v27[0] = v17;
    LOWORD(v27[1]) = 2080;
    *(_QWORD *)((char *)&v27[1] + 2) = v19;
    v20 = "getfsstat returned error %d (%s)\n";
    v21 = v16;
    v22 = 18;
LABEL_30:
    _os_log_error_impl(&dword_1A3662000, v21, OS_LOG_TYPE_ERROR, v20, buf, v22);
    goto LABEL_23;
  }
  v5 = v4;
  v6 = (statfs *)malloc_type_malloc(2168 * v4, 0x100004087E0324AuLL);
  if (!v6)
  {
    CDGetLogHandle((uint64_t)"client");
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    *(_DWORD *)buf = 67109120;
    v27[0] = v5;
    v20 = "Failed to allocate list of %d mounts\n";
    v21 = v16;
    v22 = 8;
    goto LABEL_30;
  }
  v7 = v6;
  v8 = getfsstat(v6, 2168 * v5, 2);
  CDGetLogHandle((uint64_t)"client");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 == -1)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v23 = *__error();
      v24 = __error();
      v25 = strerror(*v24);
      *(_DWORD *)buf = 67109378;
      v27[0] = v23;
      LOWORD(v27[1]) = 2080;
      *(_QWORD *)((char *)&v27[1] + 2) = v25;
      _os_log_error_impl(&dword_1A3662000, v10, OS_LOG_TYPE_ERROR, "getfsstat returned error %d (%s)\n", buf, 0x12u);
    }

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      v27[0] = a1;
      _os_log_debug_impl(&dword_1A3662000, v10, OS_LOG_TYPE_DEBUG, "Enumerating mounts with flags 0x%08x", buf, 8u);
    }

    if (v8 >= 1)
    {
      for (i = 0; (int)i < v8; ++i)
      {
        CDGetLogHandle((uint64_t)"client");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)v27 = v7[i].f_mntonname;
          _os_log_debug_impl(&dword_1A3662000, v12, OS_LOG_TYPE_DEBUG, "Considering %s", buf, 0xCu);
        }

        v13 = filterVolumes((uint64_t)&v7[i], a1);
        CDGetLogHandle((uint64_t)"client");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
        if (v13)
        {
          if (v15)
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_1A3662000, v14, OS_LOG_TYPE_DEBUG, "Accepted", buf, 2u);
          }

          if (!v3[2](v3, (uint64_t)&v7[i]))
            break;
        }
        else
        {
          if (v15)
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_1A3662000, v14, OS_LOG_TYPE_DEBUG, "Rejected", buf, 2u);
          }

        }
      }
    }
  }
  free(v7);
LABEL_28:

}

uint64_t __getLocalVolumes_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v10[1024];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2 + 88;
  if (realpath_DARWIN_EXTSN((const char *)(a2 + 88), v10))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
LABEL_5:
    mapVolume(v5, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CacheDeleteVolume validateVolumeAtPath:](CacheDeleteVolume, "validateVolumeAtPath:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v4 = *(void **)(a1 + 32);
    v5 = v6;
    goto LABEL_5;
  }
LABEL_6:

  return 1;
}

id getLocalVolumes()
{
  void *v0;
  id v1;
  void *v2;
  _QWORD v4[4];
  id v5;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __getLocalVolumes_block_invoke;
  v4[3] = &unk_1E4A32D60;
  v5 = v0;
  v1 = v0;
  getfsstat_b(132, v4);
  objc_msgSend(v1, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id queryCache(void *a1, void *a2, int a3)
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  __CFString *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  NSObject *v48;
  void *v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t k;
  void *v55;
  NSObject *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  int v62;
  void *v63;
  int v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t m;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  uint64_t n;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t ii;
  uint64_t v96;
  void *v97;
  void *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v105;
  void *v106;
  id v107;
  id v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  id v114;
  void *v115;
  void *v116;
  void *v117;
  uint64_t v118;
  uint64_t v119;
  id v120;
  int v121;
  void *v122;
  char obj;
  id obja;
  void *v125;
  id v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  _BYTE v151[128];
  _QWORD v152[2];
  _QWORD v153[2];
  _BYTE v154[128];
  _BYTE v155[128];
  _BYTE v156[128];
  uint8_t v157[128];
  uint8_t buf[4];
  _BYTE v159[14];
  uint64_t v160;

  v160 = *MEMORY[0x1E0C80C00];
  v126 = a1;
  v5 = a2;
  evaluatePurgeableUrgency(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_IGNORE_SNAPSHOTS"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = evaluateBoolProperty(v7);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_DIAGNOSTIC_INFO"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = evaluateBoolProperty(v9);

  if (v10)
    v11 = (void *)objc_opt_new();
  else
    v11 = 0;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_TOTAL_PURGEABLE"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = evaluateBoolProperty(v12);

  if (v13)
  {
    if (a3 && (objc_msgSend(v126, "isStale") & 1) != 0)
    {
      v14 = 0;
LABEL_64:
      v18 = 0;
      v19 = 0;
      goto LABEL_137;
    }
    objc_msgSend(v126, "recentPurgeableTotals:", objc_msgSend(v6, "intValue"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v20;
    if (!v20)
    {
      v45 = 0;
LABEL_136:
      v18 = v45;
      v19 = v18;
      goto LABEL_137;
    }
    v112 = v6;
    v114 = v5;
    v109 = v11;
    if ((v8 & 1) == 0)
    {
      v21 = (void *)objc_msgSend(v20, "mutableCopy");
      v135 = 0u;
      v136 = 0u;
      v137 = 0u;
      v138 = 0u;
      v22 = v14;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v135, v155, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v136;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v136 != v25)
              objc_enumerationMutation(v22);
            v27 = *(_QWORD *)(*((_QWORD *)&v135 + 1) + 8 * i);
            if (objc_msgSend(v126, "hasSnapshotForVolume:", v27))
              objc_msgSend(v21, "setObject:forKeyedSubscript:", &unk_1E4A38DC0, v27);
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v135, v155, 16);
        }
        while (v24);
      }

      v14 = (void *)objc_msgSend(v21, "copy");
    }
    v125 = (void *)objc_opt_new();
    v28 = (id)objc_opt_new();
    v131 = 0u;
    v132 = 0u;
    v133 = 0u;
    v134 = 0u;
    v29 = v14;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v131, v154, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v132;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v132 != v32)
            objc_enumerationMutation(v29);
          v34 = *(_QWORD *)(*((_QWORD *)&v131 + 1) + 8 * j);
          objc_msgSend(v29, "objectForKeyedSubscript:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_AMOUNT"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v125, "setObject:forKeyedSubscript:", v36, v34);

          objc_msgSend(v126, "bsdDiskForVolume:", v34);
          v37 = objc_claimAutoreleasedReturnValue();
          if (v37)
            v38 = (__CFString *)v37;
          else
            v38 = CFSTR("unknown container");
          objc_msgSend(v28, "objectForKeyedSubscript:", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v39)
          {
            v39 = (void *)objc_opt_new();
            objc_msgSend(v28, "setObject:forKeyedSubscript:", v39, v38);
          }
          objc_msgSend(v29, "objectForKeyedSubscript:", v34);
          v40 = v29;
          v41 = v28;
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setObject:forKeyedSubscript:", v42, v34);

          v28 = v41;
          v29 = v40;

        }
        v31 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v131, v154, 16);
      }
      while (v31);
    }

    v152[0] = CFSTR("CACHE_DELETE_TOTAL_PURGEABLE");
    v43 = (void *)objc_msgSend(v125, "copy");
    v153[0] = v43;
    v152[1] = CFSTR("CACHE_DELETE_PURGEABLE_BY_CONTAINER");
    v44 = (void *)objc_msgSend(v28, "copy");
    v153[1] = v44;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v153, v152, 2);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v11 = v109;
    v6 = v112;
    goto LABEL_134;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[CacheDeleteVolume volumeWithMountpoint:](CacheDeleteVolume, "volumeWithMountpoint:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v115 = v16;
  objc_msgSend(v16, "mountPoint");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = objc_msgSend(v126, "isInvalidForVolume:", v17);

  if (!(_DWORD)v15)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_TOTAL_PURGEABLE_BY_VOLUME"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = evaluateBoolProperty(v46);

    if ((v47 & 1) != 0)
    {
      v29 = 0;
      v14 = v16;
    }
    else
    {
      v121 = a3;
      obj = v8;
      v110 = v11;
      getSiblings(v16);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      CDGetLogHandle((uint64_t)"client");
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A3662000, v50, OS_LOG_TYPE_DEFAULT, "multi volume:", buf, 2u);
      }

      v129 = 0u;
      v130 = 0u;
      v127 = 0u;
      v128 = 0u;
      v29 = v49;
      v51 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v127, v151, 16);
      if (v51)
      {
        v52 = v51;
        v53 = *(_QWORD *)v128;
        do
        {
          for (k = 0; k != v52; ++k)
          {
            if (*(_QWORD *)v128 != v53)
              objc_enumerationMutation(v29);
            v55 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * k);
            CDGetLogHandle((uint64_t)"client");
            v56 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v55, "mountPoint");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v159 = v57;
              _os_log_impl(&dword_1A3662000, v56, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

            }
          }
          v52 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v127, v151, 16);
        }
        while (v52);
      }

      if (v29)
      {
        v11 = v110;
        v14 = v115;
        v8 = obj;
        a3 = v121;
        if (objc_msgSend(v29, "count"))
        {
          v125 = 0;
          if (!v121)
            goto LABEL_65;
LABEL_62:
          objc_msgSend(v14, "mountPoint");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = objc_msgSend(v126, "isStaleForVolume:", v61);

          if (v62)
          {

            goto LABEL_64;
          }
LABEL_65:
          if ((v8 & 1) != 0
            || (objc_msgSend(v14, "mountPoint"),
                v63 = (void *)objc_claimAutoreleasedReturnValue(),
                v64 = objc_msgSend(v126, "hasSnapshotForVolume:", v63),
                v63,
                !v64))
          {
            objc_msgSend(v126, "recentInfoForVolumes:atUrgency:validateResults:targetVolume:", v29, objc_msgSend(v6, "intValue"), 1, v125);
            v28 = (id)objc_claimAutoreleasedReturnValue();
            if (!v28)
              goto LABEL_108;
          }
          else
          {
            CDGetLogHandle((uint64_t)"client");
            v65 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"));
              v105 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v159 = 277;
              *(_WORD *)&v159[4] = 2114;
              *(_QWORD *)&v159[6] = v105;
              _os_log_error_impl(&dword_1A3662000, v65, OS_LOG_TYPE_ERROR, "%d volume has snapshots on it. Setting total_available to zero: \"%{public}@\"", buf, 0x12u);

            }
            v28 = &unk_1E4A38E10;
          }
          if (objc_msgSend(v28, "count"))
          {
            objc_msgSend(v14, "mountPoint");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v126, "servicesForVolume:", v66);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = v28;
            v108 = v67;
            v114 = v5;
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_SERVICES"));
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v117 = (void *)objc_msgSend(v28, "mutableCopy");
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v68, "count"))
            {
              v106 = v66;
              v111 = v11;
              objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_ITEMIZED_NONPURGEABLE"));
              v116 = (void *)objc_claimAutoreleasedReturnValue();
              if (v116)
              {
                objc_msgSend(v117, "removeObjectForKey:", CFSTR("CACHE_DELETE_ITEMIZED_NONPURGEABLE"));
                objc_msgSend(v117, "removeObjectForKey:", CFSTR("CACHE_DELETE_NONPURGEABLE_AMOUNT"));
              }
              v149 = 0u;
              v150 = 0u;
              v147 = 0u;
              v148 = 0u;
              v107 = v28;
              obja = v28;
              v69 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v147, buf, 16);
              if (v69)
              {
                v70 = v69;
                v71 = *(_QWORD *)v148;
                do
                {
                  for (m = 0; m != v70; ++m)
                  {
                    if (*(_QWORD *)v148 != v71)
                      objc_enumerationMutation(obja);
                    v73 = *(void **)(*((_QWORD *)&v147 + 1) + 8 * m);
                    if ((objc_msgSend(v73, "hasPrefix:", CFSTR("CACHE_DELETE_")) & 1) == 0
                      && (objc_msgSend(v68, "containsObject:", v73) & 1) == 0)
                    {
                      objc_msgSend(v117, "removeObjectForKey:", v73);
                    }
                  }
                  v70 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v147, buf, 16);
                }
                while (v70);
              }
              v113 = v6;

              v145 = 0u;
              v146 = 0u;
              v143 = 0u;
              v144 = 0u;
              v120 = v108;
              v74 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v143, v157, 16);
              v122 = v68;
              if (v74)
              {
                v75 = v74;
                v118 = 0;
                v119 = 0;
                v76 = *(_QWORD *)v144;
                v78 = v116;
                v77 = v117;
                do
                {
                  for (n = 0; n != v75; ++n)
                  {
                    if (*(_QWORD *)v144 != v76)
                      objc_enumerationMutation(v120);
                    v80 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * n);
                    if (objc_msgSend(v68, "containsObject:", v80))
                    {
                      objc_msgSend(obja, "objectForKeyedSubscript:", v80);
                      v81 = (void *)objc_claimAutoreleasedReturnValue();
                      evaluateNumberProperty(v81);
                      v82 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v82
                        && (objc_msgSend(v80, "isEqualToString:", CFSTR("CACHE_DELETE_TOTAL_FSPURGEABLE")) & 1) == 0)
                      {
                        v119 += objc_msgSend(v82, "unsignedLongLongValue");
                      }
                      objc_msgSend(obja, "objectForKeyedSubscript:", v80);
                      v83 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v117, "setObject:forKeyedSubscript:", v83, v80);

                      objc_msgSend(v78, "objectForKeyedSubscript:", v80);
                      v84 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v84)
                      {
                        objc_msgSend(v117, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_ITEMIZED_NONPURGEABLE"));
                        v85 = (void *)objc_claimAutoreleasedReturnValue();
                        if (!v85)
                        {
                          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                          v85 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v117, "setObject:forKeyedSubscript:", v85, CFSTR("CACHE_DELETE_ITEMIZED_NONPURGEABLE"));
                        }
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v118 += objc_msgSend(v84, "unsignedLongLongValue");
                          objc_msgSend(v85, "setObject:forKeyedSubscript:", v84, v80);
                        }
                        else
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            tallyDict(v84);
                            v86 = (void *)objc_claimAutoreleasedReturnValue();
                            v118 += objc_msgSend(v86, "unsignedLongLongValue");
                            objc_msgSend(v85, "setObject:forKeyedSubscript:", v84, v80);

                            v78 = v116;
                          }
                        }

                        v68 = v122;
                      }

                    }
                    else
                    {
                      objc_msgSend(v117, "removeObjectForKey:", v80);
                    }
                  }
                  v75 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v143, v157, 16);
                }
                while (v75);
              }
              else
              {
                v118 = 0;
                v119 = 0;
                v77 = v117;
              }

              objc_msgSend(obja, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_TOTAL_FSPURGEABLE"));
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              evaluateNumberProperty(v88);
              v89 = (void *)objc_claimAutoreleasedReturnValue();

              if (v89)
              {
                objc_msgSend(v77, "setObject:forKeyedSubscript:", v89, CFSTR("CACHE_DELETE_TOTAL_FSPURGEABLE"));
                v6 = v113;
                if (objc_msgSend(v68, "containsObject:", CFSTR("com.apple.deleted_helper")))
                {
                  v141 = 0u;
                  v142 = 0u;
                  v139 = 0u;
                  v140 = 0u;
                  fsPurgeableTypeToServiceMap();
                  v90 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v90, "allValues");
                  v91 = (void *)objc_claimAutoreleasedReturnValue();

                  v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v139, v156, 16);
                  if (v92)
                  {
                    v93 = v92;
                    v94 = *(_QWORD *)v140;
                    do
                    {
                      for (ii = 0; ii != v93; ++ii)
                      {
                        if (*(_QWORD *)v140 != v94)
                          objc_enumerationMutation(v91);
                        v96 = *(_QWORD *)(*((_QWORD *)&v139 + 1) + 8 * ii);
                        if (objc_msgSend(v122, "containsObject:", v96))
                        {
                          objc_msgSend(obja, "objectForKeyedSubscript:", v96);
                          v97 = (void *)objc_claimAutoreleasedReturnValue();
                          evaluateNumberProperty(v97);
                          v98 = (void *)objc_claimAutoreleasedReturnValue();

                          if (v98)
                            v119 -= objc_msgSend(v98, "unsignedLongLongValue");

                        }
                      }
                      v93 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v139, v156, 16);
                    }
                    while (v93);
                  }

                  v99 = objc_msgSend(v89, "unsignedLongLongValue") + v119;
                  v6 = v113;
                  v14 = v115;
                  v68 = v122;
                }
                else
                {
                  v14 = v115;
                  v99 = v119;
                }
              }
              else
              {
                v14 = v115;
                v99 = v119;
                v6 = v113;
              }
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v99);
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v117, "setObject:forKeyedSubscript:", v100, CFSTR("CACHE_DELETE_TOTAL_AVAILABLE"));

              if (v118)
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
                v101 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v117, "setObject:forKeyedSubscript:", v101, CFSTR("CACHE_DELETE_NONPURGEABLE_AMOUNT"));

              }
              v11 = v111;
              v66 = v106;
              v28 = v107;
            }

            v44 = (void *)objc_msgSend(v117, "mutableCopy");
            objc_msgSend(v14, "mountPoint");
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "setObject:forKeyedSubscript:", v102, CFSTR("CACHE_DELETE_VOLUME"));

            if (v14)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v14, "freespace"));
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "setObject:forKeyedSubscript:", v103, CFSTR("CACHE_DELETE_FREESPACE"));

            }
            if (v11)
            {
              objc_msgSend(v11, "setObject:forKeyedSubscript:", v28, CFSTR("CACHE_DELETE_PURGEABLE_RESULT_CACHE"));
              objc_msgSend(v44, "setObject:forKeyedSubscript:", v11, CFSTR("CACHE_DELETE_DIAGNOSTIC_INFO"));
            }
            v45 = (void *)objc_msgSend(v44, "copy");
            v43 = v117;
LABEL_134:

            v5 = v114;
            goto LABEL_135;
          }
LABEL_108:
          v45 = 0;
LABEL_135:

          goto LABEL_136;
        }
      }
      else
      {
        v11 = v110;
        v14 = v115;
        v8 = obj;
        a3 = v121;
      }
    }
    CDGetLogHandle((uint64_t)"client");
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v14, "mountPoint");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v159 = v59;
      _os_log_impl(&dword_1A3662000, v58, OS_LOG_TYPE_DEFAULT, "single volume %@", buf, 0xCu);

      v14 = v115;
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v14);
    v60 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "mountPoint");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (id)v60;
    if (!a3)
      goto LABEL_65;
    goto LABEL_62;
  }
  if (a3 && (objc_msgSend(v126, "isStale") & 1) != 0)
  {
    v18 = 0;
    v19 = 0;
    v14 = v115;
  }
  else
  {
    CDGetLogHandle((uint64_t)"client");
    v48 = objc_claimAutoreleasedReturnValue();
    v14 = v16;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"));
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v159 = v87;
      _os_log_error_impl(&dword_1A3662000, v48, OS_LOG_TYPE_ERROR, "unable to validate volume \"%{public}@\"", buf, 0xCu);

    }
    v18 = 0;
    v19 = &unk_1E4A38DE8;
  }
LABEL_137:

  return v19;
}

uint64_t evaluateBoolProperty(void *a1)
{
  id v1;
  uint64_t v2;
  NSObject *v3;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = objc_msgSend(v1, "BOOLValue");
  }
  else
  {
    CDGetLogHandle((uint64_t)"client");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v5 = 138412290;
      v6 = v1;
      _os_log_debug_impl(&dword_1A3662000, v3, OS_LOG_TYPE_DEBUG, "value %@ is not an NSNumber(Bool), returning false", (uint8_t *)&v5, 0xCu);
    }

    v2 = 0;
  }

  return v2;
}

uint64_t connectionIsEntitled(void *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  _xpc_connection_s *v20;
  pid_t pid;
  int v22;
  NSObject *v23;
  _BOOL4 v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[4];
  uint8_t *v34;
  __int16 v35;
  pid_t v36;
  uint8_t buf[4];
  NSObject *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  CDGetLogHandle((uint64_t)"client");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    signingIdForConnection(v3);
    v6 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v38 = v6;
    _os_log_impl(&dword_1A3662000, v5, OS_LOG_TYPE_DEFAULT, "connectionIsEntitled, signing ID: %{public}@", buf, 0xCu);

  }
  if (-[NSObject count](v4, "count"))
  {
    objc_msgSend(v3, "valueForEntitlement:", CFSTR("com.apple.mobile.deleted.AllowFreeSpace"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(v3, "valueForEntitlement:", CFSTR("com.apple.private.CacheDelete"));
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9 && -[NSObject count](v9, "count"))
      {
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v11 = v4;
        v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v30;
          while (2)
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v30 != v14)
                objc_enumerationMutation(v11);
              v16 = *(NSObject **)(*((_QWORD *)&v29 + 1) + 8 * i);
              if ((-[NSObject containsObject:](v10, "containsObject:", v16, (_QWORD)v29) & 1) == 0)
              {
                CDGetLogHandle((uint64_t)"client");
                v17 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v38 = v16;
                  _os_log_error_impl(&dword_1A3662000, v17, OS_LOG_TYPE_ERROR, "Connection is not entitled for %@!", buf, 0xCu);
                }

                CDGetLogHandle((uint64_t)"client");
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v38 = v10;
                  _os_log_error_impl(&dword_1A3662000, v18, OS_LOG_TYPE_ERROR, "connection entitlements: %@", buf, 0xCu);
                }

                CDGetLogHandle((uint64_t)"client");
                v19 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v38 = v11;
                  _os_log_error_impl(&dword_1A3662000, v19, OS_LOG_TYPE_ERROR, "required entitlements: %@", buf, 0xCu);
                }

                goto LABEL_26;
              }
            }
            v13 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
            if (v13)
              continue;
            break;
          }
        }

        v8 = 1;
        goto LABEL_31;
      }
      CDGetLogHandle((uint64_t)"client");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v4;
        _os_log_error_impl(&dword_1A3662000, v11, OS_LOG_TYPE_ERROR, "Connection is not entitled, required entitlements: %@", buf, 0xCu);
      }
LABEL_26:

      bzero(buf, 0x401uLL);
      objc_msgSend(v3, "_xpcConnection");
      v20 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      pid = xpc_connection_get_pid(v20);
      v22 = proc_pidpath(pid, buf, 0x401u);
      CDGetLogHandle((uint64_t)"client");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
      if (v22 < 0)
      {
        if (v24)
        {
          *(_DWORD *)v33 = 67109120;
          LODWORD(v34) = pid;
          v25 = "Calling process id: %d";
          v26 = v23;
          v27 = 8;
          goto LABEL_34;
        }
      }
      else if (v24)
      {
        *(_DWORD *)v33 = 136315394;
        v34 = buf;
        v35 = 1024;
        v36 = pid;
        v25 = "Calling process: %s, id: %d";
        v26 = v23;
        v27 = 18;
LABEL_34:
        _os_log_error_impl(&dword_1A3662000, v26, OS_LOG_TYPE_ERROR, v25, v33, v27);
      }

      v8 = 0;
LABEL_31:

      goto LABEL_32;
    }
  }
  v8 = 1;
LABEL_32:

  return v8;
}

char *signingIdForConnection(void *a1)
{
  id v1;
  void *v2;
  id v3;
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  void *v7;
  char *v8;
  NSObject *v9;
  int *v10;
  char *v11;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = v1;
    *(_QWORD *)&v4 = -1;
    *((_QWORD *)&v4 + 1) = -1;
    v13 = v4;
    v14 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v5 = -1;
    *((_QWORD *)&v5 + 1) = -1;
    v13 = v5;
    v14 = v5;
    if (!v3)
    {
      CDGetLogHandle((uint64_t)"client");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A3662000, v9, OS_LOG_TYPE_ERROR, "signingIdForConnection Parameter error, missing connection", buf, 2u);
      }
      v3 = 0;
      goto LABEL_12;
    }
  }
  objc_msgSend(v3, "auditToken", v13, v14);
  v6 = xpc_copy_code_signing_identity_for_token();
  if (!v6)
  {
    CDGetLogHandle((uint64_t)"client");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = __error();
      v11 = strerror(*v10);
      *(_DWORD *)buf = 136446210;
      v16 = v11;
      _os_log_error_impl(&dword_1A3662000, v9, OS_LOG_TYPE_ERROR, "signingIdForConnection Unable to obtain signing ID from audit token : %{public}s", buf, 0xCu);
    }
LABEL_12:
    v8 = 0;
    goto LABEL_13;
  }
  v7 = (void *)v6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
  v8 = (char *)objc_claimAutoreleasedReturnValue();
  free(v7);
  CDGetLogHandle((uint64_t)"client");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v8;
    _os_log_impl(&dword_1A3662000, v9, OS_LOG_TYPE_DEFAULT, "signingIdForConnection, code_signing_id: %{public}@", buf, 0xCu);
  }
LABEL_13:

  return v8;
}

void sub_1A366BBFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t volumeLowDiskState(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  int v6;

  v6 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[CacheDeleteVolume validateVolumeAtPath:](CacheDeleteVolume, "validateVolumeAtPath:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2
    && (v3 = objc_retainAutorelease(v2),
        !fsctl((const char *)objc_msgSend(v3, "fileSystemRepresentation"), 0x40046818uLL, &v6, 0)))
  {
    if ((v6 & 0x200) != 0)
    {
      v4 = 5;
    }
    else if ((v6 & 4) != 0)
    {
      v4 = 4;
    }
    else if ((v6 & 0x2000) != 0)
    {
      v4 = 3;
    }
    else if (volumeFreespace((const char *)objc_msgSend(objc_retainAutorelease(v3), "fileSystemRepresentation")) >> 23 >= 0x99)
    {
      v4 = 1;
    }
    else
    {
      v4 = 2;
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void sub_1A366BE28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A366BF68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A366C04C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id callingProcessName()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  processNameForConnection(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id processNameForConnection(void *a1)
{
  id v1;
  uint64_t pid;
  _xpc_connection_s *v3;
  void *v4;
  _OWORD buffer[16];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  memset(buffer, 0, sizeof(buffer));
  v1 = a1;
  pid = getpid();
  objc_msgSend(v1, "_xpcConnection");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();

  if (v3)
    pid = xpc_connection_get_pid(v3);
  if (proc_name(pid, buffer, 0x100u) < 0)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), pid);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), buffer);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id recentlyUsedAppsDictionary()
{
  uint64_t v0;
  void *v1;
  id v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *context;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  id v23;
  uint8_t v24[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1A8591C18]();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dateByAddingTimeInterval:", -2419200.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_opt_new();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __recentlyUsedAppsDictionaryWithDates_block_invoke;
  v22[3] = &unk_1E4A33210;
  v2 = v1;
  v23 = v2;
  v15 = (void *)v0;
  +[CacheDeleteAppInFocus subscribeToAppInFocusStreamBeginning:callback:](CacheDeleteAppInFocus, "subscribeToAppInFocusStreamBeginning:callback:", v0, v22);
  CDGetLogHandle((uint64_t)"client");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(v2, "count");
    *(_DWORD *)buf = 134217984;
    v29 = v4;
    _os_log_impl(&dword_1A3662000, v3, OS_LOG_TYPE_DEFAULT, "recentlyUsedAppsDictionaryWithDates (Biome) %lu results:", buf, 0xCu);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v2;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, buf, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        CDGetLogHandle((uint64_t)"client");
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v24 = 138412546;
          v25 = v10;
          v26 = 2112;
          v27 = v12;
          _os_log_impl(&dword_1A3662000, v11, OS_LOG_TYPE_DEFAULT, "\t%@ : %@", v24, 0x16u);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, buf, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(v5, "copy");
  objc_autoreleasePoolPop(context);
  return v13;
}

uint64_t __recentlyUsedAppsDictionaryWithDates_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0C99D68];
  v4 = a2;
  objc_msgSend(v4, "timestamp");
  objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v4, "eventBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "bundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v8);

  return 1;
}

BOOL validateTimestamp(void *a1, double a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  _BOOL8 v7;

  v3 = a1;
  v7 = 0;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v3);
    v6 = v5;

    if (v6 < a2)
      v7 = 1;
  }

  return v7;
}

BOOL validateFreespace(void *a1, void *a2, void *a3, unint64_t *a4)
{
  char *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int v16;
  unint64_t v17;
  _BOOL8 v18;
  NSObject *v19;
  const char *v20;
  int v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  unint64_t v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  int v32;
  __int16 v33;
  unint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  +[CacheDeleteVolume volumeWithPath:](CacheDeleteVolume, "volumeWithPath:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 && v8 && v10)
  {
    v12 = objc_msgSend(v10, "freespace");
    v13 = objc_msgSend(v8, "unsignedLongLongValue");
    v14 = objc_msgSend(v9, "unsignedLongLongValue");
    v15 = v14;
    if (v12 <= v13)
      v16 = 118;
    else
      v16 = 94;
    v22 = v16;
    if (v12 <= v13)
      v17 = v13 - v12;
    else
      v17 = v12 - v13;
    v18 = v17 < v14;
    if (a4)
      *a4 = v12;
    CDGetLogHandle((uint64_t)"client");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v20 = "NO";
      *(_DWORD *)buf = 136316418;
      if (v17 < v15)
        v20 = "YES";
      v24 = v20;
      v25 = 2048;
      v26 = v13;
      v27 = 2048;
      v28 = v12;
      v29 = 2048;
      v30 = v15;
      v31 = 1024;
      v32 = v22;
      v33 = 2048;
      v34 = v17;
      _os_log_debug_impl(&dword_1A3662000, v19, OS_LOG_TYPE_DEBUG, "returning: %s, freespace: %llu, cur_freespace: %llu, threshold: %llu, difference(%c): %llu", buf, 0x3Au);
    }
  }
  else
  {
    CDGetLogHandle((uint64_t)"client");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v24 = v7;
      v25 = 2112;
      v26 = (unint64_t)v8;
      v27 = 2112;
      v28 = (unint64_t)v9;
      _os_log_error_impl(&dword_1A3662000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter: volume: %@, freespace: %@, threshold: %@", buf, 0x20u);
    }
    v18 = 0;
  }

  return v18;
}

uint64_t nuke_dir(const char *a1, int a2)
{
  _removefile_state *v4;
  _removefile_state *v5;
  removefile_flags_t v6;
  NSObject *v7;
  int *v9;
  char *v10;
  int v11;
  const char *v12;
  __int16 v13;
  char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = removefile_state_alloc();
  v5 = v4;
  if (a2)
    v6 = 515;
  else
    v6 = 513;
  removefile_state_set(v4, 3u, removefile_error_callback);
  if (removefile(a1, v5, v6))
  {
    CDGetLogHandle((uint64_t)"client");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = __error();
      v10 = strerror(*v9);
      v11 = 136446466;
      v12 = a1;
      v13 = 2082;
      v14 = v10;
      _os_log_error_impl(&dword_1A3662000, v7, OS_LOG_TYPE_ERROR, "nuke_dir: removefile error for %{public}s : %{public}s", (uint8_t *)&v11, 0x16u);
    }

  }
  return removefile_state_free(v5);
}

id VolUUID(const char *a1)
{
  NSObject *v2;
  int *v4;
  char *v5;
  _QWORD v6[3];
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  uint64_t v11;
  _QWORD v12[2];
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v12[0] = 0;
  v13 = 0;
  v12[1] = 0;
  v6[2] = 0;
  v6[0] = 5;
  v6[1] = 2147747328;
  if (!getattrlist(a1, v6, &v11, 0x1CuLL, 0))
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", (char *)v12 + 4);
  CDGetLogHandle((uint64_t)"client");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = __error();
    v5 = strerror(*v4);
    *(_DWORD *)buf = 136315394;
    v8 = a1;
    v9 = 2080;
    v10 = v5;
    _os_log_error_impl(&dword_1A3662000, v2, OS_LOG_TYPE_ERROR, "getattrlist failed for %s : %s", buf, 0x16u);
  }

  return 0;
}

void sub_1A366DCF4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, __int128 buf)
{
  id v11;
  NSObject *v12;
  void *v13;

  if (a2 == 1)
  {
    v11 = objc_begin_catch(exception_object);
    CDGetLogHandle((uint64_t)"client");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412546;
      *(_QWORD *)((char *)&buf + 4) = v13;
      WORD6(buf) = 2080;
      *(_QWORD *)((char *)&buf + 14) = "CACHE_DELETE_CACHED_PUSHING_SERVICES";
      _os_log_impl(&dword_1A3662000, v12, OS_LOG_TYPE_DEFAULT, "Exception (%@). Could not decode value for %s", (uint8_t *)&buf, 0x16u);

    }
    objc_end_catch();
    JUMPOUT(0x1A366DBF0);
  }
  _Unwind_Resume(exception_object);
}

void sub_1A366E410(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int buf, uint64_t a16, __int16 a17, uint64_t a18)
{
  char v18;

  if ((v18 & 1) != 0)
    objc_end_catch();
  _Unwind_Resume(exception_object);
}

uint64_t CacheDeleteRegisterInfoCallbacksForProcess(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  return _CacheDeleteRegisterInfoCallbacksForProcess(a1, a2, a3, a4, a5, 0, &unk_1E4A38E38);
}

uint64_t CacheDeleteRegisterInfoCallbacks(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  return _CacheDeleteRegister(a1, a2, a3, a4, a5, 0, 0, 0);
}

uint64_t removefile_error_callback(int a1, char *a2)
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  int *v6;
  char *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  NSObject *v11;
  int *v12;
  char *v13;
  int *v15;
  char *v16;
  stat v17;
  uint8_t buf[4];
  _BYTE v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  memset(&v17, 0, sizeof(v17));
  if (stat(a2, &v17))
  {
    CDGetLogHandle((uint64_t)"client");
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
LABEL_3:

      v4 = 1;
      goto LABEL_9;
    }
    v15 = __error();
    v16 = strerror(*v15);
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)v19 = a2;
    *(_WORD *)&v19[8] = 2080;
    *(_QWORD *)&v19[10] = v16;
    v8 = "removefile_error_callback stat failed for %s : %s";
    v9 = v3;
    v10 = 22;
LABEL_13:
    _os_log_error_impl(&dword_1A3662000, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
    goto LABEL_3;
  }
  if ((~v17.st_mode & 0x140) != 0 && chmod(a2, v17.st_mode | 0x140))
  {
    CDGetLogHandle((uint64_t)"client");
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      goto LABEL_3;
    v5 = v17.st_mode | 0x100;
    v6 = __error();
    v7 = strerror(*v6);
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v19 = v5;
    *(_WORD *)&v19[4] = 2080;
    *(_QWORD *)&v19[6] = a2;
    *(_WORD *)&v19[14] = 2080;
    *(_QWORD *)&v19[16] = v7;
    v8 = "chmod 0x%04x for %s failed: %s";
    v9 = v3;
    v10 = 28;
    goto LABEL_13;
  }
  v4 = 0;
LABEL_9:
  CDGetLogHandle((uint64_t)"client");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = __error();
    v13 = strerror(*v12);
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)v19 = v13;
    *(_WORD *)&v19[8] = 1024;
    *(_DWORD *)&v19[10] = v4;
    *(_WORD *)&v19[14] = 2080;
    *(_QWORD *)&v19[16] = a2;
    _os_log_impl(&dword_1A3662000, v11, OS_LOG_TYPE_DEFAULT, "removefile_error_callback got: %s, returning: %d for %s", buf, 0x1Cu);
  }

  return v4;
}

void __cdVolumeThresholdsForMountPoint_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.cache_delete_cdVolumeThresholds", 0);
  v1 = (void *)qword_1ECE242D0;
  qword_1ECE242D0 = (uint64_t)v0;

}

uint64_t CacheDeleteUserManagedAssetsPurgeable(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t buf[16];

  v1 = (void *)objc_msgSend(a1, "copy");
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CacheDeleteVolume validateVolumeAtPath:](CacheDeleteVolume, "validateVolumeAtPath:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v3, CFSTR("CACHE_DELETE_PURGE_USER_MANAGED_ASSETS"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = CacheDeleteGetSetting((uint64_t)v4);
    if (v5)
      v6 = v5;
    else
      v6 = *MEMORY[0x1E0C9AE50];
  }
  else
  {
    v6 = *MEMORY[0x1E0C9AE40];
    CDGetLogHandle((uint64_t)"client");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A3662000, v4, OS_LOG_TYPE_ERROR, "CacheDeletePurgeUserManagedAssets parameter error: Missing volume name", buf, 2u);
    }
  }

  return v6;
}

uint64_t CacheDeleteGetSetting(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __CacheDeleteGetSetting_block_invoke;
  v3[3] = &unk_1E4A32A08;
  v3[4] = &v4;
  v3[5] = a1;
  CallCacheD(v3, 0);
  v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A366F014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id CacheDeleteCopyItemizedPurgeableSpaceWithInfo(void *a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  __CFString *v6;
  int v7;
  void *v8;
  NSObject *v9;
  const __CFString *v10;
  uint64_t v11;
  uint64_t *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  const __CFString *v20;
  uint64_t v21;
  id v22;
  _QWORD v24[5];
  _QWORD v25[4];
  id v26;
  _QWORD *v27;
  uint64_t *v28;
  _QWORD v29[5];
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  const __CFString *v37;
  id v38;
  uint8_t buf[4];
  const __CFString *v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__0;
  v35 = __Block_byref_object_dispose__0;
  v36 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__0;
  v29[4] = __Block_byref_object_dispose__0;
  v30 = 0;
  v2 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_TOTAL_PURGEABLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = evaluateBoolProperty(v3);

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CacheDeleteVolume validateVolumeAtPath:](CacheDeleteVolume, "validateVolumeAtPath:", v5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = 1;
  else
    v7 = v4;
  if (v7 == 1)
  {
    if (v6)
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("CACHE_DELETE_VOLUME"));
    clientCachedResults(v2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      CDGetLogHandle((uint64_t)"client");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = CFSTR("unknown!!");
        if (v6)
          v10 = v6;
        v11 = v32[5];
        if (v4)
          v10 = CFSTR("all volumes");
        *(_DWORD *)buf = 138543618;
        v40 = v10;
        v41 = 2114;
        v42 = v11;
        _os_log_impl(&dword_1A3662000, v9, OS_LOG_TYPE_DEFAULT, "CacheDeleteCopyItemizedPurgeableSpaceWithInfo local cache result for %{public}@ : %{public}@", buf, 0x16u);
      }

      v12 = v32;
      v13 = v8;
      v14 = (void *)v12[5];
      v12[5] = (uint64_t)v13;
    }
    else
    {
      v18 = MEMORY[0x1E0C809B0];
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __CacheDeleteCopyItemizedPurgeableSpaceWithInfo_block_invoke;
      v25[3] = &unk_1E4A327D8;
      v26 = v2;
      v27 = v29;
      v28 = &v31;
      v24[0] = v18;
      v24[1] = 3221225472;
      v24[2] = __CacheDeleteCopyItemizedPurgeableSpaceWithInfo_block_invoke_3;
      v24[3] = &unk_1E4A324F8;
      v24[4] = &v31;
      CallCacheD(v25, v24);
      v13 = 0;
      v14 = v26;
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("Bad volume: %@"), v16);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    v37 = CFSTR("CACHE_DELETE_ERROR");
    v38 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
    v17 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v32[5];
    v32[5] = v17;
  }

  CDGetLogHandle((uint64_t)"client");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = CFSTR("unknown!!");
    if (v6)
      v20 = v6;
    v21 = v32[5];
    if (v4)
      v20 = CFSTR("all volumes");
    *(_DWORD *)buf = 138543618;
    v40 = v20;
    v41 = 2112;
    v42 = v21;
    _os_log_impl(&dword_1A3662000, v19, OS_LOG_TYPE_DEFAULT, "CacheDeleteCopyItemizedPurgeableSpaceWithInfo result for %{public}@ : %@{public}", buf, 0x16u);
  }

  v22 = (id)v32[5];
  _Block_object_dispose(v29, 8);

  _Block_object_dispose(&v31, 8);
  return v22;
}

void sub_1A366F3E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

BOOL CallCacheD(void *a1, void *a2)
{
  return CallBlockWithProxy(CFSTR("com.apple.cache_delete"), &unk_1EE6C9E90, a1, a2);
}

BOOL CallBlockWithProxy(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void (**v20)(id, void *);
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  _BOOL8 v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  char *v35;
  __int128 v36;
  id obj;
  void (**v38)(id, void *);
  id v39;
  NSObject *queue;
  void (**v41)(id, void *);
  _QWORD block[6];
  _QWORD v43[4];
  NSObject *v44;
  id v45;
  id v46;
  void (**v47)(id, void *);
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  char v55;
  _BYTE buf[24];
  char v57;
  uint64_t v58;
  void *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v39 = a2;
  v38 = a3;
  v41 = a4;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v55 = 0;
  queue = dispatch_queue_create("CallBlockWithProxy_response", 0);
  v8 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 501);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayWithObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v10;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
  if (v11)
  {
    v13 = *(_QWORD *)v49;
    *(_QWORD *)&v12 = 138543362;
    v36 = v12;
    while (2)
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v49 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v14);
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", v7, 0);
        if (!v16)
        {
          v26 = *__error();
          CDGetLogHandle((uint64_t)"client");
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            v35 = strerror(v26);
            *(_DWORD *)buf = 136315138;
            *(_QWORD *)&buf[4] = v35;
            _os_log_error_impl(&dword_1A3662000, v27, OS_LOG_TYPE_ERROR, "initWithMachServiceName failed %s", buf, 0xCu);
          }

          CDGetLogHandle((uint64_t)"client");
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v7;
            _os_log_error_impl(&dword_1A3662000, v28, OS_LOG_TYPE_ERROR, "FAILED to get a connection to %@", buf, 0xCu);
          }

          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v26, 0);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (void *)MEMORY[0x1E0CB35C8];
          v58 = *MEMORY[0x1E0CB3388];
          v59 = v29;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("CacheDeleteErrorDomain"), 6, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (v41)
          {
            CDGetLogHandle((uint64_t)"client");
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v36;
              *(_QWORD *)&buf[4] = v7;
              _os_log_error_impl(&dword_1A3662000, v33, OS_LOG_TYPE_ERROR, "CallBlockWithProxy unable to make a connection to: %{public}@", buf, 0xCu);
            }

            v41[2](v41, v32);
          }

          v25 = 0;
          goto LABEL_30;
        }
        CDGetLogHandle((uint64_t)"client");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v15;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v7;
          _os_log_debug_impl(&dword_1A3662000, v17, OS_LOG_TYPE_DEBUG, "got a connection for uid %@, service: %@", buf, 0x16u);
        }

        objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", v39);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setRemoteObjectInterface:", v18);

        objc_msgSend(v16, "resume");
        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = __CallBlockWithProxy_block_invoke;
        v43[3] = &unk_1E4A32EB0;
        v44 = queue;
        v19 = v16;
        v45 = v19;
        v20 = v41;
        v47 = v20;
        v46 = v7;
        objc_msgSend(v19, "synchronousRemoteObjectProxyWithErrorHandler:", v43);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          CDGetLogHandle((uint64_t)"client");
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v21;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v7;
            _os_log_debug_impl(&dword_1A3662000, v22, OS_LOG_TYPE_DEBUG, "got proxy: %@ for service: %@", buf, 0x16u);
          }

          v38[2](v38, v21);
          *((_BYTE *)v53 + 24) = 1;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CacheDeleteErrorDomain"), 6, 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v41)
          {
            CDGetLogHandle((uint64_t)"client");
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v36;
              *(_QWORD *)&buf[4] = v7;
              _os_log_error_impl(&dword_1A3662000, v24, OS_LOG_TYPE_ERROR, "CallBlockWithProxy unable to get a proxy from connection to %{public}@", buf, 0xCu);
            }

            v41[2](v20, v23);
          }

        }
        objc_msgSend(v19, "invalidate", v36);

        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
      if (v11)
        continue;
      break;
    }
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v57 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __CallBlockWithProxy_block_invoke_219;
  block[3] = &unk_1E4A32ED8;
  block[4] = buf;
  block[5] = &v52;
  dispatch_sync(queue, block);
  v25 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;
  _Block_object_dispose(buf, 8);
LABEL_30:

  _Block_object_dispose(&v52, 8);
  return v25;
}

void sub_1A366FAFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

id clientCachedResults(void *a1)
{
  id v1;
  uint64_t v2;
  NSObject *v3;
  id v4;
  id v5;
  _QWORD block[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v1 = a1;
  v2 = mach_absolute_time();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  if (_MergedGlobals_1 != -1)
    dispatch_once(&_MergedGlobals_1, &__block_literal_global_0);
  v3 = qword_1ECE241F0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __clientCachedResults_block_invoke_2;
  block[3] = &unk_1E4A32460;
  v8 = v1;
  v9 = &v11;
  v10 = v2;
  v4 = v1;
  dispatch_sync(v3, block);
  v5 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v5;
}

uint64_t CacheDeleteRegisterExtensionCallbacks(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char isKindOfClass;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  int v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (!v13)
  {
    CDGetLogHandle((uint64_t)"client");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v29) = 0;
      v25 = "missing required serviceInfo parameter";
LABEL_14:
      v26 = v24;
      v27 = 2;
      goto LABEL_15;
    }
LABEL_16:

    v23 = 0xFFFFFFFFLL;
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    CDGetLogHandle((uint64_t)"client");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v29 = 138412290;
      v30 = v13;
      v25 = "serviceInfo is NOT of class CacheDeleteServiceInfo: %@";
      v26 = v24;
      v27 = 12;
LABEL_15:
      _os_log_error_impl(&dword_1A3662000, v26, OS_LOG_TYPE_ERROR, v25, (uint8_t *)&v29, v27);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  objc_msgSend(v13, "extensionContext");
  v19 = objc_claimAutoreleasedReturnValue();
  if (!v19
    || (v20 = (void *)v19,
        objc_msgSend(v13, "extensionContext"),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v21,
        v20,
        (isKindOfClass & 1) == 0))
  {
    CDGetLogHandle((uint64_t)"client");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v29) = 0;
      v25 = "missing required Extension Context in serviceInfo";
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  objc_msgSend(0, "setObject:forKeyedSubscript:", v13, CFSTR("CACHE_DELETE_SERVICE_INFO"));
  if ((objc_msgSend(v13, "doNotQuery") & 1) != 0)
    objc_msgSend(0, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("CACHE_DELETE_DO_NOT_QUERY"));
  v23 = _CacheDeleteRegister(a1, v14, v15, v16, v17, v18, 0, 0);
LABEL_17:

  return v23;
}

uint64_t _CacheDeleteRegisterInfoCallbacksForProcess(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint32_t v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  int *v33;
  char *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  uint64_t *v44;
  uint64_t v45;
  unsigned __int8 *v46;
  uint64_t v47;
  char v48;
  int out_token;
  uint8_t buf[4];
  char *v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  int v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  out_token = 0;
  v45 = 0;
  v46 = (unsigned __int8 *)&v45;
  v47 = 0x2020000000;
  v48 = 0;
  v19 = a1;
  dispatch_get_global_queue(21, 0);
  v20 = objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = ___CacheDeleteRegisterInfoCallbacksForProcess_block_invoke;
  v35[3] = &unk_1E4A32AE0;
  v44 = &v45;
  v21 = v19;
  v36 = v21;
  v22 = v13;
  v38 = v22;
  v23 = v14;
  v39 = v23;
  v24 = v15;
  v40 = v24;
  v25 = v16;
  v41 = v25;
  v26 = v17;
  v42 = v26;
  v43 = 0;
  v27 = v18;
  v37 = v27;
  v28 = notify_register_dispatch("com.apple.cache_delete.launched", &out_token, v20, v35);

  if (v28)
  {
    CDGetLogHandle((uint64_t)"client");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v33 = __error();
      v34 = strerror(*v33);
      *(_DWORD *)buf = 136315138;
      v51 = v34;
      _os_log_error_impl(&dword_1A3662000, v29, OS_LOG_TYPE_ERROR, "notify_register_dispatch failed: %s", buf, 0xCu);
    }

  }
  atomic_store(1u, v46 + 24);
  v30 = _CacheDeleteRegister(v21, v22, v23, v24, v25, v26, 0, v27);
  atomic_store(0, v46 + 24);
  CDGetLogHandle((uint64_t)"client");
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v51 = (char *)v21;
    v52 = 2082;
    v53 = "_Anonymous";
    v54 = 1024;
    v55 = v30;
    _os_log_impl(&dword_1A3662000, v31, OS_LOG_TYPE_DEFAULT, "_CacheDeleteRegisterInfoCallbacksForProcess: Registered %{public}@%{public}s, result: %d", buf, 0x1Cu);
  }

  _Block_object_dispose(&v45, 8);
  return v30;
}

void sub_1A36702EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _CacheDeleteRegister(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  id v32;
  void *v33;
  _BOOL4 v34;
  void *v35;
  char isKindOfClass;
  NSObject *v37;
  int v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  _QWORD v49[4];
  id v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t *v53;
  _QWORD block[4];
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  uint64_t *v63;
  uint64_t *v64;
  __int128 *v65;
  id v66;
  char v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  int v83;
  uint8_t buf[4];
  id v85;
  __int16 v86;
  int v87;
  __int128 v88;
  uint64_t v89;
  uint64_t (*v90)(uint64_t, uint64_t);
  void (*v91)(uint64_t);
  id v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v48 = a2;
  v47 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v80 = 0;
  v81 = &v80;
  v82 = 0x2020000000;
  v83 = -1;
  v74 = 0;
  v75 = &v74;
  v76 = 0x3032000000;
  v77 = __Block_byref_object_copy__0;
  v78 = __Block_byref_object_dispose__0;
  v79 = 0;
  v46 = a8;
  v68 = 0;
  v69 = &v68;
  v70 = 0x3032000000;
  v71 = __Block_byref_object_copy__0;
  v72 = __Block_byref_object_dispose__0;
  v73 = 0;
  v19 = a1;
  if (qword_1ECE24220 != -1)
    dispatch_once(&qword_1ECE24220, &__block_literal_global_184);
  if (v48 || v47 || v15 || v16 || v17 || (v20 = v18) != 0)
  {
    if (v46)
    {
      objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("ANON"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_NOTIFICATIONS"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v23 && objc_msgSend(v23, "containsObject:", CFSTR("CACHE_DELETE_PURGE_NOTIFICATION")))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%s"), v19, "_Anonymous");
        v25 = objc_claimAutoreleasedReturnValue();

        v19 = (id)v25;
      }
      v44 = v24;
      if (v45)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v26 = objc_msgSend(v45, "BOOLValue");
          v27 = v17;
          v28 = v16;
          v29 = v15;
          goto LABEL_24;
        }
        v27 = v17;
        v28 = v16;
        v29 = v15;
LABEL_23:
        v26 = 0;
LABEL_24:
        *(_QWORD *)&v88 = 0;
        *((_QWORD *)&v88 + 1) = &v88;
        v89 = 0x3032000000;
        v90 = __Block_byref_object_copy__0;
        v91 = __Block_byref_object_dispose__0;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v92 = (id)objc_claimAutoreleasedReturnValue();
        v30 = _MergedGlobals_2;
        v31 = MEMORY[0x1E0C809B0];
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = ___CacheDeleteRegister_block_invoke_189;
        block[3] = &unk_1E4A32A70;
        v63 = &v68;
        v19 = v19;
        v55 = v19;
        v67 = v26;
        v32 = v46;
        v56 = v32;
        v64 = &v74;
        v57 = v48;
        v58 = v47;
        v65 = &v88;
        v15 = v29;
        v59 = v29;
        v16 = v28;
        v60 = v28;
        v17 = v27;
        v61 = v27;
        v20 = v18;
        v62 = v18;
        v66 = v32;
        dispatch_sync(v30, block);
        if (v26)
        {
          if (v69[5])
          {
            objc_msgSend((id)v75[5], "addEntriesFromDictionary:", v32);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v88 + 1) + 40), "count"))
            {
              objc_msgSend((id)v75[5], "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_SERVICES"));
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = v33 == 0;

              if (v34)
                objc_msgSend((id)v75[5], "setObject:forKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v88 + 1) + 40), CFSTR("CACHE_DELETE_SERVICES"));
            }
            objc_msgSend((id)v69[5], "endpoint");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) == 0)
            {
              CDGetLogHandle((uint64_t)"client");
              v39 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl(&dword_1A3662000, v39, OS_LOG_TYPE_ERROR, "listener.endpoint is not a NSListenerEndpoint!", buf, 2u);
              }

              CDGetLogHandle((uint64_t)"client");
              v37 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend((id)v69[5], "endpoint");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v85 = v40;
                _os_log_error_impl(&dword_1A3662000, v37, OS_LOG_TYPE_ERROR, "listener.endpoint: %@", buf, 0xCu);

              }
              goto LABEL_43;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              CDGetLogHandle((uint64_t)"client");
              v41 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl(&dword_1A3662000, v41, OS_LOG_TYPE_ERROR, "checkinInfo is not a NSDictionary!", buf, 2u);
              }

              CDGetLogHandle((uint64_t)"client");
              v37 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              {
                v43 = (void *)v75[5];
                *(_DWORD *)buf = 138412290;
                v85 = v43;
                _os_log_error_impl(&dword_1A3662000, v37, OS_LOG_TYPE_ERROR, "checkinInfo: %@", buf, 0xCu);
              }
              goto LABEL_43;
            }
            v49[0] = v31;
            v49[1] = 3221225472;
            v49[2] = ___CacheDeleteRegister_block_invoke_210;
            v49[3] = &unk_1E4A327B0;
            v50 = v19;
            v51 = &v68;
            v52 = &v74;
            v53 = &v80;
            CallCacheD(v49, &__block_literal_global_214);

          }
        }
        else
        {
          *((_DWORD *)v81 + 6) = 0;
        }
        CDGetLogHandle((uint64_t)"client");
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          v38 = *((_DWORD *)v81 + 6);
          *(_DWORD *)buf = 138543618;
          v85 = v19;
          v86 = 1024;
          v87 = v38;
          _os_log_impl(&dword_1A3662000, v37, OS_LOG_TYPE_DEFAULT, "Registered: %{public}@, result: %d", buf, 0x12u);
        }
LABEL_43:

        v22 = *((unsigned int *)v81 + 6);
        _Block_object_dispose(&v88, 8);

        goto LABEL_44;
      }
      v27 = v17;
      v28 = v16;
      v29 = v15;
    }
    else
    {
      v27 = v17;
      v28 = v16;
      v29 = v15;
      v44 = 0;
    }
    v45 = 0;
    goto LABEL_23;
  }
  CDGetLogHandle((uint64_t)"client");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    LODWORD(v88) = 138412290;
    *(_QWORD *)((char *)&v88 + 4) = v19;
    _os_log_error_impl(&dword_1A3662000, v21, OS_LOG_TYPE_ERROR, "CacheDelete does not allow registration with all NULL callbacks. Registration of (%@) failed.", (uint8_t *)&v88, 0xCu);
  }

  v44 = 0;
  v45 = 0;
  v22 = *((unsigned int *)v81 + 6);
LABEL_44:

  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v74, 8);

  _Block_object_dispose(&v80, 8);
  return v22;
}

void sub_1A3670AC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
  uint64_t v47;

  _Block_object_dispose((const void *)(v47 - 176), 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose((const void *)(v47 - 240), 8);
  _Unwind_Resume(a1);
}

void CacheManagementEnumerateAssets(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a1;
  v5 = a2;
  v6 = a3;
  getRootVolume();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (v7)
    {
      +[CacheDeleteVolume volumeWithPath:](CacheDeleteVolume, "volumeWithPath:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      enumerateUserManagedAssetsOnVolume(v8, v9, 0, v5, v6);
LABEL_6:

    }
  }
  else if (v7)
  {
    +[CacheDeleteVolume volumeWithPath:](CacheDeleteVolume, "volumeWithPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    enumerateAllAppsOnVolume(v8, v5, v6);
    goto LABEL_6;
  }

}

__CFString *getRootVolume()
{
  return mapVolume(CFSTR("/"), 0);
}

void enumerateUserManagedAssetsOnVolume(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  NSObject *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  _QWORD v48[4];
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[4];
  id v55;
  id v56;
  id v57;
  uint8_t v58[128];
  uint8_t buf[4];
  uint64_t v60;
  __int16 v61;
  id v62;
  __int16 v63;
  uint64_t v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  CDGetLogHandle((uint64_t)"client");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v60 = (uint64_t)v10;
    v61 = 2114;
    v62 = v12;
    _os_log_impl(&dword_1A3662000, v14, OS_LOG_TYPE_DEFAULT, "enumerateUserManagedAssets ENTRY, id: %{public}@, filter: %{public}@", buf, 0x16u);
  }

  v15 = (void *)objc_opt_new();
  nonContainerForID((uint64_t)v10);
  v47 = objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __enumerateUserManagedAssetsOnVolume_block_invoke;
  v54[3] = &unk_1E4A325C0;
  v17 = v10;
  v55 = v17;
  v46 = v12;
  v56 = v46;
  v45 = v13;
  v57 = v45;
  v18 = (void *)MEMORY[0x1A8591D98](v54);
  if (v11)
    v19 = objc_msgSend(objc_retainAutorelease(v11), "fileSystemRepresentation");
  else
    v19 = containerUserManagedAssetsPath(objc_msgSend(objc_retainAutorelease(v17), "UTF8String"), 0);
  v20 = (void *)v19;
  v21 = 0x1E0CB3000uLL;
  if (v19)
  {
    v22 = v15;
    CDGetLogHandle((uint64_t)"client");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "mountPoint");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v60 = (uint64_t)v24;
      v61 = 2080;
      v62 = v20;
      _os_log_impl(&dword_1A3662000, v23, OS_LOG_TYPE_DEFAULT, "Volume: %@, asset path: %s", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v20);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mountPoint");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "hasPrefix:", v26);

    v15 = v22;
    v28 = (void *)v47;
    if (v27)
    {
      CDGetLogHandle((uint64_t)"client");
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v60 = (uint64_t)v17;
        v61 = 2080;
        v62 = v20;
        _os_log_impl(&dword_1A3662000, v29, OS_LOG_TYPE_DEFAULT, "adding asset path: %@ : %s", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v20);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v30);

    }
    v21 = 0x1E0CB3000;
    if (!v47)
      goto LABEL_19;
    goto LABEL_16;
  }
  v28 = (void *)v47;
  if (v47)
  {
LABEL_16:
    CDGetLogHandle((uint64_t)"client");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = objc_msgSend(objc_retainAutorelease(v28), "fileSystemRepresentation");
      *(_DWORD *)buf = 136446210;
      v60 = v32;
      _os_log_impl(&dword_1A3662000, v31, OS_LOG_TYPE_DEFAULT, "adding non-container path: %{public}s", buf, 0xCu);
    }

    objc_msgSend(*(id *)(v21 + 2368), "stringWithUTF8String:", objc_msgSend(objc_retainAutorelease(v28), "fileSystemRepresentation"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v33);

LABEL_19:
    v42 = v20;
    v43 = v17;
    v44 = v9;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v34 = v15;
    v35 = v15;
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v37; ++i)
        {
          if (*(_QWORD *)v51 != v38)
            objc_enumerationMutation(v35);
          v40 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          v48[0] = v16;
          v48[1] = 3221225472;
          v48[2] = __enumerateUserManagedAssetsOnVolume_block_invoke_23;
          v48[3] = &unk_1E4A32610;
          v49 = v18;
          traverse_dir_with_state(v40, 0, 0, v48);

        }
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      }
      while (v37);
    }

    v9 = v44;
    v15 = v34;
    v17 = v43;
    v28 = (void *)v47;
    if (!v11 && v42)
      free(v42);
    goto LABEL_32;
  }
  CDGetLogHandle((uint64_t)"client");
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543874;
    v60 = (uint64_t)v17;
    v61 = 2114;
    v62 = 0;
    v63 = 2082;
    v64 = 0;
    _os_log_error_impl(&dword_1A3662000, v41, OS_LOG_TYPE_ERROR, "enumerateUserManagedAssets failed to find UserManagedAssets directory for %{public}@, nonContainer: %{public}@, container: %{public}s", buf, 0x20u);
  }

LABEL_32:
}

uint64_t containerUserManagedAssetsPath(uint64_t a1, int a2)
{
  if (a2)
    container_create_or_lookup_user_managed_assets_relative_path();
  else
    container_create_or_lookup_user_managed_assets_path();
  return 0;
}

uint64_t traverse_dir_with_state(void *a1, void *a2, _BYTE *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void (**v10)(id, char *, _BYTE *);
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char *v15;
  int v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  int v20;
  __n128 v21;
  int v22;
  int v23;
  unsigned int *v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  int *v29;
  void (**v30)(id, char *, _BYTE *);
  const char *v31;
  int v32;
  int v33;
  timespec v34;
  __n128 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  _BOOL4 v42;
  int v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  NSObject *v52;
  NSObject *v53;
  char *v54;
  int *v55;
  char *v56;
  char *v57;
  NSObject *v58;
  NSObject *v59;
  int *v60;
  char *v61;
  int *v62;
  char *v63;
  uint64_t v64;
  void *v66;
  _BYTE *v67;
  uint64_t v68;
  id v69;
  void *context;
  os_log_t log;
  uint64_t v72;
  uint64_t v73;
  int v74;
  unsigned int *v75;
  void *v76;
  int v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  __n128 v81;
  timespec v82;
  stat v83;
  unint64_t v84;
  int v85;
  uint64_t v86;
  int v87;
  _BYTE buf[22];
  _BYTE __str[32];
  __n128 v90;
  timespec st_mtimespec;
  __n128 v92;
  uint8_t v93[32];
  __int128 v94;
  timespec v95;
  __n128 v96;
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v9 = v7;
  v69 = v8;
  v10 = a4;
  if (v7)
  {
    if (a3)
      *a3 = 0;
    v67 = a3;
    v11 = v69;
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3868]), "initWithOptions:", 2);
    if (!v11)
      v11 = objc_opt_new();
    log = v11;
    v84 = 0xA200140900000005;
    v85 = 0;
    v86 = 0x500000002;
    v87 = 512;
    v75 = (unsigned int *)malloc_type_malloc(0x8000uLL, 0x8EF073D7uLL);
    objc_msgSend(v12, "addPointer:", strdup((const char *)objc_msgSend(objc_retainAutorelease(v9), "fileSystemRepresentation")));
    if (!objc_msgSend(v12, "count"))
    {
      v13 = 0;
      v64 = 0;
      goto LABEL_119;
    }
    v66 = v9;
    v13 = 0;
    v72 = 0;
    v68 = 0;
    v76 = v12;
    while (1)
    {
      v14 = (void *)MEMORY[0x1A8591C18]();
      memset(&v83, 0, sizeof(v83));
      v15 = (char *)objc_msgSend(v12, "pointerAtIndex:", 0);
      objc_msgSend(v12, "removePointerAtIndex:", 0);
      v16 = open(v15, 256);
      if (v16 < 0)
      {
        st_mtimespec = (timespec)0;
        v92 = 0u;
        *(_OWORD *)&__str[16] = 0u;
        v90 = 0u;
        *(_OWORD *)__str = 0u;
        *(_DWORD *)&__str[16] = *__error();
        CDGetLogHandle((uint64_t)"client");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          v57 = strerror(*(int *)&__str[16]);
          *(_DWORD *)v93 = 136315394;
          *(_QWORD *)&v93[4] = v15;
          *(_WORD *)&v93[12] = 2080;
          *(_QWORD *)&v93[14] = v57;
          _os_log_debug_impl(&dword_1A3662000, v19, OS_LOG_TYPE_DEBUG, "Failed to open directory %s : %s", v93, 0x16u);
        }

        if (v10)
          v10[2](v10, v15, __str);
        goto LABEL_95;
      }
      v17 = v16;
      if (fstat(v16, &v83))
        break;
      v20 = v83.st_mode & 0xF000;
      v21 = 0uLL;
      if (v20 != 40960 && v20 != 0x8000)
      {
        if (v20 == 0x4000)
        {
          v78 = v14;
          v79 = 0;
          v77 = v17;
          while (1)
          {
            context = (void *)MEMORY[0x1A8591C18](v21);
            v22 = getattrlistbulk(v17, &v84, v75, 0x8000uLL, 0);
            if (v22 == -1)
            {
              CDGetLogHandle((uint64_t)"client");
              v59 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
              {
                v62 = __error();
                v63 = strerror(*v62);
                *(_DWORD *)__str = 134218498;
                *(_QWORD *)&__str[4] = v79;
                *(_WORD *)&__str[12] = 2080;
                *(_QWORD *)&__str[14] = v15;
                *(_WORD *)&__str[22] = 2080;
                *(_QWORD *)&__str[24] = v63;
                _os_log_error_impl(&dword_1A3662000, v59, OS_LOG_TYPE_ERROR, "getattrlistbulk on entry %llu in %s returned error %s", __str, 0x20u);
              }

LABEL_110:
              objc_autoreleasePoolPop(context);
              goto LABEL_90;
            }
            v23 = v22;
            if (!v22)
              goto LABEL_110;
            v73 = v13;
            v24 = v75;
            if (v22 >= 1)
              break;
LABEL_84:
            objc_autoreleasePoolPop(context);
            v12 = v76;
            v13 = v73;
          }
          while (2)
          {
            v82 = (timespec)0;
            v81 = 0uLL;
            v25 = v24[1];
            v26 = v24[3];
            v27 = v24[4];
            v28 = v24[5];
            if ((v25 & 0x20000000) != 0)
            {
              if (v24[6])
              {
                CDGetLogHandle((uint64_t)"client");
                v58 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
                {
                  v60 = __error();
                  v61 = strerror(*v60);
                  *(_DWORD *)__str = 136315650;
                  *(_QWORD *)&__str[4] = v61;
                  *(_WORD *)&__str[12] = 2048;
                  *(_QWORD *)&__str[14] = v79;
                  *(_WORD *)&__str[22] = 2080;
                  *(_QWORD *)&__str[24] = v15;
                  _os_log_error_impl(&dword_1A3662000, v58, OS_LOG_TYPE_ERROR, "Got error %s while processing entry %llu in %s", __str, 0x20u);
                }

                v12 = v76;
                v13 = v73;
                goto LABEL_110;
              }
              v29 = (int *)(v24 + 7);
            }
            else
            {
              v29 = (int *)(v24 + 6);
            }
            v30 = v10;
            if ((v25 & 1) != 0)
            {
              v31 = (char *)v29 + *v29;
              v29 += 2;
              if ((v25 & 8) == 0)
                goto LABEL_34;
LABEL_31:
              v33 = *v29++;
              v32 = v33;
              if ((v25 & 0x400) != 0)
              {
LABEL_35:
                v34 = *(timespec *)v29;
                v29 += 4;
                v82 = v34;
              }
            }
            else
            {
              v31 = 0;
              if ((v25 & 8) != 0)
                goto LABEL_31;
LABEL_34:
              v32 = 0;
              if ((v25 & 0x400) != 0)
                goto LABEL_35;
            }
            if ((v25 & 0x1000) != 0)
            {
              v35 = *(__n128 *)v29;
              v29 += 4;
              v81 = v35;
            }
            if ((v25 & 0x2000000) != 0)
            {
              v37 = *(_QWORD *)v29;
              v29 += 2;
              v36 = v37;
              if (!v31)
              {
LABEL_99:
                CDGetLogHandle((uint64_t)"client");
                v53 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)__str = 134218242;
                  *(_QWORD *)&__str[4] = v79;
                  *(_WORD *)&__str[12] = 2080;
                  *(_QWORD *)&__str[14] = v15;
                  _os_log_error_impl(&dword_1A3662000, v53, OS_LOG_TYPE_ERROR, "Failed to get name for item %llu in %s; not counting it or its children\n",
                    __str,
                    0x16u);
                }

                v10 = v30;
                v12 = v76;
                v13 = v73;
                v14 = v78;
                v17 = v77;
                goto LABEL_110;
              }
            }
            else
            {
              v36 = 0;
              if (!v31)
                goto LABEL_99;
            }
            v80 = *v24;
            if (v32 == 2)
            {
              *(_QWORD *)v93 = 0;
              asprintf((char **)v93, "%s/%s", v15, v31);
              if ((v26 & 2) == 0)
              {
                v10 = v30;
                goto LABEL_45;
              }
              v10 = v30;
              if (!v30 && !*v29)
              {
                free(*(void **)v93);
                v17 = v77;
                goto LABEL_81;
              }
LABEL_45:
              v17 = v77;
              if (v10)
              {
                memset(__str, 0, 24);
                v90 = 0u;
                __str[0] = 1;
                st_mtimespec = v82;
                v92 = v81;
                *(_QWORD *)&__str[24] = v36;
                if (!((unsigned int (*)(id, _QWORD, _BYTE *))v10[2])(v10, *(_QWORD *)v93, __str))
                {
                  free(*(void **)v93);
LABEL_106:
                  v12 = v76;
                  v13 = v73;
                  v14 = v78;
                  goto LABEL_110;
                }
                v38 = v79;
                if (__str[1])
                  objc_msgSend(v76, "addPointer:", *(_QWORD *)v93);
                else
                  free(*(void **)v93);
LABEL_82:
                v79 = v38 + 1;
LABEL_83:
                v24 = (unsigned int *)((char *)v24 + v80);
                --v23;
                v14 = v78;
                if (!v23)
                  goto LABEL_84;
                continue;
              }
              objc_msgSend(v76, "addPointer:", *(_QWORD *)v93);
              goto LABEL_81;
            }
            break;
          }
          v95 = (timespec)0;
          v96 = 0uLL;
          v94 = 0uLL;
          memset(v93, 0, sizeof(v93));
          bzero(__str, 0x400uLL);
          if ((v27 & 1) != 0)
          {
            v43 = *v29++;
            v39 = v43;
            if ((v27 & 4) == 0)
              goto LABEL_57;
LABEL_51:
            v41 = *(_QWORD *)v29;
            v29 += 2;
            v40 = v41;
            if ((v28 & 0x200) != 0)
              goto LABEL_52;
LABEL_58:
            v42 = 1;
          }
          else
          {
            v39 = 0;
            if ((v27 & 4) != 0)
              goto LABEL_51;
LABEL_57:
            v40 = 0;
            if ((v28 & 0x200) == 0)
              goto LABEL_58;
LABEL_52:
            v42 = (*(_BYTE *)v29 & 8) == 0;
          }
          if (snprintf(__str, 0x400uLL, "%s/%s", v15, v31) >= 1024)
          {
            CDGetLogHandle((uint64_t)"client");
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = v15;
              *(_WORD *)&buf[12] = 2080;
              *(_QWORD *)&buf[14] = v31;
              _os_log_error_impl(&dword_1A3662000, v44, OS_LOG_TYPE_ERROR, "path too long: %s/%s", buf, 0x16u);
            }

            v10 = v30;
            v17 = v77;
            goto LABEL_83;
          }
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = 0;
          fsctl(__str, 0x40104A0EuLL, buf, 0);
          v94 = *(_OWORD *)buf;
          v45 = *(_QWORD *)buf;
          v46 = (v39 - 1);
          v74 = v39;
          if (v39 == 1)
          {
            if (*(_QWORD *)buf)
            {
              v47 = v40;
            }
            else
            {
              v47 = v40;
              if (v42)
                v50 = v40;
              else
                v50 = 0;
              v73 += v50;
            }
          }
          else
          {
            v47 = v40;
            if ((-[NSObject containsIndex:](log, "containsIndex:", v36) & 1) != 0)
            {
              v48 = v72 - 1;
            }
            else
            {
              if (v45 == 0 && v42)
                v49 = v40;
              else
                v49 = 0;
              v68 += v49;
              -[NSObject addIndex:](log, "addIndex:", v36);
              v48 = v72 + v46;
            }
            v72 = v48;
          }
          v10 = v30;
          v17 = v77;
          if (v10)
          {
            *(_QWORD *)&v93[8] = v47;
            v95 = v82;
            v96 = v81;
            *(_DWORD *)&v93[20] = v74;
            *(_QWORD *)&v93[24] = v36;
            if (!((unsigned int (*)(id, _BYTE *, uint8_t *))v10[2])(v10, __str, v93))
              goto LABEL_106;
          }
LABEL_81:
          v38 = v79;
          goto LABEL_82;
        }
        CDGetLogHandle((uint64_t)"client");
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)__str = 136315138;
          *(_QWORD *)&__str[4] = v15;
          _os_log_debug_impl(&dword_1A3662000, v51, OS_LOG_TYPE_DEBUG, "%s is not a file, link or directory, skipping.", __str, 0xCu);
        }

        v21 = 0uLL;
      }
      *(_QWORD *)__str = v21.n128_u64[0];
      *(_DWORD *)&__str[20] = v21.n128_u32[1];
      v92 = v21;
      v90 = v21;
      v13 += v83.st_blocks << 9;
      *(_QWORD *)&__str[8] = v13;
      *(_DWORD *)&__str[16] = 20;
      st_mtimespec = v83.st_mtimespec;
      *(_QWORD *)&__str[24] = v83.st_ino;
      if (v10)
        goto LABEL_89;
LABEL_90:
      if (fcntl(v17, 84))
      {
        CDGetLogHandle((uint64_t)"client");
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          v55 = __error();
          v56 = strerror(*v55);
          *(_DWORD *)__str = 136315394;
          *(_QWORD *)&__str[4] = v15;
          *(_WORD *)&__str[12] = 2080;
          *(_QWORD *)&__str[14] = v56;
          _os_log_error_impl(&dword_1A3662000, v52, OS_LOG_TYPE_ERROR, "Unable to recycle fd for %s: %s", __str, 0x16u);
        }

      }
      close(v17);
LABEL_95:
      if (v15)
        free(v15);
      objc_autoreleasePoolPop(v14);
      if (!objc_msgSend(v12, "count"))
      {
        if (v72)
        {
          v9 = v66;
          if (v67)
            *v67 = 1;
          goto LABEL_120;
        }
        v9 = v66;
        v64 = v68;
LABEL_119:
        v13 += v64;
LABEL_120:
        free(v75);

        goto LABEL_121;
      }
    }
    st_mtimespec = (timespec)0;
    v92 = 0u;
    *(_OWORD *)&__str[16] = 0u;
    v90 = 0u;
    *(_OWORD *)__str = 0u;
    *(_DWORD *)&__str[16] = *__error();
    CDGetLogHandle((uint64_t)"client");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v54 = strerror(*(int *)&__str[16]);
      *(_DWORD *)v93 = 136315394;
      *(_QWORD *)&v93[4] = v15;
      *(_WORD *)&v93[12] = 2080;
      *(_QWORD *)&v93[14] = v54;
      _os_log_debug_impl(&dword_1A3662000, v18, OS_LOG_TYPE_DEBUG, "fstat failed for %s : %s", v93, 0x16u);
    }

    if (!v10)
      goto LABEL_90;
LABEL_89:
    v10[2](v10, v15, __str);
    goto LABEL_90;
  }
  CDGetLogHandle((uint64_t)"client");
  log = (os_log_t)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)__str = 0;
    _os_log_error_impl(&dword_1A3662000, log, OS_LOG_TYPE_ERROR, "path is nil", __str, 2u);
  }
  v13 = 0;
LABEL_121:

  return v13;
}

id fetchAllPersonas()
{
  void *v0;
  void *v1;
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[8];
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (objc_opt_class())
  {
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "listAllPersonaWithAttributes");
    v1 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v1, "count"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v1)
    {
      CDGetLogHandle((uint64_t)"client");
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A3662000, v3, OS_LOG_TYPE_ERROR, "Did not get a persona attributes list from UserManagement", buf, 2u);
      }

    }
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = v1;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend(v9, "userPersonaUniqueString", (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
            objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, v10);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v6);
    }

  }
  else
  {
    v2 = 0;
  }
  v11 = (void *)objc_msgSend(v2, "copy", (_QWORD)v13);

  return v11;
}

uint64_t __enumerateAllAppsOnVolume_block_invoke_2(id *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  void *v18;

  v3 = a2;
  if ((objc_msgSend(v3, "isPlugin") & 1) == 0)
  {
    objc_msgSend(v3, "identifier");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      objc_msgSend(v3, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      nonContainerForID((uint64_t)v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        objc_msgSend(v3, "userManagedAssetsURL");
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          v11 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v3, "userManagedAssetsURL");
          v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          objc_msgSend(v11, "stringWithUTF8String:", objc_msgSend(v12, "fileSystemRepresentation"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[4], "mountPoint");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "hasPrefix:", v14);

          if (v15)
          {
            v16 = a1[4];
            objc_msgSend(v3, "identifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "userManagedAssetsURL");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            enumerateUserManagedAssetsOnVolume(v16, v17, v18, a1[5], a1[6]);

          }
        }
      }
    }
  }

  return 1;
}

id nonContainerForID(uint64_t a1)
{
  void *v1;

  if (objc_msgSend(&unk_1E4A38A58, "containsObject:", a1))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/private/var/mobile/Media/Downloads/com.apple.UserManagedAssets"), 1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = 0;
  }
  return v1;
}

void enumerateAllAppsOnVolume(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __enumerateAllAppsOnVolume_block_invoke;
  v15[3] = &unk_1E4A32570;
  v9 = v7;
  v16 = v9;
  enumerateUserManagedAssetsOnVolume(v5, CFSTR("com.apple.nonContainerUserManagedAssets"), 0, v6, v15);
  if (objc_opt_class())
  {
    v10 = (void *)MEMORY[0x1A8591C18]();
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __enumerateAllAppsOnVolume_block_invoke_2;
    v11[3] = &unk_1E4A32598;
    v12 = v5;
    v13 = v6;
    v14 = v9;
    +[AppCache enumerateAppCachesOnVolume:options:telemetry:block:](AppCache, "enumerateAppCachesOnVolume:options:telemetry:block:", v12, 2, 0, v11);

    objc_autoreleasePoolPop(v10);
  }

}

void __clientCachedResults_block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[6];
  char v6;
  _QWORD v7[5];
  id v8;
  _QWORD v9[5];
  id v10;
  int out_token;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.cache_delete.purgeable_cache", v0);
  v2 = (void *)qword_1ECE241F0;
  qword_1ECE241F0 = (uint64_t)v1;

  +[CDPurgeableResultCache sharedPurgeableResultsCache](CDPurgeableResultCache, "sharedPurgeableResultsCache");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ECE241F8;
  qword_1ECE241F8 = v3;

  out_token = 0;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy_;
  v9[4] = __Block_byref_object_dispose_;
  v10 = 0;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy_;
  v7[4] = __Block_byref_object_dispose_;
  v8 = 0;
  if (qword_1ECE24200 != -1)
    dispatch_once(&qword_1ECE24200, &__block_literal_global_30);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = ___registerPurgeableUpdates_block_invoke_2;
  v5[3] = &unk_1E4A32520;
  v6 = 1;
  v5[4] = v9;
  v5[5] = v7;
  notify_register_dispatch("CACHE_DELETE_PURGEABLE_UPDATED", &out_token, (dispatch_queue_t)qword_1ECE24208, v5);
  _Block_object_dispose(v7, 8);

  _Block_object_dispose(v9, 8);
}

void sub_1A367366C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v8 - 72), 8);
  _Unwind_Resume(a1);
}

id daemonCachedResults(void *a1, void *a2)
{
  id v3;
  id v4;
  double v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v26;
  _QWORD v27[2];
  _QWORD v28[2];
  uint8_t buf[4];
  int v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = (double)mach_absolute_time();
  if (*(double *)&gTimebaseConversion * (v5 - (double)(unint64_t)daemonCachedResults_lastTime) / 1000000000.0 > 600.0)
    objc_msgSend(v4, "keepUpToDate:", v3);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_INVALIDATE_CACHE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = evaluateBoolProperty(v6);

  if (v7)
  {
    objc_msgSend(v4, "invalidateAllForgettingPushers:", 1);
    v8 = &unk_1E4A38D70;
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_TOTAL_PURGEABLE"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = evaluateBoolProperty(v9);

    queryCache(v4, v3, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    if ((v10 & 1) == 0)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        +[CacheDeleteVolume volumeWithPath:](CacheDeleteVolume, "volumeWithPath:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v12 && v14)
        {
          objc_msgSend(v14, "mountPoint");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, CFSTR("CACHE_DELETE_VOLUME"));

        }
        else
        {
          CDGetLogHandle((uint64_t)"client");
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 67109378;
            v30 = 365;
            v31 = 2114;
            v32 = v26;
            _os_log_error_impl(&dword_1A3662000, v18, OS_LOG_TYPE_ERROR, "%d Invalid. Setting total_available to zero: \"%{public}@\"", buf, 0x12u);

          }
          v27[0] = CFSTR("CACHE_DELETE_VOLUME");
          v27[1] = CFSTR("CACHE_DELETE_TOTAL_AVAILABLE");
          v28[0] = v13;
          v28[1] = &unk_1E4A38B00;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "mutableCopy");

          v12 = (void *)v20;
        }

      }
      else
      {
        v17 = objc_msgSend(&unk_1E4A38D98, "mutableCopy");

        v12 = (void *)v17;
      }

    }
    daemonCachedResults_lastTime = mach_absolute_time();
    v21 = (void *)MEMORY[0x1E0CB37E8];
    v22 = (double)(unint64_t)daemonCachedResults_lastTime;
    _initgTimebaseConversion();
    objc_msgSend(v21, "numberWithDouble:", (v22 - v5) * *(double *)&gTimebaseConversion / 1000000000.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v23, CFSTR("CACHE_DELETE_ELAPSED_TIME"));

    evaluatePurgeableUrgency(v3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    _logPurgeableResults(v12, v24, 0);

    v8 = (void *)objc_msgSend(v12, "copy");
  }

  return v8;
}

void _logPurgeableResults(void *a1, void *a2, int a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  const __CFString *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  const __CFString *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  __CFString *v38;
  void *v39;
  int v40;
  void *v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t v52[128];
  uint8_t buf[4];
  const __CFString *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  uint64_t v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v42 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_TOTAL_PURGEABLE"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    v40 = a3;
    v43 = v5;
    v8 = (void *)objc_opt_new();
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v49 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
          objc_msgSend(v9, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          evaluateNumberProperty(v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            v17 = (void *)MEMORY[0x1E0CB3940];
            humanReadableNumber(objc_msgSend(v16, "unsignedLongLongValue"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "stringWithFormat:", CFSTR("%@ : %@"), v14, v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v19);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
      }
      while (v11);
    }

    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(","));
    v20 = objc_claimAutoreleasedReturnValue();

    v5 = v43;
    a3 = v40;
  }
  else
  {
    v21 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_TOTAL_AVAILABLE"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    evaluateNumberProperty(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    humanReadableNumber(objc_msgSend(v24, "unsignedLongLongValue"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("%@ : %@"), v22, v25);
    v20 = objc_claimAutoreleasedReturnValue();

  }
  CDGetLogHandle((uint64_t)"client");
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    if (a3)
      v27 = CFSTR("client");
    else
      v27 = CFSTR("daemon");
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_ELAPSED_TIME"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v54 = v27;
    v55 = 2112;
    v56 = v42;
    v57 = 2112;
    v58 = v28;
    v59 = 2114;
    v60 = v20;
    _os_log_impl(&dword_1A3662000, v26, OS_LOG_TYPE_DEFAULT, "<<<Query Result from %@ cache (u: %@, ET: %@): \"%{public}@\"", buf, 0x2Au);

  }
  v41 = (void *)v20;

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v29 = v5;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v31; ++j)
      {
        if (*(_QWORD *)v45 != v32)
          objc_enumerationMutation(v29);
        v34 = *(const __CFString **)(*((_QWORD *)&v44 + 1) + 8 * j);
        CDGetLogHandle((uint64_t)"client");
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v29, "objectForKeyedSubscript:", v34);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v54 = v34;
          v55 = 2114;
          v56 = v36;
          _os_log_impl(&dword_1A3662000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ : %{public}@", buf, 0x16u);

        }
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    }
    while (v31);
  }

  CDGetLogHandle((uint64_t)"client");
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_TOTAL_AVAILABLE"));
    v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v54 = v38;
    v55 = 2114;
    v56 = v39;
    _os_log_impl(&dword_1A3662000, v37, OS_LOG_TYPE_DEFAULT, "Query Result>>> %{public}@ bytes on: \"%{public}@\".", buf, 0x16u);

  }
}

double _initgTimebaseConversion()
{
  double result;
  unint64_t v1;
  unint64_t v2;
  NSObject *v3;
  uint8_t v4[8];
  mach_timebase_info info;

  result = *(double *)&gTimebaseConversion;
  if (*(double *)&gTimebaseConversion <= 0.0)
  {
    info = 0;
    if (mach_timebase_info(&info))
    {
      CDGetLogHandle((uint64_t)"client");
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v4 = 0;
        _os_log_error_impl(&dword_1A3662000, v3, OS_LOG_TYPE_ERROR, "Failed to get timebase info\n", v4, 2u);
      }

    }
    else
    {
      LODWORD(v1) = info.numer;
      LODWORD(v2) = info.denom;
      result = (double)v1 / (double)v2;
      gTimebaseConversion = *(_QWORD *)&result;
    }
  }
  return result;
}

void __clientCachedResults_block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_INVALIDATE_CACHE"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = evaluateBoolProperty(v2);

  if (v3)
  {
    objc_msgSend((id)qword_1ECE241F8, "invalidateAllForgettingPushers:", 1);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_NO_CACHE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = evaluateBoolProperty(v4);

    if ((v5 & 1) == 0)
    {
      queryCache((void *)qword_1ECE241F8, *(void **)(a1 + 32), 1);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      if (v9)
      {
        v20 = (id)objc_msgSend(v9, "mutableCopy");
        objc_msgSend(v20, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("CACHE_DELETE_CACHED_RESULT"));
        v10 = (void *)MEMORY[0x1E0CB37E8];
        v11 = (double)*(unint64_t *)(a1 + 48);
        v12 = (double)mach_absolute_time();
        _initgTimebaseConversion();
        objc_msgSend(v10, "numberWithDouble:", (v12 - v11) * *(double *)&gTimebaseConversion / 1000000000.0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v13, CFSTR("CACHE_DELETE_ELAPSED_TIME"));

        v14 = objc_msgSend(v20, "copy");
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v16 = *(void **)(v15 + 40);
        *(_QWORD *)(v15 + 40) = v14;

        v17 = *(void **)(a1 + 32);
        v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        evaluatePurgeableUrgency(v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        _logPurgeableResults(v18, v19, 1);

      }
    }
  }
}

void ___registerPurgeableUpdates_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.cache_delete_purgeable_update", v2);
  v1 = (void *)qword_1ECE24208;
  qword_1ECE24208 = (uint64_t)v0;

}

id timeStamp()
{
  tm *v0;
  timeval v2;
  char v3[32];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2.tv_sec = 0;
  *(_QWORD *)&v2.tv_usec = 0;
  gettimeofday(&v2, 0);
  v0 = localtime(&v2.tv_sec);
  strftime(v3, 0x20uLL, "%Y-%m-%d %H:%M:%S", v0);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s.%d"), v3, v2.tv_usec);
  return (id)objc_claimAutoreleasedReturnValue();
}

id CacheDeleteCopyAvailableSpaceForVolume(void *a1, uint64_t a2, _QWORD *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  int v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  unint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  id v52;
  NSObject *v54;
  uint64_t v55;
  void *v56;
  id obj;
  void *v58;
  _QWORD v60[5];
  _QWORD v61[4];
  id v62;
  id v63;
  _QWORD *v64;
  uint64_t *v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  _QWORD v73[5];
  id v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;
  uint64_t v81;
  id *v82;
  uint64_t v83;
  uint64_t (*v84)(uint64_t, uint64_t);
  void (*v85)(uint64_t);
  id v86;
  const __CFString *v87;
  id v88;
  _BYTE buf[28];
  __int16 v90;
  uint64_t v91;
  __int16 v92;
  uint64_t v93;
  __int16 v94;
  unint64_t v95;
  _QWORD v96[3];
  _QWORD v97[3];
  _QWORD v98[4];

  v98[1] = *MEMORY[0x1E0C80C00];
  v4 = a1;
  v81 = 0;
  v82 = (id *)&v81;
  v83 = 0x3032000000;
  v84 = __Block_byref_object_copy__0;
  v85 = __Block_byref_object_dispose__0;
  v86 = 0;
  v75 = 0;
  v76 = &v75;
  v77 = 0x3032000000;
  v78 = __Block_byref_object_copy__0;
  v79 = __Block_byref_object_dispose__0;
  v80 = 0;
  v73[0] = 0;
  v73[1] = v73;
  v73[2] = 0x3032000000;
  v73[3] = __Block_byref_object_copy__0;
  v73[4] = __Block_byref_object_dispose__0;
  v74 = 0;
  v67 = 0;
  v68 = &v67;
  v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__0;
  v71 = __Block_byref_object_dispose__0;
  v72 = 0;
  CDGetLogHandle((uint64_t)"client");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v4;
    _os_log_impl(&dword_1A3662000, v5, OS_LOG_TYPE_DEFAULT, "CacheDeleteCopyAvailableSpaceForVolume ENTRY, volume: %{public}@", buf, 0xCu);
  }

  +[CacheDeleteVolume volumeWithPath:](CacheDeleteVolume, "volumeWithPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "validate"))
  {
    CDGetLogHandle((uint64_t)"client");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v6;
      _os_log_impl(&dword_1A3662000, v7, OS_LOG_TYPE_DEFAULT, "CacheDeleteCopyAvailableSpaceForVolume ENTRY, volume: %{public}@", buf, 0xCu);
    }

    v8 = a2 - 1;
    if ((a2 - 1) >= 3)
    {
      v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("CacheDeleteErrorDomain"), 11, 0);
      v19 = (void *)v76[5];
      v76[5] = v18;

      v9 = 0;
      v10 = 0;
    }
    else
    {
      v9 = off_1E4A32BC0[v8];
      v10 = dword_1A3696390[v8];
    }
    if (v76[5])
      goto LABEL_28;
    v96[0] = CFSTR("CACHE_DELETE_VOLUME");
    objc_msgSend(v6, "mountPoint");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v97[0] = v20;
    v96[1] = CFSTR("CACHE_DELETE_AVAILABLE_SPACE_CLASS");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v97[1] = v21;
    v96[2] = CFSTR("CACHE_DELETE_URGENCY");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v97[2] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v97, v96, 3);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    clientCachedResults(v58);
    obj = (id)objc_claimAutoreleasedReturnValue();
    if (obj)
    {
      objc_storeStrong(v82 + 5, obj);
      +[CDPurgeableResultCache sharedPurgeableResultsCache](CDPurgeableResultCache, "sharedPurgeableResultsCache");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "thresholdsForVolume:", v6);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v68[5];
      v68[5] = v24;

    }
    else
    {
      v26 = MEMORY[0x1E0C809B0];
      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v61[2] = __CacheDeleteCopyAvailableSpaceForVolume_block_invoke;
      v61[3] = &unk_1E4A32760;
      v62 = v58;
      v64 = v73;
      v65 = &v81;
      v66 = &v67;
      v63 = v6;
      v60[0] = v26;
      v60[1] = 3221225472;
      v60[2] = __CacheDeleteCopyAvailableSpaceForVolume_block_invoke_91;
      v60[3] = &unk_1E4A324F8;
      v60[4] = &v75;
      CallCacheDPublic(v61, v60);

      v23 = v62;
    }

    objc_msgSend(v82[5], "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_ERROR"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend(v82[5], "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_ERROR"));
      v28 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR(".*Error Domain=(.*) Code=(\\d+)"), 0, 0);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "firstMatchInString:options:range:", v28, 0, 0, objc_msgSend(v28, "length"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v29)
      {
        v31 = objc_msgSend(v29, "rangeAtIndex:", 1);
        v33 = v32;
        v34 = objc_msgSend(v30, "rangeAtIndex:", 2);
        v36 = v35;
        v37 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(v28, "substringWithRange:", v31, v33);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "substringWithRange:", v34, v36);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "errorWithDomain:code:userInfo:", v38, (int)objc_msgSend(v39, "intValue"), 0);
        v40 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v47 = (void *)MEMORY[0x1E0CB35C8];
        v98[0] = CFSTR("message");
        *(_QWORD *)buf = v28;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v98, 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v38);
        v40 = objc_claimAutoreleasedReturnValue();
      }

      v48 = (void *)v76[5];
      v76[5] = v40;

      v45 = 0;
      v43 = 0;
      v42 = 0;
    }
    else
    {
      objc_msgSend((id)v68[5], "objectForKeyedSubscript:", v9);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "unsignedLongLongValue");

      v43 = objc_msgSend(v6, "freespace");
      objc_msgSend(v82[5], "objectForKey:", CFSTR("CACHE_DELETE_TOTAL_AVAILABLE"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v44)
      {
        v45 = 0;
LABEL_27:

        if (!v76[5])
        {
          if ((_DWORD)a2 == 3)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v43 + v45);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            humanReadableNumber(objc_msgSend(v15, "unsignedLongLongValue"));
            v49 = objc_claimAutoreleasedReturnValue();
            CDGetLogHandle((uint64_t)"client");
            v54 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67110146;
              *(_DWORD *)&buf[4] = 659;
              *(_WORD *)&buf[8] = 2114;
              *(_QWORD *)&buf[10] = v15;
              *(_WORD *)&buf[18] = 2114;
              *(_QWORD *)&buf[20] = v49;
              v90 = 2048;
              v91 = v43;
              v92 = 2048;
              v93 = v45;
              _os_log_impl(&dword_1A3662000, v54, OS_LOG_TYPE_DEFAULT, "%d publicClientAvailableSpaceForVolume kCacheDeleteAvailableSpaceClassEssential %{public}@ (%{public}@) = freespace %llu + purgeableSpace: %llu", buf, 0x30u);
            }
          }
          else
          {
            if (v43 + v45 < v42)
            {
              CDGetLogHandle((uint64_t)"client");
              v49 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)&buf[4] = 671;
                *(_WORD *)&buf[8] = 2114;
                *(_QWORD *)&buf[10] = 0;
                _os_log_impl(&dword_1A3662000, v49, OS_LOG_TYPE_DEFAULT, "%d publicClientAvailableSpaceForVolume %{public}@", buf, 0x12u);
              }
              v15 = &unk_1E4A38B30;
LABEL_31:

              if (!v76[5] && v15)
                goto LABEL_33;
              goto LABEL_9;
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v43 + v45 - v42);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            humanReadableNumber(objc_msgSend(v15, "unsignedLongLongValue"));
            v49 = objc_claimAutoreleasedReturnValue();
            CDGetLogHandle((uint64_t)"client");
            v54 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67110402;
              *(_DWORD *)&buf[4] = 668;
              *(_WORD *)&buf[8] = 2114;
              *(_QWORD *)&buf[10] = v15;
              *(_WORD *)&buf[18] = 2114;
              *(_QWORD *)&buf[20] = v49;
              v90 = 2048;
              v91 = v43;
              v92 = 2048;
              v93 = v45;
              v94 = 2048;
              v95 = v42;
              _os_log_impl(&dword_1A3662000, v54, OS_LOG_TYPE_DEFAULT, "%d publicClientAvailableSpaceForVolume %{public}@ (%{public}@) = (freespace %llu + purgeableSpace: %llu) - diskPadding: %llu", buf, 0x3Au);
            }
          }

          goto LABEL_31;
        }
LABEL_28:
        CDGetLogHandle((uint64_t)"client");
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          v55 = v76[5];
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v55;
          _os_log_error_impl(&dword_1A3662000, v49, OS_LOG_TYPE_ERROR, "publicClientAvailableSpaceForVolume: %{public}@", buf, 0xCu);
        }
        v15 = 0;
        goto LABEL_31;
      }
      objc_msgSend(v82[5], "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_TOTAL_AVAILABLE"));
      v28 = (id)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v28, "unsignedLongLongValue");
    }

    goto LABEL_27;
  }
  v11 = (void *)MEMORY[0x1E0CB35C8];
  v87 = CFSTR("Invalid volume");
  v88 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("CacheDeleteErrorDomain"), 10, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v76[5];
  v76[5] = v13;

  v15 = 0;
LABEL_9:
  CDGetLogHandle((uint64_t)"client");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v46 = v76[5];
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v46;
    _os_log_error_impl(&dword_1A3662000, v16, OS_LOG_TYPE_ERROR, "CacheDeleteCopyAvailableSpaceForVolume failed for volume %{public}@: %{public}@", buf, 0x16u);
  }

  v15 = &unk_1E4A38B30;
  if (a3)
  {
    v17 = (void *)v76[5];
    if (v17)
      *a3 = v17;
  }
LABEL_33:
  if (v6)
  {
    CDGetLogHandle((uint64_t)"client");
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v6;
      _os_log_impl(&dword_1A3662000, v50, OS_LOG_TYPE_DEFAULT, "CacheDeleteCopyAvailableSpaceForVolume: %{public}@", buf, 0xCu);
    }

  }
  CDGetLogHandle((uint64_t)"client");
  v51 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v15;
    _os_log_impl(&dword_1A3662000, v51, OS_LOG_TYPE_DEFAULT, "CacheDeleteCopyAvailableSpaceForVolume result: %{public}@", buf, 0xCu);
  }

  v52 = v15;
  _Block_object_dispose(&v67, 8);

  _Block_object_dispose(v73, 8);
  _Block_object_dispose(&v75, 8);

  _Block_object_dispose(&v81, 8);
  return v52;
}

void sub_1A36754A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a45, 8);
  _Unwind_Resume(a1);
}

void sub_1A36757F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *flattenedAssetDescription(unsigned int *a1)
{
  void *v2;
  __CFString *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __CFString *v29;
  const __CFString *v30;
  void *v31;
  int v32;
  uint64_t v33;
  __CFString *v34;
  const __CFString *v35;
  void *v36;
  __CFString *v37;
  const __CFString *v38;
  void *v39;
  __CFString *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  void *v44;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = CFSTR("NULL");
  if (a1)
  {
    if (*a1 == 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("flattenedAsset version: %d"), 2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v4);

      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = *(double *)(a1 + 1);
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("expiration_date: %f (%@)"), *(_QWORD *)&v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v8);

      v9 = (void *)MEMORY[0x1E0CB3940];
      v10 = *(double *)(a1 + 3);
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("consumed_date: %f (%@)"), *(_QWORD *)&v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v12);

      v13 = (void *)MEMORY[0x1E0CB3940];
      v14 = *(double *)(a1 + 5);
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("download_start_date: %f (%@)"), *(_QWORD *)&v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v16);

      v17 = (void *)MEMORY[0x1E0CB3940];
      v18 = *(double *)(a1 + 7);
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("download_completion_date: %f (%@)"), *(_QWORD *)&v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v20);

      v21 = (void *)MEMORY[0x1E0CB3940];
      v22 = *(double *)(a1 + 9);
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("last_viewed_date: %f (%@)"), *(_QWORD *)&v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v24);

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("priority: %d"), a1[11]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v25);

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("directory: %d"), *((unsigned __int8 *)a1 + 48));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v26);

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("content_type_len: %zd"), *(_QWORD *)((char *)a1 + 65));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v27);

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("metadata_len: %zd"), *(_QWORD *)((char *)a1 + 73));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v28);

      if (*(_QWORD *)((char *)a1 + 49))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (char *)a1 + 89);
        v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v29)
          v30 = v29;
        else
          v30 = CFSTR("NULL");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("identifier_len: %zd, identifier: %@"), *(_QWORD *)((char *)a1 + 49), v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v31);

        v32 = *(unsigned int *)((char *)a1 + 49);
      }
      else
      {
        v32 = 0;
      }
      if (*(_QWORD *)((char *)a1 + 57))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (char *)a1 + v32 + 89);
        v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v34)
          v35 = v34;
        else
          v35 = CFSTR("NULL");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("relative_path_len: %zd, relativePath: %@"), *(_QWORD *)((char *)a1 + 57), v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v36);

        v32 += *(unsigned int *)((char *)a1 + 57);
      }
      if (*(_QWORD *)((char *)a1 + 65))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (char *)a1 + v32 + 89);
        v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v37)
          v38 = v37;
        else
          v38 = CFSTR("NULL");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("contentType: %@"), v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v39);

        if (v37)
        {
          objc_msgSend(v2, "addObject:", v37);
          if (*(_QWORD *)((char *)a1 + 73))
          {
            if (!strcmp("text", (const char *)a1 + v32 + 89))
            {
              v32 += *(unsigned int *)((char *)a1 + 65);
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (char *)a1 + v32 + 89);
              v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
              if (v40)
                v41 = v40;
              else
                v41 = CFSTR("NULL");
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("metadata: %@"), v41);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v2, "addObject:", v42);

            }
          }
        }
        v32 += *(unsigned int *)((char *)a1 + 65);

      }
      if (*(_QWORD *)((char *)a1 + 81))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (char *)a1 + (int)(v32 + *(unsigned int *)((char *)a1 + 73)) + 89);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("display_name_len: %zd, displayName: %@"), *(_QWORD *)((char *)a1 + 81), v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v44);

      }
      objc_msgSend(v2, "componentsJoinedByString:", CFSTR("\n"));
      v33 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown flattened asset version: %u"), *a1);
      v33 = objc_claimAutoreleasedReturnValue();
    }
    v3 = (__CFString *)v33;
  }

  return v3;
}

id stripScheme(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v9;
  int *v10;
  char *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  char *v15;
  char v16[1024];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = objc_msgSend(v1, "rangeOfString:", CFSTR("file://"));
    v3 = v1;
    if (v4 == 7)
    {
      v3 = v1;
      if (!v2)
      {
        objc_msgSend(v1, "substringFromIndex:", 7);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    bzero(v16, 0x400uLL);
    v5 = objc_retainAutorelease(v3);
    if (realpath_DARWIN_EXTSN((const char *)objc_msgSend(v5, "fileSystemRepresentation"), v16))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v16);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      CDGetLogHandle((uint64_t)"client");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v9 = objc_msgSend(objc_retainAutorelease(v1), "fileSystemRepresentation");
        v10 = __error();
        v11 = strerror(*v10);
        v12 = 136315394;
        v13 = v9;
        v14 = 2080;
        v15 = v11;
        _os_log_error_impl(&dword_1A3662000, v7, OS_LOG_TYPE_ERROR, "realpath failed for: %s : %s", (uint8_t *)&v12, 0x16u);
      }

      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
    v5 = v1;
  }

  return v6;
}

NSObject *fullPathToAsset(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v23;
  uint64_t v24;
  int *v25;
  char *v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3 && v4)
  {
    nonContainerForID((uint64_t)v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "URLByAppendingPathComponent:", v3);
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      if (access((const char *)-[NSObject fileSystemRepresentation](v8, "fileSystemRepresentation"), 0))
      {
        CDGetLogHandle((uint64_t)"client");
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v24 = -[NSObject fileSystemRepresentation](objc_retainAutorelease(v8), "fileSystemRepresentation");
          v25 = __error();
          v26 = strerror(*v25);
          *(_DWORD *)buf = 138544130;
          v28 = v3;
          v29 = 2114;
          v30 = (uint64_t)v5;
          v31 = 2082;
          v32 = v24;
          v33 = 2082;
          v34 = v26;
          _os_log_error_impl(&dword_1A3662000, v9, OS_LOG_TYPE_ERROR, "Unable to access full path for: %{public}@ and %{public}@ at %{public}s : %{public}s", buf, 0x2Au);
        }

        v10 = 0;
        goto LABEL_20;
      }
      v21 = v8;
LABEL_19:
      v8 = v21;
      v10 = v21;
LABEL_20:

      goto LABEL_21;
    }
    v11 = objc_retainAutorelease(v5);
    v12 = (void *)containerUserManagedAssetsPath(objc_msgSend(v11, "UTF8String"), 0);
    if (!v12)
    {
      CDGetLogHandle((uint64_t)"client");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v28 = v11;
        _os_log_error_impl(&dword_1A3662000, v13, OS_LOG_TYPE_ERROR, "fullPathToAsset containerUserManagedAssetsPath returned NULL for identifier: %{public}@", buf, 0xCu);
      }

      v14 = objc_retainAutorelease(v11);
      objc_msgSend(v14, "UTF8String");
      v15 = container_user_managed_assets_path();
      if (!v15)
      {
        CDGetLogHandle((uint64_t)"client");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v28 = v14;
          v29 = 2048;
          v30 = 1;
          _os_log_error_impl(&dword_1A3662000, v23, OS_LOG_TYPE_ERROR, "fullPathToAsset container_user_managed_assets_path returned NULL for identifier: %{public}@, container_error: %llu", buf, 0x16u);
        }

        v20 = 0;
        goto LABEL_17;
      }
      v12 = (void *)v15;
    }
    v16 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", objc_msgSend(objc_retainAutorelease(v3), "fileSystemRepresentation"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "arrayWithObjects:", v17, v18, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPathComponents:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    free(v12);

LABEL_17:
    v21 = v20;
    goto LABEL_19;
  }
  CDGetLogHandle((uint64_t)"client");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v28 = v3;
    v29 = 2114;
    v30 = (uint64_t)v5;
    _os_log_error_impl(&dword_1A3662000, v8, OS_LOG_TYPE_ERROR, "fullPathToAsset parameter error, relativePath: %{public}@, identifier: %{public}@", buf, 0x16u);
  }
  v10 = 0;
LABEL_21:

  return v10;
}

void *getXAttr(const char *a1, const char *a2, ssize_t *a3)
{
  int v6;
  int v7;
  ssize_t v8;
  size_t v9;
  void *v10;
  ssize_t v11;
  NSObject *v12;
  NSObject *v13;
  int *v15;
  char *v16;
  int *v17;
  char *v18;
  int v19;
  const char *v20;
  __int16 v21;
  char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = openFile(a1);
  if (v6 != -1)
  {
    v7 = v6;
    v8 = fgetxattr(v6, a2, 0, 0, 0, 0);
    if (v8 < 0)
    {
      CDGetLogHandle((uint64_t)"client");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v15 = __error();
        v16 = strerror(*v15);
        v19 = 136315394;
        v20 = a1;
        v21 = 2080;
        v22 = v16;
        _os_log_debug_impl(&dword_1A3662000, v12, OS_LOG_TYPE_DEBUG, "[1]fgetxattr(%s) failed: %s", (uint8_t *)&v19, 0x16u);
      }

    }
    else
    {
      v9 = v8;
      v10 = malloc_type_calloc(v8, 1uLL, 0xB30FB286uLL);
      v11 = fgetxattr(v7, a2, v10, v9, 0, 0);
      if (v11 != -1)
      {
        if (a3)
          *a3 = v11;
        goto LABEL_14;
      }
      CDGetLogHandle((uint64_t)"client");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v17 = __error();
        v18 = strerror(*v17);
        v19 = 136315394;
        v20 = a1;
        v21 = 2080;
        v22 = v18;
        _os_log_error_impl(&dword_1A3662000, v13, OS_LOG_TYPE_ERROR, "[2]fgetxattr(%s) failed: %s", (uint8_t *)&v19, 0x16u);
      }

      free(v10);
    }
    v10 = 0;
LABEL_14:
    close(v7);
    return v10;
  }
  return 0;
}

uint64_t openFile(const char *a1)
{
  char *v2;
  char *v3;
  NSObject *v4;
  int *v5;
  char *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  NSObject *v10;
  uint64_t v11;
  int *v13;
  char *v14;
  int *v15;
  char *v16;
  stat v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  memset(&v17, 0, sizeof(v17));
  v2 = realpath_DARWIN_EXTSN(a1, 0);
  if (v2)
  {
    v3 = v2;
    if (lstat(v2, &v17))
    {
      CDGetLogHandle((uint64_t)"client");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = __error();
        v6 = strerror(*v5);
        *(_DWORD *)buf = 136315394;
        v19 = v3;
        v20 = 2080;
        v21 = v6;
        v7 = "lstat(%s) failed: %s";
LABEL_5:
        v8 = v4;
        v9 = 22;
LABEL_12:
        _os_log_error_impl(&dword_1A3662000, v8, OS_LOG_TYPE_ERROR, v7, buf, v9);
      }
    }
    else if ((v17.st_mode & 0xF000) == 0xA000)
    {
      CDGetLogHandle((uint64_t)"client");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v19 = v3;
        v7 = "%s is a link, skipping.";
        v8 = v4;
        v9 = 12;
        goto LABEL_12;
      }
    }
    else
    {
      v11 = open(v3, 0, *(_OWORD *)&v17.st_dev, *(_OWORD *)&v17.st_uid, *(_OWORD *)&v17.st_atimespec, *(_OWORD *)&v17.st_mtimespec, *(_OWORD *)&v17.st_ctimespec, *(_OWORD *)&v17.st_birthtimespec, *(_OWORD *)&v17.st_size, *(_OWORD *)&v17.st_blksize, *(_OWORD *)v17.st_qspare);
      if ((_DWORD)v11 != -1)
      {
LABEL_16:
        free(v3);
        return v11;
      }
      CDGetLogHandle((uint64_t)"client");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v15 = __error();
        v16 = strerror(*v15);
        *(_DWORD *)buf = 136315394;
        v19 = v3;
        v20 = 2080;
        v21 = v16;
        v7 = "open(%s) failed: %s";
        goto LABEL_5;
      }
    }

    v11 = 0xFFFFFFFFLL;
    goto LABEL_16;
  }
  CDGetLogHandle((uint64_t)"client");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v13 = __error();
    v14 = strerror(*v13);
    *(_DWORD *)buf = 136315394;
    v19 = (void *)a1;
    v20 = 2080;
    v21 = v14;
    _os_log_error_impl(&dword_1A3662000, v10, OS_LOG_TYPE_ERROR, "realpath(%s) failed: %s", buf, 0x16u);
  }

  return 0xFFFFFFFFLL;
}

void ___registerPurgeableUpdates_block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  CDGetLogHandle((uint64_t)"client");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "CACHE_DELETE_PURGEABLE_UPDATED";
    v16 = 1024;
    v17 = a2;
    _os_log_impl(&dword_1A3662000, v4, OS_LOG_TYPE_DEFAULT, "received %s notification, token: %d", buf, 0x12u);
  }

  if (*(_BYTE *)(a1 + 48))
  {
    +[CDPurgeableResultCache sharedPurgeableResultsCache](CDPurgeableResultCache, "sharedPurgeableResultsCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = ___registerPurgeableUpdates_block_invoke_33;
    v10[3] = &unk_1E4A324D0;
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v11 = v5;
    v12 = v6;
    v13 = v7;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = ___registerPurgeableUpdates_block_invoke_39;
    v9[3] = &unk_1E4A324F8;
    v9[4] = v7;
    v8 = v5;
    CallCacheDPublic(v10, v9);

  }
}

void ___registerPurgeableUpdates_block_invoke_33(uint64_t a1, void *a2)
{
  id v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = ___registerPurgeableUpdates_block_invoke_2_34;
  v6[3] = &unk_1E4A324A8;
  v5 = *(_OWORD *)(a1 + 32);
  v4 = (id)v5;
  v7 = v5;
  v8 = *(_QWORD *)(a1 + 48);
  objc_msgSend(a2, "clientUnifiedPurgeableSpace:queryType:replyBlock:", 0, 2, v6);

}

void ___registerPurgeableUpdates_block_invoke_2_34(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "absorbRecentInfo:");
  }
  else
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = CFSTR("Falied to update the client cache");

    CDGetLogHandle((uint64_t)"client");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v9 = 138412290;
      v10 = v8;
      _os_log_error_impl(&dword_1A3662000, v7, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v9, 0xCu);
    }

  }
}

void ___registerPurgeableUpdates_block_invoke_39(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "description");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  CDGetLogHandle((uint64_t)"client");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v8 = 138412290;
    v9 = v7;
    _os_log_error_impl(&dword_1A3662000, v6, OS_LOG_TYPE_ERROR, "Failed to update purgeable space: %@", (uint8_t *)&v8, 0xCu);
  }

}

uint64_t CacheManagementRemove(void *a1, void *a2)
{
  id v3;
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  int *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  id v35;
  void (**v36)(id, _QWORD);
  _QWORD v37[4];
  id v38;
  uint64_t v39;
  void *v40;
  uint8_t buf[4];
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  nonContainerForID((uint64_t)v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v3, "fullPath");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    nuke_dir((const char *)objc_msgSend(v7, "fileSystemRepresentation"), 0);
    v8 = objc_retainAutorelease(v7);
    if (access((const char *)objc_msgSend(v8, "fileSystemRepresentation"), 0))
    {
      if (*__error() == 2)
      {
        v4[2](v4, 0);
        v9 = 0;
        goto LABEL_18;
      }
      v27 = (void *)MEMORY[0x1E0CB3940];
      v8 = objc_retainAutorelease(v8);
      v28 = objc_msgSend(v8, "fileSystemRepresentation");
      v29 = __error();
      objc_msgSend(v27, "stringWithFormat:", CFSTR("access failed (errno != ENOENT) for %s : %s"), v28, strerror(*v29));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = *MEMORY[0x1E0CB2D50];
      v44[0] = v30;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      CDGetLogHandle((uint64_t)"client");
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v42 = (uint64_t)v30;
        _os_log_error_impl(&dword_1A3662000, v32, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CacheManagementErrorDomain"), 1, v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *))v4)[2](v4, v33);

    }
    else
    {
      v14 = (void *)objc_opt_new();
      v15 = (void *)MEMORY[0x1E0CB3940];
      v8 = objc_retainAutorelease(v8);
      objc_msgSend(v15, "stringWithUTF8String:", objc_msgSend(v8, "fileSystemRepresentation"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __CacheManagementRemove_block_invoke;
      v37[3] = &unk_1E4A325E8;
      v17 = v14;
      v38 = v17;
      traverse_dir_with_state(v16, 0, 0, v37);

      v18 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v3, "fullPath");
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v20 = objc_msgSend(v19, "fileSystemRepresentation");
      v21 = objc_msgSend(v17, "count");
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("nuke_dir failed for %s : directory still exists with contents (%lu items):\n%@"), v20, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v39 = *MEMORY[0x1E0CB2D50];
      v40 = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      CDGetLogHandle((uint64_t)"client");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v42 = (uint64_t)v23;
        _os_log_error_impl(&dword_1A3662000, v25, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CacheManagementErrorDomain"), 1, v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *))v4)[2](v4, v26);

    }
    v9 = 0xFFFFFFFFLL;
    goto LABEL_18;
  }
  objc_msgSend(v3, "identifier");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v10, "UTF8String");
  objc_msgSend(v3, "relativePath");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "fileSystemRepresentation");
  v36 = v4;
  v35 = v3;
  v12 = container_delete_user_managed_assets();

  CDGetLogHandle((uint64_t)"client");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v42 = v12;
    _os_log_debug_impl(&dword_1A3662000, v13, OS_LOG_TYPE_DEBUG, "container_delete_user_managed_assets returned: %llu", buf, 0xCu);
  }

  if (v12 == 1)
    v9 = 0;
  else
    v9 = 0xFFFFFFFFLL;

  v8 = v36;
LABEL_18:

  return v9;
}

void CacheManagementEnumerateAssetsOnVolume(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = (void *)MEMORY[0x1E0CB3940];
  v12 = objc_retainAutorelease(v7);
  objc_msgSend(v11, "stringWithUTF8String:", objc_msgSend(v12, "fileSystemRepresentation"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CacheDeleteVolume volumeWithMountpoint:](CacheDeleteVolume, "volumeWithMountpoint:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    if (v8)
      enumerateUserManagedAssetsOnVolume(v14, v8, 0, v9, v10);
    else
      enumerateAllAppsOnVolume(v14, v9, v10);
  }
  else
  {
    CDGetLogHandle((uint64_t)"client");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = 138412290;
      v17 = v12;
      _os_log_error_impl(&dword_1A3662000, v15, OS_LOG_TYPE_ERROR, "Unable to create CacheDeleteVolume from %@", (uint8_t *)&v16, 0xCu);
    }

  }
}

uint64_t __enumerateAllAppsOnVolume_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __enumerateUserManagedAssetsOnVolume_block_invoke(uint64_t a1, void *a2, int a3, char *a4)
{
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  uint64_t v18;
  char v19;
  NSObject *v20;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  CDGetLogHandle((uint64_t)"client");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 136315138;
    v24 = a2;
    _os_log_impl(&dword_1A3662000, v8, OS_LOG_TYPE_DEFAULT, "enumerateUserManagedAssets looking at: %s", (uint8_t *)&v23, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CacheManagementAsset assetFromPath:withIdentifier:createIfAbsent:](CacheManagementAsset, "assetFromPath:withIdentifier:createIfAbsent:", v9, *(_QWORD *)(a1 + 32), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    CDGetLogHandle((uint64_t)"client");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543362;
      v24 = v12;
      _os_log_impl(&dword_1A3662000, v11, OS_LOG_TYPE_DEFAULT, "enumerateUserManagedAssets: got asset with id: %{public}@", (uint8_t *)&v23, 0xCu);

    }
    v13 = *(void **)(a1 + 40);
    if (v13)
    {
      objc_msgSend(v10, "contentType");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqualToString:", v14);

      if (!v15)
      {
        v18 = 1;
        goto LABEL_22;
      }
    }
    if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("com.apple.nonContainerUserManagedAssets"))|| (objc_msgSend(v10, "identifier"), v16 = (void *)objc_claimAutoreleasedReturnValue(), v17 = objc_msgSend(v16, "isEqualToString:", *(_QWORD *)(a1 + 32)), v16, v17))
    {
      v18 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      if (!a4)
        goto LABEL_22;
    }
    else
    {
      CDGetLogHandle((uint64_t)"client");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v22 = *(void **)(a1 + 32);
        v23 = 138543618;
        v24 = v22;
        v25 = 2114;
        v26 = v10;
        _os_log_error_impl(&dword_1A3662000, v20, OS_LOG_TYPE_ERROR, "skipping asset that doesn't belong to %{public}@ : %{public}@", (uint8_t *)&v23, 0x16u);
      }

      v18 = 1;
      if (!a4)
        goto LABEL_22;
    }
    if ((a3 & 1) != 0)
    {
      v19 = 0;
LABEL_21:
      *a4 = v19;
    }
  }
  else
  {
    v18 = 1;
    if (a4)
    {
      v19 = 1;
      if (a3)
        goto LABEL_21;
    }
  }
LABEL_22:

  return v18;
}

uint64_t __enumerateUserManagedAssetsOnVolume_block_invoke_23(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1A367AEA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void CacheDeleteUpdatePurgeable(CFTypeRef cf)
{
  NSObject *v2;
  _QWORD block[5];

  if (cf)
    CFRetain(cf);
  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __CacheDeleteUpdatePurgeable_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = cf;
  dispatch_async(v2, block);

}

void CacheDeleteUpdatePurgeableSync(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CacheDeleteVolume validateVolumeAtPath:](CacheDeleteVolume, "validateVolumeAtPath:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v1, "setObject:forKeyedSubscript:", v3, CFSTR("CACHE_DELETE_VOLUME"));
    v4 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_FORGET_PUSH"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithBool:", evaluateBoolProperty(v5));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setObject:forKeyedSubscript:", v6, CFSTR("CACHE_DELETE_FORGET_PUSH"));

    objc_msgSend(v1, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("CACHE_DELETE_PUSHED"));
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __CacheDeleteUpdatePurgeableSync_block_invoke;
    v11[3] = &unk_1E4A326A0;
    v12 = v1;
    CallCacheD(v11, &__block_literal_global_2);
    v7 = v12;
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("Bad volume: %@"), v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    CDGetLogHandle((uint64_t)"client");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v7;
      _os_log_error_impl(&dword_1A3662000, v10, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

  }
}

uint64_t CacheDeleteRegisterCallback(void *a1, void *a2, void *a3)
{
  return _CacheDeleteRegister(a1, 0, 0, 0, 0, 0, a3, a2);
}

uint64_t CacheDeleteRegisterPurgeNotification(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  id v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  _QWORD v35[4];
  uint8_t buf[4];
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  v7 = v6;
  if (!v6)
  {
    v11 = &unk_1E4A38A88;
    goto LABEL_23;
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (!v9)
  {

LABEL_20:
    CDGetLogHandle((uint64_t)"client");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v37 = v8;
      _os_log_error_impl(&dword_1A3662000, v19, OS_LOG_TYPE_ERROR, "CacheDeleteRegisterPurgeNotification: Unable to create volume UUID list with %{public}@. Will notify for all volumes", buf, 0xCu);
    }

    v11 = &unk_1E4A38A70;
    goto LABEL_23;
  }
  v10 = v9;
  v25 = v5;
  v26 = a1;
  v27 = v7;
  v11 = 0;
  v12 = *(_QWORD *)v31;
  while (2)
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v31 != v12)
        objc_enumerationMutation(v8);
      v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
      +[CacheDeleteVolume volumeWithPath:](CacheDeleteVolume, "volumeWithPath:", v14, v25, v26, v27);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "uuid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "UUIDString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        CDGetLogHandle((uint64_t)"client");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v37 = v14;
          _os_log_error_impl(&dword_1A3662000, v18, OS_LOG_TYPE_ERROR, "CacheDeleteRegisterPurgeNotification: Unable to create CacheDeleteVolume with %{public}@. Will notify for all volumes", buf, 0xCu);
        }

        goto LABEL_16;
      }
      if (!v11)
        v11 = (void *)objc_opt_new();
      objc_msgSend(v11, "addObject:", v17);

    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v10)
      continue;
    break;
  }
LABEL_16:

  a1 = v26;
  v7 = v27;
  v5 = v25;
  if (!v11)
    goto LABEL_20;
LABEL_23:
  v34[0] = CFSTR("CACHE_DELETE_VOLUMES");
  v34[1] = CFSTR("CACHE_DELETE_SERVICES");
  v35[0] = v11;
  v35[1] = MEMORY[0x1E0C9AA60];
  v34[2] = CFSTR("CACHE_DELETE_NOTIFICATIONS");
  v34[3] = CFSTR("ANON");
  v35[2] = &unk_1E4A38AA0;
  v35[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  CDGetLogHandle((uint64_t)"client");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v37 = v20;
    _os_log_impl(&dword_1A3662000, v21, OS_LOG_TYPE_DEFAULT, "CacheDeleteRegisterPurgeNotification options: %@", buf, 0xCu);
  }

  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __CacheDeleteRegisterPurgeNotification_block_invoke;
  v28[3] = &unk_1E4A326E8;
  v29 = v5;
  v22 = v5;
  v23 = _CacheDeleteRegisterInfoCallbacksForProcess(a1, 0, 0, 0, 0, v28, v20);

  return v23;
}

uint64_t CacheDeleteRegisterVolumePurgeNotification(void *a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v8[0] = a2;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  v6 = CacheDeleteRegisterPurgeNotification(a1, (void *)objc_msgSend(v4, "arrayWithObjects:count:", v8, 1), v5);

  return v6;
}

uint64_t CacheDeleteRegister(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  _DWORD v21[2];
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  CDGetLogHandle((uint64_t)"client");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v21[0] = 67109378;
    v21[1] = 379;
    v22 = 2112;
    v23 = a2;
    _os_log_impl(&dword_1A3662000, v18, OS_LOG_TYPE_DEFAULT, "%d CacheDeleteRegister, options: %@", (uint8_t *)v21, 0x12u);
  }

  v19 = _CacheDeleteRegister(a1, v17, v16, v15, v14, v13, 0, a2);
  return v19;
}

uint64_t CacheDeleteRegisterForProcess(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;

  if (a2)
  {
    v14 = a7;
    v15 = a6;
    v16 = a5;
    v17 = a4;
    v18 = a3;
    v19 = (void *)objc_msgSend(a2, "mutableCopy");
  }
  else
  {
    v20 = (void *)MEMORY[0x1E0C99E08];
    v21 = a7;
    v22 = a6;
    v23 = a5;
    v24 = a4;
    v25 = a3;
    objc_msgSend(v20, "dictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26 = v19;
  objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ANON"));
  v27 = _CacheDeleteRegister(a1, a3, a4, a5, a6, a7, 0, v26);

  return v27;
}

uint64_t CacheDeleteRegisterCallbacksForProcess(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint32_t v20;
  NSObject *v21;
  uint64_t v22;
  int *v24;
  char *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  int out_token;
  uint8_t buf[4];
  char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  out_token = 0;
  v13 = a1;
  dispatch_get_global_queue(21, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __CacheDeleteRegisterCallbacksForProcess_block_invoke;
  v26[3] = &unk_1E4A32710;
  v27 = v13;
  v28 = v9;
  v29 = v10;
  v30 = v11;
  v31 = v12;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  v18 = v9;
  v19 = v13;
  v20 = notify_register_dispatch("com.apple.cache_delete.launched", &out_token, v14, v26);

  if (v20)
  {
    CDGetLogHandle((uint64_t)"client");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v24 = __error();
      v25 = strerror(*v24);
      *(_DWORD *)buf = 136315138;
      v34 = v25;
      _os_log_error_impl(&dword_1A3662000, v21, OS_LOG_TYPE_ERROR, "notify_register_dispatch failed: %s", buf, 0xCu);
    }

  }
  v22 = _CacheDeleteRegisterLegacyCallbacks(v19, v18, v17, v16, v15, 1);

  return v22;
}

uint64_t _CacheDeleteRegisterLegacyCallbacks(void *a1, void *a2, void *a3, void *a4, void *a5, int a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD v25[4];
  id v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  void *v33;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = ___CacheDeleteRegisterLegacyCallbacks_block_invoke;
  v31[3] = &unk_1E4A32B08;
  v16 = v11;
  v32 = v16;
  v33 = a1;
  v17 = (void *)MEMORY[0x1A8591D98](v31);
  v28[0] = v15;
  v28[1] = 3221225472;
  v28[2] = ___CacheDeleteRegisterLegacyCallbacks_block_invoke_216;
  v28[3] = &unk_1E4A32B08;
  v18 = v12;
  v29 = v18;
  v30 = a1;
  v19 = (void *)MEMORY[0x1A8591D98](v28);
  v25[0] = v15;
  v25[1] = 3221225472;
  v25[2] = ___CacheDeleteRegisterLegacyCallbacks_block_invoke_217;
  v25[3] = &unk_1E4A32B08;
  v20 = v14;
  v26 = v20;
  v27 = a1;
  v21 = (void *)MEMORY[0x1A8591D98](v25);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("CACHE_DELETE_LEGACY_CALLBACK"));
  if (a6)
    objc_msgSend(v22, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ANON"));
  v23 = _CacheDeleteRegister(a1, v17, v19, v13, v21, 0, 0, v22);

  return v23;
}

uint64_t CacheDeleteRegisterCallbacks(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  return _CacheDeleteRegisterLegacyCallbacks(a1, a2, a3, a4, a5, 0);
}

uint64_t CacheDeleteDoNotAutoPurge(const char *a1)
{
  uint64_t result;
  char value;

  value = 0;
  result = getCacheDeleteXattr(a1, &value);
  if ((_DWORD)result)
  {
    value |= 1u;
    return setxattr(a1, "com.apple.mobile.deleted", &value, 1uLL, 0, 0);
  }
  return result;
}

uint64_t CacheDeleteAllowAutoPurge(const char *a1)
{
  uint64_t result;
  char value;

  value = 0;
  result = getCacheDeleteXattr(a1, &value);
  if ((_DWORD)result)
  {
    value &= ~1u;
    return setxattr(a1, "com.apple.mobile.deleted", &value, 1uLL, 0, 0);
  }
  return result;
}

uint64_t CacheDeleteAutoPurgeAllowed(const char *a1)
{
  unsigned int v1;
  char value;

  value = 0;
  v1 = getCacheDeleteXattr(a1, &value) ^ 1;
  if ((value & 1) != 0)
    return v1;
  else
    return 1;
}

id CacheDeleteCopyPurgeableSpaceWithInfo(void *a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  __CFString *v8;
  int v9;
  void *v10;
  NSObject *v11;
  const __CFString *v12;
  uint64_t v13;
  uint64_t *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  const __CFString *v41;
  uint64_t v42;
  id v43;
  _QWORD v45[5];
  _QWORD v46[4];
  id v47;
  _QWORD *v48;
  uint64_t *v49;
  uint64_t *v50;
  _QWORD v51[5];
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  const __CFString *v65;
  void *v66;
  const __CFString *v67;
  void *v68;
  uint8_t buf[4];
  const __CFString *v70;
  __int16 v71;
  uint64_t v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__0;
  v63 = __Block_byref_object_dispose__0;
  v64 = 0;
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__0;
  v57 = __Block_byref_object_dispose__0;
  v58 = 0;
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x3032000000;
  v51[3] = __Block_byref_object_copy__0;
  v51[4] = __Block_byref_object_dispose__0;
  v52 = 0;
  v2 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_DIAGNOSTIC_INFO"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = evaluateBoolProperty(v3);

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_TOTAL_PURGEABLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = evaluateBoolProperty(v5);

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CacheDeleteVolume validateVolumeAtPath:](CacheDeleteVolume, "validateVolumeAtPath:", v7);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = 1;
  else
    v9 = v6;
  if (v9 == 1)
  {
    if (v8)
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("CACHE_DELETE_VOLUME"));
    clientCachedResults(v2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      CDGetLogHandle((uint64_t)"client");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = CFSTR("unknown!!");
        if (v8)
          v12 = v8;
        v13 = v60[5];
        if (v6)
          v12 = CFSTR("all volumes");
        *(_DWORD *)buf = 138543618;
        v70 = v12;
        v71 = 2114;
        v72 = v13;
        _os_log_impl(&dword_1A3662000, v11, OS_LOG_TYPE_DEFAULT, "CacheDeleteCopyPurgeableSpaceWithInfo local cache result for %{public}@ : %{public}@", buf, 0x16u);
      }

      v14 = v54;
      v15 = v10;
      v16 = (void *)v14[5];
      v14[5] = (uint64_t)v15;
    }
    else
    {
      v21 = MEMORY[0x1E0C809B0];
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __CacheDeleteCopyPurgeableSpaceWithInfo_block_invoke;
      v46[3] = &unk_1E4A327B0;
      v47 = v2;
      v48 = v51;
      v49 = &v53;
      v50 = &v59;
      v45[0] = v21;
      v45[1] = 3221225472;
      v45[2] = __CacheDeleteCopyPurgeableSpaceWithInfo_block_invoke_3;
      v45[3] = &unk_1E4A324F8;
      v45[4] = &v53;
      CallCacheD(v46, v45);
      v16 = v47;
    }

    objc_msgSend((id)v54[5], "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_TOTAL_AVAILABLE"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v22 = v60;
      v23 = (id)v54[5];
      v24 = (void *)v22[5];
      v22[5] = (uint64_t)v23;
    }
    else
    {
      v25 = (void *)v54[5];
      if (v8 && v20)
      {
        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_NONPURGEABLE_AMOUNT"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        evaluateNumberProperty(v26);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v27, "setObject:forKeyedSubscript:", v8, CFSTR("CACHE_DELETE_VOLUME"));
        objc_msgSend(v27, "setObject:forKeyedSubscript:", v20, CFSTR("CACHE_DELETE_AMOUNT"));
        if (v24)
          v28 = v24;
        else
          v28 = &unk_1E4A38B30;
        objc_msgSend(v27, "setObject:forKeyedSubscript:", v28, CFSTR("CACHE_DELETE_NONPURGEABLE_AMOUNT"));
        objc_msgSend((id)v54[5], "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_FREESPACE"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        evaluateNumberProperty(v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v30, CFSTR("CACHE_DELETE_FREESPACE"));
        if (v4)
        {
          objc_msgSend(v27, "removeObjectForKey:", CFSTR("CACHE_DELETE_TOTAL_AVAILABLE"));
          objc_msgSend((id)v54[5], "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_DIAGNOSTIC_INFO"));
          v31 = objc_claimAutoreleasedReturnValue();
          v32 = (void *)v31;
          if (v31)
            v33 = (const __CFString *)v31;
          else
            v33 = CFSTR("Diagnostics unavailable");
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v33, CFSTR("CACHE_DELETE_DIAGNOSTIC_INFO"));

        }
        objc_msgSend((id)v54[5], "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_CACHED_RESULT"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
          objc_msgSend(v27, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("CACHE_DELETE_CACHED_RESULT"));
        v35 = objc_msgSend(v27, "copy");
        v36 = (void *)v60[5];
        v60[5] = v35;

      }
      else
      {
        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_ERROR"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37)
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CacheDeleteCopyPurgeableSpaceWithInfo error: %@"), v37);
        else
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CacheDeleteCopyPurgeableSpaceWithInfo error! volume: %@, amount: %@"), v8, v20);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = CFSTR("CACHE_DELETE_ERROR");
        v68 = v24;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
        v38 = objc_claimAutoreleasedReturnValue();
        v39 = (void *)v60[5];
        v60[5] = v38;

      }
    }

  }
  else
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("Bad volume: %@"), v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v65 = CFSTR("CACHE_DELETE_ERROR");
    v66 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v60[5];
    v60[5] = v19;
  }

  CDGetLogHandle((uint64_t)"client");
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    v41 = CFSTR("unknown!!");
    if (v8)
      v41 = v8;
    v42 = v60[5];
    if (v6)
      v41 = CFSTR("all volumes");
    *(_DWORD *)buf = 138543618;
    v70 = v41;
    v71 = 2114;
    v72 = v42;
    _os_log_impl(&dword_1A3662000, v40, OS_LOG_TYPE_DEFAULT, "CacheDeleteCopyPurgeableSpaceWithInfo result for %{public}@ : %{public}@", buf, 0x16u);
  }

  v43 = (id)v60[5];
  _Block_object_dispose(v51, 8);

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v59, 8);

  return v43;
}

void sub_1A367CB40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

uint64_t CacheDeletePurgeableSpace()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("CACHE_DELETE_VOLUME");
  getRootVolume();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("CACHE_DELETE_AMOUNT");
  v7[0] = v0;
  v7[1] = &unk_1E4A38B30;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = CacheDeleteCopyPurgeableSpaceWithInfo(v1);
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_AMOUNT"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CFRelease(v1);
  v4 = objc_msgSend(v3, "longLongValue");

  return v4;
}

id CacheDeleteCopyItemizedPurgeableSpace()
{
  void *v0;
  void *v1;
  id v2;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("CACHE_DELETE_VOLUME");
  getRootVolume();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = CFSTR("CACHE_DELETE_AMOUNT");
  v5[0] = v0;
  v5[1] = &unk_1E4A38B30;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = CacheDeleteCopyItemizedPurgeableSpaceWithInfo(v1);
  CFRelease(v1);
  return v2;
}

uint64_t CacheDeletePurgeSpaceWithInfoSync(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_msgSend(a1, "mutableCopy");
  v5 = createCacheDeleteToken();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("CACHE_DELETE_TOKEN"));
  _CacheDeletePurgeSpaceWithInfo(v4, v3);

  CDGetLogHandle((uint64_t)"client");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_debug_impl(&dword_1A3662000, v6, OS_LOG_TYPE_DEBUG, "Purge token: %@", (uint8_t *)&v8, 0xCu);
  }

  return v5;
}

void _CacheDeletePurgeSpaceWithInfo(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  int v8;
  NSObject *v9;
  const __CFString *v10;
  const char *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  __int128 *p_buf;
  const __CFString *v27;
  void *v28;
  __int128 buf;
  uint64_t v30;
  char v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CacheDeleteVolume validateVolumeAtPath:](CacheDeleteVolume, "validateVolumeAtPath:", v5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_TOTAL_PURGEABLE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = evaluateBoolProperty(v7);

  CDGetLogHandle((uint64_t)"client");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = CFSTR("unknown!!");
    if (v6)
      v10 = v6;
    if (v8)
      v10 = CFSTR("all volumes");
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_1A3662000, v9, OS_LOG_TYPE_DEFAULT, "_CacheDeletePurgeSpaceWithInfo ENTRY, volume: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  v11 = getprogname();
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("CACHE_DELETE_CALLING_PROCESS"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("unknown"), CFSTR("CACHE_DELETE_CALLING_PROCESS"));
  }
  if (v6)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("CACHE_DELETE_VOLUME"));
LABEL_13:
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v30 = 0x2020000000;
    v31 = 0;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_URGENCY_LIMIT"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "integerValue") == 4;

    if (v14)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E4A38B48, CFSTR("CACHE_DELETE_PURGE_TIMEOUT"));
    v15 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = ___CacheDeletePurgeSpaceWithInfo_block_invoke;
    v23[3] = &unk_1E4A32890;
    v24 = v3;
    p_buf = &buf;
    v25 = v4;
    v21[0] = v15;
    v21[1] = 3221225472;
    v21[2] = ___CacheDeletePurgeSpaceWithInfo_block_invoke_234;
    v21[3] = &unk_1E4A32998;
    v22 = v25;
    CallCacheD(v23, v21);

    _Block_object_dispose(&buf, 8);
    goto LABEL_16;
  }
  if (v8)
    goto LABEL_13;
  v16 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("Bad volume: %@"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  CDGetLogHandle((uint64_t)"client");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v18;
    _os_log_error_impl(&dword_1A3662000, v19, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&buf, 0xCu);
  }

  if (v4)
  {
    v27 = CFSTR("CACHE_DELETE_ERROR");
    v28 = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v20 = objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t))v4 + 2))(v4, v20);
  }

LABEL_16:
}

void sub_1A367D590(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t CacheDeletePurgeSpaceWithInfo(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a2;
  v4 = (void *)objc_msgSend(a1, "mutableCopy");
  v5 = createCacheDeleteToken();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("CACHE_DELETE_TOKEN"));
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __CacheDeletePurgeSpaceWithInfo_block_invoke;
  v10[3] = &unk_1E4A32800;
  v11 = v4;
  v12 = v3;
  v7 = v3;
  v8 = v4;
  dispatch_async(v6, v10);

  return v5;
}

uint64_t CacheDeletePurgeSpace(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v12[0] = CFSTR("CACHE_DELETE_VOLUME");
  getRootVolume();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = CFSTR("CACHE_DELETE_AMOUNT");
  v13[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __CacheDeletePurgeSpace_block_invoke;
  v10[3] = &unk_1E4A326E8;
  v11 = v3;
  v7 = v3;
  v8 = CacheDeletePurgeSpaceWithInfo(v6, v10);
  CFRelease(v6);

  return v8;
}

void CacheDeleteCancelPurge(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[16];

  CDGetLogHandle((uint64_t)"client");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3662000, v2, OS_LOG_TYPE_DEFAULT, "CacheDeleteCancelPurge Entry ", buf, 2u);
  }

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __CacheDeleteCancelPurge_block_invoke;
  v4[3] = &__block_descriptor_40_e37_v16__0___CacheDeleteClientProtocol__8l;
  v4[4] = a1;
  CallCacheD(v4, &__block_literal_global_132);
  CDGetLogHandle((uint64_t)"client");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3662000, v3, OS_LOG_TYPE_DEFAULT, "CacheDeleteCancelPurge Exit ", buf, 2u);
  }

}

uint64_t CacheDeletePerformOperation(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  _QWORD *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD *v17;
  _QWORD v18[3];
  char v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v19 = 0;
  v4 = (void *)objc_msgSend(a1, "mutableCopy");
  v5 = createCacheDeleteToken();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("CACHE_DELETE_TOKEN"));
  CDGetLogHandle((uint64_t)"client");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v21 = a1;
    _os_log_debug_impl(&dword_1A3662000, v6, OS_LOG_TYPE_DEBUG, "info: %@", buf, 0xCu);
  }

  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __CacheDeletePerformOperation_block_invoke;
  v14[3] = &unk_1E4A32890;
  v8 = v4;
  v15 = v8;
  v17 = v18;
  v16 = v3;
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __CacheDeletePerformOperation_block_invoke_3;
  v11[3] = &unk_1E4A328B8;
  v13 = v18;
  v9 = v16;
  v12 = v9;
  CallCacheD(v14, v11);

  _Block_object_dispose(v18, 8);
  return v5;
}

void sub_1A367DC28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id CacheDeleteRequestCacheableSpaceGuidance(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  _BOOL4 v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  void *v29;
  unint64_t v30;
  BOOL v31;
  unint64_t v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  id v39;
  uint64_t v41;
  id v42;
  _QWORD v43[5];
  _QWORD v44[4];
  id v45;
  uint64_t *v46;
  _QWORD *v47;
  uint64_t *v48;
  uint64_t *v49;
  _QWORD v50[5];
  id v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint64_t v64;
  id *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  const __CFString *v70;
  void *v71;
  _QWORD v72[4];
  _QWORD v73[4];
  _QWORD v74[5];
  _QWORD v75[5];
  _QWORD v76[2];
  _QWORD v77[4];

  v77[2] = *MEMORY[0x1E0C80C00];
  v64 = 0;
  v65 = (id *)&v64;
  v66 = 0x3032000000;
  v67 = __Block_byref_object_copy__0;
  v68 = __Block_byref_object_dispose__0;
  v69 = 0;
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__0;
  v62 = __Block_byref_object_dispose__0;
  v63 = 0;
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__0;
  v56 = __Block_byref_object_dispose__0;
  v57 = 0;
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x3032000000;
  v50[3] = __Block_byref_object_copy__0;
  v50[4] = __Block_byref_object_dispose__0;
  v51 = 0;
  v7 = a2;
  v8 = a1;
  v42 = a4;
  objc_msgSend(v7, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CacheDeleteVolume volumeWithPath:](CacheDeleteVolume, "volumeWithPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v70 = CFSTR("CACHE_DELETE_ERROR");
    v19 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("Invalid path: %@"), v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v65[5];
    v65[5] = (id)v21;
LABEL_18:

    goto LABEL_19;
  }
  v76[0] = CFSTR("CACHE_DELETE_VOLUME");
  objc_msgSend(v10, "mountPoint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v76[1] = CFSTR("CACHE_DELETE_URGENCY");
  v77[0] = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v77[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, v76, 2);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v59[5];
  v59[5] = v13;

  clientCachedResults((void *)v59[5]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_storeStrong(v65 + 5, v15);
    +[CDPurgeableResultCache sharedPurgeableResultsCache](CDPurgeableResultCache, "sharedPurgeableResultsCache");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "thresholdsForVolume:", v10);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v53[5];
    v53[5] = v17;

  }
  else
  {
    v23 = MEMORY[0x1E0C809B0];
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __CacheDeleteRequestCacheableSpaceGuidance_block_invoke;
    v44[3] = &unk_1E4A32908;
    v46 = &v58;
    v47 = v50;
    v48 = &v52;
    v45 = v10;
    v49 = &v64;
    v43[0] = v23;
    v43[1] = 3221225472;
    v43[2] = __CacheDeleteRequestCacheableSpaceGuidance_block_invoke_139;
    v43[3] = &unk_1E4A324F8;
    v43[4] = &v64;
    CallCacheDPublic(v44, v43);
    v16 = v45;
  }

  objc_msgSend(v65[5], "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_ERROR"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24 == 0;

  if (v25)
  {
    v26 = objc_msgSend(v10, "freespace");
    thresholdKeyForUrgency(a3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v42, "unsignedLongLongValue");
    objc_msgSend(v65[5], "objectForKeyedSubscript:", v8);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v28, "unsignedLongLongValue");

    objc_msgSend((id)v53[5], "objectForKeyedSubscript:", v20);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "unsignedLongLongValue");

    v31 = v26 >= v30;
    v32 = v26 - v30;
    if (v32 != 0 && v31)
    {
      v34 = CFSTR("CACHE_DELETE_GUIDANCE_WILL_EVICT_LOWER_PRIORITY");
      if (v27 >= v32)
      {
        v27 = v32;
      }
      else
      {
        objc_msgSend((id)v53[5], "objectForKeyedSubscript:", CFSTR("DESIRED_DISK_THRESHOLD"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26 - v27 > objc_msgSend(v33, "unsignedLongLongValue"))
          v34 = CFSTR("CACHE_DELETE_GUIDANCE_CAN_EXPAND_CACHE");

      }
    }
    else
    {
      v32 = 0;
      v27 = 0;
      v34 = CFSTR("CACHE_DELETE_GUIDANCE_DO_NOT_EXPAND_CACHE");
    }
    objc_msgSend(v65[5], "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_CACHED_RESULT"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      v75[0] = v8;
      v74[0] = CFSTR("CACHE_DELETE_ID");
      v74[1] = CFSTR("CACHE_DELETE_AMOUNT");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v27);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      v75[1] = v22;
      v74[2] = CFSTR("CACHE_DELETE_TOTAL_AVAILABLE");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v32 + v41);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v75[2] = v36;
      v75[3] = v34;
      v74[3] = CFSTR("CACHE_DELETE_GUIDANCE");
      v74[4] = CFSTR("CACHE_DELETE_CACHED_RESULT");
      v75[4] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, v74, 5);
    }
    else
    {
      v73[0] = v8;
      v72[0] = CFSTR("CACHE_DELETE_ID");
      v72[1] = CFSTR("CACHE_DELETE_AMOUNT");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v27);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      v73[1] = v22;
      v72[2] = CFSTR("CACHE_DELETE_TOTAL_AVAILABLE");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v32 + v41);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v72[3] = CFSTR("CACHE_DELETE_GUIDANCE");
      v73[2] = v36;
      v73[3] = v34;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, v72, 4);
    }
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = v65[5];
    v65[5] = (id)v37;

    goto LABEL_18;
  }
LABEL_19:

  v39 = v65[5];
  _Block_object_dispose(v50, 8);

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v58, 8);

  _Block_object_dispose(&v64, 8);
  return v39;
}

void sub_1A367E43C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a45, 8);
  _Unwind_Resume(a1);
}

void CacheDeleteRegisterLowDiskFailure(uint64_t a1, int a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint32_t v9;
  uint64_t v10;
  int *v11;
  char *v12;
  _QWORD v13[5];
  int v14;
  char v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  char *v19;
  statfs v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  bzero(&v20, 0x878uLL);
  v6 = objc_retainAutorelease(v5);
  if (statfs((const char *)objc_msgSend(v6, "fileSystemRepresentation"), &v20))
  {
    CDGetLogHandle((uint64_t)"client");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_msgSend(objc_retainAutorelease(v6), "fileSystemRepresentation");
      v11 = __error();
      v12 = strerror(*v11);
      *(_DWORD *)buf = 136315394;
      v17 = v10;
      v18 = 2080;
      v19 = v12;
      _os_log_error_impl(&dword_1A3662000, v7, OS_LOG_TYPE_ERROR, "statfs failed for %s : %s", buf, 0x16u);
    }

    v8 = v6;
    LOBYTE(v9) = 0;
  }
  else
  {
    v9 = (v20.f_flags >> 14) & 1;
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v20.f_mntonname, 1, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __CacheDeleteRegisterLowDiskFailure_block_invoke;
  v13[3] = &__block_descriptor_45_e37_v16__0___CacheDeleteClientProtocol__8l;
  v13[4] = a1;
  v14 = a2;
  v15 = v9;
  CallCacheD(v13, &__block_literal_global_154);

}

id CacheableKeyForVolume(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@/%@"), CFSTR("CACHE_DELETE_CACHE_ENABLED"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id VolumeUUIDFromKey(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  objc_msgSend(v1, "substringFromIndex:", objc_msgSend(CFSTR("CACHE_DELETE_CACHE_ENABLED"), "lengthOfBytesUsingEncoding:", 4) + 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void CacheDeleteSetCacheableForVolume(uint64_t a1, void *a2, int a3)
{
  void *v5;
  id v6;

  +[CacheDeleteVolume volumeWithPath:](CacheDeleteVolume, "volumeWithPath:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    _CacheDeleteSetCacheableForVolume(v5, a2, a3);
    v5 = v6;
  }

}

void _CacheDeleteSetCacheableForVolume(void *a1, void *a2, int a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  NSObject *v22;
  const char *v23;
  _QWORD v24[4];
  NSObject *v25;
  id v26;
  char v27;
  uint8_t buf[4];
  _BYTE v29[24];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  CacheableKeyForVolume(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CDGetLogHandle((uint64_t)"client");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = "FALSE";
    *(_DWORD *)v29 = 1267;
    *(_DWORD *)buf = 67109634;
    if (a3)
      v9 = "TRUE";
    *(_WORD *)&v29[4] = 2080;
    *(_QWORD *)&v29[6] = v9;
    *(_WORD *)&v29[14] = 2112;
    *(_QWORD *)&v29[16] = v7;
    _os_log_impl(&dword_1A3662000, v8, OS_LOG_TYPE_DEFAULT, "%d CacheDeleteSetCacheable: %s for key: %@", buf, 0x1Cu);
  }

  if (v7)
  {
    if (a3)
    {
      v10 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v11 = objc_claimAutoreleasedReturnValue();
      -[NSObject timeIntervalSinceReferenceDate](v11, "timeIntervalSinceReferenceDate");
      objc_msgSend(v10, "numberWithDouble:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (!v6)
      {
        v12 = &unk_1E4A39018;
        goto LABEL_20;
      }
      v15 = (void *)MEMORY[0x1E0CB37E8];
      v11 = v6;
      CDGetLogHandle((uint64_t)"client");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject doubleValue](v11, "doubleValue");
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v29 = 1236;
        *(_WORD *)&v29[4] = 2048;
        *(_QWORD *)&v29[6] = v17;
        _os_log_impl(&dword_1A3662000, v16, OS_LOG_TYPE_DEFAULT, "%d normalizeDuration durationSeconds: %f", buf, 0x12u);
      }

      -[NSObject doubleValue](v11, "doubleValue");
      v18 = 1.0;
      if (v19 >= 1.0)
      {
        -[NSObject doubleValue](v11, "doubleValue");
        v18 = 14400.0;
        if (v20 <= 14400.0)
        {
          -[NSObject doubleValue](v11, "doubleValue");
          v18 = v21;
        }
      }
      CDGetLogHandle((uint64_t)"client");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v29 = 1245;
        *(_WORD *)&v29[4] = 2048;
        *(double *)&v29[6] = v18;
        _os_log_impl(&dword_1A3662000, v22, OS_LOG_TYPE_DEFAULT, "%d normalizeDuration result: %f", buf, 0x12u);
      }

      objc_msgSend(v15, "numberWithDouble:", v18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

LABEL_20:
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = ___CacheDeleteSetCacheableForVolume_block_invoke;
    v24[3] = &unk_1E4A32B30;
    v27 = a3;
    v14 = v12;
    v25 = v14;
    v26 = v7;
    CallCacheD(v24, &__block_literal_global_243);

    v13 = v25;
    goto LABEL_21;
  }
  CDGetLogHandle((uint64_t)"client");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v23 = "FALSE";
    if (a3)
      v23 = "TRUE";
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)v29 = v23;
    *(_WORD *)&v29[8] = 2112;
    *(_QWORD *)&v29[10] = v5;
    _os_log_error_impl(&dword_1A3662000, v13, OS_LOG_TYPE_ERROR, "_CacheDeleteSetCacheableForVolume(%s) unable to create key for volume: %@", buf, 0x16u);
  }
  v14 = v6;
LABEL_21:

}

void CacheDeleteSetCacheable(int a1)
{
  void *v2;
  id v3;

  +[CacheDeleteVolume rootVolume](CacheDeleteVolume, "rootVolume");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    _CacheDeleteSetCacheableForVolume(v2, &unk_1E4A39018, a1);
    v2 = v3;
  }

}

BOOL CacheDeleteCacheableForVolume(uint64_t a1)
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  +[CacheDeleteVolume volumeWithPath:](CacheDeleteVolume, "volumeWithPath:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = _CacheDeleteCacheableForVolume(v1);
  else
    v3 = 0;

  return v3;
}

BOOL _CacheDeleteCacheableForVolume(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  double v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  _QWORD *v25;
  _QWORD v26[5];
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint8_t buf[4];
  _BYTE v39[14];
  __int16 v40;
  const char *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 1;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__0;
  v32 = __Block_byref_object_dispose__0;
  v33 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__0;
  v26[4] = __Block_byref_object_dispose__0;
  v27 = 0;
  CacheableKeyForVolume(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = ___CacheDeleteCacheableForVolume_block_invoke;
    v20[3] = &unk_1E4A32BA0;
    v4 = v2;
    v21 = v4;
    v23 = &v34;
    v24 = &v28;
    v5 = v1;
    v22 = v5;
    v25 = v26;
    CallCacheD(v20, 0);
    CDGetLogHandle((uint64_t)"client");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (*((_BYTE *)v35 + 24))
        v7 = "TRUE";
      else
        v7 = "FALSE";
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v39 = 1375;
      *(_WORD *)&v39[4] = 2112;
      *(_QWORD *)&v39[6] = v4;
      v40 = 2080;
      v41 = v7;
      v42 = 2080;
      v43 = "";
      _os_log_impl(&dword_1A3662000, v6, OS_LOG_TYPE_DEFAULT, "%d _CacheDeleteCacheableForVolume EXIT key: %@, result: %s%s", buf, 0x26u);
    }

    CDGetLogHandle((uint64_t)"client");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "mountPoint");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (*((_BYTE *)v35 + 24))
        v10 = "TRUE";
      else
        v10 = "FALSE";
      objc_msgSend((id)v29[5], "doubleValue");
      v12 = v11;
      objc_msgSend((id)v29[5], "doubleValue");
      days_hours_mins(v13);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend((id)v29[5], "doubleValue");
      objc_msgSend(v15, "dateWithTimeIntervalSinceNow:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67110402;
      *(_DWORD *)v39 = 1382;
      *(_WORD *)&v39[4] = 2112;
      *(_QWORD *)&v39[6] = v9;
      v40 = 2080;
      v41 = v10;
      v42 = 2048;
      v43 = v12;
      v44 = 2112;
      v45 = v14;
      v46 = 2112;
      v47 = v16;
      _os_log_impl(&dword_1A3662000, v8, OS_LOG_TYPE_DEFAULT, "%d _CacheDeleteCacheableForVolume: %@, cacheable: %s, with a duration of: %f (%@), expiring on: %@", buf, 0x3Au);

    }
    v17 = *((unsigned __int8 *)v35 + 24);

  }
  else
  {
    CDGetLogHandle((uint64_t)"client");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v39 = v1;
      _os_log_error_impl(&dword_1A3662000, v18, OS_LOG_TYPE_ERROR, "_CacheDeleteCacheableForVolume() unable to create key for volume: %@", buf, 0xCu);
    }

    v17 = *((unsigned __int8 *)v35 + 24);
  }

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v17 != 0;
}

void sub_1A367F344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

BOOL CacheDeleteCacheable()
{
  void *v0;
  void *v1;
  _BOOL8 v2;

  +[CacheDeleteVolume rootVolume](CacheDeleteVolume, "rootVolume");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
    v2 = _CacheDeleteCacheableForVolume(v0);
  else
    v2 = 0;

  return v2;
}

uint64_t CacheDeleteCurrentCacheableSpaceForVolume(const __CFURL *a1)
{
  unint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  int *v9;
  char *v10;
  int *v11;
  char *v12;
  int v13;
  void *v14;
  __int16 v15;
  char *v16;
  UInt8 buffer[1024];
  statfs v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  bzero(buffer, 0x400uLL);
  if (!CacheDeleteCacheable())
    return 0;
  memset(&v18, 0, 512);
  if (!CFURLGetFileSystemRepresentation(a1, 0, buffer, 1024))
  {
    CDGetLogHandle((uint64_t)"client");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v11 = __error();
      v12 = strerror(*v11);
      v13 = 138412546;
      v14 = a1;
      v15 = 2080;
      v16 = v12;
      _os_log_error_impl(&dword_1A3662000, v4, OS_LOG_TYPE_ERROR, "unable to get file system representation from URL: %@ : %s", (uint8_t *)&v13, 0x16u);
    }

    return 0;
  }
  v2 = paddingForVolume((uint64_t)buffer);
  if (statfs((const char *)buffer, &v18))
  {
    CDGetLogHandle((uint64_t)"client");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v9 = __error();
      v10 = strerror(*v9);
      v13 = 136315138;
      v14 = v10;
      _os_log_error_impl(&dword_1A3662000, v3, OS_LOG_TYPE_ERROR, "statfs failed: %s", (uint8_t *)&v13, 0xCu);
    }

    return 0;
  }
  v6 = v18.f_bavail * v18.f_bsize;
  v7 = v6 >= v2;
  v8 = v6 - v2;
  if (v7)
    return v8;
  else
    return 0;
}

uint64_t CacheDeleteCurrentCacheableSpace()
{
  void *v0;
  const char *v1;
  const __CFURL *v2;
  uint64_t v3;

  v0 = (void *)MEMORY[0x1E0C99E98];
  if (hasUserVolume())
    v1 = "/private/var/mobile";
  else
    v1 = "/private/var";
  objc_msgSend(v0, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v1, 1, 0);
  v2 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v3 = CacheDeleteCurrentCacheableSpaceForVolume(v2);

  return v3;
}

void CacheDeleteServiceRequest(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a2;
  v4 = a1;
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __CacheDeleteServiceRequest_block_invoke;
  v10[3] = &unk_1E4A32970;
  v11 = v4;
  v12 = v3;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __CacheDeleteServiceRequest_block_invoke_161;
  v8[3] = &unk_1E4A32998;
  v9 = v12;
  v6 = v12;
  v7 = v4;
  CallCacheD(v10, v8);

}

void sub_1A367F800(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL CacheDeleteUpdateSetting(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _QWORD v6[6];
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  CDGetLogHandle((uint64_t)"client");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v8 = a1;
    v9 = 2112;
    v10 = a2;
    _os_log_impl(&dword_1A3662000, v4, OS_LOG_TYPE_DEFAULT, "updateSettings, name: %@, value: %@", buf, 0x16u);
  }

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __CacheDeleteUpdateSetting_block_invoke;
  v6[3] = &__block_descriptor_48_e37_v16__0___CacheDeleteClientProtocol__8l;
  v6[4] = a2;
  v6[5] = a1;
  return CallCacheD(v6, 0);
}

void CacheDeletePurgeUserManagedAssets(void *a1)
{
  void *v1;
  void *v2;
  NSObject *v3;
  uint8_t buf[16];

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[CacheDeleteVolume validateVolumeAtPath:](CacheDeleteVolume, "validateVolumeAtPath:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v2, CFSTR("CACHE_DELETE_PURGE_USER_MANAGED_ASSETS"));
    v3 = objc_claimAutoreleasedReturnValue();
    CacheDeleteUpdateSetting((uint64_t)v3, *MEMORY[0x1E0C9AE50]);
  }
  else
  {
    CDGetLogHandle((uint64_t)"client");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A3662000, v3, OS_LOG_TYPE_ERROR, "CacheDeletePurgeUserManagedAssets parameter error: Missing volume name", buf, 2u);
    }
  }

}

void CacheDeleteDoNotPurgeUserManagedAssets(void *a1)
{
  void *v1;
  void *v2;
  NSObject *v3;
  uint8_t buf[16];

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[CacheDeleteVolume validateVolumeAtPath:](CacheDeleteVolume, "validateVolumeAtPath:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v2, CFSTR("CACHE_DELETE_PURGE_USER_MANAGED_ASSETS"));
    v3 = objc_claimAutoreleasedReturnValue();
    CacheDeleteUpdateSetting((uint64_t)v3, *MEMORY[0x1E0C9AE40]);
  }
  else
  {
    CDGetLogHandle((uint64_t)"client");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A3662000, v3, OS_LOG_TYPE_ERROR, "CacheDeletePurgeUserManagedAssets parameter error: Missing volume name", buf, 2u);
    }
  }

}

void *CacheDeleteCopyPurgeHistory()
{
  void *v0;
  unint64_t v1;
  FILE *v2;
  FILE *v3;
  unint64_t v4;
  void *v5;
  const char *v6;
  char *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  void *v29;
  void *v30;
  const char *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v37;
  uint64_t v38;
  int *v39;
  char *v40;
  void *v41;
  id v42;
  void *v43;
  FILE *v44;
  void *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  size_t __linecapp;
  char *__linep;
  uint8_t buf[32];
  uint64_t v54;
  void *v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  cdCachesPath();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v0)
  {
LABEL_31:
    v5 = 0;
    goto LABEL_32;
  }
  v1 = 0x1E0CB3000uLL;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%s"), v0, "CacheDeletePurgeHistory.txt");
  v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v2 = fopen((const char *)objc_msgSend(v42, "UTF8String"), "r");
  if (!v2)
  {
    CDGetLogHandle((uint64_t)"client");
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v37 = v0;
      v38 = objc_msgSend(objc_retainAutorelease(v42), "UTF8String");
      v39 = __error();
      v40 = strerror(*v39);
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = v38;
      v0 = v37;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = v40;
      _os_log_error_impl(&dword_1A3662000, v35, OS_LOG_TYPE_ERROR, "unable to open %s : %s", buf, 0x16u);
    }

    goto LABEL_31;
  }
  v3 = v2;
  v41 = v0;
  __linecapp = 1024;
  __linep = (char *)malloc_type_malloc(0x400uLL, 0x8FCFF0ADuLL);
  v4 = 0x1E0C99000uLL;
  v5 = (void *)objc_opt_new();
  bzero(__linep, 0x400uLL);
  if (getline(&__linep, &__linecapp, v3) != -1)
  {
    v6 = "line: %s";
    v43 = v5;
    v44 = v3;
    do
    {
      v7 = rindex(__linep, 10);
      if (v7)
        *v7 = 0;
      CDGetLogHandle((uint64_t)"client");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = __linep;
        _os_log_impl(&dword_1A3662000, v8, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);
      }

      if (*__linep == 80)
      {
        objc_msgSend(*(id *)(v1 + 2368), "stringWithUTF8String:", __linep + 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("|"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v10, "mutableCopy");

        objc_msgSend(v11, "objectAtIndex:", 0);
        v12 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeObjectAtIndex:", 0);
        CDGetLogHandle((uint64_t)"client");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v12;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v11;
          _os_log_impl(&dword_1A3662000, v13, OS_LOG_TYPE_DEFAULT, "timeStamp: %@, ary: %@", buf, 0x16u);
        }

        v14 = (void *)objc_opt_new();
        v15 = objc_msgSend(v11, "count");
        if (v15 == objc_msgSend(&unk_1E4A38AB8, "count"))
        {
          v45 = (void *)v12;
          v46 = v11;
          v49 = 0u;
          v50 = 0u;
          v47 = 0u;
          v48 = 0u;
          v16 = v11;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
          if (v17)
          {
            v18 = v17;
            v19 = 0;
            v20 = *(_QWORD *)v48;
            do
            {
              for (i = 0; i != v18; ++i)
              {
                if (*(_QWORD *)v48 != v20)
                  objc_enumerationMutation(v16);
                v22 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
                CDGetLogHandle((uint64_t)"client");
                v23 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(&unk_1E4A38AB8, "objectAtIndexedSubscript:", v19 + i);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  *(_QWORD *)&buf[4] = v24;
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v22;
                  _os_log_impl(&dword_1A3662000, v23, OS_LOG_TYPE_DEFAULT, "-> %@ : %@", buf, 0x16u);

                }
                objc_msgSend(&unk_1E4A38AB8, "objectAtIndexedSubscript:", v19 + i);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "setObject:forKeyedSubscript:", v22, v25);

              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
              v19 += i;
            }
            while (v18);
          }

          v26 = (void *)objc_msgSend(v14, "copy");
          v5 = v43;
          v27 = v45;
          objc_msgSend(v43, "setObject:forKeyedSubscript:", v26, v45);
          v1 = 0x1E0CB3000;
          v3 = v44;
          v4 = 0x1E0C99000;
          v6 = "line: %s";
          v11 = v46;
        }
        else
        {
          v54 = v12;
          objc_msgSend(v11, "componentsJoinedByString:", CFSTR("|"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = v26;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
          v31 = v6;
          v32 = v4;
          v33 = (void *)v12;
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v34, v33);

          v27 = v33;
          v4 = v32;
          v6 = v31;
        }

      }
      else
      {
        memset(buf, 0, sizeof(buf));
        v28 = *(_OWORD *)__linep;
        *(_OWORD *)&buf[10] = *(_OWORD *)(__linep + 10);
        *(_OWORD *)buf = v28;
        objc_msgSend(*(id *)(v1 + 2368), "stringWithUTF8String:", __linep + 26);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v1 + 2368), "stringWithUTF8String:", buf);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v29, v30);

      }
      bzero(__linep, __linecapp);
    }
    while (getline(&__linep, &__linecapp, v3) != -1);
  }

  fclose(v3);
  v0 = v41;
LABEL_32:

  return v5;
}

void sub_1A3683158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A368357C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3683680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3683784(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A36838D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3683D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id CDGetLowDiskSignpostLowSeverityLogHandle()
{
  if (qword_1ECE24240 != -1)
    dispatch_once(&qword_1ECE24240, &__block_literal_global_4);
  return (id)_MergedGlobals_4;
}

id CDGetLowDiskSignpostMediumSeverityLogHandle()
{
  if (qword_1ECE24250 != -1)
    dispatch_once(&qword_1ECE24250, &__block_literal_global_6);
  return (id)qword_1ECE24248;
}

id CDGetLowDiskSignpostHighSeverityLogHandle()
{
  if (qword_1ECE24260 != -1)
    dispatch_once(&qword_1ECE24260, &__block_literal_global_8);
  return (id)qword_1ECE24258;
}

void *getFunc(const char *a1, const char *a2)
{
  void *v4;
  void *result;
  NSObject *v6;
  const char *v7;
  int *v8;
  char *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = dlopen(a1, 1);
  if (v4)
  {
    result = dlsym(v4, a2);
    if (result)
      return result;
    CDGetLogHandle((uint64_t)"client");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = a2;
      v12 = 2080;
      v13 = (void *)a1;
      v7 = "unable to find symbol \"%s\" in \"%s\"";
LABEL_9:
      _os_log_error_impl(&dword_1A3662000, v6, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    CDGetLogHandle((uint64_t)"client");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = __error();
      v9 = strerror(*v8);
      v10 = 136315394;
      v11 = a1;
      v12 = 2080;
      v13 = v9;
      v7 = "dlopen \"%s\" failed: %s";
      goto LABEL_9;
    }
  }

  return 0;
}

id getbacktrace(uint64_t a1)
{
  _opaque_pthread_t *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  thread_stack_pcs();
  v2 = pthread_self();
  v3 = pthread_mach_thread_np(v2);
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "addObject:", CFSTR("======================================================="));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Backtrace from %s for thread %p (mach thread %d / %lld)"), a1, v2, v3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  objc_msgSend(v4, "addObject:", CFSTR("======================================================="));
  return v4;
}

id getbacktrace_short()
{
  void *v0;
  void *v1;
  int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  thread_stack_pcs();
  v0 = (void *)objc_opt_new();
  objc_msgSend(v0, "addObject:", CFSTR("\n"));
  objc_msgSend(v0, "componentsJoinedByString:", &stru_1E4A34440);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id volumeForUUID(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  void *i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id obj;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  getLocalVolumes();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v3)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        +[CacheDeleteVolume volumeWithPath:](CacheDeleteVolume, "volumeWithPath:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "uuid");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "UUIDString");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v1, "UUIDString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToString:", v9);

        if ((v10 & 1) != 0)
        {
          v2 = v5;

          goto LABEL_11;
        }

      }
      v2 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_11:

  return v2;
}

void CDSimulateCrash(uint64_t a1, void *a2)
{
  void (*v3)(uint64_t, uint64_t, id);
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  if (qword_1ECE24288 != -1)
    dispatch_once(&qword_1ECE24288, &__block_literal_global_28);
  v3 = (void (*)(uint64_t, uint64_t, id))dlsym((void *)qword_1ECE24280, "SimulateCrash");
  v4 = v6;
  if (v3)
  {
    v5 = getpid();
    v3(v5, a1, v6);
    v4 = v6;
  }

}

uint64_t traverse_directory(void *a1, void *a2)
{
  return traverse_dir_with_state(a1, 0, 0, a2);
}

uint64_t did_fast_size_directory(void *a1, _BYTE *a2)
{
  id v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  char *v11;
  _QWORD v12[2];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v12[0] = 2;
  v12[1] = 1;
  v3 = objc_retainAutorelease(a1);
  if (fsctl((const char *)objc_msgSend(v3, "fileSystemRepresentation"), 0xC1104A71uLL, v12, 0))
  {
    v4 = *__error();
    if (a2)
      *a2 = 0;
    if (v4 == 2)
    {
      v6 = 0;
    }
    else
    {
      if (v4 != 45)
      {
        CDGetLogHandle((uint64_t)"client");
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          v8 = 136315394;
          v9 = objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
          v10 = 2080;
          v11 = strerror(v4);
          _os_log_error_impl(&dword_1A3662000, v5, OS_LOG_TYPE_ERROR, "APFSIOC_DIR_STATS_OP : DIR_STATS_OP_GET failed for %s : %s", (uint8_t *)&v8, 0x16u);
        }

      }
      if (a2)
        *a2 = 0;
      v6 = traverse_dir_with_state(v3, 0, 0, 0);
    }
  }
  else
  {
    if (a2)
      *a2 = 1;
    v6 = v16 - (v17 + *((_QWORD *)&v16 + 1));
  }

  return v6;
}

uint64_t fast_size_directory(void *a1)
{
  return did_fast_size_directory(a1, 0);
}

uint64_t diskUsageList(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __diskUsageList_block_invoke;
  v7[3] = &unk_1E4A325E8;
  v8 = v3;
  v4 = v3;
  v5 = traverse_dir_with_state(a1, 0, 0, v7);

  return v5;
}

uint64_t __diskUsageList_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a3 + 8));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

  }
  if (*(_BYTE *)a3)
    *(_BYTE *)(a3 + 1) = 1;
  return 1;
}

id getLocalVolumeUUIDs()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  getLocalVolumes();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v12;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(v1);
        v6 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v5));
        VolUUID((const char *)objc_msgSend(v6, "UTF8String", (_QWORD)v11));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (v7)
        {
          objc_msgSend(v7, "UUIDString");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v0, "addObject:", v9);

        }
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v3);
  }

  return v0;
}

id getAllVolumes()
{
  void *v0;
  int v1;
  id v2;
  _QWORD v4[4];
  id v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = CDVEnumerationFlagsAll;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __getAllVolumes_block_invoke;
  v4[3] = &unk_1E4A32D60;
  v2 = v0;
  v5 = v2;
  getfsstat_b(v1, v4);

  return v2;
}

uint64_t __getAllVolumes_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2 + 88);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  return 1;
}

const __CFString *thresholdKeyForUrgency(int a1)
{
  const __CFString *v1;

  v1 = CFSTR("DESIRED_DISK_THRESHOLD");
  if (a1 == 3)
    v1 = CFSTR("LOW_DISK_THRESHOLD");
  if (a1 == 4)
    return CFSTR("VERY_LOW_DISK_THRESHOLD");
  else
    return v1;
}

uint64_t paddingForVolume(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[CacheDeleteVolume volumeWithPath:](CacheDeleteVolume, "volumeWithPath:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v2, "thresholds");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DESIRED_DISK_THRESHOLD"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME_SIZE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v5, "unsignedLongLongValue") <= 0x40000000)
      v6 = 0;
    else
      v6 = 262144000;
    v7 = v6 + objc_msgSend(v4, "unsignedLongLongValue");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id lowSpaceVolumes()
{
  void *v0;
  void *v1;
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  getLocalVolumes();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v2)
  {
    v4 = v2;
    v5 = *(_QWORD *)v20;
    *(_QWORD *)&v3 = 138412546;
    v18 = v3;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(v1);
        v7 = objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i)), "fileSystemRepresentation");
        v8 = v0;
        if (v0 && v7)
        {
          *(_DWORD *)buf = 0;
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v9 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v10, CFSTR("CACHE_DELETE_VOLUME"));

          -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          +[CacheDeleteVolume validateVolumeAtPath:](CacheDeleteVolume, "validateVolumeAtPath:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v12
            || fsctl((const char *)objc_msgSend(objc_retainAutorelease(v12), "fileSystemRepresentation"), 0x40046818uLL, buf, 0))
          {
            goto LABEL_23;
          }
          if ((*(_WORD *)buf & 0x200) != 0)
          {
            objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CD_VERYLOWDISK_EVENT"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13)
              goto LABEL_22;
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v8;
            v15 = v13;
            v16 = CFSTR("CD_VERYLOWDISK_EVENT");
          }
          else
          {
            if ((buf[0] & 4) == 0)
            {
              if ((*(_WORD *)buf & 0x2000) != 0)
              {
                objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CD_NEAR_LOW_DISK_EVENT"));
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v13)
                {
                  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v13 = (void *)objc_claimAutoreleasedReturnValue();
                  v14 = v8;
                  v15 = v13;
                  v16 = CFSTR("CD_NEAR_LOW_DISK_EVENT");
                  goto LABEL_21;
                }
LABEL_22:
                objc_msgSend(v13, "addObject:", v9, v18);

              }
LABEL_23:

              goto LABEL_24;
            }
            objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CD_LOWDISK_EVENT"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13)
              goto LABEL_22;
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v8;
            v15 = v13;
            v16 = CFSTR("CD_LOWDISK_EVENT");
          }
LABEL_21:
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, v16, v18, (_QWORD)v19);
          goto LABEL_22;
        }
        CDGetLogHandle((uint64_t)"client");
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v18;
          v25 = v0;
          v26 = 2048;
          v27 = v7;
          _os_log_error_impl(&dword_1A3662000, v9, OS_LOG_TYPE_ERROR, "parameter error, volumes: %@, path: %p", buf, 0x16u);
        }
LABEL_24:

      }
      v4 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v4);
  }

  return v0;
}

uint64_t getCacheDeleteXattr(const char *a1, void *value)
{
  uint64_t v3;
  NSObject *v4;
  int *v6;
  char *v7;
  int v8;
  const char *v9;
  __int16 v10;
  char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = 1;
  if (getxattr(a1, "com.apple.mobile.deleted", value, 1uLL, 0, 1) < 0)
  {
    if (*__error() == 93)
    {
      return 1;
    }
    else
    {
      CDGetLogHandle((uint64_t)"client");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v6 = __error();
        v7 = strerror(*v6);
        v8 = 136315394;
        v9 = a1;
        v10 = 2080;
        v11 = v7;
        _os_log_error_impl(&dword_1A3662000, v4, OS_LOG_TYPE_ERROR, "Unable to get xattr from %s : %s", (uint8_t *)&v8, 0x16u);
      }

      return 0;
    }
  }
  return v3;
}

uint64_t createCacheDeleteToken()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "UUIDString");
  v1 = objc_claimAutoreleasedReturnValue();

  return v1;
}

id evaluateDateProperty(void *a1)
{
  id v1;
  NSObject *v2;
  id v3;
  NSObject *v4;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  CDGetLogHandle((uint64_t)"client");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v1;
    _os_log_debug_impl(&dword_1A3662000, v2, OS_LOG_TYPE_DEBUG, "evaluating: %@", (uint8_t *)&v6, 0xCu);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v1;
  }
  else
  {
    CDGetLogHandle((uint64_t)"client");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v6) = 0;
      _os_log_debug_impl(&dword_1A3662000, v4, OS_LOG_TYPE_DEBUG, "value is not an NSDate, returning nil", (uint8_t *)&v6, 2u);
    }

    v3 = 0;
  }

  return v3;
}

BOOL is_first_boot()
{
  sem_t *v0;
  sem_t *v1;

  v0 = sem_open("cache_delete.fb_check", 0);
  v1 = v0;
  if (v0 != (sem_t *)-1)
    sem_close(v0);
  return v1 == (sem_t *)-1;
}

uint64_t copyNANDSizeBytes()
{
  mach_port_t v0;
  const __CFDictionary *v1;
  io_service_t MatchingService;
  io_object_t v3;
  CFTypeRef CFProperty;
  void *v5;
  CFTypeID v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  NSObject *v11;
  uint64_t v12;
  __int16 v14[8];
  uint8_t buf[2];
  __int16 v16;

  v0 = *MEMORY[0x1E0CBBAA8];
  v1 = IOBSDNameMatching(*MEMORY[0x1E0CBBAA8], 0, "disk0");
  if (!v1)
  {
    CDGetLogHandle((uint64_t)"client");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
LABEL_14:

      return 0;
    }
    v16 = 0;
    v9 = "IOBSDNameMatching failed.";
    v10 = (uint8_t *)&v16;
LABEL_17:
    _os_log_error_impl(&dword_1A3662000, v8, OS_LOG_TYPE_ERROR, v9, v10, 2u);
    goto LABEL_14;
  }
  MatchingService = IOServiceGetMatchingService(v0, v1);
  if (!MatchingService)
  {
    CDGetLogHandle((uint64_t)"client");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v9 = "IOServiceGetMatchingService failed.";
    v10 = buf;
    goto LABEL_17;
  }
  v3 = MatchingService;
  CFProperty = IORegistryEntryCreateCFProperty(MatchingService, CFSTR("Size"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  v5 = (void *)CFProperty;
  if (CFProperty && (v6 = CFGetTypeID(CFProperty), v6 == CFNumberGetTypeID()))
  {
    v7 = objc_msgSend(v5, "unsignedLongLongValue");
  }
  else
  {
    CDGetLogHandle((uint64_t)"client");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v14[0] = 0;
      _os_log_error_impl(&dword_1A3662000, v11, OS_LOG_TYPE_ERROR, "IORegistryEntryCreateCFProperty failed.", (uint8_t *)v14, 2u);
    }

    v7 = 0;
    v12 = 0;
    if (!v5)
      goto LABEL_12;
  }
  CFRelease(v5);
  v12 = v7;
LABEL_12:
  IOObjectRelease(v3);
  return v12;
}

void set_first_boot_work_completed()
{
  sem_t *v0;
  NSObject *v1;
  int *v2;
  char *v3;
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v0 = sem_open("cache_delete.fb_check", 512, 256, 0);
  if (v0 == (sem_t *)-1)
  {
    CDGetLogHandle((uint64_t)"client");
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      v2 = __error();
      v3 = strerror(*v2);
      *(_DWORD *)buf = 136315394;
      v5 = "cache_delete.fb_check";
      v6 = 2080;
      v7 = v3;
      _os_log_error_impl(&dword_1A3662000, v1, OS_LOG_TYPE_ERROR, "Failed to create semaphore %s: %s", buf, 0x16u);
    }

  }
  else
  {
    sem_close(v0);
  }
}

id cdAppSuptPath()
{
  if (qword_1ECE24298 != -1)
    dispatch_once(&qword_1ECE24298, &__block_literal_global_70);
  return (id)qword_1ECE24290;
}

void __cdAppSuptPath_block_invoke()
{
  uint64_t v0;
  void *v1;

  _persistPath(14);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECE24290;
  qword_1ECE24290 = v0;

}

id _persistPath(uint64_t a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  int *v5;
  char *v6;
  NSObject *v7;
  __int128 buf;
  void (*v10)(uint64_t);
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
  *((_QWORD *)&buf + 1) = 3221225472;
  v10 = __getDir_block_invoke;
  v11 = &__block_descriptor_40_e5_v8__0l;
  v12 = a1;
  if (getDir_onceToken != -1)
    dispatch_once(&getDir_onceToken, &buf);
  v1 = (id)getDir_result;
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("com.apple.cache_delete"));
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  if (mkdir((const char *)objc_msgSend(v2, "fileSystemRepresentation"), 0x1C0u) && *__error() != 17)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = __error();
    v6 = strerror(*v5);
    objc_msgSend(v4, "stringWithFormat:", CFSTR("unable to create directory at %@ : %s"), v2, v6, buf, v10, v11, v12, v13);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    CDGetLogHandle((uint64_t)"client");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v3;
      _os_log_error_impl(&dword_1A3662000, v7, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);
    }

  }
  else
  {
    v3 = v2;
  }

  return v3;
}

id cdCachesPath()
{
  if (qword_1ECE242A8 != -1)
    dispatch_once(&qword_1ECE242A8, &__block_literal_global_71);
  return (id)qword_1ECE242A0;
}

void __cdCachesPath_block_invoke()
{
  uint64_t v0;
  void *v1;

  _persistPath(13);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECE242A0;
  qword_1ECE242A0 = v0;

}

void pruneFile(const char *a1, uint64_t a2, off_t a3, int a4)
{
  int v8;
  int v9;
  off_t v10;
  ssize_t v11;
  size_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int *v17;
  char *v18;
  const char *v19;
  NSObject *v20;
  NSObject *v21;
  int *v22;
  char *v23;
  const char *v24;
  int *v25;
  char *v26;
  int *v27;
  char *v28;
  stat v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  memset(&v29, 0, sizeof(v29));
  if (!stat(a1, &v29) && v29.st_size >= a3)
  {
    v8 = open(a1, 2);
    if (v8 != -1)
    {
      v9 = v8;
      v10 = v29.st_size - a2;
      if (lseek(v8, v10, 0) == -1)
      {
        CDGetLogHandle((uint64_t)"client");
        v21 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          goto LABEL_25;
        v22 = __error();
        v23 = strerror(*v22);
        *(_DWORD *)buf = 136315138;
        v31 = v23;
        v24 = "pruneFile: lseek error: %s";
      }
      else
      {
        if (a4)
        {
          *(_DWORD *)buf = 0;
          do
          {
            v11 = read(v9, buf, 1uLL);
            ++v10;
          }
          while (*(_DWORD *)buf != 10 && v11 == 1);
        }
        if (v29.st_size <= v10)
          v13 = 0;
        else
          v13 = v29.st_size - v10;
        v14 = malloc_type_malloc(v13, 0x2A81DDB3uLL);
        if (v14)
        {
          v15 = v14;
          if (v13 == read(v9, v14, v13))
          {
            if (!ftruncate(v9, 0))
            {
              lseek(v9, 0, 0);
              write(v9, v15, v13);
              goto LABEL_28;
            }
            CDGetLogHandle((uint64_t)"client");
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              v17 = __error();
              v18 = strerror(*v17);
              *(_DWORD *)buf = 136315138;
              v31 = v18;
              v19 = "pruneFile: ftruncate failed: %s";
LABEL_34:
              _os_log_error_impl(&dword_1A3662000, v16, OS_LOG_TYPE_ERROR, v19, buf, 0xCu);
            }
          }
          else
          {
            CDGetLogHandle((uint64_t)"client");
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              v27 = __error();
              v28 = strerror(*v27);
              *(_DWORD *)buf = 136315138;
              v31 = v28;
              v19 = "pruneFile: read error: %s";
              goto LABEL_34;
            }
          }

LABEL_28:
          close(v9);
          free(v15);
          return;
        }
        CDGetLogHandle((uint64_t)"client");
        v21 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
LABEL_25:

          close(v9);
          return;
        }
        *(_DWORD *)buf = 134217984;
        v31 = (const char *)v13;
        v24 = "unable to malloc %zd";
      }
      _os_log_error_impl(&dword_1A3662000, v21, OS_LOG_TYPE_ERROR, v24, buf, 0xCu);
      goto LABEL_25;
    }
    CDGetLogHandle((uint64_t)"client");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v25 = __error();
      v26 = strerror(*v25);
      *(_DWORD *)buf = 136315394;
      v31 = "CacheDeletePurgeHistory.txt";
      v32 = 2080;
      v33 = v26;
      _os_log_error_impl(&dword_1A3662000, v20, OS_LOG_TYPE_ERROR, "pruneFile: open failed for %s : %s", buf, 0x16u);
    }

  }
}

uint64_t writeToCacheFile(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  int v14;
  id v15;
  const char *v16;
  const char *v17;
  size_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v23;
  int *v24;
  char *v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = v7;
  if (v7)
  {
    v9 = v7;
    goto LABEL_4;
  }
  cdCachesPath();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), v9, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = objc_retainAutorelease(v10);
      v13 = open((const char *)objc_msgSend(v12, "UTF8String"), 778, 493);
      if (v13 != -1)
      {
        v14 = v13;
        v15 = objc_retainAutorelease(v6);
        v16 = (const char *)objc_msgSend(v15, "cStringUsingEncoding:", 4);
        if (v16)
        {
          v17 = v16;
          v18 = strlen(v16);
          write(v14, v17, v18);
          v19 = 0;
        }
        else
        {
          CDGetLogHandle((uint64_t)"client");
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v27 = (uint64_t)v15;
            _os_log_error_impl(&dword_1A3662000, v21, OS_LOG_TYPE_ERROR, "Unable to get C string from: %@", buf, 0xCu);
          }

          v19 = 0xFFFFFFFFLL;
        }

        close(v14);
        goto LABEL_17;
      }
      CDGetLogHandle((uint64_t)"client");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v23 = objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
        v24 = __error();
        v25 = strerror(*v24);
        *(_DWORD *)buf = 136315394;
        v27 = v23;
        v28 = 2080;
        v29 = v25;
        _os_log_error_impl(&dword_1A3662000, v20, OS_LOG_TYPE_ERROR, "open failed for %s : %s", buf, 0x16u);
      }

    }
    v19 = 0xFFFFFFFFLL;
LABEL_17:

    goto LABEL_18;
  }
  v19 = 0xFFFFFFFFLL;
LABEL_18:

  return v19;
}

uint64_t markNotifiedVolume(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v14;
  int *v15;
  char *v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  cdAppSuptPath();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[CacheDeleteVolume volumeWithPath:](CacheDeleteVolume, "volumeWithPath:", v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v3, "uuid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "UUIDString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("%s%@"), "CacheDeleteLowDiskNotification_", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v2, "stringByAppendingPathComponent:", v8);
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v10 = open((const char *)objc_msgSend(v9, "UTF8String"), 512, 448);
      if (v10 == -1)
      {
        CDGetLogHandle((uint64_t)"client");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v14 = objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
          v15 = __error();
          v16 = strerror(*v15);
          *(_DWORD *)buf = 136315394;
          v18 = v14;
          v19 = 2080;
          v20 = v16;
          _os_log_error_impl(&dword_1A3662000, v12, OS_LOG_TYPE_ERROR, "open failed for %s : %s", buf, 0x16u);
        }

        v11 = 0xFFFFFFFFLL;
      }
      else
      {
        close(v10);
        v11 = 0;
      }

    }
    else
    {
      v11 = 0xFFFFFFFFLL;
    }

  }
  else
  {
    v11 = 0xFFFFFFFFLL;
  }

  return v11;
}

void enumerateNotifiedVolumes(void *a1)
{
  id v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = a1;
  cdAppSuptPath();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __enumerateNotifiedVolumes_block_invoke;
    v3[3] = &unk_1E4A32610;
    v4 = v1;
    traverse_dir_with_state(v2, 0, 0, v3);

  }
}

uint64_t __enumerateNotifiedVolumes_block_invoke(uint64_t a1, const char *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (*a3)
  {
    a3[1] = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v6, "rangeOfString:", CFSTR("CacheDeleteLowDiskNotification_"))
      && v7 == objc_msgSend(CFSTR("CacheDeleteLowDiskNotification_"), "length"))
    {
      objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("_"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v9);
      volumeForUUID(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      CDGetLogHandle((uint64_t)"client");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 136315138;
        v15 = a2;
        _os_log_impl(&dword_1A3662000, v12, OS_LOG_TYPE_DEFAULT, "enumerateNotifiedVolumes removing: %s", (uint8_t *)&v14, 0xCu);
      }

      unlink(a2);
    }

  }
  return 1;
}

id sentinelDir()
{
  void *v0;
  void *v1;
  void *v2;

  cdCachesPath();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
  {
    objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("FSPurgeSentinel"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id dropBreadcrumb(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  int v5;
  id v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v12;
  int *v13;
  char *v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  breadcrumbFilename(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    CDGetLogHandle((uint64_t)"client");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      v6 = 0;
      goto LABEL_8;
    }
    *(_DWORD *)buf = 138543362;
    v16 = (uint64_t)v1;
    v8 = "breadcrumbFile: Unable to create path for volume: %{public}@";
    v9 = v7;
    v10 = 12;
LABEL_10:
    _os_log_error_impl(&dword_1A3662000, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
    goto LABEL_7;
  }
  v4 = objc_retainAutorelease(v2);
  v5 = open((const char *)objc_msgSend(v4, "UTF8String"), 514, 448);
  if (v5 == -1)
  {
    CDGetLogHandle((uint64_t)"client");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v12 = objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    v13 = __error();
    v14 = strerror(*v13);
    *(_DWORD *)buf = 136446466;
    v16 = v12;
    v17 = 2082;
    v18 = v14;
    v8 = "breadcrumbFile: Unable to create file at: %{public}s : %{public}s";
    v9 = v7;
    v10 = 22;
    goto LABEL_10;
  }
  close(v5);
  v6 = v4;
LABEL_8:

  return v6;
}

id breadcrumbFilename(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  breadcrumbDir();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("|"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s%@"), "notifyPurgeFor_", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringByAppendingPathComponent:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    CDGetLogHandle((uint64_t)"client");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v9 = v1;
      _os_log_error_impl(&dword_1A3662000, v6, OS_LOG_TYPE_ERROR, "breadcrumbFilename: Unable to get breadcrumb directory for volume: %{public}@", buf, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

void removeBreadcrumb(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  breadcrumbFilename(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    unlink((const char *)objc_msgSend(objc_retainAutorelease(v2), "UTF8String"));
    CDGetLogHandle((uint64_t)"client");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = v1;
      _os_log_impl(&dword_1A3662000, v4, OS_LOG_TYPE_DEFAULT, "unlinked breadcrumb file for volume %@", (uint8_t *)&v5, 0xCu);
    }

  }
}

id breadcrumbs()
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  breadcrumbDir();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __breadcrumbs_block_invoke;
  v5[3] = &unk_1E4A32DF0;
  v5[4] = &v6;
  traverse_dir_with_state(v0, 0, 0, v5);

  CDGetLogHandle((uint64_t)"client");
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    v2 = v7[5];
    *(_DWORD *)buf = 138543362;
    v13 = v2;
    _os_log_impl(&dword_1A3662000, v1, OS_LOG_TYPE_DEFAULT, "breadcrumbs: %{public}@", buf, 0xCu);
  }

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void sub_1A3686638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

NSObject *breadcrumbDir()
{
  void *v0;
  void *v1;
  NSObject *v2;
  NSObject *v3;
  int *v5;
  char *v6;
  int v7;
  NSObject *v8;
  __int16 v9;
  char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _persistPath(13);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (!v0)
  {
    CDGetLogHandle((uint64_t)"client");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v7) = 0;
      _os_log_error_impl(&dword_1A3662000, v2, OS_LOG_TYPE_ERROR, "breadcrumbDir: Unable to create breadcrumb directory path", (uint8_t *)&v7, 2u);
    }
    goto LABEL_9;
  }
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("CacheDeleteBreadcumbs"));
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  if (mkdir((const char *)-[NSObject UTF8String](v2, "UTF8String"), 0x1EDu) && *__error() != 17)
  {
    CDGetLogHandle((uint64_t)"client");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = __error();
      v6 = strerror(*v5);
      v7 = 138412546;
      v8 = v2;
      v9 = 2080;
      v10 = v6;
      _os_log_error_impl(&dword_1A3662000, v3, OS_LOG_TYPE_ERROR, "breadcrumbDir: Unable to create breadcrumb directory %@ : %s", (uint8_t *)&v7, 0x16u);
    }

LABEL_9:
    v2 = 0;
  }

  return v2;
}

uint64_t __breadcrumbs_block_invoke(uint64_t a1, const char *a2, _BYTE *a3)
{
  void *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  char *v20;
  void *v21;
  char *v22;
  int v24;
  const char *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  NSObject *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!*a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsString:", CFSTR("notifyPurgeFor_"));

    CDGetLogHandle((uint64_t)"client");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (!v6)
    {
      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
        v22 = (char *)objc_claimAutoreleasedReturnValue();
        v24 = 138543362;
        v25 = v22;
        _os_log_impl(&dword_1A3662000, v7, OS_LOG_TYPE_DEFAULT, "breadcrumbs: Not a breadcrumb file: %{public}@", (uint8_t *)&v24, 0xCu);

      }
      goto LABEL_23;
    }
    if (v8)
    {
      v24 = 136315138;
      v25 = a2;
      _os_log_impl(&dword_1A3662000, v7, OS_LOG_TYPE_DEFAULT, "Found breadcrumb at %s", (uint8_t *)&v24, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("notifyPurgeFor_"));
    v7 = objc_claimAutoreleasedReturnValue();

    -[NSObject objectAtIndex:](v7, "objectAtIndex:", -[NSObject count](v7, "count") - 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CDGetLogHandle((uint64_t)"client");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 136315394;
      v25 = "breadcrumbs_block_invoke";
      v26 = 2112;
      v27 = v10;
      _os_log_impl(&dword_1A3662000, v11, OS_LOG_TYPE_DEFAULT, "%s volumeString %@", (uint8_t *)&v24, 0x16u);
    }

    if (v10)
    {
      objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("|"), CFSTR("/"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      +[CacheDeleteVolume validateVolumeAtPath:](CacheDeleteVolume, "validateVolumeAtPath:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      CDGetLogHandle((uint64_t)"client");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v24 = 136315650;
        v25 = "breadcrumbs_block_invoke";
        v26 = 2112;
        v27 = v12;
        v28 = 2112;
        v29 = v13;
        _os_log_impl(&dword_1A3662000, v14, OS_LOG_TYPE_DEFAULT, "%s %@ %@", (uint8_t *)&v24, 0x20u);
      }

      if (v13)
      {
        v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
        if (!v15)
        {
          v16 = objc_opt_new();
          v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
          v18 = *(void **)(v17 + 40);
          *(_QWORD *)(v17 + 40) = v16;

          v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
        }
        objc_msgSend(v15, "addObject:", v13);
        CDGetLogHandle((uint64_t)"client");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
          v20 = (char *)objc_claimAutoreleasedReturnValue();
          -[NSObject objectAtIndex:](v7, "objectAtIndex:", -[NSObject count](v7, "count") - 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = 138543618;
          v25 = v20;
          v26 = 2114;
          v27 = v21;
          _os_log_impl(&dword_1A3662000, v19, OS_LOG_TYPE_DEFAULT, "breadcrumbs: volume for %{public}@ : %{public}@", (uint8_t *)&v24, 0x16u);

        }
LABEL_22:

LABEL_23:
        return 1;
      }
    }
    else
    {
      v12 = 0;
    }
    CDGetLogHandle((uint64_t)"client");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v24 = 136446210;
      v25 = a2;
      _os_log_error_impl(&dword_1A3662000, v13, OS_LOG_TYPE_ERROR, "breadcrumbs: Unable to validate volume from %{public}s", (uint8_t *)&v24, 0xCu);
    }
    goto LABEL_22;
  }
  a3[1] = 0;
  return 1;
}

id thresholdsForMountPoint(uint64_t a1)
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__2;
  v9 = __Block_byref_object_dispose__2;
  v10 = 0;
  if (qword_1ECE242B8 != -1)
    dispatch_once(&qword_1ECE242B8, &__block_literal_global_88);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __thresholdsForMountPoint_block_invoke_2;
  v4[3] = &unk_1E4A32E38;
  v4[4] = &v5;
  v4[5] = a1;
  dispatch_sync((dispatch_queue_t)qword_1ECE242B0, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __thresholdsForMountPoint_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.cache_delete.volume_thresholds", v2);
  v1 = (void *)qword_1ECE242B0;
  qword_1ECE242B0 = (uint64_t)v0;

}

void __thresholdsForMountPoint_block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint32_t f_bsize;
  NSObject *v9;
  int *v10;
  char *v11;
  char *v12;
  NSObject *v13;
  int *v14;
  char *v15;
  char *v16;
  NSObject *v17;
  int *v18;
  char *v19;
  char *v20;
  NSObject *v21;
  int *v22;
  char *v23;
  char *v24;
  uint64_t v25;
  void *v26;
  char *v27;
  int *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[4];
  char *v33;
  __int16 v34;
  char *v35;
  __int16 v36;
  uint64_t v37;
  statfs v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  bzero(&v38, 0x878uLL);
  if (statfs(*(const char **)(a1 + 40), &v38))
  {
    CDGetLogHandle((uint64_t)"client");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v27 = *(char **)(a1 + 40);
      v28 = __error();
      v29 = strerror(*v28);
      *(_DWORD *)buf = 136315394;
      v33 = v27;
      v34 = 2080;
      v35 = v29;
      _os_log_error_impl(&dword_1A3662000, v2, OS_LOG_TYPE_ERROR, "unable to stat volume: %s : %s", buf, 0x16u);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v6 = v38.f_blocks * v38.f_bsize;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v7, CFSTR("CACHE_DELETE_VOLUME_SIZE"));

    v30 = 0;
    v31 = 0;
    f_bsize = v38.f_bsize;
    if (fsctl(*(const char **)(a1 + 40), 0x4004681DuLL, &v30, 0))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", &unk_1E4A38BA8, CFSTR("DESIRED_DISK_THRESHOLD"));
      CDGetLogHandle((uint64_t)"client");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = __error();
        v11 = strerror(*v10);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKeyedSubscript:", CFSTR("DESIRED_DISK_THRESHOLD"));
        v12 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v33 = v11;
        v34 = 2112;
        v35 = v12;
        v36 = 2048;
        v37 = v6;
        _os_log_error_impl(&dword_1A3662000, v9, OS_LOG_TYPE_ERROR, "fsctl error: %s, using HARDCODED desired threshold %@ for volume_size: %llu", buf, 0x20u);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v30 * (unint64_t)f_bsize);
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v9, CFSTR("DESIRED_DISK_THRESHOLD"));
    }

    if (fsctl(*(const char **)(a1 + 40), 0x40044A12uLL, (char *)&v30 + 4, 0))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", &unk_1E4A38BC0, CFSTR("NEAR_LOW_DISK_THRESHOLD"));
      CDGetLogHandle((uint64_t)"client");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = __error();
        v15 = strerror(*v14);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKeyedSubscript:", CFSTR("NEAR_LOW_DISK_THRESHOLD"));
        v16 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v33 = v15;
        v34 = 2112;
        v35 = v16;
        v36 = 2048;
        v37 = v6;
        _os_log_error_impl(&dword_1A3662000, v13, OS_LOG_TYPE_ERROR, "fsctl error: %s, using HARDCODED low disk threshold %@ for volume_size: %llu", buf, 0x20u);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", HIDWORD(v30) * (unint64_t)f_bsize);
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v13, CFSTR("NEAR_LOW_DISK_THRESHOLD"));
    }

    if (fsctl(*(const char **)(a1 + 40), 0x4004681CuLL, &v31, 0))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", &unk_1E4A38BD8, CFSTR("LOW_DISK_THRESHOLD"));
      CDGetLogHandle((uint64_t)"client");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = __error();
        v19 = strerror(*v18);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKeyedSubscript:", CFSTR("LOW_DISK_THRESHOLD"));
        v20 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v33 = v19;
        v34 = 2112;
        v35 = v20;
        v36 = 2048;
        v37 = v6;
        _os_log_error_impl(&dword_1A3662000, v17, OS_LOG_TYPE_ERROR, "fsctl error: %s, using HARDCODED low disk threshold %@ for volume_size: %llu", buf, 0x20u);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v31 * (unint64_t)f_bsize);
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v17, CFSTR("LOW_DISK_THRESHOLD"));
    }

    if (fsctl(*(const char **)(a1 + 40), 0x4004681BuLL, (char *)&v31 + 4, 0))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", &unk_1E4A38BF0, CFSTR("VERY_LOW_DISK_THRESHOLD"));
      CDGetLogHandle((uint64_t)"client");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = __error();
        v23 = strerror(*v22);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKeyedSubscript:", CFSTR("VERY_LOW_DISK_THRESHOLD"));
        v24 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v33 = v23;
        v34 = 2112;
        v35 = v24;
        v36 = 2048;
        v37 = v6;
        _os_log_error_impl(&dword_1A3662000, v21, OS_LOG_TYPE_ERROR, "fsctl error: %s, using HARDCODED very low disk threshold %@ for volume_size: %llu", buf, 0x20u);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", HIDWORD(v31) * (unint64_t)f_bsize);
      v21 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v21, CFSTR("VERY_LOW_DISK_THRESHOLD"));
    }

    if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "count"))
    {
      v25 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v26 = *(void **)(v25 + 40);
      *(_QWORD *)(v25 + 40) = 0;

    }
  }
}

id tallyDict(void *a1)
{
  id v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    CDGetLogHandle((uint64_t)"client");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v1;
      _os_log_error_impl(&dword_1A3662000, v2, OS_LOG_TYPE_ERROR, "dict is not a dictionary: %@, returning 0", buf, 0xCu);
    }
    goto LABEL_19;
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = v1;
  v3 = -[NSObject countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (!v3)
  {
LABEL_19:
    v5 = 0;
    goto LABEL_20;
  }
  v4 = v3;
  v15 = v1;
  v5 = 0;
  v6 = *(_QWORD *)v17;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v17 != v6)
        objc_enumerationMutation(v2);
      v8 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
      -[NSObject objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_14;
        tallyDict(v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v12;
        goto LABEL_12;
      }
      -[NSObject objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      evaluateNumberProperty(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = v11;
LABEL_12:
        v5 += objc_msgSend(v12, "unsignedLongLongValue");
      }

LABEL_14:
    }
    v4 = -[NSObject countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  }
  while (v4);
  v1 = v15;
LABEL_20:

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id normalizePath(void *a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  char *v8;
  void *v9;
  void *v10;
  id v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char *f_mntonname;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  int *v24;
  char *v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  char *v29;
  statfs v30;
  char v31[1024];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "componentsSeparatedByString:", CFSTR("/"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = (void *)objc_opt_new();
  if (objc_msgSend(v3, "count"))
  {
    v6 = 0;
    while (1)
    {
      bzero(v31, 0x400uLL);
      objc_msgSend(v4, "componentsJoinedByString:", CFSTR("/"));
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v8 = realpath_DARWIN_EXTSN((const char *)objc_msgSend(v7, "UTF8String"), v31);

      if (v8)
        break;
      objc_msgSend(v4, "objectAtIndex:", objc_msgSend(v4, "count") - 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v9);

      objc_msgSend(v4, "removeObjectAtIndex:", objc_msgSend(v4, "count") - 1);
      if (++v6 >= (unint64_t)objc_msgSend(v3, "count"))
        goto LABEL_5;
    }
    if (a2)
    {
      bzero(&v30, 0x878uLL);
      objc_msgSend(v4, "componentsJoinedByString:", CFSTR("/"));
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v13 = statfs((const char *)objc_msgSend(v12, "UTF8String"), &v30);

      CDGetLogHandle((uint64_t)"client");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (!v13)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v30.f_mntonname);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v27 = (uint64_t)v21;
          _os_log_impl(&dword_1A3662000, v15, OS_LOG_TYPE_DEFAULT, "returning mountPoint: %@", buf, 0xCu);

        }
        v20 = (void *)MEMORY[0x1E0CB3940];
        f_mntonname = v30.f_mntonname;
        goto LABEL_18;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "componentsJoinedByString:", CFSTR("/"));
        v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v23 = objc_msgSend(v22, "UTF8String");
        v24 = __error();
        v25 = strerror(*v24);
        *(_DWORD *)buf = 136315394;
        v27 = v23;
        v28 = 2080;
        v29 = v25;
        _os_log_error_impl(&dword_1A3662000, v15, OS_LOG_TYPE_ERROR, "statfs failed for %s : %s", buf, 0x16u);

      }
    }
    v16 = objc_msgSend(v5, "count");
    v17 = (void *)MEMORY[0x1E0CB3940];
    if (v16)
    {
      objc_msgSend(v5, "componentsJoinedByString:", CFSTR("/"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("%s/%@"), v31, v18);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
    f_mntonname = v31;
    v20 = (void *)MEMORY[0x1E0CB3940];
LABEL_18:
    objc_msgSend(v20, "stringWithUTF8String:", f_mntonname);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
LABEL_5:
  v10 = 0;
LABEL_6:

  return v10;
}

id days_hours_mins(double a1)
{
  unint64_t v1;
  char __str[2];
  _BYTE v4[14];

  *(_QWORD *)&v4[6] = *MEMORY[0x1E0C80C00];
  v1 = (unint64_t)a1;
  snprintf(__str, 6uLL, "%f", a1 - (double)(unint64_t)a1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu d, %llu h, %llu m, %llu.%s s"), v1 / 0x15180, v1 % 0x15180 / 0xE10, v1 % 0x15180 % 0xE10 / 0x3C, v1 % 0x15180 % 0xE10 % 0x3C, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id dataContainerURLs(void *a1)
{
  id v1;
  void *v2;
  xpc_object_t v3;
  int iterate_results_sync;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  void *v9;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  v16 = (id)objc_opt_new();
  v2 = (void *)MEMORY[0x1A8591C18]();
  if (container_query_create())
  {
    container_query_set_class();
    container_query_operation_set_flags();
    container_query_set_include_other_owners();
    v3 = xpc_string_create((const char *)objc_msgSend(objc_retainAutorelease(v1), "UTF8String"));
    container_query_set_identifiers();

    container_query_operation_set_platform();
    iterate_results_sync = container_query_iterate_results_sync();
    container_query_get_last_error();
    v5 = (void *)container_error_copy_unlocalized_description();
    CDGetLogHandle((uint64_t)"client");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (iterate_results_sync)
    {
      if (v7)
      {
        *(_DWORD *)buf = 136315138;
        v18 = v5;
        v8 = "container_query_iterate_results_sync succeeded; %s";
LABEL_7:
        _os_log_impl(&dword_1A3662000, v6, OS_LOG_TYPE_DEFAULT, v8, buf, 0xCu);
      }
    }
    else if (v7)
    {
      *(_DWORD *)buf = 136315138;
      v18 = v5;
      v8 = "container_query_iterate_results_sync failed; %s";
      goto LABEL_7;
    }

    free(v5);
    container_query_free();
  }
  objc_autoreleasePoolPop(v2);
  v9 = (void *)objc_msgSend((id)v12[5], "copy");
  _Block_object_dispose(&v11, 8);

  return v9;
}

void sub_1A3687B8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __dataContainerURLs_block_invoke(uint64_t a1)
{
  uint64_t path;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t persona_unique_string;
  __CFString *v6;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  path = container_get_path();
  CDGetLogHandle((uint64_t)"client");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (path)
  {
    if (v4)
    {
      v8 = 136315138;
      v9 = path;
      _os_log_impl(&dword_1A3662000, v3, OS_LOG_TYPE_DEFAULT, "path: %s\n", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", path, 1, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      persona_unique_string = container_get_persona_unique_string();
      if (!persona_unique_string
        || (objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", persona_unique_string),
            (v6 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        v6 = CFSTR("NO_PERSONA_AVAILABLE");
      }
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v3, v6);

    }
  }
  else if (v4)
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_1A3662000, v3, OS_LOG_TYPE_DEFAULT, "data container path is not returned", (uint8_t *)&v8, 2u);
  }

  return 1;
}

double elapsedNanoSeconds(double a1, double a2)
{
  _initgTimebaseConversion();
  return (a2 - a1) * *(double *)&gTimebaseConversion;
}

double elapsedSeconds(double a1, double a2)
{
  _initgTimebaseConversion();
  return (a2 - a1) * *(double *)&gTimebaseConversion / 1000000000.0;
}

BOOL CallCacheDPublic(void *a1, void *a2)
{
  return CallBlockWithProxy(CFSTR("com.apple.cache_delete.public"), &unk_1EE6C8C30, a1, a2);
}

void __getDir_block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  NSSearchPathForDirectoriesInDomains(*(NSSearchPathDirectory *)(a1 + 32), 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CDGetLogHandle((uint64_t)"client");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v7 = 134218242;
    v8 = v4;
    v9 = 2112;
    v10 = v2;
    _os_log_impl(&dword_1A3662000, v3, OS_LOG_TYPE_DEFAULT, "getDir(%lu): %@", (uint8_t *)&v7, 0x16u);
  }

  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)getDir_result;
  getDir_result = v5;

}

void setPurgeMarker(void *a1, void *a2, char a3, FSEventStreamEventId a4)
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  FSEventStreamEventId CurrentEventId;
  FSEventStreamEventId v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  id v35;
  void *v36;
  void *v37;
  NSObject *v38;
  uint8_t buf[4];
  NSObject *v40;
  __int16 v41;
  NSObject *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  +[CacheDeleteVolume volumeWithPath:](CacheDeleteVolume, "volumeWithPath:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    -[NSObject FSEventsUUID](v9, "FSEventsUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject uuid](v10, "uuid");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v11)
      v14 = v12 == 0;
    else
      v14 = 1;
    if (!v14)
    {
      domain(v7);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = objc_alloc_init(MEMORY[0x1E0C99EA0]);
      v17 = v16;
      if (!v16)
      {
        CDGetLogHandle((uint64_t)"client");
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v40 = v15;
          _os_log_error_impl(&dword_1A3662000, v20, OS_LOG_TYPE_ERROR, "setPurgeMarker(%{public}@): Unable to create NSUserDefaults", buf, 0xCu);
        }
        goto LABEL_33;
      }
      objc_msgSend(v16, "objectForKey:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v36 = v18;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = objc_msgSend(v18, "mutableCopy");
      }
      else
      {
        CDGetLogHandle((uint64_t)"client");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v40 = v15;
          _os_log_impl(&dword_1A3662000, v21, OS_LOG_TYPE_DEFAULT, "setPurgeMarker(%{public}@): Creating new defaults", buf, 0xCu);
        }

        v19 = objc_opt_new();
      }
      v22 = v19;
      v37 = v17;
      v38 = v19;
      if (-[NSObject count](v19, "count"))
      {
        v35 = v7;
        objc_msgSend(v13, "UUIDString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_msgSend(v24, "mutableCopy");

        if ((a3 & 1) != 0)
        {
          v7 = v35;
        }
        else
        {
          v7 = v35;
          if (v25)
            goto LABEL_30;
        }
      }
      else
      {
        v25 = 0;
      }
      CurrentEventId = FSEventsGetCurrentEventId();
      if (CurrentEventId <= a4 || a4 == 0)
        v28 = CurrentEventId;
      else
        v28 = a4;
      v29 = (void *)objc_opt_new();

      objc_msgSend(v11, "UUIDString");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setObject:atIndexedSubscript:", v30, 0);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v28);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setObject:atIndexedSubscript:", v31, 1);

      objc_msgSend(v13, "UUIDString");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v38, "setObject:forKeyedSubscript:", v29, v32);

      v33 = -[NSObject copy](v38, "copy");
      objc_msgSend(v37, "setObject:forKey:", v33, v15);

      v25 = v29;
LABEL_30:
      CDGetLogHandle((uint64_t)"client");
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v40 = v15;
        v41 = 2114;
        v42 = v38;
        _os_log_impl(&dword_1A3662000, v34, OS_LOG_TYPE_DEFAULT, "setPurgeMarker(%{public}@): cacheDeleteAppDefaults: %{public}@", buf, 0x16u);
      }

      v17 = v37;
      v20 = v38;
LABEL_33:

      goto LABEL_34;
    }
  }
  else
  {
    v11 = 0;
    v13 = 0;
  }
  CDGetLogHandle((uint64_t)"client");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138544130;
    v40 = v8;
    v41 = 2112;
    v42 = v10;
    v43 = 2112;
    v44 = v11;
    v45 = 2112;
    v46 = v13;
    _os_log_error_impl(&dword_1A3662000, v15, OS_LOG_TYPE_ERROR, "setPurgeMarker: Unable to make CacheDeleteVolume from %{public}@, cdVolume: %@, FSEventsUUID: %@ UUID %@", buf, 0x2Au);
  }
LABEL_34:

}

void _CacheDeleteEnumerateRemovedFiles(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  CDGetLogHandle((uint64_t)"client");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v18 = a1;
    v19 = 2048;
    v20 = a2;
    v21 = 2114;
    v22 = a3;
    _os_log_impl(&dword_1A3662000, v8, OS_LOG_TYPE_DEFAULT, "_CacheDeleteEnumerateRemovedFiles ENTRY, id: %{public}@, since: %llu, directories: %{public}@", buf, 0x20u);
  }

  if (qword_1ECE242E8 != -1)
    dispatch_once(&qword_1ECE242E8, &__block_literal_global_7);
  v9 = _MergedGlobals_6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = ___CacheDeleteEnumerateRemovedFiles_block_invoke_82;
  v12[3] = &unk_1E4A32F20;
  v13 = v7;
  v14 = a2;
  v15 = a3;
  v16 = a1;
  v10 = v7;
  dispatch_sync(v9, v12);
  CDGetLogHandle((uint64_t)"client");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3662000, v11, OS_LOG_TYPE_DEFAULT, "_CacheDeleteEnumerateRemovedFiles EXIT", buf, 2u);
  }

}

void sub_1A368AE20(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x268], 8);
  _Unwind_Resume(a1);
}

__CFString *CDPurgeMarkerDescription(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  if (a1)
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", a1);
    objc_msgSend(v2, "UUIDString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", a1 + 16);
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PurgeMarker vol_uuid: %@, fs_events_uuid: %@, evt_id: %llu"), v3, v5, *(_QWORD *)(a1 + 32));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = CFSTR("NULL PurgeMarker");
  }
  return v6;
}

void fsEventStreamCallback(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  char *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  int v17;
  NSObject *v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  int v29;
  NSObject *v30;
  NSObject *v31;
  char *v32;
  NSObject *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  char *v40;
  void *v41;
  void *v42;
  char *v43;
  NSObject *v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  char *v50;
  NSObject *v51;
  __int128 v52;
  void *v53;
  id v54;
  NSObject *v58;
  id obj;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  const __CFString *v69;
  void *v70;
  const __CFString *v71;
  void *v72;
  _QWORD v73[3];
  _QWORD v74[3];
  uint8_t buf[4];
  char *v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  id v80;
  __int16 v81;
  void *v82;
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v54 = a2;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  obj = v7;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v64, v83, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v65 != v10)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * i), "allValues");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "componentsJoinedByString:", CFSTR(" "));
        v13 = (char *)objc_claimAutoreleasedReturnValue();

        CDGetLogHandle((uint64_t)"client");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v76 = v13;
          _os_log_impl(&dword_1A3662000, v14, OS_LOG_TYPE_DEFAULT, "fsEventStreamCallback event: %@", buf, 0xCu);
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v83, 16);
    }
    while (v9);
  }
  v15 = v54;
  if (!v54)
    goto LABEL_15;
  if (objc_msgSend(v54, "historyDone"))
  {
    CDGetLogHandle((uint64_t)"client");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_msgSend(v54, "historyDone");
      *(_DWORD *)buf = 138412546;
      v76 = (char *)v54;
      v77 = 1024;
      LODWORD(v78) = v17;
      _os_log_impl(&dword_1A3662000, v16, OS_LOG_TYPE_DEFAULT, "fsEventStreamCallback: CDConsumer %@ historyDone %d", buf, 0x12u);
    }

LABEL_15:
    CDGetLogHandle((uint64_t)"client");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3662000, v18, OS_LOG_TYPE_DEFAULT, "fsEventStreamCallback: returning...", buf, 2u);
    }
    goto LABEL_55;
  }
  v18 = objc_opt_new();
  timeStamp();
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = a6;
  v20 = a5;
  if (a3)
  {
    v22 = 0;
    *(_QWORD *)&v19 = 136446210;
    v52 = v19;
    do
    {
      v23 = *(_DWORD *)(v20 + 4 * v22);
      if ((v23 & 0x100200) != 0)
      {
        objc_msgSend(obj, "objectAtIndex:", v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("path"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("fileID"));
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = (void *)v26;
        if (v25)
        {
          if (v26)
          {
            if ((*(_DWORD *)(a5 + 4 * v22) & 0x100200) != 0)
            {
              v28 = objc_retainAutorelease(v25);
              if (access((const char *)objc_msgSend(v28, "UTF8String"), 0))
              {
                v29 = *__error();
                CDGetLogHandle((uint64_t)"client");
                v30 = objc_claimAutoreleasedReturnValue();
                v31 = v30;
                if (v29 == 2)
                {
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                  {
                    v32 = *(char **)(a6 + 8 * v22);
                    *(_DWORD *)buf = 134218754;
                    v76 = v32;
                    v77 = 2112;
                    v78 = v27;
                    v79 = 2112;
                    v80 = v28;
                    v81 = 2112;
                    v82 = v53;
                    _os_log_impl(&dword_1A3662000, v31, OS_LOG_TYPE_DEFAULT, "fsEventStreamCallback adding goner (eventID %llu): %@ : %@ : %@", buf, 0x2Au);
                  }

                  v73[0] = CFSTR("fileID");
                  v73[1] = CFSTR("path");
                  v74[0] = v27;
                  v74[1] = v28;
                  v73[2] = CFSTR("timestamp");
                  v74[2] = v53;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, v73, 3);
                  v31 = objc_claimAutoreleasedReturnValue();
                  -[NSObject addObject:](v18, "addObject:", v31);
                }
                else if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                {
                  v43 = strerror(v29);
                  *(_DWORD *)buf = v52;
                  v76 = v43;
                  _os_log_error_impl(&dword_1A3662000, v31, OS_LOG_TYPE_ERROR, "fsEventStreamCallback: Unexpected fsgetpath error: %{public}s", buf, 0xCu);
                }

                v21 = a6;
              }
            }
          }
        }

        v20 = a5;
        v23 = *(_DWORD *)(a5 + 4 * v22);
      }
      if ((v23 & 0xF) != 0)
      {
        CDGetLogHandle((uint64_t)"client");
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          v34 = *(_DWORD *)(v20 + 4 * v22);
          *(_DWORD *)buf = 67109120;
          LODWORD(v76) = v34;
          _os_log_impl(&dword_1A3662000, v33, OS_LOG_TYPE_DEFAULT, "fsEventStreamCallback rescan: 0x%u", buf, 8u);
        }

        objc_msgSend(v54, "identifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "volume");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        setPurgeMarker(v35, v36, 1, *(_QWORD *)(v21 + 8 * v22));

        v71 = CFSTR("rescan");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(v20 + 4 * v22));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = v37;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject addObject:](v18, "addObject:", v38);

        objc_msgSend(v54, "setHistoryDone:", 1);
        v23 = *(_DWORD *)(v20 + 4 * v22);
      }
      if ((v23 & 0x10) != 0)
      {
        CDGetLogHandle((uint64_t)"client");
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          v40 = *(char **)(v21 + 8 * v22);
          *(_DWORD *)buf = 134217984;
          v76 = v40;
          _os_log_impl(&dword_1A3662000, v39, OS_LOG_TYPE_DEFAULT, "fsEventStreamCallback, eventID: %llu historyDone", buf, 0xCu);
        }

        v69 = CFSTR("historyDone");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v21 + 8 * v22));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = v41;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject addObject:](v18, "addObject:", v42);

        objc_msgSend(v54, "setHistoryDone:", 1);
      }
      ++v22;
    }
    while (a3 != v22);
  }
  if (-[NSObject count](v18, "count", v52))
  {
    CDGetLogHandle((uint64_t)"client");
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3662000, v44, OS_LOG_TYPE_DEFAULT, "fsEventStreamCallback, calling consumer with:", buf, 2u);
    }

    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v58 = v18;
    v45 = v18;
    v46 = -[NSObject countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
    if (v46)
    {
      v47 = v46;
      v48 = *(_QWORD *)v61;
      do
      {
        for (j = 0; j != v47; ++j)
        {
          if (*(_QWORD *)v61 != v48)
            objc_enumerationMutation(v45);
          v50 = *(char **)(*((_QWORD *)&v60 + 1) + 8 * j);
          CDGetLogHandle((uint64_t)"client");
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v76 = v50;
            _os_log_impl(&dword_1A3662000, v51, OS_LOG_TYPE_DEFAULT, "removed: %@", buf, 0xCu);
          }

        }
        v47 = -[NSObject countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
      }
      while (v47);
    }

    v15 = v54;
    objc_msgSend(v54, "callback:", v45);
    v18 = v58;
  }

LABEL_55:
}

void CacheDeleteEnumerateRemovedFiles(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v10[0] = a2;
  v6 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __CacheDeleteEnumerateRemovedFiles_block_invoke;
  v8[3] = &unk_1E4A32F48;
  v9 = v5;
  v7 = v5;
  _CacheDeleteEnumerateRemovedFiles(a1, 0, v6, v8);

}

void CacheDeleteEnumerateRemovedFilesInDirectories(uint64_t a1, uint64_t a2, void *a3)
{
  _CacheDeleteEnumerateRemovedFiles(a1, 0, a2, a3);
}

void CacheDeleteInitPurgeMarker(void *a1, void *a2, char a3)
{
  setPurgeMarker(a1, a2, a3, 0);
}

id domain(void *a1)
{
  objc_class *v1;
  id v2;
  void *v3;

  v1 = (objc_class *)MEMORY[0x1E0CB3940];
  v2 = a1;
  v3 = (void *)objc_msgSend([v1 alloc], "initWithFormat:", CFSTR("%@.%s"), v2, "purge_markers");

  return v3;
}

void sub_1A368C05C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A368C158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A368D834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A368E484(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1A3690A00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3690B84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3690FEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A36910B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t enableDirStats(const char *a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  NSObject *v8;
  const char *v9;
  int v11;
  const char *v12;
  __int16 v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[2];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v48 = 0u;
  v49 = 0u;
  v4 = 28;
  if (!a2)
    v4 = 0;
  v46 = 0uLL;
  v47 = 0uLL;
  v44 = 0uLL;
  v45 = 0uLL;
  v42 = 0uLL;
  v43 = 0uLL;
  v40 = 0uLL;
  v41 = 0uLL;
  v38 = 0uLL;
  v39 = 0uLL;
  v36 = 0uLL;
  v37 = 0uLL;
  v34 = 0uLL;
  v35 = 0uLL;
  v33[0] = 0x100000002;
  v33[1] = v4;
  v31 = 0uLL;
  v32 = 0uLL;
  v29 = 0uLL;
  v30 = 0uLL;
  v27 = 0uLL;
  v28 = 0uLL;
  v25 = 0uLL;
  v26 = 0uLL;
  v23 = 0uLL;
  v24 = 0uLL;
  v21 = 0uLL;
  v22 = 0uLL;
  v19 = 0uLL;
  v20 = 0uLL;
  v17 = 0uLL;
  v18 = 0uLL;
  v15 = 2;
  v16 = 1;
  if (!fsctl(a1, 0xC1104A71uLL, &v15, 0) && (!a2 || (~(_BYTE)v17 & 3) == 0 && (v16 & 4) != 0))
  {
    CDGetLogHandle((uint64_t)"client");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v11 = 136315138;
      v12 = a1;
      v9 = "Already enabled APFSIOC_DIR_STATS_OP for %s";
LABEL_18:
      _os_log_debug_impl(&dword_1A3662000, v8, OS_LOG_TYPE_DEBUG, v9, (uint8_t *)&v11, 0xCu);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  v5 = fsctl(a1, 0xC1104A71uLL, v33, 0);
  if (!(_DWORD)v5)
  {
    CDGetLogHandle((uint64_t)"client");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v11 = 136315138;
      v12 = a1;
      v9 = "Enabled APFSIOC_DIR_STATS_OP for %s";
      goto LABEL_18;
    }
LABEL_14:
    v6 = 0;
LABEL_15:

    return v6;
  }
  v6 = v5;
  v7 = *__error();
  if (v7 != 2)
  {
    CDGetLogHandle((uint64_t)"client");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315394;
      v12 = a1;
      v13 = 2080;
      v14 = strerror(v7);
      _os_log_error_impl(&dword_1A3662000, v8, OS_LOG_TYPE_ERROR, "APFSIOC_DIR_STATS_OP : DIR_STATS_OP_SET failed for %s : %s", (uint8_t *)&v11, 0x16u);
    }
    goto LABEL_15;
  }
  return v6;
}

uint64_t size_dir(const char *a1)
{
  void *v2;
  uint64_t v3;
  BOOL v4;
  char v6;

  v6 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = did_fast_size_directory(v2, &v6);

  if (v3)
    v4 = 0;
  else
    v4 = v6 == 0;
  if (v4)
    enableDirStats(a1, 1);
  return v3;
}

id discardedCachesPathForVolume(void *a1)
{
  id v1;
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  char *v18;
  void *v19;
  uint64_t v20;
  int *v21;
  char *v22;
  uint8_t v23[4];
  void *v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1)
  {
    v6 = 0;
    goto LABEL_26;
  }
  cdCachesPath();
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = v1;
    bzero(buf, 0x400uLL);
    objc_msgSend(v3, "mountPoint");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("tmp"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 && realpath_DARWIN_EXTSN((const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"), (char *)buf))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", buf);
      v2 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      CDGetLogHandle((uint64_t)"client");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "mountPoint");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v23 = 138412290;
        v24 = v19;
        _os_log_error_impl(&dword_1A3662000, v7, OS_LOG_TYPE_ERROR, "unable to verify /tmp/ on %@", v23, 0xCu);

      }
      v2 = 0;
    }

    if (!v2)
    {
      CDGetLogHandle((uint64_t)"client");
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v26 = (uint64_t)v3;
        _os_log_error_impl(&dword_1A3662000, v2, OS_LOG_TYPE_ERROR, "discardedCachesPathForVolume: Unable to get a discarded caches path on %@", buf, 0xCu);
      }
      goto LABEL_30;
    }
  }
  if ((objc_msgSend(v1, "containsPath:", v2) & 1) == 0)
  {
    CDGetLogHandle((uint64_t)"client");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v1, "mountPoint");
      v18 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v26 = (uint64_t)v2;
      v27 = 2112;
      v28 = v18;
      _os_log_error_impl(&dword_1A3662000, v13, OS_LOG_TYPE_ERROR, "discardedCachesPathForVolume: %@ is not present on volume: %@", buf, 0x16u);

    }
LABEL_30:
    v6 = 0;
    goto LABEL_31;
  }
  objc_msgSend(v1, "mountPoint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("/System/Volumes/Data"));

  cdCachesPath();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    objc_msgSend(v10, "stringByAppendingPathComponent:", CFSTR("com.apple.CacheDeleteAppContainerCaches.discardedCaches"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "com.apple.CacheDeleteAppContainerCaches.discardedCaches");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingPathComponent:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v12)
  {
    v6 = objc_retainAutorelease(v12);
    if (!mkdir((const char *)objc_msgSend(v6, "UTF8String"), 0x1C0u) || *__error() == 17)
      goto LABEL_25;
    CDGetLogHandle((uint64_t)"client");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
      v21 = __error();
      v22 = strerror(*v21);
      *(_DWORD *)buf = 136315394;
      v26 = v20;
      v27 = 2080;
      v28 = v22;
      _os_log_error_impl(&dword_1A3662000, v15, OS_LOG_TYPE_ERROR, "unable to create discarded caches directory at %s : %s", buf, 0x16u);
    }

  }
  v6 = 0;
LABEL_25:

LABEL_26:
  CDGetLogHandle((uint64_t)"client");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v1, "mountPoint");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v26 = (uint64_t)v16;
    v27 = 2112;
    v28 = (char *)v6;
    _os_log_impl(&dword_1A3662000, v2, OS_LOG_TYPE_DEFAULT, "discardedCachesPathForVolume: %@, result: %@", buf, 0x16u);

  }
LABEL_31:

  return v6;
}

void clearDiscardedCaches(void *a1, dispatch_qos_class_t a2, void *a3, void *a4)
{
  id v7;
  NSObject *v8;
  id v9;
  int v10;
  dispatch_qos_class_t v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v7 = a1;
  v8 = a3;
  v9 = a4;
  if (qword_1ECE24328 != -1)
    dispatch_once(&qword_1ECE24328, &__block_literal_global_52);
  if (v8)
    v10 = 17;
  else
    v10 = 9;
  if (a2)
    v11 = a2;
  else
    v11 = v10;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __clearDiscardedCaches_block_invoke_2;
  v15[3] = &unk_1E4A32CA8;
  v12 = v9;
  v16 = v12;
  v13 = v7;
  v17 = v13;
  v14 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v11, 0, v15);
  if (v8)
    dispatch_group_async(v8, (dispatch_queue_t)qword_1ECE24320, v14);
  else
    dispatch_async((dispatch_queue_t)qword_1ECE24320, v14);

}

void __clearDiscardedCaches_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.cache_delete.clearDiscardedCaches", 0);
  v1 = (void *)qword_1ECE24320;
  qword_1ECE24320 = (uint64_t)v0;

}

void __clearDiscardedCaches_block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint8_t buf[4];
  NSObject *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A8591C18]();
  v3 = mach_absolute_time();
  discardedCachesPathForVolume(*(void **)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    CDGetLogHandle((uint64_t)"client");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "mountPoint");
      v16 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v16;
      _os_log_error_impl(&dword_1A3662000, v14, OS_LOG_TYPE_ERROR, "clearDiscardedCaches unable to get a directory on %@!", buf, 0xCu);

    }
    goto LABEL_9;
  }
  v6 = objc_retainAutorelease(v4);
  nuke_dir((const char *)objc_msgSend(v6, "UTF8String"), 1);
  v7 = mach_absolute_time();
  v8 = *(void **)(a1 + 40);
  if (v8)
  {
    v9 = (double)v7 - (double)v3;
    v10 = v9 * *(double *)&gTimebaseConversion / 1000000000.0;
    objc_msgSend(v8, "remove_threshold");
    if (v10 > v11)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 40), "remove_threshold");
      objc_msgSend(v12, "stringWithFormat:", CFSTR("Remove failure. Threshold: %f, ET: %f, dir: %s"), v13, v9 * *(double *)&gTimebaseConversion / 1000000000.0, objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
      v14 = objc_claimAutoreleasedReturnValue();
      CDGetLogHandle((uint64_t)"client");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v14;
        _os_log_error_impl(&dword_1A3662000, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 40), "addRemoveFailure:", v14);
LABEL_9:

    }
  }

  objc_autoreleasePoolPop(v2);
}

uint64_t assert_group_cache_deletion(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  pid_t v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  id v24;
  BOOL v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  unint64_t v36;
  void *v37;
  void *v38;
  NSObject *v39;
  termAssertionObserver *v40;
  dispatch_semaphore_t v41;
  NSObject *v42;
  NSObject *v43;
  dispatch_time_t v44;
  intptr_t v45;
  NSObject *v46;
  char v47;
  void *v48;
  NSObject *v49;
  uint64_t v50;
  NSObject *v51;
  double v52;
  double v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  NSObject *v58;
  NSObject *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t i;
  void (**v66)(_QWORD);
  id v67;
  id v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  int v73;
  void (**v74)(id, NSObject *, const __CFString *);
  void *v75;
  uint64_t v76;
  char v77;
  unsigned __int8 v78;
  NSObject *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  uint64_t v93;
  termAssertionObserver *v94;
  uint8_t buf[4];
  NSObject *v96;
  __int16 v97;
  double v98;
  _BYTE v99[112];
  _OWORD buffer[16];
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  v74 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  memset(buffer, 0, 255);
  if (objc_msgSend(v8, "containsObject:", CFSTR("CacheInfoDoNotDelete")))
  {
    CDGetLogHandle((uint64_t)"client");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3662000, v11, OS_LOG_TYPE_DEFAULT, "found \"Do Not Delete\" in bundle id array, skipping...", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.assert_group_cache_deletion"), 1, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v74[2](v74, v12, CFSTR("CacheInfoDoNotDelete"));
    v70 = 0;
    v13 = 0;
    goto LABEL_5;
  }
  v14 = getpid();
  v15 = 0x1E0CB3000uLL;
  v66 = v9;
  if (proc_name(v14, buffer, 0xFFu) < 1)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("pid_%d"), getpid());
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", buffer);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v8;
  v68 = v7;
  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  v16 = v8;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v88, v99, 16);
  if (!v17)
  {
    v13 = 0;
    v69 = 0;
    v77 = 0;
    goto LABEL_56;
  }
  v18 = v17;
  v13 = 0;
  v69 = 0;
  v77 = 0;
  v78 = 30;
  v19 = *(_QWORD *)v89;
  v71 = *MEMORY[0x1E0CB2D50];
  v72 = v10;
  v81 = *(_QWORD *)v89;
  v75 = v16;
  while (2)
  {
    v20 = 0;
    v76 = v18;
    do
    {
      if (*(_QWORD *)v89 != v19)
        objc_enumerationMutation(v16);
      v21 = *(NSObject **)(*((_QWORD *)&v88 + 1) + 8 * v20);
      objc_msgSend(v10, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        CDGetLogHandle((uint64_t)"client");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v96 = v21;
          _os_log_impl(&dword_1A3662000, v23, OS_LOG_TYPE_DEFAULT, "already got a termination assertion for %@", buf, 0xCu);
        }
LABEL_24:

        goto LABEL_25;
      }

      v87 = 0;
      objc_msgSend(MEMORY[0x1E0CA58A0], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v21, 1, &v87);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = v87;
      if (v23)
        v25 = v24 == 0;
      else
        v25 = 0;
      if (!v25)
      {
        v13 = v24;
        CDGetLogHandle((uint64_t)"client");
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v96 = v21;
          v97 = 2112;
          v98 = *(double *)&v13;
          _os_log_error_impl(&dword_1A3662000, v26, OS_LOG_TYPE_ERROR, "Unable to create an LSBundleRecord for %@ : %@", buf, 0x16u);
        }

        v19 = v81;
        goto LABEL_24;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        CDGetLogHandle((uint64_t)"client");
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A3662000, v27, OS_LOG_TYPE_DEFAULT, "setting resistance to RBSTerminationResistanceNotRunning", buf, 2u);
        }

        v78 = 10;
      }
      objc_msgSend(MEMORY[0x1E0D87DC0], "descriptor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setValues:", 5);
      objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingBundleIdentifier:", v21);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D87D68], "handleForPredicate:error:");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = v28;
      objc_msgSend(v29, "currentStateMatchingDescriptor:", v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = *(void **)(v15 + 2368);
      objc_msgSend(v30, "terminationResistance");
      NSStringFromRBSTerminationResistance();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stringWithFormat:", CFSTR(": %@"), v32);
      v33 = objc_claimAutoreleasedReturnValue();

      CDGetLogHandle((uint64_t)"client");
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v96 = v33;
        _os_log_impl(&dword_1A3662000, v34, OS_LOG_TYPE_DEFAULT, "current process state %@", buf, 0xCu);
      }

      if (objc_msgSend(v30, "terminationResistance") > v78)
      {
        CDGetLogHandle((uint64_t)"client");
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v96 = v21;
          _os_log_error_impl(&dword_1A3662000, v51, OS_LOG_TYPE_ERROR, "%@ has higher termination assertion. Do not wait for it terminate", buf, 0xCu);
        }

        v16 = v75;
        goto LABEL_61;
      }
      v79 = v33;
      objc_msgSend(*(id *)(v15 + 2368), "stringWithFormat:", CFSTR("CacheDeleteAppContainerCaches requesting termination assertion for %@"), v21);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v15;
      v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87E00]), "initWithExplanation:", v35);
      objc_msgSend(v37, "setMaximumTerminationResistance:", v78);
      objc_msgSend(v37, "setExceptionCode:", 3135099228);
      v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87E10]), "initWithPredicate:context:", v82, v37);
      if (!objc_msgSend(v38, "acquireWithError:", 0))
      {
        objc_msgSend(*(id *)(v36 + 2368), "stringWithFormat:", CFSTR("CacheDeleteAppContainerCaches Unable to obtain termination assertion for %@"), v21);
        v40 = (termAssertionObserver *)objc_claimAutoreleasedReturnValue();
        v93 = v71;
        v94 = v40;
        v73 = 1;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CacheDeleteErrorDomain"), 12, v48);
        v49 = objc_claimAutoreleasedReturnValue();
        v74[2](v74, v49, (const __CFString *)v21);

        v10 = v72;
        v47 = 0;
LABEL_50:

        goto LABEL_51;
      }
      if ((v77 & 1) == 0)
        v69 = mach_absolute_time();
      CDGetLogHandle((uint64_t)"client");
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v96 = v21;
        _os_log_impl(&dword_1A3662000, v39, OS_LOG_TYPE_DEFAULT, "got termination assertion for: %@", buf, 0xCu);
      }

      objc_msgSend(v10, "setObject:forKeyedSubscript:", v38, v21);
      if (objc_msgSend(v38, "processExists"))
      {
        v40 = [termAssertionObserver alloc];
        v41 = dispatch_semaphore_create(0);
        -[termAssertionObserver setCompletionSem:](v40, "setCompletionSem:", v41);

        objc_msgSend(v38, "addObserver:", v40);
        CDGetLogHandle((uint64_t)"client");
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v96 = v21;
          _os_log_impl(&dword_1A3662000, v42, OS_LOG_TYPE_DEFAULT, "got termination assertion for %@, but process still exists...", buf, 0xCu);
        }

        -[termAssertionObserver completionSem](v40, "completionSem");
        v43 = objc_claimAutoreleasedReturnValue();
        v44 = dispatch_time(0, 1000000000);
        v45 = dispatch_semaphore_wait(v43, v44);

        if (v45)
        {
          CDGetLogHandle((uint64_t)"client");
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v96 = v21;
            _os_log_error_impl(&dword_1A3662000, v46, OS_LOG_TYPE_ERROR, "Timed out waiting for termination assertion for %@", buf, 0xCu);
          }

          -[termAssertionObserver setCompletionSem:](v40, "setCompletionSem:", 0);
          v47 = 0;
          v73 = 1;
        }
        else
        {
          v73 = 0;
          v47 = 1;
        }
        v77 = 1;
        v10 = v72;
        goto LABEL_50;
      }
      v73 = 0;
      v47 = 1;
      v77 = 1;
LABEL_51:

      if ((v47 & 1) == 0)
      {
        v16 = v75;

        if (v73)
        {
LABEL_61:
          v13 = 0;
          v8 = v67;
          v7 = v68;
          v9 = v66;
          goto LABEL_62;
        }
        v8 = v67;
        v7 = v68;
        v9 = v66;
        goto LABEL_80;
      }
      v13 = 0;
      v16 = v75;
      v18 = v76;
      v15 = 0x1E0CB3000;
      v19 = v81;
LABEL_25:
      ++v20;
    }
    while (v18 != v20);
    v50 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v88, v99, 16);
    v18 = v50;
    if (v50)
      continue;
    break;
  }
LABEL_56:

  v9 = v66;
  v66[2](v66);
  v8 = v67;
  v7 = v68;
LABEL_62:
  if ((v77 & 1) != 0)
  {
    v52 = *(double *)&gTimebaseConversion * ((double)mach_absolute_time() - (double)v69) / 1000000000.0;
    if (v7)
    {
      objc_msgSend(v7, "termination_threshold");
      if (v52 > v53)
      {
        v54 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v7, "termination_threshold");
        v56 = v55;
        objc_msgSend(v16, "componentsJoinedByString:", CFSTR(","));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "stringWithFormat:", CFSTR("Termination failure. Threshold: %f, ET: %f, bundle ids: %@"), v56, *(_QWORD *)&v52, v57);
        v12 = objc_claimAutoreleasedReturnValue();

        CDGetLogHandle((uint64_t)"client");
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v96 = v12;
          _os_log_error_impl(&dword_1A3662000, v58, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }

        objc_msgSend(v16, "componentsJoinedByString:", CFSTR(","));
        v59 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addTerminationFailure:", v59);
LABEL_68:

        goto LABEL_5;
      }
    }
    if (v52 > 1.0)
    {
      CDGetLogHandle((uint64_t)"client");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v16, "componentsJoinedByString:", CFSTR(", "));
        v59 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v96 = v59;
        v97 = 2048;
        v98 = v52;
        _os_log_error_impl(&dword_1A3662000, v12, OS_LOG_TYPE_ERROR, "held termination assertion on %{public}@ for %f seconds.", buf, 0x16u);
        goto LABEL_68;
      }
LABEL_5:

    }
  }
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  objc_msgSend(v10, "allValues");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v83, v92, 16);
  if (v61)
  {
    v62 = v61;
    v63 = *(_QWORD *)v84;
    do
    {
      for (i = 0; i != v62; ++i)
      {
        if (*(_QWORD *)v84 != v63)
          objc_enumerationMutation(v60);
        objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * i), "invalidate");
      }
      v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v83, v92, 16);
    }
    while (v62);
  }

LABEL_80:
  return 0;
}

uint64_t urgencyForDate(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -604800.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -86400.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -43200.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    if (objc_msgSend(v1, "compare:", v4) == 1)
    {
      v5 = 4;
    }
    else if (objc_msgSend(v1, "compare:", v3) == 1)
    {
      v5 = 3;
    }
    else if (objc_msgSend(v1, "compare:", v2) == 1)
    {
      v5 = 2;
    }
    else
    {
      v5 = 1;
    }
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

uint64_t userManagerEntitled()
{
  __SecTask *v0;
  __SecTask *v1;
  void *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  int *v7;
  char *v8;
  CFErrorRef error;
  uint8_t buf[4];
  CFErrorRef v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  error = 0;
  v0 = SecTaskCreateFromSelf(0);
  if (v0)
  {
    v1 = v0;
    v2 = (void *)SecTaskCopyValueForEntitlement(v0, CFSTR("com.apple.usermanagerd.persona.fetch"), &error);
    v3 = evaluateBoolProperty(v2);
    if (error)
    {
      CDGetLogHandle((uint64_t)"client");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v11 = error;
        _os_log_error_impl(&dword_1A3662000, v4, OS_LOG_TYPE_ERROR, "SecTaskCopyValueForEntitlement error: %@", buf, 0xCu);
      }

    }
    if (v2)
      CFRelease(v2);
    CFRelease(v1);
  }
  else
  {
    CDGetLogHandle((uint64_t)"client");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = __error();
      v8 = strerror(*v7);
      *(_DWORD *)buf = 136315138;
      v11 = (CFErrorRef)v8;
      _os_log_error_impl(&dword_1A3662000, v5, OS_LOG_TYPE_ERROR, "Unable to get secTask ref for self: %s", buf, 0xCu);
    }

    return 0;
  }
  return v3;
}

uint64_t dirStats(void *a1)
{
  id v1;
  uint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v1 = a1;
  v5 = 0;
  v6 = &v5;
  v7 = 0x3010000000;
  v10 = 0;
  v8 = &unk_1A369F492;
  v9 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __dirStats_block_invoke;
  v4[3] = &unk_1E4A32DF0;
  v4[4] = &v5;
  v2 = traverse_dir_with_state(v1, 0, 0, v4);
  v6[4] = v2;
  _Block_object_dispose(&v5, 8);

  return v2;
}

void sub_1A3692CF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __dirStats_block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  if (*a3)
    a3[1] = 1;
  else
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  return 1;
}

Class __getBMPublisherOptionsClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!qword_1ECE24330)
    qword_1ECE24330 = _sl_dlopen();
  result = objc_getClass("BMPublisherOptions");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  qword_1ECE24338 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getBiomeLibrarySymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (qword_1ECE24330)
  {
    v2 = (void *)qword_1ECE24330;
  }
  else
  {
    qword_1ECE24330 = _sl_dlopen();
    v2 = (void *)qword_1ECE24330;
    if (!qword_1ECE24330)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "BiomeLibrary");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  off_1ECE24340 = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t APFSVolumeRole()
{
  return MEMORY[0x1E0CF18C8]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1E0C99490](url, resolveAgainstBase, buffer, maxBufLen);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1E0C99538](alloc, uuid);
}

FSEventStreamRef FSEventStreamCreate(CFAllocatorRef allocator, FSEventStreamCallback callback, FSEventStreamContext *context, CFArrayRef pathsToWatch, FSEventStreamEventId sinceWhen, CFTimeInterval latency, FSEventStreamCreateFlags flags)
{
  return (FSEventStreamRef)MEMORY[0x1E0D20B98](allocator, callback, context, pathsToWatch, sinceWhen, *(_QWORD *)&flags, latency);
}

void FSEventStreamInvalidate(FSEventStreamRef streamRef)
{
  MEMORY[0x1E0D20BA0](streamRef);
}

void FSEventStreamRelease(FSEventStreamRef streamRef)
{
  MEMORY[0x1E0D20BA8](streamRef);
}

void FSEventStreamSetDispatchQueue(FSEventStreamRef streamRef, dispatch_queue_t q)
{
  MEMORY[0x1E0D20BB0](streamRef, q);
}

Boolean FSEventStreamStart(FSEventStreamRef streamRef)
{
  return MEMORY[0x1E0D20BB8](streamRef);
}

void FSEventStreamStop(FSEventStreamRef streamRef)
{
  MEMORY[0x1E0D20BC0](streamRef);
}

CFUUIDRef FSEventsCopyUUIDForDevice(dev_t dev)
{
  return (CFUUIDRef)MEMORY[0x1E0D20BC8](*(_QWORD *)&dev);
}

FSEventStreamEventId FSEventsGetCurrentEventId(void)
{
  return MEMORY[0x1E0D20BD0]();
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBAD28](*(_QWORD *)&mainPort, *(_QWORD *)&options, bsdName);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB900](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1E0CBB9E0](*(_QWORD *)&mainPort, matching);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

uint64_t NSStringFromRBSTerminationResistance()
{
  return MEMORY[0x1E0D87C78]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1E0C813D0](a1, *(_QWORD *)&a2);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1E0C81608](a1, a2);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C82638](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

uint64_t container_create_or_lookup_user_managed_assets_path()
{
  return MEMORY[0x1E0C82830]();
}

uint64_t container_create_or_lookup_user_managed_assets_relative_path()
{
  return MEMORY[0x1E0C82838]();
}

uint64_t container_delete_user_managed_assets()
{
  return MEMORY[0x1E0C82850]();
}

uint64_t container_error_copy_unlocalized_description()
{
  return MEMORY[0x1E0C82868]();
}

uint64_t container_get_identifier()
{
  return MEMORY[0x1E0C828D8]();
}

uint64_t container_get_path()
{
  return MEMORY[0x1E0C828E8]();
}

uint64_t container_get_persona_unique_string()
{
  return MEMORY[0x1E0C828F0]();
}

uint64_t container_get_user_managed_assets_relative_path()
{
  return MEMORY[0x1E0C82908]();
}

uint64_t container_query_create()
{
  return MEMORY[0x1E0C829B8]();
}

uint64_t container_query_free()
{
  return MEMORY[0x1E0C829C8]();
}

uint64_t container_query_get_last_error()
{
  return MEMORY[0x1E0C829D0]();
}

uint64_t container_query_iterate_results_sync()
{
  return MEMORY[0x1E0C829E0]();
}

uint64_t container_query_operation_set_flags()
{
  return MEMORY[0x1E0C829E8]();
}

uint64_t container_query_operation_set_platform()
{
  return MEMORY[0x1E0C829F0]();
}

uint64_t container_query_set_class()
{
  return MEMORY[0x1E0C829F8]();
}

uint64_t container_query_set_group_identifiers()
{
  return MEMORY[0x1E0C82A00]();
}

uint64_t container_query_set_identifiers()
{
  return MEMORY[0x1E0C82A08]();
}

uint64_t container_query_set_include_other_owners()
{
  return MEMORY[0x1E0C82A10]();
}

uint64_t container_user_managed_assets_path()
{
  return MEMORY[0x1E0C82AD0]();
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D10](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E20](attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x1E0C82F08](object, queue);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x1E0C83028](a1, a2);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C833A8](*(_QWORD *)&fd, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1E0C83528](a1, a2, a3, *(_QWORD *)&a4);
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C83548](*(_QWORD *)&fd, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1E0C83590](*(_QWORD *)&a1, a2);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1E0C83610](a1, a2, a3, a4, *(_QWORD *)&a5);
}

int getattrlistbulk(int a1, void *a2, void *a3, size_t a4, uint64_t a5)
{
  return MEMORY[0x1E0C83620](*(_QWORD *)&a1, a2, a3, a4, a5);
}

char *__cdecl getbsize(int *a1, uint64_t *a2)
{
  return (char *)MEMORY[0x1E0C83630](a1, a2);
}

int getfsstat(statfs *a1, int a2, int a3)
{
  return MEMORY[0x1E0C83670](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

ssize_t getline(char **__linep, size_t *__linecapp, FILE *__stream)
{
  return MEMORY[0x1E0C836E0](__linep, __linecapp, __stream);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1E0C83778]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1E0C83820](a1, a2);
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C83840](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x1E0C83BA8](a1);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C83C38](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C83C40](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C84160](a1, a2);
}

double nan(const char *a1)
{
  double result;

  MEMORY[0x1E0C84228](a1);
  return result;
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x1E0DE7C30](dest, src, size, atomic, hasStrong);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C20](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C50](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x1E0C84E00](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1E0C84ED8]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1E0C85040](a1, a2);
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return MEMORY[0x1E0C850C0](path, state, *(_QWORD *)&flags);
}

removefile_state_t removefile_state_alloc(void)
{
  return (removefile_state_t)MEMORY[0x1E0C850C8]();
}

int removefile_state_free(removefile_state_t a1)
{
  return MEMORY[0x1E0C850D0](a1);
}

int removefile_state_set(removefile_state_t state, uint32_t key, const void *value)
{
  return MEMORY[0x1E0C850E0](state, *(_QWORD *)&key, value);
}

int removexattr(const char *path, const char *name, int options)
{
  return MEMORY[0x1E0C850F0](path, name, *(_QWORD *)&options);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

char *__cdecl rindex(const char *a1, int a2)
{
  return (char *)MEMORY[0x1E0C85130](a1, *(_QWORD *)&a2);
}

int sem_close(sem_t *a1)
{
  return MEMORY[0x1E0C85290](a1);
}

sem_t *sem_open(const char *a1, int a2, ...)
{
  return (sem_t *)MEMORY[0x1E0C852A8](a1, *(_QWORD *)&a2);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C853A0](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1E0C854E0](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1E0C85558](a1, a2, a3, a4);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85570](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1E0C85610](__s1, __s2);
}

uint64_t thread_stack_pcs()
{
  return MEMORY[0x1E0C85938]();
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x1E0C85DE0](xarray, value);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1E0C85E10]();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1E0C86008](connection);
}

uint64_t xpc_copy_code_signing_identity_for_token()
{
  return MEMORY[0x1E0C86100]();
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1E0C86720](string);
}

