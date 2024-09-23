@implementation NSURL(FPAdditions)

- (_QWORD)fp_issueSandboxExtensionOfClass:()FPAdditions report:error:
{
  void *v9;
  uint64_t v10;
  int v11;
  int v12;
  id v13;
  const char *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int *v18;

  objc_msgSend(a1, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "hasDirectoryPath"))
  {
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("/"));
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  v11 = *MEMORY[0x1E0C806E0];
  if (a4)
    v11 = 0;
  v12 = v11 | *MEMORY[0x1E0C806D8];
  v13 = objc_retainAutorelease(v9);
  v14 = (const char *)fpfs_lp_sandbox_extension_issue_file(a3, (const char *)objc_msgSend(v13, "fileSystemRepresentation"), v12);
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v14, strlen(v14) + 1, 1);
    a5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  else if (a5)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *__error();
    objc_msgSend(a1, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = __error();
    objc_msgSend(v15, "fp_errorWithPOSIXCode:description:", v16, CFSTR("couldn't issue sandbox extension %s for '%@': %s"), a3, v17, strerror(*v18));
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    a5 = 0;
  }

  return a5;
}

- (id)fp_realpathURL
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fp_realpath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v3, objc_msgSend(a1, "hasDirectoryPath"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = a1;
  }
  v5 = v4;

  return v5;
}

- (id)fp_relativePathWithRealpath:()FPAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (v5 && v6)
  {
    objc_msgSend(v5, "fp_relativePathWithRealpath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)fp_shortDescription
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fp_prettyPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)fp_matchesEDSLocation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t (**v13)(_QWORD, _QWORD);
  _QWORD v15[4];
  id v16;

  objc_msgSend(CFSTR("PersonaVolumes/<uuid>/Containers/Data/InternalDaemon/<uuid>/Library/CloudStorage/<uuid>"), "componentsSeparatedByString:", CFSTR("/"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((fpfs_supports_sokoban() & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(CFSTR("PersonaVolumes/<uuid>/Containers/Data/InternalDaemon/<uuid>/Library/Mobile Documents"), "componentsSeparatedByString:", CFSTR("/"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/private/var"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fp_relativePathWithRealpath:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(CFSTR("PersonaVolumes/<uuid>/Containers/Shared/AppGroup/<uuid>/File Provider Storage"), "componentsSeparatedByString:", CFSTR("/"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("/"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    if (v8 >= objc_msgSend(v6, "count")
      || (v9 = objc_msgSend(v7, "count"), v9 >= objc_msgSend(v2, "count"))
      || (v10 = objc_msgSend(v7, "count"), v10 >= objc_msgSend(0, "count"))
      || (v11 = objc_msgSend(v7, "count"), v11 >= objc_msgSend(v3, "count")))
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __43__NSURL_FPAdditions__fp_matchesEDSLocation__block_invoke;
      v15[3] = &unk_1E444B4B8;
      v16 = v7;
      v13 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x1A1B00850](v15);
      if ((((uint64_t (**)(_QWORD, void *))v13)[2](v13, v6) & 1) != 0
        || (((uint64_t (**)(_QWORD, void *))v13)[2](v13, v2) & 1) != 0
        || (v13[2](v13, 0) & 1) != 0)
      {
        v12 = 1;
      }
      else if ((fpfs_supports_sokoban() & 1) != 0)
      {
        v12 = 0;
      }
      else
      {
        v12 = ((uint64_t (**)(_QWORD, void *))v13)[2](v13, v3);
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)fp_lmdURL
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E98], "fp_homeDirectory");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library/Mobile Documents"), 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)fp_homeDirectory
{
  uint64_t v0;
  void *v1;

  v0 = geteuid();
  if ((_DWORD)v0)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fp_homeDirectoryForUserID:", v0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = 0;
  }
  return v1;
}

- (BOOL)fp_matchesAlternateContentsURL:()FPAdditions
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  _BOOL8 v10;

  objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", CFSTR("Containers/Data/Application/"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "fp_relativePathWithRealpath:", a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "rangeOfString:", CFSTR("/"));
    v10 = 0;
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v6, "substringFromIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "hasPrefix:", CFSTR("/Library/Application Support/Collaboration/com.apple.iWork"));

      if ((v9 & 1) != 0)
        v10 = 1;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (uint64_t)fp_matchesFileProviderHeuristics:()FPAdditions
{
  id v4;
  __int16 v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _OWORD v16[2];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = 0;
  v4 = objc_retainAutorelease(a1);
  memset(v16, 0, sizeof(v16));
  v12 = xmmword_1A0B53B88;
  v13 = 0;
  if (getattrlist((const char *)objc_msgSend(v4, "fileSystemRepresentation"), &v12, v16, 0x20uLL, 0x21u) < 0)
  {
    if (*__error() != 2)
    {
      fp_current_or_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[NSURL(FPAdditions) fp_matchesFileProviderHeuristics:].cold.1(v4);

    }
  }
  else
  {
    v5 = WORD2(v16[0]);
    __strlcpy_chk();
    if ((v5 & 0x1200) != 0x1000)
      return 1;
  }
  objc_msgSend(v4, "fp_realpathURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fp_homeDirectoryForUserID:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fp_realpathURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "fp_matchesFileProviderURL:", v10) & 1) != 0
    || (objc_msgSend(v8, "fp_matchesApplicationContainerURL:", v10) & 1) != 0
    || (objc_msgSend(v8, "fp_matchesEDSLocation") & 1) != 0
    || (objc_msgSend(v8, "fp_matchesCloudDocsURL:", v10) & 1) != 0
    || (objc_msgSend(v8, "fp_matchesFPFSURL:", v10) & 1) != 0
    || (objc_msgSend(v8, "fp_matchesLiveFilesURL:", v10) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v6 = objc_msgSend(v8, "fp_matchesAlternateContentsURL:", v10);
  }

  return v6;
}

+ (id)fp_homeDirectoryForUserID:()FPAdditions
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E98], "fp_homeDirectoryPathForUserID:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v0, 1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = 0;
  }

  return v1;
}

