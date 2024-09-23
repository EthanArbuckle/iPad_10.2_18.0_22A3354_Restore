@implementation CIDepthBlurEffect

- (void)prewarm:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  CIImage *v5;
  CIRenderDestination *v6;
  CIImage *v7;
  CIImage *v8;
  CIImage *v9;
  CIImage *v10;
  CIImage *v11;
  CIImage *v12;
  CIImage *v13;
  uint64_t v14;
  CGColorSpace *v15;
  CIContext *v16;
  CIRenderDestination *v17;
  _QWORD block[6];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _BYTE v35[32768];
  _BYTE v36[65536];
  _QWORD v37[3];
  _QWORD v38[5];

  ((void (*)(CIDepthBlurEffect *, SEL, id))MEMORY[0x1E0C80A78])(self, a2, a3);
  v4 = v3;
  v38[3] = *MEMORY[0x1E0C80C00];
  if ((CI_SKIP_PREWARMING_SDOF_RENDERING() & 1) == 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[2] = ___ZL23prewarmSDOFFilterGraphsP9CIContext_block_invoke;
    block[3] = &unk_1E2EC2EE0;
    block[1] = 3221225472;
    block[4] = MEMORY[0x1E0C9AA60];
    block[5] = v4;
    if (prewarmSDOFFilterGraphs(CIContext *)::onceToken != -1)
      dispatch_once(&prewarmSDOFFilterGraphs(CIContext *)::onceToken, block);
    v37[0] = CFSTR("working_format");
    v38[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2054);
    v38[1] = MEMORY[0x1E0C9AAA0];
    v37[1] = CFSTR("kCIContextCacheIntermediates");
    v37[2] = CFSTR("kCIContextUseMetalRenderer");
    v38[2] = MEMORY[0x1E0C9AAB0];
    v16 = +[CIContext contextWithOptions:](CIContext, "contextWithOptions:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 3));
    v15 = +[CIContext defaultWorkingColorSpace](CIContext, "defaultWorkingColorSpace");
    v14 = objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 0x10000);
    v5 = +[CIImage imageWithBitmapData:bytesPerRow:size:format:colorSpace:](CIImage, "imageWithBitmapData:bytesPerRow:size:format:colorSpace:", v14, 512, 2054, v15, 128.0, 128.0);
    bzero(v36, 0x10000uLL);
    v6 = -[CIRenderDestination initWithBitmapData:width:height:bytesPerRow:format:]([CIRenderDestination alloc], "initWithBitmapData:width:height:bytesPerRow:format:", v36, 128, 128, 512, 2054);
    bzero(v35, 0x8000uLL);
    v17 = -[CIRenderDestination initWithBitmapData:width:height:bytesPerRow:format:]([CIRenderDestination alloc], "initWithBitmapData:width:height:bytesPerRow:format:", v35, 128, 128, 256, 2053);
    v33[0] = CFSTR("inputWidth");
    v33[1] = CFSTR("inputHeight");
    v34[0] = &unk_1E2F1C070;
    v34[1] = &unk_1E2F1C070;
    v7 = -[CIImage imageByApplyingFilter:withInputParameters:](v5, "imageByApplyingFilter:withInputParameters:", CFSTR("CIMorphologyRectangleMinimum"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2));
    v31[0] = CFSTR("inputWidth");
    v31[1] = CFSTR("inputHeight");
    v32[0] = &unk_1E2F1C070;
    v32[1] = &unk_1E2F1C070;
    v8 = -[CIImage imageByApplyingFilter:withInputParameters:](v7, "imageByApplyingFilter:withInputParameters:", CFSTR("CIMorphologyRectangleMaximum"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2));
    v29[0] = CFSTR("inputWidth");
    v29[1] = CFSTR("inputHeight");
    v30[0] = &unk_1E2F1C040;
    v30[1] = &unk_1E2F1C040;
    v9 = -[CIImage imageByApplyingFilter:withInputParameters:](v8, "imageByApplyingFilter:withInputParameters:", CFSTR("CIMorphologyRectangleMinimum"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2));
    v27[0] = CFSTR("inputWidth");
    v27[1] = CFSTR("inputHeight");
    v28[0] = &unk_1E2F1C040;
    v28[1] = &unk_1E2F1C040;
    -[CIContext startTaskToRender:toDestination:error:](v16, "startTaskToRender:toDestination:error:", -[CIImage imageByApplyingFilter:withInputParameters:](v9, "imageByApplyingFilter:withInputParameters:", CFSTR("CIMorphologyRectangleMaximum"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2)), v6, 0);

    v10 = +[CIImage imageWithBitmapData:bytesPerRow:size:format:colorSpace:](CIImage, "imageWithBitmapData:bytesPerRow:size:format:colorSpace:", v14, 256, 2053, v15, 128.0, 128.0);
    v25[0] = CFSTR("inputWidth");
    v25[1] = CFSTR("inputHeight");
    v26[0] = &unk_1E2F1C070;
    v26[1] = &unk_1E2F1C070;
    v11 = -[CIImage imageByApplyingFilter:withInputParameters:](v10, "imageByApplyingFilter:withInputParameters:", CFSTR("CIMorphologyRectangleMinimum"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2));
    v23[0] = CFSTR("inputWidth");
    v23[1] = CFSTR("inputHeight");
    v24[0] = &unk_1E2F1C070;
    v24[1] = &unk_1E2F1C070;
    v12 = -[CIImage imageByApplyingFilter:withInputParameters:](v11, "imageByApplyingFilter:withInputParameters:", CFSTR("CIMorphologyRectangleMaximum"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2));
    v21[0] = CFSTR("inputWidth");
    v21[1] = CFSTR("inputHeight");
    v22[0] = &unk_1E2F1C040;
    v22[1] = &unk_1E2F1C040;
    v13 = -[CIImage imageByApplyingFilter:withInputParameters:](v12, "imageByApplyingFilter:withInputParameters:", CFSTR("CIMorphologyRectangleMinimum"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2));
    v19[0] = CFSTR("inputWidth");
    v19[1] = CFSTR("inputHeight");
    v20[0] = &unk_1E2F1C040;
    v20[1] = &unk_1E2F1C040;
    -[CIContext startTaskToRender:toDestination:error:](v16, "startTaskToRender:toDestination:error:", -[CIImage imageByApplyingFilter:withInputParameters:](v13, "imageByApplyingFilter:withInputParameters:", CFSTR("CIMorphologyRectangleMaximum"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2)), v17, 0);

  }
}

