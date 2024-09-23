@implementation NSError(FPFSAdditions)

+ (id)purgeabilityErrorForReason:()FPFSAdditions atURL:
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a4;
  switch(a3)
  {
    case 1:
      objc_msgSend(MEMORY[0x24BDD1540], "fp_errorWithPOSIXCode:itemURL:debugDescription:", *__error(), v5, CFSTR("Unable to stat(2) item after eviction attempt"));
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 2:
      FPEvictionWithUnsyncedEditsError();
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3:
      FPEvictionOnBusyItemError();
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 4:
      FPEvictionOnItemWithHardlinkError();
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 5:
      FPMissingAllowsEvictingCapabilitiesError();
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v7 = (void *)v6;
      break;
    default:
      v7 = 0;
      break;
  }

  return v7;
}

+ (id)fp_nonEvictableChildrenErrorWithFD:()FPFSAdditions trashIno:busyIno:
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  void *v5;
  _BYTE v6[1024];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  bzero(v6, 0x400uLL);
  fpfs_fgetpath();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v6, 1, 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v1 = v5;
  v2 = v0;
  fpfs_fopendir();
  FPNonEvictableChildrenError();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)fp_protectionClassBehindError
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  id v10;

  if ((objc_msgSend(a1, "fp_isCocoaErrorCode:", 257) & 1) == 0
    && !objc_msgSend(a1, "fp_isPOSIXErrorCode:", 1))
  {
    return 0;
  }
  objc_msgSend(a1, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("dataProtectionClass"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = v3;
    v3 = v4;
  }
  else
  {
    objc_msgSend(a1, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDD1328]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v10 = 0;
      v7 = objc_msgSend(v6, "getResourceValue:forKey:error:", &v10, *MEMORY[0x24BDBCC20], 0);
      v8 = v10;

      if (v7)
      {
        v4 = v8;
        v3 = v4;
      }
      else
      {
        v4 = 0;
        v3 = v8;
      }
    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

+ (id)fp_errorForDataProtectionClass:()FPFSAdditions
{
  void *v3;
  uint64_t *v4;
  const __CFString **v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  uint64_t v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  if (a3 == 2)
  {
    v9 = CFSTR("dataProtectionClass");
    v10 = *MEMORY[0x24BDBCC10];
    v3 = (void *)MEMORY[0x24BDBCE70];
    v4 = &v10;
    v5 = &v9;
  }
  else
  {
    if (a3 != 1)
    {
      v6 = 0;
      goto LABEL_7;
    }
    v11 = CFSTR("dataProtectionClass");
    v12[0] = *MEMORY[0x24BDBCC08];
    v3 = (void *)MEMORY[0x24BDBCE70];
    v4 = v12;
    v5 = &v11;
  }
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v4, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