+ (id)fp_homeDirectoryPathForUserID:()FPAdditions
{
  char *v3;
  char *v4;
  void *v5;

  v3 = copyHomeDirectoryCompat(a3);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    free(v4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (uint64_t)fp_matchesFileProviderURL:()FPAdditions
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", CFSTR("Containers/Shared/AppGroup/"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "fp_relativePathWithRealpath:", a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pathComponents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v7, "count") < 2)
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("File Provider Storage"));

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (uint64_t)fp_matchesCloudDocsURL:()FPAdditions
{
  id v4;
  void *v5;
  uint64_t v6;

  if (!a3)
    return 0;
  v4 = a3;
  objc_msgSend(v4, "fp_relativePathWithRealpath:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "fp_isLocationOrInLocation:relativeTo:", CFSTR("Library/Mobile Documents"), v4);

  return v6;
}

- (uint64_t)fp_matchesApplicationContainerURL:()FPAdditions
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;

  objc_msgSend(a1, "_fp_componentsRelativeToRoot:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2
    && (unint64_t)objc_msgSend(v2, "count") >= 2
    && (objc_msgSend(v3, "objectAtIndexedSubscript:", 1),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("Documents")),
        v4,
        v5))
  {
    v6 = objc_msgSend(a1, "_fp_partOfAppInboxWithURLComponents:", v3) ^ 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)fp_isLocationOrInLocation:()FPAdditions relativeTo:
{
  void *v5;
  void *v6;
  _BOOL8 v7;

  objc_msgSend(a4, "URLByAppendingPathComponent:isDirectory:", a3, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fp_relativePathWithRealpath:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
}

- (id)_fp_componentsRelativeToRoot:()FPAdditions
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", CFSTR("Containers/Data/Application/"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "fp_relativePathWithRealpath:", a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pathComponents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (uint64_t)fp_matchesFPFSURL:()FPAdditions
{
  void *v3;
  uint64_t v4;

  if (!a3)
    return 0;
  objc_msgSend(a3, "fp_relativePathWithRealpath:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", kFPPath_Library_Slash_CloudStorage_Slash);

  return v4;
}

- (uint64_t)fp_matchesLiveFilesURL:()FPAdditions
{
  void *v3;
  uint64_t v4;

  if (!a3)
    return 0;
  objc_msgSend(a3, "fp_relativePathWithRealpath:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("Library/liveFiles/")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("Library/LiveFiles/"));

  return v4;
}

- (uint64_t)fp_fpfsProviderDomainID:()FPAdditions error:
{
  return objc_msgSend(a1, "fp_fpfsProviderDomainID:skipTypeCheck:error:", a3, 0, a4);
}

- (uint64_t)fp_fpfsProviderDomainID:()FPAdditions
{
  return objc_msgSend(a1, "fp_fpfsProviderDomainID:error:", a3, 0);
}

+ (id)fp_supportDirectory
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E98], "fp_personaSharedDirectory");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLByAppendingPathComponent:", CFSTR("Library/Application Support/FileProvider"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)fp_personaSharedDirectory
{
  uint64_t v0;
  void *v1;
  void *v2;

  v0 = geteuid();
  if ((_DWORD)v0)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fp_personaSharedDirectoryPathForUserID:", v0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (v1)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v1, 1);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = 0;
    }

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

+ (id)fp_personaSharedDirectoryPathForUserID:()FPAdditions
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;

  if (fp_personaSharedDirectoryPathForUserID__once != -1)
    dispatch_once(&fp_personaSharedDirectoryPathForUserID__once, &__block_literal_global_9);
  v4 = (id)fp_personaSharedDirectoryPathForUserID__pathByPersonaID;
  objc_sync_enter(v4);
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentPersona");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "userPersonaUniqueString");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = CFSTR("__FPDefaultPersona__");
  if (v7)
    v9 = (__CFString *)v7;
  v10 = v9;

  objc_msgSend((id)fp_personaSharedDirectoryPathForUserID__pathByPersonaID, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    if (objc_msgSend(v6, "isEnterprisePersona"))
    {
      if (fpfs_supports_sokoban())
        objc_msgSend((id)kFPGroupContainerIdentifier, "fileSystemRepresentation");
      v14 = container_create_or_lookup_path_for_current_user();
    }
    else
    {
      v14 = (uint64_t)copyHomeDirectoryCompat(a3);
    }
    v15 = (void *)v14;
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v14);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      free(v15);
      fp_current_or_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        +[NSURL(FPAdditions) fp_personaSharedDirectoryPathForUserID:].cold.2();

      objc_msgSend((id)fp_personaSharedDirectoryPathForUserID__pathByPersonaID, "setObject:forKeyedSubscript:", v13, v10);
    }
    else
    {
      fp_current_or_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        +[NSURL(FPAdditions) fp_personaSharedDirectoryPathForUserID:].cold.1();

      v13 = 0;
    }
  }

  objc_sync_exit(v4);
  return v13;
}

- (uint64_t)fp_relationshipToItemAtURL:()FPAdditions
{
  return objc_msgSend(a1, "_fp_relationshipToItemAtURL:bothAreRealpaths:", a3, 0);
}

+ (id)fp_tempDirectoryForEnterprisePersona
{
  void *v0;
  void *v1;
  void *v2;
  char v3;
  id v4;
  NSObject *v5;
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E98], "fp_personaSharedDirectory");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLByAppendingPathComponent:", CFSTR("tmp/com.apple.fileproviderd"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v3 = objc_msgSend(v2, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v1, 1, 0, &v7);
  v4 = v7;

  if ((v3 & 1) == 0)
  {
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[NSURL(FPAdditions) fp_tempDirectoryForEnterprisePersona].cold.1();

  }
  return v1;
}

+ (id)fp_secureTempDirectory
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "currentPersona");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v1, "isEnterprisePersona") & 1) != 0)
    objc_msgSend(MEMORY[0x1E0C99E98], "fp_tempDirectoryForEnterprisePersona");
  else
    objc_msgSend(MEMORY[0x1E0C99E98], "fp_secureTempDirectoryIgnoringPersona");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)fp_secureTempDirectoryIgnoringPersona
{
  if (fp_secureTempDirectoryIgnoringPersona_once != -1)
    dispatch_once(&fp_secureTempDirectoryIgnoringPersona_once, &__block_literal_global_28);
  return (id)fp_secureTempDirectoryIgnoringPersona_sandboxedTemporaryDirectory;
}

