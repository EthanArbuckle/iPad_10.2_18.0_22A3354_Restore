@implementation VNShotflowDetectorANFDv1

+ (id)supportedLabelKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__VNShotflowDetectorANFDv1_supportedLabelKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNShotflowDetectorANFDv1 supportedLabelKeys]::onceToken != -1)
    dispatch_once(&+[VNShotflowDetectorANFDv1 supportedLabelKeys]::onceToken, block);
  return (id)+[VNShotflowDetectorANFDv1 supportedLabelKeys]::supportedLabelKeys;
}

+ (Class)VNShotflowNetworkClass
{
  return (Class)objc_opt_class();
}

+ (id)filterThresholds
{
  if (+[VNShotflowDetectorANFDv1 filterThresholds]::onceToken != -1)
    dispatch_once(&+[VNShotflowDetectorANFDv1 filterThresholds]::onceToken, &__block_literal_global_10650);
  return (id)+[VNShotflowDetectorANFDv1 filterThresholds]::filterThresholds;
}

void __44__VNShotflowDetectorANFDv1_filterThresholds__block_invoke()
{
  void *v0;

  v0 = (void *)+[VNShotflowDetectorANFDv1 filterThresholds]::filterThresholds;
  +[VNShotflowDetectorANFDv1 filterThresholds]::filterThresholds = (uint64_t)&unk_1E459E018;

}

void __46__VNShotflowDetectorANFDv1_supportedLabelKeys__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  objc_super v3;

  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)&OBJC_METACLASS___VNShotflowDetectorANFDv1;
  objc_msgSendSuper2(&v3, sel_supportedLabelKeys);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)+[VNShotflowDetectorANFDv1 supportedLabelKeys]::supportedLabelKeys;
  +[VNShotflowDetectorANFDv1 supportedLabelKeys]::supportedLabelKeys = v1;

}

- (VNShotflowDetectorANFDv1)initWithNetwork:(id)a3 filterThresholds:(id)a4
{
  VNShotflowDetectorANFDv1 *v4;
  VNShotflowDetectorANFDv1 *v5;
  VNShotflowDetectorANFDv1 *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VNShotflowDetectorANFDv1;
  v4 = -[VNShotflowDetector initWithNetwork:filterThresholds:](&v8, sel_initWithNetwork_filterThresholds_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->super._nmsThreshold = 0.45;
    v6 = v4;
  }

  return v5;
}

- (VNShotflowDetectorANFDv1)initWithNetwork:(id)a3
{
  VNShotflowDetectorANFDv1 *v3;
  VNShotflowDetectorANFDv1 *v4;
  VNShotflowDetectorANFDv1 *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNShotflowDetectorANFDv1;
  v3 = -[VNShotflowDetector initWithNetwork:](&v7, sel_initWithNetwork_, a3);
  v4 = v3;
  if (v3)
  {
    v3->super._nmsThreshold = 0.45;
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
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  objc_super v22;

  v8 = a3;
  v9 = (void *)MEMORY[0x1A1B0B060]();
  -[VNShotflowDetector smartMergeBoxes:](self, "smartMergeBoxes:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[VNShotflowDetectorANFDv1 nmsBoxes:](self, "nmsBoxes:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[VNShotflowDetector overlappingSmallFacesSuppression:](self, "overlappingSmallFacesSuppression:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[VNShotflowDetector overlappingLowMergeCountSuppression:](self, "overlappingLowMergeCountSuppression:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[VNShotflowDetector filterBoxes:](self, "filterBoxes:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  *(float *)&v15 = a4;
  *(float *)&v16 = a5;
  -[VNShotflowDetector enforceSquareFaces:withHeight:andWidth:](self, "enforceSquareFaces:withHeight:andWidth:", v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v9);
  v22.receiver = self;
  v22.super_class = (Class)VNShotflowDetectorANFDv1;
  *(float *)&v18 = a4;
  *(float *)&v19 = a5;
  -[VNShotflowDetector processBoxes:withHeight:andWidth:](&v22, sel_processBoxes_withHeight_andWidth_, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
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
    -[VNShotflowDetector sortBoxes:filterThresholdIndex:](self, "sortBoxes:filterThresholdIndex:", v18, i);
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
                objc_msgSend(v12, "overlap:", v15);
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
  return v19;
}

@end
