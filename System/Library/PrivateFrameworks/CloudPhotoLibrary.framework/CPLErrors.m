@implementation CPLErrors

+ (id)incorrectParametersErrorForParameter:(id)a3
{
  return +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 50, CFSTR("Incorrect parameter: %@"), a3);
}

+ (id)incorrectMachineStateErrorWithReason:(id)a3
{
  uint64_t v4;

  objc_msgSend(a1, "cplErrorWithCode:description:arguments:", 100, a3, &v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)underlyingErrorWithReason:(id)a3
{
  uint64_t v4;

  objc_msgSend(a1, "cplErrorWithCode:description:arguments:", 256, a3, &v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)versionMismatchError
{
  return +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 1, CFSTR("Version mismatch"));
}

+ (id)notImplementedError
{
  return +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 255, CFSTR("Method not implemented"));
}

+ (id)unknownError
{
  return +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 150, CFSTR("Unknown error"));
}

+ (id)invalidScopeErrorWithScopedIdentifier:(id)a3
{
  return +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 2001, CFSTR("Unknown scoped identifier in %@"), a3);
}

+ (id)invalidScopeErrorWithScopeIdentifier:(id)a3
{
  return +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 2001, CFSTR("Invalid scope identifier %@"), a3);
}

+ (id)invalidScopeErrorWithScopeIndex:(int64_t)a3
{
  return +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 2001, CFSTR("Unknown scope index %ld"), a3);
}

+ (id)unknownPrimaryScope
{
  return +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 2001, CFSTR("Can't find primary scope"));
}

+ (id)readOnlyError
{
  return +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 2001, CFSTR("Engine is in read-only mode"));
}

+ (id)transportErrorFromTransportError:(id)a3
{
  return +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 80, CFSTR("Transport returned an error: %@"), a3);
}

+ (id)libraryClosedError
{
  return +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 150, CFSTR("Library is closed"));
}

+ (id)invalidClientCacheErrorWithReason:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v8 = CFSTR("CPLErrorResetReason");
    v9 = a3;
    v3 = (void *)MEMORY[0x1E0C99D80];
    v4 = a3;
    objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[CPLErrors cplErrorWithCode:underlyingError:userInfo:description:](CPLErrors, "cplErrorWithCode:underlyingError:userInfo:description:", 20, 0, v5, CFSTR("Client cache is invalid: %@"), v4, v8, v9, v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 20, CFSTR("Client cache is invalid"));
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

+ (id)invalidCloudCacheErrorWithReason:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v8 = CFSTR("CPLErrorResetReason");
    v9 = a3;
    v3 = (void *)MEMORY[0x1E0C99D80];
    v4 = a3;
    objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[CPLErrors cplErrorWithCode:underlyingError:userInfo:description:](CPLErrors, "cplErrorWithCode:underlyingError:userInfo:description:", 21, 0, v5, CFSTR("Cloud cache is invalid: %@"), v4, v8, v9, v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 21, CFSTR("Cloud cache is invalid"));
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

+ (id)invalidDaemonErrorWithConnectionError:(id)a3
{
  return +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 110, CFSTR("Daemon had a problem and shut down: %@"), a3);
}

+ (id)posixErrorForURL:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "posixErrorForURL:errorCode:", v4, *__error());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)posixErrorForURL:(id)a3 errorCode:(int)a4
{
  id v7;
  void *v8;
  char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v25;
  void *v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[2];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!a4)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v28 = 0;
        _os_log_impl(&dword_1B03C2000, v25, OS_LOG_TYPE_ERROR, "Trying to create a POSIX error without any error!", (uint8_t *)&v28, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLErrors.m");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, v27, 125, CFSTR("Trying to create a POSIX error without any error!"));

    abort();
  }
  v8 = v7;
  v9 = strerror(a4);
  if (v9 && (v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v9)) != 0)
  {
    v11 = (void *)v10;
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0CB2FE0];
    if (v8)
    {
      v14 = *MEMORY[0x1E0CB3308];
      v33[0] = *MEMORY[0x1E0CB2D50];
      v33[1] = v14;
      v34[0] = v10;
      v34[1] = v8;
      v15 = (void *)MEMORY[0x1E0C99D80];
      v16 = v34;
      v17 = v33;
      v18 = 2;
    }
    else
    {
      v31 = *MEMORY[0x1E0CB2D50];
      v32 = v10;
      v15 = (void *)MEMORY[0x1E0C99D80];
      v16 = &v32;
      v17 = &v31;
      v18 = 1;
    }
    objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, v18);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, a4, v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2FE0];
    if (v8)
    {
      v29 = *MEMORY[0x1E0CB3308];
      v30 = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, a4, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], a4, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v22;
}

