@implementation _CSIRenditionBlockData

- (_DWORD)initWithBytes:(int)a3 pixelWidth:(int)a4 pixelHeight:(uint64_t)a5 sourceRowbytes:(uint64_t)a6 pixelFormat:
{
  _DWORD *v11;
  int v12;
  uint64_t AlignedBytesPerRow;
  uint64_t v14;
  objc_super v16;

  if (!a1)
    return 0;
  v16.receiver = a1;
  v16.super_class = (Class)_CSIRenditionBlockData;
  v11 = objc_msgSendSuper2(&v16, sel_init);
  if (v11)
  {
    v12 = __bppFromBlockPixelFormat(a6);
    v11[3] = a6;
    v11[6] = a4;
    AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow((v12 * a3));
    *((_QWORD *)v11 + 4) = AlignedBytesPerRow;
    v14 = AlignedBytesPerRow * v11[6];
    *((_QWORD *)v11 + 23) = a5;
    *((_QWORD *)v11 + 24) = v14;
    *((_QWORD *)v11 + 2) = a2;
  }
  return v11;
}

- (BOOL)expandCSIBitmapData:(uint64_t)a3 fromSlice:(uint64_t)a4 makeReadOnly:(uint64_t)a5
{
  void *v9;
  int v10;
  unsigned int v12;
  _DWORD *v13;
  _DWORD *v14;
  unsigned int v15;
  int v16;
  unsigned int v17;
  unsigned int v18;
  _BOOL8 v19;
  size_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  id v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  char *v51;
  uint64_t v52;
  unsigned int v53;
  unsigned int v54;
  unint64_t v55;
  unint64_t v57;
  vImagePixelCount v58;
  size_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v67;
  char *v68;
  char *v69;
  char *v70;
  int v71;
  int v72;
  uint8_t permuteMap[4];
  _QWORD block[5];
  _QWORD v77[9];
  int v78;
  unsigned int v79;
  uint64_t v80;
  uint64_t v81;
  vImage_Buffer dest;

  if (!a1)
    return 0;
  v9 = *(void **)(a1 + 16);
  if (!v9)
    return 0;
  v10 = a5;
  v12 = *((_DWORD *)a2 + 1);
  atomic_store(0, (unint64_t *)(a1 + 40));
  switch(*((_DWORD *)a2 + 2))
  {
    case 0:
      v20 = *((unsigned int *)a2 + 3);
      if (*(_QWORD *)(a1 + 192) < v20)
      {
        v68 = CUIConvertCompressionTypeToString(0);
        _CUILog(4, (uint64_t)"CoreUI: Unable to copy imagedata for rawbytes block data data. '%s'", v21, v22, v23, v24, v25, v26, (uint64_t)v68);
        goto LABEL_27;
      }
      memcpy(v9, a2 + 16, v20);
      atomic_store(*((unsigned int *)a2 + 3), (unint64_t *)(a1 + 40));
      goto LABEL_58;
    case 1:
      if (*((_DWORD *)a2 + 3))
      {
        pk_decompressData((int *)a2 + 4, (uint64_t)v9, a3, SHIDWORD(a3), a4, SHIDWORD(a4), *(_QWORD *)(a1 + 32), *(_DWORD *)a2 == 1296844099);
LABEL_58:
        v19 = 1;
      }
      else
      {
        v27 = 1;
LABEL_26:
        v69 = CUIConvertCompressionTypeToString(v27);
        _CUILog(4, (uint64_t)"CoreUI: Unable to decompress stream for CSI image block data. '%s'", v28, v29, v30, v31, v32, v33, (uint64_t)v69);
LABEL_27:
        v19 = 0;
      }
      goto LABEL_59;
    case 2:
    case 3:
    case 4:
      dest.data = 0;
      dest.height = (vImagePixelCount)&dest;
      dest.width = 0x2020000000;
      atomic_store(0, &dest.rowBytes);
      v13 = a2 + 16;
      v72 = *((_DWORD *)a2 + 1);
      v71 = a5;
      if ((v72 & 1) != 0)
      {
        v15 = *((_DWORD *)a2 + 3);
        v18 = *((_DWORD *)a2 + 8);
        if (*((_DWORD *)a2 + 4) == 1262699075)
        {
          v18 = bswap32(v18);
          v17 = bswap32(*((_DWORD *)a2 + 7));
          v16 = 1;
        }
        else
        {
          v16 = 0;
          v17 = *((_DWORD *)a2 + 7);
        }
        v14 = a2 + 16;
        v13 = a2 + 36;
      }
      else
      {
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = *(_DWORD *)(a1 + 24);
        v18 = *((_DWORD *)a2 + 3);
      }
      v40 = 0;
      v41 = 0;
      if (v15 <= 1)
        v42 = 1;
      else
        v42 = v15;
      break;
    case 5:
      if (!CUIUncompressJPEGandLZFSEInfoData(a2 + 16, v9, *(_QWORD *)(a1 + 32), 8, 32, 8194, a7, a8))
        goto LABEL_25;
      goto LABEL_58;
    case 6:
      if ((decodeRadiosity((unsigned __int16 *)a2 + 8, *((unsigned int *)a2 + 3), *(_QWORD *)(a1 + 32), (char *)v9) & 0x80000000) != 0)
        goto LABEL_25;
      goto LABEL_58;
    case 7:
    case 0xC:
      if (CUIExpandATECompressedDataIntoBuffer((uint64_t)(a2 + 16), (v12 >> 1) & 1, v9, *(unsigned int *)(a1 + 8), *(_QWORD *)(a1 + 32), a6, a7, a8))
      {
        goto LABEL_58;
      }
      goto LABEL_25;
    case 8:
      if (!CUIUncompressQuantizedImageData(a2 + 16, *((unsigned int *)a2 + 3), (uint64_t)v9, (int)a4, a4 >> 32, *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 8), a8))goto LABEL_25;
      goto LABEL_58;
    case 9:
      if (!CUIUncompressHEVCInfoData((uint64_t)(a2 + 16), v9, *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 8), a5, a6, a7, a8))goto LABEL_25;
      goto LABEL_58;
    case 0xA:
      if (CUIUncompressDeepmapImageData((unsigned int *)a2 + 4, *((unsigned int *)a2 + 3), ((int)(*((_DWORD *)a2 + 1) << 31) >> 31) & *((_DWORD *)a2 + 3), (uint64_t)v9, (int)a4, a4 >> 32, *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 8)))goto LABEL_58;
