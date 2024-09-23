@implementation HMIFaceClassifierVIP

- (HMIFaceClassifierVIP)initWithError:(id *)a3
{
  HMIFaceClassifierVIP *v4;
  HMIFaceprinter *v5;
  HMIFaceprinter *faceprinter;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  HMIFaceQualityFilterSVM *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  HMIFaceQualityFilterSVM *faceRecognizabilityFilter;
  HMIFaceQualityFilterSVM *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  HMIFaceQualityFilterSVM *faceAestheticQualityFilter;
  HMIFaceClassifierVIP *v25;
  id v27;
  id v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)HMIFaceClassifierVIP;
  v4 = -[HMIFaceClassifierVIP init](&v29, sel_init);
  if (!v4)
    goto LABEL_5;
  v5 = objc_alloc_init(HMIFaceprinter);
  faceprinter = v4->_faceprinter;
  v4->_faceprinter = v5;

  +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberPreferenceForKey:defaultValue:", CFSTR("personsModelClassificationThresholdKnown"), &unk_24DC15430);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v4->_classificationThresholdKnown = v9;

  +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberPreferenceForKey:defaultValue:", CFSTR("personsModelClassificationThresholdUnknown"), &unk_24DC15440);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v4->_classificationThresholdUnknown = v12;

  v13 = [HMIFaceQualityFilterSVM alloc];
  +[HMIFaceQualityFilterSVM defaultRecognizabilityModelPath](HMIFaceQualityFilterSVM, "defaultRecognizabilityModelPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMIFaceQualityFilterSVM defaultRecognizabilityDataScalerPath](HMIFaceQualityFilterSVM, "defaultRecognizabilityDataScalerPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v16 = -[HMIFaceQualityFilterSVM initWithModelPath:dataScalerPath:error:](v13, "initWithModelPath:dataScalerPath:error:", v14, v15, &v28);
  v17 = v28;
  faceRecognizabilityFilter = v4->_faceRecognizabilityFilter;
  v4->_faceRecognizabilityFilter = (HMIFaceQualityFilterSVM *)v16;

  if (v4->_faceRecognizabilityFilter)
  {
    v19 = [HMIFaceQualityFilterSVM alloc];
    +[HMIFaceQualityFilterSVM defaultAestheticQualityModelPath](HMIFaceQualityFilterSVM, "defaultAestheticQualityModelPath");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMIFaceQualityFilterSVM defaultAestheticQualityDataScalerPath](HMIFaceQualityFilterSVM, "defaultAestheticQualityDataScalerPath");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v17;
    v22 = -[HMIFaceQualityFilterSVM initWithModelPath:dataScalerPath:error:](v19, "initWithModelPath:dataScalerPath:error:", v20, v21, &v27);
    v23 = v27;

    faceAestheticQualityFilter = v4->_faceAestheticQualityFilter;
    v4->_faceAestheticQualityFilter = (HMIFaceQualityFilterSVM *)v22;

    if (v4->_faceAestheticQualityFilter)
    {

LABEL_5:
      v25 = v4;
      goto LABEL_10;
    }
    v17 = v23;
  }
  if (a3)
  {
    v17 = objc_retainAutorelease(v17);
    *a3 = v17;
  }
  HMIErrorLog(v4, v17);

  v25 = 0;
LABEL_10:

  return v25;
}

- (id)qualityPredictionFromSVMUsingFaceQualityFilterSVM:(id)a3 detectorConfidence:(double)a4 laplacian:(double)a5 yaw:(double)a6 boxSize:(double)a7 error:(id *)a8
{
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  void *v24;
  id v26;
  double v27;
  id v28;

  v14 = a3;
  v28 = 0;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBFFF0]), "initWithShape:dataType:error:", &unk_24DC15128, 65600, &v28);
  v16 = v28;
  v17 = v16;
  if (v15)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:atIndexedSubscript:", v18, 0);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:atIndexedSubscript:", v19, 1);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:atIndexedSubscript:", v20, 2);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:atIndexedSubscript:", v21, 3);

    v26 = v17;
    v27 = 0.0;
    v22 = objc_msgSend(v14, "predict:output:error:", v15, &v27, &v26);
    v23 = v26;

    if ((v22 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v27);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a8)
        *a8 = objc_retainAutorelease(v23);
      HMIErrorLog(self, v23);
      v24 = 0;
    }
    v17 = v23;
  }
  else
  {
    if (a8)
      *a8 = objc_retainAutorelease(v16);
    HMIErrorLog(self, v17);
    v24 = 0;
  }

  return v24;
}

