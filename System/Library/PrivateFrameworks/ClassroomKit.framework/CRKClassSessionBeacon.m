@implementation CRKClassSessionBeacon

- (CRKClassSessionBeacon)init
{
  CRKClassSessionBeacon *v2;
  id v3;
  uint64_t v4;
  WPAdvertising *advertiser;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRKClassSessionBeacon;
  v2 = -[CRKClassSessionBeacon init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BEC2B58]);
    v4 = objc_msgSend(v3, "initWithDelegate:queue:", v2, MEMORY[0x24BDAC9B8]);
    advertiser = v2->_advertiser;
    v2->_advertiser = (WPAdvertising *)v4;

  }
  return v2;
}

- (void)startAdvertisingClassSessionWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CRKClassSessionBeacon setAdvertisedIdentifier:](self, "setAdvertisedIdentifier:", v4);
  v8 = 0;
  v9 = 0;
  objc_msgSend(v4, "organizationUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getUUIDBytes:", &v8);

  WORD2(v9) = __rev16(-[CRKClassSessionBeacon flags](self, "flags"));
  HIWORD(v9) = __rev16(objc_msgSend(v4, "groupID"));
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", &v8);
  v7 = objc_msgSend(v4, "leaderIP");

  -[CRKClassSessionBeacon startAdvertisingWithUUID:IPAddress:](self, "startAdvertisingWithUUID:IPAddress:", v6, v7);
}

- (void)startAdvertisingWithUUID:(id)a3 IPAddress:(unsigned int)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  _QWORD v24[5];
  _QWORD v25[6];

  v25[5] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (unsigned __int16)a4;
  -[CRKClassSessionBeacon beaconAdvertisement](self, "beaconAdvertisement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CRKClassSessionBeacon advertiser](self, "advertiser");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKClassSessionBeacon beaconAdvertisement](self, "beaconAdvertisement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deregisterService:", v10);

  }
  v11 = HIWORD(a4);
  v12 = *MEMORY[0x24BEC2B80];
  v24[0] = *MEMORY[0x24BEC2B78];
  v24[1] = v12;
  v13 = *MEMORY[0x24BEC2B88];
  v25[0] = &unk_24DA07FE8;
  v25[1] = v13;
  v24[2] = *MEMORY[0x24BEC2BA0];
  objc_msgSend(v6, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v14;
  v24[3] = *MEMORY[0x24BEC2B90];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v15;
  v24[4] = *MEMORY[0x24BEC2B98];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKClassSessionBeacon setBeaconAdvertisement:](self, "setBeaconAdvertisement:", v17);

  _CRKLogBluetooth_1();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    -[CRKClassSessionBeacon beaconAdvertisement](self, "beaconAdvertisement");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543362;
    v23 = v19;
    _os_log_impl(&dword_218C99000, v18, OS_LOG_TYPE_INFO, "Beacon advertisement %{public}@", (uint8_t *)&v22, 0xCu);

  }
  -[CRKClassSessionBeacon advertiser](self, "advertiser");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKClassSessionBeacon beaconAdvertisement](self, "beaconAdvertisement");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "registerService:", v21);

}

- (void)stopAdvertising
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _CRKLogBluetooth_1();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[CRKClassSessionBeacon advertisedIdentifier](self, "advertisedIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v4;
    _os_log_impl(&dword_218C99000, v3, OS_LOG_TYPE_INFO, "Bluetooth Beacon STOP advertising %{public}@", (uint8_t *)&v8, 0xCu);

  }
  -[CRKClassSessionBeacon beaconAdvertisement](self, "beaconAdvertisement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CRKClassSessionBeacon advertiser](self, "advertiser");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKClassSessionBeacon beaconAdvertisement](self, "beaconAdvertisement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deregisterService:", v7);

  }
  -[CRKClassSessionBeacon setBeaconAdvertisement:](self, "setBeaconAdvertisement:", 0);
  -[CRKClassSessionBeacon setAdvertising:](self, "setAdvertising:", 0);
}

- (void)advertiserDidUpdateState:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _CRKLogBluetooth_1();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "advertiserState"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v6;
    _os_log_impl(&dword_218C99000, v5, OS_LOG_TYPE_INFO, "Beacon advertiser updated state %{public}@", (uint8_t *)&v10, 0xCu);

  }
  if (objc_msgSend(v4, "state") == 3 && !-[CRKClassSessionBeacon isAdvertising](self, "isAdvertising"))
  {
    -[CRKClassSessionBeacon beaconAdvertisement](self, "beaconAdvertisement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[CRKClassSessionBeacon advertiser](self, "advertiser");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRKClassSessionBeacon beaconAdvertisement](self, "beaconAdvertisement");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "registerService:", v9);

    }
  }

}

- (void)advertiserDidRegisterService
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _CRKLogBluetooth_1();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[CRKClassSessionBeacon beaconAdvertisement](self, "beaconAdvertisement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_218C99000, v3, OS_LOG_TYPE_INFO, "Beacon advertiser registered service %{public}@", (uint8_t *)&v5, 0xCu);

  }
  -[CRKClassSessionBeacon setAdvertising:](self, "setAdvertising:", 1);
}

- (void)advertiserFailedToRegisterService
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "beaconAdvertisement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v3;
  OUTLINED_FUNCTION_0_0(&dword_218C99000, a2, v4, "Beacon advertiser faileed to register service %{public}@", (uint8_t *)&v5);

}

- (void)advertiserPendingServiceOfType:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a3;
  _CRKLogBluetooth_1();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[CRKClassSessionBeacon advertiserPendingServiceOfType:].cold.1((uint64_t)v3, v4, v5);

}

- (DMFControlSessionIdentifier)advertisedIdentifier
{
  return self->_advertisedIdentifier;
}

- (void)setAdvertisedIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isAdvertising
{
  return self->_advertising;
}

- (void)setAdvertising:(BOOL)a3
{
  self->_advertising = a3;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned __int16)a3
{
  self->_flags = a3;
}

- (WPAdvertising)advertiser
{
  return self->_advertiser;
}

- (NSDictionary)beaconAdvertisement
{
  return self->_beaconAdvertisement;
}

- (void)setBeaconAdvertisement:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_beaconAdvertisement, 0);
  objc_storeStrong((id *)&self->_advertiser, 0);
  objc_storeStrong((id *)&self->_advertisedIdentifier, 0);
}

- (void)advertiserPendingServiceOfType:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_218C99000, a2, a3, "Beacon advertiser pending to service %{public}@", (uint8_t *)&v3);
}

@end
