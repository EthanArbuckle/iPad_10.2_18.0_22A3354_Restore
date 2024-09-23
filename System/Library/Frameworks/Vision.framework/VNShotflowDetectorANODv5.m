@implementation VNShotflowDetectorANODv5

+ (id)supportedLabelKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__VNShotflowDetectorANODv5_supportedLabelKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNShotflowDetectorANODv5 supportedLabelKeys]::onceToken != -1)
    dispatch_once(&+[VNShotflowDetectorANODv5 supportedLabelKeys]::onceToken, block);
  return (id)+[VNShotflowDetectorANODv5 supportedLabelKeys]::supportedLabelKeys;
}

+ (Class)VNShotflowNetworkClass
{
  return (Class)objc_opt_class();
}

+ (id)filterThresholds
{
  if (+[VNShotflowDetectorANODv5 filterThresholds]::onceToken != -1)
    dispatch_once(&+[VNShotflowDetectorANODv5 filterThresholds]::onceToken, &__block_literal_global_216);
  return (id)+[VNShotflowDetectorANODv5 filterThresholds]::filterThresholds;
}

void __44__VNShotflowDetectorANODv5_filterThresholds__block_invoke()
{
  void *v0;

  v0 = (void *)+[VNShotflowDetectorANODv5 filterThresholds]::filterThresholds;
  +[VNShotflowDetectorANODv5 filterThresholds]::filterThresholds = (uint64_t)&unk_1E459E0A8;

}

void __46__VNShotflowDetectorANODv5_supportedLabelKeys__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  objc_super v3;

  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)&OBJC_METACLASS___VNShotflowDetectorANODv5;
  objc_msgSendSuper2(&v3, sel_supportedLabelKeys);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)+[VNShotflowDetectorANODv5 supportedLabelKeys]::supportedLabelKeys;
  +[VNShotflowDetectorANODv5 supportedLabelKeys]::supportedLabelKeys = v1;

}

- (VNShotflowDetectorANODv5)initWithNetwork:(id)a3 filterThresholds:(id)a4
{
  VNShotflowDetectorANODv5 *v4;
  VNShotflowDetectorANODv5 *v5;
  VNShotflowDetectorANODv5 *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VNShotflowDetectorANODv5;
  v4 = -[VNShotflowDetector initWithNetwork:filterThresholds:](&v8, sel_initWithNetwork_filterThresholds_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->super.super._nmsThreshold = 0.3;
    v4->_petFaceThreshold = 0.7;
    v4->_faceBodyDistanceThreshold = 0.07;
    v6 = v4;
  }

  return v5;
}

- (VNShotflowDetectorANODv5)initWithNetwork:(id)a3
{
  VNShotflowDetectorANODv5 *v3;
  VNShotflowDetectorANODv5 *v4;
  VNShotflowDetectorANODv5 *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNShotflowDetectorANODv5;
  v3 = -[VNShotflowDetector initWithNetwork:](&v7, sel_initWithNetwork_, a3);
  v4 = v3;
  if (v3)
  {
    v3->super.super._nmsThreshold = 0.3;
    v3->_petFaceThreshold = 0.7;
    v3->_faceBodyDistanceThreshold = 0.07;
    v5 = v3;
  }

  return v4;
}