- (id)classifyFaceEvent:(id)a3 pixelBuffer:(__CVBuffer *)a4 fastMode:(BOOL)a5 homeUUID:(id)a6 error:(id *)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  void *v14;
  __CVBuffer *v15;
  HMIFaceQualityEntropyOfLaplacian *v16;
  void *v17;
  double v18;
  double v19;
  float v20;
  float v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double Size;
  double v30;
  float v31;
  HMIFaceQualityFilterSVM *faceRecognizabilityFilter;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  float v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  HMIFaceClassifierVIP *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  float v51;
  void *v52;
  void *v53;
  HMIVideoAnalyzerEventFace *v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  HMIVideoAnalyzerEventFace *v66;
  HMIFaceQualityEntropyOfLaplacian *v67;
  void *v68;
  HMIFaceClassifierVIP *v69;
  NSObject *v70;
  void *v71;
  double v72;
  void *v73;
  void *v74;
  HMIVideoAnalyzerEventFace *v75;
  void *v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  HMIFaceCrop *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  HMIFaceQualityFilterSVM *faceAestheticQualityFilter;
  void *v102;
  id v103;
  void *v104;
  id v105;
  HMIFaceprint *v106;
  HMIFaceCrop *v107;
  double v108;
  HMIFaceprint *v109;
  HMIFaceCrop *v110;
  void *v111;
  HMIFaceClassifierVIP *v112;
  NSObject *v113;
  void *v114;
  HMIFaceRecognition *v115;
  double v116;
  double v117;
  void *v118;
  double v119;
  void *v120;
  uint64_t v121;
  void *v122;
  void *v123;
  HMIVideoAnalyzerEventFace *v124;
  void *v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  void *v134;
  void *v135;
  HMIVideoAnalyzerEventFace *v136;
  void *v137;
  void *v138;
  HMIFaceClassifierVIP *v139;
  NSObject *v140;
  void *v141;
  void *v142;
  uint64_t v143;
  HMIVideoAnalyzerEventFace *v144;
  uint64_t v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  void *v154;
  void *v155;
  uint64_t v156;
  void *v157;
  void *v158;
  HMIFaceClassifierVIP *v159;
  NSObject *v160;
  void *v161;
  void *v162;
  void *v163;
  void **v164;
  const __CFString **v165;
  uint64_t v166;
  HMIVideoAnalyzerEventFace *v167;
  double v168;
  double v169;
  double v170;
  double v171;
  double v172;
  double v173;
  double v174;
  double v175;
  HMIVideoAnalyzerEventFace *v176;
  id v178;
  id v179;
  id v180;
  id v181;
  double v182;
  int v183;
  void *v184;
  void *v185;
  id v186;
  void *v187;
  void *v188;
  HMIFaceprint *v189;
  HMIFaceprint *v190;
  HMIFaceprint *v191;
  void *v192;
  HMIFaceCrop *v193;
  HMIFaceQualityEntropyOfLaplacian *v194;
  id v195;
  _QWORD v196[5];
  id v197;
  id v198;
  id v199;
  HMIFaceprint *v200;
  HMIFaceCrop *v201;
  float v202;
  float v203;
  char v204;
  id v205;
  id v206;
  const __CFString *v207;
  void *v208;
  const __CFString *v209;
  void *v210;
  const __CFString *v211;
  void *v212;
  const __CFString *v213;
  void *v214;
  const __CFString *v215;
  void *v216;
  const __CFString *v217;
  void *v218;
  uint8_t buf[4];
  void *v220;
  __int16 v221;
  double v222;
  __int16 v223;
  double v224;
  uint64_t v225;

  v9 = a5;
  v225 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a6;
  objc_msgSend(v12, "roll");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = +[HMIFaceprinter createFacePixelBufferForFaceEvent:pixelBuffer:roll:error:](HMIFaceprinter, "createFacePixelBufferForFaceEvent:pixelBuffer:roll:error:", v12, a4, v14, a7);

  if (v15)
  {
    v195 = v13;
    v16 = objc_alloc_init(HMIFaceQualityEntropyOfLaplacian);
    objc_msgSend(v12, "confidence");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "value");
    v19 = v18;

    -[HMIFaceQualityEntropyOfLaplacian computeJunkScoreForPixelBuffer:](v16, "computeJunkScoreForPixelBuffer:", v15);
    v21 = v20;
    objc_msgSend(v12, "yaw");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "doubleValue");
    v24 = v23;

    objc_msgSend(v12, "boundingBox");
    v26 = v25;
    v28 = v27;
    Size = HMICVPixelBufferGetSize(a4);
    v31 = HMICGSizeAreaInPixelsFromNormalized(v26, v28, Size, v30);
    faceRecognizabilityFilter = self->_faceRecognizabilityFilter;
    v206 = 0;
    -[HMIFaceClassifierVIP qualityPredictionFromSVMUsingFaceQualityFilterSVM:detectorConfidence:laplacian:yaw:boxSize:error:](self, "qualityPredictionFromSVMUsingFaceQualityFilterSVM:detectorConfidence:laplacian:yaw:boxSize:error:", faceRecognizabilityFilter, &v206, v19, v21, v24, v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v206;
    v35 = v34;
    if (v33)
    {
      v36 = objc_msgSend(v33, "doubleValue");
      if (v37 < 0.55 || fabs(v24) > 0.65)
      {
        v67 = v16;
        v68 = (void *)MEMORY[0x220735570](v36);
        v69 = self;
        HMFGetOSLogHandle();
        v70 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "doubleValue");
          *(_DWORD *)buf = 138543874;
          v220 = v71;
          v221 = 2048;
          v222 = v72;
          v223 = 2048;
          v224 = v24;
          _os_log_impl(&dword_219D45000, v70, OS_LOG_TYPE_DEBUG, "%{public}@Face below face quality thresholds: SVM recognizability = %lf, Yaw = %lf, discarding", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v68);
        CVPixelBufferRelease(v15);
        v217 = CFSTR("FaceFilteredState");
        HMIFaceFilteredStateAsString(1);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v218 = v73;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v218, &v217, 1);
        v74 = (void *)objc_claimAutoreleasedReturnValue();

        v75 = [HMIVideoAnalyzerEventFace alloc];
        objc_msgSend(v12, "confidence");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "boundingBox");
        v78 = v77;
        v80 = v79;
        v82 = v81;
        v84 = v83;
        objc_msgSend(v12, "yaw");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "roll");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = -[HMIVideoAnalyzerEventFace initWithConfidence:boundingBox:yaw:roll:faceRecognition:userInfo:](v75, "initWithConfidence:boundingBox:yaw:roll:faceRecognition:userInfo:", v76, v85, v86, 0, v74, v78, v80, v82, v84);

        v16 = v67;
      }
      else
      {
        v194 = v16;
        -[HMIFaceClassifierVIP faceprinter](self, "faceprinter");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "createFaceprintForFacePixelBuffer:fastMode:error:", v15, v9, a7);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (v39)
        {
          objc_msgSend(v39, "faceprint");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "confidence");
          v42 = v41;

          HIDWORD(v44) = 1069128089;
          if (v42 >= 0.1)
          {
            LODWORD(v44) = 1.0;
            LODWORD(v43) = 1.0;
            +[HMIVisionUtilities createJPEGDataFromPixelBuffer:scale:encodeQuality:error:](HMIVisionUtilities, "createJPEGDataFromPixelBuffer:scale:encodeQuality:error:", v15, a7, v44, v43);
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            CVPixelBufferRelease(v15);
            if (v87)
            {
              +[HMIPersonsModelManager sharedInstance](HMIPersonsModelManager, "sharedInstance");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v88, "predictPersonFromFaceObservation:homeUUID:error:", v39, v195, a7);
              v89 = (void *)objc_claimAutoreleasedReturnValue();

              if (v89)
              {
                v192 = v89;
                v188 = v87;
                if (objc_msgSend(v89, "count"))
                {
                  objc_msgSend(v39, "faceAttributes");
                  v90 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v90, "facemaskCategory");
                  v91 = (void *)objc_claimAutoreleasedReturnValue();

                  v184 = v91;
                  objc_msgSend(v91, "label");
                  v92 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v92, "identifier");
                  v187 = v39;
                  v93 = (void *)objc_claimAutoreleasedReturnValue();
                  v183 = objc_msgSend(v93, "isEqualToString:", *MEMORY[0x24BDF9DE0]);

                  v94 = [HMIFaceCrop alloc];
                  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
                  v95 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x24BDBCE60], "date");
                  v96 = (void *)objc_claimAutoreleasedReturnValue();
                  v193 = -[HMIFaceCrop initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:](v94, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:", v95, v87, v96, 0.0, 0.0, 1.0, 1.0);

                  v189 = [HMIFaceprint alloc];
                  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
                  v185 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v187, "faceprint");
                  v97 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v97, "descriptorData");
                  v98 = (void *)objc_claimAutoreleasedReturnValue();
                  +[HMIFaceprinter currentModelUUID](HMIFaceprinter, "currentModelUUID");
                  v99 = (void *)objc_claimAutoreleasedReturnValue();
                  -[HMIFaceCrop UUID](v193, "UUID");
                  v100 = (void *)objc_claimAutoreleasedReturnValue();
                  v190 = -[HMIFaceprint initWithUUID:data:modelUUID:faceCropUUID:](v189, "initWithUUID:data:modelUUID:faceCropUUID:", v185, v98, v99, v100);

                  faceAestheticQualityFilter = self->_faceAestheticQualityFilter;
                  v205 = v35;
                  -[HMIFaceClassifierVIP qualityPredictionFromSVMUsingFaceQualityFilterSVM:detectorConfidence:laplacian:yaw:boxSize:error:](self, "qualityPredictionFromSVMUsingFaceQualityFilterSVM:detectorConfidence:laplacian:yaw:boxSize:error:", faceAestheticQualityFilter, &v205, v19, v21, v24, v31);
                  v102 = (void *)objc_claimAutoreleasedReturnValue();
                  v103 = v205;

                  if (v102)
                  {
                    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
                    v104 = (void *)objc_claimAutoreleasedReturnValue();
                    v196[0] = MEMORY[0x24BDAC760];
                    v196[1] = 3221225472;
                    v196[2] = __78__HMIFaceClassifierVIP_classifyFaceEvent_pixelBuffer_fastMode_homeUUID_error___block_invoke;
                    v196[3] = &unk_24DBEA9E8;
                    v196[4] = self;
                    v180 = v104;
                    v197 = v180;
                    v204 = v183;
                    v105 = v102;
                    v198 = v105;
                    v178 = v12;
                    v199 = v178;
                    v202 = v21;
                    v203 = v31;
                    v106 = v190;
                    v200 = v106;
                    v107 = v193;
                    v201 = v107;
                    objc_msgSend(v192, "na_map:", v196);
                    v108 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
                    v193 = v107;
                    v181 = v103;
                    v182 = v108;
                    v191 = v106;
                    v186 = v105;
                    if (objc_msgSend(*(id *)&v108, "count"))
                    {
                      if (objc_msgSend(*(id *)&v108, "na_any:", &__block_literal_global_10))
                      {
                        v109 = v106;
                        v110 = v107;
                        v111 = (void *)MEMORY[0x220735570]();
                        v112 = self;
                        HMFGetOSLogHandle();
                        v113 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v113, OS_LOG_TYPE_INFO))
                        {
                          HMFGetLogIdentifier();
                          v114 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138543618;
                          v220 = v114;
                          v221 = 2112;
                          v222 = v182;
                          _os_log_impl(&dword_219D45000, v113, OS_LOG_TYPE_INFO, "%{public}@Positive face classifications: %@ ", buf, 0x16u);

                        }
                        objc_autoreleasePoolPop(v111);
                        v107 = v110;
                        v106 = v109;
                      }
                      v115 = [HMIFaceRecognition alloc];
                      objc_msgSend(v105, "doubleValue");
                      v117 = v116;
                      -[HMIFaceprint UUID](v106, "UUID");
                      v118 = (void *)objc_claimAutoreleasedReturnValue();
                      v119 = v182;
                      v120 = v180;
                      v121 = -[HMIFaceRecognition initWithFaceCrop:faceprint:classifications:predictedLinkedEntityUUIDs:faceQualityScore:sessionEntityAssignment:sessionEntityUUID:](v115, "initWithFaceCrop:faceprint:classifications:predictedLinkedEntityUUIDs:faceQualityScore:sessionEntityAssignment:sessionEntityUUID:", v107, v106, *(_QWORD *)&v182, v180, 0, v118, v117);

                      v207 = CFSTR("FaceFilteredState");
                      HMIFaceFilteredStateAsString(0);
                      v122 = (void *)objc_claimAutoreleasedReturnValue();
                      v208 = v122;
                      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v208, &v207, 1);
                      v123 = (void *)objc_claimAutoreleasedReturnValue();

                      v124 = [HMIVideoAnalyzerEventFace alloc];
                      objc_msgSend(v178, "confidence");
                      v125 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v178, "boundingBox");
                      v127 = v126;
                      v129 = v128;
                      v131 = v130;
                      v133 = v132;
                      objc_msgSend(v178, "yaw");
                      v134 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v178, "roll");
                      v135 = (void *)objc_claimAutoreleasedReturnValue();
                      v136 = v124;
                      v137 = (void *)v121;
                      v66 = -[HMIVideoAnalyzerEventFace initWithConfidence:boundingBox:yaw:roll:faceRecognition:userInfo:](v136, "initWithConfidence:boundingBox:yaw:roll:faceRecognition:userInfo:", v125, v134, v135, v121, v123, v127, v129, v131, v133);

                      v39 = v187;
                    }
                    else
                    {
                      v158 = (void *)MEMORY[0x220735570]();
                      v159 = self;
                      HMFGetOSLogHandle();
                      v160 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v160, OS_LOG_TYPE_DEBUG))
                      {
                        HMFGetLogIdentifier();
                        v161 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138543362;
                        v220 = v161;
                        _os_log_impl(&dword_219D45000, v160, OS_LOG_TYPE_DEBUG, "%{public}@Face recognition set is empty", buf, 0xCu);

                      }
                      objc_autoreleasePoolPop(v158);
                      v39 = v187;
                      if (v183)
                      {
                        v211 = CFSTR("FaceFilteredState");
                        HMIFaceFilteredStateAsString(5);
                        v162 = (void *)objc_claimAutoreleasedReturnValue();
                        v212 = v162;
                        v163 = (void *)MEMORY[0x24BDBCE70];
                        v164 = &v212;
                        v165 = &v211;
                      }
                      else
                      {
                        v209 = CFSTR("FaceFilteredState");
                        HMIFaceFilteredStateAsString(2);
                        v162 = (void *)objc_claimAutoreleasedReturnValue();
                        v210 = v162;
                        v163 = (void *)MEMORY[0x24BDBCE70];
                        v164 = &v210;
                        v165 = &v209;
                      }
                      objc_msgSend(v163, "dictionaryWithObjects:forKeys:count:", v164, v165, 1, v178);
                      v166 = objc_claimAutoreleasedReturnValue();

                      v167 = [HMIVideoAnalyzerEventFace alloc];
                      objc_msgSend(v179, "confidence");
                      v123 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v179, "boundingBox");
                      v169 = v168;
                      v171 = v170;
                      v173 = v172;
                      v175 = v174;
                      objc_msgSend(v179, "yaw");
                      v125 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v179, "roll");
                      v134 = (void *)objc_claimAutoreleasedReturnValue();
                      v176 = v167;
                      v137 = (void *)v166;
                      v66 = -[HMIVideoAnalyzerEventFace initWithConfidence:boundingBox:yaw:roll:faceRecognition:userInfo:](v176, "initWithConfidence:boundingBox:yaw:roll:faceRecognition:userInfo:", v123, v125, v134, 0, v166, v169, v171, v173, v175);
                      v120 = v180;
                      v119 = v182;
                    }

                    v35 = v181;
                    v16 = v194;
                    v154 = v191;
                    v89 = v192;
                    v157 = v184;
                    v155 = v186;
                  }
                  else
                  {
                    v16 = v194;
                    v89 = v192;
                    if (a7)
                      *a7 = objc_retainAutorelease(v103);
                    HMIErrorLog(self, v103);
                    v66 = 0;
                    v35 = v103;
                    v155 = 0;
                    v39 = v187;
                    v157 = v184;
                    v154 = v190;
                  }
                }
                else
                {
                  v138 = (void *)MEMORY[0x220735570]();
                  v139 = self;
                  HMFGetOSLogHandle();
                  v140 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v140, OS_LOG_TYPE_ERROR))
                  {
                    HMFGetLogIdentifier();
                    v141 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543362;
                    v220 = v141;
                    _os_log_impl(&dword_219D45000, v140, OS_LOG_TYPE_ERROR, "%{public}@personsModelPredictions is empty", buf, 0xCu);

                  }
                  objc_autoreleasePoolPop(v138);
                  v213 = CFSTR("FaceFilteredState");
                  HMIFaceFilteredStateAsString(4);
                  v142 = (void *)objc_claimAutoreleasedReturnValue();
                  v214 = v142;
                  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v214, &v213, 1);
                  v143 = objc_claimAutoreleasedReturnValue();

                  v144 = [HMIVideoAnalyzerEventFace alloc];
                  objc_msgSend(v12, "confidence");
                  v145 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v12, "boundingBox");
                  v147 = v146;
                  v149 = v148;
                  v151 = v150;
                  v153 = v152;
                  objc_msgSend(v12, "yaw");
                  v154 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v12, "roll");
                  v155 = (void *)objc_claimAutoreleasedReturnValue();
                  v193 = (HMIFaceCrop *)v145;
                  v156 = v145;
                  v157 = (void *)v143;
                  v66 = -[HMIVideoAnalyzerEventFace initWithConfidence:boundingBox:yaw:roll:faceRecognition:userInfo:](v144, "initWithConfidence:boundingBox:yaw:roll:faceRecognition:userInfo:", v156, v154, v155, 0, v143, v147, v149, v151, v153);
                  v16 = v194;
                  v89 = v192;
                }

                v87 = v188;
              }
              else
              {
                v66 = 0;
                v16 = v194;
              }

            }
            else
            {
              v66 = 0;
              v16 = v194;
            }

          }
          else
          {
            v45 = v39;
            v46 = (void *)MEMORY[0x220735570]();
            v47 = self;
            HMFGetOSLogHandle();
            v48 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "faceprint");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "confidence");
              *(_DWORD *)buf = 138543618;
              v220 = v49;
              v221 = 2048;
              v222 = v51;
              _os_log_impl(&dword_219D45000, v48, OS_LOG_TYPE_DEBUG, "%{public}@Face below ANFR face quality threshold: ANFR confidence = %lf, discarding", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v46);
            CVPixelBufferRelease(v15);
            v215 = CFSTR("FaceFilteredState");
            HMIFaceFilteredStateAsString(3);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v216 = v52;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v216, &v215, 1);
            v53 = (void *)objc_claimAutoreleasedReturnValue();

            v54 = [HMIVideoAnalyzerEventFace alloc];
            objc_msgSend(v12, "confidence");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "boundingBox");
            v57 = v56;
            v59 = v58;
            v61 = v60;
            v63 = v62;
            objc_msgSend(v12, "yaw");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "roll");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            v66 = -[HMIVideoAnalyzerEventFace initWithConfidence:boundingBox:yaw:roll:faceRecognition:userInfo:](v54, "initWithConfidence:boundingBox:yaw:roll:faceRecognition:userInfo:", v55, v64, v65, 0, v53, v57, v59, v61, v63);

            v16 = v194;
            v39 = v45;
          }
        }
        else
        {
          CVPixelBufferRelease(v15);
          v66 = 0;
          v16 = v194;
        }

      }
    }
    else
    {
      if (a7)
        *a7 = objc_retainAutorelease(v34);
      HMIErrorLog(self, v35);
      CVPixelBufferRelease(v15);
      v66 = 0;
    }

    v13 = v195;
  }
  else
  {
    v66 = 0;
  }

  return v66;
}

