@implementation _EXTCCUtil

+ (BOOL)photoServiceAuthorizationStatusWithExtensionUUID:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  const __CFAllocator *Default;
  CFBundleRef v9;
  CFBundleRef v10;
  id v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  void *i;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFBundle *v25;
  void *v26;
  id *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5848]), "initWithUUID:error:", v5, 0);
  objc_msgSend(v6, "containingBundleRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7
    && (Default = CFAllocatorGetDefault(), (v9 = CFBundleCreate(Default, (CFURLRef)objc_msgSend(v7, "URL"))) != 0))
  {
    v10 = v9;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v11 = (id)TCCAccessCopyInformationForBundle();
    v12 = (void *)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (v12)
    {
      v25 = v10;
      v26 = v6;
      v27 = a4;
      v28 = v5;
      v13 = *(_QWORD *)v30;
      v14 = (_QWORD *)MEMORY[0x1E0DB10B8];
      v15 = (_QWORD *)MEMORY[0x1E0DB1188];
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v30 != v13)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v17, "objectForKey:", *v14);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqualToString:", *v15);

          if (v19)
          {
            objc_msgSend(v17, "objectForKey:", *MEMORY[0x1E0DB10A8]);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v12) = objc_msgSend(v23, "BOOLValue");

            goto LABEL_14;
          }
        }
        v12 = (void *)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
        if (v12)
          continue;
        break;
      }
LABEL_14:
      a4 = v27;
      v5 = v28;
      v10 = v25;
      v6 = v26;
    }

    CFRelease(v10);
    v22 = 0;
  }
  else
  {
    v33 = *MEMORY[0x1E0CB2D50];
    v20 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "UUIDString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("Unable to resolve plugin for UUID %@"), v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.extensionKit.errorDomain"), 5, v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v12) = 0;
  }

  if (a4)
    *a4 = objc_retainAutorelease(v22);

  return (char)v12;
}

@end
