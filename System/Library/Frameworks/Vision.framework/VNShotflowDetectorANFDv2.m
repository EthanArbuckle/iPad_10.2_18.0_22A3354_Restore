@implementation VNShotflowDetectorANFDv2

+ (id)supportedLabelKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__VNShotflowDetectorANFDv2_supportedLabelKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNShotflowDetectorANFDv2 supportedLabelKeys]::onceToken != -1)
    dispatch_once(&+[VNShotflowDetectorANFDv2 supportedLabelKeys]::onceToken, block);
  return (id)+[VNShotflowDetectorANFDv2 supportedLabelKeys]::supportedLabelKeys;
}

+ (Class)VNShotflowNetworkClass
{
  return (Class)objc_opt_class();
}

+ (id)filterThresholds
{
  if (+[VNShotflowDetectorANFDv2 filterThresholds]::onceToken != -1)
    dispatch_once(&+[VNShotflowDetectorANFDv2 filterThresholds]::onceToken, &__block_literal_global_146);
  return (id)+[VNShotflowDetectorANFDv2 filterThresholds]::filterThresholds;
}

void __44__VNShotflowDetectorANFDv2_filterThresholds__block_invoke()
{
  void *v0;

  v0 = (void *)+[VNShotflowDetectorANFDv2 filterThresholds]::filterThresholds;
  +[VNShotflowDetectorANFDv2 filterThresholds]::filterThresholds = (uint64_t)&unk_1E459E030;

}

void __46__VNShotflowDetectorANFDv2_supportedLabelKeys__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  objc_super v3;

  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)&OBJC_METACLASS___VNShotflowDetectorANFDv2;
  objc_msgSendSuper2(&v3, sel_supportedLabelKeys);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)+[VNShotflowDetectorANFDv2 supportedLabelKeys]::supportedLabelKeys;
  +[VNShotflowDetectorANFDv2 supportedLabelKeys]::supportedLabelKeys = v1;

}

- (VNShotflowDetectorANFDv2)initWithNetwork:(id)a3 filterThresholds:(id)a4
{
  VNShotflowDetectorANFDv2 *v4;
  VNShotflowDetectorANFDv2 *v5;
  VNShotflowDetectorANFDv2 *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VNShotflowDetectorANFDv2;
  v4 = -[VNShotflowDetector initWithNetwork:filterThresholds:](&v8, sel_initWithNetwork_filterThresholds_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->super.super._nmsThreshold = 0.5;
    v6 = v4;
  }

  return v5;
}

- (VNShotflowDetectorANFDv2)initWithNetwork:(id)a3
{
  VNShotflowDetectorANFDv2 *v3;
  VNShotflowDetectorANFDv2 *v4;
  VNShotflowDetectorANFDv2 *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNShotflowDetectorANFDv2;
  v3 = -[VNShotflowDetector initWithNetwork:](&v7, sel_initWithNetwork_, a3);
  v4 = v3;
  if (v3)
  {
    v3->super.super._nmsThreshold = 0.5;
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
  -[VNShotflowDetectorANFDv2 nmsBoxes:](self, "nmsBoxes:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[VNShotflowDetector filterBoxes:](self, "filterBoxes:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  *(float *)&v12 = a4;
  *(float *)&v13 = a5;
  -[VNShotflowDetector enforceSquareFaces:withHeight:andWidth:](self, "enforceSquareFaces:withHeight:andWidth:", v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[VNShotflowDetectorANODBase mergeHeadsBoxes:](self, "mergeHeadsBoxes:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v9);
  v20.receiver = self;
  v20.super_class = (Class)VNShotflowDetectorANFDv2;
  *(float *)&v16 = a4;
  *(float *)&v17 = a5;
  -[VNShotflowDetector processBoxes:withHeight:andWidth:](&v20, sel_processBoxes_withHeight_andWidth_, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
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
  void *v13;
  double v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  float v18;
  unint64_t v19;
  float v20;
  float v21;
  void *v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  double v33;
  id v35;
  id v36;
  unint64_t v37;
  unsigned __int8 v38;
  void *__p;

  v35 = a3;
  -[VNShotflowDetector nmsThreshold](self, "nmsThreshold");
  v5 = v4;
  v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  for (i = 0; ; ++i)
  {
    -[VNShotflowDetector filterThresholds](self, "filterThresholds");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (i >= v8)
      break;
    -[VNShotflowDetector sortBoxes:filterThresholdIndex:](self, "sortBoxes:filterThresholdIndex:", v35, i);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");
    v38 = 0;
    std::vector<BOOL>::vector(&__p, v10, &v38);
    if (v10)
    {
      v11 = 0;
      v37 = i;
      do
      {
        v12 = v9;
        objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v11 >> 6;
        v16 = 1 << v11;
        v17 = *((_QWORD *)__p + (v11++ >> 6));
        if ((v17 & v16) == 0)
        {
          if (v11 < v10)
          {
            v18 = 0.0;
            v19 = v11;
            v20 = 0.0;
            v21 = 0.0;
            do
            {
              if ((*((_QWORD *)__p + (v19 >> 6)) & (1 << v19)) == 0)
              {
                objc_msgSend(v12, "objectAtIndexedSubscript:", v19);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "overlap:", v22);
                if (v23 > v5)
                {
                  *((_QWORD *)__p + (v19 >> 6)) |= 1 << v19;
                  if (!v37)
                  {
                    objc_msgSend(v13, "yawAngle");
                    v25 = v24;
                    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "VNShotflowNetworkClass"), "nonSquareYawDefault");
                    if (v25 == v26)
                    {
                      objc_msgSend(v22, "yawAngle");
                      v28 = v27;
                      objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "VNShotflowNetworkClass"), "nonSquareYawDefault");
                      if (v28 < v29)
                      {
                        objc_msgSend(v22, "rotationAngle");
                        v31 = v30;
                        objc_msgSend(v22, "yawAngle");
                        v21 = v21 + v31;
                        v20 = v20 + v32;
                        v18 = v18 + 1.0;
                      }
                    }
                  }
                }

              }
              ++v19;
            }
            while (v10 != v19);
            i = v37;
            if (!v37 && v18 > 0.0)
            {
              *(float *)&v14 = v21 / v18;
              objc_msgSend(v13, "setRotationAngle:", v14);
              *(float *)&v33 = v20 / v18;
              objc_msgSend(v13, "setYawAngle:", v33);
            }
          }
          *((_QWORD *)__p + v15) |= v16;
          objc_msgSend(v36, "addObject:", v13);
        }

        v9 = v12;
      }
      while (v11 != v10);
    }
    if (__p)
      operator delete(__p);

  }
  return v36;
}

@end
