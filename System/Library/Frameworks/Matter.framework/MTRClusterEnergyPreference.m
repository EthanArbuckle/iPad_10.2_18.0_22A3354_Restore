@implementation MTRClusterEnergyPreference

- (id)readAttributeEnergyBalancesWithParams:(id)a3
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250595598, &unk_250594530, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)readAttributeCurrentEnergyBalanceWithParams:(id)a3
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250595598, &unk_250594548, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)writeAttributeCurrentEnergyBalanceWithValue:(id)a3 expectedValueInterval:(id)a4
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeCurrentEnergyBalanceWithValue_expectedValueInterval_params_, a3);
}

- (void)writeAttributeCurrentEnergyBalanceWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5
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
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250595598, &unk_250594548, v19, v8, v11);

}

- (id)readAttributeEnergyPrioritiesWithParams:(id)a3
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250595598, &unk_250594800, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)readAttributeLowPowerModeSensitivitiesWithParams:(id)a3
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250595598, &unk_250594518, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)readAttributeCurrentLowPowerModeSensitivityWithParams:(id)a3
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250595598, &unk_250594680, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)writeAttributeCurrentLowPowerModeSensitivityWithValue:(id)a3 expectedValueInterval:(id)a4
{
  MEMORY[0x24BEDD108](self, sel_writeAttributeCurrentLowPowerModeSensitivityWithValue_expectedValueInterval_params_, a3);
}

- (void)writeAttributeCurrentLowPowerModeSensitivityWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5
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
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_250595598, &unk_250594680, v19, v8, v11);

}

- (id)readAttributeGeneratedCommandListWithParams:(id)a3
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250595598, &unk_250594560, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)readAttributeAcceptedCommandListWithParams:(id)a3
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250595598, &unk_250594578, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250595598, &unk_250594590, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)readAttributeAttributeListWithParams:(id)a3
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250595598, &unk_2505945A8, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)readAttributeFeatureMapWithParams:(id)a3
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250595598, &unk_2505945C0, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)readAttributeClusterRevisionWithParams:(id)a3
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
  objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_250595598, &unk_2505945D8, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
