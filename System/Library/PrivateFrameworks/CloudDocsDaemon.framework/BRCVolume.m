@implementation BRCVolume

- (NSString)mountPath
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), self->_stfs.f_mntonname);
}

- (int)_setUpForStatfs:(statfs *)a3
{
  uint32_t f_flags;
  int result;
  int32x4_t v7;
  int16x8_t v8;
  _OWORD v9[2];
  int v10;
  __int128 v11;
  uint64_t v12;

  v12 = 0;
  v11 = xmmword_1CC066A48;
  v10 = 0;
  memset(v9, 0, sizeof(v9));
  if (getattrlist(a3->f_mntonname, &v11, v9, 0x24uLL, 0x21u) < 0)
    return *__error();
  if (strcmp(a3->f_fstypename, "hfs") && (~DWORD1(v9[0]) & 0x180000) != 0)
    return 19;
  f_flags = a3->f_flags;
  if ((f_flags & 0x1001) == 0x1000)
  {
    memcpy(&self->_stfs, a3, sizeof(self->_stfs));
    result = 0;
    self->_isCaseSensitive = BYTE5(v9[0]) & 1;
    v7.i32[0] = a3->f_flags;
    v7.i32[1] = DWORD2(v9[0]);
    v8 = (int16x8_t)vshlq_u32((uint32x4_t)vzip1q_s32(v7, vdupq_lane_s32(*(int32x2_t *)v7.i8, 1)), (uint32x4_t)xmmword_1CC066A30);
    *(int8x8_t *)v8.i8 = vand_s8((int8x8_t)vmovn_s32((int32x4_t)v8), (int8x8_t)0x1000100010001);
    *(_DWORD *)&self->_isIgnoringOwnership = vmovn_s16(v8).u32[0];
  }
  else if ((f_flags & 1) != 0)
  {
    return 30;
  }
  else
  {
    return 19;
  }
  return result;
}

- (NSString)fsTypeName
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), self->_stfs.f_fstypename);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  BRCPrettyPrintBitmap();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self->_isCaseSensitive)
    v7 = "YES";
  else
    v7 = "NO";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p>, device:'%s' mounted-on:'%s' fstype:%s(%@) case-sensitive:%s"), v4, self, self->_stfs.f_mntfromname, self->_stfs.f_mntonname, self->_stfs.f_fstypename, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSNumber)freeSize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCVolume mountPath](self, "mountPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributesOfFileSystemForPath:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2B00]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v6;
}

- (NSNumber)totalSize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCVolume mountPath](self, "mountPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributesOfFileSystemForPath:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2B10]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v6;
}

- (BOOL)setUpForRelPath:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  char *v12;
  NSObject *v13;
  BOOL v14;
  void *v15;
  NSObject *v16;
  void *v17;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, int);
  void *v23;
  BRCVolume *v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  int v30;
  int v31;
  uint8_t buf[4];
  BRCVolume *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v31 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __35__BRCVolume_setUpForRelPath_error___block_invoke;
  v23 = &unk_1E875D5A0;
  v24 = self;
  v26 = &v27;
  v7 = v6;
  v25 = v7;
  objc_msgSend(v7, "performOnOpenFileDescriptor:error:", &v20, &v31);
  if (v31)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", v20, v21, v22, v23, v24);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
      {
        v19 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v33 = (BRCVolume *)"-[BRCVolume setUpForRelPath:error:]";
        v34 = 2080;
        if (!a4)
          v19 = "(ignored by caller)";
        v35 = v19;
        v36 = 2112;
        v37 = v8;
        v38 = 2112;
        v39 = v9;
        _os_log_error_impl(&dword_1CBD43000, v10, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a4)
      *a4 = objc_retainAutorelease(v8);

  }
  v11 = *((_DWORD *)v28 + 6);
  if (v11)
  {
    self->_deviceID = v11;
    brc_bread_crumbs();
    v12 = (char *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v33 = self;
      v34 = 2112;
      v35 = v12;
      _os_log_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEFAULT, "[NOTICE] on device: %@%@", buf, 0x16u);
    }

    v14 = v31 == 0;
  }
  else
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v7, "absolutePath");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCVolume setUpForRelPath:error:].cold.1(v17, (uint64_t)v15, buf, v16);
    }

    v14 = 0;
  }

  _Block_object_dispose(&v27, 8);
  return v14;
}

uint64_t __35__BRCVolume_setUpForRelPath_error___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  uint64_t result;
  int v5;
  _BYTE __dst[2168];
  statfs __src;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  memset(&__src, 0, 512);
  if (fstatfs(a2, &__src) < 0)
    return *__error();
  v3 = *(void **)(a1 + 32);
  memcpy(__dst, &__src, sizeof(__dst));
  result = objc_msgSend(v3, "_setUpForStatfs:", __dst);
  if (!(_DWORD)result)
  {
    v5 = objc_msgSend(*(id *)(a1 + 40), "deviceID");
    result = 0;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v5;
  }
  return result;
}

- (int)deviceID
{
  return self->_deviceID;
}

- (BOOL)isCaseSensitive
{
  return self->_isCaseSensitive;
}

- (BOOL)isIgnoringOwnership
{
  return self->_isIgnoringOwnership;
}

- (BOOL)hasRenameExcl
{
  return self->_hasRenameExcl;
}

- (BOOL)hasRenameSwap
{
  return self->_hasRenameSwap;
}

- (BOOL)hasCloning
{
  return self->_hasCloning;
}

- (void)setUpForRelPath:(uint8_t *)buf error:(os_log_t)log .cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_1CBD43000, log, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: %@'s device ID is 0!%@", buf, 0x16u);

}

@end
