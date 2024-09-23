@implementation VNFaceDetector

+ (void)recordDefaultConfigurationOptionsInDictionary:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___VNFaceDetector;
  objc_msgSendSuper2(&v5, sel_recordDefaultConfigurationOptionsInDictionary_, v4);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("VNFaceDetectorInitOption_EnableLowMemoryMode"));

}

+ (void)fullyPopulateConfigurationOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___VNFaceDetector;
  objc_msgSendSuper2(&v10, sel_fullyPopulateConfigurationOptions_, v4);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("VNFaceDetectorInitOption_MinFaceSize"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("VNDetectorOption_RequestDetectionLevel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntegerValue");

    v8 = &unk_1E459E598;
    if (v7 == 1)
      v8 = &unk_1E459E5A8;
    if (v7 == 2)
      v9 = &unk_1E459E5B8;
    else
      v9 = v8;
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("VNFaceDetectorInitOption_MinFaceSize"));
  }

}

+ (Class)detectorClassForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_8;
  if ((objc_msgSend(v6, "specifiesRequestClass:", objc_opt_class()) & 1) == 0
    || (v7 = objc_msgSend(v6, "requestRevision"), (unint64_t)(v7 - 1) >= 2) && v7 != 3737841665)
  {
    if (a4)
    {
      +[VNError errorForUnsupportedRequestSpecifier:](VNError, "errorForUnsupportedRequestSpecifier:", v6);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  objc_opt_class();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return (Class)v8;
}

+ (id)configurationOptionKeysForDetectorKey
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__VNFaceDetector_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNFaceDetector configurationOptionKeysForDetectorKey]::onceToken != -1)
    dispatch_once(&+[VNFaceDetector configurationOptionKeysForDetectorKey]::onceToken, block);
  return (id)+[VNFaceDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
}

+ (BOOL)shouldDumpDebugIntermediates
{
  if (+[VNFaceDetector shouldDumpDebugIntermediates]::onceToken != -1)
    dispatch_once(&+[VNFaceDetector shouldDumpDebugIntermediates]::onceToken, &__block_literal_global_82);
  return +[VNFaceDetector shouldDumpDebugIntermediates]::dumpDebug;
}

+ (void)printDebugInfo:(id)a3 facesDataRaw:(void *)a4 faceDetectorBGRAImage:(__CVBuffer *)a5 tempImage:(vImage_Buffer *)a6 session:(id)a7
{
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  VNImageBuffer *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  void *v32;
  _DWORD *v33;
  __CVBuffer *v34;
  id v35;
  double v36;
  void *v37;
  double v38;
  void *v39;
  double v40;
  void *v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  __CFString *v53;
  id v54;
  __CFString *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  unint64_t v61;
  const __CFString *v62;
  VNImageBuffer *v63;
  void *v64;
  id v65;
  void *context;
  void *v68;
  _QWORD v69[4];
  _QWORD v70[4];
  _QWORD v71[2];
  _QWORD v72[4];

  v72[2] = *MEMORY[0x1E0C80C00];
  v60 = a3;
  v59 = a7;
  if (+[VNFaceDetector shouldDumpDebugIntermediates](VNFaceDetector, "shouldDumpDebugIntermediates"))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    NSTemporaryDirectory();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingString:", CFSTR("VN_facedetector_debug_intermediates/"));
    v11 = objc_claimAutoreleasedReturnValue();

    v57 = (void *)v11;
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = objc_msgSend(v58, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v12, 1, 0, 0);

    if ((_DWORD)v11)
    {
      objc_msgSend(v60, "fileURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "path");
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v55 = v14;
      if (v14)
      {
        -[__CFString lastPathComponent](v14, "lastPathComponent");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringByDeletingPathExtension");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringByAppendingString:", CFSTR("_"));
        v17 = objc_claimAutoreleasedReturnValue();

        v18 = (const __CFString *)v17;
      }
      else
      {
        v18 = &stru_1E4549388;
      }
      v20 = *(_QWORD *)a4;
      v19 = *((_QWORD *)a4 + 1);
      v53 = (__CFString *)v18;
      objc_msgSend(v57, "stringByAppendingString:");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", +[VNFaceDetector printDebugInfo:facesDataRaw:faceDetectorBGRAImage:tempImage:session:]::image_name_offset);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringValue");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringByAppendingString:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v64 = v24;
      objc_msgSend(v24, "stringByAppendingString:", CFSTR("_fd_image.vdump"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringByAppendingString:", CFSTR("_fd_image.png"));
      v54 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringByAppendingString:", CFSTR("_raw_bboxes.json"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = [VNImageBuffer alloc];
      v63 = -[VNImageBuffer initWithCVPixelBuffer:orientation:options:session:](v25, "initWithCVPixelBuffer:orientation:options:session:", a5, 1, MEMORY[0x1E0C9AA70], v59);
      v26 = (void *)MEMORY[0x1A1B0B060]();
      v52 = objc_retainAutorelease(v50);
      ImageProcessing_save((FILE *)objc_msgSend(v52, "UTF8String"), a6, 4);
      v51 = objc_retainAutorelease(v54);
      saveCVPixelBuffer((const char *)objc_msgSend(v51, "UTF8String"), a5);
      objc_autoreleasePoolPop(v26);
      v65 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      if (v19 != v20)
      {
        v27 = 0;
        v28 = 0;
        v29 = (v19 - v20) / 80;
        v30 = CFSTR("<binary-data>");
        if (v55)
          v30 = v55;
        if (v29 <= 1)
          v29 = 1;
        v61 = v29;
        v62 = v30;
        do
        {
          v31 = *(_QWORD *)a4;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_face_%d"), v64, v28);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "stringByAppendingString:", CFSTR("_raw_bbox_crop.png"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = (_DWORD *)(v31 + v27);
          v34 = -[VNImageBuffer croppedBufferWithWidth:height:format:cropRect:options:error:](v63, "croppedBufferWithWidth:height:format:cropRect:options:error:", (unint64_t)*(float *)(v31 + v27 + 36), (unint64_t)*(float *)(v31 + v27 + 32), 1111970369, MEMORY[0x1E0C9AA70], 0, *(float *)(v31 + v27 + 24), *(float *)(v31 + v27 + 28), *(float *)(v31 + v27 + 36), *(float *)(v31 + v27 + 32));
          context = (void *)MEMORY[0x1A1B0B060]();
          v35 = objc_retainAutorelease(v32);
          saveCVPixelBuffer((const char *)objc_msgSend(v35, "UTF8String"), v34);
          v71[0] = CFSTR("imageURL");
          v71[1] = CFSTR("rect");
          v72[0] = v62;
          v69[0] = CFSTR("x");
          LODWORD(v36) = *(_DWORD *)(v31 + v27 + 24);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v70[0] = v37;
          v69[1] = CFSTR("y");
          LODWORD(v38) = v33[7];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v70[1] = v39;
          v69[2] = CFSTR("width");
          LODWORD(v40) = v33[9];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v70[2] = v41;
          v69[3] = CFSTR("height");
          LODWORD(v42) = v33[8];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v70[3] = v43;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, v69, 4);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v72[1] = v44;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 2);
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v28);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "stringValue");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "setObject:forKey:", v45, v47);

          objc_autoreleasePoolPop(context);
          CVPixelBufferRelease(v34);

          ++v28;
          v27 += 80;
        }
        while (v61 != v28);
      }
      v48 = (void *)MEMORY[0x1A1B0B060]();
      objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v65, 1, 0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "writeToFile:atomically:", v56, 1);

      objc_autoreleasePoolPop(v48);
      NSLog(CFSTR("VN Face detector debug intermediates written to: %@"), v57);
      +++[VNFaceDetector printDebugInfo:facesDataRaw:faceDetectorBGRAImage:tempImage:session:]::image_name_offset;

    }
  }

}

