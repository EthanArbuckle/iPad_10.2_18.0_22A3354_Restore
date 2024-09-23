@implementation HMMTRProtocolOperation

- (HMMTRProtocolOperation)initWithOperationOfType:(unint64_t)a3 characteristic:(id)a4 device:(id)a5 clusterIDCharacteristicMap:(id)a6
{
  id v11;
  id v12;
  id v13;
  HMMTRProtocolOperation *v14;
  HMMTRProtocolOperation *v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMMTRProtocolOperation *v22;
  NSObject *v23;
  void *v24;
  objc_super v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)HMMTRProtocolOperation;
  v14 = -[HMMTRProtocolOperation init](&v26, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_type = a3;
    objc_storeStrong((id *)&v14->_characteristic, a4);
    objc_storeStrong((id *)&v15->_device, a5);
    v15->_endpoint = 1;
    v15->_handlingType = 0;
    objc_storeStrong((id *)&v15->_clusterIDCharacteristicMap, a6);
    objc_msgSend(v11, "service");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v11, "service");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "endpoint");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_msgSend(v18, "endpoint");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v15->_endpoint = (int)objc_msgSend(v20, "intValue");

      }
    }
    else
    {
      v21 = (void *)MEMORY[0x242656984]();
      v22 = v15;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v28 = v24;
        _os_log_impl(&dword_23E95B000, v23, OS_LOG_TYPE_ERROR, "%{public}@ERROR: Defaulting to Endpoint 1 for operation. This should not happen.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v21);
    }
  }

  return v15;
}

- (HMMTRProtocolOperation)initWithOperationOfType:(unint64_t)a3 characteristic:(id)a4 device:(id)a5 primaryArgument:(id)a6 clusterIDCharacteristicMap:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  HMMTRProtocolOperation *v16;
  HMMTRProtocolOperation *v17;
  objc_super v19;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)HMMTRProtocolOperation;
  v16 = -[HMMTRProtocolOperation init](&v19, sel_init);
  if (v16)
  {
    v17 = -[HMMTRProtocolOperation initWithOperationOfType:characteristic:device:clusterIDCharacteristicMap:](v16, "initWithOperationOfType:characteristic:device:clusterIDCharacteristicMap:", a3, v12, v13, v15);
    objc_storeStrong(&v17->_value, a6);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (HMMTRProtocolOperation)initWithOperationOfType:(unint64_t)a3 characteristicHandlingType:(unint64_t)a4 targetCharacteristic:(id)a5 targetValue:(id)a6 device:(id)a7 clusterIDCharacteristicMap:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMMTRProtocolOperation *v21;
  HMMTRProtocolOperation *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  HMMTRProtocolOperation *v30;
  void *v31;
  unint64_t v33;
  id obj;
  id v35;
  objc_super v36;

  v14 = a5;
  obj = a6;
  v35 = a6;
  v15 = a7;
  v16 = a8;
  objc_msgSend(v14, "service");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "type");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "characteristicsOfType:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v36.receiver = self;
    v36.super_class = (Class)HMMTRProtocolOperation;
    v21 = -[HMMTRProtocolOperation init](&v36, sel_init);
    if (v21)
    {
      v22 = v21;
      objc_msgSend(v14, "service");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "type");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "characteristicsOfType:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "firstObject");
      v33 = a4;
      v26 = v16;
      v27 = v15;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[HMMTRProtocolOperation initWithOperationOfType:characteristic:device:clusterIDCharacteristicMap:](v22, "initWithOperationOfType:characteristic:device:clusterIDCharacteristicMap:", a3, v28, v27, v26);

      v15 = v27;
      v16 = v26;

      objc_storeStrong((id *)(v29 + 56), obj);
      *(_QWORD *)(v29 + 40) = v33;
    }
    else
    {
      v29 = 0;
    }
    v31 = v35;
    self = (HMMTRProtocolOperation *)(id)v29;
    v30 = self;
  }
  else
  {
    v30 = 0;
    v31 = v35;
  }

  return v30;
}

- (HMMTRProtocolOperation)initWithOperationOfType:(unint64_t)a3 characteristic:(id)a4 matterDevice:(id)a5 clusterIDCharacteristicMap:(id)a6
{
  id v11;
  id v12;
  id v13;
  HMMTRProtocolOperation *v14;
  HMMTRProtocolOperation *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  objc_super v22;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)HMMTRProtocolOperation;
  v14 = -[HMMTRProtocolOperation init](&v22, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_type = a3;
    objc_storeStrong((id *)&v14->_characteristic, a4);
    objc_storeStrong((id *)&v15->_matterDevice, a5);
    v15->_endpoint = 1;
    v15->_handlingType = 0;
    objc_storeStrong((id *)&v15->_clusterIDCharacteristicMap, a6);
    objc_msgSend(v11, "service");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
    v18 = v17;

    objc_msgSend(v18, "endpoint");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v18, "endpoint");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v15->_endpoint = (int)objc_msgSend(v20, "intValue");

    }
  }

  return v15;
}

