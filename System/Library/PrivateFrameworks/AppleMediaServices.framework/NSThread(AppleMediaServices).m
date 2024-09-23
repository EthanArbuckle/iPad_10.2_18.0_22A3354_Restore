@implementation NSThread(AppleMediaServices)

+ (id)ams_symbolicatedCallStackSymbols
{
  void *v0;
  void *v1;
  int v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  uint64_t Range;
  const char *Name;
  uint64_t Filename;
  const char *v9;
  int LineNumber;
  uint64_t v11;
  const char *v12;
  char *v13;
  char *v14;
  void *v15;
  void *v17;
  id obj;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackReturnAddresses");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  CSSymbolicatorCreateWithTaskFlagsAndNotification();
  v1 = 0;
  if ((CSIsNull() & 1) == 0)
  {
    mach_absolute_time();
    CSSymbolicatorGetArchitecture();
    v2 = CSArchitectureIs64Bit();
    v21 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v17 = v0;
    obj = v0;
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v22)
    {
      v23 = 0;
      if (v2)
        v3 = 16;
      else
        v3 = 8;
      v19 = *(_QWORD *)v27;
      v20 = v3;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(obj);
          v5 = objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "unsignedIntegerValue");
          CSSymbolicatorGetSymbolOwnerWithAddressAtTime();
          CSSymbolicatorGetSymbolWithAddressAtTime();
          v25 = 0;
          Range = CSSymbolGetRange();
          Name = (const char *)CSSymbolGetName();
          if (Name)
            asprintf(&v25, " %s + %llu", Name, v5 - Range);
          CSSymbolOwnerGetSourceInfoWithAddress();
          Filename = CSSourceInfoGetFilename();
          v24 = 0;
          if (Filename)
          {
            v9 = (const char *)Filename;
            LineNumber = CSSourceInfoGetLineNumber();
            asprintf(&v24, " (%s:%u)", v9, LineNumber);
          }
          v11 = CSSymbolOwnerGetName();
          if (v11)
            v12 = (const char *)v11;
          else
            v12 = "";
          v14 = v24;
          v13 = v25;
          if (!v25)
            v13 = "";
          if (!v24)
            v14 = "";
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%-3d %-30s\t0x%0*llx%s%s\n"), v23 + i, v12, v20, v5, v13, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
            free(v25);
          if (v24)
            free(v24);
          objc_msgSend(v21, "appendString:", v15);

        }
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        v23 = (v23 + i);
      }
      while (v22);
    }

    v1 = (void *)objc_msgSend(v21, "copy");
    v0 = v17;
  }

  return v1;
}

@end
