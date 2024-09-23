@implementation CIRedEyeCorrection

- (void)setDefaults
{
  NSDictionary *v3;

  self->inputCameraModel = 0;
  v3 = self->inputCorrectionInfo;
  self->inputCorrectionInfo = 0;
}

- (BOOL)_isIdentity
{
  return self->inputCorrectionInfo == 0;
}

- (id)outputImage
{
  CIImage *inputImage;
  NSDictionary *inputCorrectionInfo;
  id v5;
  uint64_t v6;
  int v7;
  NSString *inputCameraModel;
  const __CFString *v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  __objc2_class **v18;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  unint64_t v23;
  unint64_t v24;
  int v25;
  int v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  double v39;
  double v40;
  uint64_t v41;
  CIImage *v43;
  CGColorSpace *v44;
  CIImage *v45;
  id v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  const __CFString *v50;
  int v51;
  id v52;
  unint64_t v53;
  int v54;
  unint64_t v55;
  int v56;
  _QWORD v57[10];
  int v58;
  int v59;
  unint64_t v60;
  unint64_t v61;
  int v62;
  _QWORD v63[8];
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  uint64_t v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;

  v69 = *MEMORY[0x1E0C80C00];
  inputImage = self->inputImage;
  if (inputImage)
  {
    inputCorrectionInfo = self->inputCorrectionInfo;
    if (!inputCorrectionInfo)
      return inputImage;
    v5 = (id)-[NSDictionary copy](inputCorrectionInfo, "copy");
    v6 = objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("convexHull"));
    if (v6)
    {
      v7 = 3;
      goto LABEL_7;
    }
    if (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("pointX")))
    {
      v7 = 1;
LABEL_7:
      inputCameraModel = self->inputCameraModel;
      if (inputCameraModel)
        v9 = (const __CFString *)(id)-[NSString copy](inputCameraModel, "copy");
      else
        v9 = CFSTR("undefined");
      -[CIImage extent](self->inputImage, "extent");
      v13 = v12;
      v15 = v14;
      v16 = v10;
      v17 = v11;
      v18 = off_1E2EB6278;
      if (v6)
        v18 = off_1E2EB6280;
      -[__objc2_class supportRectangleWithRepair:imageSize:](*v18, "supportRectangleWithRepair:imageSize:", v5, v10, v11);
      x = v70.origin.x;
      y = v70.origin.y;
      width = v70.size.width;
      height = v70.size.height;
      if (CGRectIsNull(v70))
      {
        v23 = 0;
        v24 = 0;
        v25 = 0x7FFFFFFF;
LABEL_14:
        if (v25 != 0x7FFFFFFF || v23)
        {
          v26 = 0x7FFFFFFF;
        }
        else
        {
          v26 = 0x7FFFFFFF;
          if (!v24)
            goto LABEL_45;
        }
LABEL_30:
        v27 = (double)v26;
        v28 = (double)v25;
        v29 = (double)v23;
        v30 = (double)v24;
        if (v23)
        {
LABEL_31:
          if (v24)
          {
            v52 = v5;
            v53 = v24;
            v54 = v25;
            v55 = v23;
            v56 = v26;
            v50 = v9;
            v51 = v7;
            v66 = 0u;
            v67 = 0u;
            v64 = 0u;
            v65 = 0u;
            v32 = (void *)objc_msgSend(v5, "allValues");
            v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
            if (v33)
            {
              v34 = v33;
              v35 = 0;
              v36 = *(_QWORD *)v65;
              do
              {
                for (i = 0; i != v34; ++i)
                {
                  if (*(_QWORD *)v65 != v36)
                    objc_enumerationMutation(v32);
                  v38 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend(v38, "doubleValue");
                    v40 = v39 * 1000.0;
                    if (-2654435761 * (uint64_t)v40 >= 0)
                      v41 = -(uint64_t)(1640531535 * (uint64_t)v40);
                    else
                      v41 = -1640531535 * (uint64_t)v40;
                    v35 ^= v41;
                  }
                }
                v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
              }
              while (v34);
            }
            else
            {
              v35 = 0;
            }
            v43 = self->inputImage;
            v44 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D908]);
            if (v6)
              v45 = -[CIImage imageByColorMatchingWorkingSpaceToColorSpace:](v43, "imageByColorMatchingWorkingSpaceToColorSpace:", v44);
            else
              v45 = -[CIImage imageByApplyingFilter:withInputParameters:](v43, "imageByApplyingFilter:withInputParameters:", CFSTR("CILinearToSRGBToneCurve"), MEMORY[0x1E0C9AA70]);
            v46 = -[CIImage _imageByRenderingToIntermediate](-[CIImage imageByCroppingToRect:](v45, "imageByCroppingToRect:", v27, v28, v29, v30), "_imageByRenderingToIntermediate");
            v47 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CIRedEyeCorrections %lu"), v35);
            v63[0] = MEMORY[0x1E0C809B0];
            v63[1] = 3221225472;
            v63[2] = __33__CIRedEyeCorrection_outputImage__block_invoke;
            v63[3] = &__block_descriptor_64_e70__CGRect__CGPoint_dd__CGSize_dd__40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
            *(double *)&v63[4] = v27;
            *(double *)&v63[5] = v28;
            *(double *)&v63[6] = v29;
            *(double *)&v63[7] = v30;
            v57[0] = MEMORY[0x1E0C809B0];
            v57[1] = 3221225472;
            v57[2] = __33__CIRedEyeCorrection_outputImage__block_invoke_2;
            v57[3] = &unk_1E2EC4F60;
            v62 = v51;
            v57[6] = v13;
            v57[7] = v15;
            *(double *)&v57[8] = v16;
            *(double *)&v57[9] = v17;
            v58 = v56;
            v59 = v54;
            v60 = v55;
            v61 = v53;
            v57[4] = v52;
            v57[5] = v50;
            v48 = (void *)objc_msgSend(v46, "imageWithExtent:processorDescription:argumentDigest:inputFormat:outputFormat:options:roiCallback:processor:", v47, v35, 266, 2056, 0, v63, v27, v28, v29, v30, v57);
            if (v6)
              v49 = objc_msgSend(v48, "imageByColorMatchingColorSpaceToWorkingSpace:", v44);
            else
              v49 = objc_msgSend(v48, "imageByApplyingFilter:withInputParameters:", CFSTR("CISRGBToneCurveToLinear"), MEMORY[0x1E0C9AA70]);
            v31 = (void *)v49;
            CGColorSpaceRelease(v44);
            return v31;
          }
        }
