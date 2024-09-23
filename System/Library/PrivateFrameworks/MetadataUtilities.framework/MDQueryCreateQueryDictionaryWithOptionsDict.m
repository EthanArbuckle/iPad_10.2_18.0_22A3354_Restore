@implementation MDQueryCreateQueryDictionaryWithOptionsDict

CFAttributedStringRef ____MDQueryCreateQueryDictionaryWithOptionsDict_block_invoke(_QWORD *a1, const __CFDictionary *a2)
{
  const void **v4;
  void *ParserLibrary;
  const void *v6;
  _BOOL4 v7;
  const void **v8;
  void *v9;
  const void *v10;
  const __CFNumber *Value;
  uint64_t v12;
  const void **v13;
  void *v14;
  const void *v15;
  char v16;
  const __CFString *v17;
  CFNumberRef v18;
  CFNumberRef v19;
  CFDictionaryRef *v20;
  void *v21;
  CFDictionaryRef v22;
  const __CFString *v23;
  const void **v24;
  void *v25;
  const void *v26;
  const __CFDictionary *v27;
  const __CFDictionary *v28;
  CFIndex Count;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  const void **v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  const void **v40;
  const void *v41;
  const void *v42;
  const void *v43;
  const void **v44;
  void *v45;
  const void *v46;
  BOOL v47;
  const void **v48;
  void *v49;
  const __CFNumber *v50;
  const void *v51;
  const void **v52;
  void *v53;
  const void *v54;
  const __CFString *v55;
  CFIndex Length;
  const void **v57;
  void *v58;
  const void *v59;
  const __CFDictionary *v60;
  const __CFString *v61;
  __CFDictionary *Mutable;
  const __CFDictionary *v63;
  const __CFDictionary *v64;
  CFIndex v65;
  const __CFAllocator *v66;
  __CFDictionary *MutableCopy;
  CFAttributedStringRef result;
  CFDictionaryRef v69;
  uint64_t valuePtr;
  uint64_t *p_valuePtr;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  valuePtr = 0;
  p_valuePtr = &valuePtr;
  v72 = 0x2000000000;
  v4 = (const void **)getkQPParseResultQUOutputKeySymbolLoc_ptr;
  v73 = getkQPParseResultQUOutputKeySymbolLoc_ptr;
  if (!getkQPParseResultQUOutputKeySymbolLoc_ptr)
  {
    ParserLibrary = (void *)QueryParserLibrary();
    v4 = (const void **)dlsym(ParserLibrary, "kQPParseResultQUOutputKey");
    p_valuePtr[3] = (uint64_t)v4;
    getkQPParseResultQUOutputKeySymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&valuePtr, 8);
  if (!v4)
  {
    __MDQueryCreateQueryDictionaryWithOptionsDict_cold_1();
LABEL_96:
    __MDQueryCreateQueryDictionaryWithOptionsDict_cold_1();
LABEL_97:
    __MDQueryCreateQueryDictionaryWithOptionsDict_cold_1();
LABEL_98:
    __MDQueryCreateQueryDictionaryWithOptionsDict_cold_1();
LABEL_99:
    __MDQueryCreateQueryDictionaryWithOptionsDict_cold_1();
LABEL_100:
    __MDQueryCreateQueryDictionaryWithOptionsDict_cold_1();
LABEL_101:
    __MDQueryCreateQueryDictionaryWithOptionsDict_cold_1();
LABEL_102:
    __MDQueryCreateQueryDictionaryWithOptionsDict_cold_1();
    goto LABEL_103;
  }
  v6 = *v4;
  if (v6)
    v7 = CFDictionaryContainsKey(a2, v6) != 0;
  else
    v7 = 0;
  valuePtr = 0;
  p_valuePtr = &valuePtr;
  v72 = 0x2000000000;
  v8 = (const void **)getkQPParseResultConfidenceKeySymbolLoc_ptr;
  v73 = getkQPParseResultConfidenceKeySymbolLoc_ptr;
  if (!getkQPParseResultConfidenceKeySymbolLoc_ptr)
  {
    v9 = (void *)QueryParserLibrary();
    v8 = (const void **)dlsym(v9, "kQPParseResultConfidenceKey");
    p_valuePtr[3] = (uint64_t)v8;
    getkQPParseResultConfidenceKeySymbolLoc_ptr = (uint64_t)v8;
  }
  _Block_object_dispose(&valuePtr, 8);
  if (!v8)
    goto LABEL_96;
  v10 = *v8;
  if (v10)
  {
    if (CFDictionaryContainsKey(a2, v10))
    {
      Value = (const __CFNumber *)CFDictionaryGetValue(a2, v10);
      LODWORD(valuePtr) = 0;
      CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
      v12 = *(_QWORD *)(a1[4] + 8);
      if (valuePtr > *(_DWORD *)(v12 + 24))
        *(_DWORD *)(v12 + 24) = valuePtr;
    }
  }
  valuePtr = 0;
  p_valuePtr = &valuePtr;
  v72 = 0x2000000000;
  v13 = (const void **)getkQPParseResultDescriptionKeySymbolLoc_ptr;
  v73 = getkQPParseResultDescriptionKeySymbolLoc_ptr;
  if (!getkQPParseResultDescriptionKeySymbolLoc_ptr)
  {
    v14 = (void *)QueryParserLibrary();
    v13 = (const void **)dlsym(v14, "kQPParseResultDescriptionKey");
    p_valuePtr[3] = (uint64_t)v13;
    getkQPParseResultDescriptionKeySymbolLoc_ptr = (uint64_t)v13;
  }
  _Block_object_dispose(&valuePtr, 8);
  if (!v13)
    goto LABEL_97;
  v15 = *v13;
  if (v15)
    v16 = v7;
  else
    v16 = 1;
  if ((v16 & 1) != 0 || !CFDictionaryContainsKey(a2, v15))
  {
    v17 = 0;
  }
  else
  {
    v17 = (const __CFString *)CFDictionaryGetValue(a2, v15);
    if (CFStringGetLength(v17))
    {
      if (CFStringGetLength(*(CFStringRef *)(*(_QWORD *)(a1[5] + 8) + 24)))
        CFStringAppend(*(CFMutableStringRef *)(*(_QWORD *)(a1[5] + 8) + 24), CFSTR(" || "));
      CFStringAppend(*(CFMutableStringRef *)(*(_QWORD *)(a1[5] + 8) + 24), v17);
      ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
      v18 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberCFIndexType, (const void *)(*(_QWORD *)(a1[6] + 8) + 24));
      if (v18)
      {
        v19 = v18;
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1[7] + 8) + 24), v17, v18);
        CFRelease(v19);
      }
    }
  }
  valuePtr = 0;
  p_valuePtr = &valuePtr;
  v72 = 0x2000000000;
  v20 = (CFDictionaryRef *)getkQPParseResultAttributedParseKeySymbolLoc_ptr;
  v73 = getkQPParseResultAttributedParseKeySymbolLoc_ptr;
  if (!getkQPParseResultAttributedParseKeySymbolLoc_ptr)
  {
    v21 = (void *)QueryParserLibrary();
    v20 = (CFDictionaryRef *)dlsym(v21, "kQPParseResultAttributedParseKey");
    p_valuePtr[3] = (uint64_t)v20;
    getkQPParseResultAttributedParseKeySymbolLoc_ptr = (uint64_t)v20;
  }
  _Block_object_dispose(&valuePtr, 8);
  if (!v20)
    goto LABEL_98;
  v22 = *v20;
  if (v22)
  {
    if (CFDictionaryContainsKey(a2, v22))
    {
      v22 = (CFDictionaryRef)CFDictionaryGetValue(a2, v22);
      CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(a1[8] + 8) + 24), v22);
      if (v7)
        v23 = CFSTR("kMDUserQueryDictionaryAttributedInputSourceU2Based");
      else
        v23 = CFSTR("kMDUserQueryDictionaryAttributedInputSourceRuleBased");
      CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(a1[9] + 8) + 24), v23);
    }
    else
    {
      v22 = 0;
    }
  }
  valuePtr = 0;
  p_valuePtr = &valuePtr;
  v72 = 0x2000000000;
  v24 = (const void **)getkQPParseResultRankCategoriesKeySymbolLoc_ptr;
  v73 = getkQPParseResultRankCategoriesKeySymbolLoc_ptr;
  if (!getkQPParseResultRankCategoriesKeySymbolLoc_ptr)
  {
    v25 = (void *)QueryParserLibrary();
    v24 = (const void **)dlsym(v25, "kQPParseResultRankCategoriesKey");
    p_valuePtr[3] = (uint64_t)v24;
    getkQPParseResultRankCategoriesKeySymbolLoc_ptr = (uint64_t)v24;
  }
  _Block_object_dispose(&valuePtr, 8);
  if (!v24)
    goto LABEL_99;
  v26 = *v24;
  if (CFDictionaryContainsKey(a2, v26))
  {
    v69 = v22;
    v27 = a2;
    v28 = (const __CFDictionary *)CFDictionaryGetValue(a2, v26);
    Count = CFDictionaryGetCount(v28);
    MEMORY[0x1E0C80A78](v33, Count, v30, v31, v32);
    v34 = (const void **)((char *)&v69 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0));
    bzero(v34, 8 * Count);
    MEMORY[0x1E0C80A78](v39, v35, v36, v37, v38);
    v40 = v34;
    bzero(v34, 8 * Count);
    CFDictionaryGetKeysAndValues(v28, v34, v34);
    if (Count >= 1)
    {
      do
      {
        v42 = *v34++;
        v41 = v42;
        v43 = *v40++;
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1[10] + 8) + 24), v41, v43);
        --Count;
      }
      while (Count);
    }
    v22 = v69;
  }
  else
  {
    v27 = a2;
    v28 = 0;
  }
  valuePtr = 0;
  p_valuePtr = &valuePtr;
  v72 = 0x2000000000;
  v44 = (const void **)getkQPParseResultSortModifierKeySymbolLoc_ptr;
  v73 = getkQPParseResultSortModifierKeySymbolLoc_ptr;
  if (!getkQPParseResultSortModifierKeySymbolLoc_ptr)
  {
    v45 = (void *)QueryParserLibrary();
    v44 = (const void **)dlsym(v45, "kQPParseResultSortModifierKey");
    p_valuePtr[3] = (uint64_t)v44;
    getkQPParseResultSortModifierKeySymbolLoc_ptr = (uint64_t)v44;
  }
  _Block_object_dispose(&valuePtr, 8);
  if (!v44)
    goto LABEL_100;
  v46 = *v44;
  if (*(_QWORD *)(*(_QWORD *)(a1[11] + 8) + 24))
    v47 = 1;
  else
    v47 = v46 == 0;
  if (!v47 && CFDictionaryContainsKey(v27, v46))
    *(_QWORD *)(*(_QWORD *)(a1[11] + 8) + 24) = CFDictionaryGetValue(v27, v46);
  valuePtr = 0;
  p_valuePtr = &valuePtr;
  v72 = 0x2000000000;
  v48 = (const void **)getkQPParseResultTokenCountKeySymbolLoc_ptr;
  v73 = getkQPParseResultTokenCountKeySymbolLoc_ptr;
  if (!getkQPParseResultTokenCountKeySymbolLoc_ptr)
  {
    v49 = (void *)QueryParserLibrary();
    v48 = (const void **)dlsym(v49, "kQPParseResultTokenCountKey");
    p_valuePtr[3] = (uint64_t)v48;
    getkQPParseResultTokenCountKeySymbolLoc_ptr = (uint64_t)v48;
  }
  _Block_object_dispose(&valuePtr, 8);
  if (!v48)
    goto LABEL_101;
  v50 = 0;
  if ((*(_QWORD *)(*(_QWORD *)(a1[12] + 8) + 24) & 0x8000000000000000) != 0)
  {
    v51 = *v48;
    if (v51)
    {
      if (CFDictionaryContainsKey(v27, v51))
      {
        v50 = (const __CFNumber *)CFDictionaryGetValue(v27, v51);
        CFNumberGetValue(v50, kCFNumberCFIndexType, (void *)(*(_QWORD *)(a1[12] + 8) + 24));
      }
      else
      {
        v50 = 0;
      }
    }
  }
  valuePtr = 0;
  p_valuePtr = &valuePtr;
  v72 = 0x2000000000;
  v52 = (const void **)getkQPParseResultSuggestionKeySymbolLoc_ptr;
  v73 = getkQPParseResultSuggestionKeySymbolLoc_ptr;
  if (!getkQPParseResultSuggestionKeySymbolLoc_ptr)
  {
    v53 = (void *)QueryParserLibrary();
    v52 = (const void **)dlsym(v53, "kQPParseResultSuggestionKey");
    p_valuePtr[3] = (uint64_t)v52;
    getkQPParseResultSuggestionKeySymbolLoc_ptr = (uint64_t)v52;
  }
  _Block_object_dispose(&valuePtr, 8);
  if (!v52)
    goto LABEL_102;
  v54 = *v52;
  if (!v54)
    goto LABEL_86;
  if (!CFDictionaryContainsKey(v27, v54))
    goto LABEL_86;
  v55 = (const __CFString *)CFDictionaryGetValue(v27, v54);
  Length = CFStringGetLength(v55);
  if (!v17 || !Length || !CFStringGetLength(v17))
    goto LABEL_86;
  v69 = v27;
  valuePtr = 0;
  p_valuePtr = &valuePtr;
  v72 = 0x2000000000;
  v57 = (const void **)getkQPParseResultAttributeCountKeySymbolLoc_ptr;
  v73 = getkQPParseResultAttributeCountKeySymbolLoc_ptr;
  if (!getkQPParseResultAttributeCountKeySymbolLoc_ptr)
  {
    v58 = (void *)QueryParserLibrary();
    v57 = (const void **)dlsym(v58, "kQPParseResultAttributeCountKey");
    p_valuePtr[3] = (uint64_t)v57;
    getkQPParseResultAttributeCountKeySymbolLoc_ptr = (uint64_t)v57;
  }
  _Block_object_dispose(&valuePtr, 8);
  if (!v57)
