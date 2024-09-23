@implementation MLLayerExecutionSchedule

- (MLLayerExecutionSchedule)initWithLayerError:(int64_t)a3
{
  return -[MLLayerExecutionSchedule initWithComputeUnits:layerName:layerError:layerTypeName:supportedComputeUnits:layerIndex:supportMessages:computeTimeRatio:](self, "initWithComputeUnits:layerName:layerError:layerTypeName:supportedComputeUnits:layerIndex:supportMessages:computeTimeRatio:", 0, &stru_1E3D68DC8, a3, &stru_1E3D68DC8, 0, 0, NAN, MEMORY[0x1E0C9AA70]);
}

- (MLLayerExecutionSchedule)initWithComputeUnits:(unint64_t)a3 layerName:(id)a4 layerError:(int64_t)a5 layerTypeName:(id)a6 supportedComputeUnits:(unint64_t)a7 layerIndex:(int64_t)a8
{
  return -[MLLayerExecutionSchedule initWithComputeUnits:layerName:layerError:layerTypeName:supportedComputeUnits:layerIndex:supportMessages:computeTimeRatio:](self, "initWithComputeUnits:layerName:layerError:layerTypeName:supportedComputeUnits:layerIndex:supportMessages:computeTimeRatio:", a3, a4, a5, a6, a7, a8, NAN, MEMORY[0x1E0C9AA70]);
}

- (MLLayerExecutionSchedule)initWithComputeUnits:(unint64_t)a3 layerName:(id)a4 layerError:(int64_t)a5 layerTypeName:(id)a6 supportedComputeUnits:(unint64_t)a7 layerIndex:(int64_t)a8 supportMessages:(id)a9 computeTimeRatio:(double)a10
{
  id v17;
  id v18;
  id v19;
  MLLayerExecutionSchedule *v20;
  MLLayerExecutionSchedule *v21;
  uint64_t v22;
  NSString *layerName;
  uint64_t v24;
  NSString *layerTypeName;
  objc_super v27;

  v17 = a4;
  v18 = a6;
  v19 = a9;
  v27.receiver = self;
  v27.super_class = (Class)MLLayerExecutionSchedule;
  v20 = -[MLLayerExecutionSchedule init](&v27, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_layerError = a5;
    v20->_preferredComputeUnit = a3;
    v22 = objc_msgSend(v17, "copy");
    layerName = v21->_layerName;
    v21->_layerName = (NSString *)v22;

    v24 = objc_msgSend(v18, "copy");
    layerTypeName = v21->_layerTypeName;
    v21->_layerTypeName = (NSString *)v24;

    v21->_supportedComputeUnits = a7;
    v21->_layerIndex = a8;
    objc_storeStrong((id *)&v21->_supportMessagesPerComputeUnit, a9);
    v21->_computeTimeRatio = a10;
  }

  return v21;
}

- (int64_t)layerError
{
  return self->_layerError;
}

- (NSString)layerName
{
  return self->_layerName;
}

- (unint64_t)preferredComputeUnit
{
  return self->_preferredComputeUnit;
}

- (NSString)layerTypeName
{
  return self->_layerTypeName;
}

- (unint64_t)supportedComputeUnits
{
  return self->_supportedComputeUnits;
}

- (int64_t)layerIndex
{
  return self->_layerIndex;
}

- (NSDictionary)supportMessagesPerComputeUnit
{
  return self->_supportMessagesPerComputeUnit;
}

- (double)computeTimeRatio
{
  return self->_computeTimeRatio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportMessagesPerComputeUnit, 0);
  objc_storeStrong((id *)&self->_layerTypeName, 0);
  objc_storeStrong((id *)&self->_layerName, 0);
}

@end
