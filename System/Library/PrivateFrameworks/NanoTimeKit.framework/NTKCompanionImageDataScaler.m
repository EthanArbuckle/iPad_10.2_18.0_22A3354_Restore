@implementation NTKCompanionImageDataScaler

- (NTKCompanionImageDataScaler)initWithSize:(CGSize)a3 crop:(CGRect)a4 data:(id)a5 orientation:(int64_t)a6 type:(id)a7 outputSize:(CGSize)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat v13;
  CGFloat v14;
  CGFloat y;
  CGFloat x;
  CGFloat v17;
  CGFloat v18;
  id v20;
  id v21;
  NTKCompanionImageDataScaler *v22;
  NTKCompanionImageDataScaler *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  int v30;
  NSObject *v31;
  objc_super v33;

  height = a8.height;
  width = a8.width;
  v13 = a4.size.height;
  v14 = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v17 = a3.height;
  v18 = a3.width;
  v20 = a5;
  v21 = a7;
  v33.receiver = self;
  v33.super_class = (Class)NTKCompanionImageDataScaler;
  v22 = -[NTKCompanionImageDataScaler init](&v33, sel_init);
  v23 = v22;
  if (v22)
  {
    v22->_inputSize.width = v18;
    v22->_inputSize.height = v17;
    v22->_inputCrop.origin.x = x;
    v22->_inputCrop.origin.y = y;
    v22->_inputCrop.size.width = v14;
    v22->_inputCrop.size.height = v13;
    objc_storeStrong((id *)&v22->_data, a5);
    v23->_orientation = a6;
    objc_storeStrong((id *)&v23->_type, a7);
    v23->_outputSize.width = width;
    v23->_outputSize.height = height;
    objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x1E0CEC508], "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UTType identifier](v23->_type, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isEqualToString:", v24);

    if (v27)
    {
      v28 = 0x3FEB333333333333;
    }
    else
    {
      -[UTType identifier](v23->_type, "identifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "isEqualToString:", v25);

      if (!v30)
      {
        _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          -[NTKCompanionImageDataScaler initWithSize:crop:data:orientation:type:outputSize:].cold.1((id *)&v23->_type, v31);

        v23 = 0;
        goto LABEL_10;
      }
      v28 = 0x3FECCCCCCCCCCCCDLL;
    }
    *(_QWORD *)&v23->_compressionQuality = v28;
LABEL_10:

  }
  return v23;
}

- (NTKCompanionImageDataScaler)initWithSize:(CGSize)a3 crop:(CGRect)a4 data:(id)a5 orientation:(int64_t)a6 outputSize:(CGSize)a7
{
  return -[NTKCompanionImageDataScaler initWithSize:crop:data:orientation:type:outputSize:](self, "initWithSize:crop:data:orientation:type:outputSize:", a5, a6, *MEMORY[0x1E0CEC530], a3.width, a3.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a7.width, a7.height);
}

