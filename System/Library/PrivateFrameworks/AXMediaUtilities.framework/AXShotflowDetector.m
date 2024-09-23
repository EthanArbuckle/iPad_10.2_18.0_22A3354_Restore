@implementation AXShotflowDetector

+ (id)cpuDetectorWithModelPath:(id)a3 configuration:(id)a4 version:(int)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  double v15;
  void *v16;

  v5 = *(_QWORD *)&a5;
  v8 = a4;
  +[AXShotflowNetwork cpuNetworkWithModelPath:configuration:version:modelType:](AXShotflowNetwork, "cpuNetworkWithModelPath:configuration:version:modelType:", a3, v8, v5, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc((Class)a1);
  objc_msgSend(v8, "nmsThreshold");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatValue");
  v13 = v12;
  objc_msgSend(v8, "filterThresholds");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = v13;
  v16 = (void *)objc_msgSend(v10, "initWithNetwork:nmsThreshold:filterThreshold:", v9, v14, v15);

  return v16;
}

+ (id)gpuDetectorWithModelPath:(id)a3 configuration:(id)a4 preferredMetalDeviceID:(int)a5 version:(int)a6 modelType:(int64_t)a7
{
  uint64_t v8;
  uint64_t v9;
  id v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  int v17;
  void *v18;
  double v19;
  void *v20;

  v8 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a5;
  v12 = a4;
  +[AXShotflowNetwork gpuNetworkWithModelPath:configuration:preferredMetalDeviceID:version:modelType:](AXShotflowNetwork, "gpuNetworkWithModelPath:configuration:preferredMetalDeviceID:version:modelType:", a3, v12, v9, v8, a7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc((Class)a1);
  objc_msgSend(v12, "nmsThreshold");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "floatValue");
  v17 = v16;
  objc_msgSend(v12, "filterThresholds");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v19) = v17;
  v20 = (void *)objc_msgSend(v14, "initWithNetwork:nmsThreshold:filterThreshold:", v13, v18, v19);

  return v20;
}

- (AXShotflowDetector)initWithNetwork:(id)a3 nmsThreshold:(float)a4 filterThreshold:(id)a5
{
  id v9;
  id v10;
  AXShotflowDetector *v11;
  AXShotflowDetector *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AXShotflowDetector;
  v11 = -[AXShotflowDetector init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_network, a3);
    v12->_nmsThreshold = a4;
    *(_OWORD *)&v12->_mergeHeadsThreshold = xmmword_1B0EFF7E0;
    v12->_olmcsMergeCountDelta = 5;
    *(_QWORD *)&v12->_smartThreshold = 0x3F8000003F19999ALL;
    objc_storeStrong((id *)&v12->_filterThreshold, a5);
  }

  return v12;
}

- (float)threshold
{
  float result;

  -[AXShotflowNetwork threshold](self->_network, "threshold");
  return result;
}

- (void)setThreshold:(float)a3
{
  -[AXShotflowNetwork setThreshold:](self->_network, "setThreshold:");
}