+ (id)fp_insecureTempDirectory
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "currentPersona");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v1, "isEnterprisePersona") & 1) != 0)
    objc_msgSend(MEMORY[0x1E0C99E98], "fp_tempDirectoryForEnterprisePersona");
  else
    objc_msgSend(MEMORY[0x1E0C99E98], "fp_insecureTempDirectoryIgnoringPersona");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)fp_insecureTempDirectoryIgnoringPersona
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0C99E98], "fp_insecureTempDirectoryIgnoringPersonaString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fileURLWithPath:isDirectory:", v1, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)fp_cloudStorageDirectory
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E98], "fp_personaSharedDirectory");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLByAppendingPathComponent:", kFPPath_Library_Slash_CloudStorage_Slash);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)fp_backupManifestDirectory
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E98], "fp_supportDirectory");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLByAppendingPathComponent:isDirectory:", CFSTR("backup"), 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)fp_supportDirectoryForVolume:()FPAdditions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0C99E98];
  v4 = a3;
  objc_msgSend(v3, "fp_personaSharedDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fp_mountOnName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "fp_mountOnName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "fp_relationshipToItemAtURL:", v7) == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fp_supportDirectory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)kFPPath_DotCloudStorage_Slash, "stringByAppendingPathComponent:", CFSTR("System"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)fp_scopeDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;

  v2 = (void *)MEMORY[0x1A1AFFD7C]();
  v3 = (void *)_CFURLPromiseCopyPhysicalURL();
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "isEqual:", a1) & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1A1AFFD7C](v4);
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "fp_shortDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
      v12 = CFSTR("s");
    else
      v12 = CFSTR("n");
    objc_msgSend(v4, "lastPathComponent");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v7)
      v15 = CFSTR("s");
    else
      v15 = CFSTR("n");
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ (%@) -> %@ (%@)"), v11, v12, v13, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "fp_shortDescription");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = CFSTR("s");
    if (!v2)
      v8 = CFSTR("n");
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ (%@)"), v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)fp_relativePathOf:()FPAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "fp_realpathURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fp_realpathURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "fp_relativePathWithRealpath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (uint64_t)fp_realPathRelationshipToItemAtRealPathURL:()FPAdditions
{
  return objc_msgSend(a1, "_fp_relationshipToItemAtURL:bothAreRealpaths:", a3, 1);
}

- (uint64_t)_fp_relationshipToItemAtURL:()FPAdditions bothAreRealpaths:
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  id v13;
  id v14;
  BOOL v15;
  int v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  char v21;
  id v22;
  void *v23;
  void *v24;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;

  v6 = a3;
  v7 = 2;
  v33 = 2;
  if (v6)
  {
    objc_msgSend(a1, "fp_relativePathWithRealpath:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = v8;
      v7 = objc_msgSend(v8, "length") == 0;
LABEL_26:

      goto LABEL_27;
    }
    v10 = *MEMORY[0x1E0C99BC8];
    objc_msgSend(a1, "removeCachedResourceValueForKey:", *MEMORY[0x1E0C99BC8]);
    v11 = *MEMORY[0x1E0C999D0];
    objc_msgSend(a1, "removeCachedResourceValueForKey:", *MEMORY[0x1E0C999D0]);
    objc_msgSend(a1, "removeCachedResourceValueForKey:", *MEMORY[0x1E0C99948]);
    objc_msgSend(a1, "removeCachedResourceValueForKey:", *MEMORY[0x1E0C99A48]);
    objc_msgSend(a1, "removeCachedResourceValueForKey:", *MEMORY[0x1E0C99AA0]);
    v31 = 0;
    v32 = 0;
    v12 = objc_msgSend(a1, "getResourceValue:forKey:error:", &v32, v10, &v31);
    v13 = v32;
    v14 = v31;
    if (v12)
      v15 = v13 == 0;
    else
      v15 = 1;
    if (v15)
    {
      v17 = 0;
    }
    else
    {
      v29 = 0;
      v30 = 0;
      v16 = objc_msgSend(v6, "getResourceValue:forKey:error:", &v30, v10, &v29);
      v17 = v30;
      v18 = v29;

      if (v16 && v17 && objc_msgSend(v13, "isEqual:", v17))
      {
        v27 = 0;
        v28 = 0;
        objc_msgSend(a1, "getResourceValue:forKey:error:", &v28, v11, &v27);
        v19 = v28;
        v14 = v27;

        if ((objc_msgSend(v19, "BOOLValue") & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v14;
          v21 = objc_msgSend(v20, "getRelationship:ofDirectoryAtURL:toItemAtURL:error:", &v33, a1, v6, &v26);
          v22 = v26;

          v7 = v33;
          if ((v21 & 1) != 0)
          {
            v9 = 0;
            v14 = v22;
LABEL_25:

            goto LABEL_26;
          }
          v14 = v22;
        }
        else
        {

        }
      }
      else
      {
        v14 = v18;
      }
    }
    if (a4)
    {
      v9 = 0;
      v7 = v33;
    }
    else
    {
      objc_msgSend(a1, "fp_realpathURL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "fp_realpathURL");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "fp_relativePathWithRealpath:", v24);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToString:", &stru_1E4450B40))
      {
        v7 = 1;
        v33 = 1;
      }
      else if (v9)
      {
        v7 = 0;
        v33 = 0;
      }
      else
      {
        v7 = v33;
      }

    }
    goto LABEL_25;
  }
LABEL_27:

  return v7;
}

