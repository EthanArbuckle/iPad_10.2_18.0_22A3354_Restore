@implementation AppendModeDuplicateExternalObject

uint64_t __AppendModeDuplicateExternalObject_block_invoke(uint64_t a1, uint64_t a2, __CFArray *a3, CFIndex a4, uint64_t a5, uint64_t *key)
{
  const void *Value;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  CFNumberRef CFObject;
  CFNumberRef v18;
  uint64_t MutableObject;
  uint64_t v20;
  uint64_t v21;
  const void *v22;

  if (CGPDFReferenceTypeID_onceToken != -1)
    dispatch_once(&CGPDFReferenceTypeID_onceToken, &__block_literal_global_18202);
  if (CGPDFReferenceTypeID_id == a5)
  {
    Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), key);
    if (Value)
    {
      CFArraySetValueAtIndex(a3, a4, Value);
      return 0;
    }
    if (key)
    {
      v14 = key[2];
      key = (uint64_t *)key[3];
    }
    else
    {
      v14 = 0;
    }
    v15 = *(_QWORD *)(a1 + 40);
    if (v15
      && (v16 = pdf_xref_resolve(**(_QWORD **)(*(_QWORD *)(v15 + 16) + 16), (int)v14, (unsigned __int16)key)) != 0)
    {
      CFObject = CGPDFAppenderCreateCFObject((uint64_t)v16, 1);
      if (CFObject)
      {
        v18 = CFObject;
        MutableObject = CGPDFAppenderCreateMutableObject(a2, CFObject);
        v21 = v20;
        CFRelease(v18);
        CGPDFAppenderDictionarySetReferenceToReference(*(__CFDictionary **)(a1 + 32), v14, (uint64_t)key, MutableObject, v21);
        v22 = (const void *)CGPDFReferenceCreate(MutableObject, v21);
        CFArraySetValueAtIndex(a3, a4, v22);
        CFRelease(v22);
      }
      else
      {
        pdf_error("Failed to convert object to its CoreFoundation equivalent");
      }
    }
    else
    {
      pdf_error("Failed to extract source document object");
    }
  }
  return 1;
}

uint64_t __AppendModeDuplicateExternalObject_block_invoke_2(uint64_t a1, uint64_t a2, __CFDictionary *a3, const void *a4, uint64_t a5, uint64_t *key)
{
  const void *Value;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  CFNumberRef CFObject;
  CFNumberRef v18;
  uint64_t MutableObject;
  uint64_t v20;
  uint64_t v21;
  const void *v22;

  if (CGPDFReferenceTypeID_onceToken != -1)
    dispatch_once(&CGPDFReferenceTypeID_onceToken, &__block_literal_global_18202);
  if (CGPDFReferenceTypeID_id == a5)
  {
    Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), key);
    if (Value)
    {
      CFDictionarySetValue(a3, a4, Value);
      return 0;
    }
    if (key)
    {
      v14 = key[2];
      key = (uint64_t *)key[3];
    }
    else
    {
      v14 = 0;
    }
    v15 = *(_QWORD *)(a1 + 40);
    if (v15
      && (v16 = pdf_xref_resolve(**(_QWORD **)(*(_QWORD *)(v15 + 16) + 16), (int)v14, (unsigned __int16)key)) != 0)
    {
      CFObject = CGPDFAppenderCreateCFObject((uint64_t)v16, 1);
      if (CFObject)
      {
        v18 = CFObject;
        MutableObject = CGPDFAppenderCreateMutableObject(a2, CFObject);
        v21 = v20;
        CFRelease(v18);
        CGPDFAppenderDictionarySetReferenceToReference(*(__CFDictionary **)(a1 + 32), v14, (uint64_t)key, MutableObject, v21);
        v22 = (const void *)CGPDFReferenceCreate(MutableObject, v21);
        CFDictionarySetValue(a3, a4, v22);
        CFRelease(v22);
      }
      else
      {
        pdf_error("Failed to copy object");
      }
    }
    else
    {
      pdf_error("Failed to extract source document object");
    }
  }
  return 1;
}

@end
