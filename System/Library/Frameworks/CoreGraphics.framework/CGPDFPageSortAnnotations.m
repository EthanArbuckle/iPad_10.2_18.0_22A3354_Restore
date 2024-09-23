@implementation CGPDFPageSortAnnotations

void __CGPDFPageSortAnnotations_block_invoke(uint64_t a1, char *a2, const __CFArray *a3)
{
  const __CFAllocator *v6;
  __CFArray *Mutable;
  CFIndex Count;
  const __CFArray *MutableCopy;
  CFIndex v10;
  CFIndex v11;
  CFIndex i;
  const void *ValueAtIndex;
  CFIndex v14;
  void *value;
  CFIndex idx;

  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  Count = CFArrayGetCount(a3);
  MutableCopy = CFArrayCreateMutableCopy(v6, Count, a3);
  v10 = CFArrayGetCount(*(CFArrayRef *)(a1 + 32));
  if (v10 >= 1)
  {
    v11 = v10;
    for (i = 0; i != v11; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 32), i);
      value = 0;
      idx = 0;
      AppendModeFindAnnotation(a2, MutableCopy, (uint64_t)ValueAtIndex, &idx, &value);
      if (value)
      {
        CFArrayAppendValue(Mutable, value);
        CFArrayRemoveValueAtIndex(MutableCopy, idx);
      }
    }
  }
  v14 = CFArrayGetCount(Mutable);
  if (v14 != CFArrayGetCount(*(CFArrayRef *)(a1 + 32)))
  {
    pdf_error("Error: Failed sort annotations array for append-mode");
    if (!MutableCopy)
      goto LABEL_11;
    goto LABEL_10;
  }
  CGPDFAppenderReplaceMutableObject((uint64_t)a2, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 352), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 360), Mutable);
  if (MutableCopy)
LABEL_10:
    CFRelease(MutableCopy);
LABEL_11:
  if (Mutable)
    CFRelease(Mutable);
}

@end
