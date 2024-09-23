@implementation MLCMHACPUDeviceOps

+ (id)deviceOpsWithType:(int)a3 params:(id)a4 inDeltaData:(id)a5 outDeltaData:(id)a6 weightsDeltaData:(id)a7 biasDeltaData:(id)a8 weightsMomentumData:(id)a9 biasMomentumData:(id)a10
{
  uint64_t v15;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;

  v15 = *(_QWORD *)&a3;
  v17 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  v24 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:betaDeltaData:gammaDeltaData:betaMomentumData:gammaMomentumData:", v15, v23, v22, v21, v20, v19, v18, v17, 0, 0, 0, 0);

  return v24;
}

- (MLCMHACPUDeviceOps)initWithType:(int)a3 params:(id)a4 inDeltaData:(id)a5 outDeltaData:(id)a6 weightsDeltaData:(id)a7 biasDeltaData:(id)a8 weightsMomentumData:(id)a9 biasMomentumData:(id)a10 betaDeltaData:(id)a11 gammaDeltaData:(id)a12 betaMomentumData:(id)a13 gammaMomentumData:(id)a14
{
  MLCMHACPUDeviceOps *v14;
  MLCMHACPUDeviceOps *v15;
  NSData *keyMask;
  NSData *attnMask;
  NSData *backpropCacheData;
  NSArray *attnBiasDeltaData;
  NSMutableArray *weightsMomentumDeltaDataArray;
  NSMutableArray *biasMomentumDeltaDataArray;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)MLCMHACPUDeviceOps;
  v14 = -[MLCCPUDeviceOps initWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:betaDeltaData:gammaDeltaData:betaMomentumData:gammaMomentumData:](&v23, sel_initWithType_params_inDeltaData_outDeltaData_weightsDeltaData_biasDeltaData_weightsMomentumData_biasMomentumData_betaDeltaData_gammaDeltaData_betaMomentumData_gammaMomentumData_, *(_QWORD *)&a3, a4, a5, a6, a7, a8, a9, a10, 0, 0, 0, 0);
  v15 = v14;
  if (v14)
  {
    v14->_hasAttnBias = 0;
    v14->_hasKeyMask = 0;
    v14->_hasAttnMask = 0;
    keyMask = v14->_keyMask;
    v14->_keyMask = 0;

    attnMask = v15->_attnMask;
    v15->_attnMask = 0;

    v15->_keyMaskStride = 0;
    v15->_backpropCacheSize = 0;
    backpropCacheData = v15->_backpropCacheData;
    v15->_backpropCacheData = 0;

    attnBiasDeltaData = v15->_attnBiasDeltaData;
    v15->_attnBiasDeltaData = 0;

    weightsMomentumDeltaDataArray = v15->_weightsMomentumDeltaDataArray;
    v15->_weightsMomentumDeltaDataArray = 0;

    biasMomentumDeltaDataArray = v15->_biasMomentumDeltaDataArray;
    v15->_biasMomentumDeltaDataArray = 0;

  }
  return v15;
}

- (BOOL)hasAttnBias
{
  return self->_hasAttnBias;
}

- (void)setHasAttnBias:(BOOL)a3
{
  self->_hasAttnBias = a3;
}

- (BOOL)hasKeyMask
{
  return self->_hasKeyMask;
}

- (void)setHasKeyMask:(BOOL)a3
{
  self->_hasKeyMask = a3;
}

- (BOOL)hasAttnMask
{
  return self->_hasAttnMask;
}

- (void)setHasAttnMask:(BOOL)a3
{
  self->_hasAttnMask = a3;
}

- (NSData)keyMask
{
  return self->_keyMask;
}

- (void)setKeyMask:(id)a3
{
  objc_storeStrong((id *)&self->_keyMask, a3);
}

- (NSData)attnMask
{
  return self->_attnMask;
}

- (void)setAttnMask:(id)a3
{
  objc_storeStrong((id *)&self->_attnMask, a3);
}

- (unint64_t)keyMaskStride
{
  return self->_keyMaskStride;
}

- (void)setKeyMaskStride:(unint64_t)a3
{
  self->_keyMaskStride = a3;
}

- (unint64_t)backpropCacheSize
{
  return self->_backpropCacheSize;
}

- (void)setBackpropCacheSize:(unint64_t)a3
{
  self->_backpropCacheSize = a3;
}

- (NSData)backpropCacheData
{
  return self->_backpropCacheData;
}

- (void)setBackpropCacheData:(id)a3
{
  objc_storeStrong((id *)&self->_backpropCacheData, a3);
}

- (NSArray)attnBiasDeltaData
{
  return self->_attnBiasDeltaData;
}

- (void)setAttnBiasDeltaData:(id)a3
{
  objc_storeStrong((id *)&self->_attnBiasDeltaData, a3);
}

- (NSMutableArray)weightsMomentumDeltaDataArray
{
  return self->_weightsMomentumDeltaDataArray;
}

- (void)setWeightsMomentumDeltaDataArray:(id)a3
{
  objc_storeStrong((id *)&self->_weightsMomentumDeltaDataArray, a3);
}

- (NSMutableArray)biasMomentumDeltaDataArray
{
  return self->_biasMomentumDeltaDataArray;
}

- (void)setBiasMomentumDeltaDataArray:(id)a3
{
  objc_storeStrong((id *)&self->_biasMomentumDeltaDataArray, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biasMomentumDeltaDataArray, 0);
  objc_storeStrong((id *)&self->_weightsMomentumDeltaDataArray, 0);
  objc_storeStrong((id *)&self->_attnBiasDeltaData, 0);
  objc_storeStrong((id *)&self->_backpropCacheData, 0);
  objc_storeStrong((id *)&self->_attnMask, 0);
  objc_storeStrong((id *)&self->_keyMask, 0);
}

@end
