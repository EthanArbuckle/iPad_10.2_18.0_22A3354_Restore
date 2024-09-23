@implementation DCSMACreateDictionaryAssetsAsync

Class __DCSMACreateDictionaryAssetsAsync_XPC_block_invoke(Class result, id a2)
{
  Class v3;
  xpc_object_t value;
  void *v5;
  int64_t length;
  CFIndex v7;
  const UInt8 *bytes_ptr;
  const __CFData *v9;
  const __CFArray *v10;
  CFIndex Count;
  CFIndex v12;
  __CFArray *Mutable;
  CFIndex v14;
  const CFArrayCallBacks *v15;
  const __CFDictionary *ValueAtIndex;
  CFMutableDictionaryRef MutableCopy;

  if (a2)
  {
    v3 = result;
    result = object_getClass(a2);
    if (result != (Class)MEMORY[0x1E0C81310])
    {
      value = xpc_dictionary_get_value(a2, "result");
      if (!value)
        goto LABEL_12;
      v5 = value;
      length = xpc_data_get_length(value);
      if (length < 1)
        goto LABEL_12;
      v7 = length;
      bytes_ptr = (const UInt8 *)xpc_data_get_bytes_ptr(v5);
      v9 = CFDataCreate(0, bytes_ptr, v7);
      v10 = (const __CFArray *)CFPropertyListCreateWithData(0, v9, 0, 0, 0);
      CFRelease(v9);
      if (v10 && (Count = CFArrayGetCount(v10), Count >= 1))
      {
        v12 = Count;
        Mutable = 0;
        v14 = 0;
        v15 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
        do
        {
          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v10, v14);
          MutableCopy = CFDictionaryCreateMutableCopy(0, 0, ValueAtIndex);
          if (!Mutable)
            Mutable = CFArrayCreateMutable(0, 0, v15);
          CFArrayAppendValue(Mutable, MutableCopy);
          CFRelease(MutableCopy);
          ++v14;
        }
        while (v12 != v14);
      }
      else
      {
LABEL_12:
        Mutable = 0;
      }
      result = (Class)*((_QWORD *)v3 + 4);
      if (result)
        return (Class)(*((uint64_t (**)(Class, __CFArray *))result + 2))(result, Mutable);
    }
  }
  return result;
}

@end