+ (id)customAttributes
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  _QWORD v9[4];
  _QWORD v10[4];
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[6];
  _QWORD v22[6];
  _QWORD v23[6];
  _QWORD v24[6];
  _QWORD v25[4];
  _QWORD v26[14];
  _QWORD v27[16];

  v27[14] = *MEMORY[0x1E0C80C00];
  v26[0] = CFSTR("CIAttributeFilterCategories");
  v25[0] = CFSTR("CICategoryBlur");
  v25[1] = CFSTR("CICategoryVideo");
  v25[2] = CFSTR("CICategoryStillImage");
  v25[3] = CFSTR("CICategoryBuiltIn");
  v27[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 4);
  v27[1] = CFSTR("11");
  v26[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v26[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v27[2] = CFSTR("10.13");
  v26[3] = CFSTR("inputAperture");
  v23[0] = CFSTR("CIAttributeSliderMin");
  v23[1] = CFSTR("CIAttributeSliderMax");
  v24[0] = &unk_1E2F1B260;
  v24[1] = &unk_1E2F1B270;
  v23[2] = CFSTR("CIAttributeMin");
  v23[3] = CFSTR("CIAttributeMax");
  v24[2] = &unk_1E2F1B250;
  v24[3] = &unk_1E2F1B270;
  v23[4] = CFSTR("CIAttributeDefault");
  v23[5] = CFSTR("CIAttributeType");
  v24[4] = &unk_1E2F1B250;
  v24[5] = CFSTR("CIAttributeTypeScalar");
  v27[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 6);
  v26[4] = CFSTR("inputLumaNoiseScale");
  v21[0] = CFSTR("CIAttributeSliderMin");
  v21[1] = CFSTR("CIAttributeSliderMax");
  v22[0] = &unk_1E2F1B250;
  v22[1] = &unk_1E2F1B2A0;
  v21[2] = CFSTR("CIAttributeMin");
  v21[3] = CFSTR("CIAttributeMax");
  v22[2] = &unk_1E2F1B250;
  v22[3] = &unk_1E2F1B2A0;
  v21[4] = CFSTR("CIAttributeDefault");
  v21[5] = CFSTR("CIAttributeType");
  v22[4] = &unk_1E2F1B250;
  v22[5] = CFSTR("CIAttributeTypeScalar");
  v27[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 6);
  v26[5] = CFSTR("inputFocusRect");
  v19[0] = CFSTR("CIAttributeType");
  v19[1] = CFSTR("CIAttributeIdentity");
  v20[0] = CFSTR("CIAttributeTypeRectangle");
  v20[1] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", *MEMORY[0x1E0C9D5E0], *(double *)(MEMORY[0x1E0C9D5E0] + 8), *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
  v27[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v26[6] = CFSTR("inputLeftEyePositions");
  v17[1] = CFSTR("CIAttributeDefault");
  v18[0] = CFSTR("CIAttributeTypePosition");
  v17[0] = CFSTR("CIAttributeType");
  v18[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", -1.0, -1.0);
  v27[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v26[7] = CFSTR("inputRightEyePositions");
  v15[1] = CFSTR("CIAttributeDefault");
  v16[0] = CFSTR("CIAttributeTypePosition");
  v15[0] = CFSTR("CIAttributeType");
  v16[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", -1.0, -1.0);
  v27[7] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v26[8] = CFSTR("inputChinPositions");
  v13[1] = CFSTR("CIAttributeDefault");
  v14[0] = CFSTR("CIAttributeTypePosition");
  v13[0] = CFSTR("CIAttributeType");
  v14[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", -1.0, -1.0);
  v27[8] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v26[9] = CFSTR("inputNosePositions");
  v11[1] = CFSTR("CIAttributeDefault");
  v12[0] = CFSTR("CIAttributeTypePosition");
  v11[0] = CFSTR("CIAttributeType");
  v12[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", -1.0, -1.0);
  v27[9] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v26[10] = CFSTR("inputScaleFactor");
  v9[0] = CFSTR("CIAttributeType");
  v9[1] = CFSTR("CIAttributeSliderMin");
  v10[0] = CFSTR("CIAttributeTypeScalar");
  v10[1] = &unk_1E2F1B250;
  v9[2] = CFSTR("CIAttributeSliderMax");
  v9[3] = CFSTR("CIAttributeDefault");
  v10[2] = &unk_1E2F1B260;
  v10[3] = &unk_1E2F1B260;
  v27[10] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v26[11] = CFSTR("inputCalibrationData");
  v7 = CFSTR("CIAttributeClass");
  v8 = CFSTR("AVCameraCalibrationData");
  v27[11] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
  v26[12] = CFSTR("inputAuxDataMetadata");
  v5 = CFSTR("CIAttributeClass");
  v6 = CFSTR("CGImageMetadataRef");
  v27[12] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1);
  v26[13] = CFSTR("inputShape");
  v3 = CFSTR("CIAttributeClass");
  v4 = CFSTR("NSString");
  v27[13] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 14);
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  const __CFString *v7;
  objc_super v8;

  if (objc_msgSend(a4, "isEqualToString:", CFSTR("inputShiftmapImage")))
  {
    v7 = CFSTR("inputDisparityImage");
LABEL_13:
    -[CIDepthBlurEffect setValue:forKey:](self, "setValue:forKey:", a3, v7);
    return;
  }
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("inputLeftEyePosition")))
  {
    v7 = CFSTR("inputLeftEyePositions");
    goto LABEL_13;
  }
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("inputRightEyePosition")))
  {
    v7 = CFSTR("inputRightEyePositions");
    goto LABEL_13;
  }
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("inputChinPosition")))
  {
    v7 = CFSTR("inputChinPositions");
    goto LABEL_13;
  }
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("inputFaceMidPoint")))
  {
    v7 = CFSTR("inputNosePositions");
    goto LABEL_13;
  }
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("inputScale")))
  {
    v7 = CFSTR("inputScaleFactor");
    goto LABEL_13;
  }
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("inputShiftMin")) & 1) == 0
    && (objc_msgSend(a4, "isEqualToString:", CFSTR("inputShiftMax")) & 1) == 0
    && (objc_msgSend(a4, "isEqualToString:", CFSTR("inputUseMipmaps")) & 1) == 0
    && (objc_msgSend(a4, "isEqualToString:", CFSTR("inputUseNativeImage")) & 1) == 0
    && (objc_msgSend(a4, "isEqualToString:", CFSTR("inputUseNormalizedDisparity")) & 1) == 0
    && (objc_msgSend(a4, "isEqualToString:", CFSTR("inputOriginalSize")) & 1) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)CIDepthBlurEffect;
    -[CIFilter setValue:forUndefinedKey:](&v8, sel_setValue_forUndefinedKey_, a3, a4);
  }
}

- (id)_getFocusRect:(id)a3 focusRect:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  CGRect v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;
  CGRect v27;

  v26 = *MEMORY[0x1E0C80C00];
  if (!a4 || (v5 = a4, objc_msgSend(a4, "CGRectValue"), CGRectEqualToRect(v27, *MEMORY[0x1E0C9D5E0])))
  {
    v6 = (void *)objc_msgSend(a3, "properties");
    if (v6)
    {
      v7 = (void *)objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CBCA28]);
      if (v7)
      {
        v8 = (void *)objc_msgSend(v7, "objectForKey:", CFSTR("Regions"));
        if (v8)
        {
          v9 = (void *)objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0CBCAC8]);
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v22;
            v13 = *MEMORY[0x1E0CBCAD0];
            v14 = *MEMORY[0x1E0CBCAB8];
            while (2)
            {
              for (i = 0; i != v11; ++i)
              {
                if (*(_QWORD *)v22 != v12)
                  objc_enumerationMutation(v9);
                v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
                v17 = (void *)objc_msgSend(v16, "objectForKey:", v13);
                if (v17
                  && objc_msgSend(v17, "isEqualToString:", v14)
                  && CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)v16, &v20))
                {
                  v20.origin.x = v20.origin.x - v20.size.width * 0.5;
                  v20.origin.y = 1.0 - v20.origin.y - v20.size.height * 0.5;
                  return +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", *(_QWORD *)&v20.origin.x, *(_QWORD *)&v20.origin.y);
                }
              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
              if (v11)
                continue;
              break;
            }
          }
        }
      }
    }
    return +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.45, 0.45, 0.1, 0.1);
  }
  return v5;
}

