@implementation CADDiagnosticsDiagnosticDatabaseCollector

- (void)determineExpectedOutputFiles:(id)a3
{
  id v4;
  const __CFString *v5;
  NSURL *v6;
  NSURL *outputURL;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!CalendarDiagnosticsLibraryCore_frameworkLibrary)
  {
    v8 = xmmword_1E6A37CC8;
    v9 = 0;
    CalendarDiagnosticsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (CalendarDiagnosticsLibraryCore_frameworkLibrary)
  {
    if (objc_msgSend(v4, "redactLogs"))
      v5 = CFSTR("Diagnostics-redacted.db.gz");
    else
      v5 = CFSTR("Diagnostics.db.gz");
    objc_msgSend(v4, "temporaryFileForName:", v5, v8, v9, v10);
    v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
    outputURL = self->_outputURL;
    self->_outputURL = v6;

    objc_msgSend(v4, "setStatus:forFile:", 0, self->_outputURL);
  }
  else
  {
    objc_msgSend(v4, "logError:", CFSTR("CalendarDiagnostics not loaded; no diagnostics database will be attached"));
  }

}

- (void)collect:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  if (-[CADDiagnosticsDiagnosticDatabaseCollector collectDiagnosticsDatabase:](self, "collectDiagnosticsDatabase:", v5))
    v4 = 2;
  else
    v4 = 3;
  objc_msgSend(v5, "setStatus:forFile:", v4, self->_outputURL);

}

- (BOOL)collectDiagnosticsDatabase:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id *v12;
  BOOL v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  Class (*v23)(uint64_t);
  void *v24;
  uint64_t *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!CalendarDiagnosticsLibraryCore_frameworkLibrary)
  {
    v22 = xmmword_1E6A37CC8;
    v23 = 0;
    CalendarDiagnosticsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (CalendarDiagnosticsLibraryCore_frameworkLibrary)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2050000000;
    v5 = (void *)getCalDiagObfuscatorClass_softClass;
    v21 = getCalDiagObfuscatorClass_softClass;
    if (!getCalDiagObfuscatorClass_softClass)
    {
      *(_QWORD *)&v22 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v22 + 1) = 3221225472;
      v23 = __getCalDiagObfuscatorClass_block_invoke;
      v24 = &unk_1E6A37C10;
      v25 = &v18;
      __getCalDiagObfuscatorClass_block_invoke((uint64_t)&v22);
      v5 = (void *)v19[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v18, 8);
    if (v6)
    {
      -[NSURL lastPathComponent](self->_outputURL, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByDeletingPathExtension");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "temporaryFileForName:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend((id)objc_msgSend(v6, "alloc"), "initWithTargetDatabase:", v9);
      if (objc_msgSend(v4, "redactLogs"))
      {
        v17 = 0;
        v11 = objc_msgSend(v10, "obfuscateWithContext:error:", v4, &v17);
        v12 = (id *)&v17;
      }
      else
      {
        v16 = 0;
        v11 = objc_msgSend(v10, "copyWithoutObfuscatingWithContext:error:", v4, &v16);
        v12 = (id *)&v16;
      }
      v14 = *v12;
      if ((v11 & ~objc_msgSend(v4, "canceled")) == 1)
      {
        if (+[CADDiagnosticsUtils compressFileAt:to:context:](CADDiagnosticsUtils, "compressFileAt:to:context:", v9, self->_outputURL, v4))
        {
          objc_msgSend(v4, "deleteTemporaryFile:", v9);
          v13 = 1;
LABEL_18:

          goto LABEL_19;
        }
        objc_msgSend(v4, "deleteTemporaryFile:", self->_outputURL);
      }
      objc_msgSend(v4, "deleteTemporaryFile:", v9);
      objc_msgSend(v4, "log:", CFSTR("Error attaching diagnostics database. Diagnostics database will NOT be attached: %@"), v14);
      v13 = 0;
      goto LABEL_18;
    }
    objc_msgSend(v4, "logError:", CFSTR("CalDiagObfuscator not loaded; no diagnostics database will be attached"));
  }
  else
  {
    objc_msgSend(v4, "logError:", CFSTR("CalendarDiagnostics not loaded; no diagnostics database will be attached"));
  }
  v13 = 0;
LABEL_19:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputURL, 0);
}

@end
