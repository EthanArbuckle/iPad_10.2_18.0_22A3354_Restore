@implementation CSIRenditionBlockData

char *__45___CSIRenditionBlockData__allocateImageBytes__block_invoke()
{
  char *result;

  result = getenv("COREUI_USE_MALLOC");
  if (result)
    _allocateImageBytes___use_malloc = 1;
  return result;
}

void __69___CSIRenditionBlockData_expandCSIBitmapData_fromSlice_makeReadOnly___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __CFReadStream *v6;
  __CFReadStream *v7;
  int v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  unint64_t v26;
  size_t v27;
  size_t v28;
  UInt8 *v29;
  int64_t v30;
  uint64_t i;
  unint64_t *v32;
  unint64_t v33;
  unsigned int v34;
  uint64_t v35;
  char *v37;
  unint64_t v38;
  unint64_t v40;
  size_t v41;
  size_t v42;
  size_t v43;
  unint64_t *v44;
  unint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t *v60;
  unint64_t v61;
  char *v62;
  int v63[2];
  void *v64;

  v64 = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 16);
  v4 = *(unsigned int *)(a1 + 72);
  v5 = *(_QWORD *)(v2 + 32);
  v6 = CFReadStreamCreateWithBytesNoCopy(kCFAllocatorDefault, *(const UInt8 **)(a1 + 48), *(_QWORD *)(a1 + 56), kCFAllocatorNull);
  if (v6)
  {
    v7 = v6;
    CFReadStreamOpen(v6);
    _StreamSys_init_read((unint64_t)&v64, (uint64_t)v7);
    *(_QWORD *)v63 = 0;
    v8 = *(_DWORD *)(*(_QWORD *)(a1 + 64) + 8);
    if (v8 == 3)
      v9 = 4;
    else
      v9 = 5;
    if (v8 == 2)
      v10 = 1;
    else
      v10 = v9;
    if (_BOMFileNewFromCFReadStreamSys(v63, (__int128 *)v64, v10))
    {
      CFRelease(v7);
      v62 = CUIConvertCompressionTypeToString(*(_DWORD *)(*(_QWORD *)(a1 + 64) + 8));
      _CUILog(4, (uint64_t)"CoreUI: Unable to create BOMFile from decompress stream for CSI '%s' image block data.", v11, v12, v13, v14, v15, v16, (uint64_t)v62);
    }
    else
    {
      v24 = (char *)(v3 + v5 * v4);
      v25 = *(_QWORD *)(a1 + 32);
      v26 = *(_QWORD *)(v25 + 184);
      if (!v26)
      {
        if (*(_DWORD *)(v25 + 12) > 1u)
          v26 = *(_QWORD *)(v25 + 32);
        else
          v26 = (4 * *(_DWORD *)(a1 + 88));
      }
      v27 = *(_QWORD *)(v25 + 32);
      if (v27 <= v26)
        v28 = v26;
      else
        v28 = v27;
      v29 = (UInt8 *)malloc_type_malloc(v28, 0x100004077774924uLL);
      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) == v26)
      {
        v30 = BOMFileRead(*(uint64_t *)v63, v29, v26);
        if (v30 >= 1)
        {
          for (i = v30; i > 0; i = BOMFileRead(*(uint64_t *)v63, v29, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32)))
          {
            memcpy(v24, v29, i);
            v24 += i;
            v32 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 40);
            do
              v33 = __ldaxr(v32);
            while (__stlxr(v33 + i, v32));
          }
        }
      }
      else if (*(_DWORD *)(a1 + 76))
      {
        v34 = 0;
        v35 = 0;
        do
        {
          if (atomic_load((unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)))
            goto LABEL_50;
          if (v26)
          {
            v37 = v24;
            v38 = v26;
            while (!atomic_load((unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)))
            {
              if (v38 >= v26)
                v40 = v26;
              else
                v40 = v38;
              v41 = BOMFileRead(*(uint64_t *)v63, v29, v40);
              if ((v41 & 0x8000000000000000) != 0 || (v42 = v41) == 0 && BOMFileIsEOF(*(uint64_t *)v63))
              {
                v53 = CUIConvertCompressionTypeToString(*(_DWORD *)(*(_QWORD *)(a1 + 64) + 8));
                _CUILog(4, (uint64_t)"CoreUI: Error while decoding '%s' compressed image block data got an %s name:'%s' pixelFormat:%d at row %d", v54, v55, v56, v57, v58, v59, (uint64_t)v53);
                break;
              }
              if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) >= v42)
                v43 = v42;
              else
                v43 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
              memcpy(v37, v29, v43);
              v37 += v42;
              v35 += v42;
              v38 -= v42;
              if (!v38)
                goto LABEL_41;
            }
LABEL_50:
            BOMFileClose(*(uint64_t *)v63);
            BomSys_free(v64);
            CFRelease(v7);
            free(v29);
            v60 = (unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
            do
              v61 = __ldaxr(v60);
            while (__stlxr(v61 + 1, v60));
            return;
          }
LABEL_41:
          if (v35 >= 1)
            v24 += *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
          ++v34;
        }
        while (v34 < *(_DWORD *)(a1 + 76));
        if (v35 == -1)
        {
          v44 = (unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
          do
            v45 = __ldaxr(v44);
          while (__stlxr(v45 + 1, v44));
          v46 = CUIConvertCompressionTypeToString(*(_DWORD *)(*(_QWORD *)(a1 + 64) + 8));
          _CUILog(4, (uint64_t)"CoreUI: Error while decoding '%s' compressed image block data name: '%s' (rows %d rowbytes %zu format %d)", v47, v48, v49, v50, v51, v52, (uint64_t)v46);
        }
      }
      BOMFileClose(*(uint64_t *)v63);
      BomSys_free(v64);
      CFRelease(v7);
      free(v29);
    }
  }
  else
  {
    v17 = *(_QWORD *)(a1 + 56);
    CUIConvertCompressionTypeToString(*(_DWORD *)(*(_QWORD *)(a1 + 64) + 8));
    _CUILog(4, (uint64_t)"CoreUI: Unable to create decompress stream for CSI bytes of length %ld '%s' image block data.", v18, v19, v20, v21, v22, v23, v17);
  }
}

uint64_t __69___CSIRenditionBlockData_expandCSIBitmapData_fromSlice_makeReadOnly___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*((uint64_t (**)(void))objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2) + 2))();
}

id __37___CSIRenditionBlockData_sharedCache__block_invoke()
{
  sharedCache_sharedCache = (uint64_t)objc_alloc_init((Class)NSCache);
  return objc_msgSend((id)sharedCache_sharedCache, "setTotalCostLimit:", 5242880);
}

@end