- (id)outputImage
{
  id result;
  float v4;
  float v5;
  float v6;
  const CGImageMetadata *inputDisparityImage;
  NSNumber *inputLumaNoiseScale;
  float v9;
  float v10;
  NSDictionary *v11;
  const __CFDictionary *Value;
  const __CFNumber *v13;
  NSDictionary *v14;
  char v15;
  void *v16;
  float v17;
  int v18;
  int v19;
  id v20;
  CIImage *inputImage;
  CIImage *v22;
  double v23;
  double v24;
  unint64_t v25;
  CIFilter *v26;
  CFTypeID TypeID;
  void *inputAuxDataMetadata;
  int v29;
  int v30;
  NSObject *v31;
  CGImageMetadata *MutableCopy;
  CGImageMetadata *v33;
  _BOOL4 v34;
  _DWORD *v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  CGImageMetadata *v44;
  NSObject *v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  int v72;
  int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  int v80;
  int v81;
  int v82;
  int v83;
  int v84;
  int v85;
  int v86;
  int v87;
  int v88;
  int v89;
  int v90;
  int v91;
  int v92;
  int v93;
  int v94;
  int v95;
  int v96;
  int v97;
  int v98;
  int v99;
  int v100;
  int v101;
  int v102;
  int v103;
  int v104;
  int v105;
  int v106;
  int v107;
  int v108;
  int v109;
  int v110;
  int v111;
  int v112;
  int v113;
  int v114;
  int v115;
  int v116;
  int v117;
  int v118;
  int v119;
  int v120;
  int v121;
  int v122;
  int v123;
  int v124;
  int v125;
  int v126;
  int v127;
  int v128;
  int v129;
  int v130;
  int v131;
  int v132;
  int v133;
  int v134;
  int v135;
  int v136;
  int v137;
  int v138;
  int v139;
  int v140;
  int v141;
  int v142;
  int v143;
  int v144;
  int v145;
  int v146;
  int v147;
  int v148;
  int v149;
  int v150;
  int v151;
  int v152;
  int v153;
  int v154;
  int v155;
  int v156;
  int v157;
  int v158;
  int v159;
  int v160;
  int v161;
  int v162;
  int v163;
  int v164;
  int v165;
  int v166;
  int v167;
  int v168;
  int v169;
  int v170;
  int v171;
  int v172;
  int v173;
  int v174;
  int v175;
  int v176;
  int v177;
  int v178;
  int v179;
  int v180;
  int v181;
  int v182;
  int v183;
  int v184;
  int v185;
  int v186;
  int v187;
  int v188;
  int v189;
  int v190;
  int v191;
  int v192;
  int v193;
  int v194;
  int v195;
  int v196;
  int v197;
  int v198;
  int v199;
  int v200;
  int v201;
  int v202;
  int v203;
  int v204;
  int v205;
  int v206;
  void *v207;
  _BYTE *v208;
  NSObject *v209;
  const char *v210;
  NSObject *v211;
  uint32_t v212;
  NSObject *v213;
  char v214;
  AVCameraCalibrationData *inputCalibrationData;
  CIVector *inputLeftEyePositions;
  CIVector *inputRightEyePositions;
  CIVector *inputChinPositions;
  CIVector *inputNosePositions;
  CIImage *inputMatteImage;
  double v221;
  double v222;
  CIImage *inputHairImage;
  double v224;
  double v225;
  CIImage *inputGlassesImage;
  double v227;
  double v228;
  CIImage *inputGainMap;
  double v230;
  double v231;
  uint64_t v232;
  double v233;
  double v234;
  double v235;
  uint64_t v236;
  NSString *inputShape;
  const __CFString *v238;
  CIFilter *v239;
  CIFilter *v240;
  CIImage *v241;
  double v242;
  double v243;
  CIImage *v244;
  double v245;
  double v246;
  _QWORD v247[6];
  _QWORD v248[6];
  _QWORD v249[5];
  _QWORD v250[5];
  _QWORD valuePtr[4];

  valuePtr[2] = *MEMORY[0x1E0C80C00];
  result = self->inputImage;
  if (!result || !self->inputDisparityImage)
    return result;
  -[NSNumber floatValue](self->inputScaleFactor, "floatValue");
  v4 = 0.0;
  v6 = fminf(fmaxf(v5, 0.0), 1.0);
  if (v6 < 0.001)
    return self->inputImage;
  inputDisparityImage = (const CGImageMetadata *)metadataFromValue(self->inputAuxDataMetadata);
  inputLumaNoiseScale = self->inputLumaNoiseScale;
  if (inputLumaNoiseScale)
  {
    -[NSNumber floatValue](inputLumaNoiseScale, "floatValue");
    v4 = fminf(fmaxf(v9, 0.0), 1.0);
    inputLumaNoiseScale = self->inputLumaNoiseScale;
  }
  -[NSNumber floatValue](inputLumaNoiseScale, "floatValue");
  if (v10 == 0.0)
  {
    v11 = -[CIImage properties](self->inputImage, "properties");
    if (v11)
    {
      LODWORD(valuePtr[0]) = 2143289344;
      Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)v11, (const void *)*MEMORY[0x1E0CBCF70]);
      v4 = 0.0;
      if (Value)
      {
        v13 = (const __CFNumber *)CFDictionaryGetValue(Value, CFSTR("29"));
        if (v13)
        {
          CFNumberGetValue(v13, kCFNumberFloatType, valuePtr);
          v4 = *(float *)valuePtr;
        }
      }
    }
  }
  if (inputDisparityImage)
  {
LABEL_12:
    v14 = (NSDictionary *)tuningParametersFromMetaData(inputDisparityImage);
    v15 = 0;
    if (v14)
      goto LABEL_21;
    goto LABEL_20;
  }
  inputDisparityImage = (const CGImageMetadata *)self->inputDisparityImage;
  if (inputDisparityImage)
  {
    if (-[CIImage properties](self->inputDisparityImage, "properties"))
    {
      v16 = (void *)-[CGImageMetadata properties](inputDisparityImage, "properties");
      inputDisparityImage = (const CGImageMetadata *)objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC6D0]);
      if (inputDisparityImage)
        goto LABEL_12;
    }
    else
    {
      inputDisparityImage = 0;
    }
  }
  v15 = 1;
LABEL_20:
  v14 = (NSDictionary *)tuningParametersFromImage(self->inputDisparityImage);
