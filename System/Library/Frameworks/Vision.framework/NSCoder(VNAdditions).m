@implementation NSCoder(VNAdditions)

- (uint64_t)_vn_decodeFloatsFromEncodedData:()VNAdditions withExpectedMagicNumber:valueCount:forKey:usingBlock:
{
  id v12;
  NSString *v13;
  void (**v14)(id, uint64_t);
  unsigned int *v15;
  void *v16;
  id v17;
  uint64_t v18;
  unsigned int *v19;
  _DWORD *v20;
  unsigned int v21;
  uint64_t v22;
  void *v23;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  if (objc_msgSend(v12, "length") != 4 * a5 + 4
    || (v15 = (unsigned int *)objc_msgSend(objc_retainAutorelease(v12), "bytes"), bswap32(*v15) != a4))
  {
    unknownDataForCodingKeyError(v13);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "failWithError:", v17);
LABEL_11:
    v22 = 0;
    goto LABEL_12;
  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 4 * a5);
  if (!v16)
  {
    +[VNError errorForMemoryAllocationFailure](VNError, "errorForMemoryAllocationFailure");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "failWithError:", v23);

    v17 = 0;
    goto LABEL_11;
  }
  v17 = objc_retainAutorelease(v16);
  v18 = objc_msgSend(v17, "mutableBytes");
  if (a5)
  {
    v19 = v15 + 1;
    v20 = (_DWORD *)v18;
    do
    {
      v21 = *v19++;
      *v20++ = bswap32(v21);
      --a5;
    }
    while (a5);
  }
  v14[2](v14, v18);
  v22 = 1;
LABEL_12:

  return v22;
}

- (void)vn_encodeCGAffineTransform:()VNAdditions forKey:
{
  void *v6;
  id v7;

  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%g %g %g %g %g %g]"), *a3, a3[1], a3[2], a3[3], a3[4], a3[5]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "encodeObject:forKey:", v6, v7);

}

- (void)vn_decodeCGAffineTransformForKey:()VNAdditions
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "length") < 0xD
    || ((v6 = (void *)MEMORY[0x1A1B0B060](),
         objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v5),
         v7 = (void *)objc_claimAutoreleasedReturnValue(),
         !objc_msgSend(v7, "scanString:intoString:", CFSTR("["), 0))
     || !objc_msgSend(v7, "scanDouble:", a3)
     || !objc_msgSend(v7, "scanDouble:", a3 + 8)
     || !objc_msgSend(v7, "scanDouble:", a3 + 16)
     || !objc_msgSend(v7, "scanDouble:", a3 + 24)
     || !objc_msgSend(v7, "scanDouble:", a3 + 32)
     || !objc_msgSend(v7, "scanDouble:", a3 + 40)
     || !objc_msgSend(v7, "scanString:intoString:", CFSTR("]"), 0)
      ? (v8 = 0)
      : (v8 = objc_msgSend(v7, "isAtEnd")),
        v7,
        objc_autoreleasePoolPop(v6),
        (v8 & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%@' is not a valid CGAffineTransform encoding"), v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorForInvalidFormatErrorWithLocalizedDescription:](VNError, "errorForInvalidFormatErrorWithLocalizedDescription:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "failWithError:", v10);

  }
}

