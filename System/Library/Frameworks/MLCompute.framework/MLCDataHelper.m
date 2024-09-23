@implementation MLCDataHelper

+ (id)createDataWithFloatValue:(float)a3 count:(unint64_t)a4
{
  unint64_t v6;
  float *v7;
  unint64_t v8;
  unsigned int v9;

  v6 = 4 * a4;
  v7 = (float *)malloc_type_malloc(4 * a4, 0x36545FCuLL);
  if (a4)
  {
    v8 = 0;
    v9 = 1;
    do
    {
      v7[v8] = a3;
      v8 = v9++;
    }
    while (v8 < a4);
  }
  return +[MLCTensorData dataWithBytesNoCopy:length:freeWhenDone:](MLCTensorData, "dataWithBytesNoCopy:length:freeWhenDone:", v7, v6, 1);
}

+ (void)fillData:(id)a3 withFloatValue:(float)a4
{
  float *v5;
  unint64_t v6;
  unint64_t v7;
  id v8;

  v8 = objc_retainAutorelease(a3);
  v5 = (float *)objc_msgSend(v8, "bytes");
  v6 = objc_msgSend(v8, "length");
  if (v6 >= 4)
  {
    v7 = v6 >> 2;
    do
    {
      *v5++ = a4;
      --v7;
    }
    while (v7);
  }

}

+ (BOOL)convertFp16toFp32:(id)a1 fp16Values:(SEL)a2 fp32Values:(unint64_t)a3
{
  void *v3;
  void *v4;
  vImage_Buffer v6;
  vImage_Buffer src;

  src.data = v3;
  src.height = 1;
  src.width = a3;
  src.rowBytes = 2 * a3;
  v6.data = v4;
  v6.height = 1;
  v6.width = a3;
  v6.rowBytes = 4 * a3;
  return vImageConvert_Planar16FtoPlanarF(&src, &v6, 0) == 0;
}

+ (BOOL)convertFp32toFp16:(unint64_t)a3 fp32Values:(const float *)a4 fp16Values:
{
  void *v4;
  vImage_Buffer v6;
  vImage_Buffer src;

  src.data = (void *)a4;
  src.height = 1;
  src.width = a3;
  src.rowBytes = 4 * a3;
  v6.data = v4;
  v6.height = 1;
  v6.width = a3;
  v6.rowBytes = 2 * a3;
  return vImageConvert_PlanarFtoPlanar16F(&src, &v6, 0) == 0;
}

+ (void)copySource:(const void *)a3 toTarget:(void *)a4 sourceOffset:(unint64_t)a5 targetOffset:(unint64_t)a6 sizeToCopy:(unint64_t)a7
{
  memcpy((char *)a4 + a6, (char *)a3 + a5, a7);
}

