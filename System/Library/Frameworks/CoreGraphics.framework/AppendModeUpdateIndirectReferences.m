@implementation AppendModeUpdateIndirectReferences

BOOL __AppendModeUpdateIndirectReferences_block_invoke_6(uint64_t a1, uint64_t a2, __CFDictionary *a3, _QWORD *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  CFMutableDictionaryRef CFDictionary;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 *v19;
  const char *v20;
  int v21;
  const char *v22;
  unsigned __int8 *v23;
  const char *v24;
  int v25;

  if (CGPDFAnnotationTypeID_onceToken != -1)
    dispatch_once(&CGPDFAnnotationTypeID_onceToken, &__block_literal_global);
  v11 = CGPDFAnnotationTypeID_id;
  if (CGPDFAnnotationTypeID_id == a5)
  {
    CFDictionary = *(CFMutableDictionaryRef *)(a6 + 24);
    if (!CFDictionary)
    {
      CFDictionary = CGPDFAppenderCreateCFDictionary(*(CGPDFDictionary **)(a6 + 16));
      *(_QWORD *)(a6 + 24) = CFDictionary;
    }
    v13 = *(_QWORD *)(a1 + 32);
    if (v13 >= 1)
    {
      v14 = *(uint64_t **)(a1 + 40);
      while (1)
      {
        v15 = *v14;
        if (*(CFMutableDictionaryRef *)(*v14 + 40) == CFDictionary)
          break;
        ++v14;
        if (!--v13)
          goto LABEL_10;
      }
      v23 = (unsigned __int8 *)a4[2];
      v25 = *v23;
      v24 = (const char *)(v23 + 1);
      if (v25 == 47)
        v22 = v24;
      else
        v22 = (const char *)a4[2];
      v17 = *(_QWORD *)(v15 + 16);
      v18 = *(_QWORD *)(v15 + 24);
      goto LABEL_20;
    }
LABEL_10:
    v16 = *(_QWORD *)(a6 + 16);
    if (v16)
    {
      v17 = *(_QWORD *)(v16 + 32);
      if (v17)
      {
        v18 = *(_QWORD *)(v16 + 40);
        v19 = (unsigned __int8 *)a4[2];
        v21 = *v19;
        v20 = (const char *)(v19 + 1);
        if (v21 == 47)
          v22 = v20;
        else
          v22 = (const char *)a4[2];
LABEL_20:
        CGPDFAppenderDictionarySetCGPDFReference(a3, v22, v17, v18);
        return v11 != a5;
      }
    }
    pdf_error("Failed to associate append mode annotation dictionaty with other annotation: unable to find match");
    CFDictionarySetValue(a3, a4, (const void *)*MEMORY[0x1E0C9B0D0]);
  }
  return v11 != a5;
}

uint64_t __AppendModeUpdateIndirectReferences_block_invoke_5()
{
  return 1;
}

uint64_t __AppendModeUpdateIndirectReferences_block_invoke_4(uint64_t a1, uint64_t a2, void *a3, const void *a4, uint64_t a5)
{
  uint64_t MutableObject;
  uint64_t v10;
  const void *v11;

  if (CGPDFStreamObjectTypeID_onceToken != -1)
    dispatch_once(&CGPDFStreamObjectTypeID_onceToken, &__block_literal_global_9_18226);
  if (CGPDFStreamObjectTypeID_id == a5)
  {
    MutableObject = CGPDFAppenderCreateMutableObject(a2, a3);
    v11 = (const void *)CGPDFReferenceCreate(MutableObject, v10);
    CFDictionarySetValue((CFMutableDictionaryRef)a3, a4, v11);
    CFRelease(v11);
  }
  return 1;
}

uint64_t __AppendModeUpdateIndirectReferences_block_invoke_3(uint64_t a1, uint64_t a2, __CFArray *a3, CFIndex a4, uint64_t a5, const void *a6)
{
  uint64_t MutableObject;
  uint64_t v12;
  const void *v13;

  if (CGPDFStreamObjectTypeID_onceToken != -1)
    dispatch_once(&CGPDFStreamObjectTypeID_onceToken, &__block_literal_global_9_18226);
  if (CGPDFStreamObjectTypeID_id == a5)
  {
    MutableObject = CGPDFAppenderCreateMutableObject(a2, a6);
    v13 = (const void *)CGPDFReferenceCreate(MutableObject, v12);
    CFArraySetValueAtIndex(a3, a4, v13);
    CFRelease(v13);
  }
  return 1;
}

uint64_t __AppendModeUpdateIndirectReferences_block_invoke_2(uint64_t a1, char *a2, __CFDictionary *a3, const void *a4, uint64_t a5, const void *a6)
{
  uint64_t CGPDFStreamObjectFromCGDisplayList;
  uint64_t v12;
  uint64_t v13;
  const void *v14;

  if (_ZZZ22CGDisplayListGetTypeIDEUb_E4once != -1)
    dispatch_once(&_ZZZ22CGDisplayListGetTypeIDEUb_E4once, &__block_literal_global_124_14047);
  if (CGDisplayListGetTypeID::display_list2_type_id == a5)
  {
    CGPDFStreamObjectFromCGDisplayList = CGPDFAppenderCreateCGPDFStreamObjectFromCGDisplayList(a2, a6, 0.0, 0.0);
    v13 = v12;
    CFRetain(a4);
    v14 = (const void *)CGPDFReferenceCreate(CGPDFStreamObjectFromCGDisplayList, v13);
    CFDictionarySetValue(a3, a4, v14);
    CFRelease(v14);
    CFRelease(a4);
  }
  return 1;
}

uint64_t __AppendModeUpdateIndirectReferences_block_invoke(uint64_t a1, char *a2, __CFArray *a3, CFIndex a4, uint64_t a5, const void *a6)
{
  uint64_t CGPDFStreamObjectFromCGDisplayList;
  uint64_t v12;
  const void *v13;

  if (_ZZZ22CGDisplayListGetTypeIDEUb_E4once != -1)
    dispatch_once(&_ZZZ22CGDisplayListGetTypeIDEUb_E4once, &__block_literal_global_124_14047);
  if (CGDisplayListGetTypeID::display_list2_type_id == a5)
  {
    CGPDFStreamObjectFromCGDisplayList = CGPDFAppenderCreateCGPDFStreamObjectFromCGDisplayList(a2, a6, 0.0, 0.0);
    v13 = (const void *)CGPDFReferenceCreate(CGPDFStreamObjectFromCGDisplayList, v12);
    CFArraySetValueAtIndex(a3, a4, v13);
    CFRelease(v13);
  }
  return 1;
}

@end
