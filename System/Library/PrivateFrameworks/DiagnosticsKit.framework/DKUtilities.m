@implementation DKUtilities

+ (id)acceptableDecoderClasses
{
  if (acceptableDecoderClasses_onceToken != -1)
    dispatch_once(&acceptableDecoderClasses_onceToken, &__block_literal_global_8);
  return (id)acceptableDecoderClasses_singleton;
}

void __39__DKUtilities_acceptableDecoderClasses__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)acceptableDecoderClasses_singleton;
  acceptableDecoderClasses_singleton = v9;

}

+ (id)extensionAttributes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("NSExtension"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("NSExtension"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        v7 = CFSTR("NSExtensionAttributes");
      }
      else
      {
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DKDiagnosticService"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v6)
        {
          v9 = 0;
          goto LABEL_14;
        }
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DKDiagnosticService"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        v7 = CFSTR("DKDiagnosticServiceAttributes");
      }
      objc_msgSend(v5, "objectForKeyedSubscript:", v7);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_opt_class();
        v8 = 0;
        if ((objc_opt_isKindOfClass() & 1) == 0 || !v9)
          goto LABEL_15;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = v9;
          v8 = v9;
LABEL_15:

          goto LABEL_16;
        }
      }
LABEL_14:
      v8 = 0;
      goto LABEL_15;
    }
  }
  v8 = 0;
LABEL_16:

  return v8;
}

+ (Class)diagnosticInputsClassAttribute
{
  void *v2;
  void *v3;
  NSString *v4;
  Class v5;
  objc_class *v6;

  objc_msgSend(a1, "extensionAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("DKDiagnosticInputsClass"));
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v5 = NSClassFromString(v4);
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

+ (id)inputsForDiagnostic:(id)a3 predicates:(id)a4 specifications:(id)a5 parameters:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(a1, "inputsUsingClass:diagnostic:predicates:specifications:parameters:", objc_msgSend(a1, "diagnosticInputsClassAttribute"), v13, v12, v11, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)inputsUsingClass:(Class)a3 diagnostic:(id)a4 predicates:(id)a5 specifications:(id)a6 parameters:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  if (a3)
  {
    a3 = (Class)objc_opt_new();
    if (a3)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0
        && (-[objc_class validateAndInitializePredicates:](a3, "validateAndInitializePredicates:", v12) & 1) == 0)
      {
        objc_msgSend(v11, "result");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        v17 = &unk_24F9A3618;
        goto LABEL_12;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0
        && (-[objc_class validateAndInitializeSpecifications:](a3, "validateAndInitializeSpecifications:", v13) & 1) == 0)
      {
        objc_msgSend(v11, "result");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        v17 = &unk_24F9A3630;
        goto LABEL_12;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0
        && (-[objc_class validateAndInitializeParameters:](a3, "validateAndInitializeParameters:", v14) & 1) == 0)
      {
        objc_msgSend(v11, "result");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        v17 = &unk_24F9A3648;
LABEL_12:
        objc_msgSend(v15, "setStatusCode:", v17);

        objc_msgSend(v11, "setFinished:", 1);
      }
    }
  }

  return a3;
}