+ (BOOL)convertOIHWtoIOHW:(id)a3 sourceOIHW:(const void *)a4 resultIOHW:(void *)a5 inputFeatureChannelCount:(unint64_t)a6 outputFeatureChannelCount:(unint64_t)a7
{
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t i;
  NSObject *v37;
  void *v39;
  unint64_t v40;
  uint64_t v41;
  void *v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  SEL aSelectora;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  unint64_t v53;
  __int16 v54;
  unint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  objc_msgSend(v12, "descriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "shape");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "unsignedIntegerValue");

  v45 = a7;
  v40 = a7 * a6;
  v41 = v16;
  v42 = v12;
  if (v16 == a7 * a6)
  {
    objc_msgSend(v12, "descriptor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "shape");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectAtIndexedSubscript:", 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "unsignedIntegerValue");

    objc_msgSend(v12, "descriptor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "shape");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectAtIndexedSubscript:", 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "unsignedIntegerValue");

    objc_msgSend(v12, "descriptor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "dataType");

    v27 = +[MLCTensorDescriptor elementByteCount:](MLCTensorDescriptor, "elementByteCount:", v26);
    if (a6)
    {
      v28 = 0;
      v29 = 0;
      v30 = 0;
      v31 = v24 * v20 * v27;
      v32 = v27 * v24 * v20;
      v33 = v32 * a6;
      v43 = v32 * v45;
      v44 = a6;
      do
      {
        aSelectora = v30;
        v34 = v28;
        v35 = v29;
        for (i = v45; i; --i)
        {
          objc_msgSend(a1, "copySource:toTarget:sourceOffset:targetOffset:sizeToCopy:", a4, a5, v35, v34, v31);
          v35 += v33;
          v34 += v31;
        }
        v30 = aSelectora + 1;
        v29 += v31;
        v28 += v43;
      }
      while (aSelectora + 1 != (SEL)v44);
    }
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v49 = v39;
      v50 = 2048;
      v51 = v16;
      v52 = 2048;
      v53 = a6;
      v54 = 2048;
      v55 = a7;
      _os_log_error_impl(&dword_1D4999000, v37, OS_LOG_TYPE_ERROR, "%@: channel count of the weights=%lu does not match the multiplication of inputFeatureChannelCount=%lu and outputFeatureChannelCount=%lu", buf, 0x2Au);

    }
  }

  return v41 == v40;
}

+ (BOOL)convertSourceOIHW:(const void *)a3 toResultHWIO:(void *)a4 width:(unint64_t)a5 height:(unint64_t)a6 inputFeatureChannelCount:(unint64_t)a7 outputFeatureChannelCount:(unint64_t)a8 dataType:(int)a9
{
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t i;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v39;

  v13 = +[MLCTensorDescriptor elementByteCount:](MLCTensorDescriptor, "elementByteCount:", a9);
  v26 = a8;
  if (a8)
  {
    v14 = v13;
    v28 = 0;
    v29 = 0;
    v15 = 0;
    v25 = v13 * a7 * a6 * a5;
    v36 = v13 * a5;
    v31 = v13 * a5 * a6;
    v30 = v13 * a8;
    v16 = v13 * a8 * a7;
    do
    {
      v27 = v15;
      if (a7)
      {
        v17 = 0;
        v34 = v28;
        v35 = v29;
        do
        {
          v33 = v17;
          if (a6)
          {
            v18 = 0;
            v20 = v34;
            v19 = v35;
            do
            {
              v39 = v18;
              v21 = v19;
              v22 = v20;
              for (i = a5; i; --i)
              {
                objc_msgSend(a1, "copySource:toTarget:sourceOffset:targetOffset:sizeToCopy:", a3, a4, v22, v21, v14, v25);
                v22 += v14;
                v21 += v16;
              }
              v18 = v39 + 1;
              v20 += v36;
              v19 += v16 * a5;
            }
            while (v39 + 1 != a6);
          }
          v17 = v33 + 1;
          v34 += v31;
          v35 += v30;
        }
        while (v33 + 1 != a7);
      }
      v15 = v27 + 1;
      v28 += v25;
      v29 += v14;
    }
    while (v27 + 1 != v26);
  }
  return 1;
}

+ (BOOL)convertSourceOIHW:(const void *)a3 toResultHWOI:(void *)a4 width:(unint64_t)a5 height:(unint64_t)a6 inputFeatureChannelCount:(unint64_t)a7 outputFeatureChannelCount:(unint64_t)a8 dataType:(int)a9
{
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t i;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v39;

  v13 = +[MLCTensorDescriptor elementByteCount:](MLCTensorDescriptor, "elementByteCount:", a9);
  v27 = a8;
  if (a8)
  {
    v14 = v13;
    v29 = 0;
    v30 = 0;
    v15 = 0;
    v25 = v13 * a7 * a6 * a5;
    v26 = v13 * a7;
    v36 = v13 * a5;
    v31 = v13 * a5 * a6;
    v16 = v13 * a7 * a8;
    do
    {
      v28 = v15;
      if (a7)
      {
        v17 = 0;
        v34 = v29;
        v35 = v30;
        do
        {
          v33 = v17;
          if (a6)
          {
            v18 = 0;
            v20 = v34;
            v19 = v35;
            do
            {
              v39 = v18;
              v21 = v19;
              v22 = v20;
              for (i = a5; i; --i)
              {
                objc_msgSend(a1, "copySource:toTarget:sourceOffset:targetOffset:sizeToCopy:", a3, a4, v22, v21, v14, v25, v26);
                v22 += v14;
                v21 += v16;
              }
              v18 = v39 + 1;
              v20 += v36;
              v19 += v16 * a5;
            }
            while (v39 + 1 != a6);
          }
          v17 = v33 + 1;
          v34 += v31;
          v35 += v14;
        }
        while (v33 + 1 != a7);
      }
      v15 = v28 + 1;
      v29 += v25;
      v30 += v26;
    }
    while (v28 + 1 != v27);
  }
  return 1;
}

+ (BOOL)convertSourceHWIO:(const void *)a3 toResultOIHW:(void *)a4 width:(unint64_t)a5 height:(unint64_t)a6 inputFeatureChannelCount:(unint64_t)a7 outputFeatureChannelCount:(unint64_t)a8 dataType:(int)a9
{
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t i;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v39;

  v13 = +[MLCTensorDescriptor elementByteCount:](MLCTensorDescriptor, "elementByteCount:", a9);
  v26 = a8;
  if (a8)
  {
    v14 = v13;
    v28 = 0;
    v29 = 0;
    v15 = 0;
    v25 = v13 * a7 * a6 * a5;
    v36 = v13 * a5;
    v31 = v13 * a5 * a6;
    v30 = v13 * a8;
    v16 = v13 * a8 * a7;
    do
    {
      v27 = v15;
      if (a7)
      {
        v17 = 0;
        v34 = v28;
        v35 = v29;
        do
        {
          v33 = v17;
          if (a6)
          {
            v18 = 0;
            v20 = v34;
            v19 = v35;
            do
            {
              v39 = v18;
              v21 = v19;
              v22 = v20;
              for (i = a5; i; --i)
              {
                objc_msgSend(a1, "copySource:toTarget:sourceOffset:targetOffset:sizeToCopy:", a3, a4, v21, v22, v14, v25);
                v22 += v14;
                v21 += v16;
              }
              v18 = v39 + 1;
              v20 += v36;
              v19 += v16 * a5;
            }
            while (v39 + 1 != a6);
          }
          v17 = v33 + 1;
          v34 += v31;
          v35 += v30;
        }
        while (v33 + 1 != a7);
      }
      v15 = v27 + 1;
      v28 += v25;
      v29 += v14;
    }
    while (v27 + 1 != v26);
  }
  return 1;
}

+ (BOOL)convertSourceHWOI:(const void *)a3 toResultOIHW:(void *)a4 width:(unint64_t)a5 height:(unint64_t)a6 inputFeatureChannelCount:(unint64_t)a7 outputFeatureChannelCount:(unint64_t)a8 dataType:(int)a9
{
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t i;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v39;

  v13 = +[MLCTensorDescriptor elementByteCount:](MLCTensorDescriptor, "elementByteCount:", a9);
  v27 = a8;
  if (a8)
  {
    v14 = v13;
    v29 = 0;
    v30 = 0;
    v15 = 0;
    v25 = v13 * a7 * a6 * a5;
    v26 = v13 * a7;
    v36 = v13 * a5;
    v31 = v13 * a5 * a6;
    v16 = v13 * a7 * a8;
    do
    {
      v28 = v15;
      if (a7)
      {
        v17 = 0;
        v34 = v29;
        v35 = v30;
        do
        {
          v33 = v17;
          if (a6)
          {
            v18 = 0;
            v20 = v34;
            v19 = v35;
            do
            {
              v39 = v18;
              v21 = v19;
              v22 = v20;
              for (i = a5; i; --i)
              {
                objc_msgSend(a1, "copySource:toTarget:sourceOffset:targetOffset:sizeToCopy:", a3, a4, v21, v22, v14, v25, v26);
                v22 += v14;
                v21 += v16;
              }
              v18 = v39 + 1;
              v20 += v36;
              v19 += v16 * a5;
            }
            while (v39 + 1 != a6);
          }
          v17 = v33 + 1;
          v34 += v31;
          v35 += v14;
        }
        while (v33 + 1 != a7);
      }
      v15 = v28 + 1;
      v29 += v25;
      v30 += v26;
    }
    while (v28 + 1 != v27);
  }
  return 1;
}

@end
