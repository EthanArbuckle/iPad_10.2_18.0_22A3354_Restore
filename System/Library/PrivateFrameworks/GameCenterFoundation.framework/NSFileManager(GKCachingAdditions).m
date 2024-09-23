@implementation NSFileManager(GKCachingAdditions)

- (ssize_t)_gkReadXattrBytes:()GKCachingAdditions count:withName:path:
{
  id v9;
  id v10;
  const char *v11;
  id v12;
  const char *v13;
  unint64_t v14;
  size_t v15;
  NSObject *v16;
  id v17;
  ssize_t v18;
  int v20;
  id v21;
  __int16 v22;
  size_t v23;
  __int16 v24;
  size_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = objc_retainAutorelease(a6);
  v11 = (const char *)objc_msgSend(v10, "fileSystemRepresentation");
  v12 = objc_retainAutorelease(v9);
  v13 = (const char *)objc_msgSend(v12, "UTF8String");
  v14 = getxattr(v11, v13, 0, 0, 0, 0);
  if (v14 >= a4)
  {
    v15 = a4;
  }
  else
  {
    v15 = v14;
    v16 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v17 = GKOSLoggers();
      v16 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v20 = 138413058;
      v21 = v12;
      v22 = 2048;
      v23 = a4;
      v24 = 2048;
      v25 = v15;
      v26 = 2112;
      v27 = v10;
      _os_log_debug_impl(&dword_1BCDE3000, v16, OS_LOG_TYPE_DEBUG, "-- Xattr: %@ -- count requested %ld is greater than actual byte count %ld so we're truncating. path = %@", (uint8_t *)&v20, 0x2Au);
    }
  }
  if (v15)
    v18 = getxattr(v11, v13, a3, v15, 0, 0);
  else
    v18 = -1;

  return v18;
}

- (uint64_t)_gkWriteXattrBytes:()GKCachingAdditions count:withName:path:
{
  id v9;
  id v10;
  const char *v11;
  id v12;
  const char *v13;

  v9 = objc_retainAutorelease(a6);
  v10 = a5;
  v11 = (const char *)objc_msgSend(v9, "fileSystemRepresentation");
  v12 = objc_retainAutorelease(v10);
  v13 = (const char *)objc_msgSend(v12, "UTF8String");

  return setxattr(v11, v13, a3, a4, 0, 0);
}

- (uint64_t)_gkRemoveXattrNamed:()GKCachingAdditions path:
{
  id v5;
  id v6;
  const char *v7;
  id v8;
  const char *v9;

  v5 = objc_retainAutorelease(a4);
  v6 = a3;
  v7 = (const char *)objc_msgSend(v5, "fileSystemRepresentation");
  v8 = objc_retainAutorelease(v6);
  v9 = (const char *)objc_msgSend(v8, "UTF8String");

  return removexattr(v7, v9, 0);
}

- (double)_gkExpirationIntervalOfFileAtPath:()GKCachingAdditions
{
  double v4;

  v4 = -1.0;
  if (objc_msgSend(a1, "_gkReadXattrBytes:count:withName:path:", &v4, 8, CFSTR("gamekit-cache-expiration"), a3) < 1)
    return 0.0;
  else
    return v4 - CFAbsoluteTimeGetCurrent();
}

- (void)_gkSetExpirationInterval:()GKCachingAdditions ofFileAtPath:
{
  id v5;
  void *v6;
  double v7;

  v5 = a4;
  v7 = CFAbsoluteTimeGetCurrent() + a1;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_gkWriteXattrBytes:count:withName:path:", &v7, 8, CFSTR("gamekit-cache-expiration"), v5);

}

@end