- (id)nmsBoxes:(id)a3
{
  float v4;
  float v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  _QWORD *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  float v20;
  NSUInteger v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  unsigned __int8 v27;
  void *__p;
  _QWORD v29[5];
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v22 = -[NSArray count](self->_filterThreshold, "count");
  -[AXShotflowDetector nmsThreshold](self, "nmsThreshold");
  v5 = v4;
  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v22)
  {
    v6 = 0;
    do
    {
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __31__AXShotflowDetector_nmsBoxes___block_invoke;
      v29[3] = &__block_descriptor_40_e45_B24__0__AXElementDetection_8__NSDictionary_16l;
      v24 = v6;
      v29[4] = v6;
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v29);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "filteredArrayUsingPredicate:", v7);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("confidence"), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "sortedArrayUsingDescriptors:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(v10, "count");
      v27 = 0;
      std::vector<BOOL>::vector(&__p, v11, &v27);
      if (v11)
      {
        v12 = 0;
        do
        {
          objc_msgSend(v10, "objectAtIndexedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = __p;
          v15 = v12 >> 6;
          v16 = 1 << v12;
          v17 = *((_QWORD *)__p + (v12++ >> 6));
          if ((v17 & v16) == 0)
          {
            v18 = v12;
            if (v12 < v11)
            {
              do
              {
                if ((*((_QWORD *)__p + (v18 >> 6)) & (1 << v18)) == 0)
                {
                  objc_msgSend(v10, "objectAtIndexedSubscript:", v18);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v13, "overlap:", v19);
                  if (v20 > v5)
                    *((_QWORD *)__p + (v18 >> 6)) |= 1 << v18;

                }
                ++v18;
              }
              while (v11 != v18);
              v14 = __p;
              v17 = *((_QWORD *)__p + v15);
            }
            v14[v15] = v17 | v16;
            objc_msgSend(v26, "addObject:", v13);
          }

        }
        while (v12 != v11);
      }
      if (__p)
        operator delete(__p);

      v6 = v24 + 1;
    }
    while (v24 + 1 != v22);
  }

  return v26;
}

BOOL __31__AXShotflowDetector_nmsBoxes___block_invoke(uint64_t a1, void *a2)
{
  return *(_QWORD *)(a1 + 32) + 1 == (int)objc_msgSend(a2, "label");
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
  -[AXShotflowDetector osfsThreshold](self, "osfsThreshold");
  v9 = v8;
  -[AXShotflowDetector osfsSizeRatio](self, "osfsSizeRatio");
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

- (id)mergeHeadsBoxes:(id)a3
{
  float v4;
  float v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  BOOL v21;
  void *v22;
  float v23;
  float v24;
  unint64_t j;
  void *v26;
  void *v28;
  id v29;
  id v30;
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[3];

  v34[1] = *MEMORY[0x1E0C80C00];
  v29 = a3;
  -[AXShotflowDetector mergeHeadsThreshold](self, "mergeHeadsThreshold");
  v5 = v4;
  v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __38__AXShotflowDetector_mergeHeadsBoxes___block_invoke;
  v33[3] = &__block_descriptor_40_e45_B24__0__AXElementDetection_8__NSDictionary_16l;
  v33[4] = 2;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v33);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "filteredArrayUsingPredicate:", v7);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v32[0] = v6;
  v32[1] = 3221225472;
  v32[2] = __38__AXShotflowDetector_mergeHeadsBoxes___block_invoke_2;
  v32[3] = &__block_descriptor_40_e45_B24__0__AXElementDetection_8__NSDictionary_16l;
  v32[4] = 1;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v32);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "filteredArrayUsingPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v31[0] = v6;
  v31[1] = 3221225472;
  v31[2] = __38__AXShotflowDetector_mergeHeadsBoxes___block_invoke_3;
  v31[3] = &__block_descriptor_40_e45_B24__0__AXElementDetection_8__NSDictionary_16l;
  v31[4] = 2;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v31);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "filteredArrayUsingPredicate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("confidence"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "sortedArrayUsingDescriptors:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "count");
  v16 = objc_msgSend(v9, "count");
  if (v15)
  {
    v17 = v16;
    for (i = 0; i != v15; ++i)
    {
      objc_msgSend(v14, "objectAtIndexedSubscript:", i);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
        goto LABEL_11;
      v20 = 0;
      v21 = 1;
      do
      {
        while (!v21)
        {
          v21 = 0;
          if (++v20 == v17)
            goto LABEL_12;
        }
        objc_msgSend(v9, "objectAtIndexedSubscript:", v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "iOa:", v22);
        v24 = v23;
        v21 = v23 <= v5;

        ++v20;
      }
      while (v20 != v17);
      if (v24 <= v5)
LABEL_11:
        objc_msgSend(v30, "addObject:", v19);
LABEL_12:

    }
  }
  for (j = 0; j < objc_msgSend(v11, "count"); ++j)
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", j);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObject:", v26);

  }
  return v30;
}