+ (BOOL)calculateTilesForRegionOfInterest:(CGRect)a3 imageWidth:(unint64_t)a4 imageHeight:(unint64_t)a5 tileSizeInPixels:(unint64_t)a6 overlapFraction:(float)a7 aspectRatioThreshold:(float)a8 columns:(unint64_t *)a9 rows:(unint64_t *)a10 tiles:(void *)a11 error:(id *)a12
{
  double x;
  double y;
  double width;
  CGFloat height;
  float v24;
  id *v26;
  void *v28;
  void *v29;
  unint64_t v30;
  double *v31;
  double *v32;
  unint64_t v33;
  unint64_t v34;
  double v35;
  double v36;
  float v37;
  float v38;
  double *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  float v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  BOOL v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  BOOL result;
  double *v58;
  unint64_t v59;
  __int128 v60;
  double v61;
  double v62;
  BOOL v63;
  unint64_t v64;
  unint64_t v65;
  double v66;
  double v67;
  double *v68;
  unint64_t v69;
  double v70;
  unint64_t v71;
  double *v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  double *v78;
  double *v79;
  __int128 v80;
  unint64_t v81;
  double *v82;
  double *v83;
  double *v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  double *v90;
  unint64_t v91;
  __int128 v92;
  unint64_t *v93;
  unint64_t v94;
  double v95;
  double v96;
  unint64_t v97;
  CGRect v98;
  CGRect v99;

  v98.origin.x = a3.origin.x * (double)a4;
  v98.size.width = a3.size.width * (double)a4;
  v98.origin.y = a3.origin.y * (double)a5;
  v98.size.height = a3.size.height * (double)a5;
  v99 = CGRectIntegral(v98);
  x = v99.origin.x;
  y = v99.origin.y;
  width = v99.size.width;
  height = v99.size.height;
  v24 = (float)a4 / (float)a5;
  if (v24 < a8 && v24 > (float)(1.0 / a8))
  {
    v31 = (double *)*((_QWORD *)a11 + 1);
    v30 = *((_QWORD *)a11 + 2);
    if ((unint64_t)v31 >= v30)
    {
      v39 = *(double **)a11;
      v40 = ((uint64_t)v31 - *(_QWORD *)a11) >> 5;
      v41 = v40 + 1;
      if ((unint64_t)(v40 + 1) >> 59)
        goto LABEL_122;
      v42 = v30 - (_QWORD)v39;
      if (v42 >> 4 > v41)
        v41 = v42 >> 4;
      v63 = (unint64_t)v42 >= 0x7FFFFFFFFFFFFFE0;
      v43 = 0x7FFFFFFFFFFFFFFLL;
      if (!v63)
        v43 = v41;
      if (v43)
      {
        v43 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<vImage_Buffer>>(v43);
        v39 = *(double **)a11;
        v31 = (double *)*((_QWORD *)a11 + 1);
      }
      else
      {
        v44 = 0;
      }
      v58 = (double *)(v43 + 32 * v40);
      *v58 = x;
      v58[1] = y;
      v59 = v43 + 32 * v44;
      v58[2] = width;
      v58[3] = height;
      v32 = v58 + 4;
      if (v31 != v39)
      {
        do
        {
          v60 = *((_OWORD *)v31 - 1);
          *((_OWORD *)v58 - 2) = *((_OWORD *)v31 - 2);
          *((_OWORD *)v58 - 1) = v60;
          v58 -= 4;
          v31 -= 4;
        }
        while (v31 != v39);
        v39 = *(double **)a11;
      }
      *(_QWORD *)a11 = v58;
      *((_QWORD *)a11 + 1) = v32;
      *((_QWORD *)a11 + 2) = v59;
      if (v39)
        operator delete(v39);
    }
    else
    {
      *v31 = x;
      v31[1] = v99.origin.y;
      v32 = v31 + 4;
      v31[2] = v99.size.width;
      v31[3] = v99.size.height;
    }
    *((_QWORD *)a11 + 1) = v32;
    return 1;
  }
  v26 = a12;
  if (v99.size.width < 1.0 || v99.size.height < 1.0)
  {
    if (!a12)
      return 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid ROI size of %f x %f"), *(_QWORD *)&v99.size.width, *(_QWORD *)&v99.size.height);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 3, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_52:
    *v26 = v29;

    return 0;
  }
  v33 = (unint64_t)v99.size.width;
  v34 = (unint64_t)v99.size.height;
  if ((unint64_t)v99.size.width * (unint64_t)v99.size.height <= a6)
  {
    v38 = (float)v33;
    v37 = (float)v34;
  }
  else
  {
    v35 = (double)v33 / (double)v34;
    v36 = sqrt((double)a6 / v35);
    v37 = v36;
    v38 = v35 * v36;
  }
  v45 = (unint64_t)(float)(v38 + 0.5);
  v46 = 32;
  if (v45 <= 0x20)
    v45 = 32;
  v47 = v37 + 0.5;
  if ((unint64_t)v47 > 0x20)
    v46 = (unint64_t)v47;
  v48 = (v45 + 15) & 0xFFFFFFFFFFFFFFF0;
  v49 = (v46 + 15) & 0xFFFFFFFFFFFFFFF0;
  if (v48 >= v33)
    v50 = (unint64_t)width;
  else
    v50 = (v45 + 15) & 0xFFFFFFFFFFFFFFF0;
  if (v49 >= v34)
    v51 = (unint64_t)v99.size.height;
  else
    v51 = (v46 + 15) & 0xFFFFFFFFFFFFFFF0;
  if (v50)
    v52 = v51 == 0;
  else
    v52 = 1;
  if (v52)
  {
    if (!a12)
      return 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid tile size of %ld x %ld"), v50, v51);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 3, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_52;
  }
  v53 = ((unint64_t)(float)((float)(a7 * (float)v50) + 0.5) + 8) & 0xFFFFFFFFFFFFFFF0;
  v54 = ((unint64_t)(float)((float)(a7 * (float)v51) + 0.5) + 8) & 0xFFFFFFFFFFFFFFF0;
  if (v53 >= v50)
    v53 = 0;
  if (v54 >= v51)
    v54 = 0;
  v97 = v51 - v54;
  v55 = v50 - v53;
  if (v50 == v53 || v51 == v54)
  {
    if (!a12)
      return 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid tile increment of %lu x %lu"), v55, v97);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorForInvalidOperationWithLocalizedDescription:](VNError, "errorForInvalidOperationWithLocalizedDescription:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_52;
  }
  v61 = (double)v50;
  v62 = (double)v51;
  v63 = v48 >= v33 && v49 >= v34;
  if (!v63)
  {
    v64 = (unint64_t)y;
    if ((unint64_t)y >= v34)
    {
      if (!a9)
      {
        v65 = 0;
LABEL_120:
        if (a10)
          *a10 = v65;
        return 1;
      }
    }
    else
    {
      v93 = a9;
      v65 = 0;
      v95 = (double)(v34 - v51);
      v96 = (double)v34;
      v66 = (double)(v33 - v50);
      v94 = (unint64_t)v99.size.height;
      do
      {
        if (v62 + (double)v64 <= v96)
          v67 = (double)v64;
        else
          v67 = v95;
        if ((unint64_t)x < v33)
        {
          v68 = (double *)*((_QWORD *)a11 + 1);
          v69 = (unint64_t)x;
          do
          {
            if (v61 + (double)v69 <= (double)v33)
              v70 = (double)v69;
            else
              v70 = v66;
            v71 = *((_QWORD *)a11 + 2);
            if ((unint64_t)v68 >= v71)
            {
              v72 = *(double **)a11;
              v73 = ((uint64_t)v68 - *(_QWORD *)a11) >> 5;
              v74 = v73 + 1;
              if ((unint64_t)(v73 + 1) >> 59)
                goto LABEL_122;
              v75 = v71 - (_QWORD)v72;
              if (v75 >> 4 > v74)
                v74 = v75 >> 4;
              if ((unint64_t)v75 >= 0x7FFFFFFFFFFFFFE0)
                v76 = 0x7FFFFFFFFFFFFFFLL;
              else
                v76 = v74;
              if (v76)
              {
                v76 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<vImage_Buffer>>(v76);
                v72 = *(double **)a11;
                v68 = (double *)*((_QWORD *)a11 + 1);
              }
              else
              {
                v77 = 0;
              }
              v78 = (double *)(v76 + 32 * v73);
              *v78 = v70;
              v78[1] = v67;
              v78[2] = v61;
              v78[3] = v62;
              v79 = v78;
              if (v68 != v72)
              {
                do
                {
                  v80 = *((_OWORD *)v68 - 1);
                  *((_OWORD *)v79 - 2) = *((_OWORD *)v68 - 2);
                  *((_OWORD *)v79 - 1) = v80;
                  v79 -= 4;
                  v68 -= 4;
                }
                while (v68 != v72);
                v72 = *(double **)a11;
              }
              v68 = v78 + 4;
              *(_QWORD *)a11 = v79;
              *((_QWORD *)a11 + 1) = v78 + 4;
              *((_QWORD *)a11 + 2) = v76 + 32 * v77;
              if (v72)
                operator delete(v72);
            }
            else
            {
              *v68 = v70;
              v68[1] = v67;
              v68[2] = v61;
              v68[3] = v62;
              v68 += 4;
            }
            *((_QWORD *)a11 + 1) = v68;
            v69 += v55;
          }
          while (v69 < v33);
        }
        ++v65;
        v64 += v97;
      }
      while (v64 < v94);
      v26 = a12;
      if (!v93)
        goto LABEL_120;
      if (v65)
      {
        *v93 = ((uint64_t)(*((_QWORD *)a11 + 1) - *(_QWORD *)a11) >> 5) / v65;
        goto LABEL_120;
      }
    }
    if (v26)
    {
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unexpected ROI origin causing %lui rows of %f x %f"), 0, *(_QWORD *)&x, *(_QWORD *)&y);
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_52;
    }
    return 0;
  }
  v82 = (double *)*((_QWORD *)a11 + 1);
  v81 = *((_QWORD *)a11 + 2);
  if ((unint64_t)v82 < v81)
  {
    *v82 = x;
    v82[1] = y;
    v83 = v82 + 4;
    v82[2] = v61;
    v82[3] = v62;
    goto LABEL_116;
  }
  v84 = *(double **)a11;
  v85 = ((uint64_t)v82 - *(_QWORD *)a11) >> 5;
  v86 = v85 + 1;
  if ((unint64_t)(v85 + 1) >> 59)
LABEL_122:
    std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
  v87 = v81 - (_QWORD)v84;
  if (v87 >> 4 > v86)
    v86 = v87 >> 4;
  v63 = (unint64_t)v87 >= 0x7FFFFFFFFFFFFFE0;
  v88 = 0x7FFFFFFFFFFFFFFLL;
  if (!v63)
    v88 = v86;
  if (v88)
  {
    v88 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<vImage_Buffer>>(v88);
    v84 = *(double **)a11;
    v82 = (double *)*((_QWORD *)a11 + 1);
  }
  else
  {
    v89 = 0;
  }
  v90 = (double *)(v88 + 32 * v85);
  *v90 = x;
  v90[1] = y;
  v91 = v88 + 32 * v89;
  v90[2] = v61;
  v90[3] = v62;
  v83 = v90 + 4;
  if (v82 != v84)
  {
    do
    {
      v92 = *((_OWORD *)v82 - 1);
      *((_OWORD *)v90 - 2) = *((_OWORD *)v82 - 2);
      *((_OWORD *)v90 - 1) = v92;
      v90 -= 4;
      v82 -= 4;
    }
    while (v82 != v84);
    v84 = *(double **)a11;
  }
  *(_QWORD *)a11 = v90;
  *((_QWORD *)a11 + 1) = v83;
  *((_QWORD *)a11 + 2) = v91;
  if (v84)
    operator delete(v84);
LABEL_116:
  *((_QWORD *)a11 + 1) = v83;
  if (a9)
    *a9 = 1;
  if (!a10)
    return 1;
  result = 1;
  *a10 = 1;
  return result;
}