- (uint64_t)fp_isSymlink
{
  int v2;
  id v3;
  uint64_t v4;
  id v6;

  v2 = objc_msgSend(a1, "startAccessingSecurityScopedResource");
  v6 = 0;
  objc_msgSend(a1, "getResourceValue:forKey:error:", &v6, *MEMORY[0x1E0C99A28], 0);
  v3 = v6;
  if (v2)
    objc_msgSend(a1, "stopAccessingSecurityScopedResource");
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (uint64_t)fp_isFolder
{
  int v2;
  uint64_t v3;
  char v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  int v9;
  uint64_t v10;
  int v11;
  id v12;
  id v14;
  id v15;
  id v16;

  v2 = objc_msgSend(a1, "startAccessingSecurityScopedResource");
  v16 = 0;
  v3 = *MEMORY[0x1E0C999D0];
  v15 = 0;
  v4 = objc_msgSend(a1, "getResourceValue:forKey:error:", &v16, v3, &v15);
  v5 = v16;
  v6 = v15;
  v7 = v6;
  if ((v4 & 1) != 0
    || !objc_msgSend(v6, "fp_isCocoaErrorCode:", 258)
    || !fpfs_supports_long_paths())
  {
    if ((objc_msgSend(v5, "BOOLValue") & 1) != 0)
    {
      v14 = 0;
      objc_msgSend(a1, "getResourceValue:forKey:error:", &v14, *MEMORY[0x1E0C99A00], 0);
      v12 = v14;
      if (v2)
        objc_msgSend(a1, "stopAccessingSecurityScopedResource");
      if ((objc_msgSend(v12, "BOOLValue") & 1) == 0)
      {
        v10 = objc_msgSend(v5, "BOOLValue");
        goto LABEL_18;
      }
    }
    else
    {
      if (v2)
        objc_msgSend(a1, "stopAccessingSecurityScopedResource");
      v12 = 0;
    }
    v10 = 0;
    goto LABEL_18;
  }
  objc_msgSend(a1, "path");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = fpfs_open_longpath((char *)objc_msgSend(v8, "fileSystemRepresentation"), 1081344, 0);

  v10 = v9 >= 0;
  if ((v9 & 0x80000000) == 0)
  {
    v11 = *__error();
    close(v9);
    *__error() = v11;
  }
  if (v2)
    objc_msgSend(a1, "stopAccessingSecurityScopedResource");
  v12 = 0;
LABEL_18:

  return v10;
}

- (uint64_t)fp_isPackage
{
  int v2;
  id v3;
  id v4;
  uint64_t v5;
  id v7;
  id v8;

  v2 = objc_msgSend(a1, "startAccessingSecurityScopedResource");
  v8 = 0;
  objc_msgSend(a1, "getResourceValue:forKey:error:", &v8, *MEMORY[0x1E0C999D0], 0);
  v3 = v8;
  if ((objc_msgSend(v3, "BOOLValue") & 1) != 0)
  {
    v7 = 0;
    objc_msgSend(a1, "getResourceValue:forKey:error:", &v7, *MEMORY[0x1E0C99A00], 0);
    v4 = v7;
    if (v2)
      objc_msgSend(a1, "stopAccessingSecurityScopedResource");
    if (objc_msgSend(v4, "BOOLValue"))
      v5 = objc_msgSend(v3, "BOOLValue");
    else
      v5 = 0;
  }
  else
  {
    if (v2)
      objc_msgSend(a1, "stopAccessingSecurityScopedResource");
    v5 = 0;
    v4 = 0;
  }

  return v5;
}

- (void)fp_hideExtension:()FPAdditions
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  NSObject *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0C999B0];
  v7 = 0;
  v4 = objc_msgSend(a1, "setResourceValue:forKey:error:", v2, v3, &v7);
  v5 = v7;

  if ((v4 & 1) == 0)
  {
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[NSURL(FPAdditions) fp_hideExtension:].cold.1((uint64_t)a1, v5, v6);

  }
}

- (uint64_t)fp_removeFileProviderXattrsWithError:()FPAdditions
{
  id v4;
  int v5;
  uint64_t v6;
  char i;
  char v8;
  NSObject *v10;

  v4 = objc_retainAutorelease(a1);
  v5 = open((const char *)objc_msgSend(v4, "fileSystemRepresentation"), 2097158);
  if (v5 < 0
    && (*__error() != 21
     || (v5 = open((const char *)objc_msgSend(objc_retainAutorelease(v4), "fileSystemRepresentation"), 1048836), v5 < 0)))
  {
    fp_current_or_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[NSURL(FPAdditions) fp_removeFileProviderXattrsWithError:].cold.1((uint64_t)v4, v10);

  }
  else
  {
    v6 = 0;
    for (i = 1; ; i = 0)
    {
      v8 = i;
      if (fremovexattr(v5, _fileprovider_xattrs[v6], 0) < 0 && *__error() != 93)
        break;
      v6 = 1;
      if ((v8 & 1) == 0)
      {
        close(v5);
        return 1;
      }
    }
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", *__error());
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    close(v5);
  }
  return 0;
}

- (BOOL)fp_removeACLWithError:()FPAdditions
{
  NSObject *v5;
  int v6;
  int v7;
  uint64_t section;

  section = __fp_create_section();
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[NSURL(FPAdditions) fp_removeACLWithError:].cold.1(&section);

  v6 = fpfs_clear_file_acl((const char *)objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation"));
  v7 = v6;
  if (a3 && v6 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", *__error());
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  __fp_leave_section_Debug((uint64_t)&section);
  return v7 >= 0;
}

- (uint64_t)fp_makeWritableWithError:()FPAdditions
{
  id v4;
  uint64_t v5;
  int v6;
  uint64_t v7;

  v4 = objc_retainAutorelease(a1);
  v5 = open((const char *)objc_msgSend(v4, "fileSystemRepresentation"), 33028);
  if ((v5 & 0x80000000) != 0)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", *__error());
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  else
  {
    v6 = v5;
    v7 = objc_msgSend(v4, "fp_makeWritableOnFD:error:", v5, a3);
    close(v6);
    return v7;
  }
}

- (uint64_t)fp_makeWritableOnFD:()FPAdditions error:
{
  mode_t v6;
  NSObject *v7;
  uint64_t result;
  NSObject *v9;
  id v10;
  NSObject *v11;
  stat v12;

  memset(&v12, 0, sizeof(v12));
  if (fstat(a3, &v12) < 0)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", *__error());
      v10 = (id)objc_claimAutoreleasedReturnValue();
      result = 0;
      *a4 = v10;
      return result;
    }
    return 0;
  }
  if ((v12.st_mode & 0x80) == 0)
  {
    if (v12.st_mode)
      v6 = v12.st_mode | 0x80;
    else
      v6 = 493;
    if (fchmod(a3, v6) < 0)
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", *__error());
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      fp_current_or_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        goto LABEL_29;
      goto LABEL_28;
    }
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[NSURL(FPAdditions) fp_makeWritableOnFD:error:].cold.4();

  }
  if (fp_makeWritableOnFD_error__onceToken != -1)
    dispatch_once(&fp_makeWritableOnFD_error__onceToken, &__block_literal_global_46);
  result = 1;
  if (fp_makeWritableOnFD_error__mobile_uid
    && fp_makeWritableOnFD_error__mobile_gid
    && *(_QWORD *)&v12.st_uid != __PAIR64__(fp_makeWritableOnFD_error__mobile_gid, fp_makeWritableOnFD_error__mobile_uid))
  {
    if ((fchown(a3, fp_makeWritableOnFD_error__mobile_uid, fp_makeWritableOnFD_error__mobile_gid) & 0x80000000) == 0)
    {
      fp_current_or_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[NSURL(FPAdditions) fp_makeWritableOnFD:error:].cold.3();

      return 1;
    }
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", *__error());
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    fp_current_or_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
LABEL_28:
    -[NSURL(FPAdditions) fp_makeWritableOnFD:error:].cold.1();
LABEL_29:

    return 0;
  }
  return result;
}

- (void)fp_makeWritableAndRemoveNonExportableAttributes
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_0_5(&dword_1A0A34000, v1, v2, "[DEBUG] ┏%llx fp_makeWritableAndRemoveNonExportableAttributes item: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_3();
}

