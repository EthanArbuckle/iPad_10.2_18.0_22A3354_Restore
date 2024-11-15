@implementation ACCBLEPairingAccessory

- (ACCBLEPairingAccessory)initWithAccessoryUID:(id)a3 blePairingUUID:(id)a4 andAccInfo:(id)a5 supportedPairTypes:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ACCBLEPairingAccessory *v15;
  NSObject *v16;
  id v17;
  id v19;
  objc_super v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ACCBLEPairingAccessory;
  v15 = -[ACCBLEPairingAccessory init](&v20, sel_init);
  if (v15)
  {
    v19 = v11;
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v16 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
      v16 = MEMORY[0x24BDACB70];
      v17 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v22 = v19;
      v23 = 2112;
      v24 = v12;
      v25 = 2112;
      v26 = v13;
      v27 = 2112;
      v28 = v14;
      _os_log_impl(&dword_215447000, v16, OS_LOG_TYPE_DEFAULT, "ACCBLEPairingAccessory init, accessoryUID %@, blePairingUUID %@, accInfo %@, supportedPairTypes %@", buf, 0x2Au);
    }

    objc_storeStrong((id *)&v15->_accessoryUID, a3);
    v15->_desiredBLEPairingState = 0;
    objc_storeStrong((id *)&v15->_accInfo, a5);
    objc_storeStrong((id *)&v15->_blePairingUUID, a4);
    objc_storeStrong((id *)&v15->_supportedPairTypes, a6);
    v15->_blePairingFinished = 0;
    v11 = v19;
  }

  return v15;
}

- (NSString)accessoryUID
{
  return self->_accessoryUID;
}

- (void)setAccessoryUID:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryUID, a3);
}

- (BOOL)desiredBLEPairingState
{
  return self->_desiredBLEPairingState;
}

- (void)setDesiredBLEPairingState:(BOOL)a3
{
  self->_desiredBLEPairingState = a3;
}

- (NSDictionary)accInfo
{
  return self->_accInfo;
}

- (void)setAccInfo:(id)a3
{
  objc_storeStrong((id *)&self->_accInfo, a3);
}

- (NSData)blePairingUUID
{
  return self->_blePairingUUID;
}

- (void)setBlePairingUUID:(id)a3
{
  objc_storeStrong((id *)&self->_blePairingUUID, a3);
}

- (NSData)supportedPairTypes
{
  return self->_supportedPairTypes;
}

- (void)setSupportedPairTypes:(id)a3
{
  objc_storeStrong((id *)&self->_supportedPairTypes, a3);
}

- (BOOL)blePairingFinished
{
  return self->_blePairingFinished;
}

- (void)setBlePairingFinished:(BOOL)a3
{
  self->_blePairingFinished = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedPairTypes, 0);
  objc_storeStrong((id *)&self->_blePairingUUID, 0);
  objc_storeStrong((id *)&self->_accInfo, 0);
  objc_storeStrong((id *)&self->_accessoryUID, 0);
}

- (void)initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_215447000, MEMORY[0x24BDACB70], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

@end