- (void)cropAndScaleWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_get_global_queue(25, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__NTKCompanionImageDataScaler_cropAndScaleWithCompletion___block_invoke;
  v7[3] = &unk_1E6BD00B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __58__NTKCompanionImageDataScaler_cropAndScaleWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  const __CFData *v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  CGImageSource *v26;
  CGImageSource *v27;
  CGImage *ImageAtIndex;
  CGImage *v29;
  double v30;
  double v31;
  double v32;
  size_t Width;
  size_t Height;
  CGImageRef v35;
  CGImage *v36;
  __CFData *v37;
  __CFString *v38;
  CGImageDestination *v39;
  double v40;
  uint64_t ImageOrientation;
  void *v42;
  void *v43;
  double v44;
  uint64_t v45;
  void *v46;
  const __CFDictionary *v47;
  const __CFData *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  id v57;
  CGImageSourceRef v58;
  CGImageSource *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  void *v67;
  const __CFDictionary *v68;
  CGImageRef ThumbnailAtIndex;
  CGImage *v70;
  CGImageRef v71;
  CGImage *v72;
  __CFData *v73;
  __CFString *v74;
  CGImageDestination *v75;
  double v76;
  void *v77;
  void *v78;
  const __CFDictionary *v79;
  NSObject *v80;
  NSObject *v81;
  NSObject *v82;
  NSObject *v83;
  NSObject *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  id v88;
  double v89;
  double v90;
  double v91;
  id v92;
  void *v93;
  void *v94;
  double v95;
  void *v96;
  _QWORD block[5];
  id v98;
  void *v99;
  void *v100;
  CGFloat v101;
  uint64_t v102;
  CGAffineTransform v103;
  CGAffineTransform v104;
  _QWORD v105[3];
  CGAffineTransform buf;
  uint64_t v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;

  v107 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 16))
  {
    v3 = *(double *)(v2 + 64);
    v4 = *(double *)(v2 + 72);
    v5 = *(double *)(v2 + 96);
    v6 = *(double *)(v2 + 104);
    v7 = v3 / v4 * v6;
    if (v7 >= v5)
      v7 = *(double *)(v2 + 96);
    v8 = v5 / (v3 / v4);
    if (v8 >= v6)
      v8 = *(double *)(v2 + 104);
    v9 = (uint64_t)(v8 * v7);
    v10 = v3 / v7;
    v11 = v4 / v8;
    if (v10 < v11)
      v10 = v11;
    v12 = (uint64_t)(v10 * (*(double *)(v2 + 56) * (*(double *)(v2 + 48) * v10)));
    _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.a) = 134218240;
      *(double *)((char *)&buf.a + 4) = (double)v9 * 0.000000953674316;
      WORD2(buf.b) = 2048;
      *(double *)((char *)&buf.b + 6) = (double)v12 * 0.000000953674316;
      _os_log_impl(&dword_1B72A3000, v13, OS_LOG_TYPE_DEFAULT, "cropThenScale ==> %.3f MP; scaleThenCrop ==> %.3f MP",
        (uint8_t *)&buf,
        0x16u);
    }

    v14 = (void *)MEMORY[0x1BCCA7FA8]();
    v15 = *(_QWORD *)(a1 + 32);
    if (v9 >= v12)
    {
      v48 = *(const __CFData **)(v15 + 24);
      v49 = *(double *)(v15 + 8);
      v50 = *(double *)(v15 + 48);
      v51 = *(double *)(v15 + 56);
      v52 = *(double *)(v15 + 88);
      v95 = *(double *)(v15 + 80);
      v54 = *(double *)(v15 + 96);
      v53 = *(double *)(v15 + 104);
      v55 = *(double *)(v15 + 64);
      v56 = *(double *)(v15 + 72);
      v57 = *(id *)(v15 + 40);
      v58 = CGImageSourceCreateWithData(v48, 0);
      if (v58)
      {
        v59 = v58;
        v90 = v55;
        v91 = v52;
        v89 = v49;
        if (v53 * (v55 / v56) >= v54)
          v60 = v54;
        else
          v60 = v53 * (v55 / v56);
        if (v54 / (v55 / v56) >= v53)
          v61 = v53;
        else
          v61 = v54 / (v55 / v56);
        if (v55 / v60 >= v56 / v61)
          v62 = v55 / v60;
        else
          v62 = v56 / v61;
        v63 = v50 * v62;
        if (v50 * v62 < v51 * v62)
          v63 = v51 * v62;
        v64 = *MEMORY[0x1E0CBD178];
        v65 = MEMORY[0x1E0C9AAB0];
        *(_QWORD *)&v104.a = MEMORY[0x1E0C9AAB0];
        v66 = *MEMORY[0x1E0CBD2A0];
        v103.a = v64;
        v103.b = v66;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", ceil(v63));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v103.c = *(CGFloat *)MEMORY[0x1E0CBD190];
        *(_QWORD *)&v104.b = v67;
        v104.c = v65;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v104, &v103, 3);
        v68 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

        ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v59, 0, v68);
        if (ThumbnailAtIndex)
        {
          v70 = ThumbnailAtIndex;
          v93 = v57;
          CGAffineTransformMakeScale(&buf, v62, v62);
          v110.origin.x = v95 + fmax((v54 - v60) * 0.5, 0.0);
          v110.origin.y = v91 + fmax((v53 - v61) * 0.5, 0.0);
          v110.size.width = v60;
          v110.size.height = v61;
          v111 = CGRectApplyAffineTransform(v110, &buf);
          v111.origin.x = rint(v111.origin.x);
          v111.origin.y = rint(v111.origin.y);
          v111.size.width = rint(v90);
          v111.size.height = rint(v56);
          v71 = CGImageCreateWithImageInRect(v70, v111);
          if (v71)
          {
            v72 = v71;
            v96 = v14;
            objc_msgSend(MEMORY[0x1E0C99DF0], "data");
            v73 = (__CFData *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "identifier");
            v74 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v75 = CGImageDestinationCreateWithData(v73, v74, 1uLL, 0);

            if (v75)
            {
              if (v90 >= v56)
                v76 = v90;
              else
                v76 = v56;
              v105[0] = *MEMORY[0x1E0CBC780];
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v89);
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              v99 = v77;
              v105[1] = *MEMORY[0x1E0CBC778];
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v76);
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              v105[2] = *MEMORY[0x1E0CBC7C0];
              v100 = v78;
              v101 = v65;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v99, v105, 3);
              v79 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

              CGImageDestinationAddImage(v75, v72, v79);
              CGImageDestinationFinalize(v75);
              CFRelease(v75);
            }
            else
            {

              _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
              v79 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled((os_log_t)v79, OS_LOG_TYPE_ERROR))
                __58__NTKCompanionImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_4();
              v73 = 0;
            }
            v14 = v96;

            CFRelease(v72);
          }
          else
          {
            _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
            v84 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
              __58__NTKCompanionImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_3();

            v73 = 0;
          }
          CFRelease(v70);
          v57 = v93;
        }
        else
        {
          _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
          v82 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
            __58__NTKCompanionImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_6();

          v73 = 0;
        }
        CFRelease(v59);
      }
      else
      {
        _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
        v68 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v68, OS_LOG_TYPE_ERROR))
          __58__NTKCompanionImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_1();
        v73 = 0;
      }

      v87 = *(_QWORD *)(a1 + 32);
      v86 = *(void **)(v87 + 16);
      *(_QWORD *)(v87 + 16) = v73;
    }
    else
    {
      v16 = *(const __CFData **)(v15 + 24);
      v17 = *(_QWORD *)(v15 + 32);
      v18 = *(double *)(v15 + 8);
      v19 = *(double *)(v15 + 80);
      v20 = *(double *)(v15 + 88);
      v21 = *(double *)(v15 + 96);
      v22 = *(double *)(v15 + 104);
      v23 = *(double *)(v15 + 64);
      v24 = *(double *)(v15 + 72);
      v25 = *(id *)(v15 + 40);
      v26 = CGImageSourceCreateWithData(v16, 0);
      if (v26)
      {
        v27 = v26;
        ImageAtIndex = CGImageSourceCreateImageAtIndex(v26, 0, 0);
        if (ImageAtIndex)
        {
          v29 = ImageAtIndex;
          if (v22 * (v23 / v24) >= v21)
            v30 = v21;
          else
            v30 = v22 * (v23 / v24);
          v31 = v19 + fmax((v21 - v30) * 0.5, 0.0);
          if (v21 / (v23 / v24) >= v22)
            v32 = v22;
          else
            v32 = v21 / (v23 / v24);
          Width = CGImageGetWidth(ImageAtIndex);
          Height = CGImageGetHeight(v29);
          memset(&buf, 0, sizeof(buf));
          NTKImagePresentationTransform(v17, Width, Height, (uint64_t)&v104);
          CGAffineTransformInvert(&buf, &v104);
          v103 = buf;
          v108.origin.x = v31;
          v108.origin.y = v20 + fmax((v22 - v32) * 0.5, 0.0);
          v108.size.width = v30;
          v108.size.height = v32;
          v109 = CGRectApplyAffineTransform(v108, &v103);
          v35 = CGImageCreateWithImageInRect(v29, v109);
          if (v35)
          {
            v36 = v35;
            v94 = v14;
            objc_msgSend(MEMORY[0x1E0C99DF0], "data");
            v37 = (__CFData *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "identifier");
            v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v39 = CGImageDestinationCreateWithData(v37, v38, 1uLL, 0);

            if (v39)
            {
              if (v23 >= v24)
                v40 = v23;
              else
                v40 = v24;
              ImageOrientation = getImageOrientation(v27);
              v99 = (void *)*MEMORY[0x1E0CBC780];
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              *(_QWORD *)&v103.a = v42;
              v100 = (void *)*MEMORY[0x1E0CBC778];
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v40);
              v92 = v25;
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = *MEMORY[0x1E0CBC7C0];
              *(_QWORD *)&v103.b = v43;
              *(_QWORD *)&v103.c = MEMORY[0x1E0C9AAB0];
              v45 = *MEMORY[0x1E0CBCFF0];
              v101 = v44;
              v102 = v45;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", ImageOrientation);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              *(_QWORD *)&v103.d = v46;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v103, &v99, 4);
              v47 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

              v25 = v92;
              CGImageDestinationAddImage(v39, v36, v47);
              CGImageDestinationFinalize(v39);
              CFRelease(v39);
            }
            else
            {

              _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
              v47 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled((os_log_t)v47, OS_LOG_TYPE_ERROR))
                __58__NTKCompanionImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_4();
              v37 = 0;
            }

            CFRelease(v36);
            v14 = v94;
          }
          else
          {
            _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
            v83 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
              __58__NTKCompanionImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_3();

            v37 = 0;
          }
          CFRelease(v29);
        }
        else
        {
          _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
          v81 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
            __58__NTKCompanionImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_2();

          v37 = 0;
        }
        CFRelease(v27);
      }
      else
      {
        _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
        v80 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
          __58__NTKCompanionImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_1();

        v37 = 0;
      }

      v85 = *(_QWORD *)(a1 + 32);
      v86 = *(void **)(v85 + 16);
      *(_QWORD *)(v85 + 16) = v37;
    }

    objc_autoreleasePoolPop(v14);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__NTKCompanionImageDataScaler_cropAndScaleWithCompletion___block_invoke_1;
  block[3] = &unk_1E6BCE3C8;
  v88 = *(id *)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v98 = v88;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __58__NTKCompanionImageDataScaler_cropAndScaleWithCompletion___block_invoke_1(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

- (CGSize)inputSize
{
  double width;
  double height;
  CGSize result;

  width = self->_inputSize.width;
  height = self->_inputSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGRect)inputCrop
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_inputCrop.origin.x;
  y = self->_inputCrop.origin.y;
  width = self->_inputCrop.size.width;
  height = self->_inputCrop.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSData)data
{
  return self->_data;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (UTType)type
{
  return self->_type;
}

- (CGSize)outputSize
{
  double width;
  double height;
  CGSize result;

  width = self->_outputSize.width;
  height = self->_outputSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_outputData, 0);
}

- (void)initWithSize:(id *)a1 crop:(NSObject *)a2 data:orientation:type:outputSize:.cold.1(id *a1, NSObject *a2)
{
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 136315394;
  v5 = "-[NTKCompanionImageDataScaler initWithSize:crop:data:orientation:type:outputSize:]";
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_ERROR, "%s only supports JPEG and HEIC; not %@",
    (uint8_t *)&v4,
    0x16u);

}

void __58__NTKCompanionImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_5(&dword_1B72A3000, v0, v1, "Could not create imageSourceRef", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_1();
}

void __58__NTKCompanionImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_5(&dword_1B72A3000, v0, v1, "Could not create originalImageRef", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_1();
}

void __58__NTKCompanionImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_5(&dword_1B72A3000, v0, v1, "Could not create croppedImageRef", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_1();
}

void __58__NTKCompanionImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_5(&dword_1B72A3000, v0, v1, "Could not create imageDestinationRef", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_1();
}

void __58__NTKCompanionImageDataScaler_cropAndScaleWithCompletion___block_invoke_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_5(&dword_1B72A3000, v0, v1, "Could not create thumbnailImageRef", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_1();
}

@end
