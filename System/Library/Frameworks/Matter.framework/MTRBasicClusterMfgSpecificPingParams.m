@implementation MTRBasicClusterMfgSpecificPingParams

- (MTRBasicClusterMfgSpecificPingParams)init
{
  MTRBasicClusterMfgSpecificPingParams *v2;
  MTRBasicClusterMfgSpecificPingParams *v3;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTRBasicClusterMfgSpecificPingParams;
  v2 = -[MTRBasicClusterMfgSpecificPingParams init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    timedInvokeTimeoutMs = v2->_timedInvokeTimeoutMs;
    v2->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRBasicClusterMfgSpecificPingParams *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_alloc_init(MTRBasicClusterMfgSpecificPingParams);
  objc_msgSend_timedInvokeTimeoutMs(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v8, (uint64_t)v7);

  objc_msgSend_serverSideProcessingTimeout(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServerSideProcessingTimeout_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  void *v2;
  objc_class *v3;
  void *v4;
  const char *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v2, v5, (uint64_t)CFSTR("<%@: >"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
  objc_setProperty_nonatomic_copy(self, a2, timedInvokeTimeoutMs, 8);
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout
{
  objc_setProperty_nonatomic_copy(self, a2, serverSideProcessingTimeout, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
}

- (id)_encodeAsDataValue:(id *)a3
{
  __int128 v5;
  int v6;

  if (a3)
  {
    LODWORD(v5) = 3;
    *((_QWORD *)&v5 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP"
                           "/zap-generated/MTRCommandPayloadsObjc.mm";
    v6 = 37027;
    sub_2340017F0((uint64_t)MTRError, &v5);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

@end
