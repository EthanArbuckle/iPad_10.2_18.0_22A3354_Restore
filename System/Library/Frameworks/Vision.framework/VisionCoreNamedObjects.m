@implementation VisionCoreNamedObjects

uint64_t __83__VisionCoreNamedObjects_VNInternalAdditions__VNGetConfidenceValue_asTensor_error___block_invoke(uint64_t a1, float a2)
{
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  return 1;
}

BOOL __105__VisionCoreNamedObjects_VNInternalAdditions__VNEnumerateFloatValuesAtIndexes_asTensor_usingBlock_error___block_invoke(uint64_t a1, id a2, _QWORD *a3)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  __n128 v8;
  uint64_t v9;
  char v10;
  id v11;
  int v12;
  void *v13;
  int64x2_t v15;
  uint64_t v16;
  char v17;
  void *__p[3];
  vImage_Buffer dest;
  int v20;
  vImage_Buffer src;

  v5 = objc_msgSend(objc_retainAutorelease(a2), "bytes");
  v6 = *(_QWORD *)(a1 + 56);
  src.data = 0;
  std::vector<unsigned long>::vector(__p, v6, &src);
  v17 = 0;
  v7 = objc_msgSend(*(id *)(a1 + 32), "firstIndex");
  v15 = vdupq_n_s64(1uLL);
  while (1)
  {
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = 2;
      goto LABEL_20;
    }
    *((_QWORD *)__p[0] + *(_QWORD *)(a1 + 64)) = v7;
    v16 = 0;
    if ((objc_msgSend(*(id *)(a1 + 40), "getByteOffset:forPosition:rank:error:", &v16) & 1) == 0)
      goto LABEL_19;
    v9 = *(_QWORD *)(a1 + 72);
    if (v9 != 65552)
      break;
    src.data = (void *)(v5 + v16);
    *(int64x2_t *)&src.height = v15;
    src.rowBytes = 2;
    v20 = 2143289344;
    dest.data = &v20;
    *(int64x2_t *)&dest.height = v15;
    dest.rowBytes = 4;
    vImageConvert_Planar16FtoPlanarF(&src, &dest, 0);
    v8.n128_u32[0] = v20;
LABEL_8:
    v10 = (*(uint64_t (**)(__n128))(*(_QWORD *)(a1 + 48) + 16))(v8);
    v11 = 0;
    if ((v10 & 1) == 0)
    {
      if (a3)
      {
        v11 = objc_retainAutorelease(v11);
        *a3 = v11;
      }
      v12 = 1;
      goto LABEL_16;
    }
    if (v17)
    {
      v12 = 2;
LABEL_16:

      goto LABEL_20;
    }

    v7 = objc_msgSend(*(id *)(a1 + 32), "indexGreaterThanIndex:", v7);
  }
  if (v9 == 65568)
  {
    v8.n128_u32[0] = *(_DWORD *)(v5 + v16);
    goto LABEL_8;
  }
  if (a3)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Cannot interpret %@ as float values"), *(_QWORD *)(a1 + 40));
    +[VNError errorForDataUnavailableWithLocalizedDescription:](VNError, "errorForDataUnavailableWithLocalizedDescription:", v13);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_19:
  v12 = 1;
LABEL_20:
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return v12 == 2;
}

@end
