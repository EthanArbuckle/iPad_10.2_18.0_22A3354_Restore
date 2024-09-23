@implementation VNClustererQueryOptions

- (VNClustererQueryOptions)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6
{
  id v10;
  id v11;
  id v12;
  double v13;
  double v14;
  VNClustererQueryOptions *v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v12)
  {
    LODWORD(v14) = 0;
    *(float *)&v13 = a6;
    self = -[VNClustererQueryOptions initWithType:cachePath:state:threshold:torsoThreshold:requestRevision:torsoprintRequestRevision:](self, "initWithType:cachePath:state:threshold:torsoThreshold:requestRevision:torsoprintRequestRevision:", v10, v11, v12, 1, 1, v13, v14);
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (VNClustererQueryOptions)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 torsoThreshold:(float)a7
{
  id v12;
  id v13;
  id v14;
  double v15;
  double v16;
  VNClustererQueryOptions *v17;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (v14)
  {
    *(float *)&v15 = a6;
    *(float *)&v16 = a7;
    self = -[VNClustererQueryOptions initWithType:cachePath:state:threshold:torsoThreshold:requestRevision:torsoprintRequestRevision:](self, "initWithType:cachePath:state:threshold:torsoThreshold:requestRevision:torsoprintRequestRevision:", v12, v13, v14, 1, 1, v15, v16);
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (VNClustererQueryOptions)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 torsoThreshold:(float)a7 requestRevision:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  double v17;
  double v18;
  VNClustererQueryOptions *v19;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  if (v16)
  {
    *(float *)&v17 = a6;
    *(float *)&v18 = a7;
    self = -[VNClustererQueryOptions initWithType:cachePath:state:threshold:torsoThreshold:requestRevision:torsoprintRequestRevision:](self, "initWithType:cachePath:state:threshold:torsoThreshold:requestRevision:torsoprintRequestRevision:", v14, v15, v16, a8, 1, v17, v18);
    v19 = self;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (VNClustererQueryOptions)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 requestRevision:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  double v15;
  VNClustererQueryOptions *v16;
  objc_super v18;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (v14)
  {
    v18.receiver = self;
    v18.super_class = (Class)VNClustererQueryOptions;
    *(float *)&v15 = a6;
    self = -[VNClustererOptions initWithType:cachePath:state:threshold:requestRevision:](&v18, sel_initWithType_cachePath_state_threshold_requestRevision_, v12, v13, v14, a7, v15);
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (VNClustererQueryOptions)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 torsoThreshold:(float)a7 requestRevision:(unint64_t)a8 torsoprintRequestRevision:(unint64_t)a9
{
  id v16;
  id v17;
  id v18;
  double v19;
  double v20;
  VNClustererQueryOptions *v21;
  objc_super v23;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  if (v18)
  {
    v23.receiver = self;
    v23.super_class = (Class)VNClustererQueryOptions;
    *(float *)&v19 = a6;
    *(float *)&v20 = a7;
    self = -[VNClustererOptions initWithType:cachePath:state:threshold:torsoThreshold:requestRevision:torsoprintRequestRevision:](&v23, sel_initWithType_cachePath_state_threshold_torsoThreshold_requestRevision_torsoprintRequestRevision_, v16, v17, v18, a8, a9, v19, v20);
    v21 = self;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

@end
