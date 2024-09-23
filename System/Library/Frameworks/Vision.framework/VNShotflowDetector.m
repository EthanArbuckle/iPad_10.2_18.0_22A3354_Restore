@implementation VNShotflowDetector

- (VNShotflowDetector)initWithNetwork:(id)a3 filterThresholds:(id)a4
{
  id v7;
  id v8;
  VNShotflowDetector *v9;
  VNShotflowDetector *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VNShotflowDetector;
  v9 = -[VNShotflowDetector init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_network, a3);
    v10->_nmsThreshold = 0.45;
    *(_QWORD *)&v10->_osfsThreshold = 0x3F4CCCCD3F0CCCCDLL;
    *(_QWORD *)&v10->_olmcsThreshold = 0x53E99999ALL;
    *(_QWORD *)&v10->_smartThreshold = 0x3F8000003F19999ALL;
    objc_storeStrong((id *)&v10->_filterThresholds, a4);
  }

  return v10;
}

- (VNShotflowDetector)initWithNetwork:(id)a3
{
  id v4;
  void *v5;
  VNShotflowDetector *v6;
  VNShotflowDetector *v7;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "filterThresholds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[VNShotflowDetector initWithNetwork:filterThresholds:](self, "initWithNetwork:filterThresholds:", v4, v5);

  if (v6)
    v7 = v6;

  return v6;
}

- (float)threshold
{
  float result;

  -[VNShotflowNetwork threshold](self->_network, "threshold");
  return result;
}

- (void)setThreshold:(float)a3
{
  -[VNShotflowNetwork setThreshold:](self->_network, "setThreshold:");
}

- (id)overlappingSmallFacesSuppression:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  id v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  double v18;
  double v19;
  id v21;
  unsigned __int8 v22;
  void *__p;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v21 = a3;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("confidence"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sortedArrayUsingDescriptors:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  v22 = 0;
  std::vector<BOOL>::vector(&__p, v7, &v22);
  -[VNShotflowDetector osfsThreshold](self, "osfsThreshold");
  v9 = v8;
  -[VNShotflowDetector osfsSizeRatio](self, "osfsSizeRatio");
  v11 = v10;
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v7)
  {
    v13 = 0;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *((_QWORD *)__p + (v13 >> 6));
      if ((v15 & (1 << v13)) != 0)
      {
        ++v13;
      }
      else
      {
        *((_QWORD *)__p + (v13 >> 6)) = v15 | (1 << v13);
        objc_msgSend(v12, "addObject:", v14);
        v16 = ++v13;
        if (v13 < v7)
        {
          do
          {
            if ((*((_QWORD *)__p + (v16 >> 6)) & (1 << v16)) == 0)
            {
              objc_msgSend(v6, "objectAtIndexedSubscript:", v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v18) = v9;
              LODWORD(v19) = v11;
              if (objc_msgSend(v14, "isOverlappingSmallFace:withOverlapThreshold:withSizeRatio:", v17, v18, v19))*((_QWORD *)__p + (v16 >> 6)) |= 1 << v16;

            }
            ++v16;
          }
          while (v7 != v16);
        }
      }

    }
    while (v13 != v7);
  }
  if (__p)
    operator delete(__p);

  return v12;
}

- (id)overlappingLowMergeCountSuppression:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  double v16;
  id v18;
  id v19;
  unsigned __int8 v20;
  void *__p;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v18 = a3;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("mergesCount"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sortedArrayUsingDescriptors:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  v20 = 0;
  std::vector<BOOL>::vector(&__p, v7, &v20);
  -[VNShotflowDetector olmcsThreshold](self, "olmcsThreshold");
  v9 = v8;
  v10 = -[VNShotflowDetector olmcsMergeCountDelta](self, "olmcsMergeCountDelta");
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v7)
  {
    v11 = 0;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *((_QWORD *)__p + (v11 >> 6));
      if ((v13 & (1 << v11)) != 0)
      {
        ++v11;
      }
      else
      {
        *((_QWORD *)__p + (v11 >> 6)) = v13 | (1 << v11);
        objc_msgSend(v19, "addObject:", v12);
        ++v11;
        if ((int)objc_msgSend(v12, "mergesCount") >= 11)
        {
          v14 = v11;
          if (v11 < v7)
          {
            do
            {
              if ((*((_QWORD *)__p + (v14 >> 6)) & (1 << v14)) == 0)
              {
                objc_msgSend(v6, "objectAtIndexedSubscript:", v14);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v16) = v9;
                if (objc_msgSend(v12, "isOverlappingLowMergeDet:withOverlapThreshold:withMergeCountDelta:", v15, v10, v16))*((_QWORD *)__p + (v14 >> 6)) |= 1 << v14;

              }
              ++v14;
            }
            while (v7 != v14);
          }
        }
      }

    }
    while (v11 != v7);
  }
  if (__p)
    operator delete(__p);

  return v19;
}