LABEL_25:
      v27 = *((_DWORD *)a2 + 2);
      goto LABEL_26;
    case 0xB:
      if (CUIUncompressDeepmap2ImageData((unsigned int *)a2 + 4, *((unsigned int *)a2 + 3), ((int)(*((_DWORD *)a2 + 1) << 31) >> 31) & *((_DWORD *)a2 + 3), (uint64_t)v9, (int)a4, a4 >> 32, *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 8)))goto LABEL_58;
      v70 = CUIConvertCompressionTypeToString(*((_DWORD *)a2 + 2));
      _CUILog(4, (uint64_t)"CoreUI: Unable to decompress 2.0 stream for CSI image block data. '%s'", v34, v35, v36, v37, v38, v39, (uint64_t)v70);
      goto LABEL_27;
    default:
      _CUILog(4, (uint64_t)"CoreUI: unhandled compressiontype for CSI image block data.%d", a3, a4, a5, a6, a7, a8, *((unsigned int *)a2 + 2));
      goto LABEL_27;
  }
  do
  {
    v77[0] = _NSConcreteStackBlock;
    v77[1] = 3221225472;
    v43 = v18;
    v77[2] = __69___CSIRenditionBlockData_expandCSIBitmapData_fromSlice_makeReadOnly___block_invoke;
    v77[3] = &unk_1E41B22F0;
    v77[6] = v13;
    v77[7] = v18;
    v77[8] = a2;
    v80 = a3;
    v81 = a4;
    v78 = v40;
    v79 = v17;
    v77[4] = a1;
    v77[5] = &dest;
    if ((v72 & 1) != 0)
    {
      if (!v41)
        v41 = objc_alloc_init((Class)NSMutableArray);
      v50 = objc_msgSend(v77, "copy");
      objc_msgSend(v41, "addObject:", v50);

    }
    else
    {
      __69___CSIRenditionBlockData_expandCSIBitmapData_fromSlice_makeReadOnly___block_invoke((uint64_t)v77);
    }
    if (!--v42)
      break;
    v51 = (char *)v14 + v43;
    v53 = *((_DWORD *)v51 + 5);
    v14 = v51 + 20;
    v52 = v53;
    if (v16)
    {
      if ((_DWORD)v52 == 1262699075)
      {
        v13 = v14 + 5;
        goto LABEL_47;
      }
    }
    else if ((_DWORD)v52 == 1128416075)
    {
      v13 = v14 + 5;
LABEL_49:
      v54 = v14[3];
      v18 = v14[4];
      if (!v54)
        break;
      goto LABEL_50;
    }
    _CUILog(4, (uint64_t)"CoreUI: Can't find the correct chunk '%d'", v44, v45, v46, v47, v48, v49, v52);
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_expandCSIBitmapData_fromSlice_makeReadOnly_, a1, CFSTR("CUIThemeRendition.m"), 966, CFSTR("CoreUI: Can't find the correct chunk"));
    v13 = v14 + 5;
    if (!v16)
      goto LABEL_49;
