id symptomsLogHandle()
{
  if (symptomsLogHandle_symptomsPred != -1)
    dispatch_once(&symptomsLogHandle_symptomsPred, &__block_literal_global_18);
  return (id)symptomsLogHandle_symptomsHandle;
}

id xpcLogHandle()
{
  if (xpcLogHandle_xpcPred != -1)
    dispatch_once(&xpcLogHandle_xpcPred, &__block_literal_global_7_0);
  return (id)xpcLogHandle_xpcHandle;
}

id configurationLogHandle()
{
  if (configurationLogHandle_configurationPred != -1)
    dispatch_once(&configurationLogHandle_configurationPred, &__block_literal_global_23);
  return (id)configurationLogHandle_configurationHandle;
}

id adminLogHandle()
{
  if (adminLogHandle_adminPred != -1)
    dispatch_once(&adminLogHandle_adminPred, &__block_literal_global_5);
  return (id)adminLogHandle_adminHandle;
}

id objectanalyticsHandle()
{
  if (objectanalyticsHandle_analyticsHandlePred != -1)
    dispatch_once(&objectanalyticsHandle_analyticsHandlePred, &__block_literal_global);
  return (id)objectanalyticsHandle_analyticsHandle;
}

void __objectanalyticsHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.symptomsframework", "objectanalytics");
  v1 = (void *)objectanalyticsHandle_analyticsHandle;
  objectanalyticsHandle_analyticsHandle = (uint64_t)v0;

}

void sub_1DBAE75C4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t assembleFullName(void *a1, void *a2, _QWORD *a3)
{
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;

  v5 = a1;
  v6 = a2;
  if (v6)
  {
    v7 = v6;
    if (!-[__CFString isAbsolutePath](v6, "isAbsolutePath"))
    {
      v8 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    v7 = CFSTR("/var/wireless/Library/Databases/Symptoms");
  }
  if (!v5)
    v5 = CFSTR("SymptomAnalytics");
  -[__CFString stringByAppendingPathComponent:](v7, "stringByAppendingPathComponent:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathExtension:", CFSTR("sqlite"));
  *a3 = (id)objc_claimAutoreleasedReturnValue();

  v8 = 1;
LABEL_8:

  return v8;
}

void sub_1DBAE8798(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t isDBFileCorrupted(void *a1, int a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0C979C8];
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C979C8]))
    v6 = objc_msgSend(v3, "code") == 11 || objc_msgSend(v3, "code") == 26;
  else
    v6 = 0;

  objc_msgSend(v3, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = objc_msgSend(v8, "intValue") == 11 || objc_msgSend(v8, "intValue") == 26;
  else
    v9 = 0;
  objc_msgSend(v3, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB28A8]) & 1) != 0)
  {
    v11 = objc_msgSend(v3, "code") == 259;
  }
  else
  {
    objc_msgSend(v3, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
      v11 = objc_msgSend(v3, "code") == 259;
    else
      v11 = 0;

  }
  if (v6 || v9 || v11)
  {
    objectanalyticsHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v18 = 138412290;
      v19 = v3;
      _os_log_impl(&dword_1DBAE1000, v16, OS_LOG_TYPE_ERROR, "Confirming file corruption based on error: %@", (uint8_t *)&v18, 0xCu);
    }

    v15 = 1;
  }
  else
  {
    objc_msgSend(v3, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (a2 <= 5)
        v15 = isDBFileCorrupted(v14, (a2 + 1));
      else
        v15 = 1;
    }
    else
    {
      v15 = 0;
    }

  }
  return v15;
}

