@implementation MSUDataAccessorRestore

- (id)copyMountPointForVolumeType:(int)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  const __CFString *v11;

  if (a3)
  {
    if (a3 != 1)
    {
      +[MSUDataAccessor buildErrorForRef:code:description:](MSUDataAccessor, "buildErrorForRef:code:description:", a4, 6000, CFSTR("Unknown volume type"));
      return 0;
    }
    v5 = 13;
  }
  else
  {
    v5 = 6;
  }
  v6 = -[MSUDataAccessorRestore findVolumesWithRole:](self, "findVolumesWithRole:", v5);
  if (objc_msgSend(v6, "count") == 1)
  {
    v7 = (id)objc_msgSend(v6, "objectAtIndex:", 0);
    v8 = (id)objc_msgSend(v7, "mountPoint");
    v9 = v8;
    if (v8)
      v10 = v8;
    else
      +[MSUDataAccessor buildErrorForRef:code:description:](MSUDataAccessor, "buildErrorForRef:code:description:", a4, 6003, CFSTR("Volume not mounted"));

  }
  else
  {
    if ((unint64_t)objc_msgSend(v6, "count") < 2)
      v11 = CFSTR("Missing volume");
    else
      v11 = CFSTR("Too many volumes");
    +[MSUDataAccessor buildErrorForRef:code:description:](MSUDataAccessor, "buildErrorForRef:code:description:", a4, 6003, v11);
    v9 = 0;
  }

  return v9;
}

- (id)specialCaseAPTicketForRamdiskWithError:(id *)a3
{
  id v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  CFTypeID v9;
  __CFString *v10;
  __CFString *v11;
  CFTypeID v12;
  const __CFString *v13;
  const __CFString *v14;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  unsigned __int8 md[16];
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = objc_msgSend(v4, "fileExistsAtPath:", CFSTR("/private/var/Keychains/apticket.der"));

  if (v5)
  {
    if (a3)
      *a3 = 0;
    v6 = (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:options:error:", CFSTR("/private/var/Keychains/apticket.der"), 0, a3);
    if (v6)
    {
      v7 = (void *)MGCopyAnswer();
      if (v7)
      {
        v8 = v7;
        v9 = CFGetTypeID(v7);
        if (v9 == CFDataGetTypeID())
        {
          v10 = (__CFString *)MGCopyAnswer();
          if (v10)
          {
            v11 = v10;
            v12 = CFGetTypeID(v10);
            if (v12 != CFStringGetTypeID())
            {
              CFRelease(v11);
              +[MSUDataAccessor buildErrorForRef:code:description:](MSUDataAccessor, "buildErrorForRef:code:description:", a3, 6005, CFSTR("Bad type in response to crypto hash method query"));
              v13 = 0;
LABEL_27:

              goto LABEL_15;
            }
          }
          else
          {
            v11 = CFSTR("sha1");
          }
          v23 = 0u;
          v24 = 0u;
          *(_OWORD *)md = 0u;
          if (-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("sha1")))
          {
            v16 = objc_retainAutorelease(v6);
            CC_SHA1((const void *)objc_msgSend(v16, "bytes"), objc_msgSend(v16, "length"), md);
            v17 = 20;
          }
          else
          {
            if (!-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("sha2-384")))
            {
              v21 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unsupported crypto hash method %@"), v11);
              +[MSUDataAccessor buildErrorForRef:code:description:](MSUDataAccessor, "buildErrorForRef:code:description:", a3, 6005, v21);

              v13 = 0;
LABEL_26:

              goto LABEL_27;
            }
            v18 = objc_retainAutorelease(v6);
            CC_SHA384((const void *)objc_msgSend(v18, "bytes"), objc_msgSend(v18, "length"), md);
            v17 = 48;
          }
          v19 = (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", md, v17, 0);
          v13 = CFSTR("/private/var/Keychains/apticket.der");
          if ((objc_msgSend(v19, "isEqualToData:", v8) & 1) == 0)
          {
            v20 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Found apticket at %@ but it does not match the boot manifest hash"), CFSTR("/private/var/Keychains/apticket.der"));
            +[MSUDataAccessor buildErrorForRef:code:description:](MSUDataAccessor, "buildErrorForRef:code:description:", a3, 6006, v20);

            v13 = 0;
          }

          goto LABEL_26;
        }
        CFRelease(v8);
        v14 = CFSTR("Bad type in response to boot manifest hash query");
      }
      else
      {
        v14 = CFSTR("Failed to boot manifest hash");
      }
      +[MSUDataAccessor buildErrorForRef:code:description:](MSUDataAccessor, "buildErrorForRef:code:description:", a3, 6005, v14);
    }
    v13 = 0;
LABEL_15:

    return (id)v13;
  }
  return 0;
}

- (id)copyPathForPersonalizedData:(int)a3 error:(id *)a4
{
  uint64_t v5;
  id result;
  objc_super v8;

  v5 = *(_QWORD *)&a3;
  if (a3 != 2
    || (result = -[MSUDataAccessorRestore specialCaseAPTicketForRamdiskWithError:](self, "specialCaseAPTicketForRamdiskWithError:", a4)) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)MSUDataAccessorRestore;
    return -[MSUDataAccessor copyPathForPersonalizedData:error:](&v8, sel_copyPathForPersonalizedData_error_, v5, a4);
  }
  return result;
}

- (id)getVolumeWithUUID:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (id)objc_msgSend(MEMORY[0x24BEDD528], "allMedia");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v9;
          v11 = (id)objc_msgSend(v10, "mediaUUID", (_QWORD)v14);
          v12 = objc_msgSend(v11, "isEqualToString:", v3);

          if ((v12 & 1) != 0)
            goto LABEL_12;

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (id)findVolumesWithRole:(int)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (id)objc_msgSend(MEMORY[0x24BEDD528], "allMedia", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v10;
          if (objc_msgSend(v11, "role") == a3)
            objc_msgSend(v4, "addObject:", v11);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

@end
