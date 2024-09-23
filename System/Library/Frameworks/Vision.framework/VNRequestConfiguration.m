@implementation VNRequestConfiguration

- (Class)requestClass
{
  return self->_requestClass;
}

- (NSDictionary)resolvedComputeStageDeviceAssignments
{
  NSMutableDictionary *computeStageDeviceAssignments;
  VNProcessingDeviceComputeDeviceBridge *v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  computeStageDeviceAssignments = self->_computeStageDeviceAssignments;
  if (computeStageDeviceAssignments)
    return (NSDictionary *)(id)-[NSMutableDictionary copy](computeStageDeviceAssignments, "copy");
  if (!self->_processingDevice)
    return (NSDictionary *)MEMORY[0x1E0C9AA70];
  v5 = -[VNProcessingDeviceComputeDeviceBridge initWithProcessingDevice:]([VNProcessingDeviceComputeDeviceBridge alloc], "initWithProcessingDevice:", self->_processingDevice);
  v7[0] = CFSTR("VNComputeStageMain");
  v7[1] = CFSTR("VNComputeStagePostProcessing");
  v8[0] = v5;
  v8[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v6;
}

- (unint64_t)memoryPoolId
{
  return self->_memoryPoolId;
}

- (BOOL)preferBackgroundProcessing
{
  return self->_preferBackgroundProcessing;
}

- (unint64_t)modelFileBackingStore
{
  return self->_modelFileBackingStore;
}

- (unint64_t)detectionLevel
{
  return self->_detectionLevel;
}

- (VNRequestConfiguration)initWithRequestClass:(Class)a3
{
  VNRequestConfiguration *v4;
  VNRequestConfiguration *v5;
  VNRequestConfiguration *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VNRequestConfiguration;
  v4 = -[VNRequestConfiguration init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_requestClass, a3);
    v5->_resolvedRevision = -[objc_class defaultRevision](a3, "defaultRevision");
    v5->_detectionLevel = 0;
    v5->_metalContextPriority = 1;
    v5->_preferBackgroundProcessing = 0;
    *(_OWORD *)&v5->_modelExecutionPriority = 0u;
    *(_OWORD *)&v5->_maximumProcessingDimensionOnTheLongSide = 0u;
    v6 = v5;
  }

  return v5;
}

- (void)setResolvedRevision:(unint64_t)a3
{
  self->_resolvedRevision = a3;
}

- (unint64_t)resolvedRevision
{
  return self->_resolvedRevision;
}

- (VNProcessingDevice)processingDevice
{
  return self->_processingDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingDevice, 0);
  objc_storeStrong((id *)&self->_requestClass, 0);
  objc_storeStrong((id *)&self->_computeStageDeviceAssignments, 0);
}

- (void)setProcessingDevice:(id)a3
{
  VNProcessingDevice *v4;
  NSMutableDictionary *computeStageDeviceAssignments;
  VNProcessingDevice *processingDevice;

  v4 = (VNProcessingDevice *)a3;
  computeStageDeviceAssignments = self->_computeStageDeviceAssignments;
  self->_computeStageDeviceAssignments = 0;

  processingDevice = self->_processingDevice;
  self->_processingDevice = v4;

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  uint64_t v6;
  id v7;

  v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithRequestClass:", self->_requestClass);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setResolvedRevision:", self->_resolvedRevision);
    objc_msgSend(v5, "setDetectionLevel:", self->_detectionLevel);
    objc_msgSend(v5, "setMetalContextPriority:", self->_metalContextPriority);
    objc_msgSend(v5, "setModelExecutionPriority:", self->_modelExecutionPriority);
    objc_msgSend(v5, "setPreferBackgroundProcessing:", self->_preferBackgroundProcessing);
    objc_msgSend(v5, "setModelFileBackingStore:", self->_modelFileBackingStore);
    objc_msgSend(v5, "setMaximumProcessingDimensionOnTheLongSide:", self->_maximumProcessingDimensionOnTheLongSide);
    objc_msgSend(v5, "setMemoryPoolId:", self->_memoryPoolId);
    objc_storeStrong(v5 + 6, self->_processingDevice);
    v6 = -[NSMutableDictionary mutableCopy](self->_computeStageDeviceAssignments, "mutableCopy");
    v7 = v5[1];
    v5[1] = (id)v6;

  }
  return v5;
}