+ (id)operationCancelledError
{
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
}

+ (id)cplErrorWithCode:(int64_t)a3 description:(id)a4
{
  uint64_t v5;

  objc_msgSend(a1, "cplErrorWithCode:description:arguments:", a3, a4, &v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)cplErrorWithCode:(int64_t)a3 description:(id)a4 arguments:(char *)a5
{
  return (id)objc_msgSend(a1, "cplErrorWithCode:underlyingError:userInfo:description:arguments:", a3, 0, 0, a4, a5);
}

+ (id)cplErrorWithCode:(int64_t)a3 underlyingError:(id)a4 description:(id)a5
{
  uint64_t v6;

  objc_msgSend(a1, "cplErrorWithCode:underlyingError:userInfo:description:arguments:", a3, a4, 0, a5, &v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)cplErrorWithCode:(int64_t)a3 underlyingError:(id)a4 description:(id)a5 arguments:(char *)a6
{
  return (id)objc_msgSend(a1, "cplErrorWithCode:underlyingError:userInfo:description:arguments:", a3, a4, 0, a5, a6);
}

+ (id)cplErrorWithCode:(int64_t)a3 underlyingError:(id)a4 userInfo:(id)a5 description:(id)a6
{
  uint64_t v7;

  objc_msgSend(a1, "cplErrorWithCode:underlyingError:userInfo:description:arguments:", a3, a4, a5, a6, &v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)cplErrorWithCode:(int64_t)a3 underlyingError:(id)a4 userInfo:(id)a5 description:(id)a6 arguments:(char *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v13)
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v13, a7);
  else
    v14 = 0;
  v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v16 = v15;
  if (v12)
    objc_msgSend(v15, "addEntriesFromDictionary:", v12);
  if (v14)
    objc_msgSend(v16, "setObject:forKey:", v14, *MEMORY[0x1E0CB2D50]);
  if (v11)
    objc_msgSend(v16, "setObject:forKey:", v11, *MEMORY[0x1E0CB3388]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CloudPhotoLibraryErrorDomain"), a3, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)missingError
{
  return (id)objc_msgSend(a1, "cplErrorWithCode:description:", 2000, CFSTR("There should be real error here. Please file a radar"));
}

+ (id)sessionHasBeenDeferredError
{
  return +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 257, CFSTR("Sync session has been deferred"));
}

+ (id)preventWipeErrorWithReason:(id)a3 preventedByUser:(BOOL)a4
{
  _BOOL4 v4;
  const __CFString *v6;
  void *v7;
  id v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v13;
  _QWORD v14[2];

  v4 = a4;
  v14[1] = *MEMORY[0x1E0C80C00];
  if (a3)
    v6 = (const __CFString *)a3;
  else
    v6 = CFSTR("no reason");
  v13 = CFSTR("CPLErrorResetReason");
  v14[0] = v6;
  v7 = (void *)MEMORY[0x1E0C99D80];
  v8 = a3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("Automatically prevented");
  if (v4)
    v10 = CFSTR("User prevented");
  objc_msgSend(a1, "cplErrorWithCode:underlyingError:userInfo:description:", 1014, 0, v9, CFSTR("%@ wipe for reason '%@'"), v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)unsafeResources:(id)a3 withError:(id)a4 resourceStorage:(id)a5
{
  return (id)objc_msgSend(a1, "unsafeResources:withError:realPrune:resourceStorage:", a3, a4, 1, a5);
}

+ (id)unsafeResources:(id)a3 withError:(id)a4 realPrune:(BOOL)a5 resourceStorage:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v7 = a5;
  v25 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v9, "count"));
  if (v11)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v13 = v9;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v11, "notePruningRequestForResource:realPrune:successful:", v18, v7, 0, (_QWORD)v20);
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, v18);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v15);
    }

  }
  return v12;
}

+ (id)errorsForIdentifiers:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12++), (_QWORD)v14);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  return v7;
}

+ (id)cplErrorCausedBySharedSyncForError:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithDictionary:", v6);

  objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("CPLErrorIsCausedBySharedSync"));
  v8 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(v4, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "code");

  objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