uint64_t ABCPbSigResponseReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  void *v30;
  uint64_t result;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  uint64_t v38;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
          goto LABEL_35;
        case 2u:
          v19 = 0;
          v20 = 0;
          v21 = 0;
          *(_BYTE *)(a1 + 36) |= 1u;
          while (2)
          {
            v22 = *v3;
            v23 = *(_QWORD *)(a2 + v22);
            if (v23 == -1 || v23 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
              *(_QWORD *)(a2 + v22) = v23 + 1;
              v21 |= (unint64_t)(v24 & 0x7F) << v19;
              if (v24 < 0)
              {
                v19 += 7;
                v14 = v20++ >= 9;
                if (v14)
                {
                  LODWORD(v21) = 0;
                  goto LABEL_48;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v21) = 0;
LABEL_48:
          v38 = 8;
          goto LABEL_53;
        case 3u:
          v25 = 0;
          v26 = 0;
          v21 = 0;
          *(_BYTE *)(a1 + 36) |= 2u;
          while (2)
          {
            v27 = *v3;
            v28 = *(_QWORD *)(a2 + v27);
            if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
              *(_QWORD *)(a2 + v27) = v28 + 1;
              v21 |= (unint64_t)(v29 & 0x7F) << v25;
              if (v29 < 0)
              {
                v25 += 7;
                v14 = v26++ >= 9;
                if (v14)
                {
                  LODWORD(v21) = 0;
                  goto LABEL_52;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v21) = 0;
LABEL_52:
          v38 = 12;
LABEL_53:
          *(_DWORD *)(a1 + v38) = v21;
          continue;
        case 4u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
LABEL_35:
          v30 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        case 0xAu:
          v32 = 0;
          v33 = 0;
          v34 = 0;
          *(_BYTE *)(a1 + 36) |= 4u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v35 = *v3;
        v36 = *(_QWORD *)(a2 + v35);
        if (v36 == -1 || v36 >= *(_QWORD *)(a2 + *v4))
          break;
        v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
        *(_QWORD *)(a2 + v35) = v36 + 1;
        v34 |= (unint64_t)(v37 & 0x7F) << v32;
        if ((v37 & 0x80) == 0)
          goto LABEL_55;
        v32 += 7;
        v14 = v33++ >= 9;
        if (v14)
        {
          v34 = 0;
          goto LABEL_57;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_55:
      if (*(_BYTE *)(a2 + *v5))
        v34 = 0;
LABEL_57:
      *(_BYTE *)(a1 + 32) = v34 != 0;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t AWDSymptomsSignificantOperationalEventReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  void *v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  char v43;
  unsigned int v44;
  uint64_t v45;
  unint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 56) |= 2u;
          while (1)
          {
            v20 = *v3;
            v21 = *(_QWORD *)(a2 + v20);
            if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
              break;
            v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0)
              goto LABEL_60;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              v19 = 0;
              goto LABEL_62;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_60:
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_62:
          v48 = 16;
          goto LABEL_75;
        case 2u:
          v24 = 0;
          v25 = 0;
          v26 = 0;
          *(_BYTE *)(a1 + 56) |= 8u;
          while (2)
          {
            v27 = *v3;
            v28 = *(_QWORD *)(a2 + v27);
            if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
              *(_QWORD *)(a2 + v27) = v28 + 1;
              v26 |= (unint64_t)(v29 & 0x7F) << v24;
              if (v29 < 0)
              {
                v24 += 7;
                v14 = v25++ >= 9;
                if (v14)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_66;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v26) = 0;
LABEL_66:
          v49 = 48;
          goto LABEL_80;
        case 3u:
          PBReaderReadString();
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = 24;
          goto LABEL_44;
        case 4u:
          v32 = 0;
          v33 = 0;
          v26 = 0;
          *(_BYTE *)(a1 + 56) |= 4u;
          while (2)
          {
            v34 = *v3;
            v35 = *(_QWORD *)(a2 + v34);
            if (v35 == -1 || v35 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v36 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v35);
              *(_QWORD *)(a2 + v34) = v35 + 1;
              v26 |= (unint64_t)(v36 & 0x7F) << v32;
              if (v36 < 0)
              {
                v32 += 7;
                v14 = v33++ >= 9;
                if (v14)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_70;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v26) = 0;
LABEL_70:
          v49 = 32;
          goto LABEL_80;
        case 5u:
          PBReaderReadString();
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = 40;
LABEL_44:
          v37 = *(void **)(a1 + v31);
          *(_QWORD *)(a1 + v31) = v30;

          continue;
        case 6u:
          v38 = 0;
          v39 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 56) |= 1u;
          while (2)
          {
            v40 = *v3;
            v41 = *(_QWORD *)(a2 + v40);
            if (v41 == -1 || v41 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v42 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v41);
              *(_QWORD *)(a2 + v40) = v41 + 1;
              v19 |= (unint64_t)(v42 & 0x7F) << v38;
              if (v42 < 0)
              {
                v38 += 7;
                v14 = v39++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_74;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_74:
          v48 = 8;
LABEL_75:
          *(_QWORD *)(a1 + v48) = v19;
          continue;
        case 7u:
          v43 = 0;
          v44 = 0;
          v26 = 0;
          *(_BYTE *)(a1 + 56) |= 0x10u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v45 = *v3;
        v46 = *(_QWORD *)(a2 + v45);
        if (v46 == -1 || v46 >= *(_QWORD *)(a2 + *v4))
          break;
        v47 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v46);
        *(_QWORD *)(a2 + v45) = v46 + 1;
        v26 |= (unint64_t)(v47 & 0x7F) << v43;
        if ((v47 & 0x80) == 0)
          goto LABEL_77;
        v43 += 7;
        v14 = v44++ >= 9;
        if (v14)
        {
          LODWORD(v26) = 0;
          goto LABEL_79;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_77:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v26) = 0;
LABEL_79:
      v49 = 52;
LABEL_80:
      *(_DWORD *)(a1 + v49) = v26;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL ABCPbSummarySubmitResponseReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 16;
LABEL_22:
        v19 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_24:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 8;
    goto LABEL_22;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t AWDSymptomsDiagnosticIncidentEventReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  char v42;
  unsigned int v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 60) |= 1u;
          while (1)
          {
            v20 = *v3;
            v21 = *(_QWORD *)(a2 + v20);
            if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
              break;
            v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0)
              goto LABEL_61;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              v19 = 0;
              goto LABEL_63;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_61:
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_63:
          v48 = 8;
          goto LABEL_72;
        case 2u:
          v24 = 0;
          v25 = 0;
          v26 = 0;
          *(_BYTE *)(a1 + 60) |= 0x10u;
          while (2)
          {
            v27 = *v3;
            v28 = *(_QWORD *)(a2 + v27);
            if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
              *(_QWORD *)(a2 + v27) = v28 + 1;
              v26 |= (unint64_t)(v29 & 0x7F) << v24;
              if (v29 < 0)
              {
                v24 += 7;
                v14 = v25++ >= 9;
                if (v14)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_67;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v26) = 0;
LABEL_67:
          v49 = 56;
          goto LABEL_81;
        case 3u:
          PBReaderReadString();
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = 40;
          goto LABEL_59;
        case 4u:
          v32 = 0;
          v33 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 60) |= 2u;
          while (2)
          {
            v34 = *v3;
            v35 = *(_QWORD *)(a2 + v34);
            if (v35 == -1 || v35 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v36 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v35);
              *(_QWORD *)(a2 + v34) = v35 + 1;
              v19 |= (unint64_t)(v36 & 0x7F) << v32;
              if (v36 < 0)
              {
                v32 += 7;
                v14 = v33++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_71;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_71:
          v48 = 16;
LABEL_72:
          *(_QWORD *)(a1 + v48) = v19;
          continue;
        case 5u:
          v37 = 0;
          v38 = 0;
          v26 = 0;
          *(_BYTE *)(a1 + 60) |= 8u;
          while (2)
          {
            v39 = *v3;
            v40 = *(_QWORD *)(a2 + v39);
            if (v40 == -1 || v40 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v41 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v40);
              *(_QWORD *)(a2 + v39) = v40 + 1;
              v26 |= (unint64_t)(v41 & 0x7F) << v37;
              if (v41 < 0)
              {
                v37 += 7;
                v14 = v38++ >= 9;
                if (v14)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_76;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v26) = 0;
LABEL_76:
          v49 = 52;
          goto LABEL_81;
        case 6u:
          v42 = 0;
          v43 = 0;
          v26 = 0;
          *(_BYTE *)(a1 + 60) |= 4u;
          break;
        case 7u:
          PBReaderReadString();
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = 24;
          goto LABEL_59;
        case 8u:
          PBReaderReadString();
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = 32;
LABEL_59:
          v47 = *(void **)(a1 + v31);
          *(_QWORD *)(a1 + v31) = v30;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v44 = *v3;
        v45 = *(_QWORD *)(a2 + v44);
        if (v45 == -1 || v45 >= *(_QWORD *)(a2 + *v4))
          break;
        v46 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v45);
        *(_QWORD *)(a2 + v44) = v45 + 1;
        v26 |= (unint64_t)(v46 & 0x7F) << v42;
        if ((v46 & 0x80) == 0)
          goto LABEL_78;
        v42 += 7;
        v14 = v43++ >= 9;
        if (v14)
        {
          LODWORD(v26) = 0;
          goto LABEL_80;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_78:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v26) = 0;
LABEL_80:
      v49 = 48;
LABEL_81:
      *(_DWORD *)(a1 + v49) = v26;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t AWDSymptomsDiagnosticIncidentReportReadFrom(_BYTE *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  unint64_t v7;
  int *v8;
  unint64_t v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  BOOL v16;
  int v17;
  int v18;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  AWDSymptomsDiagnosticIncidentEvent *v41;
  uint64_t result;
  char v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  void *v49;
  char v50;
  unsigned int v51;
  uint64_t v52;
  unint64_t v53;
  char v54;
  char v55;
  unsigned int v56;
  uint64_t v57;
  unint64_t v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  unsigned int v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  char v67;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = 0x1F0306000uLL;
  v8 = (int *)MEMORY[0x1E0D82BB8];
  v9 = 0x1F0306000uLL;
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    while (1)
    {
      v13 = *v3;
      v14 = *(_QWORD *)(a2 + v13);
      if (v14 == -1 || v14 >= *(_QWORD *)(a2 + *v4))
        break;
      v15 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v14);
      *(_QWORD *)(a2 + v13) = v14 + 1;
      v12 |= (unint64_t)(v15 & 0x7F) << v10;
      if ((v15 & 0x80) == 0)
        goto LABEL_12;
      v10 += 7;
      v16 = v11++ >= 9;
      if (v16)
      {
        v12 = 0;
        v17 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v17 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v12 = 0;
LABEL_14:
    v18 = v12 & 7;
    if (v17 || v18 == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v12 >> 3))
    {
      case 1u:
        v20 = 0;
        v21 = 0;
        v22 = 0;
        a1[*(int *)(v7 + 2720)] |= 2u;
        while (1)
        {
          v23 = *v3;
          v24 = *(_QWORD *)(a2 + v23);
          if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            break;
          v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v24);
          *(_QWORD *)(a2 + v23) = v24 + 1;
          v22 |= (unint64_t)(v25 & 0x7F) << v20;
          if ((v25 & 0x80) == 0)
            goto LABEL_85;
          v20 += 7;
          v16 = v21++ >= 9;
          if (v16)
          {
            v22 = 0;
            goto LABEL_87;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_85:
        if (*(_BYTE *)(a2 + *v5))
          v22 = 0;
LABEL_87:
        v60 = 40;
        goto LABEL_100;
      case 2u:
        v26 = 0;
        v27 = 0;
        v28 = 0;
        a1[*(int *)(v7 + 2720)] |= 0x10u;
        while (2)
        {
          v29 = *v3;
          v30 = *(_QWORD *)(a2 + v29);
          if (v30 == -1 || v30 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v30);
            *(_QWORD *)(a2 + v29) = v30 + 1;
            v28 |= (unint64_t)(v31 & 0x7F) << v26;
            if (v31 < 0)
            {
              v26 += 7;
              v16 = v27++ >= 9;
              if (v16)
              {
                LODWORD(v28) = 0;
                goto LABEL_91;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v28) = 0;
LABEL_91:
        v61 = 96;
        goto LABEL_105;
      case 3u:
        v32 = 0;
        v33 = 0;
        v22 = 0;
        a1[*(int *)(v7 + 2720)] |= 1u;
        while (2)
        {
          v34 = *v3;
          v35 = *(_QWORD *)(a2 + v34);
          if (v35 == -1 || v35 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v36 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v35);
            *(_QWORD *)(a2 + v34) = v35 + 1;
            v22 |= (unint64_t)(v36 & 0x7F) << v32;
            if (v36 < 0)
            {
              v32 += 7;
              v16 = v33++ >= 9;
              if (v16)
              {
                v22 = 0;
                goto LABEL_95;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v22 = 0;
LABEL_95:
        v60 = 32;
        goto LABEL_100;
      case 4u:
        PBReaderReadString();
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = 104;
        goto LABEL_69;
      case 5u:
        PBReaderReadString();
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = 72;
        goto LABEL_69;
      case 6u:
        PBReaderReadString();
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = 144;
        goto LABEL_69;
      case 7u:
        PBReaderReadString();
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = 128;
        goto LABEL_69;
      case 8u:
        PBReaderReadString();
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = 136;
        goto LABEL_69;
      case 9u:
        PBReaderReadString();
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = 64;
        goto LABEL_69;
      case 0xAu:
        PBReaderReadString();
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = 80;
        goto LABEL_69;
      case 0xBu:
        v39 = v7;
        v40 = v9;
        PBReaderReadString();
        v41 = (AWDSymptomsDiagnosticIncidentEvent *)objc_claimAutoreleasedReturnValue();
        if (v41)
          objc_msgSend(a1, "addRelatedNames:", v41);
        goto LABEL_67;
      case 0xCu:
        if (v18 == 2)
        {
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
          {
            v43 = 0;
            v44 = 0;
            v45 = 0;
            while (1)
            {
              v46 = *v3;
              v47 = *(_QWORD *)(a2 + v46);
              if (v47 == -1 || v47 >= *(_QWORD *)(a2 + *v4))
                break;
              v48 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v47);
              *(_QWORD *)(a2 + v46) = v47 + 1;
              v45 |= (unint64_t)(v48 & 0x7F) << v43;
              if (v48 < 0)
              {
                v43 += 7;
                v16 = v44++ >= 9;
                if (!v16)
                  continue;
              }
              goto LABEL_63;
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_63:
            PBRepeatedUInt64Add();
          }
          PBReaderRecallMark();
        }
        else
        {
          v62 = 0;
          v63 = 0;
          v64 = 0;
          while (1)
          {
            v65 = *v3;
            v66 = *(_QWORD *)(a2 + v65);
            if (v66 == -1 || v66 >= *(_QWORD *)(a2 + *v4))
              break;
            v67 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v66);
            *(_QWORD *)(a2 + v65) = v66 + 1;
            v64 |= (unint64_t)(v67 & 0x7F) << v62;
            if (v67 < 0)
            {
              v62 += 7;
              v16 = v63++ >= 9;
              if (!v16)
                continue;
            }
            goto LABEL_117;
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_117:
          PBRepeatedUInt64Add();
        }
        goto LABEL_106;
      case 0xDu:
        v39 = v7;
        v40 = v9;
        v41 = objc_alloc_init(AWDSymptomsDiagnosticIncidentEvent);
        objc_msgSend(a1, "addIncidentEvents:", v41);
        if (PBReaderPlaceMark()
          && (AWDSymptomsDiagnosticIncidentEventReadFrom((uint64_t)v41, a2) & 1) != 0)
        {
          PBReaderRecallMark();
LABEL_67:

          v9 = v40;
          v7 = v39;
LABEL_106:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 0xEu:
        PBReaderReadString();
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = 88;
LABEL_69:
        v49 = *(void **)&a1[v38];
        *(_QWORD *)&a1[v38] = v37;

        goto LABEL_106;
      case 0xFu:
        v50 = 0;
        v51 = 0;
        v22 = 0;
        a1[*(int *)(v7 + 2720)] |= 4u;
        while (2)
        {
          v52 = *v3;
          v53 = *(_QWORD *)(a2 + v52);
          if (v53 == -1 || v53 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v54 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v53);
            *(_QWORD *)(a2 + v52) = v53 + 1;
            v22 |= (unint64_t)(v54 & 0x7F) << v50;
            if (v54 < 0)
            {
              v50 += 7;
              v16 = v51++ >= 9;
              if (v16)
              {
                v22 = 0;
                goto LABEL_99;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v22 = 0;
LABEL_99:
        v60 = 48;
LABEL_100:
        *(_QWORD *)&a1[v60] = v22;
        goto LABEL_106;
      case 0x10u:
        v55 = 0;
        v56 = 0;
        v28 = 0;
        a1[*(int *)(v7 + 2720)] |= 8u;
        while (2)
        {
          v57 = *v3;
          v58 = *(_QWORD *)(a2 + v57);
          if (v58 == -1 || v58 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v59 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v58);
            *(_QWORD *)(a2 + v57) = v58 + 1;
            v28 |= (unint64_t)(v59 & 0x7F) << v55;
            if (v59 < 0)
            {
              v55 += 7;
              v16 = v56++ >= 9;
              if (v16)
              {
                LODWORD(v28) = 0;
                goto LABEL_104;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v28) = 0;
LABEL_104:
        v61 = 56;
LABEL_105:
        *(_DWORD *)&a1[v61] = v28;
        goto LABEL_106;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_106;
    }
  }
}

uint64_t ABCPbSummarySubmitRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t result;
  ABCPbSummarySignatureRequest *v27;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 44) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_36;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_38;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_36:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_38:
        *(_DWORD *)(a1 + 40) = v19;
        goto LABEL_39;
      case 2u:
        PBReaderReadString();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = 24;
        goto LABEL_29;
      case 3u:
        PBReaderReadString();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = 8;
        goto LABEL_29;
      case 4u:
        PBReaderReadString();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = 16;
LABEL_29:
        v25 = *(void **)(a1 + v24);
        *(_QWORD *)(a1 + v24) = v23;

        goto LABEL_39;
      case 0xAu:
        v27 = objc_alloc_init(ABCPbSummarySignatureRequest);
        objc_msgSend((id)a1, "addSigRequest:", v27);
        if (PBReaderPlaceMark() && (ABCPbSummarySignatureRequestReadFrom((uint64_t)v27, a2) & 1) != 0)
        {
          PBReaderRecallMark();

LABEL_39:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_39;
    }
  }
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

uint64_t OUTLINED_FUNCTION_3()
{
  return objc_opt_class();
}

id OUTLINED_FUNCTION_4(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t AWDSymptomsDiagnosticNotificationTokenReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  void *v24;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        PBReaderReadString();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v23;

      }
      else if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 24) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_31;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            v19 = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          v19 = 0;
LABEL_33:
        *(_QWORD *)(a1 + 8) = v19;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1DBAF7094(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t ABCPbSigGrantRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  ABCPbSigRequest *v27;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 36) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_35;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_37;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_35:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_37:
        *(_DWORD *)(a1 + 32) = v19;
        goto LABEL_38;
      case 5u:
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 16;
        goto LABEL_30;
      case 6u:
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 8;
LABEL_30:
        v26 = *(void **)(a1 + v25);
        *(_QWORD *)(a1 + v25) = v24;

        goto LABEL_38;
      case 0xAu:
        v27 = objc_alloc_init(ABCPbSigRequest);
        objc_msgSend((id)a1, "addSigRequest:", v27);
        if (PBReaderPlaceMark() && (ABCPbSigRequestReadFrom((uint64_t)v27, a2) & 1) != 0)
        {
          PBReaderRecallMark();

LABEL_38:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_38;
    }
  }
}

void sub_1DBB01534(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DBB015A8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DBB01718(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DBB01880(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DBB019E8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DBB02A40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1DBB03E04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DBB04DC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_1DBB0553C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

id load_embedded_xml_plist(const char *a1)
{
  NSObject *v2;
  uint8_t *v3;
  unint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  id v17;
  uint64_t v18;
  id v19;
  unint64_t size;
  uint8_t buf[4];
  unint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  size = 0;
  if (!a1 || !*a1)
  {
    configurationLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v22 = (unint64_t)a1;
      v12 = "Will NOT load embedded configuration. Invalid identifier: %s";
      v13 = v6;
      v14 = OS_LOG_TYPE_DEFAULT;
LABEL_19:
      v15 = 12;
LABEL_20:
      _os_log_impl(&dword_1DBAE1000, v13, v14, v12, buf, v15);
    }
LABEL_21:
    v8 = 0;
    v9 = 0;
    v10 = 0;
    goto LABEL_22;
  }
  configurationLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v22 = (unint64_t)a1;
    _os_log_impl(&dword_1DBAE1000, v2, OS_LOG_TYPE_INFO, "Loading embedded configuration with identifier: %s", buf, 0xCu);
  }

  v3 = getsectiondata((const mach_header_64 *)&dword_1DBAE1000, "__TEXT", a1, &size);
  v4 = size;
  configurationLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v3 || !v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v22 = (unint64_t)a1;
      v12 = "Unable to get section data for identifier: %s";
      v13 = v6;
      v14 = OS_LOG_TYPE_ERROR;
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v22 = size;
    _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_DEBUG, "Found embedded configuration data of size %lu", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v3, size, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    configurationLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    *(_WORD *)buf = 0;
    v12 = "Failed to create NSData from embedded section data";
    v13 = v6;
    v14 = OS_LOG_TYPE_ERROR;
    v15 = 2;
    goto LABEL_20;
  }
  v8 = (void *)v7;
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v7, 2, 0, &v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v19;
  configurationLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v6 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v22 = (unint64_t)a1;
      _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_DEFAULT, "Successfully loaded embedded configuration plist with identifier: %s", buf, 0xCu);
    }

    configurationLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v22 = (unint64_t)v9;
      _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_DEBUG, "Configuration plist is %@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "description");
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v18 = objc_msgSend(v17, "UTF8String");
      *(_DWORD *)buf = 136315138;
      v22 = v18;
      _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_ERROR, "Failed to serialize configuration data into plist: %s", buf, 0xCu);

    }
    v9 = 0;
  }
LABEL_22:

  return v9;
}

id iso8601date_string_from_NSDate(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  v2 = v1;
  if (iso8601date_string_from_NSDate_sharedInstancePred != -1)
  {
    dispatch_once(&iso8601date_string_from_NSDate_sharedInstancePred, &__block_literal_global_3);
    if (v2)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    goto LABEL_6;
  }
  if (!v1)
    goto LABEL_5;
LABEL_3:
  objc_msgSend((id)iso8601date_string_from_NSDate_iso8601DateFormatter, "stringFromDate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v3;
}

id formattedDateStringForTimeInterval(double a1)
{
  tm *v2;
  void *v3;
  NSObject *v5;
  const char *v6;
  time_t v7;
  uint8_t buf[4];
  time_t v9;
  char v10[8];
  uint64_t v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)v10 = 0;
  v11 = 0;
  v13 = 0;
  v12 = 0;
  v7 = (uint64_t)a1;
  if ((uint64_t)a1 <= 0)
  {
    time(&v7);
    if (v7 < 1)
    {
      basicLogHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v9 = *(_QWORD *)&a1;
        v6 = "formattedDateStringForTimeInterval: Invalid timestamp of %.3lf (did the call to time() fail?)";
LABEL_10:
        _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEBUG, v6, buf, 0xCu);
      }
LABEL_11:

      v3 = 0;
      return v3;
    }
  }
  v2 = localtime(&v7);
  if (!strftime(v10, 0x1AuLL, "%Y-%m-%d %H:%M:%S %z", v2))
  {
    basicLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v9 = v7;
      v6 = "formattedDateStringForTimeInterval: Failed strftime with '%ld'";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  return v3;
}

id sanitizedJSONDictionary(void *a1, char a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  char v10;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a1;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __sanitizedJSONDictionary_block_invoke;
  v8[3] = &unk_1EA3B52D0;
  v6 = v5;
  v9 = v6;
  v10 = a2;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

  return v6;
}

void __sanitizedJSONDictionary_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  char isKindOfClass;
  int v12;
  NSObject *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);
      goto LABEL_9;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      sanitizedJSONDictionary(v6, *(unsigned __int8 *)(a1 + 40));
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v12 = *(unsigned __int8 *)(a1 + 40);
      if ((isKindOfClass & 1) != 0)
      {
        sanitizedJSONArray(v6, v12 != 0);
        v10 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        basicLogHandle();
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (!v12)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v17 = (objc_class *)objc_opt_class();
            NSStringFromClass(v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = 138412802;
            v20 = v18;
            v21 = 2112;
            v22 = v5;
            v23 = 2112;
            v24 = v6;
            _os_log_impl(&dword_1DBAE1000, v14, OS_LOG_TYPE_DEFAULT, "Discarding JSON incompatible dictionary object of class %@ for key %@: %@", (uint8_t *)&v19, 0x20u);

          }
          goto LABEL_21;
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v15 = (objc_class *)objc_opt_class();
          NSStringFromClass(v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 138412802;
          v20 = v5;
          v21 = 2112;
          v22 = v16;
          v23 = 2112;
          v24 = v6;
          _os_log_impl(&dword_1DBAE1000, v14, OS_LOG_TYPE_INFO, "Detected JSON incompatible dictionary value (for key %@) of class %@: %@", (uint8_t *)&v19, 0x20u);

        }
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          v14 = &stru_1EA3B8F58;
          goto LABEL_20;
        }
        objc_msgSend(v6, "description");
        v10 = objc_claimAutoreleasedReturnValue();
      }
    }
    v14 = v10;
LABEL_20:
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v14, v5);
LABEL_21:

    goto LABEL_9;
  }
  basicLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412546;
    v20 = v9;
    v21 = 2112;
    v22 = v5;
    _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_DEFAULT, "Discarding JSON incompatible dictionary key of class %@: %@", (uint8_t *)&v19, 0x16u);

  }
LABEL_9:

}