BOOL __38__AXShotflowDetector_mergeHeadsBoxes___block_invoke(uint64_t a1, void *a2)
{
  return *(_QWORD *)(a1 + 32) == (int)objc_msgSend(a2, "label");
}

BOOL __38__AXShotflowDetector_mergeHeadsBoxes___block_invoke_2(uint64_t a1, void *a2)
{
  return *(_QWORD *)(a1 + 32) == (int)objc_msgSend(a2, "label");
}

BOOL __38__AXShotflowDetector_mergeHeadsBoxes___block_invoke_3(uint64_t a1, void *a2)
{
  return *(_QWORD *)(a1 + 32) != (int)objc_msgSend(a2, "label");
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
  -[AXShotflowDetector olmcsThreshold](self, "olmcsThreshold");
  v9 = v8;
  v10 = -[AXShotflowDetector olmcsMergeCountDelta](self, "olmcsMergeCountDelta");
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
  unint64_t v6;
  float v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  float v12;
  float v13;
  double v14;
  float v15;
  double v16;
  float v17;
  double v18;
  float v19;
  double v20;
  float v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  float v25;
  float v26;
  float v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  AXElementDetection *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  int v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  AXElementDetection *v57;
  uint64_t v59;
  id v60;
  id v61;
  double v62;
  float v63;
  float v64;
  float v65;
  void *v66;
  unsigned __int8 v67;
  void *__p;
  _QWORD v69[3];

  v69[1] = *MEMORY[0x1E0C80C00];
  v60 = a3;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("confidence"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "sortedArrayUsingDescriptors:", v5);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v66, "count");
  v67 = 0;
  std::vector<BOOL>::vector(&__p, v6, &v67);
  -[AXShotflowDetector nmsThreshold](self, "nmsThreshold");
  v65 = v7;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v61 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v8 = 0;
    do
    {
      objc_msgSend(v66, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = *((_QWORD *)__p + (v8 >> 6));
      if ((v11 & (1 << v8)) != 0)
      {
        ++v8;
      }
      else
      {
        *((_QWORD *)__p + (v8 >> 6)) = v11 | (1 << v8);
        objc_msgSend(v9, "confidence");
        v13 = v12;
        objc_msgSend(v10, "box");
        *(float *)&v14 = v14;
        v15 = v13 * *(float *)&v14;
        *(float *)&v14 = v16;
        v17 = v13 * *(float *)&v14;
        *(float *)&v14 = v18;
        v19 = v13 * *(float *)&v14;
        *(float *)&v14 = v20;
        v21 = v13 * *(float *)&v14;
        ++v8;
        v22 = 1;
        if (v8 < v6)
        {
          v23 = v8;
          do
          {
            if ((*((_QWORD *)__p + (v23 >> 6)) & (1 << v23)) == 0)
            {
              objc_msgSend(v66, "objectAtIndexedSubscript:", v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "overlap:", v24);
              if (v25 > v65)
              {
                v63 = v13;
                v26 = v19;
                v27 = v17;
                *((_QWORD *)__p + (v23 >> 6)) |= 1 << v23;
                objc_msgSend(v24, "box");
                v29 = v28;
                v31 = v30;
                v33 = v32;
                v35 = v34;
                objc_msgSend(v24, "confidence");
                v36 = v29;
                v15 = v15 + (float)(v37 * v36);
                v38 = v31;
                v17 = v27 + (float)(v37 * v38);
                v39 = v33;
                v21 = v21 + (float)(v37 * v39);
                v40 = v35;
                v19 = v26 + (float)(v37 * v40);
                v13 = v63 + v37;
                v22 = (v22 + 1);
              }

            }
            ++v23;
          }
          while (v6 != v23);
        }
        v41 = v21;
        v64 = v19;
        v42 = v17;
        v43 = [AXElementDetection alloc];
        objc_msgSend(v10, "defaultBox");
        v62 = v44;
        v46 = v45;
        v48 = v47;
        v50 = v49;
        objc_msgSend(v10, "confidence");
        v52 = v51;
        v53 = objc_msgSend(v10, "scale");
        v54 = objc_msgSend(v10, "hasLabel");
        v55 = objc_msgSend(v10, "label");
        objc_msgSend(v10, "labelName");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v59) = v52;
        v57 = -[AXElementDetection initWithBox:defaultBox:confidence:scale:mergesCount:hasLabel:label:labelName:](v43, "initWithBox:defaultBox:confidence:scale:mergesCount:hasLabel:label:labelName:", v53, v22, v54, v55, v56, (float)(v15 / v13), (float)(v42 / v13), (float)(v41 / v13), (float)(v64 / v13), v46, v48, v62, v50, v59);

        objc_msgSend(v61, "addObject:", v57);
      }

    }
    while (v8 != v6);
  }
  if (__p)
    operator delete(__p);

  return v61;
}

