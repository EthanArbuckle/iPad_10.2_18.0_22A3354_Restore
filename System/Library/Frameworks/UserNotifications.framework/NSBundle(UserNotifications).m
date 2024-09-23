@implementation NSBundle(UserNotifications)

+ (id)userNotificationsBundleWithIdentifier:()UserNotifications
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  BOOL v26;
  void *v28;
  id v29;
  unsigned __int8 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[5];
  _BYTE v36[128];
  _QWORD v37[6];

  v37[3] = *MEMORY[0x1E0C80C00];
  v29 = a3;
  if (!v29)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSBundle+UserNotifications.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier != nil"));

  }
  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0x1E0C99000uLL;
  if (UNIsInternalInstall())
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    BSSystemRootDirectory();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v8;
    v37[1] = CFSTR("AppleInternal");
    v37[2] = CFSTR("Library");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pathWithComponents:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayByAddingObject:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v11;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v13 = v5;
  v14 = (void *)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v15)
          objc_enumerationMutation(v13);
        v17 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        v18 = (void *)MEMORY[0x1E0C99E98];
        BSSystemRootDirectory();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v35[0] = v19;
        v35[1] = v17;
        v35[2] = CFSTR("UserNotifications");
        v35[3] = CFSTR("Bundles");
        objc_msgSend(v29, "stringByAppendingPathExtension:", CFSTR("bundle"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v35[4] = v20;
        v21 = v6;
        objc_msgSend(*(id *)(v6 + 3360), "arrayWithObjects:count:", v35, 5);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "fileURLWithPathComponents:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = 0;
        objc_msgSend(v23, "path");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v20) = objc_msgSend(v12, "fileExistsAtPath:isDirectory:", v24, &v30);
        v25 = v30;

        if ((_DWORD)v20)
          v26 = v25 == 0;
        else
          v26 = 1;
        if (!v26)
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v23);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_17;
        }

        v6 = v21;
      }
      v14 = (void *)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v14);
  }
LABEL_17:

  return v14;
}

@end