- (id)internalProcessUsingQualityOfServiceClass:(unsigned int)a3 options:(id)a4 regionOfInterest:(CGRect)a5 warningRecorder:(id)a6 error:(id *)a7 progressHandler:(id)a8
{
  double height;
  double width;
  double y;
  double x;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  char *v23;
  char *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
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
  char *v39;
  uint64_t v40;
  __int128 v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  dispatch_block_t v47;
  void (**v48)(_QWORD);
  void (**v49)(_QWORD);
  NSObject *v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void (**v59)(_QWORD);
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  id v84;
  id v85;
  unint64_t i;
  void *v87;
  double v88;
  id *v89;
  double v90;
  double v91;
  double v92;
  double v93;
  float v94;
  unint64_t v95;
  void *v96;
  double v97;
  double v98;
  CGFloat v99;
  double v100;
  double v101;
  double v102;
  double v103;
  float v104;
  int v105;
  void *v106;
  id v107;
  const __CFString *v108;
  id *v110;
  void *v111;
  char *v112;
  unint64_t v113;
  int v114;
  void *v115;
  void *v116;
  void *v117;
  dispatch_group_t v119;
  dispatch_group_t v120;
  unint64_t v121;
  id v122;
  void *v123;
  id v124;
  NSObject *v125;
  uint64_t v126;
  id *to;
  VNFaceDetector *v128;
  CGFloat v129;
  _QWORD v130[4];
  NSObject *v131;
  id v132;
  id v133;
  id v134;
  id v135;
  id v136;
  id v137;
  _QWORD *v138;
  _QWORD *v139;
  _QWORD *v140;
  _QWORD *v141;
  uint64_t *v142;
  id v143[2];
  __int128 v144;
  __int128 v145;
  unint64_t v146;
  int v147;
  unsigned int v148;
  _QWORD block[4];
  NSObject *v150;
  id v151;
  id v152;
  id v153;
  id v154;
  _QWORD *v155;
  _QWORD *v156;
  id v157[2];
  __int128 v158;
  __int128 v159;
  unint64_t v160;
  int v161;
  unsigned int v162;
  _QWORD v163[4];
  _QWORD v164[5];
  id v165;
  _QWORD v166[5];
  id v167;
  __int128 v168;
  __int128 v169;
  id location;
  _QWORD v171[6];
  int v172;
  uint64_t v173;
  uint64_t *v174;
  uint64_t v175;
  uint64_t (*v176)(uint64_t, uint64_t);
  void (*v177)(uint64_t);
  id v178;
  char *v179;
  char *v180;
  uint64_t v181;
  uint64_t v182;
  unint64_t v183[3];
  CGRect v184;
  CGRect v185;
  CGRect v186;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v16 = a4;
  v124 = a6;
  v122 = a8;
  v123 = v16;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v16, a7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17)
  {
    v107 = 0;
    goto LABEL_39;
  }
  v182 = 0;
  v183[0] = 0;
  v179 = 0;
  v180 = 0;
  v181 = 0;
  v19 = objc_msgSend(v17, "width");
  v20 = objc_msgSend(v18, "height");
  LODWORD(v21) = 1050253722;
  LODWORD(v22) = 2.0;
  if (!+[VNFaceDetector calculateTilesForRegionOfInterest:imageWidth:imageHeight:tileSizeInPixels:overlapFraction:aspectRatioThreshold:columns:rows:tiles:error:](VNFaceDetector, "calculateTilesForRegionOfInterest:imageWidth:imageHeight:tileSizeInPixels:overlapFraction:aspectRatioThreshold:columns:rows:tiles:error:", v19, v20, 3145728, v183, &v182, &v179, x, y, width, height, v21, v22, a7))
  {
    v107 = 0;
    goto LABEL_37;
  }
  VNRecordImageTilingWarning(v124, v183[0], v182);
  v24 = v179;
  v23 = v180;
  v113 = v180 - v179;
  v121 = (v180 - v179) >> 5;
  v117 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:");
  v173 = 0;
  v174 = &v173;
  v175 = 0x3032000000;
  v176 = __Block_byref_object_copy__18622;
  v177 = __Block_byref_object_dispose__18623;
  v178 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v171[0] = 0;
  v171[1] = v171;
  v171[2] = 0x3812000000;
  v171[3] = __Block_byref_object_copy__34_18624;
  v171[4] = __Block_byref_object_dispose__35_18625;
  v171[5] = "";
  v172 = 0;
  objc_initWeak(&location, self);
  v25 = (void *)objc_opt_class();
  v114 = objc_msgSend(v25, "VNClassCode");
  objc_msgSend(v25, "detectorCropCreationAsyncTasksQueue");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = dispatch_group_create();
  objc_msgSend(v25, "detectorCropProcessingAsyncTasksQueue");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = a7;
  v111 = v18;
  v119 = dispatch_group_create();
  kdebug_trace();
  VNValidatedLog(1, (uint64_t)CFSTR("Start processing tilesProcessingGroup. currentDetector: %@"), v26, v27, v28, v29, v30, v31, (uint64_t)self);
  v128 = self;
  if (v23 != v24)
  {
    v38 = 0;
    v39 = 0;
    v40 = v121;
    if (v121 <= 1)
      v40 = 1;
    v112 = (char *)v40;
    do
    {
      v126 = v38;
      v41 = *(_OWORD *)&v179[v38 + 16];
      v168 = *(_OWORD *)&v179[v38];
      v169 = v41;
      v166[0] = 0;
      v166[1] = v166;
      v166[2] = 0x3032000000;
      v166[3] = __Block_byref_object_copy__18622;
      v166[4] = __Block_byref_object_dispose__18623;
      v167 = 0;
      v164[0] = 0;
      v164[1] = v164;
      v164[2] = 0x3032000000;
      v164[3] = __Block_byref_object_copy__18622;
      v164[4] = __Block_byref_object_dispose__18623;
      v165 = 0;
      v163[0] = 0;
      v163[1] = v163;
      v163[2] = 0x2020000000;
      v163[3] = 0;
      v42 = (void *)objc_msgSend(v123, "mutableCopy");
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __123__VNFaceDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke;
      block[3] = &unk_1E4548AB0;
      objc_copyWeak(v157, &location);
      v161 = v114;
      v155 = v166;
      v157[1] = v39;
      v125 = v120;
      v150 = v125;
      v158 = v168;
      v159 = v169;
      v43 = v42;
      v151 = v43;
      v162 = a3;
      v44 = v124;
      v152 = v44;
      v156 = v163;
      v45 = v122;
      v154 = v45;
      v160 = v121;
      v46 = v116;
      v153 = v46;
      v47 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)a3, 0, block);
      v130[0] = MEMORY[0x1E0C809B0];
      v130[1] = 3221225472;
      v130[2] = __123__VNFaceDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_3;
      v130[3] = &unk_1E4547CE8;
      objc_copyWeak(v143, &location);
      v138 = v166;
      v48 = v47;
      v147 = v114;
      v49 = v48;
      v136 = v48;
      v143[1] = v39;
      v50 = v119;
      v131 = v50;
      v139 = v164;
      v140 = v163;
      v144 = v168;
      v145 = v169;
      v51 = v43;
      v132 = v51;
      v148 = a3;
      v133 = v44;
      v137 = v45;
      v141 = v171;
      v142 = &v173;
      v134 = v117;
      v146 = v121;
      v52 = v115;
      v135 = v52;
      v59 = (void (**)(_QWORD))dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)a3, 0, v130);
      if (v113 < 0x21)
      {
        VNValidatedLog(1, (uint64_t)CFSTR("Performing createRegionOfInterestCropForProcessingBlock. currentDetector: %@"), v53, v54, v55, v56, v57, v58, (uint64_t)v128);
        v49[2](v49);
        VNValidatedLog(1, (uint64_t)CFSTR("Performing processRegionOfInterestBlock. currentDetector: %@"), v66, v67, v68, v69, v70, v71, (uint64_t)v128);
        v59[2](v59);
        VNValidatedLog(1, (uint64_t)CFSTR("Finish processing createRegionOfInterestCropForProcessingBlock and processRegionOfInterestBlock. currentDetector: %@"), v72, v73, v74, v75, v76, v77, (uint64_t)v128);
      }
      else
      {
        VNValidatedLog(1, (uint64_t)CFSTR("Scheduling createRegionOfInterestCropForProcessingBlock. currentDetector: %@; group: %@"),
          v53,
          v54,
          v55,
          v56,
          v57,
          v58,
          (uint64_t)v128);
        objc_msgSend(v46, "dispatchGroupAsyncByPreservingQueueCapacity:block:", v125, v49);
        VNValidatedLog(1, (uint64_t)CFSTR("Scheduling processRegionOfInterestBlock. currentDetector: %@; group: %@"),
          v60,
          v61,
          v62,
          v63,
          v64,
          v65,
          (uint64_t)v128);
        objc_msgSend(v52, "dispatchGroupAsyncByPreservingQueueCapacity:block:", v50, v59);
      }

      objc_destroyWeak(v143);
      objc_destroyWeak(v157);

      _Block_object_dispose(v163, 8);
      _Block_object_dispose(v164, 8);

      _Block_object_dispose(v166, 8);
      ++v39;
      v38 = v126 + 32;
    }
    while (v112 != v39);
  }
  v18 = v111;
  if (v113 > 0x20)
  {
    VNValidatedLog(1, (uint64_t)CFSTR("Waiting for tilesCropCreationGroup. currentDetector: %@; group: %@"),
      v32,
      v33,
      v34,
      v35,
      v36,
      v37,
      (uint64_t)v128);
    if ((objc_msgSend(v116, "dispatchGroupWait:error:", v120, v110) & 1) != 0)
    {
      VNValidatedLog(1, (uint64_t)CFSTR("Waiting for tilesCropProcessingGroup. currentDetector: %@; group: %@"),
        v78,
        v79,
        v80,
        v81,
        v82,
        v83,
        (uint64_t)v128);
      if ((objc_msgSend(v115, "dispatchGroupWait:error:", v119, v110) & 1) != 0)
      {
        VNValidatedLog(1, (uint64_t)CFSTR("Finish processing tilesCropCreationGroup and tilesCropProcessingGroup. currentDetector: %@; cropCreationGroup: %@; cropProcessingGroup: %@"),
          v78,
          v79,
          v80,
          v81,
          v82,
          v83,
          (uint64_t)v128);
        goto LABEL_15;
      }
      v108 = CFSTR("Timed out waiting for face detector tilesCropProcessingGroup when processing %lu tiles. currentDetector: %@; group: %@");
    }
    else
    {
      v108 = CFSTR("Timed out waiting for face detector tilesCropCreationGroup when processing %lu tiles. currentDetector: %@; group: %@");
    }
    VNValidatedLog(4, (uint64_t)v108, v78, v79, v80, v81, v82, v83, v121);
    goto LABEL_35;
  }