- (id)smartMergeBoxes:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  float v7;
  float v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  float v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  float v24;
  float v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  float v33;
  float v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  float v45;
  double v46;
  float v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  float v55;
  double v56;
  double v57;
  float v58;
  float v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  float v66;
  double v67;
  float v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  float v76;
  double v77;
  double v78;
  float v79;
  float v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  float v87;
  double v88;
  float v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  float v97;
  double v98;
  double v99;
  float v100;
  float v101;
  float v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  float v109;
  double v110;
  float v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  float v119;
  double v120;
  double v121;
  float v122;
  float v123;
  float v124;
  float v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  float v136;
  float v137;
  float v138;
  float v139;
  float v140;
  float v141;
  float v142;
  AXElementDetection *v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  int v152;
  int v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  AXElementDetection *v158;
  uint64_t v160;
  id v161;
  id v162;
  float v163;
  float v164;
  float v165;
  float v166;
  float v167;
  double v168;
  float v169;
  float v170;
  double v171;
  double v172;
  void *v173;
  float v174;
  unsigned __int8 v175;
  void *__p;
  _QWORD v177[3];

  v177[1] = *MEMORY[0x1E0C80C00];
  v161 = a3;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("smartDistance"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v177[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v177, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "sortedArrayUsingDescriptors:", v5);
  v173 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v173, "count");
  v175 = 0;
  std::vector<BOOL>::vector(&__p, v6, &v175);
  -[AXShotflowDetector smartThreshold](self, "smartThreshold");
  v170 = v7;
  -[AXShotflowDetector smartDistanceFactor](self, "smartDistanceFactor");
  v169 = v8;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v162 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v9 = 0;
    v168 = (float)(1.0 - v170);
    do
    {
      objc_msgSend(v173, "objectAtIndexedSubscript:", v9);
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
        v167 = v13;
        objc_msgSend(v11, "box");
        v15 = v14;
        v17 = v16;
        v19 = v18;
        v21 = v20;
        objc_msgSend(v11, "boxCenter");
        v171 = v23;
        v172 = v22;
        *(float *)&v22 = v19;
        v24 = v167 * *(float *)&v22;
        *(float *)&v22 = v21;
        v165 = v167 * *(float *)&v22;
        v166 = v24;
        *(float *)&v22 = v17;
        v25 = v167 * *(float *)&v22;
        *(float *)&v22 = v15;
        v163 = v167 * *(float *)&v22;
        v164 = v25;
        ++v9;
        v26 = 1;
        if (v9 < v6)
        {
          v27 = v9;
          do
          {
            if ((*((_QWORD *)__p + (v27 >> 6)) & (1 << v27)) == 0)
            {
              objc_msgSend(v173, "objectAtIndexedSubscript:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "boxCenter");
              v30 = v29;
              v32 = v31;
              objc_msgSend(v11, "overlap:", v28);
              v34 = v33;
              objc_msgSend(v11, "box");
              v36 = v35;
              objc_msgSend(v11, "box");
              v38 = v37;
              objc_msgSend(v28, "box");
              v40 = v39;
              objc_msgSend(v28, "box");
              v42 = v41;
              objc_msgSend(v11, "box");
              v44 = v43;
              objc_msgSend(v11, "box");
              v45 = v40 + v42;
              v47 = v44 + v46;
              if (v45 >= v47)
              {
                objc_msgSend(v11, "box");
                v49 = v51;
                objc_msgSend(v11, "box");
              }
              else
              {
                objc_msgSend(v28, "box");
                v49 = v48;
                objc_msgSend(v28, "box");
              }
              v52 = v50;
              objc_msgSend(v28, "box");
              v54 = v53;
              objc_msgSend(v11, "box");
              v55 = v54;
              *(float *)&v56 = v56;
              if (v55 <= *(float *)&v56)
                objc_msgSend(v11, "box");
              else
                objc_msgSend(v28, "box");
              v58 = v49 + v52;
              v59 = v57;
              v174 = 0.0;
              if ((float)(v58 - v59) >= 0.0)
              {
                objc_msgSend(v28, "box");
                v61 = v60;
                objc_msgSend(v28, "box");
                v63 = v62;
                objc_msgSend(v11, "box");
                v65 = v64;
                objc_msgSend(v11, "box");
                v66 = v61 + v63;
                v68 = v65 + v67;
                if (v66 >= v68)
                {
                  objc_msgSend(v11, "box");
                  v70 = v72;
                  objc_msgSend(v11, "box");
                }
                else
                {
                  objc_msgSend(v28, "box");
                  v70 = v69;
                  objc_msgSend(v28, "box");
                }
                v73 = v71;
                objc_msgSend(v28, "box");
                v75 = v74;
                objc_msgSend(v11, "box");
                v76 = v75;
                *(float *)&v77 = v77;
                if (v76 <= *(float *)&v77)
                  objc_msgSend(v11, "box");
                else
                  objc_msgSend(v28, "box");
                v79 = v70 + v73;
                v80 = v78;
                v174 = v79 - v80;
              }
              objc_msgSend(v28, "box");
              v82 = v81;
              objc_msgSend(v28, "box");
              v84 = v83;
              objc_msgSend(v11, "box");
              v86 = v85;
              objc_msgSend(v11, "box");
              v87 = v82 + v84;
              v89 = v86 + v88;
              if (v87 >= v89)
              {
                objc_msgSend(v11, "box");
                v91 = v93;
                objc_msgSend(v11, "box");
              }
              else
              {
                objc_msgSend(v28, "box");
                v91 = v90;
                objc_msgSend(v28, "box");
              }
              v94 = v92;
              objc_msgSend(v28, "box");
              v96 = v95;
              objc_msgSend(v11, "box");
              v97 = v96;
              *(float *)&v98 = v98;
              if (v97 <= *(float *)&v98)
                objc_msgSend(v11, "box");
              else
                objc_msgSend(v28, "box");
              v100 = v91 + v94;
              v101 = v99;
              v102 = 0.0;
              if ((float)(v100 - v101) >= 0.0)
              {
                objc_msgSend(v28, "box");
                v104 = v103;
                objc_msgSend(v28, "box");
                v106 = v105;
                objc_msgSend(v11, "box");
                v108 = v107;
                objc_msgSend(v11, "box");
                v109 = v104 + v106;
                v111 = v108 + v110;
                if (v109 >= v111)
                {
                  objc_msgSend(v11, "box");
                  v113 = v115;
                  objc_msgSend(v11, "box");
                }
                else
                {
                  objc_msgSend(v28, "box");
                  v113 = v112;
                  objc_msgSend(v28, "box");
                }
                v116 = v114;
                objc_msgSend(v28, "box");
                v118 = v117;
                objc_msgSend(v11, "box");
                v119 = v118;
                *(float *)&v120 = v120;
                if (v119 <= *(float *)&v120)
                  objc_msgSend(v11, "box");
                else
                  objc_msgSend(v28, "box");
                v122 = v113 + v116;
                v123 = v121;
                v102 = v122 - v123;
              }
              v124 = sqrt((v172 - v30) * (v172 - v30) + (v171 - v32) * (v171 - v32));
              v125 = fmin(v36, v38);
              if ((float)((float)(1.0 - sqrtf(v34)) + (float)((float)(v169 * v124) / v125)) < v170)
              {
                objc_msgSend(v11, "box");
                if (v126 * v168 <= v174)
                {
                  objc_msgSend(v11, "box", v174, v126 * v168);
                  if (v127 * v168 <= v102)
                  {
                    *((_QWORD *)__p + (v27 >> 6)) |= 1 << v27;
                    objc_msgSend(v28, "box", v102, v127 * v168);
                    v129 = v128;
                    v131 = v130;
                    v133 = v132;
                    v135 = v134;
                    objc_msgSend(v28, "confidence");
                    v136 = v129;
                    v138 = v163 + (float)(v137 * v136);
                    v139 = v131;
                    v163 = v138;
                    v164 = v164 + (float)(v137 * v139);
                    v140 = v133;
                    v141 = v166 + (float)(v137 * v140);
                    v142 = v135;
                    v165 = v165 + (float)(v137 * v142);
                    v166 = v141;
                    v167 = v167 + v137;
                    v26 = (v26 + 1);
                  }
                }
              }

            }
            ++v27;
          }
          while (v6 != v27);
        }
        v143 = [AXElementDetection alloc];
        objc_msgSend(v11, "defaultBox");
        v145 = v144;
        v147 = v146;
        v149 = v148;
        v151 = v150;
        objc_msgSend(v11, "confidence");
        v153 = v152;
        v154 = objc_msgSend(v11, "scale");
        v155 = objc_msgSend(v11, "hasLabel");
        v156 = objc_msgSend(v11, "label");
        objc_msgSend(v11, "labelName");
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v160) = v153;
        v158 = -[AXElementDetection initWithBox:defaultBox:confidence:scale:mergesCount:hasLabel:label:labelName:](v143, "initWithBox:defaultBox:confidence:scale:mergesCount:hasLabel:label:labelName:", v154, v26, v155, v156, v157, (float)(v163 / v167), (float)(v164 / v167), (float)(v166 / v167), (float)(v165 / v167), v145, v147, v149, v151, v160);

        objc_msgSend(v162, "addObject:", v158);
      }

    }
    while (v9 != v6);
  }
  if (__p)
    operator delete(__p);

  return v162;
}