- (void)setModelFileBackingStore:(unint64_t)a3
{
  self->_modelFileBackingStore = a3;
}

- (void)setMemoryPoolId:(unint64_t)a3
{
  self->_memoryPoolId = a3;
}

- (void)setDetectionLevel:(unint64_t)a3
{
  self->_detectionLevel = a3;
}

- (void)setPreferBackgroundProcessing:(BOOL)a3
{
  self->_preferBackgroundProcessing = a3;
}

- (void)setMetalContextPriority:(unint64_t)a3
{
  self->_metalContextPriority = a3;
}

- (void)setMaximumProcessingDimensionOnTheLongSide:(unint64_t)a3
{
  self->_maximumProcessingDimensionOnTheLongSide = a3;
}

- (void)setComputeDevice:(id)a3 forComputeStage:(id)a4
{
  id v6;
  VNProcessingDevice *processingDevice;
  NSMutableDictionary *computeStageDeviceAssignments;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  processingDevice = self->_processingDevice;
  self->_processingDevice = 0;

  computeStageDeviceAssignments = self->_computeStageDeviceAssignments;
  if (v11)
  {
    if (!computeStageDeviceAssignments)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v10 = self->_computeStageDeviceAssignments;
      self->_computeStageDeviceAssignments = v9;

      computeStageDeviceAssignments = self->_computeStageDeviceAssignments;
    }
    -[NSMutableDictionary setObject:forKey:](computeStageDeviceAssignments, "setObject:forKey:", v11, v6);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](computeStageDeviceAssignments, "removeObjectForKey:", v6);
  }

}

- (unint64_t)maximumProcessingDimensionOnTheLongSide
{
  return self->_maximumProcessingDimensionOnTheLongSide;
}

- (id)computeDeviceForComputeStage:(id)a3
{
  -[NSMutableDictionary objectForKey:](self->_computeStageDeviceAssignments, "objectForKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSDictionary)computeStageDeviceAssignments
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_computeStageDeviceAssignments, "copy");
}

- (void)setComputeStageDeviceAssignments:(id)a3
{
  VNProcessingDevice *processingDevice;
  NSMutableDictionary *v5;
  NSMutableDictionary *computeStageDeviceAssignments;
  id v7;

  v7 = a3;
  processingDevice = self->_processingDevice;
  self->_processingDevice = 0;

  v5 = (NSMutableDictionary *)objc_msgSend(v7, "mutableCopy");
  computeStageDeviceAssignments = self->_computeStageDeviceAssignments;
  self->_computeStageDeviceAssignments = v5;

}

- (id)description
{
  id v3;
  void *i;
  objc_property_t *v5;
  unint64_t j;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t k;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  unsigned int outCount;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    for (i = (void *)objc_opt_class(); i && i != (void *)objc_opt_class(); i = (void *)objc_msgSend(i, "superclass"))
    {
      outCount = 0;
      v5 = class_copyPropertyList((Class)i, &outCount);
      if (outCount)
      {
        for (j = 0; j < outCount; ++j)
        {
          v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", property_getName(v5[j]));
          objc_msgSend(v3, "addObject:", v7);

        }
      }
      free(v5);
    }
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(v3, "sortUsingSelector:", sel_compare_);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 32 * objc_msgSend(v3, "count"));
  v21.receiver = self;
  v21.super_class = (Class)VNRequestConfiguration;
  -[VNRequestConfiguration description](&v21, sel_description);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:", v9);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = v3;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v18;
    do
    {
      for (k = 0; k != v11; ++k)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v10);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * k);
        -[VNRequestConfiguration valueForKey:](self, "valueForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "appendFormat:", CFSTR("\n    %@=%@"), v14, v15, (_QWORD)v17);

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v11);
  }

  return v8;
}

- (unint64_t)metalContextPriority
{
  return self->_metalContextPriority;
}

- (unint64_t)modelExecutionPriority
{
  return self->_modelExecutionPriority;
}

- (void)setModelExecutionPriority:(unint64_t)a3
{
  self->_modelExecutionPriority = a3;
}

@end
