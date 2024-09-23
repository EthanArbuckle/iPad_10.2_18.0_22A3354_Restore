@implementation MBError

+ (BOOL)isUnexpectedErrorCode:(int64_t)a3
{
  BOOL v3;

  if (a3)
    v3 = a3 == 207;
  else
    v3 = 1;
  return !v3;
}

+ (BOOL)isTransientError:(id)a3
{
  int v4;

  v4 = objc_msgSend((id)objc_msgSend(a3, "domain"), "isEqualToString:", CFSTR("MBErrorDomain"));
  if (v4)
    LOBYTE(v4) = MBIsTransientErrorCode(objc_msgSend(a3, "code"));
  return v4;
}

+ (BOOL)isCancelledError:(id)a3
{
  uint64_t v4;

  if (a3)
  {
    LODWORD(v4) = objc_msgSend((id)objc_msgSend(a3, "domain"), "isEqualToString:", CFSTR("MBErrorDomain"));
    if ((_DWORD)v4)
    {
      v4 = objc_msgSend(a3, "code");
      if ((unint64_t)(v4 - 202) <= 0x16)
        LOBYTE(v4) = (0x7F8001u >> (v4 + 54)) & 1;
      else
        LOBYTE(v4) = 0;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

+ (BOOL)isCancelledXPCActivityDeferredError:(id)a3
{
  id v3;
  void *v5;

  v3 = a3;
  if (objc_msgSend(a1, "isError:withCode:", a3, 202))
  {
    v5 = (void *)objc_msgSend(v3, "userInfo");
    v3 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  }
  return objc_msgSend(a1, "isError:withCode:", v3, 223);
}

+ (int)codeForErrno:(int)a3
{
  uint64_t v3;
  int result;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t buf[4];
  int v13;
  uint64_t v14;

  v3 = *(_QWORD *)&a3;
  v14 = *MEMORY[0x1E0C80C00];
  if (a3 <= 16)
  {
    switch(a3)
    {
      case 1:
        return 24;
      case 2:
        return 4;
      case 9:
        return 1;
      default:
LABEL_11:
        v5 = MBGetDefaultLog();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          v13 = v3;
          _os_log_impl(&dword_1D5213000, v5, OS_LOG_TYPE_DEFAULT, "No code for POSIX error: %{errno}d", buf, 8u);
          _MBLog(CFSTR("DEFAULT"), (uint64_t)"No code for POSIX error: %{errno}d", v6, v7, v8, v9, v10, v11, v3);
        }
        return 100;
    }
  }
  else
  {
    switch(a3)
    {
      case 17:
        return 3;
      case 18:
        return 26;
      case 19:
      case 22:
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
        goto LABEL_11;
      case 20:
        return 5;
      case 21:
        return 6;
      case 28:
        return 105;
      default:
        if (a3 == 62)
        {
          result = 7;
        }
        else
        {
          if (a3 != 93)
            goto LABEL_11;
          result = 8;
        }
        break;
    }
  }
  return result;
}

+ (int)errnoForError:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  int result;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend((id)objc_msgSend(a3, "domain"), "isEqualToString:", CFSTR("MBErrorDomain")))
  {
LABEL_8:
    v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = a3;
      _os_log_impl(&dword_1D5213000, v7, OS_LOG_TYPE_DEFAULT, "No POSIX code for error: %@", buf, 0xCu);
      _MBLog(CFSTR("DEFAULT"), (uint64_t)"No POSIX code for error: %@", v8, v9, v10, v11, v12, v13, (uint64_t)a3);
    }
    return 5;
  }
  v4 = objc_msgSend(a3, "code");
  if (v4 > 25)
  {
    switch(v4)
    {
      case 26:
        return 18;
      case 105:
        return 28;
      case 100:
        return 5;
    }
    goto LABEL_8;
  }
  v5 = v4 - 3;
  result = 2;
  switch(v5)
  {
    case 0:
      result = 17;
      break;
    case 1:
      return result;
    case 2:
      result = 20;
      break;
    case 3:
      result = 21;
      break;
    case 4:
      result = 62;
      break;
    case 5:
      result = 93;
      break;
    case 6:
      return 5;
    default:
      goto LABEL_8;
  }
  return result;
}

