@implementation _EARmil2BnnsCompiler

+ (void)initialize
{
  EARLogger *v3;

  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
    EARLogger::initializeLogging(v3);
}

+ (void)compileWithModelMilPath:(id)a3 bnnsIrOutPath:(id)a4 milConfigPath:(id)a5 errorOut:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  void *__p[2];
  uint64_t v25;
  void *v26;
  char v27;
  __int128 v28;
  char v29;
  uint64_t v30;
  __CFString *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "fileExistsAtPath:", v9);

      if ((v13 & 1) != 0)
      {
        objc_msgSend(v9, "ear_toString");
        objc_msgSend(v10, "ear_toString");
        if (v11)
        {
          objc_msgSend(v11, "ear_toString");
        }
        else
        {
          __p[0] = 0;
          __p[1] = 0;
          v25 = 0;
        }
        v20 = kaldi::quasar::onDeviceMil2BnnsCompile(&v28, (uint64_t)&v26, (uint64_t)__p);
        if (SHIBYTE(v25) < 0)
          operator delete(__p[0]);
        if (v27 < 0)
          operator delete(v26);
        if (v29 < 0)
          operator delete((void *)v28);
        v21 = CFSTR("mil2Bnns compilation failed with unknown error");
        if (v20)
          v21 = &stru_1E5D49530;
        v22 = v21;
        v15 = v22;
        if (!a6 || v20)
          goto LABEL_25;
        v23 = (void *)MEMORY[0x1E0CB35C8];
        v30 = *MEMORY[0x1E0CB2D50];
        v31 = v22;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.quasar.mil2BnnsCompilation"), 3, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:
        *a6 = v17;

LABEL_25:
        goto LABEL_26;
      }
      if (a6)
      {
        v19 = (void *)MEMORY[0x1E0CB35C8];
        v32 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bnns.mil file is not found"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.quasar.mil2BnnsCompilation"), 0, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      }
    }
    else if (a6)
    {
      v18 = (void *)MEMORY[0x1E0CB35C8];
      v34 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(".bnns.Ir out specified is nil"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.quasar.mil2BnnsCompilation"), 2, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
  }
  else if (a6)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v36 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(".bnns.mil file nil"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.quasar.mil2BnnsCompilation"), 1, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
LABEL_26:

}

+ (BOOL)validateBnnsIr:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *__p[2];
  uint64_t v8;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    v8 = 0;
  }
  v5 = kaldi::quasar::validateBnnsIr((uint64_t)__p);
  if (SHIBYTE(v8) < 0)
    operator delete(__p[0]);

  return v5;
}

@end
