@implementation CVNLPCaptionEncoder

- (void)computeCaptionForVideoPixelBuffer:(void *)a3 outputs:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  id v11;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v7, (uint64_t)CFSTR("You must override %@ in a subclass"), v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exceptionWithName_reason_userInfo_(v4, v10, *MEMORY[0x1E0C99768], (uint64_t)v9, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

- (void)computeCaptionForPixelBuffer:(__CVBuffer *)a3 outputs:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  id v11;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v7, (uint64_t)CFSTR("You must override %@ in a subclass"), v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exceptionWithName_reason_userInfo_(v4, v10, *MEMORY[0x1E0C99768], (uint64_t)v9, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

- (void)computeCaptionForImage:(vImage_Buffer *)a3 outputs:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  id v11;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v7, (uint64_t)CFSTR("You must override %@ in a subclass"), v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exceptionWithName_reason_userInfo_(v4, v10, *MEMORY[0x1E0C99768], (uint64_t)v9, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

- (unint64_t)_blob_size:(id *)a3
{
  return a3->var2[1] * a3->var2[0] * a3->var2[2] * a3->var2[3];
}

- (void)_fill_blob_data:(id *)a3 with:(float)a4
{
  uint64_t v4;
  int32x4_t *var0;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  int32x4_t v15;
  int32x4_t *v16;
  unint64_t v17;
  unint64_t v18;
  int32x2_t v19;
  _OWORD v20[10];
  uint64_t v21;

  v19 = *(int32x2_t *)&a4;
  var0 = (int32x4_t *)a3->var0;
  v6 = *(_OWORD *)&a3->var12;
  v20[8] = *(_OWORD *)&a3->var10;
  v20[9] = v6;
  v21 = *(_QWORD *)&a3->var14;
  v7 = *(_OWORD *)&a3->var4;
  v20[4] = *(_OWORD *)&a3->var3[2];
  v20[5] = v7;
  v8 = *(_OWORD *)&a3->var8;
  v20[6] = *(_OWORD *)&a3->var6;
  v20[7] = v8;
  v9 = *(_OWORD *)a3->var2;
  v20[0] = *(_OWORD *)&a3->var0;
  v20[1] = v9;
  v10 = *(_OWORD *)a3->var3;
  v20[2] = *(_OWORD *)&a3->var2[2];
  v20[3] = v10;
  v11 = objc_msgSend__blob_size_(self, a2, (uint64_t)v20, v4);
  if (v11 >= 1)
  {
    v12 = v11 & 0x3FFFFFFFFFFFFFFFLL;
    v13 = (v11 & 0x3FFFFFFFFFFFFFFFLL) - ((v11 & 0x3FFFFFFFFFFFFFFFLL) != 0) + 1;
    if (v13 < 8)
    {
      v14 = (char *)var0;
LABEL_7:
      v18 = v12 + 1;
      do
      {
        *(_DWORD *)v14 = v19.i32[0];
        v14 += 4;
        --v18;
      }
      while (v18 > 1);
      return;
    }
    v14 = &var0->i8[4 * (v13 & 0xFFFFFFFFFFFFFFF8)];
    v12 -= v13 & 0xFFFFFFFFFFFFFFF8;
    v15 = vdupq_lane_s32(v19, 0);
    v16 = var0 + 1;
    v17 = v13 & 0xFFFFFFFFFFFFFFF8;
    do
    {
      v16[-1] = v15;
      *v16 = v15;
      v16 += 2;
      v17 -= 8;
    }
    while (v17);
    if (v13 != (v13 & 0xFFFFFFFFFFFFFFF8))
      goto LABEL_7;
  }
}

@end