+ (int)codeForNSError:(id)a3
{
  void *v4;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = (void *)objc_msgSend(a3, "domain");
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
  {
    if ((objc_msgSend(a3, "code") | 0x100) == 0x104)
      return 4;
    v8 = (void *)objc_msgSend(a3, "userInfo");
    v9 = objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    if (v9)
      return +[MBError codeForNSError:](MBError, "codeForNSError:", v9);
    return 100;
  }
  v6 = (void *)objc_msgSend(a3, "domain");
  if (!objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB32E8]))
  {
    v7 = (void *)objc_msgSend(a3, "domain");
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
      return +[MBError codeForErrno:](MBError, "codeForErrno:", objc_msgSend(a3, "code"));
    if (objc_msgSend((id)objc_msgSend(a3, "domain"), "isEqualToString:", CFSTR("MBErrorDomain")))
      return objc_msgSend(a3, "code");
    return 100;
  }
  if (objc_msgSend(a3, "code") == -999)
    return 202;
  else
    return 300;
}

+ (BOOL)isError:(id)a3 withCode:(int64_t)a4
{
  if (objc_msgSend(a3, "code") == a4)
    return objc_msgSend((id)objc_msgSend(a3, "domain"), "isEqualToString:", CFSTR("MBErrorDomain"));
  else
    return 0;
}

+ (BOOL)isError:(id)a3 withCodes:(int64_t)a4
{
  int v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v10;
  uint64_t v11;

  v6 = objc_msgSend((id)objc_msgSend(a3, "domain"), "isEqualToString:", CFSTR("MBErrorDomain"));
  if (v6)
  {
    if (objc_msgSend(a3, "code") == a4)
    {
LABEL_6:
      LOBYTE(v6) = 1;
    }
    else
    {
      v10 = &v11;
      while (1)
      {
        v7 = v10++;
        if (!*v7)
          break;
        v8 = *v7;
        if (objc_msgSend(a3, "code") == v8)
          goto LABEL_6;
      }
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

+ (BOOL)isNSError:(id)a3 withCode:(int64_t)a4
{
  return +[MBError codeForNSError:](MBError, "codeForNSError:", a3) == a4;
}

+ (BOOL)isRetryAfterError:(id)a3 retryAfterDate:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = a3;
  if (!+[MBError isError:withCodes:](MBError, "isError:withCodes:", a3, 304, 17, 0))
    return 0;
  v6 = *MEMORY[0x1E0CB3388];
  while (1)
  {
    v7 = objc_msgSend((id)objc_msgSend(v5, "userInfo"), "objectForKeyedSubscript:", CFSTR("RetryAfter"));
    if (v7)
      break;
    v5 = (id)objc_msgSend((id)objc_msgSend(v5, "userInfo"), "objectForKeyedSubscript:", v6);
    if (!v5)
      return 0;
  }
  v9 = (void *)v7;
  v10 = (void *)objc_msgSend((id)MBHTTPDateFormatter(), "dateFromString:", v7);
  if (v10)
  {
    if (!a4)
      return v10 != 0;
  }
  else
  {
    v11 = objc_msgSend(v9, "integerValue");
    if (v11 < 1)
      return 0;
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", (double)v11);
    if (!a4)
      return v10 != 0;
  }
  if (!v10)
    return v10 != 0;
  *a4 = v10;
  return 1;
}

+ (id)errorWithCode:(int64_t)a3 description:(id)a4
{
  return +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", a3, CFSTR("%@"), a4);
}

+ (id)errorWithCode:(int64_t)a3 path:(id)a4 description:(id)a5
{
  return +[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", a3, a4, CFSTR("%@"), a5);
}

+ (id)errorWithCode:(int64_t)a3 format:(id)a4
{
  id v5;
  uint64_t v7;
  _QWORD v8[2];
  uint64_t v9;

  v8[1] = *MEMORY[0x1E0C80C00];
  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", a4, &v9);
  v7 = *MEMORY[0x1E0CB2D50];
  v8[0] = v5;
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MBErrorDomain"), a3, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1));
}

+ (id)errorWithCode:(int64_t)a3 error:(id)a4 format:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t v10;

  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", a5, &v10);
  v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v7, *MEMORY[0x1E0CB2D50], a4, *MEMORY[0x1E0CB3388], 0);
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MBErrorDomain"), a3, v8);
}

+ (id)errorWithCode:(int64_t)a3 path:(id)a4 format:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t v10;

  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", a5, &v10);
  v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v7, *MEMORY[0x1E0CB2D50], a4, *MEMORY[0x1E0CB2AA0], 0);
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MBErrorDomain"), a3, v8);
}