id sanitizedJSONArray(void *a1, char a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  char v10;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a1;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __sanitizedJSONArray_block_invoke;
  v8[3] = &unk_1EA3B52F8;
  v6 = v5;
  v9 = v6;
  v10 = a2;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  return v6;
}

void __sanitizedJSONArray_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    sanitizedJSONDictionary(v3, *(unsigned __int8 *)(a1 + 40));
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_15:
    v8 = (void *)v4;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    sanitizedJSONArray(v3, *(unsigned __int8 *)(a1 + 40) != 0);
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (*(_BYTE *)(a1 + 40))
  {
    symptomsLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v7;
      v14 = 2112;
      v15 = v3;
      _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_INFO, "Detected JSON incompatible array value of class %@: %@", (uint8_t *)&v12, 0x16u);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v3, "description");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
  }
  else
  {
    basicLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v11;
      v14 = 2112;
      v15 = v3;
      _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_DEFAULT, "Discarding JSON incompatible array object of class %@: %@", (uint8_t *)&v12, 0x16u);

    }
  }
LABEL_5:

}

id sanitizedJSONCollectionObject(void *a1, char a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    sanitizedJSONDictionary(v3, a2);
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v5 = (void *)v4;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    sanitizedJSONArray(v3, a2);
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  symptomsLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_ERROR, "JSON Object Sanitizer: %@ is not a collections class! JSON requires the root object to be a dictionary or array. %@", (uint8_t *)&v10, 0x16u);

  }
  v5 = 0;
LABEL_9:

  return v5;
}

void sub_1DBB06C3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_1DBB074DC(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 184));
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1DBB07740(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DBB0820C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL ABCPbSigConfigReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
          goto LABEL_25;
        case 2u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
          goto LABEL_25;
        case 3u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
          goto LABEL_25;
        case 4u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
LABEL_25:
          v19 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          goto LABEL_26;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            return 0;
LABEL_26:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          break;
      }
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1DBB0C93C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DBB0E86C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

uint64_t ABCPbSummarySignatureRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  unint64_t v7;
  unint64_t v8;
  int *v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  BOOL v17;
  int v18;
  uint64_t v20;
  uint64_t v21;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  void *v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  uint64_t result;
  unint64_t v43;
  unint64_t v44;
  ABCPbSummaryAttachmentRequest *v45;
  uint64_t v46;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = 0x1F0306000uLL;
  v8 = 0x1F0306000uLL;
  v9 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    while (1)
    {
      v13 = *v3;
      v14 = *(_QWORD *)(a2 + v13);
      v15 = v14 + 1;
      if (v14 == -1 || v15 > *(_QWORD *)(a2 + *v4))
        break;
      v16 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v14);
      *(_QWORD *)(a2 + v13) = v15;
      v12 |= (unint64_t)(v16 & 0x7F) << v10;
      if ((v16 & 0x80) == 0)
        goto LABEL_12;
      v10 += 7;
      v17 = v11++ >= 9;
      if (v17)
      {
        v12 = 0;
        v18 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v18 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v12 = 0;
LABEL_14:
    if (v18 || (v12 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v12 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = *(int *)(v7 + 3248);
        goto LABEL_47;
      case 2u:
        PBReaderReadString();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = *(int *)(v8 + 3252);
        goto LABEL_47;
      case 3u:
        PBReaderReadString();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = 136;
        goto LABEL_47;
      case 4u:
        PBReaderReadString();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = 144;
        goto LABEL_47;
      case 5u:
        PBReaderReadString();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = 88;
        goto LABEL_47;
      case 6u:
        PBReaderReadString();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = 128;
        goto LABEL_47;
      case 7u:
        PBReaderReadString();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = 32;
        goto LABEL_47;
      case 8u:
        PBReaderReadString();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = 40;
        goto LABEL_47;
      case 9u:
        PBReaderReadString();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = 80;
        goto LABEL_47;
      case 0xAu:
        v22 = 0;
        v23 = 0;
        v24 = 0;
        *(_BYTE *)(a1 + 164) |= 4u;
        while (2)
        {
          v25 = *v3;
          v26 = *(_QWORD *)(a2 + v25);
          v27 = v26 + 1;
          if (v26 == -1 || v27 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v26);
            *(_QWORD *)(a2 + v25) = v27;
            v24 |= (unint64_t)(v28 & 0x7F) << v22;
            if (v28 < 0)
            {
              v22 += 7;
              v17 = v23++ >= 9;
              if (v17)
              {
                LODWORD(v24) = 0;
                goto LABEL_65;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v24) = 0;
LABEL_65:
        *(_DWORD *)(a1 + 120) = v24;
        goto LABEL_48;
      case 0xBu:
        *(_BYTE *)(a1 + 164) |= 1u;
        v29 = *v3;
        v30 = *(_QWORD *)(a2 + v29);
        if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v31 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v30);
          *(_QWORD *)(a2 + v29) = v30 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v31 = 0;
        }
        v46 = 8;
        goto LABEL_74;
      case 0xCu:
        PBReaderReadString();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = 48;
        goto LABEL_47;
      case 0xDu:
        *(_BYTE *)(a1 + 164) |= 2u;
        v32 = *v3;
        v33 = *(_QWORD *)(a2 + v32);
        if (v33 <= 0xFFFFFFFFFFFFFFF7 && v33 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v31 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v33);
          *(_QWORD *)(a2 + v32) = v33 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v31 = 0;
        }
        v46 = 16;
LABEL_74:
        *(_QWORD *)(a1 + v46) = v31;
        goto LABEL_48;
      case 0xEu:
        PBReaderReadString();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = 56;
        goto LABEL_47;
      case 0xFu:
        PBReaderReadString();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = 64;
        goto LABEL_47;
      case 0x10u:
        PBReaderReadString();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = 72;
        goto LABEL_47;
      case 0x11u:
        PBReaderReadString();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = 96;
        goto LABEL_47;
      case 0x12u:
        PBReaderReadString();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = 104;
LABEL_47:
        v34 = *(void **)(a1 + v21);
        *(_QWORD *)(a1 + v21) = v20;

        goto LABEL_48;
      case 0x13u:
        v35 = 0;
        v36 = 0;
        v37 = 0;
        *(_BYTE *)(a1 + 164) |= 8u;
        while (2)
        {
          v38 = *v3;
          v39 = *(_QWORD *)(a2 + v38);
          v40 = v39 + 1;
          if (v39 == -1 || v40 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v41 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v39);
            *(_QWORD *)(a2 + v38) = v40;
            v37 |= (unint64_t)(v41 & 0x7F) << v35;
            if (v41 < 0)
            {
              v35 += 7;
              v17 = v36++ >= 9;
              if (v17)
              {
                v37 = 0;
                goto LABEL_69;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v37 = 0;
LABEL_69:
        *(_BYTE *)(a1 + 160) = v37 != 0;
        goto LABEL_48;
      case 0x1Eu:
        v43 = v8;
        v44 = v7;
        v45 = objc_alloc_init(ABCPbSummaryAttachmentRequest);
        objc_msgSend((id)a1, "addAttachments:", v45);
        if (PBReaderPlaceMark() && (ABCPbSummaryAttachmentRequestReadFrom((uint64_t)v45, a2) & 1) != 0)
        {
          PBReaderRecallMark();

          v7 = v44;
          v8 = v43;
LABEL_48:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_48;
    }
  }
}

void sub_1DBB11B28(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1DBB12980(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_1DBB18E70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  _Block_object_dispose(&a53, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_1DBB1B8D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void _settingsChanged(uint64_t a1, void *a2, const __CFString *a3)
{
  id v4;
  CFComparisonResult v5;
  NSObject *v6;
  CFPropertyListRef *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v4 = a2;
  v5 = CFStringCompare(a3, CFSTR("com.apple.autobugcapture.UserConsentYES"), 0);
  if (v5 == kCFCompareEqualTo)
  {
    configurationLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_DEFAULT, "Auto Bug Capture is explicitly set to ON", buf, 2u);
    }
    v7 = (CFPropertyListRef *)MEMORY[0x1E0C9AE50];
    goto LABEL_9;
  }
  if (CFStringCompare(a3, CFSTR("com.apple.autobugcapture.UserConsentNO"), 0) == kCFCompareEqualTo)
  {
    configurationLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_DEFAULT, "Auto Bug Capture is explicitly set to OFF", v8, 2u);
    }
    v7 = (CFPropertyListRef *)MEMORY[0x1E0C9AE40];
LABEL_9:

    CFPreferencesSetValue(CFSTR("ABCUserConsent"), *v7, CFSTR("com.apple.symptomsd-diag"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
    CFPreferencesAppSynchronize(CFSTR("com.apple.symptomsd-diag"));
    objc_msgSend(v4, "setAbcUIUserConsent:", v5 == kCFCompareEqualTo);
    objc_msgSend(v4, "setABCUserConsent:", objc_msgSend(v4, "abcUIUserConsent"));
  }

}

void sub_1DBB1D240(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1DBB1D2FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1DBB1D3DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DBB1D4C4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DBB21734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_1DBB21BC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DBB22F28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1DBB2358C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1DBB24698(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_1DBB253A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DBB2593C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DBB2831C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1DBB2B0A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DBB2CCF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1DBB2D5F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ABCPbSigConfigWhitelistReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t result;
  ABCPbSigConfig *v27;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 48) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_36;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_38;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_36:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_38:
        *(_DWORD *)(a1 + 32) = v19;
        goto LABEL_39;
      case 2u:
        PBReaderReadString();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = 8;
        goto LABEL_29;
      case 3u:
        PBReaderReadString();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = 16;
        goto LABEL_29;
      case 4u:
        PBReaderReadString();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = 24;
LABEL_29:
        v25 = *(void **)(a1 + v24);
        *(_QWORD *)(a1 + v24) = v23;

        goto LABEL_39;
      case 0xAu:
        v27 = objc_alloc_init(ABCPbSigConfig);
        objc_msgSend((id)a1, "addSigConfig:", v27);
        if (PBReaderPlaceMark() && ABCPbSigConfigReadFrom((uint64_t)v27, a2))
        {
          PBReaderRecallMark();

LABEL_39:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_39;
    }
  }
}

uint64_t ABCPbSummaryAttachmentRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  void *v18;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        v19 = 0;
        v20 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + 20) |= 1u;
        while (1)
        {
          v22 = *v3;
          v23 = *(_QWORD *)(a2 + v22);
          if (v23 == -1 || v23 >= *(_QWORD *)(a2 + *v4))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
          *(_QWORD *)(a2 + v22) = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0)
            goto LABEL_31;
          v19 += 7;
          v14 = v20++ >= 9;
          if (v14)
          {
            LODWORD(v21) = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_33:
        *(_DWORD *)(a1 + 16) = v21;
      }
      else if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v17;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1DBB32738(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1DBB32A58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  void *v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  objc_sync_exit(v13);
  _Unwind_Resume(a1);
}

void sub_1DBB3428C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DBB3448C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ABCPbSigRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  void *v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 40;
          goto LABEL_30;
        case 2u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 80;
          goto LABEL_30;
        case 3u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 64;
          goto LABEL_30;
        case 4u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 72;
          goto LABEL_30;
        case 5u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
          goto LABEL_30;
        case 6u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 56;
          goto LABEL_30;
        case 7u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
          goto LABEL_30;
        case 8u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
          goto LABEL_30;
        case 9u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
LABEL_30:
          v20 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        case 0xAu:
          v21 = 0;
          v22 = 0;
          v23 = 0;
          *(_BYTE *)(a1 + 88) |= 1u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v24 = *v3;
        v25 = *(_QWORD *)(a2 + v24);
        if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v4))
          break;
        v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
        *(_QWORD *)(a2 + v24) = v25 + 1;
        v23 |= (unint64_t)(v26 & 0x7F) << v21;
        if ((v26 & 0x80) == 0)
          goto LABEL_41;
        v21 += 7;
        v14 = v22++ >= 9;
        if (v14)
        {
          LODWORD(v23) = 0;
          goto LABEL_43;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_41:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v23) = 0;
LABEL_43:
      *(_DWORD *)(a1 + 48) = v23;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

const __CFString *diagnosticErrorStringForCode(unsigned int a1)
{
  if (a1 > 0x29)
    return CFSTR("Unknown error code");
  else
    return off_1EA3B6BC0[a1];
}

id responseDict(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_alloc(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithObjectsAndKeys:", v13, CFSTR("success"), v14, CFSTR("reason"), 0);

  if (objc_msgSend(v9, "count"))
    objc_msgSend(v15, "addEntriesFromDictionary:", v9);
  if (objc_msgSend(v10, "length"))
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v10, CFSTR("session"));
  if (objc_msgSend(v11, "length"))
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v11, CFSTR("groupID"));
  if ((a2 & 0x8000000000000000) == 0)
  {
    diagnosticErrorStringForCode(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("reasonStr"));

  }
  return v15;
}

void sub_1DBB39C50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ABCPbSigGrantResponseReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  ABCPbSigResponse *v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((int)(v10 >> 3) > 9)
      {
        if ((_DWORD)v17 == 10)
        {
          v20 = objc_alloc_init(ABCPbSigResponse);
          objc_msgSend((id)a1, "addSigResponse:", v20);
          if (!PBReaderPlaceMark() || (ABCPbSigResponseReadFrom((uint64_t)v20, a2) & 1) == 0)
          {
LABEL_45:

            return 0;
          }
        }
        else
        {
          if ((_DWORD)v17 != 11)
          {
LABEL_37:
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
            continue;
          }
          v20 = objc_alloc_init(ABCPbSigConfigWhitelist);
          objc_storeStrong((id *)(a1 + 16), v20);
          if (!PBReaderPlaceMark() || (ABCPbSigConfigWhitelistReadFrom((uint64_t)v20, a2) & 1) == 0)
            goto LABEL_45;
        }
        PBReaderRecallMark();

      }
      else if ((_DWORD)v17 == 1)
      {
        v21 = 0;
        v22 = 0;
        v23 = 0;
        *(_BYTE *)(a1 + 40) |= 1u;
        while (1)
        {
          v24 = *v3;
          v25 = *(_QWORD *)(a2 + v24);
          if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v4))
            break;
          v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
          *(_QWORD *)(a2 + v24) = v25 + 1;
          v23 |= (unint64_t)(v26 & 0x7F) << v21;
          if ((v26 & 0x80) == 0)
            goto LABEL_40;
          v21 += 7;
          v14 = v22++ >= 9;
          if (v14)
          {
            LODWORD(v23) = 0;
            goto LABEL_42;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_40:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v23) = 0;
