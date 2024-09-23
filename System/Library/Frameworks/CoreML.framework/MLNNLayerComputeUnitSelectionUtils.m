@implementation MLNNLayerComputeUnitSelectionUtils

+ (id)getNetJson:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a3;
  objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("model.espresso.net"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "fileExistsAtPath:", v7) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v9, 1, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9 && v10)
    {
      v12 = v10;
    }
    else if (a4)
    {
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Unable to load information from compiled model path %@."), v7);
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }

    goto LABEL_12;
  }
  if (a4)
  {
    objc_msgSend(v5, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("'model.espresso.net' file not found at the given compiled model path: %@."), v9);
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:

    goto LABEL_13;
  }
  v12 = 0;
LABEL_13:

  return v12;
}

+ (id)getLayerTypes:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  id v20;

  v6 = a3;
  v20 = 0;
  objc_msgSend(a1, "getNetJson:error:", v6, &v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v20;
  v9 = v8;
  v19 = v7;
  if (v8)
  {
    v10 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v8);
  }
  else
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("layers"), v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_opt_new();
    for (i = 0; i < objc_msgSend(v11, "count"); ++i)
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", i);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("type"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("name"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("type"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("name"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKey:", v16, v17);

        }
      }

    }
  }

  return v10;
}

+ (id)getLayerHints:(id)a3 error:(id *)a4
{
  void *v6;
  unint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[3];
  _QWORD v34[4];

  v34[3] = *MEMORY[0x1E0C80C00];
  v32 = 0;
  v28 = a3;
  objc_msgSend(a1, "getNetJson:error:");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v32;
  if (v30)
  {
    v31 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v30);
  }
  else
  {
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("layers"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (id)objc_opt_new();
    for (i = 0; i < objc_msgSend(v6, "count"); ++i)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0C99E08];
      v33[0] = CFSTR("kMLLayerComputeUnitHintFallbackFromCPU");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = v10;
      v33[1] = CFSTR("kMLLayerComputeUnitHintFallbackFromGPU");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v34[1] = v11;
      v33[2] = CFSTR("kMLLayerComputeUnitHintFallbackFromNE");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v34[2] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dictionaryWithDictionary:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "objectForKey:", CFSTR("hint_fallback_from_metal"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v13) = v15 == 0;

      if ((v13 & 1) == 0)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("hint_fallback_from_metal"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "BOOLValue"))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("kMLLayerComputeUnitHintFallbackFromGPU"));

        }
      }
      objc_msgSend(v8, "objectForKey:", CFSTR("hint_fallback_from_cpu"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18 == 0;

      if (!v19)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("hint_fallback_from_cpu"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "BOOLValue"))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v21, CFSTR("kMLLayerComputeUnitHintFallbackFromCPU"));

        }
      }
      objc_msgSend(v8, "objectForKey:", CFSTR("hint_fallback_from_ane"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22 == 0;

      if (!v23)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("hint_fallback_from_ane"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v24, "BOOLValue"))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v25, CFSTR("kMLLayerComputeUnitHintFallbackFromNE"));

        }
      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("name"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setObject:forKey:", v14, v26);

    }
  }

  return v31;
}