+ (void)moveFilesToSharedContainerInMutableResult:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  void *v27;
  char v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "files");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(v3, "files");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      DKTemporaryDirectoryURL();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "files");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "copy");

      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      objc_msgSend(v3, "files");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
      if (v11)
      {
        v12 = v11;
        v33 = v9;
        v34 = v3;
        v13 = 0;
        v14 = *(_QWORD *)v41;
        v15 = 0x24BDD1000uLL;
        do
        {
          v16 = 0;
          v36 = v12;
          do
          {
            if (*(_QWORD *)v41 != v14)
              objc_enumerationMutation(v10);
            v17 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v16);
            objc_msgSend(v17, "path", v33, v34);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "path");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v18, "hasPrefix:", v19);

            if ((v20 & 1) == 0)
            {
              v21 = v10;
              objc_msgSend(v17, "lastPathComponent");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "URLByAppendingPathComponent:", v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(v15 + 1408), "defaultManager");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = 0;
              v25 = objc_msgSend(v24, "copyItemAtURL:toURL:error:", v17, v23, &v39);
              v26 = v39;

              if (v25)
              {

                objc_msgSend(*(id *)(v15 + 1408), "defaultManager");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = 0;
                v28 = objc_msgSend(v27, "removeItemAtURL:error:", v17, &v38);
                v26 = v38;

                if ((v28 & 1) == 0)
                {
                  DiagnosticsKitLogHandleForCategory(2);
                  v29 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    v45 = v17;
                    v46 = 2112;
                    v47 = v26;
                    _os_log_error_impl(&dword_22DE4C000, v29, OS_LOG_TYPE_ERROR, "Could not delete file at [%@]: %@", buf, 0x16u);
                  }

                }
                DiagnosticsKitLogHandleForCategory(2);
                v30 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v45 = v17;
                  v46 = 2112;
                  v47 = v23;
                  _os_log_impl(&dword_22DE4C000, v30, OS_LOG_TYPE_DEFAULT, "Moved file at [%@] to [%@].", buf, 0x16u);
                }

                objc_msgSend(v35, "addObject:", v23);
              }
              else
              {
                DiagnosticsKitLogHandleForCategory(2);
                v31 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412802;
                  v45 = v17;
                  v46 = 2112;
                  v47 = v23;
                  v48 = 2112;
                  v49 = v26;
                  _os_log_error_impl(&dword_22DE4C000, v31, OS_LOG_TYPE_ERROR, "Could not copy file from [%@] to [%@]: %@", buf, 0x20u);
                }

              }
              v13 = 1;
              v10 = v21;
              v15 = 0x24BDD1000;
              v12 = v36;
            }
            ++v16;
          }
          while (v12 != v16);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
        }
        while (v12);

        v9 = v33;
        v3 = v34;
        if ((v13 & 1) != 0)
        {
          v32 = objc_msgSend(v35, "copy");
          objc_msgSend(v34, "setFiles:", v32);
LABEL_28:

          goto LABEL_29;
        }
      }
      else
      {

      }
      DiagnosticsKitLogHandleForCategory(2);
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22DE4C000, v32, OS_LOG_TYPE_DEFAULT, "Files already in shared container. Leaving unchanged.", buf, 2u);
      }
      goto LABEL_28;
    }
  }
LABEL_29:

}

+ (id)_fetchItemProviderFromItems:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v18;

  v6 = a3;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "count")
    || (objc_msgSend(a1, "_sharedParsingFailedError"), (v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(v7, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attachments");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(v10, "attachments");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (v14)
        goto LABEL_12;
    }
    objc_msgSend(a1, "_sharedParsingFailedError");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
LABEL_12:
      objc_msgSend(v10, "attachments");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = 0;
      if (!a4)
        goto LABEL_11;
      goto LABEL_10;
    }
    v9 = (void *)v15;
  }
  else
  {
    v9 = (void *)v8;
    v10 = 0;
  }
  v16 = 0;
  if (a4)
LABEL_10:
    *a4 = objc_retainAutorelease(v9);
LABEL_11:

  return v16;
}

+ (id)_sharedParsingFailedError
{
  if (_sharedParsingFailedError_onceToken != -1)
    dispatch_once(&_sharedParsingFailedError_onceToken, &__block_literal_global_28);
  return (id)_sharedParsingFailedError_singleton;
}

void __40__DKUtilities__sharedParsingFailedError__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDD1540];
  v5 = *MEMORY[0x24BDD0FC8];
  DKErrorLocalizedDescriptionForCode(-1004);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), -1004, v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_sharedParsingFailedError_singleton;
  _sharedParsingFailedError_singleton = v3;

}

@end