LABEL_42:
        *(_DWORD *)(a1 + 8) = v23;
      }
      else
      {
        if ((_DWORD)v17 != 2)
          goto LABEL_37;
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = *(void **)(a1 + 32);
        *(_QWORD *)(a1 + 32) = v18;

      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1DBB3EAE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DBB3ECDC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DBB3F840(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DBB41268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DBB41618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void __symptomsLogHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.symptomsd-diag", "symptoms");
  v1 = (void *)symptomsLogHandle_symptomsHandle;
  symptomsLogHandle_symptomsHandle = (uint64_t)v0;

}

id basicLogHandle()
{
  if (basicLogHandle_basicPred != -1)
    dispatch_once(&basicLogHandle_basicPred, &__block_literal_global_3);
  return (id)basicLogHandle_basicHandle;
}

void __basicLogHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.symptomsd-diag", "basic");
  v1 = (void *)basicLogHandle_basicHandle;
  basicLogHandle_basicHandle = (uint64_t)v0;

}

void __adminLogHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.symptomsd-diag", "admin");
  v1 = (void *)adminLogHandle_adminHandle;
  adminLogHandle_adminHandle = (uint64_t)v0;

}

void __xpcLogHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.symptomsd-diag", "xpc");
  v1 = (void *)xpcLogHandle_xpcHandle;
  xpcLogHandle_xpcHandle = (uint64_t)v0;

}

id diagextLogHandle()
{
  if (diagextLogHandle_diagextPred != -1)
    dispatch_once(&diagextLogHandle_diagextPred, &__block_literal_global_9);
  return (id)diagextLogHandle_diagextHandle;
}

void __diagextLogHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.symptomsd-diag", "diagnosticExtensions");
  v1 = (void *)diagextLogHandle_diagextHandle;
  diagextLogHandle_diagextHandle = (uint64_t)v0;

}

id diagcollectLogHandle()
{
  if (diagcollectLogHandle_diagcollectPred != -1)
    dispatch_once(&diagcollectLogHandle_diagcollectPred, &__block_literal_global_11);
  return (id)diagcollectLogHandle_diagcollectHandle;
}

void __diagcollectLogHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.symptomsd-diag", "diagnosticCollection");
  v1 = (void *)diagcollectLogHandle_diagcollectHandle;
  diagcollectLogHandle_diagcollectHandle = (uint64_t)v0;

}

id diagreportLogHandle()
{
  if (diagreportLogHandle_diagreportPred != -1)
    dispatch_once(&diagreportLogHandle_diagreportPred, &__block_literal_global_13);
  return (id)diagreportLogHandle_diagreportHandle;
}

void __diagreportLogHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.symptomsd-diag", "diagnosticReports");
  v1 = (void *)diagreportLogHandle_diagreportHandle;
  diagreportLogHandle_diagreportHandle = (uint64_t)v0;

}

id diagcaseLogHandle()
{
  if (diagcaseLogHandle_diagcasePred != -1)
    dispatch_once(&diagcaseLogHandle_diagcasePred, &__block_literal_global_15);
  return (id)diagcaseLogHandle_diagcaseHandle;
}

void __diagcaseLogHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.symptomsd-diag", "diagnosticCase");
  v1 = (void *)diagcaseLogHandle_diagcaseHandle;
  diagcaseLogHandle_diagcaseHandle = (uint64_t)v0;

}

id casemanagementLogHandle()
{
  if (casemanagementLogHandle_casemanagementPred != -1)
    dispatch_once(&casemanagementLogHandle_casemanagementPred, &__block_literal_global_17);
  return (id)casemanagementLogHandle_casemanagementHandle;
}

void __casemanagementLogHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.symptomsd-diag", "caseManagement");
  v1 = (void *)casemanagementLogHandle_casemanagementHandle;
  casemanagementLogHandle_casemanagementHandle = (uint64_t)v0;

}

id archiverLogHandle()
{
  if (archiverLogHandle_archiverPred != -1)
    dispatch_once(&archiverLogHandle_archiverPred, &__block_literal_global_19);
  return (id)archiverLogHandle_archiverHandle;
}

void __archiverLogHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.symptomsd-diag", "archiver");
  v1 = (void *)archiverLogHandle_archiverHandle;
  archiverLogHandle_archiverHandle = (uint64_t)v0;

}

id storageLogHandle()
{
  if (storageLogHandle_storagePred != -1)
    dispatch_once(&storageLogHandle_storagePred, &__block_literal_global_21);
  return (id)storageLogHandle_storageHandle;
}

void __storageLogHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.symptomsd-diag", "storage");
  v1 = (void *)storageLogHandle_storageHandle;
  storageLogHandle_storageHandle = (uint64_t)v0;

}

void __configurationLogHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.symptomsd-diag", "configuration");
  v1 = (void *)configurationLogHandle_configurationHandle;
  configurationLogHandle_configurationHandle = (uint64_t)v0;

}

id analyticsLogHandle()
{
  if (analyticsLogHandle_analyticsPred != -1)
    dispatch_once(&analyticsLogHandle_analyticsPred, &__block_literal_global_25);
  return (id)analyticsLogHandle_analyticsHandle;
}

void __analyticsLogHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.symptomsd-diag", "analytics");
  v1 = (void *)analyticsLogHandle_analyticsHandle;
  analyticsLogHandle_analyticsHandle = (uint64_t)v0;

}

id uploadLogHandle()
{
  if (uploadLogHandle_uploadPred != -1)
    dispatch_once(&uploadLogHandle_uploadPred, &__block_literal_global_27);
  return (id)uploadLogHandle_uploadHandle;
}

void __uploadLogHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.symptomsd-diag", "upload");
  v1 = (void *)uploadLogHandle_uploadHandle;
  uploadLogHandle_uploadHandle = (uint64_t)v0;

}

id summaryLogHandle()
{
  if (summaryLogHandle_summaryPred != -1)
    dispatch_once(&summaryLogHandle_summaryPred, &__block_literal_global_29);
  return (id)summaryLogHandle_summaryHandle;
}

void __summaryLogHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.symptomsd-diag", "summary");
  v1 = (void *)summaryLogHandle_summaryHandle;
  summaryLogHandle_summaryHandle = (uint64_t)v0;

}

id liaisonLogHandle()
{
  if (liaisonLogHandle_liaisonPred != -1)
    dispatch_once(&liaisonLogHandle_liaisonPred, &__block_literal_global_31);
  return (id)liaisonLogHandle_liaisonHandle;
}

void __liaisonLogHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.symptomsd-diag", "liaison");
  v1 = (void *)liaisonLogHandle_liaisonHandle;
  liaisonLogHandle_liaisonHandle = (uint64_t)v0;

}

id homekitLogHandle()
{
  if (homekitLogHandle_homekitPred != -1)
    dispatch_once(&homekitLogHandle_homekitPred, &__block_literal_global_33);
  return (id)homekitLogHandle_homekitHandle;
}

void __homekitLogHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.symptomsd-diag", "homekit");
  v1 = (void *)homekitLogHandle_homekitHandle;
  homekitLogHandle_homekitHandle = (uint64_t)v0;

}

id crossdeviceLogHandle()
{
  if (crossdeviceLogHandle_crossdevicePred != -1)
    dispatch_once(&crossdeviceLogHandle_crossdevicePred, &__block_literal_global_35);
  return (id)crossdeviceLogHandle_crossdeviceHandle;
}

void __crossdeviceLogHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.symptomsd-diag", "crossdevice");
  v1 = (void *)crossdeviceLogHandle_crossdeviceHandle;
  crossdeviceLogHandle_crossdeviceHandle = (uint64_t)v0;

}

id persistenceLogHandle()
{
  if (persistenceLogHandle_persistencePred != -1)
    dispatch_once(&persistenceLogHandle_persistencePred, &__block_literal_global_37);
  return (id)persistenceLogHandle_persistenceHandle;
}

void __persistenceLogHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.symptomsd-diag", "persistence");
  v1 = (void *)persistenceLogHandle_persistenceHandle;
  persistenceLogHandle_persistenceHandle = (uint64_t)v0;

}