LABEL_21:
  if (v4 == 0.0)
  {
    SDOFRenderingValue(CFSTR("lumaNoiseScale"), v14);
    v4 = v17;
  }
  getSimulatedAperture(self->inputDisparityImage, inputDisparityImage, self->inputAperture, v14);
  v19 = v18;
  v20 = -[CIDepthBlurEffect _getFocusRect:focusRect:](self, "_getFocusRect:focusRect:", self->inputImage, self->inputFocusRect);
  inputImage = self->inputImage;
  v249[0] = CFSTR("inputImage");
  v249[1] = CFSTR("inputShiftmapImage");
  v22 = self->inputDisparityImage;
  v250[0] = inputImage;
  v250[1] = v22;
  v250[2] = v20;
  v249[2] = CFSTR("inputFocusRect");
  v249[3] = CFSTR("inputScale");
  *(float *)&v23 = v6;
  v250[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23);
  v249[4] = CFSTR("inputAperture");
  LODWORD(v24) = v19;
  v250[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24);
  v25 = 0x1E0C99000uLL;
  v26 = +[CIFilter filterWithName:withInputParameters:](CIFilter, "filterWithName:withInputParameters:", CFSTR("CIDepthEffectMakeBlurMap"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v250, v249, 5));
  if (!self->inputAuxDataMetadata)
    goto LABEL_58;
  TypeID = CFDictionaryGetTypeID();
  if (TypeID != CFGetTypeID(self->inputAuxDataMetadata))
    goto LABEL_58;
  inputAuxDataMetadata = self->inputAuxDataMetadata;
  if (!inputAuxDataMetadata)
    goto LABEL_58;
  if ((v15 & 1) != 0)
  {
    inputDisparityImage = (const CGImageMetadata *)self->inputAuxDataMetadata;
LABEL_59:
    -[CIFilter setValue:forKey:](v26, "setValue:forKey:", inputDisparityImage, CFSTR("inputAuxDataMetadata"));
    v214 = 0;
    goto LABEL_61;
  }
  v29 = objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Version")), "intValue");
  v30 = v29;
  if (v29 < 4)
  {
    switch(v29)
    {
      case 3:
        v35 = malloc_type_calloc(1uLL, 0x1D8uLL, 0x1000040156972F5uLL);
        *(_QWORD *)v35 = 0x3444E4552;
        v35[2] = 472;
        v35[3] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("DisparityRefinement")), "objectForKeyedSubscript:", CFSTR("radius")), "intValue");
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("DisparityRefinement")), "objectForKeyedSubscript:", CFSTR("disparitySigma")), "floatValue");
        v35[4] = v46;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("DisparityRefinement")), "objectForKeyedSubscript:", CFSTR("aaLumaSigma")), "floatValue");
        v35[5] = v47;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("DisparityRefinement")), "objectForKeyedSubscript:", CFSTR("aaChromaSigma")), "floatValue");
        v35[6] = v48;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("DisparityRefinement")), "objectForKeyedSubscript:", CFSTR("aaSpatialSigma")), "floatValue");
        v35[7] = v49;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("faces.linearBlurGrowthM")), "floatValue");
        v35[9] = v50;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("faces.linearBlurGrowthC")), "floatValue");
        v35[10] = v51;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("faces.distToBlurScaling")), "floatValue");
        v35[11] = v52;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("faces.eyeToEyebrowRatio")), "floatValue");
        v35[12] = v53;
        v35[13] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("HighlightRecovery")), "objectForKeyedSubscript:", CFSTR("iterations")), "intValue");
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("HighlightRecovery")), "objectForKeyedSubscript:", CFSTR("preFilterGain")), "floatValue");
        v35[14] = v54;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("HighlightRecovery")), "objectForKeyedSubscript:", CFSTR("weightGain")), "floatValue");
        v35[15] = v55;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("HighlightRecovery")), "objectForKeyedSubscript:", CFSTR("intensityGain")), "floatValue");
        v35[16] = v56;
        v35[17] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("nRings")), "intValue");
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("relativeWeightThreshold")), "floatValue");
        v35[18] = v57;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("highlightBoostGain")), "floatValue");
        v35[19] = v58;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("shapeObstructionCoeff")), "floatValue");
        v35[20] = v59;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("ringAmplitude")), "floatValue");
        v35[21] = v60;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("ringSharpness")), "floatValue");
        v35[22] = v61;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("preFilterBlurStrength")), "floatValue");
        v35[23] = v62;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("antiAliasBlurStrength")), "floatValue");
        v35[24] = v63;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("minimumSimulatedAperture")), "floatValue");
        v35[25] = v64;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("blendingQuarterResAlphaGain")), "floatValue");
        v35[26] = v65;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("blendingFullResAlphaGain")), "floatValue");
        v35[27] = v66;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("DisparityRefinement")), "objectForKeyedSubscript:", CFSTR("weightScaling")), "floatValue");
        v35[28] = v67;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("DisparityRefinement")), "objectForKeyedSubscript:", CFSTR("maxReconstructionWeight")), "floatValue");
        v35[29] = v68;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("DisparityRefinement")), "objectForKeyedSubscript:", CFSTR("innerSamplingRadius")), "floatValue");
        v35[30] = v69;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("DisparityRefinement")), "objectForKeyedSubscript:", CFSTR("outerSamplingRadius")), "floatValue");
        v35[31] = v70;
        v35[32] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("DisparityRefinement")), "objectForKeyedSubscript:", CFSTR("nSamples")), "intValue");
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("DisparityRefinement")), "objectForKeyedSubscript:", CFSTR("lumaSigma")), "floatValue");
        v35[33] = v71;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("DisparityRefinement")), "objectForKeyedSubscript:", CFSTR("chromaSigma")), "floatValue");
        v35[34] = v72;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("DisparityRefinement")), "objectForKeyedSubscript:", CFSTR("accumulatedWeightT0")), "floatValue");
        v35[35] = v73;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("DisparityRefinement")), "objectForKeyedSubscript:", CFSTR("accumulatedWeightT1")), "floatValue");
        v35[36] = v74;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("DisparityRefinement")), "objectForKeyedSubscript:", CFSTR("aaSegmentationSigma")), "floatValue");
        v35[69] = v75;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("DisparityRefinement")), "objectForKeyedSubscript:", CFSTR("segmentationSigma")), "floatValue");
        v35[68] = v76;
        v35[70] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("DisparityRefinement")), "objectForKeyedSubscript:", CFSTR("Version")), "intValue");
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("SLM")), "objectForKeyedSubscript:", CFSTR("shiftDeadZone")), "floatValue");
        v35[8] = v77;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("SLM")), "objectForKeyedSubscript:", CFSTR("zeroShiftPercentile")), "floatValue");
        v35[37] = v78;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("SLM")), "objectForKeyedSubscript:", CFSTR("maxFGBlur")), "floatValue");
        v35[38] = v79;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("SLM")), "objectForKeyedSubscript:", CFSTR("maximumSimulatedAperture")), "floatValue");
        v35[67] = v80;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("SLM")), "objectForKeyedSubscript:", CFSTR("defaultSimulatedAperture")), "floatValue");
        v35[71] = v81;
        v35[39] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapSmoothing")), "objectForKeyedSubscript:", CFSTR("nIterations")), "intValue");
        v35[40] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("preFilterRadius")), "intValue");
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("sharpRadius")), "floatValue");
        v35[41] = v82;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("softRadius")), "floatValue");
        v35[42] = v83;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("lumaNoiseModelCoeff")), "floatValue");
        v35[43] = v84;
        v35[44] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("antiAliasRadius")), "intValue");
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("alphaEpsilon")), "floatValue");
        v35[45] = v85;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("alphaGain")), "floatValue");
        v35[46] = v86;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("HighlightRecovery")), "objectForKeyedSubscript:", CFSTR("blurRadiusT0")), "floatValue");
        v35[47] = v87;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("HighlightRecovery")), "objectForKeyedSubscript:", CFSTR("blurRadiusT1")), "floatValue");
        v35[48] = v88;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("HighlightRecovery")), "objectForKeyedSubscript:", CFSTR("maxIntensityT0")), "floatValue");
        v35[49] = v89;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("HighlightRecovery")), "objectForKeyedSubscript:", CFSTR("maxIntensityT1")), "floatValue");
        v35[50] = v90;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("HighlightRecovery")), "objectForKeyedSubscript:", CFSTR("minIntensityT0")), "floatValue");
        v35[51] = v91;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("HighlightRecovery")), "objectForKeyedSubscript:", CFSTR("minIntensityT1")), "floatValue");
        v35[52] = v92;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("faces.maxBlurOnEyes")), "floatValue");
        v35[53] = v93;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("faces.maxBlurDistFromFocus")), "floatValue");
        v35[54] = v94;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("faces.capMultip")), "floatValue");
        v35[55] = v95;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("faces.gainMultip")), "floatValue");
        v35[56] = v96;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Fusion")), "objectForKeyedSubscript:", CFSTR("subtractiveLowerAlpha")), "floatValue");
        v35[57] = v97;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Fusion")), "objectForKeyedSubscript:", CFSTR("subtractiveUpperAlpha")), "floatValue");
        v35[58] = v98;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Fusion")), "objectForKeyedSubscript:", CFSTR("subtractiveMaxBlur")), "floatValue");
        v35[59] = v99;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Fusion")), "objectForKeyedSubscript:", CFSTR("additiveLowerAlpha")), "floatValue");
        v35[60] = v100;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Fusion")), "objectForKeyedSubscript:", CFSTR("additiveUpperAlpha")), "floatValue");
        v35[61] = v101;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Fusion")), "objectForKeyedSubscript:", CFSTR("additiveMaxBlur")), "floatValue");
        v35[62] = v102;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapSmoothing")), "objectForKeyedSubscript:", CFSTR("originalBlurValueT0")), "floatValue");
        v35[63] = v103;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapSmoothing")), "objectForKeyedSubscript:", CFSTR("originalBlurValueT1")), "floatValue");
        v35[64] = v104;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapSmoothing")), "objectForKeyedSubscript:", CFSTR("localMinimumBlurValueT0")), "floatValue");
        v35[65] = v105;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapSmoothing")), "objectForKeyedSubscript:", CFSTR("localMinimumBlurValueT1")), "floatValue");
        v35[66] = v106;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapRefinement")), "objectForKeyedSubscript:", CFSTR("subjectDistanceMinimumFocusDistance")), "floatValue");
        v35[73] = v107;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapRefinement")), "objectForKeyedSubscript:", CFSTR("subjectDistanceMaximumFocusDistance")), "floatValue");
        v35[74] = v108;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapRefinement")), "objectForKeyedSubscript:", CFSTR("subjectDistanceScalingFactor")), "floatValue");
        v35[75] = v109;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapRefinement")), "objectForKeyedSubscript:", CFSTR("subjectDistanceOffset")), "floatValue");
        v35[76] = v110;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapRefinement")), "objectForKeyedSubscript:", CFSTR("protectBodyStrength")), "floatValue");
        v35[77] = v111;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapRefinement")), "objectForKeyedSubscript:", CFSTR("maxBlur")), "floatValue");
        v35[78] = v112;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapRefinement")), "objectForKeyedSubscript:", CFSTR("smoothstepMin")), "floatValue");
        v35[79] = v113;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapRefinement")), "objectForKeyedSubscript:", CFSTR("smoothstepMax")), "floatValue");
        v35[80] = v114;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapRefinement")), "objectForKeyedSubscript:", CFSTR("distanceAdd")), "floatValue");
        v35[81] = v115;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapRefinement")), "objectForKeyedSubscript:", CFSTR("faceMaskAdditiveMaxBlur")), "floatValue");
        v35[82] = v116;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapRefinement")), "objectForKeyedSubscript:", CFSTR("faceMaskSubtractiveMaxBlur")), "floatValue");
        v35[83] = v117;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapRefinement")), "objectForKeyedSubscript:", CFSTR("personDistance")), "floatValue");
        v35[84] = v118;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapRefinement")), "objectForKeyedSubscript:", CFSTR("personThreshold")), "floatValue");
        v35[85] = v119;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapRefinement")), "objectForKeyedSubscript:", CFSTR("personMaxBlur")), "floatValue");
        v35[86] = v120;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapRefinement")), "objectForKeyedSubscript:", CFSTR("hairDistance")), "floatValue");
        v35[87] = v121;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapRefinement")), "objectForKeyedSubscript:", CFSTR("hairThreshold")), "floatValue");
        v35[88] = v122;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapRefinement")), "objectForKeyedSubscript:", CFSTR("hairMaxBlur")), "floatValue");
        v35[89] = v123;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapRefinement")), "objectForKeyedSubscript:", CFSTR("hairSubtractiveLowerAlpha")), "floatValue");
        v35[90] = v124;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapRefinement")), "objectForKeyedSubscript:", CFSTR("hairSubtractiveUpperAlpha")), "floatValue");
        v35[91] = v125;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapRefinement")), "objectForKeyedSubscript:", CFSTR("hairAdditiveLowerAlpha")), "floatValue");
        v35[92] = v126;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapRefinement")), "objectForKeyedSubscript:", CFSTR("hairAdditiveUpperAlpha")), "floatValue");
        v35[93] = v127;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapRefinement")), "objectForKeyedSubscript:", CFSTR("hairAdditiveMaxBlur")), "floatValue");
        v35[94] = v128;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapRefinement")), "objectForKeyedSubscript:", CFSTR("hairSubtractiveMaxBlur")), "floatValue");
        v35[95] = v129;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapRefinement")), "objectForKeyedSubscript:", CFSTR("relativeApertureScalingStrength")), "floatValue");
        v35[96] = v130;
        v35[97] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapRefinement")), "objectForKeyedSubscript:", CFSTR("eyeProtectionMaxFaces")), "intValue");
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapRefinement")), "objectForKeyedSubscript:", CFSTR("eyeProtectionFaceWeightsSmoothStepMin")), "floatValue");
        v35[98] = v131;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapRefinement")), "objectForKeyedSubscript:", CFSTR("eyeProtectionFaceWeightsSmoothStepMax")), "floatValue");
        v35[99] = v132;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapRefinement")), "objectForKeyedSubscript:", CFSTR("eyeProtectionOvalDimsDistanceScale")), "floatValue");
        v35[100] = v133;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapRefinement")), "objectForKeyedSubscript:", CFSTR("beyeProtectionOvalDimsDistanceOffset")), "floatValue");
        v35[101] = v134;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapRefinement")), "objectForKeyedSubscript:", CFSTR("eyeProtectionOvalDimsRadiusHorizontal")), "floatValue");
        v35[102] = v135;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapRefinement")), "objectForKeyedSubscript:", CFSTR("eyeProtectionOvalDimsRadiusVertical")), "floatValue");
        v35[103] = v136;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapRefinement")), "objectForKeyedSubscript:", CFSTR("eyeProtectionOvalFallOffSmoothStepMin")), "floatValue");
        v35[104] = v137;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapRefinement")), "objectForKeyedSubscript:", CFSTR("eyeProtectionOvalFallOffSmoothStepMax")), "floatValue");
        v35[105] = v138;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapRefinement")), "objectForKeyedSubscript:", CFSTR("eyeProtectionPersonMaskSmoothStepMin")), "floatValue");
        v35[106] = v139;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapRefinement")), "objectForKeyedSubscript:", CFSTR("eyeProtectionPersonMaskSmoothStepMax")), "floatValue");
        v35[107] = v140;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapRefinement")), "objectForKeyedSubscript:", CFSTR("eyeProtectionPreventStrength")), "floatValue");
        v35[108] = v141;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapRefinement")), "objectForKeyedSubscript:", CFSTR("eyeProtectionSubtractiveMaxBlur")), "floatValue");
        v35[109] = v142;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapRefinement")), "objectForKeyedSubscript:", CFSTR("eyeProtectionSubtractiveApertureScaling")), "floatValue");
        v35[110] = v143;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("SLM")), "objectForKeyedSubscript:", CFSTR("disparityScalingFactor")), "floatValue");
        v35[72] = v144;
        *(_QWORD *)(v35 + 111) = 0;
        *(_QWORD *)(v35 + 113) = 0;
        *(_QWORD *)(v35 + 115) = 0;
        v35[117] = 0;
        break;
      case 2:
        v35 = malloc_type_calloc(1uLL, 0x140uLL, 0x1000040B2834900uLL);
        *(_QWORD *)v35 = 0x2444E4552;
        v35[2] = 320;
        v35[3] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("DisparityRefinement")), "objectForKeyedSubscript:", CFSTR("radius")), "intValue");
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("DisparityRefinement")), "objectForKeyedSubscript:", CFSTR("disparitySigma")), "floatValue");
        v35[4] = v145;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("DisparityRefinement")), "objectForKeyedSubscript:", CFSTR("aaLumaSigma")), "floatValue");
        v35[5] = v146;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("DisparityRefinement")), "objectForKeyedSubscript:", CFSTR("aaChromaSigma")), "floatValue");
        v35[6] = v147;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("DisparityRefinement")), "objectForKeyedSubscript:", CFSTR("aaSpatialSigma")), "floatValue");
        v35[7] = v148;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("faces.linearBlurGrowthM")), "floatValue");
        v35[9] = v149;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("faces.linearBlurGrowthC")), "floatValue");
        v35[10] = v150;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("faces.distToBlurScaling")), "floatValue");
        v35[11] = v151;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("faces.eyeToEyebrowRatio")), "floatValue");
        v35[12] = v152;
        v35[13] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("HighlightRecovery")), "objectForKeyedSubscript:", CFSTR("iterations")), "intValue");
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("HighlightRecovery")), "objectForKeyedSubscript:", CFSTR("preFilterGain")), "floatValue");
        v35[14] = v153;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("HighlightRecovery")), "objectForKeyedSubscript:", CFSTR("weightGain")), "floatValue");
        v35[15] = v154;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("HighlightRecovery")), "objectForKeyedSubscript:", CFSTR("intensityGain")), "floatValue");
        v35[16] = v155;
        v35[17] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("nRings")), "intValue");
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("relativeWeightThreshold")), "floatValue");
        v35[18] = v156;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("highlightBoostGain")), "floatValue");
        v35[19] = v157;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("shapeObstructionCoeff")), "floatValue");
        v35[20] = v158;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("ringAmplitude")), "floatValue");
        v35[21] = v159;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("ringSharpness")), "floatValue");
        v35[22] = v160;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("preFilterBlurStrength")), "floatValue");
        v35[23] = v161;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("antiAliasBlurStrength")), "floatValue");
        v35[24] = v162;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("minimumSimulatedAperture")), "floatValue");
        v35[25] = v163;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("blendingQuarterResAlphaGain")), "floatValue");
        v35[26] = v164;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("blendingFullResAlphaGain")), "floatValue");
        v35[27] = v165;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("DisparityRefinement")), "objectForKeyedSubscript:", CFSTR("weightScaling")), "floatValue");
        v35[28] = v166;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("DisparityRefinement")), "objectForKeyedSubscript:", CFSTR("maxReconstructionWeight")), "floatValue");
        v35[29] = v167;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("DisparityRefinement")), "objectForKeyedSubscript:", CFSTR("innerSamplingRadius")), "floatValue");
        v35[30] = v168;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("DisparityRefinement")), "objectForKeyedSubscript:", CFSTR("outerSamplingRadius")), "floatValue");
        v35[31] = v169;
        v35[32] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("DisparityRefinement")), "objectForKeyedSubscript:", CFSTR("nSamples")), "intValue");
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("DisparityRefinement")), "objectForKeyedSubscript:", CFSTR("lumaSigma")), "floatValue");
        v35[33] = v170;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("DisparityRefinement")), "objectForKeyedSubscript:", CFSTR("chromaSigma")), "floatValue");
        v35[34] = v171;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("DisparityRefinement")), "objectForKeyedSubscript:", CFSTR("accumulatedWeightT0")), "floatValue");
        v35[35] = v172;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("DisparityRefinement")), "objectForKeyedSubscript:", CFSTR("accumulatedWeightT1")), "floatValue");
        v35[36] = v173;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("DisparityRefinement")), "objectForKeyedSubscript:", CFSTR("aaSegmentationSigma")), "floatValue");
        v35[69] = v174;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("DisparityRefinement")), "objectForKeyedSubscript:", CFSTR("segmentationSigma")), "floatValue");
        v35[68] = v175;
        v35[70] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("DisparityRefinement")), "objectForKeyedSubscript:", CFSTR("Version")), "intValue");
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("SLM")), "objectForKeyedSubscript:", CFSTR("shiftDeadZone")), "floatValue");
        v35[8] = v176;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("SLM")), "objectForKeyedSubscript:", CFSTR("zeroShiftPercentile")), "floatValue");
        v35[37] = v177;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("SLM")), "objectForKeyedSubscript:", CFSTR("maxFGBlur")), "floatValue");
        v35[38] = v178;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("SLM")), "objectForKeyedSubscript:", CFSTR("maximumSimulatedAperture")), "floatValue");
        v35[67] = v179;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("SLM")), "objectForKeyedSubscript:", CFSTR("defaultSimulatedAperture")), "floatValue");
        v35[71] = v180;
        v35[39] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapSmoothing")), "objectForKeyedSubscript:", CFSTR("nIterations")), "intValue");
        v35[40] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("preFilterRadius")), "intValue");
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("sharpRadius")), "floatValue");
        v35[41] = v181;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("softRadius")), "floatValue");
        v35[42] = v182;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("lumaNoiseModelCoeff")), "floatValue");
        v35[43] = v183;
        v35[44] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("antiAliasRadius")), "intValue");
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("alphaEpsilon")), "floatValue");
        v35[45] = v184;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("alphaGain")), "floatValue");
        v35[46] = v185;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("HighlightRecovery")), "objectForKeyedSubscript:", CFSTR("blurRadiusT0")), "floatValue");
        v35[47] = v186;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("HighlightRecovery")), "objectForKeyedSubscript:", CFSTR("blurRadiusT1")), "floatValue");
        v35[48] = v187;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("HighlightRecovery")), "objectForKeyedSubscript:", CFSTR("maxIntensityT0")), "floatValue");
        v35[49] = v188;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("HighlightRecovery")), "objectForKeyedSubscript:", CFSTR("maxIntensityT1")), "floatValue");
        v35[50] = v189;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("HighlightRecovery")), "objectForKeyedSubscript:", CFSTR("minIntensityT0")), "floatValue");
        v35[51] = v190;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("HighlightRecovery")), "objectForKeyedSubscript:", CFSTR("minIntensityT1")), "floatValue");
        v35[52] = v191;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("faces.maxBlurOnEyes")), "floatValue");
        v35[53] = v192;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("faces.maxBlurDistFromFocus")), "floatValue");
        v35[54] = v193;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("faces.capMultip")), "floatValue");
        v35[55] = v194;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("faces.gainMultip")), "floatValue");
        v35[56] = v195;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Fusion")), "objectForKeyedSubscript:", CFSTR("subtractiveLowerAlpha")), "floatValue");
        v35[57] = v196;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Fusion")), "objectForKeyedSubscript:", CFSTR("subtractiveUpperAlpha")), "floatValue");
        v35[58] = v197;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Fusion")), "objectForKeyedSubscript:", CFSTR("subtractiveMaxBlur")), "floatValue");
        v35[59] = v198;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Fusion")), "objectForKeyedSubscript:", CFSTR("additiveLowerAlpha")), "floatValue");
        v35[60] = v199;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Fusion")), "objectForKeyedSubscript:", CFSTR("additiveUpperAlpha")), "floatValue");
        v35[61] = v200;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Fusion")), "objectForKeyedSubscript:", CFSTR("additiveMaxBlur")), "floatValue");
        v35[62] = v201;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapSmoothing")), "objectForKeyedSubscript:", CFSTR("originalBlurValueT0")), "floatValue");
        v35[63] = v202;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapSmoothing")), "objectForKeyedSubscript:", CFSTR("originalBlurValueT1")), "floatValue");
        v35[64] = v203;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapSmoothing")), "objectForKeyedSubscript:", CFSTR("localMinimumBlurValueT0")), "floatValue");
        v35[65] = v204;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("BlurMapSmoothing")), "objectForKeyedSubscript:", CFSTR("localMinimumBlurValueT1")), "floatValue");
        v35[66] = v205;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("SLM")), "objectForKeyedSubscript:", CFSTR("disparityScalingFactor")), "floatValue");
        v35[72] = v206;
        *(_QWORD *)(v35 + 73) = 0;
        *(_QWORD *)(v35 + 75) = 0;
        *(_QWORD *)(v35 + 77) = 0;
        v35[79] = 0;
        break;
      case 1:
        v35 = malloc_type_calloc(1uLL, 0x30uLL, 0x1000040EED21634uLL);
        *(_QWORD *)v35 = 0x1444E4552;
        v35[2] = 48;
        v35[3] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("DisparitySmoothing")), "objectForKeyedSubscript:", CFSTR("nIterations")), "unsignedIntValue");
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("SLM")), "objectForKeyedSubscript:", CFSTR("shiftDeadZone")), "floatValue");
        v35[4] = v36;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("faces.linearBlurGrowthC")), "floatValue");
        v35[6] = v37;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("faces.linearBlurGrowthM")), "floatValue");
        v35[5] = v38;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("faces.distToBlurScaling")), "floatValue");
        v35[7] = v39;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("faces.eyeToEyebrowRatio")), "floatValue");
        v35[8] = v40;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("relativeWeightThreshold")), "floatValue");
        v35[9] = v41;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("highlightBoostGain")), "floatValue");
        v35[10] = v42;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Rendering")), "objectForKeyedSubscript:", CFSTR("antiAliasBlurStrength")), "floatValue");
        v35[11] = v43;
        break;
      default:
        v31 = ci_logger_api();
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          goto LABEL_32;
        LODWORD(valuePtr[0]) = 67109120;
        HIDWORD(valuePtr[0]) = v30;
        goto LABEL_31;
    }
    if (*v35 == 1145980242)
    {
      if (v35[2])
      {
        v207 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v35), "base64EncodedDataWithOptions:", 0);
        v208 = malloc_type_malloc(objc_msgSend(v207, "length") + 1, 0x11678C74uLL);
        v208[objc_msgSend(v207, "length")] = 0;
        v25 = 0x1E0C99000;
        memcpy(v208, (const void *)objc_msgSend(v207, "bytes"), objc_msgSend(v207, "length"));
        inputAuxDataMetadata = CGImageMetadataTagCreate(CFSTR("http://ns.apple.com/depthBlurEffect/1.0/"), CFSTR("depthBlurEffect"), CFSTR("RenderingParameters"), kCGImageMetadataTypeString, (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v208));
        free(v208);
        free(v35);
        if (!inputAuxDataMetadata)
          goto LABEL_58;
        goto LABEL_32;
      }
      v213 = ci_logger_api();
      if (os_log_type_enabled(v213, OS_LOG_TYPE_INFO))
      {
        valuePtr[0] = 67109120;
        v210 = "Invalid rendering parameter header size (%d)";
        v211 = v213;
        v212 = 8;
        goto LABEL_56;
      }
    }
    else
    {
      v209 = ci_logger_api();
      if (os_log_type_enabled(v209, OS_LOG_TYPE_INFO))
      {
        LOWORD(valuePtr[0]) = 0;
        v210 = "Invalid rendering parameter start marker.";
        v211 = v209;
        v212 = 2;
LABEL_56:
        _os_log_impl(&dword_1921E4000, v211, OS_LOG_TYPE_INFO, v210, (uint8_t *)valuePtr, v212);
      }
    }
    free(v35);
    goto LABEL_58;
  }
  v31 = ci_logger_api();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    LODWORD(valuePtr[0]) = 67109120;
    HIDWORD(valuePtr[0]) = v30;
