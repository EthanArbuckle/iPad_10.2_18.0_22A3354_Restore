@implementation VNShotflowDetectorANSTv1

+ (id)supportedLabelKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__VNShotflowDetectorANSTv1_supportedLabelKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNShotflowDetectorANSTv1 supportedLabelKeys]::onceToken != -1)
    dispatch_once(&+[VNShotflowDetectorANSTv1 supportedLabelKeys]::onceToken, block);
  return (id)+[VNShotflowDetectorANSTv1 supportedLabelKeys]::supportedLabelKeys;
}

+ (Class)VNShotflowNetworkClass
{
  return (Class)objc_opt_class();
}

+ (id)filterThresholds
{
  if (+[VNShotflowDetectorANSTv1 filterThresholds]::onceToken != -1)
    dispatch_once(&+[VNShotflowDetectorANSTv1 filterThresholds]::onceToken, &__block_literal_global_194);
  return (id)+[VNShotflowDetectorANSTv1 filterThresholds]::filterThresholds;
}

void __44__VNShotflowDetectorANSTv1_filterThresholds__block_invoke()
{
  void *v0;

  v0 = (void *)+[VNShotflowDetectorANSTv1 filterThresholds]::filterThresholds;
  +[VNShotflowDetectorANSTv1 filterThresholds]::filterThresholds = (uint64_t)&unk_1E459E078;

}

void __46__VNShotflowDetectorANSTv1_supportedLabelKeys__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  objc_super v3;

  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)&OBJC_METACLASS___VNShotflowDetectorANSTv1;
  objc_msgSendSuper2(&v3, sel_supportedLabelKeys);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)+[VNShotflowDetectorANSTv1 supportedLabelKeys]::supportedLabelKeys;
  +[VNShotflowDetectorANSTv1 supportedLabelKeys]::supportedLabelKeys = v1;

}

- (VNShotflowDetectorANSTv1)initWithNetwork:(id)a3 filterThresholds:(id)a4
{
  VNShotflowDetectorANSTv1 *v4;
  VNShotflowDetectorANSTv1 *v5;
  VNShotflowDetectorANSTv1 *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VNShotflowDetectorANSTv1;
  v4 = -[VNShotflowDetector initWithNetwork:filterThresholds:](&v8, sel_initWithNetwork_filterThresholds_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->super.super._nmsThreshold = 0.3;
    v6 = v4;
  }

  return v5;
}

- (VNShotflowDetectorANSTv1)initWithNetwork:(id)a3
{
  VNShotflowDetectorANSTv1 *v3;
  VNShotflowDetectorANSTv1 *v4;
  VNShotflowDetectorANSTv1 *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNShotflowDetectorANSTv1;
  v3 = -[VNShotflowDetector initWithNetwork:](&v7, sel_initWithNetwork_, a3);
  v4 = v3;
  if (v3)
  {
    v3->super.super._nmsThreshold = 0.3;
    v5 = v3;
  }

  return v4;
}