+ (id)_errorWithCode:(int64_t)a3 URL:(id)a4 format:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t v10;

  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", a5, &v10);
  v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v7, *MEMORY[0x1E0CB2D50], a4, *MEMORY[0x1E0CB3308], 0);
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MBErrorDomain"), a3, v8);
}

+ (id)errorWithCode:(int64_t)a3 error:(id)a4 path:(id)a5 format:(id)a6
{
  id v9;
  uint64_t v10;
  uint64_t v12;

  v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", a6, &v12);
  v10 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v9, *MEMORY[0x1E0CB2D50], a4, *MEMORY[0x1E0CB3388], a5, *MEMORY[0x1E0CB2AA0], 0);
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MBErrorDomain"), a3, v10);
}

+ (id)errorWithCode:(int64_t)a3 error:(id)a4 URL:(id)a5 format:(id)a6
{
  id v9;
  uint64_t v10;
  uint64_t v12;

  v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", a6, &v12);
  v10 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v9, *MEMORY[0x1E0CB2D50], a4, *MEMORY[0x1E0CB3388], a5, *MEMORY[0x1E0CB3308], 0);
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MBErrorDomain"), a3, v10);
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 format:(id)a5
{
  id v7;
  uint64_t v9;
  _QWORD v10[2];
  uint64_t v11;

  v10[1] = *MEMORY[0x1E0C80C00];
  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", a5, &v11);
  v9 = *MEMORY[0x1E0CB2D50];
  v10[0] = v7;
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", a3, a4, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1));
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 path:(id)a5 format:(id)a6
{
  id v9;
  uint64_t v10;
  uint64_t v12;

  v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", a6, &v12);
  v10 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v9, *MEMORY[0x1E0CB2D50], a5, *MEMORY[0x1E0CB2AA0], 0);
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", a3, a4, v10);
}

+ (id)errorWithErrors:(id)a3
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  const __CFString *v19;
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "count") == 1)
    return (id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  if (!objc_msgSend(a3, "count"))
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MBError.m"), 368, CFSTR("Expected at least one underlying error"));
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(a3);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (+[MBError isError:withCode:](MBError, "isError:withCode:", v12, 2)
          && (v13 = objc_msgSend((id)objc_msgSend(v12, "userInfo"), "objectForKeyedSubscript:", CFSTR("kMBUnderlyingErrorsKey"))) != 0)
        {
          objc_msgSend(v7, "addObjectsFromArray:", v13);
        }
        else
        {
          objc_msgSend(v7, "addObject:", v12);
        }
      }
      v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v9);
  }
  v19 = CFSTR("kMBUnderlyingErrorsKey");
  v20 = (id)objc_msgSend(v7, "copy");
  v14 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MBErrorDomain"), 2, v14);
}

