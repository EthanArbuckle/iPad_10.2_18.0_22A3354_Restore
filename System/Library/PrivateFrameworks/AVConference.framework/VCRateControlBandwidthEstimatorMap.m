@implementation VCRateControlBandwidthEstimatorMap

- (VCRateControlBandwidthEstimatorMap)init
{
  VCRateControlBandwidthEstimatorMap *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)VCRateControlBandwidthEstimatorMap;
  v2 = -[VCRateControlBandwidthEstimatorMap init](&v4, sel_init);
  if (v2)
  {
    v2->_estimatorMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_currentActiveEstimatorID = -1;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCRateControlBandwidthEstimatorMap;
  -[VCRateControlBandwidthEstimatorMap dealloc](&v3, sel_dealloc);
}

- (double)estimatedBandwidth
{
  double result;

  VCRateControlBandwidthEstimatorMap_EstimatedBandwidthWithArrivalTime((uint64_t)self, 0.0);
  return result;
}

- (double)estimatedBandwidthUncapped
{
  double result;

  VCRateControlBandwidthEstimatorMap_EstimatedBandwidthUncappedWithArrivalTime((uint64_t)self, 0.0);
  return result;
}

- (void)setEstimatedBandwidthUncapped:(double)a3
{
  self->_estimatedBandwidthUncapped = a3;
}

uint64_t __VCRateControlBandwidthEstimatorMap_EstimatedBandwidthWithArrivalTime_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  double v5;
  uint64_t result;
  double v7;
  double v8;
  double v9;

  v5 = *(double *)(a1 + 40);
  if (v5 == 0.0 || (result = objc_msgSend(a3, "lastProbingArrivalTime"), v5 - v7 < 30.0))
  {
    v8 = *(double *)(*(_QWORD *)(a1 + 32) + 24);
    result = objc_msgSend(a3, "estimatedBandwidth");
    if (v8 >= v9)
      v9 = v8;
    *(double *)(*(_QWORD *)(a1 + 32) + 24) = v9;
  }
  return result;
}

uint64_t __VCRateControlBandwidthEstimatorMap_EstimatedBandwidthUncappedWithArrivalTime_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  double v5;
  uint64_t result;
  double v7;
  double v8;
  double v9;

  v5 = *(double *)(a1 + 40);
  if (v5 == 0.0 || (result = objc_msgSend(a3, "lastProbingArrivalTime"), v5 - v7 < 30.0))
  {
    v8 = *(double *)(*(_QWORD *)(a1 + 32) + 32);
    result = objc_msgSend(a3, "estimatedBandwidthUncapped");
    if (v8 >= v9)
      v9 = v8;
    *(double *)(*(_QWORD *)(a1 + 32) + 32) = v9;
  }
  return result;
}

void __VCRateControlBandwidthEstimatorMap_SetEstimatedBandwidth_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  VCRateControlBandwidthEstimator_SetEstimatedBandwidth(a3, *(double *)(a1 + 32));
}

- (void)setEstimatedBandwidth:(double)a3
{
  VCRateControlBandwidthEstimator *defaultEstimator;
  BOOL v5;
  NSMutableDictionary *estimatorMap;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  self->_estimatedBandwidth = a3;
  defaultEstimator = self->_defaultEstimator;
  if (defaultEstimator)
    v5 = self->_mode - 6 > 0xFFFFFFFD;
  else
    v5 = 1;
  if (v5)
  {
    estimatorMap = self->_estimatorMap;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __60__VCRateControlBandwidthEstimatorMap_setEstimatedBandwidth___block_invoke;
    v7[3] = &__block_descriptor_40_e58_v32__0__NSNumber_8__VCRateControlBandwidthEstimator_16_B24l;
    *(double *)&v7[4] = a3;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](estimatorMap, "enumerateKeysAndObjectsUsingBlock:", v7);
  }
  else
  {
    -[VCRateControlBandwidthEstimator setEstimatedBandwidth:](defaultEstimator, "setEstimatedBandwidth:");
  }
}