HMIFaceClassification *__78__HMIFaceClassifierVIP_classifyFaceEvent_pixelBuffer_fastMode_homeUUID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  float v5;
  float v6;
  double v7;
  uint64_t v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  HMIFaceClassification *v24;
  void *v25;
  void *v26;
  HMIFaceClassification *v27;
  uint64_t v28;
  double v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  double v38;
  uint64_t v39;
  uint64_t v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  double v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  double v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "confidence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = v5;

  v7 = v6;
  v8 = objc_msgSend(*(id *)(a1 + 32), "classificationThresholdKnown");
  if (v9 >= v7)
  {
    if (*(_BYTE *)(a1 + 88))
    {
      v20 = (void *)MEMORY[0x220735570](v8);
      v21 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = 138543362;
        v51 = v23;
        _os_log_impl(&dword_219D45000, v22, OS_LOG_TYPE_INFO, "%{public}@Face removed from unknown & uncertain bucket: has facemask", (uint8_t *)&v50, 0xCu);

      }
    }
    else
    {
      v28 = objc_msgSend(*(id *)(a1 + 48), "doubleValue");
      if (v29 >= 0.71)
      {
        v41 = objc_msgSend(*(id *)(a1 + 32), "classificationThresholdUnknown");
        if (v42 <= v7
          || (objc_msgSend(*(id *)(a1 + 56), "confidence"),
              v43 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v43, "value"),
              v45 = v44,
              v43,
              v45 <= 0.65))
        {
          v14 = (void *)MEMORY[0x220735570](v41);
          v15 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 56), "yaw");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = 138543618;
            v51 = v48;
            v52 = 2112;
            v53 = v49;
            _os_log_impl(&dword_219D45000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Added to uncertain bucket yaw: %@", (uint8_t *)&v50, 0x16u);

          }
          v10 = 0;
          v19 = 1;
        }
        else
        {
          v14 = (void *)MEMORY[0x220735570]();
          v15 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 56), "yaw");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = 138543618;
            v51 = v46;
            v52 = 2112;
            v53 = v47;
            _os_log_impl(&dword_219D45000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Added to unknown bucket yaw: %@", (uint8_t *)&v50, 0x16u);

          }
          v19 = 0;
          v10 = 0;
        }
        goto LABEL_8;
      }
      v20 = (void *)MEMORY[0x220735570](v28);
      v30 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 56), "confidence");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "value");
        v35 = v34;
        v36 = *(float *)(a1 + 80);
        objc_msgSend(*(id *)(a1 + 56), "yaw");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "doubleValue");
        v38 = *(float *)(a1 + 84);
        v50 = 138544386;
        v51 = v32;
        v52 = 2048;
        v53 = v35;
        v54 = 2048;
        v55 = v36;
        v56 = 2048;
        v57 = v39;
        v58 = 2048;
        v59 = v38;
        _os_log_impl(&dword_219D45000, v31, OS_LOG_TYPE_INFO, "%{public}@Face removed from unknown and uncertian bucket, SSD confidence = %f, entropy of laplacian = %f, Face yaw = %f, box size: %f", (uint8_t *)&v50, 0x34u);

      }
    }
    objc_autoreleasePoolPop(v20);
    v27 = 0;
    goto LABEL_20;
  }
  objc_msgSend(v3, "personUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "linkedEntityUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = *(void **)(a1 + 40);
    objc_msgSend(v3, "linkedEntityUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v13);

  }
  if (!*(_BYTE *)(a1 + 88))
  {
    v19 = 2;
    goto LABEL_14;
  }
  v14 = (void *)MEMORY[0x220735570]();
  v15 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sourceUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 138543874;
    v51 = v17;
    v52 = 2112;
    v53 = v18;
    v54 = 2112;
    v55 = *(double *)&v10;
    _os_log_impl(&dword_219D45000, v16, OS_LOG_TYPE_INFO, "%{public}@Positively classified face with facemask: (sourceUUID: %@, personUUID: %@)", (uint8_t *)&v50, 0x20u);

  }
  v19 = 2;