+ (id)_errorWithErrno:(int)a3 code:(int64_t)a4 path:(id)a5 format:(id)a6 arguments:(char *)a7
{
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v9 = *(_QWORD *)&a3;
  v22[2] = *MEMORY[0x1E0C80C00];
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", a6, a7);
  v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s (%d)"), v10, strerror(v9), v9);
  if (a5)
  {
    v12 = *MEMORY[0x1E0CB2AA0];
    v21[0] = *MEMORY[0x1E0CB2D50];
    v21[1] = v12;
    v22[0] = v11;
    v22[1] = a5;
    v13 = (void *)MEMORY[0x1E0C99D80];
    v14 = v22;
    v15 = v21;
    v16 = 2;
  }
  else
  {
    v19 = *MEMORY[0x1E0CB2D50];
    v20 = v11;
    v13 = (void *)MEMORY[0x1E0C99D80];
    v14 = &v20;
    v15 = &v19;
    v16 = 1;
  }
  v17 = objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v14, v15, v16);
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MBErrorDomain"), a4, v17);
}

+ (id)errorWithErrno:(int)a3 format:(id)a4
{
  uint64_t v5;

  return (id)objc_msgSend(a1, "_errorWithErrno:code:path:format:arguments:", *(_QWORD *)&a3, +[MBError codeForErrno:](MBError, "codeForErrno:"), 0, a4, &v5);
}

+ (id)errorWithErrno:(int)a3 path:(id)a4 format:(id)a5
{
  uint64_t v6;

  return (id)objc_msgSend(a1, "_errorWithErrno:code:path:format:arguments:", *(_QWORD *)&a3, +[MBError codeForErrno:](MBError, "codeForErrno:"), a4, a5, &v6);
}

+ (id)errorWithErrno:(int)a3 code:(int64_t)a4 path:(id)a5 format:(id)a6
{
  uint64_t v7;

  return (id)objc_msgSend(a1, "_errorWithErrno:code:path:format:arguments:", *(_QWORD *)&a3, a4, a5, a6, &v7);
}

+ (id)posixErrorWithFormat:(id)a3
{
  uint64_t v5;
  uint64_t v7;

  v5 = *__error();
  return (id)objc_msgSend(a1, "_errorWithErrno:code:path:format:arguments:", v5, +[MBError codeForErrno:](MBError, "codeForErrno:", v5), 0, a3, &v7);
}

+ (id)posixErrorWithPath:(id)a3 format:(id)a4
{
  uint64_t v7;
  uint64_t v9;

  v7 = *__error();
  return (id)objc_msgSend(a1, "_errorWithErrno:code:path:format:arguments:", v7, +[MBError codeForErrno:](MBError, "codeForErrno:", v7), a3, a4, &v9);
}

+ (id)posixErrorWithCode:(int64_t)a3 format:(id)a4
{
  uint64_t v5;

  return (id)objc_msgSend(a1, "_errorWithErrno:code:path:format:arguments:", *__error(), a3, 0, a4, &v5);
}

+ (id)posixErrorWithCode:(int64_t)a3 path:(id)a4 format:(id)a5
{
  uint64_t v6;

  return (id)objc_msgSend(a1, "_errorWithErrno:code:path:format:arguments:", *__error(), a3, a4, a5, &v6);
}

+ (id)errorForNSError:(id)a3 path:(id)a4 format:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t v10;

  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", a5, &v10);
  v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v7, *MEMORY[0x1E0CB2D50], a3, *MEMORY[0x1E0CB3388], a4, *MEMORY[0x1E0CB2AA0], 0);
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MBErrorDomain"), +[MBError codeForNSError:](MBError, "codeForNSError:", a3), v8);
}

+ (id)errorForNSError:(id)a3 path:(id)a4 description:(id)a5
{
  uint64_t v6;

  v6 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", a5, *MEMORY[0x1E0CB2D50], a3, *MEMORY[0x1E0CB3388], a4, *MEMORY[0x1E0CB2AA0], 0);
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MBErrorDomain"), +[MBError codeForNSError:](MBError, "codeForNSError:", a3), v6);
}