- (void)vn_encode3x3Matrix:()VNAdditions forKey:
{
  id v7;
  __n128 v8;
  void *v9;
  id v10;
  id v14;
  _OWORD v15[2];
  unsigned __int32 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a6;
  v8 = a2;
  v8.n128_u32[3] = a3.i32[0];
  v15[0] = v8;
  v15[1] = vextq_s8(vextq_s8(a3, a3, 0xCuLL), a4, 8uLL);
  v16 = a4.u32[2];
  v14 = 0;
  objc_msgSend((id)objc_opt_class(), "_vn_createEncodableDataWithMagicNumber:forN:floatValues:error:", 1714649139, 9, v15, &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v14;
  if (v9)
    objc_msgSend(a1, "encodeObject:forKey:", v9, v7);
  else
    objc_msgSend(a1, "failWithError:", v10);

}

- (__n128)_vn_decode3x3MatrixFromDataRepresentation:()VNAdditions forKey:
{
  __int128 *v4;
  __int128 v5;
  int v6;
  __int128 *v7;
  __int128 v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  __n128 (*v14)(uint64_t, uint64_t);
  uint64_t (*v15)();
  const char *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  v11 = 0;
  v12 = &v11;
  v13 = 0x6012000000;
  v14 = __Block_byref_object_copy__2931;
  v15 = __Block_byref_object_dispose__2932;
  v16 = "";
  v4 = (__int128 *)MEMORY[0x1E0C83FE8];
  v5 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 16);
  v17 = *MEMORY[0x1E0C83FE8];
  v18 = v5;
  v19 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__NSCoder_VNAdditions___vn_decode3x3MatrixFromDataRepresentation_forKey___block_invoke;
  v10[3] = &unk_1E4543818;
  v10[4] = &v11;
  v6 = objc_msgSend(a1, "_vn_decodeFloatsFromEncodedData:withExpectedMagicNumber:valueCount:forKey:usingBlock:", a3, 1714649139, 9, a4, v10);
  v7 = (__int128 *)(v12 + 6);
  if (!v6)
    v7 = v4;
  v9 = *v7;
  _Block_object_dispose(&v11, 8);
  return (__n128)v9;
}

- (__n128)_vn_decode3x3MatrixFromStringRepresentation:()VNAdditions
{
  id v3;
  void *v4;
  NSScanner *v5;
  int v6;
  __int128 v8;
  float v9[6];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "length") < 0x17
    || ((v4 = (void *)MEMORY[0x1A1B0B060](),
         objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v3),
         v5 = (NSScanner *)objc_claimAutoreleasedReturnValue(),
         !-[NSScanner scanString:intoString:](v5, "scanString:intoString:", CFSTR("3x3:|"), 0))
     || !_scanNFloats(v5, 9uLL, v9)
     || !-[NSScanner scanString:intoString:](v5, "scanString:intoString:", CFSTR("|"), 0)
     || !-[NSScanner isAtEnd](v5, "isAtEnd")
      ? (v6 = 1)
      : (v6 = 0, v8 = *(_OWORD *)v9),
        v5,
        objc_autoreleasePoolPop(v4),
        v6))
  {
    v8 = *MEMORY[0x1E0C83FE8];
  }

  return (__n128)v8;
}

- (__n128)vn_decode3x3MatrixForKey:()VNAdditions
{
  NSString *v4;
  void *v5;
  void *v6;
  __int128 v7;
  void *v8;
  __int128 v10;

  v4 = a3;
  _stringOrDataCodingClassesSet();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "decodeObjectOfClasses:forKey:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    missingRequiredCodingKeyError(v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "failWithError:", v8);
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "_vn_decode3x3MatrixFromStringRepresentation:", v6);
      goto LABEL_7;
    }
    unknownDataForCodingKeyError(v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "failWithError:", v8);
LABEL_9:

    v10 = *MEMORY[0x1E0C83FE8];
    goto LABEL_10;
  }
  objc_msgSend(a1, "_vn_decode3x3MatrixFromDataRepresentation:forKey:", v6, v4);
LABEL_7:
  v10 = v7;
LABEL_10:

  return (__n128)v10;
}