LABEL_31:
    _os_log_impl(&dword_1921E4000, v31, OS_LOG_TYPE_INFO, "Unknown depth blur effect rendering version %d", (uint8_t *)valuePtr, 8u);
  }
LABEL_32:
  MutableCopy = CGImageMetadataCreateMutableCopy(inputDisparityImage);
  if (MutableCopy)
  {
    v33 = MutableCopy;
    v34 = CGImageMetadataSetTagWithPath(MutableCopy, 0, CFSTR("depthBlurEffect:RenderingParameters"), (CGImageMetadataTagRef)inputAuxDataMetadata);
    CFRelease(inputAuxDataMetadata);
    if (v34)
    {
      CFAutorelease(v33);
      inputDisparityImage = v33;
      goto LABEL_59;
    }
    v45 = ci_logger_api();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      LOWORD(valuePtr[0]) = 0;
      _os_log_impl(&dword_1921E4000, v45, OS_LOG_TYPE_INFO, "Unable to set new image metadata", (uint8_t *)valuePtr, 2u);
    }
    v44 = v33;
  }
  else
  {
    v44 = (CGImageMetadata *)inputAuxDataMetadata;
  }
  CFRelease(v44);
LABEL_58:
  if (inputDisparityImage)
    goto LABEL_59;
  v214 = 1;