- (id)mergeBoxes:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  float v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  float v13;
  float v14;
  double v15;
  float v16;
  double v17;
  float v18;
  double v19;
  float v20;
  double v21;
  float v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  float v26;
  float v27;
  float v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  VNShotflowDetection *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  unsigned int v49;
  unsigned int v50;
  uint64_t v51;
  unsigned int v52;
  unsigned int v53;
  int v54;
  VNShotflowDetection *v55;
  uint64_t v57;
  id v58;
  id v59;
  double v60;
  double v61;
  double v62;
  float v63;
  double v64;
  float v65;
  unsigned __int8 v66;
  void *__p;
  _QWORD v68[3];

  v68[1] = *MEMORY[0x1E0C80C00];
  v58 = a3;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("confidence"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "sortedArrayUsingDescriptors:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  v66 = 0;
  std::vector<BOOL>::vector(&__p, v7, &v66);
  -[VNShotflowDetector nmsThreshold](self, "nmsThreshold");
  v65 = v8;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v59 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v9 = 0;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = *((_QWORD *)__p + (v9 >> 6));
      if ((v12 & (1 << v9)) != 0)
      {
        ++v9;
      }
      else
      {
        *((_QWORD *)__p + (v9 >> 6)) = v12 | (1 << v9);
        objc_msgSend(v10, "confidence");
        v14 = v13;
        objc_msgSend(v11, "box");
        *(float *)&v15 = v15;
        v16 = v14 * *(float *)&v15;
        *(float *)&v15 = v17;
        v18 = v14 * *(float *)&v15;
        *(float *)&v15 = v19;
        v20 = v14 * *(float *)&v15;
        *(float *)&v15 = v21;
        v22 = v14 * *(float *)&v15;
        ++v9;
        v23 = 1;
        if (v9 < v7)
        {
          v24 = v9;
          do
          {
            if ((*((_QWORD *)__p + (v24 >> 6)) & (1 << v24)) == 0)
            {
              objc_msgSend(v6, "objectAtIndexedSubscript:", v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "overlap:", v25);
              if (v26 > v65)
              {
                v63 = v14;
                v27 = v20;
                v28 = v18;
                *((_QWORD *)__p + (v24 >> 6)) |= 1 << v24;
                objc_msgSend(v25, "box");
                v30 = v29;
                v32 = v31;
                v34 = v33;
                v36 = v35;
                objc_msgSend(v25, "confidence");
                v37 = v30;
                v16 = v16 + (float)(v38 * v37);
                v39 = v32;
                v18 = v28 + (float)(v38 * v39);
                v40 = v34;
                v22 = v22 + (float)(v38 * v40);
                v41 = v36;
                v20 = v27 + (float)(v38 * v41);
                v14 = v63 + v38;
                v23 = (v23 + 1);
              }

            }
            ++v24;
          }
          while (v7 != v24);
        }
        v42 = v22;
        v43 = v16;
        v44 = [VNShotflowDetection alloc];
        objc_msgSend(v11, "defaultBox");
        v62 = v46;
        v64 = v45;
        v60 = v48;
        v61 = v47;
        objc_msgSend(v11, "confidence");
        v50 = v49;
        v51 = objc_msgSend(v11, "scale");
        objc_msgSend(v11, "rotationAngle");
        v53 = v52;
        objc_msgSend(v11, "yawAngle");
        LODWORD(v57) = v54;
        v55 = -[VNShotflowDetection initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:mergesCount:hasLabel:label:](v44, "initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:mergesCount:hasLabel:label:", v51, v23, objc_msgSend(v11, "hasLabel"), objc_msgSend(v11, "label"), (float)(v43 / v14), (float)(v18 / v14), (float)(v42 / v14), (float)(v20 / v14), v64, v62, v61, v60, __PAIR64__(v53, v50), v57);
        objc_msgSend(v59, "addObject:", v55);

      }
    }
    while (v9 != v7);
  }
  if (__p)
    operator delete(__p);

  return v59;
}