LABEL_45:
        inputImage = self->inputImage;
        return inputImage;
      }
      v71.origin.x = x;
      v71.origin.y = y;
      v71.size.width = width;
      v71.size.height = height;
      v26 = -2147483647;
      if (CGRectIsInfinite(v71))
      {
        v23 = 0xFFFFFFFFLL;
        v25 = -2147483647;
        v24 = 0xFFFFFFFFLL;
      }
      else
      {
        v72.origin.x = x;
        v72.origin.y = y;
        v72.size.width = width;
        v72.size.height = height;
        v73 = CGRectInset(v72, 0.000001, 0.000001);
        v74 = CGRectIntegral(v73);
        v25 = (int)v74.origin.y;
        v23 = (unint64_t)v74.size.width;
        v24 = (unint64_t)v74.size.height;
        if ((int)v74.origin.x != -2147483647)
        {
          v26 = (int)v74.origin.x;
          if ((int)v74.origin.x != 0x7FFFFFFF)
            goto LABEL_30;
          goto LABEL_14;
        }
      }
      if (v25 == -2147483647 && v23 == 0xFFFFFFFF && v24 == 0xFFFFFFFF)
      {
        v27 = *MEMORY[0x1E0C9D5E0];
        v28 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
        v29 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
        v30 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
        v23 = 0xFFFFFFFFLL;
        v25 = -2147483647;
        v24 = 0xFFFFFFFFLL;
        goto LABEL_31;
      }
      goto LABEL_30;
    }
    puts("red-eye repair dictionary is of unknown type");
  }
  return 0;
}

