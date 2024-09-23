@implementation VCPPhotosFace

- (VCPPhotosFace)initWithLocalIdentifier:(id)a3
{
  id v5;
  VCPPhotosFace *v6;
  VCPPhotosFace *v7;
  NSString *groupingIdentifier;
  NSString *personLocalIdentifier;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VCPPhotosFace;
  v6 = -[VCPPhotosFace init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_localIdentifier, a3);
    v7->_sourceWidth = 0;
    v7->_sourceHeight = 0;
    v7->_detectionType = 1;
    *(_OWORD *)&v7->_centerX = 0u;
    *(_OWORD *)&v7->_size = 0u;
    *(_OWORD *)&v7->_bodyCenterY = 0u;
    v7->_bodyHeight = 0.0;
    *(_OWORD *)&v7->_blurScore = xmmword_1B6FBCBE0;
    *(_OWORD *)&v7->_poseYaw = 0u;
    *(_OWORD *)&v7->_clusterSequenceNumber = 0u;
    v7->_qualityMeasure = 1;
    *(_DWORD *)&v7->_isTooSmall = 0;
    groupingIdentifier = v7->_groupingIdentifier;
    v7->_groupingIdentifier = 0;

    personLocalIdentifier = v7->_personLocalIdentifier;
    v7->_personLocalIdentifier = 0;

    v7->_hasFaceMask = 0;
    *(_QWORD *)&v7->_ageType = 0;
    *(_QWORD *)&v7->_headgearType = 0;
    *(_QWORD *)&v7->_facialHairType = 0;
    *(_DWORD *)&v7->_ethnicityType = 0;
    __asm { FMOV            V0.2D, #-1.0 }
    *(CGSize *)&v7->_gazeCenterX = _Q0;
    v7->_gazeRect.origin = (CGPoint)_Q0;
    v7->_gazeRect.size = _Q0;
    *(_QWORD *)&v7->_gazeAngle = 0xBF800000447A0000;
    *(_OWORD *)&v7->_roll = xmmword_1B6FBCBF0;
  }

  return v7;
}

+ (id)faceWithLocalIdentifier:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLocalIdentifier:", v3);

  return v4;
}

+ (id)faceFromFaceObservation:(id)a3 humanObservation:(id)a4 sourceWidth:(unint64_t)a5 sourceHeight:(unint64_t)a6 visionRequests:(id)a7 processingVersion:(int)a8 force:(BOOL)a9 andError:(id *)a10
{
  uint64_t v10;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  void (**v18)(void *, uint64_t);
  uint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  float v23;
  float v24;
  int v25;
  float v26;
  float v27;
  float v28;
  uint64_t v29;
  double v30;
  float v31;
  char v32;
  void *v33;
  void *v34;
  id v35;
  float v36;
  float v37;
  void *v38;
  float v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double v51;
  double v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  float v80;
  _BOOL8 v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  _BOOL8 v124;
  uint64_t v125;
  void *v126;
  uint64_t v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  double v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  __CVBuffer *v139;
  int Width;
  int Height;
  OSType PixelFormatType;
  int v143;
  char *BaseAddress;
  uint64_t v145;
  float v146;
  float *v147;
  int v148;
  float v149;
  float v150;
  double v151;
  int BytesPerRow;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  uint64_t v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  id v172;
  CFTypeRef cf;
  id v174;
  _QWORD aBlock[4];
  id v176;
  uint8_t v177[4];
  int v178;
  uint64_t v179;
  void *v180;
  uint64_t v181;
  void *v182;
  uint64_t v183;
  uint64_t v184;
  uint8_t buf[4];
  _BYTE v186[10];
  uint64_t v187;
  __int16 v188;
  double v189;
  __int16 v190;
  double v191;
  uint64_t v192;
  _QWORD v193[4];
  CGRect v194;
  CGRect v195;

  v10 = *(_QWORD *)&a8;
  v193[1] = *MEMORY[0x1E0C80C00];
  v15 = (unint64_t)a3;
  v16 = (unint64_t)a4;
  v172 = a7;
  if (v15 | v16)
  {
    +[VCPPhotosFace faceWithLocalIdentifier:](VCPPhotosFace, "faceWithLocalIdentifier:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setSourceWidth:", a5);
    objc_msgSend(v17, "setSourceHeight:", a6);
    objc_msgSend(v17, "setManual:", 0);
    objc_msgSend(v17, "setAlgorithmVersion:", (int)v10);
    objc_msgSend(v17, "setDetectionType:", 1);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __131__VCPPhotosFace_faceFromFaceObservation_humanObservation_sourceWidth_sourceHeight_visionRequests_processingVersion_force_andError___block_invoke;
    aBlock[3] = &unk_1E6B16890;
    v176 = v172;
    v18 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
    v19 = objc_opt_class();
    v18[2](v18, v19);
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v15, "uuid");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    __131__VCPPhotosFace_faceFromFaceObservation_humanObservation_sourceWidth_sourceHeight_visionRequests_processingVersion_force_andError___block_invoke_2((uint64_t)v20, v20, v170);
    v171 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v171, "faceprint");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (unint64_t)v21;
    if (v21)
    {
      objc_msgSend(v21, "confidence");
      v24 = v23;
      v25 = _os_feature_enabled_impl();
      v26 = 0.9;
      if (v25)
        v26 = 0.2;
      if (v24 >= v26 || a9)
      {
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend((id)v22, "confidence");
          v37 = v36;
          objc_msgSend(v171, "description");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v171, "faceJunkinessIndex");
          *(_DWORD *)buf = 134218498;
          *(double *)v186 = v37;
          *(_WORD *)&v186[8] = 2112;
          v187 = (uint64_t)v38;
          v188 = 2048;
          v189 = v39;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VCPPhotosFace] Accepting faceprint with confidence: %.3f %@ - junkinessIndex: %.3f", buf, 0x20u);

        }
        v32 = 1;
LABEL_20:
        v40 = objc_opt_class();
        v18[2](v18, v40);
        v169 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v16, "uuid");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        __131__VCPPhotosFace_faceFromFaceObservation_humanObservation_sourceWidth_sourceHeight_visionRequests_processingVersion_force_andError___block_invoke_2((uint64_t)v41, v41, v169);
        v168 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v168, "torsoprint");
        v167 = objc_claimAutoreleasedReturnValue();
        if (!(v22 | v167))
        {
          if (!a10)
          {
            v35 = 0;
LABEL_39:

            v34 = v176;
            goto LABEL_40;
          }
          v62 = (void *)MEMORY[0x1E0CB35C8];
          v183 = *MEMORY[0x1E0CB2D50];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[VCPPhotosFace] Invalid faceprint and torsoprint"));
          v184 = objc_claimAutoreleasedReturnValue();
          v165 = (void *)v184;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v184, &v183, 1);
          v166 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18);
          v35 = 0;
          *a10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_38:

          goto LABEL_39;
        }
        v174 = 0;
        v165 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEDEE8]), "initWithFaceprint:torsoprint:", v22, v167);
        objc_msgSend(v165, "serializeStateAndReturnError:", &v174);
        v42 = objc_claimAutoreleasedReturnValue();
        v43 = v174;
        v164 = (void *)v42;
        v166 = v43;
        if (!v42 || v43)
        {
          if (a10)
          {
            v63 = (void *)MEMORY[0x1E0CB35C8];
            v181 = *MEMORY[0x1E0CB2D50];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[VCPPhotosFace] Unable to serialize faceTorsoprint - %@"), v43);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v182 = v64;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v182, &v181, 1);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v65);
            *a10 = (id)objc_claimAutoreleasedReturnValue();

          }
        }
        else
        {
          +[VCPVNImageprintWrapper wrapperWithImageprintType:version:andData:](VCPVNImageprintWrapper, "wrapperWithImageprintType:version:andData:", 0, v10, v42);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setImageprintWrapper:", v44);

          objc_msgSend(v17, "setVuObservationID:", 0);
          if (v16)
          {
            objc_msgSend((id)v16, "boundingBox");
            v46 = v45;
            v48 = v47;
            v50 = v49;
            v52 = v51;
            objc_msgSend(v17, "setBodyWidth:", v49);
            objc_msgSend(v17, "setBodyHeight:", v52);
            v194.origin.x = v46;
            v194.origin.y = v48;
            v194.size.width = v50;
            v194.size.height = v52;
            objc_msgSend(v17, "setBodyCenterX:", CGRectGetMidX(v194));
            v195.origin.x = v46;
            v195.origin.y = v48;
            v195.size.width = v50;
            v195.size.height = v52;
            objc_msgSend(v17, "setBodyCenterY:", CGRectGetMidY(v195));
          }
          if ((v32 & 1) == 0)
          {
            v35 = v17;
LABEL_37:

            goto LABEL_38;
          }
          objc_msgSend((id)v15, "boundingBox");
          v54 = v53;
          v56 = v55;
          v58 = v57;
          v60 = v59;
          if ((objc_msgSend(v17, "setCenterAndSizeFromNormalizedFaceRect:") & 1) != 0)
          {
            objc_msgSend((id)v15, "roll");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v158 = v61;
            if (v61)
            {
              objc_msgSend(v61, "doubleValue");
              objc_msgSend(v17, "setRoll:");
            }
            else
            {
              objc_msgSend(v17, "setRoll:", 0.0);
              if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VCPPhotosFace] Missing results for roll information", buf, 2u);
              }
            }
            v70 = objc_opt_class();
            v18[2](v18, v70);
            v156 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v15, "uuid");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            __131__VCPPhotosFace_faceFromFaceObservation_humanObservation_sourceWidth_sourceHeight_visionRequests_processingVersion_force_andError___block_invoke_2((uint64_t)v71, v71, v156);
            v161 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v161, "faceCaptureQuality");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            v157 = v72;
            if (v72)
            {
              objc_msgSend(v72, "doubleValue");
              objc_msgSend(v17, "setQuality:");
            }
            else
            {
              objc_msgSend(v17, "setQuality:", -1.0);
              if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VCPPhotosFace] Missing results from VNDetectFaceCaptureQualityRequest", buf, 2u);
              }
            }
            objc_msgSend((id)v15, "yaw");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            v155 = v73;
            if (v73)
            {
              objc_msgSend(v73, "doubleValue");
              objc_msgSend(v17, "setPoseYaw:");
            }
            else
            {
              objc_msgSend(v17, "setPoseYaw:", 1.79769313e308);
              if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VCPPhotosFace] Missing results for yaw information", buf, 2u);
              }
            }
            v74 = objc_opt_class();
            v18[2](v18, v74);
            v154 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v15, "uuid");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            __131__VCPPhotosFace_faceFromFaceObservation_humanObservation_sourceWidth_sourceHeight_visionRequests_processingVersion_force_andError___block_invoke_2((uint64_t)v75, v75, v154);
            v160 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v160, "expressionsAndConfidence");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            v77 = v76;
            if (v76)
            {
              objc_msgSend(v76, "objectForKeyedSubscript:", *MEMORY[0x1E0CEE2B0]);
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              v79 = v78;
              if (v78)
              {
                objc_msgSend(v78, "floatValue");
                v81 = v80 >= 0.4;
              }
              else
              {
                v81 = 0;
              }
              objc_msgSend(v17, "setHasSmile:", v81);

            }
            else if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VCPPhotosFace] Missing results from VNDetectFaceExpressionsRequest", buf, 2u);
            }
            v82 = objc_opt_class();
            v18[2](v18, v82);
            v153 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v15, "uuid");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            __131__VCPPhotosFace_faceFromFaceObservation_humanObservation_sourceWidth_sourceHeight_visionRequests_processingVersion_force_andError___block_invoke_2((uint64_t)v83, v83, v153);
            v159 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v159, "faceAttributes");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            v163 = v84;
            if (v84)
            {
              objc_msgSend(v84, "ageCategory");
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v85, "label");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v86, "identifier");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setAgeType:", +[VCPFaceUtils mad_PHValueFromVNAgeCategoryLabel:](VCPFaceUtils, "mad_PHValueFromVNAgeCategoryLabel:", v87));

              objc_msgSend(v163, "VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v88, "label");
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v89, "identifier");
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setSexType:", +[VCPFaceUtils mad_PHValueFromVNSexCategoryLabel:](VCPFaceUtils, "mad_PHValueFromVNSexCategoryLabel:", v90));

              objc_msgSend(v163, "eyesCategory");
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v91, "label");
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v92, "identifier");
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setEyesState:", +[VCPFaceUtils mad_PHValueFromVNEyesCategoryLabel:](VCPFaceUtils, "mad_PHValueFromVNEyesCategoryLabel:", v93));

              objc_msgSend(v163, "smilingCategory");
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v94, "label");
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v95, "identifier");
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setSmileType:", +[VCPFaceUtils mad_PHValueFromVNSmilingCategoryLabel:](VCPFaceUtils, "mad_PHValueFromVNSmilingCategoryLabel:", v96));

              objc_msgSend(v163, "faceHairCategory");
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v97, "label");
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v98, "identifier");
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setFacialHairType:", +[VCPFaceUtils mad_PHValueFromVNFaceHairCategoryLabel:](VCPFaceUtils, "mad_PHValueFromVNFaceHairCategoryLabel:", v99));

              objc_msgSend(v163, "hairColorCategory");
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v100, "label");
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v101, "identifier");
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setHairColorType:", +[VCPFaceUtils mad_PHValueFromVNHairColorCategoryLabel:](VCPFaceUtils, "mad_PHValueFromVNHairColorCategoryLabel:", v102));

              objc_msgSend(v163, "glassesCategory");
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v103, "label");
              v104 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v104, "identifier");
              v105 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setGlassesType:", +[VCPFaceUtils mad_PHValueFromVNGlassesCategoryLabel:](VCPFaceUtils, "mad_PHValueFromVNGlassesCategoryLabel:", v105));

              objc_msgSend(v163, "VN4UfLbvVUqMvYV8bbGFQcxg5yRLm8ekI1");
              v106 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v106, "label");
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v107, "identifier");
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setExpressionType:", +[VCPFaceUtils mad_PHValueFromVNExpressionCategoryLabel:](VCPFaceUtils, "mad_PHValueFromVNExpressionCategoryLabel:", v108));

              objc_msgSend(v163, "VN7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP");
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v109, "label");
              v110 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v110, "identifier");
              v111 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setHeadgearType:", +[VCPFaceUtils mad_PHValueFromVNHeadgearCategoryLabel:](VCPFaceUtils, "mad_PHValueFromVNHeadgearCategoryLabel:", v111));

              objc_msgSend(v163, "VN2riiZbQrloRhCzYW56f0rk4N3ROe151S");
              v112 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v112, "label");
              v113 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v113, "identifier");
              v114 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setHairType:", +[VCPFaceUtils mad_PHValueFromVNFaceHairCategoryV2Label:](VCPFaceUtils, "mad_PHValueFromVNFaceHairCategoryV2Label:", v114));

              objc_msgSend(v163, "VNpLorzxnyAlLcPFNcKhgoNCmy9b5BRWyk");
              v115 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v115, "label");
              v116 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v116, "identifier");
              v117 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setPoseType:", +[VCPFaceUtils mad_PHValueFromVNPoseCategoryLabel:](VCPFaceUtils, "mad_PHValueFromVNPoseCategoryLabel:", v117));

              objc_msgSend(v163, "VN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq");
              v118 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v118, "label");
              v119 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v119, "identifier");
              v120 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setSkintoneType:", +[VCPFaceUtils mad_PHValueFromVNSkintoneCategoryLabel:](VCPFaceUtils, "mad_PHValueFromVNSkintoneCategoryLabel:", v120));

              objc_msgSend(v163, "VN1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB");
              v121 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v121, "label");
              v122 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v122, "identifier");
              v123 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setEthnicityType:", +[VCPFaceUtils mad_PHValueFromVNEthnicityCategoryLabel:](VCPFaceUtils, "mad_PHValueFromVNEthnicityCategoryLabel:", v123));

              v124 = objc_msgSend(v17, "eyesState") == 1;
            }
            else
            {
              if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VCPPhotosFace] Missing results from VNClassifyFaceAttributesRequest", buf, 2u);
              }
              v124 = 0;
            }
            objc_msgSend(v17, "setIsLeftEyeClosed:", v124);
            objc_msgSend(v17, "setIsRightEyeClosed:", v124);
            v125 = objc_opt_class();
            v18[2](v18, v125);
            v126 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v15, "uuid");
            v127 = objc_claimAutoreleasedReturnValue();
            __131__VCPPhotosFace_faceFromFaceObservation_humanObservation_sourceWidth_sourceHeight_visionRequests_processingVersion_force_andError___block_invoke_2(v127, (void *)v127, v126);
            v162 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v162, "gaze");
            v128 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v127) = v128 == 0;

            if ((v127 & 1) != 0)
            {
              if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VCPPhotosFace] Missing results from VNDetectFaceGazeRequest", buf, 2u);
              }
            }
            else
            {
              objc_msgSend(v162, "gaze");
              v129 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v129, "gazeMask");
              v130 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setHasFaceMask:", v130 != 0);

              objc_msgSend(v162, "gaze");
              v131 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setGazeType:", +[VCPFaceUtils mad_PHValueFromVNFaceGazeDirection:](VCPFaceUtils, "mad_PHValueFromVNFaceGazeDirection:", objc_msgSend(v131, "direction")));

              objc_msgSend(v162, "gaze");
              v132 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v132, "location");
              objc_msgSend(v17, "setGazeCenterX:");

              objc_msgSend(v162, "gaze");
              v133 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v133, "location");
              objc_msgSend(v17, "setGazeCenterY:", v134);

              objc_msgSend(v162, "gaze");
              v135 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v135, "locationBounds");
              objc_msgSend(v17, "setGazeRect:");

              objc_msgSend(v162, "gaze");
              v136 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v136, "horizontalAngle");
              objc_msgSend(v17, "setGazeAngle:");

              if (objc_msgSend(v17, "hasFaceMask"))
              {
                objc_msgSend(v162, "gaze");
                v137 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v137, "gazeMask");
                v138 = (void *)objc_claimAutoreleasedReturnValue();
                cf = (CFTypeRef)objc_msgSend(v138, "pixelBuffer");

                v139 = (__CVBuffer *)cf;
                if (cf)
                {
                  CFRetain(cf);
                  v139 = (__CVBuffer *)cf;
                }
                Width = CVPixelBufferGetWidth(v139);
                Height = CVPixelBufferGetHeight((CVPixelBufferRef)cf);
                BytesPerRow = CVPixelBufferGetBytesPerRow((CVPixelBufferRef)cf);
                PixelFormatType = CVPixelBufferGetPixelFormatType((CVPixelBufferRef)cf);
                if (PixelFormatType == 1278226534)
                {
                  CVPixelBufferLock::CVPixelBufferLock((CVPixelBufferLock *)buf, (CVPixelBufferRef)cf, 1uLL);
                  v143 = *(_DWORD *)buf;
                  if (*(_DWORD *)buf)
                    goto LABEL_104;
                  BaseAddress = (char *)CVPixelBufferGetBaseAddress((CVPixelBufferRef)cf);
                  if (Height < 1)
                  {
                    v146 = -1.0;
                  }
                  else
                  {
                    v145 = 0;
                    v146 = -1.0;
                    do
                    {
                      if (Width >= 1)
                      {
                        v147 = (float *)&BaseAddress[4 * v145 * ((uint64_t)BytesPerRow >> 2)];
                        v148 = Width;
                        do
                        {
                          v149 = *v147++;
                          v150 = v149;
                          if (v149 > v146)
                            v146 = v150;
                          --v148;
                        }
                        while (v148);
                      }
                      ++v145;
                    }
                    while (v145 != Height);
                  }
                  v143 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)buf);
                  if (v143)
                  {
LABEL_104:
                    if ((int)MediaAnalysisLogLevel() >= 3
                      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)v177 = 67109120;
                      v178 = v143;
                      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VCPPhotosFace] Failed to access gazeMask (%d)", v177, 8u);
                    }
                  }
                  else
                  {
                    LODWORD(v151) = 1.0;
                    if (v146 < 1.0)
                      *(float *)&v151 = v146;
                    if (v146 <= 0.0)
                      *(float *)&v151 = 0.0;
                    objc_msgSend(v17, "setGazeConfidence:", v151);
                  }
                  CVPixelBufferLock::~CVPixelBufferLock((CVPixelBufferLock *)buf);
                }
                else if ((int)MediaAnalysisLogLevel() >= 3
                       && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)v186 = PixelFormatType;
                  *(_WORD *)&v186[4] = 1024;
                  *(_DWORD *)&v186[6] = 1278226534;
                  _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VCPPhotosFace] Unexpected gazeMask pixel format %d (expected: %d)", buf, 0xEu);
                }
                CF<opaqueCMSampleBuffer *>::~CF(&cf);
              }
            }
            v35 = v17;

            goto LABEL_37;
          }
          v66 = (void *)MEMORY[0x1E0CB35C8];
          v179 = *MEMORY[0x1E0CB2D50];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[VCPPhotosFace] Unable to determine normalized face bounding { { %f, %f } { %f, %f } }"), v54, v56, v58, v60);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v180 = v67;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v180, &v179, 1);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v68);
          *a10 = (id)objc_claimAutoreleasedReturnValue();

        }
        v35 = 0;
        goto LABEL_37;
      }
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        objc_msgSend((id)v22, "confidence");
        v28 = v27;
        if (_os_feature_enabled_impl())
          v29 = 0x3FC99999A0000000;
        else
          v29 = 0x3FECCCCCC0000000;
        objc_msgSend(v171, "description");
        v30 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        objc_msgSend(v171, "faceJunkinessIndex");
        *(_DWORD *)buf = 134218754;
        *(double *)v186 = v28;
        *(_WORD *)&v186[8] = 2048;
        v187 = v29;
        v188 = 2112;
        v189 = v30;
        v190 = 2048;
        v191 = v31;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[VCPPhotosFace] faceprint.confidence is too low (%.3f < %.3f) %@ - junkinessIndex: %.3f", buf, 0x2Au);

      }
      v22 = 0;
    }
    v32 = 0;
    goto LABEL_20;
  }
  v33 = (void *)MEMORY[0x1E0CB35C8];
  v192 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[VCPPhotosFace] Missing faceObservation and humanObservation"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v193[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v193, &v192, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v34);
  v35 = 0;
  *a10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_40:

  return v35;
}

