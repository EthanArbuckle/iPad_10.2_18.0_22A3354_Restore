@implementation IRAVOutputDeviceDO

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_modelID, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v3 = -[NSString hash](self->_deviceID, "hash");
  v4 = -[NSString hash](self->_modelID, "hash") - v3 + 32 * v3;
  v5 = -[NSString hash](self->_deviceName, "hash");
  v6 = self->_hasAirplayProperties - (v5 - v4 + 32 * v4) + 32 * (v5 - v4 + 32 * v4);
  v7 = self->_discoveredOverInfra - v6 + 32 * v6;
  v8 = self->_discoveredWithBroker - v7 + 32 * v7;
  v9 = self->_deviceType - v8 + 32 * v8;
  return self->_deviceSubType - v9 + 32 * v9;
}

+ (id)AVOutputDeviceToDO:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v3 = a3;
  objc_msgSend(v3, "airPlayProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "airPlayProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("IsDiscoveredOverInfra"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "BOOLValue");
  else
    v7 = 0;
  objc_msgSend(v3, "airPlayProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("IsDiscoveredWithBroker"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = objc_msgSend(v9, "BOOLValue");
  else
    v10 = 0;
  +[IRPreferences shared](IRPreferences, "shared");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "loiSameSpaceOverrideBrokerForAVODIDArray");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "containsObject:", v13);

  v15 = v14 | v10;
  objc_msgSend(v3, "deviceID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "modelID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRAVOutputDeviceDO aVOutputDeviceDOWithDeviceID:modelID:deviceName:hasAirplayProperties:discoveredOverInfra:discoveredWithBroker:deviceType:deviceSubType:](IRAVOutputDeviceDO, "aVOutputDeviceDOWithDeviceID:modelID:deviceName:hasAirplayProperties:discoveredOverInfra:discoveredWithBroker:deviceType:deviceSubType:", v16, v17, v18, v4 != 0, v7, v15, objc_msgSend(v3, "deviceType"), objc_msgSend(v3, "deviceSubType"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  IRAVOutputDeviceDO *v4;
  IRAVOutputDeviceDO *v5;
  BOOL v6;

  v4 = (IRAVOutputDeviceDO *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[IRAVOutputDeviceDO isEqualToAVOutputDeviceDO:](self, "isEqualToAVOutputDeviceDO:", v5);

  return v6;
}

- (BOOL)isEqualToAVOutputDeviceDO:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSString *deviceID;
  void *v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  NSString *modelID;
  void *v16;
  int v17;
  int v18;
  void *v19;
  int v20;
  NSString *deviceName;
  void *v22;
  int v23;
  int hasAirplayProperties;
  int discoveredOverInfra;
  int discoveredWithBroker;
  unint64_t deviceType;
  unint64_t deviceSubType;
  BOOL v29;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_16;
  v6 = self->_deviceID != 0;
  objc_msgSend(v4, "deviceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_16;
  deviceID = self->_deviceID;
  if (deviceID)
  {
    objc_msgSend(v5, "deviceID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSString isEqual:](deviceID, "isEqual:", v10);

    if (!v11)
      goto LABEL_16;
  }
  v12 = self->_modelID != 0;
  objc_msgSend(v5, "modelID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
    goto LABEL_16;
  modelID = self->_modelID;
  if (modelID)
  {
    objc_msgSend(v5, "modelID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[NSString isEqual:](modelID, "isEqual:", v16);

    if (!v17)
      goto LABEL_16;
  }
  v18 = self->_deviceName != 0;
  objc_msgSend(v5, "deviceName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 == 0;

  if (v18 == v20)
    goto LABEL_16;
  deviceName = self->_deviceName;
  if (deviceName)
  {
    objc_msgSend(v5, "deviceName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[NSString isEqual:](deviceName, "isEqual:", v22);

    if (!v23)
      goto LABEL_16;
  }
  hasAirplayProperties = self->_hasAirplayProperties;
  if (hasAirplayProperties == objc_msgSend(v5, "hasAirplayProperties")
    && (discoveredOverInfra = self->_discoveredOverInfra,
        discoveredOverInfra == objc_msgSend(v5, "discoveredOverInfra"))
    && (discoveredWithBroker = self->_discoveredWithBroker,
        discoveredWithBroker == objc_msgSend(v5, "discoveredWithBroker"))
    && (deviceType = self->_deviceType, deviceType == objc_msgSend(v5, "deviceType")))
  {
    deviceSubType = self->_deviceSubType;
    v29 = deviceSubType == objc_msgSend(v5, "deviceSubType");
  }
  else
  {
LABEL_16:
    v29 = 0;
  }

  return v29;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (NSString)modelID
{
  return self->_modelID;
}

- (BOOL)hasAirplayProperties
{
  return self->_hasAirplayProperties;
}

- (BOOL)discoveredWithBroker
{
  return self->_discoveredWithBroker;
}

- (BOOL)discoveredOverInfra
{
  return self->_discoveredOverInfra;
}

- (unint64_t)deviceType
{
  return self->_deviceType;
}

- (unint64_t)deviceSubType
{
  return self->_deviceSubType;
}

+ (IRAVOutputDeviceDO)aVOutputDeviceDOWithDeviceID:(id)a3 modelID:(id)a4 deviceName:(id)a5 hasAirplayProperties:(BOOL)a6 discoveredOverInfra:(BOOL)a7 discoveredWithBroker:(BOOL)a8 deviceType:(unint64_t)a9 deviceSubType:(unint64_t)a10
{
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL8 v12;
  id v16;
  id v17;
  id v18;
  void *v19;

  v10 = a8;
  v11 = a7;
  v12 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDeviceID:modelID:deviceName:hasAirplayProperties:discoveredOverInfra:discoveredWithBroker:deviceType:deviceSubType:", v18, v17, v16, v12, v11, v10, a9, a10);

  return (IRAVOutputDeviceDO *)v19;
}

- (IRAVOutputDeviceDO)initWithDeviceID:(id)a3 modelID:(id)a4 deviceName:(id)a5 hasAirplayProperties:(BOOL)a6 discoveredOverInfra:(BOOL)a7 discoveredWithBroker:(BOOL)a8 deviceType:(unint64_t)a9 deviceSubType:(unint64_t)a10
{
  id v17;
  id v18;
  id v19;
  IRAVOutputDeviceDO *v20;
  IRAVOutputDeviceDO *v21;
  objc_super v23;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v23.receiver = self;
  v23.super_class = (Class)IRAVOutputDeviceDO;
  v20 = -[IRAVOutputDeviceDO init](&v23, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_deviceID, a3);
    objc_storeStrong((id *)&v21->_modelID, a4);
    objc_storeStrong((id *)&v21->_deviceName, a5);
    v21->_hasAirplayProperties = a6;
    v21->_discoveredOverInfra = a7;
    v21->_discoveredWithBroker = a8;
    v21->_deviceType = a9;
    v21->_deviceSubType = a10;
  }

  return v21;
}

- (id)exportAsDictionary
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v4, "setDateFormat:", CFSTR("yyyy-MMM-dd HH:mm:ss.SSSSSS"));
  -[IRAVOutputDeviceDO deviceName](self, "deviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("deviceName"));

  -[IRAVOutputDeviceDO deviceID](self, "deviceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("deviceID"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[IRAVOutputDeviceDO discoveredOverInfra](self, "discoveredOverInfra"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("discoveredOverInfra"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[IRAVOutputDeviceDO discoveredWithBroker](self, "discoveredWithBroker"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("isDiscoveredWithBroker"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[IRAVOutputDeviceDO hasAirplayProperties](self, "hasAirplayProperties"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("hasAirplayProperties"));

  IRAVOutputDeviceTypeToString(-[IRAVOutputDeviceDO deviceType](self, "deviceType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("deviceType"));

  IRAVOutputDeviceSubTypeToString(-[IRAVOutputDeviceDO deviceSubType](self, "deviceSubType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("deviceSubType"));

  return v3;
}

- (id)copyWithReplacementDeviceID:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDeviceID:modelID:deviceName:hasAirplayProperties:discoveredOverInfra:discoveredWithBroker:deviceType:deviceSubType:", v4, self->_modelID, self->_deviceName, self->_hasAirplayProperties, self->_discoveredOverInfra, self->_discoveredWithBroker, self->_deviceType, self->_deviceSubType);

  return v5;
}

- (id)copyWithReplacementModelID:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDeviceID:modelID:deviceName:hasAirplayProperties:discoveredOverInfra:discoveredWithBroker:deviceType:deviceSubType:", self->_deviceID, v4, self->_deviceName, self->_hasAirplayProperties, self->_discoveredOverInfra, self->_discoveredWithBroker, self->_deviceType, self->_deviceSubType);

  return v5;
}

- (id)copyWithReplacementDeviceName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDeviceID:modelID:deviceName:hasAirplayProperties:discoveredOverInfra:discoveredWithBroker:deviceType:deviceSubType:", self->_deviceID, self->_modelID, v4, self->_hasAirplayProperties, self->_discoveredOverInfra, self->_discoveredWithBroker, self->_deviceType, self->_deviceSubType);

  return v5;
}

- (id)copyWithReplacementHasAirplayProperties:(BOOL)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDeviceID:modelID:deviceName:hasAirplayProperties:discoveredOverInfra:discoveredWithBroker:deviceType:deviceSubType:", self->_deviceID, self->_modelID, self->_deviceName, a3, self->_discoveredOverInfra, self->_discoveredWithBroker, self->_deviceType, self->_deviceSubType);
}

- (id)copyWithReplacementDiscoveredOverInfra:(BOOL)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDeviceID:modelID:deviceName:hasAirplayProperties:discoveredOverInfra:discoveredWithBroker:deviceType:deviceSubType:", self->_deviceID, self->_modelID, self->_deviceName, self->_hasAirplayProperties, a3, self->_discoveredWithBroker, self->_deviceType, self->_deviceSubType);
}

- (id)copyWithReplacementDiscoveredWithBroker:(BOOL)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDeviceID:modelID:deviceName:hasAirplayProperties:discoveredOverInfra:discoveredWithBroker:deviceType:deviceSubType:", self->_deviceID, self->_modelID, self->_deviceName, self->_hasAirplayProperties, self->_discoveredOverInfra, a3, self->_deviceType, self->_deviceSubType);
}

- (id)copyWithReplacementDeviceType:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDeviceID:modelID:deviceName:hasAirplayProperties:discoveredOverInfra:discoveredWithBroker:deviceType:deviceSubType:", self->_deviceID, self->_modelID, self->_deviceName, self->_hasAirplayProperties, self->_discoveredOverInfra, self->_discoveredWithBroker, a3, self->_deviceSubType);
}

- (id)copyWithReplacementDeviceSubType:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDeviceID:modelID:deviceName:hasAirplayProperties:discoveredOverInfra:discoveredWithBroker:deviceType:deviceSubType:", self->_deviceID, self->_modelID, self->_deviceName, self->_hasAirplayProperties, self->_discoveredOverInfra, self->_discoveredWithBroker, self->_deviceType, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IRAVOutputDeviceDO)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  IRAVOutputDeviceDO *v14;
  objc_class *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  objc_class *v20;
  void *v21;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const __CFString **v31;
  uint64_t *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  const __CFString *v39;
  uint64_t v40;
  const __CFString *v41;
  uint64_t v42;
  const __CFString *v43;
  uint64_t v44;
  const __CFString *v45;
  uint64_t v46;
  const __CFString *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  _QWORD v53[3];

  v53[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRAVOutputDeviceDO key \"deviceID\" (expected %@, decoded %@)"), v7, v9, 0);
      v52 = *MEMORY[0x24BDD0FC8];
      v53[0] = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRAVOutputDeviceDOOCNTErrorDomain"), 3, v11);
      objc_msgSend(v4, "failWithError:", v12);
LABEL_15:

LABEL_16:
LABEL_17:
      v14 = 0;
LABEL_18:

      goto LABEL_19;
    }
LABEL_6:
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modelID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRAVOutputDeviceDO key \"modelID\" (expected %@, decoded %@)"), v9, v10, 0);
        v50 = *MEMORY[0x24BDD0FC8];
        v51 = v11;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRAVOutputDeviceDOOCNTErrorDomain"), 3, v12);
        objc_msgSend(v4, "failWithError:", v17);
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      objc_msgSend(v4, "error");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v14 = 0;
LABEL_19:

        goto LABEL_20;
      }
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRAVOutputDeviceDO key \"deviceName\" (expected %@, decoded %@)"), v10, v11, 0);
        v48 = *MEMORY[0x24BDD0FC8];
        v49 = v12;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRAVOutputDeviceDOOCNTErrorDomain"), 3, v17);
        objc_msgSend(v4, "failWithError:", v21);

        goto LABEL_14;
      }
    }
    else
    {
      objc_msgSend(v4, "error");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
        goto LABEL_17;
    }
    v24 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("hasAirplayProperties"));
    if (v24)
      goto LABEL_23;
    objc_msgSend(v4, "error");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
      goto LABEL_17;
    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("hasAirplayProperties")) & 1) != 0)
    {
LABEL_23:
      v25 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("discoveredOverInfra"));
      if (v25)
        goto LABEL_24;
      objc_msgSend(v4, "error");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
        goto LABEL_17;
      if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("discoveredOverInfra")) & 1) != 0)
      {
LABEL_24:
        v26 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("discoveredWithBroker"));
        if (v26)
          goto LABEL_25;
        objc_msgSend(v4, "error");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
          goto LABEL_17;
        if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("discoveredWithBroker")) & 1) != 0)
        {
LABEL_25:
          v27 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("deviceType"));
          if (v27)
            goto LABEL_26;
          objc_msgSend(v4, "error");
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if (v35)
            goto LABEL_17;
          if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("deviceType")) & 1) != 0)
          {
LABEL_26:
            v28 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("deviceSubType"));
            if (v28)
              goto LABEL_27;
            v37 = v27;
            objc_msgSend(v4, "error");
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            if (v36)
              goto LABEL_17;
            v27 = v37;
            if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("deviceSubType")) & 1) != 0)
            {
LABEL_27:
              self = -[IRAVOutputDeviceDO initWithDeviceID:modelID:deviceName:hasAirplayProperties:discoveredOverInfra:discoveredWithBroker:deviceType:deviceSubType:](self, "initWithDeviceID:modelID:deviceName:hasAirplayProperties:discoveredOverInfra:discoveredWithBroker:deviceType:deviceSubType:", v5, v7, v9, v24 != 0, v25 != 0, v26 != 0, v27, v28);
              v14 = self;
              goto LABEL_18;
            }
            v38 = *MEMORY[0x24BDD0FC8];
            v39 = CFSTR("Missing serialized value for IRAVOutputDeviceDO.deviceSubType");
            v30 = (void *)MEMORY[0x24BDBCE70];
            v31 = &v39;
            v32 = &v38;
          }
          else
          {
            v40 = *MEMORY[0x24BDD0FC8];
            v41 = CFSTR("Missing serialized value for IRAVOutputDeviceDO.deviceType");
            v30 = (void *)MEMORY[0x24BDBCE70];
            v31 = &v41;
            v32 = &v40;
          }
        }
        else
        {
          v42 = *MEMORY[0x24BDD0FC8];
          v43 = CFSTR("Missing serialized value for IRAVOutputDeviceDO.discoveredWithBroker");
          v30 = (void *)MEMORY[0x24BDBCE70];
          v31 = &v43;
          v32 = &v42;
        }
      }
      else
      {
        v44 = *MEMORY[0x24BDD0FC8];
        v45 = CFSTR("Missing serialized value for IRAVOutputDeviceDO.discoveredOverInfra");
        v30 = (void *)MEMORY[0x24BDBCE70];
        v31 = &v45;
        v32 = &v44;
      }
    }
    else
    {
      v46 = *MEMORY[0x24BDD0FC8];
      v47 = CFSTR("Missing serialized value for IRAVOutputDeviceDO.hasAirplayProperties");
      v30 = (void *)MEMORY[0x24BDBCE70];
      v31 = &v47;
      v32 = &v46;
    }
    objc_msgSend(v30, "dictionaryWithObjects:forKeys:count:", v31, v32, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRAVOutputDeviceDOOCNTErrorDomain"), 1, v10);
    objc_msgSend(v4, "failWithError:", v11);
    goto LABEL_16;
  }
  objc_msgSend(v4, "error");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    goto LABEL_6;
  v14 = 0;
