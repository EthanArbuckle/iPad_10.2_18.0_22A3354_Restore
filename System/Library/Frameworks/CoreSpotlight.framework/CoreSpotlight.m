void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void *__Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
  void *result;

  result = _Block_copy(*(const void **)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

id logForCSLogCategoryDefault()
{
  if (logForCSLogCategoryDefault_onceToken != -1)
    dispatch_once(&logForCSLogCategoryDefault_onceToken, &__block_literal_global_1);
  return (id)logForCSLogCategoryDefault_log;
}

id CS_simplifyItemArray(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if ((unint64_t)objc_msgSend(v1, "count") >= 2)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v3 = objc_msgSend(v1, "count");
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(v1, "reverseObjectEnumerator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v30 = 0;
      v8 = *(_QWORD *)v32;
      v25 = v2;
      v26 = *(_QWORD *)v32;
      v27 = v4;
      do
      {
        v9 = 0;
        v28 = v6;
        do
        {
          if (*(_QWORD *)v32 != v8)
            objc_enumerationMutation(v4);
          --v3;
          v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v9);
          objc_msgSend(v10, "uniqueIdentifier", v25);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v2, "containsObject:", v11))
          {
            v12 = v30;
            if (!v30)
              v12 = objc_alloc_init(MEMORY[0x1E0CB3788]);
            v30 = v12;
            objc_msgSend(v12, "addIndex:", v3);
          }
          else
          {
            objc_msgSend(v7, "objectForKey:", v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v13;
            if (v13)
            {
              v29 = v7;
              v15 = objc_msgSend(v13, "integerValue");
              v16 = v1;
              objc_msgSend(v1, "objectAtIndex:", v15);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "attributeSet");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "attributeSet");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addAttributesFromAttributeSet:", v19);

              v20 = v30;
              if (!v30)
                v20 = objc_alloc_init(MEMORY[0x1E0CB3788]);
              v30 = v20;
              objc_msgSend(v20, "addIndex:", v15);

              v1 = v16;
              v2 = v25;
              v7 = v29;
            }
            if (objc_msgSend(v10, "isUpdate"))
            {
              if (!v7)
                v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v3);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "uniqueIdentifier");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setObject:forKey:", v21, v22);

            }
            else
            {
              objc_msgSend(v10, "uniqueIdentifier");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v2, "addObject:", v21);
            }

            v8 = v26;
            v4 = v27;
            v6 = v28;
          }

          ++v9;
        }
        while (v6 != v9);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v6);

      v4 = v30;
      if (!v30)
        goto LABEL_27;
      v23 = (void *)objc_msgSend(v1, "mutableCopy");
      objc_msgSend(v23, "removeObjectsAtIndexes:", v30);

      v1 = v23;
    }
    else
    {
      v7 = 0;
    }

LABEL_27:
  }
  return v1;
}

void sub_18C436684(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C437310(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

uint64_t MurmurHash3_128(uint64_t result, int a2, unsigned int a3, unint64_t *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unsigned __int8 *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;

  v4 = a3;
  if (a2 < 16)
  {
    v7 = a3;
  }
  else
  {
    v5 = (_QWORD *)(result + 8);
    v6 = (a2 / 16);
    v7 = v4;
    do
    {
      v4 = 5
         * (__ROR8__((0x4CF5AD432745937FLL * ((0x88A129EA80000000 * *(v5 - 1)) | ((0x87C37B91114253D5 * *(v5 - 1)) >> 33))) ^ v4, 37)+ v7)+ 1390208809;
      v7 = 5
         * (v4
          + __ROR8__((0x87C37B91114253D5* ((0x4E8B26FE00000000 * *v5) | ((unint64_t)(0x4CF5AD432745937FLL * *v5) >> 31))) ^ v7, 33))+ 944331445;
      v5 += 2;
      --v6;
    }
    while (v6);
  }
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  v21 = (unsigned __int8 *)(result + 16 * (a2 / 16));
  switch(a2 & 0xF)
  {
    case 1:
      goto LABEL_21;
    case 2:
      goto LABEL_20;
    case 3:
      goto LABEL_19;
    case 4:
      goto LABEL_18;
    case 5:
      goto LABEL_17;
    case 6:
      goto LABEL_16;
    case 7:
      goto LABEL_15;
    case 8:
      goto LABEL_14;
    case 9:
      goto LABEL_13;
    case 0xA:
      goto LABEL_12;
    case 0xB:
      goto LABEL_11;
    case 0xC:
      goto LABEL_10;
    case 0xD:
      goto LABEL_9;
    case 0xE:
      goto LABEL_8;
    case 0xF:
      v8 = (unint64_t)v21[14] << 48;
LABEL_8:
      v9 = v8 | ((unint64_t)v21[13] << 40);
LABEL_9:
      v10 = v9 ^ ((unint64_t)v21[12] << 32);
LABEL_10:
      v11 = v10 ^ ((unint64_t)v21[11] << 24);
LABEL_11:
      v12 = v11 ^ ((unint64_t)v21[10] << 16);
LABEL_12:
      v13 = v12 ^ ((unint64_t)v21[9] << 8);
LABEL_13:
      v7 ^= 0x87C37B91114253D5
          * ((0x4E8B26FE00000000 * (v13 ^ v21[8])) | ((0x4CF5AD432745937FLL * (v13 ^ v21[8])) >> 31));
LABEL_14:
      v14 = (unint64_t)v21[7] << 56;
LABEL_15:
      v15 = v14 | ((unint64_t)v21[6] << 48);
LABEL_16:
      v16 = v15 ^ ((unint64_t)v21[5] << 40);
LABEL_17:
      v17 = v16 ^ ((unint64_t)v21[4] << 32);
LABEL_18:
      v18 = v17 ^ ((unint64_t)v21[3] << 24);
LABEL_19:
      v19 = v18 ^ ((unint64_t)v21[2] << 16);
LABEL_20:
      v20 = v19 ^ ((unint64_t)v21[1] << 8);
LABEL_21:
      v4 ^= 0x4CF5AD432745937FLL
          * ((0x88A129EA80000000 * (v20 ^ *v21)) | ((0x87C37B91114253D5 * (v20 ^ *v21)) >> 33));
      break;
    default:
      break;
  }
  v22 = v7 ^ a2;
  v23 = (v4 ^ a2) + v22;
  v24 = v23 + v22;
  v25 = 0xC4CEB9FE1A85EC53
      * ((0xFF51AFD7ED558CCDLL * (v23 ^ (v23 >> 33))) ^ ((0xFF51AFD7ED558CCDLL * (v23 ^ (v23 >> 33))) >> 33));
  v26 = 0xC4CEB9FE1A85EC53
      * ((0xFF51AFD7ED558CCDLL * (v24 ^ (v24 >> 33))) ^ ((0xFF51AFD7ED558CCDLL * (v24 ^ (v24 >> 33))) >> 33));
  v27 = v26 ^ (v26 >> 33);
  v28 = v27 + (v25 ^ (v25 >> 33));
  *a4 = v28;
  a4[1] = v28 + v27;
  return result;
}

uint64_t hasInternalCSEntitlement()
{
  if (initEntitlements_onceToken != -1)
    dispatch_once(&initEntitlements_onceToken, &__block_literal_global_20);
  return sInternalCSEntitlement;
}

const __CFString *MDCopyTypePedigree(const __CFString *result)
{
  const __CFString *v1;
  const __CFAllocator *v2;
  const __CFAllocator *v3;
  __CFSet *Mutable;
  __CFArray *v5;
  const __CFAllocator *v6;
  __CFSet *v7;
  __CFArray *v8;
  CFTypeRef cf;
  void *value;
  void *values[4];

  values[3] = *(void **)MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    if (CFStringHasPrefix(result, CFSTR("dyn.")))
    {
      v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      values[0] = CFSTR("public.item");
      values[1] = (void *)v1;
      values[2] = CFSTR("public.data");
      return (const __CFString *)CFArrayCreate(v2, (const void **)values, 3, MEMORY[0x1E0C9B378]);
    }
    else
    {
      if (MDCopyTypePedigree_once != -1)
        dispatch_once(&MDCopyTypePedigree_once, &__block_literal_global_3);
      value = 0;
      if (CFStringHasPrefix(v1, CFSTR("com.apple.iwork")))
      {
        v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B3B0]);
        v5 = CFArrayCreateMutable(v3, 0, MEMORY[0x1E0C9B378]);
        _MDParentsForUTI_sub(v1, v5, Mutable);
        value = CFArrayCreateCopy(v3, v5);
        CFRelease(v5);
        CFRelease(Mutable);
      }
      else
      {
        os_unfair_lock_lock((os_unfair_lock_t)&lock);
        if (CFDictionaryGetValueIfPresent((CFDictionaryRef)sParentsFromUTI, v1, (const void **)&value))
        {
          CFRetain(value);
        }
        else
        {
          os_unfair_lock_unlock((os_unfair_lock_t)&lock);
          v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
          v7 = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B3B0]);
          v8 = CFArrayCreateMutable(v6, 0, MEMORY[0x1E0C9B378]);
          _MDParentsForUTI_sub(v1, v8, v7);
          value = CFArrayCreateCopy(v6, v8);
          CFRelease(v8);
          CFRelease(v7);
          os_unfair_lock_lock((os_unfair_lock_t)&lock);
          cf = 0;
          if (CFDictionaryGetValueIfPresent((CFDictionaryRef)sParentsFromUTI, v1, &cf))
          {
            CFRelease(value);
            value = (void *)CFRetain(cf);
          }
          else
          {
            CFDictionarySetValue((CFMutableDictionaryRef)sParentsFromUTI, v1, value);
          }
        }
        os_unfair_lock_unlock((os_unfair_lock_t)&lock);
      }
      return (const __CFString *)value;
    }
  }
  return result;
}

void sub_18C43A498(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60)
{
  uint64_t v60;

  _Block_object_dispose(&a48, 8);
  _Block_object_dispose(&a54, 8);
  _Block_object_dispose(&a60, 8);
  _Block_object_dispose((const void *)(v60 - 232), 8);
  _Unwind_Resume(a1);
}

void sub_18C43A788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18C43B23C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18C43B994(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void _MDParentsForUTI_sub(const void *a1, __CFArray *a2, __CFSet *a3)
{
  const __CFArray *v6;
  const __CFArray *v7;
  CFIndex Count;
  CFIndex v9;
  CFIndex i;
  const void *ValueAtIndex;

  CFSetAddValue(a3, a1);
  CFArrayAppendValue(a2, a1);
  v6 = (const __CFArray *)UTTypeCopyParentIdentifiers();
  if (v6)
  {
    v7 = v6;
    Count = CFArrayGetCount(v6);
    if (Count >= 1)
    {
      v9 = Count;
      for (i = 0; i != v9; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v7, i);
        if (!CFSetContainsValue(a3, ValueAtIndex))
          _MDParentsForUTI_sub(ValueAtIndex, a2, a3);
      }
    }
    CFRelease(v7);
  }
}

id logForCSLogCategoryQuery()
{
  if (logForCSLogCategoryQuery_onceToken != -1)
    dispatch_once(&logForCSLogCategoryQuery_onceToken, &__block_literal_global_5);
  return (id)logForCSLogCategoryQuery_sQueryLog;
}

id CSRedactString(void *a1, int a2)
{
  id v3;
  unint64_t v4;
  id v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = a1;
  if (CSShouldRedactForPrivacy_onceToken != -1)
    dispatch_once(&CSShouldRedactForPrivacy_onceToken, &__block_literal_global_22);
  if (CSShouldRedactForPrivacy_shouldObfuscate && (v4 = objc_msgSend(v3, "length"), v4 > 4))
  {
    v6 = v4;
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "substringToIndex:", 3);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (a2)
    {
      objc_msgSend(v3, "substringFromIndex:", v6 - 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@...%@<%lu chars>"), v9, v10, v6);
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@...<%lu chars>"), v8, v6);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v5 = v3;
  }

  return v5;
}

void sub_18C43ED38(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C440770(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18C4409D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_18C440C08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

id CSSanitizeProtectionClass(void *a1)
{
  id v1;
  void *v2;
  char v3;
  void *v4;
  char v5;
  char v6;
  id v7;

  v1 = a1;
  v2 = v1;
  if (!v1
    || (v3 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CB2AB0]), v4 = v2, (v3 & 1) == 0)
    && (v5 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB2AB8]), v4 = v2, (v5 & 1) == 0)
    && (v6 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB2AD0]), v4 = v2, (v6 & 1) == 0))
  {
    v4 = (void *)*MEMORY[0x1E0CB2AC0];
  }
  v7 = v4;

  return v7;
}

uint64_t CSFriendlyFieldName(CSFriendlyFieldNameTable *this, const char *a2)
{
  __int128 *v3;
  uint64_t result;

  if ((uint64_t)a2 <= 0)
    a2 = (const char *)strlen((const char *)this);
  v3 = CSFriendlyFieldNameTable::in_word_set(this, a2);
  if (!v3)
    return 0;
  result = *((_QWORD *)v3 + 1);
  if (!result)
    return 0;
  return result;
}

__int128 *CSFriendlyFieldNameTable::in_word_set(CSFriendlyFieldNameTable *this, const char *a2)
{
  unsigned __int8 v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  unsigned int v10;
  __int128 *v11;
  const char *v12;
  int v14;
  int v15;
  int v16;
  CSFriendlyFieldNameTable *v17;

  if ((v2 & 1) == 0)
  {
    v17 = this;
    v14 = (int)a2;
    LODWORD(a2) = v14;
    v16 = v15;
    this = v17;
    if (v16)
    {
      xmmword_1ECDCC828 = 0u;
      unk_1ECDCC838 = 0u;
      xmmword_1ECDCC808 = 0u;
      unk_1ECDCC818 = 0u;
      CSFriendlyFieldNameTable::in_word_set(char const*,unsigned int)::wordlist[0] = 0u;
      qword_1ECDCC848 = (uint64_t)"genre";
      unk_1ECDCC850 = CFSTR("kMDItemGenre");
      xmmword_1ECDCC858 = 0u;
      unk_1ECDCC868 = 0u;
      xmmword_1ECDCC878 = 0u;
      qword_1ECDCC888 = (uint64_t)"role";
      unk_1ECDCC890 = CFSTR("kMDItemRole");
      qword_1ECDCC898 = (uint64_t)"tempo";
      unk_1ECDCC8A0 = CFSTR("kMDItemTempo");
      qword_1ECDCC8A8 = (uint64_t)"codecs";
      unk_1ECDCC8B0 = CFSTR("kMDItemCodecs");
      xmmword_1ECDCC8B8 = 0u;
      unk_1ECDCC8C8 = 0u;
      xmmword_1ECDCC8D8 = 0u;
      unk_1ECDCC8E8 = 0u;
      xmmword_1ECDCC8F8 = 0u;
      unk_1ECDCC908 = 0u;
      qword_1ECDCC918 = (uint64_t)"userTags";
      unk_1ECDCC920 = CFSTR("kMDItemUserTags");
      xmmword_1ECDCC928 = 0u;
      unk_1ECDCC938 = 0u;
      xmmword_1ECDCC948 = 0u;
      unk_1ECDCC958 = 0u;
      qword_1ECDCC968 = (uint64_t)"coverage";
      unk_1ECDCC970 = CFSTR("kMDItemCoverage");
      qword_1ECDCC978 = (uint64_t)"fontNames";
      unk_1ECDCC980 = CFSTR("kMDItemFonts");
      qword_1ECDCC988 = (uint64_t)"title";
      unk_1ECDCC990 = CFSTR("kMDItemTitle");
      qword_1ECDCC998 = (uint64_t)"rights";
      unk_1ECDCC9A0 = CFSTR("kMDItemRights");
      xmmword_1ECDCC9A8 = 0u;
      qword_1ECDCC9B8 = (uint64_t)"headline";
      unk_1ECDCC9C0 = CFSTR("kMDItemHeadline");
      qword_1ECDCC9C8 = (uint64_t)"languages";
      unk_1ECDCC9D0 = CFSTR("kMDItemLanguages");
      xmmword_1ECDCC9E8 = 0u;
      unk_1ECDCC9F8 = 0u;
      xmmword_1ECDCC9D8 = 0u;
      qword_1ECDCCA08 = (uint64_t)"keywords";
      qword_1ECDCCA10 = (uint64_t)CFSTR("kMDItemKeywords");
      xmmword_1ECDCCA18 = 0u;
      qword_1ECDCCA28 = (uint64_t)"performers";
      qword_1ECDCCA30 = (uint64_t)CFSTR("kMDItemPerformers");
      xmmword_1ECDCCA38 = 0u;
      unk_1ECDCCA48 = 0u;
      qword_1ECDCCA58 = (uint64_t)"filename";
      qword_1ECDCCA60 = (uint64_t)CFSTR("kMDItemFilename");
      xmmword_1ECDCCA68 = 0u;
      qword_1ECDCCA78 = (uint64_t)"theme";
      qword_1ECDCCA80 = (uint64_t)CFSTR("kMDItemTheme");
      xmmword_1ECDCCAA8 = 0u;
      unk_1ECDCCAB8 = 0u;
      xmmword_1ECDCCA88 = 0u;
      unk_1ECDCCA98 = 0u;
      qword_1ECDCCAC8 = (uint64_t)"vendorName";
      qword_1ECDCCAD0 = (uint64_t)CFSTR("kMDItemVendorName");
      xmmword_1ECDCCAD8 = 0u;
      unk_1ECDCCAE8 = 0u;
      qword_1ECDCCAF8 = (uint64_t)"fileSize";
      qword_1ECDCCB00 = (uint64_t)CFSTR("kMDItemFileSize");
      qword_1ECDCCB08 = (uint64_t)"path";
      qword_1ECDCCB10 = (uint64_t)CFSTR("kMDItemPath");
      xmmword_1ECDCCB28 = 0u;
      unk_1ECDCCB38 = 0u;
      xmmword_1ECDCCB18 = 0u;
      qword_1ECDCCB48 = (uint64_t)"photosSeasons";
      qword_1ECDCCB50 = (uint64_t)CFSTR("kMDItemPhotosSeasons");
      qword_1ECDCCB58 = (uint64_t)"photosKeywords";
      qword_1ECDCCB60 = (uint64_t)CFSTR("kMDItemPhotosKeywords");
      xmmword_1ECDCCB68 = 0u;
      qword_1ECDCCB78 = (uint64_t)"maxAperture";
      qword_1ECDCCB80 = (uint64_t)CFSTR("kMDItemMaxAperture");
      qword_1ECDCCB88 = (uint64_t)"photosContentType";
      qword_1ECDCCB90 = (uint64_t)CFSTR("kMDItemContentType");
      xmmword_1ECDCCB98 = 0u;
      qword_1ECDCCBA8 = (uint64_t)"containerTitle";
      qword_1ECDCCBB0 = (uint64_t)CFSTR("kMDItemContainerTitle");
      xmmword_1ECDCCBB8 = 0u;
      qword_1ECDCCBC8 = (uint64_t)"photosMediaTypes";
      qword_1ECDCCBD0 = (uint64_t)CFSTR("kMDItemPhotosMediaTypes");
      qword_1ECDCCBD8 = (uint64_t)"creator";
      qword_1ECDCCBE0 = (uint64_t)CFSTR("kMDItemCreator");
      qword_1ECDCCBE8 = (uint64_t)"composer";
      qword_1ECDCCBF0 = (uint64_t)CFSTR("kMDItemComposer");
      qword_1ECDCCBF8 = (uint64_t)"photosIsProResVideo";
      qword_1ECDCCC00 = (uint64_t)CFSTR("kMDItemIsProResVideo");
      qword_1ECDCCC08 = (uint64_t)"containerDisplayName";
      qword_1ECDCCC10 = (uint64_t)CFSTR("kMDItemContainerDisplayName");
      qword_1ECDCCC18 = (uint64_t)"photosTitle";
      qword_1ECDCCC20 = (uint64_t)CFSTR("kMDItemPhotosTitle");
      xmmword_1ECDCCC38 = 0u;
      xmmword_1ECDCCC28 = 0u;
      qword_1ECDCCC48 = (uint64_t)"photosMeanings";
      qword_1ECDCCC50 = (uint64_t)CFSTR("kMDItemPhotosMeanings");
      qword_1ECDCCC58 = (uint64_t)"photosContentCreationDate";
      qword_1ECDCCC60 = (uint64_t)CFSTR("kMDItemContentCreationDate");
      xmmword_1ECDCCC78 = 0u;
      xmmword_1ECDCCC68 = 0u;
      qword_1ECDCCC88 = (uint64_t)"organizations";
      qword_1ECDCCC90 = (uint64_t)CFSTR("kMDItemOrganizations");
      xmmword_1ECDCCCB8 = 0u;
      xmmword_1ECDCCCA8 = 0u;
      xmmword_1ECDCCC98 = 0u;
      qword_1ECDCCCC8 = (uint64_t)"photosMemoryTitle";
      qword_1ECDCCCD0 = (uint64_t)CFSTR("kMDItemPhotosMemoryTitle");
      xmmword_1ECDCCD08 = 0u;
      xmmword_1ECDCCCF8 = 0u;
      xmmword_1ECDCCCE8 = 0u;
      xmmword_1ECDCCCD8 = 0u;
      qword_1ECDCCD18 = (uint64_t)"photosLibraryName";
      qword_1ECDCCD20 = (uint64_t)CFSTR("kMDItemPhotosLibraryName");
      qword_1ECDCCD28 = (uint64_t)"documentIdentifier";
      qword_1ECDCCD30 = (uint64_t)CFSTR("kMDItemDocumentIdentifier");
      xmmword_1ECDCCD38 = 0u;
      qword_1ECDCCD48 = (uint64_t)"photosFavorites";
      qword_1ECDCCD50 = (uint64_t)CFSTR("kMDItemPhotosFavorites");
      qword_1ECDCCD58 = (uint64_t)"photosEventNames";
      qword_1ECDCCD60 = (uint64_t)CFSTR("kMDItemPhotosEventNames");
      qword_1ECDCCD68 = (uint64_t)"totalBitRate";
      qword_1ECDCCD70 = (uint64_t)CFSTR("kMDItemTotalBitRate");
      xmmword_1ECDCCD78 = 0u;
      qword_1ECDCCD88 = (uint64_t)"containerOrder";
      qword_1ECDCCD90 = (uint64_t)CFSTR("kMDItemContainerOrder");
      qword_1ECDCCD98 = (uint64_t)"photosAestheticScore";
      qword_1ECDCCDA0 = (uint64_t)CFSTR("kMDItemAestheticScore");
      qword_1ECDCCDA8 = (uint64_t)"photosEventCategories";
      qword_1ECDCCDB0 = (uint64_t)CFSTR("kMDItemPhotosEventCategories");
      xmmword_1ECDCCDC8 = 0u;
      xmmword_1ECDCCDB8 = 0u;
      qword_1ECDCCDD8 = (uint64_t)"photosDonationState";
      qword_1ECDCCDE0 = (uint64_t)CFSTR("kMDItemPhotosDonationState");
      xmmword_1ECDCCDF8 = 0u;
      xmmword_1ECDCCDE8 = 0u;
      qword_1ECDCCE08 = (uint64_t)"version";
      qword_1ECDCCE10 = (uint64_t)CFSTR("kMDItemVersion");
      qword_1ECDCCE18 = (uint64_t)"finderComment";
      qword_1ECDCCE20 = (uint64_t)CFSTR("kMDItemFinderComment");
      qword_1ECDCCE28 = (uint64_t)"photosCollectionSubtitle";
      qword_1ECDCCE30 = (uint64_t)CFSTR("kMDItemPhotosCollectionSubtitle");
      xmmword_1ECDCCE38 = 0u;
      qword_1ECDCCE48 = (uint64_t)"artist";
      qword_1ECDCCE50 = (uint64_t)CFSTR("kMDItemArtist");
      qword_1ECDCCE58 = (uint64_t)"videoBitRate";
      qword_1ECDCCE60 = (uint64_t)CFSTR("kMDItemVideoBitRate");
      xmmword_1ECDCCE68 = 0u;
      qword_1ECDCCE78 = (uint64_t)"copyright";
      qword_1ECDCCE80 = (uint64_t)CFSTR("kMDItemCopyright");
      xmmword_1ECDCCE88 = 0u;
      qword_1ECDCCE98 = (uint64_t)"cameraOwner";
      qword_1ECDCCEA0 = (uint64_t)CFSTR("kMDItemCameraOwner");
      qword_1ECDCCEA8 = (uint64_t)"photosContributor";
      qword_1ECDCCEB0 = (uint64_t)CFSTR("kMDItemPhotosContributor");
      qword_1ECDCCEB8 = (uint64_t)"photosUtilityTypes";
      qword_1ECDCCEC0 = (uint64_t)CFSTR("kMDItemPhotosUtilityTypes");
      qword_1ECDCCEC8 = (uint64_t)"pageWidth";
      qword_1ECDCCED0 = (uint64_t)CFSTR("kMDItemPageWidth");
      xmmword_1ECDCCEF8 = 0u;
      qword_1ECDCCF08 = (uint64_t)"director";
      qword_1ECDCCF10 = (uint64_t)CFSTR("kMDItemDirector");
      qword_1ECDCCF38 = (uint64_t)"photosEventPerformers";
      qword_1ECDCCF40 = (uint64_t)CFSTR("kMDItemPhotosEventPerformers");
      qword_1ECDCCF88 = (uint64_t)"textContent";
      qword_1ECDCCF90 = (uint64_t)CFSTR("kMDItemTextContent");
      qword_1ECDCCF98 = (uint64_t)"photosLocationKeywords";
      qword_1ECDCCFA0 = (uint64_t)CFSTR("kMDItemPhotosLocationKeywords");
      qword_1ECDCCFA8 = (uint64_t)"relatedUniqueIdentifier";
      qword_1ECDCCFB0 = (uint64_t)CFSTR("kMDItemRelatedUniqueIdentifier");
      qword_1ECDCCFE8 = (uint64_t)"endDate";
      qword_1ECDCCFF0 = (uint64_t)CFSTR("kMDItemEndDate");
      qword_1ECDCD008 = (uint64_t)"recipientNames";
      qword_1ECDCD010 = (uint64_t)CFSTR("kMDItemRecipients");
      qword_1ECDCD038 = (uint64_t)"comment";
      qword_1ECDCD040 = (uint64_t)CFSTR("kMDItemComment");
      qword_1ECDCD048 = (uint64_t)"photosTimeZoneName";
      qword_1ECDCD050 = (uint64_t)CFSTR("kMDItemPhotosTimeZoneName");
      qword_1ECDCD068 = (uint64_t)"photosContainerIdentifier";
      qword_1ECDCD070 = (uint64_t)CFSTR("kMDItemContainerIdentifier");
      qword_1ECDCD0F8 = (uint64_t)"pageCount";
      qword_1ECDCD100 = (uint64_t)CFSTR("kMDItemNumberOfPages");
      qword_1ECDCD128 = (uint64_t)"textSelected";
      qword_1ECDCD130 = (uint64_t)CFSTR("kMDItemTextSelected");
      qword_1ECDCD198 = (uint64_t)"photosFilename";
      qword_1ECDCD1A0 = (uint64_t)CFSTR("kMDItemFilename");
      qword_1ECDCD1E8 = (uint64_t)"kind";
      qword_1ECDCD1F0 = (uint64_t)CFSTR("kMDItemKind");
      qword_1ECDCD248 = (uint64_t)"thumbnailContentType";
      qword_1ECDCD250 = (uint64_t)CFSTR("MDItemThumbnailContentType");
      qword_1ECDCD268 = (uint64_t)"editors";
      qword_1ECDCD270 = (uint64_t)CFSTR("kMDItemEditors");
      qword_1ECDCD288 = (uint64_t)"userOwned";
      qword_1ECDCD290 = (uint64_t)CFSTR("kMDItemUserOwned");
      qword_1ECDCD298 = (uint64_t)"photosContentCreationDateYears";
      qword_1ECDCD2A0 = (uint64_t)CFSTR("kMDItemPhotosContentCreationDateYears");
      qword_1ECDCD2B8 = (uint64_t)"photosEntityTitle";
      qword_1ECDCD2C0 = (uint64_t)CFSTR("kMDItemPhotosEntityTitle");
      qword_1ECDCD2C8 = (uint64_t)"thumbnailData";
      qword_1ECDCD2D0 = (uint64_t)CFSTR("kMDItemThumbnailData");
      qword_1ECDCD2D8 = (uint64_t)"city";
      qword_1ECDCD2E0 = (uint64_t)CFSTR("kMDItemCity");
      qword_1ECDCD318 = (uint64_t)"redEyeOn";
      qword_1ECDCD448 = (uint64_t)"weakRelatedUniqueIdentifier";
      qword_1ECDCD4B8 = (uint64_t)"containerIdentifier";
      qword_1ECDCD4C0 = (uint64_t)CFSTR("kMDItemContainerIdentifier");
      qword_1ECDCD5B8 = (uint64_t)"photosFavorited";
      qword_1ECDCD658 = (uint64_t)"colorSpace";
      qword_1ECDCD678 = (uint64_t)"dueDate";
      qword_1ECDCD688 = (uint64_t)"subtitle";
      qword_1ECDCD718 = (uint64_t)"musicalGenre";
      qword_1ECDCD728 = (uint64_t)"recordingDate";
      qword_1ECDCE0E0 = (uint64_t)CFSTR("_MDItemLastMotionActivityState");
      qword_1ECDCE0F0 = (uint64_t)CFSTR("kMDItemPhotosContributorContactIdentifier");
      qword_1ECDCE148 = (uint64_t)"eventCarDropoffLocationAddress";
      qword_1ECDCE150 = (uint64_t)CFSTR("kMDItemEventCarDropoffLocationAddress");
      qword_1ECDCE1A0 = (uint64_t)CFSTR("_kMDItemIndexIdentifier");
      qword_1ECDCE1F8 = (uint64_t)"photosContributorName";
      qword_1ECDCE2A8 = (uint64_t)"audioChannelCount";
      qword_1ECDCE2D8 = (uint64_t)"pixelCount";
      qword_1ECDCE310 = (uint64_t)CFSTR("kMDItemPhotosDonationTimestamp");
      qword_1ECDCE318 = (uint64_t)"eventRestaurantUnderName";
      qword_1ECDCE338 = (uint64_t)"focalLength";
      qword_1ECDCE358 = (uint64_t)"eventFlightDepartureAirportRegion";
      qword_1ECDCE3C8 = (uint64_t)"contactKeywords";
      qword_1ECDCE3D0 = (uint64_t)CFSTR("kMDItemContactKeywords");
      qword_1ECDCE3D8 = (uint64_t)"photosMediaAnalysisImageVersion";
      qword_1ECDCE448 = (uint64_t)"eventCarDropoffLocationAddressStreetAddress";
      qword_1ECDCE450 = (uint64_t)CFSTR("kMDItemEventCarDropoffLocationAddressStreetAddress");
      qword_1ECDCE498 = (uint64_t)"recipientEmailAddresses";
      qword_1ECDCE4B0 = (uint64_t)CFSTR("kMDItemOriginalFormat");
      qword_1ECDCE508 = (uint64_t)"supportFileType";
      qword_1ECDCE540 = (uint64_t)CFSTR("kMDItemEventRestaurantTimeZone");
      qword_1ECDCE560 = (uint64_t)CFSTR("kMDItemEventFlightDepartureAirportInternationalNames");
      qword_1ECDCE6C0 = (uint64_t)CFSTR("kMDItemEventFlightDepartureAirportAddressSynonyms");
      qword_1ECDCE6D8 = (uint64_t)"photosPeoplePersonIdentifiers";
      qword_1ECDCE758 = (uint64_t)"serialNumber";
      qword_1ECDCE768 = (uint64_t)"pageHeight";
      qword_1ECDCE780 = (uint64_t)CFSTR("kMDItemEventMovieUnderName");
      qword_1ECDCE7F8 = (uint64_t)"supportsPhoneCall";
      qword_1ECDCE8B8 = (uint64_t)"EXIFGPSVersion";
      qword_1ECDCE908 = (uint64_t)"completionDate";
      qword_1ECDCE948 = (uint64_t)"appEntityType";
      qword_1ECDCE968 = (uint64_t)"phoneCallStatus";
      qword_1ECDCE998 = (uint64_t)"bitsPerSample";
      qword_1ECDCEA68 = (uint64_t)"photosSharedLibraryContributors";
      xmmword_1ECDCCEE8 = 0u;
      qword_1ECDCEAC0 = (uint64_t)CFSTR("kMDItemProfileName");
      xmmword_1ECDCEAD8 = 0u;
      xmmword_1ECDCCED8 = 0u;
      qword_1ECDCEAB8 = (uint64_t)"profileName";
      xmmword_1ECDCEA98 = 0u;
      qword_1ECDCEA80 = (uint64_t)CFSTR("kMDItemDonatedEventMerchantName");
      qword_1ECDCEA90 = (uint64_t)CFSTR("kMDItemDonatedEventFlightCarrier");
      xmmword_1ECDCEAA8 = 0u;
      qword_1ECDCEA88 = (uint64_t)"donatedEventFlightCarrier";
      qword_1ECDCEA70 = (uint64_t)CFSTR("kMDItemPhotosSharedLibraryContributors");
      qword_1ECDCEA78 = (uint64_t)"donatedEventMerchantName";
      qword_1ECDCE9E0 = (uint64_t)CFSTR("kMDItemEventHotelUnderName");
      xmmword_1ECDCEA58 = 0u;
      xmmword_1ECDCEA48 = 0u;
      xmmword_1ECDCEA08 = 0u;
      qword_1ECDCEA38 = (uint64_t)"eventMetadata";
      qword_1ECDCEA40 = (uint64_t)CFSTR("kMDItemEventMetadata");
      qword_1ECDCEA00 = (uint64_t)CFSTR("kMDItemPhotosPrivateEncryptedComputeAnalysisVersion");
      xmmword_1ECDCEA28 = 0u;
      xmmword_1ECDCEA18 = 0u;
      qword_1ECDCE9F8 = (uint64_t)"photosPrivateEncryptedComputeAnalysisVersion";
      xmmword_1ECDCE9E8 = 0u;
      xmmword_1ECDCCF28 = 0u;
      qword_1ECDCE9B8 = (uint64_t)"donatedEvent";
      xmmword_1ECDCE9C8 = 0u;
      qword_1ECDCE9D8 = (uint64_t)"eventHotelUnderName";
      qword_1ECDCE9C0 = (uint64_t)CFSTR("kMDItemDonatedEvent");
      xmmword_1ECDCCF18 = 0u;
      qword_1ECDCE9A8 = (uint64_t)"eventFlightDepartureAirportCountry";
      qword_1ECDCE9B0 = (uint64_t)CFSTR("kMDItemEventFlightDepartureAirportCountry");
      qword_1ECDCE9A0 = (uint64_t)CFSTR("kMDItemBitsPerSample");
      qword_1ECDCE980 = (uint64_t)CFSTR("kMDItemEventFlightPassengerSeatNumbers");
      xmmword_1ECDCE988 = 0u;
      qword_1ECDCE970 = (uint64_t)CFSTR("com_apple_mobilephone_callStatus");
      qword_1ECDCE978 = (uint64_t)"eventFlightPassengerSeatNumbers";
      xmmword_1ECDCCF78 = 0u;
      qword_1ECDCE950 = (uint64_t)CFSTR("_kMDItemAppEntityTypeIdentifier");
      xmmword_1ECDCE958 = 0u;
      qword_1ECDCE910 = (uint64_t)CFSTR("kMDItemCompletionDate");
      xmmword_1ECDCE938 = 0u;
      xmmword_1ECDCE928 = 0u;
      xmmword_1ECDCCF68 = 0u;
      qword_1ECDCE918 = (uint64_t)"calendarHolidayIdentifier";
      qword_1ECDCE920 = (uint64_t)CFSTR("kMDItemCalendarHolidayIdentifier");
      xmmword_1ECDCE8E8 = 0u;
      xmmword_1ECDCE8D8 = 0u;
      xmmword_1ECDCE8C8 = 0u;
      qword_1ECDCE8C0 = (uint64_t)CFSTR("kMDItemEXIFGPSVersion");
      xmmword_1ECDCE878 = 0u;
      xmmword_1ECDCE8F8 = 0u;
      qword_1ECDCE870 = (uint64_t)CFSTR("_kMDItemPotentialEventMessage");
      xmmword_1ECDCE8A8 = 0u;
      xmmword_1ECDCE898 = 0u;
      xmmword_1ECDCE888 = 0u;
      xmmword_1ECDCCF58 = 0u;
      qword_1ECDCE868 = (uint64_t)"potentialEventMessage";
      xmmword_1ECDCE848 = 0u;
      xmmword_1ECDCE838 = 0u;
      xmmword_1ECDCCF48 = 0u;
      qword_1ECDCE830 = (uint64_t)CFSTR("kMDItemStateOrProvince");
      xmmword_1ECDCE858 = 0u;
      xmmword_1ECDCCFD8 = 0u;
      qword_1ECDCE820 = (uint64_t)CFSTR("kMDItemEventFlightArrivalAirportCode");
      qword_1ECDCE828 = (uint64_t)"stateOrProvince";
      qword_1ECDCE800 = (uint64_t)CFSTR("kMDItemSupportsPhoneCall");
      xmmword_1ECDCE808 = 0u;
      qword_1ECDCE818 = (uint64_t)"eventFlightArrivalAirportCode";
      xmmword_1ECDCE7E8 = 0u;
      xmmword_1ECDCE7D8 = 0u;
      xmmword_1ECDCCFC8 = 0u;
      qword_1ECDCE7C8 = (uint64_t)"donatedEventType";
      qword_1ECDCE7D0 = (uint64_t)CFSTR("kMDItemDonatedEventType");
      qword_1ECDCE7B0 = (uint64_t)CFSTR("kMDItemContentRating");
      xmmword_1ECDCE7B8 = 0u;
      qword_1ECDCE7A0 = (uint64_t)CFSTR("kMDItemFullyFormattedAddress");
      qword_1ECDCE7A8 = (uint64_t)"photosContentRating";
      xmmword_1ECDCCFB8 = 0u;
      qword_1ECDCE790 = (uint64_t)CFSTR("kMDAttachmentPaths");
      qword_1ECDCE798 = (uint64_t)"fullyFormattedAddress";
      qword_1ECDCE788 = (uint64_t)"attachmentPaths";
      qword_1ECDCE770 = (uint64_t)CFSTR("kMDItemPageHeight");
      qword_1ECDCE778 = (uint64_t)"eventMovieUnderName";
      xmmword_1ECDCCFF8 = 0u;
      qword_1ECDCE760 = (uint64_t)CFSTR("_kMDItemSerialNumber");
      xmmword_1ECDCE728 = 0u;
      qword_1ECDCE6E8 = (uint64_t)"keySignature";
      qword_1ECDCE718 = (uint64_t)"aperture";
      xmmword_1ECDCE748 = 0u;
      xmmword_1ECDCE738 = 0u;
      qword_1ECDCE720 = (uint64_t)CFSTR("kMDItemAperture");
      qword_1ECDCE700 = (uint64_t)CFSTR("kMDItemEventCarDropoffLocationAddressRegion");
      xmmword_1ECDCE708 = 0u;
      qword_1ECDCE6F0 = (uint64_t)CFSTR("kMDItemKeySignature");
      qword_1ECDCE6F8 = (uint64_t)"eventCarDropoffLocationAddressRegion";
      xmmword_1ECDCD028 = 0u;
      qword_1ECDCE6E0 = (uint64_t)CFSTR("kMDItemPhotosPeoplePersonIdentifiers");
      xmmword_1ECDCE6C8 = 0u;
      qword_1ECDCE6B8 = (uint64_t)"eventFlightDepartureAirportAddressSynonyms";
      xmmword_1ECDCE678 = 0u;
      xmmword_1ECDCE668 = 0u;
      xmmword_1ECDCE658 = 0u;
      xmmword_1ECDCD018 = 0u;
      qword_1ECDCE628 = (uint64_t)"ISOSpeed";
      xmmword_1ECDCE698 = 0u;
      xmmword_1ECDCE688 = 0u;
      qword_1ECDCE650 = (uint64_t)CFSTR("kMDItemPixelWidth");
      xmmword_1ECDCE6A8 = 0u;
      qword_1ECDCE640 = (uint64_t)CFSTR("kMDItemEventFlightDepartureAirportAddress");
      qword_1ECDCE648 = (uint64_t)"pixelWidth";
      xmmword_1ECDCD058 = 0u;
      qword_1ECDCE630 = (uint64_t)CFSTR("kMDItemISOSpeed");
      qword_1ECDCE638 = (uint64_t)"eventFlightDepartureAirportAddress";
      qword_1ECDCE5F8 = (uint64_t)"mediaTypes";
      xmmword_1ECDCE618 = 0u;
      qword_1ECDCE608 = (uint64_t)"userCurated";
      qword_1ECDCE610 = (uint64_t)CFSTR("kMDItemUserCurated");
      qword_1ECDCE600 = (uint64_t)CFSTR("kMDItemMediaTypes");
      xmmword_1ECDCE5B8 = 0u;
      qword_1ECDCE5E8 = (uint64_t)"eventType";
      qword_1ECDCE5F0 = (uint64_t)CFSTR("kMDItemEventType");
      qword_1ECDCE590 = (uint64_t)CFSTR("kMDItemAltitude");
      xmmword_1ECDCE5D8 = 0u;
      xmmword_1ECDCE5C8 = 0u;
      qword_1ECDCE5A8 = (uint64_t)"acquisitionMake";
      qword_1ECDCE5B0 = (uint64_t)CFSTR("kMDItemAcquisitionMake");
      xmmword_1ECDCD0E8 = 0u;
      qword_1ECDCE598 = (uint64_t)"importantDates";
      qword_1ECDCE5A0 = (uint64_t)CFSTR("kMDItemImportantDates");
      qword_1ECDCE588 = (uint64_t)"altitude";
      xmmword_1ECDCE578 = 0u;
      xmmword_1ECDCD0D8 = 0u;
      qword_1ECDCE568 = (uint64_t)"photosPeopleEmailAddresses";
      qword_1ECDCE570 = (uint64_t)CFSTR("kMDItemPhotosPeopleEmailAddresses");
      qword_1ECDCE558 = (uint64_t)"eventFlightDepartureAirportInternationalNames";
      xmmword_1ECDCE548 = 0u;
      xmmword_1ECDCD0C8 = 0u;
      qword_1ECDCE518 = (uint64_t)"relatedAppBundleIdentifier";
      xmmword_1ECDCE528 = 0u;
      qword_1ECDCE538 = (uint64_t)"eventRestaurantTimeZone";
      qword_1ECDCE520 = (uint64_t)CFSTR("kMDItemRelatedAppBundleIdentifier");
      xmmword_1ECDCD0B8 = 0u;
      qword_1ECDCE510 = (uint64_t)CFSTR("kMDItemSupportFileType");
      qword_1ECDCE4E0 = (uint64_t)CFSTR("kMDItemDeliveryType");
      qword_1ECDCE4F0 = (uint64_t)CFSTR("kMDItemURL");
      xmmword_1ECDCE4F8 = 0u;
      qword_1ECDCE4E8 = (uint64_t)"URL";
      qword_1ECDCE4D0 = (uint64_t)CFSTR("kMDItemEventCarReservationForName");
      qword_1ECDCE4D8 = (uint64_t)"deliveryType";
      xmmword_1ECDCD0A8 = 0u;
      qword_1ECDCE4C0 = (uint64_t)CFSTR("kMDItemPhotosFaceAnalysisVersion");
      qword_1ECDCE4C8 = (uint64_t)"eventCarReservationForName";
      qword_1ECDCE4B8 = (uint64_t)"photosFaceAnalysisVersion";
      qword_1ECDCE4A0 = (uint64_t)CFSTR("kMDItemRecipientEmailAddresses");
      qword_1ECDCE4A8 = (uint64_t)"originalFormat";
      qword_1ECDCE460 = (uint64_t)CFSTR("kMDItemIsPartiallyDownloaded");
      xmmword_1ECDCE488 = 0u;
      xmmword_1ECDCE478 = 0u;
      xmmword_1ECDCD098 = 0u;
      qword_1ECDCE468 = (uint64_t)"additionalRecipients";
      qword_1ECDCE470 = (uint64_t)CFSTR("kMDItemAdditionalRecipientPersons");
      qword_1ECDCE458 = (uint64_t)"partiallyDownloaded";
      xmmword_1ECDCE418 = 0u;
      xmmword_1ECDCD088 = 0u;
      qword_1ECDCE3F8 = (uint64_t)"GPSTrack";
      xmmword_1ECDCE438 = 0u;
      xmmword_1ECDCE428 = 0u;
      xmmword_1ECDCD078 = 0u;
      qword_1ECDCE408 = (uint64_t)"photosContentDescription";
      qword_1ECDCE410 = (uint64_t)CFSTR("kMDItemPhotosDescription");
      qword_1ECDCE400 = (uint64_t)CFSTR("kMDItemGPSTrack");
      xmmword_1ECDCD118 = 0u;
      qword_1ECDCE3E8 = (uint64_t)"eventSourceBundleIdentifier";
      qword_1ECDCE3F0 = (uint64_t)CFSTR("kMDItemEventSourceBundleIdentifier");
      qword_1ECDCE3E0 = (uint64_t)CFSTR("kMDItemPhotosMediaAnalysisImageVersion");
      qword_1ECDCE378 = (uint64_t)"speed";
      xmmword_1ECDCE3A8 = 0u;
      xmmword_1ECDCE398 = 0u;
      xmmword_1ECDCE388 = 0u;
      xmmword_1ECDCD108 = 0u;
      qword_1ECDCE380 = (uint64_t)CFSTR("kMDItemSpeed");
      xmmword_1ECDCE3B8 = 0u;
      xmmword_1ECDCD188 = 0u;
      qword_1ECDCE360 = (uint64_t)CFSTR("kMDItemEventFlightDepartureAirportRegion");
      xmmword_1ECDCE368 = 0u;
      xmmword_1ECDCD178 = 0u;
      qword_1ECDCE340 = (uint64_t)CFSTR("kMDItemFocalLength");
      xmmword_1ECDCE348 = 0u;
      xmmword_1ECDCD168 = 0u;
      qword_1ECDCE320 = (uint64_t)CFSTR("kMDItemEventRestaurantUnderName");
      xmmword_1ECDCE328 = 0u;
      xmmword_1ECDCD158 = 0u;
      qword_1ECDCE308 = (uint64_t)"photosDonationTimestamp";
      xmmword_1ECDCE2F8 = 0u;
      xmmword_1ECDCE2E8 = 0u;
      xmmword_1ECDCD148 = 0u;
      qword_1ECDCE2E0 = (uint64_t)CFSTR("kMDItemPixelCount");
      xmmword_1ECDCE2B8 = 0u;
      xmmword_1ECDCD138 = 0u;
      qword_1ECDCE2B0 = (uint64_t)CFSTR("kMDItemAudioChannelCount");
      xmmword_1ECDCE2C8 = 0u;
      qword_1ECDCE268 = (uint64_t)"producer";
      qword_1ECDCE278 = (uint64_t)"eventSourceMetadata";
      xmmword_1ECDCE298 = 0u;
      xmmword_1ECDCE288 = 0u;
      qword_1ECDCE280 = (uint64_t)CFSTR("kMDItemEventSourceMetadata");
      qword_1ECDCE270 = (uint64_t)CFSTR("kMDItemProducer");
      xmmword_1ECDCE258 = 0u;
      qword_1ECDCE230 = (uint64_t)CFSTR("kMDItemAlternateNames");
      qword_1ECDCE250 = (uint64_t)CFSTR("kMDItemAcquisitionMake");
      qword_1ECDCE240 = (uint64_t)CFSTR("kMDItemEventCarDropoffLocationAddressPostalCode");
      qword_1ECDCE248 = (uint64_t)"photosAcquisitionMake";
      qword_1ECDCE238 = (uint64_t)"eventCarDropoffLocationAddressPostalCode";
      qword_1ECDCE200 = (uint64_t)CFSTR("MDItemPhotosContributorName");
      qword_1ECDCE210 = (uint64_t)CFSTR("_kMDItemHasTopMomentScore");
      xmmword_1ECDCE218 = 0u;
      qword_1ECDCE228 = (uint64_t)"alternateNames";
      qword_1ECDCE208 = (uint64_t)"hasTopMomentScore";
      xmmword_1ECDCE1D8 = 0u;
      xmmword_1ECDCD1D8 = 0u;
      qword_1ECDCE1D0 = (uint64_t)CFSTR("_kMDItemHasTopMomentScore");
      xmmword_1ECDCE1E8 = 0u;
      qword_1ECDCE1C0 = (uint64_t)CFSTR("kMDItemFlashOnOff");
      qword_1ECDCE1C8 = (uint64_t)"photosHasTopMomentScore";
      xmmword_1ECDCD1C8 = 0u;
      qword_1ECDCE1B0 = (uint64_t)CFSTR("_kMDItemUserActivityType");
      qword_1ECDCE1B8 = (uint64_t)"flashOn";
      qword_1ECDCE1A8 = (uint64_t)"userActivityType";
      qword_1ECDCE190 = (uint64_t)CFSTR("kMDItemPlayCount");
      qword_1ECDCE198 = (uint64_t)"indexIdentifier";
      qword_1ECDCE170 = (uint64_t)CFSTR("kMDItemInstructions");
      xmmword_1ECDCE178 = 0u;
      qword_1ECDCE188 = (uint64_t)"playCount";
      qword_1ECDCE168 = (uint64_t)"instructions";
      xmmword_1ECDCE158 = 0u;
      xmmword_1ECDCD1B8 = 0u;
      qword_1ECDCE108 = (uint64_t)"bundleIdentifier";
      xmmword_1ECDCE138 = 0u;
      xmmword_1ECDCE128 = 0u;
      xmmword_1ECDCD1A8 = 0u;
      qword_1ECDCE118 = (uint64_t)"photosLocationPrivateEncryptedComputeAnalysisVersion";
      qword_1ECDCE120 = (uint64_t)CFSTR("kMDItemPhotosLocationPrivateEncryptedComputeAnalysisVersion");
      qword_1ECDCE110 = (uint64_t)CFSTR("kMDItemBundleIdentifier");
      xmmword_1ECDCD238 = 0u;
      qword_1ECDCE0F8 = (uint64_t)"parentFileIdentifier";
      qword_1ECDCE100 = (uint64_t)CFSTR("kMDItemParentFileIdentifier");
      qword_1ECDCE0E8 = (uint64_t)"photosContributorContactIdentifier";
      xmmword_1ECDCD738 = 0u;
      xmmword_1ECDCD228 = 0u;
      qword_1ECDCD730 = (uint64_t)CFSTR("kMDItemRecordingDate");
      xmmword_1ECDCD748 = 0u;
      qword_1ECDCD720 = (uint64_t)CFSTR("kMDItemMusicalGenre");
      xmmword_1ECDCD6D8 = 0u;
      xmmword_1ECDCD6C8 = 0u;
      qword_1ECDCD6B8 = (uint64_t)"authorNames";
      xmmword_1ECDCD708 = 0u;
      xmmword_1ECDCD6F8 = 0u;
      xmmword_1ECDCD6E8 = 0u;
      xmmword_1ECDCD218 = 0u;
      qword_1ECDCD6C0 = (uint64_t)CFSTR("kMDItemAuthors");
      xmmword_1ECDCD698 = 0u;
      xmmword_1ECDCD208 = 0u;
      qword_1ECDCD690 = (uint64_t)CFSTR("kMDItemSubtitle");
      xmmword_1ECDCD6A8 = 0u;
      xmmword_1ECDCD1F8 = 0u;
      qword_1ECDCD680 = (uint64_t)CFSTR("kMDItemDueDate");
      xmmword_1ECDCD668 = 0u;
      xmmword_1ECDCD258 = 0u;
      qword_1ECDCD660 = (uint64_t)CFSTR("kMDItemColorSpace");
      xmmword_1ECDCD618 = 0u;
      qword_1ECDCD5C0 = (uint64_t)CFSTR("kMDItemPhotosFavorited");
      xmmword_1ECDCD638 = 0u;
      xmmword_1ECDCD628 = 0u;
      qword_1ECDCD608 = (uint64_t)"eventCarProviderName";
      qword_1ECDCD610 = (uint64_t)CFSTR("kMDItemEventCarProviderName");
      xmmword_1ECDCD648 = 0u;
      qword_1ECDCD5E0 = (uint64_t)CFSTR("kMDItemAuthorPersons");
      xmmword_1ECDCD5F8 = 0u;
      xmmword_1ECDCD5E8 = 0u;
      qword_1ECDCD5D8 = (uint64_t)"authors";
      xmmword_1ECDCD5C8 = 0u;
      qword_1ECDCD4F8 = (uint64_t)"latitude";
      xmmword_1ECDCD578 = 0u;
      xmmword_1ECDCD568 = 0u;
      xmmword_1ECDCD558 = 0u;
      qword_1ECDCD500 = (uint64_t)CFSTR("kMDItemLatitude");
      xmmword_1ECDCD598 = 0u;
      xmmword_1ECDCD588 = 0u;
      qword_1ECDCD550 = (uint64_t)CFSTR("kMDItemPhotosInferredTimeZoneOffset");
      xmmword_1ECDCD5A8 = 0u;
      qword_1ECDCD540 = (uint64_t)CFSTR("kMDItemPhotosSavedFromAppName");
      qword_1ECDCD548 = (uint64_t)"photosInferredTimeZoneOffset";
      qword_1ECDCD520 = (uint64_t)CFSTR("kMDItemIdentifier");
      xmmword_1ECDCD528 = 0u;
      qword_1ECDCD538 = (uint64_t)"photosSavedFromAppName";
      qword_1ECDCD518 = (uint64_t)"identifier";
      xmmword_1ECDCD508 = 0u;
      xmmword_1ECDCD278 = 0u;
      qword_1ECDCD4C8 = (uint64_t)"photosTimeZoneOffset";
      xmmword_1ECDCD4E8 = 0u;
      xmmword_1ECDCD4D8 = 0u;
      xmmword_1ECDCD2A8 = 0u;
      qword_1ECDCD4D0 = (uint64_t)CFSTR("kMDItemPhotosTimeZoneOffset");
      qword_1ECDCD480 = (uint64_t)CFSTR("kMDItemPublishers");
      xmmword_1ECDCD4A8 = 0u;
      xmmword_1ECDCD498 = 0u;
      xmmword_1ECDCD488 = 0u;
      xmmword_1ECDCD308 = 0u;
      qword_1ECDCD478 = (uint64_t)"publishers";
      xmmword_1ECDCD468 = 0u;
      xmmword_1ECDCD458 = 0u;
      xmmword_1ECDCD2F8 = 0u;
      qword_1ECDCD450 = (uint64_t)CFSTR("kMDItemWeakRelatedUniqueIdentifier");
      xmmword_1ECDCD428 = 0u;
      xmmword_1ECDCD2E8 = 0u;
      qword_1ECDCD420 = (uint64_t)CFSTR("kMDItemPhotosContentCreationDateYear");
      xmmword_1ECDCD438 = 0u;
      qword_1ECDCD400 = (uint64_t)CFSTR("kMDItemLastUsedDate");
      xmmword_1ECDCD408 = 0u;
      qword_1ECDCD418 = (uint64_t)"photosContentCreationDateYear";
      qword_1ECDCD3F8 = (uint64_t)"lastUsedDate";
      xmmword_1ECDCD3D8 = 0u;
      qword_1ECDCD3D0 = (uint64_t)CFSTR("kMDItemPhotosHolidays");
      xmmword_1ECDCD3E8 = 0u;
      qword_1ECDCD3B0 = (uint64_t)CFSTR("kMDItemCountry");
      qword_1ECDCD3C8 = (uint64_t)"photosHolidays";
      qword_1ECDCD3B8 = (uint64_t)"detectedEventTypes";
      qword_1ECDCD3C0 = (uint64_t)CFSTR("kMDItemDetectedEventTypes");
      qword_1ECDCD3A8 = (uint64_t)"country";
      xmmword_1ECDCD388 = 0u;
      qword_1ECDCD378 = (uint64_t)"longitude";
      qword_1ECDCD380 = (uint64_t)CFSTR("kMDItemLongitude");
      xmmword_1ECDCD398 = 0u;
      qword_1ECDCD350 = (uint64_t)CFSTR("kMDItemEXIFVersion");
      xmmword_1ECDCD368 = 0u;
      xmmword_1ECDCD358 = 0u;
      qword_1ECDCD320 = (uint64_t)CFSTR("kMDItemRedEyeOnOff");
      xmmword_1ECDCD338 = 0u;
      xmmword_1ECDCD328 = 0u;
      qword_1ECDCD348 = (uint64_t)"EXIFVersion";
      qword_1ECDCD758 = (uint64_t)"photosMediaAnalysisVersion";
      qword_1ECDCD760 = (uint64_t)CFSTR("kMDItemPhotosMediaAnalysisVersion");
      xmmword_1ECDCD768 = 0u;
      qword_1ECDCD778 = (uint64_t)"lyricist";
      qword_1ECDCD780 = (uint64_t)CFSTR("kMDItemLyricist");
      xmmword_1ECDCD788 = 0u;
      qword_1ECDCD798 = (uint64_t)"subThoroughfare";
      qword_1ECDCD7A0 = (uint64_t)CFSTR("kMDItemSubThoroughfare");
      xmmword_1ECDCD7A8 = 0u;
      qword_1ECDCD7B8 = (uint64_t)"contributors";
      qword_1ECDCD7C0 = (uint64_t)CFSTR("kMDItemContributors");
      xmmword_1ECDCD7D8 = 0u;
      xmmword_1ECDCD7C8 = 0u;
      qword_1ECDCD7E8 = (uint64_t)"attachmentTypes";
      qword_1ECDCD7F0 = (uint64_t)CFSTR("kMDAttachmentTypes");
      xmmword_1ECDCD808 = 0u;
      xmmword_1ECDCD7F8 = 0u;
      qword_1ECDCD818 = (uint64_t)"recipientAddresses";
      qword_1ECDCD820 = (uint64_t)CFSTR("kMDItemRecipientAddresses");
      xmmword_1ECDCD868 = 0u;
      xmmword_1ECDCD858 = 0u;
      xmmword_1ECDCD848 = 0u;
      xmmword_1ECDCD838 = 0u;
      xmmword_1ECDCD828 = 0u;
      qword_1ECDCD878 = (uint64_t)"metadataModificationDate";
      qword_1ECDCD880 = (uint64_t)CFSTR("kMDItemAttributeChangeDate");
      xmmword_1ECDCD8C8 = 0u;
      xmmword_1ECDCD8B8 = 0u;
      xmmword_1ECDCD8A8 = 0u;
      xmmword_1ECDCD898 = 0u;
      xmmword_1ECDCD888 = 0u;
      qword_1ECDCD8D8 = (uint64_t)"HTMLContentData";
      qword_1ECDCD8E0 = (uint64_t)CFSTR("kMDItemHTMLContentData");
      qword_1ECDCD8E8 = (uint64_t)"contentType";
      qword_1ECDCD8F0 = (uint64_t)CFSTR("kMDItemContentType");
      qword_1ECDCD8F8 = (uint64_t)"audioBitRate";
      qword_1ECDCD900 = (uint64_t)CFSTR("kMDItemAudioBitRate");
      qword_1ECDCD908 = (uint64_t)"photosSavingApplication";
      qword_1ECDCD910 = (uint64_t)CFSTR("kMDItemSavingApplication");
      xmmword_1ECDCD918 = 0u;
      qword_1ECDCD928 = (uint64_t)"contentTypeTree";
      qword_1ECDCD930 = (uint64_t)CFSTR("kMDItemContentTypeTree");
      qword_1ECDCD938 = (uint64_t)"orientation";
      qword_1ECDCD940 = (uint64_t)CFSTR("kMDItemOrientation");
      qword_1ECDCD948 = (uint64_t)"fNumber";
      qword_1ECDCD950 = (uint64_t)CFSTR("kMDItemFNumber");
      xmmword_1ECDCD958 = 0u;
      qword_1ECDCD968 = (uint64_t)"photosCurationScore";
      qword_1ECDCD970 = (uint64_t)CFSTR("kMDItemCurationScore");
      qword_1ECDCD998 = (uint64_t)"primaryRecipients";
      xmmword_1ECDCD988 = 0u;
      qword_1ECDCD9A0 = (uint64_t)CFSTR("kMDItemPrimaryRecipientPersons");
      qword_1ECDCD9B8 = (uint64_t)"audiences";
      qword_1ECDCD9C0 = (uint64_t)CFSTR("kMDItemAudiences");
      xmmword_1ECDCD978 = 0u;
      qword_1ECDCD9C8 = (uint64_t)"local";
      qword_1ECDCD9D0 = (uint64_t)CFSTR("kMDItemIsLocal");
      qword_1ECDCD9D8 = (uint64_t)"displayName";
      qword_1ECDCD9F8 = (uint64_t)"eventCarDropoffTimeZone";
      qword_1ECDCDA00 = (uint64_t)CFSTR("kMDItemEventCarDropoffTimeZone");
      xmmword_1ECDCD9A8 = 0u;
      qword_1ECDCDA08 = (uint64_t)"lensModel";
      qword_1ECDCDA10 = (uint64_t)CFSTR("kMDItemLensModel");
      qword_1ECDCDA58 = (uint64_t)"contentCreationDate";
      qword_1ECDCD9E0 = (uint64_t)CFSTR("kMDItemDisplayName");
      xmmword_1ECDCD9E8 = 0u;
      xmmword_1ECDCDA48 = 0u;
      xmmword_1ECDCDA38 = 0u;
      xmmword_1ECDCDA28 = 0u;
      qword_1ECDCDA60 = (uint64_t)CFSTR("kMDItemContentCreationDate");
      qword_1ECDCDA68 = (uint64_t)"postalCode";
      qword_1ECDCDA70 = (uint64_t)CFSTR("kMDItemPostalCode");
      qword_1ECDCDA78 = (uint64_t)"uniqueIdentifier";
      xmmword_1ECDCDA18 = 0u;
      qword_1ECDCDA80 = (uint64_t)CFSTR("_kMDItemExternalID");
      qword_1ECDCDA88 = (uint64_t)"thoroughfare";
      qword_1ECDCDA90 = (uint64_t)CFSTR("kMDItemThoroughfare");
      xmmword_1ECDCDAB8 = 0u;
      xmmword_1ECDCDAA8 = 0u;
      xmmword_1ECDCDA98 = 0u;
      qword_1ECDCDAC8 = (uint64_t)"domainIdentifier";
      qword_1ECDCDAD0 = (uint64_t)CFSTR("_kMDItemDomainIdentifier");
      xmmword_1ECDCDB18 = 0u;
      xmmword_1ECDCDB08 = 0u;
      xmmword_1ECDCDAF8 = 0u;
      xmmword_1ECDCDAE8 = 0u;
      xmmword_1ECDCDAD8 = 0u;
      qword_1ECDCDB28 = (uint64_t)"eventFlightStatus";
      qword_1ECDCDB30 = (uint64_t)CFSTR("kMDItemEventFlightStatus");
      xmmword_1ECDCDB78 = 0u;
      xmmword_1ECDCDB68 = 0u;
      xmmword_1ECDCDB58 = 0u;
      xmmword_1ECDCDB48 = 0u;
      xmmword_1ECDCDB38 = 0u;
      qword_1ECDCDB88 = (uint64_t)"curationScore";
      qword_1ECDCDB90 = (uint64_t)CFSTR("kMDItemCurationScore");
      qword_1ECDCDB98 = (uint64_t)"photosSavingApplicationBundleIdentifier";
      qword_1ECDCDBB8 = (uint64_t)"userCreated";
      qword_1ECDCDBC0 = (uint64_t)CFSTR("kMDItemUserCreated");
      qword_1ECDCDBC8 = (uint64_t)"eventFlightCarrierCode";
      qword_1ECDCDBD0 = (uint64_t)CFSTR("kMDItemEventFlightCarrierCode");
      qword_1ECDCDBD8 = (uint64_t)"supportsNavigation";
      qword_1ECDCDBA0 = (uint64_t)CFSTR("kMDItemSavingApplicationBundleIdentifier");
      qword_1ECDCDBE0 = (uint64_t)CFSTR("kMDItemSupportsNavigation");
      qword_1ECDCDC08 = (uint64_t)"hiddenAdditionalRecipients";
      qword_1ECDCDC10 = (uint64_t)CFSTR("kMDItemHiddenAdditionalRecipientPersons");
      xmmword_1ECDCDBA8 = 0u;
      qword_1ECDCDC18 = (uint64_t)"photosPeople";
      qword_1ECDCDC20 = (uint64_t)CFSTR("kMDItemPhotosPeople");
      qword_1ECDCDC28 = (uint64_t)"eventFlightDepartureTimeZone";
      qword_1ECDCDC30 = (uint64_t)CFSTR("kMDItemEventFlightDepartureTimeZone");
      qword_1ECDCDC58 = (uint64_t)"photosResultType";
      xmmword_1ECDCDBF8 = 0u;
      qword_1ECDCDC60 = (uint64_t)CFSTR("kMDItemPhotosResultType");
      qword_1ECDCDC68 = (uint64_t)"photosPeopleNames";
      qword_1ECDCDC70 = (uint64_t)CFSTR("kMDItemPhotosPeopleNames");
      xmmword_1ECDCDBE8 = 0u;
      qword_1ECDCDC78 = (uint64_t)"timeSignature";
      qword_1ECDCDC80 = (uint64_t)CFSTR("kMDItemTimeSignature");
      qword_1ECDCDC88 = (uint64_t)"photosBusinessNames";
      qword_1ECDCDC90 = (uint64_t)CFSTR("kMDItemPhotosBusinessNames");
      qword_1ECDCDC98 = (uint64_t)"attachmentNames";
      xmmword_1ECDCDC48 = 0u;
      qword_1ECDCDCA0 = (uint64_t)CFSTR("kMDAttachmentNames");
      qword_1ECDCDCA8 = (uint64_t)"photosPeopleAddresses";
      qword_1ECDCDCB0 = (uint64_t)CFSTR("kMDItemPhotosPeopleAddresses");
      xmmword_1ECDCDC38 = 0u;
      qword_1ECDCDCB8 = (uint64_t)"eventFlightNumber";
      qword_1ECDCDCC0 = (uint64_t)CFSTR("kMDItemEventFlightNumber");
      qword_1ECDCDCC8 = (uint64_t)"eventFlightCarrier";
      qword_1ECDCDCD0 = (uint64_t)CFSTR("kMDItemEventFlightCarrier");
      qword_1ECDCDCD8 = (uint64_t)"contentSources";
      qword_1ECDCDCE0 = (uint64_t)CFSTR("kMDItemWhereFroms");
      xmmword_1ECDCDCE8 = 0u;
      qword_1ECDCDCF8 = (uint64_t)"eventFlightArrivalTimeZone";
      qword_1ECDCDD00 = (uint64_t)CFSTR("kMDItemEventFlightArrivalTimeZone");
      xmmword_1ECDCDD18 = 0u;
      qword_1ECDCDD28 = (uint64_t)"photosBusinessCategories";
      qword_1ECDCDD30 = (uint64_t)CFSTR("kMDItemPhotosBusinessCategories");
      qword_1ECDCDD38 = (uint64_t)"eventFlightPassengerNames";
      qword_1ECDCDD40 = (uint64_t)CFSTR("kMDItemEventFlightPassengerNames");
      qword_1ECDCDD48 = (uint64_t)"eventFlightDesignator";
      xmmword_1ECDCDD08 = 0u;
      qword_1ECDCDD50 = (uint64_t)CFSTR("kMDItemEventFlightDesignator");
      xmmword_1ECDCDD78 = 0u;
      xmmword_1ECDCDD68 = 0u;
      xmmword_1ECDCDD58 = 0u;
      qword_1ECDCDD88 = (uint64_t)"eventGroupIdentifier";
      qword_1ECDCDD90 = (uint64_t)CFSTR("kMDItemEventGroupIdentifier");
      xmmword_1ECDCDD98 = 0u;
      qword_1ECDCDDA8 = (uint64_t)"photosDisplayName";
      qword_1ECDCDDB0 = (uint64_t)CFSTR("kMDItemDisplayName");
      qword_1ECDCDDB8 = (uint64_t)"isProResVideo";
      qword_1ECDCDDC0 = (uint64_t)CFSTR("kMDItemIsProResVideo");
      qword_1ECDCDDC8 = (uint64_t)"fileIdentifier";
      qword_1ECDCDDD0 = (uint64_t)CFSTR("kMDItemFileIdentifier");
      xmmword_1ECDCDDD8 = 0u;
      qword_1ECDCDDE8 = (uint64_t)"eventFlightDepartureAirportCode";
      qword_1ECDCDDF0 = (uint64_t)CFSTR("kMDItemEventFlightDepartureAirportCode");
      qword_1ECDCDDF8 = (uint64_t)"eventCarUnderName";
      qword_1ECDCDE00 = (uint64_t)CFSTR("kMDItemEventCarUnderName");
      xmmword_1ECDCDE08 = 0u;
      qword_1ECDCDE18 = (uint64_t)"securityMethod";
      qword_1ECDCDE20 = (uint64_t)CFSTR("kMDItemSecurityMethod");
      xmmword_1ECDCDE28 = 0u;
      qword_1ECDCDE38 = (uint64_t)"eventFlightDepartureAirportName";
      qword_1ECDCDE40 = (uint64_t)CFSTR("kMDItemEventFlightDepartureAirportName");
      xmmword_1ECDCDE48 = 0u;
      xmmword_1ECDCDE58 = 0u;
      qword_1ECDCDE68 = (uint64_t)"photosDuration";
      qword_1ECDCDE70 = (uint64_t)CFSTR("kMDItemDurationSeconds");
      xmmword_1ECDCDE78 = 0u;
      xmmword_1ECDCDE88 = 0u;
      xmmword_1ECDCDE98 = 0u;
      xmmword_1ECDCDEA8 = 0u;
      xmmword_1ECDCDEB8 = 0u;
      qword_1ECDCDEC8 = (uint64_t)"authorAddresses";
      qword_1ECDCDED0 = (uint64_t)CFSTR("kMDItemAuthorAddresses");
      xmmword_1ECDCDED8 = 0u;
      qword_1ECDCDEE8 = (uint64_t)"eventFlightDepartureAirportPostalCode";
      qword_1ECDCDEF0 = (uint64_t)CFSTR("kMDItemEventFlightDepartureAirportPostalCode");
      xmmword_1ECDCDF08 = 0u;
      xmmword_1ECDCDEF8 = 0u;
      qword_1ECDCDF18 = (uint64_t)"contentURL";
      qword_1ECDCDF20 = (uint64_t)CFSTR("kMDItemContentURL");
      xmmword_1ECDCDF38 = 0u;
      xmmword_1ECDCDF28 = 0u;
      qword_1ECDCDF48 = (uint64_t)"projects";
      qword_1ECDCDF50 = (uint64_t)CFSTR("kMDItemProjects");
      qword_1ECDCDF58 = (uint64_t)"aestheticScore";
      qword_1ECDCDF60 = (uint64_t)CFSTR("kMDItemAestheticScore");
      qword_1ECDCDF68 = (uint64_t)"likelyJunk";
      qword_1ECDCDF70 = (uint64_t)CFSTR("kMDItemIsLikelyJunk");
      qword_1ECDCDF78 = (uint64_t)"eventFlightDepartureAirportLongitude";
      qword_1ECDCDF80 = (uint64_t)CFSTR("kMDItemEventFlightDepartureAirportLongitude");
      qword_1ECDCDF88 = (uint64_t)"photosCollectionResultCount";
      qword_1ECDCDF90 = (uint64_t)CFSTR("kMDItemPhotosCollectionResultCount");
      xmmword_1ECDCDFD8 = 0u;
      xmmword_1ECDCDFC8 = 0u;
      xmmword_1ECDCDFB8 = 0u;
      xmmword_1ECDCDFA8 = 0u;
      xmmword_1ECDCDF98 = 0u;
      qword_1ECDCDFE8 = (uint64_t)"mailboxIdentifiers";
      qword_1ECDCDFF0 = (uint64_t)CFSTR("kMDItemMailboxes");
      xmmword_1ECDCE018 = 0u;
      xmmword_1ECDCE008 = 0u;
      xmmword_1ECDCDFF8 = 0u;
      qword_1ECDCE028 = (uint64_t)"photosScenes";
      qword_1ECDCE030 = (uint64_t)CFSTR("kMDItemPhotosScenes");
      qword_1ECDCE038 = (uint64_t)"duration";
      qword_1ECDCE040 = (uint64_t)CFSTR("kMDItemDurationSeconds");
      xmmword_1ECDCE048 = 0u;
      qword_1ECDCE058 = (uint64_t)"eventFlightDepartureAirportStreetAddress";
      qword_1ECDCE060 = (uint64_t)CFSTR("kMDItemEventFlightDepartureAirportStreetAddress");
      xmmword_1ECDCE078 = 0u;
      xmmword_1ECDCE068 = 0u;
      qword_1ECDCE088 = (uint64_t)"contentCreationDateYear";
      qword_1ECDCE090 = (uint64_t)CFSTR("_kMDItemContentCreationDateYear");
      qword_1ECDCE098 = (uint64_t)"xmpCredit";
      qword_1ECDCE0A0 = (uint64_t)CFSTR("kMDItemXMPCredit");
      qword_1ECDCE0A8 = (uint64_t)"eventFlightDepartureAirportLatitude";
      qword_1ECDCE0B0 = (uint64_t)CFSTR("kMDItemEventFlightDepartureAirportLatitude");
      xmmword_1ECDCE0B8 = 0u;
      qword_1ECDCE0C8 = (uint64_t)"photosSceneIdentifiers";
      qword_1ECDCE0D0 = (uint64_t)CFSTR("kMDItemPhotosSceneIdentifiers");
      qword_1ECDCE0D8 = (uint64_t)"lastMotionActivityState";
      xmmword_1ECDCEAC8 = 0u;
      qword_1ECDCEAE8 = (uint64_t)"eventRestaurantPartySize";
      qword_1ECDCEAF0 = (uint64_t)CFSTR("kMDItemEventRestaurantPartySize");
      xmmword_1ECDCEAF8 = 0u;
      qword_1ECDCEB08 = (uint64_t)"eventCarReservationForBrandName";
      qword_1ECDCEB10 = (uint64_t)CFSTR("kMDItemEventCarReservationForBrandName");
      xmmword_1ECDCEB28 = 0u;
      xmmword_1ECDCEB18 = 0u;
      qword_1ECDCEB38 = (uint64_t)"eventTicketTimeZone";
      qword_1ECDCEB40 = (uint64_t)CFSTR("kMDItemEventTicketTimeZone");
      qword_1ECDCEB48 = (uint64_t)"eventTicketUnderName";
      qword_1ECDCEB50 = (uint64_t)CFSTR("kMDItemEventTicketUnderName");
      qword_1ECDCEB58 = (uint64_t)"appEntityTypeRepresentationName";
      qword_1ECDCEB60 = (uint64_t)CFSTR("_kMDItemAppEntityTypeRepresentationName");
      qword_1ECDCEB68 = (uint64_t)"eventCarPickupTimeZone";
      qword_1ECDCEB70 = (uint64_t)CFSTR("kMDItemEventCarPickupTimeZone");
      qword_1ECDCEB78 = (uint64_t)"eventCarDropoffLocationAddressLocality";
      qword_1ECDCEB80 = (uint64_t)CFSTR("kMDItemEventCarDropoffLocationAddressLocality");
      qword_1ECDCEB88 = (uint64_t)"startDate";
      qword_1ECDCEB90 = (uint64_t)CFSTR("kMDItemStartDate");
      qword_1ECDCEB98 = (uint64_t)"cardDetailsActionURL";
      qword_1ECDCEBA0 = (uint64_t)CFSTR("kMDItemCardDetailsActionURL");
      xmmword_1ECDCEBA8 = 0u;
      qword_1ECDCEBB8 = (uint64_t)"subject";
      qword_1ECDCEBC0 = (uint64_t)CFSTR("kMDItemSubject");
      xmmword_1ECDCEBD8 = 0u;
      xmmword_1ECDCEBC8 = 0u;
      qword_1ECDCEBE8 = (uint64_t)"protectionClass";
      qword_1ECDCEBF0 = (uint64_t)CFSTR("_kMDItemProtectionClass");
      qword_1ECDCEBF8 = (uint64_t)"photosSceneAnalysisVersion";
      qword_1ECDCEC00 = (uint64_t)CFSTR("kMDItemPhotosSceneAnalysisVersion");
      xmmword_1ECDCEC08 = 0u;
      qword_1ECDCEC18 = (uint64_t)"eventRestaurantMealType";
      qword_1ECDCEC20 = (uint64_t)CFSTR("kMDItemEventRestaurantMealType");
      xmmword_1ECDCEC38 = 0u;
      xmmword_1ECDCEC28 = 0u;
      qword_1ECDCEC48 = (uint64_t)"allDay";
      qword_1ECDCEC50 = (uint64_t)CFSTR("kMDItemIsAllDay");
      qword_1ECDCEC58 = (uint64_t)"eventCarDropoffLocationTelephone";
      qword_1ECDCEC60 = (uint64_t)CFSTR("kMDItemEventCarDropoffLocationTelephone");
      xmmword_1ECDCEC68 = 0u;
      qword_1ECDCEC78 = (uint64_t)"eventFlightArrivalAirportName";
      qword_1ECDCEC80 = (uint64_t)CFSTR("kMDItemEventFlightArrivalAirportName");
      qword_1ECDCEC88 = (uint64_t)"ratingDescription";
      qword_1ECDCEC90 = (uint64_t)CFSTR("kMDItemRatingDescription");
      qword_1ECDCEC98 = (uint64_t)"eventCarPickupLocationName";
      qword_1ECDCECA0 = (uint64_t)CFSTR("kMDItemEventCarPickupLocationName");
      qword_1ECDCECA8 = (uint64_t)"eventRestaurantReservationForStreetAddress";
      qword_1ECDCECB0 = (uint64_t)CFSTR("kMDItemEventRestaurantReservationForStreetAddress");
      xmmword_1ECDCECB8 = 0u;
      qword_1ECDCECC8 = (uint64_t)"originalSource";
      qword_1ECDCECD0 = (uint64_t)CFSTR("kMDItemOriginalSource");
      qword_1ECDCECD8 = (uint64_t)"appleLoopDescriptors";
      qword_1ECDCECE0 = (uint64_t)CFSTR("kMDItemAppleLoopDescriptors");
      qword_1ECDCECE8 = (uint64_t)"photosContentCreationDateMonths";
      qword_1ECDCECF0 = (uint64_t)CFSTR("kMDItemPhotosContentCreationDateMonths");
      xmmword_1ECDCED18 = 0u;
      xmmword_1ECDCED08 = 0u;
      xmmword_1ECDCECF8 = 0u;
      qword_1ECDCED28 = (uint64_t)"layerNames";
      qword_1ECDCED30 = (uint64_t)CFSTR("kMDItemLayerNames");
      qword_1ECDCED38 = (uint64_t)"eventCarPickupLocationTelephone";
      qword_1ECDCED40 = (uint64_t)CFSTR("kMDItemEventCarPickupLocationTelephone");
      qword_1ECDCED48 = (uint64_t)"eventCarDropoffLocationName";
      qword_1ECDCED50 = (uint64_t)CFSTR("kMDItemEventCarDropoffLocationName");
      xmmword_1ECDCED58 = 0u;
      qword_1ECDCED68 = (uint64_t)"GPSProcessingMethod";
      qword_1ECDCED70 = (uint64_t)CFSTR("kMDItemGPSProcessingMethod");
      xmmword_1ECDCEDA8 = 0u;
      xmmword_1ECDCED98 = 0u;
      xmmword_1ECDCED88 = 0u;
      xmmword_1ECDCED78 = 0u;
      qword_1ECDCEDB8 = (uint64_t)"pixelHeight";
      qword_1ECDCEDC0 = (uint64_t)CFSTR("kMDItemPixelHeight");
      xmmword_1ECDCEDC8 = 0u;
      qword_1ECDCEDD8 = (uint64_t)"accountType";
      qword_1ECDCEDE0 = (uint64_t)CFSTR("kMDItemAccountType");
      xmmword_1ECDCEDF8 = 0u;
      xmmword_1ECDCEDE8 = 0u;
      qword_1ECDCEE08 = (uint64_t)"appEntityInstanceId";
      qword_1ECDCEE10 = (uint64_t)CFSTR("_kMDItemAppEntityInstanceIdentifier");
      qword_1ECDCEE18 = (uint64_t)"album";
      qword_1ECDCEE20 = (uint64_t)CFSTR("kMDItemAlbum");
      qword_1ECDCEE28 = (uint64_t)"eventFlightCheckInUrl";
      qword_1ECDCEE30 = (uint64_t)CFSTR("kMDItemEventFlightCheckInUrl");
      qword_1ECDCEE38 = (uint64_t)"thumbnailURL";
      qword_1ECDCEE40 = (uint64_t)CFSTR("kMDItemThumbnailURL");
      xmmword_1ECDCEE48 = 0u;
      qword_1ECDCEE58 = (uint64_t)"eventCarPickupLocationAddress";
      qword_1ECDCEE60 = (uint64_t)CFSTR("kMDItemEventCarPickupLocationAddress");
      qword_1ECDCEE68 = (uint64_t)"meteringMode";
      qword_1ECDCEE70 = (uint64_t)CFSTR("kMDItemMeteringMode");
      xmmword_1ECDCEE98 = 0u;
      xmmword_1ECDCEE88 = 0u;
      xmmword_1ECDCEE78 = 0u;
      qword_1ECDCEEA8 = (uint64_t)"photosSavedFromAppBundleIdentifier";
      qword_1ECDCEEB0 = (uint64_t)CFSTR("kMDItemPhotosSavedFromAppBundleIdentifier");
      qword_1ECDCEEB8 = (uint64_t)"hasAlphaChannel";
      qword_1ECDCEEC0 = (uint64_t)CFSTR("kMDItemHasAlphaChannel");
      qword_1ECDCEEC8 = (uint64_t)"eventCarReservationId";
      qword_1ECDCEED0 = (uint64_t)CFSTR("kMDItemEventCarReservationId");
      xmmword_1ECDCEEE8 = 0u;
      xmmword_1ECDCEED8 = 0u;
      qword_1ECDCEEF8 = (uint64_t)"eventCarPickupLocationAddressPostalCode";
      qword_1ECDCEF00 = (uint64_t)CFSTR("kMDItemEventCarPickupLocationAddressPostalCode");
      qword_1ECDCEF08 = (uint64_t)"photosContentCreationDateMonth";
      qword_1ECDCEF10 = (uint64_t)CFSTR("kMDItemPhotosContentCreationDateMonth");
      xmmword_1ECDCEF18 = 0u;
      qword_1ECDCEF28 = (uint64_t)"documentUnderstandingTopics";
      qword_1ECDCEF30 = (uint64_t)CFSTR("kMDItemDocumentUnderstandingTopics");
      qword_1ECDCEF38 = (uint64_t)"eventFlightArrivalAirportInternationalNames";
      qword_1ECDCEF40 = (uint64_t)CFSTR("kMDItemEventFlightArrivalAirportInternationalNames");
      qword_1ECDCEF48 = (uint64_t)"GPSStatus";
      qword_1ECDCEF50 = (uint64_t)CFSTR("kMDItemGPSStatus");
      xmmword_1ECDCEF58 = 0u;
      qword_1ECDCEF68 = (uint64_t)"information";
      qword_1ECDCEF70 = (uint64_t)CFSTR("kMDItemInformation");
      xmmword_1ECDCEF78 = 0u;
      qword_1ECDCEF88 = (uint64_t)"phoneProvider";
      qword_1ECDCEF90 = (uint64_t)CFSTR("com_apple_mobilephone_provider");
      xmmword_1ECDCEFF8 = 0u;
      xmmword_1ECDCEFE8 = 0u;
      xmmword_1ECDCEFD8 = 0u;
      xmmword_1ECDCEFC8 = 0u;
      xmmword_1ECDCEFB8 = 0u;
      xmmword_1ECDCEFA8 = 0u;
      xmmword_1ECDCEF98 = 0u;
      qword_1ECDCF008 = (uint64_t)"eventFlightArrivalAirportRegion";
      qword_1ECDCF010 = (uint64_t)CFSTR("kMDItemEventFlightArrivalAirportRegion");
      qword_1ECDCF038 = (uint64_t)"contentSnippet";
      qword_1ECDCF040 = (uint64_t)CFSTR("_kMDItemSnippet");
      qword_1ECDCF048 = (uint64_t)"streamable";
      qword_1ECDCF050 = (uint64_t)CFSTR("kMDItemStreamable");
      qword_1ECDCF068 = (uint64_t)"phoneNumbers";
      qword_1ECDCF070 = (uint64_t)CFSTR("kMDItemPhoneNumbers");
      qword_1ECDCF078 = (uint64_t)"phoneCallType";
      qword_1ECDCF080 = (uint64_t)CFSTR("com_apple_mobilephone_callType");
      qword_1ECDCF088 = (uint64_t)"downloadedDate";
      qword_1ECDCF090 = (uint64_t)CFSTR("kMDItemDownloadedDate");
      qword_1ECDCF0B8 = (uint64_t)"eventCarPickupLocationAddressStreetAddress";
      qword_1ECDCF0C0 = (uint64_t)CFSTR("kMDItemEventCarPickupLocationAddressStreetAddress");
      qword_1ECDCF0D8 = (uint64_t)"deletedWithRelatedUniqueIdentifier";
      qword_1ECDCF0E0 = (uint64_t)CFSTR("_MDItemDeletedWithRelatedUniqueIdentifier");
      qword_1ECDCF0F8 = (uint64_t)"audioTrackNumber";
      qword_1ECDCF100 = (uint64_t)CFSTR("kMDItemAudioTrackNumber");
      qword_1ECDCF118 = (uint64_t)"eventRestaurantReservationId";
      qword_1ECDCF120 = (uint64_t)CFSTR("kMDItemEventRestaurantReservationId");
      qword_1ECDCF128 = (uint64_t)"rankingHint";
      qword_1ECDCF130 = (uint64_t)CFSTR("kMDItemRankingHint");
      qword_1ECDCF158 = (uint64_t)"whiteBalance";
      qword_1ECDCF160 = (uint64_t)CFSTR("kMDItemWhiteBalance");
      qword_1ECDCF168 = (uint64_t)"documentUnderstandingTopicsConfidences";
      qword_1ECDCF170 = (uint64_t)CFSTR("kMDItemDocumentUnderstandingTopicsConfidences");
      qword_1ECDCF178 = (uint64_t)"photosPeoplePhoneNumbers";
      qword_1ECDCF180 = (uint64_t)CFSTR("kMDItemPhotosPeoplePhoneNumbers");
      qword_1ECDCF198 = (uint64_t)"darkThumbnailURL";
      qword_1ECDCF1A0 = (uint64_t)CFSTR("kMDItemDarkThumbnailURL");
      qword_1ECDCF1B8 = (uint64_t)"eventMovieTimeZone";
      qword_1ECDCF1C0 = (uint64_t)CFSTR("kMDItemEventMovieTimeZone");
      qword_1ECDCF1C8 = (uint64_t)"addedDate";
      qword_1ECDCF1D0 = (uint64_t)CFSTR("kMDItemDateAdded");
      qword_1ECDCF1F8 = (uint64_t)"eventFlightArrivalAirportAddress";
      qword_1ECDCF200 = (uint64_t)CFSTR("kMDItemEventFlightArrivalAirportAddress");
      qword_1ECDCF208 = (uint64_t)"instantMessageAddresses";
      qword_1ECDCF210 = (uint64_t)CFSTR("kMDItemInstantMessageAddresses");
      qword_1ECDCF228 = (uint64_t)"eventFlightBookingInfoUrl";
      qword_1ECDCF230 = (uint64_t)CFSTR("kMDItemEventFlightBookingInfoUrl");
      qword_1ECDCF258 = (uint64_t)"eventFlightDepartureTerminal";
      qword_1ECDCF260 = (uint64_t)CFSTR("kMDItemEventFlightDepartureTerminal");
      qword_1ECDCF268 = (uint64_t)"cachedViewData";
      qword_1ECDCF270 = (uint64_t)CFSTR("MDItemCachedViewData");
      qword_1ECDCF278 = (uint64_t)"eventFlightArrivalAirportAddressSynonyms";
      qword_1ECDCF280 = (uint64_t)CFSTR("kMDItemEventFlightArrivalAirportAddressSynonyms");
      qword_1ECDCF2E8 = (uint64_t)"eventSourceIsForwarded";
      qword_1ECDCF2F0 = (uint64_t)CFSTR("kMDItemEventSourceIsForwarded");
      qword_1ECDCF328 = (uint64_t)"eventRestaurantReservationForAddress";
      qword_1ECDCF330 = (uint64_t)CFSTR("kMDItemEventRestaurantReservationForAddress");
      qword_1ECDCF358 = (uint64_t)"timestamp";
      qword_1ECDCF360 = (uint64_t)CFSTR("kMDItemTimestamp");
      qword_1ECDCF388 = (uint64_t)"participants";
      qword_1ECDCF390 = (uint64_t)CFSTR("kMDItemParticipants");
      qword_1ECDCF3A8 = (uint64_t)"eventRestaurantReservationForAddressSynonyms";
      qword_1ECDCF3B0 = (uint64_t)CFSTR("kMDItemEventRestaurantReservationForAddressSynonyms");
      qword_1ECDCF3B8 = (uint64_t)"photosPeopleContactIdentifiers";
      qword_1ECDCF3C0 = (uint64_t)CFSTR("kMDItemPhotosPeopleContactIdentifiers");
      qword_1ECDCF3C8 = (uint64_t)"eventRestaurantReservationForAddressPostalCode";
      qword_1ECDCF3D0 = (uint64_t)CFSTR("kMDItemEventRestaurantReservationForAddressPostalCode");
      qword_1ECDCF3D8 = (uint64_t)"exposureMode";
      qword_1ECDCF3E0 = (uint64_t)CFSTR("kMDItemExposureMode");
      qword_1ECDCF418 = (uint64_t)"eventHotelTimeZone";
      qword_1ECDCF420 = (uint64_t)CFSTR("kMDItemEventHotelTimeZone");
      qword_1ECDCF448 = (uint64_t)"contentCreationDateWeekOfYear";
      qword_1ECDCF450 = (uint64_t)CFSTR("_kMDItemContentCreationDateWeekOfYear");
      qword_1ECDCF458 = (uint64_t)"musicalInstrumentCategory";
      qword_1ECDCF460 = (uint64_t)CFSTR("kMDItemMusicalInstrumentCategory");
      qword_1ECDCF4D8 = (uint64_t)"eventMovieReservationForName";
      qword_1ECDCF4E0 = (uint64_t)CFSTR("kMDItemEventMovieReservationForName");
      qword_1ECDCF4F8 = (uint64_t)"GPSDestLatitude";
      qword_1ECDCF500 = (uint64_t)CFSTR("kMDItemGPSDestLatitude");
      qword_1ECDCF538 = (uint64_t)"eventTicketReservationId";
      qword_1ECDCF540 = (uint64_t)CFSTR("kMDItemEventTicketReservationId");
      qword_1ECDCF578 = (uint64_t)"eventFallbackGroupIdentifier";
      qword_1ECDCF580 = (uint64_t)CFSTR("kMDItemEventFallbackGroupIdentifier");
      qword_1ECDCF598 = (uint64_t)"donatedEventDepartureAirportCode";
      qword_1ECDCF5A0 = (uint64_t)CFSTR("kMDItemDonatedEventDepartureAirportCode");
      qword_1ECDCF5B8 = (uint64_t)"donatedEventFlightNumber";
      qword_1ECDCF5C0 = (uint64_t)CFSTR("kMDItemDonatedEventFlightNumber");
      qword_1ECDCF5C8 = (uint64_t)"namedLocation";
      qword_1ECDCF5D0 = (uint64_t)CFSTR("kMDItemNamedLocation");
      qword_1ECDCF5D8 = (uint64_t)"eventFlightConfirmationNumber";
      qword_1ECDCF5E0 = (uint64_t)CFSTR("kMDItemEventFlightConfirmationNumber");
      qword_1ECDCF5E8 = (uint64_t)"focalLength35mm";
      qword_1ECDCF5F0 = (uint64_t)CFSTR("kMDItemFocalLength35mm");
      qword_1ECDCF608 = (uint64_t)"eventCarReservationForModel";
      qword_1ECDCF610 = (uint64_t)CFSTR("kMDItemEventCarReservationForModel");
      qword_1ECDCF628 = (uint64_t)"documentUnderstandingTopicsVersion";
      qword_1ECDCF630 = (uint64_t)CFSTR("kMDItemDocumentUnderstandingTopicsVersion");
      qword_1ECDCF638 = (uint64_t)"audioSampleRate";
      qword_1ECDCF640 = (uint64_t)CFSTR("kMDItemAudioSampleRate");
      qword_1ECDCF678 = (uint64_t)"photosSharedLibraryContributorsContactIdentifiers";
      qword_1ECDCF680 = (uint64_t)CFSTR("kMDItemPhotosSharedLibraryContributorsContactIdentifiers");
      qword_1ECDCF990 = (uint64_t)CFSTR("kMDItemGPSAreaInformation");
      xmmword_1ECDCF028 = 0u;
      qword_1ECDCF9F8 = (uint64_t)"donatedEventDepartureAirportName";
      qword_1ECDCFA00 = (uint64_t)CFSTR("kMDItemDonatedEventDepartureAirportName");
      qword_1ECDCFAD0 = (uint64_t)CFSTR("kMDItemPhotosSharedLibraryContributorsNamesAlternatives");
      qword_1ECDCFAD8 = (uint64_t)"contentCreationDateMonth";
      qword_1ECDCFB08 = (uint64_t)"accountIdentifier";
      xmmword_1ECDCF018 = 0u;
      qword_1ECDCFC48 = (uint64_t)"thumbnailBundleID";
      qword_1ECDCFC50 = (uint64_t)CFSTR("MDItemThumbnailBundleID");
      qword_1ECDCFC58 = (uint64_t)"eventMovieReservationId";
      qword_1ECDCFCB8 = (uint64_t)"eventMovieReservationForLocationAddress";
      qword_1ECDCFD00 = (uint64_t)CFSTR("kMDItemEventRestaurantReservationForAddressCountry");
      qword_1ECDCFD08 = (uint64_t)"eventRestaurantReservationForAddressLocality";
      qword_1ECDCFD28 = (uint64_t)"musicalInstrumentName";
      qword_1ECDCFD48 = (uint64_t)"appleLoopsLoopMode";
      qword_1ECDCFD78 = (uint64_t)"documentUnderstandingCategoriesVersion";
      qword_1ECDCFDF8 = (uint64_t)"GPSDifferental";
      qword_1ECDCFE18 = (uint64_t)"eventFlightArrivalTerminal";
      qword_1ECDCFE38 = (uint64_t)"photosCollectionKeyAssetUUID";
      qword_1ECDCFE58 = (uint64_t)"documentUnderstandingTopicsSynonyms";
      xmmword_1ECDCF058 = 0u;
      qword_1ECDCFE90 = (uint64_t)CFSTR("kMDItemEncodingApplications");
      qword_1ECDCFEF8 = (uint64_t)"savingApplication";
      qword_1ECDCFF00 = (uint64_t)CFSTR("kMDItemSavingApplication");
      qword_1ECDCFF20 = (uint64_t)CFSTR("kMDItemEventTicketReservationForLocationName");
      qword_1ECDCFF28 = (uint64_t)"eventRestaurantReservationForName";
      qword_1ECDD0058 = (uint64_t)"eventFlightArrivalAirportCountry";
      qword_1ECDD0088 = (uint64_t)"exposureProgram";
      xmmword_1ECDCF0A8 = 0u;
      qword_1ECDD00F8 = (uint64_t)"rating";
      qword_1ECDD0100 = (uint64_t)CFSTR("kMDItemStarRating");
      qword_1ECDD01A8 = (uint64_t)"photosSceneClassificationBoundingBoxes";
      xmmword_1ECDD0218 = 0u;
      qword_1ECDD0238 = (uint64_t)"appleLoopsRootKey";
      qword_1ECDD0268 = (uint64_t)"eventMovieReservationForLocationAddressRegion";
      xmmword_1ECDCF098 = 0u;
      qword_1ECDD0288 = (uint64_t)"contentCreationDateDay";
      qword_1ECDD02C0 = (uint64_t)CFSTR("kMDItemEventMovieReservedTicketNumber");
      qword_1ECDD03E8 = (uint64_t)"payBalanceActionURL";
      qword_1ECDD03F0 = (uint64_t)CFSTR("kMDItemPayBalanceActionURL");
      qword_1ECDD04E8 = (uint64_t)"eventFlightArrivalAirportPostalCode";
      xmmword_1ECDCF0C8 = 0u;
      qword_1ECDD04F0 = (uint64_t)CFSTR("kMDItemEventFlightArrivalAirportPostalCode");
      qword_1ECDD04F8 = (uint64_t)"eventTicketReservationForLocationAddressRegion";
      qword_1ECDD0528 = (uint64_t)"imageDirection";
      qword_1ECDD0630 = (uint64_t)CFSTR("kMDItemEventMessageIdentifier");
      qword_1ECDD0638 = (uint64_t)"photosSceneClassificationConfidences";
      qword_1ECDD0658 = (uint64_t)"donatedEventArrivalAirportCode";
      qword_1ECDD0688 = (uint64_t)"eventMovieReservationForLocationAddressCountry";
      qword_1ECDD06E8 = (uint64_t)"existingThread";
      qword_1ECDD08C8 = (uint64_t)"eventTicketReservedTicketSeatRow";
      qword_1ECDD0978 = (uint64_t)"lastAppSearchEngagementQuery";
      qword_1ECDD09E8 = (uint64_t)"eventMovieReservedTicketSeatSection";
      xmmword_1ECDCF0E8 = 0u;
      qword_1ECDD0C88 = (uint64_t)"eventHotelReservationForAddressSynonyms";
      qword_1ECDD0C90 = (uint64_t)CFSTR("kMDItemEventHotelReservationForAddressSynonyms");
      qword_1ECDD0D78 = (uint64_t)"eventCarPickupLocationAddressLocality";
      xmmword_1ECDD0E88 = 0u;
      xmmword_1ECDCF108 = 0u;
      xmmword_1ECDD0E48 = 0u;
      xmmword_1ECDD0E58 = 0u;
      xmmword_1ECDD0E68 = 0u;
      xmmword_1ECDD0E78 = 0u;
      qword_1ECDD0E10 = (uint64_t)CFSTR("kMDItemAdamID");
      xmmword_1ECDD0E18 = 0u;
      xmmword_1ECDD0E28 = 0u;
      xmmword_1ECDD0E38 = 0u;
      qword_1ECDD0E08 = (uint64_t)"adamID";
      xmmword_1ECDD0DD8 = 0u;
      xmmword_1ECDD0DE8 = 0u;
      xmmword_1ECDD0DF8 = 0u;
      qword_1ECDD0D98 = (uint64_t)"GPSMeasureMode";
      xmmword_1ECDD0DA8 = 0u;
      xmmword_1ECDD0DB8 = 0u;
      xmmword_1ECDD0DC8 = 0u;
      xmmword_1ECDCF148 = 0u;
      qword_1ECDD0DA0 = (uint64_t)CFSTR("kMDItemGPSMeasureMode");
      xmmword_1ECDD0D88 = 0u;
      qword_1ECDD0D80 = (uint64_t)CFSTR("kMDItemEventCarPickupLocationAddressLocality");
      xmmword_1ECDD0D58 = 0u;
      xmmword_1ECDD0D68 = 0u;
      qword_1ECDD0CD8 = (uint64_t)"lastAppSearchEngagementRenderPosition";
      xmmword_1ECDD0D28 = 0u;
      xmmword_1ECDD0D38 = 0u;
      xmmword_1ECDD0D48 = 0u;
      qword_1ECDD0CE0 = (uint64_t)CFSTR("kMDItemLastAppSearchEngagementRenderPosition");
      xmmword_1ECDD0D08 = 0u;
      xmmword_1ECDD0D18 = 0u;
      qword_1ECDD0CE8 = (uint64_t)"contentModificationDate";
      qword_1ECDD0CF0 = (uint64_t)CFSTR("kMDItemContentModificationDate");
      xmmword_1ECDD0CF8 = 0u;
      xmmword_1ECDD0C98 = 0u;
      xmmword_1ECDD0CA8 = 0u;
      xmmword_1ECDD0CB8 = 0u;
      xmmword_1ECDD0CC8 = 0u;
      xmmword_1ECDD0B58 = 0u;
      xmmword_1ECDD0B48 = 0u;
      xmmword_1ECDD0B38 = 0u;
      xmmword_1ECDD0B28 = 0u;
      xmmword_1ECDD0B18 = 0u;
      xmmword_1ECDD0B08 = 0u;
      xmmword_1ECDCF138 = 0u;
      xmmword_1ECDD0BA8 = 0u;
      xmmword_1ECDD0B98 = 0u;
      xmmword_1ECDD0B88 = 0u;
      xmmword_1ECDD0B78 = 0u;
      xmmword_1ECDD0B68 = 0u;
      qword_1ECDD0AF8 = (uint64_t)"audioEncodingApplication";
      xmmword_1ECDD0BF8 = 0u;
      xmmword_1ECDD0BE8 = 0u;
      xmmword_1ECDD0BD8 = 0u;
      xmmword_1ECDD0BC8 = 0u;
      xmmword_1ECDD0BB8 = 0u;
      xmmword_1ECDD0C38 = 0u;
      xmmword_1ECDD0C28 = 0u;
      xmmword_1ECDD0C18 = 0u;
      xmmword_1ECDD0C08 = 0u;
      qword_1ECDD0B00 = (uint64_t)CFSTR("kMDItemAudioEncodingApplication");
      xmmword_1ECDD0C78 = 0u;
      xmmword_1ECDD0C68 = 0u;
      xmmword_1ECDD0C58 = 0u;
      xmmword_1ECDD0C48 = 0u;
      xmmword_1ECDD0A68 = 0u;
      xmmword_1ECDD0A58 = 0u;
      xmmword_1ECDD0A48 = 0u;
      xmmword_1ECDD0A38 = 0u;
      xmmword_1ECDCF188 = 0u;
      xmmword_1ECDD0AA8 = 0u;
      xmmword_1ECDD0A98 = 0u;
      xmmword_1ECDD0A88 = 0u;
      xmmword_1ECDD0A78 = 0u;
      qword_1ECDD09F0 = (uint64_t)CFSTR("kMDItemEventMovieReservedTicketSeatSection");
      xmmword_1ECDD0AD8 = 0u;
      xmmword_1ECDD0AC8 = 0u;
      xmmword_1ECDD0AB8 = 0u;
      xmmword_1ECDCF1A8 = 0u;
      qword_1ECDD0A30 = (uint64_t)CFSTR("kMDItemCardNumberActionURL");
      xmmword_1ECDD0AE8 = 0u;
      qword_1ECDD0A10 = (uint64_t)CFSTR("kMDItemAccountHandles");
      xmmword_1ECDD0A18 = 0u;
      qword_1ECDD0A28 = (uint64_t)"cardNumberActionURL";
      qword_1ECDD0A08 = (uint64_t)"accountHandles";
      xmmword_1ECDD09F8 = 0u;
      qword_1ECDD09A8 = (uint64_t)"eventMegadomeIdentifier";
      xmmword_1ECDD09D8 = 0u;
      xmmword_1ECDD09C8 = 0u;
      xmmword_1ECDD09B8 = 0u;
      xmmword_1ECDCF1E8 = 0u;
      qword_1ECDD09B0 = (uint64_t)CFSTR("kMDItemEventMegadomeIdentifier");
      xmmword_1ECDD0988 = 0u;
      qword_1ECDD0980 = (uint64_t)CFSTR("kMDItemLastAppSearchEngagementQuery");
      xmmword_1ECDD0938 = 0u;
      xmmword_1ECDD0998 = 0u;
      xmmword_1ECDCF1D8 = 0u;
      qword_1ECDD0918 = (uint64_t)"eventTicketReservationForLocationAddressCountry";
      xmmword_1ECDD0958 = 0u;
      xmmword_1ECDD0948 = 0u;
      qword_1ECDD0930 = (uint64_t)CFSTR("kMDItemEventTicketReservationForLocationAddressLocality");
      xmmword_1ECDD0968 = 0u;
      qword_1ECDD0920 = (uint64_t)CFSTR("kMDItemEventTicketReservationForLocationAddressCountry");
      qword_1ECDD0928 = (uint64_t)"eventTicketReservationForLocationAddressLocality";
      qword_1ECDD08D0 = (uint64_t)CFSTR("kMDItemEventTicketReservedTicketSeatRow");
      xmmword_1ECDD08F8 = 0u;
      xmmword_1ECDD08E8 = 0u;
      qword_1ECDD08D8 = (uint64_t)"xmpDigitalSourceType";
      qword_1ECDD08E0 = (uint64_t)CFSTR("kMDItemXMPDigitalSourceType");
      xmmword_1ECDD0908 = 0u;
      xmmword_1ECDD0888 = 0u;
      xmmword_1ECDD0878 = 0u;
      xmmword_1ECDD0868 = 0u;
      qword_1ECDD0860 = (uint64_t)CFSTR("kMDItemDocumentUnderstandingCategoriesLabels");
      xmmword_1ECDD08B8 = 0u;
      xmmword_1ECDD08A8 = 0u;
      xmmword_1ECDD0898 = 0u;
      qword_1ECDD0858 = (uint64_t)"documentUnderstandingCategoriesLabels";
      xmmword_1ECDD0818 = 0u;
      xmmword_1ECDD0808 = 0u;
      xmmword_1ECDD07F8 = 0u;
      xmmword_1ECDD0768 = 0u;
      qword_1ECDD07F0 = (uint64_t)CFSTR("kMDItemDescription");
      xmmword_1ECDD0848 = 0u;
      xmmword_1ECDD0838 = 0u;
      xmmword_1ECDD0828 = 0u;
      xmmword_1ECDD0758 = 0u;
      xmmword_1ECDD0748 = 0u;
      xmmword_1ECDD0738 = 0u;
      qword_1ECDD07E8 = (uint64_t)"contentDescription";
      xmmword_1ECDD07A8 = 0u;
      xmmword_1ECDD0798 = 0u;
      xmmword_1ECDD0788 = 0u;
      xmmword_1ECDD0778 = 0u;
      qword_1ECDD0728 = (uint64_t)"photosSceneClassificationLabels";
      xmmword_1ECDD07D8 = 0u;
      xmmword_1ECDD07C8 = 0u;
      xmmword_1ECDD07B8 = 0u;
      xmmword_1ECDCF218 = 0u;
      qword_1ECDD0730 = (uint64_t)CFSTR("kMDItemPhotosSceneClassificationLabels");
      xmmword_1ECDD06F8 = 0u;
      qword_1ECDD06F0 = (uint64_t)CFSTR("kMDItemIsExistingThread");
      xmmword_1ECDD0718 = 0u;
      xmmword_1ECDD0708 = 0u;
      qword_1ECDD0698 = (uint64_t)"eventMovieReservationForLocationAddressLocality";
      xmmword_1ECDD06C8 = 0u;
      xmmword_1ECDD06B8 = 0u;
      xmmword_1ECDD06A8 = 0u;
      xmmword_1ECDCF248 = 0u;
      qword_1ECDD06A0 = (uint64_t)CFSTR("kMDItemEventMovieReservationForLocationAddressLocality");
      xmmword_1ECDD06D8 = 0u;
      xmmword_1ECDCF238 = 0u;
      qword_1ECDD0690 = (uint64_t)CFSTR("kMDItemEventMovieReservationForLocationAddressCountry");
      xmmword_1ECDD0668 = 0u;
      xmmword_1ECDCF2D8 = 0u;
      qword_1ECDD0660 = (uint64_t)CFSTR("kMDItemDonatedEventArrivalAirportCode");
      xmmword_1ECDD0678 = 0u;
      xmmword_1ECDCF2C8 = 0u;
      qword_1ECDD0640 = (uint64_t)CFSTR("kMDItemPhotosSceneClassificationConfidences");
      xmmword_1ECDD0648 = 0u;
      qword_1ECDD0628 = (uint64_t)"eventMessageIdentifier";
      xmmword_1ECDD05E8 = 0u;
      xmmword_1ECDD05D8 = 0u;
      xmmword_1ECDD05C8 = 0u;
      qword_1ECDD05B8 = (uint64_t)"photosSharedLibraryContributorsPersonIdentifiers";
      xmmword_1ECDD0618 = 0u;
      xmmword_1ECDD0608 = 0u;
      xmmword_1ECDD05F8 = 0u;
      qword_1ECDD05C0 = (uint64_t)CFSTR("kMDItemPhotosSharedLibraryContributorsPersonIdentifiers");
      xmmword_1ECDD0568 = 0u;
      xmmword_1ECDD0558 = 0u;
      qword_1ECDD0548 = (uint64_t)"eventHotelProvider";
      xmmword_1ECDD0598 = 0u;
      xmmword_1ECDD0588 = 0u;
      xmmword_1ECDD0578 = 0u;
      xmmword_1ECDCF2B8 = 0u;
      qword_1ECDD0550 = (uint64_t)CFSTR("kMDItemEventHotelProvider");
      xmmword_1ECDD05A8 = 0u;
      xmmword_1ECDCF2A8 = 0u;
      qword_1ECDD0530 = (uint64_t)CFSTR("kMDItemImageDirection");
      xmmword_1ECDD0538 = 0u;
      xmmword_1ECDCF298 = 0u;
      qword_1ECDD0510 = (uint64_t)CFSTR("kMDItemResolutionHeightDPI");
      xmmword_1ECDD0518 = 0u;
      xmmword_1ECDCF288 = 0u;
      qword_1ECDD0500 = (uint64_t)CFSTR("kMDItemEventTicketReservationForLocationAddressRegion");
      qword_1ECDD0508 = (uint64_t)"resolutionHeightDPI";
      xmmword_1ECDD0428 = 0u;
      xmmword_1ECDD0418 = 0u;
      xmmword_1ECDD04D8 = 0u;
      xmmword_1ECDD04C8 = 0u;
      xmmword_1ECDD0408 = 0u;
      qword_1ECDD04B8 = (uint64_t)"documentUnderstandingCategoriesSynonyms";
      qword_1ECDD04C0 = (uint64_t)CFSTR("kMDItemDocumentUnderstandingCategoriesSynonyms");
      xmmword_1ECDD0468 = 0u;
      xmmword_1ECDD0458 = 0u;
      xmmword_1ECDD0448 = 0u;
      xmmword_1ECDD0438 = 0u;
      qword_1ECDD03F8 = (uint64_t)"GPSDestDistance";
      xmmword_1ECDD0498 = 0u;
      xmmword_1ECDD0488 = 0u;
      xmmword_1ECDD0478 = 0u;
      qword_1ECDD0400 = (uint64_t)CFSTR("kMDItemGPSDestDistance");
      xmmword_1ECDD0328 = 0u;
      xmmword_1ECDD04A8 = 0u;
      xmmword_1ECDCF318 = 0u;
      xmmword_1ECDD0378 = 0u;
      xmmword_1ECDD0368 = 0u;
      xmmword_1ECDD0358 = 0u;
      xmmword_1ECDD0348 = 0u;
      xmmword_1ECDD0338 = 0u;
      xmmword_1ECDCF308 = 0u;
      qword_1ECDD02C8 = (uint64_t)"savingApplicationBundleIdentifier";
      xmmword_1ECDD03B8 = 0u;
      xmmword_1ECDD03A8 = 0u;
      xmmword_1ECDD0398 = 0u;
      xmmword_1ECDD0388 = 0u;
      xmmword_1ECDD02E8 = 0u;
      qword_1ECDD0318 = (uint64_t)"eventMovieReservedTicketSeatRow";
      xmmword_1ECDD03D8 = 0u;
      xmmword_1ECDD03C8 = 0u;
      qword_1ECDD0320 = (uint64_t)CFSTR("kMDItemEventMovieReservedTicketSeatRow");
      xmmword_1ECDD02D8 = 0u;
      qword_1ECDD0308 = (uint64_t)"documentUnderstandingCategoriesConfidences";
      qword_1ECDD0310 = (uint64_t)CFSTR("kMDItemDocumentUnderstandingCategoriesConfidences");
      qword_1ECDD02D0 = (uint64_t)CFSTR("kMDItemSavingApplicationBundleIdentifier");
      xmmword_1ECDD02F8 = 0u;
      xmmword_1ECDCF2F8 = 0u;
      qword_1ECDD02B8 = (uint64_t)"eventMovieReservedTicketNumber";
      xmmword_1ECDD02A8 = 0u;
      xmmword_1ECDD0298 = 0u;
      xmmword_1ECDCF348 = 0u;
      qword_1ECDD0290 = (uint64_t)CFSTR("_kMDItemContentCreationDateDay");
      xmmword_1ECDD0278 = 0u;
      xmmword_1ECDCF338 = 0u;
      qword_1ECDD0270 = (uint64_t)CFSTR("kMDItemEventMovieReservationForLocationAddressRegion");
      xmmword_1ECDD0248 = 0u;
      qword_1ECDD0240 = (uint64_t)CFSTR("kMDItemAppleLoopsRootKey");
      xmmword_1ECDD01D8 = 0u;
      xmmword_1ECDD0258 = 0u;
      qword_1ECDD01C8 = (uint64_t)"eventHotelReservationForStreetAddress";
      xmmword_1ECDD0208 = 0u;
      xmmword_1ECDD01F8 = 0u;
      xmmword_1ECDD01E8 = 0u;
      xmmword_1ECDCF378 = 0u;
      qword_1ECDD01D0 = (uint64_t)CFSTR("kMDItemEventHotelReservationForStreetAddress");
      xmmword_1ECDD0228 = 0u;
      qword_1ECDD01B0 = (uint64_t)CFSTR("kMDItemPhotosSceneClassificationBoundingBoxes");
      xmmword_1ECDD0168 = 0u;
      xmmword_1ECDD01B8 = 0u;
      qword_1ECDD0158 = (uint64_t)"documentUnderstandingTopicsLabels";
      xmmword_1ECDD0198 = 0u;
      xmmword_1ECDD0188 = 0u;
      xmmword_1ECDD0178 = 0u;
      xmmword_1ECDCF368 = 0u;
      qword_1ECDD0160 = (uint64_t)CFSTR("kMDItemDocumentUnderstandingTopicsLabels");
      xmmword_1ECDD0138 = 0u;
      xmmword_1ECDCF398 = 0u;
      qword_1ECDD0130 = (uint64_t)CFSTR("kMDItemPhotosSceneClassificationTypes");
      xmmword_1ECDD0148 = 0u;
      qword_1ECDD0110 = (uint64_t)CFSTR("kMDItemIsApplicationManaged");
      xmmword_1ECDD0118 = 0u;
      qword_1ECDD0128 = (uint64_t)"photosSceneClassificationTypes";
      qword_1ECDD0108 = (uint64_t)"applicationManaged";
      xmmword_1ECDD00B8 = 0u;
      qword_1ECDD00A8 = (uint64_t)"GPSDestBearing";
      xmmword_1ECDD00E8 = 0u;
      xmmword_1ECDD00D8 = 0u;
      xmmword_1ECDD00C8 = 0u;
      xmmword_1ECDCF408 = 0u;
      qword_1ECDD00B0 = (uint64_t)CFSTR("kMDItemGPSDestBearing");
      xmmword_1ECDD0098 = 0u;
      xmmword_1ECDCF3F8 = 0u;
      qword_1ECDD0090 = (uint64_t)CFSTR("kMDItemExposureProgram");
      xmmword_1ECDD0068 = 0u;
      xmmword_1ECDCFF78 = 0u;
      qword_1ECDD0060 = (uint64_t)CFSTR("kMDItemEventFlightArrivalAirportCountry");
      xmmword_1ECDD0078 = 0u;
      qword_1ECDD0008 = (uint64_t)"exposureTime";
      qword_1ECDD0028 = (uint64_t)"expirationDate";
      xmmword_1ECDD0048 = 0u;
      xmmword_1ECDD0038 = 0u;
      qword_1ECDD0030 = (uint64_t)CFSTR("_kMDItemExpirationDate");
      xmmword_1ECDCFF68 = 0u;
      qword_1ECDD0018 = (uint64_t)"eventTicketReservationForLocationAddressStreetAddress";
      qword_1ECDD0020 = (uint64_t)CFSTR("kMDItemEventTicketReservationForLocationAddressStreetAddress");
      qword_1ECDD0010 = (uint64_t)CFSTR("kMDItemExposureTimeSeconds");
      qword_1ECDCFFE8 = (uint64_t)"eventTicketReservationForLocationAddressPostalCode";
      qword_1ECDCFFF0 = (uint64_t)CFSTR("kMDItemEventTicketReservationForLocationAddressPostalCode");
      xmmword_1ECDCFFF8 = 0u;
      xmmword_1ECDCFFB8 = 0u;
      xmmword_1ECDCFFA8 = 0u;
      xmmword_1ECDCFF98 = 0u;
      xmmword_1ECDCFF88 = 0u;
      xmmword_1ECDCF3E8 = 0u;
      qword_1ECDCFF48 = (uint64_t)"eventTicketReservationForLocationAddress";
      xmmword_1ECDCFFD8 = 0u;
      xmmword_1ECDCFFC8 = 0u;
      xmmword_1ECDCF438 = 0u;
      qword_1ECDCFF58 = (uint64_t)"contentCreationDateWeekday";
      qword_1ECDCFF60 = (uint64_t)CFSTR("_kMDItemContentCreationDateWeekday");
      qword_1ECDCFF50 = (uint64_t)CFSTR("kMDItemEventTicketReservationForLocationAddress");
      xmmword_1ECDCF428 = 0u;
      qword_1ECDCFF38 = (uint64_t)"eventHotelReservationForAddress";
      qword_1ECDCFF40 = (uint64_t)CFSTR("kMDItemEventHotelReservationForAddress");
      qword_1ECDCFF30 = (uint64_t)CFSTR("kMDItemEventRestaurantReservationForName");
      xmmword_1ECDCF4C8 = 0u;
      qword_1ECDCFF18 = (uint64_t)"eventTicketReservationForLocationName";
      xmmword_1ECDCFF08 = 0u;
      qword_1ECDCFEC0 = (uint64_t)CFSTR("kMDItemEventHotelReservationId");
      xmmword_1ECDCFEE8 = 0u;
      xmmword_1ECDCFED8 = 0u;
      xmmword_1ECDCFEC8 = 0u;
      xmmword_1ECDCF4B8 = 0u;
      qword_1ECDCFEB8 = (uint64_t)"eventHotelReservationId";
      xmmword_1ECDCFEA8 = 0u;
      xmmword_1ECDCFE98 = 0u;
      xmmword_1ECDCF4A8 = 0u;
      qword_1ECDCFE88 = (uint64_t)"encodingApplications";
      xmmword_1ECDCFE78 = 0u;
      xmmword_1ECDCFE68 = 0u;
      xmmword_1ECDCF498 = 0u;
      qword_1ECDCFE60 = (uint64_t)CFSTR("kMDItemDocumentUnderstandingTopicsSynonyms");
      xmmword_1ECDCFE48 = 0u;
      xmmword_1ECDCF488 = 0u;
      qword_1ECDCFE40 = (uint64_t)CFSTR("kMDItemPhotosCollectionKeyAssetUUID");
      xmmword_1ECDCFE28 = 0u;
      xmmword_1ECDCF478 = 0u;
      qword_1ECDCFE20 = (uint64_t)CFSTR("kMDItemEventFlightArrivalTerminal");
      xmmword_1ECDCFE08 = 0u;
      xmmword_1ECDCF468 = 0u;
      qword_1ECDCFE00 = (uint64_t)CFSTR("kMDItemGPSDifferental");
      xmmword_1ECDCFDC8 = 0u;
      qword_1ECDCFD98 = (uint64_t)"eventFlightArrivalAirportStreetAddress";
      qword_1ECDCFDB8 = (uint64_t)"emailHeaders";
      xmmword_1ECDCFDE8 = 0u;
      xmmword_1ECDCFDD8 = 0u;
      qword_1ECDCFDC0 = (uint64_t)CFSTR("kMDItemEmailHeadersDictionary");
      xmmword_1ECDCF4E8 = 0u;
      qword_1ECDCFDA8 = (uint64_t)"disableSearchInSpotlight";
      qword_1ECDCFDB0 = (uint64_t)CFSTR("kMDItemDisableSearchInSpotlight");
      qword_1ECDCFDA0 = (uint64_t)CFSTR("kMDItemEventFlightArrivalAirportStreetAddress");
      xmmword_1ECDCF528 = 0u;
      qword_1ECDCFD88 = (uint64_t)"eventMovieReservationForLocationAddressStreetAddress";
      qword_1ECDCFD90 = (uint64_t)CFSTR("kMDItemEventMovieReservationForLocationAddressStreetAddress");
      qword_1ECDCFD80 = (uint64_t)CFSTR("kMDItemDocumentUnderstandingCategoriesVersion");
      qword_1ECDCFD60 = (uint64_t)CFSTR("kMDItemEventMovieReservationForLocationAddressPostalCode");
      xmmword_1ECDCFD68 = 0u;
      qword_1ECDCFD50 = (uint64_t)CFSTR("kMDItemAppleLoopsLoopMode");
      qword_1ECDCFD58 = (uint64_t)"eventMovieReservationForLocationAddressPostalCode";
      xmmword_1ECDCF518 = 0u;
      qword_1ECDCFD30 = (uint64_t)CFSTR("kMDItemMusicalInstrumentName");
      xmmword_1ECDCFD38 = 0u;
      xmmword_1ECDCF508 = 0u;
      qword_1ECDCFD10 = (uint64_t)CFSTR("kMDItemEventRestaurantReservationForAddressLocality");
      xmmword_1ECDCFD18 = 0u;
      xmmword_1ECDCF568 = 0u;
      qword_1ECDCFCF8 = (uint64_t)"eventRestaurantReservationForAddressCountry";
      xmmword_1ECDCFCD8 = 0u;
      xmmword_1ECDCFCC8 = 0u;
      xmmword_1ECDCF558 = 0u;
      qword_1ECDCFCC0 = (uint64_t)CFSTR("kMDItemEventMovieReservationForLocationAddress");
      xmmword_1ECDCFCE8 = 0u;
      qword_1ECDCFC68 = (uint64_t)"eventTicketReservationForName";
      qword_1ECDCFC88 = (uint64_t)"eventMovieReservationForLocationName";
      xmmword_1ECDCFCA8 = 0u;
      xmmword_1ECDCFC98 = 0u;
      qword_1ECDCFC90 = (uint64_t)CFSTR("kMDItemEventMovieReservationForLocationName");
      xmmword_1ECDCF548 = 0u;
      qword_1ECDCFC78 = (uint64_t)"authorEmailAddresses";
      qword_1ECDCFC80 = (uint64_t)CFSTR("kMDItemAuthorEmailAddresses");
      qword_1ECDCFC70 = (uint64_t)CFSTR("kMDItemEventTicketReservationForName");
      xmmword_1ECDCF588 = 0u;
      qword_1ECDCFC60 = (uint64_t)CFSTR("kMDItemEventMovieReservationId");
      qword_1ECDCFC10 = (uint64_t)CFSTR("kMDItemEventRestaurantReservationForTelephone");
      xmmword_1ECDCFC38 = 0u;
      xmmword_1ECDCFC28 = 0u;
      xmmword_1ECDCFC18 = 0u;
      xmmword_1ECDCF5A8 = 0u;
      qword_1ECDCFC08 = (uint64_t)"eventRestaurantReservationForTelephone";
      xmmword_1ECDCFBC8 = 0u;
      xmmword_1ECDCFBB8 = 0u;
      qword_1ECDCFB68 = (uint64_t)"appleLoopsKeyFilterType";
      xmmword_1ECDCFBE8 = 0u;
      xmmword_1ECDCFBD8 = 0u;
      qword_1ECDCFB70 = (uint64_t)CFSTR("kMDItemAppleLoopsKeyFilterType");
      qword_1ECDCFBB0 = (uint64_t)CFSTR("kMDItemAcquisitionModel");
      xmmword_1ECDCFBF8 = 0u;
      qword_1ECDCFB90 = (uint64_t)CFSTR("kMDItemPhotosSceneClassification");
      xmmword_1ECDCFB98 = 0u;
      qword_1ECDCFBA8 = (uint64_t)"photosAcquisitionModel";
      qword_1ECDCFB88 = (uint64_t)"photosSceneClassification";
      xmmword_1ECDCFB78 = 0u;
      qword_1ECDCFB28 = (uint64_t)"photosSharedLibraryContributorsNamesAlternativesCounts";
      xmmword_1ECDCFB58 = 0u;
      xmmword_1ECDCFB48 = 0u;
      xmmword_1ECDCFB38 = 0u;
      xmmword_1ECDCF5F8 = 0u;
      qword_1ECDCFB30 = (uint64_t)CFSTR("kMDItemPhotosSharedLibraryContributorsNamesAlternativesCounts");
      xmmword_1ECDCFB18 = 0u;
      xmmword_1ECDCF618 = 0u;
      qword_1ECDCFB10 = (uint64_t)CFSTR("kMDItemAccountIdentifier");
      xmmword_1ECDCFAE8 = 0u;
      xmmword_1ECDCF668 = 0u;
      qword_1ECDCFAE0 = (uint64_t)CFSTR("_kMDItemContentCreationDateMonth");
      xmmword_1ECDCFAF8 = 0u;
      qword_1ECDCFAC8 = (uint64_t)"photosSharedLibraryContributorsNamesAlternatives";
      xmmword_1ECDCFA88 = 0u;
      xmmword_1ECDCFA78 = 0u;
      xmmword_1ECDCFA68 = 0u;
      qword_1ECDCFA58 = (uint64_t)"contentCreationDateHour";
      xmmword_1ECDCFAB8 = 0u;
      xmmword_1ECDCFAA8 = 0u;
      xmmword_1ECDCFA98 = 0u;
      xmmword_1ECDCF658 = 0u;
      qword_1ECDCFA60 = (uint64_t)CFSTR("_kMDItemContentCreationDateHour");
      xmmword_1ECDCFA38 = 0u;
      xmmword_1ECDCF648 = 0u;
      qword_1ECDCFA30 = (uint64_t)CFSTR("kMDItemEventFlightArrivalAirportLocality");
      xmmword_1ECDCFA48 = 0u;
      qword_1ECDCFA10 = (uint64_t)CFSTR("kMDItemPhotosSharedLibraryContributorsNames");
      xmmword_1ECDCFA18 = 0u;
      qword_1ECDCFA28 = (uint64_t)"eventFlightArrivalAirportLocality";
      qword_1ECDCFA08 = (uint64_t)"photosSharedLibraryContributorsNames";
      xmmword_1ECDCF9B8 = 0u;
      qword_1ECDCF9A8 = (uint64_t)"appEntityTypeRepresentationSynonyms";
      xmmword_1ECDCF9E8 = 0u;
      xmmword_1ECDCF9D8 = 0u;
      xmmword_1ECDCF9C8 = 0u;
      xmmword_1ECDCF6B8 = 0u;
      qword_1ECDCF9B0 = (uint64_t)CFSTR("_kMDItemAppEntityTypeRepresentationSynonyms");
      xmmword_1ECDCF998 = 0u;
      qword_1ECDCF988 = (uint64_t)"GPSAreaInformation";
      xmmword_1ECDCF928 = 0u;
      xmmword_1ECDCF918 = 0u;
      xmmword_1ECDCF908 = 0u;
      qword_1ECDCF8B8 = (uint64_t)"eventFlightDepartureAirportLocality";
      xmmword_1ECDCF958 = 0u;
      xmmword_1ECDCF948 = 0u;
      xmmword_1ECDCF938 = 0u;
      qword_1ECDCF900 = (uint64_t)CFSTR("kMDItemEmailAddresses");
      xmmword_1ECDCF978 = 0u;
      xmmword_1ECDCF968 = 0u;
      xmmword_1ECDCF6A8 = 0u;
      qword_1ECDCF8D8 = (uint64_t)"eventRestaurantReservationForAddressRegion";
      xmmword_1ECDCF8E8 = 0u;
      qword_1ECDCF8F8 = (uint64_t)"emailAddresses";
      qword_1ECDCF8E0 = (uint64_t)CFSTR("kMDItemEventRestaurantReservationForAddressRegion");
      xmmword_1ECDCF698 = 0u;
      qword_1ECDCF8C8 = (uint64_t)"applicationCategories";
      qword_1ECDCF8D0 = (uint64_t)CFSTR("kMDItemApplicationCategories");
      qword_1ECDCF8C0 = (uint64_t)CFSTR("kMDItemEventFlightDepartureAirportLocality");
      xmmword_1ECDCF688 = 0u;
      qword_1ECDCF8A8 = (uint64_t)"lastAppEngagementDate";
      qword_1ECDCF8B0 = (uint64_t)CFSTR("kMDItemLastAppEngagementDate");
      xmmword_1ECDCF7E8 = 0u;
      qword_1ECDCF898 = (uint64_t)"resolutionWidthDPI";
      qword_1ECDCF8A0 = (uint64_t)CFSTR("kMDItemResolutionWidthDPI");
      qword_1ECDCF858 = (uint64_t)"generalMIDISequence";
      qword_1ECDCF880 = (uint64_t)CFSTR("com_apple_mobilephone_callbackURL");
      xmmword_1ECDCF888 = 0u;
      qword_1ECDCF878 = (uint64_t)"phoneCallBackURL";
      qword_1ECDCF860 = (uint64_t)CFSTR("kMDItemIsGeneralMIDISequence");
      qword_1ECDCF868 = (uint64_t)"applicationName";
      qword_1ECDCF870 = (uint64_t)CFSTR("kMDItemApplicationName");
      xmmword_1ECDCF828 = 0u;
      xmmword_1ECDCF818 = 0u;
      xmmword_1ECDCF808 = 0u;
      xmmword_1ECDCF7F8 = 0u;
      qword_1ECDCF6C8 = (uint64_t)"photosCharacterRecognitionAnalysisVersion";
      qword_1ECDCF7E0 = (uint64_t)CFSTR("kMDItemContentRating");
      xmmword_1ECDCF848 = 0u;
      xmmword_1ECDCF838 = 0u;
      xmmword_1ECDCF7B8 = 0u;
      qword_1ECDCF7D8 = (uint64_t)"contentRating";
      qword_1ECDCF7A8 = (uint64_t)"eventFlightArrivalAirportLatitude";
      qword_1ECDCF7B0 = (uint64_t)CFSTR("kMDItemEventFlightArrivalAirportLatitude");
      xmmword_1ECDCF7C8 = 0u;
      xmmword_1ECDCF6F8 = 0u;
      qword_1ECDCF790 = (uint64_t)CFSTR("kMDItemDonatedEventCourierName");
      xmmword_1ECDCF798 = 0u;
      qword_1ECDCF770 = (uint64_t)CFSTR("kMDItemDocumentUnderstandingCategories");
      xmmword_1ECDCF778 = 0u;
      qword_1ECDCF788 = (uint64_t)"donatedEventCourierName";
      xmmword_1ECDCF748 = 0u;
      qword_1ECDCF768 = (uint64_t)"documentUnderstandingCategories";
      qword_1ECDCF738 = (uint64_t)"eventHotelReservationForName";
      qword_1ECDCF740 = (uint64_t)CFSTR("kMDItemEventHotelReservationForName");
      xmmword_1ECDCF758 = 0u;
      qword_1ECDCF6D0 = (uint64_t)CFSTR("kMDItemPhotosCharacterRecognitionAnalysisVersion");
      qword_1ECDCF6F0 = (uint64_t)CFSTR("kMDItemAcquisitionModel");
      xmmword_1ECDCF728 = 0u;
      xmmword_1ECDCF718 = 0u;
      xmmword_1ECDCF708 = 0u;
      xmmword_1ECDCF6D8 = 0u;
      qword_1ECDCF6E8 = (uint64_t)"acquisitionModel";
      xmmword_1ECDD0E98 = 0u;
      xmmword_1ECDD0EA8 = 0u;
      xmmword_1ECDD0EB8 = 0u;
      xmmword_1ECDD0EC8 = 0u;
      xmmword_1ECDD0ED8 = 0u;
      qword_1ECDD0EE8 = (uint64_t)"eligibleForPhotosProcessing";
      qword_1ECDD0EF0 = (uint64_t)CFSTR("_kMDItemEligibleForPhotosProcessing");
      qword_1ECDD0EF8 = (uint64_t)"eventHotelReservationForTelephone";
      qword_1ECDD0F00 = (uint64_t)CFSTR("kMDItemEventHotelReservationForTelephone");
      xmmword_1ECDD0F28 = 0u;
      xmmword_1ECDD0F18 = 0u;
      xmmword_1ECDD0F08 = 0u;
      qword_1ECDD0F38 = (uint64_t)"contentCreationDateWeekOfMonth";
      qword_1ECDD0F40 = (uint64_t)CFSTR("_kMDItemContentCreationDateWeekOfMonth");
      qword_1ECDD0F48 = (uint64_t)"primaryAccountNumberSuffix";
      qword_1ECDD0F50 = (uint64_t)CFSTR("kMDItemPrimaryAccountNumberSuffix");
      qword_1ECDD0F58 = (uint64_t)"contentModificationDateYear";
      qword_1ECDD0F60 = (uint64_t)CFSTR("_kMDItemContentModificationDateYear");
      xmmword_1ECDD0FB8 = 0u;
      xmmword_1ECDD0FA8 = 0u;
      xmmword_1ECDD0F98 = 0u;
      xmmword_1ECDD0F88 = 0u;
      xmmword_1ECDD0F78 = 0u;
      xmmword_1ECDD0F68 = 0u;
      qword_1ECDD0FC8 = (uint64_t)"GPSDestLongitude";
      qword_1ECDD0FD0 = (uint64_t)CFSTR("kMDItemGPSDestLongitude");
      xmmword_1ECDD0FF8 = 0u;
      xmmword_1ECDD0FE8 = 0u;
      xmmword_1ECDD0FD8 = 0u;
      qword_1ECDD1008 = (uint64_t)"eventCarPickupLocationAddressRegion";
      qword_1ECDD1010 = (uint64_t)CFSTR("kMDItemEventCarPickupLocationAddressRegion");
      xmmword_1ECDD1098 = 0u;
      xmmword_1ECDD1088 = 0u;
      xmmword_1ECDD1078 = 0u;
      xmmword_1ECDD1068 = 0u;
      xmmword_1ECDD1058 = 0u;
      xmmword_1ECDD1048 = 0u;
      xmmword_1ECDD1038 = 0u;
      xmmword_1ECDD1028 = 0u;
      xmmword_1ECDD1018 = 0u;
      qword_1ECDD10A8 = (uint64_t)"contentCreationDateWeekdayOrdinal";
      qword_1ECDD10B0 = (uint64_t)CFSTR("_kMDItemContentCreationDateWeekdayOrdinal");
      xmmword_1ECDD1108 = 0u;
      xmmword_1ECDD10F8 = 0u;
      xmmword_1ECDD10E8 = 0u;
      xmmword_1ECDD10D8 = 0u;
      xmmword_1ECDD10C8 = 0u;
      xmmword_1ECDD10B8 = 0u;
      qword_1ECDD1118 = (uint64_t)"eventHotelReservationForAddressRegion";
      qword_1ECDD1120 = (uint64_t)CFSTR("kMDItemEventHotelReservationForAddressRegion");
      qword_1ECDD1128 = (uint64_t)"photosSceneClassificationIdentifiers";
      qword_1ECDD1130 = (uint64_t)CFSTR("kMDItemPhotosSceneClassificationIdentifiers");
      xmmword_1ECDD1188 = 0u;
      xmmword_1ECDD1178 = 0u;
      xmmword_1ECDD1168 = 0u;
      xmmword_1ECDD1158 = 0u;
      xmmword_1ECDD1148 = 0u;
      xmmword_1ECDD1138 = 0u;
      qword_1ECDD1198 = (uint64_t)"bundleID";
      qword_1ECDD11A0 = (uint64_t)CFSTR("_kMDItemBundleID");
      xmmword_1ECDD1228 = 0u;
      xmmword_1ECDD1218 = 0u;
      xmmword_1ECDD1208 = 0u;
      xmmword_1ECDD11F8 = 0u;
      xmmword_1ECDD11E8 = 0u;
      xmmword_1ECDD11D8 = 0u;
      xmmword_1ECDD11C8 = 0u;
      xmmword_1ECDD11B8 = 0u;
      xmmword_1ECDD11A8 = 0u;
      qword_1ECDD1238 = (uint64_t)"executableArchitectures";
      qword_1ECDD1240 = (uint64_t)CFSTR("kMDItemExecutableArchitectures");
      xmmword_1ECDD1278 = 0u;
      xmmword_1ECDD1268 = 0u;
      xmmword_1ECDD1258 = 0u;
      xmmword_1ECDD1248 = 0u;
      qword_1ECDD1288 = (uint64_t)"donatedEventArrivalAirportName";
      qword_1ECDD1290 = (uint64_t)CFSTR("kMDItemDonatedEventArrivalAirportName");
      xmmword_1ECDD1368 = 0u;
      xmmword_1ECDD1358 = 0u;
      xmmword_1ECDD1348 = 0u;
      xmmword_1ECDD1338 = 0u;
      xmmword_1ECDD1328 = 0u;
      xmmword_1ECDD1318 = 0u;
      xmmword_1ECDD1308 = 0u;
      xmmword_1ECDD12F8 = 0u;
      xmmword_1ECDD12E8 = 0u;
      xmmword_1ECDD12D8 = 0u;
      xmmword_1ECDD12C8 = 0u;
      xmmword_1ECDD12B8 = 0u;
      xmmword_1ECDD12A8 = 0u;
      xmmword_1ECDD1298 = 0u;
      qword_1ECDD1378 = (uint64_t)"phoneSIM";
      qword_1ECDD1380 = (uint64_t)CFSTR("com_apple_mobilephone_SIM");
      xmmword_1ECDD13E8 = 0u;
      xmmword_1ECDD13D8 = 0u;
      xmmword_1ECDD13C8 = 0u;
      xmmword_1ECDD13B8 = 0u;
      xmmword_1ECDD13A8 = 0u;
      xmmword_1ECDD1398 = 0u;
      xmmword_1ECDD1388 = 0u;
      qword_1ECDD13F8 = (uint64_t)"eventHotelReservationForAddressCountry";
      qword_1ECDD1400 = (uint64_t)CFSTR("kMDItemEventHotelReservationForAddressCountry");
      xmmword_1ECDD1408 = 0u;
      qword_1ECDD1418 = (uint64_t)"contentModificationDateWeekOfYear";
      qword_1ECDD1420 = (uint64_t)CFSTR("_kMDItemContentModificationDateWeekOfYear");
      xmmword_1ECDD1458 = 0u;
      xmmword_1ECDD1448 = 0u;
      xmmword_1ECDD1438 = 0u;
      xmmword_1ECDD1428 = 0u;
      qword_1ECDD1468 = (uint64_t)"eventIsAllDay";
      qword_1ECDD1470 = (uint64_t)CFSTR("kMDItemEventIsAllDay");
      xmmword_1ECDD1498 = 0u;
      xmmword_1ECDD1488 = 0u;
      xmmword_1ECDD1478 = 0u;
      qword_1ECDD14A8 = (uint64_t)"albumPersistentID";
      qword_1ECDD14B0 = (uint64_t)CFSTR("kMDItemAlbumPersistentID");
      qword_1ECDD14B8 = (uint64_t)"contentModificationDateMonth";
      qword_1ECDD14C0 = (uint64_t)CFSTR("_kMDItemContentModificationDateMonth");
      xmmword_1ECDD15D8 = 0u;
      xmmword_1ECDD15C8 = 0u;
      xmmword_1ECDD15B8 = 0u;
      xmmword_1ECDD15A8 = 0u;
      xmmword_1ECDD1598 = 0u;
      xmmword_1ECDD1588 = 0u;
      xmmword_1ECDD1578 = 0u;
      xmmword_1ECDD1568 = 0u;
      xmmword_1ECDD1558 = 0u;
      xmmword_1ECDD1548 = 0u;
      xmmword_1ECDD1538 = 0u;
      xmmword_1ECDD1528 = 0u;
      xmmword_1ECDD1518 = 0u;
      xmmword_1ECDD1508 = 0u;
      xmmword_1ECDD14F8 = 0u;
      xmmword_1ECDD14E8 = 0u;
      xmmword_1ECDD14D8 = 0u;
      xmmword_1ECDD14C8 = 0u;
      qword_1ECDD15E8 = (uint64_t)"eventFlightArrivalAirportLongitude";
      qword_1ECDD15F0 = (uint64_t)CFSTR("kMDItemEventFlightArrivalAirportLongitude");
      xmmword_1ECDD15F8 = 0u;
      xmmword_1ECDD1608 = 0u;
      xmmword_1ECDD1618 = 0u;
      xmmword_1ECDD1628 = 0u;
      xmmword_1ECDD1638 = 0u;
      xmmword_1ECDD1648 = 0u;
      xmmword_1ECDD1658 = 0u;
      xmmword_1ECDD1668 = 0u;
      xmmword_1ECDD1678 = 0u;
      xmmword_1ECDD1688 = 0u;
      xmmword_1ECDD1698 = 0u;
      xmmword_1ECDD16A8 = 0u;
      xmmword_1ECDD16B8 = 0u;
      xmmword_1ECDD16C8 = 0u;
      xmmword_1ECDD16D8 = 0u;
      xmmword_1ECDD16E8 = 0u;
      xmmword_1ECDD16F8 = 0u;
      xmmword_1ECDD1708 = 0u;
      qword_1ECDD1718 = (uint64_t)"GPSDOP";
      qword_1ECDD1720 = (uint64_t)CFSTR("kMDItemGPSDOP");
      xmmword_1ECDD1728 = 0u;
      xmmword_1ECDD1738 = 0u;
      qword_1ECDD1748 = (uint64_t)"eventMovieReservedTicketSeatNumber";
      qword_1ECDD1750 = (uint64_t)CFSTR("kMDItemEventMovieReservedTicketSeatNumber");
      qword_1ECDD1758 = (uint64_t)"contentModificationDateWeekday";
      qword_1ECDD1760 = (uint64_t)CFSTR("_kMDItemContentModificationDateWeekday");
      xmmword_1ECDD1768 = 0u;
      xmmword_1ECDD1778 = 0u;
      xmmword_1ECDD1788 = 0u;
      qword_1ECDD1798 = (uint64_t)"extendedContentRating";
      qword_1ECDD17A0 = (uint64_t)CFSTR("kMDItemExtendedContentRating");
      xmmword_1ECDD17A8 = 0u;
      xmmword_1ECDD17B8 = 0u;
      xmmword_1ECDD17C8 = 0u;
      xmmword_1ECDD17D8 = 0u;
      xmmword_1ECDD17E8 = 0u;
      xmmword_1ECDD17F8 = 0u;
      xmmword_1ECDD1808 = 0u;
      xmmword_1ECDD1818 = 0u;
      xmmword_1ECDD1828 = 0u;
      xmmword_1ECDD1838 = 0u;
      xmmword_1ECDD1848 = 0u;
      qword_1ECDD1858 = (uint64_t)"eventTicketReservedTicketNumber";
      qword_1ECDD1860 = (uint64_t)CFSTR("kMDItemEventTicketReservedTicketNumber");
      xmmword_1ECDD1868 = 0u;
      qword_1ECDD1878 = (uint64_t)"photosSceneClassificationSynonyms";
      qword_1ECDD1880 = (uint64_t)CFSTR("kMDItemPhotosSceneClassificationSynonyms");
      xmmword_1ECDD1888 = 0u;
      xmmword_1ECDD1898 = 0u;
      xmmword_1ECDD18A8 = 0u;
      xmmword_1ECDD18B8 = 0u;
      xmmword_1ECDD18C8 = 0u;
      xmmword_1ECDD18D8 = 0u;
      xmmword_1ECDD18E8 = 0u;
      xmmword_1ECDD18F8 = 0u;
      xmmword_1ECDD1908 = 0u;
      xmmword_1ECDD1918 = 0u;
      xmmword_1ECDD1928 = 0u;
      xmmword_1ECDD1938 = 0u;
      xmmword_1ECDD1948 = 0u;
      qword_1ECDD1958 = (uint64_t)"GPSDateStamp";
      qword_1ECDD1960 = (uint64_t)CFSTR("kMDItemGPSDateStamp");
      xmmword_1ECDD1968 = 0u;
      qword_1ECDD1978 = (uint64_t)"contentModificationDateWeekOfMonth";
      qword_1ECDD1980 = (uint64_t)CFSTR("_kMDItemContentModificationDateWeekOfMonth");
      xmmword_1ECDD1998 = 0u;
      xmmword_1ECDD1988 = 0u;
      qword_1ECDD19A8 = (uint64_t)"eventHotelReservationForAddressLocality";
      qword_1ECDD19B0 = (uint64_t)CFSTR("kMDItemEventHotelReservationForAddressLocality");
      xmmword_1ECDD1A08 = 0u;
      xmmword_1ECDD19F8 = 0u;
      xmmword_1ECDD19E8 = 0u;
      xmmword_1ECDD19D8 = 0u;
      xmmword_1ECDD19C8 = 0u;
      xmmword_1ECDD19B8 = 0u;
      qword_1ECDD1A18 = (uint64_t)"eventHotelReservationForAddressPostalCode";
      qword_1ECDD1A20 = (uint64_t)CFSTR("kMDItemEventHotelReservationForAddressPostalCode");
      xmmword_1ECDD1A88 = 0u;
      xmmword_1ECDD1A78 = 0u;
      xmmword_1ECDD1A68 = 0u;
      xmmword_1ECDD1A58 = 0u;
      xmmword_1ECDD1A48 = 0u;
      xmmword_1ECDD1A38 = 0u;
      xmmword_1ECDD1A28 = 0u;
      qword_1ECDD1A98 = (uint64_t)"contentModificationDateHour";
      qword_1ECDD1AA0 = (uint64_t)CFSTR("_kMDItemContentModificationDateHour");
      xmmword_1ECDD1B38 = 0u;
      xmmword_1ECDD1B28 = 0u;
      xmmword_1ECDD1B18 = 0u;
      xmmword_1ECDD1B08 = 0u;
      xmmword_1ECDD1AF8 = 0u;
      xmmword_1ECDD1AE8 = 0u;
      xmmword_1ECDD1AD8 = 0u;
      xmmword_1ECDD1AC8 = 0u;
      xmmword_1ECDD1AB8 = 0u;
      xmmword_1ECDD1AA8 = 0u;
      qword_1ECDD1B48 = (uint64_t)"eventHotelModifyReservationUrl";
      qword_1ECDD1B50 = (uint64_t)CFSTR("kMDItemEventHotelModifyReservationUrl");
      xmmword_1ECDD1BF8 = 0u;
      xmmword_1ECDD1BE8 = 0u;
      xmmword_1ECDD1BD8 = 0u;
      xmmword_1ECDD1BC8 = 0u;
      xmmword_1ECDD1BB8 = 0u;
      xmmword_1ECDD1BA8 = 0u;
      xmmword_1ECDD1B98 = 0u;
      xmmword_1ECDD1B88 = 0u;
      xmmword_1ECDD1B78 = 0u;
      xmmword_1ECDD1B68 = 0u;
      xmmword_1ECDD1B58 = 0u;
      qword_1ECDD1C08 = (uint64_t)"eventTicketReservedTicketSeatNumber";
      qword_1ECDD1C10 = (uint64_t)CFSTR("kMDItemEventTicketReservedTicketSeatNumber");
      xmmword_1ECDD1C58 = 0u;
      xmmword_1ECDD1C48 = 0u;
      xmmword_1ECDD1C38 = 0u;
      xmmword_1ECDD1C28 = 0u;
      xmmword_1ECDD1C18 = 0u;
      qword_1ECDD1C68 = (uint64_t)"exposureTimeString";
      qword_1ECDD1C70 = (uint64_t)CFSTR("kMDItemExposureTimeString");
      bzero(&CSFriendlyFieldNameTable::in_word_set(char const*,unsigned int)::wordlist[1352], 0x300uLL);
      qword_1ECDD1F78 = (uint64_t)"photosSceneClassificationMediaTypes";
      qword_1ECDD1F80 = (uint64_t)CFSTR("kMDItemPhotosSceneClassificationMediaTypes");
      qword_1ECDD1F88 = (uint64_t)"GPSMapDatum";
      qword_1ECDD1F90 = (uint64_t)CFSTR("kMDItemGPSMapDatum");
      xmmword_1ECDD1F98 = 0u;
      xmmword_1ECDD1FA8 = 0u;
      xmmword_1ECDD1FB8 = 0u;
      xmmword_1ECDD1FC8 = 0u;
      qword_1ECDD1FD8 = (uint64_t)"contentModificationDateDay";
      qword_1ECDD1FE0 = (uint64_t)CFSTR("_kMDItemContentModificationDateDay");
      xmmword_1ECDD1FE8 = 0u;
      xmmword_1ECDD1FF8 = 0u;
      xmmword_1ECDD2008 = 0u;
      xmmword_1ECDD2018 = 0u;
      xmmword_1ECDD2028 = 0u;
      xmmword_1ECDD2038 = 0u;
      xmmword_1ECDD2048 = 0u;
      xmmword_1ECDD2058 = 0u;
      xmmword_1ECDD2068 = 0u;
      qword_1ECDD2078 = (uint64_t)"eventTicketReservedTicketSeatSection";
      qword_1ECDD2080 = (uint64_t)CFSTR("kMDItemEventTicketReservedTicketSeatSection");
      xmmword_1ECDD2088 = 0u;
      xmmword_1ECDD2098 = 0u;
      xmmword_1ECDD20A8 = 0u;
      xmmword_1ECDD20B8 = 0u;
      xmmword_1ECDD20C8 = 0u;
      xmmword_1ECDD20D8 = 0u;
      xmmword_1ECDD20E8 = 0u;
      xmmword_1ECDD20F8 = 0u;
      xmmword_1ECDD2108 = 0u;
      xmmword_1ECDD2118 = 0u;
      qword_1ECDD2128 = (uint64_t)"contentModificationDateWeekdayOrdinal";
      qword_1ECDD2130 = (uint64_t)CFSTR("_kMDItemContentModificationDateWeekdayOrdinal");
      xmmword_1ECDD2138 = 0u;
      xmmword_1ECDD2148 = 0u;
      xmmword_1ECDD2158 = 0u;
      xmmword_1ECDD2168 = 0u;
      xmmword_1ECDD2178 = 0u;
      xmmword_1ECDD2188 = 0u;
      xmmword_1ECDD2198 = 0u;
      xmmword_1ECDD21A8 = 0u;
      xmmword_1ECDD21B8 = 0u;
      xmmword_1ECDD21C8 = 0u;
      qword_1ECDD21D8 = (uint64_t)"executablePlatform";
      qword_1ECDD21E0 = (uint64_t)CFSTR("kMDItemExecutablePlatform");
      LODWORD(a2) = v14;
      this = v17;
    }
  }
  if (((_DWORD)a2 - 3) <= 0x33)
  {
    v3 = (int)a2;
    v4 = (int)a2;
    v5 = (int)a2;
    v6 = (int)a2;
    v7 = (int)a2;
    v8 = (int)a2;
    v9 = (int)a2;
    switch((int)a2)
    {
      case 0:
      case 1:
      case 2:
        goto LABEL_11;
      case 3:
      case 4:
        goto LABEL_10;
      case 5:
      case 6:
      case 7:
        goto LABEL_9;
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
        goto LABEL_8;
      case 17:
      case 18:
      case 19:
      case 20:
      case 21:
      case 22:
        goto LABEL_7;
      case 23:
      case 24:
      case 25:
        goto LABEL_6;
      case 26:
      case 27:
      case 28:
        goto LABEL_5;
      default:
        v3 = CSFriendlyFieldNameTable::hash(char const*,unsigned int)::asso_values[*((unsigned __int8 *)this + 31)]
           + (_DWORD)a2;
LABEL_5:
        v4 = v3 + CSFriendlyFieldNameTable::hash(char const*,unsigned int)::asso_values[*((unsigned __int8 *)this + 28)];
LABEL_6:
        v5 = v4 + CSFriendlyFieldNameTable::hash(char const*,unsigned int)::asso_values[*((unsigned __int8 *)this + 25)];
LABEL_7:
        v6 = v5 + CSFriendlyFieldNameTable::hash(char const*,unsigned int)::asso_values[*((unsigned __int8 *)this + 19)];
LABEL_8:
        v7 = v6 + CSFriendlyFieldNameTable::hash(char const*,unsigned int)::asso_values[*((unsigned __int8 *)this + 10)];
LABEL_9:
        v8 = v7 + CSFriendlyFieldNameTable::hash(char const*,unsigned int)::asso_values[*((unsigned __int8 *)this + 7)];
LABEL_10:
        v9 = v8 + CSFriendlyFieldNameTable::hash(char const*,unsigned int)::asso_values[*((unsigned __int8 *)this + 5)];
LABEL_11:
        v10 = v9
            + CSFriendlyFieldNameTable::hash(char const*,unsigned int)::asso_values[*((unsigned __int8 *)this + 1)]
            + CSFriendlyFieldNameTable::hash(char const*,unsigned int)::asso_values[*((unsigned __int8 *)this
                                                                                    + ((_DWORD)a2 - 1))];
        if (v10 > 0x59E)
          return 0;
        v11 = &CSFriendlyFieldNameTable::in_word_set(char const*,unsigned int)::wordlist[v10];
        v12 = *(const char **)v11;
        if (!*(_QWORD *)v11
          || *(unsigned __int8 *)this != *(unsigned __int8 *)v12
          || strcmp((const char *)this + 1, v12 + 1))
        {
          return 0;
        }
        return v11;
    }
  }
  return 0;
}

id csindex_xpc_dictionary_decode_status_with_error(void *a1)
{
  id v1;
  void *v2;
  int64_t int64;
  int64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v14;
  int64_t v15;
  const char *string;
  void *v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (!v1)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
LABEL_5:
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("CSIndexErrorDomain"), -1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  int64 = xpc_dictionary_get_int64(v1, "re");
  if (!int64)
  {
    v14 = xpc_dictionary_get_int64(v2, "status");
    if (!v14)
    {
      v11 = 0;
      goto LABEL_6;
    }
    v15 = v14;
    string = xpc_dictionary_get_string(v2, "ed");
    v17 = (void *)MEMORY[0x1E0CB35C8];
    if (string)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", string, 4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, v15, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
    v12 = (void *)MEMORY[0x1E0CB35C8];
    goto LABEL_5;
  }
  v4 = int64;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld (%s)"), int64, strerror(int64));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v7 = (void *)objc_msgSend(v6, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v4, 0);
  v8 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB3388];
  v19[0] = *MEMORY[0x1E0CB2D50];
  v19[1] = v9;
  v20[0] = v5;
  v20[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("CSIndexErrorDomain"), -1000, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v11;
}

void sub_18C445DD0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C445E68(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C446118(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C446518(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C4465E8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id logForCSLogCategoryIndex()
{
  if (logForCSLogCategoryIndex_onceToken != -1)
    dispatch_once(&logForCSLogCategoryIndex_onceToken, &__block_literal_global_3);
  return (id)logForCSLogCategoryIndex_sIndexLog;
}

void sub_18C446EA8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id addExtensionToken(void *a1, const char *a2, void *a3)
{
  id v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  xpc_object_t v8;
  NSObject *v9;
  const char *v10;
  char *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v5 = a1;
  v6 = a3;
  v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v7, "command", "test");
  v8 = xpc_connection_send_message_with_reply_sync(v6, v7);

  if (MEMORY[0x18D7829C8](v8) == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_audit_token();
    v10 = (const char *)sandbox_extension_issue_file_to_process();
  }
  else
  {
    logForCSLogCategoryDefault();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      addExtensionToken_cold_3((uint64_t)v8, v9);

    v10 = (const char *)sandbox_extension_issue_file();
  }
  v11 = (char *)v10;
  if (v10)
  {
    xpc_dictionary_set_string(v5, "ext", v10);
    logForCSLogCategoryDefault();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      addExtensionToken_cold_2((uint64_t)v11, (uint64_t)a2, v12);

    free(v11);
  }
  else
  {
    logForCSLogCategoryDefault();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      addExtensionToken_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);

    xpc_dictionary_set_int64(v5, "ee", -1);
  }
  xpc_dictionary_set_string(v5, "p", a2);

  return v5;
}

id CSPrivateIndexDefaultPath(void *a1)
{
  return CSUnhousedIndexDefaultPath(a1, CFSTR("com.apple.corespotlightservice"));
}

void sub_18C44739C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18C447524(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18C44772C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void add_dispatch_data_to_xpc_dict(void *a1, const char *a2, NSObject *a3, const char *a4, uint64_t a5)
{
  id v9;
  xpc_object_t v10;
  xpc_object_t xdict;

  v9 = a1;
  if (v9 && a3)
  {
    xdict = v9;
    v10 = xpc_data_create_with_dispatch_data(a3);
    if (v10)
    {
      xpc_dictionary_set_value(xdict, a2, v10);
      if (a4)
      {
        if (a5)
          xpc_dictionary_set_uint64(xdict, a4, a5);
      }
    }

    v9 = xdict;
  }

}

id CSPrivateUUID(void *a1)
{
  return CSUnhousedUUID(a1);
}

void __logForCSLogCategoryIndex_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.corespotlight", "index");
  v1 = (void *)logForCSLogCategoryIndex_sIndexLog;
  logForCSLogCategoryIndex_sIndexLog = (uint64_t)v0;

}

id csquery_xpc_dictionary_decode_status_with_error(void *a1)
{
  id v1;
  void *v2;
  void *int64;
  const char *string;
  void *v5;
  void *v6;
  void *v7;

  v1 = a1;
  v2 = v1;
  if (!v1)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    goto LABEL_7;
  }
  int64 = (void *)xpc_dictionary_get_int64(v1, "status");
  if (int64)
  {
    string = xpc_dictionary_get_string(v2, "ed");
    v5 = (void *)MEMORY[0x1E0CB35C8];
    if (string)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", string, 4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, int64, 0);
      int64 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
    v7 = (void *)MEMORY[0x1E0CB35C8];
LABEL_7:
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("CSSearchQueryErrorDomain"), -2000, 0);
    int64 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_8:

  return int64;
}

void __logForCSLogCategoryDefault_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.corespotlight", "default");
  v1 = (void *)logForCSLogCategoryDefault_log;
  logForCSLogCategoryDefault_log = (uint64_t)v0;

}

void csquery_xpc_dictionary_encode_status_with_error(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v5 = a2;
  v3 = a1;
  if (v5)
  {
    xpc_dictionary_set_int64(v3, "status", objc_msgSend(v5, "code"));
    objc_msgSend(v5, "domain");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_string(v3, "ed", (const char *)objc_msgSend(v4, "UTF8String"));

    v3 = v4;
  }
  else
  {
    xpc_dictionary_set_int64(v3, "status", 0);
  }

}

void sub_18C448B74(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C448CA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18C448CFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_18C44967C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  void *v14;
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_sync_exit(v14);
  _Unwind_Resume(a1);
}

void sub_18C449D1C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

void csindex_xpc_dictionary_encode_status_with_error(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v5 = a2;
  v3 = a1;
  if (v5)
  {
    xpc_dictionary_set_int64(v3, "status", objc_msgSend(v5, "code"));
    objc_msgSend(v5, "domain");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_string(v3, "ed", (const char *)objc_msgSend(v4, "UTF8String"));

    v3 = v4;
  }
  else
  {
    xpc_dictionary_set_int64(v3, "status", 0);
  }

}

void sub_18C44AAF0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __logForCSLogCategoryQuery_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.corespotlight", "query");
  v1 = (void *)logForCSLogCategoryQuery_sQueryLog;
  logForCSLogCategoryQuery_sQueryLog = (uint64_t)v0;

}

void sub_18C44AF14(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

CSPerson *_CSDecodeObject(__int128 *a1, void *a2)
{
  id v3;
  const char *v4;
  const char *v5;
  CSPerson *v6;
  void *v7;
  double v8;
  double v9;
  __objc2_class *v10;
  id v11;
  void *v12;
  CSPerson *v13;
  void *v14;
  uint64_t v15;
  const UInt8 *Value;
  const UInt8 *BytePtr;
  const UInt8 *v18;
  const __CFAllocator *v19;
  const __CFAllocator *v20;
  int Count;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  int v27;
  CSSearchableItemAttributeSet *v28;
  uint64_t v29;
  id v30;
  CSSearchableItemAttributeSet *v31;
  void *v32;
  id v33;
  void *v34;
  int v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  unsigned int v44;
  unsigned int v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t IntValue;
  void *v62;
  id v63;
  id v64;
  id v65;
  id v66;
  char v67[24];
  char v68[24];
  char v69[24];
  char v70[24];
  char v71[24];
  char v72[24];
  char v73[24];
  char v74[24];
  char v75[24];
  char v76[24];
  char v77[24];
  char v78[24];
  char v79[24];
  char v80[24];
  char v81[24];
  char v82[24];
  uint64_t v83;
  uint64_t v84;
  void (*v85)(uint64_t, const char *, uint64_t, __int128 *);
  void *v86;
  id v87;
  CSSearchableItemAttributeSet *v88;
  uint64_t v89;
  uint64_t v90;
  void (*v91)(uint64_t, const char *, uint64_t, __int128 *);
  void *v92;
  id v93;
  CSSearchableItemAttributeSet *v94;
  char v95[24];
  char v96[24];
  char v97[24];
  char v98[24];
  char v99[24];
  char v100[24];
  char v101[24];
  __int128 v102;
  uint64_t v103;

  v3 = a2;
  v102 = *a1;
  v103 = *((_QWORD *)a1 + 2);
  switch(_MDPlistGetPlistObjectType())
  {
    case 0xF0u:
      v102 = *a1;
      v103 = *((_QWORD *)a1 + 2);
      v4 = (const char *)CSCoderClassNameForObject();
      if (!v4)
        goto LABEL_36;
      v5 = v4;
      if (!strcmp(v4, "CSPerson") || !strcmp(v5, "MDPerson"))
      {
        v102 = *a1;
        v103 = *((_QWORD *)a1 + 2);
        Count = _MDPlistArrayGetCount();
        v22 = Count;
        if (Count != 10 && Count != 6)
          goto LABEL_36;
        v102 = *a1;
        v103 = *((_QWORD *)a1 + 2);
        _MDPlistArrayGetPlistObjectAtIndex();
        _CSDecodeObject(v101, v3);
        v6 = (CSPerson *)objc_claimAutoreleasedReturnValue();
        v102 = *a1;
        v103 = *((_QWORD *)a1 + 2);
        _MDPlistArrayGetPlistObjectAtIndex();
        _CSDecodeObject(v100, v3);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v102 = *a1;
        v103 = *((_QWORD *)a1 + 2);
        _MDPlistArrayGetPlistObjectAtIndex();
        _CSDecodeObject(v99, v3);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v102 = *a1;
        v103 = *((_QWORD *)a1 + 2);
        _MDPlistArrayGetPlistObjectAtIndex();
        _CSDecodeObject(v98, v3);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v102 = *a1;
        v103 = *((_QWORD *)a1 + 2);
        _MDPlistArrayGetPlistObjectAtIndex();
        _CSDecodeObject(v97, v3);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22 == 6)
        {
          v13 = -[CSPerson initWithDisplayName:handles:handleIdentifier:photosPersonIdentifier:]([CSPerson alloc], "initWithDisplayName:handles:handleIdentifier:photosPersonIdentifier:", v6, v23, v7, v25);
        }
        else
        {
          v102 = *a1;
          v103 = *((_QWORD *)a1 + 2);
          _MDPlistArrayGetPlistObjectAtIndex();
          _CSDecodeObject(v96, v3);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v102 = *a1;
          v103 = *((_QWORD *)a1 + 2);
          _MDPlistArrayGetPlistObjectAtIndex();
          _CSDecodeObject(v95, v3);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v102 = *a1;
          v103 = *((_QWORD *)a1 + 2);
          _MDPlistArrayGetPlistObjectAtIndex();
          IntValue = _MDPlistNumberGetIntValue();
          v102 = *a1;
          v103 = *((_QWORD *)a1 + 2);
          _MDPlistArrayGetPlistObjectAtIndex();
          v13 = -[CSPerson initWithDisplayName:handles:handleIdentifier:photosPersonIdentifier:isPhotosPerson:personType:nameAlternatives:faceAttributes:]([CSPerson alloc], "initWithDisplayName:handles:handleIdentifier:photosPersonIdentifier:isPhotosPerson:personType:nameAlternatives:faceAttributes:", v6, v23, v7, v25, _MDPlistBooleanGetValue() != 0, IntValue, v62, v32);

        }
        if (objc_msgSend(v24, "length"))
          -[CSPerson setContactIdentifier:](v13, "setContactIdentifier:", v24);

LABEL_34:
        goto LABEL_35;
      }
      if (!strcmp(v5, "CSSearchableItemAttributeSet") || !strcmp(v5, "MDSearchableItemAttributeSet"))
      {
        v102 = *a1;
        v103 = *((_QWORD *)a1 + 2);
        v26 = _MDPlistArrayGetCount();
        if ((v26 - 3) > 1)
        {
LABEL_36:
          v33 = objc_alloc(MEMORY[0x1E0C99DE8]);
          v102 = *a1;
          v103 = *((_QWORD *)a1 + 2);
          v34 = (void *)objc_msgSend(v33, "initWithCapacity:", _MDPlistArrayGetCount());
          v65 = v3;
          v66 = v34;
          v102 = *a1;
          v103 = *((_QWORD *)a1 + 2);
          _MDPlistArrayIterate();
          v13 = (CSPerson *)v66;

          v14 = v65;
          goto LABEL_37;
        }
        v27 = v26;
        v28 = objc_alloc_init(CSSearchableItemAttributeSet);
        v102 = *a1;
        v103 = *((_QWORD *)a1 + 2);
        _MDPlistArrayGetPlistObjectAtIndex();
        -[CSSearchableItemAttributeSet setSearchableItemFlags:](v28, "setSearchableItemFlags:", _MDPlistNumberGetIntValue());
        v102 = *a1;
        v103 = *((_QWORD *)a1 + 2);
        _MDPlistArrayGetPlistObjectAtIndex();
        v29 = MEMORY[0x1E0C809B0];
        v89 = MEMORY[0x1E0C809B0];
        v90 = 3221225472;
        v91 = ___CSDecodeObject_block_invoke;
        v92 = &unk_1E2401C58;
        v30 = v3;
        v93 = v30;
        v31 = v28;
        v94 = v31;
        _MDPlistDictionaryIterate();
        if (v27 == 4)
        {
          v102 = *a1;
          v103 = *((_QWORD *)a1 + 2);
          _MDPlistArrayGetPlistObjectAtIndex();
          v83 = v29;
          v84 = 3221225472;
          v85 = ___CSDecodeObject_block_invoke_2;
          v86 = &unk_1E2401C58;
          v87 = v30;
          v88 = v31;
          _MDPlistDictionaryIterate();

        }
        v6 = v31;

        v13 = v6;
      }
      else if (!strcmp(v5, "CSLocalizedString") || !strcmp(v5, "MDLocalizedString"))
      {
        v102 = *a1;
        v103 = *((_QWORD *)a1 + 2);
        if (_MDPlistArrayGetCount() != 2)
          goto LABEL_36;
        v102 = *a1;
        v103 = *((_QWORD *)a1 + 2);
        _MDPlistArrayGetPlistObjectAtIndex();
        _CSDecodeObject(v82, v3);
        v6 = (CSPerson *)objc_claimAutoreleasedReturnValue();
        v13 = -[CSLocalizedString initWithLocalizedStrings:]([CSLocalizedString alloc], "initWithLocalizedStrings:", v6);
      }
      else
      {
        if (strcmp(v5, "CSUserAction"))
        {
          if (strcmp(v5, "CSSceneClassification"))
          {
            if (!strcmp(v5, "CSDocumentUnderstandingTopic"))
            {
              v102 = *a1;
              v103 = *((_QWORD *)a1 + 2);
              if (_MDPlistArrayGetCount() != 4)
                goto LABEL_36;
              v102 = *a1;
              v103 = *((_QWORD *)a1 + 2);
              _MDPlistArrayGetPlistObjectAtIndex();
              _CSDecodeObject(v70, v3);
              v6 = (CSPerson *)objc_claimAutoreleasedReturnValue();
              v102 = *a1;
              v103 = *((_QWORD *)a1 + 2);
              _MDPlistArrayGetPlistObjectAtIndex();
              _CSDecodeObject(v69, v3);
              v7 = (void *)objc_claimAutoreleasedReturnValue();
              v102 = *a1;
              v103 = *((_QWORD *)a1 + 2);
              _MDPlistArrayGetPlistObjectAtIndex();
              _MDPlistNumberGetDoubleValue();
              v9 = v49;
              v10 = CSDocumentUnderstandingTopic;
            }
            else
            {
              if (strcmp(v5, "CSDocumentUnderstandingCategory"))
                goto LABEL_36;
              v102 = *a1;
              v103 = *((_QWORD *)a1 + 2);
              if (_MDPlistArrayGetCount() != 4)
                goto LABEL_36;
              v102 = *a1;
              v103 = *((_QWORD *)a1 + 2);
              _MDPlistArrayGetPlistObjectAtIndex();
              _CSDecodeObject(v68, v3);
              v6 = (CSPerson *)objc_claimAutoreleasedReturnValue();
              v102 = *a1;
              v103 = *((_QWORD *)a1 + 2);
              _MDPlistArrayGetPlistObjectAtIndex();
              _CSDecodeObject(v67, v3);
              v7 = (void *)objc_claimAutoreleasedReturnValue();
              v102 = *a1;
              v103 = *((_QWORD *)a1 + 2);
              _MDPlistArrayGetPlistObjectAtIndex();
              _MDPlistNumberGetDoubleValue();
              v9 = v8;
              v10 = CSDocumentUnderstandingCategory;
            }
            v13 = (CSPerson *)objc_msgSend([v10 alloc], "initWithLabel:synonyms:confidence:", v6, v7, v9);
            goto LABEL_34;
          }
          v102 = *a1;
          v103 = *((_QWORD *)a1 + 2);
          v44 = _MDPlistArrayGetCount();
          if (v44 > 0xA)
            goto LABEL_36;
          v45 = v44;
          if (((1 << v44) & 0x660) == 0)
            goto LABEL_36;
          v102 = *a1;
          v103 = *((_QWORD *)a1 + 2);
          _MDPlistArrayGetPlistObjectAtIndex();
          _CSDecodeObject(v72, v3);
          v6 = (CSPerson *)objc_claimAutoreleasedReturnValue();
          v102 = *a1;
          v103 = *((_QWORD *)a1 + 2);
          _MDPlistArrayGetPlistObjectAtIndex();
          _CSDecodeObject(v71, v3);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v102 = *a1;
          v103 = *((_QWORD *)a1 + 2);
          _MDPlistArrayGetPlistObjectAtIndex();
          _MDPlistNumberGetDoubleValue();
          v48 = v47;
          v102 = *a1;
          v103 = *((_QWORD *)a1 + 2);
          _MDPlistArrayGetPlistObjectAtIndex();
          v13 = -[CSSceneClassification initWithLabel:synonyms:confidence:sceneIdentifier:]([CSSceneClassification alloc], "initWithLabel:synonyms:confidence:sceneIdentifier:", v6, v46, _MDPlistNumberGetIntValue(), v48);
          if (v45 == 6)
          {
            v102 = *a1;
            v103 = *((_QWORD *)a1 + 2);
          }
          else
          {
            if (v45 < 9)
              goto LABEL_56;
            v102 = *a1;
            v103 = *((_QWORD *)a1 + 2);
            _MDPlistArrayGetPlistObjectAtIndex();
            _MDPlistNumberGetDoubleValue();
            v51 = (double)v50;
            v102 = *a1;
            v103 = *((_QWORD *)a1 + 2);
            _MDPlistArrayGetPlistObjectAtIndex();
            _MDPlistNumberGetDoubleValue();
            v53 = (double)v52;
            v102 = *a1;
            v103 = *((_QWORD *)a1 + 2);
            _MDPlistArrayGetPlistObjectAtIndex();
            _MDPlistNumberGetDoubleValue();
            v55 = (double)v54;
            v102 = *a1;
            v103 = *((_QWORD *)a1 + 2);
            _MDPlistArrayGetPlistObjectAtIndex();
            _MDPlistNumberGetDoubleValue();
            -[CSPerson setBoundingBox:](v13, "setBoundingBox:", v51, v53, v55, (double)v56);
            if (v45 != 10)
              goto LABEL_56;
            v102 = *a1;
            v103 = *((_QWORD *)a1 + 2);
          }
          _MDPlistArrayGetPlistObjectAtIndex();
          -[CSPerson setSceneType:](v13, "setSceneType:", _MDPlistNumberGetIntValue());
LABEL_56:

          goto LABEL_35;
        }
        v102 = *a1;
        v103 = *((_QWORD *)a1 + 2);
        v36 = _MDPlistArrayGetCount();
        v37 = v36;
        if (v36 != 12 && v36 != 7)
          goto LABEL_36;
        v13 = objc_alloc_init(CSUserAction);
        v102 = *a1;
        v103 = *((_QWORD *)a1 + 2);
        _MDPlistArrayGetPlistObjectAtIndex();
        _CSDecodeObject(v81, v3);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSPerson setItemIdentifier:](v13, "setItemIdentifier:", v38);

        v102 = *a1;
        v103 = *((_QWORD *)a1 + 2);
        _MDPlistArrayGetPlistObjectAtIndex();
        _CSDecodeObject(v80, v3);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSPerson setContentAction:](v13, "setContentAction:", v39);

        v102 = *a1;
        v103 = *((_QWORD *)a1 + 2);
        _MDPlistArrayGetPlistObjectAtIndex();
        -[CSPerson setEligibility:](v13, "setEligibility:", _MDPlistNumberGetIntValue());
        v102 = *a1;
        v103 = *((_QWORD *)a1 + 2);
        _MDPlistArrayGetPlistObjectAtIndex();
        _CSDecodeObject(v79, v3);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSPerson setUserInfo:](v13, "setUserInfo:", v40);

        v102 = *a1;
        v103 = *((_QWORD *)a1 + 2);
        _MDPlistArrayGetPlistObjectAtIndex();
        _CSDecodeObject(v78, v3);
        v6 = (CSPerson *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSPerson setKeywords:](v13, "setKeywords:", v41);

        v102 = *a1;
        v103 = *((_QWORD *)a1 + 2);
        _MDPlistArrayGetPlistObjectAtIndex();
        _CSDecodeObject(v77, v3);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (v42)
        {
          v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v42);
          -[CSPerson setUaIdentifier:](v13, "setUaIdentifier:", v43);

        }
        else
        {
          -[CSPerson setUaIdentifier:](v13, "setUaIdentifier:", 0);
        }
        if (v37 == 12)
        {
          v102 = *a1;
          v103 = *((_QWORD *)a1 + 2);
          _MDPlistArrayGetPlistObjectAtIndex();
          _CSDecodeObject(v76, v3);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          -[CSPerson setMadeInitiallyCurrentDates:](v13, "setMadeInitiallyCurrentDates:", v57);

          v102 = *a1;
          v103 = *((_QWORD *)a1 + 2);
          _MDPlistArrayGetPlistObjectAtIndex();
          _CSDecodeObject(v75, v3);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          -[CSPerson setMadeCurrentDates:](v13, "setMadeCurrentDates:", v58);

          v102 = *a1;
          v103 = *((_QWORD *)a1 + 2);
          _MDPlistArrayGetPlistObjectAtIndex();
          _CSDecodeObject(v74, v3);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          -[CSPerson setMadeCurrentEndDates:](v13, "setMadeCurrentEndDates:", v59);

          v102 = *a1;
          v103 = *((_QWORD *)a1 + 2);
          _MDPlistArrayGetPlistObjectAtIndex();
          _CSDecodeObject(v73, v3);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          -[CSPerson setSentToIndexerDates:](v13, "setSentToIndexerDates:", v60);

          v102 = *a1;
          v103 = *((_QWORD *)a1 + 2);
          _MDPlistArrayGetPlistObjectAtIndex();
          _MDPlistNumberGetDoubleValue();
          -[CSPerson setMadeCurrentInterval:](v13, "setMadeCurrentInterval:");
        }

      }
LABEL_35:

      if (!v13)
        goto LABEL_36;
LABEL_38:

      return v13;
    case 0xF1u:
      v11 = objc_alloc(MEMORY[0x1E0C99E08]);
      v102 = *a1;
      v103 = *((_QWORD *)a1 + 2);
      v12 = (void *)objc_msgSend(v11, "initWithCapacity:", _MDPlistDictionaryGetCount());
      v63 = v3;
      v64 = v12;
      v102 = *a1;
      v103 = *((_QWORD *)a1 + 2);
      _MDPlistDictionaryIterate();
      v13 = (CSPerson *)v64;

      v14 = v63;
LABEL_37:

      goto LABEL_38;
    case 0xF5u:
      v102 = *a1;
      v103 = *((_QWORD *)a1 + 2);
      Value = (const UInt8 *)_MDPlistStringGetValue();
      v15 = (uint64_t)CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x1E0C9AE00], Value, 0, 0, 1u);
      goto LABEL_25;
    case 0xF6u:
      v102 = *a1;
      v103 = *((_QWORD *)a1 + 2);
      BytePtr = (const UInt8 *)_MDPlistDataGetBytePtr();
      v18 = BytePtr;
      v19 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      if (v3)
      {
        v20 = (const __CFAllocator *)CSCodedDataDealloctor(BytePtr, v3);
        v15 = (uint64_t)CFDataCreateWithBytesNoCopy(v19, v18, 0, v20);
      }
      else
      {
        v15 = (uint64_t)CFDataCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], BytePtr, 0);
      }
      goto LABEL_25;
    default:
      v102 = *a1;
      v103 = *((_QWORD *)a1 + 2);
      v15 = _MDPlistContainerCopyObject();
LABEL_25:
      v13 = (CSPerson *)v15;
      goto LABEL_38;
  }
}

uint64_t CSCoderClassNameForObject()
{
  int PlistObjectType;
  uint64_t result;

  if (_MDPlistGetPlistObjectType() != 240 || _MDPlistArrayGetCount() < 2)
    return 0;
  _MDPlistArrayGetPlistObjectAtIndex();
  PlistObjectType = _MDPlistGetPlistObjectType();
  result = 0;
  if (PlistObjectType == 244)
  {
    _MDPlistStringGetValue();
    return 0;
  }
  return result;
}

void sub_18C44D750(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18C44D8F0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18C44DA0C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void __initEntitlements_block_invoke()
{
  __SecTask *v0;
  __SecTask *v1;
  const __CFBoolean *v2;
  const __CFBoolean *v3;
  CFTypeID v4;
  BOOL v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CFErrorRef v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  CFTypeRef v32;
  const void *v33;
  CFTypeID v34;
  void *v35;
  CFErrorRef v36;
  NSObject *v37;
  NSObject *v38;
  CFTypeID v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const __CFBoolean *v49;
  const __CFBoolean *v50;
  CFTypeID v51;
  BOOL v52;
  CFErrorRef v53;
  NSObject *v54;
  NSObject *v55;
  NSObject *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const __CFBoolean *v64;
  const __CFBoolean *v65;
  CFTypeID v66;
  NSObject *v67;
  CFErrorRef v68;
  NSObject *v69;
  NSObject *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  CFTypeRef v78;
  const void *v79;
  CFTypeID TypeID;
  void *v81;
  NSObject *v82;
  CFTypeRef v83;
  const void *v84;
  CFTypeID v85;
  void *v86;
  NSObject *v87;
  uint64_t v88;
  void *v89;
  CFTypeRef v90;
  const void *v91;
  CFTypeID v92;
  void *v93;
  NSObject *v94;
  CFErrorRef error;
  uint8_t buf[4];
  const __CFString *v97;
  __int16 v98;
  CFErrorRef v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v0 = SecTaskCreateFromSelf(0);
  if (v0)
  {
    v1 = v0;
    error = 0;
    v2 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v0, CFSTR("com.apple.private.corespotlight.internal"), &error);
    if (v2)
    {
      v3 = v2;
      v4 = CFGetTypeID(v2);
      v5 = v4 == CFBooleanGetTypeID() && CFBooleanGetValue(v3) != 0;
      sInternalCSEntitlement = v5;
      logForCSLogCategoryDefault();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        __initEntitlements_block_invoke_cold_12(v17, v18, v19, v20, v21, v22, v23, v24);

      CFRelease(v3);
    }
    else
    {
      v14 = error;
      logForCSLogCategoryDefault();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v14)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          __initEntitlements_block_invoke_cold_11();
      }
      else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        __initEntitlements_block_invoke_cold_10(v16, v25, v26, v27, v28, v29, v30, v31);
      }

    }
    if (error)
    {
      CFRelease(error);
      error = 0;
    }
    v32 = SecTaskCopyValueForEntitlement(v1, CFSTR("com.apple.corespotlight.privateindex.uuid"), &error);
    if (v32)
    {
      v33 = v32;
      v34 = CFGetTypeID(v32);
      if (v34 == CFStringGetTypeID())
      {
        v35 = (void *)CFRetain(v33);
      }
      else
      {
        v39 = CFGetTypeID(v33);
        if (v39 == CFUUIDGetTypeID())
          v35 = (void *)CFUUIDCreateString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFUUIDRef)v33);
        else
          v35 = 0;
      }
      v40 = (void *)sOverrideUUID;
      sOverrideUUID = (uint64_t)v35;

      logForCSLogCategoryDefault();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        __initEntitlements_block_invoke_cold_9();

      CFRelease(v33);
    }
    else
    {
      v36 = error;
      logForCSLogCategoryDefault();
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = v37;
      if (v36)
      {
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          __initEntitlements_block_invoke_cold_8();
      }
      else if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        __initEntitlements_block_invoke_cold_7(v38, v42, v43, v44, v45, v46, v47, v48);
      }

    }
    if (error)
    {
      CFRelease(error);
      error = 0;
    }
    v49 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v1, CFSTR("com.apple.corespotlight.privateindex.unsandboxed"), &error);
    if (v49)
    {
      v50 = v49;
      v51 = CFGetTypeID(v49);
      v52 = v51 == CFBooleanGetTypeID() && CFBooleanGetValue(v50) != 0;
      sPrivateIndexUnsandboxEntitlement = v52;
      logForCSLogCategoryDefault();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v97 = CFSTR("com.apple.corespotlight.privateindex.unsandboxed");
        v98 = 2112;
        v99 = (CFErrorRef)CFSTR("YES");
        _os_log_impl(&dword_18C42F000, v56, OS_LOG_TYPE_INFO, "Found \"%@\" entitlement, value:%@", buf, 0x16u);
      }

      CFRelease(v50);
    }
    else
    {
      v53 = error;
      logForCSLogCategoryDefault();
      v54 = objc_claimAutoreleasedReturnValue();
      v55 = v54;
      if (v53)
      {
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v97 = CFSTR("com.apple.corespotlight.privateindex.unsandboxed");
          v98 = 2112;
          v99 = error;
          _os_log_impl(&dword_18C42F000, v55, OS_LOG_TYPE_DEFAULT, "SecTaskCopyValueForEntitlement failed for \"%@\", error:%@", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
      {
        __initEntitlements_block_invoke_cold_6(v55, v57, v58, v59, v60, v61, v62, v63);
      }

    }
    if (error)
    {
      CFRelease(error);
      error = 0;
    }
    v64 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v1, CFSTR("com.apple.corespotlight.managedindex.unsandboxed"), &error);
    if (v64)
    {
      v65 = v64;
      v66 = CFGetTypeID(v64);
      if (v66 == CFBooleanGetTypeID())
        CFBooleanGetValue(v65);
      logForCSLogCategoryDefault();
      v67 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v97 = CFSTR("com.apple.corespotlight.managedindex.unsandboxed");
        v98 = 2112;
        v99 = (CFErrorRef)CFSTR("YES");
        _os_log_impl(&dword_18C42F000, v67, OS_LOG_TYPE_INFO, "Found \"%@\" entitlement, value:%@", buf, 0x16u);
      }

      CFRelease(v65);
    }
    else
    {
      v68 = error;
      logForCSLogCategoryDefault();
      v69 = objc_claimAutoreleasedReturnValue();
      v70 = v69;
      if (v68)
      {
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v97 = CFSTR("com.apple.corespotlight.managedindex.unsandboxed");
          v98 = 2112;
          v99 = error;
          _os_log_impl(&dword_18C42F000, v70, OS_LOG_TYPE_DEFAULT, "SecTaskCopyValueForEntitlement failed for \"%@\", error:%@", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
      {
        __initEntitlements_block_invoke_cold_5(v70, v71, v72, v73, v74, v75, v76, v77);
      }

    }
    if (error)
    {
      CFRelease(error);
      error = 0;
    }
    v78 = SecTaskCopyValueForEntitlement(v1, CFSTR("com.apple.private.corespotlight.bundleid"), 0);
    if (v78)
    {
      v79 = v78;
      TypeID = CFStringGetTypeID();
      if (TypeID == CFGetTypeID(v79))
      {
        v81 = (void *)sApplicationIdentifier;
        sApplicationIdentifier = (uint64_t)v79;

        logForCSLogCategoryDefault();
        v82 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
          __initEntitlements_block_invoke_cold_4();

      }
      else
      {
        CFRelease(v79);
      }
    }
    if (!sApplicationIdentifier)
    {
      v83 = SecTaskCopyValueForEntitlement(v1, CFSTR("application-identifier"), 0);
      if (v83)
      {
        v84 = v83;
        v85 = CFStringGetTypeID();
        if (v85 == CFGetTypeID(v84))
        {
          v86 = (void *)sApplicationIdentifier;
          sApplicationIdentifier = (uint64_t)v84;

          logForCSLogCategoryDefault();
          v87 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
            __initEntitlements_block_invoke_cold_3();

        }
        else
        {
          CFRelease(v84);
        }
      }
      if (!sApplicationIdentifier)
      {
        v90 = SecTaskCopyValueForEntitlement(v1, CFSTR("com.apple.application-identifier"), 0);
        if (v90)
        {
          v91 = v90;
          v92 = CFStringGetTypeID();
          if (v92 == CFGetTypeID(v91))
          {
            v93 = (void *)sApplicationIdentifier;
            sApplicationIdentifier = (uint64_t)v91;

            logForCSLogCategoryDefault();
            v94 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
              __initEntitlements_block_invoke_cold_2();

          }
          else
          {
            CFRelease(v91);
          }
        }
      }
    }
    CFRelease(v1);
    bzero(buf, 0x400uLL);
    getpid();
    if (!sandbox_container_path_for_pid())
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", buf, 4);
      v88 = objc_claimAutoreleasedReturnValue();
      v89 = (void *)sSandboxContainer;
      sSandboxContainer = v88;

    }
  }
  else
  {
    logForCSLogCategoryDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __initEntitlements_block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);

  }
}

void sub_18C44E5CC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

Class __getPSSSSubscriptionManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!ParsecSubscriptionServiceSupportLibraryCore_frameworkLibrary)
  {
    ParsecSubscriptionServiceSupportLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!ParsecSubscriptionServiceSupportLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("PSSSSubscriptionManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getPSSSSubscriptionManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getPSSSSubscriptionManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_18C44EBE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;

  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_18C44EF20(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18C44F058(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18C44F88C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18C44FE84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18C450120(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

__CFString *_MDPlainTextFromHTMLData(void *a1, unint64_t a2, _QWORD *a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  _MDHTMLParsing *v10;
  id v11;
  NSMutableDictionary *v12;
  _MDHTMLParsing *v13;
  _MDHTMLParsing *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  __CFString *v26;
  CFIndex uniCharLen;

  v7 = a1;
  v8 = v7;
  if (!v7 || !objc_msgSend(v7, "length"))
  {
    v12 = 0;
    v26 = 0;
    if (!a3)
      goto LABEL_18;
LABEL_17:
    *a3 = objc_retainAutorelease(v12);
    goto LABEL_18;
  }
  v9 = (void *)MEMORY[0x18D782104]();
  v10 = -[_MDHTMLParsing initWithEncoding:]([_MDHTMLParsing alloc], "initWithEncoding:", a4);
  v10->indexingLimit = a2;
  v11 = objc_retainAutorelease(v8);
  scanXml(objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"), (uint64_t (*)(void *, unsigned __int8 *, int64_t, int64_t))beginElement, (uint64_t (*)(void *, unsigned __int8 *, int64_t, int64_t))endElement, (uint64_t (*)(void *, unsigned __int8 *, int64_t, char *, int64_t))handleAttribute, v10);
  v12 = 0;
  if (a3 && v10->titleLength)
  {
    v13 = -[_MDHTMLParsing initWithEncoding:]([_MDHTMLParsing alloc], "initWithEncoding:", a4);
    v14 = v13;
    v13->sourceEncoding = v10->sourceEncoding;
    v13->sourceCFEncoding = v10->sourceCFEncoding;
    v15 = 512;
    if (a2 > 0x200)
      v15 = a2;
    v13->indexingLimit = v15;
    scanXml((uint64_t)v10->titleStart, v10->titleLength, 0, 0, 0, v13);
    if (v14->uniCharLen)
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", v10->uniChars, v10->uniCharLen);
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringByTrimmingCharactersInSet:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "rangeOfString:", CFSTR("\n"));
      if (v19)
      {
        objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "));
        v20 = objc_claimAutoreleasedReturnValue();

        v18 = (void *)v20;
      }
      objc_msgSend(v18, "rangeOfString:", CFSTR("\t"));
      if (v21)
      {
        objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\t"), CFSTR(" "));
        v22 = objc_claimAutoreleasedReturnValue();

        v18 = (void *)v22;
      }
      v23 = 10;
      while (1)
      {
        objc_msgSend(v18, "rangeOfString:", CFSTR("  "));
        if (!v24)
          break;
        objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:", CFSTR("  "), CFSTR(" "));
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = v25;
        if (!--v23)
          goto LABEL_20;
      }
      v25 = v18;
LABEL_20:
      -[NSMutableDictionary setObject:forKeyedSubscript:](v10->attributes, "setObject:forKeyedSubscript:", v25, CFSTR("NSTitleDocumentAttribute"));

    }
    v12 = v10->attributes;

  }
  uniCharLen = v10->uniCharLen;
  if (uniCharLen)
  {
    v26 = (__CFString *)CFStringCreateWithCharactersNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v10->uniChars, uniCharLen, (CFAllocatorRef)sHTMLDataDeallocator);
    v10->uniChars = 0;
  }
  else
  {
    v26 = 0;
  }

  objc_autoreleasePoolPop(v9);
  if (a3)
    goto LABEL_17;
LABEL_18:

  return v26;
}

uint64_t scanXml(uint64_t result, uint64_t a2, uint64_t (*a3)(void *, unsigned __int8 *, int64_t, int64_t), uint64_t (*a4)(void *, unsigned __int8 *, int64_t, int64_t), uint64_t (*a5)(void *, unsigned __int8 *, int64_t, char *, int64_t), void *a6)
{
  unsigned __int8 *i;
  unint64_t v7;
  uint64_t v8;
  unsigned __int8 *v9;
  int v10;
  int v11;
  unsigned __int8 *v12;
  uint64_t v13;
  int v14;
  unsigned __int8 *v15;
  uint64_t v16;
  uint64_t (*v17)(void *, unsigned __int8 *, int64_t, int64_t);
  unint64_t v18;
  uint64_t v19;
  int v21;
  unint64_t v22;
  uint64_t v23;
  _BOOL4 v24;
  unsigned __int8 *v25;
  unsigned __int8 *v26;
  uint64_t v27;
  unsigned __int8 *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  int v33;
  unsigned __int8 *v34;
  unsigned __int8 *v35;
  uint64_t (*v36)(void *, unsigned __int8 *, int64_t, char *, int64_t);
  char *v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  unsigned __int8 *v41;
  unint64_t v42;
  uint64_t (*v43)(void *, unsigned __int8 *, int64_t, int64_t);
  uint64_t v44;
  unsigned __int8 *v46;
  unint64_t v47;
  uint64_t v48;
  __darwin_ct_rune_t v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v56;
  uint64_t (*v57)(void *, unsigned __int8 *, int64_t, int64_t);

  if (a2 < 1)
    return result;
  i = (unsigned __int8 *)result;
  v7 = result + a2;
  v53 = result + a2 - 2;
  v8 = MEMORY[0x1E0C80978];
  v56 = result + a2 - 1;
  do
  {
    v9 = i;
    while (1)
    {
      v10 = *v9;
      if (v10 == 38 || v10 == 60)
        break;
      if ((unint64_t)++v9 >= v7)
      {
        v11 = 0;
        goto LABEL_9;
      }
    }
    v11 = 1;
LABEL_9:
    if (v9 != i)
      result = handleText(a6, (uint64_t)i, v9 - i);
    if (!v11)
      return result;
    if (*v9 == 38)
    {
      v12 = v9 + 1;
      while (1)
      {
        i = v12;
        if ((unint64_t)v12 >= v7)
          break;
        v13 = *v12;
        if (v13 == 59)
          goto LABEL_21;
        if ((v13 & 0x80) != 0)
          v14 = __maskrune(v13, 0x4000uLL);
        else
          v14 = *(_DWORD *)(v8 + 4 * v13 + 60) & 0x4000;
        v12 = i + 1;
        if (v14)
        {
          if (*i != 59)
            break;
LABEL_21:
          ++i;
          break;
        }
      }
      result = handleEntity(a6, (uint64_t)v9, i - v9);
      continue;
    }
    v15 = v9 + 1;
    if ((unint64_t)(v9 + 1) >= v7)
    {
LABEL_26:
      v17 = a3;
      goto LABEL_27;
    }
    v16 = *v15;
    if ((char)*v15 < 0)
    {
      result = __maskrune(*v15, 0x500uLL);
      if ((_DWORD)result)
        goto LABEL_26;
    }
    else
    {
      result = *(_DWORD *)(v8 + 4 * v16 + 60) & 0x500;
      if ((_DWORD)result)
        goto LABEL_26;
    }
    if ((_DWORD)v16 == 33)
    {
      v15 = v9 + 2;
      if ((unint64_t)(v9 + 2) < v7 && (uint64_t)(v7 - (_QWORD)v15) >= 10 && *v15 == 91)
      {
        result = strncmp((const char *)v9 + 2, "[CDATA[", 7uLL);
        if (!(_DWORD)result)
        {
          for (i = v9 + 11; ; i += v52)
          {
            if ((unint64_t)i >= v7)
              goto LABEL_119;
            v51 = *i;
            if (v51 == 93)
            {
              v52 = 1;
            }
            else
            {
              if (v51 == 62 && *(i - 1) == 93 && *(i - 2) == 93)
                goto LABEL_119;
              v52 = 3;
            }
          }
        }
      }
      if ((unint64_t)(v9 + 3) < v7 && *v15 == 45 && v9[3] == 45)
      {
        v46 = v9 + 4;
        while (1)
        {
          if ((unint64_t)v46 < v7)
          {
            v47 = v7 - (_QWORD)v46;
            do
            {
              if (*v46 == 45)
                goto LABEL_139;
              ++v46;
              --v47;
            }
            while (v47);
            v46 = (unsigned __int8 *)v7;
          }
LABEL_139:
          if ((uint64_t)(v7 - (_QWORD)v46) < 4 || (result = strncmp((const char *)v46, "-->", 3uLL), (_DWORD)result))
          {
            i = v46 + 1;
            v48 = v7 - (_QWORD)(v46 + 1);
          }
          else
          {
            i = v46 + 3;
            v49 = v46[3];
            if (v49 != 60)
              goto LABEL_172;
            v49 = v46[4];
            if ((char)v46[4] < 0)
              result = __maskrune(v46[4], 0x500uLL);
            else
              result = *(_DWORD *)(v8 + 4 * v46[4] + 60) & 0x500;
            if ((_DWORD)result)
              goto LABEL_119;
            if (v49 != 33)
            {
              if (v49 == 47 || v49 == 63)
                goto LABEL_119;
LABEL_172:
              if ((v49 & 0x80) != 0)
                result = __maskrune(v49, 0x4000uLL);
              goto LABEL_119;
            }
            v48 = v7 - (_QWORD)i;
            if ((uint64_t)(v7 - (_QWORD)i) < 3 || v46[5] != 45 || v46[6] != 45)
              goto LABEL_119;
          }
          v46 = i;
          if (v48 <= 3)
            goto LABEL_119;
        }
      }
      if ((unint64_t)v15 < v7)
      {
        v50 = v53 - (_QWORD)v9;
        while (*v15 != 62)
        {
          ++v15;
          if (!--v50)
          {
            v17 = 0;
            v15 = (unsigned __int8 *)v7;
            goto LABEL_27;
          }
        }
      }
      v17 = 0;
    }
    else if ((_DWORD)v16 == 63)
    {
      v17 = 0;
      v15 = v9 + 2;
    }
    else
    {
      v17 = a3;
      if ((_DWORD)v16 == 47)
      {
        v15 = v9 + 2;
        v17 = a4;
      }
    }
LABEL_27:
    if ((unint64_t)v15 < v7)
    {
      v18 = v7 - (_QWORD)v15;
      while (1)
      {
        v19 = *v15;
        result = (char)*v15 < 0 ? __maskrune(*v15, 0x4000uLL) : *(_DWORD *)(v8 + 4 * v19 + 60) & 0x4000u;
        if ((_DWORD)v19 == 62 || (_DWORD)result != 0)
          break;
        ++v15;
        if (!--v18)
        {
          v15 = (unsigned __int8 *)v7;
          break;
        }
      }
    }
    i = v15;
    v57 = v17;
    if ((unint64_t)v15 >= v7)
    {
      v34 = v15;
      goto LABEL_100;
    }
    do
    {
      v21 = *i;
      if (v21 == 47 || v21 == 62)
        goto LABEL_98;
      if ((unint64_t)i < v7)
      {
        v22 = v7 - (_QWORD)i;
        do
        {
          v23 = *i;
          if ((char)*i < 0)
          {
            result = __maskrune(v23, 0x4000uLL);
            if (!(_DWORD)result)
              goto LABEL_50;
          }
          else
          {
            result = *(_DWORD *)(v8 + 4 * v23 + 60) & 0x4000;
            if (!(_DWORD)result)
              goto LABEL_50;
          }
          ++i;
          --v22;
        }
        while (v22);
        i = (unsigned __int8 *)v7;
      }
LABEL_50:
      if ((unint64_t)i >= v7)
        goto LABEL_98;
      if (*i - 61 >= 2)
      {
        v25 = (unsigned __int8 *)v7;
        v26 = i + 1;
        v27 = v56 - (_QWORD)i;
        while (1)
        {
          v28 = v26;
          if (!v27)
            break;
          ++v26;
          --v27;
          if (*v28 - 61 < 2)
          {
            v25 = v28;
            break;
          }
        }
        v24 = (unint64_t)v28 < v7;
      }
      else
      {
        v24 = 1;
        v25 = i;
      }
      if (v25 == i)
      {
LABEL_98:
        v34 = i;
        break;
      }
      v29 = 0;
      do
      {
        v30 = v29;
        v31 = (char *)&v25[v29];
        if (&v25[v29] <= i)
          break;
        v32 = *(v31 - 1);
        result = *(v31 - 1) < 0 ? __maskrune(v32, 0x4000uLL) : *(_DWORD *)(v8 + 4 * v32 + 60) & 0x4000u;
        v29 = v30 - 1;
      }
      while ((_DWORD)result);
      if (!v24 || *v25 == 62)
      {
        v33 = 32;
        v34 = v25;
        v35 = (unsigned __int8 *)v31;
        v36 = a5;
        goto LABEL_68;
      }
      v31 = (char *)(v25 + 1);
      do
      {
        v37 = v31;
        if ((unint64_t)v31 >= v7)
        {
          v33 = 32;
LABEL_86:
          v36 = a5;
          goto LABEL_87;
        }
        v38 = *v31;
        if (*v31 < 0)
          result = __maskrune(v38, 0x4000uLL);
        else
          result = *(_DWORD *)(v8 + 4 * v38 + 60) & 0x4000;
        ++v31;
      }
      while ((_DWORD)result);
      v33 = *v37;
      if (v33 == 34)
        goto LABEL_86;
      v36 = a5;
      if (v33 != 39)
      {
        v33 = 32;
        v31 = v37;
      }
LABEL_87:
      if ((unint64_t)v31 >= v7)
      {
        v34 = (unsigned __int8 *)v31;
        v35 = (unsigned __int8 *)v31;
      }
      else
      {
        v39 = 0;
        while (1)
        {
          v40 = v31[v39];
          if (v40 == v33 || v40 == 62)
            break;
          if (v7 - (_QWORD)v31 == ++v39)
          {
            v34 = (unsigned __int8 *)v7;
            v35 = (unsigned __int8 *)v7;
            goto LABEL_68;
          }
        }
        v35 = (unsigned __int8 *)&v31[v39];
        if (v40 == v33)
          v34 = v35 + 1;
        else
          v34 = v35;
      }
LABEL_68:
      if (v36)
        result = v36(a6, i, v25 - i + v30, v31, v35 - (unsigned __int8 *)v31);
      if ((unint64_t)v34 < v7 && v33 != 32 && *v34 == v33)
        ++v34;
      i = v34;
    }
    while ((unint64_t)v34 < v7);
    i = v34;
LABEL_100:
    if ((unint64_t)i >= v7)
    {
      v43 = v57;
    }
    else
    {
      v41 = (unsigned __int8 *)(&i[v7] - v34);
      v42 = v7 - (_QWORD)v34;
      v43 = v57;
      while (1)
      {
        v44 = *i;
        result = (char)*i < 0 ? __maskrune(*i, 0x4000uLL) : *(_DWORD *)(v8 + 4 * v44 + 60) & 0x4000u;
        if ((_DWORD)v44 != 47 && (_DWORD)result == 0)
          break;
        ++i;
        if (!--v42)
        {
          i = v41;
          goto LABEL_114;
        }
      }
      if (*i == 63)
      {
        ++i;
        v43 = 0;
      }
    }
LABEL_114:
    if ((unint64_t)i < v7 && *i == 62)
    {
      ++i;
      if (v43)
        result = v43(a6, v9, i - v9, v15 - v9);
    }
    else
    {
      result = handleText(a6, (uint64_t)v9, i - v9);
    }
LABEL_119:
    ;
  }
  while ((unint64_t)i < v7);
  return result;
}

uint64_t beginElement(void *a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  id v7;
  size_t v8;
  uint64_t v9;
  size_t v10;
  size_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  __CFString *v37;
  CFStringEncoding v38;
  void *v39;
  void *v40;
  void *v41;

  v7 = a1;
  if (*((_BYTE *)v7 + 144))
  {
    if (*(_BYTE *)(a3 + a2 - 1) == 62 && *(_BYTE *)(a3 + a2 - 2) == 47)
      goto LABEL_19;
    v8 = a4 - 1;
    v9 = MEMORY[0x1E0C80978];
    do
    {
      v10 = v8;
      v11 = v8 + 1;
      if ((uint64_t)(v8 + 1) < 3)
        break;
      v12 = *(unsigned __int8 *)(a2 + v8);
      v13 = *(char *)(a2 + v8) < 0 ? __maskrune(v12, 0x4000uLL) : *(_DWORD *)(v9 + 4 * v12 + 60) & 0x4000;
      v8 = v10 - 1;
    }
    while (v13);
    if (v11 == 1 || v11 == 4 && !strncasecmp_l((const char *)(a2 + 1), "img", 3uLL, 0))
      goto LABEL_19;
    if (*((_QWORD *)v7 + 17))
    {
      if (*((_QWORD *)v7 + 16) != v10 || strncasecmp_l((const char *)(a2 + 1), *((const char **)v7 + 15), v10, 0))
        goto LABEL_19;
      v14 = *((_QWORD *)v7 + 17) + 1;
    }
    else
    {
      *((_QWORD *)v7 + 15) = a2 + 1;
      *((_QWORD *)v7 + 16) = v10;
      v14 = 1;
    }
    *((_QWORD *)v7 + 17) = v14;
LABEL_19:
    *((_BYTE *)v7 + 144) = 0;
  }
  if (a3 < 7)
  {
    if (a3 != 6)
      goto LABEL_25;
  }
  else if (!strncasecmp_l((const char *)(a2 + 1), "script", 6uLL, 0))
  {
    *((_BYTE *)v7 + 118) = 1;
    goto LABEL_63;
  }
  if (!strncasecmp_l((const char *)(a2 + 1), "style", 5uLL, 0))
  {
    *((_BYTE *)v7 + 119) = 1;
    goto LABEL_63;
  }
LABEL_25:
  if (!*((_BYTE *)v7 + 116))
  {
    if (a3 < 5)
    {
      if (a3 != 4)
      {
        if (a3 < 3)
        {
          if (a3 != 2)
            goto LABEL_63;
          goto LABEL_61;
        }
LABEL_55:
        if (!strncasecmp_l((const char *)(a2 + 1), "br", 2uLL, 0)
          || !strncasecmp_l((const char *)(a2 + 1), "dt", 2uLL, 0)
          || !strncasecmp_l((const char *)(a2 + 1), "dd", 2uLL, 0)
          || !strncasecmp_l((const char *)(a2 + 1), "li", 2uLL, 0))
        {
          goto LABEL_62;
        }
LABEL_61:
        if (strncasecmp_l((const char *)(a2 + 1), "p", 1uLL, 0))
          goto LABEL_63;
        goto LABEL_62;
      }
    }
    else if (!strncasecmp_l((const char *)(a2 + 1), "head", 4uLL, 0))
    {
      *((_BYTE *)v7 + 116) = 1;
      goto LABEL_63;
    }
    if (!strncasecmp_l((const char *)(a2 + 1), "div", 3uLL, 0))
    {
LABEL_62:
      objc_msgSend(v7, "appendNewline");
      goto LABEL_63;
    }
    goto LABEL_55;
  }
  if (a3 >= 5)
  {
    if (strncasecmp_l((const char *)(a2 + 1), "title", 4uLL, 0))
    {
      if (!strncasecmp_l((const char *)(a2 + 1), "meta", 4uLL, 0))
      {
        v15 = (void *)*((_QWORD *)v7 + 7);
        if (v15)
        {
          v16 = (void *)*((_QWORD *)v7 + 9);
          if (v16)
            processMetaElement(*((void **)v7 + 6), v15, v16);
        }
        if (*((_QWORD *)v7 + 8))
        {
          if (*((_QWORD *)v7 + 9))
          {
            if (!objc_msgSend(CFSTR("content-type"), "caseInsensitiveCompare:"))
            {
              v17 = objc_msgSend(*((id *)v7 + 9), "rangeOfString:options:", CFSTR("charset"), 1);
              v19 = v18;
              v20 = objc_msgSend(*((id *)v7 + 9), "length");
              if (v19)
              {
                v21 = v20;
                v22 = v17 + v19;
                v23 = v20 - v22;
                if (v20 > v22)
                {
                  v24 = (void *)*((_QWORD *)v7 + 9);
                  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(" =\"'"));
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "invertedSet");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v27 = objc_msgSend(v24, "rangeOfCharacterFromSet:options:range:", v26, 0, v22, v23);
                  v29 = v28;

                  if (v29)
                  {
                    if (v27 < v21)
                    {
                      objc_msgSend(*((id *)v7 + 9), "substringFromIndex:", v27);
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("\"'"));
                      v31 = (void *)objc_claimAutoreleasedReturnValue();
                      v32 = objc_msgSend(v30, "rangeOfCharacterFromSet:", v31);
                      v34 = v33;

                      if (v34 && v32 < objc_msgSend(v30, "length"))
                      {
                        objc_msgSend(v30, "substringToIndex:", v32);
                        v35 = objc_claimAutoreleasedReturnValue();

                        v30 = (void *)v35;
                      }
                      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v30, "stringByTrimmingCharactersInSet:", v36);
                      v37 = (__CFString *)objc_claimAutoreleasedReturnValue();

                      if (-[__CFString length](v37, "length"))
                      {
                        v38 = CFStringConvertIANACharSetNameToEncoding(v37);
                        if (v38 != -1)
                          *((_QWORD *)v7 + 10) = CFStringConvertEncodingToNSStringEncoding(v38);
                      }

                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    else
    {
      *((_BYTE *)v7 + 117) = 1;
      *((_QWORD *)v7 + 13) = a2 + a3;
      *((_DWORD *)v7 + 28) = 0;
    }
  }
LABEL_63:
  v39 = (void *)*((_QWORD *)v7 + 7);
  if (v39)
  {
    *((_QWORD *)v7 + 7) = 0;

  }
  v40 = (void *)*((_QWORD *)v7 + 9);
  if (v40)
  {
    *((_QWORD *)v7 + 9) = 0;

  }
  v41 = (void *)*((_QWORD *)v7 + 8);
  if (v41)
  {
    *((_QWORD *)v7 + 8) = 0;

  }
  return 1;
}

void endElement(void *ctx, const xmlChar *name)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  _QWORD *v7;
  _QWORD *v8;
  size_t v9;
  _QWORD *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v4 = v3;
  v5 = v2;
  v7 = ctx;
  v8 = v7;
  v9 = v7[16];
  if (v9 - 1 < v4)
  {
    v10 = v7 + 15;
    if (!strncasecmp_l((const char *)name + 2, (const char *)v7[15], v9, 0))
    {
      v11 = v8[17] - 1;
      v8[17] = v11;
      if (!v11)
      {
        *v10 = 0;
        v8[16] = 0;
      }
    }
  }
  if (v5 < 8)
  {
    if (v5 != 7)
      goto LABEL_10;
  }
  else if (!strncasecmp_l((const char *)name + 2, "script", 6uLL, 0))
  {
    *((_BYTE *)v8 + 118) = 0;
    goto LABEL_33;
  }
  if (!strncasecmp_l((const char *)name + 2, "style", 5uLL, 0))
  {
    *((_BYTE *)v8 + 119) = 0;
    goto LABEL_33;
  }
LABEL_10:
  if (!*((_BYTE *)v8 + 116))
  {
    if (v5 < 4)
    {
      if (v5 != 3)
        goto LABEL_33;
    }
    else if (!strncasecmp_l((const char *)name + 2, "dt", 2uLL, 0)
           || !strncasecmp_l((const char *)name + 2, "td", 2uLL, 0)
           || !strncasecmp_l((const char *)name + 2, "li", 2uLL, 0)
           || !strncasecmp_l((const char *)name + 2, "h", 1uLL, 0) && name[3] - 49 <= 5)
    {
      goto LABEL_28;
    }
    if (strncasecmp_l((const char *)name + 2, "p", 1uLL, 0))
      goto LABEL_33;
LABEL_28:
    objc_msgSend(v8, "appendNewline");
    goto LABEL_33;
  }
  if (v5 >= 6)
  {
    if (strncasecmp_l((const char *)name + 2, "title", 4uLL, 0))
    {
      if (!strncasecmp_l((const char *)name + 2, "head", 4uLL, 0))
      {
        if (*((_BYTE *)v8 + 117))
        {
          v12 = v8[13];
          if (v12 < (unint64_t)name)
            *((_DWORD *)v8 + 28) = (_DWORD)name - v12;
        }
        *((_WORD *)v8 + 58) = 0;
      }
    }
    else
    {
      if (*((_BYTE *)v8 + 117))
      {
        v13 = v8[13];
        if (v13 < (unint64_t)name)
          *((_DWORD *)v8 + 28) = (_DWORD)name - v13;
      }
      *((_BYTE *)v8 + 117) = 0;
    }
  }
LABEL_33:

}

uint64_t handleEntity(void *a1, uint64_t a2, uint64_t a3)
{
  _BYTE *v5;
  _BYTE *v6;
  const char *v7;
  size_t v8;
  int v9;
  int v10;
  unsigned int v11;
  int v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int v16;
  int v17;
  size_t v18;
  int v19;
  unint64_t v20;
  int v21;
  BOOL v22;
  unint64_t v23;
  unsigned int v24;
  void *v25;
  uint64_t v26;
  char v28[8];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!a3)
    handleEntity_cold_1();
  v5 = a1;
  v6 = v5;
  if (!v5[117] && (v5[116] || v5[118] || v5[119]))
    goto LABEL_80;
  v7 = (const char *)(a2 + 1);
  if (a3 == 1)
  {
    v8 = 0;
  }
  else
  {
    if (v7[a3 - 2] == 59)
      v8 = a3 - 2;
    else
      v8 = a3 - 1;
    switch(v8)
    {
      case 4uLL:
        if (!strncmp("quot", (const char *)(a2 + 1), 4uLL) || !strncmp("QUOT", (const char *)(a2 + 1), 4uLL))
        {
          v11 = 34;
          goto LABEL_73;
        }
        goto LABEL_29;
      case 3uLL:
        if (!strncmp("amp", (const char *)(a2 + 1), 3uLL) || !strncmp("AMP", (const char *)(a2 + 1), 3uLL))
        {
          v11 = 38;
          goto LABEL_73;
        }
        goto LABEL_29;
      case 2uLL:
        v9 = *(unsigned __int8 *)(a2 + 2);
        if (v9 == 84)
        {
          v19 = *(unsigned __int8 *)v7;
          if (v19 == 71)
            v11 = 62;
          else
            v11 = 0;
          if (v19 == 76)
            goto LABEL_16;
LABEL_47:
          if (v11)
            goto LABEL_73;
          v8 = 2;
          goto LABEL_49;
        }
        if (v9 == 116)
        {
          v10 = *(unsigned __int8 *)v7;
          if (v10 == 103)
            v11 = 62;
          else
            v11 = 0;
          if (v10 == 108)
          {
LABEL_16:
            v11 = 60;
            goto LABEL_73;
          }
          goto LABEL_47;
        }
LABEL_29:
        if (*v7 == 35)
        {
          *(_QWORD *)v28 = 0;
          v29 = 0;
          if ((*(unsigned __int8 *)(a2 + 2) | 0x20) == 0x78)
            v12 = 16;
          else
            v12 = 10;
          if ((*(unsigned __int8 *)(a2 + 2) | 0x20) == 0x78)
            v13 = 2;
          else
            v13 = 1;
          if (v8 <= v13)
          {
            v17 = 0;
          }
          else
          {
            v14 = 0;
            v15 = v13 + 1;
            while (1)
            {
              v16 = *(unsigned __int8 *)(a2 + v15 + v14);
              if (v16 == 59)
                break;
              v28[v14] = v16;
              v17 = v14 + 1;
              if (v14 <= 0xD)
              {
                v18 = v15 + v14++;
                if (v8 > v18)
                  continue;
              }
              goto LABEL_70;
            }
            v17 = v14;
          }
LABEL_70:
          v28[v17] = 0;
          v24 = strtol_l(v28, 0, v12, 0);
          if (v24 - 1114112 >= 0xFFEF0001)
            v11 = v24;
          else
            v11 = 65533;
          goto LABEL_73;
        }
        goto LABEL_49;
    }
    if (v8 >= 2)
      goto LABEL_29;
  }
LABEL_49:
  v20 = 0;
  while (v8 != strlen(latin1Entities[v20]))
  {
    v11 = 0;
LABEL_56:
    v22 = v20++ >= 0x5F;
    if (v22)
      goto LABEL_58;
  }
  v21 = strncmp(latin1Entities[v20], v7, v8);
  v11 = v20 + 160;
  if (v21)
    v11 = 0;
  if (!v11)
    goto LABEL_56;
LABEL_58:
  if (v11)
    goto LABEL_73;
  v23 = 0;
  while (2)
  {
    if (v8 != strlen(otherEntities[v23]) || strncmp(otherEntities[v23], v7, v8))
    {
      v11 = 0;
      goto LABEL_63;
    }
    v11 = otherEntityCodes[v23];
    if (!otherEntityCodes[v23])
    {
LABEL_63:
      v22 = v23++ >= 0x97;
      if (v22)
        break;
      continue;
    }
    break;
  }
  if (!v11)
    goto LABEL_80;
LABEL_73:
  if (!v6[116] && !v6[118] && !v6[119])
  {
    if (HIWORD(v11))
    {
      *(_WORD *)v28 = (v11 >> 10) - 10304;
      *(_WORD *)&v28[2] = v11 & 0x3FF | 0xDC00;
      v25 = v6;
      v26 = 2;
    }
    else
    {
      *(_WORD *)v28 = v11;
      v25 = v6;
      v26 = 1;
    }
    objc_msgSend(v25, "appendUnichars:length:", v28, v26);
  }
LABEL_80:

  return 1;
}

uint64_t handleText(void *a1, uint64_t a2, uint64_t a3)
{
  _BYTE *v5;
  void *v6;

  v5 = a1;
  v6 = v5;
  if (!v5[116] && !v5[118] && !v5[119])
    objc_msgSend(v5, "appendText:length:", a2, a3);

  return 1;
}

uint64_t handleAttribute(void *a1, const char *a2, uint64_t a3, const char *a4, unint64_t a5)
{
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _MDHTMLParsing *v15;
  uint64_t v16;

  v9 = a1;
  if (a5)
  {
    switch(a3)
    {
      case 10:
        if (!strncasecmp_l(a2, "http-equiv", 0xAuLL, 0))
        {
          v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a4, a5, v9[10]);
          v11 = (void *)v9[8];
          v9[8] = v12;
          goto LABEL_11;
        }
        break;
      case 7:
        if (!strncasecmp_l(a2, "content", 7uLL, 0))
        {
          v13 = v9[10];
          v14 = v9;
          v15 = -[_MDHTMLParsing initWithEncoding:]([_MDHTMLParsing alloc], "initWithEncoding:", v13);
          v15->sourceEncoding = v9[10];
          v15->sourceCFEncoding = *((_DWORD *)v14 + 22);
          v15->indexingLimit = v14[12];
          scanXml((uint64_t)a4, a5, 0, 0, 0, v15);
          v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", v15->uniChars, v15->uniCharLen);

          v11 = (void *)v14[9];
          v14[9] = v16;
          goto LABEL_11;
        }
        break;
      case 4:
        if (!strncasecmp_l(a2, "name", 4uLL, 0))
        {
          v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a4, a5, v9[10]);
          v11 = (void *)v9[7];
          v9[7] = v10;
LABEL_11:

        }
        break;
      default:
        if (a3 == 5
          && a5 >= 0xC
          && !strncasecmp_l(a2, "style", 5uLL, 0)
          && !strncasecmp_l(a4, "display:none", 0xCuLL, 0))
        {
          *((_BYTE *)v9 + 144) = 1;
        }
        break;
    }
  }

  return 1;
}

void processMetaElement(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  double v11;
  void *v12;
  const __CFString *v13;
  const __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  v20 = a1;
  v5 = a2;
  v6 = a3;
  if (!objc_msgSend(CFSTR("CocoaVersion"), "compare:options:", v5, 1))
  {
    objc_msgSend(v6, "doubleValue");
    if (v11 <= 0.0)
      goto LABEL_40;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("CocoaRTFVersion");
    goto LABEL_32;
  }
  if (!objc_msgSend(CFSTR("Generator"), "compare:options:", v5, 1))
  {
    v14 = CFSTR("NSGeneratorDocumentAttribute");
    goto LABEL_37;
  }
  if (!objc_msgSend(CFSTR("Keywords"), "compare:options:", v5, 1))
  {
    if (!objc_msgSend(v6, "length"))
      goto LABEL_40;
    objc_msgSend(v6, "rangeOfString:", CFSTR(", "));
    if (v15 || (v17 = CFSTR(","), objc_msgSend(v6, "rangeOfString:", CFSTR(",")), !v18))
    {
      objc_msgSend(v6, "rangeOfString:", CFSTR(", "));
      if (v16 || (v17 = CFSTR(" "), objc_msgSend(v6, "rangeOfString:", CFSTR(" ")), !v19))
        v17 = CFSTR(", ");
    }
    objc_msgSend(v6, "componentsSeparatedByString:", v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("NSKeywordsDocumentAttribute");
    goto LABEL_32;
  }
  if (!objc_msgSend(CFSTR("Author"), "compare:options:", v5, 1))
  {
    v14 = CFSTR("NSAuthorDocumentAttribute");
    goto LABEL_37;
  }
  if (!objc_msgSend(CFSTR("LastAuthor"), "compare:options:", v5, 1))
  {
    v14 = CFSTR("NSEditorDocumentAttribute");
    goto LABEL_37;
  }
  if (!objc_msgSend(CFSTR("Company"), "compare:options:", v5, 1))
  {
    v14 = CFSTR("NSCompanyDocumentAttribute");
    goto LABEL_37;
  }
  if (!objc_msgSend(CFSTR("Copyright"), "compare:options:", v5, 1))
  {
    v14 = CFSTR("NSCopyrightDocumentAttribute");
    goto LABEL_37;
  }
  if (!objc_msgSend(CFSTR("Subject"), "compare:options:", v5, 1))
  {
    v14 = CFSTR("NSSubjectDocumentAttribute");
    goto LABEL_37;
  }
  if (!objc_msgSend(CFSTR("Description"), "compare:options:", v5, 1)
    || !objc_msgSend(CFSTR("Comment"), "compare:options:", v5, 1))
  {
    v14 = CFSTR("NSCommentDocumentAttribute");
    goto LABEL_37;
  }
  if (!objc_msgSend(CFSTR("CreationTime"), "compare:options:", v5, 1))
  {
    if (!objc_msgSend(v6, "length"))
      goto LABEL_40;
    dateForString(v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_33;
    v13 = CFSTR("NSCreationTimeDocumentAttribute");
    goto LABEL_32;
  }
  if (!objc_msgSend(CFSTR("ModificationTime"), "compare:options:", v5, 1))
  {
    if (!objc_msgSend(v6, "length"))
      goto LABEL_40;
    dateForString(v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_33;
    v13 = CFSTR("NSModificationTimeDocumentAttribute");
LABEL_32:
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v12, v13);
LABEL_33:

    goto LABEL_40;
  }
  if (objc_msgSend(CFSTR("DisplayName"), "compare:options:", v5, 1)
    && objc_msgSend(CFSTR("IndexTitle"), "compare:options:", v5, 1))
  {
    if (!objc_msgSend(CFSTR("robots"), "compare:options:", v5, 1))
    {
      objc_msgSend(v6, "rangeOfString:options:", CFSTR("noindex"), 1);
      if (v7)
      {
        v8 = &unk_1E242FBE0;
        v9 = CFSTR("NSNoIndexDocumentAttribute");
        v10 = v20;
LABEL_39:
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, v9);
        goto LABEL_40;
      }
    }
    goto LABEL_40;
  }
  v14 = CFSTR("NSDisplayNameDocumentAttribute");
LABEL_37:
  if (objc_msgSend(v6, "length"))
  {
    v10 = v20;
    v8 = v6;
    v9 = v14;
    goto LABEL_39;
  }
LABEL_40:

}

id dateForString(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  if (dateTimeFormatters_onceToken != -1)
    dispatch_once(&dateTimeFormatters_onceToken, &__block_literal_global);
  v2 = (id)dateTimeFormatters_dateTimeFormatters;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "dateFromString:", v1, (_QWORD)v10);
        v7 = objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v8 = (void *)v7;
          goto LABEL_13;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_13:

  return v8;
}

void __dateTimeFormatters_block_invoke()
{
  id v0;
  void *v1;

  v0 = +[_MDDateFormatterFactory newDateTimeFormatters](_MDDateFormatterFactory, "newDateTimeFormatters");
  v1 = (void *)dateTimeFormatters_dateTimeFormatters;
  dateTimeFormatters_dateTimeFormatters = (uint64_t)v0;

}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id logForCSLogCategoryRecs()
{
  if (logForCSLogCategoryRecs_onceToken != -1)
    dispatch_once(&logForCSLogCategoryRecs_onceToken, &__block_literal_global_7);
  return (id)logForCSLogCategoryRecs_sRecsLog;
}

void __logForCSLogCategoryRecs_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.corespotlight", "recs");
  v1 = (void *)logForCSLogCategoryRecs_sRecsLog;
  logForCSLogCategoryRecs_sRecsLog = (uint64_t)v0;

}

id logForCSLogCategoryUA()
{
  if (logForCSLogCategoryUA_onceToken != -1)
    dispatch_once(&logForCSLogCategoryUA_onceToken, &__block_literal_global_9);
  return (id)logForCSLogCategoryUA_sUALog;
}

void __logForCSLogCategoryUA_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.corespotlight", "ua");
  v1 = (void *)logForCSLogCategoryUA_sUALog;
  logForCSLogCategoryUA_sUALog = (uint64_t)v0;

}

id logForCSLogCategoryPersonalization()
{
  if (logForCSLogCategoryPersonalization_onceToken != -1)
    dispatch_once(&logForCSLogCategoryPersonalization_onceToken, &__block_literal_global_11);
  return (id)logForCSLogCategoryPersonalization_sPersonalizationLog;
}

void __logForCSLogCategoryPersonalization_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.corespotlight", "personalization");
  v1 = (void *)logForCSLogCategoryPersonalization_sPersonalizationLog;
  logForCSLogCategoryPersonalization_sPersonalizationLog = (uint64_t)v0;

}

id logForCSLogCategoryPhotosQU()
{
  if (logForCSLogCategoryPhotosQU_onceToken != -1)
    dispatch_once(&logForCSLogCategoryPhotosQU_onceToken, &__block_literal_global_13);
  return (id)logForCSLogCategoryPhotosQU_queryUnderstandingLog;
}

void __logForCSLogCategoryPhotosQU_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.corespotlight", "PhotosQueryUnderstanding");
  v1 = (void *)logForCSLogCategoryPhotosQU_queryUnderstandingLog;
  logForCSLogCategoryPhotosQU_queryUnderstandingLog = (uint64_t)v0;

}

id logForCSLogCategoryDaemonClient()
{
  if (logForCSLogCategoryDaemonClient_onceToken != -1)
    dispatch_once(&logForCSLogCategoryDaemonClient_onceToken, &__block_literal_global_15);
  return (id)logForCSLogCategoryDaemonClient_sDaemonClientLog;
}

void __logForCSLogCategoryDaemonClient_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.corespotlight", "SpotlightDaemonClient");
  v1 = (void *)logForCSLogCategoryDaemonClient_sDaemonClientLog;
  logForCSLogCategoryDaemonClient_sDaemonClientLog = (uint64_t)v0;

}

id CSRedactStringArray(void *a1, int a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if (CSShouldRedactForPrivacy_onceToken != -1)
    dispatch_once(&CSShouldRedactForPrivacy_onceToken, &__block_literal_global_22);
  if (CSShouldRedactForPrivacy_shouldObfuscate)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = 0u;
        v17 = 0u;
        v14 = 0u;
        v15 = 0u;
        v5 = v3;
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v15;
          do
          {
            for (i = 0; i != v7; ++i)
            {
              if (*(_QWORD *)v15 != v8)
                objc_enumerationMutation(v5);
              v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
              if (v10)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  CSRedactString(v10, a2);
                  v11 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "addObject:", v11, (_QWORD)v14);

                }
              }
            }
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          }
          while (v7);
        }

      }
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v4, (_QWORD)v14);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = v3;
  }

  return v12;
}

uint64_t MDHash(unsigned __int8 *a1, unsigned int a2, int a3)
{
  unsigned int v3;
  unsigned int v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;
  unsigned int v16;
  unsigned int v17;
  int v18;
  unsigned int v19;
  unsigned int v20;
  int v21;

  v3 = -1640531527;
  if (a2 < 0xC)
  {
    v5 = -1640531527;
    v4 = a2;
  }
  else
  {
    v4 = a2;
    v5 = -1640531527;
    do
    {
      v6 = *((_DWORD *)a1 + 1) + v3;
      v7 = *((_DWORD *)a1 + 2) + a3;
      v8 = (*(_DWORD *)a1 + v5 - (v6 + v7)) ^ (v7 >> 13);
      v9 = (v6 - v7 - v8) ^ (v8 << 8);
      v10 = (v7 - v8 - v9) ^ (v9 >> 13);
      v11 = (v8 - v9 - v10) ^ (v10 >> 12);
      v12 = (v9 - v10 - v11) ^ (v11 << 16);
      v13 = (v10 - v11 - v12) ^ (v12 >> 5);
      v5 = (v11 - v12 - v13) ^ (v13 >> 3);
      v3 = (v12 - v13 - v5) ^ (v5 << 10);
      a3 = (v13 - v5 - v3) ^ (v3 >> 15);
      a1 += 12;
      v4 -= 12;
    }
    while (v4 > 0xB);
  }
  v14 = a3 + a2;
  switch(v4)
  {
    case 1u:
      goto LABEL_17;
    case 2u:
      goto LABEL_16;
    case 3u:
      goto LABEL_15;
    case 4u:
      goto LABEL_14;
    case 5u:
      goto LABEL_13;
    case 6u:
      goto LABEL_12;
    case 7u:
      goto LABEL_11;
    case 8u:
      goto LABEL_10;
    case 9u:
      goto LABEL_9;
    case 0xAu:
      goto LABEL_8;
    case 0xBu:
      v14 += a1[10] << 24;
LABEL_8:
      v14 += a1[9] << 16;
LABEL_9:
      v14 += a1[8] << 8;
LABEL_10:
      v3 += a1[7] << 24;
LABEL_11:
      v3 += a1[6] << 16;
LABEL_12:
      v3 += a1[5] << 8;
LABEL_13:
      v3 += a1[4];
LABEL_14:
      v5 += a1[3] << 24;
LABEL_15:
      v5 += a1[2] << 16;
LABEL_16:
      v5 += a1[1] << 8;
LABEL_17:
      v5 += *a1;
      break;
    default:
      break;
  }
  v15 = (v5 - v3 - v14) ^ (v14 >> 13);
  v16 = (v3 - v14 - v15) ^ (v15 << 8);
  v17 = (v14 - v15 - v16) ^ (v16 >> 13);
  v18 = (v15 - v16 - v17) ^ (v17 >> 12);
  v19 = (v16 - v17 - v18) ^ (v18 << 16);
  v20 = (v17 - v18 - v19) ^ (v19 >> 5);
  v21 = (v18 - v19 - v20) ^ (v20 >> 3);
  return (v20 - v21 - ((v19 - v20 - v21) ^ (v21 << 10))) ^ (((v19 - v20 - v21) ^ (v21 << 10)) >> 15);
}

uint64_t MDHashQuick32(int a1)
{
  unsigned int v1;
  unsigned int v2;
  int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;

  v1 = (-1640531527 - a1) ^ ((a1 - 4) << 8);
  v2 = (8 - a1 - v1) ^ (v1 >> 13);
  v3 = (a1 - 4 - v1 - v2) ^ (v2 >> 12);
  v4 = (v1 - v2 - v3) ^ (v3 << 16);
  v5 = (v2 - v3 - v4) ^ (v4 >> 5);
  v6 = (v3 - v4 - v5) ^ (v5 >> 3);
  return (v5 - v6 - ((v4 - v5 - v6) ^ (v6 << 10))) ^ (((v4 - v5 - v6) ^ (v6 << 10)) >> 15);
}

uint64_t MDHashQuick32Pair(int a1, int a2)
{
  int v2;
  unsigned int v3;
  unsigned int v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  int v8;

  v2 = a1 - a2 - 8;
  v3 = (a2 - (a1 - a2) - 1640531527) ^ (v2 << 8);
  v4 = (16 - (a1 - a2) - v3) ^ (v3 >> 13);
  v5 = (v2 - v3 - v4) ^ (v4 >> 12);
  v6 = (v3 - v4 - v5) ^ (v5 << 16);
  v7 = (v4 - v5 - v6) ^ (v6 >> 5);
  v8 = (v5 - v6 - v7) ^ (v7 >> 3);
  return (v7 - v8 - ((v6 - v7 - v8) ^ (v8 << 10))) ^ (((v6 - v7 - v8) ^ (v8 << 10)) >> 15);
}

uint64_t MDHashQuick64(uint64_t a1)
{
  int v1;
  unsigned int v2;
  unsigned int v3;
  int v4;
  unsigned int v5;
  unsigned int v6;
  int v7;

  v1 = HIDWORD(a1) - a1 - 8;
  v2 = (a1 - (HIDWORD(a1) - a1) - 1640531527) ^ (v1 << 8);
  v3 = (16 - (HIDWORD(a1) - a1) - v2) ^ (v2 >> 13);
  v4 = (v1 - v2 - v3) ^ (v3 >> 12);
  v5 = (v2 - v3 - v4) ^ (v4 << 16);
  v6 = (v3 - v4 - v5) ^ (v5 >> 5);
  v7 = (v4 - v5 - v6) ^ (v6 >> 3);
  return (v6 - v7 - ((v5 - v6 - v7) ^ (v7 << 10))) ^ (((v5 - v6 - v7) ^ (v7 << 10)) >> 15);
}

uint64_t MDHashQuickPtrAsInt(uint64_t a1)
{
  int v1;
  unsigned int v2;
  unsigned int v3;
  int v4;
  unsigned int v5;
  unsigned int v6;
  int v7;

  v1 = HIDWORD(a1) - a1 - 8;
  v2 = (a1 - (HIDWORD(a1) - a1) - 1640531527) ^ (v1 << 8);
  v3 = (16 - (HIDWORD(a1) - a1) - v2) ^ (v2 >> 13);
  v4 = (v1 - v2 - v3) ^ (v3 >> 12);
  v5 = (v2 - v3 - v4) ^ (v4 << 16);
  v6 = (v3 - v4 - v5) ^ (v5 >> 5);
  v7 = (v4 - v5 - v6) ^ (v6 >> 3);
  return (v6 - v7 - ((v5 - v6 - v7) ^ (v7 << 10))) ^ (((v5 - v6 - v7) ^ (v7 << 10)) >> 15);
}

unint64_t MDHash64Quick64(uint64_t a1)
{
  int v1;
  unsigned int v2;
  unsigned int v3;
  int v4;
  unsigned int v5;
  unsigned int v6;
  int v7;
  uint64_t v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;

  v1 = HIDWORD(a1) - a1 + 608135808;
  v2 = (a1 - (HIDWORD(a1) - a1) + 2046299953) ^ (v1 << 8);
  v3 = (-608135800 - (HIDWORD(a1) - a1) - v2) ^ (v2 >> 13);
  v4 = (v1 - v2 - v3) ^ (v3 >> 12);
  v5 = (v2 - v3 - v4) ^ (v4 << 16);
  v6 = (v3 - v4 - v5) ^ (v5 >> 5);
  v7 = (v4 - v5 - v6) ^ (v6 >> 3);
  v8 = (v6 - v7 - ((v5 - v6 - v7) ^ (v7 << 10))) ^ (((v5 - v6 - v7) ^ (v7 << 10)) >> 15);
  v9 = a1 + 608135808 - HIDWORD(a1);
  v10 = (HIDWORD(a1) - (v9 + 8) - 1640531527) ^ (v9 << 8);
  v11 = (8 - v9 - v10) ^ (v10 >> 13);
  v12 = (v9 - v10 - v11) ^ (v11 >> 12);
  v13 = (v10 - v11 - v12) ^ (v12 << 16);
  v14 = (v11 - v12 - v13) ^ (v13 >> 5);
  v15 = (v12 - v13 - v14) ^ (v14 >> 3);
  return v8 | ((unint64_t)((v14 - v15 - ((v13 - v14 - v15) ^ (v15 << 10))) ^ (((v13 - v14 - v15) ^ (v15 << 10)) >> 15)) << 32);
}

unint64_t MDUHash32(int a1)
{
  unsigned int v1;
  unsigned int v2;
  int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  unsigned int v11;
  unsigned int v12;
  int v13;

  v1 = (2 * a1 + 2046299953) ^ ((608135808 - a1) << 8);
  v2 = (a1 - 608135800 - v1) ^ (v1 >> 13);
  v3 = (608135808 - a1 - v1 - v2) ^ (v2 >> 12);
  v4 = (v1 - v2 - v3) ^ (v3 << 16);
  v5 = (v2 - v3 - v4) ^ (v4 >> 5);
  v6 = (v3 - v4 - v5) ^ (v5 >> 3);
  v7 = (v5 - v6 - ((v4 - v5 - v6) ^ (v6 << 10))) ^ (((v4 - v5 - v6) ^ (v6 << 10)) >> 15);
  v8 = (2046299953 - a1) ^ ((a1 + 608135808) << 8);
  v9 = (-608135800 - a1 - v8) ^ (v8 >> 13);
  v10 = (a1 + 608135808 - v8 - v9) ^ (v9 >> 12);
  v11 = (v8 - v9 - v10) ^ (v10 << 16);
  v12 = (v9 - v10 - v11) ^ (v11 >> 5);
  v13 = (v10 - v11 - v12) ^ (v12 >> 3);
  return v7 | ((unint64_t)((v12 - v13 - ((v11 - v12 - v13) ^ (v13 << 10))) ^ (((v11 - v12 - v13) ^ (v13 << 10)) >> 15)) << 32);
}

unint64_t MDUHash64(uint64_t a1)
{
  int v1;
  unsigned int v2;
  unsigned int v3;
  int v4;
  unsigned int v5;
  unsigned int v6;
  int v7;
  uint64_t v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;

  v1 = HIDWORD(a1) - a1 + 608135808;
  v2 = (a1 - (HIDWORD(a1) - a1) + 2046299953) ^ (v1 << 8);
  v3 = (-608135800 - (HIDWORD(a1) - a1) - v2) ^ (v2 >> 13);
  v4 = (v1 - v2 - v3) ^ (v3 >> 12);
  v5 = (v2 - v3 - v4) ^ (v4 << 16);
  v6 = (v3 - v4 - v5) ^ (v5 >> 5);
  v7 = (v4 - v5 - v6) ^ (v6 >> 3);
  v8 = (v6 - v7 - ((v5 - v6 - v7) ^ (v7 << 10))) ^ (((v5 - v6 - v7) ^ (v7 << 10)) >> 15);
  v9 = a1 + 608135808 - HIDWORD(a1);
  v10 = (HIDWORD(a1) - (v9 + 8) - 1640531527) ^ (v9 << 8);
  v11 = (8 - v9 - v10) ^ (v10 >> 13);
  v12 = (v9 - v10 - v11) ^ (v11 >> 12);
  v13 = (v10 - v11 - v12) ^ (v12 << 16);
  v14 = (v11 - v12 - v13) ^ (v13 >> 5);
  v15 = (v12 - v13 - v14) ^ (v14 >> 3);
  return v8 | ((unint64_t)((v14 - v15 - ((v13 - v14 - v15) ^ (v15 << 10))) ^ (((v13 - v14 - v15) ^ (v15 << 10)) >> 15)) << 32);
}

unint64_t MDUHashIntPtr(uint64_t a1)
{
  int v1;
  unsigned int v2;
  unsigned int v3;
  int v4;
  unsigned int v5;
  unsigned int v6;
  int v7;
  uint64_t v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;

  v1 = HIDWORD(a1) - a1 + 608135808;
  v2 = (a1 - (HIDWORD(a1) - a1) + 2046299953) ^ (v1 << 8);
  v3 = (-608135800 - (HIDWORD(a1) - a1) - v2) ^ (v2 >> 13);
  v4 = (v1 - v2 - v3) ^ (v3 >> 12);
  v5 = (v2 - v3 - v4) ^ (v4 << 16);
  v6 = (v3 - v4 - v5) ^ (v5 >> 5);
  v7 = (v4 - v5 - v6) ^ (v6 >> 3);
  v8 = (v6 - v7 - ((v5 - v6 - v7) ^ (v7 << 10))) ^ (((v5 - v6 - v7) ^ (v7 << 10)) >> 15);
  v9 = a1 + 608135808 - HIDWORD(a1);
  v10 = (HIDWORD(a1) - (v9 + 8) - 1640531527) ^ (v9 << 8);
  v11 = (8 - v9 - v10) ^ (v10 >> 13);
  v12 = (v9 - v10 - v11) ^ (v11 >> 12);
  v13 = (v10 - v11 - v12) ^ (v12 << 16);
  v14 = (v11 - v12 - v13) ^ (v13 >> 5);
  v15 = (v12 - v13 - v14) ^ (v14 >> 3);
  return v8 | ((unint64_t)((v14 - v15 - ((v13 - v14 - v15) ^ (v15 << 10))) ^ (((v13 - v14 - v15) ^ (v15 << 10)) >> 15)) << 32);
}

void sub_18C455ECC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18C457AFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61,uint64_t a62,uint64_t a63)
{
  char a65;
  char a69;

  _Block_object_dispose(&a61, 8);
  _Block_object_dispose(&a65, 8);
  _Block_object_dispose(&a69, 8);
  _Unwind_Resume(a1);
}

void sub_18C45C360(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a67;

  _Block_object_dispose(&a67, 8);
  _Unwind_Resume(a1);
}

void commonInit(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v9 = a1;
  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  objc_storeStrong(v9 + 40, a5);
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = v9[42];
  v9[42] = v14;

  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = v9[43];
  v9[43] = v16;

  v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = v9[44];
  v9[44] = v18;

  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = v9[45];
  v9[45] = v20;

  v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23 = v9[46];
  v9[46] = v22;

  v9[50] = (id)-1;
  objc_storeStrong(v9 + 39, a3);
  objc_storeStrong(v9 + 41, a4);
  v9[53] = 0;
  v9[54] = (id)-1;
  *((_BYTE *)v9 + 417) = objc_msgSend(v10, "rankingType") == 1;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v24 = objc_msgSend(v12, "length");
  v25 = *MEMORY[0x1E0CB2D28];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __commonInit_block_invoke;
  v26[3] = &unk_1E24014B0;
  v26[4] = &v27;
  objc_msgSend(v12, "enumerateLinguisticTagsInRange:scheme:options:orthography:usingBlock:", 0, v24, v25, 6, 0, v26);
  v9[51] = (id)v28[3];
  _Block_object_dispose(&v27, 8);

}

void sub_18C45CAB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18C45D03C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C45D1F4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C45D330(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C45D560(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C45D690(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C45DAA0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C45EB40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
  _Block_object_dispose(&a59, 8);
  _Unwind_Resume(a1);
}

void sub_18C460368(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C460488(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C461168(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  id *v24;

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18C4612E8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18C461400(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C462400(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

Class __getSRResourcesManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!SpotlightResourcesLibraryCore_frameworkLibrary)
  {
    SpotlightResourcesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!SpotlightResourcesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SRResourcesManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSRResourcesManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getSRResourcesManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getGMAvailabilityWrapperClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!GenerativeModelsLibraryCore_frameworkLibrary)
  {
    GenerativeModelsLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!GenerativeModelsLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("GMAvailabilityWrapper");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getGMAvailabilityWrapperClass_block_invoke_cold_1();
    free(v3);
  }
  getGMAvailabilityWrapperClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __commonInit_block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_7(void *a1, const char *a2)
{
  return objc_msgSend(a1, "queryID");
}

uint64_t OUTLINED_FUNCTION_12()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_13(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_14(void *a1, const char *a2)
{
  return objc_msgSend(a1, "queryID");
}

void sub_18C4639D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18C464114(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C46475C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

id OUTLINED_FUNCTION_7_0(uint64_t a1, uint64_t a2)
{
  return objc_loadWeakRetained((id *)(a2 + 32));
}

void sub_18C4697C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a67;

  _Block_object_dispose(&a67, 8);
  _Unwind_Resume(a1);
}

id OUTLINED_FUNCTION_0_2(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_1_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_18C469E3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18C469EF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCNAutocompleteFetchRequestClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!ContactsAutocompleteLibraryCore_frameworkLibrary)
    ContactsAutocompleteLibraryCore_frameworkLibrary = _sl_dlopen();
  result = objc_getClass("CNAutocompleteFetchRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getCNAutocompleteFetchRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCNAutocompleteStoreClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!ContactsAutocompleteLibraryCore_frameworkLibrary)
    ContactsAutocompleteLibraryCore_frameworkLibrary = _sl_dlopen();
  result = objc_getClass("CNAutocompleteStore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getCNAutocompleteStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t tokenScopesWithPersonKey(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, int a8, unsigned __int8 a9)
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  int v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t i;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  id v103;
  void *v104;
  id v105;
  void *v106;
  id v107;
  void *v108;
  void *v109;
  id v110;
  int v111;
  id obja;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  int v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  _QWORD v131[4];
  _QWORD v132[4];
  _QWORD v133[4];
  _QWORD v134[4];
  _QWORD v135[4];
  _QWORD v136[4];
  _QWORD v137[4];
  _QWORD v138[4];
  _BYTE v139[128];
  _BYTE v140[128];
  _BYTE v141[128];
  uint64_t v142;

  v142 = *MEMORY[0x1E0C80C00];
  v15 = a1;
  v16 = a2;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = v21;
  v23 = 0;
  if (v15 && v21)
  {
    if (a8 && !objc_msgSend(v17, "count"))
    {
      v23 = 0;
      goto LABEL_109;
    }
    if (tokenScopesWithPersonKey_onceScopesToken != -1)
      dispatch_once(&tokenScopesWithPersonKey_onceScopesToken, &__block_literal_global_1028);
    v23 = 0;
    if (tokenScopesWithPersonKey_gFrom)
    {
      if (tokenScopesWithPersonKey_gTo && tokenScopesWithPersonKey_gAny && tokenScopesWithPersonKey_gPhotos)
      {
        v109 = v22;
        v104 = v19;
        v110 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v24 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v25 = v18;
        v26 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v20, "containsObject:", CFSTR("FROM"));
        v28 = objc_msgSend(v20, "containsObject:", CFSTR("TO"));
        v111 = objc_msgSend(v20, "containsObject:", CFSTR("ANY"));
        v103 = v20;
        v118 = objc_msgSend(v20, "containsObject:", CFSTR("PHOTOS"));
        v107 = v15;
        v108 = v16;
        v29 = (void *)v24;
        v116 = (void *)v24;
        v30 = (void *)v26;
        v18 = v25;
        v114 = v30;
        v105 = v17;
        v106 = v25;
        if ((a8 & 1) == 0)
        {
          if (v27)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("kMDItemAuthors=\"%@*\"cwd"), v15);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v117, "addObject:", v31);

          }
          if (v28)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("kMDItemRecipients=\"%@*\"cwd"), v15);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "addObject:", v32);

          }
          if (((v111 ^ 1 | a9) & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("**=\"%@*\"cwd"), v15);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "addObject:", v33);

          }
          if (v118)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("kMDItemPhotosPeopleNames=\"%@*\"cwd || kMDItemTitle=\"%@\"cwd)"), v15, v15);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v115, "addObject:", v34);

          }
          if ((v111 & a9) == 1)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("kMDItemAuthors=\"%@*\"cwd"), v15);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "addObject:", v35);

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("kMDItemRecipients=\"%@*\"cwd"), v15);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "addObject:", v36);

          }
          if (v108)
          {
            v129 = 0u;
            v130 = 0u;
            v127 = 0u;
            v128 = 0u;
            v37 = v108;
            v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v127, v141, 16);
            if (!v38)
              goto LABEL_40;
            v39 = v38;
            v40 = *(_QWORD *)v128;
            while (1)
            {
              v41 = 0;
              do
              {
                if (*(_QWORD *)v128 != v40)
                  objc_enumerationMutation(v37);
                v42 = *(_QWORD *)(*((_QWORD *)&v127 + 1) + 8 * v41);
                if (v27)
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("kMDItemAuthors=\"%@*\"cwd"), *(_QWORD *)(*((_QWORD *)&v127 + 1) + 8 * v41));
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v117, "addObject:", v45);

                  if (!v28)
                  {
LABEL_30:
                    if (((v111 ^ 1 | a9) & 1) != 0)
                      goto LABEL_32;
LABEL_31:
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("**=\"%@*\"cwd"), v42);
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v114, "addObject:", v43);

                    goto LABEL_32;
                  }
                }
                else if (!v28)
                {
                  goto LABEL_30;
                }
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("kMDItemRecipients=\"%@*\"cwd"), v42);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v116, "addObject:", v46);

                if (((v111 ^ 1 | a9) & 1) == 0)
                  goto LABEL_31;
LABEL_32:
                if (v118)
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("kMDItemPhotosPeopleNames=\"%@*\"cwd || kMDItemTitle=\"%@\"cwd)"), v42, v42);
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v115, "addObject:", v44);

                }
                ++v41;
              }
              while (v39 != v41);
              v47 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v127, v141, 16);
              v39 = v47;
              if (!v47)
              {
LABEL_40:

                v18 = v106;
                v17 = v105;
                v29 = v116;
                break;
              }
            }
          }
        }
        if (!v17)
          goto LABEL_64;
        v125 = 0u;
        v126 = 0u;
        v123 = 0u;
        v124 = 0u;
        v48 = v17;
        v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v123, v140, 16);
        if (!v49)
          goto LABEL_63;
        v50 = v49;
        v51 = *(_QWORD *)v124;
LABEL_44:
        v52 = 0;
        while (1)
        {
          if (*(_QWORD *)v124 != v51)
            objc_enumerationMutation(v48);
          v53 = *(_QWORD *)(*((_QWORD *)&v123 + 1) + 8 * v52);
          if (v27)
          {
            if ((a8 & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("kMDItemAuthors=\"%@*\"cwd"), *(_QWORD *)(*((_QWORD *)&v123 + 1) + 8 * v52));
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v117, "addObject:", v56);

            }
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("kMDItemAuthorEmailAddresses=\"%@*\"cwd"), v53);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v117, "addObject:", v57);

            if (v28)
            {
LABEL_58:
              if ((a8 & 1) == 0)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("kMDItemRecipients=\"%@*\"cwd"), v53);
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v116, "addObject:", v58);

              }
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("kMDItemRecipientEmailAddresses=\"%@*\"cwd"), v53);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v116, "addObject:", v59);

              if (((v111 ^ 1 | a9) & 1) != 0)
                goto LABEL_51;
LABEL_50:
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("**=\"%@*\"cwd"), v53);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v114, "addObject:", v54);

              goto LABEL_51;
            }
          }
          else if (v28)
          {
            goto LABEL_58;
          }
          if (((v111 ^ 1 | a9) & 1) == 0)
            goto LABEL_50;
LABEL_51:
          if (v118)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("kMDItemPhotosPeopleEmailAddresses=\"%@*\"cwd"), v53);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v115, "addObject:", v55);

          }
          if (v50 == ++v52)
          {
            v60 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v123, v140, 16);
            v50 = v60;
            if (!v60)
            {
LABEL_63:

              v18 = v106;
              v29 = v116;
LABEL_64:
              v61 = v29;
              if (v18)
              {
                v121 = 0u;
                v122 = 0u;
                v119 = 0u;
                v120 = 0u;
                obja = v18;
                v62 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v119, v139, 16);
                if (v62)
                {
                  v63 = v62;
                  v64 = *(_QWORD *)v120;
                  do
                  {
                    for (i = 0; i != v63; ++i)
                    {
                      if (*(_QWORD *)v120 != v64)
                        objc_enumerationMutation(obja);
                      v66 = *(_QWORD *)(*((_QWORD *)&v119 + 1) + 8 * i);
                      if (v27)
                      {
                        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("kMDItemAuthors=\"%@*\"cwd"), *(_QWORD *)(*((_QWORD *)&v119 + 1) + 8 * i));
                        v67 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v117, "addObject:", v67);

                        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("kMDItemAuthorEmailAddresses=\"%@*\"cwd"), v66);
                        v68 = (void *)objc_claimAutoreleasedReturnValue();
                        v61 = v116;
                        objc_msgSend(v117, "addObject:", v68);

                      }
                      if (v28)
                      {
                        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("kMDItemRecipients=\"%@*\"cwd"), v66);
                        v69 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v61, "addObject:", v69);

                        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("kMDItemRecipientEmailAddresses=\"%@*\"cwd"), v66);
                        v70 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v61, "addObject:", v70);

                      }
                      if (v111)
                      {
                        v71 = v61;
                        if (a9)
                        {
                          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("kMDItemAuthors=\"%@*\"cwd"), v66);
                          v72 = (void *)objc_claimAutoreleasedReturnValue();
                          v73 = v114;
                          objc_msgSend(v114, "addObject:", v72);

                          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("kMDItemAuthorEmailAddresses=\"%@*\"cwd"), v66);
                          v74 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v114, "addObject:", v74);

                          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("kMDItemRecipients=\"%@*\"cwd"), v66);
                          v75 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v114, "addObject:", v75);

                          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("kMDItemRecipientEmailAddresses=\"%@*\"cwd"), v66);
                          v76 = (void *)objc_claimAutoreleasedReturnValue();
                        }
                        else
                        {
                          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("**=\"%@*\"cwd"), v66);
                          v76 = (void *)objc_claimAutoreleasedReturnValue();
                          v73 = v114;
                        }
                        objc_msgSend(v73, "addObject:", v76);

                        v61 = v71;
                      }
                      if (v118)
                      {
                        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("kMDItemPhotosPeoplePhoneNumbers=\"%@*\"cwd"), v66);
                        v77 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v115, "addObject:", v77);

                      }
                    }
                    v63 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v119, v139, 16);
                  }
                  while (v63);
                }

                v18 = v106;
                v15 = v107;
              }
              v20 = v103;
              if (v27 && objc_msgSend(v117, "count"))
              {
                v78 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v117, "allObjects");
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v79, "componentsJoinedByString:", CFSTR(" || "));
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v78, "stringWithFormat:", CFSTR("(%@)"), v80);
                v81 = (void *)objc_claimAutoreleasedReturnValue();

                v137[0] = CFSTR("TOKEN");
                v137[1] = CFSTR("TEXT");
                v138[0] = tokenScopesWithPersonKey_gFrom;
                v138[1] = v15;
                v137[2] = CFSTR("QUERY");
                v137[3] = CFSTR("TYPE");
                v138[2] = v81;
                v138[3] = &unk_1E242FCD0;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v138, v137, 4);
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v109, "addObject:", v82);

                objc_msgSend(v110, "addObject:", v81);
              }
              else
              {
                v81 = 0;
              }
              v19 = v104;
              if (v28 && objc_msgSend(v61, "count"))
              {
                v83 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v61, "allObjects");
                v84 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v84, "componentsJoinedByString:", CFSTR(" || "));
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v83, "stringWithFormat:", CFSTR("(%@)"), v85);
                v86 = objc_claimAutoreleasedReturnValue();

                v135[0] = CFSTR("TOKEN");
                v135[1] = CFSTR("TEXT");
                v136[0] = tokenScopesWithPersonKey_gTo;
                v136[1] = v15;
                v135[2] = CFSTR("QUERY");
                v135[3] = CFSTR("TYPE");
                v136[2] = v86;
                v136[3] = &unk_1E242FD48;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v136, v135, 4);
                v87 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = v109;
                objc_msgSend(v109, "addObject:", v87);

                objc_msgSend(v110, "addObject:", v86);
                v81 = (void *)v86;
              }
              else
              {
                v22 = v109;
              }
              v88 = v115;
              if (v111)
              {
                if (objc_msgSend(v114, "count"))
                {
                  v89 = (void *)MEMORY[0x1E0CB3940];
                  objc_msgSend(v114, "allObjects");
                  v90 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v90, "componentsJoinedByString:", CFSTR(" || "));
                  v91 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v89, "stringWithFormat:", CFSTR("(%@)"), v91);
                  v92 = (void *)objc_claimAutoreleasedReturnValue();

                  v22 = v109;
                  v133[0] = CFSTR("TOKEN");
                  v133[1] = CFSTR("TEXT");
                  v134[0] = tokenScopesWithPersonKey_gAny;
                  v134[1] = v15;
                  v133[2] = CFSTR("QUERY");
                  v133[3] = CFSTR("TYPE");
                  v134[2] = v92;
                  v134[3] = &unk_1E242FCE8;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v134, v133, 4);
                  v93 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v109, "addObject:", v93);

                  if (a9)
                  {
                    v94 = v110;
                    objc_msgSend(v110, "addObject:", v92);
                    goto LABEL_100;
                  }
                }
                else
                {
                  v92 = v81;
                }
                v94 = v110;
LABEL_100:
                v88 = v115;
              }
              else
              {
                v92 = v81;
                v94 = v110;
              }
              if (v118 && objc_msgSend(v88, "count"))
              {
                v95 = v61;
                v96 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v88, "allObjects");
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v97, "componentsJoinedByString:", CFSTR(" || "));
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v96, "stringWithFormat:", CFSTR("(%@)"), v98);
                v99 = objc_claimAutoreleasedReturnValue();

                v22 = v109;
                v131[0] = CFSTR("TOKEN");
                v131[1] = CFSTR("TEXT");
                v132[0] = tokenScopesWithPersonKey_gPhotos;
                v132[1] = v15;
                v131[2] = CFSTR("QUERY");
                v131[3] = CFSTR("TYPE");
                v132[2] = v99;
                v132[3] = &unk_1E242FCB8;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v132, v131, 4);
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v109, "addObject:", v100);

                objc_msgSend(v110, "addObject:", v99);
                v92 = (void *)v99;
                v94 = v110;
              }
              else
              {
                v95 = v61;
              }
              v17 = v105;
              if (v104 && objc_msgSend(v94, "count"))
              {
                objc_msgSend(v94, "componentsJoinedByString:", CFSTR(" || "));
                v101 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v104, "appendString:", v101);

                v94 = v110;
              }

              v23 = 1;
              v16 = v108;
              break;
            }
            goto LABEL_44;
          }
        }
      }
    }
  }
LABEL_109:

  return v23;
}

uint64_t tokenScopesForPeopleSuggestions(void *a1, void *a2, void *a3, void *a4, int a5, int a6, int a7)
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  uint64_t v80;
  void *v81;
  id v82;
  void *v83;
  id v84;
  int v85;
  void *v86;
  int v87;
  uint64_t v89;
  id obj;
  void *v91;
  int v92;
  void *v93;
  int v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _QWORD v107[4];
  _QWORD v108[4];
  _QWORD v109[4];
  _QWORD v110[4];
  _QWORD v111[4];
  _QWORD v112[4];
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  uint64_t v116;

  v116 = *MEMORY[0x1E0C80C00];
  v12 = a1;
  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = v15;
  v17 = 0;
  v86 = v12;
  if (v12 && v15)
  {
    if (a5 && !objc_msgSend(v13, "count"))
    {
      v17 = 0;
      goto LABEL_95;
    }
    if (tokenScopesForPeopleSuggestions_onceScopesToken != -1)
      dispatch_once(&tokenScopesForPeopleSuggestions_onceScopesToken, &__block_literal_global_1049);
    v17 = 0;
    if (tokenScopesForPeopleSuggestions_gFrom)
    {
      if (tokenScopesForPeopleSuggestions_gTo && tokenScopesForPeopleSuggestions_gAny)
      {
        v85 = a7;
        v81 = v14;
        v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = objc_msgSend(&unk_1E242F880, "containsObject:", CFSTR("FROM"));
        v94 = objc_msgSend(&unk_1E242F880, "containsObject:", CFSTR("TO"));
        v22 = objc_msgSend(&unk_1E242F880, "containsObject:", CFSTR("ANY"));
        v93 = v19;
        v91 = v20;
        v83 = v16;
        v84 = v13;
        v82 = v18;
        if (v13 && a5)
        {
          v105 = 0u;
          v106 = 0u;
          v103 = 0u;
          v104 = 0u;
          v23 = v13;
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v103, v115, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v104;
            do
            {
              for (i = 0; i != v25; ++i)
              {
                if (*(_QWORD *)v104 != v26)
                  objc_enumerationMutation(v23);
                v28 = *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * i);
                if (v92)
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("kMDItemAuthorEmailAddresses=\"%@\"cd"), *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * i));
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v93, "addObject:", v29);

                }
                if (v94)
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("kMDItemRecipientEmailAddresses=\"%@\"cd"), v28);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v91, "addObject:", v30);

                }
                if (v22)
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("**=\"%@*\"cwd"), v28);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "addObject:", v31);

                }
              }
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v103, v115, 16);
            }
            while (v25);
          }

          v13 = v84;
          v18 = v82;
          v19 = v93;
          v20 = v91;
        }
        v32 = v85;
        v87 = a6 | v85;
        if ((a5 & 1) == 0 && (v85 & 1) == 0)
        {
          if (v92)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("kMDItemAuthors=\"%@\"cd"), v86);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addObject:", v33);

          }
          if (v94)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("kMDItemRecipients=\"%@\"cd"), v86);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "addObject:", v34);

          }
          if (v22)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("**=\"%@*\"cwd"), v86);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObject:", v35);

          }
          v101 = 0u;
          v102 = 0u;
          v99 = 0u;
          v100 = 0u;
          obj = v13;
          v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v114, 16);
          if (v36)
          {
            v37 = v36;
            v38 = *(_QWORD *)v100;
            do
            {
              v39 = 0;
              v89 = v37;
              do
              {
                if (*(_QWORD *)v100 != v38)
                  objc_enumerationMutation(obj);
                v40 = *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * v39);
                if ((v87 & v92) != 0)
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("kMDItemAuthorEmailAddresses=\"%@\"cd"), *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * v39));
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v93, "addObject:", v41);

                }
                if (((v87 | v92 ^ 1) & 1) == 0)
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(kMDItemAuthors!=\"*\" && kMDItemAuthorEmailAddresses=\"%@\"cd)"), v40);
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v93, "addObject:", v42);

                }
                if (v94)
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("kMDItemRecipientEmailAddresses=\"%@\"cd"), v40);
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v91, "addObject:", v43);

                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("kMDItemRecipients=\"%@\"cd"), v40);
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  v37 = v89;
                  objc_msgSend(v91, "addObject:", v44);

                }
                if (v22)
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("**=\"%@*\"cwd"), v40);
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "addObject:", v45);

                }
                ++v39;
              }
              while (v37 != v39);
              v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v114, 16);
            }
            while (v37);
          }

          v16 = v83;
          v13 = v84;
          v18 = v82;
          v19 = v93;
          v20 = v91;
          v32 = v85;
        }
        if (!v32 || (a5 & 1) != 0)
          goto LABEL_80;
        if (v92)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("kMDItemAuthors=\"%@\"cd"), v86);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v46);

        }
        if (v94)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("kMDItemRecipients=\"%@\"cd"), v86);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v47);

          if (!v22)
          {
LABEL_56:
            if (!v13)
            {
LABEL_80:
              if (v92 && objc_msgSend(v19, "count"))
              {
                v59 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v19, "allObjects");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v60, "componentsJoinedByString:", CFSTR(" || "));
                v61 = v18;
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v59, "stringWithFormat:", CFSTR("(%@)"), v62);
                v63 = (void *)objc_claimAutoreleasedReturnValue();

                v18 = v61;
                v19 = v93;
                v111[0] = CFSTR("TOKEN");
                v111[1] = CFSTR("TEXT");
                v112[0] = tokenScopesForPeopleSuggestions_gFrom;
                v112[1] = v86;
                v111[2] = CFSTR("QUERY");
                v111[3] = CFSTR("TYPE");
                v112[2] = v63;
                v112[3] = &unk_1E242FCD0;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v112, v111, 4);
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "addObject:", v64);

                objc_msgSend(v61, "addObject:", v63);
              }
              else
              {
                v63 = 0;
              }
              if (v94)
              {
                v65 = v22;
                if (objc_msgSend(v20, "count"))
                {
                  v66 = (void *)MEMORY[0x1E0CB3940];
                  objc_msgSend(v20, "allObjects");
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v67, "componentsJoinedByString:", CFSTR(" || "));
                  v68 = v18;
                  v69 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v66, "stringWithFormat:", CFSTR("(%@)"), v69);
                  v70 = objc_claimAutoreleasedReturnValue();

                  v18 = v68;
                  v19 = v93;
                  v109[0] = CFSTR("TOKEN");
                  v109[1] = CFSTR("TEXT");
                  v110[0] = tokenScopesForPeopleSuggestions_gTo;
                  v110[1] = v86;
                  v109[2] = CFSTR("QUERY");
                  v109[3] = CFSTR("TYPE");
                  v110[2] = v70;
                  v110[3] = &unk_1E242FD48;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v110, v109, 4);
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "addObject:", v71);

                  objc_msgSend(v68, "addObject:", v70);
                  v63 = (void *)v70;
                }
              }
              else
              {
                v65 = v22;
              }
              v14 = v81;
              if (v65 && objc_msgSend(v21, "count"))
              {
                v72 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v21, "allObjects");
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v73, "componentsJoinedByString:", CFSTR(" || "));
                v74 = v18;
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v72, "stringWithFormat:", CFSTR("(%@)"), v75);
                v76 = objc_claimAutoreleasedReturnValue();

                v18 = v74;
                v19 = v93;
                v107[0] = CFSTR("TOKEN");
                v107[1] = CFSTR("TEXT");
                v108[0] = tokenScopesForPeopleSuggestions_gAny;
                v108[1] = v86;
                v107[2] = CFSTR("QUERY");
                v107[3] = CFSTR("TYPE");
                v108[2] = v76;
                v108[3] = &unk_1E242FCE8;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v108, v107, 4);
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "addObject:", v77);

                v63 = (void *)v76;
              }
              if (v81 && objc_msgSend(v18, "count"))
              {
                objc_msgSend(v18, "componentsJoinedByString:", CFSTR(" || "));
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v81, "appendString:", v78);

              }
              v17 = 1;
              goto LABEL_95;
            }
LABEL_61:
            v97 = 0u;
            v98 = 0u;
            v95 = 0u;
            v96 = 0u;
            v49 = v13;
            v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v95, v113, 16);
            if (v50)
            {
              v51 = v50;
              v52 = *(_QWORD *)v96;
              do
              {
                for (j = 0; j != v51; ++j)
                {
                  if (*(_QWORD *)v96 != v52)
                    objc_enumerationMutation(v49);
                  v54 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * j);
                  if (v92)
                  {
                    if (a6)
                    {
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(kMDItemAuthorEmailAddresses=\"%@\"cd)"), *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * j), v80);
                    }
                    else if (v87)
                    {
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(kMDItemAuthors=\"%@\"cd && kMDItemAuthorEmailAddresses=\"%@\"cd)"), v86, v54);
                    }
                    else
                    {
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(kMDItemAuthors!=\"*\" && kMDItemAuthorEmailAddresses=\"%@\"cd)"), v54, v80);
                    }
                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v93, "addObject:", v55);

                    v20 = v91;
                  }
                  if (v94)
                  {
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("kMDItemRecipientEmailAddresses=\"%@\"cd"), v54);
                    v56 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v20, "addObject:", v56);

                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("kMDItemRecipients=\"%@\"cd"), v54);
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v20, "addObject:", v57);

                  }
                  if (v22)
                  {
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("**=\"%@*\"cwd"), v54);
                    v58 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v21, "addObject:", v58);

                  }
                }
                v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v95, v113, 16);
              }
              while (v51);
            }

            v16 = v83;
            v13 = v84;
            v18 = v82;
            v19 = v93;
            goto LABEL_80;
          }
        }
        else if (!v22)
        {
          goto LABEL_56;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("**=\"%@*\"cwd"), v86);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v48);

        if (!v13)
          goto LABEL_80;
        goto LABEL_61;
      }
    }
  }
LABEL_95:

  return v17;
}

void sub_18C470BAC(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x240], 8);
  _Unwind_Resume(a1);
}

id readNSDate(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a1;
  v4 = a2;
  if (!readNSDate_timeParser)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v6 = (void *)readNSDate_timeParser;
    readNSDate_timeParser = (uint64_t)v5;

    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)readNSDate_timeParser, "setLocale:", v7);

    objc_msgSend((id)readNSDate_timeParser, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss"));
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend((id)readNSDate_timeParser, "dateFromString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id localizedDisplayText(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  CSGetLocalizedString(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v5);
  v7 = objc_msgSend(v4, "length");
  objc_msgSend(v6, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");
  v10 = v9 - objc_msgSend(v4, "length");

  objc_msgSend(v6, "addAttribute:value:range:", CFSTR("CSSuggestionHighlightAttribute"), v3, v7, v10);
  return v6;
}

void sub_18C4771D0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_18C479998(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __tokenScopesWithPersonKey_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  CSGetLocalizedString(CFSTR("FROM_TOKEN"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)tokenScopesWithPersonKey_gFrom;
  tokenScopesWithPersonKey_gFrom = v0;

  CSGetLocalizedString(CFSTR("TO_TOKEN"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)tokenScopesWithPersonKey_gTo;
  tokenScopesWithPersonKey_gTo = v2;

  CSGetLocalizedString(CFSTR("MESSAGE_TOKEN"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)tokenScopesWithPersonKey_gAny;
  tokenScopesWithPersonKey_gAny = v4;

  CSGetLocalizedString(CFSTR("PERSON_TOKEN"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)tokenScopesWithPersonKey_gPhotos;
  tokenScopesWithPersonKey_gPhotos = v6;

}

void __tokenScopesForPeopleSuggestions_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  CSGetLocalizedString(CFSTR("FROM_TOKEN"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)tokenScopesForPeopleSuggestions_gFrom;
  tokenScopesForPeopleSuggestions_gFrom = v0;

  CSGetLocalizedString(CFSTR("TO_TOKEN"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)tokenScopesForPeopleSuggestions_gTo;
  tokenScopesForPeopleSuggestions_gTo = v2;

  CSGetLocalizedString(CFSTR("MESSAGE_TOKEN"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)tokenScopesForPeopleSuggestions_gAny;
  tokenScopesForPeopleSuggestions_gAny = v4;

}

uint64_t isClientPhotosOrPhotosCtl(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "hasPrefix:", CFSTR("com.apple.mobileslideshow")) & 1) != 0)
    v2 = 1;
  else
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.plphotosctl"));

  return v2;
}

uint64_t cssaCompareL1Score(void *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  unint64_t *v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  float v15;
  float v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  uint64_t v24;

  objc_msgSend(a1, "attributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "attributeSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (uint64_t)CFSTR("kMDQueryResultNewMatchedExtraQueriesField");
  objc_msgSend(v3, "attributeForKey:", CFSTR("kMDQueryResultNewMatchedExtraQueriesField"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributeForKey:", CFSTR("kMDQueryResultNewMatchedExtraQueriesField"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "length") < 0x10 || (unint64_t)objc_msgSend(v6, "length") < 0x10)
    goto LABEL_11;
  v8 = objc_retainAutorelease(v6);
  v9 = (unint64_t *)objc_msgSend(v8, "bytes");
  v11 = *v9;
  v10 = v9[1];
  v12 = objc_retainAutorelease(v7);
  v13 = objc_msgSend(v12, "bytes");
  v5 = *(_OWORD *)v13 < __PAIR128__(v10, v11) ? 1 : -1;
  if (v10 == *(_QWORD *)(v13 + 8) && v11 == *(_QWORD *)v13)
  {
LABEL_11:

    v15 = distanceIfPresentElseMaxFloat(v3);
    v16 = distanceIfPresentElseMaxFloat(v4);
    if (v15 > v16)
      v17 = -1;
    else
      v17 = v5;
    if (v15 < v16)
      v5 = 1;
    else
      v5 = v17;
    if (v15 >= v16 && v15 <= v16)
    {
      objc_msgSend(v3, "contentCreationDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "timeIntervalSinceReferenceDate");
      v20 = v19;

      objc_msgSend(v4, "contentCreationDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "timeIntervalSinceReferenceDate");
      v23 = v22;

      if (v20 < v23)
        v24 = -1;
      else
        v24 = v5;
      if (v20 > v23)
        v24 = 1;
      if (v20 == v23)
        v24 = 0;
      v5 = v24;
    }
  }
  else
  {

  }
  return v5;
}

float distanceIfPresentElseMaxFloat(void *a1)
{
  void *v1;
  void *v2;
  BOOL v3;
  void *v4;
  float v5;
  float v6;

  objc_msgSend(a1, "attributeForKey:", CFSTR("kMDQueryResultEmbeddingDistances"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = v1 == (void *)*MEMORY[0x1E0C9B0D0];
  else
    v3 = 1;
  if (v3)
  {
    v6 = 3.4028e38;
  }
  else
  {
    objc_msgSend(v1, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "floatValue");
    v6 = v5;

  }
  return v6;
}

CFTypeRef object_retainCallback(int a1, CFTypeRef cf)
{
  return CFRetain(cf);
}

void object_releaseCallback(int a1, CFTypeRef cf)
{
  CFRelease(cf);
}

id updateTopHitCandidatesAndReturnItemToBeSentToClientNow(uint64_t a1, CFIndex a2, void *a3, void *a4, void *a5, void *a6, _QWORD *a7)
{
  id v12;
  id v13;
  id v14;
  id v15;
  CSL1CandidateQueue *v16;
  void *v17;
  BOOL v18;
  id v19;
  uint64_t v20;
  id v21;
  int v22;
  void *v23;
  int v24;
  __CFBinaryHeap *denseQueue;
  uint64_t v26;
  __CFBinaryHeap *scoreQueue;
  __CFBinaryHeap *v28;
  __CFBinaryHeap *v29;
  id v30;
  id v32;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (CSSectionIsSyndicatedPhotos(v13))
  {
    objc_msgSend(v14, "attributeForKey:", CFSTR("kMDItemPhotosResultType"));
    v16 = (CSL1CandidateQueue *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "attributeForKey:", CFSTR("kMDItemContentCreationDate"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[CSL1CandidateQueue isEqualToString:](v16, "isEqualToString:", CFSTR("com.apple.photos.search.result.collection.asset")))v18 = v17 == 0;
    else
      v18 = 1;
    if (v18)
    {
      v19 = v12;

      goto LABEL_37;
    }

  }
  ++*a7;
  objc_msgSend(v15, "objectForKey:", v13);
  v16 = (CSL1CandidateQueue *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    v16 = objc_alloc_init(CSL1CandidateQueue);
    objc_msgSend(v15, "setObject:forKey:", v16, v13);
  }
  v20 = usingPommesRankingForClientBundle_once;
  v21 = v13;
  if (v20 != -1)
    dispatch_once(&usingPommesRankingForClientBundle_once, &__block_literal_global_198);
  v22 = objc_msgSend((id)usingPommesRankingForClientBundle_pommesRankedBundles, "containsObject:", v21);

  if (v22)
  {
    objc_msgSend(v14, "attributeForKey:", CFSTR("kMDQueryResultRetrievalType"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "intValue");
    if (v24 == 2)
    {
      denseQueue = v16->_denseQueue;
      if (!denseQueue)
      {
        v29 = CFBinaryHeapCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2, &sBinaryHeapDenseCallbacks, 0);
        v16->_denseQueue = v29;
        goto LABEL_35;
      }
      if (CFBinaryHeapGetCount(v16->_denseQueue) >= a2)
      {
        CFBinaryHeapGetMinimum(denseQueue);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        v26 = cssaCompareL1Distances(v12, v19);
        goto LABEL_39;
      }
    }
    else if (v24 == 3)
    {
      denseQueue = v16->_hybridQueue;
      if (!denseQueue)
      {
        v29 = CFBinaryHeapCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2, &sBinaryHeapHybridCallbacks, 0);
        v16->_hybridQueue = v29;
        goto LABEL_35;
      }
      if (CFBinaryHeapGetCount(v16->_hybridQueue) >= a2)
      {
        CFBinaryHeapGetMinimum(denseQueue);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        v26 = cssaCompareL1Hybrid(v12, v19);
LABEL_39:
        if (v26 != 1)
        {
          v32 = v12;

          v19 = v32;
          goto LABEL_37;
        }
        CFBinaryHeapRemoveMinimumValue(denseQueue);
        CFBinaryHeapAddValue(denseQueue, v12);
        goto LABEL_36;
      }
    }
    else
    {
      denseQueue = v16->_sparseQueue;
      if (!denseQueue)
      {
        v29 = CFBinaryHeapCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2, &sBinaryHeapSparseCallbacks, 0);
        v16->_sparseQueue = v29;
        goto LABEL_35;
      }
      if (CFBinaryHeapGetCount(v16->_sparseQueue) >= a2)
      {
        CFBinaryHeapGetMinimum(denseQueue);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        v26 = cssaCompareL1FloatScores(v12, v19);
        goto LABEL_39;
      }
    }
    v29 = denseQueue;
LABEL_35:
    CFBinaryHeapAddValue(v29, v12);
    v19 = 0;
LABEL_36:

    goto LABEL_37;
  }
  scoreQueue = v16->_scoreQueue;
  if (!scoreQueue)
  {
    v28 = CFBinaryHeapCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2, &sBinaryHeapL1ScoreCallbacks, 0);
    v16->_scoreQueue = v28;
    goto LABEL_22;
  }
  if (CFBinaryHeapGetCount(v16->_scoreQueue) < a2)
  {
    v28 = scoreQueue;
LABEL_22:
    CFBinaryHeapAddValue(v28, v12);
    v19 = 0;
    goto LABEL_37;
  }
  CFBinaryHeapGetMinimum(scoreQueue);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (cssaCompareL1Score(v12, v19) == 1)
  {
    CFBinaryHeapRemoveMinimumValue(scoreQueue);
    CFBinaryHeapAddValue(scoreQueue, v12);
  }
  else
  {
    v30 = v12;

    v19 = v30;
  }
LABEL_37:

  return v19;
}

uint64_t CSSectionIsSyndicatedPhotos(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  _Unwind_Exception *IsSyndicatedPhotos_cold_1;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;

  v1 = a1;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = getSSSectionIsSyndicatedPhotosSymbolLoc_ptr;
  v10 = getSSSectionIsSyndicatedPhotosSymbolLoc_ptr;
  if (!getSSSectionIsSyndicatedPhotosSymbolLoc_ptr)
  {
    v3 = (void *)SpotlightServicesLibrary();
    v2 = dlsym(v3, "SSSectionIsSyndicatedPhotos");
    v8[3] = (uint64_t)v2;
    getSSSectionIsSyndicatedPhotosSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    IsSyndicatedPhotos_cold_1 = (_Unwind_Exception *)CSSectionIsSyndicatedPhotos_cold_1();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(IsSyndicatedPhotos_cold_1);
  }
  v4 = ((uint64_t (*)(id))v2)(v1);

  return v4;
}

uint64_t cssaCompareL1FloatScores(void *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  float v6;
  float v7;
  void *v8;
  float v9;
  float v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;

  objc_msgSend(a1, "attributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "attributeSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mailResultScoreL1");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;

  objc_msgSend(v4, "mailResultScoreL1");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  v10 = v9;

  if (v7 <= v10)
  {
    if (v7 < v10)
    {
      v11 = -1;
    }
    else
    {
      objc_msgSend(v3, "contentCreationDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceReferenceDate");
      v14 = v13;

      objc_msgSend(v4, "contentCreationDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timeIntervalSinceReferenceDate");
      v17 = v16;

      if (v14 >= v17)
        v18 = 0;
      else
        v18 = -1;
      if (v14 > v17)
        v11 = 1;
      else
        v11 = v18;
    }
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

uint64_t cssaCompareL1Distances(void *a1, void *a2)
{
  void *v3;
  void *v4;
  float v5;
  float v6;
  void *v7;
  float v8;
  float v9;
  void *v10;
  float v11;
  float v12;
  uint64_t v13;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  uint64_t v21;

  objc_msgSend(a1, "attributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "attributeSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = distanceIfPresentElseMaxFloat(v3);
  v6 = distanceIfPresentElseMaxFloat(v4);
  if (v5 < v6)
    goto LABEL_4;
  if (v5 > v6)
    goto LABEL_7;
  objc_msgSend(v3, "mailResultScoreL1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  v9 = v8;

  objc_msgSend(v4, "mailResultScoreL1");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatValue");
  v12 = v11;

  if (v9 > v12)
  {
LABEL_4:
    v13 = 1;
    goto LABEL_8;
  }
  if (v9 < v12)
  {
LABEL_7:
    v13 = -1;
    goto LABEL_8;
  }
  objc_msgSend(v3, "contentCreationDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSinceReferenceDate");
  v17 = v16;

  objc_msgSend(v4, "contentCreationDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "timeIntervalSinceReferenceDate");
  v20 = v19;

  if (v17 >= v20)
    v21 = 0;
  else
    v21 = -1;
  if (v17 > v20)
    v13 = 1;
  else
    v13 = v21;
LABEL_8:

  return v13;
}

uint64_t cssaCompareL1Hybrid(void *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  float v6;
  float v7;
  void *v8;
  float v9;
  float v10;
  float v11;
  float v12;
  BOOL v13;
  float v14;
  BOOL v15;
  float v16;
  float v17;
  uint64_t v18;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  uint64_t v26;

  objc_msgSend(a1, "attributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "attributeSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mailResultScoreL1");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;

  objc_msgSend(v4, "mailResultScoreL1");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  v10 = v9;

  v11 = distanceIfPresentElseMaxFloat(v3);
  v12 = distanceIfPresentElseMaxFloat(v4);
  v13 = v11 > 4.0 || v11 < 0.0;
  v14 = 1.0 - (float)(v11 * 0.5);
  if (v13)
    v14 = 0.0;
  v15 = v12 > 4.0 || v12 < 0.0;
  v16 = 1.0 - (float)(v12 * 0.5);
  if (v15)
    v16 = 0.0;
  v17 = v10 + v16;
  if ((float)(v7 + v14) > v17)
    goto LABEL_17;
  if ((float)(v7 + v14) < v17)
  {
    v18 = -1;
    goto LABEL_18;
  }
  if (v7 > v10)
  {
LABEL_17:
    v18 = 1;
    goto LABEL_18;
  }
  v18 = -1;
  if (v7 >= v10)
  {
    objc_msgSend(v3, "contentCreationDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "timeIntervalSinceReferenceDate");
    v22 = v21;

    objc_msgSend(v4, "contentCreationDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "timeIntervalSinceReferenceDate");
    v25 = v24;

    if (v22 > v25)
      v26 = 1;
    else
      v26 = -1;
    if (v22 == v25)
      v26 = 0;
    v18 = v26;
  }
LABEL_18:

  return v18;
}

void sub_18C47F390(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  _Block_object_dispose(&a53, 8);
  _Unwind_Resume(a1);
}

id getSSPommesPhotosRankerClass()
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
  v0 = (void *)getSSPommesPhotosRankerClass_softClass;
  v7 = getSSPommesPhotosRankerClass_softClass;
  if (!getSSPommesPhotosRankerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getSSPommesPhotosRankerClass_block_invoke;
    v3[3] = &unk_1E2401140;
    v3[4] = &v4;
    __getSSPommesPhotosRankerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_18C47F484(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18C480394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

uint64_t CSRankingAttributeIndexForName(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  _Unwind_Exception *IsSyndicatedPhotos_cold_1;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;

  v1 = a1;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = getrankingAttributeIndexForNameSymbolLoc_ptr;
  v10 = getrankingAttributeIndexForNameSymbolLoc_ptr;
  if (!getrankingAttributeIndexForNameSymbolLoc_ptr)
  {
    v3 = (void *)SpotlightServicesLibrary();
    v2 = dlsym(v3, "rankingAttributeIndexForName");
    v8[3] = (uint64_t)v2;
    getrankingAttributeIndexForNameSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    IsSyndicatedPhotos_cold_1 = (_Unwind_Exception *)CSSectionIsSyndicatedPhotos_cold_1();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(IsSyndicatedPhotos_cold_1);
  }
  v4 = ((uint64_t (*)(id))v2)(v1);

  return v4;
}

void CSCompactRankingAttrsInsertValue(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  _Unwind_Exception *IsSyndicatedPhotos_cold_1;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;

  v5 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v6 = getSSCompactRankingAttrsInsertValueSymbolLoc_ptr;
  v12 = getSSCompactRankingAttrsInsertValueSymbolLoc_ptr;
  if (!getSSCompactRankingAttrsInsertValueSymbolLoc_ptr)
  {
    v7 = (void *)SpotlightServicesLibrary();
    v6 = dlsym(v7, "SSCompactRankingAttrsInsertValue");
    v10[3] = (uint64_t)v6;
    getSSCompactRankingAttrsInsertValueSymbolLoc_ptr = v6;
  }
  _Block_object_dispose(&v9, 8);
  if (!v6)
  {
    IsSyndicatedPhotos_cold_1 = (_Unwind_Exception *)CSSectionIsSyndicatedPhotos_cold_1();
    _Block_object_dispose(&v9, 8);
    _Unwind_Resume(IsSyndicatedPhotos_cold_1);
  }
  ((void (*)(uint64_t, uint64_t, id))v6)(a1, a2, v5);

}

void sub_18C480E5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  _Block_object_dispose(&a63, 8);
  _Unwind_Resume(a1);
}

uint64_t CSPommesRankingForSectionBundle(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  _Unwind_Exception *IsSyndicatedPhotos_cold_1;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;

  v1 = a1;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = getSSPommesRankingForSectionBundleSymbolLoc_ptr;
  v10 = getSSPommesRankingForSectionBundleSymbolLoc_ptr;
  if (!getSSPommesRankingForSectionBundleSymbolLoc_ptr)
  {
    v3 = (void *)SpotlightServicesLibrary();
    v2 = dlsym(v3, "SSPommesRankingForSectionBundle");
    v8[3] = (uint64_t)v2;
    getSSPommesRankingForSectionBundleSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    IsSyndicatedPhotos_cold_1 = (_Unwind_Exception *)CSSectionIsSyndicatedPhotos_cold_1();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(IsSyndicatedPhotos_cold_1);
  }
  v4 = ((uint64_t (*)(id))v2)(v1);

  return v4;
}

uint64_t SpotlightServicesLibrary()
{
  uint64_t v0;
  void *v2;

  if (!SpotlightServicesLibraryCore_frameworkLibrary)
    SpotlightServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = SpotlightServicesLibraryCore_frameworkLibrary;
  if (!SpotlightServicesLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void __usingPommesRankingForClientBundle_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v2, "addObject:", CFSTR("com.apple.mobilemail"));
  objc_msgSend(v2, "addObject:", CFSTR("com.apple.pommesctl"));
  objc_msgSend(v2, "addObject:", CFSTR("com.apple.mobilecal"));
  objc_msgSend(v2, "addObject:", CFSTR("com.apple.MobileSMS"));
  objc_msgSend(v2, "addObject:", CFSTR("com.apple.mobileslideshow"));
  objc_msgSend(v2, "addObject:", CFSTR("com.apple.plphotosctl"));
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(v2, "addObject:", CFSTR("com.apple.mobilesafari"));
    objc_msgSend(v2, "addObject:", CFSTR("com.argos.BlendABApp2"));
  }
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(v2, "addObject:", CFSTR("com.apple.mobilenotes"));
    objc_msgSend(v2, "addObject:", CFSTR("com.apple.reminders"));
  }
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)usingPommesRankingForClientBundle_pommesRankedBundles;
  usingPommesRankingForClientBundle_pommesRankedBundles = v0;

}

Class __getPRSRankingItemRankerClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  SpotlightServicesLibrary();
  result = objc_getClass("PRSRankingItemRanker");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPRSRankingItemRankerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getPRSRankingItemRankerClass_block_invoke_cold_1();
    return __getSSPommesPhotosRankerClass_block_invoke(v3);
  }
  return result;
}

Class __getSSPommesPhotosRankerClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  SpotlightServicesLibrary();
  result = objc_getClass("SSPommesPhotosRanker");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSSPommesPhotosRankerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getSSPommesPhotosRankerClass_block_invoke_cold_1();
    return (Class)__getQueryRankingConfigurationForMail_block_invoke(v3);
  }
  return result;
}

void __getQueryRankingConfigurationForMail_block_invoke()
{
  void *v0;
  objc_class *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  id *v6;
  void *v7;
  id v8;
  id *v9;
  void *v10;
  id v11;
  id *v12;
  void *v13;
  id v14;
  id *v15;
  void *v16;
  id v17;
  id *v18;
  void *v19;
  id v20;
  id *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[4];
  id v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  _BYTE v67[128];
  _QWORD v68[5];
  id v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v63 = 0;
  v64 = &v63;
  v65 = 0x2050000000;
  v0 = (void *)getCNContactStoreClass_softClass;
  v66 = getCNContactStoreClass_softClass;
  if (!getCNContactStoreClass_softClass)
  {
    v58 = MEMORY[0x1E0C809B0];
    v59 = 3221225472;
    v60 = (uint64_t)__getCNContactStoreClass_block_invoke;
    v61 = &unk_1E2401140;
    v62 = &v63;
    __getCNContactStoreClass_block_invoke((uint64_t)&v58);
    v0 = (void *)v64[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v63, 8);
  v2 = [v1 alloc];
  v63 = 0;
  v64 = &v63;
  v65 = 0x2050000000;
  v3 = (void *)getCNContactStoreConfigurationClass_softClass;
  v66 = getCNContactStoreConfigurationClass_softClass;
  if (!getCNContactStoreConfigurationClass_softClass)
  {
    v58 = MEMORY[0x1E0C809B0];
    v59 = 3221225472;
    v60 = (uint64_t)__getCNContactStoreConfigurationClass_block_invoke;
    v61 = &unk_1E2401140;
    v62 = &v63;
    __getCNContactStoreConfigurationClass_block_invoke((uint64_t)&v58);
    v3 = (void *)v64[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v63, 8);
  v5 = (void *)objc_opt_new();
  v50 = (void *)objc_msgSend(v2, "initWithConfiguration:", v5);

  v58 = 0;
  v59 = (uint64_t)&v58;
  v60 = 0x2020000000;
  v6 = (id *)getCNContactIdentifierKeySymbolLoc_ptr;
  v61 = (void *)getCNContactIdentifierKeySymbolLoc_ptr;
  if (!getCNContactIdentifierKeySymbolLoc_ptr)
  {
    v7 = (void *)ContactsLibrary();
    v6 = (id *)dlsym(v7, "CNContactIdentifierKey");
    *(_QWORD *)(v59 + 24) = v6;
    getCNContactIdentifierKeySymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v58, 8);
  if (!v6)
    goto LABEL_37;
  v8 = *v6;
  v68[0] = v8;
  v58 = 0;
  v59 = (uint64_t)&v58;
  v60 = 0x2020000000;
  v9 = (id *)getCNContactGivenNameKeySymbolLoc_ptr;
  v61 = (void *)getCNContactGivenNameKeySymbolLoc_ptr;
  if (!getCNContactGivenNameKeySymbolLoc_ptr)
  {
    v10 = (void *)ContactsLibrary();
    v9 = (id *)dlsym(v10, "CNContactGivenNameKey");
    *(_QWORD *)(v59 + 24) = v9;
    getCNContactGivenNameKeySymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(&v58, 8);
  if (!v9)
    goto LABEL_37;
  v11 = *v9;
  v68[1] = v11;
  v58 = 0;
  v59 = (uint64_t)&v58;
  v60 = 0x2020000000;
  v12 = (id *)getCNContactMiddleNameKeySymbolLoc_ptr;
  v61 = (void *)getCNContactMiddleNameKeySymbolLoc_ptr;
  if (!getCNContactMiddleNameKeySymbolLoc_ptr)
  {
    v13 = (void *)ContactsLibrary();
    v12 = (id *)dlsym(v13, "CNContactMiddleNameKey");
    *(_QWORD *)(v59 + 24) = v12;
    getCNContactMiddleNameKeySymbolLoc_ptr = (uint64_t)v12;
  }
  _Block_object_dispose(&v58, 8);
  if (!v12)
    goto LABEL_37;
  v14 = *v12;
  v68[2] = v14;
  v58 = 0;
  v59 = (uint64_t)&v58;
  v60 = 0x2020000000;
  v15 = (id *)getCNContactFamilyNameKeySymbolLoc_ptr;
  v61 = (void *)getCNContactFamilyNameKeySymbolLoc_ptr;
  if (!getCNContactFamilyNameKeySymbolLoc_ptr)
  {
    v16 = (void *)ContactsLibrary();
    v15 = (id *)dlsym(v16, "CNContactFamilyNameKey");
    *(_QWORD *)(v59 + 24) = v15;
    getCNContactFamilyNameKeySymbolLoc_ptr = (uint64_t)v15;
  }
  _Block_object_dispose(&v58, 8);
  if (!v15)
    goto LABEL_37;
  v17 = *v15;
  v68[3] = v17;
  v58 = 0;
  v59 = (uint64_t)&v58;
  v60 = 0x2020000000;
  v18 = (id *)getCNContactEmailAddressesKeySymbolLoc_ptr;
  v61 = (void *)getCNContactEmailAddressesKeySymbolLoc_ptr;
  if (!getCNContactEmailAddressesKeySymbolLoc_ptr)
  {
    v19 = (void *)ContactsLibrary();
    v18 = (id *)dlsym(v19, "CNContactEmailAddressesKey");
    *(_QWORD *)(v59 + 24) = v18;
    getCNContactEmailAddressesKeySymbolLoc_ptr = (uint64_t)v18;
  }
  _Block_object_dispose(&v58, 8);
  if (!v18)
    goto LABEL_37;
  v20 = *v18;
  v68[4] = v20;
  v58 = 0;
  v59 = (uint64_t)&v58;
  v60 = 0x2020000000;
  v21 = (id *)getCNContactPhoneNumbersKeySymbolLoc_ptr;
  v61 = (void *)getCNContactPhoneNumbersKeySymbolLoc_ptr;
  if (!getCNContactPhoneNumbersKeySymbolLoc_ptr)
  {
    v22 = (void *)ContactsLibrary();
    v21 = (id *)dlsym(v22, "CNContactPhoneNumbersKey");
    *(_QWORD *)(v59 + 24) = v21;
    getCNContactPhoneNumbersKeySymbolLoc_ptr = (uint64_t)v21;
  }
  _Block_object_dispose(&v58, 8);
  if (!v21)
  {
LABEL_37:
    CSSectionIsSyndicatedPhotos_cold_1();
    __break(1u);
  }
  v69 = *v21;
  v23 = (void *)MEMORY[0x1E0C99D20];
  v24 = v69;
  objc_msgSend(v23, "arrayWithObjects:count:", v68, 6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v57 = 0;
  objc_msgSend(v50, "_ios_meContactWithKeysToFetch:error:", v25, &v57);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v57;
  if (v27)
  {
    logForCSLogCategoryQuery();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      __getQueryRankingConfigurationForMail_block_invoke_cold_7(v27, v28);
  }
  else
  {
    v29 = (void *)objc_opt_new();
    objc_msgSend(v26, "emailAddresses");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __getQueryRankingConfigurationForMail_block_invoke_2;
    v55[3] = &unk_1E2401AA8;
    v56 = v29;
    v28 = v29;
    objc_msgSend(v30, "enumerateObjectsUsingBlock:", v55);

    objc_msgSend(v26, "identifier");
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)getQueryRankingConfigurationForMail_meContactIdentifier;
    getQueryRankingConfigurationForMail_meContactIdentifier = v31;

    v33 = -[NSObject copy](v28, "copy");
    v34 = (void *)getQueryRankingConfigurationForMail_meEmailAddresses;
    getQueryRankingConfigurationForMail_meEmailAddresses = v33;

  }
  v63 = 0;
  v64 = &v63;
  v65 = 0x2050000000;
  v35 = (void *)getCNFavoritesClass_softClass;
  v66 = getCNFavoritesClass_softClass;
  if (!getCNFavoritesClass_softClass)
  {
    v58 = MEMORY[0x1E0C809B0];
    v59 = 3221225472;
    v60 = (uint64_t)__getCNFavoritesClass_block_invoke;
    v61 = &unk_1E2401140;
    v62 = &v63;
    __getCNFavoritesClass_block_invoke((uint64_t)&v58);
    v35 = (void *)v64[3];
  }
  v36 = objc_retainAutorelease(v35);
  _Block_object_dispose(&v63, 8);
  objc_msgSend(v36, "sharedInstance");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "entries");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(v38, "copy");

  v40 = (void *)objc_opt_new();
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v41 = v39;
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
  if (v42)
  {
    v43 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v42; ++i)
      {
        if (*(_QWORD *)v52 != v43)
          objc_enumerationMutation(v41);
        objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * i), "contactProperty");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "contact");
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v46, "identifier");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "addObject:", v47);

      }
      v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
    }
    while (v42);
  }

  v48 = objc_msgSend(v40, "copy");
  v49 = (void *)getQueryRankingConfigurationForMail_phoneFavorites;
  getQueryRankingConfigurationForMail_phoneFavorites = v48;

}

void sub_18C481DB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void __getQueryRankingConfigurationForMail_block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "value");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

Class __getCNContactStoreClass_block_invoke(uint64_t a1)
{
  Class result;

  ContactsLibrary();
  result = objc_getClass("CNContactStore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCNContactStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getCNContactStoreClass_block_invoke_cold_1();
    return (Class)ContactsLibrary();
  }
  return result;
}

uint64_t ContactsLibrary()
{
  uint64_t v0;
  void *v2;

  if (!ContactsLibraryCore_frameworkLibrary)
    ContactsLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = ContactsLibraryCore_frameworkLibrary;
  if (!ContactsLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getCNContactStoreConfigurationClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  ContactsLibrary();
  result = objc_getClass("CNContactStoreConfiguration");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCNContactStoreConfigurationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getCNContactStoreConfigurationClass_block_invoke_cold_1();
    return (Class)__getCNFavoritesClass_block_invoke(v3);
  }
  return result;
}

Class __getCNFavoritesClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  ContactsLibrary();
  result = objc_getClass("CNFavorites");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCNFavoritesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getCNFavoritesClass_block_invoke_cold_1();
    return (Class)__getMailVIPList_block_invoke(v3);
  }
  return result;
}

void __getMailVIPList_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  getMailVIPList_lastUpdateTime = CFAbsoluteTimeGetCurrent();
  v0 = objc_opt_new();
  v1 = (void *)getMailVIPList_vipListLock;
  getMailVIPList_vipListLock = v0;

  fetchMailVIPList();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)getMailVIPList_vipList;
  getMailVIPList_vipList = v2;

}

id fetchMailVIPList()
{
  void *v0;
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE05DC80);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v1 = (void *)getMSXPCServiceClass_softClass;
  v17 = getMSXPCServiceClass_softClass;
  v2 = MEMORY[0x1E0C809B0];
  if (!getMSXPCServiceClass_softClass)
  {
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = (uint64_t)__getMSXPCServiceClass_block_invoke;
    v11 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E2401140;
    v12 = (void (*)(uint64_t))&v14;
    __getMSXPCServiceClass_block_invoke((uint64_t)&v8);
    v1 = (void *)v15[3];
  }
  v3 = objc_retainAutorelease(v1);
  _Block_object_dispose(&v14, 8);
  objc_msgSend(v3, "remoteProxyForXPCInterface:connectionErrorHandler:", v0, &__block_literal_global_430);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = (uint64_t)&v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__4;
  v12 = __Block_byref_object_dispose__4;
  v13 = 0;
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __fetchMailVIPList_block_invoke_431;
  v7[3] = &unk_1E2401B48;
  v7[4] = &v8;
  objc_msgSend(v4, "orderedVIPAddressesAndUnreadCountsWithCompletion:", v7);
  v5 = *(id *)(v9 + 40);
  _Block_object_dispose(&v8, 8);

  return v5;
}

void sub_18C4821A0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void __fetchMailVIPList_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  logForCSLogCategoryQuery();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __fetchMailVIPList_block_invoke_cold_1(v2, v3);

}

void __fetchMailVIPList_block_invoke_431(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    logForCSLogCategoryQuery();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __fetchMailVIPList_block_invoke_431_cold_2((uint64_t)v6, v7, v8);
  }
  else
  {
    if ((unint64_t)objc_msgSend(v5, "count") >= 0x65)
    {
      objc_msgSend(v5, "subarrayWithRange:", 0, 100);
      v9 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v9;
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v5);
    logForCSLogCategoryQuery();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __fetchMailVIPList_block_invoke_431_cold_1(v7);
  }

}

Class __getMSXPCServiceClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!MailServicesLibraryCore_frameworkLibrary)
  {
    MailServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!MailServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("MSXPCService");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getMSXPCServiceClass_block_invoke_cold_1();
    free(v3);
  }
  getMSXPCServiceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getPRSRankingItemClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  SpotlightServicesLibrary();
  result = objc_getClass("PRSRankingItem");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPRSRankingItemClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getPRSRankingItemClass_block_invoke_cold_1();
    return (Class)__getSSPommesRankerClass_block_invoke(v3);
  }
  return result;
}

Class __getSSPommesRankerClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  SpotlightServicesLibrary();
  result = objc_getClass("SSPommesRanker");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSSPommesRankerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getSSPommesRankerClass_block_invoke_cold_1();
    return (Class)__getPRSAnonymousPipelineManagerClass_block_invoke(v3);
  }
  return result;
}

void __getPRSAnonymousPipelineManagerClass_block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  const char *v5;
  uint8_t *v6;

  SpotlightServicesLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PRSAnonymousPipelineManager");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPRSAnonymousPipelineManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getPRSAnonymousPipelineManagerClass_block_invoke_cold_1();
    OUTLINED_FUNCTION_0_3(v2, v3, v4, v5, v6);
  }
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_18C489E28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSKGAttributeProcessorClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!SpotlightKnowledgeLibraryCore_frameworkLibrary)
  {
    SpotlightKnowledgeLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!SpotlightKnowledgeLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SKGAttributeProcessor");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSKGAttributeProcessorClass_block_invoke_cold_1();
    free(v3);
  }
  getSKGAttributeProcessorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id OUTLINED_FUNCTION_0_4(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_1_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id OUTLINED_FUNCTION_2_1(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_4_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return objc_opt_class();
}

uint64_t CSCodedDataDealloctor(const void *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = CSCodedDataDealloctor_onceToken;
  v4 = a2;
  if (v3 != -1)
    dispatch_once(&CSCodedDataDealloctor_onceToken, &__block_literal_global_8);
  pthread_mutex_lock(&sCSCodedDataDeallocatorLock);
  CFDictionarySetValue((CFMutableDictionaryRef)sCSCodedDataDeallocatorDictionary, a1, v4);

  pthread_mutex_unlock(&sCSCodedDataDeallocatorLock);
  return sCSCodedDataDeallocator;
}

id CSDecodeObject(uint64_t a1)
{
  __int128 v2;
  uint64_t v3;

  v2 = *(_OWORD *)a1;
  v3 = *(_QWORD *)(a1 + 16);
  _CSDecodeObject(&v2, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t CSCodedDataDeallocate(const void *a1)
{
  pthread_mutex_lock(&sCSCodedDataDeallocatorLock);
  CFDictionaryRemoveValue((CFMutableDictionaryRef)sCSCodedDataDeallocatorDictionary, a1);
  return pthread_mutex_unlock(&sCSCodedDataDeallocatorLock);
}

void sub_18C496C48(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C497B00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_18C4993A0(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x570], 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void CSQueryPowerState()
{
  CFTypeRef v0;
  const void *v1;
  CFStringRef v2;
  unsigned __int8 v3;

  v0 = IOPSCopyPowerSourcesInfo();
  if (v0)
  {
    v1 = v0;
    v2 = IOPSGetProvidingPowerSourceType(v0);
    if (v2)
      v3 = CFEqual(v2, CFSTR("Battery Power")) != 0;
    else
      v3 = 0;
    CFRelease(v1);
  }
  else
  {
    v3 = 0;
  }
  atomic_store(v3, (unsigned __int8 *)&sCSOnBattery);
}

void addXPCDateArrayToXPCDict(void *a1, void *a2, const char *a3)
{
  id v5;
  id v6;
  xpc_object_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  if (objc_msgSend(v6, "count"))
  {
    v7 = xpc_array_create(0, 0);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12), "timeIntervalSinceReferenceDate", (_QWORD)v14);
          xpc_array_set_double(v7, 0xFFFFFFFFFFFFFFFFLL, v13);
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

    xpc_dictionary_set_value(v5, a3, v7);
  }

}

id copyXPCDateArrayFromXPCDict(void *a1, const char *a2)
{
  void *v2;
  void *v3;
  size_t count;
  size_t v5;
  void *v6;
  size_t i;
  void *v8;

  xpc_dictionary_get_value(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (count = xpc_array_get_count(v2)) != 0)
  {
    v5 = count;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", count);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != v5; ++i)
    {
      if (xpc_array_get_double(v3, i) != 0.0)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v8);

      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void sub_18C49B204(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C49B3D4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C49B6A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18C49D3A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,id location,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60)
{
  id *v60;

  objc_destroyWeak(v60);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18C49D764(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18C49DB24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18C49DC88(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18C49DE64(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C49E2A4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18C49E400(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18C49E820(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18C49E95C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18C49ED2C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18C49EE80(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18C49F6A0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_18C49F7A0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18C49FA20(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_18C49FB24(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18C49FDD8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_18C49FEEC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18C4A0158(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_18C4A0278(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18C4A0664(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18C4A07A0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18C4A0A40(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18C4A0B68(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18C4A1798(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18C4A18D0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18C4A1B80(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18C4A1C78(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18C4A24A8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_18C4A25C0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18C4A29D8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18C4A2B1C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18C4A2EE8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18C4A302C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18C4A32B0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18C4A33A0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18C4A3638(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18C4A3734(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18C4A3BB4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_18C4A3DEC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18C4A4BD0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_18C4A4CD4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18C4A4F94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18C4A52E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  id *v24;
  uint64_t v25;

  objc_destroyWeak(v24);
  _Block_object_dispose(&a24, 8);
  objc_destroyWeak((id *)(v25 - 88));
  _Unwind_Resume(a1);
}

void sub_18C4A53FC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18C4A5750(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C4A57F8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __stringComposedLengthForEmbeddingCheck_block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) >= 0xAuLL)
    *a7 = 1;
  return result;
}

Class __getSKGEmbeddingVersionManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!SpotlightKnowledgeLibraryCore_frameworkLibrary_0)
  {
    SpotlightKnowledgeLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!SpotlightKnowledgeLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SKGEmbeddingVersionManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSKGEmbeddingVersionManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getSKGEmbeddingVersionManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_4_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

uint64_t OUTLINED_FUNCTION_10_0(void *a1, const char *a2)
{
  return objc_msgSend(a1, "count");
}

void OUTLINED_FUNCTION_12_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_14_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_16(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x20u);
}

void sub_18C4A6694(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id GetCSUserQueryParser()
{
  if (GetCSUserQueryParser_onceToken != -1)
    dispatch_once(&GetCSUserQueryParser_onceToken, &__block_literal_global_12);
  return (id)GetCSUserQueryParser_sParser;
}

uint64_t localeChangeCallback(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "update");
}

void sub_18C4A7140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

id CSGetCurrentLocale(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = a1;
  if (CSGetCurrentLocale_onceLOToken != -1)
    dispatch_once(&CSGetCurrentLocale_onceLOToken, &__block_literal_global_13);
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__7;
  v16 = __Block_byref_object_dispose__7;
  v17 = 0;
  v4 = (void *)CSGetCurrentLocale_sLocaleObserver;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __CSGetCurrentLocale_block_invoke_2;
  v8[3] = &unk_1E2402918;
  v5 = v3;
  v10 = &v12;
  v11 = a2;
  v9 = v5;
  objc_msgSend(v4, "currentLocaleWithPreferredLanguagesBlock:", v8);
  v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

void sub_18C4A74A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id CSGetLocalizedStringForTable(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v3 = a1;
  v4 = a2;
  v5 = (void *)MEMORY[0x1E0CB34D0];
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("/System/Library/Frameworks/CoreSpotlight.framework"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleWithPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "preferredLocalizations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:localization:", v3, 0, v4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "isEqualToString:", v3))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreSpotlight"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:localization:", v3, 0, v4, v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v14;
  }

  return v11;
}

id CSGetLocalizedString(void *a1)
{
  return CSGetLocalizedStringForTable(a1, CFSTR("CoreSpotlight"));
}

id CSSharedUserFSConnection()
{
  if (CSSharedUserFSConnection_onceToken != -1)
    dispatch_once(&CSSharedUserFSConnection_onceToken, &__block_literal_global_8);
  return (id)CSSharedUserFSConnection_sCSUserFSConnection;
}

void CSLiveFSVolumeMountedAtURL(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  CSSharedUserFSConnection();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    logForCSLogCategoryIndex();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v3;
      _os_log_impl(&dword_18C42F000, v6, OS_LOG_TYPE_INFO, "enter volume mounted at %@", buf, 0xCu);
    }

    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v7, "command", "mount");
    objc_msgSend(v3, "absoluteString");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_string(v7, "url", (const char *)objc_msgSend(v8, "UTF8String"));

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __CSLiveFSVolumeMountedAtURL_block_invoke;
    v9[3] = &unk_1E2401FB8;
    v10 = v4;
    objc_msgSend(v5, "sendMessageAsync:completion:", v7, v9);

    goto LABEL_7;
  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CSIndexErrorDomain"), -1003, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v7);
LABEL_7:

  }
}

BOOL CSIsInterestingPath(char *a1)
{
  _BOOL8 result;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  int v8;
  _QWORD v10[3];
  int v11;

  memset(v10, 0, sizeof(v10));
  v11 = 0;
  CSGetFilterForPath(a1, (uint64_t)v10);
  result = 0;
  if ((v10[0] & 0x8000000007) == 1)
  {
    v3 = strstr(a1, ".sb-");
    if (v3)
    {
      v4 = 0;
      v5 = v3 + 4;
      while (v5[v4] && v5[v4] != 47)
      {
        if (++v4 == 8)
        {
          if (v3[12] == 45)
          {
            v6 = 0;
            v7 = v3 + 13;
            while (v7[v6] && v7[v6] != 47)
            {
              if (++v6 == 6)
              {
                v8 = v3[19];
                return v8 != 47 && v8 != 0;
              }
            }
          }
          return 1;
        }
      }
    }
    return 1;
  }
  return result;
}

void sub_18C4A8AC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{

  _Unwind_Resume(a1);
}

void sub_18C4A8B28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{

  _Unwind_Resume(a1);
}

void sub_18C4A8BE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{

  _Unwind_Resume(a1);
}

void sub_18C4A8CA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{

  _Unwind_Resume(a1);
}

void sub_18C4A8D50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{

  _Unwind_Resume(a1);
}

uint64_t CSLiveFSEvent(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[3];
  id v9;
  uint64_t v10;
  __int128 v11;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a1 + 32, 184);
  v10 = 0;
  v8[0] = *(_QWORD *)a1;
  v3 = *(int *)(a1 + 24);
  v8[1] = *(_QWORD *)(a1 + 16);
  v8[2] = v3;
  v4 = v2;
  v9 = v4;
  LODWORD(v10) = *(_DWORD *)(a1 + 224);
  v11 = 0uLL;
  if ((*(_DWORD *)a1 & 0xFFFu) <= 0xE && ((1 << *(_DWORD *)a1) & 0x4628) != 0)
    v11 = *(_OWORD *)(a1 + 232);
  +[CSLiveFSVolume sharedInstance](CSLiveFSVolume, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sendCSLiveFSEvent:", v8);

  return v6;
}

void sub_18C4A8ED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{

  _Unwind_Resume(a1);
}

_BYTE *_CSPathForFilter(char *__src, _BYTE *a2)
{
  char *v3;
  unsigned int v4;
  char *v5;
  int v6;
  char *v7;
  BOOL v8;
  uint64_t v9;

  v3 = __src;
  v4 = *__src;
  if (v4 == 47)
  {
    if (strncmp(__src, "/private/var/mobile/Library/LiveFiles/com.apple.filesystems.userfsd/", 0x44uLL))
      return 0;
    v6 = v3[68];
    v5 = v3 + 68;
    if (!v6)
      return 0;
    v7 = strchr(v5, 47);
    if (!v7)
      return 0;
    v3 = v7 + 1;
    v4 = v7[1];
  }
  v8 = v4 > 0x2F;
  v9 = (1 << v4) & 0xC00000000001;
  if (v8 || v9 == 0)
  {
    *a2 = 47;
    strncpy(a2 + 1, v3, 0x3FFuLL);
    return a2;
  }
  return 0;
}

double CSGetFilterForPath@<D0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  _BYTE *v4;
  double result;
  void *v6;
  _BYTE v7[28];
  _BYTE v8[1024];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  bzero(v8, 0x400uLL);
  v4 = _CSPathForFilter(a1, v8);
  if (CSSharedPathFilter_onceToken != -1)
    dispatch_once(&CSSharedPathFilter_onceToken, &__block_literal_global_91);
  v6 = (void *)CSSharedPathFilter_sCSPathFIlter;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = 0;
  *(_DWORD *)(a2 + 24) = 0;
  if (v4)
  {
    if (v6)
    {
      objc_msgSend(v6, "filterFullPath:", v4);
      *(_OWORD *)a2 = *(_OWORD *)v7;
      result = *(double *)&v7[12];
      *(_OWORD *)(a2 + 12) = *(_OWORD *)&v7[12];
    }
  }
  return result;
}

void thq_commonInit(void *a1)
{
  objc_class *v1;
  _QWORD *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v1 = (objc_class *)MEMORY[0x1E0C99DE8];
  v2 = a1;
  v3 = objc_alloc_init(v1);
  v4 = (void *)v2[62];
  v2[62] = v3;

  objc_msgSend(v2, "queryContext");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v2[63] = objc_msgSend(v7, "count");

}

void commonInit_0(void *a1)
{
  objc_class *v1;
  _QWORD *v2;
  id v3;
  id v4;

  v1 = (objc_class *)MEMORY[0x1E0C99DE8];
  v2 = a1;
  v3 = objc_alloc_init(v1);
  v4 = (id)v2[62];
  v2[62] = v3;

}

void sub_18C4AC4F0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void copyTokensCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, _BYTE *a8)
{
  objc_class *v13;
  id v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  char v17;

  v17 = 0;
  v13 = (objc_class *)MEMORY[0x1E0CB3940];
  v14 = a7;
  v15 = (void *)objc_msgSend([v13 alloc], "initWithCharacters:length:", a1, a2);
  objc_msgSend(v14, "handler");
  v16 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  ((void (**)(_QWORD, void *, uint64_t, uint64_t, char *))v16)[2](v16, v15, a4, a5, &v17);
  if (v17)
    *a8 = 1;

}

void copyQueryTokensCallback(uint64_t a1, uint64_t a2, uint64_t a3, __CFArray *a4)
{
  void *v5;
  const void *v6;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", a1, a2);
  objc_msgSend(v5, "decomposedStringWithCanonicalMapping");
  v6 = (const void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    CFArrayAppendValue(a4, v6);
    CFRelease(v6);
  }
}

void evaluatorHandleCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, _BYTE *a8)
{
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;

  if ((_DWORD)a3 != 2)
  {
    if (!(_DWORD)a3)
      ++*(_QWORD *)(a7 + 88);
    if (objc_msgSend(*(id *)a7, "processPropertyToken:length:tokenType:range:index:evaluationHandler:", a1, a2, a3, a4, a5, a6, *(_QWORD *)(a7 + 8)))
    {
      *(_BYTE *)(a7 + 96) = 1;
      *a8 = 1;
    }
    return;
  }
  v11 = *(_QWORD *)(a7 + 64);
  if (*(_QWORD *)(a7 + 72) >= v11)
  {
    v12 = *(_QWORD *)(a7 + 80);
    if (v11 < v12)
    {
      v13 = malloc_type_malloc(8 * v12, 0x100004000313F17uLL);
      if (v13)
      {
        v14 = v13;
        v15 = malloc_type_malloc(8 * v12, 0x100004000313F17uLL);
        if (v15)
        {
          v16 = v15;
          v17 = malloc_type_malloc(4 * v12, 0x100004052888210uLL);
          if (v17)
          {
            v18 = v17;
            memcpy(v14, *(const void **)(a7 + 24), 8 * *(_QWORD *)(a7 + 72));
            *(_QWORD *)(a7 + 24) = v14;
            memcpy(v16, *(const void **)(a7 + 32), 8 * *(_QWORD *)(a7 + 72));
            *(_QWORD *)(a7 + 32) = v16;
            memcpy(v18, *(const void **)(a7 + 40), 4 * *(_QWORD *)(a7 + 72));
            *(_QWORD *)(a7 + 40) = v18;
            *(_QWORD *)(a7 + 64) = v12;
            goto LABEL_14;
          }
          free(v16);
        }
        free(v14);
      }
    }
  }
LABEL_14:
  if (*(_QWORD *)(a7 + 72) < *(_QWORD *)(a7 + 64))
  {
    v19 = *(_QWORD *)(a7 + 48);
    v20 = *(_QWORD *)(a7 + 56);
    if (v20)
      v21 = -1;
    else
      v21 = 0;
    v22 = v19 - v20 - (v20 != 0);
    if (v22 <= 5 * a2)
    {
      v23 = 5 * *(_QWORD *)(a7 + 80);
      if (v23 >= v19)
      {
        v27 = v21;
        v24 = malloc_type_malloc(v23 + 2, 0x66AB5B5DuLL);
        if (v24)
        {
          v25 = v23 + 1;
          v26 = v24;
          memcpy(v24, *(const void **)(a7 + 16), *(_QWORD *)(a7 + 56));
          *(_QWORD *)(a7 + 16) = v26;
          *(_QWORD *)(a7 + 48) = v25;
          v22 = v25 + v27 - *(_QWORD *)(a7 + 56);
        }
      }
    }
    if (v22 >= a2)
      CFStringEncodingUnicodeToBytes();
  }
  if (*(_QWORD *)(a7 + 56) > *(_QWORD *)(a7 + 48))
    evaluatorHandleCallback_cold_1();
  if (*(_QWORD *)(a7 + 72) > *(_QWORD *)(a7 + 64))
    evaluatorHandleCallback_cold_2();
}

void sub_18C4AD748(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_18C4AE32C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  id v19;
  NSObject *v20;
  void *v21;

  if (a2 == 1)
  {
    v19 = objc_begin_catch(exception_object);
    logForCSLogCategoryDefault();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v19, "reason");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[CSInstantAnswer instantAnswersFromData:].cold.1(v21, (uint64_t)&a19, v20);
    }

    objc_end_catch();
    JUMPOUT(0x18C4AE2E8);
  }
  _Unwind_Resume(exception_object);
}

void sub_18C4AE5A0(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_5(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_18C4AFD10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18C4AFF1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17)
{
  id *v17;
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a17);
  _Unwind_Resume(a1);
}

id plist_xpc_to_ns(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  id v4;
  id *v5;
  id v6;
  void *v8;
  const void *bytes_ptr;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD applier[4];
  id v16;

  v1 = a1;
  v2 = v1;
  if (!v1)
    goto LABEL_13;
  if (v1 == (id)MEMORY[0x1E0C81240])
  {
    v5 = (id *)MEMORY[0x1E0C9AE50];
LABEL_16:
    v6 = *v5;
LABEL_17:
    v4 = v6;
    goto LABEL_18;
  }
  if (v1 == (id)MEMORY[0x1E0C81238])
  {
    v5 = (id *)MEMORY[0x1E0C9AE40];
    goto LABEL_16;
  }
  v3 = MEMORY[0x18D7829C8](v1);
  if (v3 == MEMORY[0x1E0C81390])
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_string_get_string_ptr(v2));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (v3 == MEMORY[0x1E0C81328])
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", xpc_int64_get_value(v2));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (v3 == MEMORY[0x1E0C81398])
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", xpc_uint64_get_value(v2));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (v3 == MEMORY[0x1E0C81300])
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", xpc_double_get_value(v2));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (v3 == MEMORY[0x1E0C812E8])
  {
    v8 = (void *)MEMORY[0x1E0C99D50];
    bytes_ptr = xpc_data_get_bytes_ptr(v2);
    objc_msgSend(v8, "dataWithBytes:length:", bytes_ptr, xpc_data_get_length(v2));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (v3 == MEMORY[0x1E0C812F0])
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)(xpc_date_get_value(v2) / 0x3B9ACA00uLL));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (v3 == MEMORY[0x1E0C81350])
  {
    v5 = (id *)MEMORY[0x1E0C9B0D0];
    goto LABEL_16;
  }
  if (v3 == MEMORY[0x1E0C812C8])
  {
    v10 = (void *)objc_opt_new();
    applier[0] = MEMORY[0x1E0C809B0];
    applier[1] = 3221225472;
    applier[2] = __plist_xpc_to_ns_block_invoke;
    applier[3] = &unk_1E2404798;
    v4 = v10;
    v16 = v4;
    xpc_array_apply(v2, applier);
    v11 = v16;
LABEL_28:

    goto LABEL_18;
  }
  if (v3 == MEMORY[0x1E0C812F8])
  {
    v12 = (void *)objc_opt_new();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __plist_xpc_to_ns_block_invoke_2;
    v13[3] = &unk_1E2404838;
    v4 = v12;
    v14 = v4;
    xpc_dictionary_apply(v2, v13);
    v11 = v14;
    goto LABEL_28;
  }
LABEL_13:
  v4 = 0;
LABEL_18:

  return v4;
}

uint64_t __plist_xpc_to_ns_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;

  plist_xpc_to_ns(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

  return 1;
}

uint64_t __plist_xpc_to_ns_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    plist_xpc_to_ns(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

  }
  return 1;
}

void csquery_xpc_dictionary_encode_status(void *a1, int64_t value)
{
  xpc_dictionary_set_int64(a1, "status", value);
}

void sub_18C4B5BE0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C4B66E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_18C4B72A4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_18C4B78FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C4B7994(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C4B87B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a39, 8);
  _Unwind_Resume(a1);
}

void sub_18C4B8DE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  id *v18;
  uint64_t v19;

  objc_destroyWeak(v18);
  objc_destroyWeak((id *)(v19 - 88));
  _Unwind_Resume(a1);
}

void sub_18C4B915C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  id *v18;
  uint64_t v19;

  objc_destroyWeak(v18);
  objc_destroyWeak((id *)(v19 - 72));
  _Unwind_Resume(a1);
}

void sub_18C4BA8C8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_18C4BA9F4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C4BB398(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_18C4BB824(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C4BBCD4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C4BC414(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_6_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x12u);
}

void OUTLINED_FUNCTION_7_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_8_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t OUTLINED_FUNCTION_9()
{
  return qos_class_self();
}

uint64_t OUTLINED_FUNCTION_18()
{
  void *v0;

  return objc_msgSend(v0, "count");
}

uint64_t OUTLINED_FUNCTION_19(id *a1)
{
  return objc_msgSend(*a1, "count");
}

void sub_18C4BE0E4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C4BE538(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C4BE7C8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void initEntitlements()
{
  if (initEntitlements_onceToken != -1)
    dispatch_once(&initEntitlements_onceToken, &__block_literal_global_20);
}

uint64_t hasPrivateIndexUnsandboxEntitlement()
{
  if (initEntitlements_onceToken != -1)
    dispatch_once(&initEntitlements_onceToken, &__block_literal_global_20);
  return sPrivateIndexUnsandboxEntitlement;
}

uint64_t isAppleInternalInstall()
{
  if (isAppleInternalInstall_onceToken != -1)
    dispatch_once(&isAppleInternalInstall_onceToken, &__block_literal_global_56);
  return isAppleInternalInstall_isInternalInstall;
}

void __isAppleInternalInstall_block_invoke()
{
  char v0;
  id v1;

  v1 = (id)MGCopyAnswer();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v0 = objc_msgSend(v1, "isEqualToString:", CFSTR("Internal"));
  else
    v0 = 0;
  isAppleInternalInstall_isInternalInstall = v0;

}

id CSUnhousedUUID(void *a1)
{
  unint64_t v1;
  NSObject *v2;
  id v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  int v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _BYTE v12[22];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (initEntitlements_onceToken != -1)
    dispatch_once(&initEntitlements_onceToken, &__block_literal_global_20);
  if (sOverrideUUID)
  {
    logForCSLogCategoryDefault();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v12 = 138412290;
      *(_QWORD *)&v12[4] = sOverrideUUID;
      _os_log_impl(&dword_18C42F000, v2, OS_LOG_TYPE_INFO, "CSUnhousedUUID from entitlement uuid %@", v12, 0xCu);
    }

    v3 = (id)sOverrideUUID;
    goto LABEL_25;
  }
  if (!(v1 | sSandboxContainer))
    v1 = (unint64_t)(id)sApplicationIdentifier;
  if (objc_msgSend((id)v1, "length")
    && (!sSandboxContainer || (objc_msgSend((id)v1, "isEqual:", sApplicationIdentifier) & 1) == 0))
  {
    logForCSLogCategoryDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v12 = 138412290;
      *(_QWORD *)&v12[4] = v1;
      _os_log_impl(&dword_18C42F000, v5, OS_LOG_TYPE_INFO, "CSUnhousedUUID from override token %@", v12, 0xCu);
    }

    *(_QWORD *)v12 = 0;
    *(_QWORD *)&v12[8] = 0;
    v6 = (const char *)objc_msgSend(objc_retainAutorelease((id)v1), "UTF8String");
    v7 = strlen(v6);
    MurmurHash3_128((uint64_t)v6, v7, 0, (unint64_t *)v12);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v12);
    objc_msgSend(v8, "UUIDString");
    v3 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_21;
  }
  if (sSandboxContainer)
  {
    logForCSLogCategoryDefault();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v12 = 138412290;
      *(_QWORD *)&v12[4] = sSandboxContainer;
      _os_log_impl(&dword_18C42F000, v4, OS_LOG_TYPE_INFO, "CSUnhousedUUID from sandbox %@", v12, 0xCu);
    }

    objc_msgSend((id)sSandboxContainer, "lastPathComponent");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "length") == 36)
      goto LABEL_21;

  }
  v3 = 0;
LABEL_21:
  logForCSLogCategoryDefault();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v12 = 138412546;
    *(_QWORD *)&v12[4] = v3;
    *(_WORD *)&v12[12] = 2112;
    *(_QWORD *)&v12[14] = v1;
    _os_log_impl(&dword_18C42F000, v9, OS_LOG_TYPE_INFO, "CSUnhousedUUID %@ for %@", v12, 0x16u);
  }

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("unable to resolve unhoused index token uuid"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
LABEL_25:

  return v3;
}

id CSManagedUUID(void *a1)
{
  return CSUnhousedUUID(a1);
}

id CSUnhousedIndexDefaultPath(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (initEntitlements_onceToken != -1)
    dispatch_once(&initEntitlements_onceToken, &__block_literal_global_20);
  if (objc_msgSend(v3, "length"))
  {
    if (objc_msgSend(v3, "characterAtIndex:", 0) == 47)
    {
      v5 = v3;
      goto LABEL_19;
    }
    if (sInternalCSEntitlement)
    {
      objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dataContainerURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "path");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Library/%@"), v4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringByAppendingPathComponent:", v10);
        v5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        NSHomeDirectory();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Library/Caches/%@/%@"), v3, v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringByAppendingPathComponent:", v11);
        v5 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_17;
    }
    NSHomeDirectory();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Library/Caches/%@/%@"), v3, v4);
LABEL_14:
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingPathComponent:", v9);
    v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

    goto LABEL_18;
  }
  v6 = (void *)sSandboxContainer;
  if (sSandboxContainer)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Library/%@"), v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingPathComponent:", v7);
    v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

    goto LABEL_19;
  }
  if (sApplicationIdentifier)
  {
    NSHomeDirectory();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Library/Caches/%@/%@"), sApplicationIdentifier, v4);
    goto LABEL_14;
  }
  v5 = 0;
LABEL_19:
  logForCSLogCategoryDefault();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v15 = v5;
    v16 = 2112;
    v17 = v3;
    _os_log_impl(&dword_18C42F000, v12, OS_LOG_TYPE_INFO, "CSUnhousedIndexPathFromToken %@ for %@", buf, 0x16u);
  }

  return v5;
}

id CSManagedIndexDefaultPath(void *a1)
{
  return CSUnhousedIndexDefaultPath(a1, CFSTR("com.apple.managedcorespotlightd"));
}

id CSResolveUnhousedIndexPath(void *a1, int *a2)
{
  id v3;
  id v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint8_t v10[16];
  stat v11;
  char v12[1024];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  bzero(v12, 0x400uLL);
  memset(&v11, 0, sizeof(v11));
  v4 = objc_retainAutorelease(v3);
  if (realpath_DARWIN_EXTSN((const char *)objc_msgSend(v4, "UTF8String"), v12) && !stat(v12, &v11))
  {
    if ((v11.st_mode & 0x4000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v12, 4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    v5 = 20;
  }
  else
  {
    v5 = *__error();
  }
  *a2 = v5;
  logForCSLogCategoryDefault();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      CSResolveUnhousedIndexPath_cold_1((uint64_t)v4, a2, v7);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_18C42F000, v7, OS_LOG_TYPE_INFO, "~~~ Unhoused index path was originally null", v10, 2u);
  }

  v8 = 0;
LABEL_10:

  return v8;
}

void OUTLINED_FUNCTION_2_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_4_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_0_8(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;

  _os_log_debug_impl(a1, v4, OS_LOG_TYPE_DEBUG, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_2_4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t CategoryIntentFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("CAT_Flight")) & 1) != 0)
  {
    v2 = 0;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("CAT_Hotel")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("CAT_Restaurant")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("CAT_Breakfast")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("CAT_Lunch")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("CAT_Dinner")) & 1) != 0)
  {
    v2 = 5;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("CAT_GenericEvent")) & 1) != 0)
  {
    v2 = 6;
  }
  else
  {
    objc_msgSend(v1, "isEqualToString:", CFSTR("CAT_Other"));
    v2 = 7;
  }

  return v2;
}

uint64_t AttributeIntentFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ATTR_kMDItemEventFlightConfirmationNumber")) & 1) != 0)
  {
    v2 = 0;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ATTR_kMDItemEventFlightDesignator")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ATTR_kMDItemEventFlightDepartureAirportName")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ATTR_kMDItemEventFlightArrivalAirportName")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ATTR_kMDItemEventFlightPassengerSeatNumbers")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ATTR_kMDItemEventFlightDepartureTerminal")) & 1) != 0)
  {
    v2 = 5;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ATTR_kMDItemEventFlightArrivalTerminal")) & 1) != 0)
  {
    v2 = 6;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ATTR_kMDItemEventHotelReservationId")) & 1) != 0)
  {
    v2 = 7;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ATTR_kMDItemEventHotelReservationForName")) & 1) != 0)
  {
    v2 = 8;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ATTR_kMDItemEventHotelReservationForAddress")) & 1) != 0)
  {
    v2 = 9;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ATTR_kMDItemEventRestaurantReservationId")) & 1) != 0)
  {
    v2 = 10;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ATTR_kMDItemEventRestaurantReservationForName")) & 1) != 0)
  {
    v2 = 11;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ATTR_kMDItemEventRestaurantReservationForAddress")) & 1) != 0)
  {
    v2 = 12;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ATTR_kMDItemDate")) & 1) != 0)
  {
    v2 = 13;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ATTR_kMDItemStartDate")) & 1) != 0)
  {
    v2 = 14;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ATTR_kMDItemEndDate")) & 1) != 0)
  {
    v2 = 15;
  }
  else
  {
    objc_msgSend(v1, "isEqualToString:", CFSTR("ATTR_Other"));
    v2 = 16;
  }

  return v2;
}

unint64_t CSSimpleQueryHasResultsForQuery(const void *a1, const void *a2, const void *a3, const void *a4, const void *a5, const void *a6, void *aBlock)
{
  unint64_t v14;
  void *v15;
  unint64_t v16;
  _QWORD v18[12];
  uint8_t buf[16];

  if (sPrepareQueue_onceToken != -1)
    dispatch_once(&sPrepareQueue_onceToken, &__block_literal_global_22_0);
  do
    v14 = __ldaxr(&sTokenNumber);
  while (__stlxr(v14 + 1, &sTokenNumber));
  v15 = _Block_copy(aBlock);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18C42F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "CSSimpleQueryHasResultsForQuery", buf, 2u);
  }
  if (a1)
    CFRetain(a1);
  if (a2)
    CFRetain(a2);
  if (a3)
    CFRetain(a3);
  if (a4)
    CFRetain(a4);
  if (a5)
    CFRetain(a5);
  if (a6)
    CFRetain(a6);
  v16 = v14 + 1;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 0x40000000;
  v18[2] = __CSSimpleQueryHasResultsForQuery_block_invoke;
  v18[3] = &unk_1E2404EB0;
  v18[4] = v15;
  v18[5] = a1;
  v18[6] = a4;
  v18[7] = a2;
  v18[8] = a3;
  v18[9] = a5;
  v18[10] = v16;
  v18[11] = a6;
  dispatch_async((dispatch_queue_t)sConnectionQueue, v18);
  _Block_release(v15);
  return v16;
}

void CSSimpleQueryCancel(uint64_t a1)
{
  _QWORD block[5];

  if (sPrepareQueue_onceToken != -1)
    dispatch_once(&sPrepareQueue_onceToken, &__block_literal_global_22_0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = __CSSimpleQueryCancel_block_invoke;
  block[3] = &__block_descriptor_tmp_20;
  block[4] = a1;
  dispatch_async((dispatch_queue_t)sConnectionQueue, block);
}

dispatch_queue_t __sPrepareQueue_block_invoke()
{
  dispatch_queue_t result;
  uint8_t v1[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_18C42F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Create queue", v1, 2u);
  }
  result = dispatch_queue_create("com.apple.corespotlight.cssimplequery", 0);
  sConnectionQueue = (uint64_t)result;
  return result;
}

void sub_18C4C7A7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getINInteractionClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!IntentsLibraryCore_frameworkLibrary)
  {
    IntentsLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!IntentsLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("INInteraction");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getINInteractionClass_block_invoke_cold_1();
    free(v3);
  }
  getINInteractionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_18C4C8470(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18C4C8528(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_18C4C9E34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18C4CE200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18C4CE2B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18C4CE370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18C4CE428(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18C4CE578(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCNContactClass_block_invoke(uint64_t a1)
{
  Class result;

  ContactsLibrary_0();
  result = objc_getClass("CNContact");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCNContactClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getCNContactClass_block_invoke_cold_1();
    return (Class)ContactsLibrary_0();
  }
  return result;
}

uint64_t ContactsLibrary_0()
{
  uint64_t v0;
  void *v2;

  if (!ContactsLibraryCore_frameworkLibrary_0)
    ContactsLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  v0 = ContactsLibraryCore_frameworkLibrary_0;
  if (!ContactsLibraryCore_frameworkLibrary_0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getCNContactFetchRequestClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  ContactsLibrary_0();
  result = objc_getClass("CNContactFetchRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCNContactFetchRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getCNContactFetchRequestClass_block_invoke_cold_1();
    return (Class)__getCNContactFormatterClass_block_invoke(v3);
  }
  return result;
}

Class __getCNContactFormatterClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  ContactsLibrary_0();
  result = objc_getClass("CNContactFormatter");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCNContactFormatterClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getCNContactFormatterClass_block_invoke_cold_1();
    return (Class)__getCNContactStoreClass_block_invoke_0(v3);
  }
  return result;
}

Class __getCNContactStoreClass_block_invoke_0(uint64_t a1)
{
  Class result;
  uint64_t v3;

  ContactsLibrary_0();
  result = objc_getClass("CNContactStore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCNContactStoreClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getCNContactStoreClass_block_invoke_cold_1();
    return (Class)__getCNContactPropertyClass_block_invoke(v3);
  }
  return result;
}

MDSearchableItem *__getCNContactPropertyClass_block_invoke(uint64_t a1)
{
  MDSearchableItem *result;
  MDSearchableItem *v3;
  SEL v4;
  id v5;
  id v6;
  id v7;

  ContactsLibrary_0();
  result = (MDSearchableItem *)objc_getClass("CNContactProperty");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCNContactPropertyClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (MDSearchableItem *)__getCNContactPropertyClass_block_invoke_cold_1();
    return -[MDSearchableItem initWithUniqueIdentifier:domainIdentifier:attributes:](v3, v4, v5, v6, v7);
  }
  return result;
}

void sub_18C4CF470(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_6_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void sub_18C4D39EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_9(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void sub_18C4D6584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CSSearchQuery.Results.Item.id.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  v0 = sub_18C4E10F0();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78]();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18C4E10E4();
  v4 = sub_18C4E10D8();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

id CSSearchQuery.Results.Item.item.getter()
{
  id *v0;

  return *v0;
}

void CSSearchQuery.Results.Item.item.setter(void *a1)
{
  id *v1;

  *v1 = a1;
}

uint64_t (*CSSearchQuery.Results.Item.item.modify())()
{
  return nullsub_1;
}

BOOL static CSSearchQuery.Results.Item.< infix(_:_:)(id *a1, _QWORD *a2)
{
  return objc_msgSend(*a1, sel_compareByRank_, *a2) == (id)-1;
}

BOOL static CSSearchQuery.Results.Item.> infix(_:_:)(id *a1, _QWORD *a2)
{
  return objc_msgSend(*a1, sel_compareByRank_, *a2) == (id)1;
}

id static CSSearchQuery.Results.Item.== infix(_:_:)(void **a1, id *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *a1;
  v3 = *a2;
  v4 = objc_msgSend(v2, sel_isEqual_, sub_18C4E11BC());
  swift_unknownObjectRelease();
  return v4;
}

uint64_t CSSearchQuery.Results.Item.hash(into:)()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  uint64_t v7;

  v1 = sub_18C4E10F0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78]();
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  sub_18C4E10E4();
  sub_18C4E10D8();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);

  sub_18C4E10FC();
  return swift_bridgeObjectRelease();
}

uint64_t CSSearchQuery.Results.Item.hashValue.getter()
{
  void **v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  id v6;
  uint64_t v8;

  v1 = sub_18C4E10F0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78]();
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  sub_18C4E11C8();
  v6 = v5;
  sub_18C4E10E4();
  sub_18C4E10D8();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);

  sub_18C4E10FC();
  swift_bridgeObjectRelease();
  return sub_18C4E11E0();
}

uint64_t sub_18C4D6C64@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;

  v2 = sub_18C4E10F0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78]();
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18C4E10E4();
  v6 = sub_18C4E10D8();
  v8 = v7;
  result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *a1 = v6;
  a1[1] = v8;
  return result;
}

uint64_t _sSo11CSUserQueryC13CoreSpotlightE4ItemV9hashValueSivg_0()
{
  void **v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  id v6;
  uint64_t v8;

  v1 = sub_18C4E10F0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78]();
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  sub_18C4E11C8();
  v6 = v5;
  sub_18C4E10E4();
  sub_18C4E10D8();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);

  sub_18C4E10FC();
  swift_bridgeObjectRelease();
  return sub_18C4E11E0();
}

uint64_t _sSo11CSUserQueryC13CoreSpotlightE4ItemV4hash4intoys6HasherVz_tF_0()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  uint64_t v7;

  v1 = sub_18C4E10F0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78]();
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  sub_18C4E10E4();
  sub_18C4E10D8();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);

  sub_18C4E10FC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_18C4D6E80()
{
  void **v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  id v6;
  uint64_t v8;

  v1 = sub_18C4E10F0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78]();
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  sub_18C4E11C8();
  v6 = v5;
  sub_18C4E10E4();
  sub_18C4E10D8();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);

  sub_18C4E10FC();
  swift_bridgeObjectRelease();
  return sub_18C4E11E0();
}

id sub_18C4D6F50(void **a1, id *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *a1;
  v3 = *a2;
  v4 = objc_msgSend(v2, sel_isEqual_, sub_18C4E11BC());
  swift_unknownObjectRelease();
  return v4;
}

BOOL sub_18C4D6FB8(id *a1, _QWORD *a2)
{
  return objc_msgSend(*a1, sel_compareByRank_, *a2) == (id)-1;
}

BOOL sub_18C4D6FE4(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_compareByRank_, *a1) != (id)-1;
}

BOOL sub_18C4D7010(id *a1, _QWORD *a2)
{
  return objc_msgSend(*a1, sel_compareByRank_, *a2) != (id)-1;
}

BOOL sub_18C4D703C(id *a1, _QWORD *a2)
{
  return objc_msgSend(*a1, sel_compareByRank_, *a2) == (id)1;
}

uint64_t CSSearchQuery.Results.Iterator.next()()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE03A550);
  *v1 = v0;
  v1[1] = sub_18C4D70D4;
  return sub_18C4E1150();
}

uint64_t sub_18C4D70D4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_18C4D711C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE03A550);
  *v1 = v0;
  v1[1] = sub_18C4D8288;
  return sub_18C4E1150();
}

uint64_t sub_18C4D7188(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;

  v4[4] = a3;
  v4[5] = a4;
  v4[3] = a2;
  v5 = (_QWORD *)swift_task_alloc();
  v4[6] = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE03A550);
  *v5 = v4;
  v5[1] = sub_18C4D71FC;
  return sub_18C4E1150();
}

uint64_t sub_18C4D71FC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 56) = v0;
  swift_task_dealloc();
  if (!v0)
    return (*(uint64_t (**)(void))(v2 + 8))();
  if (*(_QWORD *)(v2 + 24))
  {
    swift_getObjectType();
    sub_18C4E1114();
  }
  return swift_task_switch();
}

uint64_t sub_18C4D7294()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD **)(v0 + 40);
  *(_QWORD *)(v0 + 16) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE03A5A0);
  swift_willThrowTypedImpl();
  *v2 = v1;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_18C4D72FC(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  void (*v9)(char *, uint64_t, uint64_t);
  unint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (**v17)(uint64_t);
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void (*v23)(unint64_t, char *, uint64_t);
  id v24;
  uint64_t aBlock;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE03A5C0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x1E0C80A78]();
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(swift_allocObject() + 16) = a2;
  v8 = a2;
  sub_18C4E1120();
  v9 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v9(v7, a1, v4);
  v10 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v11 = swift_allocObject();
  v23 = *(void (**)(unint64_t, char *, uint64_t))(v5 + 32);
  v23(v11 + v10, v7, v4);
  v29 = sub_18C4D80A0;
  v30 = v11;
  aBlock = MEMORY[0x1E0C809B0];
  v26 = 1107296256;
  v27 = sub_18C4D829C;
  v28 = &block_descriptor;
  v12 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v8, sel_setFoundItemsHandler_, v12);
  _Block_release(v12);
  v24 = v8;
  v13 = objc_msgSend(v8, sel_completionHandler);
  if (v13)
  {
    v14 = v13;
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = v14;
    v9(v7, a1, v4);
    v16 = swift_allocObject();
    v23(v16 + v10, v7, v4);
    v17 = (void (**)(uint64_t))(v16 + ((v10 + v6 + 7) & 0xFFFFFFFFFFFFFFF8));
    *v17 = sub_18C4D81AC;
    v17[1] = (void (*)(uint64_t))v15;
    v29 = sub_18C4D8230;
    v30 = v16;
    aBlock = MEMORY[0x1E0C809B0];
    v26 = 1107296256;
    v27 = sub_18C4D82FC;
    v28 = &block_descriptor_26;
    v18 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    v19 = v24;
    objc_msgSend(v24, sel_setCompletionHandler_, v18);
    _Block_release(v18);
    swift_release();
  }
  else
  {
    v9(v7, a1, v4);
    v20 = swift_allocObject();
    v23(v20 + v10, v7, v4);
    v29 = sub_18C4D812C;
    v30 = v20;
    aBlock = MEMORY[0x1E0C809B0];
    v26 = 1107296256;
    v27 = sub_18C4D82FC;
    v28 = &block_descriptor_17;
    v21 = _Block_copy(&aBlock);
    swift_release();
    v19 = v24;
    objc_msgSend(v24, sel_setCompletionHandler_, v21);
    _Block_release(v21);
  }
  return objc_msgSend(v19, sel_start);
}

uint64_t sub_18C4D7640(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE03A5C8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78]();
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!(a1 >> 62))
  {
    v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v6)
      goto LABEL_3;
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  result = sub_18C4E11B0();
  v6 = result;
  if (!result)
    return swift_bridgeObjectRelease();
LABEL_3:
  if (v6 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      v8 = 0;
      do
      {
        v9 = MEMORY[0x18D781618](v8++, a1);
        v14 = v9;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EE03A5C0);
        sub_18C4E112C();
        (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      }
      while (v6 != v8);
    }
    else
    {
      v10 = 0;
      do
      {
        v11 = *(void **)(a1 + 8 * v10++ + 32);
        v14 = (uint64_t)v11;
        v12 = v11;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EE03A5C0);
        sub_18C4E112C();
        (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      }
      while (v6 != v10);
    }
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_18C4D77DC(id a1, uint64_t a2, uint64_t (*a3)(id))
{
  id v5;

  if (a1)
    v5 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE03A5C0);
  sub_18C4E1138();
  return a3(a1);
}

uint64_t sub_18C4D7850(void *a1)
{
  id v1;

  if (a1)
    v1 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE03A5C0);
  return sub_18C4E1138();
}

uint64_t CSSearchQuery.Results.makeAsyncIterator()()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE03A558);
  return sub_18C4E1144();
}

uint64_t sub_18C4D78CC()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE03A558);
  sub_18C4E1144();
  return sub_18C4D802C(v0);
}

uint64_t CSSearchQuery.results.getter@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  _BYTE *v13;
  id v14;
  _BYTE v16[16];
  void *v17;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE03A558);
  v4 = *(_QWORD *)(v3 - 8);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v6 = &v16[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE03A560);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v11 = &v16[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v9);
  v13 = &v16[-v12];
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v8 + 104))(&v16[-v12], *MEMORY[0x1E0DF0A50], v7);
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 16))(v11, v13, v7);
  v17 = v1;
  v14 = v1;
  sub_18C4E115C();
  (*(void (**)(_BYTE *, uint64_t))(v8 + 8))(v13, v7);

  return (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(v4 + 32))(a1, v6, v3);
}

void sub_18C4D7A60(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x18D782674]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

id sub_18C4D7AAC(uint64_t a1)
{
  uint64_t v1;

  return sub_18C4D72FC(a1, *(void **)(v1 + 16));
}

uint64_t sub_18C4D7AB4()
{
  return MEMORY[0x1E0DEA978];
}

unint64_t sub_18C4D7AC4()
{
  unint64_t result;

  result = qword_1EE03A568[0];
  if (!qword_1EE03A568[0])
  {
    result = MEMORY[0x18D78268C](&protocol conformance descriptor for CSSearchQuery.Results.Item, &type metadata for CSSearchQuery.Results.Item);
    atomic_store(result, qword_1EE03A568);
  }
  return result;
}

uint64_t sub_18C4D7B08()
{
  return MEMORY[0x1E0DEDB38];
}

unint64_t sub_18C4D7B18()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EE03A580;
  if (!qword_1EE03A580)
  {
    v1 = type metadata accessor for CSSearchQuery.Results.Iterator(255);
    result = MEMORY[0x18D78268C](&protocol conformance descriptor for CSSearchQuery.Results.Iterator, v1);
    atomic_store(result, (unint64_t *)&qword_1EE03A580);
  }
  return result;
}

uint64_t type metadata accessor for CSSearchQuery.Results.Iterator(uint64_t a1)
{
  return sub_18C4D7C34(a1, (uint64_t *)&unk_1EE03A5A8);
}

uint64_t _s7ResultsVwCP(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE03A558);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t _s7ResultsVwxx(uint64_t a1, uint64_t a2)
{
  return sub_18C4D7D1C(a1, a2, &qword_1EE03A558);
}

uint64_t _s7ResultsVwcp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_18C4D7D5C(a1, a2, a3, &qword_1EE03A558);
}

uint64_t _s7ResultsVwca(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_18C4D7DAC(a1, a2, a3, &qword_1EE03A558);
}

uint64_t _s7ResultsVwtk(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_18C4D7DFC(a1, a2, a3, &qword_1EE03A558);
}

uint64_t _s7ResultsVwta(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_18C4D7E4C(a1, a2, a3, &qword_1EE03A558);
}

uint64_t _s7ResultsVwet()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_18C4D7BFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_indexTm(a1, a2, a3, &qword_1EE03A558);
}

uint64_t _s7ResultsVwst()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_18C4D7C14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_indexTm(a1, a2, a3, a4, &qword_1EE03A558);
}

uint64_t type metadata accessor for CSSearchQuery.Results(uint64_t a1)
{
  return sub_18C4D7C34(a1, (uint64_t *)&unk_1EE03A588);
}

uint64_t sub_18C4D7C34(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

void sub_18C4D7C68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_18C4D7F50(a1, a2, a3, &qword_1EE03A598, MEMORY[0x1E0DF0AD0]);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x18D782680](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

ValueMetadata *type metadata accessor for CSSearchQuery.Results.Item()
{
  return &type metadata for CSSearchQuery.Results.Item;
}

uint64_t _s7ResultsV8IteratorVwCP(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE03A550);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t _s7ResultsV8IteratorVwxx(uint64_t a1, uint64_t a2)
{
  return sub_18C4D7D1C(a1, a2, &qword_1EE03A550);
}

uint64_t sub_18C4D7D1C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(a3);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
}

uint64_t _s7ResultsV8IteratorVwcp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_18C4D7D5C(a1, a2, a3, &qword_1EE03A550);
}

uint64_t sub_18C4D7D5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;

  v6 = __swift_instantiateConcreteTypeFromMangledName(a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  return a1;
}

uint64_t _s7ResultsV8IteratorVwca(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_18C4D7DAC(a1, a2, a3, &qword_1EE03A550);
}

uint64_t sub_18C4D7DAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;

  v6 = __swift_instantiateConcreteTypeFromMangledName(a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  return a1;
}

uint64_t _s7ResultsV8IteratorVwtk(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_18C4D7DFC(a1, a2, a3, &qword_1EE03A550);
}

uint64_t sub_18C4D7DFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;

  v6 = __swift_instantiateConcreteTypeFromMangledName(a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  return a1;
}

uint64_t _s7ResultsV8IteratorVwta(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_18C4D7E4C(a1, a2, a3, &qword_1EE03A550);
}

uint64_t sub_18C4D7E4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;

  v6 = __swift_instantiateConcreteTypeFromMangledName(a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  return a1;
}

uint64_t _s7ResultsV8IteratorVwet()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_18C4D7E9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_indexTm(a1, a2, a3, &qword_1EE03A550);
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;

  v6 = __swift_instantiateConcreteTypeFromMangledName(a4);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(a1, a2, v6);
}

uint64_t _s7ResultsV8IteratorVwst()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_18C4D7EF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_indexTm(a1, a2, a3, a4, &qword_1EE03A550);
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v7;

  v7 = __swift_instantiateConcreteTypeFromMangledName(a5);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(a1, a2, a2, v7);
}

void sub_18C4D7F3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_18C4D7F50(a1, a2, a3, &qword_1EE03A5B8, MEMORY[0x1E0DF0AB0]);
}

void sub_18C4D7F50(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t (*a5)(uint64_t, ValueMetadata *, uint64_t, _QWORD))
{
  unint64_t v5;

  sub_18C4D7FC0(319, a4, a5);
  if (v5 <= 0x3F)
    swift_initStructMetadata();
}

void sub_18C4D7FC0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, uint64_t, _QWORD))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE03A5A0);
    v7 = a3(a1, &type metadata for CSSearchQuery.Results.Item, v6, MEMORY[0x1E0DEDB38]);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t sub_18C4D802C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for CSSearchQuery.Results(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_18C4D8068()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_18C4D808C()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_cancel);
}

uint64_t sub_18C4D80A0(uint64_t a1)
{
  return sub_18C4D8138(a1, (uint64_t (*)(uint64_t, uint64_t))sub_18C4D7640);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t objectdestroy_10Tm()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE03A5C0);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_18C4D812C(uint64_t a1)
{
  return sub_18C4D8138(a1, (uint64_t (*)(uint64_t, uint64_t))sub_18C4D7850);
}

uint64_t sub_18C4D8138(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v2;
  uint64_t v4;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EE03A5C0) - 8) + 80);
  return a2(a1, v2 + ((v4 + 16) & ~v4));
}

uint64_t sub_18C4D8188()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_18C4D81AC(uint64_t a1)
{
  uint64_t v1;

  sub_18C4D82B0(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_18C4D81B4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE03A5C0);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_18C4D8230(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EE03A5C0) - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  return sub_18C4D77DC(a1, v1 + v4, *(uint64_t (**)(id))(v1 + ((*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_18C4D829C(uint64_t a1, uint64_t a2)
{
  return sub_18C4D9070(a1, a2, (unint64_t *)&unk_1EE03A6E0);
}

void sub_18C4D82B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  if (a1)
    v3 = sub_18C4E10CC();
  else
    v3 = 0;
  v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);

}

void sub_18C4D82FC(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

uint64_t (*CSUserQuery.Item.item.modify())()
{
  return nullsub_1;
}

id static CSUserQuery.Item.== infix(_:_:)(id *a1, _QWORD *a2)
{
  return objc_msgSend(*a1, sel_isEqual_, *a2);
}

id sub_18C4D83A0(id *a1, _QWORD *a2)
{
  return objc_msgSend(*a1, sel_isEqual_, *a2);
}

uint64_t _sSo11CSUserQueryC13CoreSpotlightE4ItemV2idSSvg_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  v0 = sub_18C4E10F0();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18C4E10E4();
  v4 = sub_18C4E10D8();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

id CSUserQuery.Suggestion.suggestion.getter()
{
  id *v0;

  return *v0;
}

void CSUserQuery.Suggestion.suggestion.setter(void *a1)
{
  id *v1;

  *v1 = a1;
}

uint64_t (*CSUserQuery.Suggestion.suggestion.modify())()
{
  return nullsub_1;
}

BOOL static CSUserQuery.Suggestion.< infix(_:_:)(id *a1, _QWORD *a2)
{
  return objc_msgSend(*a1, sel_compareByRank_, *a2) == (id)-1;
}

BOOL static CSUserQuery.Suggestion.> infix(_:_:)(id *a1, _QWORD *a2)
{
  return objc_msgSend(*a1, sel_compareByRank_, *a2) == (id)1;
}

BOOL static CSUserQuery.Suggestion.== infix(_:_:)(id *a1, _QWORD *a2)
{
  return objc_msgSend(*a1, sel_compare_, *a2) == 0;
}

BOOL sub_18C4D8524(id *a1, _QWORD *a2)
{
  return objc_msgSend(*a1, sel_compare_, *a2) == 0;
}

uint64_t CSUserQuery.Responses.Response.id.getter()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  uint64_t v6;
  uint64_t v8;

  v1 = sub_18C4E10F0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  sub_18C4E10E4();
  v6 = sub_18C4E10D8();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);

  return v6;
}

uint64_t CSUserQuery.Responses.Response.hash(into:)()
{
  void **v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  id v6;
  uint64_t v8;

  v1 = sub_18C4E10F0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  sub_18C4E11D4();
  v6 = v5;
  sub_18C4E10E4();
  sub_18C4E10D8();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  sub_18C4E10FC();

  return swift_bridgeObjectRelease();
}

uint64_t CSUserQuery.Responses.Response.hashValue.getter()
{
  void **v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  id v6;
  uint64_t v8;

  v1 = sub_18C4E10F0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  sub_18C4E11C8();
  sub_18C4E11D4();
  v6 = v5;
  sub_18C4E10E4();
  sub_18C4E10D8();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  sub_18C4E10FC();

  swift_bridgeObjectRelease();
  return sub_18C4E11E0();
}

uint64_t sub_18C4D87B8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = CSUserQuery.Responses.Response.id.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_18C4D87E4()
{
  void **v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  id v6;
  uint64_t v8;

  v1 = sub_18C4E10F0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  sub_18C4E11C8();
  sub_18C4E11D4();
  v6 = v5;
  sub_18C4E10E4();
  sub_18C4E10D8();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  sub_18C4E10FC();

  swift_bridgeObjectRelease();
  return sub_18C4E11E0();
}

uint64_t CSUserQuery.Responses.Iterator.next()()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE03A5D8);
  *v1 = v0;
  v1[1] = sub_18C4D8288;
  return sub_18C4E1150();
}

uint64_t sub_18C4D8940()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE03A5D8);
  *v1 = v0;
  v1[1] = sub_18C4D8288;
  return sub_18C4E1150();
}

uint64_t sub_18C4D89AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;

  v4[4] = a3;
  v4[5] = a4;
  v4[3] = a2;
  v5 = (_QWORD *)swift_task_alloc();
  v4[6] = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE03A5D8);
  *v5 = v4;
  v5[1] = sub_18C4D8A20;
  return sub_18C4E1150();
}

uint64_t sub_18C4D8A20()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 56) = v0;
  swift_task_dealloc();
  if (!v0)
    return (*(uint64_t (**)(void))(v2 + 8))();
  if (*(_QWORD *)(v2 + 24))
  {
    swift_getObjectType();
    sub_18C4E1114();
  }
  return swift_task_switch();
}

id sub_18C4D8AB8(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void (*v8)(char *, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, char *, uint64_t);
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void (**v23)(uint64_t);
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;
  void (*v33)(uint64_t, char *, uint64_t);
  id v34;
  uint64_t aBlock;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE03A6D0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(swift_allocObject() + 16) = a2;
  v34 = a2;
  sub_18C4E1120();
  v8 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v8(v7, a1, v4);
  v9 = *(unsigned __int8 *)(v5 + 80);
  v10 = (v9 + 16) & ~v9;
  v11 = v10 + v6;
  v12 = v9 | 7;
  v13 = swift_allocObject();
  v14 = *(void (**)(uint64_t, char *, uint64_t))(v5 + 32);
  v14(v13 + v10, v7, v4);
  v39 = sub_18C4DA494;
  v40 = v13;
  aBlock = MEMORY[0x1E0C809B0];
  v36 = 1107296256;
  v37 = sub_18C4D829C;
  v38 = &block_descriptor_46;
  v15 = _Block_copy(&aBlock);
  swift_release();
  v16 = v34;
  objc_msgSend(v34, sel_setFoundItemsHandler_, v15);
  _Block_release(v15);
  v30 = a1;
  v31 = v8;
  v8(v7, a1, v4);
  v32 = v12;
  v17 = swift_allocObject();
  v33 = v14;
  v14(v17 + v10, v7, v4);
  v39 = sub_18C4DA4FC;
  v40 = v17;
  aBlock = MEMORY[0x1E0C809B0];
  v36 = 1107296256;
  v37 = sub_18C4D905C;
  v38 = &block_descriptor_52;
  v18 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v16, sel_setFoundSuggestionsHandler_, v18);
  _Block_release(v18);
  v19 = objc_msgSend(v16, sel_completionHandler);
  if (v19)
  {
    v20 = v19;
    v21 = swift_allocObject();
    *(_QWORD *)(v21 + 16) = v20;
    v31(v7, v30, v4);
    v22 = swift_allocObject();
    v33(v22 + v10, v7, v4);
    v23 = (void (**)(uint64_t))(v22 + ((v11 + 7) & 0xFFFFFFFFFFFFFFF8));
    *v23 = sub_18C4DA6BC;
    v23[1] = (void (*)(uint64_t))v21;
    v39 = sub_18C4DA5F8;
    v40 = v22;
    aBlock = MEMORY[0x1E0C809B0];
    v36 = 1107296256;
    v37 = sub_18C4D82FC;
    v38 = &block_descriptor_68;
    v24 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    v25 = v34;
    objc_msgSend(v34, sel_setCompletionHandler_, v24);
    _Block_release(v24);
    swift_release();
  }
  else
  {
    v31(v7, v30, v4);
    v26 = swift_allocObject();
    v33(v26 + v10, v7, v4);
    v39 = sub_18C4DA56C;
    v40 = v26;
    aBlock = MEMORY[0x1E0C809B0];
    v36 = 1107296256;
    v37 = sub_18C4D82FC;
    v38 = &block_descriptor_58;
    v27 = _Block_copy(&aBlock);
    swift_release();
    v25 = v34;
    objc_msgSend(v34, sel_setCompletionHandler_, v27);
    _Block_release(v27);
  }
  return objc_msgSend(v25, sel_start);
}

uint64_t sub_18C4D8EA0(unint64_t a1, uint64_t a2, char a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  char v17;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE03A6D8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!(a1 >> 62))
  {
    v9 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_3;
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  result = sub_18C4E11B0();
  v9 = result;
  if (!result)
    return swift_bridgeObjectRelease();
LABEL_3:
  if (v9 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      v11 = 0;
      do
      {
        v12 = MEMORY[0x18D781618](v11++, a1);
        v16 = v12;
        v17 = a3 & 1;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EE03A6D0);
        sub_18C4E112C();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      }
      while (v9 != v11);
    }
    else
    {
      v13 = 0;
      do
      {
        v14 = *(void **)(a1 + 8 * v13++ + 32);
        v16 = (uint64_t)v14;
        v17 = a3 & 1;
        v15 = v14;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EE03A6D0);
        sub_18C4E112C();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      }
      while (v9 != v13);
    }
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_18C4D905C(uint64_t a1, uint64_t a2)
{
  return sub_18C4D9070(a1, a2, &qword_1EE03A6C0);
}

uint64_t sub_18C4D9070(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  void (*v3)(uint64_t);
  uint64_t v4;

  v3 = *(void (**)(uint64_t))(a1 + 32);
  sub_18C4DA66C(0, a3);
  v4 = sub_18C4E1108();
  swift_retain();
  v3(v4);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t CSUserQuery.Responses.makeAsyncIterator()()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE03A5E0);
  return sub_18C4E1144();
}

uint64_t sub_18C4D9100(uint64_t a1, uint64_t a2)
{
  return sub_18C4D984C(a1, a2, &qword_1EE03A5E0, type metadata accessor for CSUserQuery.Responses);
}

uint64_t CSUserQuery.Suggestions.Iterator.next()()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE03A5F0);
  *v1 = v0;
  v1[1] = sub_18C4D70D4;
  return sub_18C4E1150();
}

uint64_t sub_18C4D9180()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE03A5F0);
  *v1 = v0;
  v1[1] = sub_18C4D8288;
  return sub_18C4E1150();
}

uint64_t sub_18C4D91EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;

  v4[4] = a3;
  v4[5] = a4;
  v4[3] = a2;
  v5 = (_QWORD *)swift_task_alloc();
  v4[6] = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE03A5F0);
  *v5 = v4;
  v5[1] = sub_18C4D71FC;
  return sub_18C4E1150();
}

id sub_18C4D9260(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  void (*v9)(char *, uint64_t, uint64_t);
  unint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (**v17)(uint64_t);
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void (*v23)(unint64_t, char *, uint64_t);
  id v24;
  uint64_t aBlock;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE03A6B8);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(swift_allocObject() + 16) = a2;
  v8 = a2;
  sub_18C4E1120();
  v9 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v9(v7, a1, v4);
  v10 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v11 = swift_allocObject();
  v23 = *(void (**)(unint64_t, char *, uint64_t))(v5 + 32);
  v23(v11 + v10, v7, v4);
  v29 = sub_18C4DA38C;
  v30 = v11;
  aBlock = MEMORY[0x1E0C809B0];
  v26 = 1107296256;
  v27 = sub_18C4D905C;
  v28 = &block_descriptor_0;
  v12 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v8, sel_setFoundSuggestionsHandler_, v12);
  _Block_release(v12);
  v24 = v8;
  v13 = objc_msgSend(v8, sel_completionHandler);
  if (v13)
  {
    v14 = v13;
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = v14;
    v9(v7, a1, v4);
    v16 = swift_allocObject();
    v23(v16 + v10, v7, v4);
    v17 = (void (**)(uint64_t))(v16 + ((v10 + v6 + 7) & 0xFFFFFFFFFFFFFFF8));
    *v17 = sub_18C4D81AC;
    v17[1] = (void (*)(uint64_t))v15;
    v29 = sub_18C4DA47C;
    v30 = v16;
    aBlock = MEMORY[0x1E0C809B0];
    v26 = 1107296256;
    v27 = sub_18C4D82FC;
    v28 = &block_descriptor_37;
    v18 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    v19 = v24;
    objc_msgSend(v24, sel_setCompletionHandler_, v18);
    _Block_release(v18);
    swift_release();
  }
  else
  {
    v9(v7, a1, v4);
    v20 = swift_allocObject();
    v23(v20 + v10, v7, v4);
    v29 = sub_18C4DA3F0;
    v30 = v20;
    aBlock = MEMORY[0x1E0C809B0];
    v26 = 1107296256;
    v27 = sub_18C4D82FC;
    v28 = &block_descriptor_28;
    v21 = _Block_copy(&aBlock);
    swift_release();
    v19 = v24;
    objc_msgSend(v24, sel_setCompletionHandler_, v21);
    _Block_release(v21);
  }
  return objc_msgSend(v19, sel_start);
}

uint64_t sub_18C4D95A4(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE03A6C8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!(a1 >> 62))
  {
    v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v6)
      goto LABEL_3;
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  result = sub_18C4E11B0();
  v6 = result;
  if (!result)
    return swift_bridgeObjectRelease();
LABEL_3:
  if (v6 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      v8 = 0;
      do
      {
        v9 = MEMORY[0x18D781618](v8++, a1);
        v14 = v9;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EE03A6B8);
        sub_18C4E112C();
        (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      }
      while (v6 != v8);
    }
    else
    {
      v10 = 0;
      do
      {
        v11 = *(void **)(a1 + 8 * v10++ + 32);
        v14 = (uint64_t)v11;
        v12 = v11;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EE03A6B8);
        sub_18C4E112C();
        (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      }
      while (v6 != v10);
    }
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_18C4D9740(id a1, uint64_t a2, uint64_t (*a3)(id), uint64_t a4, uint64_t *a5)
{
  id v8;

  if (a1)
    v8 = a1;
  __swift_instantiateConcreteTypeFromMangledName(a5);
  sub_18C4E1138();
  return a3(a1);
}

uint64_t sub_18C4D97BC(void *a1, uint64_t a2, uint64_t *a3)
{
  id v4;

  if (a1)
    v4 = a1;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  return sub_18C4E1138();
}

uint64_t CSUserQuery.Suggestions.makeAsyncIterator()()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE03A5F8);
  return sub_18C4E1144();
}

uint64_t sub_18C4D9838(uint64_t a1, uint64_t a2)
{
  return sub_18C4D984C(a1, a2, &qword_1EE03A5F8, type metadata accessor for CSUserQuery.Suggestions);
}

uint64_t sub_18C4D984C(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName(a3);
  sub_18C4E1144();
  return sub_18C4DA320(v4, a4);
}

uint64_t CSUserQuery.responses.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_18C4D98D8(&qword_1EE03A5E0, &qword_1EE03A600, a1);
}

uint64_t CSUserQuery.suggestions.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_18C4D98D8(&qword_1EE03A5F8, &qword_1EE03A608, a1);
}

uint64_t sub_18C4D98D8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v19 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(a1);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v15 = (char *)&v18 - v14;
  (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))((char *)&v18 - v14, *MEMORY[0x1E0DF0A50], v9);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
  v20 = v3;
  v16 = v3;
  sub_18C4E115C();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);

  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v6 + 32))(v19, v8, v5);
}

uint64_t _sSo11CSUserQueryC13CoreSpotlightE11userEngaged_12visibleItems11interactionyAbCE4ItemV_SayAHGSo0A11InteractionVtF_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void **v4;
  void *v5;
  id v6;
  uint64_t result;

  v2 = *(_QWORD *)(a2 + 16);
  if (v2)
  {
    sub_18C4E118C();
    v4 = (void **)(a2 + 32);
    do
    {
      v5 = *v4++;
      v6 = v5;
      sub_18C4E1174();
      sub_18C4E1198();
      sub_18C4E11A4();
      sub_18C4E1180();
      --v2;
    }
    while (v2);
    return swift_release();
  }
  return result;
}

BOOL _sSo11CSUserQueryC13CoreSpotlightE9ResponsesV8ResponseO2eeoiySbAG_AGtFZ_0(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v2 = *(void **)a1;
  v3 = *(void **)a2;
  if ((*(_BYTE *)(a1 + 8) & 1) == 0)
  {
    if ((*(_BYTE *)(a2 + 8) & 1) == 0)
    {
      v9 = v3;
      v10 = v2;
      v11 = v9;
      v8 = objc_msgSend(v10, sel_isEqual_, v11);

      return (BOOL)v8;
    }
    return 0;
  }
  if ((*(_BYTE *)(a2 + 8) & 1) == 0)
    return 0;
  v4 = v3;
  v5 = v2;
  v6 = v4;
  v7 = objc_msgSend(v5, sel_compare_, v6);

  return v7 == 0;
}

id sub_18C4D9BBC(uint64_t a1)
{
  uint64_t v1;

  return sub_18C4D8AB8(a1, *(void **)(v1 + 16));
}

id sub_18C4D9BC4(uint64_t a1)
{
  uint64_t v1;

  return sub_18C4D9260(a1, *(void **)(v1 + 16));
}

unint64_t sub_18C4D9BD0()
{
  unint64_t result;

  result = qword_1EE03A610;
  if (!qword_1EE03A610)
  {
    result = MEMORY[0x18D78268C](&protocol conformance descriptor for CSUserQuery.Item, &type metadata for CSUserQuery.Item);
    atomic_store(result, (unint64_t *)&qword_1EE03A610);
  }
  return result;
}

unint64_t sub_18C4D9C18()
{
  unint64_t result;

  result = qword_1EE03A618;
  if (!qword_1EE03A618)
  {
    result = MEMORY[0x18D78268C](&protocol conformance descriptor for CSUserQuery.Suggestion, &type metadata for CSUserQuery.Suggestion);
    atomic_store(result, (unint64_t *)&qword_1EE03A618);
  }
  return result;
}

unint64_t sub_18C4D9C60()
{
  unint64_t result;

  result = qword_1EE03A620[0];
  if (!qword_1EE03A620[0])
  {
    result = MEMORY[0x18D78268C](&protocol conformance descriptor for CSUserQuery.Responses.Response, &type metadata for CSUserQuery.Responses.Response);
    atomic_store(result, qword_1EE03A620);
  }
  return result;
}

uint64_t sub_18C4D9CA4()
{
  return sub_18C4D9D10(qword_1EE03A638, type metadata accessor for CSUserQuery.Responses.Iterator, (uint64_t)&protocol conformance descriptor for CSUserQuery.Responses.Iterator);
}

uint64_t type metadata accessor for CSUserQuery.Responses.Iterator(uint64_t a1)
{
  return sub_18C4D7C34(a1, (uint64_t *)&unk_1EE03A670);
}

uint64_t sub_18C4D9CE4()
{
  return sub_18C4D9D10(&qword_1EE03A650, type metadata accessor for CSUserQuery.Suggestions.Iterator, (uint64_t)&protocol conformance descriptor for CSUserQuery.Suggestions.Iterator);
}

uint64_t sub_18C4D9D10(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x18D78268C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for CSUserQuery.Suggestions.Iterator(uint64_t a1)
{
  return sub_18C4D7C34(a1, (uint64_t *)&unk_1EE03A6A0);
}

ValueMetadata *type metadata accessor for CSUserQuery.Item()
{
  return &type metadata for CSUserQuery.Item;
}

ValueMetadata *type metadata accessor for CSUserQuery.Suggestion()
{
  return &type metadata for CSUserQuery.Suggestion;
}

uint64_t _s9ResponsesVwCP(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE03A5E0);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t _s9ResponsesVwxx(uint64_t a1, uint64_t a2)
{
  return sub_18C4D7D1C(a1, a2, &qword_1EE03A5E0);
}

uint64_t _s9ResponsesVwcp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_18C4D7D5C(a1, a2, a3, &qword_1EE03A5E0);
}

uint64_t _s9ResponsesVwca(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_18C4D7DAC(a1, a2, a3, &qword_1EE03A5E0);
}

uint64_t _s9ResponsesVwtk(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_18C4D7DFC(a1, a2, a3, &qword_1EE03A5E0);
}

uint64_t _s9ResponsesVwta(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_18C4D7E4C(a1, a2, a3, &qword_1EE03A5E0);
}

uint64_t _s9ResponsesVwet()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_18C4D9E0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_indexTm(a1, a2, a3, &qword_1EE03A5E0);
}

uint64_t _s9ResponsesVwst()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_18C4D9E24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_indexTm(a1, a2, a3, a4, &qword_1EE03A5E0);
}

uint64_t type metadata accessor for CSUserQuery.Responses(uint64_t a1)
{
  return sub_18C4D7C34(a1, (uint64_t *)&unk_1EE03A658);
}

void sub_18C4D9E44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_18C4DA09C(a1, a2, a3, &qword_1EE03A668, (uint64_t)&type metadata for CSUserQuery.Responses.Response, MEMORY[0x1E0DF0AD0]);
}

uint64_t _s9ResponsesV8ResponseOwCP(uint64_t a1, uint64_t a2)
{
  void *v3;
  char v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v4;
  v5 = v3;
  return a1;
}

void _s9ResponsesV8ResponseOwxx(id *a1)
{

}

uint64_t _s9ResponsesV8ResponseOwca(uint64_t a1, uint64_t a2)
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  v3 = *(void **)a2;
  v4 = *(_BYTE *)(a2 + 8);
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v4;
  v6 = v3;

  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t _s9ResponsesV8ResponseOwta(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;

  v3 = *(_BYTE *)(a2 + 8);
  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;

  return a1;
}

uint64_t _s9ResponsesV8ResponseOwet(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t _s9ResponsesV8ResponseOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_18C4D9FB0(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_18C4D9FB8(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CSUserQuery.Responses.Response()
{
  return &type metadata for CSUserQuery.Responses.Response;
}

uint64_t _s9ResponsesV8IteratorVwCP(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE03A5D8);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t _s9ResponsesV8IteratorVwxx(uint64_t a1, uint64_t a2)
{
  return sub_18C4D7D1C(a1, a2, &qword_1EE03A5D8);
}

uint64_t _s9ResponsesV8IteratorVwcp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_18C4D7D5C(a1, a2, a3, &qword_1EE03A5D8);
}

uint64_t _s9ResponsesV8IteratorVwca(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_18C4D7DAC(a1, a2, a3, &qword_1EE03A5D8);
}

uint64_t _s9ResponsesV8IteratorVwtk(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_18C4D7DFC(a1, a2, a3, &qword_1EE03A5D8);
}

uint64_t _s9ResponsesV8IteratorVwta(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_18C4D7E4C(a1, a2, a3, &qword_1EE03A5D8);
}

uint64_t _s9ResponsesV8IteratorVwet()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_18C4DA05C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_indexTm(a1, a2, a3, &qword_1EE03A5D8);
}

uint64_t _s9ResponsesV8IteratorVwst()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_18C4DA074(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_indexTm(a1, a2, a3, a4, &qword_1EE03A5D8);
}

void sub_18C4DA080(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_18C4DA09C(a1, a2, a3, &qword_1EE03A680, (uint64_t)&type metadata for CSUserQuery.Responses.Response, MEMORY[0x1E0DF0AB0]);
}

void sub_18C4DA09C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, uint64_t, _QWORD))
{
  unint64_t v6;

  sub_18C4DA2B4(319, a4, a5, a6);
  if (v6 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t _s11SuggestionsVwCP(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE03A5F8);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t _s11SuggestionsVwxx(uint64_t a1, uint64_t a2)
{
  return sub_18C4D7D1C(a1, a2, &qword_1EE03A5F8);
}

uint64_t _s11SuggestionsVwcp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_18C4D7D5C(a1, a2, a3, &qword_1EE03A5F8);
}

uint64_t _s11SuggestionsVwca(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_18C4D7DAC(a1, a2, a3, &qword_1EE03A5F8);
}

uint64_t _s11SuggestionsVwtk(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_18C4D7DFC(a1, a2, a3, &qword_1EE03A5F8);
}

uint64_t _s11SuggestionsVwta(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_18C4D7E4C(a1, a2, a3, &qword_1EE03A5F8);
}

uint64_t _s11SuggestionsVwet()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_18C4DA198(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_indexTm(a1, a2, a3, &qword_1EE03A5F8);
}

uint64_t _s11SuggestionsVwst()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_18C4DA1B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_indexTm(a1, a2, a3, a4, &qword_1EE03A5F8);
}

uint64_t type metadata accessor for CSUserQuery.Suggestions(uint64_t a1)
{
  return sub_18C4D7C34(a1, (uint64_t *)&unk_1EE03A688);
}

void sub_18C4DA1D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_18C4DA09C(a1, a2, a3, &qword_1EE03A698, (uint64_t)&type metadata for CSUserQuery.Suggestion, MEMORY[0x1E0DF0AD0]);
}

uint64_t _s11SuggestionsV8IteratorVwCP(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE03A5F0);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t _s11SuggestionsV8IteratorVwxx(uint64_t a1, uint64_t a2)
{
  return sub_18C4D7D1C(a1, a2, &qword_1EE03A5F0);
}

uint64_t _s11SuggestionsV8IteratorVwcp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_18C4D7D5C(a1, a2, a3, &qword_1EE03A5F0);
}

uint64_t _s11SuggestionsV8IteratorVwca(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_18C4D7DAC(a1, a2, a3, &qword_1EE03A5F0);
}

uint64_t _s11SuggestionsV8IteratorVwtk(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_18C4D7DFC(a1, a2, a3, &qword_1EE03A5F0);
}

uint64_t _s11SuggestionsV8IteratorVwta(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_18C4D7E4C(a1, a2, a3, &qword_1EE03A5F0);
}

uint64_t _s11SuggestionsV8IteratorVwet()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_18C4DA274(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_indexTm(a1, a2, a3, &qword_1EE03A5F0);
}

uint64_t _s11SuggestionsV8IteratorVwst()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_18C4DA28C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_indexTm(a1, a2, a3, a4, &qword_1EE03A5F0);
}

void sub_18C4DA298(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_18C4DA09C(a1, a2, a3, &qword_1EE03A6B0, (uint64_t)&type metadata for CSUserQuery.Suggestion, MEMORY[0x1E0DF0AB0]);
}

void sub_18C4DA2B4(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, _QWORD))
{
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  if (!*a2)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE03A5A0);
    v9 = a4(a1, a3, v8, MEMORY[0x1E0DEDB38]);
    if (!v10)
      atomic_store(v9, a2);
  }
}

uint64_t sub_18C4DA320(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_18C4DA35C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_18C4DA380()
{
  return objectdestroy_21Tm(&qword_1EE03A6B8);
}

uint64_t sub_18C4DA38C(unint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE03A6B8);
  return sub_18C4D95A4(a1);
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_18C4DA3E4()
{
  return objectdestroy_21Tm(&qword_1EE03A6B8);
}

uint64_t sub_18C4DA3F0(void *a1)
{
  return sub_18C4DA3FC(a1, &qword_1EE03A6B8);
}

uint64_t sub_18C4DA3FC(void *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(a2) - 8) + 80);
  return sub_18C4D97BC(a1, v2 + ((v5 + 16) & ~v5), a2);
}

uint64_t sub_18C4DA44C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_18C4DA470()
{
  return objectdestroy_33Tm(&qword_1EE03A6B8);
}

uint64_t sub_18C4DA47C(void *a1)
{
  return sub_18C4DA604(a1, &qword_1EE03A6B8);
}

uint64_t sub_18C4DA488()
{
  return objectdestroy_21Tm(&qword_1EE03A6D0);
}

uint64_t sub_18C4DA494(unint64_t a1)
{
  return sub_18C4DA49C(a1, 0);
}

uint64_t sub_18C4DA49C(unint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EE03A6D0) - 8) + 80);
  return sub_18C4D8EA0(a1, v2 + ((v5 + 16) & ~v5), a2);
}

uint64_t sub_18C4DA4F0()
{
  return objectdestroy_21Tm(&qword_1EE03A6D0);
}

uint64_t sub_18C4DA4FC(unint64_t a1)
{
  return sub_18C4DA49C(a1, 1);
}

uint64_t sub_18C4DA504()
{
  return objectdestroy_21Tm(&qword_1EE03A6D0);
}

uint64_t objectdestroy_21Tm(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1+ ((*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80)), v2);
  return swift_deallocObject();
}

uint64_t sub_18C4DA56C(void *a1)
{
  return sub_18C4DA3FC(a1, &qword_1EE03A6D0);
}

uint64_t sub_18C4DA578()
{
  return objectdestroy_33Tm(&qword_1EE03A6D0);
}

uint64_t objectdestroy_33Tm(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1+ ((*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80)), v2);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_18C4DA5F8(void *a1)
{
  return sub_18C4DA604(a1, &qword_1EE03A6D0);
}

uint64_t sub_18C4DA604(void *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v5 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(a2) - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = v2 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
  return sub_18C4D9740(a1, v2 + v6, *(uint64_t (**)(id))v7, *(_QWORD *)(v7 + 8), a2);
}

uint64_t sub_18C4DA66C(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t CSSuggestion.localizedAttributedSuggestion.getter()
{
  void *v0;
  id v1;

  v1 = objc_msgSend(v0, sel_localizedAttributedSuggestion);
  return sub_18C4E10C0();
}

void handleEntity_cold_1()
{
  __assert_rtn("handleEntity", "_MDHTMLParsing.m", 667, "length");
}

uint64_t __getPSSSSubscriptionManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __28__CSUserQuery_mailResources__block_invoke_cold_1(v0);
}

uint64_t __getSRResourcesManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getGMAvailabilityWrapperClass_block_invoke_cold_1(v0);
}

uint64_t __getGMAvailabilityWrapperClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __123___MDIndexExtension_initWithExtension_queue_containerPath_containerID_supportedFileTypes_extensionLabel_isAppleCodeSigned___block_invoke_cold_1(v0);
}

uint64_t CSSectionIsSyndicatedPhotos_cold_1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return -[CSSearchQuery(TopHitRanking) setupTopHitQueryContextForClientBundleId:].cold.6(v0);
}

uint64_t __getPRSRankingItemRankerClass_block_invoke_cold_1()
{
  abort_report_np();
  return __getSSPommesPhotosRankerClass_block_invoke_cold_1();
}

uint64_t __getSSPommesPhotosRankerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getQueryRankingConfigurationForMail_block_invoke_cold_7(v0);
}

void __getQueryRankingConfigurationForMail_block_invoke_cold_7(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 134217984;
  v5 = objc_msgSend(a1, "code");
  OUTLINED_FUNCTION_0_3(&dword_18C42F000, a2, v3, "got error fetching me card info: %ld", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2_0();
}

uint64_t __getCNContactStoreClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getCNContactStoreConfigurationClass_block_invoke_cold_1(v0);
}

uint64_t __getCNContactStoreConfigurationClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getCNFavoritesClass_block_invoke_cold_1(v0);
}

uint64_t __getCNFavoritesClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __fetchMailVIPList_block_invoke_cold_1(v0);
}

void __fetchMailVIPList_block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_3(&dword_18C42F000, a2, v4, "failed to connect to MailServices: %@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_2_0();
}

void __fetchMailVIPList_block_invoke_431_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_18C42F000, log, OS_LOG_TYPE_DEBUG, "finished fetching VIPs", v1, 2u);
}

void __fetchMailVIPList_block_invoke_431_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_3(&dword_18C42F000, a2, a3, "error fetching VIPs: %@", (uint8_t *)&v3);
}

uint64_t __getMSXPCServiceClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getPRSRankingItemClass_block_invoke_cold_1(v0);
}

uint64_t __getPRSRankingItemClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getSSPommesRankerClass_block_invoke_cold_1(v0);
}

uint64_t __getSSPommesRankerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getPRSAnonymousPipelineManagerClass_block_invoke_cold_1(v0);
}

void __getPRSAnonymousPipelineManagerClass_block_invoke_cold_1()
{
  abort_report_np();
  -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:].cold.1();
}

uint64_t __getSKGAttributeProcessorClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return +[CSDecoder decodeURLPreservingSecurityScope:].cold.1(v0);
}

uint64_t __getSKGEmbeddingVersionManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __22__MDSearchQuery_start__block_invoke_cold_1(v0);
}

void evaluatorHandleCallback_cold_1()
{
  __assert_rtn("evaluatorHandleCallback", "CSAttributeEvaluator.m", 379, "ctx->transcriptionBufferUsed <= ctx->transcriptionBufferSize");
}

void evaluatorHandleCallback_cold_2()
{
  __assert_rtn("evaluatorHandleCallback", "CSAttributeEvaluator.m", 380, "ctx->transcriptionCount <= ctx->transcriptionSize");
}

void __initEntitlements_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_18C42F000, a1, a3, "SecTaskCreateFromSelf returned NULL", a5, a6, a7, a8, 0);
}

void __initEntitlements_block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_3(&dword_18C42F000, v0, v1, "Found \"%@\" entitlement, value:%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __initEntitlements_block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_3(&dword_18C42F000, v0, v1, "Found \"%@\" entitlement, value:%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __initEntitlements_block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_3(&dword_18C42F000, v0, v1, "Found \"%@\" entitlement, value:%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __initEntitlements_block_invoke_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18C42F000, a1, a3, "Couldn't find the \"%@\" entitlement", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __initEntitlements_block_invoke_cold_6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18C42F000, a1, a3, "Couldn't find the \"%@\" entitlement", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __initEntitlements_block_invoke_cold_7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18C42F000, a1, a3, "Couldn't find \"%@\" entitlement", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __initEntitlements_block_invoke_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_4_3(&dword_18C42F000, v0, v1, "SecTaskCopyValueForEntitlement failed for \"%@\", error:%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __initEntitlements_block_invoke_cold_9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_3(&dword_18C42F000, v0, v1, "Found \"%@\" entitlement, value:%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __initEntitlements_block_invoke_cold_10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18C42F000, a1, a3, "Couldn't find \"%@\" entitlement", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __initEntitlements_block_invoke_cold_11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_4_3(&dword_18C42F000, v0, v1, "SecTaskCopyValueForEntitlement failed for \"%@\", error:%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __initEntitlements_block_invoke_cold_12(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_3(&dword_18C42F000, a1, a3, "Found \"%@\" entitlement, value:%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void addExtensionToken_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_18C42F000, a1, a3, "~~~ Setting cs_unhoused_index_early_error.", a5, a6, a7, a8, 0);
}

void addExtensionToken_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 136315394;
  v4 = a1;
  v5 = 2080;
  v6 = a2;
  _os_log_debug_impl(&dword_18C42F000, log, OS_LOG_TYPE_DEBUG, "~~~ Added extension token %s for index path %s", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

void addExtensionToken_cold_3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18C42F000, a2, OS_LOG_TYPE_ERROR, "Test message did not return a valid dictionary: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

void CSResolveUnhousedIndexPath_cold_1(uint64_t a1, int *a2, NSObject *a3)
{
  int v5;
  char *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  __int16 v11;
  char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = *a2;
  v6 = strerror(*a2);
  v7 = 138412802;
  v8 = a1;
  v9 = 1024;
  v10 = v5;
  v11 = 2080;
  v12 = v6;
  _os_log_error_impl(&dword_18C42F000, a3, OS_LOG_TYPE_ERROR, "~~~ Couldn't resolve unhoused index path from %@, errno: %d (%s)", (uint8_t *)&v7, 0x1Cu);
}

uint64_t __getINInteractionClass_block_invoke_cold_1()
{
  NSObject *v0;

  v0 = abort_report_np();
  return -[CSTokenScopeParser tokenScopeConfigurationForKey:].cold.1(v0);
}

uint64_t __getCNContactClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getCNContactFetchRequestClass_block_invoke_cold_1(v0);
}

uint64_t __getCNContactFetchRequestClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getCNContactFormatterClass_block_invoke_cold_1(v0);
}

uint64_t __getCNContactFormatterClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getCNContactPropertyClass_block_invoke_cold_1(v0);
}

uint64_t __getCNContactPropertyClass_block_invoke_cold_1()
{
  NSObject *v0;

  v0 = abort_report_np();
  return -[_MDExtensionManager extensionForFileType:].cold.1(v0);
}

uint64_t sub_18C4E10C0()
{
  return MEMORY[0x1E0CAF2C8]();
}

uint64_t sub_18C4E10CC()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_18C4E10D8()
{
  return MEMORY[0x1E0CB0918]();
}

uint64_t sub_18C4E10E4()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_18C4E10F0()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_18C4E10FC()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_18C4E1108()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_18C4E1114()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_18C4E1120()
{
  return MEMORY[0x1E0DF0A40]();
}

uint64_t sub_18C4E112C()
{
  return MEMORY[0x1E0DF0A68]();
}

uint64_t sub_18C4E1138()
{
  return MEMORY[0x1E0DF0A70]();
}

uint64_t sub_18C4E1144()
{
  return MEMORY[0x1E0DF0A88]();
}

uint64_t sub_18C4E1150()
{
  return MEMORY[0x1E0DF0AA0]();
}

uint64_t sub_18C4E115C()
{
  return MEMORY[0x1E0DF0AD8]();
}

uint64_t sub_18C4E1168()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_18C4E1174()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_18C4E1180()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_18C4E118C()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_18C4E1198()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_18C4E11A4()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_18C4E11B0()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_18C4E11BC()
{
  return MEMORY[0x1E0DED9F8]();
}

uint64_t sub_18C4E11C8()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_18C4E11D4()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_18C4E11E0()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFAllocatorRef CFAllocatorCreate(CFAllocatorRef allocator, CFAllocatorContext *context)
{
  return (CFAllocatorRef)MEMORY[0x1E0C97CA8](allocator, context);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x1E0C97D30](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFBinaryHeapAddValue(CFBinaryHeapRef heap, const void *value)
{
  MEMORY[0x1E0C97F08](heap, value);
}

CFBinaryHeapRef CFBinaryHeapCreate(CFAllocatorRef allocator, CFIndex capacity, const CFBinaryHeapCallBacks *callBacks, const CFBinaryHeapCompareContext *compareContext)
{
  return (CFBinaryHeapRef)MEMORY[0x1E0C97F20](allocator, capacity, callBacks, compareContext);
}

CFIndex CFBinaryHeapGetCount(CFBinaryHeapRef heap)
{
  return MEMORY[0x1E0C97F28](heap);
}

const void *__cdecl CFBinaryHeapGetMinimum(CFBinaryHeapRef heap)
{
  return (const void *)MEMORY[0x1E0C97F38](heap);
}

void CFBinaryHeapRemoveMinimumValue(CFBinaryHeapRef heap)
{
  MEMORY[0x1E0C97F48](heap);
}

CFBitVectorRef CFBitVectorCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex numBits)
{
  return (CFBitVectorRef)MEMORY[0x1E0C97F58](allocator, bytes, numBits);
}

CFMutableBitVectorRef CFBitVectorCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableBitVectorRef)MEMORY[0x1E0C97F68](allocator, capacity);
}

void CFBitVectorGetBits(CFBitVectorRef bv, CFRange range, UInt8 *bytes)
{
  MEMORY[0x1E0C97F80](bv, range.location, range.length, bytes);
}

CFIndex CFBitVectorGetCount(CFBitVectorRef bv)
{
  return MEMORY[0x1E0C97F88](bv);
}

void CFBitVectorSetBitAtIndex(CFMutableBitVectorRef bv, CFIndex idx, CFBit value)
{
  MEMORY[0x1E0C97FB0](bv, idx, *(_QWORD *)&value);
}

void CFBitVectorSetCount(CFMutableBitVectorRef bv, CFIndex count)
{
  MEMORY[0x1E0C97FC0](bv, count);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1E0C983C8](allocator, bytes, length, bytesDeallocator);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C984D8](theDate);
  return result;
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1E0C985C8](theDict, key, value);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988D0]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x1E0C98A90](key, value, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1E0C98A98](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BF8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C40]();
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98D70](theSet, value);
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1E0C98D80](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1E0C98D98](allocator, capacity, callBacks);
}

unint64_t CFStringConvertEncodingToNSStringEncoding(CFStringEncoding encoding)
{
  return MEMORY[0x1E0C98F30](*(_QWORD *)&encoding);
}

CFStringEncoding CFStringConvertIANACharSetNameToEncoding(CFStringRef theString)
{
  return MEMORY[0x1E0C98F40](theString);
}

CFStringEncoding CFStringConvertNSStringEncodingToEncoding(unint64_t encoding)
{
  return MEMORY[0x1E0C98F48](encoding);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithCharactersNoCopy(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FF8](alloc, chars, numChars, contentsDeallocator);
}

uint64_t CFStringEncodingBytesToUnicode()
{
  return MEMORY[0x1E0C99040]();
}

uint64_t CFStringEncodingUnicodeToBytes()
{
  return MEMORY[0x1E0C99048]();
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1E0C99180](theString, prefix);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1E0C99538](alloc, uuid);
}

CFTypeID CFUUIDGetTypeID(void)
{
  return MEMORY[0x1E0C99560]();
}

uint64_t FPCopyItemForURLWithEUID()
{
  return MEMORY[0x1E0CAA6E8]();
}

uint64_t FPURLMightBeInFileProviderForEUID()
{
  return MEMORY[0x1E0CAAAF8]();
}

CFTypeRef IOPSCopyPowerSourcesInfo(void)
{
  return (CFTypeRef)MEMORY[0x1E0CBB878]();
}

CFStringRef IOPSGetProvidingPowerSourceType(CFTypeRef snapshot)
{
  return (CFStringRef)MEMORY[0x1E0CBB8B0](snapshot);
}

CFRunLoopSourceRef IOPSNotificationCreateRunLoopSource(IOPowerSourceCallbackType callback, void *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0CBB8C0](callback, context);
}

uint64_t MDCreateFilterGenerator()
{
  return MEMORY[0x1E0D4D8F8]();
}

uint64_t MDMatchUTF8()
{
  return MEMORY[0x1E0D4D918]();
}

uint64_t MDMatchWithFuzzyIndicies()
{
  return MEMORY[0x1E0D4D920]();
}

uint64_t MDMatchWithFuzzyIndiciesRange()
{
  return MEMORY[0x1E0D4D928]();
}

uint64_t MDMatcherCreate()
{
  return MEMORY[0x1E0D4D930]();
}

uint64_t MDMatcherDispose()
{
  return MEMORY[0x1E0D4D938]();
}

uint64_t MDRetrieveBestAvailableLanguage()
{
  return MEMORY[0x1E0D4D940]();
}

uint64_t MDTokenizerCreate()
{
  return MEMORY[0x1E0D4D948]();
}

uint64_t MDTokenizerDispose()
{
  return MEMORY[0x1E0D4D950]();
}

uint64_t MDTokenizerGetTokenRanges()
{
  return MEMORY[0x1E0D4D958]();
}

uint64_t MDTokenizerGetTokenRangesWithTranscriptionOptional()
{
  return MEMORY[0x1E0D4D960]();
}

uint64_t MDTokenizerGetTokens()
{
  return MEMORY[0x1E0D4D968]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB2C00]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

uint64_t PLLogRegisteredEvent()
{
  return MEMORY[0x1E0D7FE28]();
}

uint64_t PLShouldLogRegisteredEvent()
{
  return MEMORY[0x1E0D7FE40]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return MEMORY[0x1E0CA5940](inUTI, inConformsToUTI);
}

uint64_t UTTypeCopyParentIdentifiers()
{
  return MEMORY[0x1E0CA5968]();
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

uint64_t _CFURLAttachSecurityScopeToFileURL()
{
  return MEMORY[0x1E0C9A5B0]();
}

uint64_t _CFURLCopySecurityScopeFromFileURL()
{
  return MEMORY[0x1E0C9A678]();
}

uint64_t _MDChildPlistBytesContextCreate()
{
  return MEMORY[0x1E0D4DA18]();
}

uint64_t _MDChildPlistBytesContextDestroy()
{
  return MEMORY[0x1E0D4DA20]();
}

uint64_t _MDItemCopyXattrsForURL()
{
  return MEMORY[0x1E0D09990]();
}

uint64_t _MDPlistArrayGetCount()
{
  return MEMORY[0x1E0D4DA30]();
}

uint64_t _MDPlistArrayGetPlistObjectAtIndex()
{
  return MEMORY[0x1E0D4DA38]();
}

uint64_t _MDPlistArrayIterate()
{
  return MEMORY[0x1E0D4DA40]();
}

uint64_t _MDPlistBooleanGetValue()
{
  return MEMORY[0x1E0D4DA48]();
}

uint64_t _MDPlistBytesCopyChildPlistBytesAtIndex()
{
  return MEMORY[0x1E0D4DAD8]();
}

uint64_t _MDPlistBytesCopyDispatchData()
{
  return MEMORY[0x1E0D4DAE0]();
}

uint64_t _MDPlistBytesCopyPlistAtIndex()
{
  return MEMORY[0x1E0D4DAE8]();
}

uint64_t _MDPlistBytesCreate()
{
  return MEMORY[0x1E0D4DAF0]();
}

uint64_t _MDPlistBytesCreateTrusted()
{
  return MEMORY[0x1E0D4DB18]();
}

uint64_t _MDPlistContainerAddBooleanValue()
{
  return MEMORY[0x1E0D4DB48]();
}

uint64_t _MDPlistContainerAddCString()
{
  return MEMORY[0x1E0D4DB50]();
}

uint64_t _MDPlistContainerAddDataValue()
{
  return MEMORY[0x1E0D4DB58]();
}

uint64_t _MDPlistContainerAddDoubleValue()
{
  return MEMORY[0x1E0D4DB68]();
}

uint64_t _MDPlistContainerAddInt32Value()
{
  return MEMORY[0x1E0D4DB70]();
}

uint64_t _MDPlistContainerAddInt64Value()
{
  return MEMORY[0x1E0D4DB78]();
}

uint64_t _MDPlistContainerAddObject()
{
  return MEMORY[0x1E0D4DB88]();
}

uint64_t _MDPlistContainerBeginArray()
{
  return MEMORY[0x1E0D4DB90]();
}

uint64_t _MDPlistContainerBeginContainer()
{
  return MEMORY[0x1E0D4DB98]();
}

uint64_t _MDPlistContainerBeginDictionary()
{
  return MEMORY[0x1E0D4DBA0]();
}

uint64_t _MDPlistContainerCopyDispatchData()
{
  return MEMORY[0x1E0D4DBA8]();
}

uint64_t _MDPlistContainerCopyObject()
{
  return MEMORY[0x1E0D4DBB0]();
}

uint64_t _MDPlistContainerCreateMutable()
{
  return MEMORY[0x1E0D4DBC0]();
}

uint64_t _MDPlistContainerEndArray()
{
  return MEMORY[0x1E0D4DBE0]();
}

uint64_t _MDPlistContainerEndContainer()
{
  return MEMORY[0x1E0D4DBE8]();
}

uint64_t _MDPlistContainerEndDictionary()
{
  return MEMORY[0x1E0D4DBF0]();
}

uint64_t _MDPlistContainerGetBytes()
{
  return MEMORY[0x1E0D4DBF8]();
}

uint64_t _MDPlistContainerGetLength()
{
  return MEMORY[0x1E0D4DC00]();
}

uint64_t _MDPlistDataGetBytePtr()
{
  return MEMORY[0x1E0D4DC10]();
}

uint64_t _MDPlistDictionaryGetCount()
{
  return MEMORY[0x1E0D4DC18]();
}

uint64_t _MDPlistDictionaryGetPlistObjectForKey()
{
  return MEMORY[0x1E0D4DC20]();
}

uint64_t _MDPlistDictionaryIterate()
{
  return MEMORY[0x1E0D4DC28]();
}

uint64_t _MDPlistGetPlistObjectType()
{
  return MEMORY[0x1E0D4DC38]();
}

uint64_t _MDPlistGetRootPlistObjectFromBytes()
{
  return MEMORY[0x1E0D4DC40]();
}

uint64_t _MDPlistNumberGetDoubleValue()
{
  return MEMORY[0x1E0D4DC50]();
}

uint64_t _MDPlistNumberGetIntValue()
{
  return MEMORY[0x1E0D4DC58]();
}

uint64_t _MDPlistStringGetValue()
{
  return MEMORY[0x1E0D4DC60]();
}

uint64_t _MDStoreOIDArrayApplyBlock()
{
  return MEMORY[0x1E0D4DC70]();
}

uint64_t _MDStoreOIDArrayApplyBlockParallel()
{
  return MEMORY[0x1E0D4DC78]();
}

uint64_t _MDStoreOIDArrayCreate()
{
  return MEMORY[0x1E0D4DC90]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t __MDQueryCreateQueryDictionaryWithOptionsDict()
{
  return MEMORY[0x1E0D4DCF8]();
}

uint64_t __MDQueryParserCancelWithReferenceDict()
{
  return MEMORY[0x1E0D4DD08]();
}

uint64_t __MDQueryParserCooldown()
{
  return MEMORY[0x1E0D4DD10]();
}

uint64_t __MDQueryParserPreheat()
{
  return MEMORY[0x1E0D4DD18]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1E0DE50B8](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x1E0DE50C0](a1);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
  MEMORY[0x1E0C80FD0](dso, description, *(_QWORD *)&flags, activity_block);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

int atexit_b(void *a1)
{
  return MEMORY[0x1E0C81650](a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
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

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
  MEMORY[0x1E0C82BD8](iterations, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1E0C82D08](key);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E20](attr);
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

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1E0C82E58](queue);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
  MEMORY[0x1E0C82E80](queue, key, context, destructor);
}

uint64_t dispatch_queue_set_width()
{
  return MEMORY[0x1E0C82E88]();
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

void dispatch_set_qos_class_floor(dispatch_object_t object, dispatch_qos_class_t qos_class, int relative_priority)
{
  MEMORY[0x1E0C82F00](object, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x1E0C82F28](source);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
  MEMORY[0x1E0C82F40](source, value);
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

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1E0C82FD8](label);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

int fchflags(int a1, __uint32_t a2)
{
  return MEMORY[0x1E0C832C8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

uint64_t icu_ctx_release()
{
  return MEMORY[0x1E0D4DD30]();
}

uint64_t icu_search_context_create()
{
  return MEMORY[0x1E0D4DDB8]();
}

uint64_t icu_search_match()
{
  return MEMORY[0x1E0D4DDF0]();
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BE8](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
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

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x1E0DE7C30](dest, src, size, atomic, hasStrong);
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

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
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

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1E0C84930](log, ptr);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84E90](a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x1E0C84E98](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EA0](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EB8](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EC0](a1);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1E0C84F80]();
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1E0C85040](a1, a2);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1E0C85178]();
}

uint64_t sandbox_container_path_for_pid()
{
  return MEMORY[0x1E0C85190]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C851A0]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1E0C851A8]();
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return MEMORY[0x1E0C851B0]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1E0C851F8]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C85518](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncasecmp_l(const char *a1, const char *a2, size_t a3, locale_t a4)
{
  return MEMORY[0x1E0C85598](a1, a2, a3, a4);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B0](__dst, __src, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C855E8](__s, *(_QWORD *)&__c);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1E0C85610](__s1, __s2);
}

uint64_t strtol_l(const char *a1, char **a2, int a3, locale_t a4)
{
  return MEMORY[0x1E0C85660](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
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

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1E0DEEFC8]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

uint64_t tracing_dispatch_async()
{
  return MEMORY[0x1E0D4DE38]();
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x1E0C85DE0](xarray, value);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1E0C85DF8](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C85E00](objects, count);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1E0C85E10]();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C85E30](xarray);
}

double xpc_array_get_double(xpc_object_t xarray, size_t index)
{
  double result;

  MEMORY[0x1E0C85E58](xarray, index);
  return result;
}

void xpc_array_set_double(xpc_object_t xarray, size_t index, double value)
{
  MEMORY[0x1E0C85EB0](xarray, index, value);
}

void xpc_array_set_int64(xpc_object_t xarray, size_t index, int64_t value)
{
  MEMORY[0x1E0C85EC0](xarray, index, value);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
  MEMORY[0x1E0C85ED0](xarray, index, string);
}

void xpc_array_set_value(xpc_object_t xarray, size_t index, xpc_object_t value)
{
  MEMORY[0x1E0C85EE8](xarray, index, value);
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F50](connection);
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

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1E0C86008](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x1E0C86038](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C86048](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

uint64_t xpc_connection_set_instance()
{
  return MEMORY[0x1E0C86090]();
}

uint64_t xpc_connection_set_non_launching()
{
  return MEMORY[0x1E0C860A0]();
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x1E0C860C8](connection, targetq);
}

void xpc_connection_suspend(xpc_connection_t connection)
{
  MEMORY[0x1E0C860E0](connection);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1E0C86178](bytes, length);
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

int64_t xpc_date_get_value(xpc_object_t xdate)
{
  return MEMORY[0x1E0C861D0](xdate);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1E0C861F0](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1E0C86218]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86230](xdict, key);
}

uint64_t xpc_dictionary_get_audit_token()
{
  return MEMORY[0x1E0C86258]();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x1E0C86270](xdict);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1E0C86278](xdict, key, length);
}

int64_t xpc_dictionary_get_date(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86280](xdict, key);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C86288](xdict, key);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  double result;

  MEMORY[0x1E0C86298](xdict, key);
  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1E0C862B0](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x1E0C86330](xdict, key, bytes, length);
}

void xpc_dictionary_set_date(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86340](xdict, key, value);
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
  MEMORY[0x1E0C86348](xdict, key, value);
}

void xpc_dictionary_set_fd(xpc_object_t xdict, const char *key, int fd)
{
  MEMORY[0x1E0C86358](xdict, key, *(_QWORD *)&fd);
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

xpc_object_t xpc_double_create(double value)
{
  return (xpc_object_t)MEMORY[0x1E0C863D0](value);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  double result;

  MEMORY[0x1E0C863E0](xdouble);
  return result;
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1E0C86570](xint);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x1E0C86658](object);
}

xpc_object_t xpc_shmem_create(void *region, size_t length)
{
  return (xpc_object_t)MEMORY[0x1E0C866F0](region, length);
}

size_t xpc_shmem_map(xpc_object_t xshmem, void **region)
{
  return MEMORY[0x1E0C86700](xshmem, region);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1E0C86720](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1E0C86758](xstring);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1E0C867B8](xuint);
}