id __131__VCPPhotosFace_faceFromFaceObservation_humanObservation_sourceWidth_sourceHeight_visionRequests_processingVersion_force_andError___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v9;
    while (2)
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v9 != v3)
          objc_enumerationMutation(v1);
        v5 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v4);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v6 = v5;
          goto LABEL_11;
        }
        ++v4;
      }
      while (v2 != v4);
      v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v2)
        continue;
      break;
    }
  }
  v6 = 0;
LABEL_11:

  return v6;
}

id __131__VCPPhotosFace_faceFromFaceObservation_humanObservation_sourceWidth_sourceHeight_visionRequests_processingVersion_force_andError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a3, "results", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "uuid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

+ (id)facesFromFaceObservations:(id)a3 humanObservations:(id)a4 animalObservations:(id)a5 sourceWidth:(unint64_t)a6 sourceHeight:(unint64_t)a7 visionRequests:(id)a8 blurScorePerFace:(id)a9 exposureScorePerFace:(id)a10 tooSmallFaceObservations:(id)a11 processingVersion:(int)a12
{
  void *v12;
  char *j;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  BOOL v26;
  unint64_t i;
  _QWORD *v28;
  _QWORD **v29;
  _QWORD *v30;
  _QWORD **v31;
  unint64_t v32;
  _QWORD *v33;
  void *v34;
  void *v35;
  BOOL v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  double v43;
  id v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  BOOL v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  unint64_t v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  double v64;
  double v65;
  void *v66;
  double v67;
  double v68;
  void *v69;
  double v70;
  double v71;
  void *v72;
  double v73;
  double v74;
  void *v75;
  double v76;
  double v77;
  float v78;
  float v79;
  float v80;
  float v81;
  double v82;
  float v83;
  float *v84;
  unint64_t v85;
  unint64_t v86;
  unint64_t v87;
  char *v88;
  char *v89;
  float *v90;
  uint64_t v91;
  uint64_t v92;
  __int128 v93;
  unint64_t v94;
  uint64_t v95;
  float *v96;
  float *v97;
  uint64_t v98;
  float *v99;
  unint64_t v100;
  _QWORD *v101;
  _QWORD **v102;
  _QWORD *v103;
  _QWORD **v104;
  unint64_t v105;
  _QWORD *v106;
  _QWORD *v107;
  _QWORD **v108;
  _QWORD *v109;
  _QWORD **v110;
  unint64_t v111;
  _QWORD *v112;
  void *v113;
  void *v114;
  double v115;
  void *v116;
  double v117;
  double v118;
  void *v119;
  double v120;
  void *v121;
  BOOL v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  unint64_t k;
  _QWORD *v128;
  _QWORD **v129;
  _QWORD *v130;
  _QWORD **v131;
  unint64_t v132;
  _QWORD *v133;
  void *v134;
  double v135;
  id v136;
  void *v137;
  double v138;
  double v139;
  double v140;
  void *v141;
  BOOL v142;
  void *v143;
  void *v144;
  unint64_t m;
  _QWORD *v146;
  _QWORD **v147;
  _QWORD *v148;
  _QWORD **v149;
  unint64_t v150;
  _QWORD *v151;
  double v152;
  double v153;
  CGFloat v154;
  double v155;
  CGFloat v156;
  double v157;
  CGFloat v158;
  double v159;
  double v160;
  uint64_t v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  uint64_t v168;
  void *v169;
  NSObject *v170;
  os_log_type_t v171;
  const char *v172;
  uint32_t v173;
  unint64_t n;
  double v175;
  double v176;
  void *v177;
  void *v178;
  void *v179;
  uint64_t v180;
  double v181;
  double v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  double v189;
  CGFloat v190;
  double v191;
  CGFloat v192;
  double v193;
  CGFloat v194;
  double v195;
  double v196;
  void *v197;
  void *v198;
  float v199;
  float v200;
  float v201;
  void *v202;
  NSObject *v203;
  os_log_type_t v204;
  const char *v205;
  uint32_t v206;
  NSObject *v207;
  os_log_type_t v208;
  const char *v209;
  uint32_t v210;
  float v211;
  float v212;
  void *v213;
  void *v214;
  double v215;
  void *v216;
  void *v217;
  BOOL v218;
  uint64_t v220;
  void *v221;
  id v222;
  id v223;
  void *v224;
  void (**v225)(void *, uint64_t);
  void *v226;
  double v227;
  id v228;
  id v229;
  id v230;
  id v231;
  void *v234;
  void *v235;
  id v237;
  id v238;
  id v239;
  id v240;
  float *v241;
  float *v242;
  float *v243;
  id v244;
  unint64_t v245;
  uint64_t *v246;
  _QWORD *v247[2];
  uint64_t *v248;
  _QWORD *v249[2];
  _QWORD aBlock[4];
  id v251;
  uint8_t buf[4];
  double v253;
  __int16 v254;
  uint64_t v255;
  __int16 v256;
  uint64_t v257;
  __int16 v258;
  uint64_t v259;
  uint64_t v260;
  CGRect v261;
  CGRect v262;
  CGRect v263;
  CGRect v264;

  v17 = (uint64_t)a10;
  j = (char *)a11;
  v260 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v19 = a4;
  v230 = a5;
  v20 = a8;
  v229 = a9;
  v228 = a10;
  v222 = a11;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v223 = (id)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __201__VCPPhotosFace_facesFromFaceObservations_humanObservations_animalObservations_sourceWidth_sourceHeight_visionRequests_blurScorePerFace_exposureScorePerFace_tooSmallFaceObservations_processingVersion___block_invoke;
  aBlock[3] = &unk_1E6B16890;
  v231 = v20;
  v251 = v231;
  v225 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  v249[0] = 0;
  v249[1] = 0;
  v247[1] = 0;
  v248 = (uint64_t *)v249;
  v246 = (uint64_t *)v247;
  v247[0] = 0;
  v21 = objc_opt_class();
  v225[2](v225, v21);
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v221 && (int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Requests do not contain VNDetectFaceRectanglesRequest", buf, 2u);
  }
  if (objc_msgSend(v221, "revision") == 3737841670)
  {
    v22 = 0;
    v23 = MEMORY[0x1E0C81028];
    v17 = 2112;
    while (1)
    {
      v241 = (float *)v22;
      if (v22 >= objc_msgSend(v18, "count"))
        break;
      objc_msgSend(v18, "objectAtIndexedSubscript:", v241);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "groupId");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25 == 0;

      if (!v26)
      {
        for (i = 0; ; i = v245 + 1)
        {
          v245 = i;
          if (i >= objc_msgSend(v19, "count"))
            break;
          v28 = v247[0];
          if (!v247[0])
            goto LABEL_232;
          v29 = v247;
          do
          {
            v30 = v28;
            v31 = v29;
            v32 = v28[4];
            v33 = v28 + 1;
            if (v32 >= v245)
            {
              v33 = v30;
              v29 = (_QWORD **)v30;
            }
            v28 = (_QWORD *)*v33;
          }
          while (v28);
          if (v29 == v247)
            goto LABEL_232;
          if (v32 < v245)
            v30 = v31;
          if (v245 < v30[4])
          {
LABEL_232:
            objc_msgSend(v19, "objectAtIndexedSubscript:", v245);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "groupId");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = v35 == 0;

            if (!v36)
            {
              objc_msgSend(v18, "objectAtIndexedSubscript:", v241);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "groupId");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "objectAtIndexedSubscript:", v245);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "groupId");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = objc_msgSend(v38, "isEqual:", v12);

              if ((v40 & 1) != 0)
              {
                objc_msgSend(v18, "objectAtIndexedSubscript:", v241);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "objectAtIndexedSubscript:", v245);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v244 = 0;
                LOBYTE(v220) = 0;
                objc_msgSend(a1, "faceFromFaceObservation:humanObservation:sourceWidth:sourceHeight:visionRequests:processingVersion:force:andError:", v41, v42, a6, a7, v231, a12, v220, &v244);
                v43 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
                v44 = v244;

                if (v43 != 0.0 && !v44)
                {
                  objc_msgSend(v18, "objectAtIndexedSubscript:", v241);
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(*(id *)&v43, "setIsTooSmall:", objc_msgSend(v222, "containsObject:", v46));

                  if (v229)
                  {
                    objc_msgSend(v229, "objectAtIndexedSubscript:", v241);
                    v226 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v226, "doubleValue");
                  }
                  else
                  {
                    v47 = 1.0;
                  }
                  objc_msgSend(*(id *)&v43, "setBlurScore:", v47);
                  if (v229)

                  if (v228)
                  {
                    objc_msgSend(v228, "objectAtIndexedSubscript:", v241);
                    v224 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v224, "doubleValue");
                  }
                  else
                  {
                    v48 = 0.0;
                  }
                  objc_msgSend(*(id *)&v43, "setExposureScore:", v48);
                  if (v228)

                  objc_msgSend(*(id *)&v43, "setQualityMeasure:", objc_msgSend(*(id *)&v43, "qualityMeasureWithCountOfFacesOnAsset:", objc_msgSend(v18, "count")));
                  objc_msgSend(*(id *)&v43, "imageprintWrapper");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  v50 = v49 == 0;

                  if (v50)
                  {
                    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                    {
                      objc_msgSend(v18, "objectAtIndexedSubscript:", v241);
                      v53 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v19, "objectAtIndexedSubscript:", v245);
                      v54 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412802;
                      v253 = v43;
                      v254 = 2112;
                      v255 = (uint64_t)v53;
                      v256 = 2112;
                      v257 = (uint64_t)v54;
                      _os_log_impl(&dword_1B6C4A000, v23, OS_LOG_TYPE_DEFAULT, "[PhotosFace] Fail to generate VCPPhotosFace %@ from %@ and %@ - invalid imageprint", buf, 0x20u);

                    }
                  }
                  else
                  {
                    objc_msgSend(v223, "addObject:", *(_QWORD *)&v43);
                    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
                    {
                      objc_msgSend(v18, "objectAtIndexedSubscript:", v241);
                      v51 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v19, "objectAtIndexedSubscript:", v245);
                      v52 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412802;
                      v253 = v43;
                      v254 = 2112;
                      v255 = (uint64_t)v51;
                      v256 = 2112;
                      v257 = (uint64_t)v52;
                      _os_log_impl(&dword_1B6C4A000, v23, OS_LOG_TYPE_DEBUG, "[PhotosFace] Generate VCPPhotosFace %@ from %@ and %@", buf, 0x20u);

                    }
                  }
                  std::__tree<unsigned long>::__emplace_unique_key_args<unsigned long,unsigned long const&>(&v248, (unint64_t *)&v241, (uint64_t *)&v241);
                  std::__tree<unsigned long>::__emplace_unique_key_args<unsigned long,unsigned long const&>(&v246, &v245, (uint64_t *)&v245);

                  break;
                }
                if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v18, "objectAtIndexedSubscript:", v241);
                  v45 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
                  objc_msgSend(v19, "objectAtIndexedSubscript:", v245);
                  v12 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  v253 = v45;
                  v254 = 2112;
                  v255 = (uint64_t)v12;
                  v256 = 2112;
                  v257 = (uint64_t)v44;
                  _os_log_impl(&dword_1B6C4A000, v23, OS_LOG_TYPE_DEFAULT, "[PhotosFace] Fail to generate VCPPhotosFace from %@ and %@ - %@", buf, 0x20u);

                }
              }
            }
          }
        }
      }
      v22 = (unint64_t)v241 + 1;
    }
  }
  else
  {
    v55 = 0;
    v241 = 0;
    v242 = 0;
    v243 = 0;
    v234 = (void *)0xBFB999999999999ALL;
    v12 = (void *)0xAAAAAAAAAAAAAAABLL;
    while (v55 < objc_msgSend(v18, "count"))
    {
      for (j = 0; (unint64_t)j < objc_msgSend(v19, "count"); ++j)
      {
        objc_msgSend(v18, "objectAtIndexedSubscript:", v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectAtIndexedSubscript:", j);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_calculateOverlappingBetweenFaceObservation:andBodyObservation:", v56, v57);
        v59 = v58;

        objc_msgSend(v18, "objectAtIndexedSubscript:", v55);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "boundingBox");
        v62 = v61;
        objc_msgSend(v18, "objectAtIndexedSubscript:", v55);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "boundingBox");
        v65 = v64;

        objc_msgSend(v18, "objectAtIndexedSubscript:", v55);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "boundingBox");
        v68 = v67;

        objc_msgSend(v19, "objectAtIndexedSubscript:", j);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "boundingBox");
        v71 = v70;
        objc_msgSend(v19, "objectAtIndexedSubscript:", j);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "boundingBox");
        v74 = v73;

        objc_msgSend(v19, "objectAtIndexedSubscript:", j);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "boundingBox");
        v77 = v76;

        v78 = 1.0 - (v62 + v65);
        v79 = 1.0 - v68;
        v80 = 1.0 - (v71 + v74);
        v81 = 1.0 - v77;
        v82 = vabds_f32(v78, v80) * -0.1;
        if (v79 < v81)
          v79 = 1.0 - v77;
        v83 = v59 + v82 / (v79 + 0.000001);
        v84 = v242;
        if (v242 >= v243)
        {
          v85 = 0xAAAAAAAAAAAAAAABLL * (((char *)v242 - (char *)v241) >> 3);
          v86 = v85 + 1;
          if (v85 + 1 > 0xAAAAAAAAAAAAAAALL)
            std::vector<std::unique_ptr<VCPProtoKeypoint>>::__throw_length_error[abi:ne180100]();
          if (0x5555555555555556 * (((char *)v243 - (char *)v241) >> 3) > v86)
            v86 = 0x5555555555555556 * (((char *)v243 - (char *)v241) >> 3);
          if (0xAAAAAAAAAAAAAAABLL * (((char *)v243 - (char *)v241) >> 3) >= 0x555555555555555)
            v87 = 0xAAAAAAAAAAAAAAALL;
          else
            v87 = v86;
          if (v87)
            v88 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::tuple<float,unsigned long,unsigned long>>>((uint64_t)&v243, v87);
          else
            v88 = 0;
          v89 = &v88[8 * (((char *)v242 - (char *)v241) >> 3)];
          *(float *)v89 = v83;
          *((_QWORD *)v89 + 1) = v55;
          *((_QWORD *)v89 + 2) = j;
          v91 = (uint64_t)v241;
          v90 = v242;
          v92 = (uint64_t)&v88[24 * v85];
          if (v242 != v241)
          {
            do
            {
              v93 = *(_OWORD *)(v90 - 6);
              *(_QWORD *)(v92 - 8) = *((_QWORD *)v90 - 1);
              *(_OWORD *)(v92 - 24) = v93;
              v92 -= 24;
              v90 -= 6;
            }
            while (v90 != (float *)v91);
            v90 = v241;
          }
          v17 = (uint64_t)(v89 + 24);
          v241 = (float *)v92;
          v242 = (float *)(v89 + 24);
          v243 = (float *)&v88[24 * v87];
          if (v90)
            operator delete(v90);
        }
        else
        {
          *v242 = v83;
          v17 = (uint64_t)(v84 + 6);
          *((_QWORD *)v84 + 1) = v55;
          *((_QWORD *)v84 + 2) = j;
        }
        v242 = (float *)v17;
      }
      ++v55;
    }
    v94 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (((char *)v242 - (char *)v241) >> 3));
    if (v242 == v241)
      v95 = 0;
    else
      v95 = v94;
    std::__introsort<std::_ClassicAlgPolicy,+[VCPPhotosFace facesFromFaceObservations:humanObservations:animalObservations:sourceWidth:sourceHeight:visionRequests:blurScorePerFace:exposureScorePerFace:tooSmallFaceObservations:processingVersion:]::$_0 &,std::tuple<float,unsigned long,unsigned long> *,false>((uint64_t)v241, (unint64_t)v242, v95, 1);
    v96 = v241;
    v97 = v242;
    if (v242 == v241)
    {
      v96 = v242;
      if (!v242)
        goto LABEL_122;
    }
    else
    {
      v98 = 0;
      while (1)
      {
        v99 = &v96[6 * v98];
        if (*v99 < 0.8)
          break;
        v12 = (void *)*((_QWORD *)v99 + 1);
        v100 = *((_QWORD *)v99 + 2);
        v101 = v249[0];
        if (!v249[0])
          goto LABEL_87;
        v102 = v249;
        do
        {
          v103 = v101;
          v104 = v102;
          v105 = v101[4];
          v106 = v101 + 1;
          if (v105 >= (unint64_t)v12)
          {
            v106 = v103;
            v102 = (_QWORD **)v103;
          }
          v101 = (_QWORD *)*v106;
        }
        while (v101);
        if (v102 == v249)
          goto LABEL_87;
        if (v105 < (unint64_t)v12)
          v103 = v104;
        if ((unint64_t)v12 < v103[4])
        {
LABEL_87:
          v107 = v247[0];
          if (!v247[0])
            goto LABEL_96;
          v108 = v247;
          do
          {
            v109 = v107;
            v110 = v108;
            v111 = v107[4];
            v112 = v107 + 1;
            if (v111 >= v100)
            {
              v112 = v109;
              v108 = (_QWORD **)v109;
            }
            v107 = (_QWORD *)*v112;
          }
          while (v107);
          if (v108 == v247)
            goto LABEL_96;
          if (v111 < v100)
            v109 = v110;
          if (v100 < v109[4])
          {
LABEL_96:
            objc_msgSend(v18, "objectAtIndexedSubscript:", v12);
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectAtIndexedSubscript:", v100);
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            v240 = 0;
            LOBYTE(v220) = 0;
            objc_msgSend(a1, "faceFromFaceObservation:humanObservation:sourceWidth:sourceHeight:visionRequests:processingVersion:force:andError:", v113, v114, a6, a7, v231, a12, v220, &v240);
            v115 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            v17 = (uint64_t)v240;

            if (v115 == 0.0 || v17)
            {
              if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v18, "objectAtIndexedSubscript:", v12);
                v118 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
                objc_msgSend(v19, "objectAtIndexedSubscript:", v100);
                v119 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v253 = v118;
                v254 = 2112;
                v255 = (uint64_t)v119;
                v256 = 2112;
                v257 = v17;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[PhotosFace] Fail to generate VCPPhotosFace from %@ and %@ - %@", buf, 0x20u);

              }
            }
            else
            {
              objc_msgSend(v18, "objectAtIndexedSubscript:", v12);
              v116 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)&v115, "setIsTooSmall:", objc_msgSend(v222, "containsObject:", v116));

              if (v229)
              {
                objc_msgSend(v229, "objectAtIndexedSubscript:", v12);
                v234 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v234, "doubleValue");
              }
              else
              {
                v117 = 1.0;
              }
              objc_msgSend(*(id *)&v115, "setBlurScore:", v117);
              if (v229)

              if (v228)
              {
                objc_msgSend(v228, "objectAtIndexedSubscript:", v12);
                j = (char *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(j, "doubleValue");
              }
              else
              {
                v120 = 0.0;
              }
              objc_msgSend(*(id *)&v115, "setExposureScore:", v120);
              if (v228)

              objc_msgSend(*(id *)&v115, "setQualityMeasure:", objc_msgSend(*(id *)&v115, "qualityMeasureWithCountOfFacesOnAsset:", objc_msgSend(v18, "count")));
              objc_msgSend(*(id *)&v115, "imageprintWrapper");
              v121 = (void *)objc_claimAutoreleasedReturnValue();
              v122 = v121 == 0;

              if (v122)
              {
                if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v18, "objectAtIndexedSubscript:", v12);
                  v125 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "objectAtIndexedSubscript:", v100);
                  v126 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  v253 = v115;
                  v254 = 2112;
                  v255 = (uint64_t)v125;
                  v256 = 2112;
                  v257 = (uint64_t)v126;
                  _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[PhotosFace] Fail to generate VCPPhotosFace %@ from %@ and %@ - invalid imageprint", buf, 0x20u);

                }
              }
              else
              {
                objc_msgSend(v223, "addObject:", *(_QWORD *)&v115);
                std::__tree<unsigned long>::__emplace_unique_key_args<unsigned long,unsigned long const&>(&v248, (unint64_t *)&v241[6 * v98 + 2], (uint64_t *)&v241[6 * v98 + 2]);
                std::__tree<unsigned long>::__emplace_unique_key_args<unsigned long,unsigned long const&>(&v246, (unint64_t *)&v241[6 * v98 + 4], (uint64_t *)&v241[6 * v98 + 4]);
                if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v18, "objectAtIndexedSubscript:", v12);
                  v123 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "objectAtIndexedSubscript:", v100);
                  v124 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  v253 = v115;
                  v254 = 2112;
                  v255 = (uint64_t)v123;
                  v256 = 2112;
                  v257 = (uint64_t)v124;
                  _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[PhotosFace] Generate VCPPhotosFace %@ from %@ and %@", buf, 0x20u);

                }
              }
            }

            v96 = v241;
            v97 = v242;
          }
        }
        if (++v98 >= 0xAAAAAAAAAAAAAAABLL * (((char *)v97 - (char *)v96) >> 3))
        {
          if (!v96)
            goto LABEL_122;
          break;
        }
      }
    }
    v242 = v96;
    operator delete(v96);
  }