LABEL_103:
    __MDQueryCreateQueryDictionaryWithOptionsDict_cold_1();
  v59 = *v57;
  if (v59)
  {
    v60 = v69;
    v61 = v17;
    if (CFDictionaryContainsKey(v69, v59))
      v59 = CFDictionaryGetValue(v60, v59);
    else
      v59 = 0;
  }
  else
  {
    v61 = v17;
  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionarySetValue(Mutable, CFSTR("suggestion"), v55);
  CFDictionarySetValue(Mutable, CFSTR("query"), v61);
  if (v28)
    CFDictionarySetValue(Mutable, CFSTR("categories"), v28);
  if (v50)
    CFDictionarySetValue(Mutable, CFSTR("tokenCount"), v50);
  if (v59)
    CFDictionarySetValue(Mutable, CFSTR("attributeCount"), v59);
  CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(a1[13] + 8) + 24), Mutable);
  CFRelease(Mutable);
  v27 = v69;
LABEL_86:
  if (v6 && CFDictionaryContainsKey(v27, v6))
  {
    v63 = (const __CFDictionary *)CFDictionaryGetValue(v27, v6);
    v64 = v63;
    if (v22)
    {
      v65 = CFDictionaryGetCount(v63);
      v66 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v65 + 1, v64);
      CFDictionaryAddValue(MutableCopy, CFSTR("attributedParse"), v22);
      *(_QWORD *)(*(_QWORD *)(a1[14] + 8) + 24) = CFDictionaryCreateCopy(v66, MutableCopy);
      CFRelease(MutableCopy);
    }
    else
    {
      *(_QWORD *)(*(_QWORD *)(a1[14] + 8) + 24) = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v63);
    }
  }
  result = (CFAttributedStringRef)CFDictionaryContainsKey(v27, CFSTR("isEntitySearchKey"));
  if (v22)
  {
    if ((_DWORD)result)
    {
      result = CFAttributedStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v22);
      *(_QWORD *)(*(_QWORD *)(a1[15] + 8) + 24) = result;
    }
  }
  return result;
}

void ____MDQueryCreateQueryDictionaryWithOptionsDict_block_invoke_2(uint64_t a1, const void *a2)
{
  CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), a2);
}

@end