LABEL_15:
  kdebug_trace();
  if (+[VNValidationUtilities validateAsyncStatusResults:error:](VNValidationUtilities, "validateAsyncStatusResults:error:", v117, v110))
  {
    v84 = (id)v174[5];
    v85 = &__block_literal_global_18639;
    for (i = 0; objc_msgSend(v84, "count") > i; ++i)
    {
      objc_msgSend(v84, "objectAtIndexedSubscript:", i);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = __123__VNFaceDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_6((uint64_t)v87, v87);
      to = v89;
      v129 = v88;
      v91 = v90;
      v93 = v92;

      v95 = i + 1;
      while (v95 < objc_msgSend(v84, "count"))
      {
        objc_msgSend(v84, "objectAtIndexedSubscript:", v95);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v97 = __123__VNFaceDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_6((uint64_t)v96, v96);
        v99 = v98;
        v101 = v100;
        v103 = v102;

        *(_QWORD *)&v184.origin.y = to;
        v184.origin.x = v129;
        v184.size.width = v91;
        v184.size.height = v93;
        v186.origin.x = v97;
        v186.origin.y = v99;
        v186.size.width = v101;
        v186.size.height = v103;
        v185 = CGRectIntersection(v184, v186);
        if (v185.size.width * v185.size.height / (v91 * v93 + v101 * v103 - v185.size.width * v185.size.height) < 0.5)
        {
          ++v95;
        }
        else
        {
          v104 = v101 * v103;
          v94 = v91 * v93;
          if (v94 > v104)
            v105 = v95;
          else
            v105 = i;
          if (i == v105)
          {
            objc_msgSend(v84, "objectAtIndexedSubscript:", v95);
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "setObject:atIndexedSubscript:", v106, i);

          }
          objc_msgSend(v84, "removeObjectAtIndex:", v95);
        }
      }
    }

    v107 = (id)v174[5];
    goto LABEL_36;
  }