LABEL_122:
  for (k = 0; k < objc_msgSend(v18, "count"); ++k)
  {
    v128 = v249[0];
    if (!v249[0])
      goto LABEL_133;
    v129 = v249;
    do
    {
      v130 = v128;
      v131 = v129;
      v132 = v128[4];
      v133 = v128 + 1;
      if (v132 >= k)
      {
        v133 = v130;
        v129 = (_QWORD **)v130;
      }
      v128 = (_QWORD *)*v133;
    }
    while (v128);
    if (v129 == v249)
      goto LABEL_133;
    if (v132 < k)
      v130 = v131;
    if (k < v130[4])
    {
LABEL_133:
      objc_msgSend(v18, "objectAtIndexedSubscript:", k);
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      v239 = 0;
      LOBYTE(v220) = 0;
      objc_msgSend(a1, "faceFromFaceObservation:humanObservation:sourceWidth:sourceHeight:visionRequests:processingVersion:force:andError:", v134, 0, a6, a7, v231, a12, v220, &v239);
      v135 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      v136 = v239;

      if (v135 == 0.0 || v136)
      {
        if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v18, "objectAtIndexedSubscript:", k);
          v139 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          *(_DWORD *)buf = 138412546;
          v253 = v139;
          v254 = 2112;
          v255 = (uint64_t)v136;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[PhotosFace] Fail to generate face only VCPPhotosFace from %@ - %@", buf, 0x16u);

        }
      }
      else
      {
        objc_msgSend(v18, "objectAtIndexedSubscript:", k);
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)&v135, "setIsTooSmall:", objc_msgSend(v222, "containsObject:", v137));

        if (v229)
        {
          objc_msgSend(v229, "objectAtIndexedSubscript:", k);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "doubleValue");
        }
        else
        {
          v138 = 1.0;
        }
        objc_msgSend(*(id *)&v135, "setBlurScore:", v138);
        if (v229)

        if (v228)
        {
          objc_msgSend(v228, "objectAtIndexedSubscript:", k);
          v17 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v17, "doubleValue");
        }
        else
        {
          v140 = 0.0;
        }
        objc_msgSend(*(id *)&v135, "setExposureScore:", v140);
        if (v228)

        objc_msgSend(*(id *)&v135, "setQualityMeasure:", objc_msgSend(*(id *)&v135, "qualityMeasureWithCountOfFacesOnAsset:", objc_msgSend(v18, "count")));
        objc_msgSend(*(id *)&v135, "imageprintWrapper");
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        v142 = v141 == 0;

        if (v142)
        {
          if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v18, "objectAtIndexedSubscript:", k);
            v144 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v253 = v135;
            v254 = 2112;
            v255 = (uint64_t)v144;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[PhotosFace] Fail to generate VCPPhotosFace %@ from %@ - invalid imageprint", buf, 0x16u);

          }
        }
        else
        {
          objc_msgSend(v223, "addObject:", *(_QWORD *)&v135);
          if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v18, "objectAtIndexedSubscript:", k);
            v143 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v253 = v135;
            v254 = 2112;
            v255 = (uint64_t)v143;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[PhotosFace] Generate face only VCPPhotosFace %@ from %@", buf, 0x16u);

          }
        }
      }

    }
  }
  for (m = 0; m < objc_msgSend(v19, "count"); ++m)
  {
    v146 = v247[0];
    if (!v247[0])
      goto LABEL_168;
    v147 = v247;
    do
    {
      v148 = v146;
      v149 = v147;
      v150 = v146[4];
      v151 = v146 + 1;
      if (v150 >= m)
      {
        v151 = v148;
        v147 = (_QWORD **)v148;
      }
      v146 = (_QWORD *)*v151;
    }
    while (v146);
    if (v147 == v247)
      goto LABEL_168;
    if (v150 < m)
      v148 = v149;
    if (m < v148[4])
    {
LABEL_168:
      objc_msgSend(v19, "objectAtIndexedSubscript:", m);
      v235 = (void *)objc_claimAutoreleasedReturnValue();
      +[VCPPhotosFace faceWithLocalIdentifier:](VCPPhotosFace, "faceWithLocalIdentifier:", 0);
      v152 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      objc_msgSend(*(id *)&v152, "setSourceWidth:", a6);
      objc_msgSend(*(id *)&v152, "setSourceHeight:", a7);
      objc_msgSend(*(id *)&v152, "setManual:", 0);
      objc_msgSend(*(id *)&v152, "setAlgorithmVersion:", a12);
      objc_msgSend(*(id *)&v152, "setDetectionType:", 1);
      objc_msgSend(v235, "boundingBox");
      v154 = v153;
      v156 = v155;
      v158 = v157;
      v160 = v159;
      objc_msgSend(*(id *)&v152, "setBodyWidth:", v157);
      objc_msgSend(*(id *)&v152, "setBodyHeight:", v160);
      v261.origin.x = v154;
      v261.origin.y = v156;
      v261.size.width = v158;
      v261.size.height = v160;
      objc_msgSend(*(id *)&v152, "setBodyCenterX:", CGRectGetMidX(v261));
      v262.origin.x = v154;
      v262.origin.y = v156;
      v262.size.width = v158;
      v262.size.height = v160;
      objc_msgSend(*(id *)&v152, "setBodyCenterY:", CGRectGetMidY(v262));
      v161 = objc_opt_class();
      v225[2](v225, v161);
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v235, "uuid");
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      __201__VCPPhotosFace_facesFromFaceObservations_humanObservations_animalObservations_sourceWidth_sourceHeight_visionRequests_blurScorePerFace_exposureScorePerFace_tooSmallFaceObservations_processingVersion___block_invoke_2((uint64_t)v163, v163, v162);
      v164 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v164, "torsoprint");
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      if (v165)
      {
        v166 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEDEE8]), "initWithFaceprint:torsoprint:", 0, v165);
        v238 = 0;
        objc_msgSend(v166, "serializeStateAndReturnError:", &v238);
        v167 = (void *)objc_claimAutoreleasedReturnValue();
        v227 = COERCE_DOUBLE(v238);
        if (v167)
        {
          +[VCPVNImageprintWrapper wrapperWithImageprintType:version:andData:](VCPVNImageprintWrapper, "wrapperWithImageprintType:version:andData:", 0, a12, v167);
          v168 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)&v152, "setImageprintWrapper:", v168);

          objc_msgSend(*(id *)&v152, "setVuObservationID:", 0);
          objc_msgSend(*(id *)&v152, "imageprintWrapper");
          v169 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v168) = v169 == 0;

          if ((v168 & 1) == 0)
          {
            objc_msgSend(v223, "addObject:", *(_QWORD *)&v152);
            if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v253 = v152;
              v254 = 2112;
              v255 = (uint64_t)v235;
              v170 = MEMORY[0x1E0C81028];
              v171 = OS_LOG_TYPE_DEBUG;
              v172 = "[PhotosFace] Generate VCPPhotosFace %@ from %@";
              v173 = 22;
              goto LABEL_180;
            }
          }
        }
        else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v253 = v227;
          v170 = MEMORY[0x1E0C81028];
          v171 = OS_LOG_TYPE_ERROR;
          v172 = "[PhotosFace] Failed to serialize torsoprint; %@";
          v173 = 12;
LABEL_180:
          _os_log_impl(&dword_1B6C4A000, v170, v171, v172, buf, v173);
        }

      }
      else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[PhotosFace] torsoOnlyObservation failed to return a faceprint", buf, 2u);
      }

      continue;
    }
  }
  for (n = 0; n < objc_msgSend(v230, "count"); ++n)
  {
    objc_msgSend(v230, "objectAtIndexedSubscript:", n);
    v175 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    if (!objc_msgSend(a1, "_isColocatingAnimalObservation:withFaceObservations:orTorsoObservations:", *(_QWORD *)&v175, v18, v19))
    {
      +[VCPPhotosFace faceWithLocalIdentifier:](VCPPhotosFace, "faceWithLocalIdentifier:", 0);
      v176 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      objc_msgSend(*(id *)&v176, "setSourceWidth:", a6);
      objc_msgSend(*(id *)&v176, "setSourceHeight:", a7);
      objc_msgSend(*(id *)&v176, "setManual:", 0);
      objc_msgSend(*(id *)&v176, "setAlgorithmVersion:", a12);
      objc_msgSend(*(id *)&v175, "labels");
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v177, "firstObject");
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v178, "identifier");
      v179 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v179, "isEqualToString:", CFSTR("Dog")) & 1) != 0)
      {
        v180 = 3;
        goto LABEL_194;
      }
      if (objc_msgSend(v179, "isEqualToString:", CFSTR("Cat")))
      {
        v180 = 4;
LABEL_194:
        objc_msgSend(*(id *)&v176, "setDetectionType:", v180);
        objc_msgSend(*(id *)&v175, "boundingBox");
        v182 = v181;
        v184 = v183;
        v186 = v185;
        v188 = v187;
        if ((objc_msgSend(*(id *)&v176, "setCenterAndSizeFromNormalizedFaceRect:") & 1) != 0)
        {
          objc_msgSend(*(id *)&v175, "boundingBox");
          v190 = v189;
          v192 = v191;
          v194 = v193;
          v196 = v195;
          objc_msgSend(*(id *)&v176, "setBodyWidth:", v193);
          objc_msgSend(*(id *)&v176, "setBodyHeight:", v196);
          v263.origin.x = v190;
          v263.origin.y = v192;
          v263.size.width = v194;
          v263.size.height = v196;
          objc_msgSend(*(id *)&v176, "setBodyCenterX:", CGRectGetMidX(v263));
          v264.origin.x = v190;
          v264.origin.y = v192;
          v264.size.width = v194;
          v264.size.height = v196;
          objc_msgSend(*(id *)&v176, "setBodyCenterY:", CGRectGetMidY(v264));
          objc_msgSend(*(id *)&v175, "animalprint");
          v197 = (void *)objc_claimAutoreleasedReturnValue();
          v198 = v197;
          if (!v197)
          {
            if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              goto LABEL_223;
            *(_WORD *)buf = 0;
            v207 = MEMORY[0x1E0C81028];
            v208 = OS_LOG_TYPE_ERROR;
            v209 = "[PhotosFace] animalObservation failed to return a faceprint";
            v210 = 2;
LABEL_218:
            _os_log_impl(&dword_1B6C4A000, v207, v208, v209, buf, v210);
            goto LABEL_223;
          }
          objc_msgSend(v197, "confidence");
          if (v199 < 0.4)
          {
            if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v198, "confidence");
              v201 = v200;
              objc_msgSend(*(id *)&v175, "description");
              v202 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218498;
              v253 = v201;
              v254 = 2048;
              v255 = 0x3FD99999A0000000;
              v256 = 2112;
              v257 = (uint64_t)v202;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PhotosFace] animalprint.confidence is too low (%.3f < %.3f) %@", buf, 0x20u);

            }
            goto LABEL_223;
          }
          if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v198, "confidence");
            v212 = v211;
            objc_msgSend(*(id *)&v175, "description");
            v213 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218242;
            v253 = v212;
            v254 = 2112;
            v255 = (uint64_t)v213;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[PhotosFace] Accepting animalprint with confidence: %.3f %@", buf, 0x16u);

          }
          v237 = 0;
          objc_msgSend(v198, "serializeStateAndReturnError:", &v237);
          v214 = (void *)objc_claimAutoreleasedReturnValue();
          v215 = COERCE_DOUBLE(v237);
          if (v214)
          {
            +[VCPVNImageprintWrapper wrapperWithImageprintType:version:andData:](VCPVNImageprintWrapper, "wrapperWithImageprintType:version:andData:", 1, a12, v214);
            v216 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)&v176, "setImageprintWrapper:", v216);

            objc_msgSend(*(id *)&v176, "setVuObservationID:", 0);
            objc_msgSend(*(id *)&v176, "imageprintWrapper");
            v217 = (void *)objc_claimAutoreleasedReturnValue();
            v218 = v217 == 0;

            if (v218)
              goto LABEL_223;
            objc_msgSend(v223, "addObject:", *(_QWORD *)&v176);
            if ((int)MediaAnalysisLogLevel() < 7 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
              goto LABEL_223;
            *(_DWORD *)buf = 138412546;
            v253 = v176;
            v254 = 2112;
            v255 = *(_QWORD *)&v175;
            v207 = MEMORY[0x1E0C81028];
            v208 = OS_LOG_TYPE_DEBUG;
            v209 = "[PhotosFace] Generate VCPPhotosFace %@ from %@";
            v210 = 22;
            goto LABEL_218;
          }
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v253 = v215;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[PhotosFace] Failed to serialize animalprintData; %@",
              buf,
              0xCu);
          }