+ (id)errorForHTTPURLResponse:(id)a3 error:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (a3)
  {
    if (objc_msgSend(a3, "statusCode") >= 200 && objc_msgSend(a3, "statusCode") < 300)
      return 0;
    if (objc_msgSend(a3, "statusCode") >= 300 && objc_msgSend(a3, "statusCode") <= 399)
    {
      v6 = objc_msgSend(a3, "statusCode");
      v7 = objc_msgSend(a3, "URL");
      if (v6 == 330)
      {
        v8 = CFSTR("Account Moved");
        v9 = 307;
        v10 = v7;
        return +[MBError _errorWithCode:URL:format:](MBError, "_errorWithCode:URL:format:", v9, v10, v8);
      }
      goto LABEL_25;
    }
    if (objc_msgSend(a3, "statusCode") < 400 || objc_msgSend(a3, "statusCode") > 499)
    {
      if (objc_msgSend(a3, "statusCode") >= 500 && objc_msgSend(a3, "statusCode") <= 599)
      {
        v13 = objc_msgSend(a3, "statusCode");
        if (v13 == 507)
        {
          v10 = objc_msgSend(a3, "URL");
          v8 = CFSTR("Insufficient Storage");
          v9 = 303;
          return +[MBError _errorWithCode:URL:format:](MBError, "_errorWithCode:URL:format:", v9, v10, v8);
        }
        if (v13 == 503)
        {
          v14 = objc_msgSend((id)objc_msgSend(a3, "allHeaderFields"), "objectForKey:", CFSTR("Retry-After"));
          v15 = (void *)MEMORY[0x1E0C99D80];
          v16 = *MEMORY[0x1E0CB2D50];
          v17 = objc_msgSend(a3, "URL");
          v18 = objc_msgSend(v15, "dictionaryWithObjectsAndKeys:", CFSTR("Service Unavailable"), v16, v17, *MEMORY[0x1E0CB3308], v14, CFSTR("RetryAfter"), 0);
          return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MBErrorDomain"), 304, v18);
        }
        v7 = objc_msgSend(a3, "URL");
        v22 = objc_msgSend(a3, "statusCode");
        v23 = objc_msgSend(MEMORY[0x1E0CB3680], "localizedStringForStatusCode:", objc_msgSend(a3, "statusCode"));
        v19 = CFSTR("Server error: %ld %@");
        return +[MBError _errorWithCode:URL:format:](MBError, "_errorWithCode:URL:format:", 302, v7, v19, v22, v23);
      }
      v7 = objc_msgSend(a3, "URL");
LABEL_25:
      v22 = objc_msgSend(a3, "statusCode");
      v19 = CFSTR("Unexpected HTTP status code: %ld");
      return +[MBError _errorWithCode:URL:format:](MBError, "_errorWithCode:URL:format:", 302, v7, v19, v22, v23);
    }
    v12 = objc_msgSend(a3, "statusCode");
    if (v12 <= 408)
    {
      if (v12 == 401)
      {
        v10 = objc_msgSend(a3, "URL");
        v8 = CFSTR("Unauthorized");
        v9 = 305;
        return +[MBError _errorWithCode:URL:format:](MBError, "_errorWithCode:URL:format:", v9, v10, v8);
      }
      if (v12 == 404)
      {
        v10 = objc_msgSend(a3, "URL");
        v8 = CFSTR("Not Found");
        v9 = 4;
        return +[MBError _errorWithCode:URL:format:](MBError, "_errorWithCode:URL:format:", v9, v10, v8);
      }
    }
    else
    {
      switch(v12)
      {
        case 409:
          v10 = objc_msgSend(a3, "URL");
          v8 = CFSTR("Conflict");
          v9 = 3;
          return +[MBError _errorWithCode:URL:format:](MBError, "_errorWithCode:URL:format:", v9, v10, v8);
        case 423:
          v10 = objc_msgSend(a3, "URL");
          v8 = CFSTR("Locked");
          v9 = 13;
          return +[MBError _errorWithCode:URL:format:](MBError, "_errorWithCode:URL:format:", v9, v10, v8);
        case 424:
          v10 = objc_msgSend(a3, "URL");
          v8 = CFSTR("Failed Dependency");
          v9 = 306;
          return +[MBError _errorWithCode:URL:format:](MBError, "_errorWithCode:URL:format:", v9, v10, v8);
      }
    }
    v20 = objc_msgSend(a3, "URL");
    v21 = objc_msgSend(a3, "statusCode");
    return +[MBError _errorWithCode:URL:format:](MBError, "_errorWithCode:URL:format:", 301, v20, CFSTR("Client error: %ld %@"), v21, objc_msgSend(MEMORY[0x1E0CB3680], "localizedStringForStatusCode:", objc_msgSend(a3, "statusCode")));
  }
  else
  {
    if (!a4)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MBError.m"), 521, CFSTR("No response or error"));
    return +[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", +[MBError codeForNSError:](MBError, "codeForNSError:", a4), a4, CFSTR("HTTP connection error"));
  }
}

