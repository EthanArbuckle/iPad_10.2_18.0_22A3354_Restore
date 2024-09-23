@implementation MPAVAuxiliaryDevice

- (MPAVAuxiliaryDevice)initWithDictionary:(id)a3
{
  id v4;
  MPAVAuxiliaryDevice *v5;
  uint64_t v6;
  NSString *uniqueID;
  uint64_t v8;
  NSString *productName;
  uint64_t v10;
  NSString *deviceName;
  uint64_t v12;
  NSString *modelIdentifier;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MPAVAuxiliaryDevice;
  v5 = -[MPAVAuxiliaryDevice init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D481A8]);
    v6 = objc_claimAutoreleasedReturnValue();
    uniqueID = v5->_uniqueID;
    v5->_uniqueID = (NSString *)v6;

    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D481A0]);
    v8 = objc_claimAutoreleasedReturnValue();
    productName = v5->_productName;
    v5->_productName = (NSString *)v8;

    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D48190]);
    v10 = objc_claimAutoreleasedReturnValue();
    deviceName = v5->_deviceName;
    v5->_deviceName = (NSString *)v10;

    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D48188]);
    v12 = objc_claimAutoreleasedReturnValue();
    modelIdentifier = v5->_modelIdentifier;
    v5->_modelIdentifier = (NSString *)v12;

    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D48198]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_playing = objc_msgSend(v14, "BOOLValue");

  }
  return v5;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (NSString)productName
{
  return self->_productName;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (NSString)modelIdentifier
{
  return self->_modelIdentifier;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
}

+ (id)otherConnectedDevicesFromRouteDescription:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  MPAVAuxiliaryDevice *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D48180]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = -[MPAVAuxiliaryDevice initWithDictionary:]([MPAVAuxiliaryDevice alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

@end
