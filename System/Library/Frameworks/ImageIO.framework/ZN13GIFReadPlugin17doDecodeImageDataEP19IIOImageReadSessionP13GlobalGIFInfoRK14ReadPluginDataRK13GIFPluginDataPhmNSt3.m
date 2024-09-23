@implementation ZN13GIFReadPlugin17doDecodeImageDataEP19IIOImageReadSessionP13GlobalGIFInfoRK14ReadPluginDataRK13GIFPluginDataPhmNSt3

__CFArray *___ZN13GIFReadPlugin17doDecodeImageDataEP19IIOImageReadSessionP13GlobalGIFInfoRK14ReadPluginDataRK13GIFPluginDataPhmNSt3__110shared_ptrI13GIFBufferInfoEEPl_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __CFArray *Mutable;
  unint64_t v6;
  unint64_t v7;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  unint64_t v12;
  memory_object_offset_t v13;
  unint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char *v24;
  char *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  unint64_t v30;
  char *v31;
  char *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  unint64_t v37;
  BOOL v38;
  uint64_t *v40;
  uint64_t *i;
  double v42;
  _QWORD *v43;
  IIOColorMap *v44;
  char *SerializedData;
  CFDataRef v46;
  const __CFAllocator *v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  _OWORD v56[2];
  uint64_t v57;
  size_t v58;
  uint64_t *v59;
  uint64_t *v60;
  char *v61;
  unint64_t v62[6];
  CGRect v63;
  CGRect v64;

  v4 = *(_QWORD *)(a1 + 32);
  v59 = 0;
  v60 = 0;
  v61 = 0;
  v48 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  v6 = 0;
  v49 = a2;
  while (a2 < GlobalGIFInfo::frameCount(*(GlobalGIFInfo **)(a1 + 40)))
  {
    v58 = 0;
    v57 = 0;
    memset(v56, 0, sizeof(v56));
    GlobalGIFInfo::getFrameInfoAtIndex(*(GlobalGIFInfo **)(a1 + 40), a2, (uint64_t)v56);
    LOWORD(v7) = WORD4(v56[0]);
    v64.origin.x = (double)v7;
    LOWORD(v7) = WORD5(v56[0]);
    v64.origin.y = (double)v7;
    LOWORD(v7) = WORD6(v56[0]);
    v64.size.width = (double)v7;
    LOWORD(v7) = HIWORD(v56[0]);
    v64.size.height = (double)v7;
    v63 = CGRectIntersection(*(CGRect *)(a1 + 48), v64);
    x = v63.origin.x;
    y = v63.origin.y;
    width = v63.size.width;
    height = v63.size.height;
    v12 = (unint64_t)v63.size.width;
    if (CGRectIsEmpty(v63))
    {
      v13 = 0;
    }
    else
    {
      if (!is_mul_ok(v12, (unint64_t)height))
        goto LABEL_45;
      v13 = _ImageIO_Malloc(v12 * (unint64_t)height, *(_QWORD *)(a1 + 280), &v58, (uint64_t)kImageMalloc_GIF_Data[0], *(_DWORD *)(v4 + 432), 0, 0);
      if (!v13)
        goto LABEL_45;
      v6 += v12 * (unint64_t)height;
    }
    *(_QWORD *)&v50 = a2;
    *((CGFloat *)&v50 + 1) = x;
    *(CGFloat *)&v51 = y;
    *((double *)&v51 + 1) = width;
    *(double *)&v52 = height;
    *((_QWORD *)&v52 + 1) = v13;
    *(_QWORD *)&v53 = (unint64_t)width;
    *((_QWORD *)&v53 + 1) = v58;
    *(_QWORD *)&v54 = 0;
    DWORD2(v54) = 0;
    v55 = 0;
    v14 = (unint64_t)v60;
    if (v60 >= (uint64_t *)v61)
    {
      v20 = (unint64_t)v59;
      v21 = 0x2E8BA2E8BA2E8BA3 * (v60 - v59);
      v22 = v21 + 1;
      if ((unint64_t)(v21 + 1) > 0x2E8BA2E8BA2E8BALL)
        std::vector<IIOTag *>::__throw_length_error[abi:ne180100]();
      if (0x5D1745D1745D1746 * ((v61 - (char *)v59) >> 3) > v22)
        v22 = 0x5D1745D1745D1746 * ((v61 - (char *)v59) >> 3);
      v23 = (unint64_t)(0x2E8BA2E8BA2E8BA3 * ((v61 - (char *)v59) >> 3)) >= 0x1745D1745D1745DLL
          ? 0x2E8BA2E8BA2E8BALL
          : v22;
      v62[4] = (unint64_t)&v61;
      if (v23)
      {
        v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<IIODecodeFrameParams>>((uint64_t)&v61, v23);
        v20 = (unint64_t)v59;
        v14 = (unint64_t)v60;
      }
      else
      {
        v24 = 0;
      }
      v25 = &v24[88 * v21];
      v26 = v51;
      *(_OWORD *)v25 = v50;
      *((_OWORD *)v25 + 1) = v26;
      v27 = v52;
      v28 = v53;
      v29 = v54;
      *((_QWORD *)v25 + 10) = v55;
      *((_OWORD *)v25 + 3) = v28;
      *((_OWORD *)v25 + 4) = v29;
      *((_OWORD *)v25 + 2) = v27;
      if (v14 == v20)
      {
        v32 = &v24[88 * v21];
      }
      else
      {
        v30 = v14;
        v31 = &v24[88 * v21];
        do
        {
          v32 = v31 - 88;
          v33 = *(_OWORD *)(v30 - 88);
          *(_OWORD *)(v31 - 72) = *(_OWORD *)(v30 - 72);
          *(_OWORD *)(v31 - 88) = v33;
          v34 = *(_OWORD *)(v30 - 56);
          v35 = *(_OWORD *)(v30 - 40);
          v36 = *(_OWORD *)(v30 - 24);
          *((_QWORD *)v31 - 1) = *(_QWORD *)(v30 - 8);
          *(_OWORD *)(v31 - 24) = v36;
          *(_OWORD *)(v31 - 40) = v35;
          *(_OWORD *)(v31 - 56) = v34;
          v30 -= 88;
          v31 -= 88;
        }
        while (v30 != v20);
      }
      v19 = (uint64_t *)(v25 + 88);
      v59 = (uint64_t *)v32;
      v60 = (uint64_t *)(v25 + 88);
      v37 = (unint64_t)v61;
      v61 = &v24[88 * v23];
      v62[0] = v20;
      v62[2] = v14;
      v62[3] = v37;
      v62[1] = v20;
      std::__split_buffer<IIODecodeFrameParams>::~__split_buffer((uint64_t)v62);
    }
    else
    {
      v15 = v51;
      *(_OWORD *)v60 = v50;
      *(_OWORD *)(v14 + 16) = v15;
      v16 = v52;
      v17 = v53;
      v18 = v54;
      *(_QWORD *)(v14 + 80) = v55;
      *(_OWORD *)(v14 + 48) = v17;
      *(_OWORD *)(v14 + 64) = v18;
      *(_OWORD *)(v14 + 32) = v16;
      v19 = (uint64_t *)(v14 + 88);
    }
    v60 = v19;
    IIODecodeFrameParams::~IIODecodeFrameParams((IIODecodeFrameParams *)&v50);
    v38 = (v6 & 0xFFFFFFFFFFFF0000) != 0 && (unint64_t)(0x2E8BA2E8BA2E8BA3 * (v60 - v59)) > 2;
    if (v38 || v6 >> 20 != 0)
      break;
    ++a2;
  }
  if ((gIIODebugFlags & 0x1000000000000) != 0)
    ImageIOLog("    Asking for frames at indexes: (%ld, %ld), %ld bytes\n", v49, 0x2E8BA2E8BA2E8BA3 * (v60 - v59), v6);
  GIFReadPlugin::decodeIndexedColorFrames(v4, *(IIOImageRead **)(a1 + 328), *(_QWORD *)(a1 + 40), a1 + 80, a1 + 336, &v59);
  v40 = v59;
  for (i = v60; v40 != i; v40 += 11)
  {
    *(_QWORD *)&v52 = 0;
    v50 = 0u;
    v51 = 0u;
    GlobalGIFInfo::getFrameInfoAtIndex(*(GlobalGIFInfo **)(a1 + 40), *v40, (uint64_t)&v50);
    v42 = 0.0333333333;
    if (WORD1(v51))
      v42 = (double)WORD1(v51) / 100.0;
    v43 = (_QWORD *)IIOFrameBufferCreateForBuffer(v40[5], v40[7], HIWORD(v50) * (unint64_t)WORD6(v50), *v40, v42);
    IIOGIFFrameSetNumRowsDecoded((uint64_t)v43, v40[8]);
    v44 = (IIOColorMap *)v40[10];
    if (v44)
    {
      v62[0] = 0;
      SerializedData = IIOColorMap::createSerializedData(v44, v62);
      if (SerializedData)
      {
        v46 = CFDataCreate(v48, (const UInt8 *)SerializedData, v62[0]);
        if (v46)
        {
          IIOFrameBufferSetColorTable(v43, v46);
          CFRelease(v46);
        }
        free(SerializedData);
      }
    }
    CFArrayAppendValue(Mutable, v43);
    IIOFrameBufferRelease(v43);
  }
LABEL_45:
  *(_QWORD *)&v50 = &v59;
  std::vector<IIODecodeFrameParams>::__destroy_vector::operator()[abi:ne180100]((void ***)&v50);
  return Mutable;
}

@end