uint64_t AWDSymptomsDiagnosticRemoteUploadReadFrom(_QWORD *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  unint64_t v7;
  unint64_t v8;
  int *v9;
  unint64_t v10;
  char v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  BOOL v17;
  int v18;
  int v19;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  uint64_t v37;
  void *v38;
  char v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  char v45;
  unsigned int v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  char v50;
  unsigned int v51;
  uint64_t v52;
  unint64_t v53;
  char v54;
  char v55;
  unsigned int v56;
  uint64_t v57;
  unint64_t v58;
  char v59;
  char v60;
  unsigned int v61;
  uint64_t v62;
  unint64_t v63;
  char v64;
  char v65;
  unsigned int v66;
  uint64_t v67;
  unint64_t v68;
  char v69;
  char v70;
  unsigned int v71;
  uint64_t v72;
  unint64_t v73;
  char v74;
  char v75;
  unsigned int v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  char v80;
  char v81;
  unsigned int v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  char v86;
  char v87;
  unsigned int v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  char v92;
  char v93;
  unsigned int v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  char v98;
  unint64_t v99;
  unint64_t v100;
  unint64_t v101;
  void *v102;
  char v103;
  unsigned int v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  char v108;
  char v109;
  unsigned int v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t v113;
  char v114;
  uint64_t v115;
  uint64_t v116;
  char v117;
  unsigned int v118;
  uint64_t v119;
  uint64_t v120;
  unint64_t v121;
  char v122;
  char v123;
  unsigned int v124;
  uint64_t v125;
  uint64_t v126;
  unint64_t v127;
  char v128;
  char v129;
  unsigned int v130;
  uint64_t v131;
  uint64_t v132;
  unint64_t v133;
  char v134;
  char v135;
  unsigned int v136;
  uint64_t v137;
  uint64_t v138;
  unint64_t v139;
  char v140;
  char v141;
  unsigned int v142;
  uint64_t v143;
  uint64_t v144;
  unint64_t v145;
  char v146;
  char v147;
  unsigned int v148;
  uint64_t v149;
  uint64_t v150;
  unint64_t v151;
  char v152;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = 0x1F0306000uLL;
    v8 = 0x1F0306000uLL;
    v9 = (int *)MEMORY[0x1E0D82BB8];
    v10 = 0x1F0306000uLL;
    while (2)
    {
      if (!*(_BYTE *)(a2 + *v5))
      {
        v11 = 0;
        v12 = 0;
        v13 = 0;
        while (1)
        {
          v14 = *v3;
          v15 = *(_QWORD *)(a2 + v14);
          if (v15 == -1 || v15 >= *(_QWORD *)(a2 + *v4))
            break;
          v16 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v15);
          *(_QWORD *)(a2 + v14) = v15 + 1;
          v13 |= (unint64_t)(v16 & 0x7F) << v11;
          if ((v16 & 0x80) == 0)
            goto LABEL_12;
          v11 += 7;
          v17 = v12++ >= 9;
          if (v17)
          {
            v13 = 0;
            v18 = *(unsigned __int8 *)(a2 + *v5);
            goto LABEL_14;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
        v18 = *(unsigned __int8 *)(a2 + *v5);
        if (*(_BYTE *)(a2 + *v5))
          v13 = 0;
LABEL_14:
        v19 = v13 & 7;
        if (!v18 && v19 != 4)
        {
          switch((v13 >> 3))
          {
            case 1u:
              v21 = 0;
              v22 = 0;
              v23 = 0;
              *(_WORD *)((char *)a1 + *(int *)(v7 + 4052)) |= 8u;
              while (1)
              {
                v24 = *v3;
                v25 = *(_QWORD *)(a2 + v24);
                if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v4))
                  break;
                v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v25);
                *(_QWORD *)(a2 + v24) = v25 + 1;
                v23 |= (unint64_t)(v26 & 0x7F) << v21;
                if ((v26 & 0x80) == 0)
                  goto LABEL_175;
                v21 += 7;
                v17 = v22++ >= 9;
                if (v17)
                {
                  v23 = 0;
                  goto LABEL_177;
                }
              }
              *(_BYTE *)(a2 + *v5) = 1;
LABEL_175:
              if (*(_BYTE *)(a2 + *v5))
                v23 = 0;
LABEL_177:
              v115 = *(int *)(v8 + 4056);
              goto LABEL_194;
            case 2u:
              v27 = 0;
              v28 = 0;
              v23 = 0;
              *(_WORD *)((char *)a1 + *(int *)(v7 + 4052)) |= 2u;
              while (2)
              {
                v29 = *v3;
                v30 = *(_QWORD *)(a2 + v29);
                if (v30 == -1 || v30 >= *(_QWORD *)(a2 + *v4))
                {
                  *(_BYTE *)(a2 + *v5) = 1;
                }
                else
                {
                  v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v30);
                  *(_QWORD *)(a2 + v29) = v30 + 1;
                  v23 |= (unint64_t)(v31 & 0x7F) << v27;
                  if (v31 < 0)
                  {
                    v27 += 7;
                    v17 = v28++ >= 9;
                    if (v17)
                    {
                      v23 = 0;
                      goto LABEL_181;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(_BYTE *)(a2 + *v5))
                v23 = 0;
LABEL_181:
              v115 = *(int *)(v10 + 4060);
              goto LABEL_194;
            case 3u:
              v32 = 0;
              v33 = 0;
              v23 = 0;
              *(_WORD *)((char *)a1 + *(int *)(v7 + 4052)) |= 4u;
              while (2)
              {
                v34 = *v3;
                v35 = *(_QWORD *)(a2 + v34);
                if (v35 == -1 || v35 >= *(_QWORD *)(a2 + *v4))
                {
                  *(_BYTE *)(a2 + *v5) = 1;
                }
                else
                {
                  v36 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v35);
                  *(_QWORD *)(a2 + v34) = v35 + 1;
                  v23 |= (unint64_t)(v36 & 0x7F) << v32;
                  if (v36 < 0)
                  {
                    v32 += 7;
                    v17 = v33++ >= 9;
                    if (v17)
                    {
                      v23 = 0;
                      goto LABEL_185;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(_BYTE *)(a2 + *v5))
                v23 = 0;
LABEL_185:
              v115 = 168;
              goto LABEL_194;
            case 4u:
              PBReaderReadString();
              v37 = objc_claimAutoreleasedReturnValue();
              v38 = (void *)a1[23];
              a1[23] = v37;

              goto LABEL_262;
            case 5u:
              v39 = 0;
              v40 = 0;
              v41 = 0;
              *(_WORD *)((char *)a1 + *(int *)(v7 + 4052)) |= 0x80u;
              while (2)
              {
                v42 = *v3;
                v43 = *(_QWORD *)(a2 + v42);
                if (v43 == -1 || v43 >= *(_QWORD *)(a2 + *v4))
                {
                  *(_BYTE *)(a2 + *v5) = 1;
                }
                else
                {
                  v44 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v43);
                  *(_QWORD *)(a2 + v42) = v43 + 1;
                  v41 |= (unint64_t)(v44 & 0x7F) << v39;
                  if (v44 < 0)
                  {
                    v39 += 7;
                    v17 = v40++ >= 9;
                    if (v17)
                    {
                      LODWORD(v41) = 0;
                      goto LABEL_189;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(_BYTE *)(a2 + *v5))
                LODWORD(v41) = 0;
LABEL_189:
              v116 = 204;
              goto LABEL_215;
            case 6u:
              v45 = 0;
              v46 = 0;
              v23 = 0;
              *(_WORD *)((char *)a1 + *(int *)(v7 + 4052)) |= 1u;
              while (2)
              {
                v47 = *v3;
                v48 = *(_QWORD *)(a2 + v47);
                if (v48 == -1 || v48 >= *(_QWORD *)(a2 + *v4))
                {
                  *(_BYTE *)(a2 + *v5) = 1;
                }
                else
                {
                  v49 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v48);
                  *(_QWORD *)(a2 + v47) = v48 + 1;
                  v23 |= (unint64_t)(v49 & 0x7F) << v45;
                  if (v49 < 0)
                  {
                    v45 += 7;
                    v17 = v46++ >= 9;
                    if (v17)
                    {
                      v23 = 0;
                      goto LABEL_193;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(_BYTE *)(a2 + *v5))
                v23 = 0;
LABEL_193:
              v115 = 152;
LABEL_194:
              *(_QWORD *)((char *)a1 + v115) = v23;
              goto LABEL_262;
            case 7u:
              v50 = 0;
              v51 = 0;
              v41 = 0;
              *(_WORD *)((char *)a1 + *(int *)(v7 + 4052)) |= 0x200u;
              while (2)
              {
                v52 = *v3;
                v53 = *(_QWORD *)(a2 + v52);
                if (v53 == -1 || v53 >= *(_QWORD *)(a2 + *v4))
                {
                  *(_BYTE *)(a2 + *v5) = 1;
                }
                else
                {
                  v54 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v53);
                  *(_QWORD *)(a2 + v52) = v53 + 1;
                  v41 |= (unint64_t)(v54 & 0x7F) << v50;
                  if (v54 < 0)
                  {
                    v50 += 7;
                    v17 = v51++ >= 9;
                    if (v17)
                    {
                      LODWORD(v41) = 0;
                      goto LABEL_198;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(_BYTE *)(a2 + *v5))
                LODWORD(v41) = 0;
LABEL_198:
              v116 = 224;
              goto LABEL_215;
            case 8u:
              v55 = 0;
              v56 = 0;
              v41 = 0;
              *(_WORD *)((char *)a1 + *(int *)(v7 + 4052)) |= 0x40u;
              while (2)
              {
                v57 = *v3;
                v58 = *(_QWORD *)(a2 + v57);
                if (v58 == -1 || v58 >= *(_QWORD *)(a2 + *v4))
                {
                  *(_BYTE *)(a2 + *v5) = 1;
                }
                else
                {
                  v59 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v58);
                  *(_QWORD *)(a2 + v57) = v58 + 1;
                  v41 |= (unint64_t)(v59 & 0x7F) << v55;
                  if (v59 < 0)
                  {
                    v55 += 7;
                    v17 = v56++ >= 9;
                    if (v17)
                    {
                      LODWORD(v41) = 0;
                      goto LABEL_202;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(_BYTE *)(a2 + *v5))
                LODWORD(v41) = 0;
LABEL_202:
              v116 = 200;
              goto LABEL_215;
            case 9u:
              v60 = 0;
              v61 = 0;
              v41 = 0;
              *(_WORD *)((char *)a1 + *(int *)(v7 + 4052)) |= 0x10u;
              while (2)
              {
                v62 = *v3;
                v63 = *(_QWORD *)(a2 + v62);
                if (v63 == -1 || v63 >= *(_QWORD *)(a2 + *v4))
                {
                  *(_BYTE *)(a2 + *v5) = 1;
                }
                else
                {
                  v64 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v63);
                  *(_QWORD *)(a2 + v62) = v63 + 1;
                  v41 |= (unint64_t)(v64 & 0x7F) << v60;
                  if (v64 < 0)
                  {
                    v60 += 7;
                    v17 = v61++ >= 9;
                    if (v17)
                    {
                      LODWORD(v41) = 0;
                      goto LABEL_206;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(_BYTE *)(a2 + *v5))
                LODWORD(v41) = 0;
LABEL_206:
              v116 = 192;
              goto LABEL_215;
            case 0xAu:
              v65 = 0;
              v66 = 0;
              v41 = 0;
              *(_WORD *)((char *)a1 + *(int *)(v7 + 4052)) |= 0x100u;
              while (2)
              {
                v67 = *v3;
                v68 = *(_QWORD *)(a2 + v67);
                if (v68 == -1 || v68 >= *(_QWORD *)(a2 + *v4))
                {
                  *(_BYTE *)(a2 + *v5) = 1;
                }
                else
                {
                  v69 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v68);
                  *(_QWORD *)(a2 + v67) = v68 + 1;
                  v41 |= (unint64_t)(v69 & 0x7F) << v65;
                  if (v69 < 0)
                  {
                    v65 += 7;
                    v17 = v66++ >= 9;
                    if (v17)
                    {
                      LODWORD(v41) = 0;
                      goto LABEL_210;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(_BYTE *)(a2 + *v5))
                LODWORD(v41) = 0;
LABEL_210:
              v116 = 208;
              goto LABEL_215;
            case 0xBu:
              v70 = 0;
              v71 = 0;
              v41 = 0;
              *(_WORD *)((char *)a1 + *(int *)(v7 + 4052)) |= 0x20u;
              while (2)
              {
                v72 = *v3;
                v73 = *(_QWORD *)(a2 + v72);
                if (v73 == -1 || v73 >= *(_QWORD *)(a2 + *v4))
                {
                  *(_BYTE *)(a2 + *v5) = 1;
                }
                else
                {
                  v74 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v73);
                  *(_QWORD *)(a2 + v72) = v73 + 1;
                  v41 |= (unint64_t)(v74 & 0x7F) << v70;
                  if (v74 < 0)
                  {
                    v70 += 7;
                    v17 = v71++ >= 9;
                    if (v17)
                    {
                      LODWORD(v41) = 0;
                      goto LABEL_214;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(_BYTE *)(a2 + *v5))
                LODWORD(v41) = 0;
LABEL_214:
              v116 = 196;
LABEL_215:
              *(_DWORD *)((char *)a1 + v116) = v41;
              goto LABEL_262;
            case 0xCu:
              if (v19 != 2)
              {
                v117 = 0;
                v118 = 0;
                v119 = 0;
                while (1)
                {
                  v120 = *v3;
                  v121 = *(_QWORD *)(a2 + v120);
                  if (v121 == -1 || v121 >= *(_QWORD *)(a2 + *v4))
                    goto LABEL_251;
                  v122 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v121);
                  *(_QWORD *)(a2 + v120) = v121 + 1;
                  v119 |= (unint64_t)(v122 & 0x7F) << v117;
                  if (v122 < 0)
                  {
                    v117 += 7;
                    v17 = v118++ >= 9;
                    if (!v17)
                      continue;
                  }
                  goto LABEL_252;
                }
              }
              result = PBReaderPlaceMark();
              if (!(_DWORD)result)
                return result;
              while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
              {
                v75 = 0;
                v76 = 0;
                v77 = 0;
                while (1)
                {
                  v78 = *v3;
                  v79 = *(_QWORD *)(a2 + v78);
                  if (v79 == -1 || v79 >= *(_QWORD *)(a2 + *v4))
                    break;
                  v80 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v79);
                  *(_QWORD *)(a2 + v78) = v79 + 1;
                  v77 |= (unint64_t)(v80 & 0x7F) << v75;
                  if (v80 < 0)
                  {
                    v75 += 7;
                    v17 = v76++ >= 9;
                    if (!v17)
                      continue;
                  }
                  goto LABEL_104;
                }
                *(_BYTE *)(a2 + *v5) = 1;
LABEL_104:
                PBRepeatedInt64Add();
              }
              goto LABEL_173;
            case 0xDu:
              if (v19 != 2)
              {
                v123 = 0;
                v124 = 0;
                v125 = 0;
                while (1)
                {
                  v126 = *v3;
                  v127 = *(_QWORD *)(a2 + v126);
                  if (v127 == -1 || v127 >= *(_QWORD *)(a2 + *v4))
                    goto LABEL_260;
                  v128 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v127);
                  *(_QWORD *)(a2 + v126) = v127 + 1;
                  v125 |= (unint64_t)(v128 & 0x7F) << v123;
                  if (v128 < 0)
                  {
                    v123 += 7;
                    v17 = v124++ >= 9;
                    if (!v17)
                      continue;
                  }
                  goto LABEL_261;
                }
              }
              result = PBReaderPlaceMark();
              if (!(_DWORD)result)
                return result;
              while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
              {
                v81 = 0;
                v82 = 0;
                v83 = 0;
                while (1)
                {
                  v84 = *v3;
                  v85 = *(_QWORD *)(a2 + v84);
                  if (v85 == -1 || v85 >= *(_QWORD *)(a2 + *v4))
                    break;
                  v86 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v85);
                  *(_QWORD *)(a2 + v84) = v85 + 1;
                  v83 |= (unint64_t)(v86 & 0x7F) << v81;
                  if (v86 < 0)
                  {
                    v81 += 7;
                    v17 = v82++ >= 9;
                    if (!v17)
                      continue;
                  }
                  goto LABEL_117;
                }
                *(_BYTE *)(a2 + *v5) = 1;
LABEL_117:
                PBRepeatedInt32Add();
              }
              goto LABEL_173;
            case 0xEu:
              if (v19 != 2)
              {
                v129 = 0;
                v130 = 0;
                v131 = 0;
                while (1)
                {
                  v132 = *v3;
                  v133 = *(_QWORD *)(a2 + v132);
                  if (v133 == -1 || v133 >= *(_QWORD *)(a2 + *v4))
                    goto LABEL_260;
                  v134 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v133);
                  *(_QWORD *)(a2 + v132) = v133 + 1;
                  v131 |= (unint64_t)(v134 & 0x7F) << v129;
                  if (v134 < 0)
                  {
                    v129 += 7;
                    v17 = v130++ >= 9;
                    if (!v17)
                      continue;
                  }
                  goto LABEL_261;
                }
              }
              result = PBReaderPlaceMark();
              if (!(_DWORD)result)
                return result;
              while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
              {
                v87 = 0;
                v88 = 0;
                v89 = 0;
                while (1)
                {
                  v90 = *v3;
                  v91 = *(_QWORD *)(a2 + v90);
                  if (v91 == -1 || v91 >= *(_QWORD *)(a2 + *v4))
                    break;
                  v92 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v91);
                  *(_QWORD *)(a2 + v90) = v91 + 1;
                  v89 |= (unint64_t)(v92 & 0x7F) << v87;
                  if (v92 < 0)
                  {
                    v87 += 7;
                    v17 = v88++ >= 9;
                    if (!v17)
                      continue;
                  }
                  goto LABEL_130;
                }
                *(_BYTE *)(a2 + *v5) = 1;
LABEL_130:
                PBRepeatedInt32Add();
              }
              goto LABEL_173;
            case 0xFu:
              if (v19 != 2)
              {
                v135 = 0;
                v136 = 0;
                v137 = 0;
                while (1)
                {
                  v138 = *v3;
                  v139 = *(_QWORD *)(a2 + v138);
                  if (v139 == -1 || v139 >= *(_QWORD *)(a2 + *v4))
                    goto LABEL_260;
                  v140 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v139);
                  *(_QWORD *)(a2 + v138) = v139 + 1;
                  v137 |= (unint64_t)(v140 & 0x7F) << v135;
                  if (v140 < 0)
                  {
                    v135 += 7;
                    v17 = v136++ >= 9;
                    if (!v17)
                      continue;
                  }
                  goto LABEL_261;
                }
              }
              result = PBReaderPlaceMark();
              if (!(_DWORD)result)
                return result;
              while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
              {
                v93 = 0;
                v94 = 0;
                v95 = 0;
                while (1)
                {
                  v96 = *v3;
                  v97 = *(_QWORD *)(a2 + v96);
                  if (v97 == -1 || v97 >= *(_QWORD *)(a2 + *v4))
                    break;
                  v98 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v97);
                  *(_QWORD *)(a2 + v96) = v97 + 1;
                  v95 |= (unint64_t)(v98 & 0x7F) << v93;
                  if (v98 < 0)
                  {
                    v93 += 7;
                    v17 = v94++ >= 9;
                    if (!v17)
                      continue;
                  }
                  goto LABEL_143;
                }
                *(_BYTE *)(a2 + *v5) = 1;
LABEL_143:
                PBRepeatedInt32Add();
              }
              goto LABEL_173;
            case 0x10u:
              v99 = v10;
              v100 = v7;
              v101 = v8;
              PBReaderReadString();
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              if (v102)
                objc_msgSend(a1, "addTaskErrorDomain:", v102);

              v8 = v101;
              v7 = v100;
              v10 = v99;
              goto LABEL_262;
            case 0x11u:
              if (v19 != 2)
              {
                v141 = 0;
                v142 = 0;
                v143 = 0;
                while (1)
                {
                  v144 = *v3;
                  v145 = *(_QWORD *)(a2 + v144);
                  if (v145 == -1 || v145 >= *(_QWORD *)(a2 + *v4))
                    break;
                  v146 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v145);
                  *(_QWORD *)(a2 + v144) = v145 + 1;
                  v143 |= (unint64_t)(v146 & 0x7F) << v141;
                  if (v146 < 0)
                  {
                    v141 += 7;
                    v17 = v142++ >= 9;
                    if (!v17)
                      continue;
                  }
                  goto LABEL_252;
                }
LABEL_251:
                *(_BYTE *)(a2 + *v5) = 1;
LABEL_252:
                PBRepeatedInt64Add();
                goto LABEL_262;
              }
              result = PBReaderPlaceMark();
              if (!(_DWORD)result)
                return result;
              while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
              {
                v103 = 0;
                v104 = 0;
                v105 = 0;
                while (1)
                {
                  v106 = *v3;
                  v107 = *(_QWORD *)(a2 + v106);
                  if (v107 == -1 || v107 >= *(_QWORD *)(a2 + *v4))
                    break;
                  v108 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v107);
                  *(_QWORD *)(a2 + v106) = v107 + 1;
                  v105 |= (unint64_t)(v108 & 0x7F) << v103;
                  if (v108 < 0)
                  {
                    v103 += 7;
                    v17 = v104++ >= 9;
                    if (!v17)
                      continue;
                  }
                  goto LABEL_159;
                }
                *(_BYTE *)(a2 + *v5) = 1;
LABEL_159:
                PBRepeatedInt64Add();
              }
              goto LABEL_173;
            case 0x12u:
              if (v19 == 2)
              {
                result = PBReaderPlaceMark();
                if (!(_DWORD)result)
                  return result;
                while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
                {
                  v109 = 0;
                  v110 = 0;
                  v111 = 0;
                  while (1)
                  {
                    v112 = *v3;
                    v113 = *(_QWORD *)(a2 + v112);
                    if (v113 == -1 || v113 >= *(_QWORD *)(a2 + *v4))
                      break;
                    v114 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v113);
                    *(_QWORD *)(a2 + v112) = v113 + 1;
                    v111 |= (unint64_t)(v114 & 0x7F) << v109;
                    if (v114 < 0)
                    {
                      v109 += 7;
                      v17 = v110++ >= 9;
                      if (!v17)
                        continue;
                    }
                    goto LABEL_172;
                  }
                  *(_BYTE *)(a2 + *v5) = 1;
LABEL_172:
                  PBRepeatedInt32Add();
                }
LABEL_173:
                PBReaderRecallMark();
              }
              else
              {
                v147 = 0;
                v148 = 0;
                v149 = 0;
                while (1)
                {
                  v150 = *v3;
                  v151 = *(_QWORD *)(a2 + v150);
                  if (v151 == -1 || v151 >= *(_QWORD *)(a2 + *v4))
                    break;
                  v152 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v151);
                  *(_QWORD *)(a2 + v150) = v151 + 1;
                  v149 |= (unint64_t)(v152 & 0x7F) << v147;
                  if (v152 < 0)
                  {
                    v147 += 7;
                    v17 = v148++ >= 9;
                    if (!v17)
                      continue;
                  }
                  goto LABEL_261;
                }
LABEL_260:
                *(_BYTE *)(a2 + *v5) = 1;
LABEL_261:
                PBRepeatedInt32Add();
              }
LABEL_262:
              if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
                return *(_BYTE *)(a2 + *v5) == 0;
              continue;
            default:
              if ((PBReaderSkipValueWithTag() & 1) != 0)
                goto LABEL_262;
              return 0;
          }
        }
      }
      break;
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1DBB4E278(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void sub_1DBB4EEF8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1DBB4FD74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DBB51D54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

char *netdiag_str_array_find(const char **a1, char *__s2)
{
  const char *v3;
  const char **v5;
  const char *v6;

  v3 = *a1;
  if (v3)
  {
    v5 = a1 + 1;
    do
    {
      if (!*v3)
        break;
      if (!strcmp(v3, __s2))
        return __s2;
      v6 = *v5++;
      v3 = v6;
    }
    while (v6);
  }
  return 0;
}

char **netdiag_get_logging_keys(uint64_t *a1)
{
  uint64_t v1;
  char *v2;
  uint64_t v3;

  v1 = gNetDiagLoggingKeysCount;
  if (!gNetDiagLoggingKeysCount)
  {
    v2 = gNetDiagLoggingKeys[0];
    if (gNetDiagLoggingKeys[0])
    {
      v3 = 0;
      while (*v2)
      {
        v1 = v3 + 1;
        v2 = gNetDiagLoggingKeys[++v3];
        if (!v2)
          goto LABEL_9;
      }
      v1 = v3;
    }
    else
    {
      v1 = 0;
    }
LABEL_9:
    gNetDiagLoggingKeysCount = v1;
  }
  if (a1)
    *a1 = v1;
  return gNetDiagLoggingKeys;
}

char **netdiag_get_task_keys(uint64_t *a1)
{
  uint64_t v1;
  char *v2;
  uint64_t v3;

  v1 = gNetDiagTaskKeysCount;
  if (!gNetDiagTaskKeysCount)
  {
    v2 = gNetDiagTaskKeys[0];
    if (gNetDiagTaskKeys[0])
    {
      v3 = 0;
      while (*v2)
      {
        v1 = v3 + 1;
        v2 = gNetDiagTaskKeys[++v3];
        if (!v2)
          goto LABEL_9;
      }
      v1 = v3;
    }
    else
    {
      v1 = 0;
    }
LABEL_9:
    gNetDiagTaskKeysCount = v1;
  }
  if (a1)
    *a1 = v1;
  return gNetDiagTaskKeys;
}

char **netdiag_get_option_keys(uint64_t *a1)
{
  uint64_t v1;
  char *v2;
  uint64_t v3;

  v1 = gNetDiagOptionKeysCount;
  if (!gNetDiagOptionKeysCount)
  {
    v2 = gNetDiagOptionKeys[0];
    if (gNetDiagOptionKeys[0])
    {
      v3 = 0;
      while (*v2)
      {
        v1 = v3 + 1;
        v2 = gNetDiagOptionKeys[++v3];
        if (!v2)
          goto LABEL_9;
      }
      v1 = v3;
    }
    else
    {
      v1 = 0;
    }
LABEL_9:
    gNetDiagOptionKeysCount = v1;
  }
  if (a1)
    *a1 = v1;
  return gNetDiagOptionKeys;
}

const char *netdiag_xpc_type_str(uint64_t a1)
{
  uint64_t v2;
  uint64_t *v3;
  const char *result;
  uint64_t v5;

  v2 = MEMORY[0x1E0C812E0];
  v3 = &qword_1EA3B74B8;
  result = "<XPC_TYPE_UNKNOWN>";
  while (v2 != a1)
  {
    v5 = *v3;
    v3 += 2;
    v2 = v5;
    if (!v5)
      return result;
  }
  return (const char *)*(v3 - 1);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x1E0C98A90](key, value, applicationID, userName, hostName);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0C98AA0](allocator, propertyList, format, options, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

uint64_t CacheDeleteEnumerateRemovedFiles()
{
  return MEMORY[0x1E0D09B60]();
}

uint64_t CacheDeleteInitPurgeMarker()
{
  return MEMORY[0x1E0D09B70]();
}

uint64_t CacheDeleteRegisterInfoCallbacks()
{
  return MEMORY[0x1E0D09B98]();
}

uint64_t CacheDeleteRegisterPurgeNotification()
{
  return MEMORY[0x1E0D09BB0]();
}

uint64_t CacheDeleteSyncDone()
{
  return MEMORY[0x1E0D09BC0]();
}

uint64_t DRSubmitLogs()
{
  return MEMORY[0x1E0D1D220]();
}

uint64_t IDSCopyIDForDevice()
{
  return MEMORY[0x1E0D33DE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1E0DE2B80]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1E0D4E4A0]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

uint64_t OSAWriteLogForSubmission()
{
  return MEMORY[0x1E0D1BD28]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1E0D82C10]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1E0D82C38]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1E0D82C58]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1E0D82C68]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1E0D82C98]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1E0D82CB0]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1E0D82CB8]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1E0D82CC0]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1E0D82CE0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1E0D82D00]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1E0D82D10]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1E0D82D28]();
}

