@implementation NSURL(BRPersonaAdditions)

- (BOOL)_br_isInPersonaRoot:()BRPersonaAdditions
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  _BOOL8 v10;

  objc_msgSend(a3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "hasSuffix:", CFSTR("/")) & 1) == 0)
  {
    objc_msgSend(v4, "stringByAppendingString:", CFSTR("/"));
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  if (objc_msgSend(a1, "isFileReferenceURL"))
  {
    objc_msgSend(a1, "filePathURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

    goto LABEL_8;
  }
  objc_msgSend(a1, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "hasPrefix:", CFSTR("file:///var/")))
  {
    objc_msgSend(v7, "substringFromIndex:", objc_msgSend(CFSTR("file:///var/"), "length"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("file:///private/var/"), "stringByAppendingString:", v6);
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
    goto LABEL_7;
  }
LABEL_8:
  v10 = v7
     && (v9 = objc_msgSend(v7, "length"), v9 >= objc_msgSend(v4, "length"))
     && objc_msgSend(v7, "compare:options:range:", v4, 1, 0, objc_msgSend(v4, "length")) == 0;

  return v10;
}

- (uint64_t)_br_isInLocalHomeDirectoryUnderPersona:()BRPersonaAdditions needsPersonaSwitch:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v6 = a3;
  +[BRDaemonConnection homeDirectoryURLForPersonaID:needsPersonaSwitch:](BRDaemonConnection, "homeDirectoryURLForPersonaID:needsPersonaSwitch:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRDaemonConnection mobileDocumentsURLForPersonaID:needsPersonaSwitch:](BRDaemonConnection, "mobileDocumentsURLForPersonaID:needsPersonaSwitch:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(a1, "_br_isInPersonaRoot:", v7) & 1) != 0)
    v9 = 1;
  else
    v9 = objc_msgSend(a1, "_br_isInPersonaRoot:", v8);

  return v9;
}

- (uint64_t)_br_isInLocalHomeDirectoryUnderCurrentPersona
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "br_currentPersonaIDWithIsDataSeparated:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "_br_isInLocalHomeDirectoryUnderPersona:needsPersonaSwitch:", v2, 0);

  return v3;
}

- (id)br_pathRelativeToSyncedRootURL:()BRPersonaAdditions currentPersonaID:
{
  id v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(a1, "isFileURL");
  v9 = 0;
  if (v6 && v8)
  {
    if (objc_msgSend(a1, "_br_isInLocalHomeDirectoryUnderPersona:needsPersonaSwitch:", v7, 0))
    {
      objc_msgSend(v6, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "br_pathRelativeToPath:", v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v9, "length"))
      {
        objc_msgSend(v11, "br_realpathKeepingLastSymlink");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "br_pathRelativeToPath:", v10);
        v13 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v13;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (uint64_t)br_containerIDWithCurrentPersonaID:()BRPersonaAdditions
{
  return objc_msgSend(a1, "br_containerIDWithCurrentPersonaID:needsPersonaSwitch:", a3, 0);
}

- (id)br_containerIDWithCurrentPersonaID:()BRPersonaAdditions needsPersonaSwitch:
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BRMangledID *v12;
  void *v13;
  BRMangledID *v14;

  v6 = a3;
  if (BRIsFPFSEnabled(v6, v7) && (objc_msgSend(a1, "br_isInTrash") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    +[BRDaemonConnection mobileDocumentsURLForPersonaID:needsPersonaSwitch:](BRDaemonConnection, "mobileDocumentsURLForPersonaID:needsPersonaSwitch:", v6, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "br_pathRelativeToSyncedRootURL:currentPersonaID:", v9, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "pathComponents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      v12 = [BRMangledID alloc];
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[BRMangledID initWithMangledString:](v12, "initWithMangledString:", v13);

      -[BRMangledID appLibraryOrZoneName](v14, "appLibraryOrZoneName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (uint64_t)br_mightBeOnDataSeparatedVolume
{
  void *v1;
  void *v2;
  int v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "pathComponents");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v1, "count") < 5)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 1;
    if (objc_msgSend(v2, "isEqualToString:", CFSTR("/")))
    {
      objc_msgSend(v1, "objectAtIndexedSubscript:", 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "isEqualToString:", CFSTR("private")))
      {
        objc_msgSend(v1, "objectAtIndexedSubscript:", 3);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = objc_msgSend(v5, "isEqualToString:", CFSTR("PersonaVolumes")) ^ 1;

      }
    }

  }
  return v3 ^ 1u;
}

@end
