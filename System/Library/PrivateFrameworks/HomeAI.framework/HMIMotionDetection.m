@implementation HMIMotionDetection

- (HMIMotionDetection)initWithBoundingBox:(CGRect)a3 size:(CGSize)a4 motionVectors:(id)a5 motionScore:(float)a6 motionMode:(unint64_t)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat v11;
  CGFloat v12;
  CGFloat y;
  CGFloat x;
  id v16;
  HMIMotionDetection *v17;
  HMIMotionDetection *v18;
  uint64_t v19;
  NSArray *motionVectors;
  objc_super v22;

  height = a4.height;
  width = a4.width;
  v11 = a3.size.height;
  v12 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = a5;
  v22.receiver = self;
  v22.super_class = (Class)HMIMotionDetection;
  v17 = -[HMIMotionDetection init](&v22, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_boundingBox.origin.x = x;
    v17->_boundingBox.origin.y = y;
    v17->_boundingBox.size.width = v12;
    v17->_boundingBox.size.height = v11;
    v17->_size.width = width;
    v17->_size.height = height;
    v19 = objc_msgSend(v16, "copy");
    motionVectors = v18->_motionVectors;
    v18->_motionVectors = (NSArray *)v19;

    v18->_motionScore = a6;
    v18->_motionMode = a7;
  }

  return v18;
}

+ (id)firstMotionDetectionInArray:(id)a3 withMode:(unint64_t)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __59__HMIMotionDetection_firstMotionDetectionInArray_withMode___block_invoke;
  v5[3] = &__block_descriptor_40_e28_B16__0__HMIMotionDetection_8l;
  v5[4] = a4;
  objc_msgSend(a3, "na_firstObjectPassingTest:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

BOOL __59__HMIMotionDetection_firstMotionDetectionInArray_withMode___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "motionMode") == *(_QWORD *)(a1 + 32);
}

- (float)scoreForSubBoundingBox:(CGRect)a3 eventClass:(Class)a4 confidence:(float)a5
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  unint64_t v11;
  float v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  _BOOL4 v21;
  double v22;
  double v23;
  CGPoint v26;
  CGRect v27;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = 0;
  v12 = 0.0;
  while (1)
  {
    -[HMIMotionDetection motionVectors](self, "motionVectors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14 <= v11)
      break;
    -[HMIMotionDetection motionVectors](self, "motionVectors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "target");
    v18 = v17;
    v20 = v19;
    v21 = (Class)objc_msgSend(v16, "eventClass") == a4 || objc_msgSend(v16, "eventClass") == 0;
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = height;
    v26.x = v18;
    v26.y = v20;
    if (CGRectContainsPoint(v27, v26) && v21)
    {
      objc_msgSend(v16, "distance");
      v23 = sqrt(v22) + v12;
      v12 = v23;
      *(float *)&v23 = a5;
      if (a5 > 0.6)
        objc_msgSend(v16, "setEventClass:", a4, v23);
    }

    ++v11;
  }
  return v12 / (height * width + 0.00000011920929);
}

- (BOOL)applyEventTypeAndCheckIfSubBoundingIsStatic:(CGRect)a3 eventClass:(Class)a4 confidence:(float)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v12;
  void *v13;
  void *v14;
  float v15;
  float v16;
  void *v17;
  float v18;
  float v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  float v31;
  BOOL v32;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[HMIMotionDetection classMotionScoreMap](self, "classMotionScoreMap");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIMotionDetection classPaddingMap](self, "classPaddingMap");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "floatValue");
  v16 = v15;

  objc_msgSend(v12, "objectForKeyedSubscript:", a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "floatValue");
  v19 = v18;

  -[HMIMotionDetection size](self, "size");
  +[HMIVisionUtilities applyPadding:withOriginalSize:padding:](HMIVisionUtilities, "applyPadding:withOriginalSize:padding:", x, y, width, height, v20, v21, v16, v16);
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  if ((Class)objc_opt_class() == a4)
    a4 = (Class)objc_opt_class();
  *(float *)&v30 = a5;
  -[HMIMotionDetection scoreForSubBoundingBox:eventClass:confidence:](self, "scoreForSubBoundingBox:eventClass:confidence:", a4, v23, v25, v27, v29, v30);
  v32 = v31 < v19;

  return v32;
}

- (id)classMotionScoreMap
{
  if (-[HMIMotionDetection classMotionScoreMap]::onceToken != -1)
    dispatch_once(&-[HMIMotionDetection classMotionScoreMap]::onceToken, &__block_literal_global_39);
  return (id)-[HMIMotionDetection classMotionScoreMap]::motionScoreMap;
}

void __41__HMIMotionDetection_classMotionScoreMap__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x24BDAC8D0];
  v2[0] = objc_opt_class();
  v3[0] = &unk_24DC15778;
  v2[1] = objc_opt_class();
  v3[1] = &unk_24DC15788;
  v2[2] = objc_opt_class();
  v3[2] = &unk_24DC15778;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)-[HMIMotionDetection classMotionScoreMap]::motionScoreMap;
  -[HMIMotionDetection classMotionScoreMap]::motionScoreMap = v0;

}

- (id)classPaddingMap
{
  if (-[HMIMotionDetection classPaddingMap]::onceToken != -1)
    dispatch_once(&-[HMIMotionDetection classPaddingMap]::onceToken, &__block_literal_global_43_0);
  return (id)-[HMIMotionDetection classPaddingMap]::paddingMap;
}

void __37__HMIMotionDetection_classPaddingMap__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x24BDAC8D0];
  v2[0] = objc_opt_class();
  v3[0] = &unk_24DC15798;
  v2[1] = objc_opt_class();
  v3[1] = &unk_24DC157A8;
  v2[2] = objc_opt_class();
  v3[2] = &unk_24DC15798;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)-[HMIMotionDetection classPaddingMap]::paddingMap;
  -[HMIMotionDetection classPaddingMap]::paddingMap = v0;

}

- (CGRect)boundingBox
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_boundingBox, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (NSArray)motionVectors
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (CGSize)size
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_size, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (float)motionScore
{
  return self->_motionScore;
}

- (unint64_t)motionMode
{
  return self->_motionMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionVectors, 0);
}

@end