LABEL_223:
LABEL_224:

          goto LABEL_225;
        }
        if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_224;
        *(_DWORD *)buf = 134218752;
        v253 = v182;
        v254 = 2048;
        v255 = v184;
        v256 = 2048;
        v257 = v186;
        v258 = 2048;
        v259 = v188;
        v203 = MEMORY[0x1E0C81028];
        v204 = OS_LOG_TYPE_ERROR;
        v205 = "[PhotosFace] Unable to determine normalized bounding box { { %f, %f } { %f, %f } }";
        v206 = 42;
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() < 4 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          goto LABEL_224;
        *(_WORD *)buf = 0;
        v203 = MEMORY[0x1E0C81028];
        v204 = OS_LOG_TYPE_DEFAULT;
        v205 = "[PhotosFace] Label must be either Dog or Cat. Ignoring";
        v206 = 2;
      }
      _os_log_impl(&dword_1B6C4A000, v203, v204, v205, buf, v206);
      goto LABEL_224;
    }
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v253 = v175;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[PhotosFace] Ignoring co-locating animalObservation %@", buf, 0xCu);
    }
LABEL_225:

  }
  std::__tree<unsigned long>::destroy((uint64_t)&v246, v247[0]);
  std::__tree<unsigned long>::destroy((uint64_t)&v248, v249[0]);

  return v223;
}

id __201__VCPPhotosFace_facesFromFaceObservations_humanObservations_animalObservations_sourceWidth_sourceHeight_visionRequests_blurScorePerFace_exposureScorePerFace_tooSmallFaceObservations_processingVersion___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v9;
    while (2)
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v9 != v3)
          objc_enumerationMutation(v1);
        v5 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v4);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v6 = v5;
          goto LABEL_11;
        }
        ++v4;
      }
      while (v2 != v4);
      v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v2)
        continue;
      break;
    }
  }
  v6 = 0;
LABEL_11:

  return v6;
}

id __201__VCPPhotosFace_facesFromFaceObservations_humanObservations_animalObservations_sourceWidth_sourceHeight_visionRequests_blurScorePerFace_exposureScorePerFace_tooSmallFaceObservations_processingVersion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a3, "results", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "uuid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

+ (id)_peopleFacesTorsosFromFaceObservations:(id)a3 humanObservations:(id)a4 matchedFace:(void *)a5 matchedTorso:(void *)a6 sourceWidth:(unint64_t)a7 sourceHeight:(unint64_t)a8 visionRequests:(id)a9 blurScorePerFace:(id)a10 exposureScorePerFace:(id)a11 tooSmallFaceObservations:(id)a12 processingVersion:(int)a13
{
  id v16;
  id v17;
  unint64_t v18;
  _QWORD *v19;
  void *v20;
  void *v21;
  BOOL v22;
  unint64_t i;
  _QWORD *v24;
  _QWORD *v25;
  unint64_t v26;
  BOOL v27;
  _QWORD *v28;
  void *v29;
  void *v30;
  BOOL v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  BOOL v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v53;
  id v54;
  uint64_t **v55;
  id v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  id v64;
  id v65;
  unint64_t v66;
  unint64_t v67;
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  id v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v64 = a9;
  v61 = a10;
  v60 = a11;
  v57 = a12;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v54 = (id)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v55 = (uint64_t **)a6;
  v19 = (char *)a6 + 8;
  while (1)
  {
    v67 = v18;
    if (v18 >= objc_msgSend(v16, "count"))
      break;
    objc_msgSend(v16, "objectAtIndexedSubscript:", v67);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "groupId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21 == 0;

    if (!v22)
    {
      for (i = 0; ; i = v66 + 1)
      {
        v66 = i;
        if (i >= objc_msgSend(v17, "count"))
          break;
        v24 = (_QWORD *)*v19;
        if (!*v19)
          goto LABEL_48;
        v25 = v19;
        do
        {
          v26 = v24[4];
          v27 = v26 >= v66;
          if (v26 >= v66)
            v28 = v24;
          else
            v28 = v24 + 1;
          if (v27)
            v25 = v24;
          v24 = (_QWORD *)*v28;
        }
        while (*v28);
        if (v25 == v19 || v66 < v25[4])
        {
LABEL_48:
          objc_msgSend(v17, "objectAtIndexedSubscript:", v66);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "groupId");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v30 == 0;

          if (!v31)
          {
            objc_msgSend(v16, "objectAtIndexedSubscript:", v67);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "groupId");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectAtIndexedSubscript:", v66);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "groupId");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v33, "isEqual:", v35);

            if ((v36 & 1) != 0)
            {
              objc_msgSend(v16, "objectAtIndexedSubscript:", v67);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "objectAtIndexedSubscript:", v66);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v65 = 0;
              LOBYTE(v53) = 0;
              objc_msgSend(a1, "faceFromFaceObservation:humanObservation:sourceWidth:sourceHeight:visionRequests:processingVersion:force:andError:", v37, v38, a7, a8, v64, a13, v53, &v65);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = v65;

              if (v39 && !v40)
              {
                objc_msgSend(v16, "objectAtIndexedSubscript:", v67);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "setIsTooSmall:", objc_msgSend(v57, "containsObject:", v43));

                if (v61)
                {
                  objc_msgSend(v61, "objectAtIndexedSubscript:", v67);
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v59, "doubleValue");
                }
                else
                {
                  v44 = 1.0;
                }
                objc_msgSend(v39, "setBlurScore:", v44);
                if (v61)

                if (v60)
                {
                  objc_msgSend(v60, "objectAtIndexedSubscript:", v67);
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v58, "doubleValue");
                }
                else
                {
                  v45 = 0.0;
                }
                objc_msgSend(v39, "setExposureScore:", v45);
                if (v60)

                objc_msgSend(v39, "setQualityMeasure:", objc_msgSend(v39, "qualityMeasureWithCountOfFacesOnAsset:", objc_msgSend(v16, "count")));
                objc_msgSend(v39, "imageprintWrapper");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                v47 = v46 == 0;

                if (v47)
                {
                  if ((int)MediaAnalysisLogLevel() >= 4
                    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v16, "objectAtIndexedSubscript:", v67);
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v17, "objectAtIndexedSubscript:", v66);
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412802;
                    v69 = v39;
                    v70 = 2112;
                    v71 = v50;
                    v72 = 2112;
                    v73 = v51;
                    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[PhotosFace] Fail to generate VCPPhotosFace %@ from %@ and %@ - invalid imageprint", buf, 0x20u);

                  }
                }
                else
                {
                  objc_msgSend(v54, "addObject:", v39);
                  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
                  {
                    objc_msgSend(v16, "objectAtIndexedSubscript:", v67);
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v17, "objectAtIndexedSubscript:", v66);
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412802;
                    v69 = v39;
                    v70 = 2112;
                    v71 = v48;
                    v72 = 2112;
                    v73 = v49;
                    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[PhotosFace] Generate VCPPhotosFace %@ from %@ and %@", buf, 0x20u);

                  }
                }
                std::__tree<unsigned long>::__emplace_unique_key_args<unsigned long,unsigned long const&>((uint64_t **)a5, &v67, (uint64_t *)&v67);
                std::__tree<unsigned long>::__emplace_unique_key_args<unsigned long,unsigned long const&>(v55, &v66, (uint64_t *)&v66);

                break;
              }
              if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v16, "objectAtIndexedSubscript:", v67);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "objectAtIndexedSubscript:", v66);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v69 = v41;
                v70 = 2112;
                v71 = v42;
                v72 = 2112;
                v73 = v40;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[PhotosFace] Fail to generate VCPPhotosFace from %@ and %@ - %@", buf, 0x20u);

              }
            }
          }
        }
      }
    }
    v18 = v67 + 1;
  }

  return v54;
}

+ (id)_peopleFacesOnlyFromFaceObservations:(id)a3 matchedFace:(set<unsigned)long sourceWidth:(std:(std:(unint64_t)a5 :(unint64_t)a6 allocator<unsigned long>> *)a4 :(id)a7 less<unsigned)long> sourceHeight:(id)a8 visionRequests:(id)a9 blurScorePerFace:(id)a10 exposureScorePerFace:(int)a11 tooSmallFaceObservations:processingVersion:
{
  void *v11;
  id v15;
  id v16;
  unint64_t v17;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> *p_var1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> *var0;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> *v20;
  unint64_t v21;
  BOOL v22;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> **v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  BOOL v32;
  void *v33;
  void *v34;
  uint64_t v36;
  id v37;
  id v38;
  id v42;
  id v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v42 = a7;
  v43 = a8;
  v16 = a9;
  v38 = a10;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  p_var1 = &a4->var0.var1;
  while (v17 < objc_msgSend(v15, "count"))
  {
    var0 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> *)p_var1->var0.var0;
    if (!p_var1->var0.var0)
      goto LABEL_14;
    v20 = p_var1;
    do
    {
      v21 = (unint64_t)var0[4].var0.var0;
      v22 = v21 >= v17;
      if (v21 >= v17)
        v23 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> **)var0;
      else
        v23 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> **)&var0[1];
      if (v22)
        v20 = var0;
      var0 = *v23;
    }
    while (*v23);
    if (v20 == p_var1 || (void *)v17 < v20[4].var0.var0)
    {
LABEL_14:
      objc_msgSend(v15, "objectAtIndexedSubscript:", v17);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 0;
      LOBYTE(v36) = 0;
      objc_msgSend(a1, "faceFromFaceObservation:humanObservation:sourceWidth:sourceHeight:visionRequests:processingVersion:force:andError:", v24, 0, a5, a6, v42, a11, v36, &v44);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v44;

      if (!v25 || v26)
      {
        if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v15, "objectAtIndexedSubscript:", v17);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v46 = v29;
          v47 = 2112;
          v48 = v26;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[PhotosFace] Fail to generate face only VCPPhotosFace from %@ - %@", buf, 0x16u);

        }
      }
      else
      {
        objc_msgSend(v15, "objectAtIndexedSubscript:", v17);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setIsTooSmall:", objc_msgSend(v38, "containsObject:", v27));

        if (v43)
        {
          objc_msgSend(v43, "objectAtIndexedSubscript:", v17);
          a4 = (set<unsigned long, std::less<unsigned long>, std::allocator<unsigned long>> *)objc_claimAutoreleasedReturnValue();
          unk_1EF1A60C8(a4, "doubleValue");
        }
        else
        {
          v28 = 1.0;
        }
        objc_msgSend(v25, "setBlurScore:", v28);
        if (v43)

        if (v16)
        {
          objc_msgSend(v16, "objectAtIndexedSubscript:", v17);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "doubleValue");
        }
        else
        {
          v30 = 0.0;
        }
        objc_msgSend(v25, "setExposureScore:", v30);
        if (v16)

        objc_msgSend(v25, "setQualityMeasure:", objc_msgSend(v25, "qualityMeasureWithCountOfFacesOnAsset:", objc_msgSend(v15, "count")));
        objc_msgSend(v25, "imageprintWrapper");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v31 == 0;

        if (v32)
        {
          if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v15, "objectAtIndexedSubscript:", v17);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v46 = v25;
            v47 = 2112;
            v48 = v34;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[PhotosFace] Fail to generate VCPPhotosFace %@ from %@ - invalid imageprint", buf, 0x16u);

          }
        }
        else
        {
          objc_msgSend(v37, "addObject:", v25);
          if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v15, "objectAtIndexedSubscript:", v17);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v46 = v25;
            v47 = 2112;
            v48 = v33;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[PhotosFace] Generate face only VCPPhotosFace %@ from %@", buf, 0x16u);

          }
        }
      }

    }
    ++v17;
  }

  return v37;
}

+ (id)_peopleTorsosOnlyFromHumanObservations:(id)a3 matchedTorso:(set<unsigned)long sourceWidth:(std:(std:(unint64_t)a5 :(unint64_t)a6 allocator<unsigned long>> *)a4 :(id)a7 less<unsigned)long> sourceHeight:(int)a8 visionRequests:processingVersion:
{
  id v10;
  unint64_t v11;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> *var0;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> *v13;
  unint64_t v14;
  BOOL v15;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> **v16;
  void *v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  os_log_type_t v38;
  const char *v39;
  uint32_t v40;
  id v42;
  id v43;
  uint64_t v44;
  void (**v47)(void *, uint64_t);
  id v48;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> *p_var1;
  id v50;
  _QWORD aBlock[4];
  id v52;
  uint8_t buf[4];
  id v54;
  __int16 v55;
  void *v56;
  uint64_t v57;
  CGRect v58;
  CGRect v59;

  v44 = *(_QWORD *)&a8;
  v57 = *MEMORY[0x1E0C80C00];
  v48 = a3;
  v10 = a7;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __127__VCPPhotosFace__peopleTorsosOnlyFromHumanObservations_matchedTorso_sourceWidth_sourceHeight_visionRequests_processingVersion___block_invoke;
  aBlock[3] = &unk_1E6B16890;
  v42 = v10;
  v52 = v42;
  v47 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v43 = (id)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  p_var1 = &a4->var0.var1;
  while (v11 < objc_msgSend(v48, "count"))
  {
    var0 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> *)p_var1->var0.var0;
    if (!p_var1->var0.var0)
      goto LABEL_14;
    v13 = p_var1;
    do
    {
      v14 = (unint64_t)var0[4].var0.var0;
      v15 = v14 >= v11;
      if (v14 >= v11)
        v16 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> **)var0;
      else
        v16 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> **)&var0[1];
      if (v15)
        v13 = var0;
      var0 = *v16;
    }
    while (*v16);
    if (v13 == p_var1 || (void *)v11 < v13[4].var0.var0)
    {
LABEL_14:
      objc_msgSend(v48, "objectAtIndexedSubscript:", v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[VCPPhotosFace faceWithLocalIdentifier:](VCPPhotosFace, "faceWithLocalIdentifier:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setSourceWidth:", a5);
      objc_msgSend(v18, "setSourceHeight:", a6);
      objc_msgSend(v18, "setManual:", 0);
      objc_msgSend(v18, "setAlgorithmVersion:", (int)v44);
      objc_msgSend(v18, "setDetectionType:", 1);
      objc_msgSend(v17, "boundingBox");
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;
      objc_msgSend(v18, "setBodyWidth:", v23);
      objc_msgSend(v18, "setBodyHeight:", v26);
      v58.origin.x = v20;
      v58.origin.y = v22;
      v58.size.width = v24;
      v58.size.height = v26;
      objc_msgSend(v18, "setBodyCenterX:", CGRectGetMidX(v58));
      v59.origin.x = v20;
      v59.origin.y = v22;
      v59.size.width = v24;
      v59.size.height = v26;
      objc_msgSend(v18, "setBodyCenterY:", CGRectGetMidY(v59));
      v27 = objc_opt_class();
      v47[2](v47, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "uuid");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      __127__VCPPhotosFace__peopleTorsosOnlyFromHumanObservations_matchedTorso_sourceWidth_sourceHeight_visionRequests_processingVersion___block_invoke_2((uint64_t)v29, v29, v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v30, "torsoprint");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEDEE8]), "initWithFaceprint:torsoprint:", 0, v31);
        v50 = 0;
        objc_msgSend(v32, "serializeStateAndReturnError:", &v50);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v50;
        if (v33)
        {
          +[VCPVNImageprintWrapper wrapperWithImageprintType:version:andData:](VCPVNImageprintWrapper, "wrapperWithImageprintType:version:andData:", 0, v44, v33);
          v35 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setImageprintWrapper:", v35);

          objc_msgSend(v18, "setVuObservationID:", 0);
          objc_msgSend(v18, "imageprintWrapper");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v35) = v36 == 0;

          if ((v35 & 1) == 0)
          {
            objc_msgSend(v43, "addObject:", v18);
            if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v54 = v18;
              v55 = 2112;
              v56 = v17;
              v37 = MEMORY[0x1E0C81028];
              v38 = OS_LOG_TYPE_DEBUG;
              v39 = "[PhotosFace] Generate VCPPhotosFace %@ from %@";
              v40 = 22;
              goto LABEL_26;
            }
          }
        }
        else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v54 = v34;
          v37 = MEMORY[0x1E0C81028];
          v38 = OS_LOG_TYPE_ERROR;
          v39 = "[PhotosFace] Failed to serialize torsoprint; %@";
          v40 = 12;
LABEL_26:
          _os_log_impl(&dword_1B6C4A000, v37, v38, v39, buf, v40);
        }

      }
      else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[PhotosFace] torsoOnlyObservation failed to return a faceprint", buf, 2u);
      }

    }
    ++v11;
  }

  return v43;
}

id __127__VCPPhotosFace__peopleTorsosOnlyFromHumanObservations_matchedTorso_sourceWidth_sourceHeight_visionRequests_processingVersion___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v9;
    while (2)
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v9 != v3)
          objc_enumerationMutation(v1);
        v5 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v4);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v6 = v5;
          goto LABEL_11;
        }
        ++v4;
      }
      while (v2 != v4);
      v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v2)
        continue;
      break;
    }
  }
  v6 = 0;