LABEL_35:
  v107 = 0;
LABEL_36:

  objc_destroyWeak(&location);
  _Block_object_dispose(v171, 8);
  _Block_object_dispose(&v173, 8);

LABEL_37:
  if (v179)
  {
    v180 = v179;
    operator delete(v179);
  }
LABEL_39:

  return v107;
}

void __123__VNFaceDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t (**v12)(void *, id *, double, double, double, double);
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  id v18;
  VNAsyncStatus *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  VNAsyncStatus *v29;
  uint64_t v30;
  void *v31;
  id v32;
  _QWORD aBlock[4];
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  int v41;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (WeakRetained)
  {
    kdebug_trace();
    VNValidatedLog(1, (uint64_t)CFSTR("createRegionOfInterestCropForProcessingBlock: start processing; currentDetector: %@"),
      v3,
      v4,
      v5,
      v6,
      v7,
      v8,
      (uint64_t)WeakRetained);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __123__VNFaceDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_2;
    aBlock[3] = &unk_1E4548A88;
    v9 = WeakRetained;
    v34 = v9;
    v39 = *(_OWORD *)(a1 + 104);
    v40 = *(_OWORD *)(a1 + 120);
    v35 = *(id *)(a1 + 40);
    v41 = *(_DWORD *)(a1 + 148);
    v10 = *(id *)(a1 + 48);
    v11 = *(_QWORD *)(a1 + 80);
    v36 = v10;
    v38 = v11;
    v37 = *(id *)(a1 + 64);
    v12 = (uint64_t (**)(void *, id *, double, double, double, double))_Block_copy(aBlock);
    v13 = *(double *)(a1 + 104);
    v14 = *(double *)(a1 + 112);
    v15 = *(double *)(a1 + 120);
    v16 = *(double *)(a1 + 128);
    v32 = 0;
    v17 = v12[2](v12, &v32, v13, v14, v15, v16);
    v18 = v32;
    v19 = -[VNAsyncStatus initWithStatus:error:]([VNAsyncStatus alloc], "initWithStatus:error:", v17, v18);
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;

    VNValidatedLog(1, (uint64_t)CFSTR("createRegionOfInterestCropForProcessingBlock: finish processing; currentDetector: %@"),
      v22,
      v23,
      v24,
      v25,
      v26,
      v27,
      (uint64_t)v9);
    kdebug_trace();
    if (*(_QWORD *)(a1 + 136) >= 2uLL)
      objc_msgSend(*(id *)(a1 + 56), "dispatchReportBlockCompletion");

  }
  else
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Currently executed Detector should not be nil"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[VNAsyncStatus initWithStatus:error:]([VNAsyncStatus alloc], "initWithStatus:error:", 0, v28);
    v30 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v31 = *(void **)(v30 + 40);
    *(_QWORD *)(v30 + 40) = v29;

  }
}