- (id)smartMergeBoxes:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  float v8;
  float v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  float v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  float v25;
  float v26;
  uint64_t v27;
  unint64_t v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  float v34;
  float v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  float v47;
  float v48;
  float v49;
  double v50;
  double v51;
  float v52;
  double v53;
  float v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  float v62;
  float v63;
  float v64;
  double v65;
  double v66;
  float v67;
  float v68;
  float v69;
  double v70;
  float v71;
  float v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  float v83;
  float v84;
  float v85;
  float v86;
  float v87;
  float v88;
  float v89;
  VNShotflowDetection *v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  unsigned int v99;
  unsigned int v100;
  uint64_t v101;
  unsigned int v102;
  unsigned int v103;
  int v104;
  VNShotflowDetection *v105;
  uint64_t v107;
  id v108;
  id v109;
  float v110;
  float v111;
  float v112;
  float v113;
  float v114;
  double v115;
  float v116;
  float v117;
  double v118;
  double v119;
  float v120;
  float v121;
  unsigned __int8 v122;
  void *__p;
  _QWORD v124[3];

  v124[1] = *MEMORY[0x1E0C80C00];
  v108 = a3;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("smartDistance"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v124[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v124, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "sortedArrayUsingDescriptors:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  v122 = 0;
  std::vector<BOOL>::vector(&__p, v7, &v122);
  -[VNShotflowDetector smartThreshold](self, "smartThreshold");
  v117 = v8;
  -[VNShotflowDetector smartDistanceFactor](self, "smartDistanceFactor");
  v116 = v9;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v109 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v10 = 0;
    v115 = (float)(1.0 - v117);
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = *((_QWORD *)__p + (v10 >> 6));
      if ((v13 & (1 << v10)) != 0)
      {
        ++v10;
      }
      else
      {
        *((_QWORD *)__p + (v10 >> 6)) = v13 | (1 << v10);
        objc_msgSend(v11, "confidence");
        v114 = v14;
        objc_msgSend(v12, "box");
        v16 = v15;
        v18 = v17;
        v20 = v19;
        v22 = v21;
        objc_msgSend(v12, "boxCenter");
        v118 = v24;
        v119 = v23;
        *(float *)&v23 = v20;
        v25 = v114 * *(float *)&v23;
        *(float *)&v23 = v22;
        v112 = v114 * *(float *)&v23;
        v113 = v25;
        *(float *)&v23 = v18;
        v26 = v114 * *(float *)&v23;
        *(float *)&v23 = v16;
        v110 = v114 * *(float *)&v23;
        v111 = v26;
        ++v10;
        v27 = 1;
        if (v10 < v7)
        {
          v28 = v10;
          do
          {
            if ((*((_QWORD *)__p + (v28 >> 6)) & (1 << v28)) == 0)
            {
              objc_msgSend(v6, "objectAtIndexedSubscript:", v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "boxCenter");
              v31 = v30;
              v33 = v32;
              objc_msgSend(v12, "overlap:", v29);
              v35 = v34;
              objc_msgSend(v12, "box");
              v37 = v36;
              objc_msgSend(v12, "box");
              v39 = v38;
              objc_msgSend(v29, "box");
              v41 = v40;
              objc_msgSend(v29, "box");
              v43 = v42;
              objc_msgSend(v12, "box");
              v45 = v44;
              objc_msgSend(v12, "box");
              v47 = v41 + v43;
              v48 = v45 + v46;
              if (v47 >= v48)
                v49 = v45 + v46;
              else
                v49 = v41 + v43;
              objc_msgSend(v29, "box");
              v51 = v50;
              v121 = v49;
              objc_msgSend(v12, "box");
              v52 = v51;
              v54 = v53;
              if (v52 >= v54)
                v54 = v51;
              v120 = v54;
              objc_msgSend(v29, "box");
              v56 = v55;
              objc_msgSend(v29, "box");
              v58 = v57;
              objc_msgSend(v12, "box");
              v60 = v59;
              objc_msgSend(v12, "box");
              v62 = v56 + v58;
              v63 = v60 + v61;
              if (v62 >= v63)
                v64 = v60 + v61;
              else
                v64 = v56 + v58;
              objc_msgSend(v29, "box");
              v66 = v65;
              objc_msgSend(v12, "box");
              v67 = sqrt((v119 - v31) * (v119 - v31) + (v118 - v33) * (v118 - v33));
              v68 = fmin(v37, v39);
              v69 = v66;
              v71 = v70;
              if (v69 >= v71)
                v72 = v66;
              else
                v72 = v71;
              if ((float)((float)(1.0 - sqrtf(v35)) + (float)((float)(v116 * v67) / v68)) < v117)
              {
                objc_msgSend(v12, "box");
                if (v73 * v115 <= fmaxf(v121 - v120, 0.0))
                {
                  objc_msgSend(v12, "box");
                  if (v74 * v115 <= fmaxf(v64 - v72, 0.0))
                  {
                    *((_QWORD *)__p + (v28 >> 6)) |= 1 << v28;
                    objc_msgSend(v29, "box");
                    v76 = v75;
                    v78 = v77;
                    v80 = v79;
                    v82 = v81;
                    objc_msgSend(v29, "confidence");
                    v83 = v76;
                    v85 = v110 + (float)(v84 * v83);
                    v86 = v78;
                    v110 = v85;
                    v111 = v111 + (float)(v84 * v86);
                    v87 = v80;
                    v88 = v113 + (float)(v84 * v87);
                    v89 = v82;
                    v112 = v112 + (float)(v84 * v89);
                    v113 = v88;
                    v114 = v114 + v84;
                    v27 = (v27 + 1);
                  }
                }
              }

            }
            ++v28;
          }
          while (v7 != v28);
        }
        v90 = [VNShotflowDetection alloc];
        objc_msgSend(v12, "defaultBox");
        v92 = v91;
        v94 = v93;
        v96 = v95;
        v98 = v97;
        objc_msgSend(v12, "confidence");
        v100 = v99;
        v101 = objc_msgSend(v12, "scale");
        objc_msgSend(v12, "rotationAngle");
        v103 = v102;
        objc_msgSend(v12, "yawAngle");
        LODWORD(v107) = v104;
        v105 = -[VNShotflowDetection initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:mergesCount:hasLabel:label:](v90, "initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:mergesCount:hasLabel:label:", v101, v27, objc_msgSend(v12, "hasLabel"), objc_msgSend(v12, "label"), (float)(v110 / v114), (float)(v111 / v114), (float)(v113 / v114), (float)(v112 / v114), v92, v94, v96, v98, __PAIR64__(v103, v100), v107);
        objc_msgSend(v109, "addObject:", v105);

      }
    }
    while (v10 != v7);
  }
  if (__p)
    operator delete(__p);

  return v109;
}