LABEL_11:

  return v6;
}

id __127__VCPPhotosFace__peopleTorsosOnlyFromHumanObservations_matchedTorso_sourceWidth_sourceHeight_visionRequests_processingVersion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a3, "results", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "uuid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

+ (id)_filterAnimalObservations:(id)a3 colocatingWithFaceObservations:(id)a4 orHumanObservations:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  __int128 v14;
  void *v15;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = MEMORY[0x1E0C81028];
  *(_QWORD *)&v14 = 138412290;
  v17 = v14;
  while (v12 < objc_msgSend(v8, "count", v17))
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(a1, "_isColocatingAnimalObservation:withFaceObservations:orTorsoObservations:", v15, v9, v10))
    {
      if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v17;
        v19 = v15;
        _os_log_impl(&dword_1B6C4A000, v13, OS_LOG_TYPE_DEFAULT, "[PhotosFace] Ignoring co-locating animalObservation %@", buf, 0xCu);
      }
      objc_msgSend(v11, "addIndex:", v12);
    }

    ++v12;
  }

  return v11;
}

+ (id)_animalImageprintWrapperFromObservation:(id)a3 visionRequests:(id)a4 processingVersion:(int)a5
{
  uint64_t v5;
  id v7;
  id v8;
  id v9;
  void (**v10)(void *, uint64_t);
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  float v17;
  float v18;
  float v19;
  void *v20;
  void *v21;
  float v22;
  float v23;
  void *v24;
  void *v25;
  double v26;
  id v28;
  _QWORD aBlock[4];
  id v30;
  uint8_t buf[4];
  double v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v5 = *(_QWORD *)&a5;
  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__VCPPhotosFace__animalImageprintWrapperFromObservation_visionRequests_processingVersion___block_invoke;
  aBlock[3] = &unk_1E6B16890;
  v9 = v8;
  v30 = v9;
  v10 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  v11 = objc_opt_class();
  v10[2](v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  __90__VCPPhotosFace__animalImageprintWrapperFromObservation_visionRequests_processingVersion___block_invoke_2((uint64_t)v13, v13, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "animalprint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[PhotosFace] observation failed to return an animalprint", buf, 2u);
    }
    goto LABEL_9;
  }
  objc_msgSend(v15, "confidence");
  if (v17 < 0.4)
  {
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v16, "confidence");
      v19 = v18;
      objc_msgSend(v14, "description");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v32 = v19;
      v33 = 2048;
      v34 = 0x3FD99999A0000000;
      v35 = 2112;
      v36 = v20;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PhotosFace] animalprint.confidence is too low (%.3f < %.3f) %@", buf, 0x20u);

    }
LABEL_9:
    v21 = 0;
    goto LABEL_20;
  }
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v16, "confidence");
    v23 = v22;
    objc_msgSend(v14, "description");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v32 = v23;
    v33 = 2112;
    v34 = (uint64_t)v24;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[PhotosFace] Accepting animalprint with confidence: %.3f %@", buf, 0x16u);

  }
  v28 = 0;
  objc_msgSend(v16, "serializeStateAndReturnError:", &v28);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = COERCE_DOUBLE(v28);
  if (v25)
  {
    +[VCPVNImageprintWrapper wrapperWithImageprintType:version:andData:](VCPVNImageprintWrapper, "wrapperWithImageprintType:version:andData:", 1, v5, v25);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v26;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[PhotosFace] Failed to serialize animalprintData; %@",
        buf,
        0xCu);
    }
    v21 = 0;
  }

LABEL_20:
  return v21;
}

id __90__VCPPhotosFace__animalImageprintWrapperFromObservation_visionRequests_processingVersion___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v9;
    while (2)
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v9 != v3)
          objc_enumerationMutation(v1);
        v5 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v4);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v6 = v5;
          goto LABEL_11;
        }
        ++v4;
      }
      while (v2 != v4);
      v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v2)
        continue;
      break;
    }
  }
  v6 = 0;
LABEL_11:

  return v6;
}

id __90__VCPPhotosFace__animalImageprintWrapperFromObservation_visionRequests_processingVersion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a3, "results", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "uuid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

+ (id)faceFromAnimalHeadObservation:(id)a3 animalBodyObservation:(id)a4 animalLabel:(id)a5 sourceWidth:(unint64_t)a6 sourceHeight:(unint64_t)a7 visionRequests:(id)a8 processingVersion:(int)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  NSObject *v41;
  const char *v42;
  os_log_type_t v43;
  uint32_t v44;
  int v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;
  CGRect v55;
  CGRect v56;

  v54 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a8;
  +[VCPPhotosFace faceWithLocalIdentifier:](VCPPhotosFace, "faceWithLocalIdentifier:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setSourceWidth:", a6);
  objc_msgSend(v19, "setSourceHeight:", a7);
  objc_msgSend(v19, "setManual:", 0);
  objc_msgSend(v19, "setAlgorithmVersion:", a9);
  if ((objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CEE248]) & 1) != 0)
  {
    v20 = 3;
  }
  else
  {
    if (!objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CEE240]))
    {
      if ((int)MediaAnalysisLogLevel() < 4 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_19;
      LOWORD(v46) = 0;
      v41 = MEMORY[0x1E0C81028];
      v42 = "[PhotosFace] Label must be either dog or cat. Ignoring";
      v43 = OS_LOG_TYPE_DEFAULT;
      v44 = 2;
      goto LABEL_18;
    }
    v20 = 4;
  }
  objc_msgSend(v19, "setDetectionType:", v20);
  if (v16)
  {
    objc_msgSend(v16, "boundingBox");
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    objc_msgSend(v19, "setBodyWidth:", v25);
    objc_msgSend(v19, "setBodyHeight:", v28);
    v55.origin.x = v22;
    v55.origin.y = v24;
    v55.size.width = v26;
    v55.size.height = v28;
    objc_msgSend(v19, "setBodyCenterX:", CGRectGetMidX(v55));
    v56.origin.x = v22;
    v56.origin.y = v24;
    v56.size.width = v26;
    v56.size.height = v28;
    objc_msgSend(v19, "setBodyCenterY:", CGRectGetMidY(v56));
    objc_msgSend(a1, "_animalImageprintWrapperFromObservation:visionRequests:processingVersion:", v16, v18, a9);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setImageprintWrapper:", v29);

    objc_msgSend(v19, "setVuObservationID:", 0);
  }
  if (!v15)
    goto LABEL_11;
  objc_msgSend(v15, "boundingBox");
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;
  if ((objc_msgSend(v19, "setCenterAndSizeFromNormalizedFaceRect:") & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    v46 = 134218752;
    v47 = v31;
    v48 = 2048;
    v49 = v33;
    v50 = 2048;
    v51 = v35;
    v52 = 2048;
    v53 = v37;
    v41 = MEMORY[0x1E0C81028];
    v42 = "[PhotosFace] Unable to determine normalized bounding box { { %f, %f } { %f, %f } }";
    v43 = OS_LOG_TYPE_ERROR;
    v44 = 42;
LABEL_18:
    _os_log_impl(&dword_1B6C4A000, v41, v43, v42, (uint8_t *)&v46, v44);
LABEL_19:
    v40 = 0;
    goto LABEL_20;
  }
  objc_msgSend(v19, "imageprintWrapper");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v38)
  {
    objc_msgSend(a1, "_animalImageprintWrapperFromObservation:visionRequests:processingVersion:", v15, v18, a9);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setImageprintWrapper:", v39);

    objc_msgSend(v19, "setVuObservationID:", 0);
  }
LABEL_11:
  v40 = v19;
LABEL_20:

  return v40;
}

+ (id)_animalHeadsBodiesFromAnimalHeadObservations:(id)a3 animalBodyObservations:(id)a4 matchedHead:(void *)a5 matchedBody:(void *)a6 sourceWidth:(unint64_t)a7 sourceHeight:(unint64_t)a8 visionRequests:(id)a9 processingVersion:(int)a10
{
  id v12;
  id v13;
  unint64_t v14;
  _QWORD *v15;
  NSObject *v16;
  unint64_t i;
  _QWORD *v18;
  _QWORD *v19;
  unint64_t v20;
  BOOL v21;
  _QWORD *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  BOOL v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  BOOL v44;
  void *v45;
  void *v46;
  uint64_t v48;
  id v49;
  id v53;
  uint64_t **v54;
  unint64_t v56;
  unint64_t v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v53 = a9;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v49 = (id)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v54 = (uint64_t **)a6;
  v15 = (char *)a6 + 8;
  v16 = MEMORY[0x1E0C81028];
LABEL_2:
  v57 = v14;
  if (v14 < objc_msgSend(v12, "count"))
  {
    for (i = 0; ; i = v56 + 1)
    {
      v56 = i;
      if (i >= objc_msgSend(v13, "count"))
      {
LABEL_33:
        v14 = v57 + 1;
        goto LABEL_2;
      }
      v18 = (_QWORD *)*v15;
      if (!*v15)
        goto LABEL_16;
      v19 = v15;
      do
      {
        v20 = v18[4];
        v21 = v20 >= v56;
        if (v20 >= v56)
          v22 = v18;
        else
          v22 = v18 + 1;
        if (v21)
          v19 = v18;
        v18 = (_QWORD *)*v22;
      }
      while (*v22);
      if (v19 == v15 || v56 < v19[4])
      {
LABEL_16:
        objc_msgSend(v12, "objectAtIndexedSubscript:", v57);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "groupId");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v24)
          goto LABEL_25;
        objc_msgSend(v13, "objectAtIndexedSubscript:", v56);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "groupId");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26 == 0;

        if (!v27)
        {
          objc_msgSend(v12, "objectAtIndexedSubscript:", v57);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "groupId");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectAtIndexedSubscript:", v56);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "groupId");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v29, "isEqual:", v31);

          if ((v32 & 1) != 0)
            break;
        }
      }
LABEL_26:
      ;
    }
    objc_msgSend(v12, "objectAtIndexedSubscript:", v57);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "labels");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "firstObject");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "objectAtIndexedSubscript:", v56);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "labels");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "firstObject");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "identifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v23, "containsString:", v39) & 1) != 0 || (objc_msgSend(v39, "containsString:", v23) & 1) != 0)
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", v57);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", v56);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v48) = a10;
      objc_msgSend(a1, "faceFromAnimalHeadObservation:animalBodyObservation:animalLabel:sourceWidth:sourceHeight:visionRequests:processingVersion:", v40, v41, v39, a7, a8, v53, v48);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      if (v42)
      {
        objc_msgSend(v42, "imageprintWrapper");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v43 == 0;

        if (!v44)
        {
          std::__tree<unsigned long>::__emplace_unique_key_args<unsigned long,unsigned long const&>((uint64_t **)a5, &v57, (uint64_t *)&v57);
          std::__tree<unsigned long>::__emplace_unique_key_args<unsigned long,unsigned long const&>(v54, &v56, (uint64_t *)&v56);
          objc_msgSend(v49, "addObject:", v42);
          if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v12, "objectAtIndexedSubscript:", v57);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectAtIndexedSubscript:", v56);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v59 = v42;
            v60 = 2112;
            v61 = v45;
            v62 = 2112;
            v63 = v46;
            _os_log_impl(&dword_1B6C4A000, v16, OS_LOG_TYPE_DEBUG, "[PhotosFace] Generate VCPPhotosFace %@ from %@ and %@", buf, 0x20u);

          }
        }
      }
      std::__tree<unsigned long>::__emplace_unique_key_args<unsigned long,unsigned long const&>((uint64_t **)a5, &v57, (uint64_t *)&v57);
      std::__tree<unsigned long>::__emplace_unique_key_args<unsigned long,unsigned long const&>(v54, &v56, (uint64_t *)&v56);

      goto LABEL_33;
    }
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v59 = v23;
      v60 = 2112;
      v61 = v39;
      _os_log_impl(&dword_1B6C4A000, v16, OS_LOG_TYPE_DEBUG, "[PhotosFace] headLabel (%@) and bodyLabel (%@) do not match", buf, 0x16u);
    }

LABEL_25:
    goto LABEL_26;
  }

  return v49;
}

+ (id)_animalBodiesOnlyFromAnimalBodyObservations:(id)a3 matchedBody:(set<unsigned)long sourceWidth:(std:(std:(unint64_t)a5 :(unint64_t)a6 allocator<unsigned long>> *)a4 :(id)a7 less<unsigned)long> sourceHeight:(int)a8 visionRequests:processingVersion:
{
  id v13;
  unint64_t v14;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> *p_var1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> *var0;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> *v17;
  unint64_t v18;
  BOOL v19;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> **v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  uint64_t v31;
  id v32;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v34 = a7;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  p_var1 = &a4->var0.var1;
  while (v14 < objc_msgSend(v13, "count"))
  {
    var0 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> *)p_var1->var0.var0;
    if (!p_var1->var0.var0)
      goto LABEL_14;
    v17 = p_var1;
    do
    {
      v18 = (unint64_t)var0[4].var0.var0;
      v19 = v18 >= v14;
      if (v18 >= v14)
        v20 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> **)var0;
      else
        v20 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> **)&var0[1];
      if (v19)
        v17 = var0;
      var0 = *v20;
    }
    while (*v20);
    if (v17 == p_var1 || (void *)v14 < v17[4].var0.var0)
    {
LABEL_14:
      objc_msgSend(v13, "objectAtIndexedSubscript:", v14);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "labels");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "firstObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "objectAtIndexedSubscript:", v14);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v31) = a8;
      objc_msgSend(a1, "faceFromAnimalHeadObservation:animalBodyObservation:animalLabel:sourceWidth:sourceHeight:visionRequests:processingVersion:", 0, v25, v24, a5, a6, v34, v31);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        objc_msgSend(v26, "imageprintWrapper");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27 == 0;

        if (!v28)
        {
          objc_msgSend(v32, "addObject:", v26);
          if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v13, "objectAtIndexedSubscript:", v14);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v36 = v26;
            v37 = 2112;
            v38 = v29;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[PhotosFace] Generate VCPPhotosFace %@ from %@", buf, 0x16u);

          }
        }
      }

    }
    ++v14;
  }

  return v32;
}

+ (id)_animalHeadsOnlyFromAnimalHeadObservations:(id)a3 matchedHead:(set<unsigned)long sourceWidth:(std:(std:(unint64_t)a5 :(unint64_t)a6 allocator<unsigned long>> *)a4 :(id)a7 less<unsigned)long> sourceHeight:(int)a8 visionRequests:processingVersion:
{
  id v11;
  unint64_t v12;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> *p_var1;
  uint64_t v14;
  void *v15;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> *var0;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> *v17;
  unint64_t v18;
  BOOL v19;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> **v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  char v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  BOOL v32;
  void *v33;
  uint64_t v35;
  id v36;
  void *v37;
  uint64_t v38;
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v42 = a7;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  p_var1 = &a4->var0.var1;
  v14 = *MEMORY[0x1E0CEE238];
  v38 = *MEMORY[0x1E0CEE230];
  v37 = (void *)*MEMORY[0x1E0CEE240];
  v15 = (void *)*MEMORY[0x1E0CEE248];
  while (v12 < objc_msgSend(v11, "count"))
  {
    var0 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> *)p_var1->var0.var0;
    if (!p_var1->var0.var0)
      goto LABEL_14;
    v17 = p_var1;
    do
    {
      v18 = (unint64_t)var0[4].var0.var0;
      v19 = v18 >= v12;
      if (v18 >= v12)
        v20 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> **)var0;
      else
        v20 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> **)&var0[1];
      if (v19)
        v17 = var0;
      var0 = *v20;
    }
    while (*v20);
    if (v17 == p_var1 || (void *)v12 < v17[4].var0.var0)
    {
LABEL_14:
      objc_msgSend(v11, "objectAtIndexedSubscript:", v12);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "labels");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "firstObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = objc_msgSend(v24, "isEqualToString:", v14);
      v26 = v15;
      if ((v25 & 1) != 0 || (v27 = objc_msgSend(v24, "isEqualToString:", v38), v26 = v37, (v27 & 1) != 0))
      {
        v28 = v26;
        objc_msgSend(v11, "objectAtIndexedSubscript:", v12);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v35) = a8;
        objc_msgSend(a1, "faceFromAnimalHeadObservation:animalBodyObservation:animalLabel:sourceWidth:sourceHeight:visionRequests:processingVersion:", v29, 0, v28, a5, a6, v42, v35);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          objc_msgSend(v30, "imageprintWrapper");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v31 == 0;

          if (!v32)
          {
            objc_msgSend(v36, "addObject:", v30);
            if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v11, "objectAtIndexedSubscript:", v12);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v44 = v30;
              v45 = 2112;
              v46 = v33;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[PhotosFace] Generate VCPPhotosFace %@ from %@", buf, 0x16u);

            }
          }
        }

      }
      else if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[PhotosFace] headLabel is not dog or cat. Ignoring", buf, 2u);
      }

    }
    ++v12;
  }

  return v36;
}

