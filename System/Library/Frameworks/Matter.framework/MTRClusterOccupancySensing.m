@implementation MTRClusterOccupancySensing

- (NSDictionary)readAttributeOccupancyWithParams:(MTRReadParams *)params
{
  MTRReadParams *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;

  v4 = params;
  objc_msgSend_device(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250595C70, &unk_250594530, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeOccupancySensorTypeWithParams:(MTRReadParams *)params
{
  MTRReadParams *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;

  v4 = params;
  objc_msgSend_device(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250595C70, &unk_250594548, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeOccupancySensorTypeBitmapWithParams:(MTRReadParams *)params
{
  MTRReadParams *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;

  v4 = params;
  objc_msgSend_device(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250595C70, &unk_250594800, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (id)readAttributeHoldTimeWithParams:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;

  v4 = a3;
  objc_msgSend_device(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250595C70, &unk_250594518, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)writeAttributeHoldTimeWithValue:(id)a3 expectedValueInterval:(id)a4
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeHoldTimeWithValue_expectedValueInterval_params_, a3);
}

- (void)writeAttributeHoldTimeWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  id v19;

  v19 = a3;
  v8 = a4;
  objc_msgSend_timedWriteTimeout(a5, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250595C70, &unk_250594518, v19, v8, v11);

}

- (id)readAttributeHoldTimeLimitsWithParams:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;

  v4 = a3;
  objc_msgSend_device(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250595C70, &unk_250594680, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSDictionary)readAttributePIROccupiedToUnoccupiedDelayWithParams:(MTRReadParams *)params
{
  MTRReadParams *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;

  v4 = params;
  objc_msgSend_device(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250595C70, &unk_250594770, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributePIROccupiedToUnoccupiedDelayWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributePIROccupiedToUnoccupiedDelayWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributePIROccupiedToUnoccupiedDelayWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250595C70, &unk_250594770, v19, v8, v11);

}

- (NSDictionary)readAttributePIRUnoccupiedToOccupiedDelayWithParams:(MTRReadParams *)params
{
  MTRReadParams *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;

  v4 = params;
  objc_msgSend_device(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250595C70, &unk_250594848, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributePIRUnoccupiedToOccupiedDelayWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributePIRUnoccupiedToOccupiedDelayWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributePIRUnoccupiedToOccupiedDelayWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250595C70, &unk_250594848, v19, v8, v11);

}

- (NSDictionary)readAttributePIRUnoccupiedToOccupiedThresholdWithParams:(MTRReadParams *)params
{
  MTRReadParams *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;

  v4 = params;
  objc_msgSend_device(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250595C70, &unk_250594860, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributePIRUnoccupiedToOccupiedThresholdWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributePIRUnoccupiedToOccupiedThresholdWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributePIRUnoccupiedToOccupiedThresholdWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250595C70, &unk_250594860, v19, v8, v11);

}

- (NSDictionary)readAttributeUltrasonicOccupiedToUnoccupiedDelayWithParams:(MTRReadParams *)params
{
  MTRReadParams *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;

  v4 = params;
  objc_msgSend_device(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250595C70, &unk_250594D88, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeUltrasonicOccupiedToUnoccupiedDelayWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeUltrasonicOccupiedToUnoccupiedDelayWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeUltrasonicOccupiedToUnoccupiedDelayWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250595C70, &unk_250594D88, v19, v8, v11);

}

- (NSDictionary)readAttributeUltrasonicUnoccupiedToOccupiedDelayWithParams:(MTRReadParams *)params
{
  MTRReadParams *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;

  v4 = params;
  objc_msgSend_device(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250595C70, &unk_250594DA0, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeUltrasonicUnoccupiedToOccupiedDelayWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeUltrasonicUnoccupiedToOccupiedDelayWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeUltrasonicUnoccupiedToOccupiedDelayWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250595C70, &unk_250594DA0, v19, v8, v11);

}

- (NSDictionary)readAttributeUltrasonicUnoccupiedToOccupiedThresholdWithParams:(MTRReadParams *)params
{
  MTRReadParams *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;

  v4 = params;
  objc_msgSend_device(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250595C70, &unk_250594DB8, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributeUltrasonicUnoccupiedToOccupiedThresholdWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeUltrasonicUnoccupiedToOccupiedThresholdWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributeUltrasonicUnoccupiedToOccupiedThresholdWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250595C70, &unk_250594DB8, v19, v8, v11);

}

- (NSDictionary)readAttributePhysicalContactOccupiedToUnoccupiedDelayWithParams:(MTRReadParams *)params
{
  MTRReadParams *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;

  v4 = params;
  objc_msgSend_device(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250595C70, &unk_250594C80, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributePhysicalContactOccupiedToUnoccupiedDelayWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributePhysicalContactOccupiedToUnoccupiedDelayWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributePhysicalContactOccupiedToUnoccupiedDelayWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250595C70, &unk_250594C80, v19, v8, v11);

}

- (NSDictionary)readAttributePhysicalContactUnoccupiedToOccupiedDelayWithParams:(MTRReadParams *)params
{
  MTRReadParams *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;

  v4 = params;
  objc_msgSend_device(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250595C70, &unk_250594CB0, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributePhysicalContactUnoccupiedToOccupiedDelayWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributePhysicalContactUnoccupiedToOccupiedDelayWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributePhysicalContactUnoccupiedToOccupiedDelayWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250595C70, &unk_250594CB0, v19, v8, v11);

}

- (NSDictionary)readAttributePhysicalContactUnoccupiedToOccupiedThresholdWithParams:(MTRReadParams *)params
{
  MTRReadParams *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;

  v4 = params;
  objc_msgSend_device(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250595C70, &unk_250594CE0, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)writeAttributePhysicalContactUnoccupiedToOccupiedThresholdWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributePhysicalContactUnoccupiedToOccupiedThresholdWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (void)writeAttributePhysicalContactUnoccupiedToOccupiedThresholdWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  NSNumber *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSDictionary *v19;

  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  objc_msgSend_timedWriteTimeout(params, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250595C70, &unk_250594CE0, v19, v8, v11);

}

- (NSDictionary)readAttributeGeneratedCommandListWithParams:(MTRReadParams *)params
{
  MTRReadParams *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;

  v4 = params;
  objc_msgSend_device(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250595C70, &unk_250594560, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeAcceptedCommandListWithParams:(MTRReadParams *)params
{
  MTRReadParams *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;

  v4 = params;
  objc_msgSend_device(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250595C70, &unk_250594578, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (id)readAttributeEventListWithParams:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;

  v4 = a3;
  objc_msgSend_device(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250595C70, &unk_250594590, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSDictionary)readAttributeAttributeListWithParams:(MTRReadParams *)params
{
  MTRReadParams *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;

  v4 = params;
  objc_msgSend_device(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250595C70, &unk_2505945A8, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeFeatureMapWithParams:(MTRReadParams *)params
{
  MTRReadParams *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;

  v4 = params;
  objc_msgSend_device(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250595C70, &unk_2505945C0, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeClusterRevisionWithParams:(MTRReadParams *)params
{
  MTRReadParams *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;

  v4 = params;
  objc_msgSend_device(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endpointID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250595C70, &unk_2505945D8, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (MTRClusterOccupancySensing)initWithDevice:(MTRDevice *)device endpoint:(uint16_t)endpoint queue:(dispatch_queue_t)queue
{
  uint64_t v6;
  MTRDevice *v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  const char *v12;
  MTRClusterOccupancySensing *v13;

  v6 = endpoint;
  v8 = device;
  v9 = queue;
  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (MTRClusterOccupancySensing *)objc_msgSend_initWithDevice_endpointID_queue_(self, v12, (uint64_t)v8, v11, v9);

  return v13;
}

- (NSDictionary)readAttributePirOccupiedToUnoccupiedDelayWithParams:(MTRReadParams *)params
{
  objc_msgSend_readAttributePIROccupiedToUnoccupiedDelayWithParams_(self, a2, (uint64_t)params);
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)writeAttributePirOccupiedToUnoccupiedDelayWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributePIROccupiedToUnoccupiedDelayWithValue_expectedValueInterval_, dataValueDictionary);
}

- (void)writeAttributePirOccupiedToUnoccupiedDelayWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  MEMORY[0x24BEDD108](self, sel_writeAttributePIROccupiedToUnoccupiedDelayWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (NSDictionary)readAttributePirUnoccupiedToOccupiedDelayWithParams:(MTRReadParams *)params
{
  objc_msgSend_readAttributePIRUnoccupiedToOccupiedDelayWithParams_(self, a2, (uint64_t)params);
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)writeAttributePirUnoccupiedToOccupiedDelayWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributePIRUnoccupiedToOccupiedDelayWithValue_expectedValueInterval_, dataValueDictionary);
}

- (void)writeAttributePirUnoccupiedToOccupiedDelayWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  MEMORY[0x24BEDD108](self, sel_writeAttributePIRUnoccupiedToOccupiedDelayWithValue_expectedValueInterval_params_, dataValueDictionary);
}

- (NSDictionary)readAttributePirUnoccupiedToOccupiedThresholdWithParams:(MTRReadParams *)params
{
  objc_msgSend_readAttributePIRUnoccupiedToOccupiedThresholdWithParams_(self, a2, (uint64_t)params);
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)writeAttributePirUnoccupiedToOccupiedThresholdWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
  MEMORY[0x24BEDD108](self, sel_writeAttributePIRUnoccupiedToOccupiedThresholdWithValue_expectedValueInterval_, dataValueDictionary);
}

- (void)writeAttributePirUnoccupiedToOccupiedThresholdWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  MEMORY[0x24BEDD108](self, sel_writeAttributePIRUnoccupiedToOccupiedThresholdWithValue_expectedValueInterval_params_, dataValueDictionary);
}

@end
