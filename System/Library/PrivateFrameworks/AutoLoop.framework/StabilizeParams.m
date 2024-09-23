@implementation StabilizeParams

- (StabilizeParams)init
{
  StabilizeParams *result;
  uint64_t v3;
  __int128 v4;
  CGSize v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)StabilizeParams;
  result = -[StabilizeParams init](&v7, sel_init);
  if (result)
  {
    v3 = MEMORY[0x1E0CA2E68];
    v4 = *MEMORY[0x1E0CA2E68];
    *(_OWORD *)(&result->version + 1) = *MEMORY[0x1E0CA2E68];
    *(_OWORD *)((char *)&result->roiStart.epoch + 4) = v4;
    *(_QWORD *)&result->numFrames = 0x300000000;
    v5 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    result->cropRect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    v6 = *(_QWORD *)(v3 + 16);
    *(_QWORD *)&result->roiStart.flags = v6;
    *(_QWORD *)&result->roiLength.flags = v6;
    result->cropRect.size = v5;
    *(_WORD *)&result->passThrough = 0;
  }
  return result;
}

+ (id)stabilizeParams
{
  return objc_alloc_init(StabilizeParams);
}

+ (id)stabilizeParamsFromURL:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[StabilizeParams initFromDict:]([StabilizeParams alloc], "initFromDict:", v3);
  else
    v4 = 0;

  return v4;
}

- (void)append:(id *)a3
{
  __compressed_pair<SP_FrameInfo *, std::allocator<SP_FrameInfo>> *p_end_cap;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v6;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *value;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v12;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 **p_value;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  char *v20;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  __int128 v27;
  __int128 v28;
  __int128 v29;

  value = self->mFrameInfo.__end_cap_.__value_;
  p_end_cap = &self->mFrameInfo.__end_cap_;
  v6 = value;
  v8 = p_end_cap[-1].__value_;
  if (v8 >= value)
  {
    p_value = &p_end_cap[-2].__value_;
    v14 = p_end_cap[-2].__value_;
    v15 = 0xEEEEEEEEEEEEEEEFLL * ((v8 - v14) >> 2);
    v16 = v15 + 1;
    if (v15 + 1 > 0x444444444444444)
      sub_1D4C590D0();
    v17 = 0xEEEEEEEEEEEEEEEFLL * ((v6 - v14) >> 2);
    if (2 * v17 > v16)
      v16 = 2 * v17;
    if (v17 >= 0x222222222222222)
      v18 = 0x444444444444444;
    else
      v18 = v16;
    if (v18)
      v19 = (char *)sub_1D4C90454((uint64_t)p_end_cap, v18);
    else
      v19 = 0;
    v20 = &v19[60 * v15];
    v21 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v19[60 * v18];
    v22 = *(_OWORD *)a3->var0;
    v23 = *(_OWORD *)&a3->var0[4];
    v24 = *(_OWORD *)&a3->var0[8];
    *(_OWORD *)(v20 + 44) = *(_OWORD *)((char *)&a3->var1.var0 + 4);
    *((_OWORD *)v20 + 1) = v23;
    *((_OWORD *)v20 + 2) = v24;
    *(_OWORD *)v20 = v22;
    v12 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v20 + 60);
    begin = self->mFrameInfo.__begin_;
    end = self->mFrameInfo.__end_;
    if (end != begin)
    {
      do
      {
        v27 = *(_OWORD *)((char *)end - 60);
        v28 = *(_OWORD *)((char *)end - 44);
        v29 = *(_OWORD *)((char *)end - 28);
        *((_OWORD *)v20 - 1) = *((_OWORD *)end - 1);
        *(_OWORD *)(v20 - 28) = v29;
        *(_OWORD *)(v20 - 44) = v28;
        *(_OWORD *)(v20 - 60) = v27;
        v20 -= 60;
        end = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end - 60);
      }
      while (end != begin);
      end = *p_value;
    }
    self->mFrameInfo.__begin_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v20;
    self->mFrameInfo.__end_ = v12;
    self->mFrameInfo.__end_cap_.__value_ = v21;
    if (end)
      operator delete(end);
  }
  else
  {
    v9 = *(_OWORD *)a3->var0;
    v10 = *(_OWORD *)&a3->var0[4];
    v11 = *(_OWORD *)&a3->var0[8];
    *(_OWORD *)((char *)v8 + 44) = *(_OWORD *)((char *)&a3->var1.var0 + 4);
    *((_OWORD *)v8 + 1) = v10;
    *((_OWORD *)v8 + 2) = v11;
    *(_OWORD *)v8 = v9;
    v12 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v8 + 60);
  }
  self->mFrameInfo.__end_ = v12;
  ++self->numFrames;
}