+ (id)facesFromFaceObservations:(id)a3 humanObservations:(id)a4 animalHeadObservations:(id)a5 animalBodyObservations:(id)a6 sourceWidth:(unint64_t)a7 sourceHeight:(unint64_t)a8 visionRequests:(id)a9 blurScorePerFace:(id)a10 exposureScorePerFace:(id)a11 tooSmallFaceObservations:(id)a12 processingVersion:(int)a13 animalResults:(id *)a14
{
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  uint64_t v52[3];
  uint64_t v53[3];
  _QWORD **v54;
  _QWORD *v55[2];
  _QWORD **v56;
  _QWORD *v57;
  uint64_t v58;
  uint64_t v59[3];
  uint64_t v60[3];
  _QWORD **v61;
  _QWORD *v62[2];
  _QWORD **v63;
  _QWORD *v64[2];
  _QWORD v65[4];
  _QWORD v66[6];

  v66[4] = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v44 = a4;
  v50 = a5;
  v48 = a6;
  v20 = a9;
  v21 = a10;
  v64[0] = 0;
  v64[1] = 0;
  v62[1] = 0;
  v63 = v64;
  v61 = v62;
  v62[0] = 0;
  LODWORD(v36) = a13;
  v46 = a11;
  v47 = a12;
  v45 = v21;
  v51 = v20;
  v49 = v19;
  objc_msgSend(a1, "_peopleFacesTorsosFromFaceObservations:humanObservations:matchedFace:matchedTorso:sourceWidth:sourceHeight:visionRequests:blurScorePerFace:exposureScorePerFace:tooSmallFaceObservations:processingVersion:", v19, v44, &v63, &v61, a7, a8, v20, v21, v46, v47, v36);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  std::set<unsigned long>::set[abi:ne180100](v60, (uint64_t)&v63);
  LODWORD(v35) = a13;
  objc_msgSend(a1, "_peopleFacesOnlyFromFaceObservations:matchedFace:sourceWidth:sourceHeight:visionRequests:blurScorePerFace:exposureScorePerFace:tooSmallFaceObservations:processingVersion:", v19, v60, a7, a8, v20, v21, v46, v47, v35);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  std::__tree<unsigned long>::destroy((uint64_t)v60, (_QWORD *)v60[1]);
  std::set<unsigned long>::set[abi:ne180100](v59, (uint64_t)&v61);
  objc_msgSend(a1, "_peopleTorsosOnlyFromHumanObservations:matchedTorso:sourceWidth:sourceHeight:visionRequests:processingVersion:", v44, v59, a7, a8, v20, a13);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  std::__tree<unsigned long>::destroy((uint64_t)v59, (_QWORD *)v59[1]);
  objc_msgSend(a1, "_filterAnimalObservations:colocatingWithFaceObservations:orHumanObservations:", v50, v19, v44);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_filterAnimalObservations:colocatingWithFaceObservations:orHumanObservations:", v48, v19, v44);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v50);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v48);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "removeObjectsAtIndexes:", v37);
  objc_msgSend(v23, "removeObjectsAtIndexes:", v43);
  v57 = 0;
  v58 = 0;
  v55[1] = 0;
  v56 = &v57;
  v54 = v55;
  v55[0] = 0;
  LODWORD(v34) = a13;
  objc_msgSend(a1, "_animalHeadsBodiesFromAnimalHeadObservations:animalBodyObservations:matchedHead:matchedBody:sourceWidth:sourceHeight:visionRequests:processingVersion:", v22, v23, &v56, &v54, a7, a8, v51, v34);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  std::set<unsigned long>::set[abi:ne180100](v53, (uint64_t)&v56);
  objc_msgSend(a1, "_animalHeadsOnlyFromAnimalHeadObservations:matchedHead:sourceWidth:sourceHeight:visionRequests:processingVersion:", v22, v53, a7, a8, v51, a13);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  std::__tree<unsigned long>::destroy((uint64_t)v53, (_QWORD *)v53[1]);
  std::set<unsigned long>::set[abi:ne180100](v52, (uint64_t)&v54);
  objc_msgSend(a1, "_animalBodiesOnlyFromAnimalBodyObservations:matchedBody:sourceWidth:sourceHeight:visionRequests:processingVersion:", v23, v52, a7, a8, v51, a13);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  std::__tree<unsigned long>::destroy((uint64_t)v52, (_QWORD *)v52[1]);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObjectsFromArray:", v42);
  objc_msgSend(v26, "addObjectsFromArray:", v41);
  objc_msgSend(v26, "addObjectsFromArray:", v40);
  objc_msgSend(v26, "addObjectsFromArray:", v24);
  objc_msgSend(v26, "addObjectsFromArray:", v39);
  objc_msgSend(v26, "addObjectsFromArray:", v25);
  v65[0] = CFSTR("NumberOfPetsGenerated");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v24, "count") + objc_msgSend(v25, "count"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v27;
  v65[1] = CFSTR("NumberOfPetsGeneratedWithHeadOnly");
  v28 = (void *)MEMORY[0x1E0CB37E8];
  v29 = objc_msgSend(v50, "count");
  objc_msgSend(v28, "numberWithUnsignedLong:", v29 - v58);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v66[1] = v30;
  v65[2] = CFSTR("NumberOfPetsGeneratedWithBodyOnly");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v25, "count"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v66[2] = v31;
  v65[3] = CFSTR("NumberOfPetsGeneratedWithHeadAndBody");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v24, "count"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v66[3] = v32;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 4);
  *a14 = (id)objc_claimAutoreleasedReturnValue();

  std::__tree<unsigned long>::destroy((uint64_t)&v54, v55[0]);
  std::__tree<unsigned long>::destroy((uint64_t)&v56, v57);

  std::__tree<unsigned long>::destroy((uint64_t)&v61, v62[0]);
  std::__tree<unsigned long>::destroy((uint64_t)&v63, v64[0]);

  return v26;
}

+ (id)faceFromPHFace:(id)a3 copyOption:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "localIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "faceWithLocalIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    switch(a4)
    {
      case 0:
        objc_msgSend(v7, "personLocalIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setPersonLocalIdentifier:", v10);

        objc_msgSend(v9, "setDetectionType:", objc_msgSend(v7, "detectionType"));
        objc_msgSend(v9, "setSourceWidth:", objc_msgSend(v7, "sourceWidth"));
        objc_msgSend(v9, "setSourceHeight:", objc_msgSend(v7, "sourceHeight"));
        objc_msgSend(v7, "centerX");
        objc_msgSend(v9, "setCenterX:");
        objc_msgSend(v7, "centerY");
        objc_msgSend(v9, "setCenterY:");
        objc_msgSend(v7, "size");
        objc_msgSend(v9, "setSize:");
        objc_msgSend(v7, "bodyCenterX");
        objc_msgSend(v9, "setBodyCenterX:");
        objc_msgSend(v7, "bodyCenterY");
        objc_msgSend(v9, "setBodyCenterY:");
        objc_msgSend(v7, "bodyWidth");
        objc_msgSend(v9, "setBodyWidth:");
        objc_msgSend(v7, "bodyHeight");
        objc_msgSend(v9, "setBodyHeight:");
        objc_msgSend(v9, "setHasSmile:", objc_msgSend(v7, "hasSmile"));
        objc_msgSend(v7, "blurScore");
        objc_msgSend(v9, "setBlurScore:");
        objc_msgSend(v9, "setIsLeftEyeClosed:", objc_msgSend(v7, "isLeftEyeClosed"));
        objc_msgSend(v9, "setIsRightEyeClosed:", objc_msgSend(v7, "isRightEyeClosed"));
        objc_msgSend(v7, "poseYaw");
        objc_msgSend(v9, "setPoseYaw:");
        objc_msgSend(v9, "setAlgorithmVersion:", objc_msgSend(v7, "faceAlgorithmVersion"));
        objc_msgSend(v9, "setQualityMeasure:", objc_msgSend(v7, "qualityMeasure"));
        objc_msgSend(v7, "quality");
        objc_msgSend(v9, "setQuality:");
        objc_msgSend(v9, "setHidden:", objc_msgSend(v7, "isHidden"));
        objc_msgSend(v9, "setIsInTrash:", objc_msgSend(v7, "isInTrash"));
        objc_msgSend(v9, "setManual:", objc_msgSend(v7, "manual"));
        objc_msgSend(v7, "adjustmentVersion");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setAdjustmentVersion:", v11);

        objc_msgSend(v9, "setNameSource:", objc_msgSend(v7, "nameSource"));
        objc_msgSend(v9, "setTrainingType:", objc_msgSend(v7, "trainingType"));
        objc_msgSend(v9, "setClusterSequenceNumber:", objc_msgSend(v7, "clusterSequenceNumber"));
        objc_msgSend(v9, "setVuObservationID:", objc_msgSend(v7, "vuObservationID"));
        break;
      case 1:
        objc_msgSend(v7, "personLocalIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setPersonLocalIdentifier:", v12);

        objc_msgSend(v9, "setDetectionType:", objc_msgSend(v7, "detectionType"));
        objc_msgSend(v9, "setSourceWidth:", objc_msgSend(v7, "sourceWidth"));
        objc_msgSend(v9, "setSourceHeight:", objc_msgSend(v7, "sourceHeight"));
        objc_msgSend(v7, "centerX");
        objc_msgSend(v9, "setCenterX:");
        objc_msgSend(v7, "centerY");
        objc_msgSend(v9, "setCenterY:");
        objc_msgSend(v7, "size");
        objc_msgSend(v9, "setSize:");
        objc_msgSend(v7, "bodyCenterX");
        objc_msgSend(v9, "setBodyCenterX:");
        objc_msgSend(v7, "bodyCenterY");
        objc_msgSend(v9, "setBodyCenterY:");
        objc_msgSend(v7, "bodyWidth");
        objc_msgSend(v9, "setBodyWidth:");
        objc_msgSend(v7, "bodyHeight");
        objc_msgSend(v9, "setBodyHeight:");
        objc_msgSend(v9, "setQualityMeasure:", objc_msgSend(v7, "qualityMeasure"));
        objc_msgSend(v7, "quality");
        objc_msgSend(v9, "setQuality:");
        objc_msgSend(v9, "setClusterSequenceNumber:", objc_msgSend(v7, "clusterSequenceNumber"));
        objc_msgSend(v9, "setVuObservationID:", objc_msgSend(v7, "vuObservationID"));
        objc_msgSend(v9, "setHidden:", objc_msgSend(v7, "isHidden"));
        objc_msgSend(v9, "setIsInTrash:", objc_msgSend(v7, "isInTrash"));
        objc_msgSend(v9, "setManual:", objc_msgSend(v7, "manual"));
        break;
      case 2:
        objc_msgSend(v9, "setDetectionType:", objc_msgSend(v7, "detectionType"));
        objc_msgSend(v9, "setSourceWidth:", objc_msgSend(v7, "sourceWidth"));
        objc_msgSend(v9, "setSourceHeight:", objc_msgSend(v7, "sourceHeight"));
        objc_msgSend(v7, "centerX");
        objc_msgSend(v9, "setCenterX:");
        objc_msgSend(v7, "centerY");
        objc_msgSend(v9, "setCenterY:");
        objc_msgSend(v7, "size");
        objc_msgSend(v9, "setSize:");
        objc_msgSend(v7, "bodyCenterX");
        objc_msgSend(v9, "setBodyCenterX:");
        objc_msgSend(v7, "bodyCenterY");
        objc_msgSend(v9, "setBodyCenterY:");
        objc_msgSend(v7, "bodyWidth");
        objc_msgSend(v9, "setBodyWidth:");
        objc_msgSend(v7, "bodyHeight");
        objc_msgSend(v9, "setBodyHeight:");
        objc_msgSend(v9, "setHasSmile:", objc_msgSend(v7, "hasSmile"));
        objc_msgSend(v7, "blurScore");
        objc_msgSend(v9, "setBlurScore:");
        objc_msgSend(v9, "setIsLeftEyeClosed:", objc_msgSend(v7, "isLeftEyeClosed"));
        objc_msgSend(v9, "setIsRightEyeClosed:", objc_msgSend(v7, "isRightEyeClosed"));
        objc_msgSend(v7, "poseYaw");
        objc_msgSend(v9, "setPoseYaw:");
        objc_msgSend(v9, "setAlgorithmVersion:", objc_msgSend(v7, "faceAlgorithmVersion"));
        objc_msgSend(v9, "setQualityMeasure:", objc_msgSend(v7, "qualityMeasure"));
        objc_msgSend(v7, "quality");
        objc_msgSend(v9, "setQuality:");
        objc_msgSend(v9, "setHidden:", objc_msgSend(v7, "isHidden"));
        objc_msgSend(v9, "setIsInTrash:", objc_msgSend(v7, "isInTrash"));
        objc_msgSend(v9, "setManual:", objc_msgSend(v7, "manual"));
        objc_msgSend(v7, "adjustmentVersion");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setAdjustmentVersion:", v13);

        goto LABEL_7;
      case 3:
LABEL_7:
        objc_msgSend(v9, "setNameSource:", objc_msgSend(v7, "nameSource"));
        objc_msgSend(v9, "setTrainingType:", objc_msgSend(v7, "trainingType"));
        objc_msgSend(v7, "personLocalIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setPersonLocalIdentifier:", v14);

        objc_msgSend(v9, "setClusterSequenceNumber:", objc_msgSend(v7, "clusterSequenceNumber"));
        objc_msgSend(v9, "setVuObservationID:", objc_msgSend(v7, "vuObservationID"));
        objc_msgSend(v9, "setQualityMeasure:", objc_msgSend(v7, "qualityMeasure"));
        objc_msgSend(v7, "faceClusteringProperties");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "faceprint");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = objc_msgSend(v9, "detectionType") != 1;
          v18 = objc_msgSend(v16, "faceprintVersion");
          objc_msgSend(v16, "faceprintData");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          +[VCPVNImageprintWrapper wrapperWithImageprintType:version:andData:](VCPVNImageprintWrapper, "wrapperWithImageprintType:version:andData:", v17, v18, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setImageprintWrapper:", v20);

        }
        objc_msgSend(v15, "groupingIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setGroupingIdentifier:", v21);

        break;
      default:
        break;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)facesFromPHFetchResult:(id)a3 copyOption:(int64_t)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend((id)objc_opt_class(), "faceFromPHFace:copyOption:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), a4, (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v6, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v6;
}

- (void)replaceCoordinatesAndFeaturesFromDetectedFace:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  NSString *v14;
  NSString *groupingIdentifier;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  float v22;
  float v23;
  double v24;
  double v25;
  id v26;

  v26 = a3;
  self->_sourceWidth = objc_msgSend(v26, "sourceWidth");
  self->_sourceHeight = objc_msgSend(v26, "sourceHeight");
  self->_detectionType = objc_msgSend(v26, "detectionType");
  objc_msgSend(v26, "centerX");
  self->_centerX = v4;
  objc_msgSend(v26, "centerY");
  self->_centerY = v5;
  objc_msgSend(v26, "size");
  self->_size = v6;
  objc_msgSend(v26, "bodyWidth");
  self->_bodyWidth = v7;
  objc_msgSend(v26, "bodyHeight");
  self->_bodyHeight = v8;
  objc_msgSend(v26, "bodyCenterX");
  self->_bodyCenterX = v9;
  objc_msgSend(v26, "bodyCenterY");
  self->_bodyCenterY = v10;
  self->_hasSmile = objc_msgSend(v26, "hasSmile");
  objc_msgSend(v26, "blurScore");
  self->_blurScore = v11;
  objc_msgSend(v26, "exposureScore");
  self->_exposureScore = v12;
  self->_isLeftEyeClosed = objc_msgSend(v26, "isLeftEyeClosed");
  self->_isRightEyeClosed = objc_msgSend(v26, "isRightEyeClosed");
  objc_msgSend(v26, "poseYaw");
  self->_poseYaw = v13;
  self->_algorithmVersion = objc_msgSend(v26, "algorithmVersion");
  self->_qualityMeasure = objc_msgSend(v26, "qualityMeasure");
  self->_isTooSmall = objc_msgSend(v26, "isTooSmall");
  objc_msgSend(v26, "groupingIdentifier");
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  groupingIdentifier = self->_groupingIdentifier;
  self->_groupingIdentifier = v14;

  self->_ageType = objc_msgSend(v26, "ageType");
  self->_sexType = objc_msgSend(v26, "sexType");
  self->_eyesState = objc_msgSend(v26, "eyesState");
  self->_smileType = objc_msgSend(v26, "smileType");
  self->_facialHairType = objc_msgSend(v26, "facialHairType");
  self->_hairColorType = objc_msgSend(v26, "hairColorType");
  self->_glassesType = objc_msgSend(v26, "glassesType");
  self->_expressionType = objc_msgSend(v26, "expressionType");
  self->_headgearType = objc_msgSend(v26, "headgearType");
  self->_hairType = objc_msgSend(v26, "hairType");
  self->_poseType = objc_msgSend(v26, "poseType");
  self->_skintoneType = objc_msgSend(v26, "skintoneType");
  self->_ethnicityType = objc_msgSend(v26, "ethnicityType");
  self->_hasFaceMask = objc_msgSend(v26, "hasFaceMask");
  self->_gazeType = objc_msgSend(v26, "gazeType");
  objc_msgSend(v26, "gazeCenterX");
  self->_gazeCenterX = v16;
  objc_msgSend(v26, "gazeCenterY");
  self->_gazeCenterY = v17;
  objc_msgSend(v26, "gazeRect");
  self->_gazeRect.origin.x = v18;
  self->_gazeRect.origin.y = v19;
  self->_gazeRect.size.width = v20;
  self->_gazeRect.size.height = v21;
  objc_msgSend(v26, "gazeAngle");
  self->_gazeAngle = v22;
  objc_msgSend(v26, "gazeConfidence");
  self->_gazeConfidence = v23;
  objc_msgSend(v26, "roll");
  self->_roll = v24;
  objc_msgSend(v26, "quality");
  self->_quality = v25;

}

- (BOOL)setCenterAndSizeFromNormalizedFaceRect:(CGRect)a3
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  int64_t sourceWidth;
  double v9;
  int64_t sourceHeight;
  double v11;
  CGRect v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  self->_centerX = CGRectGetMidX(a3);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  self->_centerY = CGRectGetMidY(v13);
  sourceWidth = self->_sourceWidth;
  v9 = 0.0;
  if (sourceWidth)
  {
    sourceHeight = self->_sourceHeight;
    if (sourceHeight)
    {
      v11 = width * (double)sourceWidth;
      if (v11 < height * (double)sourceHeight)
        v11 = height * (double)sourceHeight;
      if (sourceWidth <= sourceHeight)
        sourceWidth = self->_sourceHeight;
      v9 = v11 / (double)sourceWidth;
    }
  }
  self->_size = v9;
  return 1;
}