+ (BOOL)updateHints:(id)a3 hints:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  void *v18;
  int *v19;
  void *v20;
  id v21;
  unint64_t i;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v37;
  id v38;
  id v39;
  id v40;
  id *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  char v47;
  id v48;
  uint8_t buf[4];
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v44 = a3;
  v45 = a4;
  v48 = 0;
  objc_msgSend(a1, "getNetJson:error:", v44, &v48);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v48;
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0;
    objc_msgSend(v44, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = a5;
    objc_msgSend(v42, "fileExistsAtPath:isDirectory:", v11, &v47);

    if (v47)
    {
      objc_msgSend(v44, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v42, "isWritableFileAtPath:", v12);

      if ((v13 & 1) != 0)
      {
        objc_msgSend(v44, "URLByAppendingPathComponent:", CFSTR("model.espresso.net"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "path");
        v39 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v39, "stringByAppendingString:", CFSTR(".bckp"));
        v15 = objc_claimAutoreleasedReturnValue();
        v37 = (id)v15;
        if (objc_msgSend(v42, "fileExistsAtPath:", v15))
          objc_msgSend(v42, "removeItemAtPath:error:", v15, 0);
        +[MLLogging coreChannel](MLLogging, "coreChannel");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v50 = v37;
          _os_log_impl(&dword_19C486000, v16, OS_LOG_TYPE_INFO, "Creating a backup of .net file at location %@", buf, 0xCu);
        }

        v40 = objc_retainAutorelease(v39);
        v17 = (const char *)objc_msgSend(v40, "UTF8String");
        v38 = objc_retainAutorelease(v37);
        if (clonefile(v17, (const char *)objc_msgSend(v38, "UTF8String"), 1u))
        {
          v18 = (void *)MEMORY[0x1E0CB3940];
          v19 = __error();
          objc_msgSend(v18, "stringWithCString:encoding:", strerror(*v19), objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (a5)
          {
            +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Unable to create backup of .net file at compiled model directory, with error: %@"), v20);
            v10 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v10 = 0;
          }
        }
        else
        {
          objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("layers"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          for (i = 0; i < objc_msgSend(v20, "count"); ++i)
          {
            objc_msgSend(v20, "objectAtIndexedSubscript:", i);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("name"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "objectForKey:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v25 == 0;

            if (!v26)
            {
              objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("name"));
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "objectForKeyedSubscript:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v28, "objectForKey:", CFSTR("kMLLayerComputeUnitHintFallbackFromCPU"));
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "objectForKey:", CFSTR("kMLLayerComputeUnitHintFallbackFromGPU"));
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "objectForKey:", CFSTR("kMLLayerComputeUnitHintFallbackFromNE"));
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              if (v29)
              {
                if (objc_msgSend(v29, "BOOLValue"))
                  objc_msgSend(v23, "setObject:forKey:", &unk_1E3DA24A0, CFSTR("hint_fallback_from_cpu"));
                else
                  objc_msgSend(v23, "removeObjectForKey:", CFSTR("hint_fallback_from_cpu"));
              }
              if (v30)
              {
                if (objc_msgSend(v30, "BOOLValue"))
                  objc_msgSend(v23, "setObject:forKey:", &unk_1E3DA24A0, CFSTR("hint_fallback_from_metal"));
                else
                  objc_msgSend(v23, "removeObjectForKey:", CFSTR("hint_fallback_from_metal"));
              }
              if (v31)
              {
                if (objc_msgSend(v31, "BOOLValue"))
                  objc_msgSend(v23, "setObject:forKey:", &unk_1E3DA24A0, CFSTR("hint_fallback_from_ane"));
                else
                  objc_msgSend(v23, "removeObjectForKey:", CFSTR("hint_fallback_from_ane"));
              }

            }
          }
          objc_msgSend(v42, "removeItemAtPath:error:", v40, 0);
          v46 = 0;
          objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v43, 1, &v46);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v46;
          v34 = v33;
          v10 = v33 == 0;
          if (v33)
          {
            if (v41)
            {
              objc_msgSend(v33, "localizedDescription");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Failed to serialize new .net data after updating schedule hints, underlying error message: %@"), v35);
              *v41 = (id)objc_claimAutoreleasedReturnValue();

            }
          }
          else
          {
            objc_msgSend(v32, "writeToFile:atomically:", v40, 1);
          }

        }
        goto LABEL_44;
      }
      if (a5)
      {
        objc_msgSend(v44, "path");
        v40 = (id)objc_claimAutoreleasedReturnValue();
        +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Compiled model path: '%@', must be a writable directory."), v40);
        v21 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
    }
    else if (a5)
    {
      objc_msgSend(v44, "path");
      v40 = (id)objc_claimAutoreleasedReturnValue();
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Compiled model path: '%@', must be a directory."), v40);
      v21 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:
      v10 = 0;
      *a5 = v21;
LABEL_44:

      goto LABEL_45;
    }
    v10 = 0;
LABEL_45:

    goto LABEL_46;
  }
  v10 = 0;
  if (a5)
    *a5 = objc_retainAutorelease(v8);
LABEL_46:

  return v10;
}

+ (BOOL)undoLastHintUpdate:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("model.espresso.net"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByAppendingString:", CFSTR(".bckp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "fileExistsAtPath:", v7) & 1) != 0)
  {
    objc_msgSend(v8, "removeItemAtPath:error:", v6, a4);
    if (*a4)
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend(v8, "moveItemAtPath:toPath:error:", v7, v6, a4);
      v9 = *a4 == 0;
    }
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

@end