- (id)nmsBoxes:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("This method should not be invoked directly. Derived classes are responsible for providing correct implementation"));
  return 0;
}

- (id)sortBoxes:(id)a3 filterThresholdIndex:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__VNShotflowDetector_sortBoxes_filterThresholdIndex___block_invoke;
  v12[3] = &__block_descriptor_40_e46_B24__0__VNShotflowDetection_8__NSDictionary_16l;
  v12[4] = a4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("confidence"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingDescriptors:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)filterBoxes:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  int v17;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = 0;
  v7 = MEMORY[0x1E0C809B0];
  while (1)
  {
    -[VNShotflowDetector filterThresholds](self, "filterThresholds");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v6 >= v9)
      break;
    -[VNShotflowDetector filterThresholds](self, "filterThresholds");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "floatValue");
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __34__VNShotflowDetector_filterBoxes___block_invoke;
    v16[3] = &__block_descriptor_44_e46_B24__0__VNShotflowDetection_8__NSDictionary_16l;
    v17 = v12;
    v16[4] = v6;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "filteredArrayUsingPredicate:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObjectsFromArray:", v14);
    ++v6;
  }

  return v5;
}

- (id)detect:(const vImage_Buffer *)a3 inputIsBGR:(BOOL)a4
{
  VNShotflowNetwork *network;
  __int128 v5;
  _OWORD v7[2];

  network = self->_network;
  v5 = *(_OWORD *)&a3->width;
  v7[0] = *(_OWORD *)&a3->data;
  v7[1] = v5;
  -[VNShotflowNetwork resizeAndProcessVImage:inputIsBGR:](network, "resizeAndProcessVImage:inputIsBGR:", v7, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)processBoxes:(id)a3 withHeight:(float)a4 andWidth:(float)a5
{
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  _BOOL8 v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  VNANFDDetectedObject *v22;
  unsigned int v23;
  unsigned int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  VNANFDDetectedObject *v36;
  id v38;
  double v39;
  double v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v38, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v8 = v38;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v42;
    v39 = a4;
    v40 = a5;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v42 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "label") != 1;
        objc_msgSend(v12, "box");
        v15 = v14;
        objc_msgSend(v12, "box");
        v17 = v16;
        objc_msgSend(v12, "box");
        v19 = v18;
        objc_msgSend(v12, "box");
        v21 = v20;
        v22 = [VNANFDDetectedObject alloc];
        objc_msgSend(v12, "confidence");
        v24 = v23;
        objc_msgSend(v12, "rotationAngle");
        v26 = v25;
        objc_msgSend(v12, "yawAngle");
        v28 = v27;
        objc_msgSend(v12, "pitchAngle");
        v30 = v29;
        v31 = objc_msgSend(v12, "label");
        v32 = objc_msgSend(v12, "groupId");
        LODWORD(v33) = v26;
        LODWORD(v34) = v28;
        LODWORD(v35) = v30;
        v36 = -[VNANFDDetectedObject initWithObjectType:boundingBox:confidence:rotationAngle:yawAngle:pitchAngle:labelKey:groupId:](v22, "initWithObjectType:boundingBox:confidence:rotationAngle:yawAngle:pitchAngle:labelKey:groupId:", v13, v31, v32, v15 * v40, v39 - (v19 * v39 + v21 * v39), v17 * v40, v21 * v39, COERCE_DOUBLE(__PAIR64__(HIDWORD(v39), v24)), v33, v34, v35);
        objc_msgSend(v7, "addObject:", v36);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v9);
  }

  return v7;
}

