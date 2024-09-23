void sub_1D4DC6C10(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D4DC739C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D4DC773C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
  void *v11;

  objc_sync_exit(v11);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D4DC820C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id _CKGetCachedGestaltValue(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = _CKGetCachedGestaltValues_pred;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&_CKGetCachedGestaltValues_pred, &__block_literal_global_31);
  objc_msgSend((id)_CKCachedGestaltValues, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id processInfoDict()
{
  if (processInfoDict_onceToken != -1)
    dispatch_once(&processInfoDict_onceToken, &__block_literal_global_7);
  return (id)processInfoDict_processInfoDict;
}

void sub_1D4DCAF0C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1D4DCBB30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4DCCA40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1D4DCCB00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1D4DCD304(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1D4DCD46C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D4DCD740(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D4DCD8E0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D4DCDCDC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D4DCDEE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4DCDFEC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D4DCE3A4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D4DCEA9C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D4DD0078(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  void *v35;
  uint64_t v36;

  objc_sync_exit(v35);
  _Block_object_dispose((const void *)(v36 - 160), 8);
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void sub_1D4DD0A04(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D4DD0E88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4DD1C08(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D4DD4850(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL C2MPInternalTestConfigReadFrom(uint64_t a1, uint64_t a2)
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
      if ((v10 >> 3) == 102)
        break;
      if ((v10 >> 3) == 101)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 8;
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
    v18 = 16;
    goto LABEL_22;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t C2MPGenericEventMetricValueReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
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
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      v18 = v10 >> 3;
      if ((v10 >> 3) == 103)
      {
        v21 = 0;
        v22 = 0;
        v23 = 0;
        *(_BYTE *)(a1 + 32) |= 1u;
        while (1)
        {
          v24 = *v3;
          v25 = *(_QWORD *)(a2 + v24);
          v26 = v25 + 1;
          if (v25 == -1 || v26 > *(_QWORD *)(a2 + *v4))
            break;
          v27 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
          *(_QWORD *)(a2 + v24) = v26;
          v23 |= (unint64_t)(v27 & 0x7F) << v21;
          if ((v27 & 0x80) == 0)
            goto LABEL_35;
          v21 += 7;
          v15 = v22++ >= 9;
          if (v15)
          {
            v23 = 0;
            goto LABEL_37;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_35:
        if (*(_BYTE *)(a2 + *v5))
          v23 = 0;
LABEL_37:
        *(_QWORD *)(a1 + 8) = v23;
      }
      else if ((_DWORD)v18 == 102)
      {
        *(_BYTE *)(a1 + 32) |= 2u;
        v28 = *v3;
        v29 = *(_QWORD *)(a2 + v28);
        if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v30 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v29);
          *(_QWORD *)(a2 + v28) = v29 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v30 = 0;
        }
        *(_QWORD *)(a1 + 16) = v30;
      }
      else if ((_DWORD)v18 == 101)
      {
        PBReaderReadString();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = *(void **)(a1 + 24);
        *(_QWORD *)(a1 + 24) = v19;

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

uint64_t C2MPCloudKitOperationInfoReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v19;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  void *v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
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
      if ((int)(v10 >> 3) > 100)
      {
        if ((_DWORD)v17 == 101)
        {
          v27 = 0;
          v28 = 0;
          v29 = 0;
          *(_BYTE *)(a1 + 36) |= 2u;
          while (1)
          {
            v30 = *v3;
            v31 = *(_QWORD *)(a2 + v30);
            if (v31 == -1 || v31 >= *(_QWORD *)(a2 + *v4))
              break;
            v32 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v31);
            *(_QWORD *)(a2 + v30) = v31 + 1;
            v29 |= (unint64_t)(v32 & 0x7F) << v27;
            if ((v32 & 0x80) == 0)
              goto LABEL_47;
            v27 += 7;
            v14 = v28++ >= 9;
            if (v14)
            {
              v29 = 0;
              goto LABEL_49;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_47:
          if (*(_BYTE *)(a2 + *v5))
            v29 = 0;
LABEL_49:
          *(_BYTE *)(a1 + 32) = v29 != 0;
        }
        else
        {
          if ((_DWORD)v17 != 201)
          {
LABEL_40:
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
            continue;
          }
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 36) |= 1u;
          while (1)
          {
            v23 = *v3;
            v24 = *(_QWORD *)(a2 + v23);
            if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
              break;
            v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
            *(_QWORD *)(a2 + v23) = v24 + 1;
            v22 |= (unint64_t)(v25 & 0x7F) << v20;
            if ((v25 & 0x80) == 0)
              goto LABEL_43;
            v20 += 7;
            v14 = v21++ >= 9;
            if (v14)
            {
              LODWORD(v22) = 0;
              goto LABEL_45;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_43:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_45:
          *(_DWORD *)(a1 + 8) = v22;
        }
      }
      else
      {
        if ((_DWORD)v17 == 1)
        {
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 16;
        }
        else
        {
          if ((_DWORD)v17 != 2)
            goto LABEL_40;
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 24;
        }
        v26 = *(void **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;

      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t C2MPPathInfoReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v19;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  void *v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  uint64_t result;
  uint64_t v33;

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
      if ((int)(v10 >> 3) > 199)
      {
        if ((_DWORD)v17 == 200)
        {
          v27 = 0;
          v28 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 40) |= 2u;
          while (1)
          {
            v29 = *v3;
            v30 = *(_QWORD *)(a2 + v29);
            if (v30 == -1 || v30 >= *(_QWORD *)(a2 + *v4))
              break;
            v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
            *(_QWORD *)(a2 + v29) = v30 + 1;
            v22 |= (unint64_t)(v31 & 0x7F) << v27;
            if ((v31 & 0x80) == 0)
              goto LABEL_47;
            v27 += 7;
            v14 = v28++ >= 9;
            if (v14)
            {
              v22 = 0;
              goto LABEL_49;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_47:
          if (*(_BYTE *)(a2 + *v5))
            v22 = 0;
LABEL_49:
          v33 = 16;
        }
        else
        {
          if ((_DWORD)v17 != 201)
          {
LABEL_40:
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
            continue;
          }
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 40) |= 1u;
          while (1)
          {
            v23 = *v3;
            v24 = *(_QWORD *)(a2 + v23);
            if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
              break;
            v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
            *(_QWORD *)(a2 + v23) = v24 + 1;
            v22 |= (unint64_t)(v25 & 0x7F) << v20;
            if ((v25 & 0x80) == 0)
              goto LABEL_43;
            v20 += 7;
            v14 = v21++ >= 9;
            if (v14)
            {
              v22 = 0;
              goto LABEL_45;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_43:
          if (*(_BYTE *)(a2 + *v5))
            v22 = 0;
LABEL_45:
          v33 = 8;
        }
        *(_QWORD *)(a1 + v33) = v22;
      }
      else
      {
        if ((_DWORD)v17 == 100)
        {
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 24;
        }
        else
        {
          if ((_DWORD)v17 != 101)
            goto LABEL_40;
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 32;
        }
        v26 = *(void **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;

      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t C2MPNetworkEventReadFrom(id *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  unint64_t v7;
  int *v8;
  unint64_t v9;
  unint64_t v10;
  char v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  BOOL v17;
  int v18;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  unsigned int v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  C2MPPathInfo *v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  char v44;
  unsigned int v45;
  uint64_t v46;
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
  unint64_t v84;
  char v85;
  char v86;
  unsigned int v87;
  uint64_t v88;
  unint64_t v89;
  char v90;
  uint64_t result;
  char v92;
  unsigned int v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  char v97;
  char v98;
  unsigned int v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  char v103;
  char v104;
  unsigned int v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  char v109;
  char v110;
  unsigned int v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  char v115;
  char v116;
  unsigned int v117;
  uint64_t v118;
  unint64_t v119;
  char v120;
  char v121;
  unsigned int v122;
  uint64_t v123;
  unint64_t v124;
  char v125;
  char v126;
  unsigned int v127;
  uint64_t v128;
  uint64_t v129;
  unint64_t v130;
  char v131;
  char v132;
  unsigned int v133;
  uint64_t v134;
  uint64_t v135;
  unint64_t v136;
  char v137;
  id v138;
  char v139;
  unsigned int v140;
  uint64_t v141;
  uint64_t v142;
  unint64_t v143;
  char v144;
  char v145;
  unsigned int v146;
  uint64_t v147;
  unint64_t v148;
  char v149;
  char v150;
  unsigned int v151;
  uint64_t v152;
  unint64_t v153;
  char v154;
  char v155;
  unsigned int v156;
  uint64_t v157;
  unint64_t v158;
  char v159;
  char v160;
  unsigned int v161;
  uint64_t v162;
  unint64_t v163;
  char v164;
  char v165;
  unsigned int v166;
  uint64_t v167;
  unint64_t v168;
  char v169;
  char v170;
  unsigned int v171;
  uint64_t v172;
  unint64_t v173;
  char v174;
  char v175;
  unsigned int v176;
  uint64_t v177;
  unint64_t v178;
  char v179;
  char v180;
  unsigned int v181;
  uint64_t v182;
  unint64_t v183;
  char v184;
  char v185;
  unsigned int v186;
  uint64_t v187;
  unint64_t v188;
  char v189;
  char v190;
  unsigned int v191;
  uint64_t v192;
  unint64_t v193;
  char v194;
  char v195;
  unsigned int v196;
  uint64_t v197;
  unint64_t v198;
  char v199;
  uint64_t v200;
  BOOL v201;
  uint64_t v202;
  uint64_t v203;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = 0x1EFEFA000uLL;
  v8 = (int *)MEMORY[0x1E0D82BB8];
  v9 = 0x1EFEFA000uLL;
  v10 = 0x1EFEFA000uLL;
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    while (1)
    {
      v14 = *v3;
      v15 = *(_QWORD *)(a2 + v14);
      if (v15 == -1 || v15 >= *(_QWORD *)(a2 + *v4))
        break;
      v16 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v15);
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
    if (v18 || (v13 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    v20 = v13 >> 3;
    if ((int)(v13 >> 3) > 149)
    {
      switch((int)v20)
      {
        case 301:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 34;
          goto LABEL_188;
        case 302:
          v92 = 0;
          v93 = 0;
          v94 = 0;
          *(_DWORD *)((char *)a1 + *(int *)(v7 + 3804)) |= 0x20000000u;
          while (2)
          {
            v95 = *v3;
            v96 = *(_QWORD *)(a2 + v95);
            if (v96 == -1 || v96 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v97 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v96);
              *(_QWORD *)(a2 + v95) = v96 + 1;
              v94 |= (unint64_t)(v97 & 0x7F) << v92;
              if (v97 < 0)
              {
                v92 += 7;
                v17 = v93++ >= 9;
                if (v17)
                {
                  v94 = 0;
                  goto LABEL_324;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v94 = 0;
LABEL_324:
          v201 = v94 != 0;
          v202 = 310;
          goto LABEL_358;
        case 303:
          v98 = 0;
          v99 = 0;
          v100 = 0;
          *(_DWORD *)((char *)a1 + *(int *)(v7 + 3804)) |= 0x40000000u;
          while (2)
          {
            v101 = *v3;
            v102 = *(_QWORD *)(a2 + v101);
            if (v102 == -1 || v102 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v103 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v102);
              *(_QWORD *)(a2 + v101) = v102 + 1;
              v100 |= (unint64_t)(v103 & 0x7F) << v98;
              if (v103 < 0)
              {
                v98 += 7;
                v17 = v99++ >= 9;
                if (v17)
                {
                  v100 = 0;
                  goto LABEL_328;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v100 = 0;
LABEL_328:
          v201 = v100 != 0;
          v202 = 311;
          goto LABEL_358;
        case 304:
          v104 = 0;
          v105 = 0;
          v106 = 0;
          *(_DWORD *)((char *)a1 + *(int *)(v7 + 3804)) |= 0x4000000u;
          while (2)
          {
            v107 = *v3;
            v108 = *(_QWORD *)(a2 + v107);
            if (v108 == -1 || v108 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v109 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v108);
              *(_QWORD *)(a2 + v107) = v108 + 1;
              v106 |= (unint64_t)(v109 & 0x7F) << v104;
              if (v109 < 0)
              {
                v104 += 7;
                v17 = v105++ >= 9;
                if (v17)
                {
                  v106 = 0;
                  goto LABEL_332;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v106 = 0;
LABEL_332:
          v201 = v106 != 0;
          v202 = 307;
          goto LABEL_358;
        case 305:
          v110 = 0;
          v111 = 0;
          v112 = 0;
          *(_DWORD *)((char *)a1 + *(int *)(v7 + 3804)) |= 0x8000000u;
          while (2)
          {
            v113 = *v3;
            v114 = *(_QWORD *)(a2 + v113);
            if (v114 == -1 || v114 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v115 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v114);
              *(_QWORD *)(a2 + v113) = v114 + 1;
              v112 |= (unint64_t)(v115 & 0x7F) << v110;
              if (v115 < 0)
              {
                v110 += 7;
                v17 = v111++ >= 9;
                if (v17)
                {
                  v112 = 0;
                  goto LABEL_336;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v112 = 0;
LABEL_336:
          v201 = v112 != 0;
          v202 = 308;
          goto LABEL_358;
        case 306:
          v116 = 0;
          v117 = 0;
          v46 = 0;
          *(_DWORD *)((char *)a1 + *(int *)(v7 + 3804)) |= 0x200000u;
          while (2)
          {
            v118 = *v3;
            v119 = *(_QWORD *)(a2 + v118);
            if (v119 == -1 || v119 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v120 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v119);
              *(_QWORD *)(a2 + v118) = v119 + 1;
              v46 |= (unint64_t)(v120 & 0x7F) << v116;
              if (v120 < 0)
              {
                v116 += 7;
                v17 = v117++ >= 9;
                if (v17)
                {
                  LODWORD(v46) = 0;
                  goto LABEL_340;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v46) = 0;
LABEL_340:
          v203 = 296;
          goto LABEL_345;
        case 307:
          v121 = 0;
          v122 = 0;
          v46 = 0;
          *(_DWORD *)((char *)a1 + *(int *)(v7 + 3804)) |= 0x400000u;
          while (2)
          {
            v123 = *v3;
            v124 = *(_QWORD *)(a2 + v123);
            if (v124 == -1 || v124 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v125 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v124);
              *(_QWORD *)(a2 + v123) = v124 + 1;
              v46 |= (unint64_t)(v125 & 0x7F) << v121;
              if (v125 < 0)
              {
                v121 += 7;
                v17 = v122++ >= 9;
                if (v17)
                {
                  LODWORD(v46) = 0;
                  goto LABEL_344;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v46) = 0;
LABEL_344:
          v203 = 300;
          goto LABEL_345;
        case 308:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 35;
          goto LABEL_188;
        case 309:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 36;
          goto LABEL_188;
        case 310:
          v126 = 0;
          v127 = 0;
          v128 = 0;
          *(_DWORD *)((char *)a1 + *(int *)(v7 + 3804)) |= 0x10000000u;
          while (2)
          {
            v129 = *v3;
            v130 = *(_QWORD *)(a2 + v129);
            if (v130 == -1 || v130 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v131 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v130);
              *(_QWORD *)(a2 + v129) = v130 + 1;
              v128 |= (unint64_t)(v131 & 0x7F) << v126;
              if (v131 < 0)
              {
                v126 += 7;
                v17 = v127++ >= 9;
                if (v17)
                {
                  v128 = 0;
                  goto LABEL_349;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v128 = 0;
LABEL_349:
          v201 = v128 != 0;
          v202 = 309;
          goto LABEL_358;
        case 311:
          v132 = 0;
          v133 = 0;
          v134 = 0;
          *(_DWORD *)((char *)a1 + *(int *)(v7 + 3804)) |= 0x80000000;
          while (2)
          {
            v135 = *v3;
            v136 = *(_QWORD *)(a2 + v135);
            if (v136 == -1 || v136 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v137 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v136);
              *(_QWORD *)(a2 + v135) = v136 + 1;
              v134 |= (unint64_t)(v137 & 0x7F) << v132;
              if (v137 < 0)
              {
                v132 += 7;
                v17 = v133++ >= 9;
                if (v17)
                {
                  v134 = 0;
                  goto LABEL_353;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v134 = 0;
LABEL_353:
          v201 = v134 != 0;
          v202 = 312;
          goto LABEL_358;
        case 312:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 32;
          goto LABEL_188;
        case 313:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 33;
          goto LABEL_188;
        case 314:
          v139 = 0;
          v140 = 0;
          v141 = 0;
          *(_DWORD *)((char *)a1 + *(int *)(v7 + 3804)) |= 0x2000000u;
          while (2)
          {
            v142 = *v3;
            v143 = *(_QWORD *)(a2 + v142);
            if (v143 == -1 || v143 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v144 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v143);
              *(_QWORD *)(a2 + v142) = v143 + 1;
              v141 |= (unint64_t)(v144 & 0x7F) << v139;
              if (v144 < 0)
              {
                v139 += 7;
                v17 = v140++ >= 9;
                if (v17)
                {
                  v141 = 0;
                  goto LABEL_357;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v141 = 0;
LABEL_357:
          v201 = v141 != 0;
          v202 = 306;
          goto LABEL_358;
        default:
          switch((int)v20)
          {
            case 201:
              v23 = 0;
              v24 = 0;
              v25 = 0;
              *(_DWORD *)((char *)a1 + *(int *)(v7 + 3804)) |= 0x20u;
              while (2)
              {
                v26 = *v3;
                v27 = *(_QWORD *)(a2 + v26);
                if (v27 == -1 || v27 >= *(_QWORD *)(a2 + *v4))
                {
                  *(_BYTE *)(a2 + *v5) = 1;
                }
                else
                {
                  v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v27);
                  *(_QWORD *)(a2 + v26) = v27 + 1;
                  v25 |= (unint64_t)(v28 & 0x7F) << v23;
                  if (v28 < 0)
                  {
                    v23 += 7;
                    v17 = v24++ >= 9;
                    if (v17)
                    {
                      v25 = 0;
                      goto LABEL_320;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(_BYTE *)(a2 + *v5))
                v25 = 0;
LABEL_320:
              v200 = 48;
              goto LABEL_403;
            case 202:
              v145 = 0;
              v146 = 0;
              v25 = 0;
              *(_DWORD *)((char *)a1 + *(int *)(v7 + 3804)) |= 0x80u;
              while (2)
              {
                v147 = *v3;
                v148 = *(_QWORD *)(a2 + v147);
                if (v148 == -1 || v148 >= *(_QWORD *)(a2 + *v4))
                {
                  *(_BYTE *)(a2 + *v5) = 1;
                }
                else
                {
                  v149 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v148);
                  *(_QWORD *)(a2 + v147) = v148 + 1;
                  v25 |= (unint64_t)(v149 & 0x7F) << v145;
                  if (v149 < 0)
                  {
                    v145 += 7;
                    v17 = v146++ >= 9;
                    if (v17)
                    {
                      v25 = 0;
                      goto LABEL_362;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(_BYTE *)(a2 + *v5))
                v25 = 0;
LABEL_362:
              v200 = 64;
              goto LABEL_403;
            case 203:
              v150 = 0;
              v151 = 0;
              v25 = 0;
              *(_DWORD *)((char *)a1 + *(int *)(v7 + 3804)) |= 0x40u;
              while (2)
              {
                v152 = *v3;
                v153 = *(_QWORD *)(a2 + v152);
                if (v153 == -1 || v153 >= *(_QWORD *)(a2 + *v4))
                {
                  *(_BYTE *)(a2 + *v5) = 1;
                }
                else
                {
                  v154 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v153);
                  *(_QWORD *)(a2 + v152) = v153 + 1;
                  v25 |= (unint64_t)(v154 & 0x7F) << v150;
                  if (v154 < 0)
                  {
                    v150 += 7;
                    v17 = v151++ >= 9;
                    if (v17)
                    {
                      v25 = 0;
                      goto LABEL_366;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(_BYTE *)(a2 + *v5))
                v25 = 0;
LABEL_366:
              v200 = 56;
              goto LABEL_403;
            case 204:
              v155 = 0;
              v156 = 0;
              v25 = 0;
              *(_DWORD *)((char *)a1 + *(int *)(v7 + 3804)) |= 0x200u;
              while (2)
              {
                v157 = *v3;
                v158 = *(_QWORD *)(a2 + v157);
                if (v158 == -1 || v158 >= *(_QWORD *)(a2 + *v4))
                {
                  *(_BYTE *)(a2 + *v5) = 1;
                }
                else
                {
                  v159 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v158);
                  *(_QWORD *)(a2 + v157) = v158 + 1;
                  v25 |= (unint64_t)(v159 & 0x7F) << v155;
                  if (v159 < 0)
                  {
                    v155 += 7;
                    v17 = v156++ >= 9;
                    if (v17)
                    {
                      v25 = 0;
                      goto LABEL_370;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(_BYTE *)(a2 + *v5))
                v25 = 0;
LABEL_370:
              v200 = 80;
              goto LABEL_403;
            case 205:
              v160 = 0;
              v161 = 0;
              v25 = 0;
              *(_DWORD *)((char *)a1 + *(int *)(v7 + 3804)) |= 0x100u;
              while (2)
              {
                v162 = *v3;
                v163 = *(_QWORD *)(a2 + v162);
                if (v163 == -1 || v163 >= *(_QWORD *)(a2 + *v4))
                {
                  *(_BYTE *)(a2 + *v5) = 1;
                }
                else
                {
                  v164 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v163);
                  *(_QWORD *)(a2 + v162) = v163 + 1;
                  v25 |= (unint64_t)(v164 & 0x7F) << v160;
                  if (v164 < 0)
                  {
                    v160 += 7;
                    v17 = v161++ >= 9;
                    if (v17)
                    {
                      v25 = 0;
                      goto LABEL_374;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(_BYTE *)(a2 + *v5))
                v25 = 0;
LABEL_374:
              v200 = 72;
              goto LABEL_403;
            case 206:
              v165 = 0;
              v166 = 0;
              v25 = 0;
              *(_DWORD *)((char *)a1 + *(int *)(v7 + 3804)) |= 0x10000u;
              while (2)
              {
                v167 = *v3;
                v168 = *(_QWORD *)(a2 + v167);
                if (v168 == -1 || v168 >= *(_QWORD *)(a2 + *v4))
                {
                  *(_BYTE *)(a2 + *v5) = 1;
                }
                else
                {
                  v169 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v168);
                  *(_QWORD *)(a2 + v167) = v168 + 1;
                  v25 |= (unint64_t)(v169 & 0x7F) << v165;
                  if (v169 < 0)
                  {
                    v165 += 7;
                    v17 = v166++ >= 9;
                    if (v17)
                    {
                      v25 = 0;
                      goto LABEL_378;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(_BYTE *)(a2 + *v5))
                v25 = 0;
LABEL_378:
              v200 = 136;
              goto LABEL_403;
            case 207:
              v170 = 0;
              v171 = 0;
              v25 = 0;
              *(_DWORD *)((char *)a1 + *(int *)(v7 + 3804)) |= 0x8000u;
              while (2)
              {
                v172 = *v3;
                v173 = *(_QWORD *)(a2 + v172);
                if (v173 == -1 || v173 >= *(_QWORD *)(a2 + *v4))
                {
                  *(_BYTE *)(a2 + *v5) = 1;
                }
                else
                {
                  v174 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v173);
                  *(_QWORD *)(a2 + v172) = v173 + 1;
                  v25 |= (unint64_t)(v174 & 0x7F) << v170;
                  if (v174 < 0)
                  {
                    v170 += 7;
                    v17 = v171++ >= 9;
                    if (v17)
                    {
                      v25 = 0;
                      goto LABEL_382;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(_BYTE *)(a2 + *v5))
                v25 = 0;
LABEL_382:
              v200 = 128;
              goto LABEL_403;
            case 208:
              v175 = 0;
              v176 = 0;
              v25 = 0;
              *(_DWORD *)((char *)a1 + *(int *)(v7 + 3804)) |= 0x4000u;
              while (2)
              {
                v177 = *v3;
                v178 = *(_QWORD *)(a2 + v177);
                if (v178 == -1 || v178 >= *(_QWORD *)(a2 + *v4))
                {
                  *(_BYTE *)(a2 + *v5) = 1;
                }
                else
                {
                  v179 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v178);
                  *(_QWORD *)(a2 + v177) = v178 + 1;
                  v25 |= (unint64_t)(v179 & 0x7F) << v175;
                  if (v179 < 0)
                  {
                    v175 += 7;
                    v17 = v176++ >= 9;
                    if (v17)
                    {
                      v25 = 0;
                      goto LABEL_386;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(_BYTE *)(a2 + *v5))
                v25 = 0;
LABEL_386:
              v200 = 120;
              goto LABEL_403;
            case 209:
              v180 = 0;
              v181 = 0;
              v25 = 0;
              *(_DWORD *)((char *)a1 + *(int *)(v7 + 3804)) |= 0x800u;
              while (2)
              {
                v182 = *v3;
                v183 = *(_QWORD *)(a2 + v182);
                if (v183 == -1 || v183 >= *(_QWORD *)(a2 + *v4))
                {
                  *(_BYTE *)(a2 + *v5) = 1;
                }
                else
                {
                  v184 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v183);
                  *(_QWORD *)(a2 + v182) = v183 + 1;
                  v25 |= (unint64_t)(v184 & 0x7F) << v180;
                  if (v184 < 0)
                  {
                    v180 += 7;
                    v17 = v181++ >= 9;
                    if (v17)
                    {
                      v25 = 0;
                      goto LABEL_390;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(_BYTE *)(a2 + *v5))
                v25 = 0;
LABEL_390:
              v200 = 96;
              goto LABEL_403;
            case 210:
              v185 = 0;
              v186 = 0;
              v25 = 0;
              *(_DWORD *)((char *)a1 + *(int *)(v7 + 3804)) |= 0x400u;
              while (2)
              {
                v187 = *v3;
                v188 = *(_QWORD *)(a2 + v187);
                if (v188 == -1 || v188 >= *(_QWORD *)(a2 + *v4))
                {
                  *(_BYTE *)(a2 + *v5) = 1;
                }
                else
                {
                  v189 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v188);
                  *(_QWORD *)(a2 + v187) = v188 + 1;
                  v25 |= (unint64_t)(v189 & 0x7F) << v185;
                  if (v189 < 0)
                  {
                    v185 += 7;
                    v17 = v186++ >= 9;
                    if (v17)
                    {
                      v25 = 0;
                      goto LABEL_394;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(_BYTE *)(a2 + *v5))
                v25 = 0;
LABEL_394:
              v200 = 88;
              goto LABEL_403;
            case 211:
              v190 = 0;
              v191 = 0;
              v25 = 0;
              *(_DWORD *)((char *)a1 + *(int *)(v7 + 3804)) |= 0x2000u;
              while (2)
              {
                v192 = *v3;
                v193 = *(_QWORD *)(a2 + v192);
                if (v193 == -1 || v193 >= *(_QWORD *)(a2 + *v4))
                {
                  *(_BYTE *)(a2 + *v5) = 1;
                }
                else
                {
                  v194 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v193);
                  *(_QWORD *)(a2 + v192) = v193 + 1;
                  v25 |= (unint64_t)(v194 & 0x7F) << v190;
                  if (v194 < 0)
                  {
                    v190 += 7;
                    v17 = v191++ >= 9;
                    if (v17)
                    {
                      v25 = 0;
                      goto LABEL_398;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(_BYTE *)(a2 + *v5))
                v25 = 0;
LABEL_398:
              v200 = 112;
              goto LABEL_403;
            case 212:
              v195 = 0;
              v196 = 0;
              v25 = 0;
              *(_DWORD *)((char *)a1 + *(int *)(v7 + 3804)) |= 0x1000u;
              break;
            default:
              if ((_DWORD)v20 != 150)
                goto LABEL_126;
              v34 = v7;
              v35 = v10;
              v36 = v9;
              v37 = objc_alloc_init(C2MPPathInfo);
              objc_msgSend(a1, "addNetworkPathInfo:", v37);
              if (!PBReaderPlaceMark() || (C2MPPathInfoReadFrom((uint64_t)v37, a2) & 1) == 0)
                goto LABEL_406;
              goto LABEL_95;
          }
          break;
      }
      while (1)
      {
        v197 = *v3;
        v198 = *(_QWORD *)(a2 + v197);
        if (v198 == -1 || v198 >= *(_QWORD *)(a2 + *v4))
          break;
        v199 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v198);
        *(_QWORD *)(a2 + v197) = v198 + 1;
        v25 |= (unint64_t)(v199 & 0x7F) << v195;
        if ((v199 & 0x80) == 0)
          goto LABEL_400;
        v195 += 7;
        v17 = v196++ >= 9;
        if (v17)
        {
          v25 = 0;
          goto LABEL_402;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_400:
      if (*(_BYTE *)(a2 + *v5))
        v25 = 0;
LABEL_402:
      v200 = 104;
LABEL_403:
      *(id *)((char *)a1 + v200) = (id)v25;
      goto LABEL_404;
    }
    if ((int)v20 <= 100)
    {
      switch((_DWORD)v20)
      {
        case 1:
          v81 = 0;
          v82 = 0;
          v25 = 0;
          *(_DWORD *)((char *)a1 + *(int *)(v7 + 3804)) |= 0x20000u;
          while (1)
          {
            v83 = *v3;
            v84 = *(_QWORD *)(a2 + v83);
            if (v84 == -1 || v84 >= *(_QWORD *)(a2 + *v4))
              break;
            v85 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v84);
            *(_QWORD *)(a2 + v83) = v84 + 1;
            v25 |= (unint64_t)(v85 & 0x7F) << v81;
            if ((v85 & 0x80) == 0)
              goto LABEL_310;
            v81 += 7;
            v17 = v82++ >= 9;
            if (v17)
            {
              v25 = 0;
              goto LABEL_312;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_310:
          if (*(_BYTE *)(a2 + *v5))
            v25 = 0;
LABEL_312:
          v200 = *(int *)(v9 + 3808);
          break;
        case 2:
          v86 = 0;
          v87 = 0;
          v25 = 0;
          *(_DWORD *)((char *)a1 + *(int *)(v7 + 3804)) |= 8u;
          while (1)
          {
            v88 = *v3;
            v89 = *(_QWORD *)(a2 + v88);
            if (v89 == -1 || v89 >= *(_QWORD *)(a2 + *v4))
              break;
            v90 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v89);
            *(_QWORD *)(a2 + v88) = v89 + 1;
            v25 |= (unint64_t)(v90 & 0x7F) << v86;
            if ((v90 & 0x80) == 0)
              goto LABEL_314;
            v86 += 7;
            v17 = v87++ >= 9;
            if (v17)
            {
              v25 = 0;
              goto LABEL_316;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_314:
          if (*(_BYTE *)(a2 + *v5))
            v25 = 0;
LABEL_316:
          v200 = *(int *)(v10 + 3812);
          break;
        case 3:
          v29 = 0;
          v30 = 0;
          v25 = 0;
          *(_DWORD *)((char *)a1 + *(int *)(v7 + 3804)) |= 0x10u;
          while (1)
          {
            v31 = *v3;
            v32 = *(_QWORD *)(a2 + v31);
            if (v32 == -1 || v32 >= *(_QWORD *)(a2 + *v4))
              break;
            v33 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v32);
            *(_QWORD *)(a2 + v31) = v32 + 1;
            v25 |= (unint64_t)(v33 & 0x7F) << v29;
            if ((v33 & 0x80) == 0)
              goto LABEL_274;
            v29 += 7;
            v17 = v30++ >= 9;
            if (v17)
            {
              v25 = 0;
              goto LABEL_276;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_274:
          if (*(_BYTE *)(a2 + *v5))
            v25 = 0;
LABEL_276:
          v200 = 40;
          break;
        default:
LABEL_126:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          goto LABEL_404;
      }
      goto LABEL_403;
    }
    switch((int)v20)
    {
      case 'e':
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 31;
        goto LABEL_188;
      case 'f':
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 21;
        goto LABEL_188;
      case 'g':
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 27;
        goto LABEL_188;
      case 'h':
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 19;
        goto LABEL_188;
      case 'i':
        v38 = 0;
        v39 = 0;
        v40 = 0;
        *(_DWORD *)((char *)a1 + *(int *)(v7 + 3804)) |= 0x800000u;
        while (2)
        {
          v41 = *v3;
          v42 = *(_QWORD *)(a2 + v41);
          if (v42 == -1 || v42 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v43 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v42);
            *(_QWORD *)(a2 + v41) = v42 + 1;
            v40 |= (unint64_t)(v43 & 0x7F) << v38;
            if (v43 < 0)
            {
              v38 += 7;
              v17 = v39++ >= 9;
              if (v17)
              {
                v40 = 0;
                goto LABEL_280;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v40 = 0;
LABEL_280:
        v201 = v40 != 0;
        v202 = 304;
        goto LABEL_358;
      case 'j':
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 22;
        goto LABEL_188;
      case 'k':
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 26;
        goto LABEL_188;
      case 'l':
        v44 = 0;
        v45 = 0;
        v46 = 0;
        *(_DWORD *)((char *)a1 + *(int *)(v7 + 3804)) |= 0x80000u;
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
            v49 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v48);
            *(_QWORD *)(a2 + v47) = v48 + 1;
            v46 |= (unint64_t)(v49 & 0x7F) << v44;
            if (v49 < 0)
            {
              v44 += 7;
              v17 = v45++ >= 9;
              if (v17)
              {
                LODWORD(v46) = 0;
                goto LABEL_284;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v46) = 0;
LABEL_284:
        v203 = 224;
        goto LABEL_345;
      case 'm':
        v50 = 0;
        v51 = 0;
        v25 = 0;
        *(_DWORD *)((char *)a1 + *(int *)(v7 + 3804)) |= 1u;
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
            v25 |= (unint64_t)(v54 & 0x7F) << v50;
            if (v54 < 0)
            {
              v50 += 7;
              v17 = v51++ >= 9;
              if (v17)
              {
                v25 = 0;
                goto LABEL_288;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v25 = 0;
LABEL_288:
        v200 = 8;
        goto LABEL_403;
      case 'n':
        v55 = 0;
        v56 = 0;
        v46 = 0;
        *(_DWORD *)((char *)a1 + *(int *)(v7 + 3804)) |= 0x100000u;
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
            v46 |= (unint64_t)(v59 & 0x7F) << v55;
            if (v59 < 0)
            {
              v55 += 7;
              v17 = v56++ >= 9;
              if (v17)
              {
                LODWORD(v46) = 0;
                goto LABEL_292;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v46) = 0;
LABEL_292:
        v203 = 240;
        goto LABEL_345;
      case 'o':
        v60 = 0;
        v61 = 0;
        v25 = 0;
        *(_DWORD *)((char *)a1 + *(int *)(v7 + 3804)) |= 2u;
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
            v64 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v63);
            *(_QWORD *)(a2 + v62) = v63 + 1;
            v25 |= (unint64_t)(v64 & 0x7F) << v60;
            if (v64 < 0)
            {
              v60 += 7;
              v17 = v61++ >= 9;
              if (v17)
              {
                v25 = 0;
                goto LABEL_296;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v25 = 0;
LABEL_296:
        v200 = 16;
        goto LABEL_403;
      case 'p':
        v65 = 0;
        v66 = 0;
        v46 = 0;
        *(_DWORD *)((char *)a1 + *(int *)(v7 + 3804)) |= 0x40000u;
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
            v69 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v68);
            *(_QWORD *)(a2 + v67) = v68 + 1;
            v46 |= (unint64_t)(v69 & 0x7F) << v65;
            if (v69 < 0)
            {
              v65 += 7;
              v17 = v66++ >= 9;
              if (v17)
              {
                LODWORD(v46) = 0;
                goto LABEL_300;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v46) = 0;
LABEL_300:
        v203 = 200;
LABEL_345:
        *(_DWORD *)((char *)a1 + v203) = v46;
        goto LABEL_404;
      case 'q':
        v34 = v7;
        v35 = v10;
        v36 = v9;
        v37 = objc_alloc_init(C2MPError);
        objc_storeStrong(a1 + 20, v37);
        if (PBReaderPlaceMark() && (C2MPErrorReadFrom((uint64_t)v37, a2) & 1) != 0)
        {
LABEL_95:
          PBReaderRecallMark();

          v9 = v36;
          v10 = v35;
          v7 = v34;
LABEL_404:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_406:

        return 0;
      case 'r':
        v70 = 0;
        v71 = 0;
        v25 = 0;
        *(_DWORD *)((char *)a1 + *(int *)(v7 + 3804)) |= 4u;
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
            v74 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v73);
            *(_QWORD *)(a2 + v72) = v73 + 1;
            v25 |= (unint64_t)(v74 & 0x7F) << v70;
            if (v74 < 0)
            {
              v70 += 7;
              v17 = v71++ >= 9;
              if (v17)
              {
                v25 = 0;
                goto LABEL_304;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v25 = 0;
LABEL_304:
        v200 = 24;
        goto LABEL_403;
      case 's':
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 29;
        goto LABEL_188;
      case 't':
        v75 = 0;
        v76 = 0;
        v77 = 0;
        *(_DWORD *)((char *)a1 + *(int *)(v7 + 3804)) |= 0x1000000u;
        while (2)
        {
          v78 = *v3;
          v79 = *(_QWORD *)(a2 + v78);
          if (v79 == -1 || v79 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v80 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v79);
            *(_QWORD *)(a2 + v78) = v79 + 1;
            v77 |= (unint64_t)(v80 & 0x7F) << v75;
            if (v80 < 0)
            {
              v75 += 7;
              v17 = v76++ >= 9;
              if (v17)
              {
                v77 = 0;
                goto LABEL_308;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v77 = 0;
LABEL_308:
        v201 = v77 != 0;
        v202 = 305;
LABEL_358:
        *((_BYTE *)a1 + v202) = v201;
        goto LABEL_404;
      case 'u':
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 23;
LABEL_188:
        v138 = a1[v22];
        a1[v22] = (id)v21;

        goto LABEL_404;
      default:
        goto LABEL_126;
    }
  }
}

id getCloudTelemetryReporterClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCloudTelemetryReporterClass_softClass;
  v7 = getCloudTelemetryReporterClass_softClass;
  if (!getCloudTelemetryReporterClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCloudTelemetryReporterClass_block_invoke;
    v3[3] = &unk_1E9898720;
    v3[4] = &v4;
    __getCloudTelemetryReporterClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1D4DDD270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCloudTelemetryReporterClass_block_invoke(uint64_t a1)
{
  Class result;

  CloudTelemetryLibrary();
  result = objc_getClass("CloudTelemetryReporter");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCloudTelemetryReporterClass_block_invoke_cold_1();
  getCloudTelemetryReporterClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void CloudTelemetryLibrary()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = 0;
  if (!CloudTelemetryLibraryCore_frameworkLibrary)
  {
    v1 = xmmword_1E9898740;
    v2 = 0;
    CloudTelemetryLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CloudTelemetryLibraryCore_frameworkLibrary)
    CloudTelemetryLibrary_cold_1(&v0);
}

Class __getCloudTelemetryClass_block_invoke(uint64_t a1)
{
  Class result;

  CloudTelemetryLibrary();
  result = objc_getClass("CloudTelemetry");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCloudTelemetryClass_block_invoke_cold_1();
  getCloudTelemetryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1D4DDD96C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D4DDDBAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D4DDEEEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D4DDFC74(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

uint64_t C2MPCloudKitInfoReadFrom(_BYTE *a1, uint64_t a2)
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
  uint64_t v19;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  C2MPCloudKitOperationInfo *v37;
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
  void *v48;
  uint64_t result;
  uint64_t v50;

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
      if ((int)(v10 >> 3) <= 300)
      {
        switch((int)v17)
        {
          case 201:
            PBReaderReadString();
            v18 = objc_claimAutoreleasedReturnValue();
            v19 = 80;
            goto LABEL_79;
          case 202:
            PBReaderReadString();
            v18 = objc_claimAutoreleasedReturnValue();
            v19 = 112;
            goto LABEL_79;
          case 203:
            v31 = 0;
            v32 = 0;
            v33 = 0;
            a1[132] |= 0x10u;
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
                v33 |= (unint64_t)(v36 & 0x7F) << v31;
                if (v36 < 0)
                {
                  v31 += 7;
                  v14 = v32++ >= 9;
                  if (v14)
                  {
                    v33 = 0;
                    goto LABEL_93;
                  }
                  continue;
                }
              }
              break;
            }
            if (*(_BYTE *)(a2 + *v5))
              v33 = 0;
LABEL_93:
            a1[128] = v33 != 0;
            continue;
          case 204:
            PBReaderReadString();
            v18 = objc_claimAutoreleasedReturnValue();
            v19 = 96;
            goto LABEL_79;
          case 205:
            PBReaderReadString();
            v18 = objc_claimAutoreleasedReturnValue();
            v19 = 88;
            goto LABEL_79;
          case 206:
            PBReaderReadString();
            v18 = objc_claimAutoreleasedReturnValue();
            v19 = 40;
            goto LABEL_79;
          case 207:
            PBReaderReadString();
            v18 = objc_claimAutoreleasedReturnValue();
            v19 = 48;
            goto LABEL_79;
          case 208:
            PBReaderReadString();
            v18 = objc_claimAutoreleasedReturnValue();
            v19 = 104;
            goto LABEL_79;
          default:
            if ((_DWORD)v17 == 102)
            {
              PBReaderReadString();
              v18 = objc_claimAutoreleasedReturnValue();
              v19 = 72;
            }
            else
            {
              if ((_DWORD)v17 != 103)
                goto LABEL_80;
              PBReaderReadString();
              v18 = objc_claimAutoreleasedReturnValue();
              v19 = 56;
            }
LABEL_79:
            v48 = *(void **)&a1[v19];
            *(_QWORD *)&a1[v19] = v18;

            break;
        }
        continue;
      }
      if ((int)v17 > 400)
      {
        if ((_DWORD)v17 != 401)
        {
          if ((_DWORD)v17 == 402)
          {
            v43 = 0;
            v44 = 0;
            v22 = 0;
            a1[132] |= 1u;
            while (1)
            {
              v45 = *v3;
              v46 = *(_QWORD *)(a2 + v45);
              if (v46 == -1 || v46 >= *(_QWORD *)(a2 + *v4))
                break;
              v47 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v46);
              *(_QWORD *)(a2 + v45) = v46 + 1;
              v22 |= (unint64_t)(v47 & 0x7F) << v43;
              if ((v47 & 0x80) == 0)
                goto LABEL_99;
              v43 += 7;
              v14 = v44++ >= 9;
              if (v14)
              {
                v22 = 0;
                goto LABEL_101;
              }
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_99:
            if (*(_BYTE *)(a2 + *v5))
              v22 = 0;
LABEL_101:
            v50 = 8;
          }
          else
          {
            if ((_DWORD)v17 != 403)
            {
LABEL_80:
              result = PBReaderSkipValueWithTag();
              if (!(_DWORD)result)
                return result;
              continue;
            }
            v26 = 0;
            v27 = 0;
            v22 = 0;
            a1[132] |= 2u;
            while (1)
            {
              v28 = *v3;
              v29 = *(_QWORD *)(a2 + v28);
              if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
                break;
              v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
              *(_QWORD *)(a2 + v28) = v29 + 1;
              v22 |= (unint64_t)(v30 & 0x7F) << v26;
              if ((v30 & 0x80) == 0)
                goto LABEL_87;
              v26 += 7;
              v14 = v27++ >= 9;
              if (v14)
              {
                v22 = 0;
                goto LABEL_89;
              }
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_87:
            if (*(_BYTE *)(a2 + *v5))
              v22 = 0;
LABEL_89:
            v50 = 16;
          }
          goto LABEL_102;
        }
        v37 = objc_alloc_init(C2MPCloudKitOperationInfo);
        objc_msgSend(a1, "addClientOperation:", v37);
        if (!PBReaderPlaceMark() || (C2MPCloudKitOperationInfoReadFrom((uint64_t)v37, a2) & 1) == 0)
        {
LABEL_105:

          return 0;
        }
      }
      else
      {
        if ((_DWORD)v17 != 301)
        {
          if ((_DWORD)v17 == 302)
          {
            v38 = 0;
            v39 = 0;
            v22 = 0;
            a1[132] |= 4u;
            while (1)
            {
              v40 = *v3;
              v41 = *(_QWORD *)(a2 + v40);
              if (v41 == -1 || v41 >= *(_QWORD *)(a2 + *v4))
                break;
              v42 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v41);
              *(_QWORD *)(a2 + v40) = v41 + 1;
              v22 |= (unint64_t)(v42 & 0x7F) << v38;
              if ((v42 & 0x80) == 0)
                goto LABEL_95;
              v38 += 7;
              v14 = v39++ >= 9;
              if (v14)
              {
                v22 = 0;
                goto LABEL_97;
              }
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_95:
            if (*(_BYTE *)(a2 + *v5))
              v22 = 0;
LABEL_97:
            v50 = 24;
          }
          else
          {
            if ((_DWORD)v17 != 303)
              goto LABEL_80;
            v20 = 0;
            v21 = 0;
            v22 = 0;
            a1[132] |= 8u;
            while (1)
            {
              v23 = *v3;
              v24 = *(_QWORD *)(a2 + v23);
              if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
                break;
              v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
              *(_QWORD *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if ((v25 & 0x80) == 0)
                goto LABEL_83;
              v20 += 7;
              v14 = v21++ >= 9;
              if (v14)
              {
                v22 = 0;
                goto LABEL_85;
              }
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_83:
            if (*(_BYTE *)(a2 + *v5))
              v22 = 0;
LABEL_85:
            v50 = 32;
          }
LABEL_102:
          *(_QWORD *)&a1[v50] = v22;
          continue;
        }
        v37 = objc_alloc_init(C2MPCloudKitOperationGroupInfo);
        objc_msgSend(a1, "addOperationGroup:", v37);
        if (!PBReaderPlaceMark() || (C2MPCloudKitOperationGroupInfoReadFrom((uint64_t)v37, a2) & 1) == 0)
          goto LABEL_105;
      }
      PBReaderRecallMark();

    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t C2MPGenericEventReadFrom(uint64_t a1, uint64_t a2)
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
  C2MPGenericEventMetric *v18;
  uint64_t v19;
  void *v20;
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
  uint64_t v35;
  unint64_t v36;
  char v37;
  uint64_t result;
  uint64_t v39;

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
      if ((int)(v10 >> 3) <= 200)
      {
        if ((_DWORD)v17 == 1)
        {
          v32 = 0;
          v33 = 0;
          v34 = 0;
          *(_BYTE *)(a1 + 44) |= 4u;
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
              goto LABEL_61;
            v32 += 7;
            v14 = v33++ >= 9;
            if (v14)
            {
              LODWORD(v34) = 0;
              goto LABEL_63;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_61:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v34) = 0;
LABEL_63:
          *(_DWORD *)(a1 + 40) = v34;
        }
        else
        {
          if ((_DWORD)v17 != 101)
          {
LABEL_49:
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
            continue;
          }
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = *(void **)(a1 + 32);
          *(_QWORD *)(a1 + 32) = v19;

        }
      }
      else
      {
        if ((_DWORD)v17 == 201)
        {
          v21 = 0;
          v22 = 0;
          v23 = 0;
          *(_BYTE *)(a1 + 44) |= 2u;
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
              goto LABEL_52;
            v21 += 7;
            v14 = v22++ >= 9;
            if (v14)
            {
              v23 = 0;
              goto LABEL_54;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_52:
          if (*(_BYTE *)(a2 + *v5))
            v23 = 0;
LABEL_54:
          v39 = 16;
          goto LABEL_59;
        }
        if ((_DWORD)v17 == 202)
        {
          v27 = 0;
          v28 = 0;
          v23 = 0;
          *(_BYTE *)(a1 + 44) |= 1u;
          while (1)
          {
            v29 = *v3;
            v30 = *(_QWORD *)(a2 + v29);
            if (v30 == -1 || v30 >= *(_QWORD *)(a2 + *v4))
              break;
            v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
            *(_QWORD *)(a2 + v29) = v30 + 1;
            v23 |= (unint64_t)(v31 & 0x7F) << v27;
            if ((v31 & 0x80) == 0)
              goto LABEL_56;
            v27 += 7;
            v14 = v28++ >= 9;
            if (v14)
            {
              v23 = 0;
              goto LABEL_58;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_56:
          if (*(_BYTE *)(a2 + *v5))
            v23 = 0;
LABEL_58:
          v39 = 8;
LABEL_59:
          *(_QWORD *)(a1 + v39) = v23;
          continue;
        }
        if ((_DWORD)v17 != 301)
          goto LABEL_49;
        v18 = objc_alloc_init(C2MPGenericEventMetric);
        objc_msgSend((id)a1, "addMetric:", v18);
        if (!PBReaderPlaceMark() || !C2MPGenericEventMetricReadFrom((uint64_t)v18, a2))
        {

          return 0;
        }
        PBReaderRecallMark();

      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t C2MPErrorReadFrom(uint64_t a1, uint64_t a2)
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
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  void *v26;
  C2MPError *v27;

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
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 24;
        goto LABEL_30;
      case 2u:
        v20 = 0;
        v21 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + 40) |= 1u;
        while (2)
        {
          v23 = *v3;
          v24 = *(_QWORD *)(a2 + v23);
          if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
            *(_QWORD *)(a2 + v23) = v24 + 1;
            v22 |= (unint64_t)(v25 & 0x7F) << v20;
            if (v25 < 0)
            {
              v20 += 7;
              v14 = v21++ >= 9;
              if (v14)
              {
                v22 = 0;
                goto LABEL_37;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v22 = 0;
LABEL_37:
        *(_QWORD *)(a1 + 8) = v22;
        goto LABEL_38;
      case 3u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 16;
LABEL_30:
        v26 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_38;
      case 4u:
        v27 = objc_alloc_init(C2MPError);
        objc_storeStrong((id *)(a1 + 32), v27);
        if (PBReaderPlaceMark() && (C2MPErrorReadFrom(v27, a2) & 1) != 0)
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

void __processInfoDict_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoDictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)processInfoDict_processInfoDict;
  processInfoDict_processInfoDict = v0;

}

void __entitlementsDict_block_invoke()
{
  kern_return_t v0;
  unsigned int v1;
  uint64_t v2;
  const char *v3;
  NSObject *v4;
  uint32_t v5;
  SecTaskRef v6;
  __SecTask *v7;
  const __CFArray *v8;
  CFDictionaryRef v9;
  void *v10;
  uint64_t v11;
  mach_msg_type_number_t task_info_outCnt;
  audit_token_t task_info_out;
  audit_token_t buf;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  memset(&task_info_out, 0, sizeof(task_info_out));
  task_info_outCnt = 8;
  v0 = task_info(*MEMORY[0x1E0C83DA0], 0xFu, (task_info_t)&task_info_out, &task_info_outCnt);
  if (v0)
  {
    v1 = v0;
    if (C2_DEFAULT_LOG_BLOCK_2 != -1)
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_2, &__block_literal_global_24);
    v2 = C2_DEFAULT_LOG_INTERNAL_2;
    if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_2, OS_LOG_TYPE_ERROR))
    {
      buf.val[0] = 67109120;
      buf.val[1] = v1;
      v3 = "Unable to get a self audit token: %d";
      v4 = v2;
      v5 = 8;
LABEL_6:
      _os_log_impl(&dword_1D4DC3000, v4, OS_LOG_TYPE_ERROR, v3, (uint8_t *)&buf, v5);
    }
  }
  else
  {
    buf = task_info_out;
    v6 = SecTaskCreateWithAuditToken(0, &buf);
    if (v6)
    {
      v7 = v6;
      *(_QWORD *)buf.val = CFSTR("application-identifier");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &buf, 1);
      v8 = (const __CFArray *)(id)objc_claimAutoreleasedReturnValue();
      v9 = SecTaskCopyValuesForEntitlements(v7, v8, 0);
      v10 = (void *)entitlementsDict_entitlementsDict;
      entitlementsDict_entitlementsDict = (uint64_t)v9;

      CFRelease(v7);
    }
    else
    {
      if (C2_DEFAULT_LOG_BLOCK_2 != -1)
        dispatch_once(&C2_DEFAULT_LOG_BLOCK_2, &__block_literal_global_27_0);
      v11 = C2_DEFAULT_LOG_INTERNAL_2;
      if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_2, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.val[0]) = 0;
        v3 = "Unable to get a sec task";
        v4 = v11;
        v5 = 2;
        goto LABEL_6;
      }
    }
  }
}

void __entitlementsDict_block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_2;
  C2_DEFAULT_LOG_INTERNAL_2 = (uint64_t)v0;

}

void __entitlementsDict_block_invoke_26()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_2;
  C2_DEFAULT_LOG_INTERNAL_2 = (uint64_t)v0;

}

void sub_1D4DE97CC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D4DE9940(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL C2MPGenericEventMetricReadFrom(uint64_t a1, uint64_t a2)
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
  C2MPGenericEventMetricValue *v18;

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
      if ((v10 >> 3) == 201)
        break;
      if ((v10 >> 3) == 101)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(C2MPGenericEventMetricValue **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v17;
LABEL_24:

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_26:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v18 = objc_alloc_init(C2MPGenericEventMetricValue);
    objc_storeStrong((id *)(a1 + 16), v18);
    if (!PBReaderPlaceMark() || (C2MPGenericEventMetricValueReadFrom((uint64_t)v18, a2) & 1) == 0)
    {

      return 0;
    }
    PBReaderRecallMark();
    goto LABEL_24;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL C2MPServerInfoReadFrom(uint64_t a1, uint64_t a2)
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
        case 'f':
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
          goto LABEL_25;
        case 'g':
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
          goto LABEL_25;
        case 'h':
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
          goto LABEL_25;
        case 'i':
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

id getBRContainersMonitorClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getBRContainersMonitorClass_softClass;
  v7 = getBRContainersMonitorClass_softClass;
  if (!getBRContainersMonitorClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getBRContainersMonitorClass_block_invoke;
    v3[3] = &unk_1E9898720;
    v3[4] = &v4;
    __getBRContainersMonitorClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1D4DEAC2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getBRContainersMonitorClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!CloudDocsLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E9898E40;
    v5 = 0;
    CloudDocsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CloudDocsLibraryCore_frameworkLibrary)
    __getBRContainersMonitorClass_block_invoke_cold_1(&v3);
  result = objc_getClass("BRContainersMonitor");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getBRContainersMonitorClass_block_invoke_cold_2();
  getBRContainersMonitorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAKAppleIDSessionClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!AuthKitLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E9898E58;
    v5 = 0;
    AuthKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AuthKitLibraryCore_frameworkLibrary)
    __getAKAppleIDSessionClass_block_invoke_cold_1(&v3);
  result = objc_getClass("AKAppleIDSession");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAKAppleIDSessionClass_block_invoke_cold_2();
  getAKAppleIDSessionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1D4DEC03C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D4DEC7F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,id a48)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a48);
  _Unwind_Resume(a1);
}

void sub_1D4DECC30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D4DED60C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1D4DED670(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1D4DED814(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D4DEF004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, id obj)
{
  objc_sync_exit(obj);
  objc_sync_exit(a10);
  _Unwind_Resume(a1);
}

uint64_t C2MPMetricReadFrom(uint64_t a1, uint64_t a2)
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
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  C2MPDeviceInfo *v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  char v41;
  unsigned int v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  char v47;
  unsigned int v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t result;
  uint64_t v57;
  BOOL v58;
  uint64_t v59;

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
    v17 = v10 >> 3;
    if ((int)(v10 >> 3) <= 99)
    {
      switch((int)v17)
      {
        case 1:
          v24 = 0;
          v25 = 0;
          v26 = 0;
          *(_BYTE *)(a1 + 100) |= 8u;
          break;
        case 2:
          v30 = objc_alloc_init(C2MPDeviceInfo);
          objc_storeStrong((id *)(a1 + 40), v30);
          if (!PBReaderPlaceMark() || (C2MPDeviceInfoReadFrom(v30, a2) & 1) == 0)
            goto LABEL_113;
          goto LABEL_82;
        case 3:
          v30 = objc_alloc_init(C2MPCloudKitInfo);
          objc_storeStrong((id *)(a1 + 32), v30);
          if (!PBReaderPlaceMark() || (C2MPCloudKitInfoReadFrom(v30, a2) & 1) == 0)
            goto LABEL_113;
          goto LABEL_82;
        case 4:
          v30 = objc_alloc_init(C2MPServerInfo);
          objc_storeStrong((id *)(a1 + 88), v30);
          if (!PBReaderPlaceMark() || !C2MPServerInfoReadFrom((uint64_t)v30, a2))
            goto LABEL_113;
          goto LABEL_82;
        default:
          goto LABEL_83;
      }
      while (1)
      {
        v27 = *v3;
        v28 = *(_QWORD *)(a2 + v27);
        if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
          break;
        v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
        *(_QWORD *)(a2 + v27) = v28 + 1;
        v26 |= (unint64_t)(v29 & 0x7F) << v24;
        if ((v29 & 0x80) == 0)
          goto LABEL_90;
        v24 += 7;
        v14 = v25++ >= 9;
        if (v14)
        {
          LODWORD(v26) = 0;
          goto LABEL_92;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_90:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v26) = 0;
LABEL_92:
      *(_DWORD *)(a1 + 56) = v26;
      goto LABEL_111;
    }
    switch((int)v17)
    {
      case 'd':
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 100) |= 4u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
            break;
          v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0)
            goto LABEL_86;
          v18 += 7;
          v14 = v19++ >= 9;
          if (v14)
          {
            v20 = 0;
            goto LABEL_88;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_86:
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_88:
        v57 = 24;
        goto LABEL_101;
      case 'e':
        v31 = 0;
        v32 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 100) |= 1u;
        while (2)
        {
          v33 = *v3;
          v34 = *(_QWORD *)(a2 + v33);
          if (v34 == -1 || v34 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v35 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v34);
            *(_QWORD *)(a2 + v33) = v34 + 1;
            v20 |= (unint64_t)(v35 & 0x7F) << v31;
            if (v35 < 0)
            {
              v31 += 7;
              v14 = v32++ >= 9;
              if (v14)
              {
                v20 = 0;
                goto LABEL_96;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_96:
        v57 = 8;
        goto LABEL_101;
      case 'f':
        v36 = 0;
        v37 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 100) |= 2u;
        while (2)
        {
          v38 = *v3;
          v39 = *(_QWORD *)(a2 + v38);
          if (v39 == -1 || v39 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v40 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v39);
            *(_QWORD *)(a2 + v38) = v39 + 1;
            v20 |= (unint64_t)(v40 & 0x7F) << v36;
            if (v40 < 0)
            {
              v36 += 7;
              v14 = v37++ >= 9;
              if (v14)
              {
                v20 = 0;
                goto LABEL_100;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_100:
        v57 = 16;
LABEL_101:
        *(_QWORD *)(a1 + v57) = v20;
        goto LABEL_111;
      case 'g':
        v41 = 0;
        v42 = 0;
        v43 = 0;
        *(_BYTE *)(a1 + 100) |= 0x10u;
        while (2)
        {
          v44 = *v3;
          v45 = *(_QWORD *)(a2 + v44);
          if (v45 == -1 || v45 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v46 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v45);
            *(_QWORD *)(a2 + v44) = v45 + 1;
            v43 |= (unint64_t)(v46 & 0x7F) << v41;
            if (v46 < 0)
            {
              v41 += 7;
              v14 = v42++ >= 9;
              if (v14)
              {
                v43 = 0;
                goto LABEL_105;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v43 = 0;
LABEL_105:
        v58 = v43 != 0;
        v59 = 96;
        goto LABEL_110;
      case 'h':
        v47 = 0;
        v48 = 0;
        v49 = 0;
        *(_BYTE *)(a1 + 100) |= 0x20u;
        while (2)
        {
          v50 = *v3;
          v51 = *(_QWORD *)(a2 + v50);
          if (v51 == -1 || v51 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v52 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v51);
            *(_QWORD *)(a2 + v50) = v51 + 1;
            v49 |= (unint64_t)(v52 & 0x7F) << v47;
            if (v52 < 0)
            {
              v47 += 7;
              v14 = v48++ >= 9;
              if (v14)
              {
                v49 = 0;
                goto LABEL_109;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v49 = 0;
LABEL_109:
        v58 = v49 != 0;
        v59 = 97;
LABEL_110:
        *(_BYTE *)(a1 + v59) = v58;
        goto LABEL_111;
      case 'i':
        PBReaderReadString();
        v53 = objc_claimAutoreleasedReturnValue();
        v54 = 72;
        goto LABEL_70;
      case 'j':
        PBReaderReadString();
        v53 = objc_claimAutoreleasedReturnValue();
        v54 = 80;
LABEL_70:
        v55 = *(void **)(a1 + v54);
        *(_QWORD *)(a1 + v54) = v53;

        goto LABEL_111;
      default:
        if ((_DWORD)v17 != 200)
        {
          if ((_DWORD)v17 != 201)
          {
LABEL_83:
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
            goto LABEL_111;
          }
          v30 = objc_alloc_init(C2MPGenericEvent);
          objc_storeStrong((id *)(a1 + 48), v30);
          if (!PBReaderPlaceMark() || (C2MPGenericEventReadFrom((uint64_t)v30, a2) & 1) == 0)
            goto LABEL_113;
          goto LABEL_82;
        }
        v30 = objc_alloc_init(C2MPNetworkEvent);
        objc_storeStrong((id *)(a1 + 64), v30);
        if (PBReaderPlaceMark() && (C2MPNetworkEventReadFrom((id *)&v30->super.super.isa, a2) & 1) != 0)
        {
LABEL_82:
          PBReaderRecallMark();

LABEL_111:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_113:

        return 0;
    }
  }
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

void sub_1D4DF1314(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1D4DF1474(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D4DF19CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id obj)
{
  void *v13;

  objc_sync_exit(v13);
  _Unwind_Resume(a1);
}

uint64_t C2MPCloudKitOperationGroupInfoReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v19;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  void *v26;
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
      if ((v10 >> 3) == 101)
      {
        v20 = 0;
        v21 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + 28) |= 1u;
        while (1)
        {
          v23 = *v3;
          v24 = *(_QWORD *)(a2 + v23);
          if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            break;
          v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
          *(_QWORD *)(a2 + v23) = v24 + 1;
          v22 |= (unint64_t)(v25 & 0x7F) << v20;
          if ((v25 & 0x80) == 0)
            goto LABEL_34;
          v20 += 7;
          v14 = v21++ >= 9;
          if (v14)
          {
            v22 = 0;
            goto LABEL_36;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_34:
        if (*(_BYTE *)(a2 + *v5))
          v22 = 0;
LABEL_36:
        *(_BYTE *)(a1 + 24) = v22 != 0;
      }
      else
      {
        if ((_DWORD)v17 == 2)
        {
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 16;
        }
        else
        {
          if ((_DWORD)v17 != 1)
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
            continue;
          }
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 8;
        }
        v26 = *(void **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;

      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t c2_callstack_annotation_ThirdParty(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

uint64_t C2MPDeviceInfoReadFrom(_BYTE *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  int *v8;
  int *v9;
  int *v10;
  char v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  BOOL v17;
  int v18;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int *v23;
  int *v24;
  int *v25;
  C2MPInternalTestConfig *v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  void *v33;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = &OBJC_IVAR___C2MPCloudKitInfo__container;
    v8 = &OBJC_IVAR___C2MPCloudKitInfo__container;
    v9 = &OBJC_IVAR___C2MPCloudKitInfo__container;
    v10 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      while (1)
      {
        v14 = *v3;
        v15 = *(_QWORD *)(a2 + v14);
        if (v15 == -1 || v15 >= *(_QWORD *)(a2 + *v4))
          break;
        v16 = *(_BYTE *)(*(_QWORD *)(a2 + *v10) + v15);
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
      if (v18 || (v13 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v20 = v13 >> 3;
      if ((int)(v13 >> 3) <= 200)
      {
        switch((int)v20)
        {
          case 'e':
            PBReaderReadString();
            v21 = objc_claimAutoreleasedReturnValue();
            v22 = v7[173];
            goto LABEL_44;
          case 'f':
            PBReaderReadString();
            v21 = objc_claimAutoreleasedReturnValue();
            v22 = v8[174];
            goto LABEL_44;
          case 'g':
            PBReaderReadString();
            v21 = objc_claimAutoreleasedReturnValue();
            v22 = v9[175];
            goto LABEL_44;
          case 'h':
            PBReaderReadString();
            v21 = objc_claimAutoreleasedReturnValue();
            v22 = 40;
            goto LABEL_44;
          case 'i':
            v27 = 0;
            v28 = 0;
            v29 = 0;
            a1[84] |= 1u;
            break;
          default:
            goto LABEL_47;
        }
        while (1)
        {
          v30 = *v3;
          v31 = *(_QWORD *)(a2 + v30);
          if (v31 == -1 || v31 >= *(_QWORD *)(a2 + *v4))
            break;
          v32 = *(_BYTE *)(*(_QWORD *)(a2 + *v10) + v31);
          *(_QWORD *)(a2 + v30) = v31 + 1;
          v29 |= (unint64_t)(v32 & 0x7F) << v27;
          if ((v32 & 0x80) == 0)
            goto LABEL_50;
          v27 += 7;
          v17 = v28++ >= 9;
          if (v17)
          {
            v29 = 0;
            goto LABEL_52;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_50:
        if (*(_BYTE *)(a2 + *v5))
          v29 = 0;
LABEL_52:
        a1[80] = v29 != 0;
        goto LABEL_45;
      }
      if ((int)v20 <= 202)
        break;
      if ((_DWORD)v20 == 203)
      {
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 24;
        goto LABEL_44;
      }
      if ((_DWORD)v20 == 301)
      {
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 72;
        goto LABEL_44;
      }
      if ((_DWORD)v20 != 302)
        goto LABEL_47;
      v23 = v9;
      v24 = v8;
      v25 = v7;
      v26 = objc_alloc_init(C2MPInternalTestConfig);
      objc_msgSend(a1, "addInternalTestConfig:", v26);
      if (!PBReaderPlaceMark() || !C2MPInternalTestConfigReadFrom((uint64_t)v26, a2))
      {

        return 0;
      }
      PBReaderRecallMark();

      v7 = v25;
      v8 = v24;
      v9 = v23;
LABEL_45:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    if ((_DWORD)v20 == 201)
    {
      PBReaderReadString();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = 16;
      goto LABEL_44;
    }
    if ((_DWORD)v20 == 202)
    {
      PBReaderReadString();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = 32;
LABEL_44:
      v33 = *(void **)&a1[v22];
      *(_QWORD *)&a1[v22] = v21;

      goto LABEL_45;
    }
LABEL_47:
    result = PBReaderSkipValueWithTag();
    if (!(_DWORD)result)
      return result;
    goto LABEL_45;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t sub_1D4DF34B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a5;
  return OUTLINED_FUNCTION_4();
}

uint64_t sub_1D4DF3544(void *a1, void *a2, void *a3, uint64_t a4, const void *a5, void *a6)
{
  _QWORD *v6;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD *v21;

  v6[4] = a3;
  v6[5] = a6;
  v6[2] = a1;
  v6[3] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4F5578);
  v6[6] = swift_task_alloc();
  v13 = swift_task_alloc();
  v6[7] = v13;
  v14 = swift_task_alloc();
  v6[8] = v14;
  v6[9] = _Block_copy(a5);
  if (a4)
  {
    sub_1D4DF6250();
    v15 = 0;
  }
  else
  {
    v15 = 1;
  }
  v16 = sub_1D4DF625C();
  __swift_storeEnumTagSinglePayload(v13, v15, 1, v16);
  v17 = a6;
  v18 = a1;
  v19 = a2;
  v20 = a3;
  v21 = (_QWORD *)swift_task_alloc();
  v6[10] = v21;
  *v21 = v6;
  v21[1] = sub_1D4DF3678;
  v21[2] = v14;
  v21[3] = v13;
  return swift_task_switch();
}

uint64_t sub_1D4DF3678(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, _QWORD *a16, uint64_t a17, uint64_t a18)
{
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;

  OUTLINED_FUNCTION_27();
  a17 = v19;
  a18 = v20;
  a16 = (_QWORD *)v18;
  v21 = *(_QWORD **)v18;
  a16 = v21;
  v22 = v21[9];
  v23 = v21[7];
  v25 = (void *)v21[4];
  v24 = (void *)v21[5];
  v27 = (void *)v21[2];
  v26 = (void *)v21[3];
  OUTLINED_FUNCTION_3(&a16);

  sub_1D4DF5748(v23, &qword_1ED4F5578);
  if (v22)
  {
    v28 = (void *)v21[6];
    sub_1D4DF5780(v21[8], (uint64_t)v28);
    v29 = sub_1D4DF625C();
    OUTLINED_FUNCTION_31(v29);
    if (!v30)
    {
      v31 = v21[6];
      v28 = (void *)sub_1D4DF6244();
      OUTLINED_FUNCTION_22(v31, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 8));
    }
    OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_30();

  }
  swift_task_dealloc();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_20();
  return OUTLINED_FUNCTION_6(*(uint64_t (**)(void))(v18 + 8));
}

uint64_t sub_1D4DF3744(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v10;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4F5518);
  MEMORY[0x1E0C80A78]();
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1D4DF62D4();
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 1, 1, v6);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = a1;
  v7[5] = a2;
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = &_MergedGlobals;
  v8[5] = v7;
  sub_1D4DF5458((uint64_t)v5, (uint64_t)&unk_1ED4F55B8, (uint64_t)v8);
  return swift_release();
}

uint64_t sub_1D4DF381C()
{
  return OUTLINED_FUNCTION_4();
}

uint64_t sub_1D4DF3828()
{
  uint64_t v0;
  id v1;

  sub_1D4DF5200();
  v1 = sub_1D4DF3868(0, 0xC000000000000000);
  return (*(uint64_t (**)(id))(v0 + 8))(v1);
}

id sub_1D4DF3868(uint64_t a1, unint64_t a2)
{
  id v4;
  void *v5;
  id v6;

  v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v5 = (void *)sub_1D4DF6268();
  v6 = objc_msgSend(v4, sel_initWithData_, v5);
  sub_1D4DF4F28(a1, a2);

  return v6;
}

uint64_t sub_1D4DF3950(void *a1, void *a2, void *aBlock, void *a4)
{
  _QWORD *v4;
  id v8;
  id v9;
  id v10;
  _QWORD *v11;

  v4[3] = a2;
  v4[4] = a4;
  v4[2] = a1;
  v4[5] = _Block_copy(aBlock);
  v8 = a4;
  v9 = a1;
  v10 = a2;
  v11 = (_QWORD *)swift_task_alloc();
  v4[6] = v11;
  *v11 = v4;
  v11[1] = sub_1D4DF39CC;
  return sub_1D4DF381C();
}

uint64_t sub_1D4DF39CC(void *a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;

  OUTLINED_FUNCTION_13();
  v4 = v1[5];
  v6 = (void *)v1[3];
  v5 = (void *)v1[4];
  v7 = (void *)v1[2];
  OUTLINED_FUNCTION_3(v8);

  if (v4)
  {
    OUTLINED_FUNCTION_5();

    OUTLINED_FUNCTION_30();
  }
  else
  {

  }
  return OUTLINED_FUNCTION_11(*(uint64_t (**)(void))(v2 + 8));
}

void sub_1D4DF3A3C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v5 = v3;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED4F5530);
  OUTLINED_FUNCTION_21();
  v7 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v17 - v10;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4F5588);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_29();
  if (a3)
  {
    v14 = v5
        + OBJC_IVAR____TtCE2C2CSo16C2RequestManagerP33_84EE1E58F246DCD3EE191A742089E5F125C2AsyncDataStreamDelegate_bytesStreamContinuation;
    OUTLINED_FUNCTION_26();
    sub_1D4DF51C8(v14, (uint64_t)v11, (uint64_t *)&unk_1ED4F5530);
    if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12) == 1)
    {
      OUTLINED_FUNCTION_34();
      sub_1D4DF5748((uint64_t)v11, (uint64_t *)&unk_1ED4F5530);
      v15 = OBJC_IVAR____TtCE2C2CSo16C2RequestManagerP33_84EE1E58F246DCD3EE191A742089E5F125C2AsyncDataStreamDelegate_responseNeeded;
      if (*(_BYTE *)(v5
                    + OBJC_IVAR____TtCE2C2CSo16C2RequestManagerP33_84EE1E58F246DCD3EE191A742089E5F125C2AsyncDataStreamDelegate_responseNeeded) == 1)
      {
        v17 = a3;
        OUTLINED_FUNCTION_34();
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED4F5508);
        sub_1D4DF6298();

        *(_BYTE *)(v5 + v15) = 0;
      }
      else
      {

      }
    }
    else
    {
      (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))(v4, v11, v12);
      v17 = a3;
      OUTLINED_FUNCTION_34();
      sub_1D4DF62F8();
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v4, v12);
    }
  }
  else
  {
    v16 = v5
        + OBJC_IVAR____TtCE2C2CSo16C2RequestManagerP33_84EE1E58F246DCD3EE191A742089E5F125C2AsyncDataStreamDelegate_bytesStreamContinuation;
    OUTLINED_FUNCTION_26();
    sub_1D4DF51C8(v16, (uint64_t)v9, (uint64_t *)&unk_1ED4F5530);
    if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v12) == 1)
    {
      __break(1u);
    }
    else
    {
      v17 = 0;
      sub_1D4DF62F8();
      (*(void (**)(char *, uint64_t))(v13 + 8))(v9, v12);
    }
  }
}

uint64_t sub_1D4DF3CAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a4;
  return OUTLINED_FUNCTION_4();
}

uint64_t sub_1D4DF3CBC()
{
  uint64_t v0;

  sub_1D4DF51C8(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 16), &qword_1ED4F5578);
  return OUTLINED_FUNCTION_18(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1D4DF3D00(void *a1, void *a2, uint64_t a3, const void *a4, void *a5)
{
  _QWORD *v5;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;

  v5[3] = a2;
  v5[4] = a5;
  v5[2] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4F5578);
  v5[5] = swift_task_alloc();
  v11 = swift_task_alloc();
  v5[6] = v11;
  v12 = swift_task_alloc();
  v5[7] = v12;
  v5[8] = _Block_copy(a4);
  if (a3)
  {
    sub_1D4DF6250();
    v13 = 0;
  }
  else
  {
    v13 = 1;
  }
  v14 = sub_1D4DF625C();
  __swift_storeEnumTagSinglePayload(v11, v13, 1, v14);
  v15 = a5;
  v16 = a1;
  v17 = a2;
  v18 = (_QWORD *)swift_task_alloc();
  v5[9] = v18;
  *v18 = v5;
  v18[1] = sub_1D4DF3E20;
  return sub_1D4DF3CAC(v12, v19, v20, v11);
}

uint64_t sub_1D4DF3E20()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  _QWORD *v12;

  v1 = *(_QWORD **)v0;
  v12 = v1;
  v2 = v1[8];
  v3 = v1[6];
  v5 = (void *)v1[3];
  v4 = (void *)v1[4];
  v6 = (void *)v1[2];
  OUTLINED_FUNCTION_3(&v12);

  sub_1D4DF5748(v3, &qword_1ED4F5578);
  if (v2)
  {
    v7 = (void *)v1[5];
    sub_1D4DF5780(v1[7], (uint64_t)v7);
    v8 = sub_1D4DF625C();
    OUTLINED_FUNCTION_31(v8);
    if (!v9)
    {
      v10 = v1[5];
      v7 = (void *)sub_1D4DF6244();
      OUTLINED_FUNCTION_22(v10, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8));
    }
    OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_30();

  }
  swift_task_dealloc();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_20();
  return OUTLINED_FUNCTION_11(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1D4DF3EF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[2] = a3;
  v4[3] = v3;
  v4[4] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED4F5598);
  v4[5] = OUTLINED_FUNCTION_1();
  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED4F5508);
  v4[6] = v5;
  v4[7] = *(_QWORD *)(v5 - 8);
  v4[8] = OUTLINED_FUNCTION_1();
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED4F5520);
  v4[9] = v6;
  v4[10] = *(_QWORD *)(v6 - 8);
  v4[11] = OUTLINED_FUNCTION_1();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4F5560);
  v4[12] = v7;
  v4[13] = *(_QWORD *)(v7 - 8);
  v4[14] = swift_task_alloc();
  v4[15] = swift_task_alloc();
  OUTLINED_FUNCTION_25();
  return OUTLINED_FUNCTION_2();
}

uint64_t sub_1D4DF3FB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;

  v2 = *(_QWORD *)(v0 + 80);
  v1 = *(_QWORD *)(v0 + 88);
  v3 = *(_QWORD *)(v0 + 72);
  v4 = *(_QWORD *)(v0 + 24);
  *(_QWORD *)(swift_task_alloc() + 16) = v4;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v1, *MEMORY[0x1E0DF0A50], v3);
  sub_1D4DF6304();
  OUTLINED_FUNCTION_44();
  v5 = OBJC_IVAR____TtCE2C2CSo16C2RequestManagerP33_84EE1E58F246DCD3EE191A742089E5F125C2AsyncDataStreamDelegate_responseNeeded;
  v6 = *(_QWORD *)(v0 + 120);
  if (*(_BYTE *)(v4
                + OBJC_IVAR____TtCE2C2CSo16C2RequestManagerP33_84EE1E58F246DCD3EE191A742089E5F125C2AsyncDataStreamDelegate_responseNeeded) != 1)
  {
    OUTLINED_FUNCTION_37(*(_QWORD *)(v0 + 104));
    goto LABEL_5;
  }
  v8 = *(_QWORD *)(v0 + 104);
  v7 = *(_QWORD *)(v0 + 112);
  v9 = *(_QWORD *)(v0 + 16);
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v0 + 56) + 16))(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 24)+ OBJC_IVAR____TtCE2C2CSo16C2RequestManagerP33_84EE1E58F246DCD3EE191A742089E5F125C2AsyncDataStreamDelegate_responseConitnuation, *(_QWORD *)(v0 + 48));
  result = OUTLINED_FUNCTION_40(v7, v6, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 16));
  if (v9)
  {
    v11 = *(_QWORD *)(v0 + 96);
    v12 = *(_QWORD *)(v0 + 104);
    v13 = *(_QWORD *)(v0 + 64);
    v19 = *(_QWORD *)(v0 + 56);
    v20 = *(_QWORD *)(v0 + 120);
    v15 = *(_QWORD *)(v0 + 40);
    v14 = *(_QWORD *)(v0 + 48);
    v16 = *(void **)(v0 + 16);
    v17 = *(int *)(*(_QWORD *)(v0 + 32) + 48);
    OUTLINED_FUNCTION_40(v15, *(_QWORD *)(v0 + 112), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 32));
    *(_QWORD *)(v15 + v17) = v16;
    v18 = v16;
    sub_1D4DF62A4();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v13, v14);
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v20, v11);
    *(_BYTE *)(v4 + v5) = 0;
LABEL_5:
    swift_task_dealloc();
    OUTLINED_FUNCTION_24();
    OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_36();
    OUTLINED_FUNCTION_44();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(1);
  }
  __break(1u);
  return result;
}

void sub_1D4DF4158(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED4F5530);
  OUTLINED_FUNCTION_21();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_28();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4F5588);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(v2, a1, v6);
  __swift_storeEnumTagSinglePayload(v2, 0, 1, v6);
  v7 = a2
     + OBJC_IVAR____TtCE2C2CSo16C2RequestManagerP33_84EE1E58F246DCD3EE191A742089E5F125C2AsyncDataStreamDelegate_bytesStreamContinuation;
  swift_beginAccess();
  sub_1D4DF5180(v2, v7);
  swift_endAccess();
  OUTLINED_FUNCTION_39();
}

uint64_t sub_1D4DF4224(void *a1, int a2, void *a3, void *a4, void *a5, void *aBlock, uint64_t a7, uint64_t a8)
{
  void *v13;
  _QWORD *v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v13 = _Block_copy(aBlock);
  v14 = (_QWORD *)OUTLINED_FUNCTION_38();
  v14[2] = a3;
  v14[3] = a4;
  v14[4] = a5;
  v14[5] = v13;
  v14[6] = a1;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a1;
  return OUTLINED_FUNCTION_7(a8, (uint64_t)v14);
}

uint64_t sub_1D4DF429C(void *a1, void *a2, void *a3, void *aBlock, void *a5)
{
  _QWORD *v5;
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  uint64_t v14;

  v5[4] = a3;
  v5[5] = a5;
  v5[2] = a1;
  v5[3] = a2;
  v5[6] = _Block_copy(aBlock);
  a5;
  v10 = a1;
  v11 = a2;
  v12 = a3;
  v13 = (_QWORD *)swift_task_alloc();
  v5[7] = v13;
  *v13 = v5;
  v13[1] = sub_1D4DF4330;
  return sub_1D4DF3EF4((uint64_t)v13, v14, (uint64_t)a3);
}

uint64_t sub_1D4DF4330()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD *v7;

  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_13();
  v2 = v0[6];
  v4 = (void *)v0[4];
  v3 = (void *)v0[5];
  v6 = (void *)v0[2];
  v5 = (void *)v0[3];
  OUTLINED_FUNCTION_3(v7);

  if (v2)
  {
    OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_30();
  }
  return OUTLINED_FUNCTION_6(*(uint64_t (**)(void))(v1 + 8));
}

void sub_1D4DF438C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[3];

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4F5588);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED4F5530);
  OUTLINED_FUNCTION_21();
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_29();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFEFB748);
  OUTLINED_FUNCTION_21();
  MEMORY[0x1E0C80A78](v14);
  OUTLINED_FUNCTION_28();
  v15 = v4
      + OBJC_IVAR____TtCE2C2CSo16C2RequestManagerP33_84EE1E58F246DCD3EE191A742089E5F125C2AsyncDataStreamDelegate_bytesStreamContinuation;
  OUTLINED_FUNCTION_26();
  sub_1D4DF51C8(v15, v6, (uint64_t *)&unk_1ED4F5530);
  if (__swift_getEnumTagSinglePayload(v6, 1, v9))
  {
    sub_1D4DF5748(v6, (uint64_t *)&unk_1ED4F5530);
    v16 = 1;
LABEL_5:
    v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFEFB750);
    __swift_storeEnumTagSinglePayload(v5, v16, 1, v17);
    sub_1D4DF5748(v5, &qword_1EFEFB748);
    OUTLINED_FUNCTION_23();
    return;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v6, v9);
  sub_1D4DF5748(v6, (uint64_t *)&unk_1ED4F5530);
  if (a4 >> 60 != 15)
  {
    v18[1] = a3;
    v18[2] = a4;
    sub_1D4DF5134(a3, a4);
    sub_1D4DF62EC();
    OUTLINED_FUNCTION_22((uint64_t)v12, *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8));
    v16 = 0;
    goto LABEL_5;
  }
  __break(1u);
}

void sub_1D4DF45D4()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_1D4DF460C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)_s25C2AsyncDataStreamDelegateCMa();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t C2RequestManager.dataStream(for:options:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  v4[6] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED4F5598);
  v4[7] = OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_25();
  return OUTLINED_FUNCTION_2();
}

uint64_t sub_1D4DF46E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  _QWORD *v4;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v2;
  v3 = *(_OWORD *)(v0 + 24);
  *(_QWORD *)(v2 + 16) = v1;
  *(_OWORD *)(v2 + 24) = v3;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v4;
  *v4 = v0;
  v4[1] = sub_1D4DF477C;
  OUTLINED_FUNCTION_25();
  return sub_1D4DF631C();
}

uint64_t sub_1D4DF477C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  OUTLINED_FUNCTION_13();
  *v3 = *v2;
  *(_QWORD *)(v0 + 80) = v1;
  swift_task_dealloc();
  if (!v1)
    swift_task_dealloc();
  OUTLINED_FUNCTION_25();
  return swift_task_switch();
}

uint64_t sub_1D4DF47DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 56) + *(int *)(*(_QWORD *)(v0 + 48) + 48));
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4F5560);
  OUTLINED_FUNCTION_33(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 32));
  OUTLINED_FUNCTION_24();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_1D4DF4844()
{
  uint64_t v0;

  swift_task_dealloc();
  OUTLINED_FUNCTION_24();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1D8269C30]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_1D4DF48BC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  objc_class *v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  objc_super v22;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED4F5508);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v10 + 16))(v9, a1);
  v11 = (objc_class *)_s25C2AsyncDataStreamDelegateCMa();
  v12 = objc_allocWithZone(v11);
  v13 = (uint64_t)&v12[OBJC_IVAR____TtCE2C2CSo16C2RequestManagerP33_84EE1E58F246DCD3EE191A742089E5F125C2AsyncDataStreamDelegate_bytesStreamContinuation];
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4F5588);
  __swift_storeEnumTagSinglePayload(v13, 1, 1, v14);
  v12[OBJC_IVAR____TtCE2C2CSo16C2RequestManagerP33_84EE1E58F246DCD3EE191A742089E5F125C2AsyncDataStreamDelegate_responseNeeded] = 1;
  v15 = &v12[OBJC_IVAR____TtCE2C2CSo16C2RequestManagerP33_84EE1E58F246DCD3EE191A742089E5F125C2AsyncDataStreamDelegate_responseConitnuation];
  v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED4F5508);
  v17 = *(_QWORD *)(v16 - 8);
  (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v15, v9, v16);
  v22.receiver = v12;
  v22.super_class = v11;
  v18 = objc_msgSendSuper2(&v22, sel_init);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v9, v16);
  v19 = (void *)sub_1D4DF6244();
  v20 = objc_msgSend(a2, sel_createDataTaskWithRequest_options_delegate_sessionHandle_, v19, a4, v18, 0);

  if (v20)
  {
    v21 = v20;
    objc_msgSend(v21, sel_resume);

  }
  OUTLINED_FUNCTION_23();
}

void sub_1D4DF4A48(uint64_t a1)
{
  uint64_t v1;

  sub_1D4DF48BC(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t C2RequestManager.data(for:options:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED4F5550);
  v2[6] = v5;
  v2[7] = *(_QWORD *)(v5 - 8);
  v2[8] = OUTLINED_FUNCTION_1();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4F5560);
  v2[9] = v6;
  v2[10] = *(_QWORD *)(v6 - 8);
  v2[11] = swift_task_alloc();
  v7 = swift_task_alloc();
  v2[12] = v7;
  v8 = (_QWORD *)swift_task_alloc();
  v2[13] = v8;
  *v8 = v2;
  v8[1] = sub_1D4DF4B18;
  return C2RequestManager.dataStream(for:options:)(v7, a1, a2);
}

uint64_t sub_1D4DF4B18(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 112) = a1;
  *(_QWORD *)(v3 + 120) = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_25();
  return OUTLINED_FUNCTION_2();
}

uint64_t sub_1D4DF4B78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = *(_QWORD *)(v0 + 88);
  v1 = *(_QWORD *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 80);
  *(_OWORD *)(v0 + 16) = xmmword_1D4DFAB80;
  OUTLINED_FUNCTION_40(v2, v1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16));
  sub_1D4DF4EEC((unint64_t *)&unk_1ED4F5568, &qword_1ED4F5560, MEMORY[0x1E0DF0AE0]);
  sub_1D4DF62E0();
  sub_1D4DF4EEC((unint64_t *)&unk_1ED4F5540, (uint64_t *)&unk_1ED4F5550, MEMORY[0x1E0DF0AC0]);
  *(_QWORD *)(v0 + 128) = v4;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 136) = v5;
  *v5 = v0;
  v5[1] = sub_1D4DF4C54;
  return sub_1D4DF62BC();
}

uint64_t sub_1D4DF4C54()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3(v2);
  if (v1)
  {
    *(_QWORD *)(v0 + 152) = v1;
    sub_1D4DF4F28(0, 0xC000000000000000);
    OUTLINED_FUNCTION_15();
  }
  OUTLINED_FUNCTION_25();
  return OUTLINED_FUNCTION_17();
}

uint64_t sub_1D4DF4CB8()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  _QWORD *v9;

  OUTLINED_FUNCTION_27();
  v1 = *(_QWORD *)(v0 + 40);
  if (v1 >> 60 == 15)
  {
    v2 = *(_QWORD *)(v0 + 96);
    v3 = *(_QWORD *)(v0 + 72);
    v4 = *(_QWORD *)(v0 + 80);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 56) + 8))(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 48));
    sub_1D4DF4F6C(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
    v5 = *(_QWORD *)(v0 + 16);
    v6 = *(_QWORD *)(v0 + 24);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
    OUTLINED_FUNCTION_24();
    OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_44();
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v0 + 8))(v5, v6, *(_QWORD *)(v0 + 112));
  }
  else
  {
    v8 = *(_QWORD *)(v0 + 32);
    sub_1D4DF6280();
    sub_1D4DF4F6C(v8, v1);
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 144) = v9;
    *v9 = v0;
    v9[1] = sub_1D4DF4DCC;
    return sub_1D4DF62BC();
  }
}

uint64_t sub_1D4DF4DCC()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  unint64_t v4;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3(v2);
  if (v1)
  {
    v3 = v0[2];
    v4 = v0[3];
    v0[19] = v1;
    sub_1D4DF4F28(v3, v4);
    OUTLINED_FUNCTION_15();
  }
  OUTLINED_FUNCTION_25();
  return OUTLINED_FUNCTION_17();
}

uint64_t sub_1D4DF4E2C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_36();
  return OUTLINED_FUNCTION_16(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1D4DF4E74()
{
  uint64_t v0;

  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_36();
  return OUTLINED_FUNCTION_16(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1D8269C3C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_1D4DF4EEC(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    atomic_store(MEMORY[0x1D8269C48](a3, v5), a1);
  }
  OUTLINED_FUNCTION_43();
}

uint64_t sub_1D4DF4F28(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

uint64_t sub_1D4DF4F6C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1D4DF4F28(a1, a2);
  return a1;
}

uint64_t sub_1D4DF4F80()
{
  return _s25C2AsyncDataStreamDelegateCMa();
}

uint64_t _s25C2AsyncDataStreamDelegateCMa()
{
  uint64_t result;

  result = qword_1ED4F5678;
  if (!qword_1ED4F5678)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1D4DF4FC0()
{
  unint64_t v0;
  unint64_t v1;

  sub_1D4DF5050();
  if (v0 <= 0x3F)
  {
    sub_1D4DF50C4();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

void sub_1D4DF5050()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED4F5580)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1ED4F5598);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED4F55A8);
    v0 = sub_1D4DF62B0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED4F5580);
  }
}

void sub_1D4DF50C4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED4F5590)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED4F5588);
    v0 = sub_1D4DF6310();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED4F5590);
  }
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_1D4DF5134(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

void sub_1D4DF5178(uint64_t a1)
{
  uint64_t v1;

  sub_1D4DF4158(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_1D4DF5180(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED4F5530);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_1D4DF51C8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_33(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_43();
}

unint64_t sub_1D4DF5200()
{
  unint64_t result;

  result = qword_1EFEFB760;
  if (!qword_1EFEFB760)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EFEFB760);
  }
  return result;
}

uint64_t sub_1D4DF5240()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_35();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_9(v1, (uint64_t)sub_1D4DF595C);
  return OUTLINED_FUNCTION_12(v2, v3, v4, v5, v6, v7);
}

uint64_t sub_1D4DF528C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_1D4DF595C;
  return v6();
}

uint64_t sub_1D4DF52E4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_14(v1, (uint64_t)sub_1D4DF595C);
  return OUTLINED_FUNCTION_10(v2, v3, v4, v5, v6);
}

uint64_t sub_1D4DF5330(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_1D4DF595C;
  return v7();
}

uint64_t objectdestroy_9Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D4DF53B4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)OUTLINED_FUNCTION_35();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_1D4DF5434;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1EFEFB788 + dword_1EFEFB788))(a1, v4, v5, v6);
}

uint64_t sub_1D4DF5434()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0();
  return OUTLINED_FUNCTION_18(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1D4DF5458(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_1D4DF62D4();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_1D4DF5748(a1, &qword_1ED4F5518);
  }
  else
  {
    sub_1D4DF62C8();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1D4DF628C();
    swift_unknownObjectRelease();
  }
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1D4DF559C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1D4DF5600;
  return v6(a1);
}

uint64_t sub_1D4DF5600()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0();
  return OUTLINED_FUNCTION_18(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1D4DF5628()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D4DF564C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1D4DF5434;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EFEFB790 + dword_1EFEFB790))(a1, v4);
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_41();

  _Block_release(*(const void **)(v0 + 40));
  return swift_deallocObject();
}

uint64_t sub_1D4DF56FC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_35();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_9(v1, (uint64_t)sub_1D4DF595C);
  return OUTLINED_FUNCTION_12(v2, v3, v4, v5, v6, v7);
}

void sub_1D4DF5748(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_43();
}

uint64_t sub_1D4DF5780(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4F5578);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1D4DF57C8()
{
  uint64_t v0;

  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_41();
  _Block_release(*(const void **)(v0 + 32));

  return swift_deallocObject();
}

uint64_t sub_1D4DF57FC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_14(v1, (uint64_t)sub_1D4DF595C);
  return OUTLINED_FUNCTION_10(v2, v3, v4, v5, v6);
}

uint64_t sub_1D4DF5848()
{
  uint64_t v0;

  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_41();

  _Block_release(*(const void **)(v0 + 48));
  return swift_deallocObject();
}

uint64_t sub_1D4DF588C()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const void *v7;
  _QWORD *v8;

  OUTLINED_FUNCTION_27();
  v2 = (void *)v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = v0[5];
  v7 = (const void *)v0[6];
  v6 = (void *)v0[7];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v8;
  *v8 = v1;
  v8[1] = sub_1D4DF595C;
  return ((uint64_t (*)(void *, void *, void *, uint64_t, const void *, void *))((char *)&dword_1EFEFB7C0
                                                                                        + dword_1EFEFB7C0))(v2, v3, v4, v5, v7, v6);
}

void type metadata accessor for ResponseDisposition()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_1EFEFB7D0)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EFEFB7D0);
  }
}

uint64_t OUTLINED_FUNCTION_0()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_1()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_2()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_3@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_4()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_5()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 16))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_6(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_7(uint64_t a1, uint64_t a2)
{
  return sub_1D4DF3744(a1, a2);
}

void OUTLINED_FUNCTION_8(id a1)
{

}

uint64_t OUTLINED_FUNCTION_9@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = a2;
  return v2;
}

uint64_t OUTLINED_FUNCTION_10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  return a5();
}

uint64_t OUTLINED_FUNCTION_11(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_12(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(void))
{
  return a6();
}

void OUTLINED_FUNCTION_13()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t OUTLINED_FUNCTION_14@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = a2;
  return v2;
}

uint64_t OUTLINED_FUNCTION_15()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_16(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_17()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_18(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_20()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_22@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_24()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_26()
{
  return swift_beginAccess();
}

void OUTLINED_FUNCTION_30()
{
  const void *v0;

  _Block_release(v0);
}

uint64_t OUTLINED_FUNCTION_31(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(v1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_32()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_33@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

id OUTLINED_FUNCTION_34()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_35()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_36()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_37@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

uint64_t OUTLINED_FUNCTION_38()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

void OUTLINED_FUNCTION_41()
{
  uint64_t v0;

}

void OUTLINED_FUNCTION_42()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_44()
{
  return swift_task_dealloc();
}

void __getCloudTelemetryReporterClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCloudTelemetryReporterClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("C2ReportMetrics.m"), 29, CFSTR("Unable to find class %s"), "CloudTelemetryReporter");

  __break(1u);
}

void CloudTelemetryLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CloudTelemetryLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("C2ReportMetrics.m"), 19, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCloudTelemetryClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCloudTelemetryClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("C2ReportMetrics.m"), 20, CFSTR("Unable to find class %s"), "CloudTelemetry");

  __break(1u);
}

void __getBRContainersMonitorClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CloudDocsLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("C2RequestOptions.m"), 21, CFSTR("%s"), *a1);

  __break(1u);
}

void __getBRContainersMonitorClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getBRContainersMonitorClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("C2RequestOptions.m"), 22, CFSTR("Unable to find class %s"), "BRContainersMonitor");

  __break(1u);
}

void __getAKAppleIDSessionClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AuthKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("C2RequestOptions.m"), 26, CFSTR("%s"), *a1);

  __break(1u);
}

void __getAKAppleIDSessionClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAKAppleIDSessionClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("C2RequestOptions.m"), 27, CFSTR("Unable to find class %s"), "AKAppleIDSession");

  __break(1u);
  sub_1D4DF6244();
}

uint64_t sub_1D4DF6244()
{
  return MEMORY[0x1E0CADEE8]();
}

uint64_t sub_1D4DF6250()
{
  return MEMORY[0x1E0CADF08]();
}

uint64_t sub_1D4DF625C()
{
  return MEMORY[0x1E0CADF50]();
}

uint64_t sub_1D4DF6268()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1D4DF6274()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1D4DF6280()
{
  return MEMORY[0x1E0CB0298]();
}

uint64_t sub_1D4DF628C()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1D4DF6298()
{
  return MEMORY[0x1E0DF05C8]();
}

uint64_t sub_1D4DF62A4()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t sub_1D4DF62B0()
{
  return MEMORY[0x1E0DF05D8]();
}

uint64_t sub_1D4DF62BC()
{
  return MEMORY[0x1E0DF0688]();
}

uint64_t sub_1D4DF62C8()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1D4DF62D4()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1D4DF62E0()
{
  return MEMORY[0x1E0DF09D0]();
}

uint64_t sub_1D4DF62EC()
{
  return MEMORY[0x1E0DF0A68]();
}

uint64_t sub_1D4DF62F8()
{
  return MEMORY[0x1E0DF0A70]();
}

uint64_t sub_1D4DF6304()
{
  return MEMORY[0x1E0DF0AD8]();
}

uint64_t sub_1D4DF6310()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1D4DF631C()
{
  return MEMORY[0x1E0DF0EC0]();
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
  MEMORY[0x1E0C801D8](*(_QWORD *)&algorithm, key, keyLength, data, dataLength, macOut);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80368](data, *(_QWORD *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1E0C98518](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98558](allocator, capacity, theDict);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1E0DE2B68]();
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x1E0CB2DA0](table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
  MEMORY[0x1E0CB2DA8](table, key, value);
}