- (id)filterBoxes:(id)a3
{
  id v4;
  id v5;
  NSUInteger v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  unint64_t i;
  void *v13;
  _QWORD v15[5];
  int v16;

  v4 = a3;
  if (-[AXShotflowNetwork modelType](self->_network, "modelType") == 1
    || -[AXShotflowNetwork modelType](self->_network, "modelType") == 2)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = -[NSArray count](self->_filterThreshold, "count");
    if (v6)
    {
      v7 = 0;
      do
      {
        -[NSArray objectAtIndexedSubscript:](self->_filterThreshold, "objectAtIndexedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "floatValue");
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __34__AXShotflowDetector_filterBoxes___block_invoke;
        v15[3] = &__block_descriptor_44_e45_B24__0__AXElementDetection_8__NSDictionary_16l;
        v16 = v9;
        v15[4] = v7;
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "filteredArrayUsingPredicate:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        for (i = 0; i < objc_msgSend(v11, "count"); ++i)
        {
          objc_msgSend(v11, "objectAtIndexedSubscript:", i);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v13);

        }
        ++v7;
      }
      while (v7 != v6);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

BOOL __34__AXShotflowDetector_filterBoxes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  float v4;
  _BOOL8 v5;

  v3 = a2;
  objc_msgSend(v3, "confidence");
  v5 = v4 >= *(float *)(a1 + 40) && *(_QWORD *)(a1 + 32) + 1 == (int)objc_msgSend(v3, "label");

  return v5;
}

- (id)enforceSquareFaces:(id)a3 withHeight:(float)a4 andWidth:(float)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  AXElementDetection *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  double v39;
  float v40;
  float v41;
  AXElementDetection *v42;
  uint64_t v44;
  id v45;
  id obj;
  double v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v45 = a3;
  if (-[AXShotflowNetwork version](self->_network, "version") == 6
    || -[AXShotflowNetwork version](self->_network, "version") >= 9)
  {
    v50 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    obj = v45;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v52 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          if (objc_msgSend(v9, "label") == 1)
          {
            objc_msgSend(v9, "box");
            v11 = v10;
            v13 = v12;
            objc_msgSend(v9, "boxCenter");
            v15 = v14;
            v17 = v16;
            v18 = [AXElementDetection alloc];
            objc_msgSend(v9, "defaultBox");
            v49 = v19;
            v21 = v20;
            v23 = v22;
            v25 = v24;
            objc_msgSend(v9, "confidence");
            v27 = v26;
            v28 = objc_msgSend(v9, "scale");
            v29 = objc_msgSend(v9, "mergesCount");
            v30 = objc_msgSend(v9, "hasLabel");
            v31 = objc_msgSend(v9, "label");
            objc_msgSend(v9, "labelName");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = v11;
            v34 = v13;
            v35 = (float)((float)(v34 * a4) + (float)(v33 * a5)) * 0.5;
            v36 = v35 / a5;
            v37 = v35 / a4;
            v38 = v15;
            v39 = v36;
            v40 = v38 + v36 * -0.5;
            v41 = v17;
            LODWORD(v44) = v27;
            v42 = -[AXElementDetection initWithBox:defaultBox:confidence:scale:mergesCount:hasLabel:label:labelName:](v18, "initWithBox:defaultBox:confidence:scale:mergesCount:hasLabel:label:labelName:", v28, v29, v30, v31, v32, v40, (float)(v41 - (float)(v37 * 0.5)), v39, v37, v21, v23, v49, v25, v44);

            objc_msgSend(v50, "addObject:", v42);
          }
          else
          {
            objc_msgSend(v50, "addObject:", v9);
          }
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
      }
      while (v6);
    }

  }
  else
  {
    v50 = v45;
  }

  return v50;
}

