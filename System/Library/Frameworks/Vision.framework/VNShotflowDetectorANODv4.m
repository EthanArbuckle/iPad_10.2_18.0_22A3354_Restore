@implementation VNShotflowDetectorANODv4

+ (id)supportedLabelKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__VNShotflowDetectorANODv4_supportedLabelKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNShotflowDetectorANODv4 supportedLabelKeys]::onceToken != -1)
    dispatch_once(&+[VNShotflowDetectorANODv4 supportedLabelKeys]::onceToken, block);
  return (id)+[VNShotflowDetectorANODv4 supportedLabelKeys]::supportedLabelKeys;
}

+ (Class)VNShotflowNetworkClass
{
  return (Class)objc_opt_class();
}

+ (id)filterThresholds
{
  if (+[VNShotflowDetectorANODv4 filterThresholds]::onceToken != -1)
    dispatch_once(&+[VNShotflowDetectorANODv4 filterThresholds]::onceToken, &__block_literal_global_177);
  return (id)+[VNShotflowDetectorANODv4 filterThresholds]::filterThresholds;
}

void __44__VNShotflowDetectorANODv4_filterThresholds__block_invoke()
{
  void *v0;

  v0 = (void *)+[VNShotflowDetectorANODv4 filterThresholds]::filterThresholds;
  +[VNShotflowDetectorANODv4 filterThresholds]::filterThresholds = (uint64_t)&unk_1E459E060;

}

void __46__VNShotflowDetectorANODv4_supportedLabelKeys__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  objc_super v3;

  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)&OBJC_METACLASS___VNShotflowDetectorANODv4;
  objc_msgSendSuper2(&v3, sel_supportedLabelKeys);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)+[VNShotflowDetectorANODv4 supportedLabelKeys]::supportedLabelKeys;
  +[VNShotflowDetectorANODv4 supportedLabelKeys]::supportedLabelKeys = v1;

}

- (VNShotflowDetectorANODv4)initWithNetwork:(id)a3 filterThresholds:(id)a4
{
  VNShotflowDetectorANODv4 *v4;
  VNShotflowDetectorANODv4 *v5;
  VNShotflowDetectorANODv4 *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VNShotflowDetectorANODv4;
  v4 = -[VNShotflowDetector initWithNetwork:filterThresholds:](&v8, sel_initWithNetwork_filterThresholds_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->super.super._nmsThreshold = 0.3;
    v6 = v4;
  }

  return v5;
}

- (VNShotflowDetectorANODv4)initWithNetwork:(id)a3
{
  VNShotflowDetectorANODv4 *v3;
  VNShotflowDetectorANODv4 *v4;
  VNShotflowDetectorANODv4 *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNShotflowDetectorANODv4;
  v3 = -[VNShotflowDetector initWithNetwork:](&v7, sel_initWithNetwork_, a3);
  v4 = v3;
  if (v3)
  {
    v3->super.super._nmsThreshold = 0.3;
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
  double v16;
  double v17;
  void *v18;
  objc_super v20;

  v8 = a3;
  v9 = (void *)MEMORY[0x1A1B0B060]();
  -[VNShotflowDetector filterBoxes:](self, "filterBoxes:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[VNShotflowDetectorANODv4 nmsBoxes:](self, "nmsBoxes:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  *(float *)&v12 = a4;
  *(float *)&v13 = a5;
  -[VNShotflowDetector enforceSquareFaces:withHeight:andWidth:](self, "enforceSquareFaces:withHeight:andWidth:", v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[VNShotflowDetectorANODBase mergeHeadsBoxes:](self, "mergeHeadsBoxes:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v9);
  v20.receiver = self;
  v20.super_class = (Class)VNShotflowDetectorANODv4;
  *(float *)&v16 = a4;
  *(float *)&v17 = a5;
  -[VNShotflowDetector processBoxes:withHeight:andWidth:](&v20, sel_processBoxes_withHeight_andWidth_, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
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
  v9[2] = __63__VNShotflowDetectorANODv4_getIndexBoxes_filterThresholdIndex___block_invoke;
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
      -[VNShotflowDetectorANODv4 getIndexBoxes:filterThresholdIndex:](self, "getIndexBoxes:filterThresholdIndex:", v18, i);
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

BOOL __63__VNShotflowDetectorANODv4_getIndexBoxes_filterThresholdIndex___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "label") == *(_DWORD *)(a1 + 32) + 1;
}

@end