- (void)getFrameInfo:(unsigned int)a3 frameInfo:(id *)a4
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  __int128 *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  begin = self->mFrameInfo.__begin_;
  if (0xEEEEEEEEEEEEEEEFLL * ((self->mFrameInfo.__end_ - begin) >> 2) <= a3)
  {
    sub_1D4C89658((uint64_t)a4);
    v10 = MEMORY[0x1E0CA2E68];
    *(_OWORD *)&a4->var0[9] = *MEMORY[0x1E0CA2E68];
    *(_QWORD *)&a4->var1.var2 = *(_QWORD *)(v10 + 16);
  }
  else
  {
    v6 = (__int128 *)((char *)begin + 60 * a3);
    v7 = *v6;
    v8 = v6[1];
    v9 = v6[2];
    *(_OWORD *)((char *)&a4->var1.var0 + 4) = *(__int128 *)((char *)v6 + 44);
    *(_OWORD *)&a4->var0[4] = v8;
    *(_OWORD *)&a4->var0[8] = v9;
    *(_OWORD *)a4->var0 = v7;
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeForFrame:(SEL)a3
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v7;

  v4 = *(_QWORD *)&self->var1;
  v5 = 0xEEEEEEEEEEEEEEEFLL * ((self->var3 - v4) >> 2);
  v6 = v4 + 60 * a4 + 36;
  if (v5 <= a4)
    v7 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)MEMORY[0x1E0CA2E68];
  else
    v7 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)v6;
  *retstr = *v7;
  return self;
}

- (BOOL)writeToURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[StabilizeParams infoAsDict](self, "infoAsDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "writeToURL:atomically:", v4, 1);
  else
    v7 = 0;

  return v7;
}

- (id)infoAsDict
{
  unint64_t i;
  _OWORD *v4;
  __int128 v5;
  void *v6;
  void *v7;
  double v8;
  uint64_t j;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  _OWORD v27[2];
  _OWORD v28[2];

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", self->numFrames);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < -[StabilizeParams numFrames](self, "numFrames"); ++i)
  {
    v4 = (_OWORD *)((char *)self->mFrameInfo.__begin_ + 60 * i);
    v5 = v4[1];
    v27[0] = *v4;
    v27[1] = v5;
    v28[0] = v4[2];
    *(_OWORD *)((char *)v28 + 12) = *(_OWORD *)((char *)v4 + 44);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    for (j = 0; j != 36; j += 4)
    {
      LODWORD(v8) = *(_DWORD *)((char *)v27 + j);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v10);

    }
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("Homographies"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)((char *)v28 + 4));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("FrameTimeV"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", HIDWORD(v28[0]));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("FrameTimeS"));
    objc_msgSend(v26, "addObject:", v6);

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->version);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("Version"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->cropRect.origin.x);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("CropRectX"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->cropRect.origin.y);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, CFSTR("CropRectY"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->cropRect.size.width);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, CFSTR("CropRectWidth"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->cropRect.size.height);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, CFSTR("CropRectHeight"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(&self->version + 1));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, CFSTR("ROIStartV"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", HIDWORD(self->roiStart.value));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v20, CFSTR("ROIStartS"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(int64_t *)((char *)&self->roiStart.epoch + 4));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v21, CFSTR("ROILengthV"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", HIDWORD(self->roiLength.value));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v22, CFSTR("ROILengthS"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->passThrough);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v23, CFSTR("PassThrough"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->sparseFrames);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v24, CFSTR("Sparse"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v26, CFSTR("FrameArray"));

  return v13;
}