LABEL_47:
    v18 = bswap32(v14[4]);
    v54 = bswap32(v14[3]);
    if (!v54)
      break;
LABEL_50:
    v40 += v17;
    v55 = atomic_load((unint64_t *)(dest.height + 24));
    v17 = v54;
  }
  while (!v55);
  v10 = v71;
  if ((v72 & 1) != 0 && !atomic_load((unint64_t *)(dest.height + 24)))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __69___CSIRenditionBlockData_expandCSIBitmapData_fromSlice_makeReadOnly___block_invoke_2;
    block[3] = &unk_1E41AB150;
    block[4] = v41;
    dispatch_apply((size_t)objc_msgSend(v41, "count"), 0, block);
  }
  v57 = atomic_load((unint64_t *)(dest.height + 24));
  v19 = v57 == 0;
  if (v57)
    _CUILog(4, (uint64_t)"CoreUI: Image data corrupted", v44, v45, v46, v47, v48, v49, v67);

  _Block_object_dispose(&dest, 8);
LABEL_59:
  if (*(_DWORD *)(a1 + 8) == 1095911234 && *(_DWORD *)(a1 + 12) == 1)
  {
    v58 = *(unsigned int *)(a1 + 24);
    dest.data = *(void **)(a1 + 16);
    dest.height = v58;
    v59 = *(_QWORD *)(a1 + 32);
    dest.width = (int)a4;
    dest.rowBytes = v59;
    *(_DWORD *)permuteMap = 50331906;
    if (vImagePermuteChannels_ARGB8888(&dest, &dest, permuteMap, 0) < 0)
      _CUILog(4, (uint64_t)"CoreUI: Unable to permute pixel buffer", v60, v61, v62, v63, v64, v65, v67);
  }
  if (v10)
    -[_CSIRenditionBlockData _makeReadOnly](a1);
  return v19;
}

- (_DWORD)initWithPixelWidth:(int)a3 pixelHeight:(uint64_t)a4 sourceRowbytes:(uint64_t)a5 pixelFormat:
{
  _DWORD *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v19;

  if (!a1)
    return 0;
  v19.receiver = a1;
  v19.super_class = (Class)_CSIRenditionBlockData;
  v9 = objc_msgSendSuper2(&v19, sel_init);
  if (v9)
  {
    v10 = __bppFromBlockPixelFormat(a5);
    v9[3] = a5;
    v9[6] = a3;
    *((_QWORD *)v9 + 4) = CGBitmapGetAlignedBytesPerRow((v10 * a2));
    *((_QWORD *)v9 + 23) = a4;
    -[_CSIRenditionBlockData _allocateImageBytes]((uint64_t)v9, v11, v12, v13, v14, v15, v16, v17, (uint64_t)v19.receiver);
  }
  return v9;
}

- (uint64_t)_makeReadOnly
{
  if (result)
  {
    if ((~*(unsigned __int8 *)(result + 200) & 3) == 0)
      return mach_vm_protect(mach_task_self_, *(_QWORD *)(result + 16), (vm_page_size + *(_QWORD *)(result + 32) * *(unsigned int *)(result + 24) - 1) & -(uint64_t)vm_page_size, 1, 1);
  }
  return result;
}