- (id)processBoxes:(id)a3 withHeight:(float)a4 andWidth:(float)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  objc_super v22;

  v8 = a3;
  v9 = (void *)MEMORY[0x1A1B0B060]();
  -[VNShotflowDetector filterBoxes:](self, "filterBoxes:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[VNShotflowDetectorANODv5 nmsBoxes:](self, "nmsBoxes:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  *(float *)&v12 = a4;
  *(float *)&v13 = a5;
  -[VNShotflowDetector enforceSquareFaces:withHeight:andWidth:](self, "enforceSquareFaces:withHeight:andWidth:", v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[VNShotflowDetectorANODBase mergeHeadsBoxes:](self, "mergeHeadsBoxes:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[VNShotflowDetectorANODv5 analyzePetFaces:](self, "analyzePetFaces:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[VNShotflowDetectorANODv5 groupFaceBody:](self, "groupFaceBody:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v9);
  v22.receiver = self;
  v22.super_class = (Class)VNShotflowDetectorANODv5;
  *(float *)&v18 = a4;
  *(float *)&v19 = a5;
  -[VNShotflowDetector processBoxes:withHeight:andWidth:](&v22, sel_processBoxes_withHeight_andWidth_, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)getIndexBoxes:(id)a3 filterThresholdIndex:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__VNShotflowDetectorANODv5_getIndexBoxes_filterThresholdIndex___block_invoke;
  v9[3] = &__block_descriptor_40_e46_B24__0__VNShotflowDetection_8__NSDictionary_16l;
  v9[4] = a4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)nmsBoxes:(id)a3
{
  float v4;
  float v5;
  unint64_t i;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  float v16;
  id v18;
  id v19;
  unsigned __int8 v20;
  void *__p;

  v18 = a3;
  -[VNShotflowDetector nmsThreshold](self, "nmsThreshold");
  v5 = v4;
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  for (i = 0; ; ++i)
  {
    -[VNShotflowDetector filterThresholds](self, "filterThresholds");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (i >= v8)
      break;
    if (i)
    {
      -[VNShotflowDetectorANODv5 getIndexBoxes:filterThresholdIndex:](self, "getIndexBoxes:filterThresholdIndex:", v18, i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObjectsFromArray:", v9);
    }
    else
    {
      -[VNShotflowDetector sortBoxes:filterThresholdIndex:](self, "sortBoxes:filterThresholdIndex:", v18, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");
      v20 = 0;
      std::vector<BOOL>::vector(&__p, v10, &v20);
      if (v10)
      {
        v11 = 0;
        do
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
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
            v14 = ++v11;
            if (v11 < v10)
            {
              do
              {
                if ((*((_QWORD *)__p + (v14 >> 6)) & (1 << v14)) == 0)
                {
                  objc_msgSend(v9, "objectAtIndexedSubscript:", v14);
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v12, "intersectionOverMinArea:", v15);
                  if (v16 > v5)
                    *((_QWORD *)__p + (v14 >> 6)) |= 1 << v14;

                }
                ++v14;
              }
              while (v10 != v14);
            }
          }

        }
        while (v11 != v10);
      }
      if (__p)
        operator delete(__p);
    }

  }
  return v19;
}

- (id)analyzePetFaces:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  float v9;
  float v10;
  float v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  float v17;
  float v18;
  float v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (objc_msgSend(v8, "label") == 10)
        {
          objc_msgSend(v8, "petFaceScore");
          v10 = v9;
          -[VNShotflowDetectorANODv5 petFaceThreshold](self, "petFaceThreshold");
          if (v10 > v11)
            objc_msgSend(v8, "setLabel:", 14);
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v5);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = v4;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
        if (objc_msgSend(v16, "label", (_QWORD)v21) == 9)
        {
          objc_msgSend(v16, "petFaceScore");
          v18 = v17;
          -[VNShotflowDetectorANODv5 petFaceThreshold](self, "petFaceThreshold");
          if (v18 > v19)
            objc_msgSend(v16, "setLabel:", 13);
        }
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v13);
  }

  return v12;
}