- (id)initFromDict:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  StabilizeParams *v8;
  void *v9;
  void *v10;
  CGFloat v11;
  void *v12;
  CGFloat v13;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  unint64_t i;
  void *v30;
  void *v31;
  void *v32;
  uint64_t j;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  int v38;
  _OWORD *v39;
  __int128 v40;
  void *v41;
  _OWORD v42[2];
  _BYTE v43[28];

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Version"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    NSLog(CFSTR("StabilizeParams: no version; probably not a StabilizeParams file"));
    goto LABEL_16;
  }
  v7 = objc_msgSend(v5, "unsignedIntegerValue");
  self->version = v7;
  if (v7 <= 1)
  {
    NSLog(CFSTR("StabilizeParams: incompatible version (%u)"), v7);
    v8 = 0;
    v9 = v6;
    goto LABEL_17;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CropRectX"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    NSLog(CFSTR("StabilizeParams: malformed dictionary (CROP_RECT_X)"));
    goto LABEL_16;
  }
  objc_msgSend(v10, "doubleValue");
  self->cropRect.origin.x = v11;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CropRectY"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    NSLog(CFSTR("StabilizeParams: malformed dictionary (CROP_RECT_Y)"));
    goto LABEL_16;
  }
  objc_msgSend(v12, "doubleValue");
  self->cropRect.origin.y = v13;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CropRectWidth"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    NSLog(CFSTR("StabilizeParams: malformed dictionary (CROP_RECT_W)"));
    goto LABEL_16;
  }
  objc_msgSend(v14, "doubleValue");
  self->cropRect.size.width = v15;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CropRectHeight"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    NSLog(CFSTR("StabilizeParams: malformed dictionary (CROP_RECT_H)"));
    goto LABEL_16;
  }
  objc_msgSend(v9, "doubleValue");
  self->cropRect.size.height = v16;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ROIStartV"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ROIStartS"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = sub_1D4C900DC(v17, v18, (CMTime *)(&self->version + 1));

  if (v19
    || (objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ROILengthV")),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ROILengthS")),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v22 = sub_1D4C900DC(v20, v21, (CMTime *)((char *)&self->roiStart.epoch + 4)),
        v21,
        v20,
        v22))
  {
    v8 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PassThrough"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    NSLog(CFSTR("StabilizeParams: malformed dictionary (PASS_THROUGH)"));
    goto LABEL_16;
  }
  self->passThrough = objc_msgSend(v24, "BOOLValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Sparse"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    if (self->version < 3)
      goto LABEL_24;
    NSLog(CFSTR("StabilizeParams: malformed dictionary (SPARSE)"));
LABEL_16:
    v9 = 0;
    v8 = 0;
    goto LABEL_17;
  }
  self->sparseFrames = objc_msgSend(v9, "BOOLValue");