- (uint64_t)fp_checkSandboxFileMetadataRead
{
  pid_t v2;
  int v3;
  id v4;
  int v5;
  int v6;
  id v7;
  void *v8;
  id v9;
  _BOOL8 v10;
  id v12;
  id v13;

  v2 = getpid();
  v3 = *MEMORY[0x1E0C806B0] | 1;
  objc_msgSend(a1, "path");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = fpfs_lp_sandbox_check(v2, (uint64_t)"file-read-metadata", v3, (const char *)objc_msgSend(v4, "fileSystemRepresentation"));

  if (!v5)
    return 1;
  v13 = 0;
  v6 = objc_msgSend(a1, "checkResourceIsReachableAndReturnError:", &v13);
  v7 = v13;
  if (v6
    && (v12 = 0, objc_msgSend(a1, "getResourceValue:forKey:error:", &v12, *MEMORY[0x1E0C99A28], 0))
    && objc_msgSend(v12, "BOOLValue"))
  {
    objc_msgSend(a1, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByDeletingLastPathComponent");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = fpfs_lp_sandbox_check(v2, (uint64_t)"file-read-metadata", v3, (const char *)objc_msgSend(v9, "fileSystemRepresentation")) == 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)fp_addDocumentTrackingWithError:()FPAdditions
{
  const char *v4;
  pid_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  uint64_t DocumentId;
  NSObject *v12;
  NSObject *v13;

  v4 = (const char *)objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation");
  v5 = getpid();
  if (fpfs_lp_sandbox_check(v5, (uint64_t)"file-write-flags", *MEMORY[0x1E0C806B0] | 1u, v4))
  {
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[NSURL(FPAdditions) fp_addDocumentTrackingWithError:].cold.3();

    v7 = 0;
    v8 = *__error();
    if (!a3)
      return v7;
    goto LABEL_20;
  }
  v9 = open(v4, 260);
  if (v9 < 0)
  {
    v8 = *__error();
    if (v8 == 2)
    {
      v7 = 0;
      v8 = 2;
      if (!a3)
        return v7;
      goto LABEL_20;
    }
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[NSURL(FPAdditions) fp_addDocumentTrackingWithError:].cold.1();

    v7 = 0;
    if (a3)
    {
LABEL_20:
      if (!v7)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v8, 0);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  else
  {
    v10 = v9;
    DocumentId = GSLibraryGetOrAllocateDocumentId();
    if ((_DWORD)DocumentId)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", DocumentId);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 0;
    }
    else
    {
      v8 = *__error();
      fp_current_or_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[NSURL(FPAdditions) fp_addDocumentTrackingWithError:].cold.2();

      v7 = 0;
    }
    close(v10);
    if (a3)
      goto LABEL_20;
  }
  return v7;
}

- (void)fp_attachSecurityScopeFromURL:()FPAdditions
{
  void *v4;
  void *v5;

  v4 = (void *)MEMORY[0x1A1AFFD7C](a3);
  if (v4)
  {
    v5 = v4;
    MEMORY[0x1A1AFFD4C](a1);
    v4 = v5;
  }

}

- (BOOL)fp_associateThumbnailFromDocumentAtURL:()FPAdditions error:
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  id v13;
  _BOOL8 v14;
  id v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v6 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v7 = (void *)getGSStorageManagerClass_softClass;
  v21 = getGSStorageManagerClass_softClass;
  if (!getGSStorageManagerClass_softClass)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __getGSStorageManagerClass_block_invoke;
    v17[3] = &unk_1E444B188;
    v17[4] = &v18;
    __getGSStorageManagerClass_block_invoke((uint64_t)v17);
    v7 = (void *)v19[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v18, 8);
  objc_msgSend(v8, "manager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isPermanentStorageSupportedAtURL:error:", a1, 0);

  if (v10)
  {
    v11 = objc_msgSend(a1, "startAccessingSecurityScopedResource");
    v12 = objc_msgSend(v6, "startAccessingSecurityScopedResource");
    v16 = 0;
    objc_msgSend(getQLThumbnailAdditionClass(), "associateThumbnailsForDocumentAtURL:withDocumentAtURL:error:", v6, a1, &v16);
    v13 = v16;
    if (v11)
    {
      objc_msgSend(a1, "stopAccessingSecurityScopedResource");
      if (!v12)
      {
LABEL_6:
        if (!a4)
        {
LABEL_8:
          v14 = v13 == 0;

          goto LABEL_15;
        }
LABEL_7:
        *a4 = objc_retainAutorelease(v13);
        goto LABEL_8;
      }
    }
    else if (!v12)
    {
      goto LABEL_6;
    }
    objc_msgSend(v6, "stopAccessingSecurityScopedResource");
    if (!a4)
      goto LABEL_8;
    goto LABEL_7;
  }
  if (a4)
  {
    FPNotSupportedError();
    v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
LABEL_15:

  return v14;
}

- (BOOL)fp_associateThumbnailToVersionAtURL:()FPAdditions thumbnailMetadata:error:
{
  id v8;
  id v9;
  int v10;
  int v11;
  id QLThumbnailAdditionClass;
  void *v13;
  id v14;
  NSObject *v16;
  id v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(a1, "startAccessingSecurityScopedResource");
  v11 = objc_msgSend(v8, "startAccessingSecurityScopedResource");
  QLThumbnailAdditionClass = getQLThumbnailAdditionClass();
  v18 = *MEMORY[0x1E0C998A8];
  v19[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  LODWORD(QLThumbnailAdditionClass) = objc_msgSend(QLThumbnailAdditionClass, "associateThumbnailImagesDictionary:serializedQuickLookMetadata:withImmutableDocument:atURL:error:", v13, v9, 1, a1, &v17);

  v14 = v17;
  if ((_DWORD)QLThumbnailAdditionClass)
  {
    objc_msgSend(a1, "fp_hasThumbnailOnImmutableDocument");
    fp_current_or_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[NSURL(FPAdditions) fp_associateThumbnailToVersionAtURL:thumbnailMetadata:error:].cold.1();

    if (!v10)
    {
LABEL_3:
      if (!v11)
        goto LABEL_4;
LABEL_11:
      objc_msgSend(v8, "stopAccessingSecurityScopedResource");
      if (!a5)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if (!v10)
  {
    goto LABEL_3;
  }
  objc_msgSend(a1, "stopAccessingSecurityScopedResource");
  if (v11)
    goto LABEL_11;
LABEL_4:
  if (a5)
LABEL_5:
    *a5 = objc_retainAutorelease(v14);
LABEL_6:

  return v14 == 0;
}

- (uint64_t)fp_hasThumbnailOnImmutableDocument
{
  return objc_msgSend(getQLThumbnailAdditionClass(), "hasThumbnailOnImmutableDocumentAtURL:", a1);
}

- (id)fp_directorySizeWithError:()FPAdditions
{
  double Current;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint64_t v18;

  v18 = 0;
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation");
  v6 = dirstat_np();
  if (CFAbsoluteTimeGetCurrent() - Current > 1.0)
  {
    fp_simulate_crash(CFSTR("dirstat took more than 1s to return"), v7, v8, v9, v10, v11, v12, v13, 0);
    fp_current_or_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[NSURL(FPAdditions) fp_directorySizeWithError:].cold.1(v14);

  }
  if (v6 < 0)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", *__error());
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      *a3 = v16;
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v15;
}

- (id)fp_uniqueTempFolderWithError:()FPAdditions
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, a1, 1, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingPathComponent:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 1, 0, a3);
    v13 = 0;
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v10, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)fp_moveToTempFolderWithFilename:()FPAdditions error:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "fp_uniqueTempFolderWithError:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (!v6)
    {
      objc_msgSend(a1, "lastPathComponent");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "URLByAppendingPathComponent:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 1, 0, a4);

    v12 = 0;
    if (v11)
    {
      if (objc_msgSend(v9, "moveItemAtURL:toURL:error:", a1, v8, a4))
      {
        v21 = *MEMORY[0x1E0CB2AD8];
        v22[0] = *MEMORY[0x1E0CB2AC0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "path");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0;
        v15 = objc_msgSend(v9, "setAttributes:ofItemAtPath:error:", v13, v14, &v20);
        v16 = v20;

        if ((v15 & 1) == 0)
        {
          fp_current_or_default_log();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            -[NSURL(FPAdditions) fp_moveToTempFolderWithFilename:error:].cold.1();

        }
        v18 = v8;
      }
      else
      {
        v18 = 0;
      }
      v12 = v18;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (uint64_t)_fp_partOfAppInboxWithURLComponents:()FPAdditions
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") < 3)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("Documents")))
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("Inbox"));

    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (uint64_t)fp_isAppInboxOrDescendants
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99E98], "fp_homeDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_fp_componentsRelativeToRoot:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(a1, "_fp_partOfAppInboxWithURLComponents:", v3);
  else
    v4 = 0;

  return v4;
}

- (id)fp_fpfsRootURL
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E98], "fp_homeDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "fp_relativePathOf:", a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)kFPPath_Library_Slash_CloudStorage_Slash;
    if (objc_msgSend(v4, "hasPrefix:", v5))
    {
      objc_msgSend(v4, "substringFromIndex:", objc_msgSend(v5, "length"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "pathComponents");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v7, "count") >= 2)
      {
        objc_msgSend(v3, "URLByAppendingPathComponent:", v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "URLByAppendingPathComponent:", v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v8 = 0;
      }

      v4 = v6;
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)fp_isInSyncableRootFast
{
  void *v2;
  void *v3;
  int v4;
  int v5;
  id v6;
  _BOOL8 v7;
  int v10;
  uint64_t v11;

  objc_msgSend(a1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "containsString:", kFPPath_Library_Slash_CloudStorage_Slash))
  {

  }
  else
  {
    objc_msgSend(a1, "path");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "containsString:", kFPPath_DotCloudStorage_Slash);

    if (!v4)
      return 0;
  }
  v5 = getiopolicy_np(3, 1);
  setiopolicy_np(3, 1, 1);
  v11 = 0;
  v6 = objc_retainAutorelease(a1);
  if ((fpfs_lp_fsctl((char *)objc_msgSend(v6, "fileSystemRepresentation"), 0x40084A4AuLL, &v11, 1u) & 0x80000000) == 0)
  {
    if (v11)
    {
      v7 = 1;
      goto LABEL_16;
    }
    if (objc_msgSend(v6, "hasDirectoryPath"))
    {
      v10 = 0;
      v7 = (int)fpfs_lp_fsctl((char *)objc_msgSend(objc_retainAutorelease(v6), "fileSystemRepresentation"), 0x40044A48uLL, &v10, 1u) >= 0&& v10 != 0;
      goto LABEL_16;
    }
  }
  v7 = 0;
LABEL_16:
  if ((v5 & 0x80000000) == 0)
    setiopolicy_np(3, 1, v5);
  return v7;
}