- (id)detectAndProcessObjects:(const vImage_Buffer *)a3 inputIsBGR:(BOOL)a4
{
  void *v6;
  double v7;
  double v8;
  void *v9;

  -[VNShotflowDetector detect:inputIsBGR:](self, "detect:inputIsBGR:", a3, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = (float)a3->height;
  *(float *)&v8 = (float)a3->width;
  -[VNShotflowDetector processBoxes:withHeight:andWidth:](self, "processBoxes:withHeight:andWidth:", v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)enforceSquareFaces:(id)a3 withHeight:(float)a4 andWidth:(float)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  float v19;
  float v20;
  double v21;
  double v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  v9 = 0;
  if (a4 != 0.0 && a5 != 0.0)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          if (objc_msgSend(v14, "label", (_QWORD)v24) == 1)
          {
            objc_msgSend(v14, "box");
            v16 = v15;
            v18 = v17;
            objc_msgSend(v14, "boxCenter");
            v19 = v16;
            v20 = v18;
            *(float *)&v21 = v21;
            *(float *)&v22 = v22;
            objc_msgSend(v14, "setBox:", (float)(*(float *)&v21- (float)((float)((float)((float)((float)(v20 * a4) + (float)(v19 * a5)) * 0.5) / a5) * 0.5)), (float)(*(float *)&v22- (float)((float)((float)((float)((float)(v20 * a4) + (float)(v19 * a5)) * 0.5) / a4) * 0.5)), (float)((float)((float)((float)(v20 * a4) + (float)(v19 * a5)) * 0.5) / a5), (float)((float)((float)((float)(v20 * a4) + (float)(v19 * a5)) * 0.5) / a4));
          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v11);
    }

    v9 = v10;
  }

  return v9;
}

