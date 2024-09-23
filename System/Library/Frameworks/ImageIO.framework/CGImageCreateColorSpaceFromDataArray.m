@implementation CGImageCreateColorSpaceFromDataArray

void __CGImageCreateColorSpaceFromDataArray_block_invoke(uint64_t a1, const __CFData *cf)
{
  CFTypeID v4;
  const UInt8 *BytePtr;
  unsigned int Length;
  CGMutableImageMetadataRef MetadataFromDatabuffer;
  const __CFDictionary *v8;

  if (cf && (v4 = CFGetTypeID(cf), v4 == CFDataGetTypeID()))
  {
    BytePtr = CFDataGetBytePtr(cf);
    Length = CFDataGetLength(cf);
    if (Length >= 0x11)
    {
      if (!strncmp((const char *)BytePtr, "Exif", 5uLL))
      {
        MetadataFromDatabuffer = CreateMetadataFromDatabuffer((const char *)BytePtr + 6, Length - 6, 0);
        if (MetadataFromDatabuffer)
        {
          v8 = MetadataFromDatabuffer;
          CGColorSpaceRelease(*(CGColorSpaceRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = createColorSpaceFromMetadata(v8, 0, 0);
          CFRelease(v8);
        }
      }
      else if (Length >= 0x81 && !strncmp((const char *)BytePtr, "ICC_PROFILE", 0xCuLL))
      {
        CGColorSpaceRelease(*(CGColorSpaceRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CGColorSpaceCreateWithCopyOfData((UInt8 *)BytePtr + 14, Length - 14);
      }
    }
  }
  else
  {
    LogError("CGImageCreateColorSpaceFromDataArray_block_invoke", 794, "*** ERROR: dataArray does not contain CFData\n");
  }
}

@end