- (uint64_t)fp_matchesUbiquitousHeuristics
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  char v6;

  objc_msgSend(a1, "fp_realpathURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "fp_isInSyncableRootFast") & 1) != 0)
  {
    v2 = MEMORY[0x1E0C9AAB0];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fp_homeDirectory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fp_realpathURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      if ((objc_msgSend(v1, "fp_matchesApplicationContainerURL:", v4) & 1) != 0
        || (objc_msgSend(v1, "fp_matchesLiveFilesURL:", v4) & 1) != 0)
      {
        v2 = MEMORY[0x1E0C9AAA0];
      }
      else
      {
        v6 = objc_msgSend(v1, "fp_matchesCloudDocsURL:", v4);
        v2 = MEMORY[0x1E0C9AAB0];
        if ((v6 & 1) == 0 && !objc_msgSend(v1, "fp_matchesFPFSURL:", v4))
          v2 = 0;
      }
    }
    else
    {
      v2 = 0;
    }

  }
  return v2;
}

- (id)fp_commonDirectDescendantOf:()FPAdditions
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4
    && (objc_msgSend(a1, "path"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "path"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v5, "hasPrefix:", v6),
        v6,
        v5,
        v7))
  {
    objc_msgSend(a1, "pathComponents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      v9 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "URLWithString:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v23 = v8;
      objc_msgSend(v8, "subarrayWithRange:", 1, objc_msgSend(v8, "count") - 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v25;
        while (2)
        {
          v16 = 0;
          v17 = v11;
          do
          {
            if (*(_QWORD *)v25 != v15)
              objc_enumerationMutation(v12);
            v18 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v16);
            objc_msgSend(v4, "path");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "path");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v19, "hasPrefix:", v20);

            if (!v21)
            {
              v11 = v17;
              goto LABEL_15;
            }
            objc_msgSend(v17, "URLByAppendingPathComponent:", v18);
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            ++v16;
            v17 = v11;
          }
          while (v14 != v16);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          if (v14)
            continue;
          break;
        }
      }
