@implementation SLImageDownsampling

+ (id)downsampleImageData:(id)a3 toMaxByteSize:(unint64_t)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  uint64_t v21;
  double v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  __CFString *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "length"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v4, 7, CFSTR("SLImageDownsampling downsampleImageData: length %@ toMaxByteSize: %@"));

  if (objc_msgSend(v6, "length", v7, v33) < a4)
  {
    _SLLog(v4, 6, CFSTR("SLImageDownsampling image is below threshold, returning original data"));
    v8 = v6;
    goto LABEL_21;
  }
  if (!v6)
  {
    v29 = CFSTR("SLImageDownsampling image data is nil");
LABEL_20:
    _SLLog(v4, 3, v29);
    v8 = 0;
    goto LABEL_21;
  }
  v9 = +[SLImageDownsampling imageSizeWithData:](SLImageDownsampling, "imageSizeWithData:", v6);
  if (!v9 || (v11 = v10) == 0)
  {
    v29 = CFSTR("Image width and/or height is 0, returning nil");
    goto LABEL_20;
  }
  v12 = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v4, 7, CFSTR("SLImageDownsampling original image size width %@ height %@"));

  v14 = (double)a4;
  v15 = sqrt((double)a4 / (double)(unint64_t)objc_msgSend(v6, "length", v13, v34)) * 0.95;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v4, 7, CFSTR("SLImageDownsampling scale %@"));

  v17 = (double)v12;
  v18 = (double)v11;
  do
  {
    v19 = (void *)MEMORY[0x1C3B6C6F0](v16);
    v20 = ceil(v15 * v17);
    if (v20 < 1.0)
      v20 = 1.0;
    v21 = (uint64_t)v20;
    v22 = ceil(v15 * v18);
    if (v22 < 1.0)
      v22 = 1.0;
    v23 = a4;
    v24 = (uint64_t)v22;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15, v31);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v21);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v24);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    _SLLog(v4, 7, CFSTR("SLImageDownsampling trying scale %@ width %@ height %@"));

    SLDownSampledImageData(v6, v21, v24);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15, v25, v26, v36);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "length"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    _SLLog(v4, 7, CFSTR("SLImageDownsampling scale %@ produced image data length %@"));

    a4 = v23;
    if (objc_msgSend(v8, "length", v27, v35) > v23)
    {
      if ((double)(unint64_t)objc_msgSend(v8, "length") * 0.9 <= v14)
        v28 = 0.95;
      else
        v28 = 0.5;
      v15 = v15 * v28;

      v8 = 0;
    }
    objc_autoreleasePoolPop(v19);
  }
  while (!v8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "length"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v4, 7, CFSTR("SLImageDownsampling returning final downsampled image data of length %@"));

LABEL_21:
  return v8;
}

+ ($0AC6E346AE4835514AAA8AC86D8F4844)imageSizeWithData:(id)a3
{
  uint64_t v3;
  CGImageSource *v4;
  const __CFDictionary *v5;
  const __CFNumber *Value;
  const __CFNumber *v7;
  int64_t v8;
  int64_t v9;
  int64_t valuePtr;
  int64_t v11;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  v4 = CGImageSourceCreateWithData((CFDataRef)a3, 0);
  v5 = CGImageSourceCopyPropertiesAtIndex(v4, 0, 0);
  _SLLog(v3, 6, CFSTR("image props: %@"));
  Value = (const __CFNumber *)CFDictionaryGetValue(v5, (const void *)*MEMORY[0x1E0CBD048]);
  v7 = (const __CFNumber *)CFDictionaryGetValue(v5, (const void *)*MEMORY[0x1E0CBD040]);
  valuePtr = 0;
  v11 = 0;
  if (Value)
    CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
  if (v7)
    CFNumberGetValue(v7, kCFNumberIntType, &v11);
  CFRelease(v4);
  CFRelease(v5);
  v8 = valuePtr;
  v9 = v11;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

+ (id)createThumbnailWithData:(id)a3 adjustSmallestSideToSize:(unint64_t)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  void *v16;

  v6 = a3;
  v7 = +[SLImageDownsampling imageSizeWithData:](SLImageDownsampling, "imageSizeWithData:", v6);
  v9 = v8;
  _SLLog(v4, 6, CFSTR("Thumbnail source is %i x %i"));
  if (v7 >= v9)
    v10 = v9;
  else
    v10 = v7;
  v11 = (double)a4 / (double)v10;
  v12 = v11 * (double)v7;
  if ((uint64_t)v12 <= 1)
    v13 = 1;
  else
    v13 = (uint64_t)v12;
  v14 = v11 * (double)v9;
  if ((uint64_t)v14 <= 1)
    v15 = 1;
  else
    v15 = (uint64_t)v14;
  _SLLog(v4, 6, CFSTR("Thumbnail destination is %i x %i"));
  SLDownSampledImageData(v6, v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (void)downsampleImageData:(id)a3 toMaxByteSize:(unint64_t)a4 resultsHandler:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  unint64_t v15;

  v7 = a3;
  v8 = a5;
  dispatch_get_global_queue(25, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__SLImageDownsampling_downsampleImageData_toMaxByteSize_resultsHandler___block_invoke;
  block[3] = &unk_1E7590E80;
  v14 = v8;
  v15 = a4;
  v13 = v7;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, block);

}

void __72__SLImageDownsampling_downsampleImageData_toMaxByteSize_resultsHandler___block_invoke(_QWORD *a1)
{
  id v2;

  +[SLImageDownsampling downsampleImageData:toMaxByteSize:](SLImageDownsampling, "downsampleImageData:toMaxByteSize:", a1[4], a1[6]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(a1[5] + 16))();

}

+ (void)generateThumbnailFromImageData:(id)a3 adjustSmallestSideToSize:(unint64_t)a4 resultsHandler:(id)a5
{
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  unint64_t v15;

  v7 = a3;
  v8 = (void *)objc_msgSend(a5, "copy");
  dispatch_get_global_queue(0, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__SLImageDownsampling_generateThumbnailFromImageData_adjustSmallestSideToSize_resultsHandler___block_invoke;
  block[3] = &unk_1E7590E80;
  v13 = v7;
  v14 = v8;
  v15 = a4;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, block);

}

void __94__SLImageDownsampling_generateThumbnailFromImageData_adjustSmallestSideToSize_resultsHandler___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  id v4;

  v3 = a1[4];
  if (v3)
  {
    +[SLImageDownsampling createThumbnailWithData:adjustSmallestSideToSize:](SLImageDownsampling, "createThumbnailWithData:adjustSmallestSideToSize:", v3, a1[6]);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(a1[5] + 16))();

  }
  else
  {
    _SLLog(v1, 3, CFSTR("Cannot generate thumbnail - image data is nil"));
    (*(void (**)(void))(a1[5] + 16))();
  }
}

@end