- (CGRect)normalizedFaceRect
{
  double size;
  int64_t sourceWidth;
  int64_t sourceHeight;
  double v5;
  int64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  size = self->_size;
  sourceWidth = self->_sourceWidth;
  sourceHeight = self->_sourceHeight;
  if (size <= 1.0)
    v5 = self->_size;
  else
    v5 = 1.0;
  if (sourceWidth <= sourceHeight)
    v6 = self->_sourceHeight;
  else
    v6 = self->_sourceWidth;
  v7 = size * (double)v6;
  v8 = v7 / (double)sourceHeight;
  v9 = fmax(self->_centerX - v7 / (double)sourceWidth * 0.5, 0.0);
  v10 = fmax(self->_centerY - v8 * 0.5, 0.0);
  v11 = v5;
  result.size.height = v11;
  result.size.width = v5;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (CGRect)normalizedBodyRect
{
  int64_t sourceWidth;
  int64_t sourceHeight;
  double v4;
  int64_t v5;
  double v6;
  BOOL v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  sourceWidth = self->_sourceWidth;
  sourceHeight = self->_sourceHeight;
  v4 = self->_bodyWidth * (double)sourceWidth;
  if (v4 < self->_bodyHeight * (double)sourceHeight)
    v4 = self->_bodyHeight * (double)sourceHeight;
  if (sourceWidth <= sourceHeight)
    v5 = self->_sourceHeight;
  else
    v5 = self->_sourceWidth;
  v6 = v4 / (double)v5;
  if (sourceWidth)
    v7 = sourceHeight == 0;
  else
    v7 = 1;
  if (v7)
    v6 = 0.0;
  v8 = v4 / (double)sourceWidth;
  v9 = v4 / (double)sourceHeight;
  if (v6 > 1.0)
    v6 = 1.0;
  v10 = fmax(self->_bodyCenterX - v8 * 0.5, 0.0);
  v11 = fmax(self->_bodyCenterY - v9 * 0.5, 0.0);
  v12 = v6;
  result.size.height = v12;
  result.size.width = v6;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (id)gist
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[VCPPhotosFace localIdentifier](self, "localIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[VCPPhotosFace manual](self, "manual"))
    v5 = CFSTR("-manual");
  else
    v5 = &stru_1E6B1C190;
  -[VCPPhotosFace personLocalIdentifier](self, "personLocalIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[VCPPhotosFace detectionType](self, "detectionType") == 1)
    v7 = CFSTR("Human");
  else
    v7 = CFSTR("Animal");
  -[VCPPhotosFace imageprintWrapper](self, "imageprintWrapper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "version");
  -[VCPPhotosFace centerX](self, "centerX");
  v11 = v10;
  -[VCPPhotosFace centerY](self, "centerY");
  v13 = v12;
  -[VCPPhotosFace size](self, "size");
  v15 = v14;
  -[VCPPhotosFace bodyCenterX](self, "bodyCenterX");
  v17 = v16;
  -[VCPPhotosFace bodyCenterY](self, "bodyCenterY");
  v19 = v18;
  -[VCPPhotosFace bodyWidth](self, "bodyWidth");
  v21 = v20;
  -[VCPPhotosFace bodyHeight](self, "bodyHeight");
  v23 = v22;
  -[VCPPhotosFace quality](self, "quality");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%@ (%@) %@ v%d (%.2f, %.2f, %.2f) (%.2f, %.2f, %.2f, %.2f) quality: %.2f source dimension: %ld*%ld"), v4, v5, v6, v7, v9, v11, v13, v15, v17, v19, v21, v23, v24, -[VCPPhotosFace sourceWidth](self, "sourceWidth"), -[VCPPhotosFace sourceHeight](self, "sourceHeight"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (double)_calculateOverlappingBetweenFaceObservation:(id)a3 andBodyObservation:(id)a4
{
  id v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  v5 = a4;
  objc_msgSend(a3, "boundingBox");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v5, "boundingBox");
  v22.origin.x = v14;
  v22.origin.y = v15;
  v22.size.width = v16;
  v22.size.height = v17;
  v20.origin.x = v7;
  v20.origin.y = v9;
  v20.size.width = v11;
  v20.size.height = v13;
  v21 = CGRectIntersection(v20, v22);
  v18 = v21.size.width * v21.size.height / (v11 * v13);

  return v18;
}

+ (double)_calculateIoUBetweenObservation:(id)a3 andObservation:(id)a4
{
  id v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double height;
  double width;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  v5 = a4;
  objc_msgSend(a3, "boundingBox");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v5, "boundingBox");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v26.origin.x = v7;
  v26.origin.y = v9;
  v26.size.width = v11;
  v26.size.height = v13;
  v29.origin.x = v15;
  v29.origin.y = v17;
  v29.size.width = v19;
  v29.size.height = v21;
  v27 = CGRectIntersection(v26, v29);
  height = v27.size.height;
  width = v27.size.width;
  v27.origin.x = v7;
  v27.origin.y = v9;
  v27.size.width = v11;
  v27.size.height = v13;
  v30.origin.x = v15;
  v30.origin.y = v17;
  v30.size.width = v19;
  v30.size.height = v21;
  v28 = CGRectUnion(v27, v30);
  v22 = width * height / (v28.size.width * v28.size.height);

  return v22;
}

+ (BOOL)_isColocatingAnimalObservation:(id)a3 withFaceObservations:(id)a4 orTorsoObservations:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  double v16;
  double v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  double v23;
  double v24;
  BOOL v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  double v37;
  __int16 v38;
  id v39;
  __int16 v40;
  uint64_t v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v32;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v32 != v13)
          objc_enumerationMutation(v11);
        v15 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(a1, "_calculateIoUBetweenObservation:andObservation:", v8, v15);
        v17 = v16;
        if (v16 > 0.699999988)
        {
          if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218498;
            v37 = v17;
            v38 = 2112;
            v39 = v8;
            v40 = 2112;
            v41 = v15;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[PhotosFace] IoU %f %@ %@", buf, 0x20u);
          }
          v25 = 1;
          v18 = v11;
          goto LABEL_26;
        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
      if (v12)
        continue;
      break;
    }
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v18 = v10;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v28;
    while (2)
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(v18);
        v22 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j);
        objc_msgSend(a1, "_calculateIoUBetweenObservation:andObservation:", v8, v22, (_QWORD)v27);
        v24 = v23;
        if (v23 > 0.699999988)
        {
          if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218498;
            v37 = v24;
            v38 = 2112;
            v39 = v8;
            v40 = 2112;
            v41 = v22;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[PhotosFace] IoU %f %@ %@", buf, 0x20u);
          }
          v25 = 1;
          goto LABEL_26;
        }
      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      if (v19)
        continue;
      break;
    }
  }
  v25 = 0;
LABEL_26:

  return v25;
}

- (int64_t)qualityMeasureWithCountOfFacesOnAsset:(unint64_t)a3
{
  unint64_t sourceWidth;
  float v4;
  float v5;
  float size;
  BOOL v7;
  float v8;
  float v9;
  float v10;
  float v11;
  unint64_t v12;
  float v13;

  sourceWidth = self->_sourceWidth;
  if ((int64_t)sourceWidth <= self->_sourceHeight)
    sourceWidth = self->_sourceHeight;
  v4 = 0.5;
  if (!self->_isLeftEyeClosed && !self->_isRightEyeClosed)
    v4 = 2.0;
  v5 = 0.25;
  if (sourceWidth >= 0x400)
  {
    v5 = 1.0;
    if (sourceWidth <= 0xC00)
      v5 = (float)((float)sourceWidth * 0.00036621) + -0.125;
  }
  if (a3)
  {
    size = self->_size;
    v7 = size > 0.5 || size < 0.1;
    v8 = (float)(size * 0.5) + 0.75;
    v9 = 0.8;
    if (v7)
      v8 = 0.8;
    if (self->_hasSmile)
      v9 = 1.0;
    v10 = (1.0 - self->_blurScore) * 5.0;
    v11 = v4 * (float)(v9 * (float)(v5 * (float)(v8 * v10)));
    v12 = 3;
    if (a3 < 3)
      v12 = a3;
    v13 = (float)(PFFaceCountPenalties[v12 - 1] * v11) * 100.0;
  }
  else
  {
    v13 = 0.0;
  }
  if (v13 < 1.0)
    return (uint64_t)1.0;
  return (uint64_t)v13;
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (NSString)personLocalIdentifier
{
  return self->_personLocalIdentifier;
}

- (void)setPersonLocalIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (int64_t)sourceWidth
{
  return self->_sourceWidth;
}

- (void)setSourceWidth:(int64_t)a3
{
  self->_sourceWidth = a3;
}

- (int64_t)sourceHeight
{
  return self->_sourceHeight;
}

- (void)setSourceHeight:(int64_t)a3
{
  self->_sourceHeight = a3;
}

- (signed)detectionType
{
  return self->_detectionType;
}

- (void)setDetectionType:(signed __int16)a3
{
  self->_detectionType = a3;
}

- (double)centerX
{
  return self->_centerX;
}

- (void)setCenterX:(double)a3
{
  self->_centerX = a3;
}

- (double)centerY
{
  return self->_centerY;
}

- (void)setCenterY:(double)a3
{
  self->_centerY = a3;
}

- (double)size
{
  return self->_size;
}

- (void)setSize:(double)a3
{
  self->_size = a3;
}

- (double)bodyCenterX
{
  return self->_bodyCenterX;
}

- (void)setBodyCenterX:(double)a3
{
  self->_bodyCenterX = a3;
}

- (double)bodyCenterY
{
  return self->_bodyCenterY;
}

- (void)setBodyCenterY:(double)a3
{
  self->_bodyCenterY = a3;
}

- (double)bodyWidth
{
  return self->_bodyWidth;
}

- (void)setBodyWidth:(double)a3
{
  self->_bodyWidth = a3;
}

- (double)bodyHeight
{
  return self->_bodyHeight;
}

- (void)setBodyHeight:(double)a3
{
  self->_bodyHeight = a3;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (BOOL)isInTrash
{
  return self->_isInTrash;
}

- (void)setIsInTrash:(BOOL)a3
{
  self->_isInTrash = a3;
}

- (BOOL)manual
{
  return self->_manual;
}

- (void)setManual:(BOOL)a3
{
  self->_manual = a3;
}

- (BOOL)isTooSmall
{
  return self->_isTooSmall;
}

- (void)setIsTooSmall:(BOOL)a3
{
  self->_isTooSmall = a3;
}

- (BOOL)hasSmile
{
  return self->_hasSmile;
}

- (void)setHasSmile:(BOOL)a3
{
  self->_hasSmile = a3;
}

- (double)blurScore
{
  return self->_blurScore;
}

- (void)setBlurScore:(double)a3
{
  self->_blurScore = a3;
}

- (double)exposureScore
{
  return self->_exposureScore;
}

- (void)setExposureScore:(double)a3
{
  self->_exposureScore = a3;
}

- (BOOL)isLeftEyeClosed
{
  return self->_isLeftEyeClosed;
}

- (void)setIsLeftEyeClosed:(BOOL)a3
{
  self->_isLeftEyeClosed = a3;
}

- (BOOL)isRightEyeClosed
{
  return self->_isRightEyeClosed;
}

- (void)setIsRightEyeClosed:(BOOL)a3
{
  self->_isRightEyeClosed = a3;
}

- (NSString)adjustmentVersion
{
  return self->_adjustmentVersion;
}

- (void)setAdjustmentVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (int64_t)nameSource
{
  return self->_nameSource;
}

- (void)setNameSource:(int64_t)a3
{
  self->_nameSource = a3;
}

- (int)trainingType
{
  return self->_trainingType;
}

- (void)setTrainingType:(int)a3
{
  self->_trainingType = a3;
}

- (double)poseYaw
{
  return self->_poseYaw;
}

- (void)setPoseYaw:(double)a3
{
  self->_poseYaw = a3;
}

- (unint64_t)algorithmVersion
{
  return self->_algorithmVersion;
}

- (void)setAlgorithmVersion:(unint64_t)a3
{
  self->_algorithmVersion = a3;
}

- (int64_t)clusterSequenceNumber
{
  return self->_clusterSequenceNumber;
}

- (void)setClusterSequenceNumber:(int64_t)a3
{
  self->_clusterSequenceNumber = a3;
}

- (int64_t)vuObservationID
{
  return self->_vuObservationID;
}

- (void)setVuObservationID:(int64_t)a3
{
  self->_vuObservationID = a3;
}

- (int64_t)qualityMeasure
{
  return self->_qualityMeasure;
}

- (void)setQualityMeasure:(int64_t)a3
{
  self->_qualityMeasure = a3;
}

- (unsigned)ageType
{
  return self->_ageType;
}

- (void)setAgeType:(unsigned __int16)a3
{
  self->_ageType = a3;
}

- (unsigned)sexType
{
  return self->_sexType;
}

- (void)setSexType:(unsigned __int16)a3
{
  self->_sexType = a3;
}

- (unsigned)eyesState
{
  return self->_eyesState;
}

- (void)setEyesState:(unsigned __int16)a3
{
  self->_eyesState = a3;
}

- (unsigned)smileType
{
  return self->_smileType;
}

- (void)setSmileType:(unsigned __int16)a3
{
  self->_smileType = a3;
}

- (unsigned)facialHairType
{
  return self->_facialHairType;
}

- (void)setFacialHairType:(unsigned __int16)a3
{
  self->_facialHairType = a3;
}

- (unsigned)hairColorType
{
  return self->_hairColorType;
}

- (void)setHairColorType:(unsigned __int16)a3
{
  self->_hairColorType = a3;
}

- (unsigned)glassesType
{
  return self->_glassesType;
}

- (void)setGlassesType:(unsigned __int16)a3
{
  self->_glassesType = a3;
}

- (unsigned)expressionType
{
  return self->_expressionType;
}

- (void)setExpressionType:(unsigned __int16)a3
{
  self->_expressionType = a3;
}

- (unsigned)headgearType
{
  return self->_headgearType;
}

- (void)setHeadgearType:(unsigned __int16)a3
{
  self->_headgearType = a3;
}

- (unsigned)hairType
{
  return self->_hairType;
}

- (void)setHairType:(unsigned __int16)a3
{
  self->_hairType = a3;
}

- (unsigned)poseType
{
  return self->_poseType;
}

- (void)setPoseType:(unsigned __int16)a3
{
  self->_poseType = a3;
}

- (unsigned)skintoneType
{
  return self->_skintoneType;
}

- (void)setSkintoneType:(unsigned __int16)a3
{
  self->_skintoneType = a3;
}

- (unsigned)ethnicityType
{
  return self->_ethnicityType;
}

- (void)setEthnicityType:(unsigned __int16)a3
{
  self->_ethnicityType = a3;
}

- (BOOL)hasFaceMask
{
  return self->_hasFaceMask;
}

- (void)setHasFaceMask:(BOOL)a3
{
  self->_hasFaceMask = a3;
}

- (unsigned)gazeType
{
  return self->_gazeType;
}

- (void)setGazeType:(unsigned __int16)a3
{
  self->_gazeType = a3;
}

- (double)gazeCenterX
{
  return self->_gazeCenterX;
}

- (void)setGazeCenterX:(double)a3
{
  self->_gazeCenterX = a3;
}

- (double)gazeCenterY
{
  return self->_gazeCenterY;
}

- (void)setGazeCenterY:(double)a3
{
  self->_gazeCenterY = a3;
}

- (CGRect)gazeRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_gazeRect.origin.x;
  y = self->_gazeRect.origin.y;
  width = self->_gazeRect.size.width;
  height = self->_gazeRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setGazeRect:(CGRect)a3
{
  self->_gazeRect = a3;
}

- (float)gazeAngle
{
  return self->_gazeAngle;
}

- (void)setGazeAngle:(float)a3
{
  self->_gazeAngle = a3;
}

- (float)gazeConfidence
{
  return self->_gazeConfidence;
}

- (void)setGazeConfidence:(float)a3
{
  self->_gazeConfidence = a3;
}

- (NSString)groupingIdentifier
{
  return self->_groupingIdentifier;
}

- (void)setGroupingIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (VCPVNImageprintWrapper)imageprintWrapper
{
  return self->_imageprintWrapper;
}

- (void)setImageprintWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_imageprintWrapper, a3);
}

- (double)roll
{
  return self->_roll;
}

- (void)setRoll:(double)a3
{
  self->_roll = a3;
}

- (double)quality
{
  return self->_quality;
}

- (void)setQuality:(double)a3
{
  self->_quality = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageprintWrapper, 0);
  objc_storeStrong((id *)&self->_groupingIdentifier, 0);
  objc_storeStrong((id *)&self->_adjustmentVersion, 0);
  objc_storeStrong((id *)&self->_personLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
}

+ (uint64_t)facesFromFaceObservations:(uint64_t)a3 humanObservations:(char)a4 animalObservations:sourceWidth:sourceHeight:visionRequests:blurScorePerFace:exposureScorePerFace:tooSmallFaceObservations:processingVersion:
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  float v16;
  __int128 v17;
  float v18;
  uint64_t v19;
  __int128 v20;
  float v21;
  unint64_t v22;
  float *v23;
  float v24;
  float v25;
  float v26;
  float *v27;
  uint64_t v28;
  uint64_t v29;
  float v30;
  float v31;
  BOOL v32;
  float v33;
  unint64_t v34;
  unint64_t v35;
  float v36;
  __int128 v37;
  float v38;
  float v39;
  uint64_t v40;
  uint64_t v41;
  float v42;
  float v43;
  float v44;
  float v45;
  uint64_t v46;
  uint64_t v47;
  float v48;
  float v49;
  uint64_t v50;
  uint64_t v51;
  float v52;
  float v53;
  uint64_t v54;
  uint64_t v55;
  __int128 v56;
  float v57;
  __int128 v58;
  float v59;
  __int128 v60;
  unint64_t v61;
  BOOL v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  float v67;
  float v68;
  __int128 v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  int64_t v74;
  int64_t v75;
  int64_t v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;
  float v80;
  float v81;
  __int128 v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  int64_t v86;
  int64_t v87;
  float v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  unint64_t v97;
  float v98;
  float v99;
  __int128 v100;
  unint64_t v101;
  unint64_t v103;
  uint64_t v104;
  float v105;
  float v106;
  __int128 v107;
  float *v108;
  float *v109;
  uint64_t v110;

  v7 = result;