- (id)detect:(id)a3
{
  -[AXShotflowNetwork processCIImage:](self->_network, "processCIImage:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
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

  v8 = a3;
  v9 = (void *)MEMORY[0x1B5E128FC]();
  -[AXShotflowDetector nmsBoxes:](self, "nmsBoxes:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXShotflowDetector filterBoxes:](self, "filterBoxes:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  *(float *)&v12 = a4;
  *(float *)&v13 = a5;
  -[AXShotflowDetector enforceSquareFaces:withHeight:andWidth:](self, "enforceSquareFaces:withHeight:andWidth:", v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXShotflowDetector mergeHeadsBoxes:](self, "mergeHeadsBoxes:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v9);
  return v15;
}

- (float)overlap_threshold
{
  return self->_overlap_threshold;
}

- (void)setOverlap_threshold:(float)a3
{
  self->_overlap_threshold = a3;
}

- (NSArray)filterThreshold
{
  return self->_filterThreshold;
}

- (void)setFilterThreshold:(id)a3
{
  objc_storeStrong((id *)&self->_filterThreshold, a3);
}

- (float)nmsThreshold
{
  return self->_nmsThreshold;
}

- (void)setNmsThreshold:(float)a3
{
  self->_nmsThreshold = a3;
}

- (float)mergeHeadsThreshold
{
  return self->_mergeHeadsThreshold;
}

- (void)setMergeHeadsThreshold:(float)a3
{
  self->_mergeHeadsThreshold = a3;
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
  objc_storeStrong((id *)&self->_filterThreshold, 0);
  objc_storeStrong((id *)&self->_network, 0);
}

@end