- (void)_allocateImageBytes
{
  size_t v10;
  vm_size_t v11;
  uint64_t v12;
  size_t v13;
  char v14;
  void *v15;
  int *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  if (a1)
  {
    v10 = *(_QWORD *)(a1 + 32) * *(unsigned int *)(a1 + 24);
    v11 = vm_page_size + v10 - 1;
    v12 = -(uint64_t)vm_page_size;
    if (_allocateImageBytes___once != -1)
      dispatch_once(&_allocateImageBytes___once, &__block_literal_global_12);
    v13 = v11 & v12;
    if ((_allocateImageBytes___use_malloc & 1) != 0)
    {
      *(_QWORD *)(a1 + 16) = -1;
      v14 = *(_BYTE *)(a1 + 200);
    }
    else
    {
      v15 = mmap(0, v13, 3, 4098, 1275068416, 0);
      *(_QWORD *)(a1 + 16) = v15;
      if (v15 != (void *)-1 && madvise(v15, v13, 3) < 0)
      {
        v16 = __error();
        v17 = strerror(*v16);
        _CUILog(4, (uint64_t)"-[_CSIRenditionBlockData _allocateImageBytes] madvise failed error:'%s'", v18, v19, v20, v21, v22, v23, (uint64_t)v17);
      }
      v14 = *(_BYTE *)(a1 + 200) | 2;
    }
    *(_BYTE *)(a1 + 200) = v14 | 1;
    *(_QWORD *)(a1 + 192) = v13;
    objc_msgSend(+[CUIRuntimeStatistics sharedRuntimeStatistics](CUIRuntimeStatistics, "sharedRuntimeStatistics"), "addStatisticAllocatedImageSize:roundedSize:", v10, v13);
    if (*(_QWORD *)(a1 + 16) == -1)
    {
      if ((_allocateImageBytes___use_malloc & 1) == 0)
      {
        v24 = __error();
        v25 = strerror(*v24);
        _CUILog(4, (uint64_t)"-[_CSIRenditionBlockData _allocateImageBytes] mmap failed error:'%s' using malloc now", v26, v27, v28, v29, v30, v31, (uint64_t)v25);
      }
      *(_BYTE *)(a1 + 200) &= ~2u;
      v32 = malloc_type_malloc(v10, 0xADE472FEuLL);
      *(_QWORD *)(a1 + 16) = v32;
      __CFSetLastAllocationEventName(v32, "CoreUI Image data");
      if (!*(_QWORD *)(a1 + 16))
        _CUILog(4, (uint64_t)"-[_CSIRenditionBlockData _allocateImageBytes] malloc failed error", v33, v34, v35, v36, v37, v38, a9);
    }
  }
}

- (void)dealloc
{
  objc_super v3;

  -[_CSIRenditionBlockData _freeImageBytes]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)_CSIRenditionBlockData;
  -[_CSIRenditionBlockData dealloc](&v3, sel_dealloc);
}

- (void)_freeImageBytes
{
  if (a1 && (*(_BYTE *)(a1 + 200) & 1) != 0)
  {
    if ((*(_BYTE *)(a1 + 200) & 2) != 0)
    {
      munmap(*(void **)(a1 + 16), (vm_page_size + *(_QWORD *)(a1 + 32) * *(unsigned int *)(a1 + 24) - 1) & -(uint64_t)vm_page_size);
      *(_QWORD *)(a1 + 16) = 0;
    }
    else
    {
      free(*(void **)(a1 + 16));
    }
  }
}

- (_BYTE)setRowBytes:(_BYTE *)result
{
  _BYTE *v3;

  if (result)
  {
    v3 = result;
    if ((result[200] & 1) != 0)
      result = -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_setRowBytes_, result, CFSTR("CUIThemeRendition.m"), 574, CFSTR("You can't call setRowBytes: if _CSIRenditionBlockData was inited with initWithPixelWidth:pixelHeight:sourceRowbytes:pixelFormat:"));
    *((_QWORD *)v3 + 4) = a2;
    *((_QWORD *)v3 + 24) = *((unsigned int *)v3 + 6) * a2;
  }
  return result;
}

+ (uint64_t)sharedCache
{
  objc_opt_self();
  if (sharedCache_once != -1)
    dispatch_once(&sharedCache_once, &__block_literal_global_160);
  return sharedCache_sharedCache;
}

@end
