@implementation AppendModePopulateDocumentInfo

void __AppendModePopulateDocumentInfo_block_invoke(uint64_t a1, CFStringRef theString, const __CFString *a3)
{
  CFTypeID v6;
  const __CFArray *v7;
  CFTypeID v8;
  CFIndex Count;
  uint64_t v10;
  const __CFAllocator *v11;
  const __CFArray *MutableCopy;
  CFIndex i;
  const __CFString *ValueAtIndex;
  CFTypeID v15;
  const __CFArray *v16;
  char buffer[256];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!CFStringGetCString(theString, buffer, 256, 0x600u))
  {
    pdf_error("Invalid key in documentInfo dictionary");
    return;
  }
  if (!CFEqual(theString, CFSTR("Keywords")))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    return;
  }
  v6 = CFGetTypeID(a3);
  if (v6 == CFStringGetTypeID())
  {
    if (CFStringGetLength(a3) < 1)
      return;
    v7 = (const __CFArray *)CFRetain(a3);
    if (!v7)
      return;
    goto LABEL_18;
  }
  v8 = CFGetTypeID(a3);
  if (v8 == CFArrayGetTypeID())
  {
    Count = CFArrayGetCount((CFArrayRef)a3);
    if (Count >= 1)
    {
      v10 = Count;
      v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      MutableCopy = CFArrayCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, (CFArrayRef)a3);
      for (i = 0; i < v10; ++i)
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(MutableCopy, i);
        v15 = CFGetTypeID(ValueAtIndex);
        if (v15 != CFStringGetTypeID() || CFStringGetLength(ValueAtIndex) <= 0)
        {
          CFArrayRemoveValueAtIndex(MutableCopy, i);
          --v10;
          --i;
        }
      }
      if (v10 < 1)
      {
        v16 = MutableCopy;
        goto LABEL_19;
      }
      v7 = (const __CFArray *)CFStringCreateByCombiningStrings(v11, MutableCopy, CFSTR(", "));
      CFRelease(MutableCopy);
      if (!v7)
        return;
LABEL_18:
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      v16 = v7;
LABEL_19:
      CFRelease(v16);
    }
  }
}

@end
