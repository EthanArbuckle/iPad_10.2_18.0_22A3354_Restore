@implementation ZN13PNGReadPlugin28EnsureFrameBufferQueueExistsEP19IIOImageReadSessionP13GlobalPNGInfoRK14ReadPluginDataRK13PNGPluginDatalj

__CFArray *___ZN13PNGReadPlugin28EnsureFrameBufferQueueExistsEP19IIOImageReadSessionP13GlobalPNGInfoRK14ReadPluginDataRK13PNGPluginDatalj_block_invoke(uint64_t a1, uint64_t a2)
{
  const __CFAllocator *v4;
  __CFArray *Mutable;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t i;
  uint64_t v10;
  _DWORD *v11;
  unint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  unint64_t v18;
  size_t v19;
  void *v20;
  char *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  char *v26;
  uint64_t *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char *v31;
  char *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t *v37;
  char *v38;
  uint64_t *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  char *v44;
  IIOImageRead *v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t v52;
  double v53;
  _QWORD *v54;
  IIOColorMap *v55;
  char *SerializedData;
  CFDataRef v57;
  uint64_t v59;
  CFIndex length[2];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  size_t v66;
  uint64_t *v67;
  char *v68;
  char *v69;
  _QWORD v70[6];
  CGRect v71;

  v67 = 0;
  v68 = 0;
  v69 = 0;
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  v8 = *(_QWORD *)(a1 + 32);
  v59 = a2;
  for (i = 0; a2 < *(unsigned int *)(v8 + 40); v8 = *(_QWORD *)(a1 + 32))
  {
    v10 = *(unsigned __int16 *)(a1 + 162);
    v66 = 0;
    v11 = (_DWORD *)(*(_QWORD *)(v8 + 8) + 34 * a2);
    v12 = v11[2];
    LODWORD(v6) = v11[3];
    LODWORD(v7) = v11[4];
    v13 = (double)v6;
    v14 = (double)v7;
    LODWORD(v6) = v11[1];
    v15 = (double)v6;
    v16 = (double)v12;
    v71.origin.x = v13;
    v71.origin.y = (double)v7;
    v71.size.width = v15;
    v71.size.height = (double)v12;
    if (CGRectIsEmpty(v71))
    {
      v17 = 0;
      v18 = 0;
    }
    else
    {
      v18 = (unint64_t)((double)((unint64_t)(v10 + 7) >> 3) * v15);
      if (!is_mul_ok(v18, v12))
        goto LABEL_44;
      v19 = v18 * v12;
      v20 = (void *)_ImageIO_Malloc(v18 * v12, *(_QWORD *)(a1 + 240), &v66, (uint64_t)kImageMalloc_PNG_Data[0], *(_DWORD *)(a1 + 376), 0, 0);
      v17 = v20;
      if (!v20)
        goto LABEL_44;
      bzero(v20, v19);
      i += v19;
    }
    length[0] = a2;
    *(double *)&length[1] = v13;
    *(double *)&v61 = v14;
    *((double *)&v61 + 1) = v15;
    *(double *)&v62 = v16;
    *((_QWORD *)&v62 + 1) = v17;
    *(_QWORD *)&v63 = v18;
    *((_QWORD *)&v63 + 1) = v66;
    *(_QWORD *)&v64 = 0;
    DWORD2(v64) = 0;
    v65 = 0;
    v21 = v68;
    if (v68 >= v69)
    {
      v27 = v67;
      v28 = 0x2E8BA2E8BA2E8BA3 * ((v68 - (char *)v67) >> 3);
      v29 = v28 + 1;
      if ((unint64_t)(v28 + 1) > 0x2E8BA2E8BA2E8BALL)
        std::vector<IIOTag *>::__throw_length_error[abi:ne180100]();
      if (0x5D1745D1745D1746 * ((v69 - (char *)v67) >> 3) > v29)
        v29 = 0x5D1745D1745D1746 * ((v69 - (char *)v67) >> 3);
      if ((unint64_t)(0x2E8BA2E8BA2E8BA3 * ((v69 - (char *)v67) >> 3)) >= 0x1745D1745D1745DLL)
        v30 = 0x2E8BA2E8BA2E8BALL;
      else
        v30 = v29;
      v70[4] = &v69;
      if (v30)
      {
        v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<IIODecodeFrameParams>>((uint64_t)&v69, v30);
        v27 = v67;
        v21 = v68;
      }
      else
      {
        v31 = 0;
      }
      v32 = &v31[88 * v28];
      v33 = v61;
      *(_OWORD *)v32 = *(_OWORD *)length;
      *((_OWORD *)v32 + 1) = v33;
      v34 = v62;
      v35 = v63;
      v36 = v64;
      *((_QWORD *)v32 + 10) = v65;
      *((_OWORD *)v32 + 3) = v35;
      *((_OWORD *)v32 + 4) = v36;
      *((_OWORD *)v32 + 2) = v34;
      if (v21 == (char *)v27)
      {
        v39 = (uint64_t *)&v31[88 * v28];
      }
      else
      {
        v37 = (uint64_t *)v21;
        v38 = &v31[88 * v28];
        do
        {
          v39 = (uint64_t *)(v38 - 88);
          v40 = *(_OWORD *)(v37 - 11);
          *(_OWORD *)(v38 - 72) = *(_OWORD *)(v37 - 9);
          *(_OWORD *)(v38 - 88) = v40;
          v41 = *(_OWORD *)(v37 - 7);
          v42 = *(_OWORD *)(v37 - 5);
          v43 = *(_OWORD *)(v37 - 3);
          *((_QWORD *)v38 - 1) = *(v37 - 1);
          *(_OWORD *)(v38 - 24) = v43;
          *(_OWORD *)(v38 - 40) = v42;
          *(_OWORD *)(v38 - 56) = v41;
          v37 -= 11;
          v38 -= 88;
        }
        while (v37 != v27);
      }
      v26 = v32 + 88;
      v67 = v39;
      v68 = v32 + 88;
      v44 = v69;
      v69 = &v31[88 * v30];
      v70[0] = v27;
      v70[2] = v21;
      v70[3] = v44;
      v70[1] = v27;
      std::__split_buffer<IIODecodeFrameParams>::~__split_buffer((uint64_t)v70);
    }
    else
    {
      v22 = v61;
      *(_OWORD *)v68 = *(_OWORD *)length;
      *((_OWORD *)v21 + 1) = v22;
      v23 = v62;
      v24 = v63;
      v25 = v64;
      *((_QWORD *)v21 + 10) = v65;
      *((_OWORD *)v21 + 3) = v24;
      *((_OWORD *)v21 + 4) = v25;
      *((_OWORD *)v21 + 2) = v23;
      v26 = v21 + 88;
    }
    v68 = v26;
    IIODecodeFrameParams::~IIODecodeFrameParams((IIODecodeFrameParams *)length);
    if ((i & 0xFFFFFFFFFFFF0000) != 0 && (unint64_t)(0x2E8BA2E8BA2E8BA3 * ((v68 - (char *)v67) >> 3)) > 2
      || i >> 20 != 0)
    {
      break;
    }
    ++a2;
  }
  if ((gIIODebugFlags & 0x1000000000000) != 0)
    ImageIOLog("    Asking for frames at indexes: (%ld, %ld), %ld bytes\n", v59, 0x2E8BA2E8BA2E8BA3 * ((v68 - (char *)v67) >> 3), i);
  v47 = (IIOImageRead *)IIO_Reader::testHeaderSize(*(IIO_Reader **)(a1 + 288));
  PNGReadPlugin::DecodeUncomposedFrames(v47, *(_QWORD *)(a1 + 32), a1 + 40, (_BYTE *)(a1 + 296), &v67);
  v50 = v67;
  v51 = (uint64_t *)v68;
  if (v67 != (uint64_t *)v68)
  {
    do
    {
      v52 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 34 * *v50;
      LOWORD(v48) = *(_WORD *)(v52 + 20);
      LOWORD(v49) = *(_WORD *)(v52 + 22);
      v53 = (double)v48 / (double)v49;
      if (v53 == 0.0)
        v53 = 0.0333333333;
      v54 = (_QWORD *)IIOFrameBufferCreateForBuffer(v50[5], v50[7], v50[6] * *(unsigned int *)(v52 + 8), *v50, v53);
      IIOGIFFrameSetNumRowsDecoded((uint64_t)v54, v50[8]);
      v55 = (IIOColorMap *)v50[10];
      if (v55)
      {
        length[0] = 0;
        SerializedData = IIOColorMap::createSerializedData(v55, (unint64_t *)length);
        if (SerializedData)
        {
          v57 = CFDataCreate(v4, (const UInt8 *)SerializedData, length[0]);
          if (v57)
          {
            IIOFrameBufferSetColorTable(v54, v57);
            CFRelease(v57);
          }
          free(SerializedData);
        }
      }
      CFArrayAppendValue(Mutable, v54);
      IIOFrameBufferRelease(v54);
      v50 += 11;
    }
    while (v50 != v51);
  }
LABEL_44:
  length[0] = (CFIndex)&v67;
  std::vector<IIODecodeFrameParams>::__destroy_vector::operator()[abi:ne180100]((void ***)length);
  return Mutable;
}

@end
