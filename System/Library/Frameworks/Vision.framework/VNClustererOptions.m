@implementation VNClustererOptions

- (VNClustererOptions)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 torsoThreshold:(float)a7 requestRevision:(unint64_t)a8
{
  return -[VNClustererOptions initWithType:cachePath:state:threshold:torsoThreshold:requestRevision:torsoprintRequestRevision:](self, "initWithType:cachePath:state:threshold:torsoThreshold:requestRevision:torsoprintRequestRevision:", a3, a4, a5, a8, 1);
}

- (VNClustererOptions)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 requestRevision:(unint64_t)a7
{
  id v13;
  id v14;
  id v15;
  VNClustererOptions *v16;
  VNClustererOptions *v17;
  objc_super v19;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)VNClustererOptions;
  v16 = -[VNClustererOptions init](&v19, sel_init);
  if (!v16)
    goto LABEL_6;
  v17 = 0;
  if (v13 && v14)
  {
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("VNClusteringAlgorithm_Greedy")))
    {
      objc_storeStrong((id *)&v16->_type, a3);
      objc_storeStrong((id *)&v16->_cachePath, a4);
      v16->_threshold = a6;
      objc_storeStrong((id *)&v16->_state, a5);
      v16->_torsoThreshold = 0.0;
      v16->_requestRevision = a7;
      v16->_torsoprintRequestRevision = 1;
      v17 = v16;
      goto LABEL_7;
    }
LABEL_6:
    v17 = 0;
  }
LABEL_7:

  return v17;
}

- (VNClustererOptions)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 torsoThreshold:(float)a7 requestRevision:(unint64_t)a8 torsoprintRequestRevision:(unint64_t)a9
{
  id v17;
  id v18;
  id v19;
  VNClustererOptions *v20;
  VNClustererOptions *v21;
  objc_super v23;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v23.receiver = self;
  v23.super_class = (Class)VNClustererOptions;
  v20 = -[VNClustererOptions init](&v23, sel_init);
  if (!v20)
    goto LABEL_6;
  v21 = 0;
  if (v17 && v18)
  {
    if (objc_msgSend(v17, "isEqualToString:", CFSTR("VNClusteringAlgorithm_GreedyWithTorso")))
    {
      objc_storeStrong((id *)&v20->_type, a3);
      objc_storeStrong((id *)&v20->_cachePath, a4);
      v20->_threshold = a6;
      objc_storeStrong((id *)&v20->_state, a5);
      v20->_torsoThreshold = a7;
      v20->_requestRevision = a8;
      v20->_torsoprintRequestRevision = a9;
      v21 = v20;
      goto LABEL_7;
    }
LABEL_6:
    v21 = 0;
  }
LABEL_7:

  return v21;
}

- (VNClustererOptions)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6
{
  return -[VNClustererOptions initWithType:cachePath:state:threshold:torsoThreshold:requestRevision:torsoprintRequestRevision:](self, "initWithType:cachePath:state:threshold:torsoThreshold:requestRevision:torsoprintRequestRevision:", a3, a4, a5, 1, 1);
}

- (VNClustererOptions)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 torsoThreshold:(float)a7
{
  return -[VNClustererOptions initWithType:cachePath:state:threshold:torsoThreshold:requestRevision:torsoprintRequestRevision:](self, "initWithType:cachePath:state:threshold:torsoThreshold:requestRevision:torsoprintRequestRevision:", a3, a4, a5, 1, 1);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)cachePath
{
  return self->_cachePath;
}

- (void)setCachePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (float)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(float)a3
{
  self->_threshold = a3;
}

- (float)torsoThreshold
{
  return self->_torsoThreshold;
}

- (void)setTorsoThreshold:(float)a3
{
  self->_torsoThreshold = a3;
}

- (unint64_t)requestRevision
{
  return self->_requestRevision;
}

- (void)setRequestRevision:(unint64_t)a3
{
  self->_requestRevision = a3;
}

- (unint64_t)torsoprintRequestRevision
{
  return self->_torsoprintRequestRevision;
}

- (void)setTorsoprintRequestRevision:(unint64_t)a3
{
  self->_torsoprintRequestRevision = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_cachePath, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
