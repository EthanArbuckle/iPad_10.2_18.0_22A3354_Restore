@implementation ARFrameworkVersions

void __ARFrameworkVersions_block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[2];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v1 = objc_msgSend(&unk_1E66CED90, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)v26;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v26 != v3)
          objc_enumerationMutation(&unk_1E66CED90);
        v5 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v4);
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "lastPathComponent");
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = (void *)v7;
        if (v6)
          goto LABEL_8;
        v9 = (void *)MEMORY[0x1E0CB34D0];
        v10 = (void *)MEMORY[0x1E0CB3940];
        v29[0] = CFSTR("/AppleInternal/Library/Frameworks");
        v29[1] = v7;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "pathWithComponents:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "bundleWithPath:", v12);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
        {
LABEL_8:
          objc_msgSend(v6, "infoDictionary");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("CFBundleName"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v14)
          {
            v16 = v14;
          }
          else
          {
            objc_msgSend(v8, "stringByDeletingPathExtension");
            v16 = (id)objc_claimAutoreleasedReturnValue();
          }
          v17 = v16;

          objc_msgSend(v6, "infoDictionary");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("CFBundleVersion"));
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = (void *)v19;
          v21 = CFSTR("Unknown Version");
          if (v19)
            v21 = (__CFString *)v19;
          v22 = v21;

        }
        else
        {
          objc_msgSend(v8, "stringByDeletingPathExtension");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = v8;
          v22 = CFSTR("Unknown Version");
        }

        objc_msgSend(v0, "setObject:forKeyedSubscript:", v22, v17);
        ++v4;
      }
      while (v2 != v4);
      v23 = objc_msgSend(&unk_1E66CED90, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      v2 = v23;
    }
    while (v23);
  }
  v24 = (void *)ARFrameworkVersions_frameworksVersionsDict;
  ARFrameworkVersions_frameworksVersionsDict = (uint64_t)v0;

}

@end
