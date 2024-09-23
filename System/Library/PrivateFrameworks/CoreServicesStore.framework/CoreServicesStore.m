void ___ZN8CSStore26GetLogEv_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.coreservicesstore", "default");
  v1 = (void *)CSStore2::GetLog(void)::result;
  CSStore2::GetLog(void)::result = (uint64_t)v0;

}

void ___ZN8CSStore25Store32_GetDispatchDataDeallocatorQueueEv_block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("CSStore2 dispatch data deallocation", attr);
  v2 = (void *)CSStore2::Store::_GetDispatchDataDeallocatorQueue(void)::result;
  CSStore2::Store::_GetDispatchDataDeallocatorQueue(void)::result = (uint64_t)v1;

}

_CSStore *_CSStoreCreateWithURL(uint64_t a1, _QWORD *a2)
{
  void *v4;
  _CSStore *v5;
  id v6;
  void *v7;
  id v9;

  v4 = (void *)MEMORY[0x1A85AA4B4]();
  v9 = 0;
  v5 = -[_CSStore initWithContentsOfURL:error:]([_CSStore alloc], "initWithContentsOfURL:error:", a1, &v9);
  v6 = v9;
  v7 = v6;
  if (a2 && !v5)
    *a2 = v6;

  objc_autoreleasePoolPop(v4);
  return v5;
}

id _CSStoreCreateXPCRepresentation(uint64_t a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v10;

  v4 = (void *)MEMORY[0x1A85AA4B4]();
  if (performConstantAssertions)
  {
    v5 = *(_QWORD *)(a1 + 336);
    if (v5)
      (*(void (**)(_QWORD))(**(_QWORD **)(v5 + 8) + 8))(*(_QWORD *)(v5 + 8));
  }
  v10 = 0;
  CSStore2::Store::encodeAsXPCObject(*(_QWORD *)(a1 + 8), &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  v8 = v7;
  if (a2 && !v6)
    *a2 = v7;

  objc_autoreleasePoolPop(v4);
  return v6;
}

void sub_1A4E5B384(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id _CSStoreCreateWithXPCRepresentation(void *a1, _QWORD *a2)
{
  void *v4;
  id v5;
  id *v6;
  id v7;
  id v9;
  id *v10;

  v4 = (void *)MEMORY[0x1A85AA4B4]();
  v9 = 0;
  CSStore2::Store::CreateWithXPCObject(&v10, a1, &v9);
  v5 = v9;
  v6 = v10;
  if (v10)
  {
    v7 = -[_CSStore initByMovingStore:]([_CSStore alloc], "initByMovingStore:", v10);

    MEMORY[0x1A85AA130](v6, 0x10A0C4017B00345);
    if (!a2)
      goto LABEL_7;
  }
  else
  {
    v7 = 0;
    if (!a2)
      goto LABEL_7;
  }
  if (!v7)
    *a2 = v5;
LABEL_7:

  objc_autoreleasePoolPop(v4);
  return v7;
}

void sub_1A4E5B48C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);
  std::unique_ptr<CSStore2::Store>::reset[abi:nn180100]((id **)va, 0);

  _Unwind_Resume(a1);
}

void sub_1A4E5B520(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t CSStoreCreateMutableCopy(void *a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v9;

  v4 = (void *)MEMORY[0x1A85AA4B4]();
  v9 = 0;
  v5 = objc_msgSend(a1, "mutableCopyWithZone:error:", 0, &v9);
  v6 = v9;
  v7 = v6;
  if (a2 && !v5)
    *a2 = v6;

  objc_autoreleasePoolPop(v4);
  return v5;
}

void sub_1A4E5B800(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, id *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id a21)
{
  void *v21;

  _Block_object_dispose(&a16, 8);
  std::unique_ptr<CSStore2::Store>::reset[abi:nn180100](&a10, 0);
  _Unwind_Resume(a1);
}

void _CSStringBindingEnumerateAllBindings(uint64_t a1, _QWORD *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a3;
  if (a1 && a2 && v5)
  {
    v7[1] = 3221225472;
    v7[2] = ___CSStringBindingEnumerateAllBindings_block_invoke;
    v7[3] = &unk_1E4E219B8;
    v6 = v5;
    v7[0] = MEMORY[0x1E0C809B0];
    v8 = v5;
    _CSMapEnumerateKeysAndValues(a1, a2, v7);

    v5 = v6;
  }

}

void sub_1A4E5B8DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void _CSStoreEnumerateUnits(uint64_t a1, unsigned int a2, void *a3)
{
  id v5;
  uint64_t v6;
  CSStore2::Store *v7;
  char *Table;
  unsigned int *v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  if (performConstantAssertions)
  {
    v6 = *(_QWORD *)(a1 + 336);
    if (v6)
      (*(void (**)(_QWORD))(**(_QWORD **)(v6 + 8) + 8))(*(_QWORD *)(v6 + 8));
  }
  if (a2)
  {
    if (v5)
    {
      v7 = (CSStore2::Store *)(a1 + 8);
      Table = CSStore2::Store::getTable(v7, a2);
      if (Table)
      {
        v9 = (unsigned int *)Table;
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = ___CSStoreEnumerateUnits_block_invoke;
        v10[3] = &unk_1E4E21BE0;
        v11 = v5;
        CSStore2::Store::enumerateUnits((CSStore2 **)v7, v9, v10);

      }
    }
  }

}

void sub_1A4E5B9C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

uint64_t CSStringBindingStoreInit(uint64_t a1, NSString *a2, int a3, char a4, uint64_t a5)
{
  uint64_t v5;
  __int128 v7[3];

  v5 = 4294967246;
  if (a1 && a2 && a5)
  {
    v7[0] = xmmword_1E4E21958;
    memset(&v7[1], 0, 32);
    *(_DWORD *)(a5 + 96) = a3;
    *(_BYTE *)(a5 + 100) = a4;
    return CSMapInit(a1, a2, v7, 0, a5);
  }
  return v5;
}

void _CSStoreAccessContextAccessForRead(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void (*v6)(uint64_t, _QWORD *);
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  GetContextLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v12 = a1;
    _os_log_debug_impl(&dword_1A4E5A000, v4, OS_LOG_TYPE_DEBUG, "accessing for read: %@", buf, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 8);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = ___CSStoreAccessContextAccessForRead_block_invoke;
  v8[3] = &unk_1E4E21EC8;
  v9 = v3;
  v10 = a1;
  v6 = *(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v5 + 16);
  v7 = v3;
  v6(v5, v8);

}

void sub_1A4E5BB4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<_opaque_pthread_t *,std::hash<_opaque_pthread_t *>,std::equal_to<_opaque_pthread_t *>,std::allocator<_opaque_pthread_t *>>::find<_opaque_pthread_t *>(_QWORD *a1, unint64_t a2)
{
  int8x8_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint8x8_t v6;
  unint64_t v7;
  _QWORD *v8;
  _QWORD *result;
  unint64_t v10;

  v2 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v2)
    return 0;
  v3 = 0x9DDFEA08EB382D69 * (((8 * a2) + 8) ^ HIDWORD(a2));
  v4 = 0x9DDFEA08EB382D69 * (HIDWORD(a2) ^ (v3 >> 47) ^ v3);
  v5 = 0x9DDFEA08EB382D69 * (v4 ^ (v4 >> 47));
  v6 = (uint8x8_t)vcnt_s8(v2);
  v6.i16[0] = vaddlv_u8(v6);
  if (v6.u32[0] > 1uLL)
  {
    v7 = v5;
    if (v5 >= *(_QWORD *)&v2)
      v7 = v5 % *(_QWORD *)&v2;
  }
  else
  {
    v7 = v5 & (*(_QWORD *)&v2 - 1);
  }
  v8 = *(_QWORD **)(*a1 + 8 * v7);
  if (!v8)
    return 0;
  result = (_QWORD *)*v8;
  if (*v8)
  {
    do
    {
      v10 = result[1];
      if (v10 == v5)
      {
        if (result[2] == a2)
          return result;
      }
      else
      {
        if (v6.u32[0] > 1uLL)
        {
          if (v10 >= *(_QWORD *)&v2)
            v10 %= *(_QWORD *)&v2;
        }
        else
        {
          v10 &= *(_QWORD *)&v2 - 1;
        }
        if (v10 != v7)
          return 0;
      }
      result = (_QWORD *)*result;
    }
    while (result);
  }
  return result;
}

id GetContextLog(void)
{
  if (GetContextLog(void)::once != -1)
    dispatch_once(&GetContextLog(void)::once, &__block_literal_global_465);
  return (id)GetContextLog(void)::result;
}

unint64_t _CSArrayGetValueAtIndex(uint64_t a1, unsigned int a2, unsigned int a3)
{
  unint64_t result;
  uint64_t v7;
  CSStore2 *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  unsigned int v13;
  NSObject *v14;
  uint64_t v15;
  unint64_t v16;
  int v17;
  _BYTE v18[18];
  char v19;
  uint64_t v20;

  result = 0;
  v20 = *MEMORY[0x1E0C80C00];
  if (a1 && a2)
  {
    if (performConstantAssertions)
    {
      v7 = *(_QWORD *)(a1 + 336);
      if (v7)
        (*(void (**)(_QWORD))(**(_QWORD **)(v7 + 8) + 8))(*(_QWORD *)(v7 + 8));
    }
    CSStore2::Array::Get((CSStore2::Array *)&v17, (CSStore2::Store *)(a1 + 8), a2);
    if (v19)
    {
      v9 = **(_DWORD **)&v18[4] & 0x1FFFFFFF;
      if (v9 >= *(_DWORD *)&v18[12])
        v10 = *(unsigned int *)&v18[12];
      else
        v10 = v9;
      if (v10 <= a3)
      {
        CSStore2::GetLog(v8);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v17 = 134218240;
          *(_QWORD *)v18 = a3;
          *(_WORD *)&v18[8] = 2048;
          *(_QWORD *)&v18[10] = v10;
          _os_log_error_impl(&dword_1A4E5A000, v14, OS_LOG_TYPE_ERROR, "Out-of-bounds array read: %llu >= %llu", (uint8_t *)&v17, 0x16u);
        }

        LOBYTE(v12) = 0;
        v15 = 0;
        v13 = 0;
      }
      else
      {
        v11 = *(_QWORD *)&v18[4] + 4;
        if ((**(_DWORD **)&v18[4] & 0x20000000) != 0)
        {
          LOWORD(v12) = *(_WORD *)(v11 + 2 * a3);
          v13 = v12 & 0xFF00;
        }
        else
        {
          v12 = *(_DWORD *)(v11 + 4 * a3);
          v13 = v12 & 0xFFFFFF00;
        }
        v15 = 0x100000000;
      }
      v16 = v15 | v13 | v12;
      if (v16 <= 0x100000000)
        return 0x100000000;
      else
        return v16;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t CSStringBindingFindStringAndBindings(uint64_t a1, _QWORD *a2, CSStore2::_StringFunctions *a3, const char *a4, _DWORD *a5, _DWORD *a6)
{
  uint64_t v10;
  int Bindings;
  int v12;
  uint64_t result;

  v10 = _CSGetStringForCharacters(a1, a3, a4);
  if (!(_DWORD)v10)
    return 4294957797;
  if (a5)
    *a5 = v10;
  Bindings = _CSStringBindingGetBindings(a1, a2, v10);
  if (!Bindings)
    return 4294957797;
  if (!a6)
    return 0;
  v12 = Bindings;
  result = 0;
  *a6 = v12;
  return result;
}

uint64_t _CSGetStringForCharacters(uint64_t a1, CSStore2::_StringFunctions *a2, const char *a3)
{
  uint64_t v6;
  _BYTE v8[8];
  unsigned int v9;
  char v10;

  if (performConstantAssertions)
  {
    v6 = *(_QWORD *)(a1 + 336);
    if (v6)
      (*(void (**)(_QWORD))(**(_QWORD **)(v6 + 8) + 8))(*(_QWORD *)(v6 + 8));
  }
  CSStore2::String::Find((CSStore2::String *)v8, (CSStore2::Store *)(a1 + 8), a2, a3);
  if (v10)
    return v9;
  else
    return 0;
}

uint64_t _CSStringBindingGetBindings(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t result;
  unsigned int v5;

  result = 0;
  v5 = 0;
  if (a1 && a2)
  {
    if ((_DWORD)a3)
    {
      CSMapGetValue(a1, a2, a3, &v5);
      return v5;
    }
  }
  return result;
}

void _CSMapEnumerateKeysAndValues(uint64_t a1, _QWORD *a2, void *a3)
{
  unint64_t v3;
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD, _QWORD);
  _DWORD *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int v13;
  uint8x8_t v14;
  uint64_t **v15;
  uint64_t *i;
  unint64_t v17;
  _QWORD *v18;
  float v19;
  _BOOL8 v20;
  unint64_t v21;
  unint64_t v22;
  size_t v23;
  uint64_t v24;
  _QWORD *v25;
  unint64_t v26;
  uint64_t **v27;
  char j;
  __int128 v29;
  __int128 v30;
  float v31;

  v6 = a3;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v6;
  if (!a1 || !a2 || !v6 || CSMapSync(a1, (uint64_t)a2))
    goto LABEL_52;
  v29 = 0u;
  v30 = 0u;
  v31 = 1.0;
  v8 = (_DWORD *)a2[9];
  if (!v8[2])
    goto LABEL_51;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  do
  {
    v12 = *(unsigned int *)(a2[10] + 4 * v11);
    if (v8[5] != (_DWORD)v12 && v8[6] != (_DWORD)v12)
    {
      v13 = *(_DWORD *)(a2[11] + 4 * v11);
      if (v10)
      {
        v14 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
        v14.i16[0] = vaddlv_u8(v14);
        if (v14.u32[0] > 1uLL)
        {
          v3 = *(unsigned int *)(a2[10] + 4 * v11);
          if (v10 <= v12)
            v3 = v12 % v10;
        }
        else
        {
          v3 = ((_DWORD)v10 - 1) & v12;
        }
        v15 = *(uint64_t ***)(v29 + 8 * v3);
        if (v15)
        {
          for (i = *v15; i; i = (uint64_t *)*i)
          {
            v17 = i[1];
            if (v17 == v12)
            {
              if (*((_DWORD *)i + 4) == (_DWORD)v12)
                goto LABEL_47;
            }
            else
            {
              if (v14.u32[0] > 1uLL)
              {
                if (v17 >= v10)
                  v17 %= v10;
              }
              else
              {
                v17 &= v10 - 1;
              }
              if (v17 != v3)
                break;
            }
          }
        }
      }
      v18 = operator new(0x18uLL);
      *v18 = 0;
      v18[1] = v12;
      *((_DWORD *)v18 + 4) = v12;
      *((_DWORD *)v18 + 5) = v13;
      v19 = (float)(unint64_t)(v9 + 1);
      if (!v10 || (float)(v31 * (float)v10) < v19)
      {
        v20 = (v10 & (v10 - 1)) != 0;
        if (v10 < 3)
          v20 = 1;
        v21 = v20 | (2 * v10);
        v22 = vcvtps_u32_f32(v19 / v31);
        if (v21 <= v22)
          v23 = v22;
        else
          v23 = v21;
        std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__rehash<true>((uint64_t)&v29, v23);
        v10 = *((_QWORD *)&v29 + 1);
        if ((*((_QWORD *)&v29 + 1) & (*((_QWORD *)&v29 + 1) - 1)) != 0)
        {
          if (*((_QWORD *)&v29 + 1) <= v12)
            v3 = v12 % *((_QWORD *)&v29 + 1);
          else
            v3 = v12;
        }
        else
        {
          v3 = (DWORD2(v29) - 1) & v12;
        }
      }
      v24 = v29;
      v25 = *(_QWORD **)(v29 + 8 * v3);
      if (v25)
      {
        *v18 = *v25;
      }
      else
      {
        *v18 = v30;
        *(_QWORD *)&v30 = v18;
        *(_QWORD *)(v24 + 8 * v3) = &v30;
        if (!*v18)
        {
LABEL_46:
          v9 = ++*((_QWORD *)&v30 + 1);
          v8 = (_DWORD *)a2[9];
          goto LABEL_47;
        }
        v26 = *(_QWORD *)(*v18 + 8);
        if ((v10 & (v10 - 1)) != 0)
        {
          if (v26 >= v10)
            v26 %= v10;
        }
        else
        {
          v26 &= v10 - 1;
        }
        v25 = (_QWORD *)(v29 + 8 * v26);
      }
      *v25 = v18;
      goto LABEL_46;
    }
LABEL_47:
    ++v11;
  }
  while (v11 < v8[2]);
  v27 = (uint64_t **)v30;
  for (j = 0; v27; v27 = (uint64_t **)*v27)
  {
    ((void (**)(_QWORD, _QWORD, _QWORD, char *))v7)[2](v7, *((unsigned int *)v27 + 4), *((unsigned int *)v27 + 5), &j);
    if (j)
      break;
  }
LABEL_51:
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)&v29);
LABEL_52:

}

void sub_1A4E5C224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  void *v11;
  void *v12;

  operator delete(v12);
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)&a11);

  _Unwind_Resume(a1);
}

uint64_t CSMapInit(uint64_t a1, NSString *a2, __int128 *a3, uint64_t a4, uint64_t a5)
{
  unsigned int TableWithName;
  __int128 v10;
  __int128 v11;

  TableWithName = _CSStoreGetTableWithName(a1, a2);
  *(_DWORD *)a5 = TableWithName;
  if (!TableWithName)
    return 4294957797;
  if (a3)
  {
    v10 = *a3;
    v11 = a3[2];
    *(_OWORD *)(a5 + 24) = a3[1];
    *(_OWORD *)(a5 + 40) = v11;
  }
  else
  {
    v10 = 0uLL;
    *(_OWORD *)(a5 + 24) = 0u;
    *(_OWORD *)(a5 + 40) = 0u;
  }
  *(_OWORD *)(a5 + 8) = v10;
  *(_QWORD *)(a5 + 56) = a4;
  *(_OWORD *)(a5 + 64) = 0u;
  *(_OWORD *)(a5 + 80) = 0u;
  CSMapSync(a1, a5);
  return 0;
}

void _CSStringBindingEnumerate(uint64_t a1, _QWORD *a2, uint64_t a3, void *a4)
{
  id v7;
  unsigned int v8;

  v7 = a4;
  if (a1)
  {
    if (a2)
    {
      if ((_DWORD)a3)
      {
        if (v7)
        {
          v8 = 0;
          CSMapGetValue(a1, a2, a3, &v8);
          if (v8)
            _CSArrayEnumerateAllValues(a1, v8, v7);
        }
      }
    }
  }

}

void sub_1A4E5C370(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{

  _Unwind_Resume(a1);
}

uint64_t CSMapGetValue(uint64_t a1, _QWORD *a2, uint64_t a3, _DWORD *a4)
{
  uint64_t result;
  unsigned int v9;

  result = CSMapSync(a1, (uint64_t)a2);
  if (!(_DWORD)result)
  {
    v9 = 0;
    result = _CSMapFindBucketForKey(a1, a2, a3, (int *)&v9, 0);
    if (!(_DWORD)result)
      *a4 = *(_DWORD *)(a2[11] + 4 * v9);
  }
  return result;
}

uint64_t CSMapSync(uint64_t a1, uint64_t a2)
{
  os_unfair_lock_s *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *Header;
  char *Unit;

  v4 = (os_unfair_lock_s *)(a2 + 64);
  os_unfair_lock_lock((os_unfair_lock_t)(a2 + 64));
  v5 = 4294967246;
  if (a1 && a2)
  {
    v6 = *(_DWORD *)(a2 + 68);
    if (performConstantAssertions)
    {
      v7 = *(_QWORD *)(a1 + 336);
      if (v7)
        (*(void (**)(_QWORD))(**(_QWORD **)(v7 + 8) + 8))(*(_QWORD *)(v7 + 8));
    }
    v8 = *(_QWORD *)(a1 + 8);
    if (v6 == *(_DWORD *)(*(_QWORD *)(v8 + 8) + 8))
    {
      v5 = 0;
    }
    else
    {
      if (performConstantAssertions)
      {
        v9 = *(_QWORD *)(a1 + 336);
        if (v9)
        {
          (*(void (**)(_QWORD))(**(_QWORD **)(v9 + 8) + 8))(*(_QWORD *)(v9 + 8));
          v8 = *(_QWORD *)(a1 + 8);
        }
      }
      *(_DWORD *)(a2 + 68) = *(_DWORD *)(*(_QWORD *)(v8 + 8) + 8);
      Header = CSStoreGetHeader(a1, *(_DWORD *)a2, 0);
      *(_QWORD *)(a2 + 72) = Header;
      if (Header
        && (Unit = CSStoreGetUnit(a1, *(_DWORD *)a2, *((_DWORD *)Header + 1), 0), (*(_QWORD *)(a2 + 80) = Unit) != 0))
      {
        v5 = 0;
        *(_QWORD *)(a2 + 88) = &Unit[4 * *(unsigned int *)(*(_QWORD *)(a2 + 72) + 8)];
      }
      else
      {
        v5 = 4294957800;
      }
    }
  }
  os_unfair_lock_unlock(v4);
  return v5;
}

char *CSStoreGetHeader(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  uint64_t v6;
  char *result;
  uint64_t v8;

  if (performConstantAssertions)
  {
    v6 = *(_QWORD *)(a1 + 336);
    if (v6)
      (*(void (**)(_QWORD))(**(_QWORD **)(v6 + 8) + 8))(*(_QWORD *)(v6 + 8));
  }
  result = CSStore2::Store::getTable((CSStore2::Store *)(a1 + 8), a2);
  if (result)
  {
    v8 = (uint64_t)result;
    result += 80;
    if (a3)
      *a3 = *(_DWORD *)(v8 + 4) - 72;
  }
  return result;
}

uint64_t CSStoreGetGeneration(uint64_t a1)
{
  uint64_t v2;

  if (performConstantAssertions)
  {
    v2 = *(_QWORD *)(a1 + 336);
    if (v2)
      (*(void (**)(_QWORD))(**(_QWORD **)(v2 + 8) + 8))(*(_QWORD *)(v2 + 8));
  }
  return *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) + 8);
}

uint64_t _CSMapFindBucketForKey(uint64_t a1, _QWORD *a2, uint64_t a3, int *a4, int *a5)
{
  int v7;
  uint64_t (*v10)(uint64_t, _QWORD *, uint64_t);
  unsigned int v11;
  uint64_t v12;
  unsigned int *v13;
  unint64_t v14;
  unint64_t v15;
  unsigned int v16;
  unsigned int v17;
  unint64_t v18;
  int v19;
  int v20;
  int v22;
  uint64_t v23;
  int v24;
  int v25;
  uint64_t result;
  uint64_t v27;
  int v28;

  v7 = a3;
  *a4 = -1;
  if (a5)
    *a5 = -1;
  v10 = (uint64_t (*)(uint64_t, _QWORD *, uint64_t))a2[3];
  v11 = a3;
  if (v10)
    v11 = v10(a1, a2, a3);
  v13 = (unsigned int *)a2[9];
  v12 = a2[10];
  v14 = v13[2];
  v15 = v11 % v14;
  v16 = v13[5];
  v17 = v13[6];
  v18 = v15;
  if (a5)
  {
    while (1)
    {
      v19 = *(_DWORD *)(v12 + 4 * v18);
      if (v19 == v16)
      {
        if (*a5 == -1)
          *a5 = v18;
LABEL_56:
        if (*a4 == -1)
          return 4294957797;
        else
          return 0;
      }
      if (v19 == v17)
        break;
      if (v19 == v7 && *a4 == -1)
      {
        *a4 = v18;
        v20 = *a5;
        goto LABEL_11;
      }
LABEL_15:
      if (++v18 >= v14)
      {
        if ((_DWORD)v15)
        {
          v23 = 0;
          while (1)
          {
            v24 = *(_DWORD *)(v12 + 4 * v23);
            if (v24 == v16)
            {
              if (*a5 == -1)
                *a5 = v23;
              goto LABEL_56;
            }
            if (v24 == v17)
              break;
            if (v24 == v7 && *a4 == -1)
            {
              *a4 = v23;
              v25 = *a5;
              goto LABEL_35;
            }
LABEL_39:
            if (++v23 >= v15)
              return 4294957797;
          }
          if (*a5 == -1)
            *a5 = v23;
          v25 = *a4;
LABEL_35:
          if (v25 != -1)
            return 0;
          goto LABEL_39;
        }
        return 4294957797;
      }
    }
    if (*a5 == -1)
      *a5 = v18;
    v20 = *a4;
LABEL_11:
    if (v20 != -1)
      return 0;
    goto LABEL_15;
  }
  while (1)
  {
    v22 = *(_DWORD *)(v12 + 4 * v18);
    if (v22 == v16)
      break;
    if (v22 == v7 && v22 != v17)
    {
      result = 0;
      *a4 = v18;
      return result;
    }
    if (++v18 >= v14)
    {
      if ((_DWORD)v15)
      {
        v27 = 0;
        result = 4294957797;
        while (1)
        {
          v28 = *(_DWORD *)(v12 + 4 * v27);
          if (v28 == v16)
            break;
          if (v28 == v7 && v28 != v17)
          {
            result = 0;
            *a4 = v27;
            return result;
          }
          if (++v27 >= v15)
            return result;
        }
      }
      return 4294957797;
    }
  }
  return 4294957797;
}

void CSStore2::Store::enumerateUnits(CSStore2 **a1, unsigned int *a2, void *a3)
{
  void (**v5)(id, char *, _BYTE *);
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int *v10;
  unint64_t v11;
  unint64_t v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int *v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  BOOL v21;
  unsigned int v22;
  char v23;
  unsigned int *v24;
  unint64_t v25;
  unsigned int v26;
  char *Unit;
  unint64_t v29;
  unsigned __int8 v30;

  v5 = a3;
  if (v5)
  {
    v6 = (unint64_t *)(a1 + 36);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 + 1, v6));
    v8 = a2[19];
    if ((_DWORD)v8 != -1)
    {
      v9 = *((_QWORD *)*a1 + 1);
      if (*(_DWORD *)(v9 + 12) > v8)
      {
        v10 = (unsigned int *)(v9 + v8);
        v30 = 0;
        v11 = *(unsigned int *)(v9 + v8);
        if ((_DWORD)v11)
        {
          v12 = 0;
          do
          {
            v13 = &v10[2 * v12];
            v16 = v13[1];
            v15 = v13 + 1;
            v14 = v16;
            if (v16 && (v17 = v14 >> 29) == 0)
            {
              v18 = v10[2 * v12 + 2];
              v19 = *((_QWORD *)*a1 + 1);
              v20 = *(_DWORD *)(v19 + 12);
              v21 = __CFADD__((_DWORD)v18, 8 * v14);
              v22 = v18 + 8 * v14;
              v23 = v21;
              if (v20 > v18 && (v23 & 1) == 0 && v22 <= v20)
              {
                v24 = (unsigned int *)(v19 + v18);
                v25 = 1;
                do
                {
                  v26 = *v24;
                  v24 += 2;
                  Unit = CSStore2::Store::getUnit(a1, (const CSStore2::Table *)a2, v26);
                  if (Unit)
                    v5[2](v5, Unit, &v30);
                  v17 = v30;
                  v21 = v25++ >= *v15;
                }
                while (!v21 && v30 == 0);
                v11 = *v10;
              }
            }
            else
            {
              v17 = 0;
            }
            ++v12;
          }
          while (v12 < v11 && !v17);
        }
      }
    }
    do
      v29 = __ldaxr(v6);
    while (__stlxr(v29 - 1, v6));
  }

}

void sub_1A4E5C930(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t ___ZNK8CSStore25Store15enumerateTablesEU13block_pointerFvPKNS_5TableEPbE_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void ___ZNK8CSStore25Store8getTableEP8NSString_block_invoke(uint64_t a1, CSStore2::Table *this, _BYTE *a3)
{
  void *v6;
  __CFString *v7;

  v6 = *(void **)(a1 + 32);
  v7 = (__CFString *)CSStore2::Table::copyCFName(this);
  LODWORD(v6) = objc_msgSend(v6, "isEqualToString:", v7);

  if ((_DWORD)v6)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = this;
    *a3 = 1;
  }
}

void sub_1A4E5C9BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

CFStringRef CSStore2::Table::copyCFName(CSStore2::Table *this)
{
  const UInt8 *v1;
  CFIndex v2;

  v1 = (const UInt8 *)this + 8;
  v2 = strnlen((const char *)this + 8, 0x30uLL);
  return CFStringCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v1, v2, 0x8000100u, 0, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
}

void CSStore2::String::Find(CSStore2::String *this, CSStore2::Store *a2, CSStore2::_StringFunctions *a3, const char *a4)
{
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  void *v13;
  int v14;
  char *StringCache;
  unsigned int HashCode;
  _QWORD *v17;
  uint64_t v18;
  char *v19;
  int v20;
  unsigned int *v21;
  int v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  unsigned int v26;
  unsigned int *v28;
  unint64_t v29;
  BOOL v30;
  uint64_t *v32;
  uint64_t *v33;
  __int128 v34;
  _QWORD v35[2];
  double (*v36)(uint64_t, unsigned int *, uint64_t, char *);
  void *v37;
  uint64_t *v38;
  CSStore2::Store *v39;
  CSStore2::_StringFunctions *v40;
  int v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  __n128 (*v45)(uint64_t, uint64_t);
  uint64_t (*v46)();
  uint64_t v47;
  char v48;
  char v49;
  char v50;
  __int128 __dst;
  char v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v42 = 0;
  v43 = &v42;
  v44 = 0x5812000000;
  v45 = __Block_byref_object_copy__290;
  v46 = __Block_byref_object_dispose__291;
  v47 = 0;
  v48 = 0;
  v49 = 0;
  v52 = 0;
  if (a4 > 5)
  {
LABEL_15:
    StringCache = CSStore2::getStringCache(a2, a2);
    if (StringCache)
    {
      HashCode = CSStore2::_StringFunctions::getHashCode(a3, a4);
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v36 = ___ZN8CSStore26String4FindERNS_5StoreEPKcj_block_invoke;
      v37 = &unk_1E4E21D88;
      v39 = a2;
      v40 = a3;
      v41 = (int)a4;
      v38 = &v42;
      v17 = v35;
      v50 = 0;
      if (*(_DWORD *)StringCache)
      {
        v18 = HashCode % *(_DWORD *)StringCache;
        v19 = &StringCache[8 * v18];
        v22 = *((_DWORD *)v19 + 1);
        v21 = (unsigned int *)(v19 + 4);
        v20 = v22;
        if ((v22 - 0x20000000) >= 0xE0000001)
        {
          v23 = *(unsigned int *)&StringCache[8 * v18 + 8];
          v24 = v23 + 8 * v20;
          if (!__CFADD__((_DWORD)v23, 8 * v20))
          {
            v25 = *(_QWORD *)(*(_QWORD *)a2 + 8);
            v26 = *(_DWORD *)(v25 + 12);
            if (v24 <= v26 && v26 > v23)
            {
              v28 = (unsigned int *)(v25 + v23);
              v29 = 1;
              do
              {
                v36((uint64_t)v17, v28, (uint64_t)(v28 + 1), &v50);
                v30 = v29++ >= *v21;
                v28 += 2;
              }
              while (!v30 && v50 == 0);
            }
          }
        }
      }

    }
    goto LABEL_33;
  }
  if ((_DWORD)a4)
  {
    v8 = 0;
    v9 = 0;
    v10 = MEMORY[0x1E0C80978];
    while (1)
    {
      v11 = *((char *)a3 + v8);
      if (!((v11 & 0x80000000) != 0
           ? __maskrune(*((char *)a3 + v8), 0x40000uLL)
           : *(_DWORD *)(v10 + 4 * v11 + 60) & 0x40000))
        goto LABEL_15;
      v13 = memchr(CSStore2::String::kPackedAlphabet, v11, 0x40uLL);
      if (v13)
        v9 = ((_DWORD)v13 - CSStore2::String::kPackedAlphabet) | (v9 << 6);
      if (++v8 >= (unint64_t)a4 || !v13)
      {
        if (!v13)
          goto LABEL_15;
        v14 = (4 * v9) | 1;
        *(_QWORD *)&__dst = 0;
        v52 = 1;
        if (!(_DWORD)a4)
          goto LABEL_31;
        memcpy(&__dst, a3, a4);
        DWORD2(__dst) = (_DWORD)a4;
        if (v52)
          goto LABEL_32;
        goto LABEL_15;
      }
    }
  }
  *(_QWORD *)&__dst = 0;
  v14 = 1;
  v52 = 1;
LABEL_31:
  DWORD2(__dst) = (_DWORD)a4;
LABEL_32:
  v32 = v43;
  v43[6] = 0;
  *((_DWORD *)v32 + 14) = v14;
  *((_BYTE *)v32 + 60) = 1;
  *((_OWORD *)v32 + 4) = __dst;
  *((_BYTE *)v32 + 80) = v52;
LABEL_33:
  v33 = v43;
  v34 = *((_OWORD *)v43 + 4);
  *(_OWORD *)this = *((_OWORD *)v43 + 3);
  *((_OWORD *)this + 1) = v34;
  *((_QWORD *)this + 4) = v33[10];
  _Block_object_dispose(&v42, 8);
}

void sub_1A4E5CCE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double ___ZN8CSStore26String4FindERNS_5StoreEPKcj_block_invoke(uint64_t a1, unsigned int *a2, uint64_t a3, _BYTE *a4)
{
  const void *v7;
  size_t v8;
  double result;
  __int128 *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  char v14;
  __int128 v15;
  __int128 v16;
  char v17;

  v7 = *(const void **)(a1 + 48);
  v8 = *(unsigned int *)(a1 + 56);
  CSStore2::String::Get(&v15, *(CSStore2::Store **)(a1 + 40), *a2);
  if (v17)
  {
    result = *(double *)&v16;
    v13 = v16;
    v14 = 1;
    if (DWORD2(v16) == (_DWORD)v8)
    {
      if (BYTE12(v15))
        v10 = &v13;
      else
        v10 = (__int128 *)v13;
      if (!memcmp(v10, v7, v8))
      {
        CSStore2::String::Get(&v15, *(CSStore2::Store **)(a1 + 40), *a2);
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        result = *(double *)&v15;
        v12 = v16;
        *(_OWORD *)(v11 + 48) = v15;
        *(_OWORD *)(v11 + 64) = v12;
        *(_BYTE *)(v11 + 80) = v17;
        *a4 = 1;
      }
    }
  }
  return result;
}

uint64_t _CSArrayGetCount(uint64_t a1, unsigned int a2)
{
  uint64_t v4;
  unsigned int v5;
  _QWORD v7[2];
  unsigned int v8;
  char v9;

  if (!a1 || !a2)
    return 0;
  if (performConstantAssertions)
  {
    v4 = *(_QWORD *)(a1 + 336);
    if (v4)
      (*(void (**)(_QWORD))(**(_QWORD **)(v4 + 8) + 8))(*(_QWORD *)(v4 + 8));
  }
  CSStore2::Array::Get((CSStore2::Array *)v7, (CSStore2::Store *)(a1 + 8), a2);
  if (!v9)
    return 0;
  v5 = *(_DWORD *)v7[1] & 0x1FFFFFFF;
  if (v5 >= v8)
    return v8;
  else
    return v5;
}

void _CSArrayEnumerateAllValues(uint64_t a1, unsigned int a2, void *a3)
{
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  __int128 v9;
  uint64_t v10;
  char v11;
  __int128 v12;
  uint64_t v13;
  char v14;

  v6 = a3;
  if (performConstantAssertions)
  {
    v5 = *(_QWORD *)(a1 + 336);
    if (v5)
      (*(void (**)(_QWORD))(**(_QWORD **)(v5 + 8) + 8))(*(_QWORD *)(v5 + 8));
  }
  CSStore2::Array::Get((CSStore2::Array *)&v12, (CSStore2::Store *)(a1 + 8), a2);
  if (v14)
  {
    v9 = v12;
    v10 = v13;
    v11 = 1;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = ___CSArrayEnumerateAllValues_block_invoke;
    v7[3] = &unk_1E4E22270;
    v8 = v6;
    CSStore2::Array::enumerateValues((uint64_t)&v9, v7);

  }
}

void sub_1A4E5CF44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void CSStore2::Array::Get(CSStore2::Array *this, CSStore2::Store *a2, unsigned int a3)
{
  char *Table;
  unsigned int *Unit;
  uint64_t v8;
  char v9;
  NSObject *v10;
  CSStore2 *v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)this = 0;
  *((_BYTE *)this + 24) = 0;
  Table = (char *)*((_QWORD *)a2 + 33);
  if (Table || (Table = CSStore2::Store::getTable((CSStore2 **)a2, CFSTR("<array>"))) != 0)
  {
    Unit = (unsigned int *)CSStore2::Store::getUnit((CSStore2 **)a2, (const CSStore2::Table *)Table, a3);
    if (Unit)
    {
      *((_BYTE *)this + 24) = 1;
      *(_QWORD *)this = a2;
      *((_QWORD *)this + 1) = Unit + 2;
      *((_QWORD *)this + 2) = 0;
      *((_DWORD *)this + 5) = a3;
      v8 = Unit[1];
      if (v8 <= 3)
      {
        CSStore2::GetLog((CSStore2 *)Unit);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v13 = 134217984;
          v14 = v8;
          _os_log_error_impl(&dword_1A4E5A000, v10, OS_LOG_TYPE_ERROR, "Underflow getting array capacity (%llu)", (uint8_t *)&v13, 0xCu);
        }

        CSStore2::GetLog(v11);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v13) = 0;
          _os_log_error_impl(&dword_1A4E5A000, v12, OS_LOG_TYPE_ERROR, "Size of array unit was invalid for a CSArray; discarding",
            (uint8_t *)&v13,
            2u);
        }

        *(_BYTE *)this = 0;
        *((_BYTE *)this + 24) = 0;
      }
      else
      {
        v9 = 1;
        if ((Unit[2] & 0x20000000) == 0)
          v9 = 2;
        *((_DWORD *)this + 4) = (unint64_t)(v8 - 4) >> v9;
      }
    }
  }
}

void CSStore2::Array::enumerateValues(uint64_t a1, void *a2)
{
  void (**v3)(id, _QWORD, std::vector<unsigned int>::pointer, std::vector<unsigned int> *);
  _DWORD *v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  int *v8;
  _DWORD *v9;
  int v10;
  int v11;
  std::vector<unsigned int>::pointer begin;
  std::vector<unsigned int>::pointer v13;
  unsigned __int16 *v14;
  _DWORD *v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  std::vector<unsigned int> v21;
  _BYTE v22[1024];

  v3 = a2;
  v4 = *(_DWORD **)(a1 + 8);
  v5 = *v4 & 0x1FFFFFFF;
  v6 = *(_DWORD *)(a1 + 16);
  if (v5 >= v6)
    v7 = v6;
  else
    v7 = v5;
  if (v7 > 0xFF)
  {
    CSStore2::Array::getAllValues(&v21, a1);
    begin = v21.__begin_;
    LOBYTE(v21.__begin_) = 0;
    v13 = begin;
  }
  else
  {
    if ((*v4 & 0x20000000) != 0)
    {
      if (!(_DWORD)v7)
        goto LABEL_23;
      v14 = (unsigned __int16 *)(v4 + 1);
      v15 = v22;
      v16 = v7;
      do
      {
        v17 = *v14++;
        *v15++ = v17;
        --v16;
      }
      while (v16);
    }
    else
    {
      if (!(_DWORD)v7)
        goto LABEL_23;
      v8 = v4 + 1;
      v9 = v22;
      v10 = v7;
      do
      {
        v11 = *v8++;
        *v9++ = v11;
        --v10;
      }
      while (v10);
    }
    LOBYTE(v21.__begin_) = 0;
    v13 = 0;
    begin = (std::vector<unsigned int>::pointer)v22;
  }
  v18 = 0;
  v19 = v7 - 1;
  do
  {
    v3[2](v3, v18, begin, &v21);
    if (LOBYTE(v21.__begin_))
      v20 = 1;
    else
      v20 = v19 == v18;
    ++v18;
    ++begin;
  }
  while (!v20);
  if (v13)
    operator delete(v13);
LABEL_23:

}

void sub_1A4E5D204(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

UInt8 *_CSStoreCreateDataWithUnitNoCopy(uint64_t a1, unsigned int a2, unsigned int a3)
{
  void *v6;
  uint64_t v7;
  char *Unit;
  UInt8 *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t *v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  CFDataRef v21;
  unsigned int length;
  _QWORD length_4[4];
  id v25;

  v6 = (void *)MEMORY[0x1A85AA4B4]();
  if (performConstantAssertions)
  {
    v7 = *(_QWORD *)(a1 + 336);
    if (v7)
      (*(void (**)(_QWORD))(**(_QWORD **)(v7 + 8) + 8))(*(_QWORD *)(v7 + 8));
  }
  length = 0;
  Unit = CSStoreGetUnit(a1, a2, a3, &length);
  v9 = (UInt8 *)Unit;
  if (Unit)
  {
    v10 = *(_QWORD *)(a1 + 8);
    if (v10)
    {
      v11 = *(_QWORD *)(v10 + 8);
      v12 = v11;
    }
    else
    {
      v12 = 0;
      v11 = MEMORY[8];
    }
    v13 = (_DWORD)Unit - v12;
    v14 = length;
    if (__CFADD__(v13, length) || v13 + length > *(_DWORD *)(v11 + 12))
    {
LABEL_17:
      v21 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v9, v14);
      if (!v21)
      {
        v9 = 0;
        goto LABEL_20;
      }
      goto LABEL_18;
    }
    v15 = v11 + v13;
    v16 = (unint64_t *)(a1 + 304);
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 + 1, v16));
    if (v17 < 15)
    {
      v21 = (CFDataRef)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v15, v14);
      if (!v21)
      {
LABEL_16:
        LODWORD(v14) = length;
        goto LABEL_17;
      }
    }
    else
    {
      v18 = *(id *)(a1 + 8);
      length_4[0] = MEMORY[0x1E0C809B0];
      length_4[1] = 3221225472;
      length_4[2] = ___ZNK8CSStore25Store9getNSDataEjj_block_invoke;
      length_4[3] = &unk_1E4E21A70;
      v19 = v18;
      v25 = v19;
      v20 = (void *)MEMORY[0x1A85AA61C](length_4);
      v21 = (CFDataRef)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:deallocator:", v15, v14, v20);

      if (!v21)
        goto LABEL_16;
    }
LABEL_18:
    v9 = v21;

  }
LABEL_20:
  objc_autoreleasePoolPop(v6);
  return v9;
}

void sub_1A4E5D440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

char *CSStoreGetUnit(uint64_t a1, unsigned int a2, unsigned int a3, _DWORD *a4)
{
  uint64_t v8;
  CSStore2::Store *v9;
  char *result;
  char *v11;

  if (!a3)
    return 0;
  if (performConstantAssertions)
  {
    v8 = *(_QWORD *)(a1 + 336);
    if (v8)
      (*(void (**)(_QWORD))(**(_QWORD **)(v8 + 8) + 8))(*(_QWORD *)(v8 + 8));
  }
  v9 = (CSStore2::Store *)(a1 + 8);
  result = CSStore2::Store::getTable(v9, a2);
  if (result)
  {
    result = CSStore2::Store::getUnit((CSStore2 **)v9, (const CSStore2::Table *)result, a3);
    if (result)
    {
      v11 = result;
      result += 8;
      if (a4)
        *a4 = *((_DWORD *)v11 + 1);
    }
  }
  return result;
}

uint64_t _CSStringCopyCFString(uint64_t a1, unsigned int a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _OWORD v8[2];
  char v9;
  _OWORD v10[2];
  char v11;

  if (performConstantAssertions)
  {
    v4 = *(_QWORD *)(a1 + 336);
    if (v4)
      (*(void (**)(_QWORD))(**(_QWORD **)(v4 + 8) + 8))(*(_QWORD *)(v4 + 8));
  }
  CSStore2::String::Get(v10, (CSStore2::Store *)(a1 + 8), a2);
  if (v11)
  {
    v8[0] = v10[0];
    v8[1] = v10[1];
    v9 = 1;
    CSStore2::String::getNSStringNoCopy((CSStore2::String *)v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "copy");

  }
  else
  {
    v6 = 0;
    LOBYTE(v8[0]) = 0;
    v9 = 0;
  }
  return v6;
}

void sub_1A4E5D5A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

_DWORD *CSStore2::String::Get(_DWORD *this, CSStore2::Store *a2, unsigned int a3)
{
  _DWORD *v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char v11;
  __int128 v13;
  char v14;
  const CSStore2::Table *v15;
  int v16;
  int v17;
  __int128 v18;
  __int128 v19;
  char v20;

  v5 = this;
  LOBYTE(v18) = 0;
  v20 = 0;
  if ((a3 & 1) != 0)
  {
    v6 = 0;
    *(_QWORD *)&v18 = 0;
    *(_QWORD *)&v19 = 0;
    DWORD2(v19) = 0;
    v20 = 1;
    DWORD2(v18) = a3;
    BYTE12(v18) = 1;
    v7 = a3 >> 2;
    do
    {
      v8 = v7 & 0x3F;
      if ((v7 & 0x3F) == 0)
        break;
      v7 >>= 6;
      *((_BYTE *)&v19 + v6++) = CSStore2::String::kPackedAlphabet[v8];
    }
    while (v6 != 5);
    this = (_DWORD *)strlen((const char *)&v19);
    if (this >= 2uLL)
    {
      v9 = (char *)&v18 + this + 15;
      v10 = (char *)&v19 + 1;
      do
      {
        v11 = *(v10 - 1);
        *(v10 - 1) = *v9;
        *v9-- = v11;
      }
      while (v10++ < v9);
    }
    DWORD2(v19) = (_DWORD)this;
  }
  v13 = v19;
  *(_OWORD *)v5 = v18;
  *((_OWORD *)v5 + 1) = v13;
  v14 = v20;
  *((_BYTE *)v5 + 32) = v20;
  if (!v14)
  {
    v15 = (const CSStore2::Table *)*((_QWORD *)a2 + 34);
    if (v15
      || (this = CSStore2::Store::getTable((CSStore2 **)a2, CFSTR("<string>")),
          (v15 = (const CSStore2::Table *)this) != 0))
    {
      this = CSStore2::Store::getUnit((CSStore2 **)a2, v15, a3);
      if (this)
      {
        v16 = this[1];
        v17 = 4 * *this;
        *(_QWORD *)v5 = a2;
        v5[2] = v17;
        *((_BYTE *)v5 + 12) = 0;
        *((_QWORD *)v5 + 2) = this + 2;
        v5[6] = v16;
        *((_BYTE *)v5 + 32) = 1;
      }
    }
  }
  return this;
}

char *CSStore2::Store::getUnit(CSStore2 **this, const CSStore2::Table *a2, unsigned int a3)
{
  uint64_t v4;
  CSStore2 *v6;
  uint64_t v7;
  CSStore2 *v10;
  uint64_t v11;
  unint64_t v12;
  unsigned int v13;
  char *v15;
  _BOOL4 v16;
  int v17;
  BOOL v18;
  unsigned int v19;
  _BOOL4 v20;
  BOOL v21;
  BOOL v22;
  NSObject *v23;
  uint64_t v24;
  unint64_t v25;
  const char *v26;
  uint64_t v27;
  CSStore2 *v28;
  NSObject *v29;
  uint32_t v30;
  uint64_t v32;
  unint64_t v33;
  int v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  unint64_t v39;
  __int16 v40;
  unint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v4 = *((unsigned int *)a2 + 19);
  if ((_DWORD)v4 == -1)
    return 0;
  v6 = *this;
  v7 = *((_QWORD *)v6 + 1);
  if (!v7 || *(_DWORD *)(v7 + 12) <= v4)
    return 0;
  v10 = (CSStore2 *)CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::Find(v6, (int *)(v7 + v4), a3);
  if (!v10)
    return 0;
  v11 = *(unsigned int *)v10;
  if ((_DWORD)v11 == -1)
    return 0;
  v12 = *((_QWORD *)*this + 1);
  v13 = *(_DWORD *)(v12 + 12);
  if (!v12 || v13 <= v11)
    return 0;
  v15 = (char *)(v12 + v11);
  v16 = (int)v11 + 1 > v13 || v11 == -1;
  if (v12 + v11 < v12 || v16)
    LODWORD(v11) = -1;
  if (v11 >= 0xFFFFFFF8 || (int)v11 + 8 > v13)
  {
    CSStore2::GetLog(v10);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      v27 = (4 * *(_DWORD *)a2);
      v28 = *this;
      if (*this)
        v28 = (CSStore2 *)*((_QWORD *)v28 + 1);
      v34 = 134218496;
      v35 = v27;
      v36 = 2048;
      v37 = a3;
      v38 = 2048;
      v39 = v15 - (char *)v28;
      v26 = "*** CSStore corruption detected (1). %llx %llx %llx";
      v29 = v23;
      v30 = 32;
      goto LABEL_44;
    }
    goto LABEL_39;
  }
  v17 = *((_DWORD *)v15 + 1) + 8;
  v18 = __CFADD__((_DWORD)v11, v17);
  v19 = v11 + v17;
  if (v18 || v19 > v13)
  {
    CSStore2::GetLog(v10);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      v32 = (4 * *(_DWORD *)a2);
      v33 = *(unsigned int *)v15;
      v34 = 134218752;
      v35 = v32;
      v36 = 2048;
      v37 = a3;
      v38 = 2048;
      v39 = (4 * v33);
      v40 = 2048;
      v41 = v33 >> 30;
      v26 = "*** CSStore corruption detected (2). %llx %llx %llx %llx";
      goto LABEL_43;
    }
LABEL_39:

    return 0;
  }
  v20 = (*(_DWORD *)v15 & 0xC0000000) != 0x40000000;
  if ((const CSStore2::Table *)(v12 + 20) == a2)
  {
    v20 = 1;
    v21 = (*(_DWORD *)v15 & 0xC0000000) == 0x40000000;
  }
  else
  {
    v21 = 1;
  }
  v22 = a3 != 4 * *(_DWORD *)v15 || !v20;
  if (v22 || !v21)
  {
    CSStore2::GetLog(v10);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      v24 = (4 * *(_DWORD *)a2);
      v25 = *(unsigned int *)v15;
      v34 = 134218752;
      v35 = v24;
      v36 = 2048;
      v37 = a3;
      v38 = 2048;
      v39 = (4 * v25);
      v40 = 2048;
      v41 = v25 >> 30;
      v26 = "*** CSStore corruption detected (3). %llx %llx %llx %llx";
LABEL_43:
      v29 = v23;
      v30 = 42;
LABEL_44:
      _os_log_fault_impl(&dword_1A4E5A000, v29, OS_LOG_TYPE_FAULT, v26, (uint8_t *)&v34, v30);
      goto LABEL_39;
    }
    goto LABEL_39;
  }
  return v15;
}

_DWORD *CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::Find(CSStore2 *a1, int *a2, unsigned int a3)
{
  BOOL v3;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  _DWORD *v16;
  uint64_t v17;
  _DWORD *v18;
  int v19;
  _DWORD v20[2];
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (*a2)
    v3 = a3 == 0;
  else
    v3 = 1;
  if (v3)
    return 0;
  if (*a2 > 0x2000)
  {
    CSStore2::GetLog(a1);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v19 = *a2;
      v20[0] = 67109376;
      v20[1] = v19;
      v21 = 1024;
      v22 = 0x2000;
      _os_log_error_impl(&dword_1A4E5A000, v11, OS_LOG_TYPE_ERROR, "Impossible bucket count %u when %u is the maximum.", (uint8_t *)v20, 0xEu);
    }

    return 0;
  }
  v5 = (unsigned __int16)(a3 >> 2) % (unsigned __int16)*a2;
  v6 = a2[2 * v5 + 1];
  if (!(_DWORD)v6)
    return 0;
  v7 = &a2[2 * v5];
  if ((_DWORD)v6 == 1)
  {
    v8 = v7[2];
    if ((_DWORD)v8 != -1)
    {
      v9 = 0;
      v10 = *((_QWORD *)a1 + 1);
      if (v10)
      {
        if (*(_DWORD *)(v10 + 12) > v8)
        {
          v9 = v10 + v8 + 4;
          if (*(_DWORD *)(v10 + v8) != a3)
            return 0;
        }
      }
      return (_DWORD *)v9;
    }
    return 0;
  }
  v13 = v7[2];
  if ((_DWORD)v13 == -1)
  {
    v16 = 0;
  }
  else
  {
    v14 = *((_QWORD *)a1 + 1);
    v15 = *(_DWORD *)(v14 + 12) > v13;
    v16 = (_DWORD *)(v14 + v13);
    if (!v15)
      v16 = 0;
  }
  v17 = 8 * v6;
  v18 = &v16[2 * v6];
  while (*v16 != a3)
  {
    v16 += 2;
    v17 -= 8;
    if (!v17)
    {
      v16 = v18;
      break;
    }
  }
  if (v16 == v18)
    return 0;
  else
    return v16 + 1;
}

id CSStore2::String::getNSStringNoCopy(CSStore2::String *this)
{
  id v2;
  _QWORD *v3;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = (_QWORD *)((char *)this + 16);
  if (!*((_BYTE *)this + 12))
    v3 = (_QWORD *)*v3;
  return (id)objc_msgSend(v2, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v3, *((unsigned int *)this + 6), 4, 0);
}

char *CSStore2::Store::getTable(CSStore2::Store *this, unsigned int a2)
{
  uint64_t v4;
  uint64_t v5;
  const CSStore2::Table *v7;
  NSObject *v8;
  uint64_t v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a2 != -37516)
  {
    if (a2 > 0xFF)
    {
      CSStore2::GetLog(this);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v11 = 134218240;
        v12 = a2;
        v13 = 2048;
        v14 = a2 >> 2;
        _os_log_debug_impl(&dword_1A4E5A000, v8, OS_LOG_TYPE_DEBUG, "Table %llu (shifted %llu) cannot fit in the in-memory table offset list. Consider lengthening the tableOffsets field.", (uint8_t *)&v11, 0x16u);
      }

    }
    else
    {
      v4 = *((unsigned int *)this + (a2 >> 2) + 2);
      if ((_DWORD)v4 != -1)
      {
        v5 = *(_QWORD *)(*(_QWORD *)this + 8);
        if (v5 && *(_DWORD *)(v5 + 12) > v4)
          return (char *)(v5 + v4);
      }
    }
  }
  v9 = *(_QWORD *)this;
  if (*(_QWORD *)this)
    v9 = *(_QWORD *)(v9 + 8);
  v7 = (const CSStore2::Table *)(v9 + 20);
  if (a2 != -37516)
    return CSStore2::Store::getUnit((CSStore2 **)this, v7, a2);
  return (char *)v7;
}

char *CSStore2::getStringCache(CSStore2 *this, const CSStore2::Store *a2)
{
  char *result;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;

  result = (char *)*((_QWORD *)this + 34);
  if (result || (result = CSStore2::Store::getTable((CSStore2 **)this, CFSTR("<string>"))) != 0)
  {
    v4 = *((unsigned int *)result + 20);
    if ((_DWORD)v4 == -1)
    {
      return 0;
    }
    else
    {
      result = 0;
      v5 = *(_QWORD *)(*(_QWORD *)this + 8);
      v6 = *(_DWORD *)(v5 + 12);
      if (v6 > v4 && v4 < 0xFFFFFFFC && (int)v4 + 4 <= v6)
        return (char *)(v5 + v4);
    }
  }
  return result;
}

uint64_t CSStore2::_StringFunctions::getHashCode(CSStore2::_StringFunctions *this, const char *a2)
{
  __int16 v2;
  uint64_t i;
  uint64_t j;
  uint64_t v5;
  __int16 v6;

  v2 = (__int16)a2;
  if (a2 < 0x81)
  {
    if ((_DWORD)a2)
    {
      v5 = a2;
      do
      {
        v6 = *(unsigned __int8 *)this;
        this = (CSStore2::_StringFunctions *)((char *)this + 1);
        v2 = 17 * v2 + v6;
        --v5;
      }
      while (v5);
    }
    else
    {
      v2 = 0;
    }
  }
  else
  {
    for (i = 0; i != 64; ++i)
      v2 = 17 * v2 + *((unsigned __int8 *)this + i);
    for (j = 0; j != 64; ++j)
      v2 = 17 * v2 + *((unsigned __int8 *)this + ((_DWORD)a2 - 64) + j);
  }
  return (unsigned __int16)((v2 << (a2 & 7)) + v2);
}

uint64_t ___ZN8CSStore25Store12_dataDidMoveEv_block_invoke(uint64_t result, _DWORD *a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  int v7;
  BOOL v8;
  unint64_t v9;

  v2 = *a2 & 0x3FFFFFFF;
  if (v2 <= 0x3F)
  {
    v3 = *(uint64_t **)(result + 32);
    v4 = *v3;
    if (*v3)
      v5 = *(_QWORD *)(v4 + 8);
    else
      v5 = 0;
    v6 = v3 + 1;
    v7 = -1;
    v8 = (unint64_t)a2 >= v5;
    v9 = (unint64_t)a2 - v5;
    if (v8 && !HIDWORD(v9))
    {
      if ((v9 + 1) > *(_DWORD *)(*(_QWORD *)(v4 + 8) + 12) || v9 == -1)
        v7 = -1;
      else
        v7 = v9;
    }
    *((_DWORD *)v6 + v2) = v7;
  }
  return result;
}

NSString *_CSStoreGetTableWithName(uint64_t a1, NSString *a2)
{
  void *v4;
  uint64_t v5;
  char *Table;

  v4 = (void *)MEMORY[0x1A85AA4B4]();
  if (performConstantAssertions)
  {
    v5 = *(_QWORD *)(a1 + 336);
    if (v5)
      (*(void (**)(_QWORD))(**(_QWORD **)(v5 + 8) + 8))(*(_QWORD *)(v5 + 8));
  }
  if (a2)
  {
    Table = CSStore2::Store::getTable((CSStore2 **)(a1 + 8), a2);
    if (Table)
      a2 = (NSString *)(4 * *(_DWORD *)Table);
    else
      a2 = 0;
  }
  objc_autoreleasePoolPop(v4);
  return a2;
}

char *CSStore2::Store::getTable(CSStore2 **this, NSString *a2)
{
  NSString *v3;
  CSStore2 *v4;
  char *v5;
  _QWORD v7[4];
  NSString *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a2;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  if (-[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("<catalog>")))
  {
    v4 = *this;
    if (*this)
      v4 = (CSStore2 *)*((_QWORD *)v4 + 1);
    v5 = (char *)v4 + 20;
    v11[3] = (uint64_t)v4 + 20;
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = ___ZNK8CSStore25Store8getTableEP8NSString_block_invoke;
    v7[3] = &unk_1E4E21A98;
    v8 = v3;
    v9 = &v10;
    CSStore2::Store::enumerateTables(this, v7);

    v5 = (char *)v11[3];
  }
  _Block_object_dispose(&v10, 8);

  return v5;
}

void sub_1A4E5E00C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  void *v7;
  va_list va;

  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void CSStore2::Store::enumerateTables(CSStore2 **a1, void *a2)
{
  id v3;
  void *v4;
  CSStore2 *v5;
  unsigned int *v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = *a1;
    if (*a1)
      v5 = (CSStore2 *)*((_QWORD *)v5 + 1);
    v6 = (unsigned int *)((char *)v5 + 20);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = ___ZNK8CSStore25Store15enumerateTablesEU13block_pointerFvPKNS_5TableEPbE_block_invoke;
    v7[3] = &unk_1E4E21BE0;
    v8 = v3;
    CSStore2::Store::enumerateUnits(a1, v6, v7);

  }
}

void sub_1A4E5E0D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__rehash<true>(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  size_t v9;
  uint8x8_t v10;
  unint64_t v11;
  uint8x8_t v12;
  uint64_t v13;
  _QWORD *v14;
  size_t v15;
  void *v16;

  if (__n == 1)
  {
    prime = 2;
  }
  else
  {
    prime = __n;
    if ((__n & (__n - 1)) != 0)
      prime = std::__next_prime(__n);
  }
  v4 = *(int8x8_t *)(a1 + 8);
  if (prime <= *(_QWORD *)&v4)
  {
    if (prime >= *(_QWORD *)&v4)
      return;
    v11 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v12 = (uint8x8_t)vcnt_s8(v4), v12.i16[0] = vaddlv_u8(v12), v12.u32[0] > 1uLL))
    {
      v11 = std::__next_prime(v11);
    }
    else
    {
      v13 = 1 << -(char)__clz(v11 - 1);
      if (v11 >= 2)
        v11 = v13;
    }
    if (prime <= v11)
      prime = v11;
    if (prime >= *(_QWORD *)&v4)
      return;
    if (!prime)
    {
      v16 = *(void **)a1;
      *(_QWORD *)a1 = 0;
      if (v16)
        operator delete(v16);
      *(_QWORD *)(a1 + 8) = 0;
      return;
    }
  }
  if (prime >> 61)
    std::__throw_bad_array_new_length[abi:nn180100]();
  v5 = operator new(8 * prime);
  v6 = *(void **)a1;
  *(_QWORD *)a1 = v5;
  if (v6)
    operator delete(v6);
  v7 = 0;
  *(_QWORD *)(a1 + 8) = prime;
  do
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v7++) = 0;
  while (prime != v7);
  v8 = *(_QWORD **)(a1 + 16);
  if (v8)
  {
    v9 = v8[1];
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)prime);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      if (v9 >= prime)
        v9 %= prime;
    }
    else
    {
      v9 &= prime - 1;
    }
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v9) = a1 + 16;
    v14 = (_QWORD *)*v8;
    if (*v8)
    {
      do
      {
        v15 = v14[1];
        if (v10.u32[0] > 1uLL)
        {
          if (v15 >= prime)
            v15 %= prime;
        }
        else
        {
          v15 &= prime - 1;
        }
        if (v15 != v9)
        {
          if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v15))
          {
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v15) = v8;
            goto LABEL_31;
          }
          *v8 = *v14;
          *v14 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v15);
          **(_QWORD **)(*(_QWORD *)a1 + 8 * v15) = v14;
          v14 = v8;
        }
        v15 = v9;
LABEL_31:
        v8 = v14;
        v14 = (_QWORD *)*v14;
        v9 = v15;
      }
      while (v14);
    }
  }
}

void ___ZNK8CSStore25Store4copyEPU15__autoreleasingP7NSError_block_invoke(uint64_t a1, CSStore2::Table *this, _BYTE *a3)
{
  __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (*((_DWORD *)this + 18) == 0x3FFFFFFF)
  {
    v5 = (__CFString *)CSStore2::Table::copyCFName(this);
    v6 = -[__CFString copy](v5, "copy");
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    *a3 = 1;
  }
}

void sub_1A4E5E34C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;

  v2 = *(_QWORD **)(a1 + 16);
  if (v2)
  {
    do
    {
      v3 = (_QWORD *)*v2;
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
  v4 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v4)
    operator delete(v4);
  return a1;
}

uint64_t _CSStoreGetXPCClass()
{
  return objc_opt_class();
}

uint64_t _CSStoreIsMutable(void *a1)
{
  return objc_msgSend(a1, "isReadOnly") ^ 1;
}

uint64_t _CSStoreSetMutable(void *a1, const char *a2)
{
  return objc_msgSend(a1, "setReadOnly:", (_DWORD)a2 == 0);
}

void sub_1A4E5E6A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11)
{
  void *v11;
  void *v12;
  void *v13;

  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1A4E5EFCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, id *a18, uint64_t a19, uint64_t a20,id *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id a29)
{
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  std::unique_ptr<CSStore2::Store>::reset[abi:nn180100](&a21, 0);
  std::unique_ptr<CSStore2::Store>::reset[abi:nn180100](&a18, 0);

  _Unwind_Resume(a1);
}

void sub_1A4E5F3F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A4E5F578(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

id CSStore2::Store::encodeAsXPCObject(uint64_t a1, _QWORD *a2)
{
  int v3;
  unsigned int v4;
  unsigned int v5;
  size_t v6;
  CSStore2 *Copy;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  CSStore2 *v12;
  xpc_object_t v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  uint8_t buf[4];
  size_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (a1)
    v3 = *(_DWORD *)(a1 + 16);
  else
    v3 = 0;
  v4 = *MEMORY[0x1E0C85AD8];
  v5 = v3 + *MEMORY[0x1E0C85AD8] - 1;
  if (v5 == v5 % *MEMORY[0x1E0C85AD8])
    v6 = v4;
  else
    v6 = v5 / v4 * v4;
  if (a1)
    a1 = *(_QWORD *)(a1 + 8);
  Copy = (CSStore2 *)CSStore2::VM::AllocateCopy((CSStore2::VM *)a1, (const void *)v6, (CSStore2::VM *)v6);
  CSStore2::GetLog(Copy);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (Copy)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v30 = v6;
      _os_log_debug_impl(&dword_1A4E5A000, v9, OS_LOG_TYPE_DEBUG, "Creating dispatch_data for XPC coder with length %llu", buf, 0xCu);
    }

    if (CSStore2::Store::_GetDispatchDataDeallocatorQueue(void)::once != -1)
      dispatch_once(&CSStore2::Store::_GetDispatchDataDeallocatorQueue(void)::once, &__block_literal_global_93);
    v10 = (id)CSStore2::Store::_GetDispatchDataDeallocatorQueue(void)::result;
    v11 = dispatch_data_create(Copy, v6, v10, (dispatch_block_t)*MEMORY[0x1E0C80CF8]);

    if (v11)
    {
      v13 = xpc_data_create_with_dispatch_data(v11);
      if (v13)
      {

        v14 = 0;
        goto LABEL_30;
      }
      CSStore2::GetLog(0);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A4E5A000, v20, OS_LOG_TYPE_ERROR, "Could not create XPC data from dispatch data while encoding store.", buf, 2u);
      }

      v21 = (void *)MEMORY[0x1E0CB35C8];
      v27[0] = *MEMORY[0x1E0CB2938];
      v27[1] = CFSTR("Line");
      v28[0] = CFSTR("kCSStoreAllocFailedErr");
      v28[1] = &unk_1E4E250D0;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -9493, v18);
      v19 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      CSStore2::GetLog(v12);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A4E5A000, v16, OS_LOG_TYPE_ERROR, "could not create dispatch data from store mapping while encoding store.", buf, 2u);
      }

      CSStore2::VM::Deallocate(Copy, (void *)v6);
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v25[0] = *MEMORY[0x1E0CB2938];
      v25[1] = CFSTR("Line");
      v26[0] = CFSTR("kCSStoreAllocFailedErr");
      v26[1] = &unk_1E4E250E8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -9493, v18);
      v19 = objc_claimAutoreleasedReturnValue();
    }
    v14 = (id)v19;

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A4E5A000, v9, OS_LOG_TYPE_ERROR, "could not create a copy of the store mapping while encoding store.", buf, 2u);
    }

    v15 = (void *)MEMORY[0x1E0CB35C8];
    v23[0] = *MEMORY[0x1E0CB2938];
    v23[1] = CFSTR("Line");
    v24[0] = CFSTR("kCSStoreAllocFailedErr");
    v24[1] = &unk_1E4E25100;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -9493, v11);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (a2)
  {
    v14 = objc_retainAutorelease(v14);
    v13 = 0;
    *a2 = v14;
  }
  else
  {
    v13 = 0;
  }
LABEL_30:

  return v13;
}

void sub_1A4E5F97C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void CSStore2::Store::CreateWithXPCObject(id **a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  size_t length;
  CSStore2 *bytes_ptr;
  Bytef *v13;
  NSObject *v14;
  id *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _BYTE buf[24];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  *a1 = 0;
  if (!v5 || MEMORY[0x1A85AA844](v5) != MEMORY[0x1E0C812E8])
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v19[0] = *MEMORY[0x1E0CB2938];
    v19[1] = CFSTR("Line");
    v20[0] = CFSTR("paramErr");
    v20[1] = &unk_1E4E250B8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_4;
  }
  length = xpc_data_get_length(v6);
  bytes_ptr = (CSStore2 *)xpc_data_get_bytes_ptr(v6);
  v13 = (Bytef *)bytes_ptr;
  if (!bytes_ptr || HIDWORD(length))
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v21[0] = *MEMORY[0x1E0CB2938];
    v21[1] = CFSTR("Line");
    v22[0] = CFSTR("kCSStoreBadDataErr");
    v22[1] = &unk_1E4E250A0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -9496, v17);
    v9 = (id)objc_claimAutoreleasedReturnValue();

LABEL_4:
    v10 = 0;
    if (!a3)
      goto LABEL_7;
    goto LABEL_5;
  }
  CSStore2::GetLog(bytes_ptr);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = length;
    _os_log_debug_impl(&dword_1A4E5A000, v14, OS_LOG_TYPE_DEBUG, "Creating CSStore from XPC coder with length %llu", buf, 0xCu);
  }

  v18 = 0;
  CSStore2::Store::CreateWithBytes((id **)buf, v13, (void *)length, &v18);
  v9 = v18;
  v15 = *(id **)buf;
  *(_QWORD *)buf = 0;
  std::unique_ptr<CSStore2::Store>::reset[abi:nn180100](a1, v15);
  std::unique_ptr<CSStore2::Store>::reset[abi:nn180100]((id **)buf, 0);
  v10 = *a1 != 0;
  if (a3)
  {
LABEL_5:
    if (!v10)
      *a3 = objc_retainAutorelease(v9);
  }
LABEL_7:

}

void sub_1A4E5FC28(_Unwind_Exception *a1)
{
  void *v1;
  id **v2;
  void *v3;

  std::unique_ptr<CSStore2::Store>::reset[abi:nn180100](v2, 0);
  _Unwind_Resume(a1);
}

void CSStore2::Store::CreateWithBytes(id **a1, Bytef *a2, void *a3, _QWORD *a4)
{
  id v6;
  id *v7;
  BOOL v8;
  void *v9;
  void *v10;
  id v11;
  id *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  *a1 = 0;
  if (a2 && (_DWORD)a3)
  {
    v11 = 0;
    CSStore2::Store::_Create((CSStore2 *)&v12, a2, a3, 1, 0, &v11);
    v6 = v11;
    v7 = v12;
    v12 = 0;
    std::unique_ptr<CSStore2::Store>::reset[abi:nn180100](a1, v7);
    std::unique_ptr<CSStore2::Store>::reset[abi:nn180100](&v12, 0);
    v8 = *a1 != 0;
    if (!a4)
      goto LABEL_8;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v13[0] = *MEMORY[0x1E0CB2938];
    v13[1] = CFSTR("Line");
    v14[0] = CFSTR("paramErr");
    v14[1] = &unk_1E4E25058;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v10);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v8 = 0;
    if (!a4)
      goto LABEL_8;
  }
  if (!v8)
    *a4 = objc_retainAutorelease(v6);
LABEL_8:

}

void sub_1A4E5FDC4(_Unwind_Exception *a1)
{
  id **v1;
  void *v2;

  std::unique_ptr<CSStore2::Store>::reset[abi:nn180100](v1, 0);
  _Unwind_Resume(a1);
}

void CSStore2::Store::_Create(CSStore2 *a1, Bytef *a2, void *a3, int a4, uint64_t a5, _QWORD *a6)
{
  id **v9;
  CSStore2::VM *Copy;
  id v11;
  id *v12;
  id *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v20;
  __CFBundle *BundleWithIdentifier;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  int v28;
  unsigned int v29;
  NSObject *v30;
  unsigned int v31;
  unint64_t v32;
  uLong v33;
  unsigned __int16 v34;
  NSObject *v35;
  NSObject *v36;
  NSUInteger v37;
  vm_address_t v38;
  char *v39;
  char *v40;
  int v41;
  unsigned int v42;
  unsigned int v43;
  unsigned int v44;
  uint64_t v45;
  NSRange v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  NSObject *v61;
  uint64_t v62;
  __int128 v63;
  unint64_t v64;
  void *v65;
  id v66;
  char v67;
  void *v68;
  id v69;
  char *v70;
  void *v71;
  void *v72;
  CSStore2 *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  unsigned int v82;
  unsigned int v83;
  char *v84;
  unsigned int v85;
  unint64_t v86;
  void *__s2;
  id v90;
  __int16 v91;
  char v92;
  __int16 v93;
  char v94;
  _QWORD v95[4];
  _QWORD v96[4];
  _QWORD v97[7];
  _QWORD v98[7];
  _QWORD v99[2];
  _QWORD v100[2];
  _QWORD v101[3];
  _QWORD v102[3];
  _QWORD v103[5];
  _QWORD v104[5];
  _QWORD v105[2];
  _QWORD v106[2];
  _BYTE buf[12];
  __int16 v108;
  uint64_t v109;
  __int16 v110;
  uint64_t v111;
  _QWORD v112[2];
  _QWORD v113[5];
  NSRange v114;

  v9 = (id **)a1;
  v113[2] = *MEMORY[0x1E0C80C00];
  *(_QWORD *)a1 = 0;
  if (a4)
  {
    Copy = (CSStore2::VM *)CSStore2::VM::AllocateCopy((CSStore2::VM *)a2, a3, (CSStore2::VM *)a3);
    if (!Copy)
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v112[0] = *MEMORY[0x1E0CB2938];
      v112[1] = CFSTR("Line");
      v113[0] = CFSTR("kCSStoreAllocFailedErr");
      v113[1] = &unk_1E4E24FB0;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v113, v112, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -9493, v16);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_114;
    }
    v90 = 0;
    CSStore2::Store::_Create(buf, Copy, a3, 0, a5, &v90);
    v11 = v90;
    v12 = *(id **)buf;
    *(_QWORD *)buf = 0;
    std::unique_ptr<CSStore2::Store>::reset[abi:nn180100](v9, v12);
    std::unique_ptr<CSStore2::Store>::reset[abi:nn180100]((id **)buf, 0);
    if (!*v9)
    {
      CSStore2::VM::Deallocate(Copy, a3);
      v13 = 0;
      goto LABEL_115;
    }
    goto LABEL_118;
  }
  if (!a2)
  {
LABEL_30:
    v28 = 2;
    goto LABEL_31;
  }
  if (a3 < 0x64)
  {
LABEL_7:
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v99[0] = *MEMORY[0x1E0CB2938];
    v99[1] = CFSTR("Line");
    v100[0] = CFSTR("kCSStoreBadDataErr");
    v100[1] = &unk_1E4E25010;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v100, v99, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -9496, v15);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    goto LABEL_94;
  }
  v18 = *(_DWORD *)a2;
  if (*(_DWORD *)a2 == -788868902 || v18 == -623838512)
  {
    CSStore2::GetLog(a1);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4E5A000, v20, OS_LOG_TYPE_DEFAULT, "Encountered CSStore1 file, can't read it.", buf, 2u);
    }

    v16 = 0;
    goto LABEL_17;
  }
  if (v18 != 1819501666)
    goto LABEL_7;
  v28 = a2[4];
  if (v28 == 2)
  {
    v29 = *((_DWORD *)a2 + 3);
    if (*((_DWORD *)a2 + 4) > v29 || v29 > a3)
      goto LABEL_7;
    CSStore2::GetLog(a1);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      v79 = *((unsigned int *)a2 + 3);
      v78 = *((unsigned int *)a2 + 4);
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = a3;
      v108 = 2048;
      v109 = v78;
      v110 = 2048;
      v111 = v79;
      _os_log_debug_impl(&dword_1A4E5A000, v30, OS_LOG_TYPE_DEBUG, "Checked CSStore data with lengths %llu/%llu/%llu", buf, 0x20u);
    }

    goto LABEL_30;
  }
LABEL_31:
  if (!(_DWORD)a5)
  {
LABEL_86:
    v16 = 0;
LABEL_87:
    v62 = operator new();
    *(_BYTE *)(v62 + 312) = 0;
    *(_BYTE *)(v62 + 316) = 0;
    *(_QWORD *)v62 = 0;
    *(_QWORD *)&v63 = -1;
    *((_QWORD *)&v63 + 1) = -1;
    *(_OWORD *)(v62 + 8) = v63;
    *(_OWORD *)(v62 + 24) = v63;
    *(_OWORD *)(v62 + 40) = v63;
    *(_OWORD *)(v62 + 56) = v63;
    *(_OWORD *)(v62 + 72) = v63;
    *(_OWORD *)(v62 + 88) = v63;
    *(_OWORD *)(v62 + 104) = v63;
    *(_OWORD *)(v62 + 120) = v63;
    *(_OWORD *)(v62 + 136) = v63;
    *(_OWORD *)(v62 + 152) = v63;
    *(_OWORD *)(v62 + 168) = v63;
    *(_OWORD *)(v62 + 184) = v63;
    *(_OWORD *)(v62 + 200) = v63;
    *(_OWORD *)(v62 + 216) = v63;
    *(_OWORD *)(v62 + 232) = v63;
    *(_OWORD *)(v62 + 248) = v63;
    *(_QWORD *)(v62 + 264) = 0;
    *(_QWORD *)(v62 + 272) = 0;
    *(_QWORD *)(v62 + 280) = 0;
    atomic_store(0, (unint64_t *)(v62 + 288));
    atomic_store(0, (unint64_t *)(v62 + 296));
    do
      v64 = __ldaxr(&CSStore2::Store::Store(void)::nextFamily);
    while (__stlxr(v64 + 1, &CSStore2::Store::Store(void)::nextFamily));
    *(_QWORD *)(v62 + 304) = v64;
    *(_BYTE *)(v62 + 312) = 0;
    *(_BYTE *)(v62 + 315) = v94;
    *(_WORD *)(v62 + 313) = v93;
    *(_BYTE *)(v62 + 316) = 0;
    *(_BYTE *)(v62 + 319) = v92;
    *(_WORD *)(v62 + 317) = v91;
    *(_BYTE *)(v62 + 320) = 0;
    *(_QWORD *)buf = 0;
    std::unique_ptr<CSStore2::Store>::reset[abi:nn180100](v9, (id *)v62);
    std::unique_ptr<CSStore2::Store>::reset[abi:nn180100]((id **)buf, 0);
    if (*v9)
    {
      CSStore2::Store::setBytesNoCopy((CSStore2::Store *)*v9, a2, (uint64_t)a3);
      v11 = 0;
      v9 = (id **)a1;
      goto LABEL_114;
    }
    if (a2)
      CSStore2::VM::Deallocate((CSStore2::VM *)a2, a3);
    v65 = (void *)MEMORY[0x1E0CB35C8];
    v105[0] = *MEMORY[0x1E0CB2938];
    v105[1] = CFSTR("Line");
    v106[0] = CFSTR("kCSStoreAllocFailedErr");
    v106[1] = &unk_1E4E24FC8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v106, v105, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -9493, v15);
    v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_94:
    v9 = (id **)a1;
    goto LABEL_113;
  }
  if (a3 <= 0x63)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "static std::unique_ptr<Store> CSStore2::Store::_Create(void *, _CSStoreSize, BOOL, BOOL, NSError *__autoreleasing *)");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "handleFailureInFunction:file:lineNumber:description:", v81, CFSTR("CSStore+Store.mm"), 126, CFSTR("Somehow thought CSStore header was OK when it's too short."));

    v9 = (id **)a1;
  }
  v31 = *((_DWORD *)a2 + 3);
  v83 = *((_DWORD *)a2 + 4);
  v32 = *((unsigned __int16 *)a2 + 3);
  if (v32 > 2)
  {
    v86 = *((unsigned __int16 *)a2 + 3);
    v85 = v28;
    v82 = *((_DWORD *)a2 + 3);
    v33 = crc32(0x6E797267uLL, a2 + 100, v31 - 100);
    if ((unsigned __int16)v33 >= 3uLL)
      v34 = v33;
    else
      v34 = v33 | 0xE000;
    CSStore2::GetLog((CSStore2 *)v33);
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if ((_DWORD)v86 != v34)
    {
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v86;
        v108 = 2048;
        v109 = v34;
        _os_log_error_impl(&dword_1A4E5A000, v36, OS_LOG_TYPE_ERROR, "CSStore checksum expected to be %llx, was %llx.", buf, 0x16u);
      }
      v16 = 0;
      goto LABEL_109;
    }
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v86;
      _os_log_debug_impl(&dword_1A4E5A000, v36, OS_LOG_TYPE_DEBUG, "CSStore checksum matches: %llx", buf, 0xCu);
    }

    goto LABEL_86;
  }
  v37 = (2 * *MEMORY[0x1E0C85AD8]);
  v38 = CSStore2::VM::Allocate((CSStore2::VM *)v37);
  if (!v38)
  {
    CSStore2::GetLog(0);
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A4E5A000, v61, OS_LOG_TYPE_ERROR, "CSStore zero-page check could not allocate memory. Skipping check.", buf, 2u);
    }

    goto LABEL_86;
  }
  v86 = v32;
  __s2 = (void *)v38;
  v82 = v31;
  v85 = v28;
  if (v37 >= a3)
  {
    v39 = 0;
    goto LABEL_98;
  }
  v39 = 0;
  v40 = 0;
  v84 = 0;
  v41 = 0;
  v42 = 0;
  v43 = v37;
  while ((unint64_t)(v40 - v39) < 0x400)
  {
    v44 = v43;
    if (!memcmp(&a2[v42], __s2, v37))
    {
      v45 = (v40 - v39) >> 4;
      if (v39 == v40)
      {
        if (v39 >= v84)
        {
          v47 = v84 - v39;
          if ((v84 - v39) >> 3 <= (unint64_t)(v45 + 1))
            v48 = v45 + 1;
          else
            v48 = v47 >> 3;
          if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFF0)
            v49 = 0xFFFFFFFFFFFFFFFLL;
          else
            v49 = v48;
          v50 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<NSString *,objc_object *>>>(v49);
          v51 = &v50[16 * v45];
          v84 = &v50[16 * v52];
          *(_QWORD *)v51 = v42;
          *((_QWORD *)v51 + 1) = v37;
          v40 = v51 + 16;
          if (v39)
            operator delete(v39);
          v39 = v51;
        }
        else
        {
          *(_QWORD *)v39 = v42;
          *((_QWORD *)v39 + 1) = v37;
          v40 = v39 + 16;
        }
      }
      else
      {
        v46 = (NSRange)*((_OWORD *)v40 - 1);
        if (v46.length + v46.location == v42)
        {
          v114.location = v42;
          v114.length = v37;
          v9 = (id **)a1;
          *((NSRange *)v40 - 1) = NSUnionRange(v46, v114);
LABEL_76:
          ++v41;
          goto LABEL_77;
        }
        v9 = (id **)a1;
        if (v40 < v84)
        {
          *(_QWORD *)v40 = v42;
          *((_QWORD *)v40 + 1) = v37;
          v40 += 16;
          goto LABEL_76;
        }
        v53 = v84 - v39;
        if ((v84 - v39) >> 3 <= (unint64_t)(v45 + 1))
          v54 = v45 + 1;
        else
          v54 = v53 >> 3;
        if ((unint64_t)v53 >= 0x7FFFFFFFFFFFFFF0)
          v55 = 0xFFFFFFFFFFFFFFFLL;
        else
          v55 = v54;
        v56 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<NSString *,objc_object *>>>(v55);
        v57 = &v56[16 * v45];
        v84 = &v56[16 * v58];
        *(_QWORD *)v57 = v42;
        *((_QWORD *)v57 + 1) = v37;
        v59 = v57 + 16;
        do
        {
          *((_OWORD *)v57 - 1) = *((_OWORD *)v40 - 1);
          v57 -= 16;
          v40 -= 16;
        }
        while (v40 != v39);
        if (v39)
          operator delete(v39);
        v39 = v57;
        v40 = v59;
      }
      v9 = (id **)a1;
      goto LABEL_76;
    }
    v9 = (id **)a1;
LABEL_77:
    v43 = v44 + v37;
    v42 = v44;
    if (v44 + v37 >= a3)
      goto LABEL_97;
  }
  v9 = (id **)a1;
LABEL_97:
  if (v41 >= 8)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_alloc_init(MEMORY[0x1E0CB34E8]);
    if (v39 != v40)
    {
      v70 = v39;
      do
      {
        objc_msgSend(v69, "stringFromByteCount:", *((_QWORD *)v70 + 1));
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%llX-0x%llX (%@)"), *(_QWORD *)v70, *(_QWORD *)v70 + *((_QWORD *)v70 + 1) - 1, v71);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "addObject:", v72);

        v70 += 16;
      }
      while (v70 != v40);
    }
    v66 = objc_retainAutorelease(v68);

    v67 = 0;
  }
  else
  {
LABEL_98:
    v66 = 0;
    v67 = 1;
  }
  CSStore2::VM::Deallocate((CSStore2::VM *)__s2, (void *)*MEMORY[0x1E0C85AD8]);
  if (v39)
    operator delete(v39);
  v73 = (CSStore2 *)v66;
  v16 = v73;
  if ((v67 & 1) != 0)
    goto LABEL_87;
  CSStore2::GetLog(v73);
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v16;
    _os_log_error_impl(&dword_1A4E5A000, v36, OS_LOG_TYPE_ERROR, "CSStore file has zeroed pages and has been corrupted at a low level. Offsets: %{public}@", buf, 0xCu);
  }
  v34 = 0;
LABEL_109:

  v60 = v85;
  if (v85 == 2)
  {
    v75 = (void *)MEMORY[0x1E0CB35C8];
    v76 = *MEMORY[0x1E0CB2F90];
    if (v86 > 2)
    {
      v95[0] = *MEMORY[0x1E0CB2938];
      v95[1] = CFSTR("Line");
      v96[0] = CFSTR("kCSStoreBadChecksumErr");
      v96[1] = &unk_1E4E25040;
      v95[2] = CFSTR("Checksum");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v96[2] = v15;
      v95[3] = CFSTR("CalculatedChecksum");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v34);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v96[3] = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v96, v95, 4);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (id **)a1;
      objc_msgSend(v75, "errorWithDomain:code:userInfo:", v76, -9489, v24);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    v97[0] = *MEMORY[0x1E0CB2938];
    v97[1] = CFSTR("Line");
    v98[0] = CFSTR("kCSStoreBadDataErr");
    v98[1] = &unk_1E4E25028;
    v98[2] = v16;
    v97[2] = CFSTR("ZeroedRanges");
    v97[3] = CFSTR("Length");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v98[3] = v15;
    v97[4] = CFSTR("UsedLength");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v83);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v98[4] = v22;
    v97[5] = CFSTR("ConsumedLength");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v82);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v98[5] = v24;
    v97[6] = CFSTR("Checksum");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v86);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v98[6] = v27;
    v9 = (id **)a1;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v98, v97, 7);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "errorWithDomain:code:userInfo:", v76, -9496, v77);
    v11 = (id)objc_claimAutoreleasedReturnValue();

LABEL_21:
LABEL_22:

    goto LABEL_112;
  }
  if (v85 == 1)
  {
LABEL_17:
    if (CSStore2::IsAppleInternal(void)::once != -1)
      dispatch_once(&CSStore2::IsAppleInternal(void)::once, &__block_literal_global_134);
    if (!CSStore2::IsAppleInternal(void)::result)
    {
      v60 = 1;
      goto LABEL_111;
    }
    BundleWithIdentifier = CFBundleGetBundleWithIdentifier(CFSTR("com.apple.CSStore"));
    v15 = (void *)CFBundleCopyLocalizedString(BundleWithIdentifier, CFSTR("This file is in the CSStore1 format."), 0, CFSTR("Localized"));
    v22 = (void *)CFBundleCopyLocalizedString(BundleWithIdentifier, CFSTR("The system can only read CSStore2 files, which first shipped with iOS 9 and OS X El Capitan."), 0, CFSTR("Localized"));
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v103[0] = *MEMORY[0x1E0CB2938];
    v103[1] = CFSTR("Line");
    v104[0] = CFSTR("kCSStoreOldVersionErr");
    v104[1] = &unk_1E4E24FE0;
    v103[2] = CFSTR("Version");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *MEMORY[0x1E0CB2D68];
    v104[2] = v24;
    v104[3] = v15;
    v26 = *MEMORY[0x1E0CB2D80];
    v103[3] = v25;
    v103[4] = v26;
    v104[4] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v104, v103, 5);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -9488, v27);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
LABEL_111:
  v74 = (void *)MEMORY[0x1E0CB35C8];
  v101[0] = *MEMORY[0x1E0CB2938];
  v101[1] = CFSTR("Line");
  v102[0] = CFSTR("kCSStoreOldVersionErr");
  v102[1] = &unk_1E4E24FF8;
  v101[2] = CFSTR("Version");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v60);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v102[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v102, v101, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -9488, v22);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (id **)a1;
LABEL_112:

LABEL_113:
LABEL_114:

  v13 = *v9;
LABEL_115:
  if (a6 && !v13)
  {
    v11 = objc_retainAutorelease(v11);
    *a6 = v11;
  }
LABEL_118:

}

void sub_1A4E60BB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id **a17)
{
  void *v17;
  void *v18;

  std::unique_ptr<CSStore2::Store>::reset[abi:nn180100](a17, 0);
  _Unwind_Resume(a1);
}

id CSStore2::GetLog(CSStore2 *this)
{
  if (CSStore2::GetLog(void)::once != -1)
    dispatch_once(&CSStore2::GetLog(void)::once, &__block_literal_global_679);
  return (id)CSStore2::GetLog(void)::result;
}

vm_address_t CSStore2::VM::AllocateCopy(CSStore2::VM *this, const void *a2, CSStore2::VM *a3)
{
  unsigned int v3;
  unsigned int v4;
  vm_address_t v6;
  vm_address_t v7;
  unint64_t v8;

  v3 = a3;
  v4 = a2;
  v6 = CSStore2::VM::Allocate(a3);
  v7 = v6;
  if (v6)
  {
    if (v3 >= v4)
      v8 = v4;
    else
      v8 = v3;
    CSStore2::VM::Copy(v6, (NSUInteger)this, (const void *)v8);
  }
  return v7;
}

vm_address_t CSStore2::VM::Allocate(CSStore2::VM *this)
{
  unsigned int v1;
  unsigned int v2;
  vm_size_t v3;
  kern_return_t v4;
  vm_address_t result;
  BOOL v6;
  NSObject *v7;
  vm_address_t address;
  uint8_t buf[4];
  vm_size_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  address = 0;
  v1 = *MEMORY[0x1E0C85AD8];
  v2 = (_DWORD)this + *MEMORY[0x1E0C85AD8] - 1;
  if (v2 == v2 % *MEMORY[0x1E0C85AD8])
    v3 = v1;
  else
    v3 = v2 / v1 * v1;
  v4 = vm_allocate(*MEMORY[0x1E0C83DA0], &address, v3, 721420289);
  result = address;
  if (v4)
    v6 = 1;
  else
    v6 = address == 0;
  if (v6)
  {
    CSStore2::GetLog((CSStore2 *)address);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v10 = v3;
      v11 = 2048;
      v12 = v4;
      _os_log_error_impl(&dword_1A4E5A000, v7, OS_LOG_TYPE_ERROR, "Failed to allocate %llu bytes with kernel error %llx.", buf, 0x16u);
    }

    return 0;
  }
  return result;
}

void CSStore2::VM::Copy(NSUInteger this, NSUInteger a2, const void *a3)
{
  unsigned int v3;
  NSUInteger v4;
  NSUInteger v6;
  NSUInteger v7;
  NSRange v8;
  NSRange v9;

  v3 = a3;
  v4 = a2;
  v6 = a3;
  v8.location = a2;
  v8.length = v6;
  v9.location = this;
  v9.length = v6;
  if (!NSIntersectionRange(v8, v9).length)
  {
    if (v3 < 0x80000)
      goto LABEL_5;
    if (((NSPageSize() - 1) & (v4 | this)) == 0)
    {
      v7 = NSRoundDownToMultipleOfPageSize(v6);
      NSCopyMemoryPages((const void *)v4, (void *)this, v7);
      v4 += v7;
      this += v7;
      v6 -= v7;
LABEL_5:
      if (!v6)
        return;
    }
  }
  memmove((void *)this, (const void *)v4, v6);
}

void CSStore2::Store::setBytesNoCopy(CSStore2::Store *this, void *a2, uint64_t a3)
{
  void *v6;
  _CSStore2DataContainer *v7;
  void *v8;
  vm_address_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unsigned int v14;
  BOOL v15;
  unint64_t v16;
  NSUInteger v18;
  uint64_t v19;
  unint64_t v20;
  NSUInteger v21;
  void *v22;
  id v23;
  _OWORD v24[2];
  int v25;

  CSStore2::Store::assertNotEnumeratingUnits((uint64_t)this);
  if (a2)
  {
    v6 = *(void **)this;
    *(_QWORD *)this = 0;

    v7 = -[_CSStore2DataContainer initWithBytesNoCopy:length:]([_CSStore2DataContainer alloc], "initWithBytesNoCopy:length:", a2, a3);
    v8 = *(void **)this;
    *(_QWORD *)this = v7;

    CSStore2::Store::_dataDidMove(this);
    atomic_store(0, (unint64_t *)this + 37);
  }
  else
  {
    if (a3 <= 0x40000)
      a3 = 0x40000;
    else
      a3 = a3;
    v9 = CSStore2::VM::Allocate((CSStore2::VM *)a3);
    if (v9)
    {
      v10 = (void *)v9;
      *(_OWORD *)(v9 + 4) = 0u;
      *(_QWORD *)(v9 + 84) = 0;
      *(_OWORD *)(v9 + 68) = 0u;
      *(_OWORD *)(v9 + 52) = 0u;
      *(_OWORD *)(v9 + 36) = 0u;
      *(_OWORD *)(v9 + 20) = 0u;
      *(_DWORD *)v9 = 1819501666;
      *(_BYTE *)(v9 + 4) = 2;
      *(_QWORD *)(v9 + 92) = 0xFFFFFFFF00000000;
      *(_OWORD *)(v9 + 12) = xmmword_1A4E89670;
      CSStore2::Table::setName((CSStore2::Table *)(v9 + 20), CFSTR("<catalog>"));
      CSStore2::Store::setBytesNoCopy(this, v10, a3);
      v11 = *(_QWORD *)this;
      if (*(_QWORD *)this)
      {
        v12 = *(_QWORD *)(v11 + 8);
        v13 = v12 + 20;
      }
      else
      {
        v12 = 0;
        v13 = 20;
      }
      v14 = -1;
      v15 = v13 >= v12;
      v16 = v13 - v12;
      if (v15 && !HIDWORD(v16))
      {
        if ((v16 + 1) > *(_DWORD *)(*(_QWORD *)(v11 + 8) + 12) || v16 == -1)
          v14 = -1;
        else
          v14 = v16;
      }
      memset(v24, 0, sizeof(v24));
      v25 = 1065353216;
      v18 = CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::Create(this, (uint64_t)v24);
      if (!v18
        || ((v19 = *(_QWORD *)this) == 0 ? (v20 = 0) : (v20 = *(_QWORD *)(v19 + 8)),
            (v21 = v18 - v20, v18 < v20)
         || HIDWORD(v21)
         || (_DWORD)v21 == -1
         || (v21 + 1) > *(_DWORD *)(*(_QWORD *)(v19 + 8) + 12)))
      {
        std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)v24);
      }
      else
      {
        std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)v24);
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)this + 8) + v14 + 76) = v21;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void CSStore2::Store::setBytesNoCopy(void *, _CSStoreSize)");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("CSStore+Store.mm"), 820, CFSTR("Failed to create data for empty bytes argument!"));

    }
  }
}

void sub_1A4E61200(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, char a11)
{
  void *v11;

  _Unwind_Resume(a1);
}

uint64_t CSStore2::Store::assertNotEnumeratingUnits(uint64_t this)
{
  if (atomic_load((unint64_t *)(this + 288)))
    abort();
  return this;
}

char *CSStore2::Store::_dataDidMove(CSStore2::Store *this)
{
  __int128 v2;
  uint64_t v3;
  char *result;
  _QWORD v5[5];

  *(_QWORD *)&v2 = -1;
  *((_QWORD *)&v2 + 1) = -1;
  *(_OWORD *)((char *)this + 248) = v2;
  *(_OWORD *)((char *)this + 232) = v2;
  *(_OWORD *)((char *)this + 216) = v2;
  *(_OWORD *)((char *)this + 200) = v2;
  *(_OWORD *)((char *)this + 184) = v2;
  *(_OWORD *)((char *)this + 168) = v2;
  *(_OWORD *)((char *)this + 152) = v2;
  *(_OWORD *)((char *)this + 136) = v2;
  *(_OWORD *)((char *)this + 120) = v2;
  *(_OWORD *)((char *)this + 104) = v2;
  *(_OWORD *)((char *)this + 88) = v2;
  *(_OWORD *)((char *)this + 72) = v2;
  *(_OWORD *)((char *)this + 56) = v2;
  *(_OWORD *)((char *)this + 40) = v2;
  *(_OWORD *)((char *)this + 24) = v2;
  v3 = MEMORY[0x1E0C809B0];
  *(_OWORD *)((char *)this + 8) = v2;
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = ___ZN8CSStore25Store12_dataDidMoveEv_block_invoke;
  v5[3] = &__block_descriptor_40_e47_v24__0r__Table__Unit_b30b2I_0c___48c_QQII_8_B16l;
  v5[4] = this;
  CSStore2::Store::enumerateTables((CSStore2 **)this, v5);
  *((_QWORD *)this + 33) = CSStore2::Store::getTable((CSStore2 **)this, CFSTR("<array>"));
  *((_QWORD *)this + 34) = CSStore2::Store::getTable((CSStore2 **)this, CFSTR("<string>"));
  result = CSStore2::Store::getTable((CSStore2 **)this, CFSTR("<dictionary>"));
  *((_QWORD *)this + 35) = result;
  return result;
}

void sub_1A4E613F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)_CSStore2DataContainer;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void CSStore2::VM::Deallocate(CSStore2::VM *this, void *a2)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  CSStore2 *v5;
  int v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0C85AD8];
  v3 = (_DWORD)a2 + *MEMORY[0x1E0C85AD8] - 1;
  if (v3 == v3 % *MEMORY[0x1E0C85AD8])
    v4 = v2;
  else
    v4 = v3 / v2 * v2;
  v5 = (CSStore2 *)MEMORY[0x1A85AA808](*MEMORY[0x1E0C83DA0], this, v4);
  if ((_DWORD)v5)
  {
    v6 = (int)v5;
    CSStore2::GetLog(v5);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 134218240;
      v9 = v4;
      v10 = 2048;
      v11 = v6;
      _os_log_error_impl(&dword_1A4E5A000, v7, OS_LOG_TYPE_ERROR, "Failed to deallocate %llu bytes with kernel error %llx.", (uint8_t *)&v8, 0x16u);
    }

  }
}

uint64_t _CSDictionaryCreateWithKeysAndValues(uint64_t a1, char a2, int a3, uint64_t a4, uint64_t a5, unsigned int a6, _QWORD *a7)
{
  unint64_t v7;
  uint64_t v14;
  char **v15;
  int *Table;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint8x8_t v21;
  uint64_t **v22;
  uint64_t *i;
  unint64_t v24;
  _QWORD *v25;
  int v26;
  float v27;
  _BOOL8 v28;
  unint64_t v29;
  unint64_t v30;
  size_t v31;
  uint64_t v32;
  _QWORD *v33;
  unint64_t v34;
  int v35;
  unsigned int v36;
  int v37;
  const void *v38;
  unint64_t v39;
  NSUInteger v40;
  char *v41;
  unint64_t v42;
  int v43;
  BOOL v44;
  unint64_t v45;
  void *v47;
  char *v48;
  char *v49;
  NSUInteger v50;
  uint64_t v51;
  unsigned int v52;
  unsigned int v53;
  int v54;
  NSUInteger v55;
  Unit *Unit;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  _QWORD *v67;
  int *v68;
  void *v70;
  void (*v71)(void *);
  char v72;
  __int128 v73;
  __int128 v74;
  float v75;
  _QWORD v76[2];
  _QWORD v77[2];
  _QWORD v78[2];
  _QWORD v79[4];

  v79[2] = *MEMORY[0x1E0C80C00];
  if ((a3 & 4) == 0 || (a3 & 3) == 0)
  {
    if (a1)
      goto LABEL_4;
LABEL_92:
    v65 = (void *)MEMORY[0x1E0CB35C8];
    v76[0] = *MEMORY[0x1E0CB2938];
    v76[1] = CFSTR("Line");
    v77[0] = CFSTR("paramErr");
    v77[1] = &unk_1E4E24E78;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, v76, 2);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v61);
    v62 = objc_claimAutoreleasedReturnValue();
LABEL_93:
    v59 = (void *)v62;

    v58 = 0;
    if (!a7)
      goto LABEL_96;
    goto LABEL_94;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CSDictionaryID _CSDictionaryCreateWithKeysAndValues(CSMutableStoreRef _Nonnull, CSDictionaryKeyOptions, CSDictionaryValueOptions, const CSDictionaryKey * _Nonnull, const CSDictionaryValue * _Nonnull, _CSStoreUnitCount, CFErrorRef * _Nullable)");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "handleFailureInFunction:file:lineNumber:description:", v64, CFSTR("CSDictionary.mm"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!( inValueOptions &(kCSDictionaryValueOptionsStringPersonality | kCSDictionaryValueOptionsArrayPersonality))"));

  if (!a1)
    goto LABEL_92;
LABEL_4:
  if (performMutatingAssertions)
  {
    v14 = *(_QWORD *)(a1 + 336);
    if (v14)
      (***(void (****)(_QWORD))(v14 + 8))(*(_QWORD *)(v14 + 8));
  }
  v15 = (char **)(a1 + 8);
  Table = *(int **)(a1 + 288);
  if (!Table)
  {
    Table = (int *)CSStore2::Store::getTable((CSStore2 **)(a1 + 8), CFSTR("<dictionary>"));
    if (!Table)
    {
      Table = (int *)CSStore2::Store::allocateTable((CSStore2::Store *)(a1 + 8), CFSTR("<dictionary>"), 0, 0);
      if (!Table)
        goto LABEL_90;
    }
  }
  v67 = a7;
  v68 = Table;
  v73 = 0u;
  v74 = 0u;
  v75 = 1.0;
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__rehash<true>((uint64_t)&v73, (unint64_t)(float)a6);
  if (a6)
  {
    v17 = 0;
    v18 = a6;
    while (1)
    {
      CSStore2::Dictionary::_CopyCanonicalKey((CSStore2::Dictionary *)&v70, v15, *(_DWORD *)(a4 + 4 * v17), a2);
      if (v72)
        break;
LABEL_51:
      if (++v17 == v18)
        goto LABEL_52;
    }
    CSStore2::Dictionary::_TakeOwnershipOfValue((unsigned int *)v15, (CSStore2::Store *)*(unsigned int *)(a5 + 4 * v17), a3);
    v19 = v71;
    v20 = *((_QWORD *)&v73 + 1);
    if (*((_QWORD *)&v73 + 1))
    {
      v21 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v73 + 8));
      v21.i16[0] = vaddlv_u8(v21);
      if (v21.u32[0] > 1uLL)
      {
        v7 = v71;
        if (*((_QWORD *)&v73 + 1) <= (unint64_t)v71)
          v7 = (unint64_t)v71 % *((_QWORD *)&v73 + 1);
      }
      else
      {
        v7 = (DWORD2(v73) - 1) & v71;
      }
      v22 = *(uint64_t ***)(v73 + 8 * v7);
      if (v22)
      {
        for (i = *v22; i; i = (uint64_t *)*i)
        {
          v24 = i[1];
          if (v24 == v71)
          {
            if (*((_DWORD *)i + 4) == (_DWORD)v71)
              goto LABEL_51;
          }
          else
          {
            if (v21.u32[0] > 1uLL)
            {
              if (v24 >= *((_QWORD *)&v73 + 1))
                v24 %= *((_QWORD *)&v73 + 1);
            }
            else
            {
              v24 &= *((_QWORD *)&v73 + 1) - 1;
            }
            if (v24 != v7)
              break;
          }
        }
      }
    }
    v25 = operator new(0x18uLL);
    *v25 = 0;
    v25[1] = v19;
    v26 = *(_DWORD *)(a5 + 4 * v17);
    *((_DWORD *)v25 + 4) = v19;
    *((_DWORD *)v25 + 5) = v26;
    v27 = (float)(unint64_t)(*((_QWORD *)&v74 + 1) + 1);
    if (!v20 || (float)(v75 * (float)v20) < v27)
    {
      v28 = (v20 & (v20 - 1)) != 0;
      if (v20 < 3)
        v28 = 1;
      v29 = v28 | (2 * v20);
      v30 = vcvtps_u32_f32(v27 / v75);
      if (v29 <= v30)
        v31 = v30;
      else
        v31 = v29;
      std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__rehash<true>((uint64_t)&v73, v31);
      v20 = *((_QWORD *)&v73 + 1);
      if ((*((_QWORD *)&v73 + 1) & (*((_QWORD *)&v73 + 1) - 1)) != 0)
      {
        if (*((_QWORD *)&v73 + 1) <= v19)
          v7 = v19 % *((_QWORD *)&v73 + 1);
        else
          v7 = v19;
      }
      else
      {
        v7 = (DWORD2(v73) - 1) & v19;
      }
    }
    v32 = v73;
    v33 = *(_QWORD **)(v73 + 8 * v7);
    if (v33)
    {
      *v25 = *v33;
    }
    else
    {
      *v25 = v74;
      *(_QWORD *)&v74 = v25;
      *(_QWORD *)(v32 + 8 * v7) = &v74;
      if (!*v25)
      {
LABEL_50:
        ++*((_QWORD *)&v74 + 1);
        goto LABEL_51;
      }
      v34 = *(_QWORD *)(*v25 + 8);
      if ((v20 & (v20 - 1)) != 0)
      {
        if (v34 >= v20)
          v34 %= v20;
      }
      else
      {
        v34 &= v20 - 1;
      }
      v33 = (_QWORD *)(v73 + 8 * v34);
    }
    *v33 = v25;
    goto LABEL_50;
  }
LABEL_52:
  v35 = *v68;
  if ((DWORD2(v74) + 1024) >= 0x2000)
    v36 = 0x2000;
  else
    v36 = DWORD2(v74) + 1024;
  if (v36 <= 0x10)
    v36 = 16;
  v37 = 8 * v36 + 8 * (DWORD2(v74) + 1024);
  v38 = (const void *)(v37 | 4u);
  v39 = CSStore2::Store::extend((CSStore2::Store *)v15, v37 | 4u);
  v40 = v39;
  if (!v39)
    goto LABEL_89;
  v41 = *v15;
  if (*v15)
    v42 = *((_QWORD *)v41 + 1);
  else
    v42 = 0;
  v43 = -1;
  v44 = v39 >= v42;
  v45 = v39 - v42;
  if (v44 && !HIDWORD(v45))
  {
    if ((v45 + 1) > *(_DWORD *)(*((_QWORD *)v41 + 1) + 12) || v45 == -1)
      v43 = -1;
    else
      v43 = v45;
  }
  CSStore2::HashMap<unsigned int,unsigned int,CSStore2::Dictionary::_Functions,0ull>::Create((_DWORD **)&v70, (uint64_t)&v73, v43, 0x400u, 0);
  v47 = v70;
  if (!v70)
  {
    CSStore2::Store::assertNotEnumeratingUnits((uint64_t)v15);
    v51 = *((_QWORD *)*v15 + 1);
    v52 = *(_DWORD *)(v51 + 16);
    v44 = v52 >= v38;
    v53 = v52 - (_DWORD)v38;
    if (!v44)
      v53 = 0;
    *(_DWORD *)(v51 + 16) = v53;
    ++*(_DWORD *)(v51 + 8);
    goto LABEL_89;
  }
  CSStore2::VM::Copy(v40, (NSUInteger)v70, v38);
  v70 = 0;
  v71(v47);
  v48 = CSStore2::Store::getTable((CSStore2::Store *)v15, 4 * v35);
  v49 = *v15;
  if (*v15)
    v50 = *((_QWORD *)v49 + 1);
  else
    v50 = 0;
  v54 = -1;
  v44 = v40 >= v50;
  v55 = v40 - v50;
  if (v44 && !HIDWORD(v55))
  {
    if ((v55 + 1) > *(_DWORD *)(*((_QWORD *)v49 + 1) + 12) || v55 == -1)
      v54 = -1;
    else
      v54 = v55;
  }
  Unit = CSStore2::Store::allocateUnit((CSStore2::Store *)v15, (CSStore2::Table *)v48, 8, 0);
  if (!Unit)
  {
LABEL_89:
    std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)&v73);
    a7 = v67;
LABEL_90:
    v60 = (void *)MEMORY[0x1E0CB35C8];
    v78[0] = *MEMORY[0x1E0CB2938];
    v78[1] = CFSTR("Line");
    v79[0] = CFSTR("kCSStoreAllocFailedErr");
    v79[1] = &unk_1E4E24E60;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v79, v78, 2);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -9493, v61);
    v62 = objc_claimAutoreleasedReturnValue();
    goto LABEL_93;
  }
  Unit->var3[0] = a2;
  Unit->var3[1] = a3;
  *(_WORD *)&Unit->var3[2] = 0;
  *(_DWORD *)&Unit->var3[4] = v54;
  v58 = (4 * *(_DWORD *)Unit);
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)&v73);
  v59 = 0;
  a7 = v67;
  if (!v67)
    goto LABEL_96;
LABEL_94:
  if (!(_DWORD)v58)
    *a7 = v59;
LABEL_96:

  return v58;
}

void sub_1A4E61D14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t _CSDictionaryCreate(uint64_t a1, char a2, int a3, _QWORD *a4)
{
  return _CSDictionaryCreateWithKeysAndValues(a1, a2, a3, 0, 0, 0, a4);
}

Unit *_CSDictionaryDispose(Unit *result, CSStore2::Store *a2)
{
  Unit *v3;
  uint64_t v4;

  if (result && (_DWORD)a2)
  {
    v3 = result;
    if (performMutatingAssertions)
    {
      v4 = *(_QWORD *)&result->var3[328];
      if (v4)
        (***(void (****)(_QWORD))(v4 + 8))(*(_QWORD *)(v4 + 8));
    }
    return CSStore2::Dictionary::Dispose((const CSStore2::Table **)v3->var3, a2);
  }
  return result;
}

uint64_t _CSDictionaryGetCount(uint64_t a1, unsigned int a2)
{
  uint64_t v4;
  CSStore2::Dictionary *v6[3];
  char v7;

  if (performConstantAssertions)
  {
    v4 = *(_QWORD *)(a1 + 336);
    if (v4)
      (*(void (**)(_QWORD))(**(_QWORD **)(v4 + 8) + 8))(*(_QWORD *)(v4 + 8));
  }
  CSStore2::Dictionary::Get((CSStore2::Dictionary *)v6, (CSStore2::Store *)(a1 + 8), a2);
  if (v7)
    return CSStore2::Dictionary::getCount(v6[0], *((_DWORD *)v6[1] + 1));
  else
    return 0;
}

uint64_t _CSDictionaryGetKeyOptions(uint64_t a1, unsigned int a2)
{
  uint64_t v4;
  _QWORD v6[3];
  char v7;

  if (performConstantAssertions)
  {
    v4 = *(_QWORD *)(a1 + 336);
    if (v4)
      (*(void (**)(_QWORD))(**(_QWORD **)(v4 + 8) + 8))(*(_QWORD *)(v4 + 8));
  }
  CSStore2::Dictionary::Get((CSStore2::Dictionary *)v6, (CSStore2::Store *)(a1 + 8), a2);
  if (v7)
    return *(unsigned __int8 *)v6[1];
  else
    return 0;
}

uint64_t _CSDictionaryGetValueOptions(uint64_t a1, unsigned int a2)
{
  uint64_t v4;
  _QWORD v6[3];
  char v7;

  if (performConstantAssertions)
  {
    v4 = *(_QWORD *)(a1 + 336);
    if (v4)
      (*(void (**)(_QWORD))(**(_QWORD **)(v4 + 8) + 8))(*(_QWORD *)(v4 + 8));
  }
  CSStore2::Dictionary::Get((CSStore2::Dictionary *)v6, (CSStore2::Store *)(a1 + 8), a2);
  if (v7)
    return *(unsigned __int8 *)(v6[1] + 1);
  else
    return 0;
}

_DWORD *_CSDictionaryGetValue(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t v6;
  uint64_t v7;
  CSStore2 **v8;
  uint64_t v9;
  _DWORD *result;
  CSStore2::Store *v11;
  uint64_t v12;
  char v13;
  char v14;

  if (performConstantAssertions)
  {
    v6 = *(_QWORD *)(a1 + 336);
    if (v6)
      (*(void (**)(_QWORD))(**(_QWORD **)(v6 + 8) + 8))(*(_QWORD *)(v6 + 8));
  }
  CSStore2::Dictionary::Get((CSStore2::Dictionary *)&v11, (CSStore2::Store *)(a1 + 8), a2);
  if (!v13)
    return 0;
  v7 = *(unsigned int *)(v12 + 4);
  if ((_DWORD)v7 == -1)
    return 0;
  v8 = (CSStore2 **)v11;
  v9 = *(_QWORD *)(*(_QWORD *)v11 + 8);
  if (*(_DWORD *)(v9 + 12) <= v7)
    return 0;
  if ((*(_BYTE *)v12 & 1) != 0)
    CSStore2::getOrCopyStringFrom4CC((CSStore2 *)&v11, (char **)v11, a3, 0);
  else
    CSStore2::String::Get(&v11, v11, a3);
  if (!v14)
    return 0;
  result = CSStore2::HashMap<unsigned int,unsigned int,CSStore2::Dictionary::_Functions,0ull>::Find(*v8, (int *)(v9 + v7), v12);
  if (result)
    return (_DWORD *)*result;
  return result;
}

void _CSDictionarySetValue(uint64_t a1, unsigned int a2, unsigned int a3, CSStore2::Store *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CSStore2 **v11;
  uint64_t v12;
  int *v13;
  int v14;
  unsigned int *v15;
  BOOL v16;
  unsigned int *v17;
  BOOL v18;
  _DWORD *v19;
  _DWORD *v20;
  int *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  _DWORD *v30;
  unsigned int v31;
  CSStore2 *v32;
  unint64_t v33;
  unsigned int v34;
  BOOL v35;
  int *v36;
  char *v38;
  uint64_t v39;
  _DWORD *v40;
  CSStore2 *v41;
  unint64_t v42;
  int v43;
  unint64_t v44;
  int *v46;
  char *v47;
  CSStore2::Store *v48;
  uint64_t v49;
  unsigned int v50;
  char v51;
  char v52[32];
  Unit v53;
  int v54;
  char v55;

  if (performMutatingAssertions)
  {
    v8 = *(_QWORD *)(a1 + 336);
    if (v8)
      (***(void (****)(_QWORD))(v8 + 8))(*(_QWORD *)(v8 + 8));
  }
  CSStore2::Dictionary::Get((CSStore2::Dictionary *)&v48, (CSStore2::Store *)(a1 + 8), a2);
  if (v51)
  {
    v9 = v49;
    v10 = *(unsigned int *)(v49 + 4);
    if ((_DWORD)v10 != -1)
    {
      v11 = (CSStore2 **)v48;
      v12 = *(_QWORD *)(*(_QWORD *)v48 + 8);
      if (*(_DWORD *)(v12 + 12) > v10)
      {
        CSStore2::Dictionary::_CopyCanonicalKey((CSStore2::Dictionary *)&v53, (char **)v48, a3, *(_BYTE *)v49);
        if (v55)
        {
          v13 = (int *)(v12 + v10);
          v14 = v54;
          v15 = CSStore2::HashMap<unsigned int,unsigned int,CSStore2::Dictionary::_Functions,0ull>::Find(*v11, v13, v54);
          if (v15)
            v16 = 1;
          else
            v16 = (_DWORD)a4 == 0;
          if (!v16)
          {
            CSStore2::String::retain((unsigned int *)&v53);
            CSStore2::Dictionary::_TakeOwnershipOfValue((unsigned int *)v11, a4, *(unsigned __int8 *)(v9 + 1));
            goto LABEL_21;
          }
          v17 = v15;
          if (v15)
            v18 = (_DWORD)a4 == 0;
          else
            v18 = 0;
          if (v18)
          {
            CSStore2::String::release(&v53);
            CSStore2::Dictionary::_RelinquishOwnershipOfValue((CSStore2::Store *)v11, (CSStore2::Store *)*v17, *(unsigned __int8 *)(v9 + 1));
          }
          else
          {
            if (v15 && *v15 != (_DWORD)a4)
            {
              CSStore2::Dictionary::_TakeOwnershipOfValue((unsigned int *)v11, a4, *(unsigned __int8 *)(v9 + 1));
              CSStore2::Dictionary::_RelinquishOwnershipOfValue((CSStore2::Store *)v11, (CSStore2::Store *)*v17, *(unsigned __int8 *)(v9 + 1));
            }
            if ((_DWORD)a4)
            {
LABEL_21:
              if (!v14)
              {
LABEL_70:
                CSStore2::Store::collectGarbage((CSStore2::Store *)v11, 0);
                CSStore2::Dictionary::Get((CSStore2::Dictionary *)v52, (CSStore2::Store *)v11, v50);
LABEL_71:
                CSStore2::String::release(&v53);
                return;
              }
              v19 = CSStore2::HashMap<unsigned int,unsigned int,CSStore2::Dictionary::_Functions,0ull>::Find(*v11, v13, v14);
              if (v19)
              {
                *v19 = (_DWORD)a4;
                goto LABEL_70;
              }
              v21 = &v13[2 * ((unsigned __int16)v14 % *v13)];
              v22 = (unint64_t)(v21 + 1);
              v23 = v21[2];
              if ((_DWORD)v23 == -1)
              {
                v27 = 0;
              }
              else
              {
                v24 = *((_QWORD *)*v11 + 1);
                v25 = *(_DWORD *)(v24 + 12) > v23;
                v26 = (char *)(v24 + v23);
                if (v25)
                  v27 = v26;
                else
                  v27 = 0;
              }
              v28 = *(unsigned int *)v22;
              if ((_DWORD)v28)
              {
                v29 = 0;
                v30 = v27 + 4;
                while (*(v30 - 1) && *v30)
                {
                  ++v29;
                  v30 += 2;
                  if (v28 == v29)
                    goto LABEL_38;
                }
                v36 = (int *)&v27[8 * v29];
                *v36 = v14;
                v36[1] = (int)a4;
                goto LABEL_70;
              }
LABEL_38:
              v31 = v28 + 8;
              v32 = *v11;
              if (*v11)
              {
                v33 = *((_QWORD *)v32 + 1);
                v34 = -1;
                v35 = v22 >= v33;
                v22 -= v33;
                if (!v35)
                {
LABEL_50:
                  v38 = CSStore2::Store::embraceAndExtend((CSStore2::Store *)v11, v27, (const void *)(8 * v28), 8 * v31);
                  if (v34 == -1 || (v39 = *((_QWORD *)*v11 + 1), *(_DWORD *)(v39 + 12) <= v34))
                    v40 = 0;
                  else
                    v40 = (_DWORD *)(v39 + v34);
                  if (!v38)
                  {
                    v40[1] = -1;
                    abort();
                  }
                  v41 = *v11;
                  if (*v11)
                    v42 = *((_QWORD *)v41 + 1);
                  else
                    v42 = 0;
                  v43 = -1;
                  v35 = (unint64_t)v38 >= v42;
                  v44 = (unint64_t)&v38[-v42];
                  if (v35 && !HIDWORD(v44))
                  {
                    if ((v44 + 1) > *(_DWORD *)(*((_QWORD *)v41 + 1) + 12) || v44 == -1)
                      v43 = -1;
                    else
                      v43 = v44;
                  }
                  v40[1] = v43;
                  v46 = (int *)&v38[8 * v28];
                  *v46 = v14;
                  v46[1] = (int)a4;
                  if ((int)v28 + 1 < v31)
                  {
                    v47 = &v38[8 * (v28 + 1)];
                    *((_QWORD *)v47 + 6) = 0;
                    *((_OWORD *)v47 + 1) = 0u;
                    *((_OWORD *)v47 + 2) = 0u;
                    *(_OWORD *)v47 = 0u;
                  }
                  *v40 += 8;
                  goto LABEL_70;
                }
              }
              else
              {
                v34 = -1;
              }
              if (!HIDWORD(v22))
              {
                if ((v22 + 1) > *(_DWORD *)(*((_QWORD *)v32 + 1) + 12) || v22 == -1)
                  v34 = -1;
                else
                  v34 = v22;
              }
              goto LABEL_50;
            }
          }
          if (v14)
          {
            v20 = CSStore2::HashMap<unsigned int,unsigned int,CSStore2::Dictionary::_Functions,0ull>::Find(*v11, v13, v14);
            if (v20)
              *v20 = 0;
          }
          goto LABEL_71;
        }
      }
    }
  }
}

char *_CSDictionaryRemoveAllValues(uint64_t a1, unsigned int a2)
{
  uint64_t v4;
  char *result;
  CSStore2::Store *v6[3];
  char v7;

  if (performMutatingAssertions)
  {
    v4 = *(_QWORD *)(a1 + 336);
    if (v4)
      (***(void (****)(_QWORD))(v4 + 8))(*(_QWORD *)(v4 + 8));
  }
  result = CSStore2::Dictionary::Get((CSStore2::Dictionary *)v6, (CSStore2::Store *)(a1 + 8), a2);
  if (v7)
    return (char *)CSStore2::Dictionary::removeAllValues(v6);
  return result;
}

void _CSDictionaryEnumerateAllValues(uint64_t a1, unsigned int a2, void *a3)
{
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  __int128 v9;
  uint64_t v10;
  char v11;
  __int128 v12;
  uint64_t v13;
  char v14;

  v6 = a3;
  if (performConstantAssertions)
  {
    v5 = *(_QWORD *)(a1 + 336);
    if (v5)
      (*(void (**)(_QWORD))(**(_QWORD **)(v5 + 8) + 8))(*(_QWORD *)(v5 + 8));
  }
  CSStore2::Dictionary::Get((CSStore2::Dictionary *)&v12, (CSStore2::Store *)(a1 + 8), a2);
  if (v14)
  {
    v9 = v12;
    v10 = v13;
    v11 = 1;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = ___CSDictionaryEnumerateAllValues_block_invoke;
    v7[3] = &unk_1E4E216A8;
    v8 = v6;
    CSStore2::Dictionary::enumerateKeysAndValues((unint64_t)&v9, 0, v7);

  }
  else
  {
    LOBYTE(v9) = 0;
    v11 = 0;
  }

}

void sub_1A4E6250C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_1A4E62EAC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A4E631F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A4E634B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A4E637D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4E63970(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  void *v18;
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

void sub_1A4E63BD0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4E63C94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _CSWriteUnitState::~_CSWriteUnitState((_CSWriteUnitState *)&a9);
  _Unwind_Resume(a1);
}

void sub_1A4E63EF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _CSWriteUnitState *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1A4E64044(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A4E641A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void _CSWriteUnitState::~_CSWriteUnitState(_CSWriteUnitState *this)
{

}

__n128 __copy_helper_block_ea8_32c68_ZTSKZ55___CSVisualizationArchiver_writeAllUnitsInTable_block__E3__1(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(a2 + 32);
  v3 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v3;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t __copy_helper_block_ea8_32c68_ZTSKZ55___CSVisualizationArchiver_writeAllUnitsInTable_block__E3__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 32) = *(_QWORD *)(a2 + 32);
  return result;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>(unint64_t a1)
{
  if (a1 >> 62)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(4 * a1);
}

void std::__throw_bad_array_new_length[abi:nn180100]()
{
  abort();
}

void sub_1A4E64508(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4E64594(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4E6470C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4E647C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1A4E64A24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A4E64C14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t initlockdown_checkin_xpc(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;

  v7 = a3;
  v8 = a4;
  if (lockdownLibrary(void)::sOnce != -1)
    dispatch_once(&lockdownLibrary(void)::sOnce, &__block_literal_global);
  softLinklockdown_checkin_xpc = (uint64_t (*)())dlsym((void *)lockdownLibrary(void)::sLib, "lockdown_checkin_xpc");
  v9 = ((uint64_t (*)(uint64_t, uint64_t, id, id))softLinklockdown_checkin_xpc)(a1, a2, v7, v8);

  return v9;
}

void sub_1A4E64CE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t CSStore2::readFromLockdownConnection(CSStore2 *this, uint64_t a2, char *a3)
{
  return softLinklockdown_recv((uint64_t)this, a2, (int)a3);
}

uint64_t CSStore2::writeToLockdownConnection(CSStore2 *this, uint64_t a2, const char *a3)
{
  return softLinklockdown_send((uint64_t)this, a2, (int)a3);
}

uint64_t initlockdown_disconnect(uint64_t a1)
{
  if (lockdownLibrary(void)::sOnce != -1)
    dispatch_once(&lockdownLibrary(void)::sOnce, &__block_literal_global);
  softLinklockdown_disconnect = (uint64_t (*)())dlsym((void *)lockdownLibrary(void)::sLib, "lockdown_disconnect");
  return ((uint64_t (*)(uint64_t))softLinklockdown_disconnect)(a1);
}

uint64_t initlockdown_send(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (lockdownLibrary(void)::sOnce != -1)
    dispatch_once(&lockdownLibrary(void)::sOnce, &__block_literal_global);
  softLinklockdown_send = (uint64_t (*)())dlsym((void *)lockdownLibrary(void)::sLib, "lockdown_send");
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinklockdown_send)(a1, a2, a3);
}

uint64_t initlockdown_recv(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (lockdownLibrary(void)::sOnce != -1)
    dispatch_once(&lockdownLibrary(void)::sOnce, &__block_literal_global);
  softLinklockdown_recv = (uint64_t (*)())dlsym((void *)lockdownLibrary(void)::sLib, "lockdown_recv");
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinklockdown_recv)(a1, a2, a3);
}

void sub_1A4E65038(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void CSStore2::AttributedStringWriter::~AttributedStringWriter(CSStore2::AttributedStringWriter *this)
{
  CSStore2::AttributedStringWriter::~AttributedStringWriter(this);
  JUMPOUT(0x1A85AA130);
}

{
  id *v2;

  *(_QWORD *)this = &off_1E4E21120;
  v2 = (id *)*((_QWORD *)this + 31);
  if (v2 == (id *)((char *)this + 8))
  {
    CSStore2::AttributedStringWriter::Impl::~Impl(v2);
  }
  else if (v2)
  {
    CSStore2::AttributedStringWriter::Impl::~Impl(v2);
    MEMORY[0x1A85AA130]();
  }
}

void CSStore2::AttributedStringWriter::Impl::~Impl(id *this)
{
  id v2;

  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)(this + 14));
  std::__hash_table<std::__hash_value_type<unsigned long,NSString * {__strong}>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,NSString * {__strong}>>>::~__hash_table((uint64_t)(this + 9));

  v2 = this[4];
  if (v2)
  {
    this[5] = v2;
    operator delete(v2);
  }

}

uint64_t std::__hash_table<std::__hash_value_type<unsigned long,NSString * {__strong}>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,NSString * {__strong}>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<unsigned long,NSString * {__strong}>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,NSString * {__strong}>>>::__deallocate_node(*(id **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<unsigned long,NSString * {__strong}>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,NSString * {__strong}>>>::__deallocate_node(id *a1)
{
  id *v1;
  id *v2;

  if (a1)
  {
    v1 = a1;
    do
    {
      v2 = (id *)*v1;

      operator delete(v1);
      v1 = v2;
    }
    while (v2);
  }
}

CSStore2::AttributedStringWriter::Impl *CSStore2::AttributedStringWriter::Impl::Impl(CSStore2::AttributedStringWriter::Impl *this, __CSStore *a2, NSMutableAttributedString *a3)
{
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = a3;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_QWORD *)this + 12) = 0;
  *((_DWORD *)this + 26) = 1065353216;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *((_DWORD *)this + 36) = 1065353216;
  *((_WORD *)this + 76) = 0;
  *((_QWORD *)this + 20) = 0;
  *((_WORD *)this + 84) = 257;
  *((_BYTE *)this + 170) = 0;
  if (a2)
    objc_storeStrong((id *)this, a2);
  return this;
}

uint64_t CSStore2::AttributedStringWriter::Impl::getStore(CSStore2::AttributedStringWriter::Impl *this)
{
  return *(_QWORD *)this;
}

void CSStore2::AttributedStringWriter::Impl::attributedString(id *this, NSAttributedString *a2)
{
  char v4;
  id v5;
  id v6;
  id v7;

  if (a2)
  {
    objc_msgSend(this[1], "appendAttributedString:", a2);
    if (*((_BYTE *)this + 169))
    {
      -[NSAttributedString string](a2, "string");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "hasSuffix:", CFSTR("\n"));

      if ((v4 & 1) == 0)
      {
        v5 = this[1];
        CSStore2::getAttributedStringWithCharacter((CSStore2 *)0xA);
        v7 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendAttributedString:");

      }
    }
  }
}

void sub_1A4E652F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

id CSStore2::getAttributedStringWithCharacter(CSStore2 *this)
{
  unsigned __int8 v1;
  id v2;
  void *v3;
  char v5;

  v1 = this;
  v5 = (char)this;
  if (CSStore2::getAttributedStringWithCharacter(char)::once != -1)
    dispatch_once(&CSStore2::getAttributedStringWithCharacter(char)::once, &__block_literal_global_16);
  v2 = (id)CSStore2::getAttributedStringWithCharacter(char)::attributedStrings[v1];
  if (!v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", &v5, 1, 1);
    if (v3)
      v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v3);
    else
      v2 = 0;

  }
  return v2;
}

void sub_1A4E653C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___ZN8CSStore2L32getAttributedStringWithCharacterEc_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;

  v0 = 0;
  v1 = MEMORY[0x1E0C80978];
  do
  {
    v6 = v0;
    if (v0 - 9 < 2 || (*(_DWORD *)(v1 + 4 * v0 + 60) & 0x40000) != 0)
    {
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", &v6, 1, 1);
      if (v3)
      {
        v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v3);
        v5 = (void *)CSStore2::getAttributedStringWithCharacter(char)::attributedStrings[v0];
        CSStore2::getAttributedStringWithCharacter(char)::attributedStrings[v0] = v4;

      }
    }
    ++v0;
  }
  while (v0 != 127);
}

void sub_1A4E6548C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t CSStore2::AttributedStringWriter::Impl::createMarker(CSStore2::AttributedStringWriter::Impl *this, NSAttributedString *a2)
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  _BYTE v9[37];
  unsigned __int8 uu[8];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)uu = 0;
  v11 = 0;
  MEMORY[0x1A85AA7E4](uu);
  memset(v9, 0, sizeof(v9));
  uuid_unparse(uu, v9);
  v9[36] = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
  v4 = objc_claimAutoreleasedReturnValue();
  if (!*((_QWORD *)this + 2))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v6 = (void *)*((_QWORD *)this + 2);
    *((_QWORD *)this + 2) = v5;

  }
  v7 = (void *)-[NSAttributedString copy](a2, "copy");
  objc_msgSend(*((id *)this + 2), "setObject:forKeyedSubscript:", v7, v4);

  return v4;
}

void sub_1A4E65584(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

NSAttributedString *CSStore2::AttributedStringWriter::Impl::applyAttributesToAttributedString(CSStore2::AttributedStringWriter::Impl *this, NSAttributedString *a2, char a3)
{
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  _QWORD *v10;
  id v11;
  void *v12;
  NSAttributedString *v13;
  _QWORD v15[4];
  id v16;
  CSStore2::AttributedStringWriter::Impl *v17;
  char v18;

  if (!a2)
    goto LABEL_17;
  if (*((_QWORD *)this + 4) == *((_QWORD *)this + 5))
  {
    v11 = 0;
  }
  else
  {
    v6 = (void *)-[NSAttributedString mutableCopy](a2, "mutableCopy");
    v7 = objc_msgSend(v6, "length");
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", (uint64_t)(*((_QWORD *)this + 5) - *((_QWORD *)this + 4)) >> 4);
    v9 = (_QWORD *)*((_QWORD *)this + 4);
    v10 = (_QWORD *)*((_QWORD *)this + 5);
    while (v9 != v10)
    {
      if (*v9)
      {
        if (v9[1])
          objc_msgSend(v8, "setObject:forKeyedSubscript:");
      }
      v9 += 2;
    }
    objc_msgSend(v6, "addAttributes:range:", v8, 0, v7);

    v11 = v6;
  }
  if (objc_msgSend(*((id *)this + 2), "count") && -[NSAttributedString length](a2, "length") >= 0x24)
  {
    if (!v11)
      v11 = (id)-[NSAttributedString mutableCopy](a2, "mutableCopy");
    v12 = (void *)objc_msgSend(*((id *)this + 2), "copy");
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = ___ZN8CSStore222AttributedStringWriter4Impl33applyAttributesToAttributedStringEP18NSAttributedStringb_block_invoke;
    v15[3] = &unk_1E4E21748;
    v17 = this;
    v11 = v11;
    v16 = v11;
    v18 = a3;
    objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v15);

  }
  v13 = (NSAttributedString *)objc_msgSend(v11, "copy");

  if (!v13)
LABEL_17:
    v13 = a2;
  return v13;
}

void sub_1A4E65734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void ___ZN8CSStore222AttributedStringWriter4Impl33applyAttributesToAttributedStringEP18NSAttributedStringb_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char i;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "length");
  v7 = 0;
  for (i = 0; ; i = 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "rangeOfString:options:range:", a2, 0, v7, objc_msgSend(*(id *)(a1 + 32), "length") - v7);
    v11 = v10;

    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      break;
    objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withAttributedString:", v7, v11, a3);
  }
  if ((i & 1) != 0)
  {
    if (*(_BYTE *)(a1 + 48))
      objc_msgSend(*(id *)(v6 + 16), "setObject:forKeyedSubscript:", 0, a2);
  }
}

void sub_1A4E65864(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id CSStore2::AttributedStringWriter::Impl::getDateFormatter(CSStore2::AttributedStringWriter::Impl *this)
{
  void *v2;
  _QWORD block[5];

  if (*((_QWORD *)this + 3))
  {
    CSStore2::AttributedStringWriter::Impl::getDateFormatter(void)const::$_0::operator()();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setLocale:", *((_QWORD *)this + 3));
    return v2;
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___ZNK8CSStore222AttributedStringWriter4Impl16getDateFormatterEv_block_invoke;
    block[3] = &__block_descriptor_33_e5_v8__0l;
    if (CSStore2::AttributedStringWriter::Impl::getDateFormatter(void)const::once != -1)
      dispatch_once(&CSStore2::AttributedStringWriter::Impl::getDateFormatter(void)const::once, block);
    return (id)CSStore2::AttributedStringWriter::Impl::getDateFormatter(void)const::df;
  }
}

void sub_1A4E65934(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id CSStore2::AttributedStringWriter::Impl::getDateFormatter(void)const::$_0::operator()()
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v0, "setDateStyle:", 1);
  objc_msgSend(v0, "setTimeStyle:", 1);
  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setTimeZone:", v1);

  objc_msgSend(MEMORY[0x1E0C99DC8], "systemLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setLocale:", v2);

  return v0;
}

void sub_1A4E659CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void ___ZNK8CSStore222AttributedStringWriter4Impl16getDateFormatterEv_block_invoke()
{
  uint64_t v0;
  void *v1;

  CSStore2::AttributedStringWriter::Impl::getDateFormatter(void)const::$_0::operator()();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)CSStore2::AttributedStringWriter::Impl::getDateFormatter(void)const::df;
  CSStore2::AttributedStringWriter::Impl::getDateFormatter(void)const::df = v0;

}

id CSStore2::AttributedStringWriter::Impl::getDateComponentsFormatter(id *this)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD block[5];

  if (this[3])
  {
    v2 = objc_alloc_init(MEMORY[0x1E0CB3570]);
    objc_msgSend(v2, "setAllowsFractionalUnits:", 1);
    objc_msgSend(v2, "setUnitsStyle:", 5);
    objc_msgSend(v2, "setCollapsesLargestUnit:", 1);
    v3 = (void *)MEMORY[0x1E0C99D48];
    objc_msgSend(this[3], "calendarIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "calendarWithIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v5, "setLocale:", this[3]);
      objc_msgSend(v2, "setCalendar:", v5);
    }

    return v2;
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___ZNK8CSStore222AttributedStringWriter4Impl26getDateComponentsFormatterEv_block_invoke;
    block[3] = &__block_descriptor_33_e5_v8__0l;
    if (CSStore2::AttributedStringWriter::Impl::getDateComponentsFormatter(void)const::once != -1)
      dispatch_once(&CSStore2::AttributedStringWriter::Impl::getDateComponentsFormatter(void)const::once, block);
    return (id)CSStore2::AttributedStringWriter::Impl::getDateComponentsFormatter(void)const::dcf;
  }
}

void sub_1A4E65B38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void ___ZNK8CSStore222AttributedStringWriter4Impl26getDateComponentsFormatterEv_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3570]);
  objc_msgSend(v0, "setAllowsFractionalUnits:", 1);
  objc_msgSend(v0, "setUnitsStyle:", 5);
  objc_msgSend(v0, "setCollapsesLargestUnit:", 1);
  v1 = (void *)CSStore2::AttributedStringWriter::Impl::getDateComponentsFormatter(void)const::dcf;
  CSStore2::AttributedStringWriter::Impl::getDateComponentsFormatter(void)const::dcf = (uint64_t)v0;

}

void sub_1A4E65BB8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

CSStore2::AttributedStringWriter *CSStore2::AttributedStringWriter::AttributedStringWriter(CSStore2::AttributedStringWriter *this, __CSStore *a2, NSMutableAttributedString *a3)
{
  *(_QWORD *)this = &off_1E4E21120;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(_OWORD *)((char *)this + 184) = 0u;
  *(_OWORD *)((char *)this + 200) = 0u;
  *(_OWORD *)((char *)this + 216) = 0u;
  *(_OWORD *)((char *)this + 232) = 0u;
  *(_OWORD *)((char *)this + 8) = 0u;
  *((_QWORD *)this + 31) = CSStore2::AttributedStringWriter::Impl::Impl((CSStore2::AttributedStringWriter *)((char *)this + 8), a2, a3);
  return this;
}

{
  *(_QWORD *)this = &off_1E4E21120;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(_OWORD *)((char *)this + 184) = 0u;
  *(_OWORD *)((char *)this + 200) = 0u;
  *(_OWORD *)((char *)this + 216) = 0u;
  *(_OWORD *)((char *)this + 232) = 0u;
  *(_OWORD *)((char *)this + 8) = 0u;
  *((_QWORD *)this + 31) = CSStore2::AttributedStringWriter::Impl::Impl((CSStore2::AttributedStringWriter *)((char *)this + 8), a2, a3);
  return this;
}

CSStore2::AttributedStringWriter *CSStore2::AttributedStringWriter::AttributedStringWriter(CSStore2::AttributedStringWriter *this, const CSStore2::AttributedStringWriter *a2)
{
  unint64_t v2;
  char *v5;
  _QWORD *v6;
  unint64_t v7;
  __int128 *v8;
  __int128 *v9;
  _OWORD *v10;
  __int128 v11;
  id v12;
  uint64_t v13;
  uint64_t *v14;
  _QWORD *v15;
  _QWORD *v16;
  unint64_t v17;
  uint8x8_t v18;
  _QWORD *v19;
  _QWORD *i;
  unint64_t v21;
  _QWORD *v22;
  void *v23;
  float v24;
  float v25;
  _BOOL8 v26;
  unint64_t v27;
  unint64_t v28;
  size_t v29;
  uint64_t v30;
  _QWORD *v31;
  unint64_t v32;
  uint64_t *v33;
  _QWORD *v34;
  _QWORD *v35;
  unint64_t v36;
  unint64_t v37;
  uint8x8_t v38;
  _QWORD *v39;
  _QWORD *j;
  unint64_t v41;
  _QWORD *v42;
  float v43;
  float v44;
  _BOOL8 v45;
  unint64_t v46;
  unint64_t v47;
  size_t v48;
  uint64_t v49;
  _QWORD *v50;
  unint64_t v51;
  char v52;
  CSStore2::AttributedStringWriter *v54;
  char *v55;
  unint64_t v56;

  *(_QWORD *)this = &off_1E4E21120;
  *(_OWORD *)((char *)this + 8) = 0u;
  v5 = (char *)this + 8;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(_OWORD *)((char *)this + 184) = 0u;
  *(_OWORD *)((char *)this + 200) = 0u;
  *(_OWORD *)((char *)this + 216) = 0u;
  *(_OWORD *)((char *)this + 232) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  v6 = (_QWORD *)((char *)this + 40);
  v7 = *((_QWORD *)a2 + 31);
  *((_QWORD *)this + 1) = *(id *)v7;
  *((_QWORD *)this + 2) = *(id *)(v7 + 8);
  *((_QWORD *)this + 3) = *(id *)(v7 + 16);
  *((_QWORD *)this + 4) = *(id *)(v7 + 24);
  *v6 = 0;
  *((_QWORD *)this + 6) = 0;
  *((_QWORD *)this + 7) = 0;
  v8 = *(__int128 **)(v7 + 32);
  v9 = *(__int128 **)(v7 + 40);
  if (v9 != v8)
  {
    _ZNSt3__16vectorINS_4pairIP8NSStringP11objc_objectEENS_9allocatorIS8_EEE11__vallocateB8nn180100Em(v6, v9 - v8);
    v10 = (_OWORD *)*((_QWORD *)this + 6);
    do
    {
      v11 = *v8++;
      *v10++ = v11;
    }
    while (v8 != v9);
    *((_QWORD *)this + 6) = v10;
  }
  v12 = *(id *)(v7 + 56);
  v13 = *(_QWORD *)(v7 + 64);
  *((_OWORD *)this + 5) = 0u;
  v14 = (uint64_t *)((char *)this + 80);
  *((_QWORD *)this + 8) = v12;
  *((_QWORD *)this + 9) = v13;
  *((_OWORD *)this + 6) = 0u;
  *((_DWORD *)this + 28) = *(_DWORD *)(v7 + 104);
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__rehash<true>((uint64_t)this + 80, *(_QWORD *)(v7 + 80));
  v55 = v5;
  v56 = v7;
  v15 = *(_QWORD **)(v7 + 88);
  if (v15)
  {
    v16 = (_QWORD *)((char *)this + 96);
    do
    {
      v2 = v15[2];
      v17 = *((_QWORD *)this + 11);
      if (v17)
      {
        v18 = (uint8x8_t)vcnt_s8((int8x8_t)v17);
        v18.i16[0] = vaddlv_u8(v18);
        if (v18.u32[0] > 1uLL)
        {
          v7 = v15[2];
          if (v2 >= v17)
            v7 = v2 % v17;
        }
        else
        {
          v7 = (v17 - 1) & v2;
        }
        v19 = *(_QWORD **)(*v14 + 8 * v7);
        if (v19)
        {
          for (i = (_QWORD *)*v19; i; i = (_QWORD *)*i)
          {
            v21 = i[1];
            if (v21 == v2)
            {
              if (i[2] == v2)
                goto LABEL_45;
            }
            else
            {
              if (v18.u32[0] > 1uLL)
              {
                if (v21 >= v17)
                  v21 %= v17;
              }
              else
              {
                v21 &= v17 - 1;
              }
              if (v21 != v7)
                break;
            }
          }
        }
      }
      v22 = operator new(0x20uLL);
      *v22 = 0;
      v22[1] = v2;
      v23 = (void *)v15[3];
      v22[2] = v15[2];
      v22[3] = v23;
      v24 = (float)(unint64_t)(*((_QWORD *)this + 13) + 1);
      v25 = *((float *)this + 28);
      if (!v17 || (float)(v25 * (float)v17) < v24)
      {
        v26 = (v17 & (v17 - 1)) != 0;
        if (v17 < 3)
          v26 = 1;
        v27 = v26 | (2 * v17);
        v28 = vcvtps_u32_f32(v24 / v25);
        if (v27 <= v28)
          v29 = v28;
        else
          v29 = v27;
        std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__rehash<true>((uint64_t)this + 80, v29);
        v17 = *((_QWORD *)this + 11);
        if ((v17 & (v17 - 1)) != 0)
        {
          if (v2 >= v17)
            v7 = v2 % v17;
          else
            v7 = v2;
        }
        else
        {
          v7 = (v17 - 1) & v2;
        }
      }
      v30 = *v14;
      v31 = *(_QWORD **)(*v14 + 8 * v7);
      if (v31)
      {
        *v22 = *v31;
      }
      else
      {
        *v22 = *v16;
        *v16 = v22;
        *(_QWORD *)(v30 + 8 * v7) = v16;
        if (!*v22)
          goto LABEL_44;
        v32 = *(_QWORD *)(*v22 + 8);
        if ((v17 & (v17 - 1)) != 0)
        {
          if (v32 >= v17)
            v32 %= v17;
        }
        else
        {
          v32 &= v17 - 1;
        }
        v31 = (_QWORD *)(*v14 + 8 * v32);
      }
      *v31 = v22;
LABEL_44:
      ++*((_QWORD *)this + 13);
LABEL_45:
      v15 = (_QWORD *)*v15;
    }
    while (v15);
  }
  v54 = a2;
  *(_OWORD *)((char *)this + 120) = 0u;
  v33 = (uint64_t *)((char *)this + 120);
  *(_OWORD *)((char *)this + 136) = 0u;
  *((_DWORD *)this + 38) = *(_DWORD *)(v56 + 144);
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__rehash<true>((uint64_t)this + 120, *(_QWORD *)(v56 + 120));
  v34 = *(_QWORD **)(v56 + 128);
  if (v34)
  {
    v35 = (_QWORD *)((char *)this + 136);
    v36 = *((_QWORD *)this + 16);
    do
    {
      v37 = v34[2];
      if (v36)
      {
        v38 = (uint8x8_t)vcnt_s8((int8x8_t)v36);
        v38.i16[0] = vaddlv_u8(v38);
        if (v38.u32[0] > 1uLL)
        {
          v2 = v34[2];
          if (v37 >= v36)
            v2 = v37 % v36;
        }
        else
        {
          v2 = (v36 - 1) & v37;
        }
        v39 = *(_QWORD **)(*v33 + 8 * v2);
        if (v39)
        {
          for (j = (_QWORD *)*v39; j; j = (_QWORD *)*j)
          {
            v41 = j[1];
            if (v41 == v37)
            {
              if (j[2] == v37)
                goto LABEL_86;
            }
            else
            {
              if (v38.u32[0] > 1uLL)
              {
                if (v41 >= v36)
                  v41 %= v36;
              }
              else
              {
                v41 &= v36 - 1;
              }
              if (v41 != v2)
                break;
            }
          }
        }
      }
      v42 = operator new(0x20uLL);
      *v42 = 0;
      v42[1] = v37;
      *((_OWORD *)v42 + 1) = *((_OWORD *)v34 + 1);
      v43 = (float)(unint64_t)(*((_QWORD *)this + 18) + 1);
      v44 = *((float *)this + 38);
      if (!v36 || (float)(v44 * (float)v36) < v43)
      {
        v45 = (v36 & (v36 - 1)) != 0;
        if (v36 < 3)
          v45 = 1;
        v46 = v45 | (2 * v36);
        v47 = vcvtps_u32_f32(v43 / v44);
        if (v46 <= v47)
          v48 = v47;
        else
          v48 = v46;
        std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__rehash<true>((uint64_t)this + 120, v48);
        v36 = *((_QWORD *)this + 16);
        if ((v36 & (v36 - 1)) != 0)
        {
          if (v37 >= v36)
            v2 = v37 % v36;
          else
            v2 = v37;
        }
        else
        {
          v2 = (v36 - 1) & v37;
        }
      }
      v49 = *v33;
      v50 = *(_QWORD **)(*v33 + 8 * v2);
      if (v50)
      {
        *v42 = *v50;
      }
      else
      {
        *v42 = *v35;
        *v35 = v42;
        *(_QWORD *)(v49 + 8 * v2) = v35;
        if (!*v42)
          goto LABEL_85;
        v51 = *(_QWORD *)(*v42 + 8);
        if ((v36 & (v36 - 1)) != 0)
        {
          if (v51 >= v36)
            v51 %= v36;
        }
        else
        {
          v51 &= v36 - 1;
        }
        v50 = (_QWORD *)(*v33 + 8 * v51);
      }
      *v50 = v42;
LABEL_85:
      ++*((_QWORD *)this + 18);
LABEL_86:
      v34 = (_QWORD *)*v34;
    }
    while (v34);
  }
  *((_WORD *)this + 80) = *(_WORD *)(v56 + 152);
  *((_QWORD *)this + 21) = *(id *)(v56 + 160);
  v52 = *(_BYTE *)(v56 + 170);
  *((_WORD *)this + 88) = *(_WORD *)(v56 + 168);
  *((_BYTE *)this + 178) = v52;
  *((_QWORD *)this + 31) = v55;
  if (this == v54)
    __assert_rtn("AttributedStringWriter", "CSAttributedStringWriter.mm", 389, "this != &other");
  return this;
}

void sub_1A4E66228(_Unwind_Exception *a1)
{
  id *v1;

  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long,NSString * {__strong}>,void *>>>::operator()[abi:nn180100](char a1, id *a2)
{
  if (a1)
  {

  }
  else if (!a2)
  {
    return;
  }
  operator delete(a2);
}

char *_ZNSt3__16vectorINS_4pairIP8NSStringP11objc_objectEENS_9allocatorIS8_EEE11__vallocateB8nn180100Em(_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 60)
    abort();
  result = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<NSString *,objc_object *>>>(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<NSString *,objc_object *>>>(unint64_t a1)
{
  if (a1 >> 60)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(16 * a1);
}

uint64_t CSStore2::AttributedStringWriter::operator=(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  __int128 v14;
  char *v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  __int128 v19;
  char *v20;
  __int128 v21;
  char *v22;
  __int128 v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t i;
  id *v27;
  BOOL v28;
  id *v29;
  void *v30;
  unint64_t v31;
  _QWORD *inserted;
  BOOL v33;
  _QWORD *v34;
  void *v35;
  unint64_t v36;
  _QWORD *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t j;
  uint64_t *v41;
  unint64_t v42;
  uint64_t *v43;
  _QWORD *v44;
  _QWORD *v45;
  unint64_t v46;
  _QWORD *v47;
  __int16 v48;
  uint64_t *v50;

  if (a1 != a2)
  {
    v3 = *(_QWORD *)(a2 + 248);
    v4 = *(_QWORD *)(a1 + 248);
    objc_storeStrong((id *)v4, *(id *)v3);
    objc_storeStrong((id *)(v4 + 8), *(id *)(v3 + 8));
    objc_storeStrong((id *)(v4 + 16), *(id *)(v3 + 16));
    objc_storeStrong((id *)(v4 + 24), *(id *)(v3 + 24));
    if (v4 == v3)
    {
      objc_storeStrong((id *)(v4 + 56), *(id *)(v3 + 56));
      *(_QWORD *)(v4 + 64) = *(_QWORD *)(v3 + 64);
    }
    else
    {
      v5 = *(char **)(v4 + 32);
      v7 = *(char **)(v3 + 32);
      v6 = *(char **)(v3 + 40);
      v8 = (v6 - v7) >> 4;
      v9 = *(_QWORD *)(v4 + 48);
      if (v8 <= (v9 - (uint64_t)v5) >> 4)
      {
        v12 = *(char **)(v4 + 40);
        v16 = (v12 - v5) >> 4;
        if (v16 >= v8)
        {
          v22 = *(char **)(v4 + 32);
          while (v7 != v6)
          {
            v23 = *(_OWORD *)v7;
            v7 += 16;
            *(_OWORD *)v22 = v23;
            v22 += 16;
          }
          v15 = (char *)(v22 - v5);
          v12 = v5;
        }
        else
        {
          v17 = &v7[16 * v16];
          if (v12 != v5)
          {
            v18 = 16 * v16;
            do
            {
              v19 = *(_OWORD *)v7;
              v7 += 16;
              *(_OWORD *)v5 = v19;
              v5 += 16;
              v18 -= 16;
            }
            while (v18);
          }
          v20 = v12;
          while (v17 != v6)
          {
            v21 = *(_OWORD *)v17;
            v17 += 16;
            *(_OWORD *)v20 = v21;
            v20 += 16;
          }
          v15 = (char *)(v20 - v12);
        }
      }
      else
      {
        if (v5)
        {
          *(_QWORD *)(v4 + 40) = v5;
          operator delete(v5);
          v9 = 0;
          *(_QWORD *)(v4 + 32) = 0;
          *(_QWORD *)(v4 + 40) = 0;
          *(_QWORD *)(v4 + 48) = 0;
        }
        if (v6 - v7 < 0)
          abort();
        v10 = v9 >> 3;
        if (v9 >> 3 <= v8)
          v10 = (v6 - v7) >> 4;
        if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFF0)
          v11 = 0xFFFFFFFFFFFFFFFLL;
        else
          v11 = v10;
        _ZNSt3__16vectorINS_4pairIP8NSStringP11objc_objectEENS_9allocatorIS8_EEE11__vallocateB8nn180100Em((_QWORD *)(v4 + 32), v11);
        v12 = *(char **)(v4 + 40);
        v13 = v12;
        if (v7 != v6)
        {
          v13 = *(char **)(v4 + 40);
          do
          {
            v14 = *(_OWORD *)v7;
            v7 += 16;
            *(_OWORD *)v13 = v14;
            v13 += 16;
          }
          while (v7 != v6);
        }
        v15 = (char *)(v13 - v12);
      }
      *(_QWORD *)(v4 + 40) = &v15[(_QWORD)v12];
      objc_storeStrong((id *)(v4 + 56), *(id *)(v3 + 56));
      *(_QWORD *)(v4 + 64) = *(_QWORD *)(v3 + 64);
      if (v4 != v3)
      {
        *(_DWORD *)(v4 + 104) = *(_DWORD *)(v3 + 104);
        v24 = *(_QWORD **)(v3 + 88);
        v25 = *(_QWORD *)(v4 + 80);
        if (v25)
        {
          for (i = 0; i != v25; ++i)
            *(_QWORD *)(*(_QWORD *)(v4 + 72) + 8 * i) = 0;
          v27 = *(id **)(v4 + 88);
          *(_QWORD *)(v4 + 88) = 0;
          *(_QWORD *)(v4 + 96) = 0;
          if (v27)
            v28 = v24 == 0;
          else
            v28 = 1;
          if (v28)
          {
            v29 = v27;
          }
          else
          {
            do
            {
              v30 = (void *)v24[3];
              v27[2] = (id)v24[2];
              objc_storeStrong(v27 + 3, v30);
              v29 = (id *)*v27;
              v31 = (unint64_t)v27[2];
              v27[1] = (id)v31;
              inserted = std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__node_insert_multi_prepare(v4 + 72, v31, v27 + 2);
              std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__node_insert_multi_perform((_QWORD *)(v4 + 72), v27, inserted);
              v24 = (_QWORD *)*v24;
              if (v29)
                v33 = v24 == 0;
              else
                v33 = 1;
              v27 = v29;
            }
            while (!v33);
          }
          std::__hash_table<std::__hash_value_type<unsigned long,NSString * {__strong}>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,NSString * {__strong}>>>::__deallocate_node(v29);
        }
        for (; v24; v24 = (_QWORD *)*v24)
        {
          v34 = operator new(0x20uLL);
          *v34 = 0;
          v35 = (void *)v24[3];
          v34[2] = v24[2];
          v34[3] = v35;
          v36 = v34[2];
          v34[1] = v36;
          v37 = std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__node_insert_multi_prepare(v4 + 72, v36, v34 + 2);
          std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__node_insert_multi_perform((_QWORD *)(v4 + 72), v34, v37);
        }
        *(_DWORD *)(v4 + 144) = *(_DWORD *)(v3 + 144);
        v38 = *(uint64_t **)(v3 + 128);
        v39 = *(_QWORD *)(v4 + 120);
        if (!v39)
          goto LABEL_55;
        for (j = 0; j != v39; *(_QWORD *)(*(_QWORD *)(v4 + 112) + 8 * j++) = 0)
          ;
        v41 = *(uint64_t **)(v4 + 128);
        *(_QWORD *)(v4 + 128) = 0;
        *(_QWORD *)(v4 + 136) = 0;
        if (v41)
        {
          while (v38)
          {
            v42 = v38[2];
            v41[2] = v42;
            *((_DWORD *)v41 + 6) = *((_DWORD *)v38 + 6);
            v43 = (uint64_t *)*v41;
            v41[1] = v42;
            v44 = std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__node_insert_multi_prepare(v4 + 112, v42, v41 + 2);
            std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__node_insert_multi_perform((_QWORD *)(v4 + 112), v41, v44);
            v38 = (uint64_t *)*v38;
            v41 = v43;
            if (!v43)
              goto LABEL_55;
          }
          do
          {
            v50 = (uint64_t *)*v41;
            operator delete(v41);
            v41 = v50;
          }
          while (v50);
        }
        else
        {
LABEL_55:
          while (v38)
          {
            v45 = operator new(0x20uLL);
            *v45 = 0;
            *((_OWORD *)v45 + 1) = *((_OWORD *)v38 + 1);
            v46 = v45[2];
            v45[1] = v46;
            v47 = std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__node_insert_multi_prepare(v4 + 112, v46, v45 + 2);
            std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__node_insert_multi_perform((_QWORD *)(v4 + 112), v45, v47);
            v38 = (uint64_t *)*v38;
          }
        }
      }
    }
    *(_WORD *)(v4 + 152) = *(_WORD *)(v3 + 152);
    objc_storeStrong((id *)(v4 + 160), *(id *)(v3 + 160));
    v48 = *(_WORD *)(v3 + 168);
    *(_BYTE *)(v4 + 170) = *(_BYTE *)(v3 + 170);
    *(_WORD *)(v4 + 168) = v48;
  }
  return a1;
}

void sub_1A4E66730(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__node_insert_multi_prepare(uint64_t a1, unint64_t a2, _QWORD *a3)
{
  unint64_t v6;
  float v7;
  float v8;
  _BOOL8 v9;
  unint64_t v10;
  unint64_t v11;
  int8x8_t prime;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  unint64_t v17;
  uint8x8_t v18;
  unint64_t v19;
  uint8x8_t v20;
  uint64_t v21;
  _QWORD *i;
  unint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint8x8_t v26;
  unint64_t v27;
  _QWORD *v28;
  int v29;
  _QWORD *result;
  unint64_t v31;
  unint64_t v32;
  _BOOL4 v33;
  int v34;
  void *v35;

  v6 = *(_QWORD *)(a1 + 8);
  v7 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v8 = *(float *)(a1 + 32);
  if (!v6 || (float)(v8 * (float)v6) < v7)
  {
    v9 = 1;
    if (v6 >= 3)
      v9 = (v6 & (v6 - 1)) != 0;
    v10 = v9 | (2 * v6);
    v11 = vcvtps_u32_f32(v7 / v8);
    if (v10 <= v11)
      prime = (int8x8_t)v11;
    else
      prime = (int8x8_t)v10;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      v6 = *(_QWORD *)(a1 + 8);
    }
    if (*(_QWORD *)&prime > v6)
      goto LABEL_74;
    if (*(_QWORD *)&prime >= v6)
      goto LABEL_43;
    v19 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (v6 < 3 || (v20 = (uint8x8_t)vcnt_s8((int8x8_t)v6), v20.i16[0] = vaddlv_u8(v20), v20.u32[0] > 1uLL))
    {
      v19 = std::__next_prime(v19);
    }
    else
    {
      v21 = 1 << -(char)__clz(v19 - 1);
      if (v19 >= 2)
        v19 = v21;
    }
    if (*(_QWORD *)&prime <= v19)
      prime = (int8x8_t)v19;
    if (*(_QWORD *)&prime >= v6)
    {
      v6 = *(_QWORD *)(a1 + 8);
      goto LABEL_43;
    }
    if (prime)
    {
LABEL_74:
      if (*(_QWORD *)&prime >> 61)
        std::__throw_bad_array_new_length[abi:nn180100]();
      v13 = operator new(8 * *(_QWORD *)&prime);
      v14 = *(void **)a1;
      *(_QWORD *)a1 = v13;
      if (v14)
        operator delete(v14);
      v15 = 0;
      *(int8x8_t *)(a1 + 8) = prime;
      do
        *(_QWORD *)(*(_QWORD *)a1 + 8 * v15++) = 0;
      while (*(_QWORD *)&prime != v15);
      v16 = *(_QWORD **)(a1 + 16);
      if (v16)
      {
        v17 = v16[1];
        v18 = (uint8x8_t)vcnt_s8(prime);
        v18.i16[0] = vaddlv_u8(v18);
        if (v18.u32[0] > 1uLL)
        {
          if (v17 >= *(_QWORD *)&prime)
            v17 %= *(_QWORD *)&prime;
        }
        else
        {
          v17 &= *(_QWORD *)&prime - 1;
        }
        *(_QWORD *)(*(_QWORD *)a1 + 8 * v17) = a1 + 16;
        for (i = (_QWORD *)*v16; *v16; i = (_QWORD *)*v16)
        {
          v23 = i[1];
          if (v18.u32[0] > 1uLL)
          {
            if (v23 >= *(_QWORD *)&prime)
              v23 %= *(_QWORD *)&prime;
          }
          else
          {
            v23 &= *(_QWORD *)&prime - 1;
          }
          if (v23 == v17)
          {
            v16 = i;
          }
          else
          {
            v24 = i;
            if (*(_QWORD *)(*(_QWORD *)a1 + 8 * v23))
            {
              do
              {
                v25 = v24;
                v24 = (_QWORD *)*v24;
              }
              while (v24 && i[2] == v24[2]);
              *v16 = v24;
              *v25 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v23);
              **(_QWORD **)(*(_QWORD *)a1 + 8 * v23) = i;
            }
            else
            {
              *(_QWORD *)(*(_QWORD *)a1 + 8 * v23) = v16;
              v16 = i;
              v17 = v23;
            }
          }
        }
      }
      v6 = (unint64_t)prime;
    }
    else
    {
      v35 = *(void **)a1;
      *(_QWORD *)a1 = 0;
      if (v35)
        operator delete(v35);
      v6 = 0;
      *(_QWORD *)(a1 + 8) = 0;
    }
  }
LABEL_43:
  v26 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
  v26.i16[0] = vaddlv_u8(v26);
  if (v26.u32[0] > 1uLL)
  {
    v27 = a2;
    if (v6 <= a2)
      v27 = a2 % v6;
  }
  else
  {
    v27 = (v6 - 1) & a2;
  }
  v28 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v27);
  if (!v28)
    return 0;
  v29 = 0;
  do
  {
    result = v28;
    v28 = (_QWORD *)*v28;
    if (!v28)
      break;
    v31 = v28[1];
    if (v26.u32[0] > 1uLL)
    {
      v32 = v28[1];
      if (v31 >= v6)
        v32 = v31 % v6;
    }
    else
    {
      v32 = v31 & (v6 - 1);
    }
    if (v32 != v27)
      break;
    v33 = v31 == a2 && v28[2] == *a3;
    v34 = v29 & !v33;
    v29 |= v33;
  }
  while (v34 != 1);
  return result;
}

_QWORD *std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__node_insert_multi_perform(_QWORD *result, _QWORD *a2, _QWORD *a3)
{
  int8x8_t v3;
  unint64_t v4;
  uint8x8_t v5;
  unint64_t v6;

  v3 = (int8x8_t)result[1];
  v4 = a2[1];
  v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(_QWORD *)&v3)
      v4 %= *(_QWORD *)&v3;
  }
  else
  {
    v4 &= *(_QWORD *)&v3 - 1;
  }
  if (!a3)
  {
    *a2 = result[2];
    result[2] = a2;
    *(_QWORD *)(*result + 8 * v4) = result + 2;
    if (!*a2)
      goto LABEL_19;
    v6 = *(_QWORD *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(_QWORD *)&v3)
        v6 %= *(_QWORD *)&v3;
    }
    else
    {
      v6 &= *(_QWORD *)&v3 - 1;
    }
LABEL_18:
    *(_QWORD *)(*result + 8 * v6) = a2;
    goto LABEL_19;
  }
  *a2 = *a3;
  *a3 = a2;
  if (*a2)
  {
    v6 = *(_QWORD *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(_QWORD *)&v3)
        v6 %= *(_QWORD *)&v3;
    }
    else
    {
      v6 &= *(_QWORD *)&v3 - 1;
    }
    if (v6 != v4)
      goto LABEL_18;
  }
LABEL_19:
  ++result[3];
  return result;
}

void CSStore2::AttributedStringWriter::attributedString(CSStore2::AttributedStringWriter::Impl **this, NSAttributedString *a2)
{
  NSAttributedString *v3;
  void *v4;
  NSAttributedString *v5;

  v3 = a2;
  v4 = (void *)MEMORY[0x1A85AA4B4]();
  CSStore2::AttributedStringWriter::Impl::applyAttributesToAttributedString(this[31], v3, 1);
  v5 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();

  CSStore2::AttributedStringWriter::Impl::attributedString((id *)this[31], v5);
  objc_autoreleasePoolPop(v4);

}

void sub_1A4E66C00(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void CSStore2::AttributedStringWriter::attributedString(CSStore2::AttributedStringWriter *this, NSAttributedString *a2, NSAttributedString *a3)
{
  NSAttributedString *v5;
  NSAttributedString *v6;
  void *v7;
  NSAttributedString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  CSStore2 *v12;
  void *v13;
  void *v14;
  NSAttributedString *v15;
  NSAttributedString *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  NSAttributedString *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  const __CFString *v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A85AA4B4]();
  if (*(_BYTE *)(*((_QWORD *)this + 31) + 168))
  {
    if (!-[NSAttributedString length](v6, "length"))
    {
      CSStore2::getLog(0);
      v8 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_DEBUG))
      {
        -[NSAttributedString string](v6, "string");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSAttributedString string](v5, "string");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138478083;
        v36 = v9;
        v37 = 2114;
        v38 = v10;
        _os_log_debug_impl(&dword_1A4E5A000, &v8->super, OS_LOG_TYPE_DEBUG, "Eliding value \"%{private}@\" for title \"%{public}@\"", buf, 0x16u);

      }
      goto LABEL_29;
    }
  }
  else if (!-[NSAttributedString length](v6, "length"))
  {
    CSStore2::getAttributedStringWithCharacter((CSStore2 *)0x23);
    v11 = objc_claimAutoreleasedReturnValue();

    v6 = (NSAttributedString *)v11;
  }
  v12 = (CSStore2 *)*((_QWORD *)this + 31);
  if (v5 && *((_BYTE *)v12 + 170))
  {
    CSStore2::getLog(v12);
    v8 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_DEBUG))
    {
      -[NSAttributedString string](v6, "string");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSAttributedString string](v5, "string");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478083;
      v36 = v13;
      v37 = 2114;
      v38 = v14;
      _os_log_debug_impl(&dword_1A4E5A000, &v8->super, OS_LOG_TYPE_DEBUG, "Writing child unit with title -- eliding value \"%{private}@\" for title \"%{public}@\"", buf, 0x16u);

    }
  }
  else
  {
    CSStore2::AttributedStringWriter::Impl::applyAttributesToAttributedString(v12, v5, 0);
    v15 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();

    CSStore2::AttributedStringWriter::Impl::applyAttributesToAttributedString(*((CSStore2::AttributedStringWriter::Impl **)this + 31), v6, 1);
    v16 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();

    if (-[NSAttributedString length](v15, "length"))
    {
      v17 = objc_alloc(MEMORY[0x1E0CB3498]);
      -[NSAttributedString string](v15, "string");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = CFSTR("_CSVOutputType");
      v34 = &unk_1E4E24F38;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (NSAttributedString *)objc_msgSend(v17, "initWithString:attributes:", v18, v19);

    }
    else
    {
      v5 = v15;
    }
    v20 = (void *)-[NSAttributedString mutableCopy](v16, "mutableCopy");
    v21 = v20;
    if (v20)
    {
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = ___ZN8CSStore222AttributedStringWriter16attributedStringEP18NSAttributedStringS2__block_invoke;
      v31[3] = &unk_1E4E21790;
      v22 = v20;
      v32 = v22;
      v23 = (void *)MEMORY[0x1A85AA61C](v31);
      v24 = (void *)MEMORY[0x1A85AA4B4]();
      -[NSAttributedString enumerateAttribute:inRange:options:usingBlock:](v16, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("_CSVOutputType"), 0, -[NSAttributedString length](v16, "length"), 0x100000, v23);
      objc_autoreleasePoolPop(v24);
      v6 = (NSAttributedString *)v22;

    }
    else
    {
      v6 = v16;
    }

    v25 = (NSAttributedString *)objc_alloc_init(MEMORY[0x1E0CB3778]);
    v8 = v25;
    if (v25)
    {
      if (v5)
        -[NSAttributedString appendAttributedString:](v25, "appendAttributedString:", v5);
      if (-[NSAttributedString length](v5, "length"))
      {
        CSStore2::getAttributedStringWithCharacter((CSStore2 *)0x3A);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSAttributedString appendAttributedString:](v8, "appendAttributedString:", v26);

      }
      v27 = objc_alloc_init(MEMORY[0x1E0CB3778]);
      if (v27)
      {
        if (-[NSAttributedString length](v5, "length"))
        {
          CSStore2::getAttributedStringWithCharacter((CSStore2 *)0x20);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "appendAttributedString:", v28);

        }
        v29 = -[NSAttributedString length](v8, "length");
        if ((unint64_t)(objc_msgSend(v27, "length") + v29) <= 0x1B)
        {
          CSStore2::getAttributedStringWithRepeatedCharacter((CSStore2 *)(28
                                                                        - (-[NSAttributedString length](v8, "length")
                                                                         + objc_msgSend(v27, "length"))));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "appendAttributedString:", v30);

        }
        objc_msgSend(v27, "addAttribute:value:range:", CFSTR("_CSVOutputType"), &unk_1E4E24F80, 0, objc_msgSend(v27, "length"));
        -[NSAttributedString appendAttributedString:](v8, "appendAttributedString:", v27);
      }

      -[NSAttributedString appendAttributedString:](v8, "appendAttributedString:", v6);
      CSStore2::AttributedStringWriter::Impl::attributedString(*((id **)this + 31), v8);
    }
  }
LABEL_29:

  objc_autoreleasePoolPop(v7);
}

{
  NSAttributedString *v4;
  NSString *p_isa;

  v4 = a2;
  if (a2)
    a2 = (NSAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", a2);
  p_isa = (NSString *)&a2->super.isa;
  CSStore2::AttributedStringWriter::attributedString(this, a2, a3);
  if (v4)

}

void sub_1A4E670BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

id CSStore2::getLog(CSStore2 *this)
{
  if (CSStore2::getLog(void)::once != -1)
    dispatch_once(&CSStore2::getLog(void)::once, &__block_literal_global_62);
  return (id)CSStore2::getLog(void)::result;
}

uint64_t ___ZN8CSStore222AttributedStringWriter16attributedStringEP18NSAttributedStringS2__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  if (!a2)
    return objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", CFSTR("_CSVOutputType"), &unk_1E4E24F68, a3, a4);
  if ((objc_msgSend(a2, "isEqual:", &unk_1E4E24F38) & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", CFSTR("_CSVOutputType"), &unk_1E4E24F68, a3, a4);
  result = objc_msgSend(a2, "isEqual:", &unk_1E4E24F50);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", CFSTR("_CSVOutputType"), &unk_1E4E24F68, a3, a4);
  return result;
}

id CSStore2::getAttributedStringWithRepeatedCharacter(CSStore2 *this)
{
  std::string *v2;
  id v3;
  std::string *v4;
  void *v5;
  void *v6;
  std::string v8;

  memset(&v8, 0, sizeof(v8));
  std::string::resize(&v8, (std::string::size_type)this + 1, 0);
  if (this)
  {
    if ((v8.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v2 = &v8;
    else
      v2 = (std::string *)v8.__r_.__value_.__r.__words[0];
    memset(v2, 32, (size_t)this);
  }
  v3 = objc_alloc(MEMORY[0x1E0CB3498]);
  if ((v8.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v4 = &v8;
  else
    v4 = (std::string *)v8.__r_.__value_.__r.__words[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithString:", v5);

  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v8.__r_.__value_.__l.__data_);
  return v6;
}

void sub_1A4E6730C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void ___ZN8CSStore2L6getLogEv_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.coreservicesstore", "attrstrwriter");
  v1 = (void *)CSStore2::getLog(void)::result;
  CSStore2::getLog(void)::result = (uint64_t)v0;

}

uint64_t CSStore2::AttributedStringWriter::elidesEmptyValues(CSStore2::AttributedStringWriter *this)
{
  return *(unsigned __int8 *)(*((_QWORD *)this + 31) + 168);
}

void sub_1A4E673EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v10;

  if (v10)

  _Unwind_Resume(exception_object);
}

void CSStore2::AttributedStringWriter::string(CSStore2::AttributedStringWriter *this, NSString *a2, NSString *a3)
{
  NSAttributedString *v6;
  NSAttributedString *v7;

  if (a2)
  {
    v7 = (NSAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", a2);
    if (a3)
    {
LABEL_3:
      v6 = (NSAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", a3);
      goto LABEL_6;
    }
  }
  else
  {
    v7 = 0;
    if (a3)
      goto LABEL_3;
  }
  v6 = 0;
LABEL_6:
  CSStore2::AttributedStringWriter::attributedString(this, v7, v6);
  if (a3)

  if (a2)
}

void sub_1A4E674B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v10;
  uint64_t v11;
  void *v12;

  if (v11)

  if (v10)
  _Unwind_Resume(exception_object);
}

void CSStore2::AttributedStringWriter::string(CSStore2::AttributedStringWriter::Impl **this, NSAttributedString *a2)
{
  NSAttributedString *v2;
  NSString *p_isa;

  v2 = a2;
  if (a2)
    a2 = (NSAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", a2);
  p_isa = (NSString *)&a2->super.isa;
  CSStore2::AttributedStringWriter::attributedString(this, a2);
  if (v2)

}

void sub_1A4E67540(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v10;

  if (v10)

  _Unwind_Resume(exception_object);
}

void CSStore2::AttributedStringWriter::string(CSStore2::AttributedStringWriter *this, NSString *a2, unsigned int a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t UnitFromID;
  char *StringTable;
  id v11;
  _QWORD v12[5];
  id v13;
  CSStore2::AttributedStringWriter *v14;
  _QWORD v15[6];
  unsigned int v16;

  v3 = (uint64_t *)*((_QWORD *)this + 31);
  v4 = *v3;
  if (*v3)
  {
    v8 = _CSStringCopyCFString(*v3, a3);
    v11 = (id)v8;
    if (!a3 || v8)
    {
      UnitFromID = _CSStringGetUnitFromID(v4, a3);
      StringTable = _CSStoreGetStringTable(v4);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = ___ZN8CSStore222AttributedStringWriter6stringEP8NSStringj_block_invoke_2;
      v12[3] = &unk_1E4E217E0;
      v14 = this;
      v12[4] = a2;
      v13 = v11;
      CSStore2::AttributedStringWriter::withReferenceToUnit((uint64_t)this, (uint64_t)StringTable, UnitFromID, (uint64_t)v12);

    }
    else
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = ___ZN8CSStore222AttributedStringWriter6stringEP8NSStringj_block_invoke;
      v15[3] = &unk_1E4E217B8;
      v16 = a3;
      v15[4] = a2;
      v15[5] = this;
      CSStore2::AttributedStringWriter::withWarningColors((uint64_t)this, (uint64_t)v15);
    }

  }
}

void sub_1A4E67684(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{

  _Unwind_Resume(a1);
}

void ___ZN8CSStore222AttributedStringWriter6stringEP8NSStringj_block_invoke(uint64_t a1)
{
  CSStore2::AttributedStringWriter *v2;
  NSString *v3;

  v2 = *(CSStore2::AttributedStringWriter **)(a1 + 40);
  v3 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Could not find string unit %llx!"), *(unsigned int *)(a1 + 48));
  CSStore2::AttributedStringWriter::string(v2, *(NSString **)(a1 + 32), v3);

}

void sub_1A4E6770C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t CSStore2::AttributedStringWriter::withWarningColors(uint64_t a1, uint64_t a2)
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = ___ZN8CSStore222AttributedStringWriter17withWarningColorsEU13block_pointerFvvE_block_invoke;
  v3[3] = &unk_1E4E21EC8;
  v3[4] = a2;
  v3[5] = a1;
  return CSStore2::AttributedStringWriter::withAppliedAttribute(a1, (uint64_t)CFSTR("_LSWarning"), MEMORY[0x1E0C9AAB0], (uint64_t)v3);
}

void ___ZN8CSStore222AttributedStringWriter6stringEP8NSStringj_block_invoke_2(uint64_t a1)
{
  __CFString *v1;

  if (*(_QWORD *)(a1 + 40))
    v1 = *(__CFString **)(a1 + 40);
  else
    v1 = &stru_1E4E226F0;
  CSStore2::AttributedStringWriter::string(*(CSStore2::AttributedStringWriter **)(a1 + 48), *(NSString **)(a1 + 32), &v1->isa);
}

void CSStore2::AttributedStringWriter::withReferenceToUnit(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  void *v9;
  unsigned int v10;
  id v11;

  do
    v8 = __ldaxr((unsigned int *)&CSStore2::currentBackrefDepth);
  while (__stlxr(v8 + 1, (unsigned int *)&CSStore2::currentBackrefDepth));
  v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("_CSbr%u"), v8);
  +[_CSVisualizer URLForUnit:inTable:](_CSVisualizer, "URLForUnit:inTable:", a3, a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CSStore2::AttributedStringWriter::withAppliedAttribute(a1, (uint64_t)v11, (uint64_t)v9, a4);
  do
    v10 = __ldaxr((unsigned int *)&CSStore2::currentBackrefDepth);
  while (__stlxr(v10 - 1, (unsigned int *)&CSStore2::currentBackrefDepth));

}

void sub_1A4E67864(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

uint64_t CSStore2::AttributedStringWriter::withAppliedAttribute(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v8;
  unint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  char *v22;
  uint64_t result;

  v8 = *(_QWORD **)(a1 + 248);
  v10 = (_QWORD *)v8[5];
  v9 = v8[6];
  if ((unint64_t)v10 >= v9)
  {
    v12 = v8[4];
    v13 = ((uint64_t)v10 - v12) >> 4;
    v14 = v13 + 1;
    if ((unint64_t)(v13 + 1) >> 60)
      abort();
    v15 = v9 - v12;
    if (v15 >> 3 > v14)
      v14 = v15 >> 3;
    if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF0)
      v16 = 0xFFFFFFFFFFFFFFFLL;
    else
      v16 = v14;
    v17 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<NSString *,objc_object *>>>(v16);
    v18 = &v17[16 * v13];
    v20 = &v17[16 * v19];
    *(_QWORD *)v18 = a2;
    *((_QWORD *)v18 + 1) = a3;
    v11 = v18 + 16;
    v22 = (char *)v8[4];
    v21 = (char *)v8[5];
    if (v21 != v22)
    {
      do
      {
        *((_OWORD *)v18 - 1) = *((_OWORD *)v21 - 1);
        v18 -= 16;
        v21 -= 16;
      }
      while (v21 != v22);
      v21 = (char *)v8[4];
    }
    v8[4] = v18;
    v8[5] = v11;
    v8[6] = v20;
    if (v21)
      operator delete(v21);
  }
  else
  {
    *v10 = a2;
    v10[1] = a3;
    v11 = v10 + 2;
  }
  v8[5] = v11;
  result = (*(uint64_t (**)(uint64_t))(a4 + 16))(a4);
  *(_QWORD *)(*(_QWORD *)(a1 + 248) + 40) -= 16;
  return result;
}

void ___ZN8CSStore222AttributedStringWriter17withWarningColorsEU13block_pointerFvvE_block_invoke(uint64_t a1)
{
  CSStore2::AttributedStringWriter::withTextAndBackgroundColor(*(_QWORD *)(a1 + 40), 16711680, 16776960, *(_QWORD *)(a1 + 32));
}

void CSStore2::AttributedStringWriter::withTextAndBackgroundColor(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  _QWORD v8[6];
  int v9;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = ___ZN8CSStore222AttributedStringWriter26withTextAndBackgroundColorEjjU13block_pointerFvvE_block_invoke;
  v8[3] = &unk_1E4E218F8;
  v9 = a2;
  v8[4] = a4;
  v8[5] = a1;
  CSStore2::AttributedStringWriter::withAppliedAttribute(a1, (uint64_t)CFSTR("_CSVBGColor"), (uint64_t)v7, (uint64_t)v8);

}

void sub_1A4E67A30(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___ZN8CSStore222AttributedStringWriter26withTextAndBackgroundColorEjjU13block_pointerFvvE_block_invoke(uint64_t a1)
{
  CSStore2::AttributedStringWriter::withTextColor(*(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void CSStore2::AttributedStringWriter::withTextColor(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  CSStore2::AttributedStringWriter::withAppliedAttribute(a1, (uint64_t)CFSTR("_CSVFGColor"), (uint64_t)v5, a3);

}

void sub_1A4E67AAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void CSStore2::AttributedStringWriter::string(CSStore2::AttributedStringWriter *this, unsigned int a2)
{
  CSStore2::AttributedStringWriter::string(this, 0, a2);
}

void CSStore2::AttributedStringWriter::array(CSStore2::AttributedStringWriter *this, NSString *a2, NSArray *a3)
{
  NSAttributedString *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  NSAttributedString *v18;
  NSAttributedString *v19;
  CSStore2::AttributedStringWriter *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  NSString *v28;
  uint64_t v29;

  v21 = this;
  v29 = *MEMORY[0x1E0C80C00];
  if (!a3 || (this = -[NSArray count](a3, "count")) == 0)
  {
    if (*(_BYTE *)(*((_QWORD *)v21 + 31) + 168))
    {
      CSStore2::getLog(this);
      v19 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v19->super, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v28 = a2;
        _os_log_debug_impl(&dword_1A4E5A000, &v19->super, OS_LOG_TYPE_DEBUG, "Eliding empty array value for title \"%{public}@\"", buf, 0xCu);
      }
      v4 = 0;
LABEL_31:

      goto LABEL_32;
    }
    CSStore2::getAttributedStringWithCharacter((CSStore2 *)0x23);
    v4 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
    if (!v4)
      goto LABEL_32;
LABEL_29:
    if (!a2)
    {
      CSStore2::AttributedStringWriter::attributedString((CSStore2::AttributedStringWriter::Impl **)v21, v4);
      goto LABEL_32;
    }
    v19 = (NSAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", a2);
    CSStore2::AttributedStringWriter::attributedString(v21, v19, v4);
    goto LABEL_31;
  }
  v4 = (NSAttributedString *)objc_alloc_init(MEMORY[0x1E0CB3778]);
  if (!v4)
    goto LABEL_22;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = a3;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v6)
    goto LABEL_21;
  v7 = *(_QWORD *)v23;
  v8 = 1;
  do
  {
    v9 = 0;
    do
    {
      if (*(_QWORD *)v23 != v7)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v9);
      if ((v8 & 1) == 0)
      {
        CSStore2::getAttributedStringWithCharacter((CSStore2 *)0x2C);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSAttributedString appendAttributedString:](v4, "appendAttributedString:", v11);

        CSStore2::getAttributedStringWithCharacter((CSStore2 *)0x20);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSAttributedString appendAttributedString:](v4, "appendAttributedString:", v12);

      }
      if (_NSIsNSString())
      {
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v10);
        -[NSAttributedString appendAttributedString:](v4, "appendAttributedString:", v13);
      }
      else if (_NSIsNSNumber())
      {
        v14 = objc_alloc(MEMORY[0x1E0CB3778]);
        objc_msgSend(v10, "description");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v14, "initWithString:", v15);

        objc_msgSend(v13, "addAttribute:value:range:", CFSTR("_CSVNum"), v10, 0, objc_msgSend(v13, "length"));
        -[NSAttributedString appendAttributedString:](v4, "appendAttributedString:", v13);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[NSAttributedString appendAttributedString:](v4, "appendAttributedString:", v10);
          goto LABEL_19;
        }
        v16 = objc_alloc(MEMORY[0x1E0CB3498]);
        objc_msgSend(v10, "description");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v16, "initWithString:", v13);
        -[NSAttributedString appendAttributedString:](v4, "appendAttributedString:", v17);

      }
LABEL_19:
      v8 = 0;
      ++v9;
    }
    while (v6 != v9);
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    v8 = 0;
  }
  while (v6);
LABEL_21:

  v18 = v4;
LABEL_22:

  if (v4)
    goto LABEL_29;
LABEL_32:

}

void sub_1A4E67E2C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void CSStore2::AttributedStringWriter::stringArray(CSStore2::AttributedStringWriter *this, NSString *a2, unsigned int a3)
{
  uint64_t v4;
  unsigned int *v6;
  unsigned int *v7;
  unsigned int v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  __n128 (*v13)(__n128 *, __n128 *);
  void (*v14)(uint64_t);
  const char *v15;
  void *__p;
  void *v17;
  uint64_t v18;

  v4 = **((_QWORD **)this + 31);
  if (v4)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x4812000000;
    v13 = __Block_byref_object_copy_;
    v14 = __Block_byref_object_dispose_;
    v15 = "";
    __p = 0;
    v17 = 0;
    v18 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = ___ZN8CSStore222AttributedStringWriter11stringArrayEP8NSStringj_block_invoke;
    v9[3] = &unk_1E4E21808;
    v9[4] = &v10;
    _CSArrayEnumerateAllValues(v4, a3, v9);
    v6 = (unsigned int *)v11[6];
    v7 = (unsigned int *)v11[7];
    if (v7 == v6)
    {
      v8 = 0;
      CSStore2::AttributedStringWriter::stringArray(this, a2, &v8, 0);
    }
    else
    {
      CSStore2::AttributedStringWriter::stringArray(this, a2, v6, (unint64_t)((char *)v7 - (char *)v6) >> 2);
    }
    _Block_object_dispose(&v10, 8);
    if (__p)
    {
      v17 = __p;
      operator delete(__p);
    }
  }
}

void sub_1A4E67FC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23)
{
  _Block_object_dispose(&a16, 8);
  if (__p)
  {
    a23 = (uint64_t)__p;
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy_(__n128 *a1, __n128 *a2)
{
  __n128 result;

  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(_QWORD *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

void ___ZN8CSStore222AttributedStringWriter11stringArrayEP8NSStringj_block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  _QWORD *v4;
  unint64_t v5;
  char *v6;
  _DWORD *v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  BOOL v12;
  unint64_t v13;
  uint64_t v14;
  _DWORD *v15;
  unint64_t v16;
  int v17;

  v4 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
  v6 = (char *)v4[7];
  v5 = v4[8];
  if ((unint64_t)v6 >= v5)
  {
    v8 = (char *)v4[6];
    v9 = (v6 - v8) >> 2;
    v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 62)
      abort();
    v11 = v5 - (_QWORD)v8;
    if (v11 >> 1 > v10)
      v10 = v11 >> 1;
    v12 = (unint64_t)v11 >= 0x7FFFFFFFFFFFFFFCLL;
    v13 = 0x3FFFFFFFFFFFFFFFLL;
    if (!v12)
      v13 = v10;
    if (v13)
    {
      v13 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>(v13);
      v8 = (char *)v4[6];
      v6 = (char *)v4[7];
    }
    else
    {
      v14 = 0;
    }
    v15 = (_DWORD *)(v13 + 4 * v9);
    v16 = v13 + 4 * v14;
    *v15 = a3;
    v7 = v15 + 1;
    while (v6 != v8)
    {
      v17 = *((_DWORD *)v6 - 1);
      v6 -= 4;
      *--v15 = v17;
    }
    v4[6] = v15;
    v4[7] = v7;
    v4[8] = v16;
    if (v8)
      operator delete(v8);
  }
  else
  {
    *(_DWORD *)v6 = a3;
    v7 = v6 + 4;
  }
  v4[7] = v7;
}

void CSStore2::AttributedStringWriter::stringArray(CSStore2::AttributedStringWriter *this, NSString *a2, unsigned int *a3, unsigned int a4)
{
  uint64_t v6;
  unsigned int *v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  void *v11;
  uint64_t UnitFromID;
  char *StringTable;
  CSStore2 *v14;
  void *v15;
  NSArray *v16;
  NSArray *v17;

  v17 = 0;
  if (a3 && a4)
  {
    v6 = **((_QWORD **)this + 31);
    if (v6)
    {
      v7 = a3;
      v8 = a4;
      v17 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a4);
      do
      {
        v10 = *v7++;
        v9 = v10;
        v11 = (void *)_CSStringCopyCFString(v6, v10);
        if (v11)
        {
          UnitFromID = _CSStringGetUnitFromID(v6, v9);
          if ((_DWORD)UnitFromID)
          {
            StringTable = _CSStoreGetStringTable(v6);
            v14 = (CSStore2 *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v11);
            CSStore2::addBackrefToAttributedString(v14, (NSAttributedString *)StringTable, UnitFromID);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            -[NSArray addObject:](v17, "addObject:", v15);
          }
          else
          {
            -[NSArray addObject:](v17, "addObject:", v11);
          }
        }

        --v8;
      }
      while (v8);
    }
    else
    {
      v17 = 0;
    }
  }
  if (v17)
    v16 = v17;
  else
    v16 = (NSArray *)MEMORY[0x1E0C9AA60];
  CSStore2::AttributedStringWriter::array(this, a2, v16);

}

void sub_1A4E68244(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

CSStore2 *CSStore2::addBackrefToAttributedString(CSStore2 *this, NSAttributedString *a2, uint64_t a3)
{
  CSStore2 *v5;
  void *v6;
  CSStore2 *v7;

  v5 = this;
  +[_CSVisualizer URLForUnit:inTable:](_CSVisualizer, "URLForUnit:inTable:", a3, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (CSStore2 *)-[CSStore2 mutableCopy](v5, "mutableCopy");
    -[CSStore2 addAttribute:value:range:](v7, "addAttribute:value:range:", CFSTR("_CSdwbr"), v6, 0, -[CSStore2 length](v7, "length"));

  }
  else
  {
    v7 = v5;
  }

  return v7;
}

void sub_1A4E68314(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void CSStore2::AttributedStringWriter::array(CSStore2::AttributedStringWriter *this, NSArray *a2)
{
  CSStore2::AttributedStringWriter::array(this, 0, a2);
}

void CSStore2::AttributedStringWriter::stringArray(CSStore2::AttributedStringWriter *this, unsigned int a2)
{
  CSStore2::AttributedStringWriter::stringArray(this, 0, a2);
}

void CSStore2::AttributedStringWriter::stringArray(CSStore2::AttributedStringWriter *this, unsigned int *a2, unsigned int a3)
{
  CSStore2::AttributedStringWriter::stringArray(this, 0, a2, a3);
}

uint64_t CSStore2::AttributedStringWriter::number(CSStore2::AttributedStringWriter *this, NSString *a2, NSNumber *a3)
{
  _QWORD v4[7];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = ___ZN8CSStore222AttributedStringWriter6numberEP8NSStringP8NSNumber_block_invoke;
  v4[3] = &unk_1E4E217E0;
  v4[5] = a2;
  v4[6] = this;
  v4[4] = a3;
  return CSStore2::AttributedStringWriter::withAppliedAttribute((uint64_t)this, (uint64_t)CFSTR("_CSVNum"), (uint64_t)a3, (uint64_t)v4);
}

void ___ZN8CSStore222AttributedStringWriter6numberEP8NSStringP8NSNumber_block_invoke(uint64_t a1)
{
  CSStore2::AttributedStringWriter *v2;
  CFTypeID TypeID;
  CFTypeID v4;
  void *v5;
  NSString *v6;
  __CFString *v7;
  double v8;
  NSString *v9;
  NSString *v10;

  v2 = *(CSStore2::AttributedStringWriter **)(a1 + 48);
  if (*(_QWORD *)(a1 + 32))
  {
    TypeID = CFBooleanGetTypeID();
    v4 = CFGetTypeID(*(CFTypeRef *)(a1 + 32));
    v5 = *(void **)(a1 + 32);
    if (TypeID == v4)
    {
      v6 = *(NSString **)(a1 + 40);
      if (objc_msgSend(v5, "BOOLValue"))
        v7 = CFSTR("true");
      else
        v7 = CFSTR("false");
      CSStore2::AttributedStringWriter::string(v2, v6, &v7->isa);
      return;
    }
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v5, "doubleValue");
  if (v8 != 0.0 || !*(_BYTE *)(*((_QWORD *)v2 + 31) + 168))
  {
    v9 = *(NSString **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "description");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    CSStore2::AttributedStringWriter::string(v2, v9, v10);

  }
}

void sub_1A4E684AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void CSStore2::AttributedStringWriter::formatWithArguments(CSStore2::AttributedStringWriter *this, NSString *a2, NSString *a3, char *a4)
{
  uint64_t v8;
  id v9;
  NSString *v10;
  NSString *v11;

  v8 = *(_QWORD *)(*((_QWORD *)this + 31) + 24);
  v9 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (v8)
    v10 = (NSString *)objc_msgSend(v9, "initWithFormat:locale:arguments:", a3, v8, a4);
  else
    v10 = (NSString *)objc_msgSend(v9, "initWithFormat:arguments:", a3, a4);
  v11 = v10;
  CSStore2::AttributedStringWriter::string(this, a2, v10);

}

void sub_1A4E6854C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void CSStore2::AttributedStringWriter::formatWithArguments(CSStore2::AttributedStringWriter *this, NSString *a2, char *a3)
{
  uint64_t v6;
  id v7;
  NSAttributedString *v8;
  NSAttributedString *v9;

  v6 = *(_QWORD *)(*((_QWORD *)this + 31) + 24);
  v7 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (v6)
    v8 = (NSAttributedString *)objc_msgSend(v7, "initWithFormat:locale:arguments:", a2, v6, a3);
  else
    v8 = (NSAttributedString *)objc_msgSend(v7, "initWithFormat:arguments:", a2, a3);
  v9 = v8;
  CSStore2::AttributedStringWriter::string((CSStore2::AttributedStringWriter::Impl **)this, v8);

}

void sub_1A4E685DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void CSStore2::AttributedStringWriter::format(CSStore2::AttributedStringWriter *this, NSString *a2, NSString *a3, ...)
{
  va_list va;

  va_start(va, a3);
  if (a2)
    CSStore2::AttributedStringWriter::formatWithArguments(this, a2, a3, va);
  else
    CSStore2::AttributedStringWriter::formatWithArguments(this, a3, va);
}

id CSStore2::AttributedStringWriter::Separator(CSStore2::AttributedStringWriter *this, void *a2, NSString *a3)
{
  id v3;
  _QWORD v5[5];
  char v6;

  if ((_DWORD)this != 45 || a2)
  {
    CSStore2::AttributedStringWriter::Separator(char,NSString *)::$_0::operator()(this, a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = ___ZN8CSStore222AttributedStringWriter9SeparatorEcP8NSString_block_invoke;
    v5[3] = &unk_1E4E21830;
    v6 = 45;
    v5[4] = 0;
    if (CSStore2::AttributedStringWriter::Separator(char,NSString *)::once != -1)
      dispatch_once(&CSStore2::AttributedStringWriter::Separator(char,NSString *)::once, v5);
    v3 = (id)CSStore2::AttributedStringWriter::Separator(char,NSString *)::standardSeparator;
  }
  return v3;
}

id CSStore2::AttributedStringWriter::Separator(char,NSString *)::$_0::operator()(unsigned int a1, id a2)
{
  const char *v2;
  size_t v3;
  size_t v4;
  char *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  void *v11;
  char __dst[16];
  int8x16_t v13;
  int8x16_t v14;
  int8x16_t v15;
  int8x16_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15 = vdupq_n_s8(a1);
  v16 = v15;
  v13 = v15;
  v14 = v15;
  *(int8x16_t *)__dst = v15;
  if (a2)
  {
    v2 = (const char *)objc_msgSend(objc_retainAutorelease(a2), "UTF8String");
    v3 = strlen(v2);
    if (v3 >= 0x50)
    {
      strlcpy(__dst, v2, 0x51uLL);
    }
    else
    {
      v4 = v3;
      if (v3 <= 0x46)
      {
        v5 = &__dst[(80 - v3) >> 1];
        *(v5 - 1) = 32;
        __dst[v4 + ((80 - v4) >> 1)] = 32;
        memcpy(v5, v2, v4);
      }
    }
  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", __dst, 80, 1, 0);
  v10 = CFSTR("_CSVOutputType");
  v11 = &unk_1E4E24F98;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v6, v7);

  return v8;
}

void sub_1A4E68818(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___ZN8CSStore222AttributedStringWriter9SeparatorEcP8NSString_block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  CSStore2::AttributedStringWriter::Separator(char,NSString *)::$_0::operator()(*(char *)(a1 + 41), *(id *)(a1 + 32));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)CSStore2::AttributedStringWriter::Separator(char,NSString *)::standardSeparator;
  CSStore2::AttributedStringWriter::Separator(char,NSString *)::standardSeparator = v1;

}

void CSStore2::AttributedStringWriter::separator(CSStore2::AttributedStringWriter::Impl **this, CSStore2::AttributedStringWriter *a2, NSString *a3)
{
  NSAttributedString *v4;

  CSStore2::AttributedStringWriter::Separator(a2, a3, a3);
  v4 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
  CSStore2::AttributedStringWriter::attributedString(this, v4);

}

void sub_1A4E688B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void CSStore2::AttributedStringWriter::timestamp(CSStore2::AttributedStringWriter::Impl **this, NSString *a2, double a3)
{
  void *v6;
  id DateFormatter;
  void *v8;
  void *v9;
  double v10;
  double v11;
  __CFString *v12;
  id DateComponentsFormatter;
  id v14;
  void *v15;
  id v16;
  id v17;
  __CFString *v18;
  _QWORD v19[4];
  id v20;
  NSString *v21;
  id v22;
  __CFString *v23;
  CSStore2::AttributedStringWriter::Impl **v24;
  double v25;
  double v26;

  v6 = (void *)MEMORY[0x1A85AA4B4]();
  DateFormatter = CSStore2::AttributedStringWriter::Impl::getDateFormatter(this[31]);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(DateFormatter, "stringFromDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceNow");
  v11 = v10;
  v12 = &stru_1E4E226F0;
  if (v10 != 0.0)
  {
    DateComponentsFormatter = CSStore2::AttributedStringWriter::Impl::getDateComponentsFormatter((id *)this[31]);
    v14 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(DateComponentsFormatter, "stringFromTimeInterval:", -v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (__CFString *)objc_msgSend(v14, "initWithFormat:", CFSTR(", 𝛥 %@"), v15);

  }
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = ___ZN8CSStore222AttributedStringWriter9timestampEP8NSStringd_block_invoke;
  v19[3] = &unk_1E4E218A8;
  v24 = this;
  v25 = a3;
  v16 = v8;
  v20 = v16;
  v21 = a2;
  v17 = v9;
  v22 = v17;
  v18 = v12;
  v23 = v18;
  v26 = v11;
  CSStore2::AttributedStringWriter::withAppliedAttribute((uint64_t)this, (uint64_t)CFSTR("_CSVTime"), (uint64_t)v16, (uint64_t)v19);

  objc_autoreleasePoolPop(v6);
}

void sub_1A4E68A6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void ___ZN8CSStore222AttributedStringWriter9timestampEP8NSStringd_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  v2 = *(_QWORD *)(a1 + 64);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 72));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = ___ZN8CSStore222AttributedStringWriter9timestampEP8NSStringd_block_invoke_2;
  v7[3] = &unk_1E4E21880;
  v12 = v2;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v8 = v4;
  v9 = v5;
  v10 = v6;
  v11 = *(id *)(a1 + 56);
  v13 = *(_QWORD *)(a1 + 80);
  CSStore2::AttributedStringWriter::withAppliedAttribute(v2, (uint64_t)CFSTR("_CSVNum"), (uint64_t)v3, (uint64_t)v7);

}

void sub_1A4E68BB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;

  _Unwind_Resume(a1);
}

void ___ZN8CSStore222AttributedStringWriter9timestampEP8NSStringd_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;

  v2 = *(_QWORD *)(a1 + 64);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = ___ZN8CSStore222AttributedStringWriter9timestampEP8NSStringd_block_invoke_3;
  v9[3] = &unk_1E4E21858;
  v14 = v2;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v10 = v3;
  v11 = v4;
  v12 = v5;
  v13 = *(id *)(a1 + 56);
  v6 = MEMORY[0x1A85AA61C](v9);
  v7 = (void *)v6;
  if (*(double *)(a1 + 72) == 0.0)
  {
    (*(void (**)(uint64_t))(v6 + 16))(v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CSStore2::AttributedStringWriter::withAppliedAttribute(v2, (uint64_t)CFSTR("_CSVTDlt"), (uint64_t)v8, (uint64_t)v7);

  }
}

void sub_1A4E68CD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16, void *a17)
{
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void ___ZN8CSStore222AttributedStringWriter9timestampEP8NSStringd_block_invoke_3(uint64_t a1)
{
  CSStore2::AttributedStringWriter *v2;
  long double v3;
  double v4;
  long double v5;
  NSString *v6;
  uint64_t v7;

  v2 = *(CSStore2::AttributedStringWriter **)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSince1970");
  v4 = v3;
  v5 = fmod(v3, 1.0);
  v6 = *(NSString **)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  if (v5 == 0.0)
    CSStore2::AttributedStringWriter::format(v2, v6, CFSTR("%@ (POSIX %lld%@)"), v7, (uint64_t)v4, *(_QWORD *)(a1 + 56));
  else
    CSStore2::AttributedStringWriter::format(v2, v6, CFSTR("%@ (POSIX %.3f%@)"), v7, *(_QWORD *)&v4, *(_QWORD *)(a1 + 56));
}

void CSStore2::AttributedStringWriter::beginFlags(CSStore2::AttributedStringWriter *this, NSString *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;

  v5 = *((_QWORD *)this + 31);
  if (*(_BYTE *)(v5 + 152))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void CSStore2::AttributedStringWriter::beginFlags(NSString *const __strong _Nonnull, uintmax_t)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("CSAttributedStringWriter.mm"), 826, CFSTR("Nesting flag lists is not supported. Possible missing call to endFlags()?"));

  }
  v6 = -[NSString copy](a2, "copy");
  v7 = (void *)v6;
  if (v6)
    v8 = (__CFString *)v6;
  else
    v8 = &stru_1E4E226F0;
  objc_storeStrong((id *)(v5 + 56), v8);

  *(_QWORD *)(v5 + 64) = a3;
  *(_WORD *)(v5 + 152) = 1;
}

void sub_1A4E68E6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void CSStore2::AttributedStringWriter::beginBitfieldFlags(CSStore2::AttributedStringWriter *this, NSString *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;

  v3 = *((_QWORD *)this + 31);
  if (*(_BYTE *)(v3 + 152))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void CSStore2::AttributedStringWriter::beginBitfieldFlags(NSString *const __strong _Nonnull)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("CSAttributedStringWriter.mm"), 838, CFSTR("Nesting flag lists is not supported. Possible missing call to endFlags()?"));

  }
  v4 = -[NSString copy](a2, "copy");
  v5 = (void *)v4;
  if (v4)
    v6 = (__CFString *)v4;
  else
    v6 = &stru_1E4E226F0;
  objc_storeStrong((id *)(v3 + 56), v6);

  *(_WORD *)(v3 + 152) = 257;
}

void sub_1A4E68F48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void CSStore2::AttributedStringWriter::flag(uint64_t a1, unint64_t a2, void *a3, int *a4)
{
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  unint64_t v16;

  v7 = *(_QWORD *)(a1 + 248);
  if (!*(_BYTE *)(v7 + 152))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void CSStore2::AttributedStringWriter::flag(uintmax_t, NSString *const __strong _Nonnull, const std::optional<RGBColor> &)");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("CSAttributedStringWriter.mm"), 851, CFSTR("Called flag() without calling beginFlags() first."));

  }
  v8 = *(_QWORD *)(v7 + 64);
  if (*(_BYTE *)(v7 + 153))
  {
    *(_QWORD *)(v7 + 64) = v8 + 1;
    v9 = a2 != 0;
    a2 = v8;
    v8 = -1;
  }
  else
  {
    v9 = a2;
  }
  v16 = a2;
  if ((v9 & v8) != 0)
  {
    v10 = objc_msgSend(a3, "copy");
    v11 = std::__hash_table<std::__hash_value_type<unsigned long,NSString * {__strong}>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,NSString * {__strong}>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>(v7 + 72, a2, &v16);
    v12 = (void *)v11[3];
    v11[3] = v10;

    if (*((_BYTE *)a4 + 4))
    {
      v13 = *a4;
      *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>(v7 + 112, a2, &v16)+ 6) = v13;
    }
    else
    {
      std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__erase_unique<unsigned long>((_QWORD *)(v7 + 112), a2);
    }
  }
}

void sub_1A4E69098(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<unsigned long,NSString * {__strong}>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,NSString * {__strong}>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>(uint64_t a1, unint64_t a2, _QWORD *a3)
{
  unint64_t v3;
  unint64_t v7;
  uint8x8_t v8;
  _QWORD **v9;
  _QWORD *i;
  unint64_t v11;
  float v12;
  float v13;
  _BOOL8 v14;
  unint64_t v15;
  unint64_t v16;
  size_t v17;
  uint64_t v18;
  _QWORD *v19;
  unint64_t v20;

  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v3 = a2;
      if (v7 <= a2)
        v3 = a2 % v7;
    }
    else
    {
      v3 = (v7 - 1) & a2;
    }
    v9 = *(_QWORD ***)(*(_QWORD *)a1 + 8 * v3);
    if (v9)
    {
      for (i = *v9; i; i = (_QWORD *)*i)
      {
        v11 = i[1];
        if (v11 == a2)
        {
          if (i[2] == a2)
            return i;
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7)
              v11 %= v7;
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v3)
            break;
        }
      }
    }
  }
  i = operator new(0x20uLL);
  *i = 0;
  i[1] = a2;
  i[2] = *a3;
  i[3] = 0;
  v12 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    v14 = 1;
    if (v7 >= 3)
      v14 = (v7 & (v7 - 1)) != 0;
    v15 = v14 | (2 * v7);
    v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16)
      v17 = v16;
    else
      v17 = v15;
    std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__rehash<true>(a1, v17);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= a2)
        v3 = a2 % v7;
      else
        v3 = a2;
    }
    else
    {
      v3 = (v7 - 1) & a2;
    }
  }
  v18 = *(_QWORD *)a1;
  v19 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v19)
  {
    *i = *v19;
LABEL_38:
    *v19 = i;
    goto LABEL_39;
  }
  *i = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = i;
  *(_QWORD *)(v18 + 8 * v3) = a1 + 16;
  if (*i)
  {
    v20 = *(_QWORD *)(*i + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7)
        v20 %= v7;
    }
    else
    {
      v20 &= v7 - 1;
    }
    v19 = (_QWORD *)(*(_QWORD *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_1A4E692AC(_Unwind_Exception *a1)
{
  id *v1;

  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long,NSString * {__strong}>,void *>>>::operator()[abi:nn180100](1, v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>(uint64_t a1, unint64_t a2, _QWORD *a3)
{
  unint64_t v3;
  unint64_t v7;
  uint8x8_t v8;
  void **v9;
  _QWORD *v10;
  unint64_t v11;
  float v12;
  float v13;
  _BOOL8 v14;
  unint64_t v15;
  unint64_t v16;
  size_t v17;
  uint64_t v18;
  _QWORD *v19;
  unint64_t v20;

  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v3 = a2;
      if (v7 <= a2)
        v3 = a2 % v7;
    }
    else
    {
      v3 = (v7 - 1) & a2;
    }
    v9 = *(void ***)(*(_QWORD *)a1 + 8 * v3);
    if (v9)
    {
      v10 = *v9;
      if (*v9)
      {
        do
        {
          v11 = v10[1];
          if (v11 == a2)
          {
            if (v10[2] == a2)
              return v10;
          }
          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7)
                v11 %= v7;
            }
            else
            {
              v11 &= v7 - 1;
            }
            if (v11 != v3)
              break;
          }
          v10 = (_QWORD *)*v10;
        }
        while (v10);
      }
    }
  }
  v10 = operator new(0x20uLL);
  *v10 = 0;
  v10[1] = a2;
  v10[2] = *a3;
  *((_DWORD *)v10 + 6) = 0;
  v12 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    v14 = 1;
    if (v7 >= 3)
      v14 = (v7 & (v7 - 1)) != 0;
    v15 = v14 | (2 * v7);
    v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16)
      v17 = v16;
    else
      v17 = v15;
    std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__rehash<true>(a1, v17);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= a2)
        v3 = a2 % v7;
      else
        v3 = a2;
    }
    else
    {
      v3 = (v7 - 1) & a2;
    }
  }
  v18 = *(_QWORD *)a1;
  v19 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v19)
  {
    *v10 = *v19;
LABEL_38:
    *v19 = v10;
    goto LABEL_39;
  }
  *v10 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v10;
  *(_QWORD *)(v18 + 8 * v3) = a1 + 16;
  if (*v10)
  {
    v20 = *(_QWORD *)(*v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7)
        v20 %= v7;
    }
    else
    {
      v20 &= v7 - 1;
    }
    v19 = (_QWORD *)(*(_QWORD *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return v10;
}

void sub_1A4E694C0(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__erase_unique<unsigned long>(_QWORD *a1, unint64_t a2)
{
  _QWORD *v3;
  int8x8_t v4;
  unint64_t v5;
  uint8x8_t v6;
  _QWORD *v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;

  v3 = std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::find<unsigned long>(a1, a2);
  if (v3)
  {
    v4 = (int8x8_t)a1[1];
    v5 = v3[1];
    v6 = (uint8x8_t)vcnt_s8(v4);
    v6.i16[0] = vaddlv_u8(v6);
    if (v6.u32[0] > 1uLL)
    {
      if (v5 >= *(_QWORD *)&v4)
        v5 %= *(_QWORD *)&v4;
    }
    else
    {
      v5 &= *(_QWORD *)&v4 - 1;
    }
    v7 = *(_QWORD **)(*a1 + 8 * v5);
    do
    {
      v8 = v7;
      v7 = (_QWORD *)*v7;
    }
    while (v7 != v3);
    if (v8 == a1 + 2)
      goto LABEL_20;
    v9 = v8[1];
    if (v6.u32[0] > 1uLL)
    {
      if (v9 >= *(_QWORD *)&v4)
        v9 %= *(_QWORD *)&v4;
    }
    else
    {
      v9 &= *(_QWORD *)&v4 - 1;
    }
    if (v9 != v5)
    {
LABEL_20:
      if (!*v3)
        goto LABEL_21;
      v10 = *(_QWORD *)(*v3 + 8);
      if (v6.u32[0] > 1uLL)
      {
        if (v10 >= *(_QWORD *)&v4)
          v10 %= *(_QWORD *)&v4;
      }
      else
      {
        v10 &= *(_QWORD *)&v4 - 1;
      }
      if (v10 != v5)
LABEL_21:
        *(_QWORD *)(*a1 + 8 * v5) = 0;
    }
    v11 = *v3;
    if (*v3)
    {
      v12 = *(_QWORD *)(v11 + 8);
      if (v6.u32[0] > 1uLL)
      {
        if (v12 >= *(_QWORD *)&v4)
          v12 %= *(_QWORD *)&v4;
      }
      else
      {
        v12 &= *(_QWORD *)&v4 - 1;
      }
      if (v12 != v5)
      {
        *(_QWORD *)(*a1 + 8 * v12) = v8;
        v11 = *v3;
      }
    }
    *v8 = v11;
    *v3 = 0;
    --a1[3];
    operator delete(v3);
  }
}

_QWORD *std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::find<unsigned long>(_QWORD *a1, unint64_t a2)
{
  int8x8_t v2;
  uint8x8_t v3;
  unint64_t v4;
  _QWORD *v5;
  _QWORD *result;
  unint64_t v7;

  v2 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v2)
    return 0;
  v3 = (uint8x8_t)vcnt_s8(v2);
  v3.i16[0] = vaddlv_u8(v3);
  if (v3.u32[0] > 1uLL)
  {
    v4 = a2;
    if (*(_QWORD *)&v2 <= a2)
      v4 = a2 % *(_QWORD *)&v2;
  }
  else
  {
    v4 = (*(_QWORD *)&v2 - 1) & a2;
  }
  v5 = *(_QWORD **)(*a1 + 8 * v4);
  if (!v5)
    return 0;
  result = (_QWORD *)*v5;
  if (*v5)
  {
    do
    {
      v7 = result[1];
      if (v7 == a2)
      {
        if (result[2] == a2)
          return result;
      }
      else
      {
        if (v3.u32[0] > 1uLL)
        {
          if (v7 >= *(_QWORD *)&v2)
            v7 %= *(_QWORD *)&v2;
        }
        else
        {
          v7 &= *(_QWORD *)&v2 - 1;
        }
        if (v7 != v4)
          return 0;
      }
      result = (_QWORD *)*result;
    }
    while (result);
  }
  return result;
}

void CSStore2::AttributedStringWriter::missingFlag(uint64_t a1, unint64_t a2, void *a3, int *a4)
{
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  unint64_t v16;

  v7 = *(_QWORD *)(a1 + 248);
  if (!*(_BYTE *)(v7 + 152))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void CSStore2::AttributedStringWriter::missingFlag(uintmax_t, NSString *const __strong _Nonnull, const std::optional<RGBColor> &)");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("CSAttributedStringWriter.mm"), 892, CFSTR("Called missingFlag() without calling beginFlags() first."));

  }
  v8 = *(_QWORD *)(v7 + 64);
  if (*(_BYTE *)(v7 + 153))
  {
    *(_QWORD *)(v7 + 64) = v8 + 1;
    v9 = a2 != 0;
    a2 = v8;
    v8 = -1;
  }
  else
  {
    v9 = a2;
  }
  v16 = a2;
  if ((v9 & v8) == 0)
  {
    v10 = objc_msgSend(a3, "copy");
    v11 = std::__hash_table<std::__hash_value_type<unsigned long,NSString * {__strong}>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,NSString * {__strong}>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>(v7 + 72, a2, &v16);
    v12 = (void *)v11[3];
    v11[3] = v10;

    if (*((_BYTE *)a4 + 4))
    {
      v13 = *a4;
      *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>(v7 + 112, a2, &v16)+ 6) = v13;
    }
    else
    {
      std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__erase_unique<unsigned long>((_QWORD *)(v7 + 112), a2);
    }
  }
}

void sub_1A4E6980C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void CSStore2::AttributedStringWriter::endFlags(CSStore2::AttributedStringWriter *this)
{
  uint64_t v1;
  CSStore2 *v2;
  unint64_t v3;
  id v4;
  char *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  _QWORD *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  unint64_t *v18;
  int8x8_t v19;
  unint64_t v20;
  uint8x8_t v21;
  unint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  unint64_t v25;
  void *v26;
  _QWORD *v27;
  void *v28;
  NSAttributedString *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  _QWORD *v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t k;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  CSStore2 *context;
  NSAttributedString *v57;
  _QWORD v58[4];
  NSAttributedString *v59;
  NSAttributedString *v60;
  CSStore2::AttributedStringWriter *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t buf[24];
  __int128 v67;
  uint64_t v68;
  int v69;
  _QWORD v70[4];
  int v71;
  __int16 v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v1 = *((_QWORD *)this + 31);
  if (!*(_BYTE *)(v1 + 152))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void CSStore2::AttributedStringWriter::endFlags()");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "handleFailureInFunction:file:lineNumber:description:", v54, CFSTR("CSAttributedStringWriter.mm"), 923, CFSTR("Called endFlags() without calling beginFlags() first."));

  }
  v2 = (CSStore2 *)MEMORY[0x1A85AA4B4]();
  context = v2;
  if (*(_QWORD *)(v1 + 56))
  {
    v2 = (CSStore2 *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", *(_QWORD *)(v1 + 56));
    v57 = (NSAttributedString *)v2;
  }
  else
  {
    v57 = 0;
  }
  v3 = *(_QWORD *)(v1 + 96);
  if (!v3 && *(_BYTE *)(*((_QWORD *)this + 31) + 168))
    goto LABEL_73;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v3)
  {
    if (v3 >> 61)
      abort();
    v5 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v3);
    v7 = &v5[8 * v6];
    v8 = v5;
  }
  else
  {
    v8 = 0;
    v7 = 0;
  }
  v9 = *(_QWORD **)(v1 + 88);
  if (v9)
  {
    v10 = v8;
    do
    {
      if (v10 >= v7)
      {
        v12 = (v10 - v8) >> 3;
        v13 = v12 + 1;
        if ((unint64_t)(v12 + 1) >> 61)
          abort();
        if ((v7 - v8) >> 2 > v13)
          v13 = (v7 - v8) >> 2;
        if ((unint64_t)(v7 - v8) >= 0x7FFFFFFFFFFFFFF8)
          v14 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v14 = v13;
        if (v14)
          v14 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v14);
        else
          v15 = 0;
        v16 = (char *)(v14 + 8 * v12);
        *(_QWORD *)v16 = v9[2];
        v11 = v16 + 8;
        while (v10 != v8)
        {
          v17 = *((_QWORD *)v10 - 1);
          v10 -= 8;
          *((_QWORD *)v16 - 1) = v17;
          v16 -= 8;
        }
        v7 = (char *)(v14 + 8 * v15);
        if (v8)
          operator delete(v8);
        v8 = v16;
      }
      else
      {
        *(_QWORD *)v10 = v9[2];
        v11 = v10 + 8;
      }
      v9 = (_QWORD *)*v9;
      v10 = v11;
    }
    while (v9);
  }
  else
  {
    v11 = v8;
  }
  v2 = (CSStore2 *)std::__sort<std::__less<unsigned long,unsigned long> &,unsigned long *>();
  if (v8 != v11)
  {
    v18 = (unint64_t *)v8;
    do
    {
      v19 = *(int8x8_t *)(v1 + 80);
      if (v19)
      {
        v20 = *v18;
        v21 = (uint8x8_t)vcnt_s8(v19);
        v21.i16[0] = vaddlv_u8(v21);
        if (v21.u32[0] > 1uLL)
        {
          v22 = *v18;
          if (v20 >= *(_QWORD *)&v19)
            v22 = v20 % *(_QWORD *)&v19;
        }
        else
        {
          v22 = (*(_QWORD *)&v19 - 1) & v20;
        }
        v23 = *(_QWORD **)(*(_QWORD *)(v1 + 72) + 8 * v22);
        if (v23)
        {
          v24 = (_QWORD *)*v23;
          if (*v23)
          {
            do
            {
              v25 = v24[1];
              if (v25 == v20)
              {
                if (v24[2] == v20)
                {
                  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v24[3]);
                  v27 = std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::find<unsigned long>((_QWORD *)(v1 + 112), *v18);
                  if (v27)
                  {
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)v27 + 6));
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "addAttribute:value:range:", CFSTR("_CSVFGColor"), v28, 0, objc_msgSend(v26, "length"));

                  }
                  objc_msgSend(v4, "addObject:", v26);

                  break;
                }
              }
              else
              {
                if (v21.u32[0] > 1uLL)
                {
                  if (v25 >= *(_QWORD *)&v19)
                    v25 %= *(_QWORD *)&v19;
                }
                else
                {
                  v25 &= *(_QWORD *)&v19 - 1;
                }
                if (v25 != v22)
                  break;
              }
              v24 = (_QWORD *)*v24;
            }
            while (v24);
          }
        }
      }
      ++v18;
    }
    while (v18 != (unint64_t *)v11);
  }
  if (v8)
    operator delete(v8);
  if (v4)
  {
    v2 = (CSStore2 *)objc_msgSend(v4, "count");
    if (v2)
    {
      v29 = (NSAttributedString *)objc_alloc_init(MEMORY[0x1E0CB3778]);
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v30 = v4;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
      if (v31)
      {
        v32 = *(_QWORD *)v63;
        do
        {
          for (i = 0; i != v31; ++i)
          {
            if (*(_QWORD *)v63 != v32)
              objc_enumerationMutation(v30);
            v34 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i);
            if (-[NSAttributedString length](v29, "length"))
            {
              CSStore2::getAttributedStringWithCharacter((CSStore2 *)0x20);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSAttributedString appendAttributedString:](v29, "appendAttributedString:", v35);

              CSStore2::getAttributedStringWithCharacter((CSStore2 *)0x20);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSAttributedString appendAttributedString:](v29, "appendAttributedString:", v36);

            }
            -[NSAttributedString appendAttributedString:](v29, "appendAttributedString:", v34);
          }
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
        }
        while (v31);
      }

      if (*(_BYTE *)(v1 + 153))
        goto LABEL_80;
      v37 = objc_alloc(MEMORY[0x1E0CB3498]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" (%016llx)"), *(_QWORD *)(v1 + 64));
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = (void *)objc_msgSend(v37, "initWithString:", v38);
      -[NSAttributedString appendAttributedString:](v29, "appendAttributedString:", v39);

LABEL_79:
LABEL_80:
      v40 = v30;
      goto LABEL_82;
    }
    v40 = v4;
  }
  else
  {
LABEL_73:
    v40 = 0;
  }
  if (*(_BYTE *)(*((_QWORD *)this + 31) + 168))
  {
    CSStore2::getLog(v2);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      v52 = *(_QWORD *)(v1 + 64);
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v52;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v57;
      _os_log_debug_impl(&dword_1A4E5A000, v38, OS_LOG_TYPE_DEBUG, "Eliding empty flags value (%016llx) for title \"%{public}@\"", buf, 0x16u);
    }
    v29 = 0;
    v30 = v40;
    goto LABEL_79;
  }
  CSStore2::getAttributedStringWithCharacter((CSStore2 *)0x23);
  v29 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
LABEL_82:

  objc_autoreleasePoolPop(context);
  if (v29)
  {
    if (*(_BYTE *)(v1 + 153))
    {
      CSStore2::AttributedStringWriter::attributedString(this, v57, v29);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)(v1 + 64));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = ___ZN8CSStore222AttributedStringWriter8endFlagsEv_block_invoke;
      v58[3] = &unk_1E4E217E0;
      v61 = this;
      v59 = v57;
      v60 = v29;
      CSStore2::AttributedStringWriter::withAppliedAttribute((uint64_t)this, (uint64_t)CFSTR("_CSVNum"), (uint64_t)v41, (uint64_t)v58);

    }
  }
  v67 = 0u;
  memset(v70, 0, sizeof(v70));
  v69 = 1065353216;
  v71 = 1065353216;
  v72 = 0;
  v68 = 0;
  memset(buf, 0, sizeof(buf));
  v42 = *(void **)(v1 + 56);
  *(_QWORD *)(v1 + 56) = 0;

  *(_QWORD *)(v1 + 64) = 0;
  if (*(_QWORD *)(v1 + 96))
  {
    std::__hash_table<std::__hash_value_type<unsigned long,NSString * {__strong}>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,NSString * {__strong}>>>::__deallocate_node(*(id **)(v1 + 88));
    *(_QWORD *)(v1 + 88) = 0;
    v43 = *(_QWORD *)(v1 + 80);
    if (v43)
    {
      for (j = 0; j != v43; ++j)
        *(_QWORD *)(*(_QWORD *)(v1 + 72) + 8 * j) = 0;
    }
    *(_QWORD *)(v1 + 96) = 0;
  }
  *(_QWORD *)&buf[16] = 0;
  v45 = *(void **)(v1 + 72);
  *(_QWORD *)(v1 + 72) = 0;
  if (v45)
    operator delete(v45);
  *(_QWORD *)(v1 + 80) = 0;
  *(_QWORD *)(v1 + 88) = 0;
  *(_QWORD *)&v67 = 0;
  *(_QWORD *)(v1 + 96) = 0;
  *(_DWORD *)(v1 + 104) = 1065353216;
  if (*(_QWORD *)(v1 + 136))
  {
    v46 = *(_QWORD **)(v1 + 128);
    if (v46)
    {
      do
      {
        v47 = (_QWORD *)*v46;
        operator delete(v46);
        v46 = v47;
      }
      while (v47);
    }
    *(_QWORD *)(v1 + 128) = 0;
    v48 = *(_QWORD *)(v1 + 120);
    if (v48)
    {
      for (k = 0; k != v48; ++k)
        *(_QWORD *)(*(_QWORD *)(v1 + 112) + 8 * k) = 0;
    }
    *(_QWORD *)(v1 + 136) = 0;
  }
  v70[0] = 0;
  v50 = *(void **)(v1 + 112);
  *(_QWORD *)(v1 + 112) = 0;
  if (v50)
    operator delete(v50);
  *(_QWORD *)(v1 + 120) = 0;
  *(_QWORD *)(v1 + 128) = 0;
  v70[1] = 0;
  *(_QWORD *)(v1 + 136) = 0;
  *(_DWORD *)(v1 + 144) = 1065353216;
  *(_WORD *)(v1 + 152) = v72;
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)v70);
  std::__hash_table<std::__hash_value_type<unsigned long,NSString * {__strong}>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,NSString * {__strong}>>>::__deallocate_node(*((id **)&v67 + 1));
  v51 = *(void **)&buf[16];
  *(_QWORD *)&buf[16] = 0;
  if (v51)
    operator delete(v51);

}

void sub_1A4E69FD4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(unint64_t a1)
{
  if (a1 >> 61)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(8 * a1);
}

void ___ZN8CSStore222AttributedStringWriter8endFlagsEv_block_invoke(uint64_t a1)
{
  CSStore2::AttributedStringWriter::attributedString(*(CSStore2::AttributedStringWriter **)(a1 + 48), *(NSAttributedString **)(a1 + 32), *(NSAttributedString **)(a1 + 40));
}

id CSStore2::AttributedStringWriter::link(CSStore2::AttributedStringWriter *this, uint64_t a2, uint64_t a3, NSString *a4)
{
  NSAttributedString *v8;
  void *v9;

  if (a4)
    v8 = (NSAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", a4);
  else
    v8 = 0;
  CSStore2::AttributedStringWriter::link(this, a2, a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)

  return v9;
}

void sub_1A4E6A194(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v2;

  if (v1)

  _Unwind_Resume(exception_object);
}

id CSStore2::AttributedStringWriter::link(CSStore2::AttributedStringWriter *this, uint64_t a2, uint64_t a3, NSAttributedString *a4)
{
  NSAttributedString *v7;
  NSAttributedString *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSURL *v16;
  uint64_t v17;
  NSObject *v18;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = v7;
  if (!(_DWORD)a3 && *(_BYTE *)(*((_QWORD *)this + 31) + 168))
  {
    v14 = 0;
    if (!v7)
      goto LABEL_19;
    goto LABEL_13;
  }
  if (!v7)
  {
    v9 = *(id *)(*((_QWORD *)this + 31) + 160);
    if (v9)
    {
      v10 = v9;
      objc_msgSend(v9, "summaryOfUnit:inTable:", a3, a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
LABEL_6:
      objc_msgSend(v11, "stringByAppendingFormat:", CFSTR(" (0x%llx)"), a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = 0;
    }
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v13);

    v8 = (NSAttributedString *)v15;
  }
  -[NSAttributedString string](v8, "string");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
LABEL_13:
    +[_CSVisualizer URLForUnit:inTable:](_CSVisualizer, "URLForUnit:inTable:", a3, a2);
    v16 = (NSURL *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      CSStore2::AttributedStringWriter::link((CSStore2::AttributedStringWriter::Impl **)this, v16, v8);
      v17 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v17;
    }
    else
    {
      CSStore2::getLog(0);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        v21 = a2;
        v22 = 2048;
        v23 = a3;
        _os_log_error_impl(&dword_1A4E5A000, v18, OS_LOG_TYPE_ERROR, "Failed to construct URL for table/unit %llx %llx", buf, 0x16u);
      }

    }
  }
LABEL_19:

  return v14;
}

void sub_1A4E6A3B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id CSStore2::AttributedStringWriter::link(CSStore2::AttributedStringWriter::Impl **this, NSURL *a2, NSAttributedString *a3)
{
  NSAttributedString *v5;
  id v6;
  void *v7;
  void *v8;
  NSAttributedString *v9;
  void *Marker;
  void *v11;
  id v12;

  v5 = a3;
  if (!v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3498]);
    -[NSURL absoluteString](a2, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (NSAttributedString *)objc_msgSend(v6, "initWithString:", v7);

  }
  -[NSAttributedString string](v5, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
  {
    v9 = (NSAttributedString *)-[NSAttributedString mutableCopy](v5, "mutableCopy");
    -[NSAttributedString addAttribute:value:range:](v9, "addAttribute:value:range:", CFSTR("_CSVLink"), a2, 0, -[NSAttributedString length](v9, "length"));
    Marker = (void *)CSStore2::AttributedStringWriter::Impl::createMarker(this[31], v9);
    v11 = Marker;
    if (Marker)
    {
      v12 = Marker;

      v8 = v12;
    }

  }
  return v8;
}

void sub_1A4E6A4E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id CSStore2::AttributedStringWriter::link(CSStore2::AttributedStringWriter::Impl **this, NSURL *a2, NSString *a3)
{
  NSAttributedString *v6;
  void *v7;

  if (a3)
    v6 = (NSAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", a3);
  else
    v6 = 0;
  CSStore2::AttributedStringWriter::link(this, a2, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)

  return v7;
}

void sub_1A4E6A58C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v2;

  if (v1)

  _Unwind_Resume(exception_object);
}

void CSStore2::AttributedStringWriter::childUnit(CSStore2::AttributedStringWriter *this, NSString *a2, NSAttributedString *a3, uint64_t a4)
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSString *v19;
  __CFString *v20;
  const char *CStringPtr;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  UniChar v30;
  int64_t v31;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  int64_t v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  NSAttributedString *v41;
  NSAttributedString *v42;
  _QWORD v43[4];
  id v44;
  id v45;
  UniChar buffer[64];
  CFStringRef theString;
  const UniChar *CharactersPtr;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  int64_t v52;
  int64_t v53;
  CFRange v54;

  v8 = (void *)MEMORY[0x1A85AA4B4]();
  v9 = *(id *)(*((_QWORD *)this + 31) + 160);
  if (v9)
  {
    v10 = v9;
    v11 = (void *)objc_msgSend(v9, "copy");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2 != 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, CFSTR("_CSAttributedStringWriterIsChildUnitWithTitle"));

    objc_msgSend(v11, "descriptionOfUnit:inTable:", a4, a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");

    if (!(_DWORD)a4)
      goto LABEL_7;
  }
  else
  {
    v15 = 0;
    if (!(_DWORD)a4)
      goto LABEL_7;
  }
  if (!v15)
  {
    CSStore2::getAttributedStringWithCharacter((CSStore2 *)0x23);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v16, "mutableCopy");

  }
LABEL_7:
  while (1)
  {
    objc_msgSend(v15, "string");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "hasSuffix:", CFSTR("\n"));

    if (!v18)
      break;
    objc_msgSend(v15, "deleteCharactersInRange:", objc_msgSend(v15, "length") - 1, 1);
  }
  if (a2)
  {
    if (v15)
    {
      objc_msgSend(v15, "string");
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      theString = v20;
      v50 = 0;
      v51 = objc_msgSend(v15, "length");
      CharactersPtr = CFStringGetCharactersPtr(v20);
      if (CharactersPtr)
        CStringPtr = 0;
      else
        CStringPtr = CFStringGetCStringPtr(v20, 0x600u);
      v52 = 0;
      v53 = 0;
      v49 = CStringPtr;

      v25 = v51;
      if (v51 < 1)
      {
        v22 = 0;
        a3 = (NSAttributedString *)a3;
      }
      else
      {
        v26 = 0;
        v22 = 0;
        v27 = 0;
        v28 = 64;
        do
        {
          if ((unint64_t)v27 >= 4)
            v29 = 4;
          else
            v29 = v27;
          if (CharactersPtr)
          {
            v30 = CharactersPtr[v27 + v50];
          }
          else if (v49)
          {
            v30 = v49[v50 + v27];
          }
          else
          {
            v31 = v52;
            if (v53 <= v27 || v52 > v27)
            {
              v33 = v29 + v26;
              v34 = v28 - v29;
              v35 = v27 - v29;
              v36 = v35 + 64;
              if (v35 + 64 >= v25)
                v36 = v25;
              v52 = v35;
              v53 = v36;
              if (v25 >= v34)
                v25 = v34;
              v54.length = v25 + v33;
              v54.location = v35 + v50;
              CFStringGetCharacters(theString, v54, buffer);
              v31 = v52;
            }
            v30 = buffer[v27 - v31];
          }
          if (v30 == 10)
          {
            if (!v22)
            {
              objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v22, "addIndex:", v27);
          }
          ++v27;
          v25 = v51;
          --v26;
          ++v28;
        }
        while (v27 < v51);
        a3 = (NSAttributedString *)a3;
        if (v22 && objc_msgSend(v22, "count"))
        {
          CSStore2::getAttributedStringWithRepeatedCharacter((CSStore2 *)0x1C);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = (void *)objc_msgSend(v37, "mutableCopy");

          objc_msgSend(v38, "addAttribute:value:range:", CFSTR("_CSVOutputType"), &unk_1E4E24F80, 1, objc_msgSend(v38, "length") - 1);
          v43[0] = MEMORY[0x1E0C809B0];
          v43[1] = 3221225472;
          v43[2] = ___ZN8CSStore222AttributedStringWriter9childUnitEP8NSStringjj_block_invoke;
          v43[3] = &unk_1E4E218D0;
          v44 = v15;
          v39 = v38;
          v45 = v39;
          objc_msgSend(v22, "enumerateIndexesWithOptions:usingBlock:", 2, v43);

        }
      }
    }
    else
    {
      v22 = 0;
    }
  }
  else
  {
    CSStore2::AttributedStringWriter::Separator((CSStore2::AttributedStringWriter *)0x2D, 0, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "insertAttributedString:atIndex:", v22, 0);
    if (*(_BYTE *)(*((_QWORD *)this + 31) + 169))
    {
      CSStore2::getAttributedStringWithCharacter((CSStore2 *)0xA);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "insertAttributedString:atIndex:", v23, objc_msgSend(v22, "length"));

    }
    v24 = objc_msgSend(v15, "length");
    objc_msgSend(v15, "addAttribute:value:range:", CFSTR("_CSVIsRelated"), MEMORY[0x1E0C9AAB0], 0, v24);
  }

  CSStore2::addBackrefToAttributedString((CSStore2 *)v15, a3, a4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (NSAttributedString *)objc_msgSend(v40, "mutableCopy");

  objc_autoreleasePoolPop(v8);
  if (a2)
  {
    v42 = (NSAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", a2);
    CSStore2::AttributedStringWriter::attributedString(this, v42, v41);

  }
  else
  {
    CSStore2::AttributedStringWriter::attributedString((CSStore2::AttributedStringWriter::Impl **)this, v41);
  }

}

void sub_1A4E6AA4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

uint64_t ___ZN8CSStore222AttributedStringWriter9childUnitEP8NSStringjj_block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "insertAttributedString:atIndex:", *(_QWORD *)(a1 + 40), a2 + 1);
}

id CSStore2::AttributedStringWriter::getVisualizer(CSStore2::AttributedStringWriter *this)
{
  return *(id *)(*((_QWORD *)this + 31) + 160);
}

uint64_t CSStore2::AttributedStringWriter::insertsNewlines(CSStore2::AttributedStringWriter *this)
{
  return *(unsigned __int8 *)(*((_QWORD *)this + 31) + 169);
}

void CSStore2::AttributedStringWriter::childUnit(CSStore2::AttributedStringWriter *this, NSAttributedString *a2, uint64_t a3)
{
  CSStore2::AttributedStringWriter::childUnit(this, 0, a2, a3);
}

void CSStore2::AttributedStringWriter::setVisualizer(CSStore2::AttributedStringWriter *this, _CSVisualizer *a2)
{
  void *v4;
  id v5;

  objc_storeStrong((id *)(*((_QWORD *)this + 31) + 160), a2);
  -[_CSVisualizer userInfo](a2, "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("_CSAttributedStringWriterIsChildUnitWithTitle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*((_QWORD *)this + 31) + 170) = objc_msgSend(v4, "BOOLValue");

}

void sub_1A4E6ABD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

uint64_t CSStore2::AttributedStringWriter::setElidesEmptyValues(uint64_t this, char a2)
{
  *(_BYTE *)(*(_QWORD *)(this + 248) + 168) = a2;
  return this;
}

uint64_t CSStore2::AttributedStringWriter::setInsertsNewlines(uint64_t this, char a2)
{
  *(_BYTE *)(*(_QWORD *)(this + 248) + 169) = a2;
  return this;
}

id CSStore2::AttributedStringWriter::getLocale(CSStore2::AttributedStringWriter *this)
{
  return *(id *)(*((_QWORD *)this + 31) + 24);
}

void CSStore2::AttributedStringWriter::setLocale(CSStore2::AttributedStringWriter *this, NSLocale *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = -[NSLocale copy](a2, "copy");
  v4 = *((_QWORD *)this + 31);
  v5 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v3;

}

uint64_t CSStringBindingStoreAddTable(__CSStore *a1, void *a2)
{
  return CSMapAddMapTable(a1, a2, 0);
}

unsigned int *_CSStringBindingRetainString(uint64_t a1, int a2, unsigned int a3)
{
  return _CSStringRetain(a1, a3);
}

Unit *_CSStringBindingReleaseString(uint64_t a1, uint64_t a2, unsigned int a3)
{
  return _CSStringRelease(a1, a3);
}

uint64_t CSStringBindingCopyCFStrings(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  CFMutableArrayRef Mutable;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v2 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  if (a1 && a2)
  {
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
    v9[3] = (uint64_t)Mutable;
    if (Mutable)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __CSStringBindingCopyCFStrings_block_invoke;
      v7[3] = &unk_1E4E21990;
      v7[4] = &v8;
      v7[5] = a1;
      _CSStringBindingEnumerateAllBindings(a1, a2, v7);
      v2 = v9[3];
    }
    else
    {
      v2 = 0;
    }
  }
  _Block_object_dispose(&v8, 8);
  return v2;
}

void sub_1A4E6AD44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E6ADC4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

id **std::unique_ptr<CSStore2::Store>::reset[abi:nn180100](id **result, id *a2)
{
  id *v2;

  v2 = *result;
  *result = a2;
  if (v2)
  {

    JUMPOUT(0x1A85AA130);
  }
  return result;
}

uint64_t ___ZN8CSStore2L15IsAppleInternalEv_block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  CSStore2::IsAppleInternal(void)::result = result;
  return result;
}

void CSStore2::Table::setName(CSStore2::Table *this, NSString *a2)
{
  NSString *v3;

  v3 = objc_retainAutorelease(a2);
  strlcpy((char *)this + 8, -[NSString UTF8String](v3, "UTF8String"), 0x30uLL);

}

void sub_1A4E6AEA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

NSUInteger CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::Create(CSStore2::Store *a1, uint64_t a2)
{
  unsigned int v4;
  unsigned int v5;
  int v6;
  const void *v7;
  unint64_t v8;
  NSUInteger v9;
  uint64_t v10;
  unint64_t v11;
  int v12;
  BOOL v13;
  unint64_t v14;
  void *v16;
  uint64_t v17;
  unsigned int v18;
  unsigned int v19;
  void *v21[2];

  v4 = *(_DWORD *)(a2 + 24) + 1024;
  if (v4 >= 0x2000)
    v5 = 0x2000;
  else
    v5 = *(_DWORD *)(a2 + 24) + 1024;
  if (v5 <= 0x10)
    v5 = 16;
  v6 = 8 * v5 + 8 * v4;
  v7 = (const void *)(v6 | 4u);
  v8 = CSStore2::Store::extend(a1, v6 | 4u);
  v9 = v8;
  if (v8)
  {
    v10 = *(_QWORD *)a1;
    if (*(_QWORD *)a1)
      v11 = *(_QWORD *)(v10 + 8);
    else
      v11 = 0;
    v12 = -1;
    v13 = v8 >= v11;
    v14 = v8 - v11;
    if (v13 && !HIDWORD(v14))
    {
      if ((v14 + 1) > *(_DWORD *)(*(_QWORD *)(v10 + 8) + 12) || v14 == -1)
        v12 = -1;
      else
        v12 = v14;
    }
    CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::Create((_DWORD **)v21, a2, v12, 0x400u, 0);
    v16 = v21[0];
    if (v21[0])
    {
      CSStore2::VM::Copy(v9, (NSUInteger)v21[0], v7);
      ((void (*)(void *))v21[1])(v16);
    }
    else
    {
      CSStore2::Store::assertNotEnumeratingUnits((uint64_t)a1);
      v9 = 0;
      v17 = *(_QWORD *)(*(_QWORD *)a1 + 8);
      v18 = *(_DWORD *)(v17 + 16);
      v13 = v18 >= v7;
      v19 = v18 - (_DWORD)v7;
      if (!v13)
        v19 = 0;
      *(_DWORD *)(v17 + 16) = v19;
      ++*(_DWORD *)(v17 + 8);
    }
  }
  return v9;
}

void sub_1A4E6AFE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void (*a10)(uint64_t))
{
  uint64_t v10;

  a10(v10);
  _Unwind_Resume(a1);
}

uint64_t CSStore2::Store::extend(CSStore2::Store *this, unsigned int a2)
{
  CSStore2 *v4;
  NSObject *v5;
  CSStore2 *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  CSStore2::VM *v15;
  unsigned int v16;
  unsigned int v17;
  unint64_t v18;
  void *Copy;
  int v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  CSStore2 *v30;
  NSObject *v31;
  int v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = (CSStore2 *)CSStore2::Store::assertNotEnumeratingUnits((uint64_t)this);
  CSStore2::GetLog(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v32 = 134217984;
    v33 = a2;
    _os_log_debug_impl(&dword_1A4E5A000, v5, OS_LOG_TYPE_DEBUG, "Attempting to lengthen store by %llu bytes", (uint8_t *)&v32, 0xCu);
  }

  if (a2 + 3 >= 4)
    v7 = (a2 + 3) & 0xFFFFFFFC;
  else
    v7 = 4;
  v8 = *(_QWORD *)this;
  if (!*(_QWORD *)this
    || (v9 = *(_QWORD *)(v8 + 8),
        v10 = *(_DWORD *)(v9 + 12),
        v11 = v10 + v7,
        v10 + v7 >= *(_DWORD *)(v8 + 16)))
  {
    CSStore2::Store::assertNotEnumeratingUnits((uint64_t)this);
    v12 = *(_QWORD *)this;
    if (*(_QWORD *)this)
    {
      v10 = *(_DWORD *)(v12 + 16);
      v13 = v7 + 0x3FFFF + v10;
      if (v13 >= 0x40000)
        v14 = v13 & 0xFFFC0000;
      else
        v14 = 0x40000;
      if (v14 >= v10)
        goto LABEL_13;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL CSStore2::Store::reserve(_CSStoreSize, _CSStoreSize *)");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, CFSTR("CSStore+Store.mm"), 856, CFSTR("New CSStore size is smaller than the old size!"));

      v12 = *(_QWORD *)this;
      if (*(_QWORD *)this)
LABEL_13:
        v15 = *(CSStore2::VM **)(v12 + 8);
      else
        v15 = 0;
    }
    else
    {
      v10 = 0;
      v15 = 0;
      if ((v7 + 0x3FFFF) >= 0x40000)
        v14 = ((_DWORD)v7 + 0x3FFFF) & 0xFFFC0000;
      else
        v14 = 0x40000;
    }
    v16 = *MEMORY[0x1E0C85AD8];
    v17 = v10 + *MEMORY[0x1E0C85AD8] - 1;
    if (v17 == v17 % *MEMORY[0x1E0C85AD8])
      v18 = v16;
    else
      v18 = v17 / v16 * v16;
    Copy = (void *)CSStore2::VM::AllocateCopy(v15, (const void *)v18, (CSStore2::VM *)v14);
    if (!Copy)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL CSStore2::Store::reserve(_CSStoreSize, _CSStoreSize *)");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, CFSTR("CSStore+Store.mm"), 861, CFSTR("Failed to create data for store extension!"));

      CSStore2::GetLog(v30);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = 134217984;
        v33 = v7;
        _os_log_error_impl(&dword_1A4E5A000, v31, OS_LOG_TYPE_ERROR, "Failed to reserve %llu bytes of virtual memory", (uint8_t *)&v32, 0xCu);
      }

      abort();
    }
    v6 = (CSStore2 *)CSStore2::Store::setBytesNoCopy(this, Copy, v14);
    v9 = *(_QWORD *)(*(_QWORD *)this + 8);
    v11 = v10 + v7;
  }
  v20 = *(_DWORD *)(v9 + 16) + v7;
  *(_DWORD *)(v9 + 12) = v11;
  *(_DWORD *)(v9 + 16) = v20;
  v21 = v9 + v10;
  if (v11 <= v10)
    v22 = 0;
  else
    v22 = v21;
  CSStore2::GetLog(v6);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    v25 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)this + 8) + 16);
    v32 = 134217984;
    v33 = v25;
    _os_log_debug_impl(&dword_1A4E5A000, v23, OS_LOG_TYPE_DEBUG, "New length of store is %llu bytes", (uint8_t *)&v32, 0xCu);
  }

  if (v22)
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)this + 8) + 8);
  return v22;
}

void sub_1A4E6B348(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::Create(_DWORD **a1, uint64_t a2, int a3, unsigned int a4, _DWORD *a5)
{
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  size_t v12;
  _DWORD *v13;
  uint64_t (*v14)(_QWORD);
  _DWORD *v15;
  void **v16;
  size_t v17;
  void **v18;
  uint64_t **v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  void **v24;
  uint64_t *v25;
  void **v26;
  unint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  char *v35;
  char *v36;
  uint64_t v37;
  unsigned int v38;
  unsigned int v39;
  uint64_t v40;
  int v41;
  char *v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  char *v51;
  uint64_t v52;
  unint64_t v53;
  _QWORD *v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  _QWORD *v61;
  char *v62;
  char *v63;
  uint64_t v64;
  unint64_t v65;
  NSUInteger v66;
  _DWORD *v67;
  uint64_t v68;
  _DWORD *v69;
  NSUInteger v70;
  NSUInteger v71;
  int v72;
  _DWORD *v73;
  int v74;
  _QWORD *v75;
  void **v77;
  void **v78;
  void **v79;
  void ***v80;

  v9 = *(_QWORD *)(a2 + 24) + a4;
  if (v9 >= 0x2000)
    v10 = 0x2000;
  else
    v10 = *(_QWORD *)(a2 + 24) + a4;
  if (v10 <= 0x10)
    v11 = 16;
  else
    v11 = v10;
  v12 = (8 * (_DWORD)v11 + 8 * v9) | 4;
  v13 = malloc_type_malloc(v12, 0x16D4E321uLL);
  v14 = MEMORY[0x1E0C834A8];
  *a1 = v13;
  a1[1] = v14;
  if (v13)
  {
    v15 = v13;
    v74 = a3;
    bzero(v13, v12);
    *v15 = v11;
    v16 = (void **)operator new(24 * v11);
    v73 = a5;
    v72 = v12;
    v77 = v16;
    v79 = &v16[3 * v11];
    v17 = 24 * ((24 * (unint64_t)v11 - 24) / 0x18) + 24;
    bzero(v16, v17);
    v18 = (void **)((char *)v16 + v17);
    v78 = v18;
    v19 = *(uint64_t ***)(a2 + 16);
    v75 = a1;
    if (v19)
    {
      v20 = v11;
      do
      {
        v21 = **a1;
        v23 = *((unsigned int *)v19 + 4);
        v22 = *((unsigned int *)v19 + 5);
        v24 = &v77[3 * ((unsigned __int16)(v23 >> 2) % v21)];
        v26 = v24 + 1;
        v25 = (uint64_t *)v24[1];
        v27 = (unint64_t)v24[2];
        if ((unint64_t)v25 >= v27)
        {
          v29 = ((char *)v25 - (_BYTE *)*v24) >> 3;
          if ((unint64_t)(v29 + 1) >> 61)
            abort();
          v30 = v27 - (_QWORD)*v24;
          v31 = v30 >> 2;
          if (v30 >> 2 <= (unint64_t)(v29 + 1))
            v31 = v29 + 1;
          if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF8)
            v32 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v32 = v31;
          if (v32)
            v32 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v32);
          else
            v33 = 0;
          v34 = (uint64_t *)(v32 + 8 * v29);
          *v34 = v23 | (v22 << 32);
          v28 = v34 + 1;
          v35 = (char *)*v26;
          v36 = (char *)*v24;
          if (*v26 == *v24)
          {
            a1 = (_DWORD **)v75;
          }
          else
          {
            a1 = (_DWORD **)v75;
            do
            {
              v37 = *((_QWORD *)v35 - 1);
              v35 -= 8;
              *--v34 = v37;
            }
            while (v35 != v36);
            v35 = (char *)*v24;
          }
          *v24 = v34;
          *v26 = v28;
          v24[2] = (void *)(v32 + 8 * v33);
          if (v35)
            operator delete(v35);
        }
        else
        {
          *v25 = v23 | (v22 << 32);
          v28 = v25 + 1;
          a1 = (_DWORD **)v75;
        }
        *v26 = v28;
        v19 = (uint64_t **)*v19;
      }
      while (v19);
      v16 = v77;
      v18 = v78;
      v11 = v20;
    }
    if (v16 != v18)
    {
      v38 = a4 % v11;
      if (a4 / v11 <= 1)
        v39 = 1;
      else
        v39 = a4 / v11;
      do
      {
        v40 = v11;
        if (v11 <= a4)
        {
          v41 = 0;
          v42 = (char *)v16[1];
          do
          {
            v43 = (unint64_t)v16[2];
            if ((unint64_t)v42 >= v43)
            {
              v44 = (v42 - (_BYTE *)*v16) >> 3;
              if ((unint64_t)(v44 + 1) >> 61)
                abort();
              v45 = v43 - (_QWORD)*v16;
              v46 = v45 >> 2;
              if (v45 >> 2 <= (unint64_t)(v44 + 1))
                v46 = v44 + 1;
              if ((unint64_t)v45 >= 0x7FFFFFFFFFFFFFF8)
                v47 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v47 = v46;
              if (v47)
                v47 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v47);
              else
                v48 = 0;
              v49 = (char *)(v47 + 8 * v44);
              *(_QWORD *)v49 = 0xFFFFFFFF00000000;
              v42 = v49 + 8;
              v51 = (char *)*v16;
              v50 = (char *)v16[1];
              if (v50 != *v16)
              {
                do
                {
                  v52 = *((_QWORD *)v50 - 1);
                  v50 -= 8;
                  *((_QWORD *)v49 - 1) = v52;
                  v49 -= 8;
                }
                while (v50 != v51);
                v50 = (char *)*v16;
              }
              *v16 = v49;
              v16[1] = v42;
              v16[2] = (void *)(v47 + 8 * v48);
              if (v50)
                operator delete(v50);
            }
            else
            {
              *(_QWORD *)v42 = 0xFFFFFFFF00000000;
              v42 += 8;
            }
            v16[1] = v42;
            ++v41;
          }
          while (v41 != v39);
        }
        if (v38)
        {
          v54 = v16[1];
          v53 = (unint64_t)v16[2];
          if ((unint64_t)v54 >= v53)
          {
            v56 = ((char *)v54 - (_BYTE *)*v16) >> 3;
            if ((unint64_t)(v56 + 1) >> 61)
              abort();
            v57 = v53 - (_QWORD)*v16;
            v58 = v57 >> 2;
            if (v57 >> 2 <= (unint64_t)(v56 + 1))
              v58 = v56 + 1;
            if ((unint64_t)v57 >= 0x7FFFFFFFFFFFFFF8)
              v59 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v59 = v58;
            v11 = v40;
            if (v59)
              v59 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v59);
            else
              v60 = 0;
            v61 = (_QWORD *)(v59 + 8 * v56);
            *v61 = 0xFFFFFFFF00000000;
            v55 = v61 + 1;
            v63 = (char *)*v16;
            v62 = (char *)v16[1];
            if (v62 != *v16)
            {
              do
              {
                v64 = *((_QWORD *)v62 - 1);
                v62 -= 8;
                *--v61 = v64;
              }
              while (v62 != v63);
              v62 = (char *)*v16;
            }
            *v16 = v61;
            v16[1] = v55;
            v16[2] = (void *)(v59 + 8 * v60);
            if (v62)
              operator delete(v62);
          }
          else
          {
            *v54 = 0xFFFFFFFF00000000;
            v55 = v54 + 1;
            v11 = v40;
          }
          v16[1] = v55;
          --v38;
        }
        else
        {
          v11 = v40;
        }
        v16 += 3;
      }
      while (v16 != v18);
    }
    v65 = 0;
    v66 = (NSUInteger)&v15[2 * v11 + 1];
    v67 = (_DWORD *)*v75;
    v68 = 24 * v11;
    v69 = (_DWORD *)(*v75 + 8);
    do
    {
      v70 = (NSUInteger)v77[v65 / 8];
      v71 = (NSUInteger)v77[v65 / 8 + 1] - v70;
      *(v69 - 1) = v71 >> 3;
      *v69 = v66 - (_DWORD)v67 + v74;
      if ((v71 >> 3))
        CSStore2::VM::Copy(v66, v70, (const void *)(8 * (v71 >> 3)));
      v66 += v71 & 0x7FFFFFFF8;
      v65 += 24;
      v69 += 2;
    }
    while (v68 != v65);
    v80 = &v77;
    std::vector<std::vector<CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::KeyValuePair,std::allocator<CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::KeyValuePair>>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v80);
    LODWORD(v12) = v72;
    a5 = v73;
  }
  if (a5)
    *a5 = v12;
}

void sub_1A4E6B7E8(_Unwind_Exception *a1)
{
  _QWORD *v1;
  uint64_t v2;

  *v1 = 0;
  MEMORY[0x1E0C834A8](v2);
  _Unwind_Resume(a1);
}

void std::vector<std::vector<CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::KeyValuePair,std::allocator<CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::KeyValuePair>>>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  void **v1;
  char *v2;
  char *v4;
  void *v5;
  char *v6;
  void *v7;
  void *v8;

  v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    v4 = (char *)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      v6 = (char *)v1[1];
      do
      {
        v8 = (void *)*((_QWORD *)v6 - 3);
        v6 -= 24;
        v7 = v8;
        if (v8)
        {
          *((_QWORD *)v4 - 2) = v7;
          operator delete(v7);
        }
        v4 = v6;
      }
      while (v6 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t __Block_byref_object_copy__87(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__88(uint64_t a1)
{

}

void ___ZN8CSStore25Store23CreateWithContentsOfURLEP5NSURLPU15__autoreleasingP7NSError_block_invoke(uint64_t a1, CSStore2::Table *this)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  BOOL v6;
  unint64_t v7;
  uint64_t v9;
  void *v10;
  void *v11;
  __CFString *v12;

  if (this)
  {
    v3 = **(_QWORD **)(a1 + 40);
    if (v3)
      v4 = *(_QWORD *)(v3 + 8);
    else
      v4 = 0;
    v5 = 0xFFFFFFFFLL;
    v6 = (unint64_t)this >= v4;
    v7 = (unint64_t)this - v4;
    if (v6 && !HIDWORD(v7))
    {
      if ((v7 + 1) > *(_DWORD *)(*(_QWORD *)(v3 + 8) + 12) || v7 == -1)
        v5 = 0xFFFFFFFFLL;
      else
        v5 = v7;
    }
  }
  else
  {
    v5 = 0xFFFFFFFFLL;
  }
  v9 = *((unsigned int *)this + 19);
  v12 = (__CFString *)CSStore2::Table::copyCFName(this);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ offs"), v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("@0x%llX, $@0x%llX"), v5, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, v10);

}

void sub_1A4E6B9DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

uint64_t CSStore2::GarbageCollection::Collect(CSStore2::GarbageCollection *this, FILE **a2, CSStore2::Store *a3, _QWORD *a4)
{
  char v5;
  __int128 *v8;
  _BOOL8 IsNeeded;
  BOOL v10;
  NSObject *v11;
  _BOOL4 v12;
  CSStore2::GarbageCollection *v13;
  int v14;
  unsigned int v15;
  int v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  BOOL v23;
  id v24;
  id v25;
  uint64_t v26;
  int v27;
  id v28;
  __int16 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  unsigned __int16 v35;
  __int16 v36;
  BOOL v37;
  id v38;
  unsigned int v39;
  int v40;
  _BOOL4 v41;
  id v42;
  uint64_t v43;
  id v44;
  unint64_t v45;
  id v46;
  BOOL v48;
  unint64_t v49;
  CSStore2::GarbageCollection *v50;
  unint64_t v51;
  CSStore2::GarbageCollection *v52;
  NSObject *v53;
  const char *v54;
  double v55;
  NSObject *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  uint8_t v65[4];
  double v66;
  _BYTE buf[32];
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  int v72;
  uint64_t v73;

  v5 = (char)a3;
  v73 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)this)
    v8 = *(__int128 **)(*(_QWORD *)this + 8);
  else
    v8 = 0;
  IsNeeded = CSStore2::GarbageCollection::IsNeeded(this, a3);
  v10 = IsNeeded;
  CSStore2::GarbageCollection::GetGCLog((CSStore2::GarbageCollection *)IsNeeded);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = this;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a2;
      _os_log_impl(&dword_1A4E5A000, v11, OS_LOG_TYPE_DEFAULT, "GCing and writing store %p with writer %p", buf, 0x16u);
    }

    if (CSStore2::IsAppleInternal(void)::once != -1)
      dispatch_once(&CSStore2::IsAppleInternal(void)::once, &__block_literal_global_134);
    v14 = CSStore2::IsAppleInternal(void)::result;
    if (CSStore2::IsAppleInternal(void)::result)
    {
      v15 = *((_DWORD *)v8 + 3);
      v16 = *((_DWORD *)v8 + 4);
      CSStore2::GarbageCollection::GetGCLog(v13);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(double *)&buf[4] = (double)(v15 - v16) * 0.0009765625;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = (double)v15 * 0.0009765625;
        _os_log_impl(&dword_1A4E5A000, v17, OS_LOG_TYPE_DEFAULT, "Performing garbage collection to try to recover %.3f KB of %.3f KB.", buf, 0x16u);
      }

    }
    v18 = *v8;
    v19 = v8[2];
    *(_OWORD *)&buf[16] = v8[1];
    v68 = v19;
    *(_OWORD *)buf = v18;
    v20 = v8[3];
    v21 = v8[4];
    v22 = v8[5];
    v72 = *((_DWORD *)v8 + 24);
    v70 = v21;
    v71 = v22;
    v69 = v20;
    v62 = 0;
    v23 = CSStore2::Writer::seek(*a2, 100, 0, &v62);
    v24 = v62;
    v25 = v24;
    if (!v23)
      goto LABEL_37;
    v61 = v24;
    v26 = *(_QWORD *)this;
    if (*(_QWORD *)this)
      v26 = *(_QWORD *)(v26 + 8);
    v27 = CSStore2::GarbageCollection::WriteTableCommon(this, (unsigned int *)(v26 + 20), (uint64_t)&buf[20], a2, v5, (uint64_t)&v61);
    v28 = v61;

    if (!v27)
    {
      v25 = v28;
LABEL_37:
      v43 = 0;
      goto LABEL_38;
    }
    if (!*a2 || (CSStore2::Writer::IO<int,__sFILE *>((CSStore2 *)MEMORY[0x1E0C833B0], *a2) & 0x80000000) != 0)
      v29 = 1;
    else
      v29 = 2;
    *(_WORD *)&buf[6] = v29;
    ++*(_DWORD *)&buf[8];
    v60 = v28;
    v45 = CSStore2::Writer::tell(*a2, &v60);
    v46 = v60;

    if (!HIDWORD(v45))
    {
      v25 = v46;
      goto LABEL_37;
    }
    *(_DWORD *)&buf[12] = v45;
    *(_DWORD *)&buf[16] = v45;
    v59 = v46;
    v48 = CSStore2::Writer::pwrite(a2, buf, 0x64uLL, 0, &v59);
    v25 = v59;

    if (v14 == 0 || !v48)
    {
      if (!v48)
        goto LABEL_37;
      goto LABEL_31;
    }
    if (!CSStore2::Writer::IO<int,__sFILE *,long long,int>(*a2, 0, 2))
    {
      v58 = 0;
      v49 = CSStore2::Writer::tell(*a2, &v58);
      v50 = (CSStore2::GarbageCollection *)v58;
      v52 = v50;
      if (HIDWORD(v49))
      {
        LODWORD(v51) = *((_DWORD *)v8 + 3);
        v55 = ((double)v51 - (double)v49) * 0.0009765625;
        CSStore2::GarbageCollection::GetGCLog(v50);
        v56 = objc_claimAutoreleasedReturnValue();
        v53 = v56;
        if (v55 >= 0.0)
        {
          if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v65 = 134217984;
            v66 = v55;
            _os_log_impl(&dword_1A4E5A000, v53, OS_LOG_TYPE_INFO, "Saved %.3f KB.", v65, 0xCu);
          }
          goto LABEL_55;
        }
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v65 = 134217984;
          v66 = v55;
          v54 = "Failed to save space, to the order of %.3f KB.";
          goto LABEL_52;
        }
      }
      else
      {
        CSStore2::GarbageCollection::GetGCLog(v50);
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v65 = 138412290;
          v66 = *(double *)&v52;
          v54 = "Failed to get file offset after GC: %@";
LABEL_52:
          _os_log_error_impl(&dword_1A4E5A000, v53, OS_LOG_TYPE_ERROR, v54, v65, 0xCu);
        }
      }
LABEL_55:

    }
  }
  else
  {
    if (v12)
    {
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = this;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a2;
      _os_log_impl(&dword_1A4E5A000, v11, OS_LOG_TYPE_DEFAULT, "Writing store (no GC) %p with writer %p", buf, 0x16u);
    }

    v30 = *v8;
    v31 = v8[2];
    *(_OWORD *)&buf[16] = v8[1];
    v68 = v31;
    *(_OWORD *)buf = v30;
    v32 = v8[3];
    v33 = v8[4];
    v34 = v8[5];
    v72 = *((_DWORD *)v8 + 24);
    v70 = v33;
    v71 = v34;
    v69 = v32;
    v35 = crc32(0x6E797267uLL, (const Bytef *)v8 + 100, *((_DWORD *)v8 + 3) - 100);
    if (v35 >= 3uLL)
      v36 = v35;
    else
      v36 = v35 | 0xE000;
    *(_WORD *)&buf[6] = v36;
    v64 = 0;
    v37 = CSStore2::Writer::pwrite(a2, buf, 0x64uLL, 0, &v64);
    v38 = v64;
    v25 = v38;
    if (!v37)
      goto LABEL_37;
    v39 = *((_DWORD *)v8 + 3) + *MEMORY[0x1E0C85AD8] - 1;
    if (v39 == v39 % *MEMORY[0x1E0C85AD8])
      v40 = *MEMORY[0x1E0C85AD8];
    else
      v40 = v39 / *MEMORY[0x1E0C85AD8] * *MEMORY[0x1E0C85AD8];
    v63 = v38;
    v41 = CSStore2::Writer::pwrite(a2, (char *)v8 + 100, (v40 - 100), 100, &v63);
    v42 = v63;

    if (!v41)
    {
      v43 = 0;
      v25 = v42;
      goto LABEL_38;
    }
    v25 = v42;
  }
LABEL_31:
  v57 = v25;
  v43 = CSStore2::Writer::sync((void **)a2, &v57);
  v44 = v57;

  v25 = v44;
LABEL_38:
  if (a4 && (v43 & 1) == 0)
    *a4 = objc_retainAutorelease(v25);

  return v43;
}

void sub_1A4E6BFEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void CSStore2::Writer::~Writer(void **this)
{
  int v2;
  int v3;
  CSStore2 *v4;
  NSObject *v5;
  int v6;
  int *v7;
  char *v8;
  _DWORD v9[2];
  __int16 v10;
  char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (*((_BYTE *)this + 8) && *this)
  {
    if (*((_BYTE *)this + 9))
    {
      v2 = CSStore2::Writer::IO<int,__sFILE *>((CSStore2 *)MEMORY[0x1E0C833B0], *this);
      if ((v2 & 0x80000000) == 0)
      {
        v3 = v2;
        bzero(v9, 0x400uLL);
        if (CSStore2::Writer::IO<int,char *>(v3, v9) != -1)
          CSStore2::Writer::IO<int,char const*>((const char *)v9);
      }
    }
    v4 = (CSStore2 *)CSStore2::Writer::IO<int,__sFILE *>((CSStore2 *)MEMORY[0x1E0C832F8], *this);
    if ((_DWORD)v4)
    {
      CSStore2::GetLog(v4);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = *__error();
        v7 = __error();
        v8 = strerror(*v7);
        v9[0] = 67109378;
        v9[1] = v6;
        v10 = 2082;
        v11 = v8;
        _os_log_error_impl(&dword_1A4E5A000, v5, OS_LOG_TYPE_ERROR, "Failed to close file handle for store writer: %i (%{public}s).", (uint8_t *)v9, 0x12u);
      }

    }
  }
}

void sub_1A4E6C160(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t CSStore2::Writer::IO<int,__sFILE *>(CSStore2 *a1, void *a2)
{
  CSStore2 *v2;
  uint64_t v5;
  void *__p;
  char v8;
  void *v9;
  char v10;
  int v11;
  uint64_t vars0;

  v5 = ((uint64_t (*)(void *))a1)(a2);
  v11 = v5;
  if (CSStore2::Writer::logIO == 1)
  {
    __p = a2;
    CSStore2::Writer::toString<__sFILE *>();
    CSStore2::Writer::toString<int>();
    CSStore2::Writer::logFunctionCall(*(CSStore2 **)(vars0 + 8), v2, a1, (uint64_t)&v9, 1, (uint64_t)&__p);
    if (v8 < 0)
      operator delete(__p);
    if (v10 < 0)
      operator delete(v9);
  }
  return v5;
}

void sub_1A4E6C22C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0)
    operator delete(__p);
  if (a21 < 0)
    operator delete(a16);
  _Unwind_Resume(exception_object);
}

uint64_t CSStore2::Writer::IO<int,char *>(int a1, void *a2)
{
  CSStore2 *v2;
  uint64_t v5;
  uint64_t i;
  void *__p[2];
  char v9;
  _BYTE v10[48];
  _DWORD v11[10];
  uint64_t vars0;

  v5 = fcntl(a1, 50, a2);
  v11[7] = v5;
  if (CSStore2::Writer::logIO == 1)
  {
    v11[8] = 50;
    v11[9] = a1;
    __p[0] = a2;
    CSStore2::Writer::toString<int>();
    CSStore2::Writer::toString<int>();
    CSStore2::Writer::toString<char *>((uint64_t)v11, (const char **)__p);
    CSStore2::Writer::toString<int>();
    CSStore2::Writer::logFunctionCall(*(CSStore2 **)(vars0 + 8), v2, (CSStore2 *)MEMORY[0x1E0C83300], (uint64_t)v10, 3, (uint64_t)__p);
    if (v9 < 0)
      operator delete(__p[0]);
    for (i = 0; i != -18; i -= 6)
    {
      if (SHIBYTE(v11[i + 5]) < 0)
        operator delete(*(void **)&v10[i * 4 + 48]);
    }
  }
  return v5;
}

void sub_1A4E6C368(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17)
{
  uint64_t v18;

  if (a16 < 0)
    operator delete(__p);
  v18 = 0;
  while (1)
  {
    if (*(&a17 + v18 + 71) < 0)
      operator delete(*(void **)(&a17 + v18 + 48));
    v18 -= 24;
    if (v18 == -72)
      _Unwind_Resume(exception_object);
  }
}

void CSStore2::Writer::IO<int,char const*>(const char *a1)
{
  CSStore2 *v1;
  void *__p[2];
  char v4;
  void *v5[2];
  char v6;
  int v7;
  uint64_t vars0;

  v7 = unlink(a1);
  if (CSStore2::Writer::logIO == 1)
  {
    __p[0] = (void *)a1;
    CSStore2::Writer::toString<char const*>((uint64_t)v5, (const char **)__p);
    CSStore2::Writer::toString<int>();
    CSStore2::Writer::logFunctionCall(*(CSStore2 **)(vars0 + 8), v1, (CSStore2 *)MEMORY[0x1E0C859B8], (uint64_t)v5, 1, (uint64_t)__p);
    if (v4 < 0)
      operator delete(__p[0]);
    if (v6 < 0)
      operator delete(v5[0]);
  }
}

void sub_1A4E6C478(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0)
    operator delete(__p);
  if (a21 < 0)
    operator delete(a16);
  _Unwind_Resume(exception_object);
}

uint64_t CSStore2::Writer::toString<char const*>(uint64_t a1, const char **a2)
{
  const char *v3;
  size_t v4;
  _QWORD v6[11];
  char v7;
  uint64_t v8;

  std::ostringstream::basic_ostringstream[abi:nn180100]((uint64_t)v6);
  v3 = *a2;
  v4 = strlen(v3);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v6, (uint64_t)v3, v4);
  std::stringbuf::str();
  v6[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v6 + *(_QWORD *)(v6[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v6[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v7 < 0)
    operator delete((void *)v6[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1A85AA10C](&v8);
}

void sub_1A4E6C570(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t CSStore2::Writer::toString<int>()
{
  _QWORD v1[11];
  char v2;
  uint64_t v3;

  std::ostringstream::basic_ostringstream[abi:nn180100]((uint64_t)v1);
  std::ostream::operator<<();
  std::stringbuf::str();
  v1[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v1 + *(_QWORD *)(v1[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v1[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v2 < 0)
    operator delete((void *)v1[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1A85AA10C](&v3);
}

void sub_1A4E6C638(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::ostringstream::basic_ostringstream[abi:nn180100](uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  std::ios_base *v6;

  v2 = MEMORY[0x1E0DE4FE0];
  v3 = MEMORY[0x1E0DE4FE0] + 64;
  *(_QWORD *)(a1 + 112) = MEMORY[0x1E0DE4FE0] + 64;
  v4 = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 8);
  v5 = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 16);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + *(_QWORD *)(v4 - 24)) = v5;
  v6 = (std::ios_base *)(a1 + *(_QWORD *)(*(_QWORD *)a1 - 24));
  std::ios_base::init(v6, (void *)(a1 + 8));
  v6[1].__vftable = 0;
  v6[1].__fmtflags_ = -1;
  *(_QWORD *)a1 = v2 + 24;
  *(_QWORD *)(a1 + 112) = v3;
  std::streambuf::basic_streambuf();
  *(_QWORD *)(a1 + 8) = MEMORY[0x1E0DE4FB8] + 16;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_1A4E6C710(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::ostream::~ostream();
  MEMORY[0x1A85AA10C](v1);
  _Unwind_Resume(a1);
}

uint64_t std::ostringstream::~ostringstream(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = MEMORY[0x1E0DE4F60];
  v3 = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)a1 = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)(a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(a1 + 8) = MEMORY[0x1E0DE4FB8] + 16;
  if (*(char *)(a1 + 95) < 0)
    operator delete(*(void **)(a1 + 72));
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1A85AA10C](a1 + 112);
  return a1;
}

_QWORD *std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  char *v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  size_t v16;
  std::locale::__imp *p_b;
  uint64_t v18;
  uint64_t v19;
  std::locale *v20;
  uint64_t v21;
  _BYTE v23[16];
  std::locale __b;
  size_t v25;
  int64_t v26;

  MEMORY[0x1A85AA04C](v23, a1);
  if (v23[0])
  {
    v6 = (char *)a1 + *(_QWORD *)(*a1 - 24);
    v7 = *((_QWORD *)v6 + 5);
    v8 = *((_DWORD *)v6 + 2);
    v9 = *((_DWORD *)v6 + 36);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v10 = std::locale::use_facet(&__b, MEMORY[0x1E0DE4A90]);
      v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&__b);
      *((_DWORD *)v6 + 36) = v9;
    }
    v11 = a2 + a3;
    if ((v8 & 0xB0) == 0x20)
      v12 = a2 + a3;
    else
      v12 = a2;
    if (!v7)
      goto LABEL_29;
    v13 = *((_QWORD *)v6 + 3);
    v14 = v13 <= a3;
    v15 = v13 - a3;
    v16 = v14 ? 0 : v15;
    if (v12 - a2 >= 1
      && (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v7 + 96))(v7, a2, v12 - a2) != v12 - a2)
    {
      goto LABEL_29;
    }
    if ((uint64_t)v16 >= 1)
    {
      if (v16 >= 0x7FFFFFFFFFFFFFF8)
        abort();
      if (v16 >= 0x17)
      {
        v18 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v16 | 7) != 0x17)
          v18 = v16 | 7;
        v19 = v18 + 1;
        p_b = (std::locale::__imp *)operator new(v18 + 1);
        v25 = v16;
        v26 = v19 | 0x8000000000000000;
        __b.__locale_ = p_b;
      }
      else
      {
        HIBYTE(v26) = v16;
        p_b = (std::locale::__imp *)&__b;
      }
      memset(p_b, v9, v16);
      *((_BYTE *)p_b + v16) = 0;
      v20 = v26 >= 0 ? &__b : (std::locale *)__b.__locale_;
      v21 = (*(uint64_t (**)(uint64_t, std::locale *, size_t))(*(_QWORD *)v7 + 96))(v7, v20, v16);
      if (SHIBYTE(v26) < 0)
        operator delete(__b.__locale_);
      if (v21 != v16)
        goto LABEL_29;
    }
    if (v11 - v12 < 1
      || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v7 + 96))(v7, v12, v11 - v12) == v11 - v12)
    {
      *((_QWORD *)v6 + 3) = 0;
    }
    else
    {
LABEL_29:
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x1A85AA058](v23);
  return a1;
}

void sub_1A4E6C9DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
    operator delete(__p);
  MEMORY[0x1A85AA058](&a10);
  _Unwind_Resume(a1);
}

uint64_t CSStore2::Writer::toString<char *>(uint64_t a1, const char **a2)
{
  const char *v3;
  size_t v4;
  _QWORD v6[11];
  char v7;
  uint64_t v8;

  std::ostringstream::basic_ostringstream[abi:nn180100]((uint64_t)v6);
  v3 = *a2;
  v4 = strlen(v3);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v6, (uint64_t)v3, v4);
  std::stringbuf::str();
  v6[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v6 + *(_QWORD *)(v6[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v6[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v7 < 0)
    operator delete((void *)v6[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1A85AA10C](&v8);
}

void sub_1A4E6CAE0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t CSStore2::Writer::toString<__sFILE *>()
{
  _QWORD v1[11];
  char v2;
  uint64_t v3;

  std::ostringstream::basic_ostringstream[abi:nn180100]((uint64_t)v1);
  std::ostream::operator<<();
  std::stringbuf::str();
  v1[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v1 + *(_QWORD *)(v1[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v1[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v2 < 0)
    operator delete((void *)v1[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1A85AA10C](&v3);
}

void sub_1A4E6CBA8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL CSStore2::GarbageCollection::IsNeeded(CSStore2::GarbageCollection *this, const CSStore2::Store *a2)
{
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL8 v6;
  _QWORD v8[6];
  char v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  if ((a2 & 1) != 0)
  {
    CSStore2::GarbageCollection::GetGCLog(this);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4E5A000, v5, OS_LOG_TYPE_INFO, "Forced. Will collect.", buf, 2u);
    }
  }
  else
  {
    if (!*(_QWORD *)this
      || (v2 = *(_QWORD *)(*(_QWORD *)this + 8),
          v3 = *(_DWORD *)(v2 + 12),
          LODWORD(v2) = *(_DWORD *)(v2 + 16),
          v4 = v3 - v2,
          v3 <= v2)
      || v4 <= 0x80000)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = ___ZN8CSStore217GarbageCollection8IsNeededERKNS_5StoreEh_block_invoke;
      v8[3] = &unk_1E4E21B50;
      v9 = (char)a2;
      v8[4] = &v10;
      v8[5] = this;
      CSStore2::Store::enumerateTables((CSStore2 **)this, v8);
      v6 = *((_BYTE *)v11 + 24) != 0;
      goto LABEL_12;
    }
    CSStore2::GarbageCollection::GetGCLog(this);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v15 = v4;
      _os_log_impl(&dword_1A4E5A000, v5, OS_LOG_TYPE_INFO, "Store wastes %llu bytes. Will collect.", buf, 0xCu);
    }
  }

  v6 = 1;
  *((_BYTE *)v11 + 24) = 1;
LABEL_12:
  _Block_object_dispose(&v10, 8);
  return v6;
}

void sub_1A4E6CD4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id CSStore2::GarbageCollection::GetGCLog(CSStore2::GarbageCollection *this)
{
  if (CSStore2::GarbageCollection::GetGCLog(void)::once != -1)
    dispatch_once(&CSStore2::GarbageCollection::GetGCLog(void)::once, &__block_literal_global_137);
  return (id)CSStore2::GarbageCollection::GetGCLog(void)::result;
}

BOOL CSStore2::Writer::pwrite(FILE **a1, const void *a2, size_t a3, off_t a4, _QWORD *a5)
{
  unint64_t v10;
  id v11;
  id v12;
  _BOOL8 v13;
  _BOOL4 v14;
  id v15;
  _BOOL4 v16;
  id v17;
  id v19;
  id v20;
  id v21;
  id v22;

  v22 = 0;
  v10 = CSStore2::Writer::tell(*a1, &v22);
  v11 = v22;
  v12 = v11;
  if (HIDWORD(v10))
  {
    if (v10 != a4)
    {
      v21 = v11;
      v14 = CSStore2::Writer::seek(*a1, a4, 0, &v21);
      v15 = v21;

      if (!v14)
        goto LABEL_9;
      v12 = v15;
    }
    v20 = v12;
    v16 = CSStore2::Writer::write(*a1, a2, a3, &v20);
    v15 = v20;

    if (v16)
    {
      v19 = v15;
      v13 = CSStore2::Writer::seek(*a1, v10, 0, &v19);
      v17 = v19;

      v15 = v17;
      if (!a5)
        goto LABEL_12;
LABEL_10:
      if (!v13)
      {
        v12 = objc_retainAutorelease(v15);
        v13 = 0;
        *a5 = v12;
        goto LABEL_13;
      }
LABEL_12:
      v12 = v15;
      goto LABEL_13;
    }
LABEL_9:
    v13 = 0;
    if (!a5)
      goto LABEL_12;
    goto LABEL_10;
  }
  v13 = 1;
LABEL_13:

  return v13;
}

void sub_1A4E6CF08(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL CSStore2::Writer::seek(FILE *a1, off_t a2, int a3, _QWORD *a4)
{
  int v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v5 = CSStore2::Writer::IO<int,__sFILE *,long long,int>(a1, a2, a3);
  v6 = v5;
  if (a4 && v5)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *__error();
    v11[0] = *MEMORY[0x1E0CB2938];
    v11[1] = CFSTR("Line");
    v12[0] = CFSTR("errno");
    v12[1] = &unk_1E4E25280;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v8, v9);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6 == 0;
}

void sub_1A4E6D018(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t CSStore2::GarbageCollection::WriteTableCommon(CSStore2::Store *this, unsigned int *a2, uint64_t a3, FILE **a4, char a5, uint64_t a6)
{
  char *Table;
  id *v13;
  unint64_t v14;
  uint64_t *v15;
  id *v16;
  void *v17;
  unint64_t v18;
  id v19;
  _DWORD *v20;
  BOOL v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id obj;
  _QWORD v29[9];
  BOOL v30;
  char v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, _QWORD *);
  uint64_t (*v36)(uint64_t);
  _BYTE v37[32];
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  id v50;
  _DWORD *v51[2];
  unsigned int v52;
  id v53;
  _QWORD v54[2];
  _QWORD v55[4];

  v55[2] = *MEMORY[0x1E0C80C00];
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 1;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__87;
  v44 = __Block_byref_object_dispose__88;
  v45 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x5812000000;
  v35 = __Block_byref_object_copy__142;
  v36 = __Block_byref_object_dispose__143;
  memset(v37, 0, sizeof(v37));
  v38 = 0;
  v39 = 1065353216;
  Table = (char *)*((_QWORD *)this + 35);
  if (!Table)
    Table = CSStore2::Store::getTable((CSStore2 **)this, CFSTR("<dictionary>"));
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = ___ZN8CSStore217GarbageCollection16WriteTableCommonERKNS_5StoreEPKNS_5TableEPS4_RNS_6WriterEhPU15__autoreleasingP7NSError_block_invoke;
  v29[3] = &unk_1E4E21B28;
  v30 = Table == (char *)a2;
  v29[7] = a4;
  v29[8] = this;
  v29[4] = &v40;
  v29[5] = &v46;
  v31 = a5;
  v29[6] = &v32;
  CSStore2::Store::enumerateUnits((CSStore2 **)this, a2, v29);
  if (*((_BYTE *)v47 + 24))
  {
    v13 = (id *)(v41 + 5);
    obj = (id)v41[5];
    v14 = CSStore2::Writer::tell(*a4, &obj);
    objc_storeStrong(v13, obj);
    if (HIDWORD(v14))
    {
      v15 = v33;
      v16 = (id *)(v41 + 5);
      v17 = (void *)v41[5];
      v53 = 0;
      v18 = CSStore2::Writer::tell(*a4, &v53);
      v19 = v53;
      if (HIDWORD(v18))
      {
        v52 = 0;
        CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::Create(v51, (uint64_t)(v15 + 6), v18, 0, &v52);
        v20 = v51[0];
        if (v51[0])
        {
          v50 = v19;
          v21 = CSStore2::Writer::write(*a4, v51[0], v52, &v50);
          v22 = v50;

          ((void (*)(_DWORD *))v51[1])(v20);
          if (v21)
          {

            objc_storeStrong(v16, v17);
            a6 = 1;
            *((_BYTE *)v47 + 24) = 1;
            *(_DWORD *)(a3 + 76) = v14;
            goto LABEL_15;
          }
          v19 = v22;
        }
        else
        {
          v23 = (void *)MEMORY[0x1E0CB35C8];
          v54[0] = *MEMORY[0x1E0CB2938];
          v54[1] = CFSTR("Line");
          v55[0] = CFSTR("kCSStoreAllocFailedErr");
          v55[1] = &unk_1E4E252B0;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -9493, v24);
          v25 = objc_claimAutoreleasedReturnValue();

          v19 = (id)v25;
        }
      }
      v26 = objc_retainAutorelease(v19);

      objc_storeStrong(v16, v26);
    }
    *((_BYTE *)v47 + 24) = 0;
  }
  if (a6)
  {
    *(_QWORD *)a6 = objc_retainAutorelease((id)v41[5]);
    a6 = *((_BYTE *)v47 + 24) != 0;
  }
LABEL_15:
  _Block_object_dispose(&v32, 8);
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)&v37[8]);
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
  return a6;
}

void sub_1A4E6D3B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,id a37)
{
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;

  _Block_object_dispose(&a21, 8);
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table(v37);
  _Block_object_dispose(&a32, 8);

  _Block_object_dispose((const void *)(v40 - 200), 8);
  _Unwind_Resume(a1);
}

uint64_t CSStore2::Writer::tell(FILE *a1, _QWORD *a2)
{
  off_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v3 = CSStore2::Writer::IO<long long,__sFILE *>(a1);
  if (v3 < 0x100000000)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      v7 = 0;
      v8 = v3 & 0xFFFFFF00;
      v9 = v3;
      v10 = 0x100000000;
      goto LABEL_9;
    }
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *__error();
    v14[0] = *MEMORY[0x1E0CB2938];
    v14[1] = CFSTR("Line");
    v15[0] = CFSTR("errno");
    v15[1] = &unk_1E4E252E0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v12, v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v16[0] = *MEMORY[0x1E0CB2938];
    v16[1] = CFSTR("Line");
    v17[0] = CFSTR("ERANGE");
    v17[1] = &unk_1E4E252C8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 34, v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (id)v6;

  if (a2)
  {
    v7 = objc_retainAutorelease(v7);
    v8 = 0;
    v9 = 0;
    v10 = 0;
    *a2 = v7;
  }
  else
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
  }
LABEL_9:

  return v9 | v8 | v10;
}

void sub_1A4E6D5EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t CSStore2::Writer::IO<int,__sFILE *,long long,int>(FILE *a1, off_t a2, int a3)
{
  CSStore2 *v3;
  uint64_t v7;
  uint64_t i;
  void *__p;
  char v11;
  _BYTE v12[72];
  int v13;
  int v14;
  off_t v15;
  uint64_t vars0;

  v7 = fseeko(a1, a2, a3);
  v13 = v7;
  if (CSStore2::Writer::logIO == 1)
  {
    __p = a1;
    v15 = a2;
    v14 = a3;
    CSStore2::Writer::toString<__sFILE *>();
    CSStore2::Writer::toString<long long>();
    CSStore2::Writer::toString<int>();
    CSStore2::Writer::toString<int>();
    CSStore2::Writer::logFunctionCall(*(CSStore2 **)(vars0 + 8), v3, (CSStore2 *)MEMORY[0x1E0C83538], (uint64_t)v12, 3, (uint64_t)&__p);
    if (v11 < 0)
      operator delete(__p);
    for (i = 0; i != -72; i -= 24)
    {
      if ((char)v12[i + 71] < 0)
        operator delete(*(void **)&v12[i + 48]);
    }
  }
  return v7;
}

void sub_1A4E6D70C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v16;

  if (a14 < 0)
    operator delete(__p);
  v16 = 0;
  while (1)
  {
    if (*(&a15 + v16 + 71) < 0)
      operator delete(*(void **)(&a15 + v16 + 48));
    v16 -= 24;
    if (v16 == -72)
      _Unwind_Resume(exception_object);
  }
}

uint64_t CSStore2::Writer::sync(void **a1, _QWORD *a2)
{
  CSStore2 *v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CSStore2 *v16;
  CSStore2 *v17;
  int v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  int v22;
  NSObject *v23;
  CSStore2 *v24;
  int v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  int v29;
  void *v30;
  int v31;
  int *v32;
  char *v33;
  void *v35;
  int v36;
  int *v37;
  char *v38;
  int v39;
  int *v40;
  char *v41;
  int v42;
  int *v43;
  char *v44;
  _QWORD v45[2];
  _QWORD v46[2];
  uint8_t buf[4];
  _BYTE v48[10];
  _DWORD v49[6];
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[3];

  v53[2] = *MEMORY[0x1E0C80C00];
  v4 = (CSStore2 *)CSStore2::Writer::IO<int,__sFILE *>((CSStore2 *)MEMORY[0x1E0C83370], *a1);
  v5 = (int)v4;
  CSStore2::GetLog(v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v35 = *a1;
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v48 = v35;
      _os_log_debug_impl(&dword_1A4E5A000, v7, OS_LOG_TYPE_DEBUG, "Successfully called fflush(%p)", buf, 0xCu);
    }

    v14 = CSStore2::Writer::IO<int,__sFILE *>((CSStore2 *)MEMORY[0x1E0C833B0], *a1);
    v15 = v14;
    if ((v14 & 0x80000000) == 0)
    {
      v16 = (CSStore2 *)CSStore2::Writer::IO<int,int>(v14);
      if ((_DWORD)v16)
      {
        v17 = (CSStore2 *)__error();
        v18 = *(_DWORD *)v17;
        CSStore2::GetLog(v17);
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
        if (v18 == 28)
        {
          if (v20)
          {
            v36 = *__error();
            v37 = __error();
            v38 = strerror(*v37);
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)v48 = v15;
            *(_WORD *)&v48[4] = 1024;
            *(_DWORD *)&v48[6] = v36;
            LOWORD(v49[0]) = 2082;
            *(_QWORD *)((char *)v49 + 2) = v38;
            _os_log_error_impl(&dword_1A4E5A000, v19, OS_LOG_TYPE_ERROR, "Error calling fcntl(%i, F_FULLFSYNC): %i (%{public}s).", buf, 0x18u);
          }

          v21 = (void *)MEMORY[0x1E0CB35C8];
          v22 = *__error();
          v52[0] = *MEMORY[0x1E0CB2938];
          v52[1] = CFSTR("Line");
          v53[0] = CFSTR("errno");
          v53[1] = &unk_1E4E252F8;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v22, v10);
          v11 = objc_claimAutoreleasedReturnValue();
          goto LABEL_5;
        }
        if (v20)
        {
          v39 = *__error();
          v40 = __error();
          v41 = strerror(*v40);
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v48 = v15;
          *(_WORD *)&v48[4] = 1024;
          *(_DWORD *)&v48[6] = v39;
          LOWORD(v49[0]) = 2082;
          *(_QWORD *)((char *)v49 + 2) = v41;
          _os_log_error_impl(&dword_1A4E5A000, v19, OS_LOG_TYPE_ERROR, "Error calling fcntl(%i, F_FULLFSYNC), trying fsync(): %i (%{public}s).", buf, 0x18u);
        }

        v24 = (CSStore2 *)CSStore2::Writer::IO<int,int>(MEMORY[0x1E0C83578], v15);
        v25 = (int)v24;
        CSStore2::GetLog(v24);
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (v25)
        {
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            v42 = *__error();
            v43 = __error();
            v44 = strerror(*v43);
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)v48 = v15;
            *(_WORD *)&v48[4] = 1024;
            *(_DWORD *)&v48[6] = v42;
            LOWORD(v49[0]) = 2082;
            *(_QWORD *)((char *)v49 + 2) = v44;
            _os_log_error_impl(&dword_1A4E5A000, v27, OS_LOG_TYPE_ERROR, "Error calling fsync(%i): %i (%{public}s).", buf, 0x18u);
          }

          v28 = (void *)MEMORY[0x1E0CB35C8];
          v29 = *__error();
          v50[0] = *MEMORY[0x1E0CB2938];
          v50[1] = CFSTR("Line");
          v51[0] = CFSTR("errno");
          v51[1] = &unk_1E4E25310;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 2);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v29, v10);
          v11 = objc_claimAutoreleasedReturnValue();
          goto LABEL_5;
        }
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v48 = v15;
          _os_log_debug_impl(&dword_1A4E5A000, v27, OS_LOG_TYPE_DEBUG, "Successfully called fsync(%i)", buf, 8u);
        }

      }
      else
      {
        CSStore2::GetLog(v16);
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v48 = v15;
          _os_log_debug_impl(&dword_1A4E5A000, v23, OS_LOG_TYPE_DEBUG, "Successfully called fcntl(%i, F_FULLFSYNC)", buf, 8u);
        }

      }
    }
    v12 = 0;
    v13 = 1;
    goto LABEL_29;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v30 = *a1;
    v31 = *__error();
    v32 = __error();
    v33 = strerror(*v32);
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)v48 = v30;
    *(_WORD *)&v48[8] = 1024;
    v49[0] = v31;
    LOWORD(v49[1]) = 2082;
    *(_QWORD *)((char *)&v49[1] + 2) = v33;
    _os_log_error_impl(&dword_1A4E5A000, v7, OS_LOG_TYPE_ERROR, "Error calling fflush(%p): %i (%{public}s).", buf, 0x1Cu);
  }

  v8 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *__error();
  v45[0] = *MEMORY[0x1E0CB2938];
  v45[1] = CFSTR("Line");
  v46[0] = CFSTR("errno");
  v46[1] = &unk_1E4E25328;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
LABEL_5:
  v12 = (id)v11;

  if (a2)
  {
    v12 = objc_retainAutorelease(v12);
    v13 = 0;
    *a2 = v12;
  }
  else
  {
    v13 = 0;
  }
LABEL_29:

  return v13;
}

void sub_1A4E6DCD0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t CSStore2::Writer::IO<int,int>(int a1)
{
  CSStore2 *v1;
  uint64_t v3;
  uint64_t i;
  void *__p;
  char v7;
  _BYTE v8[76];
  int v9;
  int v10;
  int v11;
  uint64_t vars0;

  v3 = fcntl(a1, 51, 1);
  v9 = v3;
  if (CSStore2::Writer::logIO == 1)
  {
    LODWORD(__p) = a1;
    v10 = 1;
    v11 = 51;
    CSStore2::Writer::toString<int>();
    CSStore2::Writer::toString<int>();
    CSStore2::Writer::toString<int>();
    CSStore2::Writer::toString<int>();
    CSStore2::Writer::logFunctionCall(*(CSStore2 **)(vars0 + 8), v1, (CSStore2 *)MEMORY[0x1E0C83300], (uint64_t)v8, 3, (uint64_t)&__p);
    if (v7 < 0)
      operator delete(__p);
    for (i = 0; i != -72; i -= 24)
    {
      if ((char)v8[i + 71] < 0)
        operator delete(*(void **)&v8[i + 48]);
    }
  }
  return v3;
}

void sub_1A4E6DE38(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17)
{
  uint64_t v18;

  if (a16 < 0)
    operator delete(__p);
  v18 = 0;
  while (1)
  {
    if (*(&a17 + v18 + 71) < 0)
      operator delete(*(void **)(&a17 + v18 + 48));
    v18 -= 24;
    if (v18 == -72)
      _Unwind_Resume(exception_object);
  }
}

uint64_t CSStore2::Writer::IO<int,int>(CSStore2 *a1, uint64_t a2)
{
  CSStore2 *v2;
  int v3;
  uint64_t v5;
  void *__p;
  char v8;
  void *v9;
  char v10;
  int v11;
  uint64_t vars0;

  v3 = a2;
  v5 = ((uint64_t (*)(uint64_t))a1)(a2);
  v11 = v5;
  if (CSStore2::Writer::logIO == 1)
  {
    LODWORD(__p) = v3;
    CSStore2::Writer::toString<int>();
    CSStore2::Writer::toString<int>();
    CSStore2::Writer::logFunctionCall(*(CSStore2 **)(vars0 + 8), v2, a1, (uint64_t)&v9, 1, (uint64_t)&__p);
    if (v8 < 0)
      operator delete(__p);
    if (v10 < 0)
      operator delete(v9);
  }
  return v5;
}

void sub_1A4E6DF5C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0)
    operator delete(__p);
  if (a21 < 0)
    operator delete(a16);
  _Unwind_Resume(exception_object);
}

uint64_t CSStore2::Writer::toString<long long>()
{
  _QWORD v1[11];
  char v2;
  uint64_t v3;

  std::ostringstream::basic_ostringstream[abi:nn180100]((uint64_t)v1);
  std::ostream::operator<<();
  std::stringbuf::str();
  v1[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v1 + *(_QWORD *)(v1[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v1[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v2 < 0)
    operator delete((void *)v1[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1A85AA10C](&v3);
}

void sub_1A4E6E044(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

off_t CSStore2::Writer::IO<long long,__sFILE *>(FILE *a1)
{
  CSStore2 *v1;
  off_t v3;
  void *__p;
  char v6;
  void *v7;
  char v8;
  off_t v9;
  uint64_t vars0;

  v3 = ftello(a1);
  v9 = v3;
  if (CSStore2::Writer::logIO == 1)
  {
    __p = a1;
    CSStore2::Writer::toString<__sFILE *>();
    CSStore2::Writer::toString<long long>();
    CSStore2::Writer::logFunctionCall(*(CSStore2 **)(vars0 + 8), v1, (CSStore2 *)MEMORY[0x1E0C83588], (uint64_t)&v7, 1, (uint64_t)&__p);
    if (v6 < 0)
      operator delete(__p);
    if (v8 < 0)
      operator delete(v7);
  }
  return v3;
}

void sub_1A4E6E108(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0)
    operator delete(__p);
  if (a21 < 0)
    operator delete(a16);
  _Unwind_Resume(exception_object);
}

uint64_t __Block_byref_object_copy__142(uint64_t result, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v2 = a2[6];
  a2[6] = 0;
  *(_QWORD *)(result + 48) = v2;
  *(_QWORD *)(result + 56) = a2[7];
  a2[7] = 0;
  v5 = a2[8];
  v3 = a2 + 8;
  v4 = v5;
  *(_QWORD *)(result + 64) = v5;
  v6 = v3[1];
  *(_QWORD *)(result + 72) = v6;
  *(_DWORD *)(result + 80) = *((_DWORD *)v3 + 4);
  if (v6)
  {
    v7 = *(_QWORD *)(v4 + 8);
    v8 = *(_QWORD *)(result + 56);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8)
        v7 %= v8;
    }
    else
    {
      v7 &= v8 - 1;
    }
    *(_QWORD *)(v2 + 8 * v7) = result + 64;
    *v3 = 0;
    v3[1] = 0;
  }
  return result;
}

uint64_t __Block_byref_object_dispose__143(uint64_t a1)
{
  return std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table(a1 + 48);
}

void ___ZN8CSStore217GarbageCollection16WriteTableCommonERKNS_5StoreEPKNS_5TableEPS4_RNS_6WriterEhPU15__autoreleasingP7NSError_block_invoke(uint64_t a1, char *a2, _BYTE *a3)
{
  unint64_t v3;
  FILE **v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unsigned int v9;
  FILE **v10;
  uint64_t v11;
  id *v12;
  void *v13;
  char *Table;
  char *Unit;
  uint64_t v16;
  unsigned int *v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unsigned int *v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v28;
  uint64_t v29;
  unsigned int *v30;
  unint64_t v31;
  uint8x8_t v32;
  void **v33;
  _QWORD *v34;
  unint64_t v35;
  float v36;
  _BOOL8 v37;
  unint64_t v38;
  unint64_t v39;
  size_t v40;
  uint64_t v41;
  _QWORD *v42;
  unint64_t v43;
  unint64_t v44;
  int v45;
  unint64_t v46;
  int v47;
  unsigned int v48;
  uint64_t v49;
  FILE **v50;
  uint64_t v51;
  id *v52;
  _DWORD *v53;
  _DWORD *v54;
  id v55;
  unsigned int v56;
  size_t v57;
  _DWORD *v58;
  _DWORD *v59;
  _BOOL4 v60;
  __CFString *v61;
  int v62;
  __CFString *v63;
  const CSStore2::Store *v64;
  char *v65;
  char *StringCache;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  char *v70;
  char *v71;
  unsigned int v72;
  uint64_t v73;
  uint64_t v74;
  unsigned int v75;
  BOOL v76;
  unint64_t v77;
  uint64_t v78;
  unsigned int *v79;
  _DWORD *v80;
  size_t v81;
  uint8x8_t v82;
  void **v83;
  _QWORD *v84;
  unint64_t v85;
  float v86;
  unint64_t v87;
  _BOOL8 v88;
  unint64_t v89;
  unint64_t v90;
  int8x8_t prime;
  unint64_t v92;
  void *v93;
  void *v94;
  uint64_t v95;
  _QWORD **v96;
  unint64_t v97;
  uint8x8_t v98;
  unint64_t v99;
  uint8x8_t v100;
  uint64_t v101;
  _QWORD *i;
  unint64_t v103;
  uint64_t v104;
  _QWORD *v105;
  unint64_t v106;
  void *v107;
  unint64_t v108;
  __CFString *v109;
  FILE **v110;
  uint64_t v111;
  id *v112;
  void *v113;
  unsigned int v114;
  size_t v115;
  BOOL v116;
  void *v117;
  void *v118;
  unsigned int v119;
  void *v120;
  void *v121;
  uint64_t v122;
  char v123;
  uint64_t v124;
  uint64_t *v125;
  unint64_t v126;
  unint64_t v127;
  uint8x8_t v128;
  void **v129;
  _QWORD *v130;
  unint64_t v131;
  float v132;
  float v133;
  _BOOL8 v134;
  unint64_t v135;
  unint64_t v136;
  size_t v137;
  uint64_t v138;
  _QWORD *v139;
  unint64_t v140;
  void *v141;
  __CFString *v142;
  _DWORD *v143;
  BOOL v144;
  int v145;
  __CFString *v146;
  void *v147;
  void *v148;
  BOOL v149;
  id *v150;
  _DWORD *v151;
  FILE **v152;
  _DWORD *v153;
  char *v154;
  int v155[2];
  id *v156;
  size_t v157;
  char *v158;
  char *v159;
  FILE **v160;
  unsigned int *v161;
  unint64_t v162;
  CSStore2 **v163;
  unsigned int *v164;
  CSStore2::Store *v165;
  unint64_t v167;
  unsigned int *v169;
  unint64_t v170;
  id v171;
  id v172;
  id obj;
  __CFString *v174;
  id v175;
  size_t __nitems;
  _DWORD v177[3];
  uint64_t v178;
  const __CFString *v179;
  __CFString *v180;
  void *v181;
  _DWORD *v182;
  const __CFString *v183;
  __int128 v184;
  __int128 v185;
  float v186;
  uint64_t v187;

  v187 = *MEMORY[0x1E0C80C00];
  v5 = *(FILE ***)(a1 + 56);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v6 + 40);
  v167 = CSStore2::Writer::tell(*v5, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (!HIDWORD(v167))
  {
    v7 = a1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    goto LABEL_242;
  }
  if (*(_BYTE *)(a1 + 72))
  {
    CSStore2::Dictionary::Get((CSStore2::Dictionary *)&v184, *(CSStore2::Store **)(a1 + 64), 4 * *(_DWORD *)a2);
    if (!BYTE8(v185))
    {
      v7 = a1;
      goto LABEL_202;
    }
    v8 = v184;
    v9 = v185;
    v10 = *(FILE ***)(a1 + 56);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v13 = *(void **)(v11 + 40);
    v12 = (id *)(v11 + 40);
    v172 = v13;
    Table = *(char **)(v184 + 280);
    if (!Table)
      Table = CSStore2::Store::getTable((CSStore2 **)v184, CFSTR("<dictionary>"));
    Unit = CSStore2::Store::getUnit((CSStore2 **)v8, (const CSStore2::Table *)Table, v9);
    if (Unit)
    {
      *(_QWORD *)&v177[1] = *((_QWORD *)Unit + 1);
      if (v177[2] != -1)
      {
        v16 = *(_QWORD *)(*(_QWORD *)v8 + 8);
        if (*(_DWORD *)(v16 + 12) > v177[2])
        {
          v154 = Unit;
          v156 = v12;
          v158 = a2;
          v160 = v10;
          v17 = (unsigned int *)(v16 + v177[2]);
          v184 = 0u;
          v185 = 0u;
          v186 = 1.0;
          v18 = *v17;
          if ((_DWORD)v18)
          {
            v19 = 0;
            v20 = 0;
            v21 = 0;
            v163 = (CSStore2 **)v8;
            v161 = (unsigned int *)(v16 + v177[2]);
            while (1)
            {
              v22 = &v17[2 * v21];
              v23 = v22[1];
              v169 = v22 + 1;
              if (v23 - 0x20000000 >= 0xE0000001)
              {
                v24 = v17[2 * v21 + 2];
                if (!__CFADD__((_DWORD)v24, 8 * v23))
                {
                  v25 = *(_QWORD *)(*(_QWORD *)v8 + 8);
                  v26 = *(_DWORD *)(v25 + 12);
                  if (v24 + 8 * v23 <= v26 && v26 > v24)
                    break;
                }
              }
LABEL_63:
              if (++v21 >= v18)
                goto LABEL_64;
            }
            v28 = 0;
            v29 = v25 + v24;
            while (1)
            {
              v30 = (unsigned int *)(v29 + 8 * v28);
              v31 = *v30;
              if ((_DWORD)v31)
              {
                v3 = v30[1];
                if ((_DWORD)v3)
                  break;
              }
LABEL_61:
              if (++v28 >= (unint64_t)v23)
              {
                v17 = v161;
                v8 = (unint64_t)v163;
                v18 = *v161;
                goto LABEL_63;
              }
            }
            if (v20)
            {
              v32 = (uint8x8_t)vcnt_s8((int8x8_t)v20);
              v32.i16[0] = vaddlv_u8(v32);
              if (v32.u32[0] > 1uLL)
              {
                v8 = *v30;
                if (v20 <= v31)
                  v8 = v31 % v20;
              }
              else
              {
                v8 = ((_DWORD)v20 - 1) & v31;
              }
              v33 = *(void ***)(v184 + 8 * v8);
              if (v33)
              {
                v34 = *v33;
                if (*v33)
                {
                  do
                  {
                    v35 = v34[1];
                    if (v35 == v31)
                    {
                      if (*((_DWORD *)v34 + 4) == (_DWORD)v31)
                        goto LABEL_60;
                    }
                    else
                    {
                      if (v32.u32[0] > 1uLL)
                      {
                        if (v35 >= v20)
                          v35 %= v20;
                      }
                      else
                      {
                        v35 &= v20 - 1;
                      }
                      if (v35 != v8)
                        break;
                    }
                    v34 = (_QWORD *)*v34;
                  }
                  while (v34);
                }
              }
            }
            v34 = operator new(0x18uLL);
            *v34 = 0;
            v34[1] = v31;
            *((_DWORD *)v34 + 4) = *v30;
            *((_DWORD *)v34 + 5) = 0;
            v36 = (float)(unint64_t)(v19 + 1);
            if (!v20 || (float)(v186 * (float)v20) < v36)
            {
              v37 = (v20 & (v20 - 1)) != 0;
              if (v20 < 3)
                v37 = 1;
              v38 = v37 | (2 * v20);
              v39 = vcvtps_u32_f32(v36 / v186);
              if (v38 <= v39)
                v40 = v39;
              else
                v40 = v38;
              std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__rehash<true>((uint64_t)&v184, v40);
              v20 = *((_QWORD *)&v184 + 1);
              if ((v20 & (v20 - 1)) != 0)
              {
                if (*((_QWORD *)&v184 + 1) <= v31)
                  v8 = v31 % *((_QWORD *)&v184 + 1);
                else
                  v8 = v31;
              }
              else
              {
                v8 = (DWORD2(v184) - 1) & v31;
              }
            }
            v41 = v184;
            v42 = *(_QWORD **)(v184 + 8 * v8);
            if (v42)
            {
              *v34 = *v42;
            }
            else
            {
              *v34 = v185;
              *(_QWORD *)&v185 = v34;
              *(_QWORD *)(v41 + 8 * v8) = &v185;
              if (!*v34)
                goto LABEL_59;
              v43 = *(_QWORD *)(*v34 + 8);
              if ((v20 & (v20 - 1)) != 0)
              {
                if (v43 >= v20)
                  v43 %= v20;
              }
              else
              {
                v43 &= v20 - 1;
              }
              v42 = (_QWORD *)(v184 + 8 * v43);
            }
            *v42 = v34;
LABEL_59:
            v19 = ++*((_QWORD *)&v185 + 1);
LABEL_60:
            *((_DWORD *)v34 + 5) = v3;
            v23 = *v169;
            goto LABEL_61;
          }
LABEL_64:
          v44 = CSStore2::Writer::tell(*v160, &v172);
          v45 = v44;
          v12 = v156;
          a2 = v158;
          if (HIDWORD(v44))
          {
            LODWORD(__nitems) = 0;
            CSStore2::HashMap<unsigned int,unsigned int,CSStore2::Dictionary::_Functions,0ull>::Create(&v182, (uint64_t)&v184, v44, 0, &__nitems);
            v3 = (unint64_t)v182;
            if (v182)
            {
              v177[2] = v45;
              if (CSStore2::Writer::write(*v160, v182, __nitems, &v172)
                && (v46 = CSStore2::Writer::tell(*v160, &v172), v47 = v46, HIDWORD(v46))
                && CSStore2::Writer::write(*v160, v154, 8uLL, &v172)
                && CSStore2::Writer::write(*v160, &v177[1], 8uLL, &v172))
              {
                v48 = v47 & 0xFFFFFF00;
                v49 = 0x100000000;
              }
              else
              {
                v49 = 0;
                LOBYTE(v47) = 0;
                v48 = 0;
              }
              ((void (*)(unint64_t))v183)(v3);
              goto LABEL_247;
            }
            v3 = MEMORY[0x1E0CB35C8];
            v178 = *MEMORY[0x1E0CB2938];
            v179 = CFSTR("Line");
            v180 = CFSTR("kCSStoreAllocFailedErr");
            v181 = &unk_1E4E25550;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v180, &v178, 2);
            v141 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v3, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -9493, v141);
            v172 = (id)objc_claimAutoreleasedReturnValue();

          }
          v49 = 0;
          LOBYTE(v47) = 0;
          v48 = 0;
LABEL_247:
          std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)&v184);
          goto LABEL_191;
        }
      }
      v3 = MEMORY[0x1E0CB35C8];
      v182 = (_DWORD *)*MEMORY[0x1E0CB2938];
      v183 = CFSTR("Line");
      *(_QWORD *)&v184 = CFSTR("kCSStoreNotFoundErr");
      *((_QWORD *)&v184 + 1) = &unk_1E4E25568;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v184, &v182, 2);
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v3, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -9499, v117);
      v172 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = MEMORY[0x1E0CB35C8];
      v182 = (_DWORD *)*MEMORY[0x1E0CB2938];
      v183 = CFSTR("Line");
      *(_QWORD *)&v184 = CFSTR("kCSStoreNotFoundErr");
      *((_QWORD *)&v184 + 1) = &unk_1E4E25580;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v184, &v182, 2);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v3, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -9499, v118);
      v172 = (id)objc_claimAutoreleasedReturnValue();

    }
    v49 = 0;
    LOBYTE(v47) = 0;
    v48 = 0;
LABEL_191:
    objc_storeStrong(v12, v172);
    v7 = a1;
    if ((v49 & 0x100000000) != 0)
      v119 = v48 & 0xFFFFFF00 | v47;
    else
      v119 = v167;
    LODWORD(v167) = v119;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (v49 & 0x100000000) != 0;
    goto LABEL_202;
  }
  if (*(_DWORD *)a2 >> 30 == 1)
  {
    v50 = *(FILE ***)(a1 + 56);
    v165 = *(CSStore2::Store **)(a1 + 64);
    v51 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v54 = *(_DWORD **)(v51 + 40);
    v52 = (id *)(v51 + 40);
    v53 = v54;
    __nitems = 0;
    v170 = CSStore2::Writer::tell(*v50, &__nitems);
    v55 = (id)__nitems;
    if (!HIDWORD(v170))
      goto LABEL_200;
    v56 = *((_DWORD *)a2 + 1) + 11;
    if (v56 >= 4)
      v57 = v56 & 0xFFFFFFFC;
    else
      v57 = 4;
    v58 = malloc_type_malloc(v57, 0x29349731uLL);
    v59 = v58;
    if (!v58)
    {
      v120 = (void *)MEMORY[0x1E0CB35C8];
      v182 = (_DWORD *)*MEMORY[0x1E0CB2938];
      v183 = CFSTR("Line");
      *(_QWORD *)&v184 = CFSTR("kCSStoreAllocFailedErr");
      *((_QWORD *)&v184 + 1) = &unk_1E4E25298;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v184, &v182, 2);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -9493, v121);
      v122 = objc_claimAutoreleasedReturnValue();

      v55 = (id)v122;
      goto LABEL_200;
    }
    memcpy(v58, a2, v57);
    v175 = v55;
    v157 = v57;
    v60 = CSStore2::Writer::seek(*v50, v57, 1, &v175);
    v61 = (__CFString *)v175;

    if (!v60)
      goto LABEL_199;
    v174 = v61;
    v62 = CSStore2::GarbageCollection::WriteTableCommon(v165);
    v63 = v174;

    if (!v62)
    {
      v61 = v63;
      goto LABEL_199;
    }
    v65 = (char *)*((_QWORD *)v165 + 34);
    if (!v65)
      v65 = CSStore2::Store::getTable((CSStore2 **)v165, CFSTR("<string>"));
    if (v65 != a2)
      goto LABEL_256;
    StringCache = CSStore2::getStringCache(v165, v64);
    if (StringCache)
    {
      v150 = v52;
      v151 = v59;
      v184 = 0u;
      v185 = 0u;
      v186 = 1.0;
      v67 = *(unsigned int *)StringCache;
      *(_QWORD *)v155 = v63;
      if ((_DWORD)v67)
      {
        v68 = 0;
        v69 = 0;
        v159 = StringCache;
        v162 = 0;
        v70 = StringCache;
        v152 = v50;
        v153 = v53;
        do
        {
          v71 = &v70[8 * v69];
          v72 = *((_DWORD *)v71 + 1);
          v164 = (unsigned int *)(v71 + 4);
          if (v72 - 0x20000000 < 0xE0000001
            || (v73 = *((unsigned int *)v71 + 2), __CFADD__((_DWORD)v73, 8 * v72))
            || ((v74 = *(_QWORD *)(*(_QWORD *)v165 + 8),
                 v75 = *(_DWORD *)(v74 + 12),
                 v73 + 8 * v72 <= v75)
              ? (v76 = v75 > v73)
              : (v76 = 0),
                !v76))
          {
            v70 = v159;
            goto LABEL_180;
          }
          v77 = 0;
          v78 = v74 + v73;
          do
          {
            v79 = (unsigned int *)(v78 + 8 * v77);
            v80 = v79 + 1;
            v81 = *v79;
            if (!*v79 || (*((_BYTE *)v79 + 5) & 1) == 0)
              goto LABEL_168;
            if (v68)
            {
              v82 = (uint8x8_t)vcnt_s8((int8x8_t)v68);
              v82.i16[0] = vaddlv_u8(v82);
              if (v82.u32[0] > 1uLL)
              {
                v57 = *v79;
                if (v68 <= v81)
                  v57 = v81 % v68;
              }
              else
              {
                v57 = ((_DWORD)v68 - 1) & v81;
              }
              v83 = *(void ***)(v184 + 8 * v57);
              if (v83)
              {
                v84 = *v83;
                if (*v83)
                {
                  do
                  {
                    v85 = v84[1];
                    if (v85 == v81)
                    {
                      if (*((_DWORD *)v84 + 4) == (_DWORD)v81)
                        goto LABEL_167;
                    }
                    else
                    {
                      if (v82.u32[0] > 1uLL)
                      {
                        if (v85 >= v68)
                          v85 %= v68;
                      }
                      else
                      {
                        v85 &= v68 - 1;
                      }
                      if (v85 != v57)
                        break;
                    }
                    v84 = (_QWORD *)*v84;
                  }
                  while (v84);
                }
              }
            }
            v84 = operator new(0x18uLL);
            *v84 = 0;
            v84[1] = v81;
            *((_DWORD *)v84 + 4) = *v79;
            *((_DWORD *)v84 + 5) = 0;
            v86 = (float)(unint64_t)(*((_QWORD *)&v185 + 1) + 1);
            if (!v68 || (float)(v186 * (float)v68) < v86)
            {
              v87 = v69;
              v88 = (v68 & (v68 - 1)) != 0;
              if (v68 < 3)
                v88 = 1;
              v89 = v88 | (2 * v68);
              v90 = vcvtps_u32_f32(v86 / v186);
              if (v89 <= v90)
                prime = (int8x8_t)v90;
              else
                prime = (int8x8_t)v89;
              if (*(_QWORD *)&prime == 1)
              {
                prime = (int8x8_t)2;
                v92 = v162;
              }
              else
              {
                v92 = v162;
                if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
                {
                  prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
                  v92 = *((_QWORD *)&v184 + 1);
                  v68 = *((_QWORD *)&v184 + 1);
                }
              }
              if (*(_QWORD *)&prime <= v68)
              {
                if (*(_QWORD *)&prime < v68)
                {
                  v99 = vcvtps_u32_f32((float)*((unint64_t *)&v185 + 1) / v186);
                  if (v68 < 3
                    || (v100 = (uint8x8_t)vcnt_s8((int8x8_t)v68), v100.i16[0] = vaddlv_u8(v100), v100.u32[0] > 1uLL))
                  {
                    v99 = std::__next_prime(v99);
                  }
                  else
                  {
                    v101 = 1 << -(char)__clz(v99 - 1);
                    if (v99 >= 2)
                      v99 = v101;
                  }
                  if (*(_QWORD *)&prime <= v99)
                    prime = (int8x8_t)v99;
                  if (*(_QWORD *)&prime >= v68)
                  {
                    v92 = *((_QWORD *)&v184 + 1);
                  }
                  else
                  {
                    if (prime)
                      goto LABEL_123;
                    v107 = (void *)v184;
                    *(_QWORD *)&v184 = 0;
                    if (v107)
                      operator delete(v107);
                    v92 = 0;
                    *((_QWORD *)&v184 + 1) = 0;
                  }
                }
              }
              else
              {
LABEL_123:
                if (*(_QWORD *)&prime >> 61)
                  std::__throw_bad_array_new_length[abi:nn180100]();
                v93 = operator new(8 * *(_QWORD *)&prime);
                v94 = (void *)v184;
                *(_QWORD *)&v184 = v93;
                if (v94)
                  operator delete(v94);
                v95 = 0;
                *((int8x8_t *)&v184 + 1) = prime;
                do
                  *(_QWORD *)(v184 + 8 * v95++) = 0;
                while (*(_QWORD *)&prime != v95);
                v96 = (_QWORD **)v185;
                if ((_QWORD)v185)
                {
                  v97 = *(_QWORD *)(v185 + 8);
                  v98 = (uint8x8_t)vcnt_s8(prime);
                  v98.i16[0] = vaddlv_u8(v98);
                  if (v98.u32[0] > 1uLL)
                  {
                    if (v97 >= *(_QWORD *)&prime)
                      v97 %= *(_QWORD *)&prime;
                  }
                  else
                  {
                    v97 &= *(_QWORD *)&prime - 1;
                  }
                  *(_QWORD *)(v184 + 8 * v97) = &v185;
                  for (i = *v96; i; v97 = v103)
                  {
                    v103 = i[1];
                    if (v98.u32[0] > 1uLL)
                    {
                      if (v103 >= *(_QWORD *)&prime)
                        v103 %= *(_QWORD *)&prime;
                    }
                    else
                    {
                      v103 &= *(_QWORD *)&prime - 1;
                    }
                    if (v103 != v97)
                    {
                      if (!*(_QWORD *)(v184 + 8 * v103))
                      {
                        *(_QWORD *)(v184 + 8 * v103) = v96;
                        goto LABEL_148;
                      }
                      *v96 = (_QWORD *)*i;
                      *i = **(_QWORD **)(v184 + 8 * v103);
                      **(_QWORD **)(v184 + 8 * v103) = i;
                      i = v96;
                    }
                    v103 = v97;
LABEL_148:
                    v96 = (_QWORD **)i;
                    i = (_QWORD *)*i;
                  }
                }
                v92 = (unint64_t)prime;
              }
              v162 = v92;
              if ((v92 & (v92 - 1)) != 0)
              {
                v69 = v87;
                if (v92 <= v81)
                {
                  v57 = v81 % v92;
                  v68 = v92;
                }
                else
                {
                  v68 = v92;
                  v57 = v81;
                }
              }
              else
              {
                v57 = ((_DWORD)v92 - 1) & v81;
                v68 = v92;
                v69 = v87;
              }
            }
            v104 = v184;
            v105 = *(_QWORD **)(v184 + 8 * v57);
            if (v105)
            {
              *v84 = *v105;
            }
            else
            {
              *v84 = v185;
              *(_QWORD *)&v185 = v84;
              *(_QWORD *)(v104 + 8 * v57) = &v185;
              if (!*v84)
                goto LABEL_166;
              v106 = *(_QWORD *)(*v84 + 8);
              if ((v68 & (v68 - 1)) != 0)
              {
                if (v106 >= v68)
                  v106 %= v68;
              }
              else
              {
                v106 &= v68 - 1;
              }
              v105 = (_QWORD *)(v184 + 8 * v106);
            }
            *v105 = v84;
LABEL_166:
            ++*((_QWORD *)&v185 + 1);
LABEL_167:
            *((_DWORD *)v84 + 5) = *v80;
            v72 = *v164;
LABEL_168:
            ++v77;
          }
          while (v77 < v72);
          v70 = v159;
          v67 = *(unsigned int *)v159;
          v50 = v152;
          v53 = v153;
          v63 = *(__CFString **)v155;
LABEL_180:
          ++v69;
        }
        while (v69 < v67);
      }
      *(_QWORD *)&v177[1] = 0;
      v108 = CSStore2::Writer::tell(*v50, &v177[1]);
      v109 = (__CFString *)*(id *)&v177[1];
      v52 = v150;
      if (!HIDWORD(v108))
      {
        std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)&v184);
        v59 = v151;
LABEL_254:
        v146 = objc_retainAutorelease(v109);
        v145 = 0;
        v142 = v146;
LABEL_255:

        v61 = v146;
        v63 = v61;
        if (v145)
        {
LABEL_256:
          *(_QWORD *)&v184 = v63;
          v149 = CSStore2::Writer::pwrite(v50, v59, v157, v170, &v184);
          v3 = (unint64_t)(id)v184;

          free(v59);
          if (v149)
          {
            v123 = 1;
            goto LABEL_201;
          }
          v55 = (id)v3;
LABEL_200:
          v53 = objc_retainAutorelease(v55);
          v123 = 0;
          v3 = (unint64_t)v53;
LABEL_201:

          objc_storeStrong(v52, v53);
          v7 = a1;
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v123;
          goto LABEL_202;
        }
LABEL_199:
        free(v59);
        v55 = v61;
        goto LABEL_200;
      }
      v177[0] = 0;
      v59 = v151;
      CSStore2::HashMap<unsigned int,CSStore2::_StringCacheEntry,CSStore2::_StringFunctions,0ull>::Create(&v182, v165, (uint64_t)&v184, v108, v177);
      v143 = v182;
      if (v182)
      {
        v151[20] = v108;
        v180 = v109;
        v144 = CSStore2::Writer::write(*v50, v143, v177[0], &v180);
        v142 = v180;

        ((void (*)(_DWORD *))v183)(v143);
        std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)&v184);
        if (v144)
          goto LABEL_251;
      }
      else
      {
        v147 = (void *)MEMORY[0x1E0CB35C8];
        v178 = *MEMORY[0x1E0CB2938];
        v179 = CFSTR("Line");
        v180 = CFSTR("kCSStoreAllocFailedErr");
        v181 = &unk_1E4E25538;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v180, &v178, 2);
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v147, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -9493, v148);
        v142 = (__CFString *)objc_claimAutoreleasedReturnValue();

        std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)&v184);
      }
      v109 = v142;
      goto LABEL_254;
    }
    v142 = 0;
    v59[20] = -1;
LABEL_251:
    v145 = 1;
    v146 = v63;
    goto LABEL_255;
  }
  v110 = *(FILE ***)(a1 + 56);
  v111 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v113 = *(void **)(v111 + 40);
  v112 = (id *)(v111 + 40);
  v171 = v113;
  v114 = *((_DWORD *)a2 + 1) + 11;
  if (v114 >= 4)
    v115 = v114 & 0xFFFFFFFC;
  else
    v115 = 4;
  v116 = CSStore2::Writer::write(*v110, a2, v115, &v171);
  objc_storeStrong(v112, v171);
  v7 = a1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v116;
LABEL_202:
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v7 + 40) + 8) + 24))
    goto LABEL_242;
  v124 = *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8);
  v125 = (uint64_t *)(v124 + 48);
  v126 = (4 * *(_DWORD *)a2);
  v127 = *(_QWORD *)(v124 + 56);
  if (v127)
  {
    v128 = (uint8x8_t)vcnt_s8((int8x8_t)v127);
    v128.i16[0] = vaddlv_u8(v128);
    if (v128.u32[0] > 1uLL)
    {
      v3 = v126;
      if (v127 <= v126)
        v3 = v126 % v127;
    }
    else
    {
      v3 = ((_DWORD)v127 - 1) & v126;
    }
    v129 = *(void ***)(*v125 + 8 * v3);
    if (v129)
    {
      v130 = *v129;
      if (*v129)
      {
        do
        {
          v131 = v130[1];
          if (v131 == v126)
          {
            if (*((_DWORD *)v130 + 4) == (_DWORD)v126)
            {
              v7 = a1;
              goto LABEL_241;
            }
          }
          else
          {
            if (v128.u32[0] > 1uLL)
            {
              if (v131 >= v127)
                v131 %= v127;
            }
            else
            {
              v131 &= v127 - 1;
            }
            if (v131 != v3)
              break;
          }
          v130 = (_QWORD *)*v130;
        }
        while (v130);
      }
    }
  }
  v130 = operator new(0x18uLL);
  *v130 = 0;
  v130[1] = v126;
  *((_DWORD *)v130 + 4) = v126;
  *((_DWORD *)v130 + 5) = 0;
  v132 = (float)(unint64_t)(*(_QWORD *)(v124 + 72) + 1);
  v133 = *(float *)(v124 + 80);
  if ((((float)(v133 * (float)v127) >= v132) & ~(v127 == 0)) == 0)
  {
    v134 = 1;
    if (v127 >= 3)
      v134 = (v127 & (v127 - 1)) != 0;
    v135 = v134 | (2 * v127);
    v136 = vcvtps_u32_f32(v132 / v133);
    if (v135 <= v136)
      v137 = v136;
    else
      v137 = v135;
    std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__rehash<true>(v124 + 48, v137);
    v127 = *(_QWORD *)(v124 + 56);
    if ((v127 & (v127 - 1)) != 0)
    {
      if (v127 <= v126)
        v3 = v126 % v127;
      else
        v3 = v126;
    }
    else
    {
      v3 = ((_DWORD)v127 - 1) & v126;
    }
  }
  v138 = *v125;
  v139 = *(_QWORD **)(*v125 + 8 * v3);
  v7 = a1;
  if (v139)
  {
    *v130 = *v139;
  }
  else
  {
    *v130 = *(_QWORD *)(v124 + 64);
    *(_QWORD *)(v124 + 64) = v130;
    *(_QWORD *)(v138 + 8 * v3) = v124 + 64;
    if (!*v130)
      goto LABEL_240;
    v140 = *(_QWORD *)(*v130 + 8);
    if ((v127 & (v127 - 1)) != 0)
    {
      if (v140 >= v127)
        v140 %= v127;
    }
    else
    {
      v140 &= v127 - 1;
    }
    v139 = (_QWORD *)(*v125 + 8 * v140);
  }
  *v139 = v130;
LABEL_240:
  ++*(_QWORD *)(v124 + 72);
LABEL_241:
  *((_DWORD *)v130 + 5) = v167;
LABEL_242:
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v7 + 40) + 8) + 24))
    *a3 = 1;
}

void sub_1A4E6F360(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  uint64_t v16;

  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table(v16 - 144);
  free(a11);

  _Unwind_Resume(a1);
}

BOOL CSStore2::Writer::write(FILE *__stream, const void *a2, size_t __nitems, _QWORD *a4)
{
  uint64_t v5;
  size_t v6;
  size_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v5 = __nitems;
  v6 = CSStore2::Writer::IO<unsigned long,void const*,unsigned long,unsigned long,__sFILE *>(a2, __nitems, __stream);
  v7 = v6;
  if (a4 && v6 != v5)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *__error();
    v12[0] = *MEMORY[0x1E0CB2938];
    v12[1] = CFSTR("Line");
    v13[0] = CFSTR("errno");
    v13[1] = &unk_1E4E25268;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v9, v10);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7 == v5;
}

void sub_1A4E6F594(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

size_t CSStore2::Writer::IO<unsigned long,void const*,unsigned long,unsigned long,__sFILE *>(const void *a1, size_t __nitems, FILE *__stream)
{
  CSStore2 *v3;
  size_t v6;
  uint64_t i;
  _BYTE v9[96];
  size_t v10;
  FILE *v11;
  size_t v12;
  uint64_t v13;
  void *v14[2];
  char v15;
  void *__p;
  char v17;
  _QWORD _F8[26];

  v6 = fwrite(a1, 1uLL, __nitems, __stream);
  v10 = v6;
  if (CSStore2::Writer::logIO == 1)
  {
    v12 = __nitems;
    v13 = 1;
    v11 = __stream;
    std::ostringstream::basic_ostringstream[abi:nn180100]((uint64_t)v14);
    std::ostream::operator<<();
    std::stringbuf::str();
    v14[0] = *(void **)MEMORY[0x1E0DE4F60];
    *(void **)((char *)v14 + *((_QWORD *)v14[0] - 3)) = *(void **)(MEMORY[0x1E0DE4F60] + 24);
    v14[1] = (void *)(MEMORY[0x1E0DE4FB8] + 16);
    if (v17 < 0)
      operator delete(__p);
    std::streambuf::~streambuf();
    std::ostream::~ostream();
    MEMORY[0x1A85AA10C](_F8);
    CSStore2::Writer::toString<unsigned long>();
    CSStore2::Writer::toString<unsigned long>();
    CSStore2::Writer::toString<__sFILE *>();
    CSStore2::Writer::toString<unsigned long>();
    CSStore2::Writer::logFunctionCall(*(CSStore2 **)(_F8[25] + 8), v3, (CSStore2 *)MEMORY[0x1E0C835E0], (uint64_t)v9, 4, (uint64_t)v14);
    if (v15 < 0)
      operator delete(v14[0]);
    for (i = 0; i != -96; i -= 24)
    {
      if ((char)v9[i + 95] < 0)
        operator delete(*(void **)&v9[i + 72]);
    }
  }
  return v6;
}

void sub_1A4E6F748(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *__p,uint64_t a27,int a28,__int16 a29,char a30,char a31)
{
  uint64_t v32;

  if (a31 < 0)
    operator delete(__p);
  v32 = 0;
  while (1)
  {
    if (*((char *)&a21 + v32 + 7) < 0)
      operator delete(*(void **)((char *)&a19 + v32));
    v32 -= 24;
    if (v32 == -96)
      _Unwind_Resume(exception_object);
  }
}

uint64_t CSStore2::Writer::toString<unsigned long>()
{
  _QWORD v1[11];
  char v2;
  uint64_t v3;

  std::ostringstream::basic_ostringstream[abi:nn180100]((uint64_t)v1);
  std::ostream::operator<<();
  std::stringbuf::str();
  v1[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v1 + *(_QWORD *)(v1[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v1[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v2 < 0)
    operator delete((void *)v1[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1A85AA10C](&v3);
}

void sub_1A4E6F87C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void ___ZN8CSStore217GarbageCollection8GetGCLogEv_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.coreservicesstore", "GC");
  v1 = (void *)CSStore2::GarbageCollection::GetGCLog(void)::result;
  CSStore2::GarbageCollection::GetGCLog(void)::result = (uint64_t)v0;

}

void ___ZN8CSStore217GarbageCollection8IsNeededERKNS_5StoreEh_block_invoke(uint64_t a1, unsigned int *a2, _BYTE *a3)
{
  uint64_t v3;
  uint64_t v5;
  char v8;
  CSStore2::GarbageCollection *Statistics;
  unsigned int v10;
  NSObject *v11;
  __CFString *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2[19];
  if ((_DWORD)v3 != -1)
  {
    v5 = *(_QWORD *)(**(_QWORD **)(a1 + 40) + 8);
    if (*(_DWORD *)(v5 + 12) > v3 && (*(_DWORD *)(v5 + v3) - 1) <= 0x1FFE)
    {
      v8 = *(_BYTE *)(a1 + 48);
      Statistics = (CSStore2::GarbageCollection *)CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::GetStatistics((unsigned int *)(v5 + v3));
      v10 = (v8 & 4) != 0 ? 50 : 5;
      if (Statistics / HIDWORD(Statistics) > v10)
      {
        CSStore2::GarbageCollection::GetGCLog(Statistics);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v12 = objc_retainAutorelease((id)CSStore2::Table::copyCFName((CSStore2::Table *)a2));
          v13 = 136446210;
          v14 = -[__CFString UTF8String](v12, "UTF8String");
          _os_log_impl(&dword_1A4E5A000, v11, OS_LOG_TYPE_INFO, "Identifier cache on table '%{public}s' is unbalanced. Will collect.", (uint8_t *)&v13, 0xCu);

        }
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
        *a3 = 1;
      }
    }
  }
}

void sub_1A4E6FA00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::GetStatistics(unsigned int *a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unsigned int *v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;

  v1 = *a1;
  v2 = (unint64_t)((8 * (_DWORD)v1) | 4u) << 32;
  if (!(_DWORD)v1)
    return 0;
  LODWORD(v3) = 0;
  v4 = a1 + 1;
  v5 = *a1;
  do
  {
    v7 = *v4;
    v4 += 2;
    v6 = v7;
    v3 = v7 + v3;
    if (v7 <= v2)
      v8 = v2;
    else
      v8 = v6;
    v2 = v8 | ((unint64_t)(HIDWORD(v2) + 8 * v6) << 32);
    --v5;
  }
  while (v5);
  return v3 | (v1 << 32);
}

uint64_t CSStore2::Store::collectGarbage(CSStore2::Store *this, CSStore2::Store *a2)
{
  void *v4;
  void *v5;
  void *v6;
  CSStore2 *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  FILE *v12;
  int v13;
  CSStore2 *v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  CSStore2 *v18;
  int v19;
  NSObject *v20;
  char *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  NSObject *v25;
  int v26;
  int *v27;
  char *v28;
  const char *v29;
  NSObject *v30;
  CSStore2 *v31;
  NSObject *v32;
  void *v33;
  id v34;
  void *v35;
  CSStore2::VM *v36;
  void *v37;
  void *Copy;
  int v39;
  int *v40;
  char *v41;
  int v42;
  int *v43;
  char *v44;
  CSStore2 *v45;
  int v46;
  char *v47;
  CSStore2 *v48;
  NSObject *v49;
  id v51;
  FILE *v52;
  __int16 v53;
  stat buf[7];
  uint8_t v55[4];
  _BYTE v56[20];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  if (CSStore2::GarbageCollection::IsNeeded(this, a2))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "temporaryDirectory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("ls-XXXXXXXXXXXXXXXX"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_26;
    bzero(buf, 0x400uLL);
    CSStore2::GetLog((CSStore2 *)objc_msgSend(v6, "getFileSystemRepresentation:maxLength:", buf, 1024));
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v55 = 136380675;
      *(_QWORD *)v56 = buf;
      _os_log_debug_impl(&dword_1A4E5A000, v8, OS_LOG_TYPE_DEBUG, "Creating temporary file for store writer at %{private}s", v55, 0xCu);
    }

    if ((int)softLinkMKBDeviceUnlockedSinceBoot() < 1)
      v9 = CSStore2::Writer::IO<int,char *>((char *)buf);
    else
      v9 = CSStore2::Writer::IO<int,char *,int,int>((char *)buf);
    v11 = v9;
    if ((v9 & 0x80000000) != 0)
    {
      CSStore2::GetLog((CSStore2 *)v9);
      v25 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        goto LABEL_24;
      v26 = *__error();
      v27 = __error();
      v28 = strerror(*v27);
      *(_DWORD *)v55 = 67109378;
      *(_DWORD *)v56 = v26;
      *(_WORD *)&v56[4] = 2082;
      *(_QWORD *)&v56[6] = v28;
      v29 = "Failed to create file descriptor for store writer: %i (%{public}s).";
    }
    else
    {
      v12 = CSStore2::Writer::IO<__sFILE *,int,char const*>(v9);
      if (v12)
      {

        v51 = 0;
        v52 = v12;
        v53 = 257;
        v13 = CSStore2::GarbageCollection::Collect(this, &v52, a2, &v51);
        v14 = (CSStore2 *)v51;
        v15 = v14;
        if (!v13)
        {
          CSStore2::GetLog(v14);
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            buf[0].st_dev = 138543362;
            *(_QWORD *)&buf[0].st_mode = v15;
            _os_log_error_impl(&dword_1A4E5A000, v32, OS_LOG_TYPE_ERROR, "Error running garbage collection: %{public}@", (uint8_t *)buf, 0xCu);
          }
          goto LABEL_51;
        }
        CSStore2::Writer::sync((void **)&v52, 0);
        v16 = CSStore2::Writer::IO<int,__sFILE *>((CSStore2 *)MEMORY[0x1E0C833B0], v52);
        v17 = v16;
        if ((v16 & 0x80000000) != 0)
        {
          CSStore2::GetLog((CSStore2 *)v16);
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            buf[0].st_dev = 134217984;
            *(_QWORD *)&buf[0].st_mode = v52;
            _os_log_error_impl(&dword_1A4E5A000, v20, OS_LOG_TYPE_ERROR, "Unsupported: file handle %p had neither an underlying buffer nor a file descriptor.", (uint8_t *)buf, 0xCu);
          }
          goto LABEL_48;
        }
        if (CSStore2::Writer::IO<int,int,stat *>(v16, buf))
        {
          v18 = (CSStore2 *)__error();
          v19 = *(_DWORD *)v18;
          CSStore2::GetLog(v18);
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            v21 = strerror(v19);
            *(_DWORD *)v55 = 67109634;
            *(_DWORD *)v56 = v17;
            *(_WORD *)&v56[4] = 1024;
            *(_DWORD *)&v56[6] = v19;
            *(_WORD *)&v56[10] = 2082;
            *(_QWORD *)&v56[12] = v21;
            v22 = "Failed to stat fd %i: error %i %{public}s.";
LABEL_17:
            v23 = v20;
            v24 = 24;
LABEL_42:
            _os_log_error_impl(&dword_1A4E5A000, v23, OS_LOG_TYPE_ERROR, v22, v55, v24);
          }
        }
        else
        {
          if ((unint64_t)(buf[0].st_size - 1) <= 0x7FFFFFFFFFFFFFFDLL)
          {
            v33 = CSStore2::Writer::IO<void *,void *,unsigned long,int,int,int,long long>(buf[0].st_size, v17);
            if (v33 != (void *)-1)
            {
              v34 = objc_alloc(MEMORY[0x1E0C99D50]);
              v35 = (void *)objc_msgSend(v34, "initWithBytesNoCopy:length:deallocator:", v33, buf[0].st_size, *MEMORY[0x1E0CB2910]);
              if (v35)
              {
                v32 = objc_retainAutorelease(v35);
                v36 = (CSStore2::VM *)-[NSObject bytes](v32, "bytes");
                v37 = (void *)-[NSObject length](v32, "length");
                Copy = (void *)CSStore2::VM::AllocateCopy(v36, v37, (CSStore2::VM *)v37);
                if (Copy)
                  CSStore2::Store::setBytesNoCopy(this, Copy, -[NSObject length](v32, "length"));
                v10 = 1;
                goto LABEL_52;
              }
              CSStore2::GetLog(0);
              v20 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                goto LABEL_48;
              *(_DWORD *)v55 = 67109120;
              *(_DWORD *)v56 = v17;
              v22 = "Failed to create NSData for mapped file %i.";
              v23 = v20;
              v24 = 8;
              goto LABEL_42;
            }
            v45 = (CSStore2 *)__error();
            v46 = *(_DWORD *)v45;
            CSStore2::GetLog(v45);
            v20 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              goto LABEL_48;
            v47 = strerror(v46);
            *(_DWORD *)v55 = 67109634;
            *(_DWORD *)v56 = v17;
            *(_WORD *)&v56[4] = 1024;
            *(_DWORD *)&v56[6] = v46;
            *(_WORD *)&v56[10] = 2082;
            *(_QWORD *)&v56[12] = v47;
            v22 = "Failed to map fd %i: error %i %{public}s.";
            goto LABEL_17;
          }
          CSStore2::GetLog((CSStore2 *)buf[0].st_size);
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v55 = 134217984;
            *(_QWORD *)v56 = buf[0].st_size;
            v22 = "Wrote a ludicrously long stream (%lli bytes) that cannot fit back in an NSData.";
            v23 = v20;
            v24 = 12;
            goto LABEL_42;
          }
        }
LABEL_48:

        CSStore2::GetLog(v48);
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf[0].st_dev) = 0;
          _os_log_impl(&dword_1A4E5A000, v49, OS_LOG_TYPE_DEFAULT, "Unexpected: garbage collection succeeded, but did not get an NSData object.", (uint8_t *)buf, 2u);
        }

        v32 = 0;
LABEL_51:
        v10 = 0;
LABEL_52:

LABEL_53:
        CSStore2::Writer::~Writer((void **)&v52);
        return v10;
      }
      CSStore2::GetLog(0);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v39 = *__error();
        v40 = __error();
        v41 = strerror(*v40);
        *(_DWORD *)v55 = 67109378;
        *(_DWORD *)v56 = v39;
        *(_WORD *)&v56[4] = 2082;
        *(_QWORD *)&v56[6] = v41;
        _os_log_error_impl(&dword_1A4E5A000, v30, OS_LOG_TYPE_ERROR, "Failed to create file handle from file descriptor for store writer: %i (%{public}s).", v55, 0x12u);
      }

      v31 = (CSStore2 *)CSStore2::Writer::IO<int,int>((CSStore2 *)MEMORY[0x1E0C82688], v11);
      if (!(_DWORD)v31)
        goto LABEL_25;
      CSStore2::GetLog(v31);
      v25 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
LABEL_24:

LABEL_25:
LABEL_26:
        v52 = 0;
        v53 = 257;
        CSStore2::GetLog(v7);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf[0].st_dev) = 0;
          _os_log_error_impl(&dword_1A4E5A000, v15, OS_LOG_TYPE_ERROR, "Error running garbage collection: failed to create temporary file handle", (uint8_t *)buf, 2u);
        }
        v10 = 0;
        goto LABEL_53;
      }
      v42 = *__error();
      v43 = __error();
      v44 = strerror(*v43);
      *(_DWORD *)v55 = 67109378;
      *(_DWORD *)v56 = v42;
      *(_WORD *)&v56[4] = 2082;
      *(_QWORD *)&v56[6] = v44;
      v29 = "Failed to close file descriptor for store writer: %i (%{public}s).";
    }
    _os_log_error_impl(&dword_1A4E5A000, v25, OS_LOG_TYPE_ERROR, v29, v55, 0x12u);
    goto LABEL_24;
  }
  return 1;
}

void sub_1A4E70140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  void *v3;
  void *v4;
  va_list va;

  va_start(va, a3);

  CSStore2::Writer::~Writer((void **)va);
  _Unwind_Resume(a1);
}

uint64_t CSStore2::Writer::IO<int,int,stat *>(int a1, stat *a2)
{
  CSStore2 *v2;
  uint64_t v4;
  uint64_t i;
  _BYTE v7[48];
  int v8;
  int v9;
  void *v10[2];
  char v11;
  void *__p;
  char v13;
  _QWORD _A8[26];

  v4 = fstat(a1, a2);
  v8 = v4;
  if (CSStore2::Writer::logIO == 1)
  {
    v9 = a1;
    CSStore2::Writer::toString<int>();
    std::ostringstream::basic_ostringstream[abi:nn180100]((uint64_t)v10);
    std::ostream::operator<<();
    std::stringbuf::str();
    v10[0] = *(void **)MEMORY[0x1E0DE4F60];
    *(void **)((char *)v10 + *((_QWORD *)v10[0] - 3)) = *(void **)(MEMORY[0x1E0DE4F60] + 24);
    v10[1] = (void *)(MEMORY[0x1E0DE4FB8] + 16);
    if (v13 < 0)
      operator delete(__p);
    std::streambuf::~streambuf();
    std::ostream::~ostream();
    MEMORY[0x1A85AA10C](_A8);
    CSStore2::Writer::toString<int>();
    CSStore2::Writer::logFunctionCall(*(CSStore2 **)(_A8[25] + 8), v2, (CSStore2 *)MEMORY[0x1E0C83560], (uint64_t)v7, 2, (uint64_t)v10);
    if (v11 < 0)
      operator delete(v10[0]);
    for (i = 0; i != -48; i -= 24)
    {
      if ((char)v7[i + 47] < 0)
        operator delete(*(void **)&v7[i + 24]);
    }
  }
  return v4;
}

void sub_1A4E70334(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  uint64_t v25;

  if (a24 < 0)
    operator delete(__p);
  v25 = 0;
  while (1)
  {
    if (*((char *)&a17 + v25 + 7) < 0)
      operator delete(*(void **)((char *)&a15 + v25));
    v25 -= 24;
    if (v25 == -48)
      _Unwind_Resume(exception_object);
  }
}

void *CSStore2::Writer::IO<void *,void *,unsigned long,int,int,int,long long>(size_t a1, int a2)
{
  CSStore2 *v2;
  void *v5;
  uint64_t i;
  void *__p;
  char v9;
  _BYTE v10[144];
  void *v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  size_t v16;
  uint64_t vars0;

  v5 = mmap(0, a1, 1, 2, a2, 0);
  v11 = v5;
  if (CSStore2::Writer::logIO == 1)
  {
    __p = 0;
    v16 = a1;
    v14 = 2;
    v15 = 1;
    v13 = a2;
    v12 = 0;
    CSStore2::Writer::toString<void *>();
    CSStore2::Writer::toString<unsigned long>();
    CSStore2::Writer::toString<int>();
    CSStore2::Writer::toString<int>();
    CSStore2::Writer::toString<int>();
    CSStore2::Writer::toString<long long>();
    CSStore2::Writer::toString<void *>();
    CSStore2::Writer::logFunctionCall(*(CSStore2 **)(vars0 + 8), v2, (CSStore2 *)MEMORY[0x1E0C841D8], (uint64_t)v10, 6, (uint64_t)&__p);
    if (v9 < 0)
      operator delete(__p);
    for (i = 0; i != -144; i -= 24)
    {
      if ((char)v10[i + 143] < 0)
        operator delete(*(void **)&v10[i + 120]);
    }
  }
  return v5;
}

void sub_1A4E70510(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v16;

  if (a14 < 0)
    operator delete(__p);
  v16 = 0;
  while (1)
  {
    if (*(&a15 + v16 + 143) < 0)
      operator delete(*(void **)(&a15 + v16 + 120));
    v16 -= 24;
    if (v16 == -144)
      _Unwind_Resume(exception_object);
  }
}

uint64_t CSStore2::Writer::toString<void *>()
{
  _QWORD v1[11];
  char v2;
  uint64_t v3;

  std::ostringstream::basic_ostringstream[abi:nn180100]((uint64_t)v1);
  std::ostream::operator<<();
  std::stringbuf::str();
  v1[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v1 + *(_QWORD *)(v1[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v1[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v2 < 0)
    operator delete((void *)v1[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1A85AA10C](&v3);
}

void sub_1A4E70634(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

FILE *CSStore2::Writer::IO<__sFILE *,int,char const*>(int a1)
{
  CSStore2 *v1;
  FILE *v3;
  uint64_t i;
  void *__p[2];
  char v7;
  _BYTE v8[24];
  _QWORD v9[4];
  int v10;
  uint64_t vars0;

  v3 = fdopen(a1, "w");
  v9[3] = v3;
  if (CSStore2::Writer::logIO == 1)
  {
    v10 = a1;
    __p[0] = "w";
    CSStore2::Writer::toString<int>();
    CSStore2::Writer::toString<char const*>((uint64_t)v9, (const char **)__p);
    CSStore2::Writer::toString<__sFILE *>();
    CSStore2::Writer::logFunctionCall(*(CSStore2 **)(vars0 + 8), v1, (CSStore2 *)MEMORY[0x1E0C83318], (uint64_t)v8, 2, (uint64_t)__p);
    if (v7 < 0)
      operator delete(__p[0]);
    for (i = 0; i != -6; i -= 3)
    {
      if (SHIBYTE(v9[i + 2]) < 0)
        operator delete(*(void **)&v8[i * 8 + 24]);
    }
  }
  return v3;
}

void sub_1A4E70730(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  uint64_t v28;

  if (a15 < 0)
    operator delete(__p);
  v28 = 0;
  while (1)
  {
    if (*(&a27 + v28) < 0)
      operator delete(*(void **)((char *)&a22 + v28));
    v28 -= 24;
    if (v28 == -48)
      _Unwind_Resume(exception_object);
  }
}

uint64_t CSStore2::Writer::IO<int,char *,int,int>(char *a1)
{
  CSStore2 *v1;
  uint64_t v3;
  uint64_t i;
  void *__p[2];
  char v7;
  _BYTE v8[76];
  int v9;
  int v10;
  int v11;
  uint64_t vars0;

  v3 = mkstemp_dprotected_np(a1, 3, 0);
  v9 = v3;
  if (CSStore2::Writer::logIO == 1)
  {
    __p[0] = a1;
    v10 = 0;
    v11 = 3;
    CSStore2::Writer::toString<char *>((uint64_t)v8, (const char **)__p);
    CSStore2::Writer::toString<int>();
    CSStore2::Writer::toString<int>();
    CSStore2::Writer::toString<int>();
    CSStore2::Writer::logFunctionCall(*(CSStore2 **)(vars0 + 8), v1, (CSStore2 *)MEMORY[0x1E0C841A8], (uint64_t)v8, 3, (uint64_t)__p);
    if (v7 < 0)
      operator delete(__p[0]);
    for (i = 0; i != -72; i -= 24)
    {
      if ((char)v8[i + 71] < 0)
        operator delete(*(void **)&v8[i + 48]);
    }
  }
  return v3;
}

void sub_1A4E70890(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v16;

  if (a14 < 0)
    operator delete(__p);
  v16 = 0;
  while (1)
  {
    if (*(&a15 + v16 + 71) < 0)
      operator delete(*(void **)(&a15 + v16 + 48));
    v16 -= 24;
    if (v16 == -72)
      _Unwind_Resume(exception_object);
  }
}

uint64_t CSStore2::Writer::IO<int,char *>(char *a1)
{
  CSStore2 *v1;
  uint64_t v3;
  void *__p[2];
  char v6;
  void *v7[2];
  char v8;
  int v9;
  uint64_t vars0;

  v3 = mkstemp(a1);
  v9 = v3;
  if (CSStore2::Writer::logIO == 1)
  {
    __p[0] = a1;
    CSStore2::Writer::toString<char *>((uint64_t)v7, (const char **)__p);
    CSStore2::Writer::toString<int>();
    CSStore2::Writer::logFunctionCall(*(CSStore2 **)(vars0 + 8), v1, (CSStore2 *)MEMORY[0x1E0C841A0], (uint64_t)v7, 1, (uint64_t)__p);
    if (v6 < 0)
      operator delete(__p[0]);
    if (v8 < 0)
      operator delete(v7[0]);
  }
  return v3;
}

void sub_1A4E709B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0)
    operator delete(__p);
  if (a21 < 0)
    operator delete(a16);
  _Unwind_Resume(exception_object);
}

uint64_t initMKBDeviceUnlockedSinceBoot(void)
{
  if (MobileKeyBagLibrary(void)::sOnce != -1)
    dispatch_once(&MobileKeyBagLibrary(void)::sOnce, &__block_literal_global_163);
  softLinkMKBDeviceUnlockedSinceBoot = (uint64_t (*)(void))dlsym((void *)MobileKeyBagLibrary(void)::sLib, "MKBDeviceUnlockedSinceBoot");
  return softLinkMKBDeviceUnlockedSinceBoot();
}

char *CSStore2::Store::embraceAndExtend(CSStore2::Store *this, char *a2, const void *a3, unsigned int a4)
{
  char *v4;
  const void *v6;
  uint64_t v7;
  unint64_t v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  BOOL v12;
  unsigned int v13;
  unsigned int v15;
  unint64_t v16;
  NSUInteger v18;
  uint64_t v19;

  v4 = a2;
  if (a3 >= a4)
  {
    LODWORD(v6) = (_DWORD)a3 - a4;
LABEL_6:
    CSStore2::Store::assertNotEnumeratingUnits((uint64_t)this);
    if (((_DWORD)v6 + 3) >= 4)
      v9 = ((_DWORD)v6 + 3) & 0xFFFFFFFC;
    else
      v9 = 4;
    v10 = *(_QWORD *)(*(_QWORD *)this + 8);
    v11 = *(_DWORD *)(v10 + 16);
    v12 = v11 >= v9;
    v13 = v11 - v9;
    if (!v12)
      v13 = 0;
    *(_DWORD *)(v10 + 16) = v13;
    ++*(_DWORD *)(v10 + 8);
    return v4;
  }
  v6 = a3;
  if (a2)
  {
    v7 = *(_QWORD *)this;
    if (*(_QWORD *)this)
      v8 = *(_QWORD *)(v7 + 8);
    else
      v8 = 0;
    v15 = -1;
    v12 = (unint64_t)a2 >= v8;
    v16 = (unint64_t)&a2[-v8];
    if (v12 && !HIDWORD(v16))
    {
      if ((v16 + 1) > *(_DWORD *)(*(_QWORD *)(v7 + 8) + 12) || v16 == -1)
        v15 = -1;
      else
        v15 = v16;
    }
  }
  else
  {
    v15 = -1;
  }
  v18 = CSStore2::Store::extend(this, a4);
  v4 = (char *)v18;
  if (v18)
  {
    if (v15 != -1)
    {
      v19 = *(_QWORD *)(*(_QWORD *)this + 8);
      if (v19 && *(_DWORD *)(v19 + 12) > v15)
        CSStore2::VM::Copy(v18, v19 + v15, v6);
    }
    goto LABEL_6;
  }
  return v4;
}

Unit *CSStore2::Store::allocateTable(CSStore2::Store *this, NSString *a2, int a3, NSString *a4)
{
  NSString *v7;
  NSString *v8;
  uint64_t v9;
  Unit *Unit;
  Unit *v11;
  uint64_t v12;
  unint64_t v13;
  unsigned int v15;
  BOOL v16;
  unint64_t v17;
  NSUInteger v19;
  uint64_t v20;
  NSUInteger v21;
  int v22;
  NSUInteger v23;
  _OWORD v25[2];
  int v26;

  v7 = a2;
  v8 = v7;
  if (v7 && CSStore2::Table::IsNameAllowed((CSStore2::Table *)v7, a4))
  {
    v9 = *(_QWORD *)this;
    if (*(_QWORD *)this)
      v9 = *(_QWORD *)(v9 + 8);
    Unit = CSStore2::Store::allocateUnit(this, (CSStore2::Table *)(v9 + 20), a3 + 72, 0);
    v11 = Unit;
    if (Unit)
    {
      v12 = *(_QWORD *)this;
      if (*(_QWORD *)this)
        v13 = *(_QWORD *)(v12 + 8);
      else
        v13 = 0;
      v15 = -1;
      v16 = (unint64_t)Unit >= v13;
      v17 = (unint64_t)Unit - v13;
      if (v16 && !HIDWORD(v17))
      {
        if ((v17 + 1) > *(_DWORD *)(*(_QWORD *)(v12 + 8) + 12) || v17 == -1)
          v15 = -1;
        else
          v15 = v17;
      }
      memset(v25, 0, sizeof(v25));
      v26 = 1065353216;
      v19 = CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::Create(this, (uint64_t)v25);
      std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)v25);
      if (v19)
      {
        v20 = *(_QWORD *)this;
        if (v15 == -1)
        {
          v11 = 0;
          if (v20)
            v21 = *(_QWORD *)(v20 + 8);
          else
            v21 = 0;
        }
        else
        {
          v21 = *(_QWORD *)(v20 + 8);
          if (*(_DWORD *)(v21 + 12) <= v15)
            v11 = 0;
          else
            v11 = (Unit *)(v21 + v15);
        }
        v22 = -1;
        v16 = v19 >= v21;
        v23 = v19 - v21;
        if (v16 && !HIDWORD(v23))
        {
          if ((v23 + 1) > *(_DWORD *)(*(_QWORD *)(v20 + 8) + 12) || v23 == -1)
            v22 = -1;
          else
            v22 = v23;
        }
        *(_DWORD *)&v11->var3[68] = v22;
        CSStore2::Table::setName((CSStore2::Table *)v11, v8);
        CSStore2::Store::_dataDidMove(this);
      }
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void sub_1A4E70D00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;

  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)&a9);

  _Unwind_Resume(a1);
}

BOOL CSStore2::Table::IsNameAllowed(CSStore2::Table *this, NSString *a2)
{
  int v2;
  CSStore2::Table *v3;
  _BOOL8 v4;

  v2 = (int)a2;
  v3 = this;
  if (-[CSStore2::Table length](v3, "length"))
    v4 = (!v2 || -[CSStore2::Table characterAtIndex:](v3, "characterAtIndex:", 0) != 60)
      && strlen((const char *)-[CSStore2::Table UTF8String](objc_retainAutorelease(v3), "UTF8String")) < 0x31;
  else
    v4 = 1;

  return v4;
}

void sub_1A4E70D98(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

Unit *CSStore2::Store::allocateUnit(CSStore2::Store *this, CSStore2::Table *a2, int a3, unsigned int a4)
{
  uint64_t v7;
  unint64_t v8;
  unsigned int v9;
  BOOL v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  CSStore2::Table *v15;
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  NSObject *v21;
  __CFString *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v7 = *(_QWORD *)this;
    if (*(_QWORD *)this)
      v8 = *(_QWORD *)(v7 + 8);
    else
      v8 = 0;
    v9 = -1;
    v10 = (unint64_t)a2 >= v8;
    v11 = (unint64_t)a2 - v8;
    if (v10 && !HIDWORD(v11))
    {
      if ((v11 + 1) > *(_DWORD *)(*(_QWORD *)(v7 + 8) + 12) || v11 == -1)
        v9 = -1;
      else
        v9 = v11;
    }
  }
  else
  {
    v9 = -1;
  }
  v13 = CSStore2::Store::extend(this, a3 + 8);
  if (!v13)
    return 0;
  if (v9 == -1 || (v14 = *(_QWORD *)(*(_QWORD *)this + 8), *(_DWORD *)(v14 + 12) <= v9))
  {
    v15 = 0;
    if (!a4)
    {
LABEL_21:
      v16 = *((_DWORD *)v15 + 18);
      if (v16 == 0x3FFFFFFF)
      {
        CSStore2::GetLog((CSStore2 *)v13);
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        {
          v22 = objc_retainAutorelease((id)CSStore2::Table::copyCFName(v15));
          v23 = -[__CFString UTF8String](v22, "UTF8String");
          v24 = (4 * *(_DWORD *)v15);
          v25 = 136446466;
          v26 = v23;
          v27 = 2048;
          v28 = v24;
          _os_log_fault_impl(&dword_1A4E5A000, v21, OS_LOG_TYPE_FAULT, "Ran out of unit IDs for table %{public}s (%llx): aborting.", (uint8_t *)&v25, 0x16u);

        }
        abort();
      }
      v17 = v16 + 1;
      *((_DWORD *)v15 + 18) = v17;
      a4 = 4 * v17;
    }
  }
  else
  {
    v15 = (CSStore2::Table *)(v14 + v9);
    if (!a4)
      goto LABEL_21;
  }
  v18 = *(_QWORD *)this;
  if (*(_QWORD *)this)
    v18 = *(_QWORD *)(v18 + 8);
  if (v15 == (CSStore2::Table *)(v18 + 20))
  {
    *(_BYTE *)(v13 + 8) = 0;
    *(_QWORD *)(v13 + 72) = 0xFFFFFFFF00000000;
    v19 = 0x40000000;
  }
  else
  {
    v19 = 0;
  }
  *(_DWORD *)v13 = v19 | (a4 >> 2);
  *(_DWORD *)(v13 + 4) = a3;
  return CSStore2::Store::setUnitAddress((CSStore2 **)this, v15, a4 & 0xFFFFFFFC, (Unit *)v13);
}

void sub_1A4E70FB8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

Unit *CSStore2::Store::setUnitAddress(CSStore2 **this, CSStore2::Table *a2, unsigned int a3, Unit *a4)
{
  CSStore2 *v6;
  unint64_t v7;
  unsigned int v8;
  BOOL v9;
  unint64_t v10;
  uint64_t v12;
  CSStore2 *v13;
  uint64_t v14;
  _DWORD *v15;
  _DWORD *v16;
  unsigned int v17;
  _DWORD *v18;
  _DWORD *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  _DWORD *v28;
  unsigned int v29;
  unint64_t v30;
  unsigned int v31;
  char *v32;
  char *v34;
  uint64_t v35;
  _DWORD *v36;
  CSStore2 *v37;
  unint64_t v38;
  int v39;
  unint64_t v40;
  unsigned int *v42;
  uint64_t v43;
  uint64_t v44;

  if (a4)
  {
    v6 = *this;
    if (*this)
      v7 = *((_QWORD *)v6 + 1);
    else
      v7 = 0;
    v8 = -1;
    v9 = (unint64_t)a4 >= v7;
    v10 = (unint64_t)a4 - v7;
    if (v9 && !HIDWORD(v10))
    {
      if ((v10 + 1) > *(_DWORD *)(*((_QWORD *)v6 + 1) + 12) || v10 == -1)
        v8 = -1;
      else
        v8 = v10;
    }
  }
  else
  {
    v8 = -1;
  }
  v12 = *((unsigned int *)a2 + 19);
  if ((_DWORD)v12 != -1)
  {
    v13 = *this;
    v14 = *((_QWORD *)*this + 1);
    if (*(_DWORD *)(v14 + 12) > v12)
    {
      v15 = (_DWORD *)(v14 + v12);
      if (a4)
      {
        if (a3)
        {
          v16 = CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::Find(v13, (int *)(v14 + v12), a3);
          v17 = a3;
          if (v16)
          {
            *v16 = v8;
            goto LABEL_72;
          }
        }
        else
        {
          if (v8 != -1)
          {
LABEL_73:
            v44 = *((_QWORD *)*this + 1);
            if (*(_DWORD *)(v44 + 12) > v8)
              return (Unit *)(v44 + v8);
            return 0;
          }
          v17 = 0;
        }
        v19 = &v15[2 * ((unsigned __int16)(v17 >> 2) % *v15)];
        v20 = (unint64_t)(v19 + 1);
        v21 = v19[2];
        if ((_DWORD)v21 == -1)
        {
          v25 = 0;
        }
        else
        {
          v22 = *((_QWORD *)*this + 1);
          v23 = *(_DWORD *)(v22 + 12) > v21;
          v24 = (char *)(v22 + v21);
          if (v23)
            v25 = v24;
          else
            v25 = 0;
        }
        v26 = *(unsigned int *)v20;
        if ((_DWORD)v26)
        {
          v27 = 0;
          v28 = v25 + 4;
          while (*(v28 - 1) && *v28 != -1)
          {
            ++v27;
            v28 += 2;
            if (v26 == v27)
              goto LABEL_36;
          }
          v32 = &v25[8 * v27];
          *(_DWORD *)v32 = v17;
          *((_DWORD *)v32 + 1) = v8;
LABEL_72:
          if (v8 == -1)
            return 0;
          goto LABEL_73;
        }
LABEL_36:
        v29 = v26 + 8;
        if (*this)
        {
          v30 = *((_QWORD *)*this + 1);
          v31 = -1;
          v9 = v20 >= v30;
          v20 -= v30;
          if (!v9 || HIDWORD(v20))
            goto LABEL_51;
        }
        else
        {
          if (HIDWORD(v20))
          {
            v31 = -1;
            goto LABEL_51;
          }
          v30 = MEMORY[8];
        }
        if ((v20 + 1) > *(_DWORD *)(v30 + 12) || v20 == -1)
          v31 = -1;
        else
          v31 = v20;
LABEL_51:
        v34 = CSStore2::Store::embraceAndExtend((CSStore2::Store *)this, v25, (const void *)(8 * v26), 8 * v29);
        if (v31 == -1 || (v35 = *((_QWORD *)*this + 1), *(_DWORD *)(v35 + 12) <= v31))
          v36 = 0;
        else
          v36 = (_DWORD *)(v35 + v31);
        if (!v34)
        {
          v36[1] = -1;
          abort();
        }
        v37 = *this;
        if (*this)
          v38 = *((_QWORD *)v37 + 1);
        else
          v38 = 0;
        v39 = -1;
        v9 = (unint64_t)v34 >= v38;
        v40 = (unint64_t)&v34[-v38];
        if (v9 && !HIDWORD(v40))
        {
          if ((v40 + 1) > *(_DWORD *)(*((_QWORD *)v37 + 1) + 12) || v40 == -1)
            v39 = -1;
          else
            v39 = v40;
        }
        v36[1] = v39;
        v42 = (unsigned int *)&v34[8 * v26];
        *v42 = a3;
        v42[1] = v8;
        if ((int)v26 + 1 < v29)
        {
          v43 = 0;
          do
          {
            *(_QWORD *)&v34[8 * (v26 + 1) + v43] = 0xFFFFFFFF00000000;
            v43 += 8;
          }
          while ((_DWORD)v43 != 56);
        }
        *v36 += 8;
        goto LABEL_72;
      }
      if (!a3)
        return 0;
      v18 = CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::Find(v13, (int *)(v14 + v12), a3);
      if (!v18)
        return 0;
      a4 = 0;
      *v18 = -1;
    }
  }
  return a4;
}

uint64_t CSStore2::Store::getUnitCount(CSStore2 **this, const CSStore2::Table *a2)
{
  uint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  int v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  if (a2)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = ___ZNK8CSStore25Store12getUnitCountEPKNS_5TableE_block_invoke;
    v4[3] = &unk_1E4E21AC0;
    v4[4] = &v5;
    CSStore2::Store::enumerateUnits(this, (unsigned int *)a2, v4);
    v2 = *((unsigned int *)v6 + 6);
  }
  else
  {
    v2 = 0;
  }
  _Block_object_dispose(&v5, 8);
  return v2;
}

void sub_1A4E71348(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZNK8CSStore25Store12getUnitCountEPKNS_5TableE_block_invoke(uint64_t result)
{
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

Unit *CSStore2::Store::reallocateUnit(CSStore2 **this, CSStore2::Table *a2, Unit *a3, CSStore2::VM *a4)
{
  Unit *v5;
  const void *var2;
  int v8;
  CSStore2::VM *v10;
  unsigned int v11;
  Unit *Unit;
  unsigned int v13;
  uint64_t v14;
  unsigned int v15;
  BOOL v16;
  unsigned int v17;
  _BYTE v19[2048];
  uint64_t v20;

  v5 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  var2 = (const void *)a3->var2;
  v8 = (_DWORD)var2 - (_DWORD)a4;
  if (var2 >= a4)
  {
    CSStore2::Store::assertNotEnumeratingUnits((uint64_t)this);
    if ((v8 + 3) >= 4)
      v13 = (v8 + 3) & 0xFFFFFFFC;
    else
      v13 = 4;
    v14 = *((_QWORD *)*this + 1);
    v15 = *(_DWORD *)(v14 + 16);
    v16 = v15 >= v13;
    v17 = v15 - v13;
    if (!v16)
      v17 = 0;
    *(_DWORD *)(v14 + 16) = v17;
    ++*(_DWORD *)(v14 + 8);
    v5->var2 = a4;
  }
  else
  {
    v10 = (CSStore2::VM *)v19;
    bzero(v19, 0x800uLL);
    if (a4 >= 0x801 && (v10 = (CSStore2::VM *)CSStore2::VM::Allocate(a4)) == 0
      || (CSStore2::VM::Copy((NSUInteger)v10, (NSUInteger)v5->var3, var2),
          v11 = 4 * *(_DWORD *)v5,
          CSStore2::Store::freeUnit(this, a2, v5),
          (Unit = CSStore2::Store::allocateUnit((CSStore2::Store *)this, a2, (int)a4, v11)) == 0))
    {
      abort();
    }
    v5 = Unit;
    CSStore2::VM::Copy((NSUInteger)Unit->var3, (NSUInteger)v10, var2);
    if (v10 != (CSStore2::VM *)v19)
      CSStore2::VM::Deallocate(v10, a4);
  }
  return v5;
}

Unit *CSStore2::Store::freeUnit(CSStore2 **this, CSStore2::Table *a2, Unit *a3)
{
  unsigned int var2;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  BOOL v10;
  unsigned int v11;
  int v12;
  Unit *result;
  CSStore2 *v14;

  var2 = a3->var2;
  CSStore2::Store::assertNotEnumeratingUnits((uint64_t)this);
  if (var2 + 11 >= 4)
    v7 = (var2 + 11) & 0xFFFFFFFC;
  else
    v7 = 4;
  v8 = *((_QWORD *)*this + 1);
  v9 = *(_DWORD *)(v8 + 16);
  v10 = v9 >= v7;
  v11 = v9 - v7;
  if (!v10)
    v11 = 0;
  *(_DWORD *)(v8 + 16) = v11;
  ++*(_DWORD *)(v8 + 8);
  v12 = *(_DWORD *)a3;
  result = CSStore2::Store::setUnitAddress(this, a2, 4 * v12, 0);
  v14 = *this;
  if (*this)
    v14 = (CSStore2 *)*((_QWORD *)v14 + 1);
  if ((CSStore2 *)((char *)v14 + 20) == a2 && (v12 & 0x3FFFFFFFu) <= 0x3F)
    *((_DWORD *)this + (v12 & 0x3FFFFFFF) + 2) = -1;
  return result;
}

void sub_1A4E715A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4E7167C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);
  std::unique_ptr<CSStore2::Store>::reset[abi:nn180100]((id **)va, 0);

  _Unwind_Resume(a1);
}

void sub_1A4E71728(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A4E717EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4E718D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t ___ZN8CSStore2L15IsAppleInternalEv_block_invoke_124()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  CSStore2::IsAppleInternal(void)::result = result;
  return result;
}

_CSStore *CSStoreCreateMutable(_QWORD *a1)
{
  void *v2;
  _CSStore *v3;
  id v4;
  void *v5;
  id v7;

  v2 = (void *)MEMORY[0x1A85AA4B4]();
  v7 = 0;
  v3 = -[_CSStore initWithError:]([_CSStore alloc], "initWithError:", &v7);
  v4 = v7;
  v5 = v4;
  if (a1 && !v3)
    *a1 = v4;

  objc_autoreleasePoolPop(v2);
  return v3;
}

uint64_t _CSStoreCommit(_QWORD *a1, _QWORD *a2, _QWORD *a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CSStore2::Store *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CSStore2::VM *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  void *v26;
  char v27;
  void *Copy;
  void *v30;
  void *v31;
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  uint64_t v36;
  const __CFString *v37;
  const __CFString *v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1A85AA4B4]();
  if (performMutatingAssertions)
  {
    v7 = a1[42];
    if (v7)
      (***(void (****)(_QWORD))(v7 + 8))(*(_QWORD *)(v7 + 8));
  }
  if (performConstantAssertions)
  {
    v8 = a2[42];
    if (v8)
      (*(void (**)(_QWORD))(**(_QWORD **)(v8 + 8) + 8))(*(_QWORD *)(v8 + 8));
  }
  if (a1[39] != a2[39])
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v32[0] = *MEMORY[0x1E0CB2938];
    v32[1] = CFSTR("Line");
    v33[0] = CFSTR("paramErr");
    v33[1] = &unk_1E4E25220;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v16);
    v17 = objc_claimAutoreleasedReturnValue();
LABEL_15:
    v20 = (void *)v17;

    v21 = objc_retainAutorelease(v20);
    v22 = v21;
LABEL_16:
    v23 = objc_retainAutorelease(v22);
    v24 = 0;
    goto LABEL_17;
  }
  v9 = a2[40];
  if ((v9 & 0xFF00000000) == 0)
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v34[0] = *MEMORY[0x1E0CB2938];
    v34[1] = CFSTR("Line");
    v35[0] = CFSTR("paramErr");
    v35[1] = &unk_1E4E25208;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v11 = a1[1];
  v10 = (CSStore2::Store *)(a1 + 1);
  if (*(_DWORD *)(*(_QWORD *)(v11 + 8) + 8) != (_DWORD)v9)
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v36 = *MEMORY[0x1E0CB2938];
    v37 = CFSTR("Line");
    v38 = CFSTR("kCSStoreConflictErr");
    v39 = &unk_1E4E251F0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v36, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -9487, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v12 = a2[1];
  if (v12)
  {
    v13 = *(unsigned int *)(v12 + 16);
    v14 = *(CSStore2::VM **)(v12 + 8);
  }
  else
  {
    v13 = 0;
    v14 = 0;
  }
  Copy = (void *)CSStore2::VM::AllocateCopy(v14, (const void *)v13, (CSStore2::VM *)v13);
  if (!Copy)
  {
    v30 = (void *)MEMORY[0x1E0CB35C8];
    v36 = *MEMORY[0x1E0CB2938];
    v37 = CFSTR("Line");
    v38 = CFSTR("kCSStoreAllocFailedErr");
    v39 = &unk_1E4E25238;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v36, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -9493, v31);
    v22 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_16;
  }
  CSStore2::Store::setBytesNoCopy(v10, Copy, v13);
  v23 = 0;
  v24 = 1;
LABEL_17:

  v25 = v23;
  v26 = v25;
  if (a3)
    v27 = v24;
  else
    v27 = 1;
  if ((v27 & 1) == 0)
    *a3 = v25;

  objc_autoreleasePoolPop(v6);
  return v24;
}

void sub_1A4E71CFC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t _CSStoreWriteToURL(uint64_t a1, void *a2, void *a3, CSStore2::Store *a4, _QWORD *a5)
{
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  CSStore2 *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned __int16 v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  int v36;
  int v37;
  int v38;
  FILE *v39;
  char v40;
  CSStore2 *v41;
  char v42;
  CSStore2 *v43;
  CSStore2 *v44;
  NSObject *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  CSStore2 *v49;
  NSObject *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  CSStore2 *v54;
  NSObject *v55;
  NSObject *v56;
  CSStore2 *v57;
  uint64_t v58;
  CSStore2 *v59;
  CSStore2 *v60;
  CSStore2 *v61;
  char v62;
  void *v64;
  int v65;
  CSStore2 *v66;
  NSObject *v67;
  NSObject *v68;
  void *v69;
  id v70;
  id v71;
  id v72;
  id v73;
  void *context;
  id v75;
  id v76;
  _BYTE v77[12];
  __int128 v78;
  uint64_t v79;
  uint64_t v80;
  _BYTE buf[24];
  CSStore2 *v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1A85AA4B4]();
  if (performConstantAssertions)
  {
    v10 = *(_QWORD *)(a1 + 336);
    if (v10)
      (*(void (**)(_QWORD))(**(_QWORD **)(v10 + 8) + 8))(*(_QWORD *)(v10 + 8));
  }
  v11 = a2;
  v75 = a3;
  if (!v11 || !objc_msgSend(v11, "isFileURL"))
  {
    v20 = (void *)MEMORY[0x1E0CB35C8];
    *(_QWORD *)&v78 = *MEMORY[0x1E0CB2938];
    *((_QWORD *)&v78 + 1) = CFSTR("Line");
    *(_QWORD *)buf = CFSTR("paramErr");
    *(_QWORD *)&buf[8] = &unk_1E4E251D8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v78, 2);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_47:

    v57 = objc_retainAutorelease(v22);
    v58 = 0;
    v59 = v57;
    goto LABEL_48;
  }
  v70 = v11;
  v71 = v70;
  if ((a4 & 2) != 0)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v70, 1);
    objc_msgSend(v12, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "pathExtension");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_msgSend(v14, "stringByDeletingPathExtension");
        v16 = objc_claimAutoreleasedReturnValue();

        v14 = (void *)v16;
      }
      objc_msgSend(v14, "stringByAppendingFormat:", CFSTR("(%llx~)"), arc4random());
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v17, "stringByAppendingPathExtension:", v15);
        v18 = objc_claimAutoreleasedReturnValue();

        v19 = (void *)v18;
      }
      else
      {
        v19 = v17;
      }
      objc_msgSend(v12, "setPath:", v19);

    }
    objc_msgSend(v12, "URL");
    v71 = (id)objc_claimAutoreleasedReturnValue();

    CSStore2::GetLog(v23);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      *(_QWORD *)&buf[4] = v71;
      _os_log_impl(&dword_1A4E5A000, v24, OS_LOG_TYPE_INFO, "Writing to temporary CSStore file %{private}@", buf, 0xCu);
    }

  }
  v25 = (void *)objc_msgSend(v75, "mutableCopy");
  v26 = v25;
  if (v25)
  {
    v72 = v25;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v72 = (id)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v72, "objectForKeyedSubscript:", *MEMORY[0x1E0C99990]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    *(_WORD *)buf = 0;
    if (CFFileSecurityGetMode((CFFileSecurityRef)v27, (mode_t *)buf))
      v28 = *(_WORD *)buf;
    else
      v28 = 384;
  }
  else
  {
    v28 = 384;
  }
  v29 = v72;
  v30 = *MEMORY[0x1E0C99938];
  v73 = v29;
  objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E0C99938]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = *MEMORY[0x1E0C99918];
    *(_QWORD *)&v78 = *MEMORY[0x1E0C99940];
    *((_QWORD *)&v78 + 1) = v32;
    *(_QWORD *)buf = &unk_1E4E25148;
    *(_QWORD *)&buf[8] = &unk_1E4E25160;
    v33 = *MEMORY[0x1E0C99928];
    v79 = *MEMORY[0x1E0C99920];
    v80 = v33;
    *(_QWORD *)&buf[16] = &unk_1E4E25178;
    v82 = (CSStore2 *)&unk_1E4E25190;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v78, 4);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectForKeyedSubscript:", v31);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "intValue");

    objc_msgSend(v73, "removeObjectForKey:", v30);
  }
  else
  {
    v36 = -1;
  }

  v21 = objc_retainAutorelease(v71);
  v37 = open_dprotected_np((const char *)objc_msgSend(v21, "fileSystemRepresentation"), 2562, v36, 0, v28);
  v38 = v37;
  if (v37 < 0)
  {
    v46 = (void *)MEMORY[0x1E0CB35C8];
    v47 = *__error();
    *(_QWORD *)&v78 = *MEMORY[0x1E0CB2938];
    *((_QWORD *)&v78 + 1) = CFSTR("Line");
    *(_QWORD *)buf = CFSTR("errno");
    *(_QWORD *)&buf[8] = &unk_1E4E251C0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v78, 2);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v47, v48);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    CSStore2::GetLog(v49);
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v77 = 138543362;
      *(_QWORD *)&v77[4] = v22;
      _os_log_error_impl(&dword_1A4E5A000, v50, OS_LOG_TYPE_ERROR, "Failed to open file descriptor for writing store file: %{public}@", v77, 0xCu);
    }

    goto LABEL_46;
  }
  v39 = fdopen(v37, "w+");
  if (!v39)
  {
    v51 = (void *)MEMORY[0x1E0CB35C8];
    v52 = *__error();
    *(_QWORD *)&v78 = *MEMORY[0x1E0CB2938];
    *((_QWORD *)&v78 + 1) = CFSTR("Line");
    *(_QWORD *)buf = CFSTR("errno");
    *(_QWORD *)&buf[8] = &unk_1E4E251A8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v78, 2);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v52, v53);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    CSStore2::GetLog(v54);
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v77 = 138543362;
      *(_QWORD *)&v77[4] = v22;
      _os_log_error_impl(&dword_1A4E5A000, v55, OS_LOG_TYPE_ERROR, "Failed to create file handle from file descriptor for writing store file: %{public}@", v77, 0xCu);
    }

    close(v38);
    goto LABEL_46;
  }
  *(_QWORD *)buf = v39;
  *(_WORD *)&buf[8] = 1;
  *(_QWORD *)v77 = 0;
  v40 = CSStore2::GarbageCollection::Collect((CSStore2::GarbageCollection *)(a1 + 8), (FILE **)buf, a4, v77);
  v41 = (CSStore2 *)*(id *)v77;
  v22 = v41;
  if ((v40 & 1) == 0)
  {
    CSStore2::GetLog(v41);
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v78) = 138543362;
      *(_QWORD *)((char *)&v78 + 4) = v22;
      _os_log_error_impl(&dword_1A4E5A000, v56, OS_LOG_TYPE_ERROR, "Failed to collect-and-write store file: %{public}@", (uint8_t *)&v78, 0xCu);
    }

    unlink((const char *)objc_msgSend(objc_retainAutorelease(v21), "fileSystemRepresentation"));
    CSStore2::Writer::~Writer((void **)buf);
LABEL_46:

    goto LABEL_47;
  }
  CSStore2::Writer::~Writer((void **)buf);
  if (v75)
  {
    *(_QWORD *)&v78 = 0;
    v42 = objc_msgSend(v21, "setResourceValues:error:", v73, &v78);
    v43 = (CSStore2 *)(id)v78;
    v44 = v43;
    if ((v42 & 1) == 0)
    {
      CSStore2::GetLog(v43);
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v70, "path");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138478339;
        *(_QWORD *)&buf[4] = v69;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v75;
        *(_WORD *)&buf[22] = 2114;
        v82 = v44;
        _os_log_error_impl(&dword_1A4E5A000, v45, OS_LOG_TYPE_ERROR, "Failed to set resource values at %{private}@ to %{public}@ (non-fatal error): %{public}@", buf, 0x20u);

      }
    }
  }
  else
  {
    v44 = 0;
  }

  if ((a4 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v22;
    v65 = objc_msgSend(v64, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", v70, v21, 0, 0, 0, &v76);
    v59 = (CSStore2 *)v76;

    CSStore2::GetLog(v66);
    v67 = objc_claimAutoreleasedReturnValue();
    v68 = v67;
    if (v65)
    {
      if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138478083;
        *(_QWORD *)&buf[4] = v21;
        *(_WORD *)&buf[12] = 2113;
        *(_QWORD *)&buf[14] = v70;
        _os_log_impl(&dword_1A4E5A000, v68, OS_LOG_TYPE_INFO, "Moved temporary CSStore file %{private}@ to %{private}@", buf, 0x16u);
      }

      goto LABEL_61;
    }
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138478339;
      *(_QWORD *)&buf[4] = v21;
      *(_WORD *)&buf[12] = 2113;
      *(_QWORD *)&buf[14] = v70;
      *(_WORD *)&buf[22] = 2112;
      v82 = v59;
      _os_log_error_impl(&dword_1A4E5A000, v68, OS_LOG_TYPE_ERROR, "Failed atomic move of temporary CSStore file %{private}@ to %{private}@: %@", buf, 0x20u);
    }

    v22 = v59;
    goto LABEL_46;
  }
  v59 = (CSStore2 *)v22;
LABEL_61:

  v57 = 0;
  v58 = 1;
LABEL_48:

  v60 = v57;
  v61 = v60;
  if (a5)
    v62 = v58;
  else
    v62 = 1;
  if ((v62 & 1) == 0)
    *a5 = v60;

  objc_autoreleasePoolPop(context);
  return v58;
}

void sub_1A4E72658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

id _CSStoreCreateByReadingFromFileHandle(FILE *a1, int a2, _QWORD *a3)
{
  void *v6;
  id v7;
  int64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id *v15;
  id v16;
  id v18;
  id *v19;
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _BYTE __ptr[1024];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1A85AA4B4]();
  v7 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  while (!feof(a1) && !ferror(a1))
  {
    v8 = fread(__ptr, 1uLL, 0x400uLL, a1);
    if (v8 >= 1)
      objc_msgSend(v7, "appendBytes:length:", __ptr, v8);
  }
  if (ferror(a1))
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v22[0] = *MEMORY[0x1E0CB2938];
    v22[1] = CFSTR("Line");
    v23[0] = CFSTR("EIO");
    v23[1] = &unk_1E4E25340;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 5, v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else if ((unint64_t)objc_msgSend(v7, "length") >> 32)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v20[0] = *MEMORY[0x1E0CB2938];
    v20[1] = CFSTR("Line");
    v21[0] = CFSTR("ERANGE");
    v21[1] = &unk_1E4E25358;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 34, v13);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = objc_retainAutorelease(v7);
    v18 = 0;
    CSStore2::Store::CreateWithBytes(&v19, (Bytef *)objc_msgSend(v14, "bytes"), (void *)objc_msgSend(v14, "length"), &v18);
    v11 = v18;
    v15 = v19;
    if (v19)
    {
      v16 = -[_CSStore initByMovingStore:]([_CSStore alloc], "initByMovingStore:", v19);

      MEMORY[0x1A85AA130](v15, 0x10A0C4017B00345);
      if (!a3)
        goto LABEL_16;
      goto LABEL_14;
    }
  }
  v16 = 0;
  if (!a3)
    goto LABEL_16;
LABEL_14:
  if (!v16)
    *a3 = v11;
LABEL_16:

  objc_autoreleasePoolPop(v6);
  if (a2)
    fclose(a1);
  return v16;
}

void sub_1A4E72A28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t _CSStoreGarbageCollect(uint64_t a1, CSStore2::Store *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = (void *)MEMORY[0x1A85AA4B4]();
  if (performMutatingAssertions)
  {
    v5 = *(_QWORD *)(a1 + 336);
    if (v5)
      (***(void (****)(_QWORD))(v5 + 8))(*(_QWORD *)(v5 + 8));
  }
  v6 = CSStore2::Store::collectGarbage((CSStore2::Store *)(a1 + 8), a2);
  objc_autoreleasePoolPop(v4);
  return v6;
}

void _CSStoreEnumerateTables(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = v3;
  if (a1 && v3)
  {
    if (performConstantAssertions)
    {
      v5 = *(_QWORD *)(a1 + 336);
      if (v5)
        (*(void (**)(_QWORD))(**(_QWORD **)(v5 + 8) + 8))(*(_QWORD *)(v5 + 8));
    }
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = ___CSStoreEnumerateTables_block_invoke;
    v6[3] = &unk_1E4E21BB8;
    v7 = v4;
    CSStore2::Store::enumerateTables((CSStore2 **)(a1 + 8), v6);

  }
}

void sub_1A4E72B90(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t _CSStoreGetCatalogTable(uint64_t a1)
{
  if (a1)
    return 4294929780;
  else
    return 0;
}

char *_CSStoreGetArrayTable(uint64_t a1)
{
  uint64_t v2;
  char *result;

  if (performConstantAssertions)
  {
    v2 = *(_QWORD *)(a1 + 336);
    if (v2)
      (*(void (**)(_QWORD))(**(_QWORD **)(v2 + 8) + 8))(*(_QWORD *)(v2 + 8));
  }
  result = *(char **)(a1 + 272);
  if (result)
    return (char *)(4 * *(_DWORD *)result);
  result = CSStore2::Store::getTable((CSStore2 **)(a1 + 8), CFSTR("<array>"));
  if (result)
    return (char *)(4 * *(_DWORD *)result);
  return result;
}

char *_CSStoreGetStringTable(uint64_t a1)
{
  uint64_t v2;
  char *result;

  if (performConstantAssertions)
  {
    v2 = *(_QWORD *)(a1 + 336);
    if (v2)
      (*(void (**)(_QWORD))(**(_QWORD **)(v2 + 8) + 8))(*(_QWORD *)(v2 + 8));
  }
  result = *(char **)(a1 + 280);
  if (result)
    return (char *)(4 * *(_DWORD *)result);
  result = CSStore2::Store::getTable((CSStore2 **)(a1 + 8), CFSTR("<string>"));
  if (result)
    return (char *)(4 * *(_DWORD *)result);
  return result;
}

char *_CSStoreGetDictionaryTable(uint64_t a1)
{
  uint64_t v2;
  char *result;

  if (performConstantAssertions)
  {
    v2 = *(_QWORD *)(a1 + 336);
    if (v2)
      (*(void (**)(_QWORD))(**(_QWORD **)(v2 + 8) + 8))(*(_QWORD *)(v2 + 8));
  }
  result = *(char **)(a1 + 288);
  if (result)
    return (char *)(4 * *(_DWORD *)result);
  result = CSStore2::Store::getTable((CSStore2 **)(a1 + 8), CFSTR("<dictionary>"));
  if (result)
    return (char *)(4 * *(_DWORD *)result);
  return result;
}

CFStringRef _CSStoreCopyTableName(uint64_t a1, unsigned int a2)
{
  void *v4;
  uint64_t v5;
  char *Table;
  const __CFAllocator *v7;
  const __CFString *v8;
  CFStringRef Copy;

  v4 = (void *)MEMORY[0x1A85AA4B4]();
  if (performConstantAssertions)
  {
    v5 = *(_QWORD *)(a1 + 336);
    if (v5)
      (*(void (**)(_QWORD))(**(_QWORD **)(v5 + 8) + 8))(*(_QWORD *)(v5 + 8));
  }
  if (a2 && (Table = CSStore2::Store::getTable((CSStore2::Store *)(a1 + 8), a2)) != 0)
  {
    v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v8 = (id)CSStore2::Table::copyCFName((CSStore2::Table *)Table);
    Copy = CFStringCreateCopy(v7, v8);
  }
  else
  {
    Copy = 0;
  }
  objc_autoreleasePoolPop(v4);
  return Copy;
}

uint64_t _CSStoreAddTable(uint64_t a1, void *a2, int a3, _QWORD *a4)
{
  void *v8;
  uint64_t v9;
  CSStore2::Store *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  Unit *Table;
  _BOOL4 IsNameAllowed;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1A85AA4B4]();
  if (performMutatingAssertions)
  {
    v9 = *(_QWORD *)(a1 + 336);
    if (v9)
      (***(void (****)(_QWORD))(v9 + 8))(*(_QWORD *)(v9 + 8));
  }
  if (a2)
  {
    v10 = (CSStore2::Store *)(a1 + 8);
    v11 = a2;
    if (CSStore2::Store::getTable((CSStore2 **)v10, v11))
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v30[0] = *MEMORY[0x1E0CB2938];
      v30[1] = CFSTR("Line");
      v31[0] = CFSTR("kCSStoreNameAlreadyInUseErr");
      v31[1] = &unk_1E4E25370;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -9494, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      Table = CSStore2::Store::allocateTable(v10, v11, a3, (NSString *)1);
      if (Table)
      {
        v14 = 0;
        v16 = (4 * *(_DWORD *)Table);
        goto LABEL_9;
      }
      IsNameAllowed = CSStore2::Table::IsNameAllowed((CSStore2::Table *)v11, (NSString *)1);
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v21 = *MEMORY[0x1E0CB2F90];
      if (IsNameAllowed)
      {
        v28[0] = *MEMORY[0x1E0CB2938];
        v28[1] = CFSTR("Line");
        v29[0] = CFSTR("kCSStoreAllocFailedErr");
        v29[1] = &unk_1E4E25388;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, -9493, v22);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v26[0] = *MEMORY[0x1E0CB2938];
        v26[1] = CFSTR("Line");
        v27[0] = CFSTR("kCSStoreNameInvalidErr");
        v27[1] = &unk_1E4E253A0;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, -9490, v23);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v24[0] = *MEMORY[0x1E0CB2938];
    v24[1] = CFSTR("Line");
    v25[0] = CFSTR("paramErr");
    v25[1] = &unk_1E4E253B8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16 = 0;
LABEL_9:

  objc_autoreleasePoolPop(v8);
  if (a4 && !(_DWORD)v16)
    *a4 = v14;

  return v16;
}

void sub_1A4E73108(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void _CSStoreRemoveTable(uint64_t a1, unsigned int a2)
{
  void *v4;
  uint64_t v5;
  CSStore2::Store *v6;
  char *Table;
  uint64_t v8;

  v4 = (void *)MEMORY[0x1A85AA4B4]();
  if (performMutatingAssertions)
  {
    v5 = *(_QWORD *)(a1 + 336);
    if (v5)
      (***(void (****)(_QWORD))(v5 + 8))(*(_QWORD *)(v5 + 8));
  }
  if (a2 != -37516)
  {
    if (a2)
    {
      v6 = (CSStore2::Store *)(a1 + 8);
      Table = CSStore2::Store::getTable(v6, a2);
      if (Table)
      {
        if (Table[8] != 60)
        {
          v8 = *(_QWORD *)v6;
          if (*(_QWORD *)v6)
            v8 = *(_QWORD *)(v8 + 8);
          CSStore2::Store::freeUnit((CSStore2 **)v6, (CSStore2::Table *)(v8 + 20), (Unit *)Table);
        }
      }
    }
  }
  objc_autoreleasePoolPop(v4);
}

uint64_t CSStoreGetUnitCount(uint64_t a1, unsigned int a2)
{
  void *v4;
  uint64_t v5;
  CSStore2::Store *v6;
  char *Table;
  uint64_t UnitCount;

  v4 = (void *)MEMORY[0x1A85AA4B4]();
  if (performConstantAssertions)
  {
    v5 = *(_QWORD *)(a1 + 336);
    if (v5)
      (*(void (**)(_QWORD))(**(_QWORD **)(v5 + 8) + 8))(*(_QWORD *)(v5 + 8));
  }
  v6 = (CSStore2::Store *)(a1 + 8);
  Table = CSStore2::Store::getTable(v6, a2);
  if (Table)
    UnitCount = CSStore2::Store::getUnitCount((CSStore2 **)v6, (const CSStore2::Table *)Table);
  else
    UnitCount = 0;
  objc_autoreleasePoolPop(v4);
  return UnitCount;
}

Unit *CSStoreAllocUnit(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t v6;
  CSStore2::Store *v7;
  char *Table;
  Unit *result;
  NSObject *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (performMutatingAssertions)
  {
    v6 = *(_QWORD *)(a1 + 336);
    if (v6)
      (***(void (****)(_QWORD))(v6 + 8))(*(_QWORD *)(v6 + 8));
  }
  v7 = (CSStore2::Store *)(a1 + 8);
  Table = CSStore2::Store::getTable(v7, a2);
  if (Table)
  {
    result = CSStore2::Store::allocateUnit(v7, (CSStore2::Table *)Table, a3, 0);
    if (result)
      return (Unit *)(4 * *(_DWORD *)result);
  }
  else
  {
    CSStore2::GetLog(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = 136446210;
      v12 = "CSStoreUnitID CSStoreAllocUnit(CSMutableStoreRef _Nonnull, CSStoreTableID, _CSStoreSize)";
      _os_log_impl(&dword_1A4E5A000, v10, OS_LOG_TYPE_INFO, "%{public}s: no table ID supplied", (uint8_t *)&v11, 0xCu);
    }

    return 0;
  }
  return result;
}

Unit *CSStoreAllocUnitWithData(uint64_t a1, unsigned int a2, const void *a3, const void *a4)
{
  Unit *v8;
  Unit *v9;

  v8 = CSStoreAllocUnit(a1, a2, (int)a3);
  v9 = v8;
  if (a4 && (_DWORD)v8)
    _CSStoreWriteToUnit(a1, a2, v8, 0, a3, a4, 0);
  return v9;
}

uint64_t _CSStoreWriteToUnit(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4, const void *a5, const void *a6, _QWORD *a7)
{
  uint64_t v14;
  CSStore2::Store *v15;
  char *Table;
  char *Unit;
  unsigned int v18;
  BOOL v19;
  char *v20;
  unsigned int v21;
  unint64_t v22;
  unsigned int v23;
  int v24;
  _BOOL4 v25;
  _BOOL4 v26;
  BOOL v27;
  unsigned int v28;
  char *v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  _BOOL4 v37;
  void *v38;
  void *v39;
  int v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[3];

  v53[2] = *MEMORY[0x1E0C80C00];
  if (performMutatingAssertions)
  {
    v14 = *(_QWORD *)(a1 + 336);
    if (v14)
      (***(void (****)(_QWORD))(v14 + 8))(*(_QWORD *)(v14 + 8));
  }
  if (!a2)
  {
    v32 = (void *)MEMORY[0x1E0CB35C8];
    v46[0] = *MEMORY[0x1E0CB2938];
    v46[1] = CFSTR("Line");
    v47[0] = CFSTR("paramErr");
    v47[1] = &unk_1E4E25400;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v33);
    v34 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_40;
  }
  v15 = (CSStore2::Store *)(a1 + 8);
  Table = CSStore2::Store::getTable(v15, a2);
  if (!Table)
  {
    v35 = (void *)MEMORY[0x1E0CB35C8];
    v48[0] = *MEMORY[0x1E0CB2938];
    v48[1] = CFSTR("Line");
    v49[0] = CFSTR("kCSStoreNotFoundErr");
    v49[1] = &unk_1E4E253E8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -9499, v36);
    v34 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_40;
  }
  Unit = CSStore2::Store::getUnit((CSStore2 **)v15, (const CSStore2::Table *)Table, a3);
  if (!Unit)
  {
    v43 = (void *)MEMORY[0x1E0CB35C8];
    v50[0] = *MEMORY[0x1E0CB2938];
    v50[1] = CFSTR("Line");
    v51[0] = CFSTR("kCSStoreNotFoundErr");
    v51[1] = &unk_1E4E253D0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 2);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -9499, v44);
    v34 = (id)objc_claimAutoreleasedReturnValue();

LABEL_40:
    v31 = 0;
    if (!a7)
      goto LABEL_43;
    goto LABEL_41;
  }
  v18 = *(_DWORD *)Unit & 0xC0000000;
  v19 = v18 == 0x40000000;
  if (v18 == 0x40000000)
    v20 = Unit + 80;
  else
    v20 = Unit + 8;
  if (v19)
    v21 = *((_DWORD *)Unit + 1) - 72;
  else
    v21 = *((_DWORD *)Unit + 1);
  v22 = *(_QWORD *)(*(_QWORD *)v15 + 8);
  v23 = *(_DWORD *)(v22 + 12);
  if (v21 > v23 || __CFADD__(a4, (_DWORD)a5) || a4 + a5 > v21)
    goto LABEL_30;
  v24 = (_DWORD)v20 - v22;
  v25 = (unint64_t)v20 < v22;
  if ((unint64_t)&v20[-v22] >> 32)
    v25 = 1;
  v26 = v24 + 1 > v23 || v24 == -1;
  if (v25 || v26)
    v24 = -1;
  v27 = __CFADD__(v24, v21);
  v28 = v24 + v21;
  if (v27 || v28 > v23)
  {
LABEL_30:
    v37 = v23 <= a4;
    v38 = (void *)MEMORY[0x1E0CB35C8];
    v52[0] = *MEMORY[0x1E0CB2938];
    v52[1] = CFSTR("Line");
    v53[0] = CFSTR("code");
    v53[1] = &unk_1E4E25250;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
      v40 = v37;
    else
      v40 = 1;
    if (v40)
      v41 = -9492;
    else
      v41 = -9497;
    objc_msgSend(v38, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v41, v39);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = objc_retainAutorelease(v42);
    v31 = 0;
  }
  else
  {
    v29 = &v20[a4];
    if (memcmp(v29, a6, a5))
    {
      CSStore2::VM::Copy((NSUInteger)v29, (NSUInteger)a6, a5);
      v22 = *(_QWORD *)(*(_QWORD *)v15 + 8);
    }
    v30 = 0;
    ++*(_DWORD *)(v22 + 8);
    v31 = 1;
  }

  v34 = v30;
  if (a7)
  {
LABEL_41:
    if ((v31 & 1) == 0)
      *a7 = v34;
  }
LABEL_43:

  return v31;
}

void sub_1A4E73800(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

char *CSStoreReallocUnit(uint64_t a1, unsigned int a2, unsigned int a3, CSStore2::VM *a4)
{
  uint64_t v8;
  CSStore2::Store *v9;
  char *result;
  CSStore2::Table *v11;

  if (!(_DWORD)a4)
    return 0;
  if (performMutatingAssertions)
  {
    v8 = *(_QWORD *)(a1 + 336);
    if (v8)
      (***(void (****)(_QWORD))(v8 + 8))(*(_QWORD *)(v8 + 8));
  }
  v9 = (CSStore2::Store *)(a1 + 8);
  result = CSStore2::Store::getTable(v9, a2);
  if (result)
  {
    v11 = (CSStore2::Table *)result;
    result = CSStore2::Store::getUnit((CSStore2 **)v9, (const CSStore2::Table *)result, a3);
    if (result)
      return (char *)(4
                                  * *(_DWORD *)CSStore2::Store::reallocateUnit((CSStore2 **)v9, v11, (Unit *)result, a4));
  }
  return result;
}

char *CSStoreFreeUnit(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t v6;
  CSStore2::Store *v7;
  char *result;
  CSStore2::Table *v9;

  if (performMutatingAssertions)
  {
    v6 = *(_QWORD *)(a1 + 336);
    if (v6)
      (***(void (****)(_QWORD))(v6 + 8))(*(_QWORD *)(v6 + 8));
  }
  v7 = (CSStore2::Store *)(a1 + 8);
  result = CSStore2::Store::getTable(v7, a2);
  if (result)
  {
    v9 = (CSStore2::Table *)result;
    result = CSStore2::Store::getUnit((CSStore2 **)v7, (const CSStore2::Table *)result, a3);
    if (result)
      return (char *)CSStore2::Store::freeUnit((CSStore2 **)v7, v9, (Unit *)result);
  }
  return result;
}

uint64_t _CSStoreWriteToHeader(uint64_t a1, unsigned int a2, unsigned int a3, const void *a4, const void *a5, _QWORD *a6)
{
  unsigned int v11;

  if (a1)
    v11 = -37516;
  else
    v11 = 0;
  return _CSStoreWriteToUnit(a1, v11, a2, a3, a4, a5, a6);
}

uint64_t _CSStoreSetExpectedAccessContext(void *a1, const char *a2)
{
  return objc_msgSend(a1, "setAccessContext:", a2);
}

void _CSStoreSetExpectedAccessQueue(void *a1, void *a2)
{
  id v3;
  _CSStoreAccessContext *v4;
  id v5;

  v3 = a2;
  v5 = v3;
  if (v3)
    v4 = _CSStoreAccessContextCreateWithQueue(v3);
  else
    v4 = 0;
  objc_msgSend(a1, "setAccessContext:", v4);

}

void sub_1A4E739E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t _CSStoreValidate(uint64_t a1, char a2)
{
  void *v4;
  uint64_t v5;
  CSStore2 **v6;
  uint64_t v7;
  _BOOL4 v8;
  void (*v9)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  void (*v10)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  CSStore2 **v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  if ((a2 & 1) != 0)
    v4 = &__block_literal_global_90;
  else
    v4 = &__block_literal_global_89;
  if (performConstantAssertions)
  {
    v5 = *(_QWORD *)(a1 + 336);
    if (v5)
      (*(void (**)(_QWORD))(**(_QWORD **)(v5 + 8) + 8))(*(_QWORD *)(v5 + 8));
  }
  v6 = (CSStore2 **)(a1 + 8);
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 1;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = ___CSStoreValidate_block_invoke_3;
  v17[3] = &unk_1E4E21C48;
  v18 = v4;
  v19 = &v20;
  CSStore2::Store::enumerateTables(v6, v17);
  if ((a2 & 2) != 0)
  {
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = ___CSStoreValidate_block_invoke_4;
    v13[3] = &unk_1E4E21C70;
    v14 = v4;
    v15 = &v24;
    v16 = v6;
    CSStore2::Store::enumerateTables(v6, v13);
    v8 = *((_BYTE *)v21 + 24) != 0;
    if (!*((_BYTE *)v21 + 24))
    {
      v9 = ___CSStoreValidate_block_invoke_2;
      if ((a2 & 1) == 0)
        v9 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))___CSStoreValidate_block_invoke;
      ((void (*)(void *, const char *))v9)(v4, "Ran out of unit identifiers.");
    }
    if (!*((_BYTE *)v25 + 24))
    {
      v10 = ___CSStoreValidate_block_invoke_2;
      if ((a2 & 1) == 0)
        v10 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))___CSStoreValidate_block_invoke;
      ((void (*)(void *, const char *))v10)(v4, "Unit identifier cache entry invalid.");
      v8 = 0;
    }

  }
  else
  {
    v8 = 1;
  }
  if (*((_BYTE *)v25 + 24))
    v11 = 1;
  else
    v11 = v8;

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  return v11;
}

void sub_1A4E73BD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);

  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A4E73C9C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4E742A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22)
{
  void *v22;

  _Unwind_Resume(a1);
}

void sub_1A4E743A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void _CSStoreShow(CSStore2::Store *this, int a2, FILE *a3)
{
  uint64_t v6;
  uint64_t v7;
  CSStore2 **v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int UnitCount;
  CSStore2 *v13;
  _QWORD v14[6];
  BOOL v15;

  if (performConstantAssertions)
  {
    v6 = *((_QWORD *)this + 42);
    if (v6)
      (*(void (**)(_QWORD))(**(_QWORD **)(v6 + 8) + 8))(*(_QWORD *)(v6 + 8));
  }
  v9 = *((_QWORD *)this + 1);
  v8 = (CSStore2 **)((char *)this + 8);
  v7 = v9;
  if (v9)
  {
    v7 = *(_QWORD *)(v7 + 8);
    v10 = v7 + 12;
  }
  else
  {
    v10 = 12;
  }
  v11 = *(unsigned int *)v10;
  UnitCount = CSStore2::Store::getUnitCount(v8, (const CSStore2::Table *)(v7 + 20));
  v13 = *v8;
  if (*v8)
    v13 = (CSStore2 *)*((_QWORD *)v13 + 1);
  fprintf(a3, "\n******************************************************************************\nstore:       %p\nbytes:       %p\nlength:      %llu\ntable count: %llu\n", v8, v13, v11, UnitCount);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = ___ZN8CSStore24Show13StoreContentsERKNS_5StoreEbP7__sFILE_block_invoke;
  v14[3] = &__block_descriptor_49_e47_v24__0r__Table__Unit_b30b2I_0c___48c_QQII_8_B16l;
  v14[4] = a3;
  v14[5] = v8;
  v15 = a2 != 0;
  CSStore2::Store::enumerateTables(v8, v14);
}

void ___ZN8CSStore24Show13StoreContentsERKNS_5StoreEbP7__sFILE_block_invoke(uint64_t a1, const CSStore2::Store *a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v4 = fputs("==============================================================================\n", *(FILE **)(a1 + 32));
  v5 = (void *)MEMORY[0x1A85AA4B4](v4);
  CSStore2::Show::TableContents(*(CSStore2 ***)(a1 + 40), a2, (const CSStore2::Table *)*(unsigned __int8 *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "string");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  fputs((const char *)objc_msgSend(v7, "UTF8String"), *(FILE **)(a1 + 32));

  objc_autoreleasePoolPop(v5);
}

void sub_1A4E74528(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id CSStore2::Show::TableContents(CSStore2 **this, const CSStore2::Store *a2, const CSStore2::Table *a3)
{
  int v3;
  void *v6;
  id v7;
  NSNumber *v8;
  __CFString *v9;
  char *v10;
  CSStore2 *v11;
  unint64_t v12;
  int v13;
  BOOL v14;
  unint64_t v15;
  void *v17;
  NSNumber *v18;
  NSNumber *v19;
  NSNumber *v20;
  const CSStore2::Store *v21;
  char *Table;
  NSString *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  unsigned int *v27;
  id v28;
  void *v29;
  CSStore2 *v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  _BOOL4 v34;
  unint64_t Statistics;
  CSStore2::Show *v36;
  NSAttributedString *v37;
  void *v38;
  _QWORD v40[6];
  int v41;
  void (**v42)(CSStore2::AttributedStringWriter *__hidden);
  _QWORD v43[2];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD *v58;

  v3 = (int)a3;
  v6 = (void *)MEMORY[0x1A85AA4B4]();
  v42 = &off_1E4E21120;
  v43[0] = 0;
  v49 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v7 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v43[1] = v7;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  *(_QWORD *)&v49 = 0;
  v50 = 0u;
  v51 = 0u;
  DWORD2(v49) = 1065353216;
  LODWORD(v52) = 1065353216;
  WORD4(v52) = 0;
  *(_QWORD *)&v53 = 0;
  WORD4(v53) = 257;
  BYTE10(v53) = 0;
  v58 = v43;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", (4 * *(_DWORD *)a2));
  v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)&v42, CFSTR("table ID"), v8);

  v9 = (__CFString *)CSStore2::Table::copyCFName(a2);
  CSStore2::AttributedStringWriter::string((CSStore2::AttributedStringWriter *)&v42, CFSTR("name"), &v9->isa);

  v10 = (char *)a2 + 8;
  v11 = *this;
  if (*this)
    v12 = *((_QWORD *)v11 + 1);
  else
    v12 = 0;
  v13 = -1;
  v14 = (unint64_t)v10 >= v12;
  v15 = (unint64_t)&v10[-v12];
  if (v14 && !HIDWORD(v15))
  {
    if ((v15 + 1) > *(_DWORD *)(*((_QWORD *)v11 + 1) + 12) || v15 == -1)
      v13 = -1;
    else
      v13 = v15;
  }
  v41 = v13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3321888768;
  v40[2] = ___ZN8CSStore24Show13TableContentsERKNS_5StoreEPKNS_5TableEb_block_invoke;
  v40[3] = &__block_descriptor_48_ea8_32c68_ZTSKZN8CSStore24Show13TableContentsERKNS_5StoreEPKNS_5TableEbEUlvE__e5_v8__0l;
  v40[4] = &v42;
  v40[5] = &v41;
  CSStore2::AttributedStringWriter::withAppliedAttribute((uint64_t)&v42, (uint64_t)CFSTR("_CSVNum"), (uint64_t)v17, (uint64_t)v40);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)a2 + 1));
  v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)&v42, CFSTR("length"), v18);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", CSStore2::Store::getUnitCount(this, a2));
  v19 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)&v42, CFSTR("unit count"), v19);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", (*((_DWORD *)a2 + 1) - 72));
  v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)&v42, CFSTR("header length"), v20);

  Table = (char *)this[34];
  if (!Table)
    Table = CSStore2::Store::getTable(this, CFSTR("<string>"));
  if (Table == (char *)a2)
  {
    CSStore2::String::GetDebugDescriptionOfCache((CSStore2::String *)this, v21);
    v23 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v23)
      CSStore2::AttributedStringWriter::string((CSStore2::AttributedStringWriter *)&v42, CFSTR("StringCache"), v23);

  }
  v24 = *((unsigned int *)a2 + 19);
  if ((_DWORD)v24 != -1)
  {
    v25 = *((_QWORD *)*this + 1);
    if (*(_DWORD *)(v25 + 12) > v24)
    {
      v26 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
      if (CSStore2::NameOfType<CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>>(void)::once != -1)
        dispatch_once(&CSStore2::NameOfType<CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>>(void)::once, &__block_literal_global_130);
      v27 = (unsigned int *)(v25 + v24);
      v28 = (id)CSStore2::NameOfType<CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>>(void)::result;
      v29 = v28;
      v30 = *this;
      if (*this)
        v31 = *((_QWORD *)v30 + 1);
      else
        v31 = 0;
      v32 = 0xFFFFFFFFLL;
      v14 = (unint64_t)v27 >= v31;
      v33 = (unint64_t)v27 - v31;
      if (v14 && !HIDWORD(v33))
      {
        v34 = (v33 + 1) > *(_DWORD *)(*((_QWORD *)v30 + 1) + 12) || (_DWORD)v33 == -1;
        v32 = v33;
        if (v34)
          v32 = 0xFFFFFFFFLL;
      }
      objc_msgSend(v26, "appendFormat:", CFSTR("%@ @ 0x%llx"), v28, v32);

      Statistics = CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::GetStatistics(v27);
      objc_msgSend(v26, "appendFormat:", CFSTR(" { buckets = %llu, count = %llu }"), HIDWORD(Statistics), Statistics);
      if (v26)
        CSStore2::AttributedStringWriter::string((CSStore2::AttributedStringWriter *)&v42, CFSTR("IdentifierCache"), (NSString *)v26);

    }
  }
  if (v3)
  {
    CSStore2::AttributedStringWriter::separator((CSStore2::AttributedStringWriter::Impl **)&v42, (CSStore2::AttributedStringWriter *)0x2B, 0);
    if (*this)
      v36 = (CSStore2::Show *)*((_QWORD *)*this + 1);
    else
      v36 = 0;
    CSStore2::Show::ShowBytes(v36, (char *)a2, (const void *)(*((_DWORD *)a2 + 1) + 8));
    v37 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
    CSStore2::AttributedStringWriter::attributedString((CSStore2::AttributedStringWriter::Impl **)&v42, v37);

  }
  v38 = (void *)objc_msgSend(v7, "copy");
  CSStore2::AttributedStringWriter::~AttributedStringWriter((CSStore2::AttributedStringWriter *)&v42);

  objc_autoreleasePoolPop(v6);
  return v38;
}

void sub_1A4E749C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  void *v11;
  void *v12;
  va_list va;

  va_start(va, a11);

  CSStore2::AttributedStringWriter::~AttributedStringWriter((CSStore2::AttributedStringWriter *)va);
  _Unwind_Resume(a1);
}

void ___ZN8CSStore24Show13TableContentsERKNS_5StoreEPKNS_5TableEb_block_invoke(uint64_t a1)
{
  CSStore2::AttributedStringWriter::format(*(CSStore2::AttributedStringWriter **)(a1 + 32), CFSTR("bytes"), CFSTR("0x%llx"), **(unsigned int **)(a1 + 40));
}

id CSStore2::Show::ShowBytes(CSStore2::Show *this, char *a2, const void *a3)
{
  unsigned int v3;
  int v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  int v11;
  void *v12;
  void *context;
  void *contexta;
  _QWORD v16[9];
  char *v17;
  int v18;
  void (**v19)(CSStore2::AttributedStringWriter *__hidden);
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 *v35;
  unsigned int v36;
  int i;

  v3 = a3;
  v5 = (int)this;
  context = (void *)MEMORY[0x1A85AA4B4]();
  v6 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v7 = v6;
  v36 = 0;
  for (i = (_DWORD)a2 - v5; v36 < v3; v36 += 16)
  {
    v8 = (void *)MEMORY[0x1A85AA4B4](v6);
    v9 = objc_alloc_init(MEMORY[0x1E0CB3778]);
    v19 = &off_1E4E21120;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v10 = v9;
    *((_QWORD *)&v20 + 1) = v10;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    *(_QWORD *)&v26 = 0;
    v27 = 0u;
    v28 = 0u;
    DWORD2(v26) = 1065353216;
    LODWORD(v29) = 1065353216;
    WORD4(v29) = 0;
    *(_QWORD *)&v30 = 0;
    WORD4(v30) = 1;
    BYTE10(v30) = 0;
    v35 = &v20;
    v11 = v3 - v36;
    if (v3 - v36 >= 0x10)
      v11 = 16;
    v18 = v11;
    v17 = &a2[v36];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3321888768;
    v16[2] = ___ZN8CSStore24Show9ShowBytesEPKvS2_j_block_invoke;
    v16[3] = &__block_descriptor_72_ea8_32c45_ZTSKZN8CSStore24Show9ShowBytesEPKvS2_jEUlvE__e5_v8__0l;
    v16[4] = &v19;
    v16[5] = &i;
    v16[6] = &v36;
    v16[7] = &v18;
    v16[8] = &v17;
    CSStore2::AttributedStringWriter::withAppliedAttribute((uint64_t)&v19, (uint64_t)CFSTR("_CSVFixed"), MEMORY[0x1E0C9AAB0], (uint64_t)v16);
    objc_msgSend(v7, "appendAttributedString:", v10, context);
    CSStore2::AttributedStringWriter::~AttributedStringWriter((CSStore2::AttributedStringWriter *)&v19);

    objc_autoreleasePoolPop(v8);
  }
  v12 = (void *)objc_msgSend(v7, "copy", context);

  objc_autoreleasePoolPop(contexta);
  return v12;
}

void sub_1A4E74C7C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___ZN8CSStore24Show9ShowBytesEPKvS2_j_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  __int16 v12;
  char *v13;
  char *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _WORD *v25;
  char *v26;
  char *v27;
  __int16 v28;
  uint64_t v29;
  NSAttributedString *v30;
  NSAttributedString *v31;
  _QWORD v32[5];
  _QWORD v33[4];
  __int128 v34;
  uint64_t v35;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3321888768;
  v33[2] = ___ZZN8CSStore24Show9ShowBytesEPKvS2_jENKUlvE_clEv_block_invoke;
  v33[3] = &__block_descriptor_56_ea8_32c58_ZTSKZZN8CSStore24Show9ShowBytesEPKvS2_jENKUlvE_clEvEUlvE__e5_v8__0l;
  v34 = *(_OWORD *)(a1 + 40);
  v35 = v2;
  CSStore2::AttributedStringWriter::withAppliedAttribute(v2, (uint64_t)CFSTR("_CSVFWeight"), (uint64_t)&unk_1E4E255F8, (uint64_t)v33);
  v4 = *(_QWORD *)(a1 + 32);
  v32[0] = v3;
  v32[1] = 3321888768;
  v32[2] = ___ZZN8CSStore24Show9ShowBytesEPKvS2_jENKUlvE_clEv_block_invoke_136;
  v32[3] = &__block_descriptor_40_ea8_32c59_ZTSKZZN8CSStore24Show9ShowBytesEPKvS2_jENKUlvE_clEvEUlvE0__e5_v8__0l;
  v32[4] = v4;
  CSStore2::AttributedStringWriter::withAppliedAttribute(v4, (uint64_t)CFSTR("_CSVOutputType"), (uint64_t)&unk_1E4E25418, (uint64_t)v32);
  v31 = (NSAttributedString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
  for (i = 0; i != 16; ++i)
  {
    if (i && (i & 3) == 0)
      -[NSAttributedString appendString:](v31, "appendString:", CFSTR(" "));
    if (i >= **(unsigned int **)(a1 + 56))
      -[NSAttributedString appendString:](v31, "appendString:", CFSTR("  "));
    else
      -[NSAttributedString appendFormat:](v31, "appendFormat:", CFSTR("%02x"), *(unsigned __int8 *)(**(_QWORD **)(a1 + 64) + i));
  }
  CSStore2::AttributedStringWriter::string(*(CSStore2::AttributedStringWriter::Impl ***)(a1 + 32), v31);
  CSStore2::AttributedStringWriter::string(*(CSStore2::AttributedStringWriter::Impl ***)(a1 + 32), (NSAttributedString *)CFSTR("    "));
  v6 = **(unsigned int **)(a1 + 56);
  if ((_DWORD)v6)
  {
    v7 = **(char ***)(a1 + 64);
    v8 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned short>>(v6);
    v10 = v8;
    v11 = 0;
    do
    {
      v12 = *v7++;
      *(_WORD *)&v8[v11] = v12;
      v11 += 2;
    }
    while (2 * v6 != v11);
    v13 = &v8[v11];
    v14 = &v8[2 * v9];
    v15 = v13 == v8;
    if (v13 != v8)
    {
      v16 = 0;
      v17 = MEMORY[0x1E0C80978];
      do
      {
        v18 = *(unsigned __int16 *)&v8[v16];
        if (v18 > 0x7F || (*(_DWORD *)(v17 + 4 * v18 + 60) & 0x40000) == 0)
          *(_WORD *)&v8[v16] = 183;
        v16 += 2;
      }
      while (2 * ((v13 - v8) >> 1) != v16);
    }
  }
  else
  {
    v10 = 0;
    v14 = 0;
    v13 = 0;
    v15 = 1;
  }
  v19 = v13 - v10;
  if ((unint64_t)(v13 - v10) > 0x1F)
  {
    if (v19 == 32)
      v27 = v13;
    else
      v27 = v10 + 32;
    goto LABEL_38;
  }
  v20 = v19 >> 1;
  v21 = 16 - (v19 >> 1);
  if (v21 <= (v14 - v13) >> 1)
  {
    v27 = &v13[2 * v21];
    v29 = 32 - 2 * v20;
    do
    {
      *(_WORD *)v13 = 32;
      v13 += 2;
      v29 -= 2;
    }
    while (v29);
LABEL_38:
    v26 = v10;
    goto LABEL_39;
  }
  v22 = v14 - v10;
  v23 = 16;
  if (v22 > 0x10)
    v23 = v22;
  if (v22 >= 0x7FFFFFFFFFFFFFFELL)
    v24 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v24 = v23;
  v25 = std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned short>>(v24);
  v26 = (char *)&v25[v20];
  v27 = (char *)(v25 + 16);
  do
    v25[v20++] = 32;
  while (v20 != 16);
  if (!v15)
  {
    do
    {
      v28 = *((_WORD *)v13 - 1);
      v13 -= 2;
      *((_WORD *)v26 - 1) = v28;
      v26 -= 2;
    }
    while (v13 != v10);
  }
  if (v10)
    operator delete(v10);
LABEL_39:
  v30 = (NSAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharactersNoCopy:length:freeWhenDone:", v26, (v27 - v26) >> 1, 0);
  CSStore2::AttributedStringWriter::string(*(CSStore2::AttributedStringWriter::Impl ***)(a1 + 32), v30);
  CSStore2::AttributedStringWriter::string(*(CSStore2::AttributedStringWriter::Impl ***)(a1 + 32), (NSAttributedString *)CFSTR("\n"));

  if (v26)
    operator delete(v26);

}

void sub_1A4E74FE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  if (v10)
    operator delete(v10);

  _Unwind_Resume(a1);
}

__n128 __copy_helper_block_ea8_32c45_ZTSKZN8CSStore24Show9ShowBytesEPKvS2_jEUlvE_(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(a2 + 32);
  v3 = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v3;
  return result;
}

void ___ZZN8CSStore24Show9ShowBytesEPKvS2_jENKUlvE_clEv_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[6];
  uint64_t v5;

  v5 = (**(_DWORD **)(a1 + 40) + **(_DWORD **)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3321888768;
  v4[2] = ___ZZZN8CSStore24Show9ShowBytesEPKvS2_jENKUlvE_clEvENKUlvE_clEv_block_invoke;
  v4[3] = &__block_descriptor_48_ea8_32c71_ZTSKZZZN8CSStore24Show9ShowBytesEPKvS2_jENKUlvE_clEvENKUlvE_clEvEUlvE__e5_v8__0l;
  v4[4] = *(_QWORD *)(a1 + 48);
  v4[5] = &v5;
  CSStore2::AttributedStringWriter::withAppliedAttribute(v2, (uint64_t)CFSTR("_CSVNum"), (uint64_t)v3, (uint64_t)v4);

}

void sub_1A4E750EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___ZZN8CSStore24Show9ShowBytesEPKvS2_jENKUlvE_clEv_block_invoke_136(uint64_t a1)
{
  CSStore2::AttributedStringWriter::string(*(CSStore2::AttributedStringWriter::Impl ***)(a1 + 32), (NSAttributedString *)CFSTR("\t"));
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned short>>(uint64_t a1)
{
  if (a1 < 0)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(2 * a1);
}

uint64_t __copy_helper_block_ea8_32c59_ZTSKZZN8CSStore24Show9ShowBytesEPKvS2_jENKUlvE_clEvEUlvE0_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 32) = *(_QWORD *)(a2 + 32);
  return result;
}

__n128 __copy_helper_block_ea8_32c58_ZTSKZZN8CSStore24Show9ShowBytesEPKvS2_jENKUlvE_clEvEUlvE_(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = a2[2];
  a1[3].n128_u64[0] = a2[3].n128_u64[0];
  a1[2] = result;
  return result;
}

void ___ZZZN8CSStore24Show9ShowBytesEPKvS2_jENKUlvE_clEvENKUlvE_clEv_block_invoke(uint64_t a1)
{
  CSStore2::AttributedStringWriter::format(*(CSStore2::AttributedStringWriter **)(a1 + 32), 0, CFSTR("0x%08llx %08llx:"), **(_QWORD **)(a1 + 40) & 0xFFFFFFFF00000000, **(_QWORD **)(a1 + 40));
}

__n128 __copy_helper_block_ea8_32c71_ZTSKZZZN8CSStore24Show9ShowBytesEPKvS2_jENKUlvE_clEvENKUlvE_clEvEUlvE_(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = a2[2];
  a1[2] = result;
  return result;
}

void ___ZN8CSStore2L10NameOfTypeINS_7HashMapIjjNS_20_IdentifierFunctionsELy1EEEEEP8NSStringv_block_invoke()
{
  uint64_t v0;
  void *v1;
  std::string __p;

  std::string::basic_string[abi:nn180100]<0>(&__p, "NSString *CSStore2::NameOfType() [T = CSStore2::HashMap<unsigned int, unsigned int, CSStore2::_IdentifierFunctions, 1>]_block_invoke");
  CSStore2::_CopyNameOfTypeImpl(&__p);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)CSStore2::NameOfType<CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>>(void)::result;
  CSStore2::NameOfType<CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>>(void)::result = v0;

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_1A4E75204(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::string::basic_string[abi:nn180100]<0>(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    abort();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

__n128 __copy_helper_block_ea8_32c68_ZTSKZN8CSStore24Show13TableContentsERKNS_5StoreEPKNS_5TableEbEUlvE_(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = a2[2];
  a1[2] = result;
  return result;
}

char *_CSStoreCopyDebugDescriptionOfTable(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t v6;
  CSStore2::Store *v7;
  char *result;

  if (performConstantAssertions)
  {
    v6 = *(_QWORD *)(a1 + 336);
    if (v6)
      (*(void (**)(_QWORD))(**(_QWORD **)(v6 + 8) + 8))(*(_QWORD *)(v6 + 8));
  }
  v7 = (CSStore2::Store *)(a1 + 8);
  result = CSStore2::Store::getTable(v7, a2);
  if (result)
  {
    CSStore2::Show::TableContents((CSStore2 **)v7, (const CSStore2::Store *)result, (const CSStore2::Table *)(a3 != 0));
    return (char *)objc_claimAutoreleasedReturnValue();
  }
  return result;
}

char *_CSStoreCopyDebugDescriptionOfUnit(uint64_t a1, unsigned int a2, unsigned int a3, int a4)
{
  int v7;
  uint64_t v10;
  uint64_t v11;
  char *Table;
  char *Unit;
  char *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  NSNumber *v19;
  char *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  int v24;
  BOOL v25;
  unint64_t v26;
  void *v28;
  CSStore2::Show *v29;
  NSAttributedString *v30;
  _QWORD v31[6];
  int v32;
  _QWORD v33[6];
  int v34;
  void (**v35)(CSStore2::AttributedStringWriter *__hidden);
  _QWORD v36[2];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD *v51;

  if (a1)
    v7 = -37516;
  else
    v7 = 0;
  if (v7 == a2)
    return _CSStoreCopyDebugDescriptionOfTable(a1, a3, a4);
  if (performConstantAssertions)
  {
    v10 = *(_QWORD *)(a1 + 336);
    if (v10)
      (*(void (**)(_QWORD))(**(_QWORD **)(v10 + 8) + 8))(*(_QWORD *)(v10 + 8));
  }
  v11 = a1 + 8;
  Table = CSStore2::Store::getTable((CSStore2::Store *)(a1 + 8), a2);
  if (!Table)
    return 0;
  Unit = CSStore2::Store::getUnit((CSStore2 **)(a1 + 8), (const CSStore2::Table *)Table, a3);
  if (!Unit)
    return 0;
  v14 = Unit;
  v15 = (void *)MEMORY[0x1A85AA4B4]();
  v35 = &off_1E4E21120;
  v36[0] = 0;
  v42 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v16 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v36[1] = v16;
  *(_QWORD *)&v42 = 0;
  v43 = 0u;
  v44 = 0u;
  DWORD2(v42) = 1065353216;
  LODWORD(v45) = 1065353216;
  WORD4(v45) = 0;
  *(_QWORD *)&v46 = 0;
  WORD4(v46) = 257;
  BYTE10(v46) = 0;
  v51 = v36;
  v34 = 4 * *(_DWORD *)v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3321888768;
  v33[2] = ___ZN8CSStore24Show12UnitContentsERKNS_5StoreEPKNS_4UnitEb_block_invoke;
  v33[3] = &__block_descriptor_48_ea8_32c66_ZTSKZN8CSStore24Show12UnitContentsERKNS_5StoreEPKNS_4UnitEbEUlvE__e5_v8__0l;
  v33[4] = &v35;
  v33[5] = &v34;
  CSStore2::AttributedStringWriter::withAppliedAttribute((uint64_t)&v35, (uint64_t)CFSTR("_CSVNum"), (uint64_t)v17, (uint64_t)v33);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *((unsigned int *)v14 + 1) + 8);
  v19 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)&v35, CFSTR("length"), v19);

  v20 = v14 + 8;
  v21 = *(_QWORD *)v11;
  if (*(_QWORD *)v11)
    v22 = *(_QWORD *)(v21 + 8);
  else
    v22 = 0;
  v24 = -1;
  v25 = (unint64_t)v20 >= v22;
  v26 = (unint64_t)&v20[-v22];
  if (v25 && !HIDWORD(v26))
  {
    if ((v26 + 1) > *(_DWORD *)(*(_QWORD *)(v21 + 8) + 12) || v26 == -1)
      v24 = -1;
    else
      v24 = v26;
  }
  v32 = v24;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v18;
  v31[1] = 3321888768;
  v31[2] = ___ZN8CSStore24Show12UnitContentsERKNS_5StoreEPKNS_4UnitEb_block_invoke_155;
  v31[3] = &__block_descriptor_48_ea8_32c67_ZTSKZN8CSStore24Show12UnitContentsERKNS_5StoreEPKNS_4UnitEbEUlvE0__e5_v8__0l;
  v31[4] = &v35;
  v31[5] = &v32;
  CSStore2::AttributedStringWriter::withAppliedAttribute((uint64_t)&v35, (uint64_t)CFSTR("_CSVNum"), (uint64_t)v28, (uint64_t)v31);

  if (a4)
  {
    CSStore2::AttributedStringWriter::separator((CSStore2::AttributedStringWriter::Impl **)&v35, (CSStore2::AttributedStringWriter *)0x2B, 0);
    if (*(_QWORD *)v11)
      v29 = *(CSStore2::Show **)(*(_QWORD *)v11 + 8);
    else
      v29 = 0;
    CSStore2::Show::ShowBytes(v29, v14, (const void *)(*((_DWORD *)v14 + 1) + 8));
    v30 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
    CSStore2::AttributedStringWriter::attributedString((CSStore2::AttributedStringWriter::Impl **)&v35, v30);

  }
  v23 = objc_msgSend(v16, "copy");
  CSStore2::AttributedStringWriter::~AttributedStringWriter((CSStore2::AttributedStringWriter *)&v35);

  objc_autoreleasePoolPop(v15);
  return (char *)v23;
}

void sub_1A4E756C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  void *v15;
  void *v16;
  va_list va;

  va_start(va, a15);

  CSStore2::AttributedStringWriter::~AttributedStringWriter((CSStore2::AttributedStringWriter *)va);
  _Unwind_Resume(a1);
}

void ___ZN8CSStore24Show12UnitContentsERKNS_5StoreEPKNS_4UnitEb_block_invoke(uint64_t a1)
{
  CSStore2::AttributedStringWriter::format(*(CSStore2::AttributedStringWriter **)(a1 + 32), CFSTR("unit ID"), CFSTR("%llu (0x%llx)"), **(unsigned int **)(a1 + 40), **(unsigned int **)(a1 + 40));
}

void ___ZN8CSStore24Show12UnitContentsERKNS_5StoreEPKNS_4UnitEb_block_invoke_155(uint64_t a1)
{
  CSStore2::AttributedStringWriter::format(*(CSStore2::AttributedStringWriter **)(a1 + 32), CFSTR("bytes"), CFSTR("0x%llx"), **(unsigned int **)(a1 + 40));
}

__n128 __copy_helper_block_ea8_32c67_ZTSKZN8CSStore24Show12UnitContentsERKNS_5StoreEPKNS_4UnitEbEUlvE0_(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = a2[2];
  a1[2] = result;
  return result;
}

__n128 __copy_helper_block_ea8_32c66_ZTSKZN8CSStore24Show12UnitContentsERKNS_5StoreEPKNS_4UnitEbEUlvE_(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = a2[2];
  a1[2] = result;
  return result;
}

uint64_t _CSStoreCopyDebugDescriptionOfBytesInRange(uint64_t a1, unsigned int a2, void *a3)
{
  uint64_t v6;
  uint64_t result;
  uint64_t v8;

  if (performConstantAssertions)
  {
    v6 = *(_QWORD *)(a1 + 336);
    if (v6)
      (*(void (**)(_QWORD))(**(_QWORD **)(v6 + 8) + 8))(*(_QWORD *)(v6 + 8));
  }
  result = 0;
  if (!__CFADD__(a2, (_DWORD)a3))
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
    if (a2 + a3 <= *(_DWORD *)(v8 + 12))
    {
      CSStore2::Show::ShowBytes((CSStore2::Show *)(v8 + 100 * a2), (char *)(v8 + 100 * a2), a3);
      return objc_claimAutoreleasedReturnValue();
    }
  }
  return result;
}

uint64_t _CSStoreCopyMemoryStatistics(uint64_t a1)
{
  uint64_t v2;
  CSStore2 **v3;
  void *v4;
  const CSStore2::Store *v5;
  unsigned int *StringCache;
  unint64_t v7;
  unint64_t v8;
  id v9;
  uint64_t *v10;
  uint64_t *v11;
  _QWORD *v12;
  _QWORD *v13;
  CSStore2::AttributedStringWriter *v14;
  uint64_t **v15;
  void **v16;
  char *v17;
  uint64_t **v18;
  std::string *v19;
  __int128 v20;
  uint64_t *v21;
  uint64_t *v22;
  BOOL v23;
  uint64_t v24;
  unint64_t v26;
  void (**v27)(CSStore2::AttributedStringWriter *__hidden);
  _QWORD v28[2];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD *v43;
  _QWORD v44[11];
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  _QWORD *(*v56)(_QWORD *, _QWORD *);
  void (*v57)(uint64_t);
  const char *v58;
  char **v59;
  char *v60[2];
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  _QWORD *(*v64)(_QWORD *, _QWORD *);
  void (*v65)(uint64_t);
  const char *v66;
  char **v67;
  char *v68[2];
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;

  if (performConstantAssertions)
  {
    v2 = *(_QWORD *)(a1 + 336);
    if (v2)
      (*(void (**)(_QWORD))(**(_QWORD **)(v2 + 8) + 8))(*(_QWORD *)(v2 + 8));
  }
  v3 = (CSStore2 **)(a1 + 8);
  v4 = (void *)MEMORY[0x1A85AA4B4]();
  v73 = 0;
  v74 = &v73;
  v75 = 0x2020000000;
  v76 = 0;
  v69 = 0;
  v70 = &v69;
  v71 = 0x2020000000;
  v72 = 0;
  v61 = 0;
  v62 = &v61;
  v63 = 0x4812000000;
  v64 = __Block_byref_object_copy__191;
  v65 = __Block_byref_object_dispose__192;
  v68[0] = 0;
  v68[1] = 0;
  v66 = "";
  v67 = v68;
  v53 = 0;
  v54 = &v53;
  v55 = 0x4812000000;
  v56 = __Block_byref_object_copy__191;
  v57 = __Block_byref_object_dispose__192;
  v60[0] = 0;
  v60[1] = 0;
  v58 = "";
  v59 = v60;
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = ___ZN8CSStore24Show16MemoryStatisticsERKNS_5StoreE_block_invoke;
  v44[3] = &unk_1E4E21D20;
  v44[4] = &v73;
  v44[5] = &v61;
  v44[9] = &v49;
  v44[10] = v3;
  v44[6] = &v53;
  v44[7] = &v45;
  v44[8] = &v69;
  CSStore2::Store::enumerateTables(v3, v44);
  StringCache = (unsigned int *)CSStore2::getStringCache((CSStore2 *)v3, v5);
  if (StringCache)
  {
    CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::GetStatistics(StringCache);
    v8 = HIDWORD(v7);
  }
  else
  {
    v8 = 0;
  }
  v26 = v8;
  v27 = &off_1E4E21120;
  v28[0] = 0;
  v34 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v9 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v28[1] = v9;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  *(_QWORD *)&v34 = 0;
  DWORD2(v34) = 1065353216;
  v35 = 0u;
  v36 = 0u;
  LODWORD(v37) = 1065353216;
  WORD4(v37) = 0;
  *(_QWORD *)&v38 = 0;
  WORD4(v38) = 257;
  BYTE10(v38) = 0;
  v43 = v28;
  CSStore2::AttributedStringWriter::separator((CSStore2::AttributedStringWriter::Impl **)&v27, (CSStore2::AttributedStringWriter *)0x2B, CFSTR("Structure Sizes"));
  CSStore2::Show::ShowSize((CSStore2::Show *)&v27, (CSStore2::AttributedStringWriter *)CFSTR("sizeof(Data)"), (NSString *)0xFFFFFFFFFFFFFFFFLL, 100);
  CSStore2::Show::ShowSize((CSStore2::Show *)&v27, (CSStore2::AttributedStringWriter *)CFSTR("sizeof(Table)"), (NSString *)0xFFFFFFFFFFFFFFFFLL, 80);
  CSStore2::Show::ShowSize((CSStore2::Show *)&v27, (CSStore2::AttributedStringWriter *)CFSTR("sizeof(Unit)"), (NSString *)0xFFFFFFFFFFFFFFFFLL, 8);
  CSStore2::Show::ShowSize((CSStore2::Show *)&v27, (CSStore2::AttributedStringWriter *)CFSTR("sizeof(IdentifierCache)"), (NSString *)0xFFFFFFFFFFFFFFFFLL, 4);
  CSStore2::AttributedStringWriter::separator((CSStore2::AttributedStringWriter::Impl **)&v27, (CSStore2::AttributedStringWriter *)0x2B, CFSTR("Memory by Table"));
  v10 = (uint64_t *)v62[6];
  v11 = v62 + 7;
  if (v10 != v62 + 7)
  {
    do
    {
      v12 = v10 + 4;
      v13 = v10 + 4;
      if (*((char *)v10 + 55) < 0)
        v13 = (_QWORD *)*v12;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v13);
      v14 = (CSStore2::AttributedStringWriter *)objc_claimAutoreleasedReturnValue();
      v15 = (uint64_t **)(v54 + 6);
      v16 = (void **)std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::__find_equal<std::string>((uint64_t)(v54 + 6), &v77, v10 + 4);
      v17 = (char *)*v16;
      if (!*v16)
      {
        v18 = (uint64_t **)v16;
        v17 = (char *)operator new(0x40uLL);
        v19 = (std::string *)(v17 + 32);
        if (*((char *)v10 + 55) < 0)
        {
          std::string::__init_copy_ctor_external(v19, (const std::string::value_type *)v10[4], v10[5]);
        }
        else
        {
          v20 = *(_OWORD *)v12;
          *((_QWORD *)v17 + 6) = v10[6];
          *(_OWORD *)&v19->__r_.__value_.__l.__data_ = v20;
        }
        *((_QWORD *)v17 + 7) = 0;
        std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::__insert_node_at(v15, v77, v18, (uint64_t *)v17);
      }
      CSStore2::Show::ShowSize((CSStore2::Show *)&v27, v14, *((NSString **)v17 + 7), v10[7]);

      v21 = (uint64_t *)v10[1];
      if (v21)
      {
        do
        {
          v22 = v21;
          v21 = (uint64_t *)*v21;
        }
        while (v21);
      }
      else
      {
        do
        {
          v22 = (uint64_t *)v10[2];
          v23 = *v22 == (_QWORD)v10;
          v10 = v22;
        }
        while (!v23);
      }
      v10 = v22;
    }
    while (v22 != v11);
  }
  CSStore2::AttributedStringWriter::separator((CSStore2::AttributedStringWriter::Impl **)&v27, (CSStore2::AttributedStringWriter *)0x2B, CFSTR("Memory Summary"));
  CSStore2::Show::ShowSize((CSStore2::Show *)&v27, (CSStore2::AttributedStringWriter *)CFSTR("Tables"), (NSString *)0xFFFFFFFFFFFFFFFFLL, v74[3]);
  CSStore2::Show::ShowSize((CSStore2::Show *)&v27, (CSStore2::AttributedStringWriter *)CFSTR("Identifier caches"), (NSString *)0xFFFFFFFFFFFFFFFFLL, v50[3]);
  CSStore2::Show::ShowSize((CSStore2::Show *)&v27, (CSStore2::AttributedStringWriter *)CFSTR("String caches"), (NSString *)0xFFFFFFFFFFFFFFFFLL, v26);
  CSStore2::Show::ShowSize((CSStore2::Show *)&v27, (CSStore2::AttributedStringWriter *)CFSTR("All units"), (NSString *)v70[3], v46[3]);
  CSStore2::Show::ShowSize((CSStore2::Show *)&v27, (CSStore2::AttributedStringWriter *)CFSTR("Collectable"), (NSString *)0xFFFFFFFFFFFFFFFFLL, (*(_DWORD *)(*((_QWORD *)*v3 + 1) + 12) - *(_DWORD *)(*((_QWORD *)*v3 + 1) + 16)));
  CSStore2::Show::ShowSize((CSStore2::Show *)&v27, (CSStore2::AttributedStringWriter *)CFSTR("Total bytes used"), (NSString *)0xFFFFFFFFFFFFFFFFLL, *(unsigned int *)(*((_QWORD *)*v3 + 1) + 16));
  v24 = objc_msgSend(v9, "copy");
  CSStore2::AttributedStringWriter::~AttributedStringWriter((CSStore2::AttributedStringWriter *)&v27);

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);
  std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::destroy(v60[0]);
  _Block_object_dispose(&v61, 8);
  std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::destroy(v68[0]);
  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v73, 8);
  objc_autoreleasePoolPop(v4);
  return v24;
}

void sub_1A4E75D14(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

_QWORD *__Block_byref_object_copy__191(_QWORD *result, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  result[6] = a2[6];
  v2 = a2 + 7;
  v3 = a2[7];
  result[7] = v3;
  v4 = result + 7;
  v5 = a2[8];
  result[8] = v5;
  if (v5)
  {
    *(_QWORD *)(v3 + 16) = v4;
    a2[6] = v2;
    *v2 = 0;
    a2[8] = 0;
  }
  else
  {
    result[6] = v4;
  }
  return result;
}

void __Block_byref_object_dispose__192(uint64_t a1)
{
  std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::destroy(*(char **)(a1 + 56));
}

void ___ZN8CSStore24Show16MemoryStatisticsERKNS_5StoreE_block_invoke(uint64_t a1, CSStore2::Table *this)
{
  uint64_t v4;
  __CFString *v5;
  _OWORD *v6;
  uint64_t v7;
  __CFString *v8;
  char *v9;
  char *v10;
  CSStore2 **v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v15;
  _QWORD v16[4];
  __int128 v17;
  char *v18;
  char *v19;
  void *__p[2];
  char v21;
  void **v22;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += (*((_DWORD *)this + 1) - 72) + 80;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = objc_retainAutorelease((id)CSStore2::Table::copyCFName(this));
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)-[__CFString UTF8String](v5, "UTF8String"));
  v22 = __p;
  v6 = std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)(v4 + 48), __p, (_OWORD **)&v22);
  if (v21 < 0)
    operator delete(__p[0]);

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = objc_retainAutorelease((id)CSStore2::Table::copyCFName(this));
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)-[__CFString UTF8String](v8, "UTF8String"));
  v22 = __p;
  v9 = (char *)v6 + 56;
  v10 = (char *)std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)(v7 + 48), __p, (_OWORD **)&v22)+ 56;
  if (v21 < 0)
    operator delete(__p[0]);

  v11 = *(CSStore2 ***)(a1 + 80);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = ___ZN8CSStore24Show16MemoryStatisticsERKNS_5StoreE_block_invoke_2;
  v16[3] = &unk_1E4E21CF8;
  v18 = v9;
  v19 = v10;
  v17 = *(_OWORD *)(a1 + 56);
  CSStore2::Store::enumerateUnits(v11, (unsigned int *)this, v16);
  v12 = *((unsigned int *)this + 19);
  if ((_DWORD)v12 != -1)
  {
    v13 = *(_QWORD *)(**(_QWORD **)(a1 + 80) + 8);
    if (*(_DWORD *)(v13 + 12) > v12 && v13 != 0)
    {
      CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::GetStatistics((unsigned int *)(v13 + v12));
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) += HIDWORD(v15);
    }
  }
}

void sub_1A4E75F9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  void *v22;

  if (a22 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void CSStore2::Show::ShowSize(CSStore2::Show *this, CSStore2::AttributedStringWriter *a2, NSString *a3, uint64_t a4)
{
  CSStore2::AttributedStringWriter *v7;
  void *v8;
  NSAttributedString *v9;
  uint64_t v10;
  _QWORD v11[7];
  _QWORD v12[5];
  _QWORD v13[6];
  void (**v14)(CSStore2::AttributedStringWriter *__hidden);
  _QWORD v15[2];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD *v30;
  uint64_t v31;
  NSString *v32;

  v7 = a2;
  v31 = a4;
  v32 = a3;
  v8 = (void *)MEMORY[0x1A85AA4B4]();
  if (CSStore2::Show::ShowSize(CSStore2::AttributedStringWriter &,NSString *,unsigned long long,unsigned long long)::once != -1)
    dispatch_once(&CSStore2::Show::ShowSize(CSStore2::AttributedStringWriter &,NSString *,unsigned long long,unsigned long long)::once, &__block_literal_global_189);
  v14 = &off_1E4E21120;
  v15[0] = 0;
  v21 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v9 = (NSAttributedString *)objc_alloc_init(MEMORY[0x1E0CB3778]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v15[1] = v9;
  *(_QWORD *)&v21 = 0;
  v22 = 0u;
  v23 = 0u;
  DWORD2(v21) = 1065353216;
  LODWORD(v24) = 1065353216;
  WORD4(v24) = 0;
  *(_QWORD *)&v25 = 0;
  WORD4(v25) = 1;
  BYTE10(v25) = 0;
  v30 = v15;
  v10 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3321888768;
  v13[2] = ___ZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyy_block_invoke_2;
  v13[3] = &__block_descriptor_48_ea8_32c78_ZTSKZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyyEUlvE__e5_v8__0l;
  v13[4] = &v14;
  v13[5] = &v31;
  CSStore2::AttributedStringWriter::withAppliedAttribute((uint64_t)&v14, (uint64_t)CFSTR("_CSVFixed"), MEMORY[0x1E0C9AAB0], (uint64_t)v13);
  v12[0] = v10;
  v12[1] = 3321888768;
  v12[2] = ___ZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyy_block_invoke_192;
  v12[3] = &__block_descriptor_40_ea8_32c79_ZTSKZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyyEUlvE0__e5_v8__0l;
  v12[4] = &v14;
  CSStore2::AttributedStringWriter::withAppliedAttribute((uint64_t)&v14, (uint64_t)CFSTR("_CSVOutputType"), (uint64_t)&unk_1E4E25418, (uint64_t)v12);
  v11[0] = v10;
  v11[1] = 3321888768;
  v11[2] = ___ZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyy_block_invoke_194;
  v11[3] = &__block_descriptor_56_ea8_32c79_ZTSKZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyyEUlvE1__e5_v8__0l;
  v11[4] = &v32;
  v11[5] = &v14;
  v11[6] = &v31;
  CSStore2::AttributedStringWriter::withAppliedAttribute((uint64_t)&v14, (uint64_t)CFSTR("_CSVFixed"), MEMORY[0x1E0C9AAB0], (uint64_t)v11);
  CSStore2::AttributedStringWriter::attributedString(this, (NSAttributedString *)v7, v9);
  CSStore2::AttributedStringWriter::~AttributedStringWriter((CSStore2::AttributedStringWriter *)&v14);

  objc_autoreleasePoolPop(v8);
}

void sub_1A4E7620C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::destroy(char *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::destroy(*(_QWORD *)a1);
    std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::destroy(*((_QWORD *)a1 + 1));
    if (a1[55] < 0)
      operator delete(*((void **)a1 + 4));
    operator delete(a1);
  }
}

_QWORD *std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::__find_equal<std::string>(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v7;
  _QWORD *v8;

  v5 = (_QWORD *)(a1 + 8);
  v4 = *(_QWORD **)(a1 + 8);
  if (v4)
  {
    do
    {
      while (1)
      {
        v7 = v4;
        v8 = v4 + 4;
        if (!std::less<std::string>::operator()[abi:nn180100](a3, v4 + 4))
          break;
        v4 = (_QWORD *)*v7;
        v5 = v7;
        if (!*v7)
          goto LABEL_9;
      }
      if (!std::less<std::string>::operator()[abi:nn180100](v8, a3))
        break;
      v5 = v7 + 1;
      v4 = (_QWORD *)v7[1];
    }
    while (v4);
  }
  else
  {
    v7 = (_QWORD *)(a1 + 8);
  }
LABEL_9:
  *a2 = v7;
  return v5;
}

uint64_t **std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::__insert_node_at(uint64_t **result, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t *v8;
  _BYTE *v9;
  int v10;
  uint64_t v11;
  int v12;
  uint64_t **v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v4 = (uint64_t *)**result;
  if (v4)
  {
    *result = v4;
    a4 = *a3;
  }
  v5 = result[1];
  *((_BYTE *)a4 + 24) = a4 == v5;
  if (a4 != v5)
  {
    do
    {
      v6 = (uint64_t *)a4[2];
      if (*((_BYTE *)v6 + 24))
        break;
      v7 = (uint64_t *)v6[2];
      v8 = (uint64_t *)*v7;
      if ((uint64_t *)*v7 == v6)
      {
        v11 = v7[1];
        if (!v11 || (v12 = *(unsigned __int8 *)(v11 + 24), v9 = (_BYTE *)(v11 + 24), v12))
        {
          if ((uint64_t *)*v6 == a4)
          {
            v13 = (uint64_t **)a4[2];
          }
          else
          {
            v13 = (uint64_t **)v6[1];
            v14 = *v13;
            v6[1] = (uint64_t)*v13;
            if (v14)
            {
              v14[2] = (uint64_t)v6;
              v7 = (uint64_t *)v6[2];
            }
            v13[2] = v7;
            *(_QWORD *)(v6[2] + 8 * (*(_QWORD *)v6[2] != (_QWORD)v6)) = v13;
            *v13 = v6;
            v6[2] = (uint64_t)v13;
            v7 = v13[2];
            v6 = (uint64_t *)*v7;
          }
          *((_BYTE *)v13 + 24) = 1;
          *((_BYTE *)v7 + 24) = 0;
          v17 = v6[1];
          *v7 = v17;
          if (v17)
            *(_QWORD *)(v17 + 16) = v7;
          v6[2] = v7[2];
          *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v6;
          v6[1] = (uint64_t)v7;
          goto LABEL_29;
        }
      }
      else if (!v8 || (v10 = *((unsigned __int8 *)v8 + 24), v9 = v8 + 3, v10))
      {
        if ((uint64_t *)*v6 == a4)
        {
          v15 = a4[1];
          *v6 = v15;
          if (v15)
          {
            *(_QWORD *)(v15 + 16) = v6;
            v7 = (uint64_t *)v6[2];
          }
          a4[2] = (uint64_t)v7;
          *(_QWORD *)(v6[2] + 8 * (*(_QWORD *)v6[2] != (_QWORD)v6)) = a4;
          a4[1] = (uint64_t)v6;
          v6[2] = (uint64_t)a4;
          v7 = (uint64_t *)a4[2];
        }
        else
        {
          a4 = (uint64_t *)a4[2];
        }
        *((_BYTE *)a4 + 24) = 1;
        *((_BYTE *)v7 + 24) = 0;
        v6 = (uint64_t *)v7[1];
        v16 = *v6;
        v7[1] = *v6;
        if (v16)
          *(_QWORD *)(v16 + 16) = v7;
        v6[2] = v7[2];
        *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v6;
        *v6 = (uint64_t)v7;
LABEL_29:
        v7[2] = (uint64_t)v6;
        break;
      }
      *((_BYTE *)v6 + 24) = 1;
      a4 = v7;
      *((_BYTE *)v7 + 24) = v7 == v5;
      *v9 = 1;
    }
    while (v7 != v5);
  }
  result[2] = (uint64_t *)((char *)result[2] + 1);
  return result;
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  std::string *v5;
  std::string::size_type v6;
  std::string::size_type v7;
  std::string *v8;

  v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8)
      abort();
    v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17)
      v6 = __sz | 7;
    v7 = v6 + 1;
    v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    v5 = v8;
  }
  else
  {
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

BOOL std::less<std::string>::operator()[abi:nn180100](_QWORD *a1, _QWORD *a2)
{
  int v2;
  int v3;
  size_t v4;
  size_t v5;
  size_t v6;
  int v7;

  v2 = *((char *)a2 + 23);
  v3 = *((char *)a1 + 23);
  if (v3 >= 0)
    v4 = *((unsigned __int8 *)a1 + 23);
  else
    v4 = a1[1];
  if (v3 < 0)
    a1 = (_QWORD *)*a1;
  if (v2 >= 0)
    v5 = *((unsigned __int8 *)a2 + 23);
  else
    v5 = a2[1];
  if (v2 < 0)
    a2 = (_QWORD *)*a2;
  if (v5 >= v4)
    v6 = v4;
  else
    v6 = v5;
  v7 = memcmp(a1, a2, v6);
  if (v7)
    return v7 < 0;
  else
    return v4 < v5;
}

void ___ZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyy_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  _QWORD v5[4];
  __int128 v6;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", **(_QWORD **)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v5[1] = 3321888768;
  v5[2] = ___ZZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyyENKUlvE_clEv_block_invoke;
  v5[3] = &__block_descriptor_48_ea8_32c91_ZTSKZZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyyENKUlvE_clEvEUlvE__e5_v8__0l;
  v6 = *(_OWORD *)(a1 + 32);
  v4 = (id)v3;
  v5[0] = MEMORY[0x1E0C809B0];
  CSStore2::AttributedStringWriter::withAppliedAttribute(v2, (uint64_t)CFSTR("_CSVNum"), v3, (uint64_t)v5);

}

void sub_1A4E7665C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void ___ZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyy_block_invoke_192(uint64_t a1)
{
  CSStore2::AttributedStringWriter::string(*(CSStore2::AttributedStringWriter::Impl ***)(a1 + 32), (NSAttributedString *)CFSTR(" "));
}

void ___ZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyy_block_invoke_194(int8x16_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  int8x16_t v7;
  uint64_t v8;

  v1 = a1[2].i64[1];
  if (*(_QWORD *)a1[2].i64[0] == -1)
  {
    CSStore2::AttributedStringWriter::string((CSStore2::AttributedStringWriter::Impl **)a1[2].i64[1], (NSAttributedString *)CFSTR("-----"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
    v3 = objc_claimAutoreleasedReturnValue();
    v6[1] = 3321888768;
    v6[2] = ___ZZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyyENKUlvE1_clEv_block_invoke;
    v6[3] = &__block_descriptor_56_ea8_32c92_ZTSKZZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyyENKUlvE1_clEvEUlvE__e5_v8__0l;
    v4 = a1[3].i64[0];
    v7 = vextq_s8(a1[2], a1[2], 8uLL);
    v8 = v4;
    v5 = (id)v3;
    v6[0] = MEMORY[0x1E0C809B0];
    CSStore2::AttributedStringWriter::withAppliedAttribute(v1, (uint64_t)CFSTR("_CSVNum"), v3, (uint64_t)v6);

  }
}

void sub_1A4E7673C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{

  _Unwind_Resume(a1);
}

__n128 __copy_helper_block_ea8_32c79_ZTSKZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyyEUlvE1_(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = a2[2];
  a1[3].n128_u64[0] = a2[3].n128_u64[0];
  a1[2] = result;
  return result;
}

void ___ZZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyyENKUlvE1_clEv_block_invoke(uint64_t a1)
{
  unint64_t v2;
  CSStore2::AttributedStringWriter *v3;
  id v4;

  CSStore2::AttributedStringWriter::format(*(CSStore2::AttributedStringWriter **)(a1 + 32), 0, CFSTR("%llu units"), **(_QWORD **)(a1 + 40));
  v2 = **(_QWORD **)(a1 + 40);
  if (v2 >= 2)
  {
    v3 = *(CSStore2::AttributedStringWriter **)(a1 + 32);
    objc_msgSend((id)CSStore2::Show::ShowSize(CSStore2::AttributedStringWriter &,NSString *,unsigned long long,unsigned long long)::bf, "stringFromByteCount:", **(_QWORD **)(a1 + 48) / v2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    CSStore2::AttributedStringWriter::format(v3, 0, CFSTR(" (≅%@/unit)"), v4);

  }
}

void sub_1A4E76804(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

__n128 __copy_helper_block_ea8_32c92_ZTSKZZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyyENKUlvE1_clEvEUlvE_(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = a2[2];
  a1[3].n128_u64[0] = a2[3].n128_u64[0];
  a1[2] = result;
  return result;
}

uint64_t __copy_helper_block_ea8_32c79_ZTSKZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyyEUlvE0_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 32) = *(_QWORD *)(a2 + 32);
  return result;
}

__n128 __copy_helper_block_ea8_32c78_ZTSKZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyyEUlvE_(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = a2[2];
  a1[2] = result;
  return result;
}

void ___ZZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyyENKUlvE_clEv_block_invoke(uint64_t a1)
{
  CSStore2::AttributedStringWriter *v1;
  uint64_t v2;
  id v3;

  v1 = *(CSStore2::AttributedStringWriter **)(a1 + 32);
  v2 = **(_QWORD **)(a1 + 40);
  objc_msgSend((id)CSStore2::Show::ShowSize(CSStore2::AttributedStringWriter &,NSString *,unsigned long long,unsigned long long)::bf, "stringFromByteCount:", v2);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CSStore2::AttributedStringWriter::format(v1, 0, CFSTR("%10llu (%10s)"), v2, objc_msgSend(v3, "UTF8String"));

}

void sub_1A4E768A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{

  _Unwind_Resume(a1);
}

__n128 __copy_helper_block_ea8_32c91_ZTSKZZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyyENKUlvE_clEvEUlvE_(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = a2[2];
  a1[2] = result;
  return result;
}

void ___ZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyy_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB34E8]);
  v1 = (void *)CSStore2::Show::ShowSize(CSStore2::AttributedStringWriter &,NSString *,unsigned long long,unsigned long long)::bf;
  CSStore2::Show::ShowSize(CSStore2::AttributedStringWriter &,NSString *,unsigned long long,unsigned long long)::bf = (uint64_t)v0;

}

_OWORD *std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t **a1, _QWORD *a2, _OWORD **a3)
{
  void **v5;
  _OWORD *v6;
  uint64_t **v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v11;

  v5 = (void **)std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::__find_equal<std::string>((uint64_t)a1, &v11, a2);
  v6 = *v5;
  if (!*v5)
  {
    v7 = (uint64_t **)v5;
    v6 = operator new(0x40uLL);
    v8 = *a3;
    v9 = *((_QWORD *)*a3 + 2);
    v6[2] = **a3;
    *((_QWORD *)v6 + 6) = v9;
    *v8 = 0;
    v8[1] = 0;
    v8[2] = 0;
    *((_QWORD *)v6 + 7) = 0;
    std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::__insert_node_at(a1, v11, v7, (uint64_t *)v6);
  }
  return v6;
}

uint64_t ___ZN8CSStore24Show16MemoryStatisticsERKNS_5StoreE_block_invoke_2(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *(unsigned int *)(a2 + 4) + 8;
  v3 = *(_QWORD **)(result + 56);
  **(_QWORD **)(result + 48) += v2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += v2;
  ++*v3;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24);
  return result;
}

void sub_1A4E76A44(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A4E76EE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A4E77194(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A4E776DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1A4E77984(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  void *v13;

  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_1A4E77A8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A4E77B2C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4E77CD8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A4E783FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1A4E78744(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, const __CFString *a12, uint64_t a13, const __CFString *a14, const __CFString *a15, void *a16, const __CFString *a17, CSStore2 *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,int buf)
{
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  CSStore2 *v34;
  CSStore2 *v35;
  void *v36;
  void *v37;
  NSObject *v38;

  if (a2 == 1)
  {
    v34 = (CSStore2 *)objc_begin_catch(a1);
    v35 = v34;
    if (!v28)
    {
      v36 = (void *)MEMORY[0x1E0CB35C8];
      a11 = *MEMORY[0x1E0CB2938];
      a12 = CFSTR("Line");
      a15 = CFSTR("kCSStorePredicateErr");
      a16 = &unk_1E4E254C0;
      a13 = *MEMORY[0x1E0CB2D68];
      a14 = CFSTR("Exception");
      a17 = CFSTR("An exception was thrown while parsing the predicate string (interpreting as an expression because predicate parsing already failed.)");
      a18 = v34;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &a15, &a11, 4);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -9495, v37);
      objc_claimAutoreleasedReturnValue();

    }
    CSStore2::GetLog(v34);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      buf = 138477827;
      *(_QWORD *)(v31 + 4) = v35;
      _os_log_impl(&dword_1A4E5A000, v38, OS_LOG_TYPE_DEFAULT, "Suppressing exception during expression parsing: %{private}@", (uint8_t *)&buf, 0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x1A4E786E0);
  }

  _Unwind_Resume(a1);
}

void sub_1A4E78C6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__290(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(a2 + 48);
  v3 = *(_OWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v3;
  return result;
}

unsigned int *CSStore2::String::Create(CSStore2::String *this, char **a2, CSStore2::_StringFunctions *a3, const char *a4)
{
  unsigned int v4;
  __int128 v8;
  char v9;
  unsigned int *result;
  char *Table;
  char *v12;
  unint64_t v13;
  unsigned int v14;
  BOOL v15;
  unint64_t v16;
  unint64_t v18;
  NSUInteger v19;
  char *v20;
  unint64_t v21;
  int v22;
  unint64_t v23;
  void *v25;
  uint64_t v26;
  unsigned int v27;
  unsigned int v28;
  uint64_t v29;
  char *v30;
  NSUInteger v31;
  int v32;
  NSUInteger v33;
  const CSStore2::Store *v35;
  unsigned int *v36;
  unsigned int *v37;
  char *v38;
  unint64_t v39;
  unsigned int v40;
  unint64_t v41;
  const CSStore2::Store *v43;
  unsigned int *v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  BOOL v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  _DWORD *v53;
  unsigned int v54;
  char *v55;
  unint64_t v56;
  unsigned int v57;
  char *v58;
  uint64_t v60;
  _DWORD *v61;
  char *v62;
  unint64_t v63;
  int v64;
  unint64_t v65;
  unsigned int *v67;
  unsigned int *v68;
  unsigned int v69;
  int v70;
  __int128 v71;
  __int128 v72;
  int v73;
  void *v74[2];

  v4 = a4;
  *(_BYTE *)this = 0;
  *((_BYTE *)this + 32) = 0;
  CSStore2::String::Find((CSStore2::String *)&v71, (CSStore2::Store *)a2, a3, a4);
  v8 = v72;
  *(_OWORD *)this = v71;
  *((_OWORD *)this + 1) = v8;
  v9 = v73;
  *((_BYTE *)this + 32) = v73;
  if (v9)
    return CSStore2::String::retain((unsigned int *)this);
  Table = a2[34];
  if (!Table)
  {
    Table = CSStore2::Store::getTable((CSStore2 **)a2, CFSTR("<string>"));
    if (!Table)
    {
      result = (unsigned int *)CSStore2::Store::allocateTable((CSStore2::Store *)a2, CFSTR("<string>"), 4, 0);
      if (!result)
        return result;
      v12 = *a2;
      if (*a2)
        v13 = *((_QWORD *)v12 + 1);
      else
        v13 = 0;
      v14 = -1;
      v15 = (unint64_t)result >= v13;
      v16 = (unint64_t)result - v13;
      if (v15 && !HIDWORD(v16))
      {
        if ((v16 + 1) > *(_DWORD *)(*((_QWORD *)v12 + 1) + 12) || v16 == -1)
          v14 = -1;
        else
          v14 = v16;
      }
      if (a2[34] || CSStore2::Store::getTable((CSStore2 **)a2, CFSTR("<string>")))
      {
        v71 = 0u;
        v72 = 0u;
        v73 = 1065353216;
        v18 = CSStore2::Store::extend((CSStore2::Store *)a2, 0x23884u);
        v19 = v18;
        if (v18)
        {
          v20 = *a2;
          if (*a2)
            v21 = *((_QWORD *)v20 + 1);
          else
            v21 = 0;
          v22 = -1;
          v15 = v18 >= v21;
          v23 = v18 - v21;
          if (v15 && !HIDWORD(v23))
          {
            if ((v23 + 1) > *(_DWORD *)(*((_QWORD *)v20 + 1) + 12) || v23 == -1)
              v22 = -1;
            else
              v22 = v23;
          }
          CSStore2::HashMap<unsigned int,CSStore2::_StringCacheEntry,CSStore2::_StringFunctions,0ull>::Create(v74, (CSStore2::_StringFunctions *)a2, (uint64_t)&v71, v22, 0);
          v25 = v74[0];
          if (v74[0])
          {
            CSStore2::VM::Copy(v19, (NSUInteger)v74[0], (const void *)0x23884);
            ((void (*)(void *))v74[1])(v25);
          }
          else
          {
            CSStore2::Store::assertNotEnumeratingUnits((uint64_t)a2);
            v19 = 0;
            v26 = *((_QWORD *)*a2 + 1);
            v27 = *(_DWORD *)(v26 + 16);
            v15 = v27 >= 0x23884;
            v28 = v27 - 145540;
            if (!v15)
              v28 = 0;
            *(_DWORD *)(v26 + 16) = v28;
            ++*(_DWORD *)(v26 + 8);
          }
        }
        std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)&v71);
      }
      else
      {
        v19 = 0;
      }
      if (v14 == -1 || (v29 = *((_QWORD *)*a2 + 1), *(_DWORD *)(v29 + 12) <= v14))
        Table = 0;
      else
        Table = (char *)(v29 + v14);
      if (v19)
      {
        v30 = *a2;
        if (*a2)
          v31 = *((_QWORD *)v30 + 1);
        else
          v31 = 0;
        v32 = -1;
        v15 = v19 >= v31;
        v33 = v19 - v31;
        if (v15 && !HIDWORD(v33))
        {
          if ((v33 + 1) > *(_DWORD *)(*((_QWORD *)v30 + 1) + 12) || v33 == -1)
            v32 = -1;
          else
            v32 = v33;
        }
      }
      else
      {
        v32 = -1;
      }
      *((_DWORD *)Table + 20) = v32;
    }
  }
  result = (unsigned int *)CSStore2::Store::allocateUnit((CSStore2::Store *)a2, (CSStore2::Table *)Table, v4, 0);
  if (result)
  {
    v36 = result;
    if (v4)
      memmove(result + 2, a3, v4);
    result = (unsigned int *)CSStore2::getStringCache((CSStore2 *)a2, v35);
    if (!result)
      goto LABEL_120;
    v37 = result;
    v38 = *a2;
    if (*a2)
      v39 = *((_QWORD *)v38 + 1);
    else
      v39 = 0;
    v40 = -1;
    v15 = (unint64_t)v36 >= v39;
    v41 = (unint64_t)v36 - v39;
    if (v15 && !HIDWORD(v41))
    {
      if ((v41 + 1) > *(_DWORD *)(*((_QWORD *)v38 + 1) + 12) || v41 == -1)
        v40 = -1;
      else
        v40 = v41;
    }
    v43 = (const CSStore2::Store *)(4 * *v36);
    LODWORD(v71) = (_DWORD)v43;
    if (!(_DWORD)v43)
    {
LABEL_119:
      v36 = (unsigned int *)(*((_QWORD *)*a2 + 1) + v40);
LABEL_120:
      v69 = v36[1];
      v70 = 4 * *v36;
      *(_QWORD *)this = a2;
      *((_DWORD *)this + 2) = v70;
      *((_BYTE *)this + 12) = 0;
      *((_QWORD *)this + 2) = v36 + 2;
      *((_DWORD *)this + 6) = v69;
      *((_BYTE *)this + 32) = 1;
      return result;
    }
    result = CSStore2::HashMap<unsigned int,CSStore2::_StringCacheEntry,CSStore2::_StringFunctions,0ull>::Find((CSStore2 *)a2, result, &v71);
    if (result)
    {
      *result = 257;
      goto LABEL_119;
    }
    result = (unsigned int *)CSStore2::_StringFunctions::getHashCode((CSStore2::_StringFunctions *)a2, v43);
    v44 = &v37[2 * (result % *v37)];
    v45 = (unint64_t)(v44 + 1);
    v46 = v44[2];
    if ((_DWORD)v46 == -1)
    {
      v50 = 0;
    }
    else
    {
      v47 = *((_QWORD *)*a2 + 1);
      v48 = *(_DWORD *)(v47 + 12) > v46;
      v49 = (char *)(v47 + v46);
      if (v48)
        v50 = v49;
      else
        v50 = 0;
    }
    v51 = *(unsigned int *)v45;
    if ((_DWORD)v51)
    {
      v52 = 0;
      v53 = v50 + 4;
      while (*(v53 - 1) && *v53)
      {
        ++v52;
        v53 += 2;
        if (v51 == v52)
          goto LABEL_87;
      }
      v58 = &v50[8 * v52];
      *(_DWORD *)v58 = (_DWORD)v43;
      *((_DWORD *)v58 + 1) = 257;
      goto LABEL_119;
    }
LABEL_87:
    v54 = v51 + 8;
    v55 = *a2;
    if (*a2)
    {
      v56 = *((_QWORD *)v55 + 1);
      v57 = -1;
      v15 = v45 >= v56;
      v45 -= v56;
      if (!v15)
      {
LABEL_99:
        result = (unsigned int *)CSStore2::Store::embraceAndExtend((CSStore2::Store *)a2, v50, (const void *)(8 * v51), 8 * v54);
        if (v57 == -1 || (v60 = *((_QWORD *)*a2 + 1), *(_DWORD *)(v60 + 12) <= v57))
          v61 = 0;
        else
          v61 = (_DWORD *)(v60 + v57);
        if (!result)
        {
          v61[1] = -1;
          abort();
        }
        v62 = *a2;
        if (*a2)
          v63 = *((_QWORD *)v62 + 1);
        else
          v63 = 0;
        v64 = -1;
        v15 = (unint64_t)result >= v63;
        v65 = (unint64_t)result - v63;
        if (v15 && !HIDWORD(v65))
        {
          if ((v65 + 1) > *(_DWORD *)(*((_QWORD *)v62 + 1) + 12) || v65 == -1)
            v64 = -1;
          else
            v64 = v65;
        }
        v61[1] = v64;
        v67 = &result[2 * v51];
        *v67 = v43;
        v67[1] = 257;
        if ((int)v51 + 1 < v54)
        {
          v68 = &result[2 * (v51 + 1)];
          *((_QWORD *)v68 + 6) = 0;
          *((_OWORD *)v68 + 1) = 0u;
          *((_OWORD *)v68 + 2) = 0u;
          *(_OWORD *)v68 = 0u;
        }
        *v61 += 8;
        goto LABEL_119;
      }
    }
    else
    {
      v57 = -1;
    }
    if (!HIDWORD(v45))
    {
      if ((v45 + 1) > *(_DWORD *)(*((_QWORD *)v55 + 1) + 12) || v45 == -1)
        v57 = -1;
      else
        v57 = v45;
    }
    goto LABEL_99;
  }
  return result;
}

void sub_1A4E79218(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)&a9);
  _Unwind_Resume(a1);
}

unsigned int *CSStore2::String::retain(unsigned int *this)
{
  unsigned int *v1;
  CSStore2 *v2;

  if (*(_QWORD *)this)
  {
    v1 = this;
    v2 = 0;
    this = CSStore2::String::getRetainCount((uint64_t)this, (unsigned int **)&v2);
    if ((_DWORD)this)
      return (unsigned int *)CSStore2::String::setRetainCount((uint64_t)v1, (const CSStore2::Store *)((_BYTE)this + 1), v2);
  }
  return this;
}

_DWORD *CSStore2::HashMap<unsigned int,CSStore2::_StringCacheEntry,CSStore2::_StringFunctions,0ull>::Find(CSStore2 *a1, unsigned int *a2, _DWORD *a3)
{
  unsigned int v3;
  const CSStore2::Store *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int *v13;
  _DWORD *v14;
  int v15;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  _DWORD *v21;
  _DWORD *v22;
  uint64_t v23;
  _DWORD *v24;
  unsigned int v25;
  _DWORD v26[2];
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  if (!*a2)
    return 0;
  v6 = (const CSStore2::Store *)*a3;
  if (!(_DWORD)v6)
    return 0;
  if (v3 > 0x2000)
  {
    CSStore2::GetLog(a1);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v25 = *a2;
      v26[0] = 67109376;
      v26[1] = v25;
      v27 = 1024;
      v28 = 0x2000;
      _os_log_error_impl(&dword_1A4E5A000, v17, OS_LOG_TYPE_ERROR, "Impossible bucket count %u when %u is the maximum.", (uint8_t *)v26, 0xEu);
    }

    return 0;
  }
  v8 = CSStore2::_StringFunctions::getHashCode(a1, v6) % *a2;
  v9 = a2[2 * v8 + 1];
  if (!(_DWORD)v9)
    return 0;
  if ((_DWORD)v9 == 1)
  {
    v10 = a2[2 * v8 + 2];
    if ((_DWORD)v10 != -1)
    {
      v11 = *(_QWORD *)(*(_QWORD *)a1 + 8);
      if (*(_DWORD *)(v11 + 12) > v10 && v11 != 0)
      {
        v13 = (int *)(v11 + v10);
        v15 = *v13;
        v14 = v13 + 1;
        if (v15 == *a3)
          return v14;
        else
          return 0;
      }
    }
    return 0;
  }
  v18 = a2[2 * v8 + 2];
  if ((_DWORD)v18 == -1)
  {
    v22 = 0;
  }
  else
  {
    v19 = *(_QWORD *)(*(_QWORD *)a1 + 8);
    v20 = *(_DWORD *)(v19 + 12);
    v21 = (_DWORD *)(v19 + v18);
    if (v20 <= v18)
      v22 = 0;
    else
      v22 = v21;
  }
  v23 = 8 * v9;
  v24 = &v22[2 * v9];
  while (*v22 != *a3)
  {
    v22 += 2;
    v23 -= 8;
    if (!v23)
    {
      v22 = v24;
      break;
    }
  }
  if (v22 == v24)
    return 0;
  else
    return v22 + 1;
}

uint64_t CSStore2::_StringFunctions::getHashCode(CSStore2::_StringFunctions *this, const CSStore2::Store *a2)
{
  char **v2;
  char *v4[2];
  char v5;
  __int128 v6;
  __int128 v7;
  char v8;

  CSStore2::String::Get(&v6, this, a2);
  if (!v8)
    return 0;
  *(_OWORD *)v4 = v7;
  v5 = 1;
  if (BYTE12(v6))
    v2 = v4;
  else
    v2 = (char **)v7;
  return CSStore2::_StringFunctions::getHashCode((CSStore2::_StringFunctions *)v2, (const char *)LODWORD(v4[1]));
}

void CSStore2::HashMap<unsigned int,CSStore2::_StringCacheEntry,CSStore2::_StringFunctions,0ull>::Create(_QWORD *a1, CSStore2::_StringFunctions *a2, uint64_t a3, int a4, _DWORD *a5)
{
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  size_t v13;
  _DWORD *v14;
  uint64_t (*v15)(_QWORD);
  _DWORD *v16;
  size_t v17;
  void **v18;
  uint64_t v19;
  void **v20;
  size_t v21;
  void **v22;
  uint64_t **v23;
  _DWORD *v24;
  void **v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  void **v29;
  unint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  char *v38;
  char *v39;
  uint64_t v40;
  unsigned int v41;
  unsigned int v42;
  int v43;
  _QWORD *v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  char *v52;
  char *v53;
  uint64_t v54;
  unint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  _QWORD *v62;
  char *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  NSUInteger v67;
  _DWORD *v68;
  _DWORD *v69;
  NSUInteger v70;
  NSUInteger v71;
  int v72;
  _DWORD *v73;
  _DWORD *v74;
  uint64_t v75;
  _DWORD **v76;
  void **v77;
  void **v78;
  void **v79;
  void ***v80;

  v10 = *(_QWORD *)(a3 + 24) + 10000;
  if (v10 >= 0x2000)
    v11 = 0x2000;
  else
    v11 = *(_QWORD *)(a3 + 24) + 10000;
  if (v11 <= 0x10)
    v12 = 16;
  else
    v12 = v11;
  v13 = (8 * (_DWORD)v12 + 8 * v10) | 4;
  v14 = malloc_type_malloc(v13, 0x16D4E321uLL);
  v15 = MEMORY[0x1E0C834A8];
  *a1 = v14;
  a1[1] = v15;
  v76 = (_DWORD **)a1;
  if (v14)
  {
    v16 = v14;
    bzero(v14, v13);
    *v16 = v12;
    v17 = 24 * v12;
    v18 = (void **)operator new(v17);
    v19 = v12;
    v20 = v18;
    v72 = v13;
    v73 = a5;
    v75 = v19;
    v77 = v18;
    v79 = &v18[3 * v19];
    v21 = 24 * ((v17 - 24) / 0x18) + 24;
    bzero(v18, v21);
    v22 = (void **)((char *)v20 + v21);
    v78 = v22;
    v23 = *(uint64_t ***)(a3 + 16);
    v74 = v16;
    if (v23)
    {
      do
      {
        v24 = *v76;
        v25 = &v77[3
                 * (CSStore2::_StringFunctions::getHashCode(a2, (const CSStore2::Store *)*((unsigned int *)v23 + 4))% *v24)];
        v27 = *((unsigned int *)v23 + 4);
        v26 = *((unsigned int *)v23 + 5);
        v29 = v25 + 1;
        v28 = (uint64_t *)v25[1];
        v30 = (unint64_t)v25[2];
        if ((unint64_t)v28 >= v30)
        {
          v32 = ((char *)v28 - (_BYTE *)*v25) >> 3;
          if ((unint64_t)(v32 + 1) >> 61)
            abort();
          v33 = v30 - (_QWORD)*v25;
          v34 = v33 >> 2;
          if (v33 >> 2 <= (unint64_t)(v32 + 1))
            v34 = v32 + 1;
          if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFF8)
            v35 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v35 = v34;
          if (v35)
            v35 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v35);
          else
            v36 = 0;
          v37 = (uint64_t *)(v35 + 8 * v32);
          *v37 = v27 | (v26 << 32);
          v31 = v37 + 1;
          v38 = (char *)*v29;
          v39 = (char *)*v25;
          if (*v29 != *v25)
          {
            do
            {
              v40 = *((_QWORD *)v38 - 1);
              v38 -= 8;
              *--v37 = v40;
            }
            while (v38 != v39);
            v38 = (char *)*v25;
          }
          *v25 = v37;
          *v29 = v31;
          v25[2] = (void *)(v35 + 8 * v36);
          if (v38)
            operator delete(v38);
        }
        else
        {
          *v28 = v27 | (v26 << 32);
          v31 = v28 + 1;
        }
        *v29 = v31;
        v23 = (uint64_t **)*v23;
      }
      while (v23);
      v20 = v77;
      v22 = v78;
    }
    if (v20 != v22)
    {
      v41 = 0x2710 % v75;
      if (0x2710 / v75 <= 1)
        v42 = 1;
      else
        v42 = 0x2710 / v75;
      do
      {
        v43 = 0;
        v44 = v20[1];
        do
        {
          v45 = (unint64_t)v20[2];
          if ((unint64_t)v44 >= v45)
          {
            v46 = ((char *)v44 - (_BYTE *)*v20) >> 3;
            if ((unint64_t)(v46 + 1) >> 61)
              abort();
            v47 = v45 - (_QWORD)*v20;
            v48 = v47 >> 2;
            if (v47 >> 2 <= (unint64_t)(v46 + 1))
              v48 = v46 + 1;
            if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFF8)
              v49 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v49 = v48;
            if (v49)
              v49 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v49);
            else
              v50 = 0;
            v51 = (_QWORD *)(v49 + 8 * v46);
            *v51 = 0;
            v44 = v51 + 1;
            v53 = (char *)*v20;
            v52 = (char *)v20[1];
            if (v52 != *v20)
            {
              do
              {
                v54 = *((_QWORD *)v52 - 1);
                v52 -= 8;
                *--v51 = v54;
              }
              while (v52 != v53);
              v52 = (char *)*v20;
            }
            *v20 = v51;
            v20[1] = v44;
            v20[2] = (void *)(v49 + 8 * v50);
            if (v52)
              operator delete(v52);
          }
          else
          {
            *v44++ = 0;
          }
          v20[1] = v44;
          ++v43;
        }
        while (v43 != v42);
        if (v41)
        {
          v55 = (unint64_t)v20[2];
          if ((unint64_t)v44 >= v55)
          {
            v57 = ((char *)v44 - (_BYTE *)*v20) >> 3;
            if ((unint64_t)(v57 + 1) >> 61)
              abort();
            v58 = v55 - (_QWORD)*v20;
            v59 = v58 >> 2;
            if (v58 >> 2 <= (unint64_t)(v57 + 1))
              v59 = v57 + 1;
            if ((unint64_t)v58 >= 0x7FFFFFFFFFFFFFF8)
              v60 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v60 = v59;
            if (v60)
              v60 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v60);
            else
              v61 = 0;
            v62 = (_QWORD *)(v60 + 8 * v57);
            *v62 = 0;
            v56 = v62 + 1;
            v64 = (char *)*v20;
            v63 = (char *)v20[1];
            if (v63 != *v20)
            {
              do
              {
                v65 = *((_QWORD *)v63 - 1);
                v63 -= 8;
                *--v62 = v65;
              }
              while (v63 != v64);
              v63 = (char *)*v20;
            }
            *v20 = v62;
            v20[1] = v56;
            v20[2] = (void *)(v60 + 8 * v61);
            if (v63)
              operator delete(v63);
          }
          else
          {
            *v44 = 0;
            v56 = v44 + 1;
          }
          v20[1] = v56;
          --v41;
        }
        v20 += 3;
      }
      while (v20 != v22);
    }
    v66 = 0;
    v67 = (NSUInteger)&v74[2 * v75 + 1];
    v68 = *v76;
    v69 = *v76 + 2;
    do
    {
      v70 = (NSUInteger)v77[v66];
      v71 = (NSUInteger)v77[v66 + 1] - v70;
      *(v69 - 1) = v71 >> 3;
      *v69 = v67 - (_DWORD)v68 + a4;
      if ((v71 >> 3))
        CSStore2::VM::Copy(v67, v70, (const void *)(8 * (v71 >> 3)));
      v67 += v71 & 0x7FFFFFFF8;
      v66 += 3;
      v69 += 2;
    }
    while (3 * v75 != v66);
    v80 = &v77;
    std::vector<std::vector<CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::KeyValuePair,std::allocator<CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::KeyValuePair>>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v80);
    LODWORD(v13) = v72;
    a5 = v73;
  }
  if (a5)
    *a5 = v13;
}

void sub_1A4E798F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _QWORD *a14)
{
  uint64_t v14;

  *a14 = 0;
  MEMORY[0x1E0C834A8](v14);
  _Unwind_Resume(a1);
}

unsigned int *CSStore2::String::getRetainCount(uint64_t a1, unsigned int **a2)
{
  unsigned int *result;
  unsigned int *v4;

  if (a2)
    *a2 = 0;
  if (!*(_QWORD *)a1 || *(_BYTE *)(a1 + 12))
    return 0;
  result = CSStore2::getStringCacheEntry(*(CSStore2 **)a1, (const CSStore2::Store *)*(unsigned int *)(a1 + 8));
  if (result)
  {
    v4 = result;
    result = (unsigned int *)*(unsigned __int8 *)result;
    if (a2)
      *a2 = v4;
  }
  return result;
}

CSStore2 *CSStore2::String::setRetainCount(uint64_t a1, const CSStore2::Store *a2, CSStore2 *a3)
{
  CSStore2 *result;
  int v5;
  int v6;
  unsigned int *v7;
  int v8;

  result = *(CSStore2 **)a1;
  if (result)
  {
    if (!*(_BYTE *)(a1 + 12))
    {
      v5 = (int)a2;
      if (a3
        || (result = (CSStore2 *)CSStore2::getStringCacheEntry(result, (const CSStore2::Store *)*(unsigned int *)(a1 + 8)), (a3 = result) != 0))
      {
        if (*(unsigned __int8 *)a3 != v5)
        {
          v6 = *(_DWORD *)a3;
          result = (CSStore2 *)CSStore2::getStringCache(*(CSStore2 **)a1, a2);
          if (result)
          {
            v7 = (unsigned int *)result;
            result = *(CSStore2 **)a1;
            v8 = *(_DWORD *)(a1 + 8);
            if (v8)
            {
              result = (CSStore2 *)CSStore2::HashMap<unsigned int,CSStore2::_StringCacheEntry,CSStore2::_StringFunctions,0ull>::Find(result, v7, &v8);
              if (result)
                *(_DWORD *)result = v6 & 0xFFFFFF00 | v5;
            }
          }
        }
      }
    }
  }
  return result;
}

unsigned int *CSStore2::getStringCacheEntry(CSStore2 *this, const CSStore2::Store *a2)
{
  unsigned int *result;
  int v4;

  v4 = (int)a2;
  result = (unsigned int *)CSStore2::getStringCache(this, a2);
  if (result)
    return CSStore2::HashMap<unsigned int,CSStore2::_StringCacheEntry,CSStore2::_StringFunctions,0ull>::Find(this, result, &v4);
  return result;
}

void ___ZNK8CSStore26String19getDebugDescriptionEv_block_invoke(uint64_t a1)
{
  CSStore2::AttributedStringWriter::string(*(CSStore2::AttributedStringWriter **)(a1 + 32), CFSTR("retainCount"), CFSTR("0 (const)"));
}

uint64_t __copy_helper_block_ea8_32c52_ZTSKZNK8CSStore26String19getDebugDescriptionEvE3__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 32) = *(_QWORD *)(a2 + 32);
  return result;
}

uint64_t CSStore2::String::GetUTF8BufferFromNSString(void *a1, uint64_t a2)
{
  id v3;

  v3 = a1;
  if ((objc_msgSend(v3, "getCString:maxLength:encoding:", a2, 1024, 4) & 1) == 0)
    a2 = objc_msgSend(objc_retainAutorelease(v3), "UTF8String");

  return a2;
}

void sub_1A4E79B1C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

Unit *CSStore2::String::release(Unit *this)
{
  unsigned int *v1;
  CSStore2 **v2;
  const CSStore2::Table *v3;
  const CSStore2::Store *v4;
  Unit *v5;
  CSStore2 *v6;
  unsigned int v7;
  unsigned int *StringCache;
  _DWORD *v9;
  CSStore2 *v10;
  unsigned int v11;

  if (*this)
  {
    v1 = (unsigned int *)this;
    v10 = 0;
    this = (Unit *)CSStore2::String::getRetainCount((uint64_t)this, (unsigned int **)&v10);
    if ((_DWORD)this)
    {
      if ((_DWORD)this == 1)
      {
        v2 = *(CSStore2 ***)v1;
        v3 = *(const CSStore2::Table **)(*(_QWORD *)v1 + 272);
        if (!v3)
        {
          this = (Unit *)CSStore2::Store::getTable(v2, CFSTR("<string>"));
          if (!this)
            return this;
          v3 = (const CSStore2::Table *)this;
          v2 = *(CSStore2 ***)v1;
        }
        this = (Unit *)CSStore2::Store::getUnit(v2, v3, v1[2]);
        if (this)
        {
          v5 = this;
          v6 = *(CSStore2 **)v1;
          v11 = v1[2];
          v7 = v11;
          StringCache = (unsigned int *)CSStore2::getStringCache(v6, v4);
          if (v7 && StringCache)
          {
            v9 = CSStore2::HashMap<unsigned int,CSStore2::_StringCacheEntry,CSStore2::_StringFunctions,0ull>::Find(v6, StringCache, &v11);
            if (v9)
              *v9 = 0;
          }
          return CSStore2::Store::freeUnit(*(CSStore2 ***)v1, v3, v5);
        }
      }
      else
      {
        return (Unit *)CSStore2::String::setRetainCount((uint64_t)v1, (const CSStore2::Store *)((_BYTE)this - 1), v10);
      }
    }
  }
  return this;
}

id CSStore2::String::GetDebugDescriptionOfCache(CSStore2::String *this, const CSStore2::Store *a2)
{
  char *StringCache;
  unsigned int *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  BOOL v11;
  unint64_t v12;
  _BOOL4 v13;
  unint64_t Statistics;

  StringCache = CSStore2::getStringCache(this, a2);
  if (StringCache)
  {
    v4 = (unsigned int *)StringCache;
    v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    if (CSStore2::NameOfType<CSStore2::HashMap<unsigned int,CSStore2::_StringCacheEntry,CSStore2::_StringFunctions,0ull>>(void)::once != -1)
      dispatch_once(&CSStore2::NameOfType<CSStore2::HashMap<unsigned int,CSStore2::_StringCacheEntry,CSStore2::_StringFunctions,0ull>>(void)::once, &__block_literal_global_320);
    v6 = (id)CSStore2::NameOfType<CSStore2::HashMap<unsigned int,CSStore2::_StringCacheEntry,CSStore2::_StringFunctions,0ull>>(void)::result;
    v7 = v6;
    v8 = *(_QWORD *)this;
    if (*(_QWORD *)this)
      v9 = *(_QWORD *)(v8 + 8);
    else
      v9 = 0;
    v10 = 0xFFFFFFFFLL;
    v11 = (unint64_t)v4 >= v9;
    v12 = (unint64_t)v4 - v9;
    if (v11 && !HIDWORD(v12))
    {
      v13 = (v12 + 1) > *(_DWORD *)(*(_QWORD *)(v8 + 8) + 12) || v12 == -1;
      v10 = v12;
      if (v13)
        v10 = 0xFFFFFFFFLL;
    }
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ @ 0x%llx"), v6, v10);

    Statistics = CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::GetStatistics(v4);
    objc_msgSend(v5, "appendFormat:", CFSTR(" { buckets = %llu, count = %llu }"), HIDWORD(Statistics), Statistics);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

void sub_1A4E79D28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___ZN8CSStore2L10NameOfTypeINS_7HashMapIjNS_17_StringCacheEntryENS_16_StringFunctionsELy0EEEEEP8NSStringv_block_invoke()
{
  uint64_t v0;
  void *v1;
  std::string __p;

  std::string::basic_string[abi:nn180100]<0>(&__p, "NSString *CSStore2::NameOfType() [T = CSStore2::HashMap<unsigned int, CSStore2::_StringCacheEntry, CSStore2::_StringFunctions>]_block_invoke");
  CSStore2::_CopyNameOfTypeImpl(&__p);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)CSStore2::NameOfType<CSStore2::HashMap<unsigned int,CSStore2::_StringCacheEntry,CSStore2::_StringFunctions,0ull>>(void)::result;
  CSStore2::NameOfType<CSStore2::HashMap<unsigned int,CSStore2::_StringCacheEntry,CSStore2::_StringFunctions,0ull>>(void)::result = v0;

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_1A4E79DA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

double CSStore2::getOrCopyStringFrom4CC(CSStore2 *this, char **a2, unsigned int a3, int a4)
{
  double result;
  __int128 v6;
  _OWORD v7[2];
  char v8;
  char v9[4];
  char v10;

  *(_DWORD *)v9 = bswap32(a3);
  v10 = 0;
  if (a4)
    CSStore2::String::Create((CSStore2::String *)v7, a2, (CSStore2::_StringFunctions *)v9, (const char *)4);
  else
    CSStore2::String::Find((CSStore2::String *)v7, (CSStore2::Store *)a2, (CSStore2::_StringFunctions *)v9, (const char *)4);
  *(_BYTE *)this = 0;
  *((_BYTE *)this + 32) = 0;
  if (v8)
  {
    result = *(double *)v7;
    v6 = v7[1];
    *(_OWORD *)this = v7[0];
    *((_OWORD *)this + 1) = v6;
    *((_BYTE *)this + 32) = 1;
  }
  return result;
}

double CSStore2::Dictionary::_CopyCanonicalKey(CSStore2::Dictionary *this, char **a2, unsigned int a3, char a4)
{
  double result;
  __int128 v6;
  char v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  char v11;

  *(_BYTE *)this = 0;
  *((_BYTE *)this + 32) = 0;
  if ((a4 & 1) != 0)
  {
    result = CSStore2::getOrCopyStringFrom4CC((CSStore2 *)&v9, a2, a3, 1);
    if (v11)
    {
      result = *(double *)&v9;
      v8 = v10;
      *(_OWORD *)this = v9;
      *((_OWORD *)this + 1) = v8;
      *((_BYTE *)this + 32) = 1;
    }
  }
  else
  {
    CSStore2::String::Get(&v9, (CSStore2::Store *)a2, a3);
    result = *(double *)&v9;
    v6 = v10;
    *(_OWORD *)this = v9;
    *((_OWORD *)this + 1) = v6;
    v7 = v11;
    *((_BYTE *)this + 32) = v11;
    if (v7)
      CSStore2::String::retain((unsigned int *)this);
  }
  return result;
}

unsigned int *CSStore2::Dictionary::_TakeOwnershipOfValue(unsigned int *this, CSStore2::Store *a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  unsigned int v5[8];
  char v6;
  uint64_t v7;
  uint64_t v8;

  if (a3 == 1)
  {
    v7 = v3;
    v8 = v4;
    this = CSStore2::String::Get(v5, (CSStore2::Store *)this, a2);
    if (v6)
      return CSStore2::String::retain(v5);
  }
  return this;
}

CSStore2::Store *CSStore2::Dictionary::_RelinquishOwnershipOfValue(CSStore2::Store *this, CSStore2::Store *a2, unsigned int a3)
{
  CSStore2::Array *v4;
  _QWORD v5[5];
  Unit v6[3];
  char v7;
  char v8;

  v4 = this;
  switch(a3)
  {
    case 1u:
      this = (CSStore2::Store *)CSStore2::String::Get(v6, this, a2);
      if (v8)
        this = (CSStore2::Store *)CSStore2::String::release(v6);
      break;
    case 2u:
      goto LABEL_7;
    case 3u:
      CSStore2::Array::Get((CSStore2::Array *)v6, this, a2);
      if (v7)
      {
        v5[0] = MEMORY[0x1E0C809B0];
        v5[1] = 3221225472;
        v5[2] = ___ZN8CSStore210Dictionary27_RelinquishOwnershipOfValueERNS_5StoreEjh_block_invoke;
        v5[3] = &__block_descriptor_40_e17_v28__0I8r_I12_B20l;
        v5[4] = v4;
        CSStore2::Array::enumerateValues((uint64_t)v6, v5);
      }
LABEL_7:
      this = (CSStore2::Store *)CSStore2::Array::Dispose(v4, a2);
      break;
    case 4u:
      this = (CSStore2::Store *)CSStore2::Dictionary::Dispose(this, a2, a3);
      break;
    default:
      return this;
  }
  return this;
}

Unit *CSStore2::Array::Dispose(CSStore2::Array *this, CSStore2::Store *a2)
{
  unsigned int v2;
  const CSStore2::Table *v4;
  Unit *result;

  v2 = a2;
  v4 = (const CSStore2::Table *)*((_QWORD *)this + 33);
  if (v4
    || (result = (Unit *)CSStore2::Store::getTable((CSStore2 **)this, CFSTR("<array>")),
        (v4 = (const CSStore2::Table *)result) != 0))
  {
    result = (Unit *)CSStore2::Store::getUnit((CSStore2 **)this, v4, v2);
    if (result)
      return CSStore2::Store::freeUnit((CSStore2 **)this, v4, result);
  }
  return result;
}

Unit *CSStore2::Dictionary::Dispose(const CSStore2::Table **this, CSStore2::Store *a2)
{
  unsigned int v2;
  const CSStore2::Table *v4;
  Unit *result;
  CSStore2::Store *v6[3];
  char v7;

  v2 = a2;
  CSStore2::Dictionary::Get((CSStore2::Dictionary *)v6, (CSStore2::Store *)this, a2);
  if (v7 && *((_BYTE *)v6[1] + 1))
    CSStore2::Dictionary::removeAllValues(v6);
  v4 = this[35];
  if (v4
    || (result = (Unit *)CSStore2::Store::getTable(this, CFSTR("<dictionary>")),
        (v4 = (const CSStore2::Table *)result) != 0))
  {
    result = (Unit *)CSStore2::Store::getUnit(this, v4, v2);
    if (result)
      return CSStore2::Store::freeUnit(this, v4, result);
  }
  return result;
}

char *CSStore2::Dictionary::Get(CSStore2::Dictionary *this, CSStore2::Store *a2, unsigned int a3)
{
  const CSStore2::Table *v6;
  char *result;

  *(_BYTE *)this = 0;
  *((_BYTE *)this + 24) = 0;
  v6 = (const CSStore2::Table *)*((_QWORD *)a2 + 35);
  if (v6
    || (result = CSStore2::Store::getTable((CSStore2 **)a2, CFSTR("<dictionary>")),
        (v6 = (const CSStore2::Table *)result) != 0))
  {
    result = CSStore2::Store::getUnit((CSStore2 **)a2, v6, a3);
    if (result)
    {
      *((_BYTE *)this + 24) = 1;
      *(_QWORD *)this = a2;
      *((_QWORD *)this + 1) = result + 8;
      *((_QWORD *)this + 2) = 0;
      *((_DWORD *)this + 4) = a3;
    }
  }
  return result;
}

uint64_t CSStore2::Dictionary::removeAllValues(CSStore2::Store **this)
{
  CSStore2::Store *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD v8[5];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = ___ZN8CSStore210Dictionary15removeAllValuesEv_block_invoke;
  v8[3] = &__block_descriptor_40_e15_v24__0I8I12_B16l;
  v8[4] = this;
  CSStore2::Dictionary::enumerateKeysAndValues((unint64_t)this, 1, v8);
  v2 = *this;
  v3 = *((unsigned int *)this[1] + 1);
  if ((_DWORD)v3 != -1)
  {
    v4 = *(_QWORD *)(*(_QWORD *)v2 + 8);
    if (*(_DWORD *)(v4 + 12) > v3)
    {
      v5 = *(unsigned int *)(v4 + v3);
      if ((_DWORD)v5)
      {
        v6 = (_QWORD *)(v3 + v4 + 4);
        do
        {
          *v6++ = 0xFFFFFFFF00000000;
          --v5;
        }
        while (v5);
      }
    }
  }
  return CSStore2::Store::collectGarbage(v2, 0);
}

void CSStore2::Dictionary::enumerateKeysAndValues(unint64_t a1, char a2, void *a3)
{
  id v5;
  void *k;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int *v10;
  char v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  unsigned int *v15;
  unsigned int v16;
  unsigned int *v17;
  unsigned int v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v24;
  uint64_t v25;
  unsigned int *v26;
  _DWORD *v27;
  unint64_t v28;
  unint64_t v29;
  uint8x8_t v30;
  __int128 *v31;
  size_t v32;
  uint8x8_t v33;
  uint64_t **v34;
  uint64_t *i;
  unint64_t v36;
  _QWORD *v37;
  float v38;
  _BOOL8 v39;
  unint64_t v40;
  unint64_t v41;
  size_t v42;
  uint64_t **v43;
  uint64_t *j;
  unint64_t v45;
  float v46;
  _BOOL8 v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  unint64_t v52;
  uint64_t **v53;
  id v54;
  unsigned int *v55;
  CSStore2::Store *v56;
  char v57;
  __int128 v58;
  __int128 v59;
  float v60;
  __int128 v61;
  __int128 v62;
  char v63;
  _OWORD __dst[2];
  char v65;

  v5 = a3;
  k = v5;
  v7 = *(char **)(a1 + 8);
  v8 = *((unsigned int *)v7 + 1);
  if ((_DWORD)v8 == -1)
    goto LABEL_94;
  v56 = *(CSStore2::Store **)a1;
  v9 = *(_QWORD *)(**(_QWORD **)a1 + 8);
  if (*(_DWORD *)(v9 + 12) <= v8)
    goto LABEL_94;
  v10 = (unsigned int *)(v9 + v8);
  v11 = *v7;
  v58 = 0u;
  v59 = 0u;
  v60 = 1.0;
  v12 = *v10;
  if (!(_DWORD)v12)
    goto LABEL_93;
  v54 = v5;
  v55 = v10;
  v13 = 0;
  if ((v11 & 1) != 0)
    v14 = a2;
  else
    v14 = 1;
  v57 = v14;
  do
  {
    v15 = &v10[2 * v13];
    v18 = v15[1];
    v17 = v15 + 1;
    v16 = v18;
    if (v18 - 0x20000000 >= 0xE0000001)
    {
      v19 = v10[2 * v13 + 2];
      v20 = v19 + 8 * v16;
      if (!__CFADD__((_DWORD)v19, 8 * v16))
      {
        v21 = *(_QWORD *)(*(_QWORD *)v56 + 8);
        v22 = *(_DWORD *)(v21 + 12);
        if (v20 <= v22 && v22 > v19)
        {
          v24 = 0;
          v25 = v21 + v19;
          while (1)
          {
            v26 = (unsigned int *)(v25 + 8 * v24);
            v27 = v26 + 1;
            if (v26[1])
            {
              if ((v57 & 1) != 0)
              {
                v28 = *v26;
                v29 = *((_QWORD *)&v58 + 1);
                if (*((_QWORD *)&v58 + 1))
                {
                  v30 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v58 + 8));
                  v30.i16[0] = vaddlv_u8(v30);
                  if (v30.u32[0] > 1uLL)
                  {
                    a1 = *v26;
                    if (*((_QWORD *)&v58 + 1) <= v28)
                      a1 = v28 % *((_QWORD *)&v58 + 1);
                  }
                  else
                  {
                    a1 = (DWORD2(v58) - 1) & v28;
                  }
                  v34 = *(uint64_t ***)(v58 + 8 * a1);
                  if (v34)
                  {
                    for (i = *v34; i; i = (uint64_t *)*i)
                    {
                      v36 = i[1];
                      if (v36 == v28)
                      {
                        if (*((_DWORD *)i + 4) == (_DWORD)v28)
                          goto LABEL_87;
                      }
                      else
                      {
                        if (v30.u32[0] > 1uLL)
                        {
                          if (v36 >= *((_QWORD *)&v58 + 1))
                            v36 %= *((_QWORD *)&v58 + 1);
                        }
                        else
                        {
                          v36 &= *((_QWORD *)&v58 + 1) - 1;
                        }
                        if (v36 != a1)
                          break;
                      }
                    }
                  }
                }
                v37 = operator new(0x18uLL);
                *v37 = 0;
                v37[1] = v28;
                *((_DWORD *)v37 + 4) = *v26;
                *((_DWORD *)v37 + 5) = *v27;
                v38 = (float)(unint64_t)(*((_QWORD *)&v59 + 1) + 1);
                if (!v29 || (float)(v60 * (float)v29) < v38)
                {
                  v39 = (v29 & (v29 - 1)) != 0;
                  if (v29 < 3)
                    v39 = 1;
                  v40 = v39 | (2 * v29);
                  v41 = vcvtps_u32_f32(v38 / v60);
                  if (v40 <= v41)
                    v42 = v41;
                  else
                    v42 = v40;
                  goto LABEL_72;
                }
                goto LABEL_77;
              }
              CSStore2::String::Get(__dst, v56, *v26);
              if (v65)
              {
                v61 = __dst[0];
                v62 = __dst[1];
                v63 = 1;
                LODWORD(__dst[0]) = 0;
                if (BYTE12(v61))
                  v31 = &v62;
                else
                  v31 = (__int128 *)v62;
                if (DWORD2(v62) >= 4)
                  v32 = 4;
                else
                  v32 = DWORD2(v62);
                memcpy(__dst, v31, v32);
                v28 = bswap32(__dst[0]);
                v29 = *((_QWORD *)&v58 + 1);
                if (*((_QWORD *)&v58 + 1))
                {
                  v33 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v58 + 8));
                  v33.i16[0] = vaddlv_u8(v33);
                  if (v33.u32[0] > 1uLL)
                  {
                    a1 = v28;
                    if (*((_QWORD *)&v58 + 1) <= v28)
                      a1 = v28 % *((_QWORD *)&v58 + 1);
                  }
                  else
                  {
                    a1 = (DWORD2(v58) - 1) & v28;
                  }
                  v43 = *(uint64_t ***)(v58 + 8 * a1);
                  if (v43)
                  {
                    for (j = *v43; j; j = (uint64_t *)*j)
                    {
                      v45 = j[1];
                      if (v45 == v28)
                      {
                        if (*((_DWORD *)j + 4) == (_DWORD)v28)
                          goto LABEL_87;
                      }
                      else
                      {
                        if (v33.u32[0] > 1uLL)
                        {
                          if (v45 >= *((_QWORD *)&v58 + 1))
                            v45 %= *((_QWORD *)&v58 + 1);
                        }
                        else
                        {
                          v45 &= *((_QWORD *)&v58 + 1) - 1;
                        }
                        if (v45 != a1)
                          break;
                      }
                    }
                  }
                }
                v37 = operator new(0x18uLL);
                *v37 = 0;
                v37[1] = v28;
                *((_DWORD *)v37 + 4) = v28;
                *((_DWORD *)v37 + 5) = *v27;
                v46 = (float)(unint64_t)(*((_QWORD *)&v59 + 1) + 1);
                if (!v29 || (float)(v60 * (float)v29) < v46)
                {
                  v47 = (v29 & (v29 - 1)) != 0;
                  if (v29 < 3)
                    v47 = 1;
                  v48 = v47 | (2 * v29);
                  v49 = vcvtps_u32_f32(v46 / v60);
                  if (v48 <= v49)
                    v42 = v49;
                  else
                    v42 = v48;
LABEL_72:
                  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__rehash<true>((uint64_t)&v58, v42);
                  v29 = *((_QWORD *)&v58 + 1);
                  if ((*((_QWORD *)&v58 + 1) & (*((_QWORD *)&v58 + 1) - 1)) != 0)
                  {
                    if (*((_QWORD *)&v58 + 1) <= v28)
                      a1 = v28 % *((_QWORD *)&v58 + 1);
                    else
                      a1 = v28;
                  }
                  else
                  {
                    a1 = (DWORD2(v58) - 1) & v28;
                  }
                }
LABEL_77:
                v50 = v58;
                v51 = *(_QWORD **)(v58 + 8 * a1);
                if (v51)
                {
                  *v37 = *v51;
                  goto LABEL_85;
                }
                *v37 = v59;
                *(_QWORD *)&v59 = v37;
                *(_QWORD *)(v50 + 8 * a1) = &v59;
                if (*v37)
                {
                  v52 = *(_QWORD *)(*v37 + 8);
                  if ((v29 & (v29 - 1)) != 0)
                  {
                    if (v52 >= v29)
                      v52 %= v29;
                  }
                  else
                  {
                    v52 &= v29 - 1;
                  }
                  v51 = (_QWORD *)(v58 + 8 * v52);
LABEL_85:
                  *v51 = v37;
                }
                ++*((_QWORD *)&v59 + 1);
                goto LABEL_87;
              }
              LOBYTE(v61) = 0;
              v63 = 0;
            }
LABEL_87:
            if (++v24 >= (unint64_t)*v17)
            {
              v10 = v55;
              v12 = *v55;
              break;
            }
          }
        }
      }
    }
    ++v13;
  }
  while (v13 < v12);
  v53 = (uint64_t **)v59;
  LOBYTE(__dst[0]) = 0;
  for (k = v54; v53; v53 = (uint64_t **)*v53)
  {
    (*((void (**)(id, _QWORD, _QWORD, _OWORD *))v54 + 2))(v54, *((unsigned int *)v53 + 4), *((unsigned int *)v53 + 5), __dst);
    if (LOBYTE(__dst[0]))
      break;
  }
LABEL_93:
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)&v58);
LABEL_94:

}

void sub_1A4E7A7DC(_Unwind_Exception *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)va);

  _Unwind_Resume(a1);
}

void CSStore2::Array::getAllValues(std::vector<unsigned int> *this, uint64_t a2)
{
  std::allocator<unsigned int> *p_end_cap;
  unsigned int v5;
  unsigned int v6;
  int64_t v7;
  uint64_t v8;
  unsigned int *v9;
  std::vector<unsigned int>::pointer begin;
  std::vector<unsigned int>::pointer end;
  unsigned int *v12;
  unsigned int v13;
  uint64_t v14;
  unsigned __int16 *v15;
  std::vector<unsigned int>::pointer v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned __int16 *v27;
  unsigned int *v28;
  unsigned int v29;
  unsigned int *v30;
  uint64_t v31;
  unsigned int *v32;
  unsigned int v33;
  unsigned int *v34;
  uint64_t v35;
  unsigned int v36;
  std::__split_buffer<unsigned int> __v;

  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  p_end_cap = (std::allocator<unsigned int> *)&this->__end_cap_;
  v5 = **(_DWORD **)(a2 + 8) & 0x1FFFFFFF;
  v6 = *(_DWORD *)(a2 + 16);
  if (v5 >= v6)
    v7 = v6;
  else
    v7 = v5;
  if ((_DWORD)v7)
  {
    v9 = (unsigned int *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>(v7);
    begin = this->__begin_;
    end = this->__end_;
    v12 = v9;
    while (end != begin)
    {
      v13 = *--end;
      *--v12 = v13;
    }
    this->__begin_ = v12;
    this->__end_ = v9;
    this->__end_cap_.__value_ = &v9[v8];
    if (begin)
    {
      operator delete(begin);
      v9 = this->__end_;
    }
  }
  else
  {
    v9 = 0;
  }
  v14 = *(_QWORD *)(a2 + 8);
  v15 = (unsigned __int16 *)(v14 + 4);
  v16 = this->__begin_;
  v17 = v9 - this->__begin_;
  if ((*(_BYTE *)(v14 + 3) & 0x20) == 0)
  {
    if (!(_DWORD)v7)
      return;
    if (v7 <= (uint64_t)(*(_QWORD *)p_end_cap - (_QWORD)v9) >> 2)
    {
      memmove(v9, v15, 4 * v7);
      this->__end_ = &v9[v7];
      return;
    }
    if (!((unint64_t)(v17 + v7) >> 62))
    {
      v18 = *(_QWORD *)p_end_cap - (_QWORD)v16;
      v19 = v18 >> 1;
      if (v18 >> 1 <= (unint64_t)(v17 + v7))
        v19 = v17 + v7;
      if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFFCLL)
        v20 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v20 = v19;
      __v.__end_cap_.__value_ = p_end_cap;
      if (v20)
        v20 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>(v20);
      else
        v21 = 0;
      v30 = (unsigned int *)(v20 + 4 * v17);
      __v.__first_ = (std::__split_buffer<unsigned int>::pointer)v20;
      __v.__begin_ = v30;
      __v.__end_cap_.__value_ = (unsigned int *)(v20 + 4 * v21);
      v31 = 4 * v7;
      v32 = &v30[v7];
      do
      {
        v33 = *(_DWORD *)v15;
        v15 += 2;
        *v30++ = v33;
        v31 -= 4;
      }
      while (v31);
LABEL_43:
      __v.__end_ = v32;
      std::vector<unsigned int>::__swap_out_circular_buffer(this, &__v, v9);
      if (__v.__first_)
        operator delete(__v.__first_);
      return;
    }
    goto LABEL_46;
  }
  if (!(_DWORD)v7)
    return;
  if (v7 > (uint64_t)(*(_QWORD *)p_end_cap - (_QWORD)v9) >> 2)
  {
    if (!((unint64_t)(v17 + v7) >> 62))
    {
      v22 = *(_QWORD *)p_end_cap - (_QWORD)v16;
      v23 = v22 >> 1;
      if (v22 >> 1 <= (unint64_t)(v17 + v7))
        v23 = v17 + v7;
      if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFFCLL)
        v24 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v24 = v23;
      __v.__end_cap_.__value_ = p_end_cap;
      if (v24)
        v24 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>(v24);
      else
        v25 = 0;
      v34 = (unsigned int *)(v24 + 4 * v17);
      __v.__first_ = (std::__split_buffer<unsigned int>::pointer)v24;
      __v.__begin_ = v34;
      __v.__end_cap_.__value_ = (unsigned int *)(v24 + 4 * v25);
      v35 = 4 * v7;
      v32 = &v34[v7];
      do
      {
        v36 = *v15++;
        *v34++ = v36;
        v35 -= 4;
      }
      while (v35);
      goto LABEL_43;
    }
LABEL_46:
    abort();
  }
  v26 = 2 * v7;
  v27 = (unsigned __int16 *)(v14 + 4);
  v28 = v9;
  do
  {
    v29 = *v27++;
    *v28++ = v29;
    v26 -= 2;
  }
  while (v26);
  this->__end_ = v28;
}

void sub_1A4E7AB6C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

std::vector<unsigned int>::pointer std::vector<unsigned int>::__swap_out_circular_buffer(std::vector<unsigned int> *this, std::__split_buffer<unsigned int> *__v, std::vector<unsigned int>::pointer __p)
{
  unsigned int *begin;
  std::vector<unsigned int>::pointer v6;
  unsigned int *v7;
  std::vector<unsigned int>::pointer v8;
  unsigned int v9;
  unsigned int *end;
  std::__split_buffer<unsigned int>::pointer v11;
  int64_t v12;
  unsigned int *v13;
  unsigned int *v14;
  unsigned int *value;

  begin = __v->__begin_;
  v6 = this->__begin_;
  v7 = begin;
  if (this->__begin_ != __p)
  {
    v8 = __p;
    v7 = __v->__begin_;
    do
    {
      v9 = *--v8;
      *--v7 = v9;
    }
    while (v8 != v6);
  }
  __v->__begin_ = v7;
  end = this->__end_;
  v11 = __v->__end_;
  v12 = (char *)end - (char *)__p;
  if (end != __p)
  {
    memmove(__v->__end_, __p, (char *)end - (char *)__p);
    v7 = __v->__begin_;
  }
  __v->__end_ = (std::__split_buffer<unsigned int>::pointer)((char *)v11 + v12);
  v13 = this->__begin_;
  this->__begin_ = v7;
  __v->__begin_ = v13;
  v14 = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = v14;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
  return begin;
}

void CSStore2::HashMap<unsigned int,unsigned int,CSStore2::Dictionary::_Functions,0ull>::Create(_DWORD **a1, uint64_t a2, int a3, unsigned int a4, _DWORD *a5)
{
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  size_t v12;
  _DWORD *v13;
  uint64_t (*v14)(_QWORD);
  _DWORD *v15;
  void **v16;
  size_t v17;
  void **v18;
  uint64_t *v19;
  _QWORD *v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  void **v24;
  void **v25;
  uint64_t *v26;
  unint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  char *v35;
  char *v36;
  uint64_t v37;
  unsigned int v38;
  unsigned int v39;
  int v40;
  char *v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  char *v50;
  uint64_t v51;
  unint64_t v52;
  _QWORD *v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  char *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  NSUInteger v65;
  _DWORD *v66;
  _DWORD *v67;
  NSUInteger v68;
  NSUInteger v69;
  int v70;
  _DWORD *v71;
  int v72;
  _DWORD *v73;
  void **v75;
  void **v76;
  void **v77;
  void ***v78;

  v9 = *(_QWORD *)(a2 + 24) + a4;
  if (v9 >= 0x2000)
    v10 = 0x2000;
  else
    v10 = *(_QWORD *)(a2 + 24) + a4;
  if (v10 <= 0x10)
    v11 = 16;
  else
    v11 = v10;
  v12 = (8 * (_DWORD)v11 + 8 * v9) | 4;
  v13 = malloc_type_malloc(v12, 0x16D4E321uLL);
  v14 = MEMORY[0x1E0C834A8];
  *a1 = v13;
  a1[1] = v14;
  if (v13)
  {
    v15 = v13;
    v72 = a3;
    bzero(v13, v12);
    v73 = v15;
    *v15 = v11;
    v16 = (void **)operator new(24 * v11);
    v70 = v12;
    v71 = a5;
    v75 = v16;
    v77 = &v16[3 * v11];
    v17 = 24 * ((24 * (unint64_t)v11 - 24) / 0x18) + 24;
    bzero(v16, v17);
    v18 = (void **)((char *)v16 + v17);
    v76 = v18;
    v19 = *(uint64_t **)(a2 + 16);
    if (v19)
    {
      do
      {
        v20 = a1;
        v21 = **a1;
        v22 = *((unsigned int *)v19 + 4);
        v23 = *((unsigned int *)v19 + 5);
        v24 = &v75[3 * ((unsigned __int16)*((_DWORD *)v19 + 4) % v21)];
        v25 = v24 + 1;
        v26 = (uint64_t *)v24[1];
        v27 = (unint64_t)v24[2];
        if ((unint64_t)v26 >= v27)
        {
          v29 = ((char *)v26 - (_BYTE *)*v24) >> 3;
          if ((unint64_t)(v29 + 1) >> 61)
            abort();
          v30 = v27 - (_QWORD)*v24;
          v31 = v30 >> 2;
          if (v30 >> 2 <= (unint64_t)(v29 + 1))
            v31 = v29 + 1;
          if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF8)
            v32 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v32 = v31;
          if (v32)
            v32 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v32);
          else
            v33 = 0;
          v34 = (uint64_t *)(v32 + 8 * v29);
          *v34 = v22 | (v23 << 32);
          v28 = v34 + 1;
          v35 = (char *)*v25;
          v36 = (char *)*v24;
          a1 = (_DWORD **)v20;
          if (*v25 != *v24)
          {
            do
            {
              v37 = *((_QWORD *)v35 - 1);
              v35 -= 8;
              *--v34 = v37;
            }
            while (v35 != v36);
            v35 = (char *)*v24;
          }
          *v24 = v34;
          *v25 = v28;
          v24[2] = (void *)(v32 + 8 * v33);
          if (v35)
            operator delete(v35);
        }
        else
        {
          *v26 = v22 | (v23 << 32);
          v28 = v26 + 1;
          a1 = (_DWORD **)v20;
        }
        *v25 = v28;
        v19 = (uint64_t *)*v19;
      }
      while (v19);
      v16 = v75;
      v18 = v76;
    }
    else
    {
      v20 = a1;
    }
    if (v16 != v18)
    {
      v38 = a4 % v11;
      if (a4 / v11 <= 1)
        v39 = 1;
      else
        v39 = a4 / v11;
      do
      {
        if (v11 <= a4)
        {
          v40 = 0;
          v41 = (char *)v16[1];
          do
          {
            v42 = (unint64_t)v16[2];
            if ((unint64_t)v41 >= v42)
            {
              v43 = (v41 - (_BYTE *)*v16) >> 3;
              if ((unint64_t)(v43 + 1) >> 61)
                abort();
              v44 = v42 - (_QWORD)*v16;
              v45 = v44 >> 2;
              if (v44 >> 2 <= (unint64_t)(v43 + 1))
                v45 = v43 + 1;
              if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFF8)
                v46 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v46 = v45;
              if (v46)
                v46 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v46);
              else
                v47 = 0;
              v48 = (char *)(v46 + 8 * v43);
              *(_QWORD *)v48 = 0;
              v41 = v48 + 8;
              v50 = (char *)*v16;
              v49 = (char *)v16[1];
              if (v49 != *v16)
              {
                do
                {
                  v51 = *((_QWORD *)v49 - 1);
                  v49 -= 8;
                  *((_QWORD *)v48 - 1) = v51;
                  v48 -= 8;
                }
                while (v49 != v50);
                v49 = (char *)*v16;
              }
              *v16 = v48;
              v16[1] = v41;
              v16[2] = (void *)(v46 + 8 * v47);
              if (v49)
                operator delete(v49);
            }
            else
            {
              *(_QWORD *)v41 = 0;
              v41 += 8;
            }
            v16[1] = v41;
            ++v40;
          }
          while (v40 != v39);
        }
        if (v38)
        {
          v53 = v16[1];
          v52 = (unint64_t)v16[2];
          if ((unint64_t)v53 >= v52)
          {
            v55 = ((char *)v53 - (_BYTE *)*v16) >> 3;
            if ((unint64_t)(v55 + 1) >> 61)
              abort();
            v56 = v52 - (_QWORD)*v16;
            v57 = v56 >> 2;
            if (v56 >> 2 <= (unint64_t)(v55 + 1))
              v57 = v55 + 1;
            if ((unint64_t)v56 >= 0x7FFFFFFFFFFFFFF8)
              v58 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v58 = v57;
            if (v58)
              v58 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v58);
            else
              v59 = 0;
            v60 = (_QWORD *)(v58 + 8 * v55);
            *v60 = 0;
            v54 = v60 + 1;
            v62 = (char *)*v16;
            v61 = (char *)v16[1];
            if (v61 != *v16)
            {
              do
              {
                v63 = *((_QWORD *)v61 - 1);
                v61 -= 8;
                *--v60 = v63;
              }
              while (v61 != v62);
              v61 = (char *)*v16;
            }
            *v16 = v60;
            v16[1] = v54;
            v16[2] = (void *)(v58 + 8 * v59);
            if (v61)
              operator delete(v61);
          }
          else
          {
            *v53 = 0;
            v54 = v53 + 1;
          }
          v16[1] = v54;
          --v38;
        }
        v16 += 3;
      }
      while (v16 != v18);
    }
    v64 = 0;
    v65 = (NSUInteger)&v73[2 * v11 + 1];
    v66 = (_DWORD *)*v20;
    v67 = (_DWORD *)(*v20 + 8);
    do
    {
      v68 = (NSUInteger)v75[v64];
      v69 = (NSUInteger)v75[v64 + 1] - v68;
      *(v67 - 1) = v69 >> 3;
      *v67 = v65 - (_DWORD)v66 + v72;
      if ((v69 >> 3))
        CSStore2::VM::Copy(v65, v68, (const void *)(8 * (v69 >> 3)));
      v65 += v69 & 0x7FFFFFFF8;
      v64 += 3;
      v67 += 2;
    }
    while (3 * v11 != v64);
    v78 = &v75;
    std::vector<std::vector<CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::KeyValuePair,std::allocator<CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::KeyValuePair>>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v78);
    LODWORD(v12) = v70;
    a5 = v71;
  }
  if (a5)
    *a5 = v12;
}

void sub_1A4E7B098(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  _QWORD *v13;

  *v13 = 0;
  MEMORY[0x1E0C834A8](a13);
  _Unwind_Resume(a1);
}

uint64_t CSStore2::Dictionary::getCount(CSStore2::Dictionary *this, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  unsigned int *v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  unsigned int *v10;
  unsigned int v11;
  uint64_t v12;
  BOOL v13;
  BOOL v14;
  unint64_t v16;
  int *v17;
  unint64_t v18;
  int v19;
  BOOL v20;

  if (a2 == -1)
    return 0;
  v2 = *(_QWORD *)this;
  v3 = *(_QWORD *)(*(_QWORD *)this + 8);
  v4 = *(_DWORD *)(v3 + 12);
  if (v4 <= a2)
    return 0;
  v5 = (unsigned int *)(v3 + a2);
  v6 = *v5;
  if (!(_DWORD)v6)
    return 0;
  result = 0;
  v8 = 0;
  v9 = v3 + 4;
  do
  {
    v10 = &v5[2 * v8];
    v11 = v10[1];
    if (v11 - 0x20000000 >= 0xE0000001)
    {
      v12 = v10[2];
      v13 = __CFADD__((_DWORD)v12, 8 * v11) || v12 + 8 * v11 > *(_DWORD *)(*(_QWORD *)(v2 + 8) + 12);
      v14 = v13 || (_DWORD)v12 == -1;
      if (!v14 && v4 > v12)
      {
        v16 = 0;
        v17 = (int *)(v9 + v12);
        LODWORD(v18) = v11;
        do
        {
          v19 = *v17;
          v17 += 2;
          v20 = v19 == 0;
          if (v19)
            result = (result + 1);
          else
            result = result;
          if (v20)
            v18 = v18;
          else
            v18 = v11;
          ++v16;
        }
        while (v16 < v18);
      }
    }
    ++v8;
  }
  while (v8 != v6);
  return result;
}

id CSStore2::Dictionary::getDescriptionOfContents(CSStore2::Dictionary *this, unint64_t a2)
{
  id v4;
  char v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t *v31;
  CSStore2::Dictionary *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  int v38;
  _BYTE __b[24];

  v4 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  if (v4)
  {
    v5 = *(_BYTE *)(*((_QWORD *)this + 1) + 1);
    if (a2 >= 7)
      v6 = 7;
    else
      v6 = a2;
    memset_pattern16(__b, asc_1A4E89690, 2 * v6 + 2);
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", __b, v6 + 1);
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("{"));
    v7 = objc_alloc(MEMORY[0x1E0CB3498]);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("\n%@}"), v23);
    v22 = (void *)objc_msgSend(v7, "initWithString:", v8);

    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n"));
    v9 = objc_alloc(MEMORY[0x1E0CB3778]);
    objc_msgSend(CFSTR("\t"), "stringByAppendingString:", v23);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithString:", v10);

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(", "));
    v35 = 0;
    v36 = &v35;
    v37 = 0x2020000000;
    v38 = 0;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = ___ZNK8CSStore210Dictionary24getDescriptionOfContentsEm_block_invoke;
    v25[3] = &unk_1E4E21E40;
    v31 = &v35;
    v32 = this;
    v13 = v4;
    v26 = v13;
    v14 = v24;
    v27 = v14;
    v15 = v12;
    v34 = v5;
    v28 = v15;
    v33 = v6;
    v16 = v21;
    v29 = v16;
    v17 = v11;
    v30 = v17;
    CSStore2::Dictionary::enumerateKeysAndValues((unint64_t)this, 1, v25);
    if (*((_DWORD *)v36 + 6))
    {
      objc_msgSend(v13, "appendAttributedString:", v22);
    }
    else
    {
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("{ }"));
      objc_msgSend(v13, "appendAttributedString:", v19);

    }
    v18 = (void *)objc_msgSend(v13, "copy");

    _Block_object_dispose(&v35, 8);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

void sub_1A4E7B46C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20,void *a21,void *a22,void *a23)
{
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;

  _Block_object_dispose((const void *)(v27 - 136), 8);
  _Unwind_Resume(a1);
}

void ___ZNK8CSStore210Dictionary24getDescriptionOfContentsEm_block_invoke(uint64_t a1, unsigned int a2, unsigned int a3)
{
  CSStore2::Store **v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  CSStore2::Store **v32;
  _DWORD v33[6];
  char v34;
  char v35;
  _DWORD v36[8];
  char v37;
  const __CFString *v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v6 = *(CSStore2::Store ***)(a1 + 80);
  v7 = (void *)MEMORY[0x1A85AA4B4]();
  v8 = 48;
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
    v8 = 40;
  objc_msgSend(*(id *)(a1 + 32), "appendAttributedString:", *(_QWORD *)(a1 + v8));
  CSStore2::String::Get(v36, *v6, a2);
  if (v37)
  {
    CSStore2::String::getNSStringNoCopy((CSStore2::String *)v36);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    switch(*(_BYTE *)(a1 + 96))
    {
      case 1:
        CSStore2::String::Get(v33, *v6, a3);
        if (!v35)
          goto LABEL_14;
        v10 = objc_alloc(MEMORY[0x1E0CB3940]);
        CSStore2::String::getNSStringNoCopy((CSStore2::String *)v33);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("\"%@\""), v11);

        break;
      case 2:
        CSStore2::Array::Get((CSStore2::Array *)v33, *v6, a3);
        if (!v34)
          goto LABEL_14;
        v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = ___ZNK8CSStore210Dictionary24getDescriptionOfContentsEm_block_invoke_3;
        v28[3] = &unk_1E4E21E18;
        v14 = v13;
        v29 = v14;
        CSStore2::Array::enumerateValues((uint64_t)v33, v28);
        v15 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v14, "componentsJoinedByString:", CFSTR(", "));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("[ %@ ]"), v16);

        break;
      case 3:
        CSStore2::Array::Get((CSStore2::Array *)v33, *v6, a3);
        if (!v34)
          goto LABEL_14;
        v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = ___ZNK8CSStore210Dictionary24getDescriptionOfContentsEm_block_invoke_2;
        v30[3] = &unk_1E4E21DF0;
        v32 = v6;
        v18 = v17;
        v31 = v18;
        CSStore2::Array::enumerateValues((uint64_t)v33, v30);
        v19 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v18, "componentsJoinedByString:", CFSTR(", "));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v19, "initWithFormat:", CFSTR("[ %@ ]"), v20);

        break;
      case 4:
        CSStore2::Dictionary::Get((CSStore2::Dictionary *)v33, *v6, a3);
        if (!v34)
          goto LABEL_14;
        CSStore2::Dictionary::getDescriptionOfContents((CSStore2::Dictionary *)v33, *(_QWORD *)(a1 + 88) + 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "string");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        break;
      default:
        goto LABEL_14;
    }
    if (!v12)
LABEL_14:
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("0x%llx"), a3);
    objc_msgSend(*(id *)(a1 + 32), "appendAttributedString:", *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "appendAttributedString:", *(_QWORD *)(a1 + 64));
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("\"%@\""), v9);

    v23 = objc_alloc(MEMORY[0x1E0CB3498]);
    v38 = CFSTR("_CSVFWeight");
    v39[0] = &unk_1E4E25608;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v23, "initWithString:attributes:", v22, v24);

    objc_msgSend(*(id *)(a1 + 32), "appendAttributedString:", v25);
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(":%C%@"), 160, v12);

    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v26);
    objc_msgSend(*(id *)(a1 + 32), "appendAttributedString:", v27);

  }
  objc_autoreleasePoolPop(v7);
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
}

void sub_1A4E7B980(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void ___ZNK8CSStore210Dictionary24getDescriptionOfContentsEm_block_invoke_2(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _DWORD v8[8];
  char v9;

  CSStore2::String::Get(v8, **(CSStore2::Store ***)(a1 + 40), *a3);
  if (v9)
  {
    v4 = *(void **)(a1 + 32);
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    CSStore2::String::getNSStringNoCopy((CSStore2::String *)v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("\"%@\""), v6);
    objc_msgSend(v4, "addObject:", v7);

  }
}

void sub_1A4E7BAFC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void ___ZNK8CSStore210Dictionary24getDescriptionOfContentsEm_block_invoke_3(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("0x%llx"), *a3);
  objc_msgSend(v3, "addObject:");

}

void sub_1A4E7BB74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

_DWORD *CSStore2::HashMap<unsigned int,unsigned int,CSStore2::Dictionary::_Functions,0ull>::Find(CSStore2 *a1, int *a2, int a3)
{
  BOOL v3;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  int *v11;
  _DWORD *v12;
  int v13;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  _DWORD *v19;
  _DWORD *v20;
  uint64_t v21;
  _DWORD *v22;
  int v23;
  _DWORD v24[2];
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (*a2)
    v3 = a3 == 0;
  else
    v3 = 1;
  if (v3)
    return 0;
  if (*a2 > 0x2000)
  {
    CSStore2::GetLog(a1);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v23 = *a2;
      v24[0] = 67109376;
      v24[1] = v23;
      v25 = 1024;
      v26 = 0x2000;
      _os_log_error_impl(&dword_1A4E5A000, v15, OS_LOG_TYPE_ERROR, "Impossible bucket count %u when %u is the maximum.", (uint8_t *)v24, 0xEu);
    }

    return 0;
  }
  v5 = (unsigned __int16)a3 % (unsigned __int16)*a2;
  v6 = a2[2 * v5 + 1];
  if (!(_DWORD)v6)
    return 0;
  v7 = &a2[2 * v5];
  if ((_DWORD)v6 == 1)
  {
    v8 = v7[2];
    if ((_DWORD)v8 != -1)
    {
      v9 = *((_QWORD *)a1 + 1);
      if (*(_DWORD *)(v9 + 12) > v8 && v9 != 0)
      {
        v11 = (int *)(v9 + v8);
        v13 = *v11;
        v12 = v11 + 1;
        if (v13 == a3)
          return v12;
        else
          return 0;
      }
    }
    return 0;
  }
  v16 = v7[2];
  if ((_DWORD)v16 == -1)
  {
    v20 = 0;
  }
  else
  {
    v17 = *((_QWORD *)a1 + 1);
    v18 = *(_DWORD *)(v17 + 12);
    v19 = (_DWORD *)(v17 + v16);
    if (v18 <= v16)
      v20 = 0;
    else
      v20 = v19;
  }
  v21 = 8 * v6;
  v22 = &v20[2 * v6];
  while (*v20 != a3)
  {
    v20 += 2;
    v21 -= 8;
    if (!v21)
    {
      v20 = v22;
      break;
    }
  }
  if (v20 == v22)
    return 0;
  else
    return v20 + 1;
}

unsigned int *_CSStringRetain(uint64_t a1, unsigned int a2)
{
  uint64_t v4;
  unsigned int *result;
  unsigned int v6[8];
  char v7;

  if (performMutatingAssertions)
  {
    v4 = *(_QWORD *)(a1 + 336);
    if (v4)
      (***(void (****)(_QWORD))(v4 + 8))(*(_QWORD *)(v4 + 8));
  }
  result = CSStore2::String::Get(v6, (CSStore2::Store *)(a1 + 8), a2);
  if (v7)
    return CSStore2::String::retain(v6);
  return result;
}

Unit *_CSStringRelease(uint64_t a1, unsigned int a2)
{
  uint64_t v4;
  Unit *result;
  Unit v6[4];
  char v7;

  if (performMutatingAssertions)
  {
    v4 = *(_QWORD *)(a1 + 336);
    if (v4)
      (***(void (****)(_QWORD))(v4 + 8))(*(_QWORD *)(v4 + 8));
  }
  result = (Unit *)CSStore2::String::Get(v6, (CSStore2::Store *)(a1 + 8), a2);
  if (v7)
    return CSStore2::String::release(v6);
  return result;
}

uint64_t _CSStringIsValid(uint64_t a1, unsigned int a2)
{
  uint64_t v4;
  _DWORD v6[8];
  unsigned __int8 v7;

  if (performConstantAssertions)
  {
    v4 = *(_QWORD *)(a1 + 336);
    if (v4)
      (*(void (**)(_QWORD))(**(_QWORD **)(v4 + 8) + 8))(*(_QWORD *)(v4 + 8));
  }
  CSStore2::String::Get(v6, (CSStore2::Store *)(a1 + 8), a2);
  return v7;
}

CSStore2 *_CSStringMakeConst(uint64_t a1, unsigned int a2)
{
  uint64_t v4;
  CSStore2 *result;
  _DWORD v6[8];
  char v7;

  if (performMutatingAssertions)
  {
    v4 = *(_QWORD *)(a1 + 336);
    if (v4)
      (***(void (****)(_QWORD))(v4 + 8))(*(_QWORD *)(v4 + 8));
  }
  result = (CSStore2 *)CSStore2::String::Get(v6, (CSStore2::Store *)(a1 + 8), a2);
  if (v7)
    return CSStore2::String::setRetainCount((uint64_t)v6, 0, 0);
  return result;
}

uint64_t _CSStringCopyLowercase(uint64_t a1, unsigned int a2)
{
  uint64_t v4;
  _DWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  char *UTF8BufferFromNSString;
  const char *v10;
  _OWORD v12[2];
  char v13;
  _OWORD v14[2];
  char v15;
  _BYTE v16[1024];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (performMutatingAssertions)
  {
    v4 = *(_QWORD *)(a1 + 336);
    if (v4)
      (***(void (****)(_QWORD))(v4 + 8))(*(_QWORD *)(v4 + 8));
  }
  v5 = CSStore2::String::Get(v14, (CSStore2::Store *)(a1 + 8), a2);
  if (!v15)
    return 0;
  v6 = (void *)MEMORY[0x1A85AA4B4](v5);
  CSStore2::String::getNSStringNoCopy((CSStore2::String *)v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  UTF8BufferFromNSString = (char *)CSStore2::String::GetUTF8BufferFromNSString(v8, (uint64_t)v16);
  v10 = (const char *)strlen(UTF8BufferFromNSString);
  CSStore2::String::Create((CSStore2::String *)v12, *(char ***)&v14[0], (CSStore2::_StringFunctions *)UTF8BufferFromNSString, v10);

  objc_autoreleasePoolPop(v6);
  v15 = v13;
  v14[0] = v12[0];
  v14[1] = v12[1];
  if (v13)
    return DWORD2(v14[0]);
  else
    return 0;
}

void sub_1A4E7C018(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t _CSStringGetLowercase(uint64_t a1, unsigned int a2)
{
  uint64_t v4;
  _DWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  char *UTF8BufferFromNSString;
  const char *v10;
  _BOOL4 v11;
  unsigned int v12;
  _OWORD v14[2];
  char v15;
  _BYTE v16[8];
  unsigned int v17;
  char v18;
  _OWORD v19[2];
  char v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (performConstantAssertions)
  {
    v4 = *(_QWORD *)(a1 + 336);
    if (v4)
      (*(void (**)(_QWORD))(**(_QWORD **)(v4 + 8) + 8))(*(_QWORD *)(v4 + 8));
  }
  v5 = CSStore2::String::Get(v19, (CSStore2::Store *)(a1 + 8), a2);
  if (!v20)
    return 0;
  v14[0] = v19[0];
  v14[1] = v19[1];
  v15 = 1;
  v6 = (void *)MEMORY[0x1A85AA4B4](v5);
  CSStore2::String::getNSStringNoCopy((CSStore2::String *)v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  UTF8BufferFromNSString = (char *)CSStore2::String::GetUTF8BufferFromNSString(v8, (uint64_t)v19);
  v10 = (const char *)strlen(UTF8BufferFromNSString);
  CSStore2::String::Find((CSStore2::String *)v16, *(CSStore2::Store **)&v14[0], (CSStore2::_StringFunctions *)UTF8BufferFromNSString, v10);
  v11 = v18 == 0;
  v12 = v17;

  objc_autoreleasePoolPop(v6);
  if (v11)
    return 0;
  else
    return v12;
}

void sub_1A4E7C178(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t _CSStringCopyUppercase(uint64_t a1, unsigned int a2)
{
  uint64_t v4;
  _DWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  char *UTF8BufferFromNSString;
  const char *v10;
  _OWORD v12[2];
  char v13;
  _OWORD v14[2];
  char v15;
  _BYTE v16[1024];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (performMutatingAssertions)
  {
    v4 = *(_QWORD *)(a1 + 336);
    if (v4)
      (***(void (****)(_QWORD))(v4 + 8))(*(_QWORD *)(v4 + 8));
  }
  v5 = CSStore2::String::Get(v14, (CSStore2::Store *)(a1 + 8), a2);
  if (!v15)
    return 0;
  v6 = (void *)MEMORY[0x1A85AA4B4](v5);
  CSStore2::String::getNSStringNoCopy((CSStore2::String *)v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uppercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  UTF8BufferFromNSString = (char *)CSStore2::String::GetUTF8BufferFromNSString(v8, (uint64_t)v16);
  v10 = (const char *)strlen(UTF8BufferFromNSString);
  CSStore2::String::Create((CSStore2::String *)v12, *(char ***)&v14[0], (CSStore2::_StringFunctions *)UTF8BufferFromNSString, v10);

  objc_autoreleasePoolPop(v6);
  v15 = v13;
  v14[0] = v12[0];
  v14[1] = v12[1];
  if (v13)
    return DWORD2(v14[0]);
  else
    return 0;
}

void sub_1A4E7C2C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t _CSStringGetUppercase(uint64_t a1, unsigned int a2)
{
  uint64_t v4;
  _DWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  char *UTF8BufferFromNSString;
  const char *v10;
  _OWORD v12[2];
  char v13;
  _BYTE v14[40];
  _OWORD v15[2];
  char v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (performConstantAssertions)
  {
    v4 = *(_QWORD *)(a1 + 336);
    if (v4)
      (*(void (**)(_QWORD))(**(_QWORD **)(v4 + 8) + 8))(*(_QWORD *)(v4 + 8));
  }
  v5 = CSStore2::String::Get(v15, (CSStore2::Store *)(a1 + 8), a2);
  if (!v16)
    return 0;
  v12[0] = v15[0];
  v12[1] = v15[1];
  v13 = 1;
  v6 = (void *)MEMORY[0x1A85AA4B4](v5);
  CSStore2::String::getNSStringNoCopy((CSStore2::String *)v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uppercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  UTF8BufferFromNSString = (char *)CSStore2::String::GetUTF8BufferFromNSString(v8, (uint64_t)v15);
  v10 = (const char *)strlen(UTF8BufferFromNSString);
  CSStore2::String::Find((CSStore2::String *)v14, *(CSStore2::Store **)&v12[0], (CSStore2::_StringFunctions *)UTF8BufferFromNSString, v10);
  LODWORD(UTF8BufferFromNSString) = v14[32] == 0;

  objc_autoreleasePoolPop(v6);
  if ((_DWORD)UTF8BufferFromNSString)
    return 0;
  else
    return DWORD2(v12[0]);
}

void sub_1A4E7C424(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t _CSGetConstStringForCharacters(uint64_t a1, CSStore2::_StringFunctions *a2, const char *a3)
{
  uint64_t v6;
  _BYTE v8[8];
  unsigned int v9;
  char v10;

  if (performMutatingAssertions)
  {
    v6 = *(_QWORD *)(a1 + 336);
    if (v6)
      (***(void (****)(_QWORD))(v6 + 8))(*(_QWORD *)(v6 + 8));
  }
  CSStore2::String::Create((CSStore2::String *)v8, (char **)(a1 + 8), a2, a3);
  if (!v10)
    return 0;
  CSStore2::String::setRetainCount((uint64_t)v8, 0, 0);
  return v9;
}

uint64_t _CSGetStringForCFString(uint64_t a1, void *a2)
{
  char *UTF8BufferFromNSString;
  const char *v4;
  _BYTE v6[1024];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  UTF8BufferFromNSString = (char *)CSStore2::String::GetUTF8BufferFromNSString(a2, (uint64_t)v6);
  v4 = (const char *)strlen(UTF8BufferFromNSString);
  return _CSGetStringForCharacters(a1, (CSStore2::_StringFunctions *)UTF8BufferFromNSString, v4);
}

uint64_t _CSCopyStringForCharacters(uint64_t a1, CSStore2::_StringFunctions *a2, const char *a3)
{
  uint64_t v6;
  _BYTE v8[8];
  unsigned int v9;
  char v10;

  if (performMutatingAssertions)
  {
    v6 = *(_QWORD *)(a1 + 336);
    if (v6)
      (***(void (****)(_QWORD))(v6 + 8))(*(_QWORD *)(v6 + 8));
  }
  CSStore2::String::Create((CSStore2::String *)v8, (char **)(a1 + 8), a2, a3);
  if (v10)
    return v9;
  else
    return 0;
}

uint64_t _CSStringGetUnitFromID(uint64_t a1, unsigned int a2)
{
  uint64_t v4;
  _DWORD v6[3];
  char v7;
  char v8;

  if (performConstantAssertions)
  {
    v4 = *(_QWORD *)(a1 + 336);
    if (v4)
      (*(void (**)(_QWORD))(**(_QWORD **)(v4 + 8) + 8))(*(_QWORD *)(v4 + 8));
  }
  CSStore2::String::Get(v6, (CSStore2::Store *)(a1 + 8), a2);
  if (!v8)
    return 0;
  if (v7)
    return 0;
  return v6[2];
}

void CSStore2::Writer::logFunctionCall(CSStore2 *a1, CSStore2 *a2, CSStore2 *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  FILE *v12;
  const void *v13;
  id v14;
  const void *v15;
  id v16;
  const void *v17;
  id v18;
  uint64_t v19;
  const char *v20;
  const char *v21;

  if (CSStore2::getLog(void)::once != -1)
    dispatch_once(&CSStore2::getLog(void)::once, &__block_literal_global_413);
  v12 = (FILE *)CSStore2::getLog(void)::result;
  os_unfair_lock_lock(&CSStore2::logLock);
  CSStore2::getFunctionName(a1, v13);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  fprintf(v12, "%s\n", (const char *)objc_msgSend(v14, "UTF8String"));
  CSStore2::getFunctionName(a2, v15);
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  fprintf(v12, "\t%s\n", (const char *)objc_msgSend(v16, "UTF8String"));
  CSStore2::getFunctionName(a3, v17);
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  fprintf(v12, "\t\t%s(", (const char *)objc_msgSend(v18, "UTF8String"));
  v19 = 0;
  do
  {
    if (v19)
      fputs(", ", v12);
    v20 = (const char *)a4;
    if (*(char *)(a4 + 23) < 0)
      v20 = *(const char **)a4;
    fputs(v20, v12);
    ++v19;
    a4 += 24;
  }
  while (a5 != v19);
  fputs(")\n", v12);
  if (*(char *)(a6 + 23) >= 0)
    v21 = (const char *)a6;
  else
    v21 = *(const char **)a6;
  fprintf(v12, "\t\t\t%s\n", v21);
  fflush(v12);

  os_unfair_lock_unlock(&CSStore2::logLock);
}

void sub_1A4E7C800(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id CSStore2::getFunctionName(CSStore2 *this, const void *a2)
{
  void *v3;

  if (CSStore2::getFunctionName(void const*)::once != -1)
    dispatch_once(&CSStore2::getFunctionName(void const*)::once, &__block_literal_global_11);
  if (CSStore2::getFunctionName(void const*)::symbolicate)
  {
    CSStore2::NameOfSymbol(this, a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

void ___ZN8CSStore2L15getFunctionNameEPKv_block_invoke()
{
  char *v0;
  id v1;

  CSStore2::getFunctionName(void const*)::symbolicate = 1;
  v0 = getenv("CS_SYMBOLICATE_IO_CALLERS");
  if (v0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v0);
    v1 = (id)objc_claimAutoreleasedReturnValue();
    CSStore2::getFunctionName(void const*)::symbolicate = objc_msgSend(v1, "BOOLValue");

  }
}

void sub_1A4E7C908(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void ___ZN8CSStore2L6getLogEv_block_invoke_422()
{
  void *v0;
  void *v1;
  pid_t v2;
  void *v3;
  id v4;
  const char *v5;

  if (!CSStore2::getLog(void)::result)
  {
    NSTemporaryDirectory();
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = (void *)MEMORY[0x1E0CB3940];
    v2 = getpid();
    objc_msgSend(v1, "stringWithFormat:", CFSTR("csstore-writer-%llu-%llu.log"), v2, _CFGetEUID());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "stringByAppendingPathComponent:", v3);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = (const char *)objc_msgSend(v4, "fileSystemRepresentation");

    CSStore2::getLog(void)::result = (uint64_t)fopen(v5, "wb+");
  }
}

void sub_1A4E7C9DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A4E7CAD0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4E7CB48(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void CSStore2::CSStoreSharedReadingAccessContext::assertHeldForWriting(CSStore2::CSStoreSharedReadingAccessContext *this)
{
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "virtual void CSStore2::CSStoreSharedReadingAccessContext::assertHeldForWriting() const");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CSStoreAccessContextPrivInternal.h"), 196, CFSTR("context cannot be held for writing"));

}

void sub_1A4E7CC30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void CSStore2::CSStoreSharedReadingAccessContext::assertHeldForReading(os_unfair_lock_s *this)
{
  os_unfair_lock_s *v2;
  pthread_t v3;
  int8x8_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  unint64_t v9;
  _QWORD *v10;
  _QWORD *i;
  unint64_t v12;
  void *v13;
  void *v14;

  v2 = this + 2;
  os_unfair_lock_lock(this + 2);
  v3 = pthread_self();
  v4 = *(int8x8_t *)&this[6]._os_unfair_lock_opaque;
  if (v4)
  {
    v5 = 0x9DDFEA08EB382D69 * (((8 * (_DWORD)v3) + 8) ^ ((unint64_t)v3 >> 32));
    v6 = 0x9DDFEA08EB382D69 * (((unint64_t)v3 >> 32) ^ (v5 >> 47) ^ v5);
    v7 = 0x9DDFEA08EB382D69 * (v6 ^ (v6 >> 47));
    v8 = (uint8x8_t)vcnt_s8(v4);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v9 = v7;
      if (v7 >= *(_QWORD *)&v4)
        v9 = v7 % *(_QWORD *)&v4;
    }
    else
    {
      v9 = v7 & (*(_QWORD *)&v4 - 1);
    }
    v10 = *(_QWORD **)(*(_QWORD *)&this[4]._os_unfair_lock_opaque + 8 * v9);
    if (v10)
    {
      for (i = (_QWORD *)*v10; i; i = (_QWORD *)*i)
      {
        v12 = i[1];
        if (v7 == v12)
        {
          if ((pthread_t)i[2] == v3)
            goto LABEL_18;
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v12 >= *(_QWORD *)&v4)
              v12 %= *(_QWORD *)&v4;
          }
          else
          {
            v12 &= *(_QWORD *)&v4 - 1;
          }
          if (v12 != v9)
            break;
        }
      }
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "virtual void CSStore2::CSStoreSharedReadingAccessContext::assertHeldForReading() const");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("CSStoreAccessContextPrivInternal.h"), 191, CFSTR("context not held for reading"));

LABEL_18:
  os_unfair_lock_unlock(v2);
}

void sub_1A4E7CDBC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void CSStore2::CSStoreSharedReadingAccessContext::accessForReading(uint64_t a1, void *a2)
{
  uint64_t v2;
  unint64_t v4;
  void **v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint8x8_t v10;
  _QWORD *v11;
  _QWORD *i;
  unint64_t v13;
  _QWORD *v14;
  float v15;
  float v16;
  _BOOL8 v17;
  unint64_t v18;
  unint64_t v19;
  int8x8_t prime;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD *v24;
  unint64_t v25;
  uint8x8_t v26;
  unint64_t v27;
  uint8x8_t v28;
  uint64_t v29;
  _QWORD *v30;
  unint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  unint64_t v34;
  _QWORD *v35;
  int8x8_t v36;
  unint64_t v37;
  uint8x8_t v38;
  _QWORD *v39;
  _QWORD *v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  void *v45;
  void *v46;
  void (**v47)(void);

  v47 = a2;
  v4 = (unint64_t)pthread_self();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
  v5 = (void **)(a1 + 16);
  if (std::__hash_table<_opaque_pthread_t *,std::hash<_opaque_pthread_t *>,std::equal_to<_opaque_pthread_t *>,std::allocator<_opaque_pthread_t *>>::find<_opaque_pthread_t *>((_QWORD *)(a1 + 16), v4))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "virtual void CSStore2::CSStoreSharedReadingAccessContext::accessForReading(void (^ _Nonnull __strong)())");
    v2 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("CSStoreAccessContextPrivInternal.h"), 204, CFSTR("context already held for reading"));

  }
  v6 = 0x9DDFEA08EB382D69 * (((8 * v4) + 8) ^ HIDWORD(v4));
  v7 = 0x9DDFEA08EB382D69 * (HIDWORD(v4) ^ (v6 >> 47) ^ v6);
  v8 = 0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47));
  v9 = *(_QWORD *)(a1 + 24);
  if (v9)
  {
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      v2 = 0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47));
      if (v8 >= v9)
        v2 = v8 % v9;
    }
    else
    {
      v2 = v8 & (v9 - 1);
    }
    v11 = (_QWORD *)*((_QWORD *)*v5 + v2);
    if (v11)
    {
      for (i = (_QWORD *)*v11; i; i = (_QWORD *)*i)
      {
        v13 = i[1];
        if (v13 == v8)
        {
          if (i[2] == v4)
            goto LABEL_76;
        }
        else
        {
          if (v10.u32[0] > 1uLL)
          {
            if (v13 >= v9)
              v13 %= v9;
          }
          else
          {
            v13 &= v9 - 1;
          }
          if (v13 != v2)
            break;
        }
      }
    }
  }
  v14 = operator new(0x18uLL);
  *v14 = 0;
  v14[1] = v8;
  v14[2] = v4;
  v15 = (float)(unint64_t)(*(_QWORD *)(a1 + 40) + 1);
  v16 = *(float *)(a1 + 48);
  if (!v9 || (float)(v16 * (float)v9) < v15)
  {
    v17 = 1;
    if (v9 >= 3)
      v17 = (v9 & (v9 - 1)) != 0;
    v18 = v17 | (2 * v9);
    v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19)
      prime = (int8x8_t)v19;
    else
      prime = (int8x8_t)v18;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      v9 = *(_QWORD *)(a1 + 24);
    }
    if (*(_QWORD *)&prime > v9)
      goto LABEL_32;
    if (*(_QWORD *)&prime < v9)
    {
      v27 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 40) / *(float *)(a1 + 48));
      if (v9 < 3 || (v28 = (uint8x8_t)vcnt_s8((int8x8_t)v9), v28.i16[0] = vaddlv_u8(v28), v28.u32[0] > 1uLL))
      {
        v27 = std::__next_prime(v27);
      }
      else
      {
        v29 = 1 << -(char)__clz(v27 - 1);
        if (v27 >= 2)
          v27 = v29;
      }
      if (*(_QWORD *)&prime <= v27)
        prime = (int8x8_t)v27;
      if (*(_QWORD *)&prime >= v9)
      {
        v9 = *(_QWORD *)(a1 + 24);
      }
      else
      {
        if (prime)
        {
LABEL_32:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:nn180100]();
          v21 = operator new(8 * *(_QWORD *)&prime);
          v22 = *v5;
          *v5 = v21;
          if (v22)
            operator delete(v22);
          v23 = 0;
          *(int8x8_t *)(a1 + 24) = prime;
          do
            *((_QWORD *)*v5 + v23++) = 0;
          while (*(_QWORD *)&prime != v23);
          v24 = *(_QWORD **)(a1 + 32);
          if (v24)
          {
            v25 = v24[1];
            v26 = (uint8x8_t)vcnt_s8(prime);
            v26.i16[0] = vaddlv_u8(v26);
            if (v26.u32[0] > 1uLL)
            {
              if (v25 >= *(_QWORD *)&prime)
                v25 %= *(_QWORD *)&prime;
            }
            else
            {
              v25 &= *(_QWORD *)&prime - 1;
            }
            *((_QWORD *)*v5 + v25) = a1 + 32;
            v30 = (_QWORD *)*v24;
            if (*v24)
            {
              do
              {
                v31 = v30[1];
                if (v26.u32[0] > 1uLL)
                {
                  if (v31 >= *(_QWORD *)&prime)
                    v31 %= *(_QWORD *)&prime;
                }
                else
                {
                  v31 &= *(_QWORD *)&prime - 1;
                }
                if (v31 != v25)
                {
                  if (!*((_QWORD *)*v5 + v31))
                  {
                    *((_QWORD *)*v5 + v31) = v24;
                    goto LABEL_57;
                  }
                  *v24 = *v30;
                  *v30 = **((_QWORD **)*v5 + v31);
                  **((_QWORD **)*v5 + v31) = v30;
                  v30 = v24;
                }
                v31 = v25;
LABEL_57:
                v24 = v30;
                v30 = (_QWORD *)*v30;
                v25 = v31;
              }
              while (v30);
            }
          }
          v9 = (unint64_t)prime;
          goto LABEL_61;
        }
        v45 = *v5;
        *v5 = 0;
        if (v45)
          operator delete(v45);
        v9 = 0;
        *(_QWORD *)(a1 + 24) = 0;
      }
    }
LABEL_61:
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9)
        v2 = v8 % v9;
      else
        v2 = v8;
    }
    else
    {
      v2 = (v9 - 1) & v8;
    }
  }
  v32 = *v5;
  v33 = (_QWORD *)*((_QWORD *)*v5 + v2);
  if (v33)
  {
    *v14 = *v33;
LABEL_74:
    *v33 = v14;
    goto LABEL_75;
  }
  *v14 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v14;
  v32[v2] = a1 + 32;
  if (*v14)
  {
    v34 = *(_QWORD *)(*v14 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v34 >= v9)
        v34 %= v9;
    }
    else
    {
      v34 &= v9 - 1;
    }
    v33 = (char *)*v5 + 8 * v34;
    goto LABEL_74;
  }
LABEL_75:
  ++*(_QWORD *)(a1 + 40);
LABEL_76:
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  v47[2]();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
  v35 = std::__hash_table<_opaque_pthread_t *,std::hash<_opaque_pthread_t *>,std::equal_to<_opaque_pthread_t *>,std::allocator<_opaque_pthread_t *>>::find<_opaque_pthread_t *>((_QWORD *)(a1 + 16), v4);
  if (v35)
  {
    v36 = *(int8x8_t *)(a1 + 24);
    v37 = v35[1];
    v38 = (uint8x8_t)vcnt_s8(v36);
    v38.i16[0] = vaddlv_u8(v38);
    if (v38.u32[0] > 1uLL)
    {
      if (v37 >= *(_QWORD *)&v36)
        v37 %= *(_QWORD *)&v36;
    }
    else
    {
      v37 &= *(_QWORD *)&v36 - 1;
    }
    v39 = (_QWORD *)*((_QWORD *)*v5 + v37);
    do
    {
      v40 = v39;
      v39 = (_QWORD *)*v39;
    }
    while (v39 != v35);
    if (v40 == (_QWORD *)(a1 + 32))
      goto LABEL_94;
    v41 = v40[1];
    if (v38.u32[0] > 1uLL)
    {
      if (v41 >= *(_QWORD *)&v36)
        v41 %= *(_QWORD *)&v36;
    }
    else
    {
      v41 &= *(_QWORD *)&v36 - 1;
    }
    if (v41 != v37)
    {
LABEL_94:
      if (!*v35)
        goto LABEL_95;
      v42 = *(_QWORD *)(*v35 + 8);
      if (v38.u32[0] > 1uLL)
      {
        if (v42 >= *(_QWORD *)&v36)
          v42 %= *(_QWORD *)&v36;
      }
      else
      {
        v42 &= *(_QWORD *)&v36 - 1;
      }
      if (v42 != v37)
LABEL_95:
        *((_QWORD *)*v5 + v37) = 0;
    }
    v43 = *v35;
    if (*v35)
    {
      v44 = *(_QWORD *)(v43 + 8);
      if (v38.u32[0] > 1uLL)
      {
        if (v44 >= *(_QWORD *)&v36)
          v44 %= *(_QWORD *)&v36;
      }
      else
      {
        v44 &= *(_QWORD *)&v36 - 1;
      }
      if (v44 != v37)
      {
        *((_QWORD *)*v5 + v44) = v40;
        v43 = *v35;
      }
    }
    *v40 = v43;
    *v35 = 0;
    --*(_QWORD *)(a1 + 40);
    operator delete(v35);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));

}

void sub_1A4E7D3D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void CSStore2::CSStoreSharedReadingAccessContext::accessForWriting()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "virtual void CSStore2::CSStoreSharedReadingAccessContext::accessForWriting(void (^ _Nonnull __strong)())");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("CSStoreAccessContextPrivInternal.h"), 216, CFSTR("context cannot be held for writing"));

}

void sub_1A4E7D484(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

uint64_t CSStore2::CSStoreSharedReadingAccessContext::copyDescription(CSStore2::CSStoreSharedReadingAccessContext *this)
{
  return objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<CSStoreSharedReadingAccessContext: %p>"), this);
}

uint64_t CSStore2::CSStoreAccessContextInterface::active(CSStore2::CSStoreAccessContextInterface *this)
{
  return 1;
}

void CSStore2::CSStoreSharedReadingAccessContext::~CSStoreSharedReadingAccessContext(CSStore2::CSStoreSharedReadingAccessContext *this)
{
  CSStore2::CSStoreSharedReadingAccessContext::~CSStoreSharedReadingAccessContext(this);
  JUMPOUT(0x1A85AA130);
}

{
  char *v1;
  void *v2;
  void *v3;

  *(_QWORD *)this = off_1E4E21230;
  v1 = (char *)this + 16;
  if (*((_QWORD *)this + 5))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "virtual CSStore2::CSStoreSharedReadingAccessContext::~CSStoreSharedReadingAccessContext()");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CSStoreAccessContextPrivInternal.h"), 226, CFSTR("Destroying shared reading access context with active readers!"));

  }
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)v1);
}

void sub_1A4E7D5B8(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v2;
  void *v3;

  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<CSStore2::CSStoreSharedReadingAccessContext>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_1E4E21328;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<CSStore2::CSStoreSharedReadingAccessContext>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_1E4E21328;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1A85AA130);
}

uint64_t std::__shared_ptr_emplace<CSStore2::CSStoreSharedReadingAccessContext>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 24) + 48))(a1 + 24);
}

void CSStore2::CSStoreQueueAccessContext::assertHeldForWriting(dispatch_queue_t *this)
{
  dispatch_assert_queue_barrier(this[1]);
}

void CSStore2::CSStoreQueueAccessContext::assertHeldForReading(dispatch_queue_t *this)
{
  dispatch_assert_queue_V2(this[1]);
}

void CSStore2::CSStoreQueueAccessContext::accessForReading(uint64_t a1, void *a2)
{
  dispatch_sync(*(dispatch_queue_t *)(a1 + 8), a2);
}

void CSStore2::CSStoreQueueAccessContext::accessForWriting(uint64_t a1, void *a2)
{
  dispatch_barrier_sync(*(dispatch_queue_t *)(a1 + 8), a2);
}

uint64_t CSStore2::CSStoreQueueAccessContext::copyDescription(CSStore2::CSStoreQueueAccessContext *this)
{
  return objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<CSStoreQueueAccessContext: %@>"), *((_QWORD *)this + 1));
}

void CSStore2::CSStoreQueueAccessContext::~CSStoreQueueAccessContext(id *this)
{

}

{

  JUMPOUT(0x1A85AA130);
}

void std::__shared_ptr_emplace<CSStore2::CSStoreQueueAccessContext>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_1E4E21280;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<CSStore2::CSStoreQueueAccessContext>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_1E4E21280;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1A85AA130);
}

uint64_t std::__shared_ptr_emplace<CSStore2::CSStoreQueueAccessContext>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 24) + 48))(a1 + 24);
}

uint64_t CSStore2::CSStoreDebugQueueAccessContext::assertHeldForWriting(CSStore2::CSStoreDebugQueueAccessContext *this)
{
  return (*((uint64_t (**)(_QWORD))this + 3))(*((_QWORD *)this + 1));
}

uint64_t CSStore2::CSStoreDebugQueueAccessContext::assertHeldForReading(CSStore2::CSStoreDebugQueueAccessContext *this)
{
  return (*((uint64_t (**)(_QWORD))this + 2))(*((_QWORD *)this + 1));
}

uint64_t CSStore2::CSStoreDebugQueueAccessContext::copyDescription(CSStore2::CSStoreDebugQueueAccessContext *this)
{
  return objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<CSStoreDebugQueueAccessContext: %@, queueAssert: %p, queueAssertBarrier: %p>"), *((_QWORD *)this + 1), *((_QWORD *)this + 2), *((_QWORD *)this + 3));
}

void CSStore2::CSStoreDebugQueueAccessContext::~CSStoreDebugQueueAccessContext(id *this)
{

}

{

  JUMPOUT(0x1A85AA130);
}

void std::__shared_ptr_emplace<CSStore2::CSStoreDebugQueueAccessContext>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_1E4E212B8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<CSStore2::CSStoreDebugQueueAccessContext>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_1E4E212B8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1A85AA130);
}

uint64_t std::__shared_ptr_emplace<CSStore2::CSStoreDebugQueueAccessContext>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 24) + 48))(a1 + 24);
}

void CSStore2::CSStoreUnfairLockAccessContext::assertHeldForWriting(CSStore2::CSStoreUnfairLockAccessContext *this)
{
  void *v2;
  void *v3;

  if (!*((_BYTE *)this + 16))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "virtual void CSStore2::CSStoreUnfairLockAccessContext::assertHeldForWriting() const");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CSStoreAccessContextPrivInternal.h"), 146, CFSTR("context cannot be held for writing"));

  }
  os_unfair_lock_assert_owner(*((const os_unfair_lock **)this + 1));
}

void sub_1A4E7D8E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void CSStore2::CSStoreUnfairLockAccessContext::assertHeldForReading(const os_unfair_lock **this)
{
  os_unfair_lock_assert_owner(this[1]);
}

void CSStore2::CSStoreUnfairLockAccessContext::accessForReading(uint64_t a1, void *a2)
{
  const os_unfair_lock *v3;
  void (**v4)(_QWORD);

  v3 = *(const os_unfair_lock **)(a1 + 8);
  v4 = a2;
  os_unfair_lock_assert_not_owner(v3);
  os_unfair_lock_lock(*(os_unfair_lock_t *)(a1 + 8));
  v4[2](v4);

  os_unfair_lock_unlock(*(os_unfair_lock_t *)(a1 + 8));
}

void sub_1A4E7D95C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void CSStore2::CSStoreUnfairLockAccessContext::accessForWriting(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void (**v5)(void);

  v5 = a2;
  if (!*(_BYTE *)(a1 + 16))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "virtual void CSStore2::CSStoreUnfairLockAccessContext::accessForWriting(void (^ _Nonnull __strong)())");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("CSStoreAccessContextPrivInternal.h"), 159, CFSTR("context cannot be held for writing"));

  }
  os_unfair_lock_assert_not_owner(*(const os_unfair_lock **)(a1 + 8));
  os_unfair_lock_lock(*(os_unfair_lock_t *)(a1 + 8));
  v5[2]();
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(a1 + 8));

}

void sub_1A4E7DA2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

uint64_t CSStore2::CSStoreUnfairLockAccessContext::copyDescription(CSStore2::CSStoreUnfairLockAccessContext *this)
{
  return objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<CSStoreUnfairLockAccessContext: %p writeOK: %d>"), *((_QWORD *)this + 1), *((unsigned __int8 *)this + 16));
}

void CSStore2::CSStoreUnfairLockAccessContext::~CSStoreUnfairLockAccessContext(CSStore2::CSStoreUnfairLockAccessContext *this)
{
  JUMPOUT(0x1A85AA130);
}

void std::__shared_ptr_emplace<CSStore2::CSStoreUnfairLockAccessContext>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_1E4E212F0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<CSStore2::CSStoreUnfairLockAccessContext>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_1E4E212F0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1A85AA130);
}

uint64_t std::__shared_ptr_emplace<CSStore2::CSStoreUnfairLockAccessContext>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 24) + 48))(a1 + 24);
}

_CSStoreAccessContext *_CSStoreAccessContextCreateWithQueue(void *a1)
{
  id v1;
  _CSStoreAccessContext *v2;
  id v3;
  _QWORD *v4;
  id v5;
  shared_ptr<CSStore2::CSStoreAccessContextInterface> v6;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v9;
  objc_super v11;

  v1 = a1;
  v2 = [_CSStoreAccessContext alloc];
  v3 = v1;
  if (v2)
  {
    v11.receiver = v2;
    v11.super_class = (Class)_CSStoreAccessContext;
    v2 = (_CSStoreAccessContext *)objc_msgSendSuper2(&v11, sel_init);
    if (v2)
    {
      v4 = operator new(0x28uLL);
      v4[1] = 0;
      v4[2] = 0;
      *v4 = &off_1E4E21280;
      v5 = v3;
      v4[3] = off_1E4E21140;
      v4[4] = v5;
      v6.__ptr_ = (CSStoreAccessContextInterface *)(v4 + 3);
      v6.__cntrl_ = (__shared_weak_count *)v4;
      cntrl = (std::__shared_weak_count *)v2->_impl.__cntrl_;
      v2->_impl = v6;
      if (cntrl)
      {
        p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
        do
          v9 = __ldaxr(p_shared_owners);
        while (__stlxr(v9 - 1, p_shared_owners));
        if (!v9)
        {
          ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
          std::__shared_weak_count::__release_weak(cntrl);
        }
      }
    }
  }

  return v2;
}

void sub_1A4E7DBFC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

_CSStoreAccessContext *_CSStoreAccessContextCreateWithQueueAndAssertionFunctions(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  _CSStoreAccessContext *v6;
  id v7;
  _QWORD *v8;
  id v9;
  shared_ptr<CSStore2::CSStoreAccessContextInterface> v10;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v13;
  objc_super v15;

  v5 = a1;
  v6 = [_CSStoreAccessContext alloc];
  v7 = v5;
  if (v6)
  {
    v15.receiver = v6;
    v15.super_class = (Class)_CSStoreAccessContext;
    v6 = (_CSStoreAccessContext *)objc_msgSendSuper2(&v15, sel_init);
    if (v6)
    {
      v8 = operator new(0x38uLL);
      v8[1] = 0;
      v8[2] = 0;
      *v8 = &off_1E4E212B8;
      v9 = v7;
      v8[3] = off_1E4E21190;
      v8[4] = v9;
      v8[5] = a2;
      v8[6] = a3;
      v10.__ptr_ = (CSStoreAccessContextInterface *)(v8 + 3);
      v10.__cntrl_ = (__shared_weak_count *)v8;
      cntrl = (std::__shared_weak_count *)v6->_impl.__cntrl_;
      v6->_impl = v10;
      if (cntrl)
      {
        p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
        do
          v13 = __ldaxr(p_shared_owners);
        while (__stlxr(v13 - 1, p_shared_owners));
        if (!v13)
        {
          ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
          std::__shared_weak_count::__release_weak(cntrl);
        }
      }
    }
  }

  return v6;
}

void sub_1A4E7DD2C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

char *_CSStoreAccessContextCreateWithLock(uint64_t a1, int a2)
{
  _CSStoreAccessContext *v4;
  BOOL v5;
  char *v6;
  _QWORD *v7;
  __int128 v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  objc_super v13;

  v4 = [_CSStoreAccessContext alloc];
  v5 = a2 != 0;
  if (!v4)
    return 0;
  v13.receiver = v4;
  v13.super_class = (Class)_CSStoreAccessContext;
  v6 = (char *)objc_msgSendSuper2(&v13, sel_init);
  if (v6)
  {
    v7 = operator new(0x30uLL);
    v7[1] = 0;
    v7[2] = 0;
    *v7 = &off_1E4E212F0;
    v7[3] = off_1E4E211E0;
    v7[4] = a1;
    *((_BYTE *)v7 + 40) = v5;
    *(_QWORD *)&v8 = v7 + 3;
    *((_QWORD *)&v8 + 1) = v7;
    v9 = (std::__shared_weak_count *)*((_QWORD *)v6 + 2);
    *(_OWORD *)(v6 + 8) = v8;
    if (v9)
    {
      p_shared_owners = (unint64_t *)&v9->__shared_owners_;
      do
        v11 = __ldaxr(p_shared_owners);
      while (__stlxr(v11 - 1, p_shared_owners));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
  }
  return v6;
}

void sub_1A4E7DE40(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id _CSStoreAccessContextCreateSharedReadingContext()
{
  return -[_CSStoreAccessContext initForSharedReading]([_CSStoreAccessContext alloc], "initForSharedReading");
}

uint64_t _CSStoreAccessContextAssertReading(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 8))(*(_QWORD *)(a1 + 8));
}

uint64_t _CSStoreAccessContextAssertWriting(uint64_t a1)
{
  return (***(uint64_t (****)(_QWORD))(a1 + 8))(*(_QWORD *)(a1 + 8));
}

void ___ZL13GetContextLogv_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.coreservicesstore", "access_context");
  v1 = (void *)GetContextLog(void)::result;
  GetContextLog(void)::result = (uint64_t)v0;

}

void _CSStoreAccessContextAccessForWrite(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void (*v6)(uint64_t, _QWORD *);
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  GetContextLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v12 = a1;
    _os_log_debug_impl(&dword_1A4E5A000, v4, OS_LOG_TYPE_DEBUG, "accessing for write: %@", buf, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 8);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = ___CSStoreAccessContextAccessForWrite_block_invoke;
  v8[3] = &unk_1E4E21EC8;
  v9 = v3;
  v10 = a1;
  v6 = *(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v5 + 24);
  v7 = v3;
  v6(v5, v8);

}

void sub_1A4E7DFCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

uint64_t CSMapAddMapTable(__CSStore *a1, void *a2, int a3)
{
  size_t v5;
  _DWORD *v6;
  void *v7;
  unsigned int v8;
  int *v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int v12;
  char *Unit;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char v18;
  id v20;
  _OWORD v21[4];
  __int128 v22;
  __int128 v23;

  v22 = 0u;
  v23 = 0u;
  memset(v21, 0, sizeof(v21));
  v5 = (a3 + 28);
  v6 = malloc_type_malloc(v5, 0x7BEB9A07uLL);
  bzero(v6, v5);
  v7 = (void *)MEMORY[0x1A85AA4B4]();
  v20 = 0;
  v8 = _CSStoreAddTable((uint64_t)a1, a2, v5, &v20);
  if (v8)
  {

    objc_autoreleasePoolPop(v7);
    v6[2] = 511;
    v9 = v6 + 2;
    v10 = CSStoreAllocUnit((uint64_t)a1, v8, 4088);
    v11 = (uint64_t)a1;
    v12 = v8;
    goto LABEL_3;
  }
  objc_msgSend(v20, "domain");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqual:", *MEMORY[0x1E0CB2F90]);

  if ((v18 & 1) == 0)
  {

    objc_autoreleasePoolPop(v7);
    v16 = 4294957803;
LABEL_12:
    if (!v6)
      return v16;
    goto LABEL_13;
  }
  v16 = objc_msgSend(v20, "code");

  objc_autoreleasePoolPop(v7);
  if ((_DWORD)v16)
    goto LABEL_12;
  v6[2] = 511;
  v9 = v6 + 2;
  v10 = CSStoreAllocUnit((uint64_t)a1, 0, 4088);
  v11 = (uint64_t)a1;
  v12 = 0;
LABEL_3:
  Unit = CSStoreGetUnit(v11, v12, v10, 0);
  v6[1] = v10;
  if (!Unit)
  {
    v16 = 4294957803;
    goto LABEL_17;
  }
  *v6 = 0;
  v14 = v6[2];
  v6[3] = v14;
  v6[4] = v14 >> 1;
  *(_QWORD *)(v6 + 5) = 0xDDDDDDD2EEEEEEE1;
  v15 = _CSMapWriteToHeader(a1, v8, 0, (const void *)v5, v6);
  if ((_DWORD)v15
    || (LODWORD(v21[0]) = v8,
        *((_QWORD *)&v22 + 1) = v6,
        v15 = _CSMapSetBucketRange((uint64_t)a1, (uint64_t)v21, 0, 0, v6[2], v6[5]),
        (_DWORD)v15))
  {
    v16 = v15;
    goto LABEL_17;
  }
  v16 = _CSMapSetBucketRange((uint64_t)a1, (uint64_t)v21, *v9, 0, *v9, 233893374);
  if (!(_DWORD)v16)
  {
LABEL_13:
    free(v6);
    return v16;
  }
LABEL_17:
  free(v6);
  if (v8)
    _CSStoreRemoveTable((uint64_t)a1, v8);
  return v16;
}

void sub_1A4E7E228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

uint64_t _CSMapWriteToHeader(__CSStore *a1, unsigned int a2, unsigned int a3, const void *a4, const void *a5)
{
  unsigned int v9;
  uint64_t v10;
  void *v11;
  int v12;
  id v14;

  v14 = 0;
  if (a1)
    v9 = -37516;
  else
    v9 = 0;
  if (_CSStoreWriteToUnit((uint64_t)a1, v9, a2, a3, a4, a5, &v14))
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqual:", *MEMORY[0x1E0CB2F90]);

    if (v12)
      v10 = objc_msgSend(v14, "code");
    else
      v10 = 4294962336;
  }

  return v10;
}

void sub_1A4E7E2E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

uint64_t _CSMapSetBucketRange(uint64_t a1, uint64_t a2, int a3, unsigned int a4, unsigned int a5, int a6)
{
  unsigned int v6;
  uint64_t v7;
  void *v13;
  unsigned int v14;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unsigned int v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  id v26;
  int v27;

  v27 = a6;
  v6 = *(_DWORD *)(*(_QWORD *)(a2 + 72) + 8);
  if (v6 < a4)
    return 4294957804;
  if (a5 + a4 > v6)
    return 4294957799;
  if (!a5)
    return 4294957804;
  if (a5 == 1)
  {
    v13 = (void *)MEMORY[0x1A85AA4B4]();
    v14 = *(_DWORD *)(*(_QWORD *)(a2 + 72) + 4);
    v26 = 0;
    if (_CSStoreWriteToUnit(a1, *(_DWORD *)a2, v14, 4 * (a4 + a3), (const void *)4, &v27, &v26))
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v26, "domain");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqual:", *MEMORY[0x1E0CB2F90]);

      if (v22)
        v7 = objc_msgSend(v26, "code");
      else
        v7 = 4294962336;
    }

    objc_autoreleasePoolPop(v13);
  }
  else
  {
    v16 = malloc_type_malloc(4 * a5, 0x100004052888210uLL);
    if (v16)
    {
      v17 = v16;
      v18 = 0;
      do
        *((_DWORD *)v16 + v18++) = a6;
      while (a5 != v18);
      v19 = (void *)MEMORY[0x1A85AA4B4]();
      v20 = *(_DWORD *)(*(_QWORD *)(a2 + 72) + 4);
      v26 = 0;
      if (_CSStoreWriteToUnit(a1, *(_DWORD *)a2, v20, 4 * (a4 + a3), (const void *)(4 * a5), v17, &v26))
      {
        v7 = 0;
      }
      else
      {
        objc_msgSend(v26, "domain");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isEqual:", *MEMORY[0x1E0CB2F90]);

        if (v24)
          v7 = objc_msgSend(v26, "code");
        else
          v7 = 4294962336;
      }

      objc_autoreleasePoolPop(v19);
      free(v17);
    }
    else
    {
      return 4294967255;
    }
  }
  return v7;
}

void sub_1A4E7E508(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v9;

  _Unwind_Resume(a1);
}

char *CSMapGetHeader(uint64_t a1, unsigned int *a2, unsigned int *a3)
{
  char *Header;
  BOOL v5;
  int v6;
  unsigned int v7;
  unsigned int v9;

  v9 = 0;
  Header = CSStoreGetHeader(a1, *a2, &v9);
  if (Header)
    v5 = v9 > 0x1C;
  else
    v5 = 0;
  v6 = v5;
  if (a3)
  {
    v7 = v9 - 28;
    if (!v6)
      v7 = 0;
    *a3 = v7;
  }
  if (v6)
    return Header + 28;
  else
    return 0;
}

uint64_t CSMapWriteToHeader(__CSStore *a1, unsigned int *a2, int a3, const void *a4, const void *a5)
{
  return _CSMapWriteToHeader(a1, *a2, a3 + 28, a4, a5);
}

uint64_t CSMapGetKeyAndValueForKeyData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, _DWORD *a6, _DWORD *a7)
{
  uint64_t result;
  _DWORD *v15;
  unsigned int *v16;
  unint64_t v17;
  unint64_t v18;
  unsigned int v19;
  unsigned int v20;
  unint64_t i;
  uint64_t v22;
  uint64_t v23;
  _DWORD *v24;

  result = CSMapSync(a1, a2);
  if (!(_DWORD)result)
  {
    v24 = a6;
    v15 = a7;
    v16 = *(unsigned int **)(a2 + 72);
    v17 = v16[2];
    v18 = a5 % v17;
    v19 = v16[5];
    v20 = v16[6];
    i = v18;
    while (1)
    {
      v22 = *(unsigned int *)(*(_QWORD *)(a2 + 80) + 4 * i);
      if ((_DWORD)v22 == v19)
        return 4294957797;
      if ((_DWORD)v22 != v20
        && (*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a2 + 32))(a1, a2, v22, a3, a4))
      {
        break;
      }
      if (++i >= v17)
      {
        if ((_DWORD)v18)
        {
          for (i = 0; i < v18; ++i)
          {
            v23 = *(unsigned int *)(*(_QWORD *)(a2 + 80) + 4 * i);
            if ((_DWORD)v23 == v19)
              break;
            if ((_DWORD)v23 != v20
              && (*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a2 + 32))(a1, a2, v23, a3, a4))
            {
              goto LABEL_15;
            }
          }
        }
        return 4294957797;
      }
    }
LABEL_15:
    if (v24)
      *v24 = *(_DWORD *)(*(_QWORD *)(a2 + 80) + 4 * i);
    result = 0;
    if (v15)
      *v15 = *(_DWORD *)(*(_QWORD *)(a2 + 88) + 4 * i);
  }
  return result;
}

uint64_t CSMapSetValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  char *Header;
  _DWORD *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  int v14;
  unsigned int v15;
  char *Unit;
  uint64_t v17;
  unsigned int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t, uint64_t);
  void (*v28)(uint64_t, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  int *v35;
  uint64_t v36;
  int *v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  int *v43;
  uint64_t v44;
  int *v45;
  int v46;
  uint64_t v47;
  unsigned int v48;
  void (*v49)(uint64_t, uint64_t, uint64_t);
  uint64_t v50;
  uint64_t v51;
  unsigned int v52;
  size_t __n;

  result = CSMapSync(a1, a2);
  if ((_DWORD)result)
    return result;
  v50 = 0;
  if (*(_DWORD *)(*(_QWORD *)(a2 + 72) + 12) == *(_DWORD *)(*(_QWORD *)(a2 + 72) + 16)
    && *(_QWORD *)(a2 + 80)
    && *(_QWORD *)(a2 + 88))
  {
    LODWORD(__n) = 0;
    Header = CSStoreGetHeader(a1, *(_DWORD *)a2, &__n);
    v10 = malloc_type_calloc(1uLL, (__n + 1), 0x57EA7455uLL);
    memcpy(v10, Header, __n);
    v11 = v10[2];
    v12 = (char *)malloc_type_calloc((8 * (_DWORD)v11) | 1u, 1uLL, 0xEBDD3AEBuLL);
    if (v12)
    {
      v13 = v12;
      memcpy(v12, *(const void **)(a2 + 80), (8 * v11));
      CSStoreFreeUnit(a1, *(_DWORD *)a2, v10[1]);
      v14 = 2 * v11 - 1;
      v10[2] = v14;
      v15 = CSStoreAllocUnit(a1, *(_DWORD *)a2, 8 * v14);
      Unit = CSStoreGetUnit(a1, *(_DWORD *)a2, v15, 0);
      *(_QWORD *)(a2 + 80) = Unit;
      v10[1] = v15;
      *(_QWORD *)(a2 + 88) = &Unit[4 * v10[2]];
      *(_QWORD *)(a2 + 72) = CSStoreGetHeader(a1, *(_DWORD *)a2, 0);
      if (performConstantAssertions)
      {
        v17 = *(_QWORD *)(a1 + 336);
        if (v17)
          (*(void (**)(_QWORD))(**(_QWORD **)(v17 + 8) + 8))(*(_QWORD *)(v17 + 8));
      }
      *(_DWORD *)(a2 + 68) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) + 8);
      v18 = v10[2];
      v10[3] = v18;
      v10[4] = v18 >> 1;
      if (_CSMapWriteToHeader((__CSStore *)a1, *(_DWORD *)a2, 0, (const void *)__n, v10))
        goto LABEL_21;
      if (_CSMapSetBucketRange(a1, a2, 0, 0, v10[2], v10[5]))
        goto LABEL_21;
      v19 = _CSMapSetBucketRange(a1, a2, *(_DWORD *)(*(_QWORD *)(a2 + 72) + 8), 0, v10[2], 233893374);
      if (!(_DWORD)v11 || v19)
        goto LABEL_21;
      v20 = 0;
      v21 = 4 * v11;
      v22 = &v13[4 * v11];
      do
      {
        v23 = *(_QWORD *)(a2 + 72);
        v24 = *(unsigned int *)&v13[v20];
        if (*(_DWORD *)(v23 + 20) != (_DWORD)v24 && *(_DWORD *)(v23 + 24) != (_DWORD)v24)
        {
          v52 = 0;
          v51 = 0;
          _CSMapFindBucketForKey(a1, (_QWORD *)a2, v24, (int *)&v52, (int *)&v51 + 1);
          if (_CSMapSetBucketRange(a1, a2, 0, HIDWORD(v51), 1u, *(_DWORD *)&v13[v20]))
            break;
          if (_CSMapSetBucketRange(a1, a2, *(_DWORD *)(*(_QWORD *)(a2 + 72) + 8), HIDWORD(v51), 1u, *(_DWORD *)&v22[v20]))break;
          v25 = v10[3] - 1;
          v10[3] = v25;
          LODWORD(v51) = v25;
          if (_CSMapWriteToHeader((__CSStore *)a1, *(_DWORD *)a2, 0xCu, (const void *)4, &v51))
            break;
        }
        v20 += 4;
      }
      while (v21 != v20);
      if (v10)
LABEL_21:
        free(v10);
    }
    else
    {
      v13 = (char *)v10;
    }
    free(v13);
  }
  v52 = 0;
  _CSMapFindBucketForKey(a1, (_QWORD *)a2, a3, (int *)&v52, (int *)&v50 + 1);
  if (v52 != -1)
  {
    v26 = *(unsigned int *)(*(_QWORD *)(a2 + 88) + 4 * v52);
    if ((_DWORD)v26 == (_DWORD)a4)
      return 0;
    result = _CSMapSetBucketRange(a1, a2, *(_DWORD *)(*(_QWORD *)(a2 + 72) + 8), v52, 1u, a4);
    if ((_DWORD)result)
      return result;
    v27 = *(void (**)(uint64_t, uint64_t, uint64_t))(a2 + 40);
    if (v27)
      v27(a1, a2, a4);
    v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(a2 + 48);
    if (!v28)
      return 0;
    v29 = a1;
    v30 = a2;
    v31 = v26;
    goto LABEL_67;
  }
  v32 = *(_QWORD *)(a2 + 72);
  if (*(_DWORD *)(v32 + 20) == (_DWORD)a3)
  {
    v33 = *(unsigned int *)(v32 + 8);
    v34 = a3 + 2;
    LODWORD(__n) = a3 + 2;
    if ((_DWORD)v33)
    {
      v35 = *(int **)(a2 + 80);
LABEL_33:
      v36 = v33;
      v37 = v35;
      do
      {
        v38 = *v37++;
        if (v38 == v34)
        {
          v34 += 2;
          LODWORD(__n) = v34;
          goto LABEL_33;
        }
        --v36;
      }
      while (v36);
      result = _CSMapWriteToHeader((__CSStore *)a1, *(_DWORD *)a2, 0x14u, (const void *)4, &__n);
      if (!(_DWORD)result)
      {
        v39 = 0;
        while (1)
        {
          if (*(_DWORD *)(*(_QWORD *)(a2 + 80) + 4 * v39) == (_DWORD)a3)
          {
            result = _CSMapSetBucketRange(a1, a2, 0, v39, 1u, __n);
            if ((_DWORD)result)
              break;
          }
          if (v33 == ++v39)
            goto LABEL_45;
        }
      }
      return result;
    }
    result = _CSMapWriteToHeader((__CSStore *)a1, *(_DWORD *)a2, 0x14u, (const void *)4, &__n);
    if ((_DWORD)result)
      return result;
  }
LABEL_45:
  v40 = *(_QWORD *)(a2 + 72);
  if (*(_DWORD *)(v40 + 24) == (_DWORD)a3)
  {
    v41 = *(unsigned int *)(v40 + 8);
    v42 = a3 + 2;
    LODWORD(__n) = a3 + 2;
    if ((_DWORD)v41)
    {
      v43 = *(int **)(a2 + 80);
LABEL_48:
      v44 = v41;
      v45 = v43;
      do
      {
        v46 = *v45++;
        if (v46 == v42)
        {
          v42 += 2;
          LODWORD(__n) = v42;
          goto LABEL_48;
        }
        --v44;
      }
      while (v44);
      result = _CSMapWriteToHeader((__CSStore *)a1, *(_DWORD *)a2, 0x18u, (const void *)4, &__n);
      if (!(_DWORD)result)
      {
        v47 = 0;
        while (1)
        {
          if (*(_DWORD *)(*(_QWORD *)(a2 + 80) + 4 * v47) == (_DWORD)a3)
          {
            result = _CSMapSetBucketRange(a1, a2, 0, v47, 1u, __n);
            if ((_DWORD)result)
              break;
          }
          if (v41 == ++v47)
            goto LABEL_60;
        }
      }
      return result;
    }
    result = _CSMapWriteToHeader((__CSStore *)a1, *(_DWORD *)a2, 0x18u, (const void *)4, &__n);
    if ((_DWORD)result)
      return result;
  }
LABEL_60:
  v48 = HIDWORD(v50);
  result = _CSMapSetBucketRange(a1, a2, 0, HIDWORD(v50), 1u, a3);
  if (!(_DWORD)result)
  {
    LODWORD(v50) = *(_DWORD *)(*(_QWORD *)(a2 + 72) + 12) - 1;
    result = _CSMapWriteToHeader((__CSStore *)a1, *(_DWORD *)a2, 0xCu, (const void *)4, &v50);
    if (!(_DWORD)result)
    {
      result = _CSMapSetBucketRange(a1, a2, *(_DWORD *)(*(_QWORD *)(a2 + 72) + 8), v48, 1u, a4);
      if (!(_DWORD)result)
      {
        v49 = *(void (**)(uint64_t, uint64_t, uint64_t))(a2 + 8);
        if (v49)
          v49(a1, a2, a3);
        v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(a2 + 40);
        if (!v28)
          return 0;
        v29 = a1;
        v30 = a2;
        v31 = a4;
LABEL_67:
        v28(v29, v30, v31);
        return 0;
      }
    }
  }
  return result;
}

uint64_t CSMapRemoveValue(__CSStore *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  _DWORD *v9;
  uint64_t v10;
  int v11;
  int i;
  void (*v13)(__CSStore *, _QWORD *, uint64_t);
  void (*v14)(__CSStore *, _QWORD *, uint64_t);
  int v15;
  unsigned int v16;

  result = CSMapSync((uint64_t)a1, (uint64_t)a2);
  if (!(_DWORD)result)
  {
    v16 = 0;
    result = _CSMapFindBucketForKey((uint64_t)a1, a2, a3, (int *)&v16, 0);
    if (!(_DWORD)result)
    {
      v7 = v16;
      v8 = *(unsigned int *)(a2[11] + 4 * v16);
      result = _CSMapSetBucketRange((uint64_t)a1, (uint64_t)a2, 0, v16, 1u, *(_DWORD *)(a2[9] + 24));
      if (!(_DWORD)result)
      {
        v15 = *(_DWORD *)(a2[9] + 12) + 1;
        result = _CSMapWriteToHeader(a1, *(_DWORD *)a2, 0xCu, (const void *)4, &v15);
        if (!(_DWORD)result)
        {
          v9 = (_DWORD *)a2[9];
          v10 = a2[10];
          if (v9[5] == *(_DWORD *)(v10 + 4 * ((v7 + 1) % v9[2])))
          {
            v11 = v9[6];
            for (i = *(_DWORD *)(v10 + 4 * v7); v11 == i; i = *(_DWORD *)(a2[10] + 4 * v7))
            {
              result = _CSMapSetBucketRange((uint64_t)a1, (uint64_t)a2, 0, v7, 1u, v9[5]);
              if ((_DWORD)result)
                return result;
              v9 = (_DWORD *)a2[9];
              LODWORD(v7) = (v7 + v9[2] - 1) % v9[2];
              v11 = v9[6];
            }
          }
          v13 = (void (*)(__CSStore *, _QWORD *, uint64_t))a2[2];
          if (v13)
            v13(a1, a2, a3);
          v14 = (void (*)(__CSStore *, _QWORD *, uint64_t))a2[6];
          if (v14)
            v14(a1, a2, v8);
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t _CSMapCopyDebugDescription(uint64_t a1, unsigned int *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  const void *v6;
  void *v7;
  CSStore2 **v8;
  void *v9;
  NSString *v10;
  unsigned int *v11;
  NSNumber *v12;
  NSNumber *v13;
  NSNumber *v14;
  NSNumber *v15;
  NSNumber *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v21[6];
  unsigned int v22;
  _QWORD v23[6];
  unsigned int v24;
  void (**v25)(CSStore2::AttributedStringWriter *__hidden);
  _QWORD v26[2];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD *v41;

  if (CSMapSync(a1, (uint64_t)a2))
    return 0;
  v4 = (void *)MEMORY[0x1A85AA4B4]();
  v25 = &off_1E4E21120;
  v26[0] = 0;
  v32 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v5 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v26[1] = v5;
  *(_QWORD *)&v32 = 0;
  v33 = 0u;
  v34 = 0u;
  DWORD2(v32) = 1065353216;
  LODWORD(v35) = 1065353216;
  WORD4(v35) = 0;
  *(_QWORD *)&v36 = 0;
  WORD4(v36) = 257;
  BYTE10(v36) = 0;
  v41 = v26;
  CSStore2::AttributedStringWriter::format((CSStore2::AttributedStringWriter *)&v25, CFSTR("table"), CFSTR("%llu (0x%llx)"), *a2, *a2);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (CSStore2 **)(a2 + 2);
  do
  {
    CSStore2::NameOfSymbol(*v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v7, "addObject:", v9);

    ++v8;
  }
  while (v8 < (CSStore2 **)a2 + 7);
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  CSStore2::AttributedStringWriter::string((CSStore2::AttributedStringWriter *)&v25, CFSTR("callbacks"), v10);

  v11 = (unsigned int *)*((_QWORD *)a2 + 9);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *v11);
    v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)&v25, CFSTR("version"), v12);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11[1]);
    v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)&v25, CFSTR("unit"), v13);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11[2]);
    v14 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)&v25, CFSTR("bucket count"), v14);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11[3]);
    v15 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)&v25, CFSTR("empty count"), v15);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11[4]);
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)&v25, CFSTR("threshold"), v16);

    v24 = v11[5];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3321888768;
    v23[2] = ___CSMapCopyDebugDescription_block_invoke;
    v23[3] = &__block_descriptor_48_ea8_32c39_ZTSKZ26_CSMapCopyDebugDescriptionE3__0_e5_v8__0l;
    v23[4] = &v25;
    v23[5] = &v24;
    CSStore2::AttributedStringWriter::withAppliedAttribute((uint64_t)&v25, (uint64_t)CFSTR("_CSVNum"), (uint64_t)v17, (uint64_t)v23);

    v22 = v11[6];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v18;
    v21[1] = 3321888768;
    v21[2] = ___CSMapCopyDebugDescription_block_invoke_22;
    v21[3] = &__block_descriptor_48_ea8_32c39_ZTSKZ26_CSMapCopyDebugDescriptionE3__1_e5_v8__0l;
    v21[4] = &v25;
    v21[5] = &v22;
    CSStore2::AttributedStringWriter::withAppliedAttribute((uint64_t)&v25, (uint64_t)CFSTR("_CSVNum"), (uint64_t)v19, (uint64_t)v21);

  }
  v3 = objc_msgSend(v5, "copy");

  CSStore2::AttributedStringWriter::~AttributedStringWriter((CSStore2::AttributedStringWriter *)&v25);
  objc_autoreleasePoolPop(v4);
  return v3;
}

void sub_1A4E7F180(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  void *v17;
  void *v18;
  void *v19;
  va_list va;

  va_start(va, a17);

  CSStore2::AttributedStringWriter::~AttributedStringWriter((CSStore2::AttributedStringWriter *)va);
  _Unwind_Resume(a1);
}

__n128 __copy_helper_block_ea8_32c39_ZTSKZ26_CSMapCopyDebugDescriptionE3__1(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = a2[2];
  a1[2] = result;
  return result;
}

__n128 __copy_helper_block_ea8_32c39_ZTSKZ26_CSMapCopyDebugDescriptionE3__0(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = a2[2];
  a1[2] = result;
  return result;
}

void sub_1A4E7F2A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4E7F38C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4E7F3E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)_CSVisualizer;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1A4E7F48C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4E7F4DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4E7F578(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A4E7F79C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4E7F89C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4E7F984(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4E7FBAC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A4E7FCA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1A4E7FD44(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4E7FE48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_1A4E7FF24(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4E8026C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4E8035C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4E8061C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  void *v11;
  void *v12;
  va_list va;

  va_start(va, a11);

  CSStore2::AttributedStringWriter::~AttributedStringWriter((CSStore2::AttributedStringWriter *)va);
  _Unwind_Resume(a1);
}

void sub_1A4E80828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  void *v5;
  void *v6;
  va_list va;

  va_start(va, a5);

  CSStore2::AttributedStringWriter::~AttributedStringWriter((CSStore2::AttributedStringWriter *)va);
  _Unwind_Resume(a1);
}

void sub_1A4E80A10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  void *v7;
  va_list va;

  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E80E58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *a33)
{
  void *v33;
  uint64_t v34;
  void *v36;

  if (v33)
    operator delete(v33);

  _Block_object_dispose((const void *)(v34 - 176), 8);
  v36 = *(void **)(v34 - 128);
  if (v36)
  {
    *(_QWORD *)(v34 - 120) = v36;
    operator delete(v36);
  }

  _Unwind_Resume(a1);
}

void sub_1A4E81550(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4E8162C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1A4E816D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4E81760(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4E81998(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  va_list va;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  va_list va1;

  va_start(va1, a12);
  va_start(va, a12);
  v16 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  v20 = va_arg(va1, _QWORD);

  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);

  _Unwind_Resume(a1);
}

void sub_1A4E81B30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A4E81BFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{

  _Unwind_Resume(a1);
}

void sub_1A4E81CBC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A4E8205C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__33(__n128 *a1, __n128 *a2)
{
  __n128 result;

  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void __Block_byref_object_dispose__34(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(_QWORD *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

void sub_1A4E822F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__632(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = a2[3];
  a1[3] = result;
  return result;
}

void sub_1A4E823FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A4E82620(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1A4E826B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1A4E82718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1A4E827FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A4E82978(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A4E82A84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A4E82CFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

uint64_t CSStore2::ansiColorCodeFromNSNumber(CSStore2 *this, NSNumber *a2)
{
  CSStore2 *v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;

  v2 = this;
  v3 = _NSIsNSNumber();
  if (v3)
    v3 = -[CSStore2 unsignedIntegerValue](v2, "unsignedIntegerValue");
  v4 = BYTE2(v3);
  v5 = v3 >> 8;
  v6 = v3;
  v7 = BYTE1(v3);

  if (v4 == v5 && v7 == v6)
  {
    if (v4 <= 0xF5)
      v8 = ((197400 * v4) >> 21) + 232;
    else
      v8 = 15;
  }
  else
  {
    v8 = (((84215046 * (unint64_t)v6) >> 32)
                      + 36 * ((84215046 * (unint64_t)v4) >> 32)
                      + 6 * ((84215046 * (unint64_t)v7) >> 32)
                      + 16);
  }

  return v8;
}

void sub_1A4E82E18(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t _CSArrayCreate(uint64_t a1, uint64_t a2, int a3, _QWORD *a4)
{
  void *v6;
  uint64_t Common;
  _QWORD v9[5];
  int v10;

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = ___CSArrayCreate_block_invoke;
  v9[3] = &__block_descriptor_44_e68__optional_CSStore2::Array_____c_Array___Store____Data_II__B_16__0_v8l;
  v9[4] = a2;
  v10 = a3;
  v6 = (void *)MEMORY[0x1A85AA61C](v9);
  Common = _CSArrayCreateCommon(a1, v6, a4);

  return Common;
}

void sub_1A4E82EE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t _CSArrayCreateCommon(uint64_t a1, void *a2, _QWORD *a3)
{
  void (**v5)(_QWORD *__return_ptr, id, uint64_t);
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  unsigned int v15;
  char v16;
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v17[0] = *MEMORY[0x1E0CB2938];
    v17[1] = CFSTR("Line");
    v18[0] = CFSTR("paramErr");
    v18[1] = &unk_1E4E255E0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  if (performMutatingAssertions)
  {
    v6 = *(_QWORD *)(a1 + 336);
    if (v6)
      (***(void (****)(_QWORD))(v6 + 8))(*(_QWORD *)(v6 + 8));
  }
  v5[2](&v14, v5, a1 + 8);
  if (!v16)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v19[0] = *MEMORY[0x1E0CB2938];
    v19[1] = CFSTR("Line");
    v20[0] = CFSTR("kCSStoreAllocFailedErr");
    v20[1] = &unk_1E4E255C8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -9493, v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
    v8 = 0;
    if (!a3)
      goto LABEL_13;
    goto LABEL_11;
  }
  v7 = 0;
  v8 = v15;
  if (!a3)
    goto LABEL_13;
LABEL_11:
  if (!(_DWORD)v8)
    *a3 = v7;
LABEL_13:

  return v8;
}

void sub_1A4E830DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

unint64_t CSStore2::Array::_Create(CSStore2::Array *this, CSStore2::Store *a2, unsigned int a3, const unsigned int *a4, unsigned int a5)
{
  unsigned int v5;
  unint64_t v9;
  char *Table;
  unint64_t result;
  unint64_t v12;
  unsigned int v13;
  _BOOL4 v14;
  int *v15;
  int v16;
  _WORD *v17;
  int v18;
  int v19;
  int v20;

  v5 = a5;
  *(_BYTE *)this = 0;
  *((_BYTE *)this + 24) = 0;
  if (a5 <= a3)
    v9 = a3;
  else
    v9 = a5;
  Table = (char *)*((_QWORD *)a2 + 33);
  if (Table
    || (Table = CSStore2::Store::getTable((CSStore2 **)a2, CFSTR("<array>"))) != 0
    || (result = (unint64_t)CSStore2::Store::allocateTable(a2, CFSTR("<array>"), 0, 0),
        (Table = (char *)result) != 0))
  {
    if (v5)
    {
      if (*((_WORD *)a4 + 1))
      {
        v14 = 0;
      }
      else
      {
        v12 = 0;
        while (v5 - 1 != v12)
        {
          v13 = a4[++v12];
          if (v13 >= 0x10000)
            goto LABEL_16;
        }
        v12 = v5;
LABEL_16:
        v14 = v12 >= v5;
      }
    }
    else
    {
      v14 = 1;
    }
    result = CSStore2::Array::_GetDataSizeWithCapacity((CSStore2::Array *)v9, v14);
    if (HIDWORD(result))
    {
      result = (unint64_t)CSStore2::Store::allocateUnit(a2, (CSStore2::Table *)Table, result, 0);
      if (result)
      {
        v15 = (int *)(result + 8);
        if (v14)
          v16 = 0x20000000;
        else
          v16 = 0;
        if (a4 && v5)
        {
          *(_DWORD *)(result + 8) = v16 | v5 & 0x1FFFFFFF;
          v17 = (_WORD *)(result + 12);
          if (v14)
          {
            do
            {
              v18 = *a4++;
              *v17++ = v18;
              --v5;
            }
            while (v5);
          }
          else
          {
            do
            {
              v19 = *a4++;
              *(_DWORD *)v17 = v19;
              v17 += 2;
              --v5;
            }
            while (v5);
          }
        }
        else
        {
          *v15 = v16;
        }
        *((_BYTE *)this + 24) = 1;
        *(_QWORD *)this = a2;
        *((_QWORD *)this + 1) = v15;
        v20 = 4 * *(_DWORD *)result;
        *((_DWORD *)this + 4) = v9;
        *((_DWORD *)this + 5) = v20;
      }
    }
  }
  return result;
}

uint64_t CSStore2::Array::_GetDataSizeWithCapacity(CSStore2::Array *this, int a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  unint64_t v5;
  NSObject *v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a2)
    v2 = 2;
  else
    v2 = 4;
  v3 = this;
  v4 = 1;
  if (!a2)
    v4 = 2;
  v5 = (unint64_t)this << v4;
  if (v5 == (v5 & 0xFFFFFFFE) && (v5 & 0xFFFFFFFE) <= 0xFFFFFFFB)
    return ((_DWORD)v5 + 4) & 0xFFFFFFFE | 0x100000000;
  CSStore2::GetLog(this);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v9 = 134218496;
    v10 = v3;
    v11 = 2048;
    v12 = v2;
    v13 = 2048;
    v14 = 4;
    _os_log_error_impl(&dword_1A4E5A000, v7, OS_LOG_TYPE_ERROR, "Overflow sizing array (%llu * %llu + %llu)", (uint8_t *)&v9, 0x20u);
  }

  return 0;
}

uint64_t _CSArrayCreateWithCapacity(uint64_t a1, int a2, _QWORD *a3)
{
  void *v5;
  uint64_t Common;
  _QWORD v8[4];
  int v9;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = ___CSArrayCreateWithCapacity_block_invoke;
  v8[3] = &__block_descriptor_36_e68__optional_CSStore2::Array_____c_Array___Store____Data_II__B_16__0_v8l;
  v9 = a2;
  v5 = (void *)MEMORY[0x1A85AA61C](v8);
  Common = _CSArrayCreateCommon(a1, v5, a3);

  return Common;
}

void sub_1A4E83424(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

Unit *_CSArrayDispose(Unit *result, CSStore2::Store *a2)
{
  uint64_t v3;
  uint64_t v4;

  if (result && (_DWORD)a2)
  {
    v3 = (uint64_t)result;
    if (performMutatingAssertions)
    {
      v4 = *(_QWORD *)&result->var3[328];
      if (v4)
        (***(void (****)(_QWORD))(v4 + 8))(*(_QWORD *)(v4 + 8));
    }
    return CSStore2::Array::Dispose((CSStore2::Array *)(v3 + 8), a2);
  }
  return result;
}

uint64_t _CSArrayGetCapacity(uint64_t a1, unsigned int a2)
{
  uint64_t result;
  uint64_t v5;
  _DWORD v6[6];
  char v7;

  result = 0;
  if (a1 && a2)
  {
    if (performConstantAssertions)
    {
      v5 = *(_QWORD *)(a1 + 336);
      if (v5)
        (*(void (**)(_QWORD))(**(_QWORD **)(v5 + 8) + 8))(*(_QWORD *)(v5 + 8));
    }
    CSStore2::Array::Get((CSStore2::Array *)v6, (CSStore2::Store *)(a1 + 8), a2);
    if (v7)
      return v6[4];
    else
      return 0;
  }
  return result;
}

uint64_t _CSArrayReserveCapacity(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t result;
  uint64_t v7;
  _BYTE v8[32];

  result = 0;
  if (a1 && a2)
  {
    if (performMutatingAssertions)
    {
      v7 = *(_QWORD *)(a1 + 336);
      if (v7)
        (***(void (****)(_QWORD))(v7 + 8))(*(_QWORD *)(v7 + 8));
    }
    CSStore2::Array::Get((CSStore2::Array *)v8, (CSStore2::Store *)(a1 + 8), a2);
    if (v8[24])
      return CSStore2::Array::reserveCapacity((CSStore2::Array *)v8, a3);
    else
      return 0;
  }
  return result;
}

uint64_t CSStore2::Array::reserveCapacity(CSStore2::Array *this, unsigned int a2)
{
  CSStore2::Array *v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  BOOL v7;
  CSStore2::Array *v8;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v3 = this;
  v18 = *MEMORY[0x1E0C80C00];
  v4 = **((_DWORD **)this + 1) & 0x1FFFFFFF;
  v5 = *((_DWORD *)this + 4);
  if (v4 >= v5)
    v6 = v5;
  else
    v6 = v4;
  v7 = __CFADD__((_DWORD)v6, a2);
  v8 = (CSStore2::Array *)(v6 + a2);
  if (!v7)
  {
    this = (CSStore2::Array *)CSStore2::Array::_setCapacity((unint64_t)this, v8, 0);
    if ((this & 1) != 0)
      return 1;
  }
  CSStore2::GetLog(this);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = *((unsigned int *)v3 + 4);
    v12 = 134218496;
    v13 = v11;
    v14 = 2048;
    v15 = v6;
    v16 = 2048;
    v17 = a2;
    _os_log_error_impl(&dword_1A4E5A000, v10, OS_LOG_TYPE_ERROR, "Unable to reserve array capacity! Current capacity was %llu, count was %llu, wanted %llu more", (uint8_t *)&v12, 0x20u);
  }

  return 0;
}

uint64_t CSStore2::Array::_setCapacity(unint64_t this, CSStore2::Array *a2, int a3)
{
  unint64_t v3;
  unint64_t v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t result;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v3 = (unint64_t)a2;
  v4 = this;
  v15 = *MEMORY[0x1E0C80C00];
  if (a2 >> 29)
  {
LABEL_10:
    CSStore2::GetLog((CSStore2 *)this);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(unsigned int *)(v4 + 16);
      v11 = 134218240;
      v12 = v10;
      v13 = 2048;
      v14 = v3;
      _os_log_error_impl(&dword_1A4E5A000, v9, OS_LOG_TYPE_ERROR, "Unable to set array capacity! Current capacity was %llu, wanted %llu", (uint8_t *)&v11, 0x16u);
    }

    return 0;
  }
  v5 = *(_DWORD *)(this + 16);
  if (v5 < a2)
  {
    v6 = v5 + 4;
    if (v6 <= a2)
      v3 = a2;
    else
      v3 = v6;
    v7 = **(_DWORD **)(this + 8);
    goto LABEL_7;
  }
  result = 1;
  if (a3 && v5 > a2)
  {
    v7 = **(_DWORD **)(v4 + 8);
    if ((v7 & 0x1FFFFFFF) < v5)
      v5 = v7 & 0x1FFFFFFF;
    if (v5 <= a2)
    {
LABEL_7:
      this = CSStore2::Array::_GetDataSizeWithCapacity((CSStore2::Array *)v3, (v7 >> 29) & 1);
      if (HIDWORD(this))
      {
        this = CSStore2::Array::_reallocate((CSStore2::Array *)v4, (CSStore2::VM *)this);
        if ((_DWORD)this)
        {
          *(_DWORD *)(v4 + 16) = v3;
          return 1;
        }
      }
      goto LABEL_10;
    }
  }
  return result;
}

uint64_t CSStore2::Array::_reallocate(CSStore2::Array *this, CSStore2::VM *a2)
{
  CSStore2 **v4;
  const CSStore2::Table *v5;
  uint64_t result;
  Unit *v7;

  v4 = *(CSStore2 ***)this;
  v5 = v4[33];
  if (!v5)
  {
    result = (uint64_t)CSStore2::Store::getTable(v4, CFSTR("<array>"));
    if (!result)
      return result;
    v5 = (const CSStore2::Table *)result;
    v4 = *(CSStore2 ***)this;
  }
  result = (uint64_t)CSStore2::Store::getUnit(v4, v5, *((_DWORD *)this + 5));
  if (result)
  {
    v7 = CSStore2::Store::reallocateUnit(*(CSStore2 ***)this, v5, (Unit *)result, a2);
    *((_QWORD *)this + 1) = v7->var3;
    *((_DWORD *)this + 5) = 4 * *(_DWORD *)v7;
    return 1;
  }
  return result;
}

void _CSArraySetValueAtIndex(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4)
{
  uint64_t v8;
  CSStore2 *v9;
  unsigned int v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  CSStore2 *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  char v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a1 && a2)
  {
    if (performMutatingAssertions)
    {
      v8 = *(_QWORD *)(a1 + 336);
      if (v8)
        (***(void (****)(_QWORD))(v8 + 8))(*(_QWORD *)(v8 + 8));
    }
    CSStore2::Array::Get((CSStore2::Array *)&v17, (CSStore2::Store *)(a1 + 8), a2);
    if (v20)
    {
      v10 = *(_DWORD *)v18 & 0x1FFFFFFF;
      if (v10 >= v19)
        v11 = v19;
      else
        v11 = v10;
      if (v11 > a3)
      {
        if ((*(_DWORD *)v18 & 0x20000000) == 0 || HIWORD(a4))
        {
          v15 = (CSStore2 *)CSStore2::Array::_unpack((CSStore2::Array *)&v17);
          if (!(_DWORD)v15)
            goto LABEL_21;
          CSStore2::GetLog(v15);
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            v13 = "Unpacking array (or already unpacked) for value replacement";
            goto LABEL_26;
          }
        }
        else
        {
          CSStore2::GetLog(v9);
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            v13 = "Keeping array packed for value replacement";
LABEL_26:
            _os_log_debug_impl(&dword_1A4E5A000, v12, OS_LOG_TYPE_DEBUG, v13, buf, 2u);
          }
        }

LABEL_21:
        v16 = v18 + 4;
        if ((*(_BYTE *)(v18 + 3) & 0x20) != 0)
          *(_WORD *)(v16 + 2 * a3) = a4;
        else
          *(_DWORD *)(v16 + 4 * a3) = a4;
        return;
      }
      CSStore2::GetLog(v9);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        v22 = a3;
        v23 = 2048;
        v24 = v11;
        _os_log_error_impl(&dword_1A4E5A000, v14, OS_LOG_TYPE_ERROR, "Out-of-bounds array write: %llu >= %llu", buf, 0x16u);
      }

    }
  }
}

uint64_t CSStore2::Array::_unpack(CSStore2::Array *this)
{
  uint64_t v1;
  unint64_t DataSizeWithCapacity;
  uint64_t v4;
  std::vector<unsigned int>::pointer begin;
  _DWORD *v6;
  int64_t v7;
  int v8;
  _WORD *v9;
  int64_t v10;
  unsigned int v11;
  std::vector<unsigned int> __p;

  if ((*(_BYTE *)(*((_QWORD *)this + 1) + 3) & 0x20) != 0)
  {
    CSStore2::Array::getAllValues(&__p, (uint64_t)this);
    DataSizeWithCapacity = CSStore2::Array::_GetDataSizeWithCapacity((CSStore2::Array *)*((unsigned int *)this + 4), 0);
    v1 = 0;
    if (!HIDWORD(DataSizeWithCapacity))
      goto LABEL_15;
    if (!CSStore2::Array::_reallocate(this, (CSStore2::VM *)DataSizeWithCapacity))
    {
      v1 = 0;
      goto LABEL_15;
    }
    **((_DWORD **)this + 1) &= ~0x20000000u;
    v4 = *((_QWORD *)this + 1);
    begin = __p.__begin_;
    if ((*(_BYTE *)(v4 + 3) & 0x20) != 0)
    {
      if (__p.__end_ != __p.__begin_)
      {
        v9 = (_WORD *)(v4 + 4);
        v10 = __p.__end_ - __p.__begin_;
        do
        {
          v11 = *begin++;
          *v9++ = v11;
          --v10;
        }
        while (v10);
        goto LABEL_14;
      }
    }
    else if (__p.__end_ != __p.__begin_)
    {
      v6 = (_DWORD *)(v4 + 4);
      v7 = __p.__end_ - __p.__begin_;
      do
      {
        v8 = *begin++;
        *v6++ = v8;
        --v7;
      }
      while (v7);
LABEL_14:
      v1 = 1;
LABEL_15:
      begin = __p.__begin_;
      if (!__p.__begin_)
        return v1;
LABEL_16:
      __p.__end_ = begin;
      operator delete(begin);
      return v1;
    }
    v1 = 1;
    if (!__p.__begin_)
      return v1;
    goto LABEL_16;
  }
  return 1;
}

void sub_1A4E83B70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void _CSArrayInsertValueAtIndex(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4)
{
  uint64_t v7;
  _BYTE v8[36];
  unsigned int v9;

  v9 = a4;
  if (a1 && a2)
  {
    if (performMutatingAssertions)
    {
      v7 = *(_QWORD *)(a1 + 336);
      if (v7)
        (***(void (****)(_QWORD))(v7 + 8))(*(_QWORD *)(v7 + 8));
    }
    CSStore2::Array::Get((CSStore2::Array *)v8, (CSStore2::Store *)(a1 + 8), a2);
    if (v8[24])
      CSStore2::Array::insertValueAtIndex((CSStore2::Array *)v8, a3, &v9);
  }
}

void CSStore2::Array::insertValueAtIndex(CSStore2::Array *this, unsigned int a2, const unsigned int *a3)
{
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  CSStore2 *v13;
  NSObject *v14;
  const char *v15;
  CSStore2 *v16;
  int v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = **((_DWORD **)this + 1) & 0x1FFFFFFF;
  v5 = *((_DWORD *)this + 4);
  if (v4 >= v5)
    v6 = v5;
  else
    v6 = v4;
  if (v6 < a2)
  {
    CSStore2::GetLog(this);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v21 = 134218240;
      v22 = a2;
      v23 = 2048;
      v24 = v6;
      v8 = "Out-of-bounds array insertion: %llu > %llu";
      v9 = v7;
      v10 = 22;
LABEL_28:
      _os_log_error_impl(&dword_1A4E5A000, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v21, v10);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  v13 = (CSStore2 *)CSStore2::Array::reserveCapacity(this, 1u);
  if ((v13 & 1) == 0)
  {
    CSStore2::GetLog(v13);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v21 = 134217984;
      v22 = v6;
      v8 = "Failed to reserve array capacity when preparing for new value (old count = %llu)";
      v9 = v7;
      v10 = 12;
      goto LABEL_28;
    }
LABEL_13:

    return;
  }
  if ((*(_BYTE *)(*((_QWORD *)this + 1) + 3) & 0x20) != 0 && !HIWORD(*a3))
  {
    CSStore2::GetLog(v13);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v21) = 0;
      v15 = "Array was packed and can remain packed with new values";
LABEL_30:
      _os_log_debug_impl(&dword_1A4E5A000, v14, OS_LOG_TYPE_DEBUG, v15, (uint8_t *)&v21, 2u);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  v16 = (CSStore2 *)CSStore2::Array::_unpack(this);
  v17 = (int)v16;
  CSStore2::GetLog(v16);
  v18 = objc_claimAutoreleasedReturnValue();
  v14 = v18;
  if (v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v21) = 0;
      v15 = "Array was unpacked or needed to be unpacked to take new values";
      goto LABEL_30;
    }
LABEL_16:

    v19 = *((_QWORD *)this + 1);
    v20 = v19 + 4;
    if ((*(_BYTE *)(v19 + 3) & 0x20) != 0)
    {
      if (v6 > a2)
        memmove((void *)(v20 + 2 * a2 + 2), (const void *)(v20 + 2 * a2), 2 * v6 - 2 * a2);
      *(_WORD *)(v20 + 2 * a2) = *(_WORD *)a3;
    }
    else
    {
      if (v6 > a2)
        memmove((void *)(v20 + 4 * a2 + 4), (const void *)(v20 + 4 * a2), 4 * v6 - 4 * a2);
      *(_DWORD *)(v20 + 4 * a2) = *a3;
    }
    **((_DWORD **)this + 1) = **((_DWORD **)this + 1) & 0xE0000000 | (v6 + 1) & 0x1FFFFFFF;
    return;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v21 = 134217984;
    v22 = v6;
    _os_log_error_impl(&dword_1A4E5A000, v14, OS_LOG_TYPE_ERROR, "Failed to unpack array when preparing for new value (old count = %llu)", (uint8_t *)&v21, 0xCu);
  }

}

void _CSArrayAppendValue(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t v5;
  unsigned int v6;
  _BYTE v7[8];
  _DWORD *v8;
  unsigned int v9;
  char v10;
  unsigned int v11;

  v11 = a3;
  if (a1 && a2)
  {
    if (performMutatingAssertions)
    {
      v5 = *(_QWORD *)(a1 + 336);
      if (v5)
        (***(void (****)(_QWORD))(v5 + 8))(*(_QWORD *)(v5 + 8));
    }
    CSStore2::Array::Get((CSStore2::Array *)v7, (CSStore2::Store *)(a1 + 8), a2);
    if (v10)
    {
      if ((*v8 & 0x1FFFFFFFu) >= v9)
        v6 = v9;
      else
        v6 = *v8 & 0x1FFFFFFF;
      CSStore2::Array::insertValueAtIndex((CSStore2::Array *)v7, v6, &v11);
    }
  }
}

void _CSArrayRemoveValueAtIndex(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t v6;
  CSStore2 *v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  NSObject *v14;
  _DWORD *v15;
  char *v16;
  _BYTE *v17;
  _BYTE *v18;
  uint64_t v19;
  unsigned int *v20;
  unsigned int v21;
  char v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a1 && a2)
  {
    if (performMutatingAssertions)
    {
      v6 = *(_QWORD *)(a1 + 336);
      if (v6)
        (***(void (****)(_QWORD))(v6 + 8))(*(_QWORD *)(v6 + 8));
    }
    CSStore2::Array::Get((CSStore2::Array *)&v19, (CSStore2::Store *)(a1 + 8), a2);
    if (v22)
    {
      v8 = v20;
      v9 = *v20;
      v10 = *v20 & 0x1FFFFFFF;
      if (v10 >= v21)
        v11 = v21;
      else
        v11 = v10;
      if (v11 <= a3)
      {
        CSStore2::GetLog(v7);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          v24 = a3;
          v25 = 2048;
          v26 = v11;
          _os_log_error_impl(&dword_1A4E5A000, v14, OS_LOG_TYPE_ERROR, "Out-of-bounds array erasure: %llu >= %llu", buf, 0x16u);
        }

      }
      else
      {
        v12 = v11 - 1;
        if ((_DWORD)v11 == 1)
        {
          v13 = v9 & 0xE0000000;
        }
        else
        {
          if (v12 > a3)
          {
            v15 = v20 + 1;
            if ((v9 & 0x20000000) != 0)
            {
              v16 = (char *)v15 + 2 * a3;
              v17 = v16 + 2;
              v18 = (char *)v15 + 2 * v11;
            }
            else
            {
              v16 = (char *)&v15[a3];
              v17 = v16 + 4;
              v18 = &v15[v11];
            }
            if (v18 != v17)
              memmove(v16, v17, v18 - v17);
          }
          v13 = *v8 & 0xE0000000 | v12;
        }
        *v8 = v13;
        CSStore2::Array::_shrinkCapacityIfNeeded((unint64_t)&v19);
      }
    }
  }
}

unint64_t CSStore2::Array::_shrinkCapacityIfNeeded(unint64_t this)
{
  unsigned int v1;
  unsigned int v2;
  unint64_t v3;

  v1 = *(_DWORD *)(this + 16);
  v2 = **(_DWORD **)(this + 8) & 0x1FFFFFFF;
  if (v2 >= v1)
    v3 = v1;
  else
    v3 = v2;
  if (v1 > v2 && v1 - v3 >= 5)
    return CSStore2::Array::_setCapacity(this, (CSStore2::Array *)v3, 1);
  return this;
}

void _CSArrayRemoveAllValues(uint64_t a1, unsigned int a2)
{
  uint64_t v4;
  uint64_t v5;
  _DWORD *v6;
  char v7;

  if (a1 && a2)
  {
    if (performMutatingAssertions)
    {
      v4 = *(_QWORD *)(a1 + 336);
      if (v4)
        (***(void (****)(_QWORD))(v4 + 8))(*(_QWORD *)(v4 + 8));
    }
    CSStore2::Array::Get((CSStore2::Array *)&v5, (CSStore2::Store *)(a1 + 8), a2);
    if (v7)
    {
      *v6 &= 0xE0000000;
      CSStore2::Array::_shrinkCapacityIfNeeded((unint64_t)&v5);
    }
  }
}

id CSStore2::_CopyNameOfTypeImpl(std::string *this)
{
  std::string *v1;
  uint64_t v2;
  std::string::size_type v3;
  std::string::size_type size;
  std::string *v5;
  std::string::size_type v6;
  unsigned __int8 *v7;
  std::string *v8;
  std::string *v9;
  std::string *v10;
  unsigned __int8 *v11;
  int v12;
  int v13;
  std::string::size_type v14;
  char *v15;
  int64_t v16;
  std::string *v17;
  void **v18;
  int64_t v19;
  char *v20;
  int v21;
  std::string *v22;
  int64_t v23;
  char *v24;
  char *v25;
  int64_t v26;
  uint64_t v28;
  std::string *v29;
  uint64_t v30;
  std::string::size_type v31;
  std::string *v32;
  unsigned int v33;
  int v35;
  std::string *v36;
  unsigned int v37;
  int v38;
  void *v39;
  void *__p[2];
  unsigned __int8 v42;

  v1 = this;
  v2 = HIBYTE(this->__r_.__value_.__r.__words[2]);
  v3 = this->__r_.__value_.__r.__words[0];
  size = this->__r_.__value_.__l.__size_;
  if ((v2 & 0x80u) == 0)
    v5 = this;
  else
    v5 = (std::string *)this->__r_.__value_.__r.__words[0];
  if ((v2 & 0x80u) == 0)
    v6 = HIBYTE(this->__r_.__value_.__r.__words[2]);
  else
    v6 = this->__r_.__value_.__l.__size_;
  if (v6)
  {
    v7 = (unsigned __int8 *)v5 + v6;
    v8 = v5;
    v9 = (std::string *)v7;
    do
    {
      v10 = v8;
      v11 = (unsigned __int8 *)v8;
      while (1)
      {
        v12 = *v11++;
        if (v12 == 93)
          break;
        v10 = (std::string *)v11;
        if (v11 == v7)
        {
          v10 = v9;
          goto LABEL_14;
        }
      }
      v8 = (std::string *)((char *)&v10->__r_.__value_.__l.__data_ + 1);
      v9 = v10;
    }
    while (v11 != v7);
LABEL_14:
    if (v10 != (std::string *)v7 && (char *)v10 - (char *)v5 != -1)
    {
      v13 = (char)v2;
      v14 = v3 + size;
      v15 = (char *)v1 + v2;
      if (v13 < 0)
        v15 = (char *)v14;
      std::string::erase(v1, (char *)v10 - (char *)v5, v15 - (char *)v10);
    }
  }
  std::string::basic_string[abi:nn180100]<0>(__p, "[T = ");
  v16 = HIBYTE(v1->__r_.__value_.__r.__words[2]);
  if ((v16 & 0x80u) == 0)
    v17 = v1;
  else
    v17 = (std::string *)v1->__r_.__value_.__r.__words[0];
  if ((v42 & 0x80u) == 0)
    v18 = __p;
  else
    v18 = (void **)__p[0];
  if ((v42 & 0x80u) == 0)
    v19 = v42;
  else
    v19 = (int64_t)__p[1];
  if (v19)
  {
    if ((v16 & 0x80u) != 0)
      v16 = v1->__r_.__value_.__l.__size_;
    if (v16 >= v19)
    {
      v20 = (char *)v17 + v16;
      v21 = *(char *)v18;
      v22 = v17;
      while (1)
      {
        v23 = v16 - v19;
        if (v23 == -1)
          break;
        v24 = (char *)memchr(v22, v21, v23 + 1);
        if (!v24)
          break;
        v25 = v24;
        if (!memcmp(v24, v18, v19))
        {
          v26 = v25 - (char *)v17;
          if (v25 == v20 || v26 == -1)
            goto LABEL_49;
          goto LABEL_39;
        }
        v22 = (std::string *)(v25 + 1);
        v16 = v20 - (v25 + 1);
        if (v16 < v19)
          goto LABEL_49;
      }
    }
  }
  else
  {
    v26 = 0;
LABEL_39:
    std::string::erase(v1, 0, v26 + v19);
  }
  while (1)
  {
LABEL_49:
    v30 = MEMORY[0x1E0C80978];
    if (SHIBYTE(v1->__r_.__value_.__r.__words[2]) < 0)
    {
      v31 = v1->__r_.__value_.__l.__size_;
      if (!v31)
        goto LABEL_58;
      v32 = (std::string *)v1->__r_.__value_.__r.__words[0];
    }
    else
    {
      v31 = HIBYTE(v1->__r_.__value_.__r.__words[2]);
      if (!*((_BYTE *)&v1->__r_.__value_.__s + 23))
        goto LABEL_58;
      v32 = v1;
    }
    v33 = v32->__r_.__value_.__s.__data_[v31 - 1];
    if (!((v33 & 0x80000000) != 0
         ? __maskrune(v33, 0x4000uLL)
         : *(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v33 + 60) & 0x4000))
      break;
    if (SHIBYTE(v1->__r_.__value_.__r.__words[2]) < 0)
    {
      v29 = (std::string *)v1->__r_.__value_.__r.__words[0];
      v28 = v1->__r_.__value_.__l.__size_ - 1;
      v1->__r_.__value_.__l.__size_ = v28;
    }
    else
    {
      v28 = HIBYTE(v1->__r_.__value_.__r.__words[2]) - 1;
      *((_BYTE *)&v1->__r_.__value_.__s + 23) = v28 & 0x7F;
      v29 = v1;
    }
    v29->__r_.__value_.__s.__data_[v28] = 0;
  }
  while (1)
  {
LABEL_58:
    v35 = SHIBYTE(v1->__r_.__value_.__r.__words[2]);
    if (v35 < 0)
    {
      v36 = (std::string *)v1->__r_.__value_.__r.__words[0];
      if (!v1->__r_.__value_.__l.__size_)
        goto LABEL_68;
    }
    else
    {
      v36 = v1;
      if (!*((_BYTE *)&v1->__r_.__value_.__s + 23))
        goto LABEL_70;
    }
    v37 = v36->__r_.__value_.__s.__data_[0];
    if ((v37 & 0x80000000) != 0)
      break;
    if ((*(_DWORD *)(v30 + 4 * v37 + 60) & 0x4000) == 0)
      goto LABEL_67;
LABEL_66:
    std::string::erase(v1, 0, 1uLL);
  }
  v38 = __maskrune(v37, 0x4000uLL);
  LOBYTE(v35) = *((_BYTE *)&v1->__r_.__value_.__s + 23);
  if (v38)
    goto LABEL_66;
LABEL_67:
  v36 = (std::string *)v1->__r_.__value_.__r.__words[0];
LABEL_68:
  if ((v35 & 0x80u) != 0)
    v1 = v36;
LABEL_70:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if ((char)v42 < 0)
    operator delete(__p[0]);
  return v39;
}

void sub_1A4E8446C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

id CSStore2::NameOfSymbol(CSStore2 *this, const void *a2)
{
  unint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  int8x8_t v8;
  uint8x8_t v9;
  unint64_t v10;
  uint64_t ***v11;
  uint64_t **i;
  unint64_t v13;
  const char *dli_sname;
  char *v15;
  char *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  uint8x8_t v22;
  uint64_t ***v23;
  uint64_t **j;
  unint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  float v28;
  float v29;
  _BOOL8 v30;
  unint64_t v31;
  unint64_t v32;
  int8x8_t prime;
  void *v34;
  _QWORD *v35;
  uint64_t v36;
  _QWORD *v37;
  unint64_t v38;
  uint8x8_t v39;
  unint64_t v40;
  uint8x8_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  _QWORD *v45;
  unint64_t v46;
  _QWORD *v47;
  _QWORD *v48;
  unint64_t v49;
  id v50;
  uint64_t *v52;
  _QWORD *v53;
  int status;
  Dl_info v55;

  os_unfair_lock_lock((os_unfair_lock_t)&CSStore2::NameOfSymbol(void const*)::lock);
  v4 = CSStore2::NameOfSymbol(void const*)::functionNames;
  if (!CSStore2::NameOfSymbol(void const*)::functionNames)
  {
    v4 = operator new();
    *(_OWORD *)v4 = 0u;
    *(_OWORD *)(v4 + 16) = 0u;
    *(_DWORD *)(v4 + 32) = 1065353216;
    CSStore2::NameOfSymbol(void const*)::functionNames = v4;
  }
  v5 = 0x9DDFEA08EB382D69 * (((8 * (_DWORD)this) + 8) ^ ((unint64_t)this >> 32));
  v6 = 0x9DDFEA08EB382D69 * (((unint64_t)this >> 32) ^ (v5 >> 47) ^ v5);
  v7 = 0x9DDFEA08EB382D69 * (v6 ^ (v6 >> 47));
  v8 = *(int8x8_t *)(v4 + 8);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8(v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      v10 = v7;
      if (v7 >= *(_QWORD *)&v8)
        v10 = v7 % *(_QWORD *)&v8;
    }
    else
    {
      v10 = v7 & (*(_QWORD *)&v8 - 1);
    }
    v11 = *(uint64_t ****)(*(_QWORD *)v4 + 8 * v10);
    if (v11)
    {
      for (i = *v11; i; i = (uint64_t **)*i)
      {
        v13 = (unint64_t)i[1];
        if (v13 == v7)
        {
          if (i[2] == (uint64_t *)this)
          {
            v52 = i[3];
            v19 = v52;
            if (!v52)
              break;
            goto LABEL_28;
          }
        }
        else
        {
          if (v9.u32[0] > 1uLL)
          {
            if (v13 >= *(_QWORD *)&v8)
              v13 %= *(_QWORD *)&v8;
          }
          else
          {
            v13 &= *(_QWORD *)&v8 - 1;
          }
          if (v13 != v10)
            break;
        }
      }
    }
  }
  memset(&v55, 0, sizeof(v55));
  if (dladdr(this, &v55))
  {
    dli_sname = v55.dli_sname;
    if (v55.dli_sname)
    {
      status = 0;
      v15 = __cxa_demangle(v55.dli_sname, 0, 0, &status);
      v16 = v15;
      if (v15)
      {
        if (!strncmp(v15, "invocation function for block in ", 0x21uLL))
        {
          v43 = (void *)objc_msgSend(CFSTR("^() in "), "mutableCopy");
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v16 + 33);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "appendString:", v44);

          v19 = (void *)objc_msgSend(v43, "copy");
          free(v16);

          goto LABEL_28;
        }
        v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v16, strlen(v16), 4, 1);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", dli_sname);
        v17 = objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v18 = objc_alloc(MEMORY[0x1E0CB3940]);
      v17 = objc_msgSend(v18, "initWithFormat:", CFSTR("0x%llx"), v55.dli_saddr);
    }
  }
  else
  {
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("0x%llx?"), this);
  }
  v19 = (void *)v17;
LABEL_28:
  v20 = CSStore2::NameOfSymbol(void const*)::functionNames;
  v21 = *(_QWORD *)(CSStore2::NameOfSymbol(void const*)::functionNames + 8);
  if (v21)
  {
    v22 = (uint8x8_t)vcnt_s8((int8x8_t)v21);
    v22.i16[0] = vaddlv_u8(v22);
    if (v22.u32[0] > 1uLL)
    {
      v2 = v7;
      if (v7 >= v21)
        v2 = v7 % v21;
    }
    else
    {
      v2 = v7 & (v21 - 1);
    }
    v23 = *(uint64_t ****)(*(_QWORD *)CSStore2::NameOfSymbol(void const*)::functionNames + 8 * v2);
    if (v23)
    {
      for (j = *v23; j; j = (uint64_t **)*j)
      {
        v25 = (unint64_t)j[1];
        if (v25 == v7)
        {
          if (j[2] == (uint64_t *)this)
            goto LABEL_102;
        }
        else
        {
          if (v22.u32[0] > 1uLL)
          {
            if (v25 >= v21)
              v25 %= v21;
          }
          else
          {
            v25 &= v21 - 1;
          }
          if (v25 != v2)
            break;
        }
      }
    }
  }
  v26 = operator new(0x20uLL);
  v27 = (_QWORD *)(v20 + 16);
  *v26 = 0;
  v26[1] = v7;
  v26[2] = this;
  v26[3] = v19;
  v28 = (float)(unint64_t)(*(_QWORD *)(v20 + 24) + 1);
  v29 = *(float *)(v20 + 32);
  if (!v21 || (float)(v29 * (float)v21) < v28)
  {
    v30 = 1;
    if (v21 >= 3)
      v30 = (v21 & (v21 - 1)) != 0;
    v31 = v30 | (2 * v21);
    v32 = vcvtps_u32_f32(v28 / v29);
    if (v31 <= v32)
      prime = (int8x8_t)v32;
    else
      prime = (int8x8_t)v31;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
    }
    v21 = *(_QWORD *)(v20 + 8);
    if (*(_QWORD *)&prime > v21)
      goto LABEL_57;
    if (*(_QWORD *)&prime < v21)
    {
      v40 = vcvtps_u32_f32((float)*(unint64_t *)(v20 + 24) / *(float *)(v20 + 32));
      if (v21 < 3 || (v41 = (uint8x8_t)vcnt_s8((int8x8_t)v21), v41.i16[0] = vaddlv_u8(v41), v41.u32[0] > 1uLL))
      {
        v40 = std::__next_prime(v40);
      }
      else
      {
        v42 = 1 << -(char)__clz(v40 - 1);
        if (v40 >= 2)
          v40 = v42;
      }
      if (*(_QWORD *)&prime <= v40)
        prime = (int8x8_t)v40;
      if (*(_QWORD *)&prime >= v21)
      {
        v21 = *(_QWORD *)(v20 + 8);
      }
      else
      {
        if (prime)
        {
LABEL_57:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:nn180100]();
          v34 = operator new(8 * *(_QWORD *)&prime);
          v35 = *(_QWORD **)v20;
          *(_QWORD *)v20 = v34;
          if (v35)
            operator delete(v35);
          v36 = 0;
          *(int8x8_t *)(v20 + 8) = prime;
          do
            *(_QWORD *)(*(_QWORD *)v20 + 8 * v36++) = 0;
          while (*(_QWORD *)&prime != v36);
          v37 = (_QWORD *)*v27;
          if (*v27)
          {
            v38 = v37[1];
            v39 = (uint8x8_t)vcnt_s8(prime);
            v39.i16[0] = vaddlv_u8(v39);
            if (v39.u32[0] > 1uLL)
            {
              if (v38 >= *(_QWORD *)&prime)
                v38 %= *(_QWORD *)&prime;
            }
            else
            {
              v38 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*(_QWORD *)v20 + 8 * v38) = v27;
            v45 = (_QWORD *)*v37;
            if (*v37)
            {
              do
              {
                v46 = v45[1];
                if (v39.u32[0] > 1uLL)
                {
                  if (v46 >= *(_QWORD *)&prime)
                    v46 %= *(_QWORD *)&prime;
                }
                else
                {
                  v46 &= *(_QWORD *)&prime - 1;
                }
                if (v46 != v38)
                {
                  if (!*(_QWORD *)(*(_QWORD *)v20 + 8 * v46))
                  {
                    *(_QWORD *)(*(_QWORD *)v20 + 8 * v46) = v37;
                    goto LABEL_83;
                  }
                  *v37 = *v45;
                  *v45 = **(_QWORD **)(*(_QWORD *)v20 + 8 * v46);
                  **(_QWORD **)(*(_QWORD *)v20 + 8 * v46) = v45;
                  v45 = v37;
                }
                v46 = v38;
LABEL_83:
                v37 = v45;
                v45 = (_QWORD *)*v45;
                v38 = v46;
              }
              while (v45);
            }
          }
          v21 = (unint64_t)prime;
          goto LABEL_87;
        }
        v53 = *(_QWORD **)v20;
        *(_QWORD *)v20 = 0;
        if (v53)
          operator delete(v53);
        v21 = 0;
        *(_QWORD *)(v20 + 8) = 0;
      }
    }
LABEL_87:
    if ((v21 & (v21 - 1)) != 0)
    {
      if (v7 >= v21)
        v2 = v7 % v21;
      else
        v2 = v7;
    }
    else
    {
      v2 = (v21 - 1) & v7;
    }
  }
  v47 = *(_QWORD **)v20;
  v48 = *(_QWORD **)(*(_QWORD *)v20 + 8 * v2);
  if (v48)
  {
    *v26 = *v48;
LABEL_100:
    *v48 = v26;
    goto LABEL_101;
  }
  *v26 = *v27;
  *v27 = v26;
  v47[v2] = v27;
  if (*v26)
  {
    v49 = *(_QWORD *)(*v26 + 8);
    if ((v21 & (v21 - 1)) != 0)
    {
      if (v49 >= v21)
        v49 %= v21;
    }
    else
    {
      v49 &= v21 - 1;
    }
    v48 = (_QWORD *)(*(_QWORD *)v20 + 8 * v49);
    goto LABEL_100;
  }
LABEL_101:
  ++*(_QWORD *)(v20 + 24);
LABEL_102:
  os_unfair_lock_unlock((os_unfair_lock_t)&CSStore2::NameOfSymbol(void const*)::lock);
  v50 = v19;

  return v50;
}

void sub_1A4E84B04(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x1E0C98050](bundle, key, value, tableName);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x1E0C980E8](bundleID);
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1E0C98180](bundle, key);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

Boolean CFFileSecurityGetMode(CFFileSecurityRef fileSec, mode_t *mode)
{
  return MEMORY[0x1E0C986E8](fileSec, mode);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1E0C98F78](alloc, theString);
}

CFStringRef CFStringCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FC8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation, contentsDeallocator);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x1E0C990C0](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1E0C990C8](theString);
}

void NSCopyMemoryPages(const void *source, void *dest, NSUInteger bytes)
{
  MEMORY[0x1E0CB28D0](source, dest, bytes);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB2C58](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

NSUInteger NSPageSize(void)
{
  return MEMORY[0x1E0CB2FE8]();
}

NSUInteger NSRoundDownToMultipleOfPageSize(NSUInteger bytes)
{
  return MEMORY[0x1E0CB3168](bytes);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB3400](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1E0C9A0D0]();
}

uint64_t _CFGetEUID()
{
  return MEMORY[0x1E0C9A1A0]();
}

uint64_t _NSIsNSNumber()
{
  return MEMORY[0x1E0C9A890]();
}

uint64_t _NSIsNSString()
{
  return MEMORY[0x1E0C9A8B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x1E0DE41F0]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1E0DE4248](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1E0DE4258](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4408](this, __pos, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x1E0DE4480](this, __n, __c);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1E0DE46B0]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1E0DE46B8]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1E0DE46C8]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1E0DE46D0]();
}

{
  return MEMORY[0x1E0DE4700]();
}

{
  return MEMORY[0x1E0DE4708]();
}

{
  return MEMORY[0x1E0DE4718]();
}

{
  return MEMORY[0x1E0DE4730]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1E0DE47E0]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1E0DE47E8]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE48F0](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE4900](this);
}

uint64_t std::__sort<std::__less<unsigned long,unsigned long> &,unsigned long *>()
{
  return MEMORY[0x1E0DE4B10]();
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x1E0DE4B98](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x1E0DE4C68](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x1E0DE4C80](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1E0DE4D28]();
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete(void *__p)
{
  off_1E4E20B68(__p);
}

uint64_t operator delete()
{
  return off_1E4E20B70();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E4E20B78(__sz);
}

uint64_t operator new()
{
  return off_1E4E20B80();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

char *__cxa_demangle(const char *lpmangled, char *lpout, size_t *lpoutlen, int *lpstatus)
{
  return (char *)MEMORY[0x1E0DE5090](lpmangled, lpout, lpoutlen, lpstatus);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x1E0DE92B0](crc, buf, *(_QWORD *)&len);
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
  MEMORY[0x1E0C82BD8](iterations, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_assert_queue_barrier(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF0](queue);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C48](queue, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CB0](buffer, size, queue, destructor);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x1E0C83028](a1, a2);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

int dup(int a1)
{
  return MEMORY[0x1E0C83078](*(_QWORD *)&a1);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x1E0C83318](*(_QWORD *)&a1, a2);
}

int feof(FILE *a1)
{
  return MEMORY[0x1E0C83340](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1E0C83348](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1E0C83370](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1E0C833B0](a1);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1E0C83490](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return MEMORY[0x1E0C83538](__stream, a2, *(_QWORD *)&__whence);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

off_t ftello(FILE *__stream)
{
  return MEMORY[0x1E0C83588](__stream);
}

FILE *__cdecl funopen(const void *a1, int (__cdecl *a2)(void *, char *, int), int (__cdecl *a3)(void *, const char *, int), fpos_t (__cdecl *a4)(void *, fpos_t, int), int (__cdecl *a5)(void *))
{
  return (FILE *)MEMORY[0x1E0C835C8](a1, a2, a3, a4, a5);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

int gzclose(gzFile file)
{
  return MEMORY[0x1E0DE9310](file);
}

gzFile gzdopen(int fd, const char *mode)
{
  return (gzFile)MEMORY[0x1E0DE9320](*(_QWORD *)&fd, mode);
}

const char *__cdecl gzerror(gzFile file, int *errnum)
{
  return (const char *)MEMORY[0x1E0DE9338](file, errnum);
}

int gzread(gzFile file, voidp buf, unsigned int len)
{
  return MEMORY[0x1E0DE9370](file, buf, *(_QWORD *)&len);
}

int gzwrite(gzFile file, voidpc buf, unsigned int len)
{
  return MEMORY[0x1E0DE9390](file, buf, *(_QWORD *)&len);
}

int isatty(int a1)
{
  return MEMORY[0x1E0C839A8](*(_QWORD *)&a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x1E0C840B8](__b, __pattern16, __len);
}

int mkstemp(char *a1)
{
  return MEMORY[0x1E0C841A0](a1);
}

int mkstemp_dprotected_np(char *path, int dpclass, int dpflags)
{
  return MEMORY[0x1E0C841A8](path, *(_QWORD *)&dpclass, *(_QWORD *)&dpflags);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1E0C84488](a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
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

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84988](lock);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1E0C84ED8]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85498](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85570](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1E0C855C0](__s1, __n);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85658](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85698](__str, __endptr, *(_QWORD *)&__base);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

void uuid_generate(uuid_t out)
{
  MEMORY[0x1E0C85A18](out);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C85A40](uu, out);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x1E0C85A80](*(_QWORD *)&target_task, address, size, *(_QWORD *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1E0C85A98](*(_QWORD *)&target_task, address, size);
}

kern_return_t vm_protect(vm_map_t target_task, vm_address_t address, vm_size_t size, BOOLean_t set_maximum, vm_prot_t new_protection)
{
  return MEMORY[0x1E0C85AE0](*(_QWORD *)&target_task, address, size, *(_QWORD *)&set_maximum, *(_QWORD *)&new_protection);
}

xpc_object_t xpc_data_create_with_dispatch_data(dispatch_data_t ddata)
{
  return (xpc_object_t)MEMORY[0x1E0C86188](ddata);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1E0C86198](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1E0C861A8](xdata);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