+ (id)_formatErrors:(id)a3 descriptionSelector:(SEL)a4
{
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;

  if (!a3)
    return 0;
  v7 = objc_msgSend(a3, "count");
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (v7 >= 3)
    v9 = 3;
  else
    v9 = v7;
  if (v9)
  {
    for (i = 0; i != v9; ++i)
      objc_msgSend(v8, "addObject:", objc_msgSend(a1, "performSelector:withObject:", a4, objc_msgSend(a3, "objectAtIndexedSubscript:", i)));
  }
  if (v7 > 3)
    objc_msgSend(v8, "addObject:", CFSTR("..."));
  return MBStringWithArray(v8);
}

+ (id)loggableDescriptionForError:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (!a3)
    return CFSTR("(null)");
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  objc_msgSend(v5, "appendFormat:", CFSTR("%@(%ld)"), objc_msgSend(a3, "domain"), objc_msgSend(a3, "code"));
  v6 = (void *)objc_msgSend(a3, "userInfo");
  v7 = objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  if (v7)
    objc_msgSend(v5, "appendFormat:", CFSTR(" Underlying error: %@"), +[MBError loggableDescriptionForError:](MBError, "loggableDescriptionForError:", v7));
  v8 = objc_msgSend(a1, "_formatErrors:descriptionSelector:", objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", CFSTR("kMMCSErrorUnderlyingErrorArrayKey")), sel_loggableDescriptionForError_);
  if (v8)
    objc_msgSend(v5, "appendFormat:", CFSTR(" Underlying MMCS errors: %@"), v8);
  v9 = objc_msgSend(a1, "_formatErrors:descriptionSelector:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", CFSTR("CKPartialErrors")), "allValues"), sel_loggableDescriptionForError_);
  if (v9)
    objc_msgSend(v5, "appendFormat:", CFSTR(" Underlying CloudKit errors: %@"), v9);
  v10 = objc_msgSend(a1, "_formatErrors:descriptionSelector:", objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", CFSTR("kMBUnderlyingErrorsKey")), sel_loggableDescriptionForError_);
  if (v10)
    objc_msgSend(v5, "appendFormat:", CFSTR(" Underlying Backup errors: %@"), v10);
  return v5;
}

+ (id)descriptionForError:(id)a3
{
  return +[MBError descriptionForError:paths:](MBError, "descriptionForError:paths:", a3, 1);
}

+ (id)descriptionForError:(id)a3 paths:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t i;

  if (!a3)
    return CFSTR("(null)");
  v4 = a4;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v7 = objc_msgSend(a3, "localizedDescription");
  if (v7)
    v8 = (const __CFString *)v7;
  else
    v8 = CFSTR("Unknown error");
  objc_msgSend(v6, "appendString:", v8);
  if (v4)
  {
    v9 = (void *)objc_msgSend(a3, "userInfo");
    v10 = objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2AA0]);
    if (v10)
      objc_msgSend(v6, "appendFormat:", CFSTR(" at path \"%@\"), v10);
    v11 = (void *)objc_msgSend(a3, "userInfo");
    v12 = objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3308]);
    if (v12)
      objc_msgSend(v6, "appendFormat:", CFSTR(" for URL \"%@\"), v12);
  }
  objc_msgSend(v6, "appendFormat:", CFSTR(" (%@/%d)"), objc_msgSend(a3, "domain"), objc_msgSend(a3, "code"));
  v13 = (void *)objc_msgSend(a3, "userInfo");
  v14 = objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  if (v14)
    objc_msgSend(v6, "appendFormat:", CFSTR(". Underlying error: %@."), +[MBError descriptionForError:](MBError, "descriptionForError:", v14));
  v15 = (void *)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", CFSTR("kMMCSErrorUnderlyingErrorArrayKey"));
  if (v15)
  {
    v16 = v15;
    v17 = objc_msgSend(v15, "count");
    v18 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    if (v17 >= 3)
      v19 = 3;
    else
      v19 = v17;
    if (v19)
    {
      for (i = 0; i != v19; ++i)
        objc_msgSend(v18, "addObject:", +[MBError descriptionForError:](MBError, "descriptionForError:", objc_msgSend(v16, "objectAtIndexedSubscript:", i)));
    }
    if (v17 > 3)
      objc_msgSend(v18, "addObject:", CFSTR("..."));
    objc_msgSend(v6, "appendFormat:", CFSTR(". Underlying MMCS errors: %@."), MBStringWithArray(v18));
  }
  return v6;
}

