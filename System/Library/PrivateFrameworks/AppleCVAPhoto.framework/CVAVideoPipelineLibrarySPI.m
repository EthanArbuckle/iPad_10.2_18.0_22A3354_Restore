@implementation CVAVideoPipelineLibrarySPI

+ (id)portraitRequestWithBackground:(id)a3 light:(id)a4 post:(id)a5 isTmpConfig:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v7;
  void *v8;

  v7 = a6;
  +[CVAVideoPipelineLibrary portraitRequestWithBackground:light:post:error:](CVAVideoPipelineLibrary, "portraitRequestWithBackground:light:post:error:", a3, a4, a5, a7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIsTmpConfig:", v7);
  return v8;
}

+ (BOOL)updateRequestWithLiveData:(id)a3 mattingRequest:(id)a4 faceKitProcessOutput:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  id v10;
  char isKindOfClass;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    v12 = v8;
    v13 = v12;
    if (v9)
    {
      objc_msgSend(v12, "background");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v13, "background");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setMattingRequest:", v9);

      }
    }
    if (v10)
    {
      objc_msgSend(v13, "light");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v13, "light");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setFaceKitProcessOutput:", v10);

      }
    }

  }
  return isKindOfClass & 1;
}

+ (id)identifyGPU:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  __CFString *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v3 = a3;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "containsString:", CFSTR("Apple")))
  {
    v7 = &stru_1E69374E8;
LABEL_13:

    goto LABEL_14;
  }
  NSSelectorFromString(CFSTR("architecture"));
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    objc_msgSend(v3, "architecture");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("applegpu_"), &stru_1E69374E8);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "revision");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "containsString:", CFSTR("A")) & 1) != 0)
    {
      v9 = 1;
    }
    else if (-[__CFString containsString:](v7, "containsString:", CFSTR("g16p")))
    {
      objc_msgSend(v4, "revision");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v10, "containsString:", CFSTR("B0"));

    }
    else
    {
      v9 = 0;
    }

    if ((v9 & (-[__CFString containsString:](v7, "containsString:", CFSTR("g17p")) ^ 1)) == 1)
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v4, "revision");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lowercaseString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@_%@"), v7, v13);
      v14 = objc_claimAutoreleasedReturnValue();

      v7 = (__CFString *)v14;
    }

    goto LABEL_13;
  }
  v7 = &stru_1E69374E8;
LABEL_14:

  return v7;
}

@end
