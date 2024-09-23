@implementation NSString(FSPathAdditions)

- (id)fpfs_extractFSEventsBarrierUUID
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "hasPrefix:", CFSTR(".rendez-vous.")))
  {
    if (fpfs_extractFSEventsBarrierUUID_once[0] != -1)
      dispatch_once(fpfs_extractFSEventsBarrierUUID_once, &__block_literal_global);
    objc_msgSend((id)fpfs_extractFSEventsBarrierUUID_regexp, "firstMatchInString:options:range:", v1, 0, 0, objc_msgSend(v1, "length"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = objc_alloc(MEMORY[0x24BDD1880]);
      v4 = objc_msgSend(v2, "rangeAtIndex:", 1);
      objc_msgSend(v1, "substringWithRange:", v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v3, "initWithUUIDString:", v6);

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)fpfs_extractFSEventsNotifyUUID
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "hasPrefix:", CFSTR(".notify.")))
  {
    if (fpfs_extractFSEventsNotifyUUID_once[0] != -1)
      dispatch_once(fpfs_extractFSEventsNotifyUUID_once, &__block_literal_global_7);
    objc_msgSend((id)fpfs_extractFSEventsNotifyUUID_regexp, "firstMatchInString:options:range:", v1, 0, 0, objc_msgSend(v1, "length"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = objc_alloc(MEMORY[0x24BDD1880]);
      v4 = objc_msgSend(v2, "rangeAtIndex:", 1);
      objc_msgSend(v1, "substringWithRange:", v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v3, "initWithUUIDString:", v6);

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)fpfs_filenameExtension
{
  void *v1;

  objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation");
  v1 = (void *)fpfs_extension_in_filename();
  if (v1)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "fp_pathWithFileSystemRepresentation:", v1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

- (uint64_t)fpfs_isSafeSaveTempFile:()FSPathAdditions
{
  const char *v2;
  uint64_t is_safe_save_temp_file;
  char *v4;
  _BYTE v6[1024];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (!objc_msgSend(a1, "length"))
    return 0;
  bzero(v6, 0x400uLL);
  v2 = (const char *)objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation");
  if ((unint64_t)__strlcpy_chk() <= 0x3FF)
    return fpfs_path_is_safe_save_temp_file();
  v4 = strdup(v2);
  is_safe_save_temp_file = fpfs_path_is_safe_save_temp_file();
  free(v4);
  return is_safe_save_temp_file;
}

- (BOOL)fpfs_isAppleDoubleFile
{
  _BYTE *v1;

  v1 = (_BYTE *)objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation");
  return *v1 == 46 && v1[1] == 95;
}

@end