LABEL_2:
  v8 = v7;
  while (2)
  {
    v7 = v8;
    v9 = a2 - v8;
    v10 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a2 - v8) >> 3);
    switch(v10)
    {
      case 0:
      case 1:
        return result;
      case 2:
        v44 = *(float *)(a2 - 24);
        v45 = *(float *)v8;
        if (v44 > *(float *)v8)
        {
          *(float *)v8 = v44;
          *(float *)(a2 - 24) = v45;
          v46 = *(_QWORD *)(v8 + 8);
          *(_QWORD *)(v8 + 8) = *(_QWORD *)(a2 - 16);
          *(_QWORD *)(a2 - 16) = v46;
          v47 = *(_QWORD *)(v8 + 16);
          *(_QWORD *)(v8 + 16) = *(_QWORD *)(a2 - 8);
          *(_QWORD *)(a2 - 8) = v47;
        }
        return result;
      case 3:
        return std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,+[VCPPhotosFace facesFromFaceObservations:humanObservations:animalObservations:sourceWidth:sourceHeight:visionRequests:blurScorePerFace:exposureScorePerFace:tooSmallFaceObservations:processingVersion:]::$_0 &,std::tuple<float,unsigned long,unsigned long> *>(v8, v8 + 24, a2 - 24);
      case 4:
        return std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,+[VCPPhotosFace facesFromFaceObservations:humanObservations:animalObservations:sourceWidth:sourceHeight:visionRequests:blurScorePerFace:exposureScorePerFace:tooSmallFaceObservations:processingVersion:]::$_0 &,std::tuple<float,unsigned long,unsigned long> *>(v8, v8 + 24, v8 + 48, a2 - 24);
      case 5:
        result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,+[VCPPhotosFace facesFromFaceObservations:humanObservations:animalObservations:sourceWidth:sourceHeight:visionRequests:blurScorePerFace:exposureScorePerFace:tooSmallFaceObservations:processingVersion:]::$_0 &,std::tuple<float,unsigned long,unsigned long> *>(v8, v8 + 24, v8 + 48, v8 + 72);
        v48 = *(float *)(a2 - 24);
        v49 = *(float *)(v8 + 72);
        if (v48 > v49)
        {
          *(float *)(v8 + 72) = v48;
          *(float *)(a2 - 24) = v49;
          v50 = *(_QWORD *)(v8 + 80);
          *(_QWORD *)(v8 + 80) = *(_QWORD *)(a2 - 16);
          *(_QWORD *)(a2 - 16) = v50;
          v51 = *(_QWORD *)(v8 + 88);
          *(_QWORD *)(v8 + 88) = *(_QWORD *)(a2 - 8);
          *(_QWORD *)(a2 - 8) = v51;
          v52 = *(float *)(v8 + 72);
          v53 = *(float *)(v8 + 48);
          if (v52 > v53)
          {
            *(float *)(v8 + 48) = v52;
            *(float *)(v8 + 72) = v53;
            v54 = *(_QWORD *)(v8 + 80);
            v55 = *(_QWORD *)(v8 + 88);
            v56 = *(_OWORD *)(v8 + 56);
            *(_QWORD *)(v8 + 56) = v54;
            *(_QWORD *)(v8 + 64) = v55;
            *(_OWORD *)(v8 + 80) = v56;
            v57 = *(float *)(v8 + 24);
            if (v52 > v57)
            {
              *(float *)(v8 + 24) = v52;
              *(float *)(v8 + 48) = v57;
              v58 = *(_OWORD *)(v8 + 32);
              *(_QWORD *)(v8 + 32) = v54;
              *(_QWORD *)(v8 + 40) = v55;
              *(_OWORD *)(v8 + 56) = v58;
              v59 = *(float *)v8;
              if (v52 > *(float *)v8)
              {
                *(float *)v8 = v52;
                *(float *)(v8 + 24) = v59;
                v60 = *(_OWORD *)(v8 + 8);
                *(_QWORD *)(v8 + 8) = v54;
                *(_QWORD *)(v8 + 16) = v55;
                *(_OWORD *)(v8 + 32) = v60;
              }
            }
          }
        }
        return result;
      default:
        if (v9 <= 575)
        {
          v61 = v8 + 24;
          v63 = v8 == a2 || v61 == a2;
          if ((a4 & 1) != 0)
          {
            if (!v63)
            {
              v64 = 0;
              v65 = v8;
              do
              {
                v66 = v61;
                v67 = *(float *)(v65 + 24);
                v68 = *(float *)v65;
                if (v67 > *(float *)v65)
                {
                  v69 = *(_OWORD *)(v65 + 32);
                  v70 = v64;
                  while (1)
                  {
                    v71 = v8 + v70;
                    *(float *)(v71 + 24) = v68;
                    v72 = *(_QWORD *)(v8 + v70 + 16);
                    *(_QWORD *)(v71 + 32) = *(_QWORD *)(v8 + v70 + 8);
                    *(_QWORD *)(v71 + 40) = v72;
                    if (!v70)
                      break;
                    v68 = *(float *)(v71 - 24);
                    v70 -= 24;
                    if (v67 <= v68)
                    {
                      v73 = v8 + v70 + 24;
                      goto LABEL_79;
                    }
                  }
                  v73 = v8;
LABEL_79:
                  *(float *)v73 = v67;
                  *(_OWORD *)(v73 + 8) = v69;
                }
                v61 = v66 + 24;
                v64 += 24;
                v65 = v66;
              }
              while (v66 + 24 != a2);
            }
          }
          else if (!v63)
          {
            v103 = v8 + 40;
            do
            {
              v104 = v61;
              v105 = *(float *)(v7 + 24);
              v106 = *(float *)v7;
              if (v105 > *(float *)v7)
              {
                v107 = *(_OWORD *)(v7 + 32);
                v108 = (float *)v103;
                do
                {
                  v109 = v108;
                  *(v108 - 4) = v106;
                  *((_QWORD *)v108 - 1) = *((_QWORD *)v108 - 4);
                  v110 = *((_QWORD *)v108 - 3);
                  v108 -= 6;
                  *(_QWORD *)v109 = v110;
                  v106 = *(v109 - 16);
                }
                while (v105 > v106);
                *(v108 - 4) = v105;
                *(_OWORD *)(v108 - 2) = v107;
              }
              v61 = v104 + 24;
              v103 += 24;
              v7 = v104;
            }
            while (v104 + 24 != a2);
          }
          return result;
        }
        if (!a3)
        {
          if (v8 != a2)
          {
            v74 = (unint64_t)(v10 - 2) >> 1;
            v75 = v74;
            do
            {
              v76 = v75;
              if (v74 >= v75)
              {
                v77 = (2 * v75) | 1;
                v78 = v8 + 24 * v77;
                if (2 * v76 + 2 < v10 && *(float *)v78 > *(float *)(v78 + 24))
                {
                  v78 += 24;
                  v77 = 2 * v76 + 2;
                }
                v79 = v8 + 24 * v76;
                v80 = *(float *)v78;
                v81 = *(float *)v79;
                if (*(float *)v78 <= *(float *)v79)
                {
                  v82 = *(_OWORD *)(v79 + 8);
                  do
                  {
                    v83 = v79;
                    v79 = v78;
                    *(float *)v83 = v80;
                    *(_QWORD *)(v83 + 8) = *(_QWORD *)(v78 + 8);
                    *(_QWORD *)(v83 + 16) = *(_QWORD *)(v78 + 16);
                    if (v74 < v77)
                      break;
                    v84 = 2 * v77;
                    v77 = (2 * v77) | 1;
                    v78 = v8 + 24 * v77;
                    v85 = v84 + 2;
                    if (v85 < v10 && *(float *)v78 > *(float *)(v78 + 24))
                    {
                      v78 += 24;
                      v77 = v85;
                    }
                    v80 = *(float *)v78;
                  }
                  while (*(float *)v78 <= v81);
                  *(float *)v79 = v81;
                  *(_OWORD *)(v79 + 8) = v82;
                }
              }
              v75 = v76 - 1;
            }
            while (v76);
            v86 = v9 / 0x18uLL;
            do
            {
              v87 = 0;
              v88 = *(float *)v8;
              v89 = *(_QWORD *)(v8 + 8);
              v90 = *(_QWORD *)(v8 + 16);
              v91 = v8;
              do
              {
                v92 = v91;
                v91 += 24 * v87 + 24;
                v93 = 2 * v87;
                result = (2 * v87) | 1;
                v87 = result;
                v94 = v93 + 2;
                if (v94 < v86)
                {
                  result = v91 + 24;
                  if (*(float *)v91 > *(float *)(v91 + 24))
                  {
                    v91 += 24;
                    v87 = v94;
                  }
                }
                *(_DWORD *)v92 = *(_DWORD *)v91;
                *(_QWORD *)(v92 + 8) = *(_QWORD *)(v91 + 8);
                *(_QWORD *)(v92 + 16) = *(_QWORD *)(v91 + 16);
              }
              while (v87 <= (uint64_t)((unint64_t)(v86 - 2) >> 1));
              if (v91 == a2 - 24)
              {
                *(float *)v91 = v88;
                *(_QWORD *)(v91 + 8) = v89;
                *(_QWORD *)(v91 + 16) = v90;
              }
              else
              {
                *(_DWORD *)v91 = *(_DWORD *)(a2 - 24);
                *(_QWORD *)(v91 + 8) = *(_QWORD *)(a2 - 16);
                *(_QWORD *)(v91 + 16) = *(_QWORD *)(a2 - 8);
                *(float *)(a2 - 24) = v88;
                *(_QWORD *)(a2 - 16) = v89;
                *(_QWORD *)(a2 - 8) = v90;
                v95 = v91 - v8 + 24;
                if (v95 >= 25)
                {
                  v96 = (v95 / 0x18uLL - 2) >> 1;
                  v97 = v8 + 24 * v96;
                  v98 = *(float *)v97;
                  v99 = *(float *)v91;
                  if (*(float *)v97 > *(float *)v91)
                  {
                    v100 = *(_OWORD *)(v91 + 8);
                    do
                    {
                      v101 = v91;
                      v91 = v97;
                      *(float *)v101 = v98;
                      *(_QWORD *)(v101 + 8) = *(_QWORD *)(v97 + 8);
                      *(_QWORD *)(v101 + 16) = *(_QWORD *)(v97 + 16);
                      if (!v96)
                        break;
                      v96 = (v96 - 1) >> 1;
                      v97 = v8 + 24 * v96;
                      v98 = *(float *)v97;
                    }
                    while (*(float *)v97 > v99);
                    *(float *)v91 = v99;
                    *(_OWORD *)(v91 + 8) = v100;
                  }
                }
              }
              a2 -= 24;
            }
            while (v86-- > 2);
          }
          return result;
        }
        v11 = (unint64_t)v10 >> 1;
        v12 = v8 + 24 * ((unint64_t)v10 >> 1);
        if ((unint64_t)v9 < 0xC01)
        {
          result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,+[VCPPhotosFace facesFromFaceObservations:humanObservations:animalObservations:sourceWidth:sourceHeight:visionRequests:blurScorePerFace:exposureScorePerFace:tooSmallFaceObservations:processingVersion:]::$_0 &,std::tuple<float,unsigned long,unsigned long> *>(v7 + 24 * v11, v7, a2 - 24);
        }
        else
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,+[VCPPhotosFace facesFromFaceObservations:humanObservations:animalObservations:sourceWidth:sourceHeight:visionRequests:blurScorePerFace:exposureScorePerFace:tooSmallFaceObservations:processingVersion:]::$_0 &,std::tuple<float,unsigned long,unsigned long> *>(v7, v7 + 24 * v11, a2 - 24);
          v13 = 3 * v11;
          v14 = v7 + 24 * v11 - 24;
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,+[VCPPhotosFace facesFromFaceObservations:humanObservations:animalObservations:sourceWidth:sourceHeight:visionRequests:blurScorePerFace:exposureScorePerFace:tooSmallFaceObservations:processingVersion:]::$_0 &,std::tuple<float,unsigned long,unsigned long> *>(v7 + 24, v14, a2 - 48);
          v15 = v7 + 24 + 8 * v13;
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,+[VCPPhotosFace facesFromFaceObservations:humanObservations:animalObservations:sourceWidth:sourceHeight:visionRequests:blurScorePerFace:exposureScorePerFace:tooSmallFaceObservations:processingVersion:]::$_0 &,std::tuple<float,unsigned long,unsigned long> *>(v7 + 48, v15, a2 - 72);
          result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,+[VCPPhotosFace facesFromFaceObservations:humanObservations:animalObservations:sourceWidth:sourceHeight:visionRequests:blurScorePerFace:exposureScorePerFace:tooSmallFaceObservations:processingVersion:]::$_0 &,std::tuple<float,unsigned long,unsigned long> *>(v14, v12, v15);
          v16 = *(float *)v7;
          *(_DWORD *)v7 = *(_DWORD *)v12;
          *(float *)v12 = v16;
          v17 = *(_OWORD *)(v7 + 8);
          *(_OWORD *)(v7 + 8) = *(_OWORD *)(v12 + 8);
          *(_OWORD *)(v12 + 8) = v17;
        }
        --a3;
        v18 = *(float *)v7;
        if ((a4 & 1) == 0 && *(float *)(v7 - 24) <= v18)
        {
          if (v18 <= *(float *)(a2 - 24))
          {
            v34 = v7 + 24;
            do
            {
              v8 = v34;
              if (v34 >= a2)
                break;
              v34 += 24;
            }
            while (v18 <= *(float *)v8);
          }
          else
          {
            v8 = v7;
            do
            {
              v33 = *(float *)(v8 + 24);
              v8 += 24;
            }
            while (v18 <= v33);
          }
          v35 = a2;
          if (v8 < a2)
          {
            v35 = a2;
            do
            {
              v36 = *(float *)(v35 - 24);
              v35 -= 24;
            }
            while (v18 > v36);
          }
          v37 = *(_OWORD *)(v7 + 8);
          if (v8 < v35)
          {
            v38 = *(float *)v8;
            v39 = *(float *)v35;
            do
            {
              *(float *)v8 = v39;
              *(float *)v35 = v38;
              v40 = *(_QWORD *)(v8 + 8);
              *(_QWORD *)(v8 + 8) = *(_QWORD *)(v35 + 8);
              *(_QWORD *)(v35 + 8) = v40;
              v41 = *(_QWORD *)(v8 + 16);
              *(_QWORD *)(v8 + 16) = *(_QWORD *)(v35 + 16);
              *(_QWORD *)(v35 + 16) = v41;
              do
              {
                v42 = *(float *)(v8 + 24);
                v8 += 24;
                v38 = v42;
              }
              while (v18 <= v42);
              do
              {
                v43 = *(float *)(v35 - 24);
                v35 -= 24;
                v39 = v43;
              }
              while (v18 > v43);
            }
            while (v8 < v35);
          }
          if (v8 - 24 != v7)
          {
            *(_DWORD *)v7 = *(_DWORD *)(v8 - 24);
            *(_QWORD *)(v7 + 8) = *(_QWORD *)(v8 - 16);
            *(_QWORD *)(v7 + 16) = *(_QWORD *)(v8 - 8);
          }
          a4 = 0;
          *(float *)(v8 - 24) = v18;
          *(_OWORD *)(v8 - 16) = v37;
          continue;
        }
        v19 = 0;
        v20 = *(_OWORD *)(v7 + 8);
        do
        {
          v21 = *(float *)(v7 + v19 + 24);
          v19 += 24;
        }
        while (v21 > v18);
        v22 = v7 + v19;
        v23 = (float *)a2;
        if (v19 == 24)
        {
          v23 = (float *)a2;
          do
          {
            if (v22 >= (unint64_t)v23)
              break;
            v25 = *(v23 - 6);
            v23 -= 6;
          }
          while (v25 <= v18);
        }
        else
        {
          do
          {
            v24 = *(v23 - 6);
            v23 -= 6;
          }
          while (v24 <= v18);
        }
        if (v22 >= (unint64_t)v23)
        {
          v8 = v7 + v19;
        }
        else
        {
          v26 = *v23;
          v8 = v7 + v19;
          v27 = v23;
          do
          {
            *(float *)v8 = v26;
            *v27 = v21;
            v28 = *(_QWORD *)(v8 + 8);
            *(_QWORD *)(v8 + 8) = *((_QWORD *)v27 + 1);
            *((_QWORD *)v27 + 1) = v28;
            v29 = *(_QWORD *)(v8 + 16);
            *(_QWORD *)(v8 + 16) = *((_QWORD *)v27 + 2);
            *((_QWORD *)v27 + 2) = v29;
            do
            {
              v30 = *(float *)(v8 + 24);
              v8 += 24;
              v21 = v30;
            }
            while (v30 > v18);
            do
            {
              v31 = *(v27 - 6);
              v27 -= 6;
              v26 = v31;
            }
            while (v31 <= v18);
          }
          while (v8 < (unint64_t)v27);
        }
        if (v8 - 24 != v7)
        {
          *(_DWORD *)v7 = *(_DWORD *)(v8 - 24);
          *(_QWORD *)(v7 + 8) = *(_QWORD *)(v8 - 16);
          *(_QWORD *)(v7 + 16) = *(_QWORD *)(v8 - 8);
        }
        *(float *)(v8 - 24) = v18;
        *(_OWORD *)(v8 - 16) = v20;
        if (v22 < (unint64_t)v23)
        {
LABEL_32:
          result = std::__introsort<std::_ClassicAlgPolicy,+[VCPPhotosFace facesFromFaceObservations:humanObservations:animalObservations:sourceWidth:sourceHeight:visionRequests:blurScorePerFace:exposureScorePerFace:tooSmallFaceObservations:processingVersion:]::$_0 &,std::tuple<float,unsigned long,unsigned long> *,false>(v7, v8 - 24, a3, a4 & 1);
          a4 = 0;
          continue;
        }
        v32 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,+[VCPPhotosFace facesFromFaceObservations:humanObservations:animalObservations:sourceWidth:sourceHeight:visionRequests:blurScorePerFace:exposureScorePerFace:tooSmallFaceObservations:processingVersion:]::$_0 &,std::tuple<float,unsigned long,unsigned long> *>(v7, v8 - 24);
        result = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,+[VCPPhotosFace facesFromFaceObservations:humanObservations:animalObservations:sourceWidth:sourceHeight:visionRequests:blurScorePerFace:exposureScorePerFace:tooSmallFaceObservations:processingVersion:]::$_0 &,std::tuple<float,unsigned long,unsigned long> *>(v8, a2);
        if (!(_DWORD)result)
        {
          if (v32)
            continue;
          goto LABEL_32;
        }
        a2 = v8 - 24;
        if (!v32)
          goto LABEL_2;
        return result;
    }
  }
}

@end