LABEL_15:

      v8 = v23;
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)fp_bouncedNameWithIndex:()FPAdditions
{
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v5 = objc_msgSend(a1, "startAccessingSecurityScopedResource");
  v6 = objc_msgSend(a1, "fp_isFolder");
  if (v5)
    objc_msgSend(a1, "stopAccessingSecurityScopedResource");
  objc_msgSend(a1, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fp_bouncedNameWithIndex:isDir:", a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fp_volumeUUID
{
  id v1;
  void *v2;
  NSObject *v3;
  __int128 v5;
  uint64_t v6;
  _QWORD v7[2];
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v7[0] = 0;
  v7[1] = 0;
  v8 = 0;
  v5 = xmmword_1A0B53B70;
  v6 = 0;
  v1 = objc_retainAutorelease(a1);
  if (getattrlist((const char *)objc_msgSend(v1, "fileSystemRepresentation", 5, 0x40000, 0), &v5, v7, 0x14uLL, 0) < 0)
  {
    fp_current_or_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[NSURL(FPAdditions) fp_volumeUUID].cold.1(v1, v3);

    v2 = 0;
  }
  else
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", (char *)v7 + 4);
  }
  return v2;
}

- (id)fp_mountOnName
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  statfs v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  bzero(&v7, 0x878uLL);
  v2 = objc_retainAutorelease(a1);
  if (statfs((const char *)objc_msgSend(v2, "fileSystemRepresentation"), &v7) < 0)
  {
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[NSURL(FPAdditions) fp_mountOnName].cold.1(v2, v4);
    v5 = 0;
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7.f_mntonname);
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fileURLWithPath:isDirectory:", v4, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)fp_uncachedContainerURLForSecurityApplicationGroupIdentifier:()FPAdditions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  xpc_object_t v10;
  void *v11;
  void *v12;
  NSObject *v13;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "isSharedIPad");

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentPersona");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userPersonaUniqueString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_retainAutorelease(v7);
  objc_msgSend(v8, "UTF8String");
  container_query_create();
  container_query_set_class();
  v9 = objc_retainAutorelease(v3);
  v10 = xpc_string_create((const char *)objc_msgSend(v9, "UTF8String"));
  container_query_set_group_identifiers();

  container_query_set_transient();
  container_query_operation_set_flags();
  container_query_set_persona_unique_string();
  if (container_query_get_single_result())
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", container_get_path(), 1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    container_query_get_last_error();
    v12 = (void *)container_error_copy_unlocalized_description();
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[NSURL(FPAdditions) fp_uncachedContainerURLForSecurityApplicationGroupIdentifier:].cold.1();

    free(v12);
    v11 = 0;
  }
  container_query_free();

  return v11;
}

- (id)fp_fpfsProviderDomainID:()FPAdditions skipTypeCheck:error:
{
  id v6;
  void *v7;
  id v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  _BYTE *v12;
  _BYTE *v13;
  const char *v14;
  void *v15;
  uint64_t v16;
  unsigned int v17;
  BOOL v18;
  unsigned int v19;
  void *v20;
  unsigned int v21;
  uint64_t v22;
  size_t size;
  _BYTE v25[1025];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if ((a3 & 1) != 0)
  {
    objc_msgSend(a1, "fp_fpfsRootURL");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = a1;
  }
  v7 = v6;
  if (!v6)
  {
    if (!a5)
      goto LABEL_31;
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = 2;
LABEL_24:
    objc_msgSend(v15, "fp_errorWithPOSIXCode:", v16);
    v20 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_32;
  }
  bzero(v25, 0x401uLL);
  size = 0;
  v8 = objc_retainAutorelease(v7);
  v9 = fpfs_path_return_assigned_provider_domain_xattr((const char *)objc_msgSend(v8, "fileSystemRepresentation"), (ssize_t *)&size, v25, 0x401uLL);
  if (!v9)
  {
    if (!a5)
      goto LABEL_31;
    v17 = *__error();
    v18 = v17 == 0;
    v19 = 93;
LABEL_20:
    if (v18)
      v16 = v19;
    else
      v16 = v17;
    v15 = (void *)MEMORY[0x1E0CB35C8];
    goto LABEL_24;
  }
  v10 = v9;
  v11 = size;
  if (size >= 0x402)
  {
    v12 = malloc_type_malloc(size + 1, 0xCBBC383FuLL);
    if (v12)
    {
      v13 = v12;
      v14 = (const char *)objc_msgSend(objc_retainAutorelease(v8), "fileSystemRepresentation");
      v11 = getxattr(v14, v10, v13, size, 0, 1);
      if (v11 >= 1 && v11 <= (uint64_t)size)
      {
        size = v11;
        goto LABEL_16;
      }
      if (a5)
      {
        v21 = *__error();
        if (v21)
          v22 = v21;
        else
          v22 = 93;
        objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", v22);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      free(v13);
LABEL_31:
      v20 = 0;
      goto LABEL_32;
    }
    if (!a5)
      goto LABEL_31;
    v17 = *__error();
    v18 = v17 == 0;
    v19 = 12;
    goto LABEL_20;
  }
  v13 = v25;
LABEL_16:
  v13[v11] = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 != v25)
    free(v13);
LABEL_32:

  return v20;
}

- (id)fp_resolveDetachedRootLogicalLocation:()FPAdditions error:
{
  int v7;
  id v8;
  int v9;
  int v10;
  id v11;
  unint64_t v12;
  int64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  ssize_t v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  if (a3)
    *a3 = 0;
  v7 = getiopolicy_np(3, 1);
  if (v7 != 1)
    setiopolicy_np(3, 1, 1);
  v8 = objc_retainAutorelease(a1);
  v9 = open((const char *)objc_msgSend(v8, "fileSystemRepresentation"), 1081604);
  if ((v9 & 0x80000000) == 0)
  {
    v10 = v9;
    v11 = v8;
    v12 = fgetxattr(v10, "com.apple.fileprovider.detached#B", 0, 0, 0, 0);
    if ((v12 & 0x8000000000000000) != 0)
    {
      if (a4)
      {
        FPNotSupportedError();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:
        v21 = 0;
        *a4 = v17;
LABEL_27:

        close(v10);
        if (!v21)
        {
          v16 = 0;
LABEL_50:

          goto LABEL_51;
        }
        v22 = v11;
        objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v21, 0, 0, a4);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v23)
          goto LABEL_37;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v24 = v23;
          objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("name"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("parentBookmark"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(MEMORY[0x1E0C99E98], "URLByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:", v26, 536871424, 0, 0, a4);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = v27;
              if (v27)
              {
                objc_msgSend(v27, "URLByAppendingPathComponent:isDirectory:", v25, 1);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v16 = 0;
              }

            }
            else if (a4)
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:itemURL:debugDescription:", 22, v22, CFSTR("parentBookmark is not a data blob"));
              v16 = 0;
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v16 = 0;
            }

          }
          else if (a4)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:itemURL:debugDescription:", 22, v22, CFSTR("name is not a string"));
            v16 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v16 = 0;
          }

          goto LABEL_49;
        }
        if (a4)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:itemURL:debugDescription:", 22, v22, CFSTR("bookmark is not encoding a dictionary"));
          v16 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