+ (id)dictionaryRepresentationForError:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v4, "setValue:forKey:", objc_msgSend(a3, "domain"), CFSTR("domain"));
  objc_msgSend(v4, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a3, "code")), CFSTR("code"));
  v5 = objc_msgSend(a3, "localizedDescription");
  if (v5)
    objc_msgSend(v4, "setValue:forKey:", v5, CFSTR("localizedDescription"));
  v6 = (void *)objc_msgSend(a3, "userInfo");
  v7 = objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2AA0]);
  if (v7)
    objc_msgSend(v4, "setValue:forKey:", v7, CFSTR("filePath"));
  v8 = (void *)objc_msgSend(a3, "userInfo");
  v9 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3308]);
  if (v9)
    objc_msgSend(v4, "setValue:forKey:", objc_msgSend(v9, "absoluteString"), CFSTR("URL"));
  v10 = (void *)objc_msgSend(a3, "userInfo");
  v11 = objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  if (v11)
    objc_msgSend(v4, "setValue:forKey:", +[MBError dictionaryRepresentationForError:](MBError, "dictionaryRepresentationForError:", v11), CFSTR("underlyingError"));
  v12 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", CFSTR("kMBErrorDateKey"));
  if (v12)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("date"));
  return v4;
}

+ (id)errorWithDictionaryRepresentation:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  MBError *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  if (!a3)
    return 0;
  v4 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("domain"));
  if (!v4)
    return 0;
  v5 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("code"));
  if (!v6)
    return 0;
  v7 = (void *)v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return 0;
  }
  v8 = objc_msgSend(v7, "integerValue");
  v9 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("localizedDescription"));
  if (v9)
  {
    v10 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  v13 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("filePath"));
  if (v13)
  {
    v14 = v13;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
  }
  else
  {
    v15 = 0;
  }
  v16 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("URL"));
  if (v16)
  {
    v17 = v16;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;
  }
  else
  {
    v18 = 0;
  }
  v19 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v19, "setValue:forKey:", v11, *MEMORY[0x1E0CB2D50]);
  objc_msgSend(v19, "setValue:forKey:", v15, *MEMORY[0x1E0CB2AA0]);
  if (v18)
  {
    v20 = objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v18);
    objc_msgSend(v19, "setValue:forKey:", v20, *MEMORY[0x1E0CB3308]);
  }
  v21 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("underlyingError"));
  if (v21)
  {
    v22 = v21;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = v22;
    else
      v23 = 0;
  }
  else
  {
    v23 = 0;
  }
  v24 = +[MBError errorWithDictionaryRepresentation:](MBError, "errorWithDictionaryRepresentation:", v23);
  objc_msgSend(v19, "setValue:forKey:", v24, *MEMORY[0x1E0CB3388]);
  v25 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("date"));
  if (v25)
  {
    v26 = v25;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v27 = v26;
    else
      v27 = 0;
  }
  else
  {
    v27 = 0;
  }
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v27, CFSTR("kMBErrorDateKey"));
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v5, v8, v19);
}

@end