LABEL_61:
  inputCalibrationData = self->inputCalibrationData;
  if (inputCalibrationData)
    -[CIFilter setValue:forKey:](v26, "setValue:forKey:", inputCalibrationData, CFSTR("inputCalibrationData"));
  inputLeftEyePositions = self->inputLeftEyePositions;
  if (inputLeftEyePositions)
    -[CIFilter setValue:forKey:](v26, "setValue:forKey:", inputLeftEyePositions, CFSTR("inputLeftEyePosition"));
  inputRightEyePositions = self->inputRightEyePositions;
  if (inputRightEyePositions)
    -[CIFilter setValue:forKey:](v26, "setValue:forKey:", inputRightEyePositions, CFSTR("inputRightEyePosition"));
  inputChinPositions = self->inputChinPositions;
  if (inputChinPositions)
    -[CIFilter setValue:forKey:](v26, "setValue:forKey:", inputChinPositions, CFSTR("inputChinPosition"));
  inputNosePositions = self->inputNosePositions;
  if (inputNosePositions)
    -[CIFilter setValue:forKey:](v26, "setValue:forKey:", inputNosePositions, CFSTR("inputFaceMidPoint"));
  inputMatteImage = self->inputMatteImage;
  if (inputMatteImage)
  {
    -[CIImage extent](inputMatteImage, "extent");
    if (v221 > 1.0)
    {
      -[CIImage extent](self->inputMatteImage, "extent");
      if (v222 > 1.0)
        -[CIFilter setValue:forKey:](v26, "setValue:forKey:", self->inputMatteImage, CFSTR("inputMatteImage"));
    }
  }
  inputHairImage = self->inputHairImage;
  if (inputHairImage)
  {
    -[CIImage extent](inputHairImage, "extent");
    if (v224 > 1.0)
    {
      -[CIImage extent](self->inputHairImage, "extent");
      if (v225 > 1.0)
        -[CIFilter setValue:forKey:](v26, "setValue:forKey:", self->inputHairImage, CFSTR("inputHairImage"));
    }
  }
  inputGlassesImage = self->inputGlassesImage;
  if (inputGlassesImage)
  {
    -[CIImage extent](inputGlassesImage, "extent");
    if (v227 > 1.0)
    {
      -[CIImage extent](self->inputGlassesImage, "extent");
      if (v228 > 1.0)
        -[CIFilter setValue:forKey:](v26, "setValue:forKey:", self->inputGlassesImage, CFSTR("inputGlassesImage"));
    }
  }
  inputGainMap = self->inputGainMap;
  if (inputGainMap)
  {
    -[CIImage extent](inputGainMap, "extent");
    if (v230 > 1.0)
    {
      -[CIImage extent](self->inputGainMap, "extent");
      if (v231 > 1.0)
        -[CIFilter setValue:forKey:](v26, "setValue:forKey:", self->inputGainMap, CFSTR("inputGainMap"));
    }
  }
  v232 = -[CIFilter outputImage](v26, "outputImage");
  if (!v232)
    return self->inputImage;
  v248[0] = self->inputImage;
  v248[1] = v232;
  LODWORD(v233) = v19;
  v248[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v233, CFSTR("inputImage"), CFSTR("inputBlurMap"), CFSTR("inputAperture"));
  v247[3] = CFSTR("inputLumaNoiseScale");
  *(float *)&v234 = v4;
  v248[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v234);
  v247[4] = CFSTR("inputScale");
  *(float *)&v235 = v6;
  v236 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v235);
  inputShape = self->inputShape;
  v247[5] = CFSTR("inputShape");
  if (inputShape)
    v238 = (const __CFString *)inputShape;
  else
    v238 = &stru_1E2ECD1B0;
  v248[4] = v236;
  v248[5] = v238;
  v239 = +[CIFilter filterWithName:withInputParameters:](CIFilter, "filterWithName:withInputParameters:", CFSTR("CIDepthEffectApplyBlurMap"), objc_msgSend(*(id *)(v25 + 3456), "dictionaryWithObjects:forKeys:count:", v248, v247, 6));
  v240 = v239;
  if ((v214 & 1) == 0)
    -[CIFilter setValue:forKey:](v239, "setValue:forKey:", inputDisparityImage, CFSTR("inputAuxDataMetadata"));
  v241 = self->inputMatteImage;
  if (v241)
  {
    -[CIImage extent](v241, "extent");
    if (v242 > 1.0)
    {
      -[CIImage extent](self->inputMatteImage, "extent");
      if (v243 > 1.0)
        -[CIFilter setValue:forKey:](v240, "setValue:forKey:", self->inputMatteImage, CFSTR("inputMatteImage"));
    }
  }
  v244 = self->inputGainMap;
  if (v244)
  {
    -[CIImage extent](v244, "extent");
    if (v245 > 1.0)
    {
      -[CIImage extent](self->inputGainMap, "extent");
      if (v246 > 1.0)
        -[CIFilter setValue:forKey:](v240, "setValue:forKey:", self->inputGainMap, CFSTR("inputGainMap"));
    }
  }
  return -[CIFilter outputImage](v240, "outputImage");
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (CIImage)inputDisparityImage
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputDisparityImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (CIImage)inputMatteImage
{
  return (CIImage *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputMatteImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (CIImage)inputHairImage
{
  return (CIImage *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInputHairImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (CIImage)inputGlassesImage
{
  return (CIImage *)objc_getProperty(self, a2, 112, 1);
}

- (void)setInputGlassesImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (CIImage)inputGainMap
{
  return (CIImage *)objc_getProperty(self, a2, 120, 1);
}

- (void)setInputGainMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSNumber)inputAperture
{
  return self->inputAperture;
}

- (void)setInputAperture:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (NSNumber)inputLumaNoiseScale
{
  return self->inputLumaNoiseScale;
}

- (void)setInputLumaNoiseScale:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 176);
}

- (CIVector)inputLeftEyePositions
{
  return (CIVector *)objc_getProperty(self, a2, 136, 1);
}

- (void)setInputLeftEyePositions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (CIVector)inputRightEyePositions
{
  return (CIVector *)objc_getProperty(self, a2, 144, 1);
}

- (void)setInputRightEyePositions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (CIVector)inputChinPositions
{
  return (CIVector *)objc_getProperty(self, a2, 152, 1);
}

- (void)setInputChinPositions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (CIVector)inputNosePositions
{
  return (CIVector *)objc_getProperty(self, a2, 160, 1);
}

- (void)setInputNosePositions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (CIVector)inputFocusRect
{
  return self->inputFocusRect;
}

- (void)setInputFocusRect:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 168);
}