LABEL_37:
          v16 = 0;
        }
LABEL_49:

        goto LABEL_50;
      }
    }
    else
    {
      v13 = v12;
      if (a3)
        *a3 = 1;
      if (v12 <= 0x100000)
      {
        v18 = malloc_type_malloc(v12, 0xFCF5D28DuLL);
        if (v18)
        {
          v19 = v18;
          v20 = fgetxattr(v10, "com.apple.fileprovider.detached#B", v18, v13, 0, 0);
          if (v20 <= v13)
          {
            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v19, v20, 1);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_27;
          }
          if (a4)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:itemURL:debugDescription:", 12, v11, CFSTR("xattr is too large for the allocated buffer"));
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          free(v19);
        }
        else if (a4)
        {
          v14 = (void *)MEMORY[0x1E0CB35C8];
          v15 = CFSTR("cannot allocate buffer");
          goto LABEL_24;
        }
      }
      else if (a4)
      {
        v14 = (void *)MEMORY[0x1E0CB35C8];
        v15 = CFSTR("detach root xattr is too large");
LABEL_24:
        objc_msgSend(v14, "fp_errorWithPOSIXCode:itemURL:debugDescription:", 12, v11, v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_25;
      }
    }
    v21 = 0;
    goto LABEL_27;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:itemURL:debugDescription:", *__error(), v8, CFSTR("item doesn't exist or is not a directory"));
    v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
LABEL_51:
  if (v7 != 1)
    setiopolicy_np(3, 1, v7);
  return v16;
}

+ (void)fp_personaSharedDirectoryPathForUserID:()FPAdditions .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_1A0A34000, v0, v1, "[ERROR] couldn't resolve shared directory for persona %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)fp_personaSharedDirectoryPathForUserID:()FPAdditions .cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_0_5(&dword_1A0A34000, v0, v1, "[DEBUG] resolved shared directory for persona %@: %@");
  OUTLINED_FUNCTION_3();
}

+ (void)fp_tempDirectoryForEnterprisePersona
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_1A0A34000, v0, v1, "[ERROR] Error creating secure temp directory for enterprise persona: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)fp_hideExtension:()FPAdditions .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "fp_prettyDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_19(&dword_1A0A34000, a3, v5, "[ERROR] Failed to set HasHiddenExtension property for %@: %@", v6);

  OUTLINED_FUNCTION_7();
}

- (void)fp_removeFileProviderXattrsWithError:()FPAdditions .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", *__error());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19_0();
  _os_log_debug_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] failed to open %@, error %@", v4, 0x16u);

  OUTLINED_FUNCTION_7();
}

- (void)fp_removeACLWithError:()FPAdditions .cold.1(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_0_5(&dword_1A0A34000, v1, v2, "[DEBUG] ┏%llx remove item ACLs: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_3();
}

- (void)fp_makeWritableOnFD:()FPAdditions error:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  __error();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_2(&dword_1A0A34000, v0, v1, "[ERROR] couldn't set permissions on %@; %{errno}d",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_6_1();
}

- (void)fp_makeWritableOnFD:()FPAdditions error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] fixed up ownership on %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)fp_makeWritableOnFD:()FPAdditions error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] fixed up permissions on %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)fp_addDocumentTrackingWithError:()FPAdditions .cold.1()
{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  v3 = 1024;
  v4 = v0;
  _os_log_error_impl(&dword_1A0A34000, v1, OS_LOG_TYPE_ERROR, "[ERROR] open failed at \"%s\", errno:%{errno}d", v2, 0x12u);
  OUTLINED_FUNCTION_3();
}

- (void)fp_addDocumentTrackingWithError:()FPAdditions .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19_2();
  OUTLINED_FUNCTION_4_2(&dword_1A0A34000, v0, v1, "[ERROR] GSLibraryGetOrAllocateDocumentId failed, errno:%{errno}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

- (void)fp_addDocumentTrackingWithError:()FPAdditions .cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] sandbox_check for \"file-write-flags\" failed at \"%s\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)fp_associateThumbnailToVersionAtURL:()FPAdditions thumbnailMetadata:error:.cold.1()
{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  v3 = 1024;
  v4 = v0;
  _os_log_debug_impl(&dword_1A0A34000, v1, OS_LOG_TYPE_DEBUG, "[DEBUG] verify thumbnail exist on = %@: %{BOOL}d", v2, 0x12u);
  OUTLINED_FUNCTION_3();
}

- (void)fp_directorySizeWithError:()FPAdditions .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A0A34000, log, OS_LOG_TYPE_FAULT, "[SIMCRASH] dirstat took more than 1s to return", v1, 2u);
  OUTLINED_FUNCTION_30();
}

- (void)fp_moveToTempFolderWithFilename:()FPAdditions error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_1A0A34000, v0, v1, "[ERROR] couldn't set protection level on file to be imported %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)fp_matchesFileProviderHeuristics:()FPAdditions .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "fp_shortDescription");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_21_1();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_2(&dword_1A0A34000, v2, v3, "[ERROR] getattrlist(%@) = %d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6_1();
}

- (void)fp_volumeUUID
{
  void *v2;
  int *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_shortDescription");
  objc_claimAutoreleasedReturnValue();
  v4 = OUTLINED_FUNCTION_21_1();
  strerror(*v4);
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_19(&dword_1A0A34000, a2, v5, "[ERROR] Unable to get file system attributes for volume path %{public}@: %{public}s", v6);

  OUTLINED_FUNCTION_6_1();
}

- (void)fp_mountOnName
{
  void *v2;
  int *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_shortDescription");
  objc_claimAutoreleasedReturnValue();
  v4 = OUTLINED_FUNCTION_21_1();
  strerror(*v4);
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_19(&dword_1A0A34000, a2, v5, "[ERROR] Unable to stat path %{public}@: %{public}s", v6);

  OUTLINED_FUNCTION_6_1();
}

+ (void)fp_uncachedContainerURLForSecurityApplicationGroupIdentifier:()FPAdditions .cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  v3 = 2080;
  v4 = v0;
  OUTLINED_FUNCTION_19(&dword_1A0A34000, v1, (uint64_t)v1, "[ERROR] Error fetching group container for %@: %s", v2);
  OUTLINED_FUNCTION_3();
}

@end
