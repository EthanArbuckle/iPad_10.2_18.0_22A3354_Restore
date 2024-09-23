@implementation MLCSliceCPUDeviceOps

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

- (MLCSliceCPUDeviceOps)initWithType:(int)a3 params:(id)a4 inDeltaData:(id)a5 outDeltaData:(id)a6 weightsDeltaData:(id)a7 biasDeltaData:(id)a8 weightsMomentumData:(id)a9 biasMomentumData:(id)a10 betaDeltaData:(id)a11 gammaDeltaData:(id)a12 betaMomentumData:(id)a13 gammaMomentumData:(id)a14
{
  MLCSliceCPUDeviceOps *v14;
  MLCSliceCPUDeviceOps *v15;
  void *v16;
  uint64_t v17;
  NSArray *begin;
  uint64_t v19;
  NSArray *count;
  uint64_t v21;
  NSArray *stride;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)MLCSliceCPUDeviceOps;
  v14 = -[MLCCPUDeviceOps initWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:betaDeltaData:gammaDeltaData:betaMomentumData:gammaMomentumData:](&v24, sel_initWithType_params_inDeltaData_outDeltaData_weightsDeltaData_biasDeltaData_weightsMomentumData_biasMomentumData_betaDeltaData_gammaDeltaData_betaMomentumData_gammaMomentumData_, *(_QWORD *)&a3, a4, a5, a6, a7, a8, a9, a10, 0, 0, 0, 0);
  v15 = v14;
  if (v14)
  {
    v14->_beginOffset = 0;
    v16 = (void *)MEMORY[0x1E0C9AA60];
    v17 = objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    begin = v15->_begin;
    v15->_begin = (NSArray *)v17;

    v19 = objc_msgSend(v16, "mutableCopy");
    count = v15->_count;
    v15->_count = (NSArray *)v19;

    v21 = objc_msgSend(v16, "mutableCopy");
    stride = v15->_stride;
    v15->_stride = (NSArray *)v21;

  }
  return v15;
}

- (unint64_t)beginOffset
{
  return self->_beginOffset;
}

- (void)setBeginOffset:(unint64_t)a3
{
  self->_beginOffset = a3;
}

- (NSArray)begin
{
  return self->_begin;
}

- (void)setBegin:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (NSArray)count
{
  return self->_count;
}

- (void)setCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (NSArray)stride
{
  return self->_stride;
}

- (void)setStride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stride, 0);
  objc_storeStrong((id *)&self->_count, 0);
  objc_storeStrong((id *)&self->_begin, 0);
}

@end
