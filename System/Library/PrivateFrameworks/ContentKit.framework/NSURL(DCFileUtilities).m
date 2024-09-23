@implementation NSURL(DCFileUtilities)

+ (id)wf_shortcutsDirectoryURL
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "wf_realLibraryDirectoryURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLByAppendingPathComponent:isDirectory:", CFSTR("Shortcuts"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)wf_realLibraryDirectoryURL
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "wf_realHomeDirectoryURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)wf_realHomeDirectoryURL
{
  return objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", CPSharedResourcesDirectory(), 1);
}

- (uint64_t)wf_fileExists
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "fileExistsAtPath:", v3);

  return v4;
}

- (uint64_t)wf_fileIsReadable
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isReadableFileAtPath:", v3);

  return v4;
}

- (uint64_t)wf_fileIsWritable
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isWritableFileAtPath:", v3);

  return v4;
}

- (uint64_t)wf_fileIsDirectory
{
  void *v2;
  void *v3;
  unsigned int v4;
  char v6;

  v6 = 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "fileExistsAtPath:isDirectory:", v3, &v6);

  if (v6)
    return v4;
  else
    return 0;
}

- (BOOL)wf_sandboxAllowsOperation:()DCFileUtilities
{
  getpid();
  if (!sandbox_check())
    return 1;
  getpid();
  objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation");
  return sandbox_check() == 0;
}

- (BOOL)wf_sandboxAllowsOperation:()DCFileUtilities withAuditToken:
{
  objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation");
  return sandbox_check_by_audit_token() == 0;
}

- (uint64_t)wf_sandboxAllowsReadingFile
{
  return objc_msgSend(a1, "wf_sandboxAllowsOperation:", "file-read-data");
}

- (uint64_t)wf_sandboxAllowsWritingFile
{
  return objc_msgSend(a1, "wf_sandboxAllowsOperation:", "file-write-data");
}

- (uint64_t)wf_sandboxAllowsReadingFileWithAuditToken:()DCFileUtilities
{
  __int128 v3;
  _OWORD v5[2];

  v3 = a3[1];
  v5[0] = *a3;
  v5[1] = v3;
  return objc_msgSend(a1, "wf_sandboxAllowsOperation:withAuditToken:", "file-read-data", v5);
}

- (uint64_t)wf_sandboxAllowsWritingFileWithAuditToken:()DCFileUtilities
{
  __int128 v3;
  _OWORD v5[2];

  v3 = a3[1];
  v5[0] = *a3;
  v5[1] = v3;
  return objc_msgSend(a1, "wf_sandboxAllowsOperation:withAuditToken:", "file-write-data", v5);
}

- (BOOL)wf_fileHasExtendedAttribute:()DCFileUtilities
{
  id v4;
  id v5;
  const char *v6;
  id v7;
  ssize_t v8;
  void *v10;
  void *v11;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSURL(DCFileUtilities) wf_fileHasExtendedAttribute:]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("NSURL+DCFileUtilities.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("attributeName"));

  }
  objc_msgSend(a1, "path");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (const char *)objc_msgSend(v5, "UTF8String");
  v7 = objc_retainAutorelease(v4);
  v8 = getxattr(v6, (const char *)objc_msgSend(v7, "UTF8String"), 0, 0, 0, 0);

  return v8 >= 0;
}

- (id)wf_fileSize
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (objc_msgSend(a1, "isFileURL"))
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "path");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "attributesOfItemAtPath:error:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDD0D08]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (uint64_t)wf_relationshipToDirectoryAtURL:()DCFileUtilities
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;

  v9 = 0;
  v4 = (void *)MEMORY[0x24BDD1580];
  v5 = a3;
  objc_msgSend(v4, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  LODWORD(a1) = objc_msgSend(v6, "getRelationship:ofDirectoryAtURL:toItemAtURL:error:", &v9, v5, a1, &v8);

  if ((_DWORD)a1)
    return v9;
  else
    return 2;
}

- (__CFString)wf_relativePathFromURL:()DCFileUtilities
{
  void *v4;
  void *v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __CFString *v10;

  objc_msgSend(a3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  if (v5 && v4)
  {
    if ((objc_msgSend(v4, "isEqualToString:", v5) & 1) != 0)
    {
      v6 = &stru_24C4E3948;
    }
    else
    {
      if (objc_msgSend(v4, "hasPrefix:", v5))
      {
        v7 = objc_msgSend(v5, "length");
        v8 = v4;
      }
      else
      {
        if (!objc_msgSend(v5, "hasPrefix:", v4))
        {
          v6 = 0;
          goto LABEL_18;
        }
        v7 = objc_msgSend(v4, "length");
        v8 = v5;
      }
      objc_msgSend(v8, "substringFromIndex:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "length") && (objc_msgSend(v9, "isEqualToString:", CFSTR("/")) & 1) == 0)
      {
        if (objc_msgSend(v9, "hasPrefix:", CFSTR("/")))
        {
          objc_msgSend(v9, "substringFromIndex:", 1);
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v10 = v9;
          v9 = v10;
        }
        v6 = v10;
      }
      else
      {
        v6 = &stru_24C4E3948;
      }

    }
  }
LABEL_18:

  return v6;
}

- (BOOL)wf_isContainedByDirectoryAtURL:()DCFileUtilities
{
  return objc_msgSend(a1, "wf_relationshipToDirectoryAtURL:") == 0;
}

- (BOOL)wf_proposedFileIsContainedByDirectoryAtURL:()DCFileUtilities
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;

  v4 = a3;
  WFExistingFileFromURL(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "URLByResolvingSymlinksInPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLByResolvingSymlinksInPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (unint64_t)objc_msgSend(v7, "wf_relationshipToDirectoryAtURL:", v8) < 2;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (uint64_t)wf_fileIsOnSameVolumeAsURL:()DCFileUtilities
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v16;
  void *v17;
  id v18;
  void *v19;

  v4 = a3;
  WFExistingFileFromURL(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WFExistingFileFromURL(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (v5 && v6)
  {
    v19 = 0;
    v8 = *MEMORY[0x24BDBCDC8];
    v18 = 0;
    objc_msgSend(v5, "getResourceValue:forKey:error:", &v19, v8, &v18);
    v9 = v19;
    v16 = 0;
    v17 = 0;
    v10 = v18;
    v11 = v9;
    objc_msgSend(v6, "getResourceValue:forKey:error:", &v17, v8, &v16);
    v12 = v17;
    v13 = v16;
    v14 = v12;

    v7 = objc_msgSend(v11, "isEqual:", v14);
  }

  return v7;
}

- (BOOL)wf_fileIsShortcutsOwned
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(MEMORY[0x24BDBCF48], "wf_shortcutsDirectoryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_msgSend(a1, "wf_proposedFileIsContainedByDirectoryAtURL:", v2) & 1) != 0
    || +[WFTemporaryFileManager isTemporaryFile:](WFTemporaryFileManager, "isTemporaryFile:", a1);

  return v3;
}

+ (id)wf_savedShortcutStatesURL
{
  void *v0;
  void *v1;

  +[WFTemporaryFileManager sharedAppGroupDirectoryURL](WFTemporaryFileManager, "sharedAppGroupDirectoryURL");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLByAppendingPathComponent:isDirectory:", CFSTR("SavedShortcutStates"), 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

@end