- (void)vn_encode4x4Matrix:()VNAdditions forKey:
{
  id v8;
  void *v9;
  id v10;
  id v15;
  _OWORD v16[4];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a7;
  v16[0] = a2;
  v16[1] = a3;
  v16[2] = a4;
  v16[3] = a5;
  v15 = 0;
  objc_msgSend((id)objc_opt_class(), "_vn_createEncodableDataWithMagicNumber:forN:floatValues:error:", 1714714676, 16, v16, &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;
  if (v9)
    objc_msgSend(a1, "encodeObject:forKey:", v9, v8);
  else
    objc_msgSend(a1, "failWithError:", v10);

}

- (__n128)_vn_decode4x4MatrixFromDataRepresentation:()VNAdditions forKey:
{
  __int128 *v4;
  __int128 v5;
  __int128 v6;
  __int128 v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  __n128 (*v13)(uint64_t, uint64_t);
  uint64_t (*v14)();
  const char *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  v10 = 0;
  v11 = &v10;
  v12 = 0x7012000000;
  v13 = __Block_byref_object_copy__34;
  v14 = __Block_byref_object_dispose__35;
  v15 = "";
  v4 = (__int128 *)MEMORY[0x1E0C83FF0];
  v5 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 16);
  v16 = *MEMORY[0x1E0C83FF0];
  v17 = v5;
  v6 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 48);
  v18 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 32);
  v19 = v6;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__NSCoder_VNAdditions___vn_decode4x4MatrixFromDataRepresentation_forKey___block_invoke;
  v9[3] = &unk_1E4543818;
  v9[4] = &v10;
  if ((objc_msgSend(a1, "_vn_decodeFloatsFromEncodedData:withExpectedMagicNumber:valueCount:forKey:usingBlock:", a3, 1714714676, 16, a4, v9) & 1) != 0)v4 = (__int128 *)(v11 + 6);
  v8 = *v4;
  _Block_object_dispose(&v10, 8);
  return (__n128)v8;
}

- (__n128)_vn_decode4x4MatrixFromStringRepresentation:()VNAdditions
{
  id v3;
  void *v4;
  NSScanner *v5;
  int v6;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!objc_msgSend(v3, "hasPrefix:", CFSTR("4x4:|"))
    || (unint64_t)objc_msgSend(v3, "length") < 0x25
    || ((v4 = (void *)MEMORY[0x1A1B0B060](),
         objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v3),
         v5 = (NSScanner *)objc_claimAutoreleasedReturnValue(),
         !-[NSScanner scanString:intoString:](v5, "scanString:intoString:", CFSTR("4x4:|"), 0))
     || !_scanNFloats(v5, 0x10uLL, (float *)&v9)
     || !-[NSScanner scanString:intoString:](v5, "scanString:intoString:", CFSTR("|"), 0)
     || !-[NSScanner isAtEnd](v5, "isAtEnd")
      ? (v6 = 1)
      : (v6 = 0, v8 = v9),
        v5,
        objc_autoreleasePoolPop(v4),
        v6))
  {
    v8 = *MEMORY[0x1E0C83FF0];
  }

  return (__n128)v8;
}

- (__n128)vn_decode4x4MatrixForKey:()VNAdditions
{
  NSString *v4;
  void *v5;
  void *v6;
  __int128 v7;
  void *v8;
  __int128 v10;

  v4 = a3;
  _stringOrDataCodingClassesSet();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "decodeObjectOfClasses:forKey:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    missingRequiredCodingKeyError(v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "failWithError:", v8);
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "_vn_decode4x4MatrixFromStringRepresentation:", v6);
      goto LABEL_7;
    }
    unknownDataForCodingKeyError(v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "failWithError:", v8);
LABEL_9:

    v10 = *MEMORY[0x1E0C83FF0];
    goto LABEL_10;
  }
  objc_msgSend(a1, "_vn_decode4x4MatrixFromDataRepresentation:forKey:", v6, v4);
LABEL_7:
  v10 = v7;
LABEL_10:

  return (__n128)v10;
}