- (id)modifySmallFaceThrehold:(id)a3 withHeight:(float)a4 andWidth:(float)a5
{
  uint64_t v6;
  uint64_t i;
  void *v8;
  double v9;
  double v10;
  double v11;
  float v12;
  float v13;
  float v14;
  id v15;
  void *v16;
  float v17;
  float v18;
  float v19;
  void *v20;
  void *v21;
  float v22;
  float v23;
  void *v24;
  float v25;
  _BOOL4 v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  float v36;
  float v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  float v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  float v52;
  float v53;
  float v54;
  double v55;
  float v56;
  BOOL v57;
  BOOL v58;
  double v60;
  double v61;
  double v62;
  float v63;
  void *v64;
  void *v65;
  float v66;
  double v67;
  id obj;
  uint64_t v70;
  double v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  obj = a3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
  if (v6)
  {
    v70 = *(_QWORD *)v77;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v77 != v70)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
        if (objc_msgSend(v8, "label") == 1 || objc_msgSend(v8, "label") == 2)
        {
          objc_msgSend(v8, "box");
          v10 = v9;
          objc_msgSend(v8, "box");
          v12 = v10 * v11;
          if (v12 < 0.005)
          {
            objc_msgSend(v8, "confidence");
            v14 = v13;
            -[VNShotflowDetector filterThresholds](self, "filterThresholds");
            v15 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectAtIndexedSubscript:", (int)(objc_msgSend(v8, "label") - 1));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "floatValue");
            if (v14 >= v17)
            {

            }
            else
            {
              objc_msgSend(v8, "confidence");
              v19 = v18;
              -[VNShotflowDetector filterThresholds](self, "filterThresholds");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "objectAtIndexedSubscript:", (int)(objc_msgSend(v8, "label") - 1));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "floatValue");
              v23 = v22;
              objc_msgSend(&unk_1E459E090, "objectAtIndexedSubscript:", (int)objc_msgSend(v8, "label"));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "floatValue");
              v26 = v19 > (float)(v23 - v25);

              if (!v26)
                continue;
              objc_msgSend(v8, "box");
              v28 = v27;
              objc_msgSend(v8, "box");
              v30 = v29;
              objc_msgSend(v8, "box");
              v32 = v31;
              objc_msgSend(v8, "box");
              v34 = v33;
              v74 = 0u;
              v75 = 0u;
              v72 = 0u;
              v73 = 0u;
              v15 = obj;
              v35 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
              if (v35)
              {
                v36 = v28 + v30 * 0.5;
                v37 = v32 + v34 * 0.5;
                v38 = *(_QWORD *)v73;
                v71 = v12;
                do
                {
                  for (j = 0; j != v35; ++j)
                  {
                    if (*(_QWORD *)v73 != v38)
                      objc_enumerationMutation(v15);
                    v40 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * j);
                    if (objc_msgSend(v40, "label") == 3)
                    {
                      objc_msgSend(v40, "confidence");
                      if (v41 > 0.635)
                      {
                        objc_msgSend(v40, "box");
                        v43 = v42;
                        objc_msgSend(v40, "box");
                        v45 = v44;
                        objc_msgSend(v40, "box");
                        v47 = v46;
                        objc_msgSend(v40, "box");
                        v49 = v48;
                        objc_msgSend(v40, "box");
                        v51 = v50;
                        objc_msgSend(v40, "box");
                        v52 = v43;
                        v56 = v51 + v55;
                        if (v52 < v36)
                        {
                          v54 = v47 + v49;
                          v57 = v36 < v54;
                        }
                        else
                        {
                          v57 = 0;
                        }
                        if (v57)
                        {
                          v53 = v45;
                          v58 = v53 < v37;
                        }
                        else
                        {
                          v58 = 0;
                        }
                        if (v58 && v37 < v56)
                        {
                          objc_msgSend(v40, "box");
                          v61 = v60;
                          objc_msgSend(v40, "box");
                          v63 = v71 / (v61 * v62);
                          if (v63 > 0.03)
                          {
                            -[VNShotflowDetector filterThresholds](self, "filterThresholds");
                            v64 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v64, "objectAtIndexedSubscript:", (int)(objc_msgSend(v8, "label") - 1));
                            v65 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v65, "floatValue");
                            *(float *)&v67 = v66 + 0.001;
                            objc_msgSend(v8, "setConfidence:", v67);

                          }
                        }
                      }
                    }
                  }
                  v35 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
                }
                while (v35);
              }
            }

          }
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
    }
    while (v6);
  }

  return obj;
}

- (id)processBoxes:(id)a3 withHeight:(float)a4 andWidth:(float)a5
{
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  objc_super v23;

  v8 = a3;
  v9 = (void *)MEMORY[0x1A1B0B060]();
  *(float *)&v10 = a4;
  *(float *)&v11 = a5;
  -[VNShotflowDetectorANSTv1 modifySmallFaceThrehold:withHeight:andWidth:](self, "modifySmallFaceThrehold:withHeight:andWidth:", v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[VNShotflowDetector filterBoxes:](self, "filterBoxes:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[VNShotflowDetectorANSTv1 nmsBoxes:](self, "nmsBoxes:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  *(float *)&v15 = a4;
  *(float *)&v16 = a5;
  -[VNShotflowDetector enforceSquareFaces:withHeight:andWidth:](self, "enforceSquareFaces:withHeight:andWidth:", v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[VNShotflowDetectorANODBase mergeHeadsBoxes:](self, "mergeHeadsBoxes:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v9);
  v23.receiver = self;
  v23.super_class = (Class)VNShotflowDetectorANSTv1;
  *(float *)&v19 = a4;
  *(float *)&v20 = a5;
  -[VNShotflowDetector processBoxes:withHeight:andWidth:](&v23, sel_processBoxes_withHeight_andWidth_, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
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
  v9[2] = __63__VNShotflowDetectorANSTv1_getIndexBoxes_filterThresholdIndex___block_invoke;
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
      -[VNShotflowDetectorANSTv1 getIndexBoxes:filterThresholdIndex:](self, "getIndexBoxes:filterThresholdIndex:", v18, i);
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

BOOL __63__VNShotflowDetectorANSTv1_getIndexBoxes_filterThresholdIndex___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "label") == *(_DWORD *)(a1 + 32) + 1;
}

@end