LABEL_24:
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FrameArray"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  v41 = v25;
  if (v25)
  {
    v27 = objc_msgSend(v25, "count");
    begin = self->mFrameInfo.__begin_;
    self->numFrames = v27;
    self->mFrameInfo.__end_ = begin;
    sub_1D4C90194((uint64_t)&self->mFrameInfo, v27);
    for (i = 0; ; ++i)
    {
      if (i >= -[StabilizeParams numFrames](self, "numFrames"))
      {
        v8 = self;
        goto LABEL_39;
      }
      objc_msgSend(v26, "objectAtIndexedSubscript:", i);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("Homographies"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (!v31)
      {
        NSLog(CFSTR("StabilizeParams: malformed dictionary (HOMOGRAPHIES)"));
        goto LABEL_37;
      }
      if (objc_msgSend(v31, "count") != 9)
        break;
      for (j = 0; j != 9; ++j)
      {
        objc_msgSend(v32, "objectAtIndexedSubscript:", j);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "floatValue");
        *((_DWORD *)v42 + j) = v35;

      }
      objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("FrameTimeV"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("FrameTimeS"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = sub_1D4C900DC(v36, v37, (CMTime *)&v43[4]);

      if (v38)
        goto LABEL_37;
      v39 = (_OWORD *)((char *)self->mFrameInfo.__begin_ + 60 * i);
      v40 = v42[1];
      *v39 = v42[0];
      v39[1] = v40;
      v39[2] = *(_OWORD *)v43;
      *(_OWORD *)((char *)v39 + 44) = *(_OWORD *)&v43[12];

      v26 = v41;
    }
    NSLog(CFSTR("StabilizeParams: malformed dictionary (FLOATS_PER_HOMOGRAPHY)"));
LABEL_37:

  }
  else
  {
    NSLog(CFSTR("StabilizeParams: malformed dictionary (PER_FRAME_ARRAY)"));
  }
  v8 = 0;
LABEL_39:

LABEL_17:
  return v8;
}

- (void)frameTimes
{
  vector<CMTime, std::allocator<CMTime>> *p_mFrameTimeArray;
  uint64_t v4;
  unint64_t v5;
  char *v6;
  __int128 v8;
  uint64_t v9;

  p_mFrameTimeArray = &self->mFrameTimeArray;
  if (self->mFrameTimeArray.__end_ == self->mFrameTimeArray.__begin_)
  {
    sub_1D4C90268((uint64_t)&self->mFrameTimeArray, self->numFrames);
    if (self->numFrames)
    {
      v4 = 0;
      v5 = 0;
      do
      {
        -[StabilizeParams timeForFrame:](self, "timeForFrame:", v5);
        v6 = (char *)self->mFrameTimeArray.__begin_ + v4;
        *((_QWORD *)v6 + 2) = v9;
        *(_OWORD *)v6 = v8;
        ++v5;
        v4 += 24;
      }
      while (v5 < self->numFrames);
    }
  }
  return p_mFrameTimeArray;
}

+ (id)stabilizeParamsFromNSDictionary:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[StabilizeParams initFromDict:]([StabilizeParams alloc], "initFromDict:", v3);

  return v4;
}

- (unsigned)numFrames
{
  return self->numFrames;
}

- (CGRect)cropRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->cropRect, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setCropRect:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->cropRect, &v3, 32, 1, 0);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)roiStart
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->version + 1, 24, 1, 0);
  return result;
}

- (void)setRoiStart:(id *)a3
{
  objc_copyStruct(&self->version + 1, a3, 24, 1, 0);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)roiLength
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, (char *)&self->roiStart.epoch + 4, 24, 1, 0);
  return result;
}

- (void)setRoiLength:(id *)a3
{
  objc_copyStruct((char *)&self->roiStart.epoch + 4, a3, 24, 1, 0);
}

- (BOOL)passThrough
{
  return self->passThrough;
}

- (void)setPassThrough:(BOOL)a3
{
  self->passThrough = a3;
}

- (BOOL)sparseFrames
{
  return self->sparseFrames;
}

- (void)setSparseFrames:(BOOL)a3
{
  self->sparseFrames = a3;
}

- (unsigned)version
{
  return self->version;
}

- (void).cxx_destruct
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v4;

  begin = self->mFrameTimeArray.__begin_;
  if (begin)
  {
    self->mFrameTimeArray.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->mFrameInfo.__begin_;
  if (v4)
  {
    self->mFrameInfo.__end_ = v4;
    operator delete(v4);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
