@implementation ComponentStorage

- (BOOL)isPresent
{
  return 1;
}

- (void)populateAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentStorage dataCapacity](self, "dataCapacity"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("nandCapacity"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentStorage dataAvailable](self, "dataAvailable"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("nandAvailable"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentStorage dataAvailableForImportantUsage](self, "dataAvailableForImportantUsage"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("nandAvailableForImportantUsage"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentStorage totalDiskCapacity](self, "totalDiskCapacity"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("nandTotalDiskCapacity"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentStorage serialNumber](self, "serialNumber"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("serialNumber"));

  v10 = CopyAppleCareNANDInfo();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("nandInfo"));

}

- (id)dataCapacity
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  statfs v7;

  memset(&v7, 0, 512);
  if (statfs("/", &v7))
    v2 = 0;
  else
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v7.f_blocks * v7.f_bsize));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringValue"));
  v4 = stringOrNull(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

- (id)dataAvailable
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentStorage checkDiskSpaceForURLResourceKey:](self, "checkDiskSpaceForURLResourceKey:", NSURLVolumeAvailableCapacityKey));
  v3 = numberOrNull(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (id)dataAvailableForImportantUsage
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentStorage checkDiskSpaceForURLResourceKey:](self, "checkDiskSpaceForURLResourceKey:", NSURLVolumeAvailableCapacityForImportantUsageKey));
  v3 = numberOrNull(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (id)totalDiskCapacity
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentStorage checkDiskSpaceForURLResourceKey:](self, "checkDiskSpaceForURLResourceKey:", NSURLVolumeTotalCapacityKey));
  v3 = numberOrNull(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (id)serialNumber
{
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = objc_msgSend(&off_1000B25F0, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v13;
    while (2)
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v13 != v4)
          objc_enumerationMutation(&off_1000B25F0);
        v6 = objc_claimAutoreleasedReturnValue(+[DAComponentUtil getIORegistryClass:property:optionalKey:](DAComponentUtil, "getIORegistryClass:property:optionalKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v5), CFSTR("Serial Number"), 0));
        if (v6)
        {
          v7 = (void *)v6;
          v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v6, 4);
          goto LABEL_11;
        }
        v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      v3 = objc_msgSend(&off_1000B25F0, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v3)
        continue;
      break;
    }
  }
  v7 = 0;
  v8 = 0;
LABEL_11:
  v9 = stringOrNull(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return v10;
}

- (id)checkDiskSpaceForURLResourceKey:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/private/var")));
  v10 = 0;
  v11 = 0;
  objc_msgSend(v4, "getResourceValue:forKey:error:", &v11, v3, &v10);
  v5 = v11;
  v6 = v10;
  if (!v5)
  {
    v7 = DiagnosticsKitLogHandleForCategory(1);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v13 = v3;
      v14 = 2112;
      v15 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Unable to check resource %@ in system report: %@", buf, 0x16u);
    }

  }
  return v5;
}

@end