- (float)nmsThreshold
{
  return self->_nmsThreshold;
}

- (void)setNmsThreshold:(float)a3
{
  self->_nmsThreshold = a3;
}

- (NSArray)filterThresholds
{
  return self->_filterThresholds;
}

- (void)setFilterThresholds:(id)a3
{
  objc_storeStrong((id *)&self->_filterThresholds, a3);
}

- (float)osfsThreshold
{
  return self->_osfsThreshold;
}

- (void)setOsfsThreshold:(float)a3
{
  self->_osfsThreshold = a3;
}

- (float)osfsSizeRatio
{
  return self->_osfsSizeRatio;
}

- (void)setOsfsSizeRatio:(float)a3
{
  self->_osfsSizeRatio = a3;
}

- (float)olmcsThreshold
{
  return self->_olmcsThreshold;
}

- (void)setOlmcsThreshold:(float)a3
{
  self->_olmcsThreshold = a3;
}

- (int)olmcsMergeCountDelta
{
  return self->_olmcsMergeCountDelta;
}

- (void)setOlmcsMergeCountDelta:(int)a3
{
  self->_olmcsMergeCountDelta = a3;
}

- (float)smartThreshold
{
  return self->_smartThreshold;
}

- (void)setSmartThreshold:(float)a3
{
  self->_smartThreshold = a3;
}

- (float)smartDistanceFactor
{
  return self->_smartDistanceFactor;
}

- (void)setSmartDistanceFactor:(float)a3
{
  self->_smartDistanceFactor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterThresholds, 0);
  objc_storeStrong((id *)&self->_network, 0);
}

BOOL __34__VNShotflowDetector_filterBoxes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  float v4;
  _BOOL8 v5;

  v3 = a2;
  objc_msgSend(v3, "confidence");
  v5 = v4 >= *(float *)(a1 + 40) && objc_msgSend(v3, "label") == *(_DWORD *)(a1 + 32) + 1;

  return v5;
}

BOOL __53__VNShotflowDetector_sortBoxes_filterThresholdIndex___block_invoke(uint64_t a1, void *a2)
{
  return *(_QWORD *)(a1 + 32) + 1 == (int)objc_msgSend(a2, "label");
}

+ (NSString)inputLayerName
{
  return (NSString *)objc_msgSend((id)objc_msgSend(a1, "VNShotflowNetworkClass"), "inputLayerName");
}

+ (NSString)modelName
{
  return (NSString *)objc_msgSend((id)objc_msgSend(a1, "VNShotflowNetworkClass"), "modelName");
}

+ (CGSize)inputImageSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend((id)objc_msgSend(a1, "VNShotflowNetworkClass"), "inputImageSize");
  result.height = v3;
  result.width = v2;
  return result;
}

+ (float)inputImageMinDimension
{
  float result;

  objc_msgSend((id)objc_msgSend(a1, "VNShotflowNetworkClass"), "inputImageMinDimension");
  return result;
}

+ (float)inputImageMaxDimension
{
  float result;

  objc_msgSend((id)objc_msgSend(a1, "VNShotflowNetworkClass"), "inputImageMaxDimension");
  return result;
}

+ (float)inputImageAspectRatio
{
  float result;

  objc_msgSend((id)objc_msgSend(a1, "VNShotflowNetworkClass"), "inputImageAspectRatio");
  return result;
}

+ (NSSet)supportedLabelKeys
{
  _QWORD *v2;
  void *v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  void *v7;

  v2 = (_QWORD *)objc_msgSend((id)objc_msgSend(a1, "VNShotflowNetworkClass"), "importantClasses");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", (uint64_t)(v2[1] - *v2) >> 3);
  v4 = (_QWORD *)*v2;
  v5 = (_QWORD *)v2[1];
  if ((_QWORD *)*v2 != v5)
  {
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v6);

      ++v4;
    }
    while (v4 != v5);
  }
  v7 = (void *)objc_msgSend(v3, "copy");

  return (NSSet *)v7;
}

