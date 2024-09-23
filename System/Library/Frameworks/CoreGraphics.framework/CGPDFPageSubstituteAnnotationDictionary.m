@implementation CGPDFPageSubstituteAnnotationDictionary

void __CGPDFPageSubstituteAnnotationDictionary_block_invoke(uint64_t a1, char *a2, CFArrayRef theArray)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *MutableObject;
  char *v9;
  uint64_t v10;
  CFIndex v11;

  v10 = 0;
  AppendModeFindAnnotation(a2, theArray, *(_QWORD *)(a1 + 32), &v11, &v10);
  if (v10)
  {
    v5 = *(_QWORD *)(v10 + 16);
    v6 = *(_QWORD *)(v10 + 24);
    CGPDFAppenderReplaceMutableObject((uint64_t)a2, v5, v6, *(const void **)(a1 + 40));
    v7 = *(_QWORD *)(a1 + 32);
    MutableObject = CGPDFAppenderGetMutableObject(a2, v5, v6);
    v9 = *(char **)(v7 + 24);
    if (v9 != MutableObject)
    {
      if (v9)
        CFRelease(v9);
      *(_QWORD *)(v7 + 24) = MutableObject;
      if (MutableObject)
        CFRetain(MutableObject);
    }
  }
}

@end