- (void)vn_encodeSimdFloat3:()VNAdditions forKey:
{
  id v5;
  void *v6;
  id v7;
  id v9;
  unint64_t v10;
  unsigned __int32 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v10 = a2.n128_u64[0];
  v11 = a2.n128_u32[2];
  v9 = 0;
  objc_msgSend((id)objc_opt_class(), "_vn_createEncodableDataWithMagicNumber:forN:floatValues:error:", 1935631923, 3, &v10, &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v9;
  if (v6)
    objc_msgSend(a1, "encodeObject:forKey:", v6, v5);
  else
    objc_msgSend(a1, "failWithError:", v7);

}

- (__n128)_vn_decodeSimdFloat3FromDataRepresentation:()VNAdditions forKey:
{
  char v4;
  __int128 v5;
  __int128 v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x3020000000;
  v12 = 0;
  v13 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__NSCoder_VNAdditions___vn_decodeSimdFloat3FromDataRepresentation_forKey___block_invoke;
  v8[3] = &unk_1E4543818;
  v8[4] = &v9;
  v4 = objc_msgSend(a1, "_vn_decodeFloatsFromEncodedData:withExpectedMagicNumber:valueCount:forKey:usingBlock:", a3, 1935631923, 3, a4, v8);
  v5 = 0uLL;
  if ((v4 & 1) != 0)
    v5 = *((_OWORD *)v10 + 2);
  v7 = v5;
  _Block_object_dispose(&v9, 8);
  return (__n128)v7;
}

- (__n128)_vn_decodeSimdFloat3FromStringRepresentation:()VNAdditions
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  unint64_t v8;
  float64x2_t *v9;
  __int128 v10;
  int v11;
  float v12;
  void *v13;
  void *v14;
  __int128 v16;
  float64x2_t v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "length") < 0xA)
    goto LABEL_12;
  v5 = (void *)MEMORY[0x1A1B0B060]();
  objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "scanString:intoString:", CFSTR("d3:|"), 0))
    goto LABEL_10;
  v7 = 0;
  v8 = 0;
  v9 = &v17;
  do
  {
    if ((objc_msgSend(v6, "scanDouble:", v9) & 1) == 0)
      break;
    v7 = v8 > 1;
    v9 = (float64x2_t *)((char *)v9 + 8);
    ++v8;
  }
  while (v8 != 3);
  if (v7
    && objc_msgSend(v6, "scanString:intoString:", CFSTR("|"), 0)
    && objc_msgSend(v6, "isAtEnd"))
  {
    v11 = 0;
    *(float32x2_t *)&v10 = vcvt_f32_f64(v17);
    v12 = v18;
    *((float *)&v10 + 2) = v12;
    v16 = v10;
  }
  else
  {
LABEL_10:
    v11 = 1;
  }

  objc_autoreleasePoolPop(v5);
  if (v11)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%@' is not a valid simd_flloat3 encoding"), v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorForInvalidFormatErrorWithLocalizedDescription:](VNError, "errorForInvalidFormatErrorWithLocalizedDescription:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "failWithError:", v14);

    v16 = 0u;
  }

  return (__n128)v16;
}

- (__n128)vn_decodeSimdFloat3ForKey:()VNAdditions
{
  NSString *v4;
  void *v5;
  void *v6;
  __int128 v7;
  void *v8;
  __int128 v10;

  v4 = a3;
  _stringOrDataCodingClassesSet();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "decodeObjectOfClasses:forKey:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    missingRequiredCodingKeyError(v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "failWithError:", v8);
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "_vn_decodeSimdFloat3FromStringRepresentation:", v6);
      goto LABEL_9;
    }
    unknownDataForCodingKeyError(v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "failWithError:", v8);
LABEL_8:

    v7 = 0uLL;
    goto LABEL_9;
  }
  objc_msgSend(a1, "_vn_decodeSimdFloat3FromDataRepresentation:forKey:", v6, v4);
LABEL_9:
  v10 = v7;

  return (__n128)v10;
}

- (void)vn_encodeTimeRange:()VNAdditions forKey:
{
  id v6;
  __int128 v7;
  CFDictionaryRef v8;
  CMTimeRange v9;

  v6 = a4;
  v7 = a3[1];
  *(_OWORD *)&v9.start.value = *a3;
  *(_OWORD *)&v9.start.epoch = v7;
  *(_OWORD *)&v9.duration.timescale = a3[2];
  v8 = CMTimeRangeCopyAsDictionary(&v9, (CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  objc_msgSend(a1, "encodeObject:forKey:", v8, v6);

}

- (void)vn_decodeTimeRangeForKey:()VNAdditions
{
  id v5;
  uint64_t v6;
  __int128 v7;
  const __CFDictionary *v8;
  const __CFDictionary *v9;
  __int128 v10;
  CMTimeRange v11;

  v5 = a2;
  v6 = MEMORY[0x1E0CA2E50];
  v7 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 16);
  *a3 = *MEMORY[0x1E0CA2E50];
  a3[1] = v7;
  a3[2] = *(_OWORD *)(v6 + 32);
  if (-[NSCoder(VNAdditions) vn_decodeTimeRangeForKey:]::ourCMTimeRangeRepresentationClassesSetOnceToken != -1)
    dispatch_once(&-[NSCoder(VNAdditions) vn_decodeTimeRangeForKey:]::ourCMTimeRangeRepresentationClassesSetOnceToken, &__block_literal_global_2915);
  objc_msgSend(a1, "decodeObjectOfClasses:forKey:", -[NSCoder(VNAdditions) vn_decodeTimeRangeForKey:]::ourCMTimeRangeRepresentationClassesSet, v5);
  v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    CMTimeRangeMakeFromDictionary(&v11, v8);
    v10 = *(_OWORD *)&v11.start.epoch;
    *a3 = *(_OWORD *)&v11.start.value;
    a3[1] = v10;
    a3[2] = *(_OWORD *)&v11.duration.timescale;
  }

}