void __123__VNFaceDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  __int128 v12;
  void *v13;
  uint64_t v14;
  id v15;
  VNAsyncStatus *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  VNAsyncStatus *v26;
  uint64_t v27;
  void *v28;
  id v29;
  _QWORD aBlock[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  int v42;
  int v43;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 128));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    VNValidatedLog(1, (uint64_t)CFSTR("processRegionOfInterestBlock: start processing; currentDetector: %@"),
      v3,
      v4,
      v5,
      v6,
      v7,
      v8,
      (uint64_t)WeakRetained);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __123__VNFaceDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_4;
    aBlock[3] = &unk_1E4547CC0;
    v35 = *(id *)(a1 + 72);
    v10 = v9;
    v42 = *(_DWORD *)(a1 + 184);
    v11 = *(_QWORD *)(a1 + 136);
    v31 = v10;
    v39 = v11;
    v32 = *(id *)(a1 + 32);
    v37 = *(_OWORD *)(a1 + 88);
    v12 = *(_OWORD *)(a1 + 160);
    v40 = *(_OWORD *)(a1 + 144);
    v41 = v12;
    v38 = *(_QWORD *)(a1 + 104);
    v33 = *(id *)(a1 + 40);
    v43 = *(_DWORD *)(a1 + 188);
    v34 = *(id *)(a1 + 48);
    v36 = *(id *)(a1 + 80);
    v13 = _Block_copy(aBlock);
    v29 = 0;
    v14 = VNExecuteBlock(v13, (uint64_t)&v29);
    v15 = v29;
    v16 = -[VNAsyncStatus initWithStatus:error:]([VNAsyncStatus alloc], "initWithStatus:error:", v14, v15);
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40), "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40));
    objc_msgSend(*(id *)(a1 + 56), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 48));
    VNValidatedLog(1, (uint64_t)CFSTR("processRegionOfInterestBlock: finish processing; currentDetector: %@"),
      v19,
      v20,
      v21,
      v22,
      v23,
      v24,
      (uint64_t)v10);
    kdebug_trace();
    if (*(_QWORD *)(a1 + 176) >= 2uLL)
      objc_msgSend(*(id *)(a1 + 64), "dispatchReportBlockCompletion");

  }
  else
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Currently executed Detector should not be nil"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[VNAsyncStatus initWithStatus:error:]([VNAsyncStatus alloc], "initWithStatus:error:", 0, v25);
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v28 = *(void **)(v27 + 40);
    *(_QWORD *)(v27 + 40) = v26;

  }
  CVPixelBufferRelease(*(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = 0;
}

double __123__VNFaceDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  float v3;
  double v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "alignedBoundingBox");
    v4 = v3;
  }
  else
  {
    v4 = *MEMORY[0x1E0C9D628];
  }

  return v4;
}