void NSMapRemove(NSMapTable *table, const void *key)
{
  MEMORY[0x1E0CB2DC8](table, key);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
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

CFDictionaryRef SecTaskCopyValuesForEntitlements(SecTaskRef task, CFArrayRef entitlements, CFErrorRef *error)
{
  return (CFDictionaryRef)MEMORY[0x1E0CD6600](task, entitlements, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1E0CD6620](allocator, token);
}

uint64_t TMConvertTicksToSeconds()
{
  return MEMORY[0x1E0D1A620]();
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

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x1E0DE92C0](strm, *(_QWORD *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x1E0DE92D0](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE92D8](strm, *(_QWORD *)&level, *(_QWORD *)&method, *(_QWORD *)&windowBits, *(_QWORD *)&memLevel, *(_QWORD *)&strategy, version, *(_QWORD *)&stream_size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return MEMORY[0x1E0C82CA0](data, applier);
}

uint64_t dispatch_data_create_alloc()
{
  return MEMORY[0x1E0C82CB8]();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
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

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x1E0DE93A0](strm, *(_QWORD *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x1E0DE93B8](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE93C8](strm, *(_QWORD *)&windowBits, version, *(_QWORD *)&stream_size);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

nw_advertise_descriptor_t nw_advertise_descriptor_create_bonjour_service(const char *name, const char *type, const char *domain)
{
  return (nw_advertise_descriptor_t)MEMORY[0x1E0CCEE78](name, type, domain);
}

void nw_advertise_descriptor_set_no_auto_rename(nw_advertise_descriptor_t advertise_descriptor, BOOL no_auto_rename)
{
  MEMORY[0x1E0CCEE80](advertise_descriptor, no_auto_rename);
}

nw_browse_descriptor_t nw_browse_descriptor_create_bonjour_service(const char *type, const char *domain)
{
  return (nw_browse_descriptor_t)MEMORY[0x1E0CCEF08](type, domain);
}

nw_endpoint_t nw_browse_result_copy_endpoint(nw_browse_result_t result)
{
  return (nw_endpoint_t)MEMORY[0x1E0CCEF20](result);
}

nw_browse_result_change_t nw_browse_result_get_changes(nw_browse_result_t old_result, nw_browse_result_t new_result)
{
  return MEMORY[0x1E0CCEF30](old_result, new_result);
}

void nw_browser_cancel(nw_browser_t browser)
{
  MEMORY[0x1E0CCEF38](browser);
}

nw_browser_t nw_browser_create(nw_browse_descriptor_t descriptor, nw_parameters_t parameters)
{
  return (nw_browser_t)MEMORY[0x1E0CCEF40](descriptor, parameters);
}

void nw_browser_set_browse_results_changed_handler(nw_browser_t browser, nw_browser_browse_results_changed_handler_t handler)
{
  MEMORY[0x1E0CCEF48](browser, handler);
}

void nw_browser_set_queue(nw_browser_t browser, dispatch_queue_t queue)
{
  MEMORY[0x1E0CCEF50](browser, queue);
}

void nw_browser_set_state_changed_handler(nw_browser_t browser, nw_browser_state_changed_handler_t state_changed_handler)
{
  MEMORY[0x1E0CCEF58](browser, state_changed_handler);
}

void nw_browser_start(nw_browser_t browser)
{
  MEMORY[0x1E0CCEF60](browser);
}

void nw_connection_cancel(nw_connection_t connection)
{
  MEMORY[0x1E0CCEFB8](connection);
}

nw_endpoint_t nw_connection_copy_endpoint(nw_connection_t connection)
{
  return (nw_endpoint_t)MEMORY[0x1E0CCEFF8](connection);
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return (nw_connection_t)MEMORY[0x1E0CCF030](endpoint, parameters);
}

void nw_connection_receive(nw_connection_t connection, uint32_t minimum_incomplete_length, uint32_t maximum_length, nw_connection_receive_completion_t completion)
{
  MEMORY[0x1E0CCF128](connection, *(_QWORD *)&minimum_incomplete_length, *(_QWORD *)&maximum_length, completion);
}

void nw_connection_send(nw_connection_t connection, dispatch_data_t content, nw_content_context_t context, BOOL is_complete, nw_connection_send_completion_t completion)
{
  MEMORY[0x1E0CCF168](connection, content, context, is_complete, completion);
}

uint64_t nw_connection_set_event_handler()
{
  return MEMORY[0x1E0CCF190]();
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
  MEMORY[0x1E0CCF1B0](connection, queue);
}

void nw_connection_start(nw_connection_t connection)
{
  MEMORY[0x1E0CCF1D8](connection);
}

nw_content_context_t nw_content_context_create(const char *context_identifier)
{
  return (nw_content_context_t)MEMORY[0x1E0CCF220](context_identifier);
}

const char *__cdecl nw_content_context_get_identifier(nw_content_context_t context)
{
  return (const char *)MEMORY[0x1E0CCF230](context);
}

nw_interface_t nw_data_transfer_report_copy_path_interface(nw_data_transfer_report_t report, uint32_t path_index)
{
  return (nw_interface_t)MEMORY[0x1E0CCF2F8](report, *(_QWORD *)&path_index);
}

uint32_t nw_data_transfer_report_get_path_count(nw_data_transfer_report_t report)
{
  return MEMORY[0x1E0CCF308](report);
}

uint64_t nw_data_transfer_report_get_received_application_byte_count(nw_data_transfer_report_t report, uint32_t path_index)
{
  return MEMORY[0x1E0CCF318](report, *(_QWORD *)&path_index);
}

uint64_t nw_data_transfer_report_get_sent_application_byte_count(nw_data_transfer_report_t report, uint32_t path_index)
{
  return MEMORY[0x1E0CCF320](report, *(_QWORD *)&path_index);
}

const char *__cdecl nw_endpoint_get_bonjour_service_name(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x1E0CCF3F0](endpoint);
}

const char *__cdecl nw_endpoint_get_bonjour_service_type(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x1E0CCF3F8](endpoint);
}

uint64_t nw_endpoint_get_description()
{
  return MEMORY[0x1E0CCF400]();
}

CFErrorRef nw_error_copy_cf_error(nw_error_t error)
{
  return (CFErrorRef)MEMORY[0x1E0CCF458](error);
}

uint64_t nw_interface_get_radio_type()
{
  return MEMORY[0x1E0CCF718]();
}

nw_interface_type_t nw_interface_get_type(nw_interface_t interface)
{
  return MEMORY[0x1E0CCF728](interface);
}

uint64_t nw_interface_radio_type_to_string()
{
  return MEMORY[0x1E0CCF730]();
}

nw_listener_t nw_listener_create(nw_parameters_t parameters)
{
  return (nw_listener_t)MEMORY[0x1E0CCF7D8](parameters);
}

void nw_listener_set_advertise_descriptor(nw_listener_t listener, nw_advertise_descriptor_t advertise_descriptor)
{
  MEMORY[0x1E0CCF7F8](listener, advertise_descriptor);
}

void nw_listener_set_new_connection_handler(nw_listener_t listener, nw_listener_new_connection_handler_t handler)
{
  MEMORY[0x1E0CCF810](listener, handler);
}

void nw_listener_set_queue(nw_listener_t listener, dispatch_queue_t queue)
{
  MEMORY[0x1E0CCF820](listener, queue);
}

void nw_listener_set_state_changed_handler(nw_listener_t listener, nw_listener_state_changed_handler_t handler)
{
  MEMORY[0x1E0CCF828](listener, handler);
}

void nw_listener_start(nw_listener_t listener)
{
  MEMORY[0x1E0CCF830](listener);
}

nw_parameters_t nw_parameters_create(void)
{
  return (nw_parameters_t)MEMORY[0x1E0CCF930]();
}

nw_parameters_t nw_parameters_create_secure_tcp(nw_parameters_configure_protocol_block_t configure_tls, nw_parameters_configure_protocol_block_t configure_tcp)
{
  return (nw_parameters_t)MEMORY[0x1E0CCF980](configure_tls, configure_tcp);
}

void nw_parameters_set_include_peer_to_peer(nw_parameters_t parameters, BOOL include_peer_to_peer)
{
  MEMORY[0x1E0CCFB08](parameters, include_peer_to_peer);
}

void nw_tcp_options_set_enable_keepalive(nw_protocol_options_t options, BOOL enable_keepalive)
{
  MEMORY[0x1E0CD0388](options, enable_keepalive);
}

void nw_tcp_options_set_keepalive_count(nw_protocol_options_t options, uint32_t keepalive_count)
{
  MEMORY[0x1E0CD0398](options, *(_QWORD *)&keepalive_count);
}

sec_protocol_options_t nw_tls_copy_sec_protocol_options(nw_protocol_options_t options)
{
  return (sec_protocol_options_t)MEMORY[0x1E0CD03C8](options);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
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

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
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

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84510](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84518](state);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

void sec_protocol_options_add_pre_shared_key(sec_protocol_options_t options, dispatch_data_t psk, dispatch_data_t psk_identity)
{
  MEMORY[0x1E0CD7210](options, psk, psk_identity);
}

void sec_protocol_options_append_tls_ciphersuite(sec_protocol_options_t options, tls_ciphersuite_t ciphersuite)
{
  MEMORY[0x1E0CD7240](options, ciphersuite);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1E0C85838](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