- (void)vn_encodePoint:()VNAdditions forKey:
{
  void *v8;
  void *v9;
  id v10;

  v10 = a5;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.x"), v10);
  objc_msgSend(a1, "encodeDouble:forKey:", v8, a2);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.y"), v10);
  objc_msgSend(a1, "encodeDouble:forKey:", v9, a3);

}

- (double)vn_decodePointForKey:()VNAdditions
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.x"), v4);
  objc_msgSend(a1, "decodeDoubleForKey:", v5);
  v7 = v6;

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.y"), v4);
  objc_msgSend(a1, "decodeDoubleForKey:", v8);

  return v7;
}

- (void)vn_encodeSize:()VNAdditions forKey:
{
  void *v8;
  void *v9;
  id v10;

  v10 = a5;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.w"), v10);
  objc_msgSend(a1, "encodeDouble:forKey:", v8, a2);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.h"), v10);
  objc_msgSend(a1, "encodeDouble:forKey:", v9, a3);

}

- (double)vn_decodeSizeForKey:()VNAdditions
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.w"), v4);
  objc_msgSend(a1, "decodeDoubleForKey:", v5);
  v7 = v6;

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.h"), v4);
  objc_msgSend(a1, "decodeDoubleForKey:", v8);

  return v7;
}

- (void)vn_encodeRect:()VNAdditions forKey:
{
  void *v12;
  void *v13;
  id v14;

  v14 = a7;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.or"), v14);
  objc_msgSend(a1, "vn_encodePoint:forKey:", v12, a2, a3);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.sz"), v14);
  objc_msgSend(a1, "vn_encodeSize:forKey:", v13, a4, a5);

}

- (double)vn_decodeRectForKey:()VNAdditions
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.or"), v4);
  objc_msgSend(a1, "vn_decodePointForKey:", v5);
  v7 = v6;

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.sz"), v4);
  objc_msgSend(a1, "vn_decodeSizeForKey:", v8);

  return v7;
}

- (void)vn_encodePixelBuffer:()VNAdditions forKey:
{
  void *v6;
  id v7;

  v7 = a4;
  +[VNCVPixelBufferConversionHelpers createDictionaryRepresentationOfCVPixelBuffer:](VNCVPixelBufferConversionHelpers, "createDictionaryRepresentationOfCVPixelBuffer:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "encodeObject:forKey:", v6, v7);

}

- (__CVBuffer)vn_decodePixelBufferForKey:()VNAdditions
{
  id v4;
  void *v5;
  void *v6;
  __CVBuffer *v7;

  v4 = a3;
  +[VNCVPixelBufferConversionHelpers dictionaryRepresentationClassesSet](VNCVPixelBufferConversionHelpers, "dictionaryRepresentationClassesSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "decodeObjectOfClasses:forKey:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = +[VNCVPixelBufferConversionHelpers createCVPixelBufferRefFromDictionaryRepresentation:](VNCVPixelBufferConversionHelpers, "createCVPixelBufferRefFromDictionaryRepresentation:", v6);
  else
    v7 = 0;

  return v7;
}

- (void)vn_encodeValidatedConfidence:()VNAdditions forKey:
{
  id v6;
  double v7;
  BOOL v8;
  id v9;
  double v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v6 = a4;
  v18 = 0;
  *(float *)&v7 = a2;
  v8 = +[VNValidationUtilities validateVNConfidenceRange:error:](VNValidationUtilities, "validateVNConfidenceRange:error:", &v18, v7);
  v9 = v18;
  if (v8)
  {
    *(float *)&v10 = a2;
    objc_msgSend(a1, "encodeFloat:forKey:", v6, v10);
  }
  else
  {
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    objc_msgSend(v9, "localizedDescription");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v11, "UTF8String");
    VNValidatedLog(4, (uint64_t)CFSTR("unable to encode confidence of %f for %s - %s"), v12, v13, v14, v15, v16, v17, COERCE__INT64(a2));

    objc_msgSend(a1, "failWithError:", v9);
  }

}

- (float)vn_decodeValidatedConfidenceForKey:()VNAdditions
{
  id v4;
  float v5;
  float v6;
  BOOL v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v17;

  v4 = a3;
  objc_msgSend(a1, "decodeFloatForKey:", v4);
  v6 = v5;
  v17 = 0;
  v7 = +[VNValidationUtilities validateVNConfidenceRange:error:](VNValidationUtilities, "validateVNConfidenceRange:error:", &v17);
  v8 = v17;
  if (!v7)
  {
    objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    objc_msgSend(v8, "localizedDescription");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "UTF8String");
    VNValidatedLog(4, (uint64_t)CFSTR("unable to accept decoded confidence of %f for %s - %s"), v10, v11, v12, v13, v14, v15, COERCE__INT64(v6));

    v6 = 0.0;
    objc_msgSend(a1, "failWithError:", v8);
  }

  return v6;
}