- (id)groupFaceBody:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  float v18;
  float v19;
  unsigned int v20;
  float v21;
  uint64_t v22;
  int v23;
  void *v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  void *v30;
  id v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  float v35;
  float v36;
  unsigned int v37;
  float v38;
  uint64_t v39;
  int v40;
  void *v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  id v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  float v61;
  float v62;
  unsigned int v63;
  float v64;
  uint64_t v65;
  int v66;
  void *v67;
  float v68;
  float v69;
  float v70;
  float v71;
  float v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  double v79;
  double v80;
  double v81;
  double v82;
  id v83;
  uint64_t v84;
  int v85;
  uint64_t v86;
  float v87;
  float v88;
  unsigned int v89;
  float v90;
  uint64_t v91;
  int v92;
  void *v93;
  float v94;
  float v95;
  float v96;
  float v97;
  float v98;
  void *v99;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  id v105;
  id v106;
  uint64_t v107;
  id obj;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  int v119;
  int v120;
  int v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  _BYTE v150[128];
  _BYTE v151[128];
  _BYTE v152[128];
  _BYTE v153[128];
  _BYTE v154[128];
  _BYTE v155[128];
  _BYTE v156[128];
  uint64_t v157;

  v157 = *MEMORY[0x1E0C80C00];
  v104 = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_230);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "filteredArrayUsingPredicate:", v3);
  v103 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_231);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "filteredArrayUsingPredicate:", v4);
  v114 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_232);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "filteredArrayUsingPredicate:", v5);
  v113 = (void *)objc_claimAutoreleasedReturnValue();

  v148 = 0u;
  v149 = 0u;
  v146 = 0u;
  v147 = 0u;
  obj = v103;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v146, v156, 16);
  if (v6)
  {
    v111 = *(_QWORD *)v147;
    v7 = 1;
    do
    {
      v115 = v6;
      for (i = 0; i != v115; ++i)
      {
        if (*(_QWORD *)v147 != v111)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v146 + 1) + 8 * i);
        objc_msgSend(v9, "setGroupId:", v7);
        objc_msgSend(v9, "boxCenter");
        v11 = v10;
        v13 = v12;
        v144 = 0u;
        v145 = 0u;
        v142 = 0u;
        v143 = 0u;
        v14 = v114;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v142, v155, 16);
        v119 = v7;
        if (v15)
        {
          v16 = 0;
          v17 = *(_QWORD *)v143;
          v20 = -1;
          v21 = 1000000.0;
          do
          {
            v22 = 0;
            v23 = v16;
            v16 += v15;
            do
            {
              if (*(_QWORD *)v143 != v17)
                objc_enumerationMutation(v14);
              v24 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * v22);
              if (!objc_msgSend(v24, "groupId"))
              {
                objc_msgSend(v24, "associatedX");
                v26 = v25;
                objc_msgSend(v24, "associatedY");
                v18 = v11;
                v19 = v13;
                v28 = vabds_f32(v26, v18) + vabds_f32(v27, v19);
                if (v28 < v21)
                {
                  v20 = v23 + v22;
                  v21 = v28;
                }
              }
              ++v22;
            }
            while (v15 != v22);
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v142, v155, 16);
          }
          while (v15);
        }
        else
        {
          v20 = -1;
          v21 = 1000000.0;
        }

        -[VNShotflowDetectorANODv5 faceBodyDistanceThreshold](self, "faceBodyDistanceThreshold");
        if (v21 < v29 && (v20 & 0x80000000) == 0)
        {
          objc_msgSend(v14, "objectAtIndexedSubscript:", v20);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setGroupId:", objc_msgSend(v9, "groupId"));

        }
        v140 = 0u;
        v141 = 0u;
        v138 = 0u;
        v139 = 0u;
        v31 = v113;
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v138, v154, 16);
        if (v32)
        {
          v33 = 0;
          v34 = *(_QWORD *)v139;
          v35 = v11;
          v36 = v13;
          v37 = -1;
          v38 = 1000000.0;
          do
          {
            v39 = 0;
            v40 = v33;
            v33 += v32;
            do
            {
              if (*(_QWORD *)v139 != v34)
                objc_enumerationMutation(v31);
              v41 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * v39);
              if (!objc_msgSend(v41, "groupId"))
              {
                objc_msgSend(v41, "associatedX");
                v43 = v42;
                objc_msgSend(v41, "associatedY");
                v45 = vabds_f32(v43, v35) + vabds_f32(v44, v36);
                if (v45 < v38)
                {
                  v37 = v40 + v39;
                  v38 = v45;
                }
              }
              ++v39;
            }
            while (v32 != v39);
            v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v138, v154, 16);
          }
          while (v32);
        }
        else
        {
          v37 = -1;
          v38 = 1000000.0;
        }

        -[VNShotflowDetectorANODv5 faceBodyDistanceThreshold](self, "faceBodyDistanceThreshold");
        if (v38 < v46 && (v37 & 0x80000000) == 0)
        {
          objc_msgSend(v31, "objectAtIndexedSubscript:", v37);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "setGroupId:", objc_msgSend(v9, "groupId"));

        }
        v7 = (v119 + 1);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v146, v156, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 1;
  }

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_233);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "filteredArrayUsingPredicate:", v48);
  v102 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_234);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "filteredArrayUsingPredicate:", v49);
  v112 = (void *)objc_claimAutoreleasedReturnValue();

  v136 = 0u;
  v137 = 0u;
  v134 = 0u;
  v135 = 0u;
  v106 = v102;
  v50 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v134, v153, 16);
  if (v50)
  {
    v109 = *(_QWORD *)v135;
    do
    {
      v51 = 0;
      v116 = v50;
      do
      {
        if (*(_QWORD *)v135 != v109)
          objc_enumerationMutation(v106);
        v52 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * v51);
        objc_msgSend(v52, "setGroupId:", v7);
        objc_msgSend(v52, "boxCenter");
        v54 = v53;
        v56 = v55;
        v132 = 0u;
        v133 = 0u;
        v130 = 0u;
        v131 = 0u;
        v57 = v112;
        v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v130, v152, 16);
        v120 = v7;
        if (v58)
        {
          v59 = 0;
          v60 = *(_QWORD *)v131;
          v61 = v54;
          v62 = v56;
          v63 = -1;
          v64 = 1000000.0;
          do
          {
            v65 = 0;
            v66 = v59;
            v59 += v58;
            do
            {
              if (*(_QWORD *)v131 != v60)
                objc_enumerationMutation(v57);
              v67 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * v65);
              if (!objc_msgSend(v67, "groupId"))
              {
                objc_msgSend(v67, "associatedX");
                v69 = v68;
                objc_msgSend(v67, "associatedY");
                v71 = vabds_f32(v69, v61) + vabds_f32(v70, v62);
                if (v71 < v64)
                {
                  v64 = v71;
                  v63 = v66 + v65;
                }
              }
              ++v65;
            }
            while (v58 != v65);
            v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v130, v152, 16);
          }
          while (v58);
        }
        else
        {
          v63 = -1;
          v64 = 1000000.0;
        }

        -[VNShotflowDetectorANODv5 faceBodyDistanceThreshold](self, "faceBodyDistanceThreshold");
        if (v64 < v72 && (v63 & 0x80000000) == 0)
        {
          objc_msgSend(v57, "objectAtIndexedSubscript:", v63);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "setGroupId:", objc_msgSend(v52, "groupId"));

        }
        v7 = (v120 + 1);
        ++v51;
      }
      while (v51 != v116);
      v50 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v134, v153, 16);
    }
    while (v50);
  }

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_235);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "filteredArrayUsingPredicate:", v74);
  v101 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_236);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "filteredArrayUsingPredicate:", v75);
  v110 = (void *)objc_claimAutoreleasedReturnValue();

  v128 = 0u;
  v129 = 0u;
  v126 = 0u;
  v127 = 0u;
  v105 = v101;
  v76 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v126, v151, 16);
  if (v76)
  {
    v107 = *(_QWORD *)v127;
    do
    {
      v77 = 0;
      v117 = v76;
      do
      {
        if (*(_QWORD *)v127 != v107)
          objc_enumerationMutation(v105);
        v78 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * v77);
        objc_msgSend(v78, "setGroupId:", v7);
        objc_msgSend(v78, "boxCenter");
        v80 = v79;
        v82 = v81;
        v124 = 0u;
        v125 = 0u;
        v122 = 0u;
        v123 = 0u;
        v83 = v110;
        v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v122, v150, 16);
        v121 = v7;
        if (v84)
        {
          v85 = 0;
          v86 = *(_QWORD *)v123;
          v87 = v80;
          v88 = v82;
          v89 = -1;
          v90 = 1000000.0;
          do
          {
            v91 = 0;
            v92 = v85;
            v85 += v84;
            do
            {
              if (*(_QWORD *)v123 != v86)
                objc_enumerationMutation(v83);
              v93 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * v91);
              if (!objc_msgSend(v93, "groupId"))
              {
                objc_msgSend(v93, "associatedX");
                v95 = v94;
                objc_msgSend(v93, "associatedY");
                v97 = vabds_f32(v95, v87) + vabds_f32(v96, v88);
                if (v97 < v90)
                {
                  v90 = v97;
                  v89 = v92 + v91;
                }
              }
              ++v91;
            }
            while (v84 != v91);
            v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v122, v150, 16);
          }
          while (v84);
        }
        else
        {
          v89 = -1;
          v90 = 1000000.0;
        }

        -[VNShotflowDetectorANODv5 faceBodyDistanceThreshold](self, "faceBodyDistanceThreshold");
        if (v90 < v98 && (v89 & 0x80000000) == 0)
        {
          objc_msgSend(v83, "objectAtIndexedSubscript:", v89);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "setGroupId:", objc_msgSend(v78, "groupId"));

        }
        v7 = (v121 + 1);
        ++v77;
      }
      while (v77 != v117);
      v76 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v126, v151, 16);
    }
    while (v76);
  }

  return v104;
}