BOOL __123__VNFaceDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_4(uint64_t a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  void *v12;
  _BOOL8 v13;
  _QWORD aBlock[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  int v24;
  int v25;

  if (dispatch_block_wait(*(dispatch_block_t *)(a1 + 64), 0xFFFFFFFFFFFFFFFFLL))
  {
    if (a2)
    {
      +[VNError errorForExecutionTimeoutWithLocalizedDescription:](VNError, "errorForExecutionTimeoutWithLocalizedDescription:", CFSTR("Timed out waiting for dependent task execution"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v13 = 0;
      *a2 = v4;
      return v13;
    }
    return 0;
  }
  kdebug_trace();
  VNValidatedLog(1, (uint64_t)CFSTR("processRegionOfInterestBlock: start processing (crop is ready); currentDetector: %@"),
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
    *(_QWORD *)(a1 + 32));
  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "completed") & 1) == 0)
  {
    if (a2)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "error");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    return 0;
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __123__VNFaceDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_5;
  aBlock[3] = &unk_1E45472A8;
  v16 = *(id *)(a1 + 32);
  v24 = *(_DWORD *)(a1 + 144);
  v17 = *(id *)(a1 + 40);
  v11 = *(_OWORD *)(a1 + 128);
  v22 = *(_OWORD *)(a1 + 112);
  v23 = v11;
  v21 = *(_OWORD *)(a1 + 88);
  v18 = *(id *)(a1 + 48);
  v25 = *(_DWORD *)(a1 + 148);
  v19 = *(id *)(a1 + 56);
  v20 = *(id *)(a1 + 72);
  v12 = _Block_copy(aBlock);
  CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24), 1uLL);
  objc_msgSend((id)objc_opt_class(), "runSuccessReportingBlockSynchronously:detector:qosClass:error:", v12, *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 148), a2);
  CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24), 1uLL);
  v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40) != 0;

  return v13;
}

