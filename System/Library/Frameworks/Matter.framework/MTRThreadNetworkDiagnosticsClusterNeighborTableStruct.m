@implementation MTRThreadNetworkDiagnosticsClusterNeighborTableStruct

- (MTRThreadNetworkDiagnosticsClusterNeighborTableStruct)init
{
  MTRThreadNetworkDiagnosticsClusterNeighborTableStruct *v2;
  MTRThreadNetworkDiagnosticsClusterNeighborTableStruct *v3;
  NSNumber *extAddress;
  NSNumber *age;
  NSNumber *rloc16;
  NSNumber *linkFrameCounter;
  NSNumber *mleFrameCounter;
  NSNumber *lqi;
  NSNumber *averageRssi;
  NSNumber *lastRssi;
  NSNumber *frameErrorRate;
  NSNumber *messageErrorRate;
  NSNumber *rxOnWhenIdle;
  NSNumber *fullThreadDevice;
  NSNumber *fullNetworkData;
  NSNumber *isChild;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)MTRThreadNetworkDiagnosticsClusterNeighborTableStruct;
  v2 = -[MTRThreadNetworkDiagnosticsClusterNeighborTableStruct init](&v19, sel_init);
  v3 = v2;
  if (v2)
  {
    extAddress = v2->_extAddress;
    v2->_extAddress = (NSNumber *)&unk_250591B18;

    age = v3->_age;
    v3->_age = (NSNumber *)&unk_250591B18;

    rloc16 = v3->_rloc16;
    v3->_rloc16 = (NSNumber *)&unk_250591B18;

    linkFrameCounter = v3->_linkFrameCounter;
    v3->_linkFrameCounter = (NSNumber *)&unk_250591B18;

    mleFrameCounter = v3->_mleFrameCounter;
    v3->_mleFrameCounter = (NSNumber *)&unk_250591B18;

    lqi = v3->_lqi;
    v3->_lqi = (NSNumber *)&unk_250591B18;

    averageRssi = v3->_averageRssi;
    v3->_averageRssi = 0;

    lastRssi = v3->_lastRssi;
    v3->_lastRssi = 0;

    frameErrorRate = v3->_frameErrorRate;
    v3->_frameErrorRate = (NSNumber *)&unk_250591B18;

    messageErrorRate = v3->_messageErrorRate;
    v3->_messageErrorRate = (NSNumber *)&unk_250591B18;

    rxOnWhenIdle = v3->_rxOnWhenIdle;
    v3->_rxOnWhenIdle = (NSNumber *)&unk_250591B18;

    fullThreadDevice = v3->_fullThreadDevice;
    v3->_fullThreadDevice = (NSNumber *)&unk_250591B18;

    fullNetworkData = v3->_fullNetworkData;
    v3->_fullNetworkData = (NSNumber *)&unk_250591B18;

    isChild = v3->_isChild;
    v3->_isChild = (NSNumber *)&unk_250591B18;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRThreadNetworkDiagnosticsClusterNeighborTableStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;

  v4 = objc_alloc_init(MTRThreadNetworkDiagnosticsClusterNeighborTableStruct);
  objc_msgSend_extAddress(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setExtAddress_(v4, v8, (uint64_t)v7);

  objc_msgSend_age(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAge_(v4, v12, (uint64_t)v11);

  objc_msgSend_rloc16(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRloc16_(v4, v16, (uint64_t)v15);

  objc_msgSend_linkFrameCounter(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLinkFrameCounter_(v4, v20, (uint64_t)v19);

  objc_msgSend_mleFrameCounter(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMleFrameCounter_(v4, v24, (uint64_t)v23);

  objc_msgSend_lqi(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLqi_(v4, v28, (uint64_t)v27);

  objc_msgSend_averageRssi(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAverageRssi_(v4, v32, (uint64_t)v31);

  objc_msgSend_lastRssi(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLastRssi_(v4, v36, (uint64_t)v35);

  objc_msgSend_frameErrorRate(self, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFrameErrorRate_(v4, v40, (uint64_t)v39);

  objc_msgSend_messageErrorRate(self, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMessageErrorRate_(v4, v44, (uint64_t)v43);

  objc_msgSend_rxOnWhenIdle(self, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRxOnWhenIdle_(v4, v48, (uint64_t)v47);

  objc_msgSend_fullThreadDevice(self, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFullThreadDevice_(v4, v52, (uint64_t)v51);

  objc_msgSend_fullNetworkData(self, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFullNetworkData_(v4, v56, (uint64_t)v55);

  objc_msgSend_isChild(self, v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setIsChild_(v4, v60, (uint64_t)v59);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: extAddress:%@; age:%@; rloc16:%@; linkFrameCounter:%@; mleFrameCounter:%@; lqi:%@; averageRssi:%@; lastRssi:%@; frameErrorRate:%@; messageErrorRate:%@; rxOnWhenIdle:%@; fullThreadDevice:%@; fullNetworkData:%@; isChild:%@; >"),
    v5,
    self->_extAddress,
    self->_age,
    self->_rloc16,
    self->_linkFrameCounter,
    self->_mleFrameCounter,
    self->_lqi,
    self->_averageRssi,
    self->_lastRssi,
    self->_frameErrorRate,
    self->_messageErrorRate,
    self->_rxOnWhenIdle,
    self->_fullThreadDevice,
    self->_fullNetworkData,
    self->_isChild);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)extAddress
{
  return self->_extAddress;
}

- (void)setExtAddress:(NSNumber *)extAddress
{
  objc_setProperty_nonatomic_copy(self, a2, extAddress, 8);
}

- (NSNumber)age
{
  return self->_age;
}

- (void)setAge:(NSNumber *)age
{
  objc_setProperty_nonatomic_copy(self, a2, age, 16);
}

- (NSNumber)rloc16
{
  return self->_rloc16;
}

- (void)setRloc16:(NSNumber *)rloc16
{
  objc_setProperty_nonatomic_copy(self, a2, rloc16, 24);
}

- (NSNumber)linkFrameCounter
{
  return self->_linkFrameCounter;
}

- (void)setLinkFrameCounter:(NSNumber *)linkFrameCounter
{
  objc_setProperty_nonatomic_copy(self, a2, linkFrameCounter, 32);
}

- (NSNumber)mleFrameCounter
{
  return self->_mleFrameCounter;
}

- (void)setMleFrameCounter:(NSNumber *)mleFrameCounter
{
  objc_setProperty_nonatomic_copy(self, a2, mleFrameCounter, 40);
}

- (NSNumber)lqi
{
  return self->_lqi;
}

- (void)setLqi:(NSNumber *)lqi
{
  objc_setProperty_nonatomic_copy(self, a2, lqi, 48);
}

- (NSNumber)averageRssi
{
  return self->_averageRssi;
}

- (void)setAverageRssi:(NSNumber *)averageRssi
{
  objc_setProperty_nonatomic_copy(self, a2, averageRssi, 56);
}

- (NSNumber)lastRssi
{
  return self->_lastRssi;
}

- (void)setLastRssi:(NSNumber *)lastRssi
{
  objc_setProperty_nonatomic_copy(self, a2, lastRssi, 64);
}

- (NSNumber)frameErrorRate
{
  return self->_frameErrorRate;
}

- (void)setFrameErrorRate:(NSNumber *)frameErrorRate
{
  objc_setProperty_nonatomic_copy(self, a2, frameErrorRate, 72);
}

- (NSNumber)messageErrorRate
{
  return self->_messageErrorRate;
}

- (void)setMessageErrorRate:(NSNumber *)messageErrorRate
{
  objc_setProperty_nonatomic_copy(self, a2, messageErrorRate, 80);
}

- (NSNumber)rxOnWhenIdle
{
  return self->_rxOnWhenIdle;
}

- (void)setRxOnWhenIdle:(NSNumber *)rxOnWhenIdle
{
  objc_setProperty_nonatomic_copy(self, a2, rxOnWhenIdle, 88);
}

- (NSNumber)fullThreadDevice
{
  return self->_fullThreadDevice;
}

- (void)setFullThreadDevice:(NSNumber *)fullThreadDevice
{
  objc_setProperty_nonatomic_copy(self, a2, fullThreadDevice, 96);
}

- (NSNumber)fullNetworkData
{
  return self->_fullNetworkData;
}

- (void)setFullNetworkData:(NSNumber *)fullNetworkData
{
  objc_setProperty_nonatomic_copy(self, a2, fullNetworkData, 104);
}

- (NSNumber)isChild
{
  return self->_isChild;
}

- (void)setIsChild:(NSNumber *)isChild
{
  objc_setProperty_nonatomic_copy(self, a2, isChild, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isChild, 0);
  objc_storeStrong((id *)&self->_fullNetworkData, 0);
  objc_storeStrong((id *)&self->_fullThreadDevice, 0);
  objc_storeStrong((id *)&self->_rxOnWhenIdle, 0);
  objc_storeStrong((id *)&self->_messageErrorRate, 0);
  objc_storeStrong((id *)&self->_frameErrorRate, 0);
  objc_storeStrong((id *)&self->_lastRssi, 0);
  objc_storeStrong((id *)&self->_averageRssi, 0);
  objc_storeStrong((id *)&self->_lqi, 0);
  objc_storeStrong((id *)&self->_mleFrameCounter, 0);
  objc_storeStrong((id *)&self->_linkFrameCounter, 0);
  objc_storeStrong((id *)&self->_rloc16, 0);
  objc_storeStrong((id *)&self->_age, 0);
  objc_storeStrong((id *)&self->_extAddress, 0);
}

@end