LABEL_8:

  objc_autoreleasePoolPop(v14);
LABEL_14:
  v24 = [HMIFaceClassification alloc];
  objc_msgSend(v3, "sourceUUID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "UUID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[HMIFaceClassification initWithUUID:sourceUUID:sessionEntityUUID:faceCrop:faceprint:confidence:familiarity:](v24, "initWithUUID:sourceUUID:sessionEntityUUID:faceCrop:faceprint:confidence:familiarity:", v10, v25, v26, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64), v19, v7);

LABEL_20:
  return v27;
}

BOOL __78__HMIFaceClassifierVIP_classifyFaceEvent_pixelBuffer_fastMode_homeUUID_error___block_invoke_42(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "familiarity") == 2;
}

- (HMIFaceprinter)faceprinter
{
  return (HMIFaceprinter *)objc_getProperty(self, a2, 8, 1);
}

- (HMIFaceQualityFilterSVM)faceRecognizabilityFilter
{
  return (HMIFaceQualityFilterSVM *)objc_getProperty(self, a2, 16, 1);
}

- (HMIFaceQualityFilterSVM)faceAestheticQualityFilter
{
  return (HMIFaceQualityFilterSVM *)objc_getProperty(self, a2, 24, 1);
}

- (double)classificationThresholdKnown
{
  return self->_classificationThresholdKnown;
}

- (double)classificationThresholdUnknown
{
  return self->_classificationThresholdUnknown;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceAestheticQualityFilter, 0);
  objc_storeStrong((id *)&self->_faceRecognizabilityFilter, 0);
  objc_storeStrong((id *)&self->_faceprinter, 0);
}

@end