- (void)vn_encodeValidatedScore:()VNAdditions forKey:
{
  id v6;
  double v7;
  BOOL v8;
  id v9;
  double v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v6 = a4;
  v18 = 0;
  *(float *)&v7 = a2;
  v8 = +[VNValidationUtilities validateScoreRange:named:error:](VNValidationUtilities, "validateScoreRange:named:error:", v6, &v18, v7);
  v9 = v18;
  if (v8)
  {
    *(float *)&v10 = a2;
    objc_msgSend(a1, "encodeFloat:forKey:", v6, v10);
  }
  else
  {
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    objc_msgSend(v9, "localizedDescription");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v11, "UTF8String");
    VNValidatedLog(4, (uint64_t)CFSTR("unable to encode score of %f for %s - %s"), v12, v13, v14, v15, v16, v17, COERCE__INT64(a2));

    objc_msgSend(a1, "failWithError:", v9);
  }

}

- (float)vn_decodeValidatedScoreForKey:()VNAdditions
{
  id v4;
  float v5;
  float v6;
  BOOL v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v17;

  v4 = a3;
  objc_msgSend(a1, "decodeFloatForKey:", v4);
  v6 = v5;
  v17 = 0;
  v7 = +[VNValidationUtilities validateScoreRange:named:error:](VNValidationUtilities, "validateScoreRange:named:error:", v4, &v17);
  v8 = v17;
  if (!v7)
  {
    objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    objc_msgSend(v8, "localizedDescription");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "UTF8String");
    VNValidatedLog(4, (uint64_t)CFSTR("unable to accept decoded score of %f for %s - %s"), v10, v11, v12, v13, v14, v15, COERCE__INT64(v6));

    v6 = 0.0;
    objc_msgSend(a1, "failWithError:", v8);
  }

  return v6;
}

+ (id)_vn_createEncodableDataWithMagicNumber:()VNAdditions forN:floatValues:error:
{
  uint64_t v8;
  void *v10;
  void *v11;
  id v12;
  _DWORD *v13;
  _DWORD *v14;
  unsigned int v15;
  id v16;

  v8 = a4;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 4 * a4 + 4);
  v11 = v10;
  if (v10)
  {
    v12 = objc_retainAutorelease(v10);
    v13 = (_DWORD *)objc_msgSend(v12, "mutableBytes");
    *v13 = bswap32(a3);
    if (v8)
    {
      v14 = v13 + 1;
      do
      {
        v15 = *a5++;
        *v14++ = bswap32(v15);
        --v8;
      }
      while (v8);
    }
    v16 = v12;
  }
  else if (a6)
  {
    +[VNError errorForMemoryAllocationFailure](VNError, "errorForMemoryAllocationFailure");
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

@end