+ (id)processingDeviceDetectorWithModelPath:(id)a3 networkThreshold:(float)a4 filterThresholds:(id)a5 preferredDeviceID:(int)a6 engineID:(int)a7 storageType:(int)a8
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v14;
  id v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;

  v8 = *(_QWORD *)&a8;
  v9 = *(_QWORD *)&a7;
  v10 = *(_QWORD *)&a6;
  v14 = a3;
  v15 = a5;
  v16 = (void *)objc_msgSend(a1, "VNShotflowNetworkClass");
  *(float *)&v17 = a4;
  objc_msgSend(v16, "processingDeviceNetworkWithModelPath:threshold:preferredDeviceID:engineID:storageType:", v14, v10, v9, v8, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithNetwork:filterThresholds:", v18, v15);

  return v19;
}

+ (id)processingDeviceDetectorWithModelPath:(id)a3 preferredDeviceID:(int)a4 engineID:(int)a5 storageType:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(a1, "VNShotflowNetworkClass");
  objc_msgSend(a1, "networkThreshold");
  objc_msgSend(v11, "processingDeviceNetworkWithModelPath:threshold:preferredDeviceID:engineID:storageType:", v10, v8, v7, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithNetwork:", v12);

  return v13;
}

+ (id)processingDeviceDetectorWithEspressoNetwork:(id)a3 espressoPlan:(void *)a4 networkThreshold:(float)a5 filterThresholds:(id)a6
{
  uint64_t v8;
  void *var0;
  id v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;

  v8 = *(_QWORD *)&a3.var1;
  var0 = a3.var0;
  v11 = a6;
  v12 = (void *)objc_msgSend(a1, "VNShotflowNetworkClass");
  *(float *)&v13 = a5;
  objc_msgSend(v12, "processingDeviceDetectorWithEspressoNetwork:espressoPlan:threshold:", var0, v8, a4, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithNetwork:filterThresholds:", v14, v11);

  return v15;
}

+ (id)processingDeviceDetectorWithEspressoNetwork:(id)a3 espressoPlan:(void *)a4
{
  uint64_t v5;
  void *var0;
  void *v8;
  void *v9;
  void *v10;

  v5 = *(_QWORD *)&a3.var1;
  var0 = a3.var0;
  v8 = (void *)objc_msgSend(a1, "VNShotflowNetworkClass");
  objc_msgSend(a1, "networkThreshold");
  objc_msgSend(v8, "processingDeviceDetectorWithEspressoNetwork:espressoPlan:threshold:", var0, v5, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithNetwork:", v9);

  return v10;
}

+ (float)networkThreshold
{
  return 0.1;
}

+ (CGSize)getSuggestedImageSize:(CGSize)a3
{
  double v3;
  double v4;
  double height;
  double width;
  double v7;
  double v8;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  v3 = *MEMORY[0x1E0C9D820];
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (a3.width >= a3.height)
    height = a3.height;
  else
    height = a3.width;
  if (a3.height >= a3.width)
    width = a3.height;
  else
    width = a3.width;
  if (height != 0.0 && width != 0.0)
  {
    v7 = a3.height;
    v8 = a3.width;
    objc_msgSend(a1, "inputImageMinDimension");
    if (v10 != 0.0)
    {
      objc_msgSend(a1, "inputImageMaxDimension");
      v12 = v11;
      objc_msgSend(a1, "inputImageMinDimension");
      if (width / height >= (float)(v12 / v13))
      {
        objc_msgSend(a1, "inputImageMaxDimension");
        height = width;
      }
      else
      {
        objc_msgSend(a1, "inputImageMinDimension");
      }
      v15 = v14 / height;
      v3 = round(v8 * v15);
      v4 = round(v7 * v15);
    }
  }
  v16 = v3;
  v17 = v4;
  result.height = v17;
  result.width = v16;
  return result;
}

@end