uint64_t PBRepeatedInt32Add()
{
  return MEMORY[0x1E0D82DD8]();
}

uint64_t PBRepeatedInt32Clear()
{
  return MEMORY[0x1E0D82DE0]();
}

uint64_t PBRepeatedInt32Copy()
{
  return MEMORY[0x1E0D82DE8]();
}

uint64_t PBRepeatedInt32Hash()
{
  return MEMORY[0x1E0D82DF0]();
}

uint64_t PBRepeatedInt32IsEqual()
{
  return MEMORY[0x1E0D82DF8]();
}

uint64_t PBRepeatedInt32NSArray()
{
  return MEMORY[0x1E0D82E00]();
}

uint64_t PBRepeatedInt32Set()
{
  return MEMORY[0x1E0D82E08]();
}

uint64_t PBRepeatedInt64Add()
{
  return MEMORY[0x1E0D82E10]();
}

uint64_t PBRepeatedInt64Clear()
{
  return MEMORY[0x1E0D82E18]();
}

uint64_t PBRepeatedInt64Copy()
{
  return MEMORY[0x1E0D82E20]();
}

uint64_t PBRepeatedInt64Hash()
{
  return MEMORY[0x1E0D82E28]();
}

uint64_t PBRepeatedInt64IsEqual()
{
  return MEMORY[0x1E0D82E30]();
}