BOOL __123__VNFaceDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  kdebug_trace();
  VNValidatedLog(1, (uint64_t)CFSTR("processRegionOfInterest Netto: start processing; currentDetector: %@"),
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "processRegionOfInterest:croppedPixelBuffer:options:qosClass:warningRecorder:error:progressHandler:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24), *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 124), *(_QWORD *)(a1 + 56), a2, *(_QWORD *)(a1 + 64), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  VNValidatedLog(1, (uint64_t)CFSTR("processRegionOfInterest Netto: finish processing; currentDetector: %@"),
    v13,
    v14,
    v15,
    v16,
    v17,
    v18,
    *(_QWORD *)(a1 + 32));
  kdebug_trace();
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) != 0;
}

uint64_t __123__VNFaceDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "createRegionOfInterestCrop:options:qosClass:warningRecorder:pixelBuffer:error:progressHandler:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 104), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24, a2, *(_QWORD *)(a1 + 56), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
}

void __46__VNFaceDetector_shouldDumpDebugIntermediates__block_invoke()
{
  void *v0;
  int v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("VN_DEBUG_DUMP_FACE_DETECT_INTERMEDIATES"));

  if (v1)
    +[VNFaceDetector shouldDumpDebugIntermediates]::dumpDebug = 1;
}

void __55__VNFaceDetector_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNFaceDetector;
  objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "addObject:", CFSTR("VNDetectorOption_RequestDetectionLevel"));
  objc_msgSend(v2, "addObject:", CFSTR("VNFaceDetectorInitOption_MinFaceSize"));
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)+[VNFaceDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNFaceDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;

}

@end