- (float)petFaceThreshold
{
  return self->_petFaceThreshold;
}

- (void)setPetFaceThreshold:(float)a3
{
  self->_petFaceThreshold = a3;
}

- (float)faceBodyDistanceThreshold
{
  return self->_faceBodyDistanceThreshold;
}

- (void)setFaceBodyDistanceThreshold:(float)a3
{
  self->_faceBodyDistanceThreshold = a3;
}

BOOL __42__VNShotflowDetectorANODv5_groupFaceBody___block_invoke_7(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "label") == 14 || objc_msgSend(v2, "label") == 10;

  return v3;
}

BOOL __42__VNShotflowDetectorANODv5_groupFaceBody___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "label") == 5;
}

BOOL __42__VNShotflowDetectorANODv5_groupFaceBody___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "label") == 13 || objc_msgSend(v2, "label") == 9;

  return v3;
}

BOOL __42__VNShotflowDetectorANODv5_groupFaceBody___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "label") == 4;
}

BOOL __42__VNShotflowDetectorANODv5_groupFaceBody___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "label") == 12;
}

BOOL __42__VNShotflowDetectorANODv5_groupFaceBody___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "label") == 1 || objc_msgSend(v2, "label") == 2;

  return v3;
}

BOOL __42__VNShotflowDetectorANODv5_groupFaceBody___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "label") == 3;
}

BOOL __63__VNShotflowDetectorANODv5_getIndexBoxes_filterThresholdIndex___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "label") == *(_DWORD *)(a1 + 32) + 1;
}

@end
