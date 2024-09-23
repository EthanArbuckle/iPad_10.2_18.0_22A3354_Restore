@implementation VNFaceBBoxAligner

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("VNComputeStageMain");
  +[VNComputeDeviceUtilities allCPUComputeDevices](VNComputeDeviceUtilities, "allCPUComputeDevices", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)configurationOptionKeysForDetectorKey
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__VNFaceBBoxAligner_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNFaceBBoxAligner configurationOptionKeysForDetectorKey]::onceToken != -1)
    dispatch_once(&+[VNFaceBBoxAligner configurationOptionKeysForDetectorKey]::onceToken, block);
  return (id)+[VNFaceBBoxAligner configurationOptionKeysForDetectorKey]::configurationOptionKeys;
}

void __58__VNFaceBBoxAligner_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNFaceBBoxAligner;
  objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "addObject:", CFSTR("VNDetectorInitOption_ModelBackingStore"));
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)+[VNFaceBBoxAligner configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNFaceBBoxAligner configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;

}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  char v9;
  _QWORD v11[5];
  id v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)VNFaceBBoxAligner;
  if (!-[VNDetector completeInitializationForSession:error:](&v13, sel_completeInitializationForSession_error_, a3))
    return 0;
  self->_modelFilesWereMemmapped = -[VNDetector backingStore](self, "backingStore") < 2;
  VNBinModelFilePathFromModelNameAndThrow(CFSTR("faceBoxPoseAligner-current"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__VNFaceBBoxAligner_completeInitializationForSession_error___block_invoke;
  v11[3] = &unk_1E45488F0;
  v11[4] = self;
  v12 = v6;
  v7 = v6;
  v8 = _Block_copy(v11);
  v9 = VNExecuteBlock(v8, (uint64_t)a4);

  return v9;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  if (self->_modelFilesWereMemmapped)
  {
    VNBinModelFilePathFromModelNameAndThrow(CFSTR("faceBoxPoseAligner-current"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNModelFilesCache sharedInstance](VNModelFilesCache, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unload:", v3);

  }
  v5.receiver = self;
  v5.super_class = (Class)VNFaceBBoxAligner;
  -[VNDetector dealloc](&v5, sel_dealloc);
}

- (id)internalProcessUsingQualityOfServiceClass:(unsigned int)a3 options:(id)a4 regionOfInterest:(CGRect)a5 warningRecorder:(id)a6 error:(id *)a7 progressHandler:(id)a8
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v15;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  objc_super v26;
  _QWORD v27[2];

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v15 = *(_QWORD *)&a3;
  v27[1] = *MEMORY[0x1E0C80C00];
  v17 = a4;
  v18 = a6;
  v19 = a8;
  +[VNValidationUtilities requiredFaceObservationInOptions:error:](VNValidationUtilities, "requiredFaceObservationInOptions:error:", v17, a7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    if (objc_msgSend(v20, "isBoundingBoxAligned"))
    {
      VNCloneFaceObservationFromOptions((uint64_t)v17, a7);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v22;
      if (v22)
      {
        v27[0] = v22;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v24 = 0;
      }

    }
    else
    {
      v26.receiver = self;
      v26.super_class = (Class)VNFaceBBoxAligner;
      -[VNDetector internalProcessUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:](&v26, sel_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler_, v15, v17, v18, a7, v19, x, y, width, height);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  unint64_t v24;
  unint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double x;
  double y;
  double width;
  double height;
  void *v34;
  __CVBuffer *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  BOOL v44;
  unsigned int v46;
  CGRect v47;
  CGRect v48;

  v12 = a4;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v12, a8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    +[VNValidationUtilities requiredFaceObservationInOptions:error:](VNValidationUtilities, "requiredFaceObservationInOptions:error:", v12, a8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (!v14)
      goto LABEL_6;
    objc_msgSend(v14, "boundingBox");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v24 = objc_msgSend(v13, "width");
    v25 = objc_msgSend(v13, "height");
    v26 = v17 * (double)v24;
    v27 = v21 * (double)v24;
    v28 = v19 * (double)v25;
    v29 = v23 * (double)v25;
    v47.origin.x = v26;
    v47.origin.y = v28;
    v47.size.width = v27;
    v47.size.height = v29;
    v48 = CGRectInset(v47, v27 * -0.5, v29 * -0.5);
    x = v48.origin.x;
    y = v48.origin.y;
    width = v48.size.width;
    height = v48.size.height;
    v46 = -1;
    if ((objc_msgSend(v15, "getFaceEXIFOrientation:error:", &v46, a8) & 1) == 0)
      goto LABEL_6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v46);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v34, CFSTR("VNImageBufferOption_FeatureOrientationRelativeToUpRight"));

    v35 = (__CVBuffer *)objc_msgSend(v13, "croppedBufferWithWidth:height:format:cropRect:options:error:", (unint64_t)width, (unint64_t)height, 1278226488, v12, a8, x, y, width, height);
    *a7 = v35;
    if (v35)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v26);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v36, CFSTR("VNFaceBBoxAlignerProcessOption_FaceRawBoxInImageCoordinates_X"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v28);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v37, CFSTR("VNFaceBBoxAlignerProcessOption_FaceRawBoxInImageCoordinates_Y"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v38, CFSTR("VNFaceBBoxAlignerProcessOption_FaceRawBoxInImageCoordinates_Width"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v29);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v39, CFSTR("VNFaceBBoxAlignerProcessOption_FaceRawBoxInImageCoordinates_Height"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", x);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v40, CFSTR("VNFaceBBoxAlignerProcessOption_FaceRawBoxInImageCoordinatesMagnified_X"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", y);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v41, CFSTR("VNFaceBBoxAlignerProcessOption_FaceRawBoxInImageCoordinatesMagnified_Y"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", width);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v42, CFSTR("VNFaceBBoxAlignerProcessOption_FaceRawBoxInImageCoordinatesMagnified_Width"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", height);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v43, CFSTR("VNFaceBBoxAlignerProcessOption_FaceRawBoxInImageCoordinatesMagnified_Height"));

      v44 = 1;
    }
    else
    {
LABEL_6:
      v44 = 0;
    }

  }
  else
  {
    v44 = 0;
  }

  return v44;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  unsigned __int8 *BaseAddress;
  size_t Height;
  size_t Width;
  size_t BytesPerRow;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  uint64_t v34;
  float v35;
  unsigned __int8 *ptr;
  float v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  float v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  float sinval;
  float cosval;
  __float2 v57;
  float v58;
  float v59;
  int v60;
  uint64_t v61;
  int v62;
  float *v63;
  float v64;
  float v65;
  float v66;
  int v67;
  float v68;
  BOOL v70;
  unsigned __int8 v71;
  int v72;
  float v73;
  float v74;
  float v75;
  float v76;
  BOOL v77;
  int v79;
  unsigned __int8 v80;
  int v81;
  float v82;
  int v83;
  int v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t i;
  float v88;
  __float2 v89;
  float v90;
  __float2 v91;
  float v92;
  float v93;
  float v94;
  float v95;
  float v96;
  float v97;
  float v98;
  float v99;
  float v100;
  float v101;
  float v102;
  float v103;
  int v104;
  float v105;
  float v106;
  float v107;
  __float2 v108;
  uint64_t v109;
  char *v110;
  float v111;
  double *v112;
  double *v113;
  float v114;
  float v115;
  float v116;
  float v117;
  double v118;
  float v119;
  float v120;
  float v121;
  float *v122;
  char *v123;
  void *v124;
  id v125;
  void *v126;
  void *v127;
  void *v128;
  unint64_t v129;
  unint64_t v130;
  double v131;
  double v132;
  float v133;
  float v134;
  double v135;
  double v136;
  double v137;
  double v138;
  void *v139;
  double v141;
  double v142;
  id v143;
  uint64_t v146;
  uint64_t v147;
  float v148;
  float v149;
  float v150;
  float v151;
  uint64_t v152;
  float v153;
  __int128 v154;
  double v155;
  float v156;
  float v157;
  uint64_t v158;
  float v159;
  uint64_t v160;
  float v161;
  float v162;
  float v163;
  float v164;
  char *v165;
  uint64_t v166;
  uint64_t v167;
  void *__p;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  uint64_t v176;
  uint64_t v177;
  float32x2_t v178;
  float v179;
  char *v180;
  uint64_t v181;
  uint64_t v182;
  int v183;
  uint64_t v184;

  v184 = *MEMORY[0x1E0C80C00];
  __p = 0;
  v169 = 0;
  v170 = 0;
  v143 = a5;
  BaseAddress = (unsigned __int8 *)CVPixelBufferGetBaseAddress(a4);
  Height = CVPixelBufferGetHeight(a4);
  Width = CVPixelBufferGetWidth(a4);
  BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
  objc_msgSend(v143, "objectForKeyedSubscript:", CFSTR("VNFaceBBoxAlignerProcessOption_FaceRawBoxInImageCoordinates_X"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  objc_msgSend(v143, "objectForKeyedSubscript:", CFSTR("VNFaceBBoxAlignerProcessOption_FaceRawBoxInImageCoordinates_Y"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  objc_msgSend(v143, "objectForKeyedSubscript:", CFSTR("VNFaceBBoxAlignerProcessOption_FaceRawBoxInImageCoordinates_Width"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  v18 = v17;
  objc_msgSend(v143, "objectForKeyedSubscript:", CFSTR("VNFaceBBoxAlignerProcessOption_FaceRawBoxInImageCoordinates_Height"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doubleValue");
  v21 = v20;

  objc_msgSend(v143, "objectForKeyedSubscript:", CFSTR("VNFaceBBoxAlignerProcessOption_FaceRawBoxInImageCoordinatesMagnified_X"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "doubleValue");
  v24 = v23;
  objc_msgSend(v143, "objectForKeyedSubscript:", CFSTR("VNFaceBBoxAlignerProcessOption_FaceRawBoxInImageCoordinatesMagnified_Y"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "doubleValue");
  v27 = v26;
  objc_msgSend(v143, "objectForKeyedSubscript:", CFSTR("VNFaceBBoxAlignerProcessOption_FaceRawBoxInImageCoordinatesMagnified_Width"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "doubleValue");
  v30 = v29;
  objc_msgSend(v143, "objectForKeyedSubscript:", CFSTR("VNFaceBBoxAlignerProcessOption_FaceRawBoxInImageCoordinatesMagnified_Height"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "doubleValue");
  v33 = v32;
  v141 = v27;
  v142 = v24;

  *(float *)&v38 = (v30 - v18) * 0.5;
  *(float *)&v39 = (v33 - v21) * 0.5;
  *(float *)&v34 = v18;
  v35 = v21;
  *((float *)&v34 + 1) = v35;
  ptr = (unsigned __int8 *)self->mFaceBoxPoseAlignerImpl.__ptr_;
  v37 = (float)Height;
  LODWORD(v174) = v38;
  *((float *)&v174 + 1) = (float)((float)Height - v35) - *(float *)&v39;
  *((_QWORD *)&v174 + 1) = v34;
  v175 = 0uLL;
  *((_QWORD *)&v38 + 1) = v34;
  DWORD1(v39) = 0;
  v172 = v174;
  v173 = 0uLL;
  v40 = *(_QWORD *)ptr;
  v41 = *(float *)&v38;
  if (*(_QWORD *)ptr)
  {
    v42 = 0;
    v43 = *((_QWORD *)ptr + 8);
    v44 = *((_QWORD *)ptr + 1);
    v45 = (float)Width + -1.0;
    v46 = v37 + -1.0;
    v47 = *(float *)&v173;
    v48 = *((float *)&v172 + 3);
    v49 = *((float *)&v172 + 2);
    v50 = *((float *)&v172 + 1);
    *(_QWORD *)&v38 = *(_QWORD *)((char *)&v173 + 4);
    v154 = v38;
    v153 = *((float *)&v173 + 3);
    v51 = v44;
    v146 = *(_QWORD *)ptr;
    v147 = v44;
    do
    {
      v52 = 0;
      v177 = 0;
      v178 = 0;
      v176 = 0;
      v179 = 0.0;
      do
      {
        *(float *)((char *)&v176 + v52) = *(float *)(v43 + v52) + *(float *)((char *)&v176 + v52);
        v52 += 4;
      }
      while (v52 != 28);
      v158 = v51;
      v163 = v48;
      v53 = v44 * v42;
      v152 = v42 + 1;
      v156 = v47;
      if (v44 * v42 >= (unint64_t)(v44 * (v42 + 1)))
      {
        v89 = __sincosf_stret(v47);
        cosval = v89.__cosval;
        sinval = v89.__sinval;
        v88 = v156;
        v58 = -v89.__sinval;
        v59 = v163;
      }
      else
      {
        v160 = *((_QWORD *)ptr + 11);
        v54 = *((_DWORD *)ptr + 4);
        v57 = __sincosf_stret(v47);
        cosval = v57.__cosval;
        sinval = v57.__sinval;
        v58 = -v57.__sinval;
        v59 = v163;
        do
        {
          if (v54 > 0)
          {
            v60 = 0;
            v61 = *(_QWORD *)(v160 + 24 * v53);
            while (1)
            {
              v62 = v60;
              if (*(_BYTE *)(v61 + 48 * v60 + 44))
                break;
              v63 = (float *)(*((_QWORD *)ptr + 5) + 16 * *(_QWORD *)(v61 + 48 * v60 + 8));
              v64 = *v63 + -0.5;
              v65 = v63[1] + -0.5;
              v66 = v41
                  + (float)((float)((float)((float)((float)(v65 * v58) + (float)(v57.__cosval * v64)) + 0.0) + 0.5) * v49);
              v67 = ptr[33];
              if (v66 < 0.0)
              {
                v71 = ptr[33];
              }
              else
              {
                v68 = v50
                    + (float)((float)((float)((float)((float)(v65 * v57.__cosval) + (float)(v57.__sinval * v64)) + 0.0)
                                    + 0.5)
                            * v163);
                v70 = v68 < 0.0 || v45 < v66 || v46 < v68;
                v71 = ptr[33];
                if (!v70)
                {
                  v72 = BaseAddress[BytesPerRow * vcvtas_u32_f32(v68) + vcvtas_u32_f32(v66)];
                  v71 = v72 - (v72 == v67);
                }
              }
              v73 = v63[2] + -0.5;
              v74 = v63[3] + -0.5;
              v75 = v41
                  + (float)((float)((float)((float)((float)(v74 * v58) + (float)(v57.__cosval * v73)) + 0.0) + 0.5) * v49);
              if (v75 < 0.0)
                goto LABEL_40;
              v76 = v50
                  + (float)((float)((float)((float)((float)(v74 * v57.__cosval) + (float)(v57.__sinval * v73)) + 0.0)
                                  + 0.5)
                          * v163);
              v77 = v76 < 0.0 || v45 < v75;
              if (v77 || v46 < v76)
                goto LABEL_40;
              v79 = BaseAddress[BytesPerRow * vcvtas_u32_f32(v76) + vcvtas_u32_f32(v75)];
              if (v67 == v71)
                goto LABEL_40;
              v80 = v79 - (v79 == v67);
              if (v67 == v80)
                goto LABEL_40;
              v81 = v71 - v80;
              if (v81 >= 127)
                v81 = 127;
              if (v81 <= -127)
                LOBYTE(v81) = -127;
              if (ptr[32] == v81)
              {
LABEL_40:
                v180 = 0;
                v181 = 0;
                v183 = 0;
                v182 = 0;
                goto LABEL_43;
              }
              v82 = *(float *)(v61 + 48 * v62);
              v83 = (2 * v62) | 1;
              v84 = 2 * v62 + 2;
              if (v82 >= (float)(char)v81)
                v60 = v83;
              else
                v60 = v84;
              if (v60 >= v54)
                goto LABEL_43;
            }
            v85 = 0;
            v86 = v61 + 48 * v62 + 16;
            do
            {
              *(_DWORD *)((char *)&v180 + v85) = *(_DWORD *)(v86 + v85);
              v85 += 4;
            }
            while (v85 != 28);
          }
LABEL_43:
          for (i = 0; i != 28; i += 4)
            *(float *)((char *)&v176 + i) = *(float *)((char *)&v180 + i) + *(float *)((char *)&v176 + i);
          ++v53;
        }
        while (v53 != v158);
        v88 = v156;
        v40 = v146;
      }
      v90 = (float)((float)(*((float *)&v176 + 1) * cosval) + (float)(sinval * *(float *)&v176)) + 0.0;
      *(float *)&v176 = (float)((float)(*((float *)&v176 + 1) * v58) + (float)(cosval * *(float *)&v176)) + 0.0;
      *((float *)&v176 + 1) = v90;
      v151 = (float)((float)(cosval * *((float *)&v177 + 1)) + (float)(sinval * *(float *)&v177)) + 0.0;
      *(float *)&v177 = (float)((float)(*((float *)&v177 + 1) * v58) + (float)(cosval * *(float *)&v177)) + 0.0;
      *((float *)&v177 + 1) = v151;
      v149 = *(float *)&v177;
      v150 = (float)(v41 + (float)(v49 * 0.5)) + (float)(*(float *)&v176 * v49);
      v148 = v59 * 0.5;
      v161 = (float)(v50 + (float)(v59 * 0.5)) + (float)(v90 * v59);
      v91 = __sincosf_stret(v88 + -1.5708);
      v92 = (float)((float)(v41 + (float)((float)(v49 * 0.5) * (float)(v91.__cosval + 1.0))) + (float)(v149 * v49))
          - v150;
      v93 = (float)((float)(v50 + (float)(v148 * (float)(v91.__sinval + 1.0))) + (float)(v151 * v163)) - v161;
      v47 = atan2f(v93, v92) + 1.5708;
      v94 = sqrtf((float)(v93 * v93) + (float)(v92 * v92));
      v41 = v150 - v94;
      v50 = v161 - v94;
      v48 = v94 + v94;
      *((_QWORD *)&v39 + 1) = *((_QWORD *)&v154 + 1);
      *(float32x2_t *)&v39 = vmla_f32(*(float32x2_t *)&v154, (float32x2_t)0x4100000041200000, v178);
      v154 = v39;
      v153 = v153 + (float)(v179 * 8.0);
      v44 = v147;
      v51 = v158 + v147;
      v43 += 28;
      v49 = v94 + v94;
      v42 = v152;
    }
    while (v152 != v40);
    v157 = v47;
    *((float *)&v172 + 3) = v94 + v94;
    v95 = v94 + v94;
    v96 = v94 + v94;
  }
  else
  {
    v96 = *((float *)&v172 + 2);
    v50 = *((float *)&v172 + 1);
    v95 = *((float *)&v172 + 3);
    LODWORD(v39) = DWORD1(v173);
    v157 = *(float *)&v173;
    v153 = *((float *)&v173 + 3);
  }
  v180 = 0;
  v181 = 0;
  v182 = 0;
  v155 = *(double *)&v39;
  v97 = *(float *)&v39 + 3.0;
  if ((float)(*(float *)&v39 + 3.0) > 6.0)
    v97 = 6.0;
  if (v97 >= 0.0)
    v98 = v97;
  else
    v98 = 0.0;
  v99 = floorf(v98);
  if (v99 > 5.0)
    v99 = 5.0;
  v164 = v99;
  std::vector<_Geometry2D_point2D_>::resize(&v180);
  v100 = v96 * 0.5;
  v101 = v41 + (float)(v96 * 0.5);
  v102 = v95;
  v103 = v95 * 0.5;
  v162 = (float)((float)(v96 * 0.5) - (float)(v50 + v103)) + (float)(v37 - v102);
  v104 = (int)v164 + 1;
  v159 = v101 - (float)(v96 * 0.5);
  v105 = (float)v104 - v98;
  v106 = v98 - (float)(int)v164;
  v107 = v100 - v100;
  v108 = __sincosf_stret(v157);
  v109 = 0;
  v110 = v180;
  v111 = *((float *)&v172 + 3);
  v112 = (double *)((char *)&vision::mod::landmarksInPoses + 1008 * v104 + 8);
  v113 = (double *)((char *)&vision::mod::landmarksInPoses + 1008 * (int)v164 + 8);
  do
  {
    v114 = *(v113 - 1);
    v115 = *(v112 - 1);
    v116 = *v113;
    v117 = (float)(v106 * v115) + (float)(v114 * v105);
    v118 = *v112;
    v112 += 2;
    v119 = v118;
    v120 = (float)(v107 + (float)(v117 * v96)) - v100;
    v121 = (float)(v107 + (float)((float)((float)(v106 * v119) + (float)(v116 * v105)) * v111)) - v103;
    v122 = (float *)&v110[v109];
    *v122 = v100 + (float)((float)((float)(v121 * (float)-v108.__sinval) + (float)(v108.__cosval * v120)) + 0.0);
    v122[1] = v102
            - (float)(v103 + (float)((float)((float)(v108.__cosval * v121) + (float)(v108.__sinval * v120)) + 0.0));
    v109 += 8;
    v113 += 2;
  }
  while (v109 != 504);
  v166 = 0;
  v167 = 0;
  v165 = 0;
  std::vector<_Geometry2D_point2D_>::__init_with_size[abi:ne180100]<_Geometry2D_point2D_*,_Geometry2D_point2D_*>(&v165, v110, v181, (v181 - (uint64_t)v110) >> 3);
  operator delete(v110);
  v123 = v165;
  std::vector<long long>::__assign_with_size[abi:ne180100]<long long *,long long *>((char *)&__p, v165, v166, (v166 - (uint64_t)v165) >> 3);
  VNCloneFaceObservationFromOptions((uint64_t)v143, a8);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  if (v124)
  {
    v125 = objc_alloc(MEMORY[0x1E0C99D50]);
    v126 = (void *)objc_msgSend(v125, "initWithBytes:length:", __p, v169 - (_QWORD)__p);
    objc_msgSend(v124, "setAlignedMeanShape:", v126);

    -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v143, a8);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = v127;
    if (v127)
    {
      v129 = objc_msgSend(v127, "width");
      v130 = objc_msgSend(v128, "height");
      HIDWORD(v132) = HIDWORD(v141);
      HIDWORD(v131) = HIDWORD(v142);
      v133 = v142;
      *(float *)&v131 = (float)(v159 + v133) / (float)v129;
      v134 = v141;
      *(float *)&v132 = (float)(v162 + v134) / (float)v130;
      *(float *)&v135 = v96 / (float)v129;
      *(float *)&v136 = v102 / (float)v130;
      objc_msgSend(v124, "setAlignedBoundingBox:", v131, v132, v136, v135);
      *(float *)&v137 = v157;
      objc_msgSend(v124, "setAlignedRotationAngle:", v137);
      objc_msgSend(v124, "setBoundingBoxAligned:", 1);
      objc_msgSend(v124, "setFaceOrientationIndex:", v155);
      *(float *)&v138 = v153;
      objc_msgSend(v124, "setFaceJunkinessIndex:", v138);
      v171 = v124;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v171, 1);
      v139 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v139 = 0;
    }

  }
  else
  {
    v139 = 0;
  }

  if (v123)
    operator delete(v123);
  if (__p)
    operator delete(__p);

  return v139;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;

  objc_storeStrong((id *)&self->mFaceBoxAlignerModelFileHandle, 0);
  cntrl = self->mFaceBoxPoseAlignerImpl.__cntrl_;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  return self;
}

uint64_t __60__VNFaceBBoxAligner_completeInitializationForSession_error___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char *v9;
  uint64_t v10;
  char *v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  char *v15;
  char *v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  uint64_t result;
  void *v21;
  id v22;
  __int128 v23;
  _OWORD v24[2];
  int v25;
  __int128 v26;
  __int128 v27;
  int v28;

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 72))
  {
    v15 = (char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String");
    v16 = (char *)operator new(0xA0uLL);
    *(_OWORD *)(v16 + 8) = 0u;
    *(_QWORD *)v16 = &off_1E453B5A0;
    *((_OWORD *)v16 + 4) = 0u;
    *((_OWORD *)v16 + 7) = 0u;
    *((_OWORD *)v16 + 9) = 0u;
    *((_OWORD *)v16 + 5) = 0u;
    *((_OWORD *)v16 + 6) = 0u;
    *((_QWORD *)v16 + 16) = 0;
    *((_QWORD *)v16 + 17) = v16 + 144;
    v26 = 0u;
    v27 = 0u;
    v28 = 1065353216;
    vision::mod::readBinSerializedModelValues(v15, vision::mod::FaceBoxPoseAligner<signed char>::modelFileInfo(void)::fileInfo, &v26);
    vision::mod::FaceBoxPoseAligner<signed char>::loadERTModel((uint64_t *)v16 + 3, &v26);
    vision::mod::FaceBoxPoseAligner<signed char>::loadGlobalShifts(&v26, (char **)v16 + 11);
    vision::mod::FaceBoxPoseAligner<signed char>::loadXYPairs((uint64_t)(v16 + 24), &v26, (char **)v16 + 8);
    vision::mod::FaceBoxPoseAligner<signed char>::loadDefaultPixelValue(&v26, v16 + 57);
    vision::mod::FaceBoxPoseAligner<signed char>::loadDefaultFeatureValue(&v26, v16 + 56);
    std::__hash_table<std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>>>::~__hash_table((uint64_t)&v26);
    *(_QWORD *)&v26 = v16 + 24;
    *((_QWORD *)&v26 + 1) = v16;
    std::shared_ptr<vision::mod::ImageAnalyzer>::operator=[abi:ne180100](*(_QWORD *)(a1 + 32) + 56, &v26);
    v17 = (std::__shared_weak_count *)*((_QWORD *)&v26 + 1);
    if (*((_QWORD *)&v26 + 1))
    {
      v18 = (unint64_t *)(*((_QWORD *)&v26 + 1) + 8);
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
LABEL_14:
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56))
      return 1;
    if (a2)
    {
      +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 9, CFSTR("Failed to allocate memory for face bounding box aligner model data"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:
      v22 = v21;
      result = 0;
      *a2 = v22;
      return result;
    }
    return 0;
  }
  +[VNModelFilesCache sharedInstance](VNModelFilesCache, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "load:", *(_QWORD *)(a1 + 40));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v5;

  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  if (v8)
  {
    v9 = (char *)objc_msgSend(v8, "baseAddress");
    v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "length");
    v26 = 0u;
    v27 = 0u;
    v28 = 1065353216;
    cvml::util::binserialized_table_of_contents::init((cvml::util::binserialized_table_of_contents *)&v26, v9, v10);
    memset(v24, 0, sizeof(v24));
    v25 = 1065353216;
    cvml::util::binserialized_contents::init_model_values((uint64_t)v24, (uint64_t)&v26, 0, vision::mod::FaceBoxPoseAligner<signed char>::modelFileInfo(void)::fileInfo);
    v11 = (char *)operator new(0xA0uLL);
    *(_OWORD *)(v11 + 8) = 0u;
    *(_QWORD *)v11 = &off_1E453B5A0;
    *((_OWORD *)v11 + 4) = 0u;
    *((_OWORD *)v11 + 7) = 0u;
    *((_OWORD *)v11 + 9) = 0u;
    *((_OWORD *)v11 + 5) = 0u;
    *((_OWORD *)v11 + 6) = 0u;
    *((_QWORD *)v11 + 16) = 0;
    *((_QWORD *)v11 + 17) = v11 + 144;
    vision::mod::FaceBoxPoseAligner<signed char>::loadERTModel((uint64_t *)v11 + 3, v24);
    vision::mod::FaceBoxPoseAligner<signed char>::loadGlobalShifts(v24, (char **)v11 + 11);
    vision::mod::FaceBoxPoseAligner<signed char>::loadXYPairs((uint64_t)(v11 + 24), v24, (char **)v11 + 8);
    vision::mod::FaceBoxPoseAligner<signed char>::loadDefaultPixelValue(v24, v11 + 57);
    vision::mod::FaceBoxPoseAligner<signed char>::loadDefaultFeatureValue(v24, v11 + 56);
    *(_QWORD *)&v23 = v11 + 24;
    *((_QWORD *)&v23 + 1) = v11;
    std::shared_ptr<vision::mod::ImageAnalyzer>::operator=[abi:ne180100](*(_QWORD *)(a1 + 32) + 56, &v23);
    v12 = (std::__shared_weak_count *)*((_QWORD *)&v23 + 1);
    if (*((_QWORD *)&v23 + 1))
    {
      v13 = (unint64_t *)(*((_QWORD *)&v23 + 1) + 8);
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    std::__hash_table<std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>>>::~__hash_table((uint64_t)v24);
    std::__hash_table<std::__hash_value_type<unsigned long long,cvml::util::binserialized_table_of_contents::blob_info>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,cvml::util::binserialized_table_of_contents::blob_info>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,cvml::util::binserialized_table_of_contents::blob_info>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,cvml::util::binserialized_table_of_contents::blob_info>>>::~__hash_table((uint64_t)&v26);
    goto LABEL_14;
  }
  if (a2)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Could not map face box aligner model"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  return 0;
}

@end