- (HMMTRProtocolOperation)initWithOperationOfType:(unint64_t)a3 characteristic:(id)a4 matterDevice:(id)a5 primaryArgument:(id)a6 clusterIDCharacteristicMap:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  HMMTRProtocolOperation *v16;
  HMMTRProtocolOperation *v17;
  objc_super v19;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)HMMTRProtocolOperation;
  v16 = -[HMMTRProtocolOperation init](&v19, sel_init);
  if (v16)
  {
    v17 = -[HMMTRProtocolOperation initWithOperationOfType:characteristic:matterDevice:clusterIDCharacteristicMap:](v16, "initWithOperationOfType:characteristic:matterDevice:clusterIDCharacteristicMap:", a3, v12, v13, v15);
    objc_storeStrong(&v17->_value, a6);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (HMMTRProtocolOperation)initWithOperationOfType:(unint64_t)a3 characteristicHandlingType:(unint64_t)a4 targetCharacteristic:(id)a5 targetValue:(id)a6 matterDevice:(id)a7 clusterIDCharacteristicMap:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMMTRProtocolOperation *v21;
  HMMTRProtocolOperation *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  HMMTRProtocolOperation *v30;
  void *v31;
  unint64_t v33;
  id obj;
  id v35;
  objc_super v36;

  v14 = a5;
  obj = a6;
  v35 = a6;
  v15 = a7;
  v16 = a8;
  objc_msgSend(v14, "service");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "type");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "characteristicsOfType:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v36.receiver = self;
    v36.super_class = (Class)HMMTRProtocolOperation;
    v21 = -[HMMTRProtocolOperation init](&v36, sel_init);
    if (v21)
    {
      v22 = v21;
      objc_msgSend(v14, "service");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "type");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "characteristicsOfType:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "firstObject");
      v33 = a4;
      v26 = v16;
      v27 = v15;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[HMMTRProtocolOperation initWithOperationOfType:characteristic:matterDevice:clusterIDCharacteristicMap:](v22, "initWithOperationOfType:characteristic:matterDevice:clusterIDCharacteristicMap:", a3, v28, v27, v26);

      v15 = v27;
      v16 = v26;

      objc_storeStrong((id *)(v29 + 56), obj);
      *(_QWORD *)(v29 + 40) = v33;
    }
    else
    {
      v29 = 0;
    }
    v31 = v35;
    self = (HMMTRProtocolOperation *)(id)v29;
    v30 = self;
  }
  else
  {
    v30 = 0;
    v31 = v35;
  }

  return v30;
}

- (HMMTRClusterDescription)characteristicDescription
{
  HMMTRClusterDescription *characteristicDescription;
  void *v4;
  void *v5;
  void *v6;
  unint64_t type;
  id value;
  unint64_t endpoint;
  NSDictionary *clusterIDCharacteristicMap;
  HMMTRClusterDescription *v11;
  HMMTRClusterDescription *v12;

  characteristicDescription = self->_characteristicDescription;
  if (!characteristicDescription)
  {
    +[HMMTRProtocolMap protocolMap](HMMTRProtocolMap, "protocolMap");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRProtocolOperation matterDevice](self, "matterDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[HAPCharacteristic type](self->_characteristic, "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    type = self->_type;
    value = self->_value;
    endpoint = self->_endpoint;
    clusterIDCharacteristicMap = self->_clusterIDCharacteristicMap;
    if (v5)
      objc_msgSend(v4, "descriptionOfMTRClusterForCharacteristicUUID:operation:value:endpointID:clusterIDCharacteristicMap:", v6, type, value, endpoint, clusterIDCharacteristicMap);
    else
      objc_msgSend(v4, "descriptionForCharacteristicUUID:operation:value:endpointID:clusterIDCharacteristicMap:", v6, type, value, endpoint, clusterIDCharacteristicMap);
    v11 = (HMMTRClusterDescription *)objc_claimAutoreleasedReturnValue();
    v12 = self->_characteristicDescription;
    self->_characteristicDescription = v11;

    characteristicDescription = self->_characteristicDescription;
  }
  return characteristicDescription;
}

- (HAPCharacteristic)characteristic
{
  return self->_characteristic;
}

- (void)setCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_characteristic, a3);
}

- (MTRBaseDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (MTRDevice)matterDevice
{
  return self->_matterDevice;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)handlingType
{
  return self->_handlingType;
}

- (void)setHandlingType:(unint64_t)a3
{
  self->_handlingType = a3;
}

- (void)setCharacteristicDescription:(id)a3
{
  objc_storeStrong((id *)&self->_characteristicDescription, a3);
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong(&self->_value, a3);
}

- (unint64_t)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(unint64_t)a3
{
  self->_endpoint = a3;
}

- (HAPCharacteristicWriteRequestTuple)writePrimaryRequestTuple
{
  return (HAPCharacteristicWriteRequestTuple *)objc_getProperty(self, a2, 72, 1);
}

- (void)setWritePrimaryRequestTuple:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (HAPCharacteristicWriteRequestTuple)writeSecondaryRequestTuple
{
  return (HAPCharacteristicWriteRequestTuple *)objc_getProperty(self, a2, 80, 1);
}

- (void)setWriteSecondaryRequestTuple:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (HMMTRDeviceTopology)topology
{
  return self->_topology;
}

- (void)setTopology:(id)a3
{
  objc_storeStrong((id *)&self->_topology, a3);
}

- (NSDictionary)clusterIDCharacteristicMap
{
  return self->_clusterIDCharacteristicMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clusterIDCharacteristicMap, 0);
  objc_storeStrong((id *)&self->_topology, 0);
  objc_storeStrong((id *)&self->_writeSecondaryRequestTuple, 0);
  objc_storeStrong((id *)&self->_writePrimaryRequestTuple, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_characteristicDescription, 0);
  objc_storeStrong((id *)&self->_matterDevice, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_characteristic, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_4211 != -1)
    dispatch_once(&logCategory__hmf_once_t2_4211, &__block_literal_global_4212);
  return (id)logCategory__hmf_once_v3_4213;
}

void __37__HMMTRProtocolOperation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v3_4213;
  logCategory__hmf_once_v3_4213 = v0;

}

@end