double __33__CIRedEyeCorrection_outputImage__block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

void __33__CIRedEyeCorrection_outputImage__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  size_t AllocSize;
  double v11;
  double v12;
  double v13;
  double v14;
  int v15;
  vImagePixelCount v16;
  vImagePixelCount v17;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  unint64_t v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  size_t v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  int v32;
  uint64_t v33;
  size_t v34;
  uint64_t v35;
  char *v36;
  vImage_Error v37;
  uint64_t v38;
  char *v39;
  vImagePixelCount v40;
  char *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  vImagePixelCount v46;
  uint64_t v47;
  uint64_t v48;
  CIRedEyeRepair3 *v49;
  double *v50;
  CIRedEyeRepair *v51;
  double *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  CIRedEyeRepair3 *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  CIRedEyeRepair3 *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t i;
  uint64_t j;
  int v67;
  vImagePixelCount v68;
  int v69;
  vImage_Error v70;
  int v71;
  char *v72;
  char *v73;
  int v74;
  BOOL v75;
  int v76;
  int v77;
  int v78;
  uint64_t v79;
  uint64_t v80;
  unsigned int v81;
  uint64_t v82;
  unint64_t v83;
  int v84;
  int v85;
  int v86;
  void *v87;
  unint64_t v88;
  int v89;
  size_t v90;
  void *v91;
  int v92;
  vImage_Buffer v93;
  vImage_Buffer dest;
  uint8_t buf[4];
  int v96;
  _QWORD v97[2];
  _QWORD v98[2];
  vImage_Buffer src;
  uint64_t v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;

  v100 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(a3, "contextID");
  v7 = ci_signpost_log_render();
  if ((unint64_t)((v6 << 32) - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v8 = v7;
    if (os_signpost_enabled(v7))
    {
      v9 = *(_DWORD *)(a1 + 104);
      *(_DWORD *)buf = 67109120;
      v96 = v9;
      _os_signpost_emit_with_name_impl(&dword_1921E4000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6 << 32, "CIRedEyeCorrection_processor", "version %d", buf, 8u);
    }
  }
  TimerBase::TimerBase((uint64_t)buf, v6, 0, (uint64_t)"CIRedEyeCorrection_processor", 33);
  if ((CI::format_is_ycc(objc_msgSend(a3, "format")) & 1) == 0)
  {
    AllocSize = IOSurfaceGetAllocSize((IOSurfaceRef)objc_msgSend(a3, "surface"));
    bzero((void *)objc_msgSend(a3, "baseAddress"), AllocSize);
    v12 = *(double *)(a1 + 48);
    v11 = *(double *)(a1 + 56);
    v14 = *(double *)(a1 + 64);
    v13 = *(double *)(a1 + 72);
    v15 = *(_DWORD *)(a1 + 80);
    v89 = *(_DWORD *)(a1 + 84);
    v16 = *(_QWORD *)(a1 + 88);
    v17 = *(_QWORD *)(a1 + 96);
    v91 = *(void **)(a1 + 32);
    v82 = *(_QWORD *)(a1 + 40);
    objc_msgSend(a2, "region");
    x = v101.origin.x;
    y = v101.origin.y;
    width = v101.size.width;
    height = v101.size.height;
    if (CGRectIsNull(v101))
    {
      LODWORD(v22) = 0;
      v23 = 0x7FFFFFFF;
      v24 = 0x7FFFFFFF;
    }
    else
    {
      v102.origin.x = x;
      v102.origin.y = y;
      v102.size.width = width;
      v102.size.height = height;
      if (!CGRectIsInfinite(v102))
      {
        v103.origin.x = x;
        v103.origin.y = y;
        v103.size.width = width;
        v103.size.height = height;
        v104 = CGRectInset(v103, 0.000001, 0.000001);
        v105 = CGRectIntegral(v104);
        v85 = (int)v105.origin.x;
        v23 = (int)v105.origin.y;
        v22 = (unint64_t)v105.size.height;
LABEL_11:
        v25 = objc_msgSend(a2, "format");
        v26 = objc_msgSend(a2, "baseAddress");
        v27 = objc_msgSend(a2, "bytesPerRow");
        v92 = v15;
        objc_msgSend(a3, "region");
        v28 = v106.origin.x;
        v29 = v106.origin.y;
        v30 = v106.size.width;
        v31 = v106.size.height;
        if (CGRectIsNull(v106))
        {
          v83 = 0;
          v88 = 0;
          v32 = 0x7FFFFFFF;
          v84 = 0x7FFFFFFF;
        }
        else
        {
          v107.origin.x = v28;
          v107.origin.y = v29;
          v107.size.width = v30;
          v107.size.height = v31;
          if (!CGRectIsInfinite(v107))
          {
            v108.origin.x = v28;
            v108.origin.y = v29;
            v108.size.width = v30;
            v108.size.height = v31;
            v109 = CGRectInset(v108, 0.000001, 0.000001);
            v110 = CGRectIntegral(v109);
            v86 = (int)v110.origin.x;
            v84 = (int)v110.origin.y;
            v88 = (unint64_t)v110.size.width;
            v83 = (unint64_t)v110.size.height;
            goto LABEL_17;
          }
          v84 = -2147483647;
          v83 = 0xFFFFFFFFLL;
          v88 = 0xFFFFFFFFLL;
          v32 = -2147483647;
        }
        v86 = v32;
LABEL_17:
        v81 = objc_msgSend(a3, "format");
        v80 = objc_msgSend(a3, "baseAddress");
        v90 = objc_msgSend(a3, "bytesPerRow");
        v33 = objc_msgSend(v91, "objectForKeyedSubscript:", CFSTR("convexHull"));
        if (!v33 && !objc_msgSend(v91, "objectForKeyedSubscript:", CFSTR("pointX")))
        {
          puts("red-eye repair dictionary is of unknown type");
          goto LABEL_94;
        }
        if ((_DWORD)v25 == 2056)
        {
          v34 = 4 * v16;
          v79 = v15;
          src.data = (void *)(v26 + v27 * (v23 + (int)v22 - (uint64_t)(v89 + (int)v17)) + 8 * (v15 - (uint64_t)v85));
          src.height = v17;
          src.width = 4 * v16;
          src.rowBytes = v27;
          v35 = v17 * 4 * v16;
          v87 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v35);
          v36 = (char *)objc_msgSend(v87, "mutableBytes");
          dest.data = v36;
          dest.height = v17;
          dest.width = 4 * v16;
          dest.rowBytes = 4 * v16;
          v37 = vImageConvert_Planar16FtoPlanar8(&src, &dest, 0);
          if (v37)
          {
            NSLog(CFSTR("vImageConvert_Planar16FtoPlanar8 error %zi in CIRedEyeCorrection"), v37);
            goto LABEL_94;
          }
        }
        else
        {
          if ((_DWORD)v25 != 266)
          {
            NSLog(CFSTR("Unknown input pixel format in CIRedEyeCorrection %i"), v25);
            goto LABEL_94;
          }
          v79 = v15;
          v34 = 4 * v16;
          v35 = v17 * 4 * v16;
          v87 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v35);
          v38 = objc_msgSend(v87, "mutableBytes");
          v36 = (char *)v38;
          if (v16 && v17)
          {
            v39 = (char *)(v26 + v27 * (v23 + (int)v22 - (uint64_t)(v89 + (int)v17)) + 4 * (v92 - (uint64_t)v85));
            v40 = v17;
            v41 = (char *)v38;
            do
            {
              memcpy(v41, v39, 4 * v16);
              v39 += v27;
              v41 += v34;
              --v40;
            }
            while (v40);
          }
          if (!v33)
          {
            src.data = v36;
            src.height = v17;
            src.width = v16;
            src.rowBytes = 4 * v16;
            LODWORD(dest.data) = 50331906;
            vImagePermuteChannels_ARGB8888(&src, &src, (const uint8_t *)&dest, 0);
          }
        }
        v42 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v35);
        v43 = objc_msgSend(v42, "mutableBytes");
        if (v16 && v17)
        {
          v44 = v43;
          v45 = 0;
          v46 = v17;
          do
          {
            memcpy((void *)(v44 + v45), &v36[v45], 4 * v16);
            v45 += v34;
            --v46;
          }
          while (v46);
        }
        if (v33)
        {
          v97[0] = CFSTR("imageExtent");
          src.data = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
          src.height = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
          src.width = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
          src.rowBytes = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
          v47 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &src, 4);
          v97[1] = CFSTR("cameraModel");
          v98[0] = v47;
          v98[1] = v82;
          v48 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v98, v97, 2);
          v49 = [CIRedEyeRepair3 alloc];
          if (v92 == -2147483647)
          {
            if (v89 == -2147483647 && v16 == 0xFFFFFFFF && v17 == 0xFFFFFFFF)
            {
              v50 = (double *)MEMORY[0x1E0C9D5E0];
              goto LABEL_50;
            }
          }
          else if (v92 == 0x7FFFFFFF && v89 == 0x7FFFFFFF && !(v17 | v16))
          {
            v50 = (double *)MEMORY[0x1E0C9D628];
LABEL_50:
            v53 = *v50;
            v54 = v50[1];
            v55 = v50[2];
            v56 = v50[3];
LABEL_52:
            v57 = -[CIRedEyeRepair3 initWithExternalBuffer:subRectangle:rowBytes:options:](v49, "initWithExternalBuffer:subRectangle:rowBytes:options:", v36, v34, v48, v53, v54, v55, v56);
            goto LABEL_60;
          }
          v53 = (double)v92;
          v54 = (double)v89;
          v55 = (double)v16;
          v56 = (double)v17;
          goto LABEL_52;
        }
        v51 = [CIRedEyeRepair alloc];
        if (v92 == -2147483647)
        {
          if (v89 == -2147483647 && v16 == 0xFFFFFFFF && v17 == 0xFFFFFFFF)
          {
            v52 = (double *)MEMORY[0x1E0C9D5E0];
            goto LABEL_57;
          }
        }
        else if (v92 == 0x7FFFFFFF && v89 == 0x7FFFFFFF && !(v17 | v16))
        {
          v52 = (double *)MEMORY[0x1E0C9D628];
LABEL_57:
          v58 = *v52;
          v59 = v52[1];
          v60 = v52[2];
          v61 = v52[3];
LABEL_59:
          v57 = -[CIRedEyeRepair initWithExternalBuffer:subRectangle:fullSize:rowBytes:cameraModel:](v51, "initWithExternalBuffer:subRectangle:fullSize:rowBytes:cameraModel:", v36, v34, v82, v58, v59, v60, v61, v14, v13);
LABEL_60:
          v62 = v57;
          -[CIRedEyeRepair3 executeRepair:](v57, "executeRepair:", v91);
          -[CIRedEyeRepair3 repairExternalBuffer](v62, "repairExternalBuffer");

          v63 = objc_msgSend(v42, "bytes");
          v64 = objc_msgSend(v87, "mutableBytes");
          if (v17)
          {
            for (i = 0; i != v17; ++i)
            {
              if (v16)
              {
                for (j = 0; j != v16; ++j)
                {
                  if (*(_DWORD *)(v63 + 4 * j) == *(_DWORD *)(v64 + 4 * j))
                    *(_DWORD *)(v64 + 4 * j) = 0;
                }
              }
              v63 += v34;
              v64 += v34;
            }
          }
          v67 = 0x7FFFFFFF;
          if (v92 == 0x7FFFFFFF && v89 == 0x7FFFFFFF && !(v17 | v16)
            || v86 == 0x7FFFFFFF && v84 == 0x7FFFFFFF && !v88 && !v83)
          {
            goto LABEL_75;
          }
          if (v92 == -2147483647 && v89 == -2147483647 && v16 == 0xFFFFFFFF && v17 == 0xFFFFFFFF)
          {
            v68 = v83;
            v67 = v84;
            v69 = v86;
          }
          else if (v86 == -2147483647 && v84 == -2147483647 && v88 == 0xFFFFFFFF && v83 == 0xFFFFFFFF)
          {
            v68 = v17;
            v88 = v16;
            v67 = v89;
            v69 = v92;
          }
          else
          {
            if (v92 <= v86)
              v69 = v86;
            else
              v69 = v92;
            v74 = v92 + v16;
            if (v92 + (int)v16 >= v86 + (int)v88)
              v74 = v86 + v88;
            v75 = __OFSUB__(v74, v69);
            v76 = v74 - v69;
            if (v76 < 0 != v75)
            {
LABEL_75:
              v68 = 0;
              v88 = 0;
LABEL_76:
              v69 = 0x7FFFFFFF;
              goto LABEL_77;
            }
            if (v89 <= v84)
              v67 = v84;
            else
              v67 = v89;
            v77 = v89 + v17;
            if (v89 + (int)v17 >= v84 + (int)v83)
              v77 = v84 + v83;
            v75 = __OFSUB__(v77, v67);
            v78 = v77 - v67;
            if (v78 < 0 != v75)
            {
              v68 = 0;
              v88 = 0;
              v67 = 0x7FFFFFFF;
              goto LABEL_76;
            }
            v88 = v76;
            v68 = v78;
          }
LABEL_77:
          if (v81 == 2056)
          {
            dest.height = v68;
            dest.width = 4 * v88;
            dest.data = (void *)(objc_msgSend(v87, "mutableBytes")
                               + (v89 + (int)v17 - (uint64_t)(v67 + (int)v68)) * v34
                               + 4 * (v69 - v79));
            dest.rowBytes = v34;
            v93.data = (void *)(v80 + (v84 + (int)v83 - (uint64_t)(v67 + (int)v68)) * v90 + 8 * (v69 - (uint64_t)v86));
            v93.height = v68;
            v93.width = 4 * v88;
            v93.rowBytes = v90;
            v70 = vImageConvert_Planar8toPlanar16F(&dest, &v93, 0);
            if (v70)
              NSLog(CFSTR("vImageConvert_Planar8toPlanar16F error %zi in CIRedEyeCorrection"), v70);
          }
          else if (v81 == 266)
          {
            if (!v33)
            {
              dest.data = v36;
              dest.height = v17;
              dest.width = v16;
              dest.rowBytes = v34;
              LODWORD(v93.data) = 50331906;
              vImagePermuteChannels_ARGB8888(&dest, &dest, (const uint8_t *)&v93, 0);
            }
            if (v68 && v88)
            {
              v71 = v67 + v68;
              v72 = (char *)(v80 + (v84 + (int)v83 - (uint64_t)(v67 + (int)v68)) * v90 + 4 * (v69 - (uint64_t)v86));
              v73 = &v36[4 * (v69 - v79) + (v89 + (int)v17 - (uint64_t)v71) * v34];
              do
              {
                memcpy(v72, v73, 4 * v88);
                v73 += v34;
                v72 += v90;
                --v68;
              }
              while (v68);
            }
          }
          else
          {
            NSLog(CFSTR("Unknown output pixel format in CIRedEyeCorrection %i"), v81);
          }
          goto LABEL_94;
        }
        v58 = (double)v92;
        v59 = (double)v89;
        v60 = (double)v16;
        v61 = (double)v17;
        goto LABEL_59;
      }
      v23 = -2147483647;
      LODWORD(v22) = -1;
      v24 = -2147483647;
    }
    v85 = v24;
    goto LABEL_11;
  }
LABEL_94:
  _ZZZ33__CIRedEyeCorrection_outputImage_EUb_EN13SignpostTimerD1Ev((TimerBase *)buf);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSString)inputCameraModel
{
  return self->inputCameraModel;
}

- (void)setInputCameraModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSDictionary)inputCorrectionInfo
{
  return self->inputCorrectionInfo;
}

- (void)setInputCorrectionInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

@end
