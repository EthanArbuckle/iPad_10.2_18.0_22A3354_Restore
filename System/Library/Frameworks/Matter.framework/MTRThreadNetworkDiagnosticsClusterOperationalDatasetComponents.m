@implementation MTRThreadNetworkDiagnosticsClusterOperationalDatasetComponents

- (MTRThreadNetworkDiagnosticsClusterOperationalDatasetComponents)init
{
  MTRThreadNetworkDiagnosticsClusterOperationalDatasetComponents *v2;
  MTRThreadNetworkDiagnosticsClusterOperationalDatasetComponents *v3;
  NSNumber *activeTimestampPresent;
  NSNumber *pendingTimestampPresent;
  NSNumber *masterKeyPresent;
  NSNumber *networkNamePresent;
  NSNumber *extendedPanIdPresent;
  NSNumber *meshLocalPrefixPresent;
  NSNumber *delayPresent;
  NSNumber *panIdPresent;
  NSNumber *channelPresent;
  NSNumber *pskcPresent;
  NSNumber *securityPolicyPresent;
  NSNumber *channelMaskPresent;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MTRThreadNetworkDiagnosticsClusterOperationalDatasetComponents;
  v2 = -[MTRThreadNetworkDiagnosticsClusterOperationalDatasetComponents init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    activeTimestampPresent = v2->_activeTimestampPresent;
    v2->_activeTimestampPresent = (NSNumber *)&unk_250591B18;

    pendingTimestampPresent = v3->_pendingTimestampPresent;
    v3->_pendingTimestampPresent = (NSNumber *)&unk_250591B18;

    masterKeyPresent = v3->_masterKeyPresent;
    v3->_masterKeyPresent = (NSNumber *)&unk_250591B18;

    networkNamePresent = v3->_networkNamePresent;
    v3->_networkNamePresent = (NSNumber *)&unk_250591B18;

    extendedPanIdPresent = v3->_extendedPanIdPresent;
    v3->_extendedPanIdPresent = (NSNumber *)&unk_250591B18;

    meshLocalPrefixPresent = v3->_meshLocalPrefixPresent;
    v3->_meshLocalPrefixPresent = (NSNumber *)&unk_250591B18;

    delayPresent = v3->_delayPresent;
    v3->_delayPresent = (NSNumber *)&unk_250591B18;

    panIdPresent = v3->_panIdPresent;
    v3->_panIdPresent = (NSNumber *)&unk_250591B18;

    channelPresent = v3->_channelPresent;
    v3->_channelPresent = (NSNumber *)&unk_250591B18;

    pskcPresent = v3->_pskcPresent;
    v3->_pskcPresent = (NSNumber *)&unk_250591B18;

    securityPolicyPresent = v3->_securityPolicyPresent;
    v3->_securityPolicyPresent = (NSNumber *)&unk_250591B18;

    channelMaskPresent = v3->_channelMaskPresent;
    v3->_channelMaskPresent = (NSNumber *)&unk_250591B18;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRThreadNetworkDiagnosticsClusterOperationalDatasetComponents *v4;
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

  v4 = objc_alloc_init(MTRThreadNetworkDiagnosticsClusterOperationalDatasetComponents);
  objc_msgSend_activeTimestampPresent(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setActiveTimestampPresent_(v4, v8, (uint64_t)v7);

  objc_msgSend_pendingTimestampPresent(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPendingTimestampPresent_(v4, v12, (uint64_t)v11);

  objc_msgSend_masterKeyPresent(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMasterKeyPresent_(v4, v16, (uint64_t)v15);

  objc_msgSend_networkNamePresent(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNetworkNamePresent_(v4, v20, (uint64_t)v19);

  objc_msgSend_extendedPanIdPresent(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setExtendedPanIdPresent_(v4, v24, (uint64_t)v23);

  objc_msgSend_meshLocalPrefixPresent(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMeshLocalPrefixPresent_(v4, v28, (uint64_t)v27);

  objc_msgSend_delayPresent(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDelayPresent_(v4, v32, (uint64_t)v31);

  objc_msgSend_panIdPresent(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPanIdPresent_(v4, v36, (uint64_t)v35);

  objc_msgSend_channelPresent(self, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setChannelPresent_(v4, v40, (uint64_t)v39);

  objc_msgSend_pskcPresent(self, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPskcPresent_(v4, v44, (uint64_t)v43);

  objc_msgSend_securityPolicyPresent(self, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSecurityPolicyPresent_(v4, v48, (uint64_t)v47);

  objc_msgSend_channelMaskPresent(self, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setChannelMaskPresent_(v4, v52, (uint64_t)v51);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: activeTimestampPresent:%@; pendingTimestampPresent:%@; masterKeyPresent:%@; networkNamePresent:%@; extendedPanIdPresent:%@; meshLocalPrefixPresent:%@; delayPresent:%@; panIdPresent:%@; channelPresent:%@; pskcPresent:%@; securityPolicyPresent:%@; channelMaskPresent:%@; >"),
    v5,
    self->_activeTimestampPresent,
    self->_pendingTimestampPresent,
    self->_masterKeyPresent,
    self->_networkNamePresent,
    self->_extendedPanIdPresent,
    self->_meshLocalPrefixPresent,
    self->_delayPresent,
    self->_panIdPresent,
    self->_channelPresent,
    self->_pskcPresent,
    self->_securityPolicyPresent,
    self->_channelMaskPresent);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)activeTimestampPresent
{
  return self->_activeTimestampPresent;
}

- (void)setActiveTimestampPresent:(NSNumber *)activeTimestampPresent
{
  objc_setProperty_nonatomic_copy(self, a2, activeTimestampPresent, 8);
}

- (NSNumber)pendingTimestampPresent
{
  return self->_pendingTimestampPresent;
}

- (void)setPendingTimestampPresent:(NSNumber *)pendingTimestampPresent
{
  objc_setProperty_nonatomic_copy(self, a2, pendingTimestampPresent, 16);
}

- (NSNumber)masterKeyPresent
{
  return self->_masterKeyPresent;
}

- (void)setMasterKeyPresent:(NSNumber *)masterKeyPresent
{
  objc_setProperty_nonatomic_copy(self, a2, masterKeyPresent, 24);
}

- (NSNumber)networkNamePresent
{
  return self->_networkNamePresent;
}

- (void)setNetworkNamePresent:(NSNumber *)networkNamePresent
{
  objc_setProperty_nonatomic_copy(self, a2, networkNamePresent, 32);
}

- (NSNumber)extendedPanIdPresent
{
  return self->_extendedPanIdPresent;
}

- (void)setExtendedPanIdPresent:(NSNumber *)extendedPanIdPresent
{
  objc_setProperty_nonatomic_copy(self, a2, extendedPanIdPresent, 40);
}

- (NSNumber)meshLocalPrefixPresent
{
  return self->_meshLocalPrefixPresent;
}

- (void)setMeshLocalPrefixPresent:(NSNumber *)meshLocalPrefixPresent
{
  objc_setProperty_nonatomic_copy(self, a2, meshLocalPrefixPresent, 48);
}

- (NSNumber)delayPresent
{
  return self->_delayPresent;
}

- (void)setDelayPresent:(NSNumber *)delayPresent
{
  objc_setProperty_nonatomic_copy(self, a2, delayPresent, 56);
}

- (NSNumber)panIdPresent
{
  return self->_panIdPresent;
}

- (void)setPanIdPresent:(NSNumber *)panIdPresent
{
  objc_setProperty_nonatomic_copy(self, a2, panIdPresent, 64);
}

- (NSNumber)channelPresent
{
  return self->_channelPresent;
}

- (void)setChannelPresent:(NSNumber *)channelPresent
{
  objc_setProperty_nonatomic_copy(self, a2, channelPresent, 72);
}

- (NSNumber)pskcPresent
{
  return self->_pskcPresent;
}

- (void)setPskcPresent:(NSNumber *)pskcPresent
{
  objc_setProperty_nonatomic_copy(self, a2, pskcPresent, 80);
}

- (NSNumber)securityPolicyPresent
{
  return self->_securityPolicyPresent;
}

- (void)setSecurityPolicyPresent:(NSNumber *)securityPolicyPresent
{
  objc_setProperty_nonatomic_copy(self, a2, securityPolicyPresent, 88);
}

- (NSNumber)channelMaskPresent
{
  return self->_channelMaskPresent;
}

- (void)setChannelMaskPresent:(NSNumber *)channelMaskPresent
{
  objc_setProperty_nonatomic_copy(self, a2, channelMaskPresent, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelMaskPresent, 0);
  objc_storeStrong((id *)&self->_securityPolicyPresent, 0);
  objc_storeStrong((id *)&self->_pskcPresent, 0);
  objc_storeStrong((id *)&self->_channelPresent, 0);
  objc_storeStrong((id *)&self->_panIdPresent, 0);
  objc_storeStrong((id *)&self->_delayPresent, 0);
  objc_storeStrong((id *)&self->_meshLocalPrefixPresent, 0);
  objc_storeStrong((id *)&self->_extendedPanIdPresent, 0);
  objc_storeStrong((id *)&self->_networkNamePresent, 0);
  objc_storeStrong((id *)&self->_masterKeyPresent, 0);
  objc_storeStrong((id *)&self->_pendingTimestampPresent, 0);
  objc_storeStrong((id *)&self->_activeTimestampPresent, 0);
}

@end