LABEL_20:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *deviceID;
  NSString *modelID;
  NSString *deviceName;
  id v8;

  v4 = a3;
  deviceID = self->_deviceID;
  v8 = v4;
  if (deviceID)
  {
    objc_msgSend(v4, "encodeObject:forKey:", deviceID, CFSTR("deviceID"));
    v4 = v8;
  }
  modelID = self->_modelID;
  if (modelID)
  {
    objc_msgSend(v8, "encodeObject:forKey:", modelID, CFSTR("modelID"));
    v4 = v8;
  }
  deviceName = self->_deviceName;
  if (deviceName)
  {
    objc_msgSend(v8, "encodeObject:forKey:", deviceName, CFSTR("deviceName"));
    v4 = v8;
  }
  objc_msgSend(v4, "encodeInt64:forKey:", self->_hasAirplayProperties, CFSTR("hasAirplayProperties"));
  objc_msgSend(v8, "encodeInt64:forKey:", self->_discoveredOverInfra, CFSTR("discoveredOverInfra"));
  objc_msgSend(v8, "encodeInt64:forKey:", self->_discoveredWithBroker, CFSTR("discoveredWithBroker"));
  objc_msgSend(v8, "encodeInt64:forKey:", self->_deviceType, CFSTR("deviceType"));
  objc_msgSend(v8, "encodeInt64:forKey:", self->_deviceSubType, CFSTR("deviceSubType"));

}

- (id)description
{
  id v3;
  NSString *deviceName;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v12 = *(_OWORD *)&self->_deviceID;
  deviceName = self->_deviceName;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hasAirplayProperties);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_discoveredOverInfra);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_discoveredWithBroker);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_deviceType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_deviceSubType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<IRAVOutputDeviceDO | deviceID:%@ modelID:%@ deviceName:%@ hasAirplayProperties:%@ discoveredOverInfra:%@ discoveredWithBroker:%@ deviceType:%@ deviceSubType:%@>"), v12, deviceName, v5, v6, v7, v8, v9);

  return v10;
}

@end
