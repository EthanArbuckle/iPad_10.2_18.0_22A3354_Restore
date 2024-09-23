@implementation CRLogStructuredData

uint64_t __CRLogStructuredData_block_invoke()
{
  uint64_t result;

  result = checkMCFeature("MCFeatureDiagnosticsSubmissionAllowed", &DiagnosticLogSubmissionEnabled_featureDiagnosticsSubmissionAllowed);
  CRLogStructuredData_opt_in = result;
  return result;
}

void __CRLogStructuredData_block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  const __CFString *NameForLogType;
  void *v5;
  uint64_t v6;
  _QWORD v7[7];

  v2 = (void *)MEMORY[0x1AF42243C]();
  v3 = *(unsigned int *)(a1 + 48);
  NameForLogType = GetNameForLogType(*(_DWORD *)(a1 + 48));
  if (NameForLogType)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@.log"), CFSTR("/var/mobile/Library/Logs/"), NameForLogType);
    CRDumpOldStructuredLog(*(unsigned int *)(a1 + 48), v5, *(double *)(a1 + 40));
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __CRLogStructuredData_block_invoke_3;
    v7[3] = &unk_1E57ED110;
    v6 = *(_QWORD *)(a1 + 32);
    v7[4] = v5;
    v7[5] = v6;
    v7[6] = *(_QWORD *)(a1 + 40);
    __CRLogStructuredData_block_invoke_3((uint64_t)v7);
  }
  else
  {
    NSLog(CFSTR("Unrecognized log type %d"), v3);
  }
  objc_autoreleasePoolPop(v2);
}

void __CRLogStructuredData_block_invoke_3(uint64_t a1)
{
  FILE *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  FILE *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = fopen((const char *)objc_msgSend(*(id *)(a1 + 32), "UTF8String"), "a+");
  if (v2)
  {
    v13 = v2;
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v4 = *(void **)(a1 + 40);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          v10 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v9);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v9, v10));
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v6);
    }
    v11 = (void *)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v12 = (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@[%d]: %@\n"), OSADateFormat(), objc_msgSend(v11, "processName"), objc_msgSend(v11, "processIdentifier"), objc_msgSend(v3, "componentsJoinedByString:", CFSTR(";"))),
                          "UTF8String");
    fputs(v12, v13);
    fclose(v13);

  }
  else
  {
    NSLog(CFSTR("CrashReporterSupport:Unable to get handle to the log file"));
  }
}

@end
