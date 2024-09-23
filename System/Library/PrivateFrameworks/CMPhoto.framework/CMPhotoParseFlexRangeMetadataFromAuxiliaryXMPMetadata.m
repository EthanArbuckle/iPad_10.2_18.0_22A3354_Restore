@implementation CMPhotoParseFlexRangeMetadataFromAuxiliaryXMPMetadata

BOOL __CMPhotoParseFlexRangeMetadataFromAuxiliaryXMPMetadata_block_invoke(uint64_t a1, int a2, CGImageMetadataTagRef tag)
{
  CFStringRef v5;
  CFStringRef v6;
  CFTypeRef v7;
  char *v8;
  unsigned int v9;
  CFTypeRef cf;

  v5 = CGImageMetadataTagCopyNamespace(tag);
  cf = 0;
  if (FigCFEqual())
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    v6 = CGImageMetadataTagCopyName(tag);
    if (v6)
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CMPhotoCopyMetadataTagValue(tag, *(__CFNumberFormatter **)(a1 + 80), 0, (__CFArray **)&cf);
      if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
        goto LABEL_12;
      if (FigCFEqual())
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = FigCFEqual();
        goto LABEL_12;
      }
      if (FigCFEqual())
      {
        v7 = cf;
        v8 = (char *)(*(_QWORD *)(a1 + 88) + 56);
LABEL_10:
        v9 = 3;
LABEL_11:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = _extractFloatValuesFromAuxMetaTagValue(v7, v9, v8);
        goto LABEL_12;
      }
      if (FigCFEqual())
      {
        v7 = cf;
        v8 = (char *)(*(_QWORD *)(a1 + 88) + 68);
        goto LABEL_10;
      }
      if (FigCFEqual())
      {
        v7 = cf;
        v8 = (char *)(*(_QWORD *)(a1 + 88) + 8);
LABEL_21:
        v9 = 1;
        goto LABEL_11;
      }
      if (FigCFEqual())
      {
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = _extractFloatValuesFromAuxMetaTagValue(cf, 1u, (char *)(*(_QWORD *)(a1 + 88) + 12));
        if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      }
      else
      {
        if (FigCFEqual())
        {
          v7 = cf;
          v8 = (char *)(*(_QWORD *)(a1 + 88) + 32);
          goto LABEL_10;
        }
        if (FigCFEqual())
        {
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = _extractFloatValuesFromAuxMetaTagValue(cf, 3u, (char *)(*(_QWORD *)(a1 + 88) + 44));
          if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
        }
        else
        {
          if (FigCFEqual())
          {
            v7 = cf;
            v8 = (char *)(*(_QWORD *)(a1 + 88) + 20);
            goto LABEL_10;
          }
          if (FigCFEqual())
          {
            v7 = cf;
            v8 = (char *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
            goto LABEL_21;
          }
        }
      }
    }
    else
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -17102;
    }
  }
  else
  {
    v6 = 0;
  }
LABEL_12:
  if (v5)
    CFRelease(v5);
  if (v6)
    CFRelease(v6);
  if (cf)
    CFRelease(cf);
  return *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == 0;
}

@end