uint64_t __60__VCRateControlBandwidthEstimatorMap_setEstimatedBandwidth___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setEstimatedBandwidth:", *(double *)(a1 + 32));
}

- (void)setMode:(unsigned int)a3
{
  VCRateControlBandwidthEstimator *defaultEstimator;
  NSMutableDictionary *estimatorMap;
  _QWORD v7[4];
  unsigned int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  self->_mode = a3;
  defaultEstimator = self->_defaultEstimator;
  if (a3 - 6 > 0xFFFFFFFD || defaultEstimator == 0)
  {
    estimatorMap = self->_estimatorMap;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __46__VCRateControlBandwidthEstimatorMap_setMode___block_invoke;
    v7[3] = &__block_descriptor_36_e58_v32__0__NSNumber_8__VCRateControlBandwidthEstimator_16_B24l;
    v8 = a3;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](estimatorMap, "enumerateKeysAndObjectsUsingBlock:", v7);
  }
  else
  {
    -[VCRateControlBandwidthEstimator setMode:](defaultEstimator, "setMode:");
  }
}

uint64_t __46__VCRateControlBandwidthEstimatorMap_setMode___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setMode:", *(unsigned int *)(a1 + 32));
}

void __VCRateControlBandwidthEstimatorMap_SetRadioAccessTechnology_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  VCRateControlBandwidthEstimator_SetRadioAccessTechnology(a3, *(_DWORD *)(a1 + 32));
}

- (int)bandwidthEstimationState
{
  VCRateControlBandwidthEstimator *defaultEstimator;
  unsigned int v4;
  BOOL v5;

  defaultEstimator = self->_defaultEstimator;
  v4 = self->_mode - 6;
  if (defaultEstimator)
    v5 = v4 > 0xFFFFFFFD;
  else
    v5 = 1;
  if (v5)
    return 0;
  else
    return -[VCRateControlBandwidthEstimator bandwidthEstimationState](defaultEstimator, "bandwidthEstimationState");
}

void __VCRateControlBandwidthEstimatorMap_SetFastSuddenBandwidthDetectionEnabled_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  VCRateControlBandwidthEstimator_SetFastSuddenBandwidthDetectionEnabled(a3, *(_BYTE *)(a1 + 32));
}

- (void)setServerBag:(id)a3
{
  VCRateControlServerBag *serverBag;
  VCRateControlBandwidthEstimator *defaultEstimator;
  BOOL v7;
  NSMutableDictionary *estimatorMap;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  serverBag = self->_serverBag;
  if (serverBag != a3)
  {

    self->_serverBag = (VCRateControlServerBag *)a3;
  }
  defaultEstimator = self->_defaultEstimator;
  if (defaultEstimator)
    v7 = self->_mode - 6 > 0xFFFFFFFD;
  else
    v7 = 1;
  if (v7)
  {
    estimatorMap = self->_estimatorMap;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __51__VCRateControlBandwidthEstimatorMap_setServerBag___block_invoke;
    v9[3] = &unk_1E9E57AE0;
    v9[4] = a3;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](estimatorMap, "enumerateKeysAndObjectsUsingBlock:", v9);
  }
  else
  {
    -[VCRateControlBandwidthEstimator setServerBag:](defaultEstimator, "setServerBag:", a3);
  }
}

uint64_t __51__VCRateControlBandwidthEstimatorMap_setServerBag___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setServerBag:", *(_QWORD *)(a1 + 32));
}

- (unsigned)radioAccessTechnology
{
  return self->_radioAccessTechnology;
}

- (void)setRadioAccessTechnology:(unsigned int)a3
{
  self->_radioAccessTechnology = a3;
}

- (unsigned)mode
{
  return self->_mode;
}

- (VCRateControlServerBag)serverBag
{
  return self->_serverBag;
}

@end
