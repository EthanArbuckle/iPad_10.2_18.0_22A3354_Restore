@implementation SGNicknames

+ (id)nicknamesForName:(id)a3
{
  id v5;
  id v6;
  _BYTE *v7;
  const char *v8;
  char v9;
  unsigned __int8 *v10;
  unsigned int v11;
  int v12;
  unsigned int v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  unsigned int v19;
  void *v20;
  _WORD *v22;
  unsigned __int16 v23;
  int v24;
  unsigned __int16 *v25;
  unsigned int v26;
  void *v27;
  void *v28;
  _QWORD block[5];

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGNicknames.m"), 78, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__SGNicknames_nicknamesForName___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (nicknamesForName__onceToken != -1)
    dispatch_once(&nicknamesForName__onceToken, block);
  if (!nicknamesForName__dataFile)
    goto LABEL_16;
  +[SGWords normalizeWord:](SGWords, "normalizeWord:", v5);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = (_BYTE *)objc_msgSend(v6, "UTF8String");
  v8 = v7;
  v9 = *v7;
  if (*v7)
  {
    v10 = v7 + 1;
    v11 = 5381;
    do
    {
      v11 = 33 * v11 + v9;
      v12 = *v10++;
      v9 = v12;
    }
    while (v12);
  }
  else
  {
    v11 = 5381;
  }
  v13 = v11 % nicknamesForName__nicks_0;
  v14 = nicknamesForName__nicks_1;
  v15 = *(unsigned __int16 *)(nicknamesForName__nicks_1 + 2 * (v11 % nicknamesForName__nicks_0));
  if (!*(_WORD *)(nicknamesForName__nicks_1 + 2 * v13))
  {
LABEL_15:

LABEL_16:
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  v16 = nicknamesForName__nicks_3;
  v17 = nicknamesForName__nicks_2;
  v18 = nicknamesForName__nicks_0 != 1;
  while (1)
  {
    v19 = v15 >> 1;
    if (!strcmp(v8, (const char *)(v16 + *(unsigned __int16 *)(v17 + 2 * ((v15 >> 1) + 1)))))
      break;
    v13 += v18;
    v15 = *(unsigned __int16 *)(v14 + 2 * v13);
    if (!*(_WORD *)(v14 + 2 * v13))
      goto LABEL_15;
  }
  v22 = (_WORD *)(v17 + 2 * v19);

  v20 = (void *)objc_opt_new();
  v23 = *v22 - 1;
  if (*v22 != 1)
  {
    v24 = 0;
    v25 = v22 + 2;
    do
    {
      v26 = *v25++;
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", nicknamesForName__nicks_3 + v26, strlen((const char *)(nicknamesForName__nicks_3 + v26)), 4, 0);
      objc_msgSend(v20, "addObject:", v27);

      ++v24;
    }
    while ((unsigned __int16)v24 < v23);
  }
LABEL_17:

  return v20;
}

void __32__SGNicknames_nicknamesForName___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  unsigned int *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathForResource:ofType:", CFSTR("nicknames"), CFSTR("dat"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    v9 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v1, 1, &v9);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = v9;
    v4 = (void *)nicknamesForName__dataFile;
    nicknamesForName__dataFile = v2;

  }
  else
  {
    v3 = 0;
  }
  if (nicknamesForName__dataFile)
  {
    v5 = (unsigned int *)objc_msgSend(objc_retainAutorelease((id)nicknamesForName__dataFile), "bytes");
    v6 = *v5;
    v7 = v5[1];
    nicknamesForName__nicks_0 = (v6 - 8) >> 1;
    nicknamesForName__nicks_1 = (uint64_t)(v5 + 2);
    nicknamesForName__nicks_2 = (uint64_t)v5 + v6;
    nicknamesForName__nicks_3 = (uint64_t)v5 + v7;
  }
  else
  {
    sgLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v11 = v1;
      v12 = 2112;
      v13 = v3;
      _os_log_error_impl(&dword_1C3607000, v8, OS_LOG_TYPE_ERROR, "Could not load nicknames from %@: %@", buf, 0x16u);
    }

  }
}

@end