uint64_t PBRepeatedInt64NSArray()
{
  return MEMORY[0x1E0D82E38]();
}

uint64_t PBRepeatedInt64Set()
{
  return MEMORY[0x1E0D82E40]();
}

uint64_t PBRepeatedUInt64Add()
{
  return MEMORY[0x1E0D82E80]();
}

uint64_t PBRepeatedUInt64Clear()
{
  return MEMORY[0x1E0D82E88]();
}

uint64_t PBRepeatedUInt64Copy()
{
  return MEMORY[0x1E0D82E90]();
}

uint64_t PBRepeatedUInt64Hash()
{
  return MEMORY[0x1E0D82E98]();
}

uint64_t PBRepeatedUInt64IsEqual()
{
  return MEMORY[0x1E0D82EA0]();
}

uint64_t PBRepeatedUInt64NSArray()
{
  return MEMORY[0x1E0D82EA8]();
}

uint64_t PBRepeatedUInt64Set()
{
  return MEMORY[0x1E0D82EB0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1E0C9A0D0]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1E0C9A800]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1E0C9A818]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

uint64_t archive_entry_copy_stat()
{
  return MEMORY[0x1E0DE3DB8]();
}

uint64_t archive_entry_free()
{
  return MEMORY[0x1E0DE3DC8]();
}

uint64_t archive_entry_new()
{
  return MEMORY[0x1E0DE3DD0]();
}

uint64_t archive_entry_set_pathname()
{
  return MEMORY[0x1E0DE3E18]();
}

uint64_t archive_errno()
{
  return MEMORY[0x1E0DE3E58]();
}

uint64_t archive_error_string()
{
  return MEMORY[0x1E0DE3E60]();
}

uint64_t archive_write_add_filter_gzip()
{
  return MEMORY[0x1E0DE3FB0]();
}

uint64_t archive_write_data()
{
  return MEMORY[0x1E0DE3FC8]();
}

uint64_t archive_write_free()
{
  return MEMORY[0x1E0DE4000]();
}

uint64_t archive_write_header()
{
  return MEMORY[0x1E0DE4008]();
}

uint64_t archive_write_new()
{
  return MEMORY[0x1E0DE4010]();
}

uint64_t archive_write_open_filename()
{
  return MEMORY[0x1E0DE4028]();
}

uint64_t archive_write_set_format_pax()
{
  return MEMORY[0x1E0DE4050]();
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1E0C82640](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F48](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

int dlclose(void *__handle)
{
  return MEMORY[0x1E0C83030](__handle);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void endgrent(void)
{
  MEMORY[0x1E0C831C0]();
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83288](__x);
  return result;
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1E0C83528](a1, a2, a3, *(_QWORD *)&a4);
}

gid_t getgid(void)
{
  return MEMORY[0x1E0C83678]();
}

group *__cdecl getgrnam(const char *a1)
{
  return (group *)MEMORY[0x1E0C83690](a1);
}

uint8_t *__cdecl getsectiondata(const mach_header_64 *mhp, const char *segname, const char *sectname, unint64_t *size)
{
  return (uint8_t *)MEMORY[0x1E0C837E0](mhp, segname, sectname, size);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

ssize_t listxattr(const char *path, char *namebuff, size_t size, int options)
{
  return MEMORY[0x1E0C83B88](path, namebuff, size, *(_QWORD *)&options);
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x1E0C83BA8](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

uint64_t os_variant_has_factory_content()
{
  return MEMORY[0x1E0C849E8]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1E0DE8070](property);
}

objc_property_t *__cdecl protocol_copyPropertyList(Protocol *proto, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1E0DE8090](proto, outCount);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1E0C84F80]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

int removexattr(const char *path, const char *name, int options)
{
  return MEMORY[0x1E0C850F0](path, name, *(_QWORD *)&options);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C851A0]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1E0C851A8]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1E0C851F8]();
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1E0C85558](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

uint64_t symptom_framework_init()
{
  return MEMORY[0x1E0DB0138]();
}

uint64_t symptom_new()
{
  return MEMORY[0x1E0DB0148]();
}

uint64_t symptom_send()
{
  return MEMORY[0x1E0DB0150]();
}

uint64_t symptom_set_additional_qualifier()
{
  return MEMORY[0x1E0DB0178]();
}

uint64_t symptom_set_qualifier()
{
  return MEMORY[0x1E0DB0188]();
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x1E0C85D80](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85D90](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x1E0C85D98](identifier, criteria, handler);
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
  MEMORY[0x1E0C85DB0](activity, criteria);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1E0C85DB8](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85DC8](activity);
}

void xpc_activity_unregister(const char *identifier)
{
  MEMORY[0x1E0C85DD0](identifier);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x1E0C85DE0](xarray, value);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C85E00](objects, count);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x1E0C85F90](name, targetq);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x1E0C86038](connection, message, replyq, handler);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x1E0C860C8](connection, targetq);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1E0C86108](object);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1E0C861F0](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_connection(xpc_object_t xdict, const char *key, xpc_connection_t connection)
{
  MEMORY[0x1E0C86320](xdict, key, connection);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1E0C86420](object1, object2);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1E0C86720](string);
}