- (NSNumber)inputScaleFactor
{
  return self->inputScaleFactor;
}

- (void)setInputScaleFactor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 184);
}

- (AVCameraCalibrationData)inputCalibrationData
{
  return self->inputCalibrationData;
}

- (void)setInputCalibrationData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 192);
}

- (id)inputAuxDataMetadata
{
  return self->inputAuxDataMetadata;
}

- (void)setInputAuxDataMetadata:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 200);
}

- (NSString)inputShape
{
  return self->inputShape;
}

- (void)setInputShape:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 208);
}

+ (CGImageMetadata)replaceRenderingParameters:(CGImageMetadata *)a3 tuningParameters:(id)a4
{
  return 0;
}

+ (id)tuningParametersFromMetadata:(CGImageMetadata *)a3
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (CGImageMetadata)metadataFromDictionary:(id)a3 metadata:(CGImageMetadata *)a4
{
  CGImageMetadata *v4;
  CGImageMetadata *MutableCopy;
  CGImageMetadata *v7;
  CGImageMetadataTag *v8;
  CGImageMetadataTag *v9;
  BOOL v10;

  v4 = a4;
  if (a4)
    MutableCopy = CGImageMetadataCreateMutableCopy(a4);
  else
    MutableCopy = CGImageMetadataCreateMutable();
  v7 = MutableCopy;
  if (!MutableCopy)
    return 0;
  if (!CGImageMetadataRegisterNamespaceForPrefix(MutableCopy, CFSTR("depthBlurEffect"), CFSTR("UnpackedRenderingParameters"), 0)|| (v8 = CGImageMetadataTagCreate(CFSTR("http://ns.apple.com/depthBlurEffect/1.0/"), CFSTR("depthBlurEffect"), CFSTR("UnpackedRenderingParameters"), kCGImageMetadataTypeStructure, a3)) == 0)
  {
    CFRelease(v7);
    return 0;
  }
  v9 = v8;
  v10 = CGImageMetadataSetTagWithPath(v7, 0, CFSTR("depthBlurEffect:UnpackedRenderingParameters"), v8);
  CFRelease(v9);
  if (v10)
    return (CGImageMetadata *)CFAutorelease(v7);
  CFRelease(v7);
  return v4;
}

+ (CGImageMetadata)augmentMetadataWithRenderingPropertiesForImage:(id)a3
{
  void *v5;
  const void *v6;
  id v7;
  id v8;
  CFTypeRef v9;

  if (!a3 || !objc_msgSend(a3, "properties"))
    return 0;
  v5 = (void *)objc_msgSend(a3, "properties");
  v6 = (const void *)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC6D0]);
  v7 = +[CIDepthBlurEffect tuningParametersFromMetadata:](CIDepthBlurEffect, "tuningParametersFromMetadata:", v6);
  if (v7)
  {
    v8 = v7;
    if (objc_msgSend((id)objc_msgSend(v7, "allKeys"), "count"))
      v6 = (const void *)objc_msgSend(a1, "metadataFromDictionary:metadata:", v8, v6);
  }
  v9 = CFRetain(v6);
  return (CGImageMetadata *)CFAutorelease(v9);
}

+ (int)getDraftMode:(id)a3
{
  return 0;
}

@end
