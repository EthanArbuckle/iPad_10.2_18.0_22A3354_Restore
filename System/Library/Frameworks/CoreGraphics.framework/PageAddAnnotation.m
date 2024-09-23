@implementation PageAddAnnotation

void __PageAddAnnotation_block_invoke(uint64_t *a1, char *a2, const __CFArray *a3)
{
  uint64_t AnnotationObject;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CFIndex Count;
  uint64_t v10;
  CFIndex v11;
  CFIndex v13;
  const void *v14;

  AnnotationObject = CGPDFAppenderCreateAnnotationObject(a2, a1[4], a1[5]);
  if (AnnotationObject | (unsigned __int16)v6)
  {
    v7 = AnnotationObject;
    v8 = v6;
    Count = CFArrayGetCount(a3);
    v10 = a1[6];
    v11 = Count - 1;
    if (v10 <= Count)
      v11 = a1[6];
    if (v10 < 0 || Count == 0)
      v13 = 0;
    else
      v13 = v11;
    v14 = (const void *)CGPDFReferenceCreate(v7, v8);
    CFArrayInsertValueAtIndex(a3, v13, v14);
    CFRelease(v14);
  }
}

@end
