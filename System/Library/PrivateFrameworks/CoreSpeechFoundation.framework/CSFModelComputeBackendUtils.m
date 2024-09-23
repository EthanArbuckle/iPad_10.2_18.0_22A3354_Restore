@implementation CSFModelComputeBackendUtils

+ (id)getShapeWithTensors:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  int v20;
  const char *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_12;
  objc_msgSend(v3, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(v4, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

    }
    else
    {
      objc_msgSend(v4, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v11 = objc_opt_isKindOfClass();

      if ((v11 & 1) == 0)
        goto LABEL_12;
    }
    objc_msgSend(v4, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v14 = objc_opt_isKindOfClass();

    if ((v14 & 1) != 0)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v4, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v16);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v17);

      v8 = (void *)objc_msgSend(v7, "copy");
      goto LABEL_9;
    }
    v18 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v20 = 136315138;
      v21 = "+[CSFModelComputeBackendUtils getShapeWithTensors:]";
      _os_log_error_impl(&dword_1B502E000, v18, OS_LOG_TYPE_ERROR, "%s input tensor not valid, rank > 3 tensor is not supported", (uint8_t *)&v20, 0xCu);
    }
LABEL_12:
    v8 = 0;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v22[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

LABEL_13:
  return v8;
}

+ (id)compileWithMilFile:(id)a3 bnnsIrPath:(id)a4
{
  return +[CSFMil2bnnsComputeBackend compileWithMilFile:bnnsIrPath:separateWeight:](CSFMil2bnnsComputeBackend, "compileWithMilFile:bnnsIrPath:separateWeight:", a3, a4, 0);
}

+ (id)compileWithMilFile:(id)a3 bnnsIrPath:(id)a4 separateWeight:(id)a5
{
  return +[CSFMil2bnnsComputeBackend compileWithMilFile:bnnsIrPath:separateWeight:](CSFMil2bnnsComputeBackend, "compileWithMilFile:bnnsIrPath:separateWeight:", a3, a4, a5);
}

+ (int64_t)getRankOfTensor:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  int v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "firstObject");
    v5 = objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v4, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v5 = 1;
      }
      else
      {
        objc_msgSend(v4, "firstObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v9 = objc_opt_isKindOfClass();

        if ((v9 & 1) == 0)
          goto LABEL_9;
        objc_msgSend(v4, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v12 = objc_opt_isKindOfClass();

        if ((v12 & 1) != 0)
        {
          v5 = 2;
        }
        else
        {
LABEL_9:
          v13 = CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
          {
            v15 = 136315138;
            v16 = "+[CSFModelComputeBackendUtils getRankOfTensor:]";
            _os_log_impl(&dword_1B502E000, v13, OS_LOG_TYPE_DEFAULT, "%s No support for tensor with rank > 2", (uint8_t *)&v15, 0xCu);
          }
          v5 = -1;
        }
      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)_flattenArray:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;

  v4 = a3;
  objc_msgSend(a1, "getShapeWithTensors:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 1)
  {
    v6 = v4;
  }
  else if (objc_msgSend(v5, "count") == 2)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v5, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedLongValue");

    if (v9)
    {
      v10 = 0;
      do
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "unsignedLongValue");

        if (v13)
        {
          v14 = 0;
          do
          {
            objc_msgSend(v11, "objectAtIndexedSubscript:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v15);

            ++v14;
            objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "unsignedLongValue");

          }
          while (v14 < v17);
        }

        ++v10;
        objc_msgSend(v5, "firstObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "unsignedLongValue");

      }
      while (v10 < v19);
    }
    v6 = (id)objc_msgSend(v7, "copy");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (unint64_t)_getElementSizeFromShape:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      v8 = 1;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v8 *= objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "unsignedLongValue");
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }
    else
    {
      v8 = 1;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
