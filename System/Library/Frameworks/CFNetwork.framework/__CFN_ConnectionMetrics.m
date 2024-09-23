@implementation __CFN_ConnectionMetrics

- (void)tlsMetadataReceived:(_WORD *)a1
{
  NSObject *v3;
  const char *negotiated_protocol;
  void *v5;
  SEL v6;
  NSObject *metadata;

  v3 = a2;
  if (a1)
  {
    metadata = v3;
    negotiated_protocol = sec_protocol_metadata_get_negotiated_protocol(v3);
    if (negotiated_protocol)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", negotiated_protocol);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setProperty_atomic_copy(a1, v6, v5, 160);

    }
    a1[14] = sec_protocol_metadata_get_negotiated_tls_protocol_version(metadata);
    a1[15] = sec_protocol_metadata_get_negotiated_tls_ciphersuite(metadata);
    v3 = metadata;
  }

}

- (_QWORD)tcpInfo
{
  _QWORD *p_os_unfair_lock_opaque;
  void *v2;
  _QWORD v4[2];
  void (*v5)(uint64_t);
  void *v6;
  _QWORD *v7;

  p_os_unfair_lock_opaque = &a1->_os_unfair_lock_opaque;
  if (a1)
  {
    os_unfair_lock_lock(a1 + 2);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v5 = __34____CFN_ConnectionMetrics_tcpInfo__block_invoke;
    v6 = &unk_1E14FE118;
    v7 = p_os_unfair_lock_opaque;
    v2 = (void *)p_os_unfair_lock_opaque[6];
    if (v2)
    {
      p_os_unfair_lock_opaque = v2;
      __34____CFN_ConnectionMetrics_tcpInfo__block_invoke((uint64_t)v4);
    }
    else
    {
      *((_BYTE *)p_os_unfair_lock_opaque + 12) = 1;
      -[__CFN_ConnectionMetrics _tcpInfo]((uint64_t)p_os_unfair_lock_opaque);
      p_os_unfair_lock_opaque = (_QWORD *)objc_claimAutoreleasedReturnValue();
      v5((uint64_t)v4);
    }
  }
  return p_os_unfair_lock_opaque;
}

- (id)_tcpInfo
{
  id v2;
  void *v3;
  void *v4;

  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
  v2 = *(id *)(a1 + 40);
  if (v2)
  {
    v3 = (void *)nw_connection_copy_tcp_info();
    v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (_QWORD)subflowCounts
{
  _QWORD *p_os_unfair_lock_opaque;
  void *v2;
  _QWORD v4[2];
  void (*v5)(uint64_t);
  void *v6;
  _QWORD *v7;

  p_os_unfair_lock_opaque = &a1->_os_unfair_lock_opaque;
  if (a1)
  {
    if (!BYTE2(a1[4]._os_unfair_lock_opaque))
      return 0;
    os_unfair_lock_lock(a1 + 2);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v5 = __40____CFN_ConnectionMetrics_subflowCounts__block_invoke;
    v6 = &unk_1E14FE118;
    v7 = p_os_unfair_lock_opaque;
    v2 = (void *)p_os_unfair_lock_opaque[7];
    if (v2)
    {
      p_os_unfair_lock_opaque = v2;
      __40____CFN_ConnectionMetrics_subflowCounts__block_invoke((uint64_t)v4);
    }
    else
    {
      *((_BYTE *)p_os_unfair_lock_opaque + 13) = 1;
      -[__CFN_ConnectionMetrics _subflowCounts]((uint64_t)p_os_unfair_lock_opaque);
      p_os_unfair_lock_opaque = (_QWORD *)objc_claimAutoreleasedReturnValue();
      v5((uint64_t)v4);
    }
  }
  return p_os_unfair_lock_opaque;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 23) = 0;
  *((_QWORD *)self + 24) = 0;
  return self;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;

  cntrl = self->_transportConnection.__cntrl_;
  if (cntrl)
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  objc_storeStrong((id *)&self->_establishmentReport, 0);
  objc_storeStrong((id *)&self->_networkProtocolName, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_remoteEndpoint, 0);
  objc_storeStrong((id *)&self->_localEndpoint, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_initiatingTransactionID, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_cachedSubflowCounts, 0);
  objc_storeStrong((id *)&self->_cachedTCPInfoAtEnd, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  id Property;
  void *v6;
  void *v7;
  void *v8;
  SEL v9;
  void *v10;
  id v11;

  v11 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 64, 1);
  else
    Property = 0;
  objc_msgSend(v11, "encodeObject:forKey:", Property, CFSTR("UUID"));
  objc_msgSend(v11, "encodeInt64:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_initiatingTransactionID, CFSTR("initiatingTransactionID"));
  objc_msgSend(v11, "encodeDouble:forKey:", CFSTR("beginTime"), self->_beginTime);
  objc_msgSend(v11, "encodeDouble:forKey:", CFSTR("establishTime"), self->_establishTime);
  objc_msgSend(v11, "encodeDouble:forKey:", CFSTR("endTime"), self->_endTime);
  if (self->_endpoint)
  {
    objc_msgSend(MEMORY[0x1E0CCEC78], "endpointWithCEndpoint:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "encodeObject:forKey:", v6, CFSTR("endpoint"));

  }
  objc_msgSend(v11, "encodeBool:forKey:", self->_TLSConfigured, CFSTR("TLSConfigured"));
  objc_msgSend(v11, "encodeInteger:forKey:", self->_http3DiscoveryStatus, CFSTR("http3DiscoveryStatus"));
  if (self->_localEndpoint)
  {
    objc_msgSend(MEMORY[0x1E0CCEC78], "endpointWithCEndpoint:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "encodeObject:forKey:", v7, CFSTR("localEndpoint"));

  }
  if (self->_remoteEndpoint)
  {
    objc_msgSend(MEMORY[0x1E0CCEC78], "endpointWithCEndpoint:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "encodeObject:forKey:", v8, CFSTR("remoteEndpoint"));

  }
  objc_msgSend(v11, "encodeObject:forKey:", self->_interfaceName, CFSTR("interfaceName"));
  objc_msgSend(v11, "encodeBool:forKey:", self->_cellular, CFSTR("cellular"));
  objc_msgSend(v11, "encodeBool:forKey:", self->_expensive, CFSTR("expensive"));
  objc_msgSend(v11, "encodeBool:forKey:", self->_constrained, CFSTR("constrained"));
  objc_msgSend(v11, "encodeBool:forKey:", self->_multipath, CFSTR("multipath"));
  objc_msgSend(v11, "encodeBool:forKey:", self->_usedTFO, CFSTR("usedTFO"));
  objc_msgSend(v11, "encodeBool:forKey:", self->_isUnlistedTracker, CFSTR("isUnlistedTracker"));
  objc_msgSend(v11, "encodeObject:forKey:", objc_getProperty(self, v9, 160, 1), CFSTR("networkProtocolName"));
  objc_msgSend(v11, "encodeInt:forKey:", self->_negotiatedTLSProtocolVersion, CFSTR("negotiatedTLSProtocolVersion"));
  objc_msgSend(v11, "encodeInt:forKey:", self->_negotiatedTLSCipherSuite, CFSTR("negotiatedTLSCipherSuite"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && self->_establishmentReport)
  {
    v10 = (void *)nw_establishment_report_copy_dictionary();
    objc_msgSend(v11, "encodeXPCObject:forKey:", v10, CFSTR("establishmentReport"));

  }
  objc_msgSend(v11, "encodeInt:forKey:", self->_privacyStance, CFSTR("privacyStance"));
  objc_msgSend(v11, "encodeDouble:forKey:", CFSTR("idleAtTime"), self->_idleAtTime);

}

- (__CFN_ConnectionMetrics)initWithCoder:(id)a3
{
  id v4;
  __CFN_ConnectionMetrics *v5;
  void *v6;
  SEL v7;
  uint64_t v8;
  NSUUID *initiatingTransactionID;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  OS_nw_endpoint *endpoint;
  void *v16;
  uint64_t v17;
  OS_nw_endpoint *localEndpoint;
  void *v19;
  uint64_t v20;
  OS_nw_endpoint *remoteEndpoint;
  uint64_t v22;
  NSString *interfaceName;
  void *v24;
  SEL v25;
  double v26;
  void *v27;
  uint64_t v28;
  OS_nw_establishment_report *establishmentReport;
  double v30;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)__CFN_ConnectionMetrics;
  v5 = -[__CFN_ConnectionMetrics init](&v32, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_atomic(v5, v7, v6, 64);

    v5->_identifier = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("identifier"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("initiatingTransactionID"));
    v8 = objc_claimAutoreleasedReturnValue();
    initiatingTransactionID = v5->_initiatingTransactionID;
    v5->_initiatingTransactionID = (NSUUID *)v8;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("beginTime"));
    v5->_beginTime = v10;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("establishTime"));
    v5->_establishTime = v11;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("endTime"));
    v5->_endTime = v12;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endpoint"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copyCEndpoint");
    endpoint = v5->_endpoint;
    v5->_endpoint = (OS_nw_endpoint *)v14;

    v5->_TLSConfigured = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("TLSConfigured"));
    v5->_http3DiscoveryStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("http3DiscoveryStatus"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localEndpoint"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copyCEndpoint");
    localEndpoint = v5->_localEndpoint;
    v5->_localEndpoint = (OS_nw_endpoint *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remoteEndpoint"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "copyCEndpoint");
    remoteEndpoint = v5->_remoteEndpoint;
    v5->_remoteEndpoint = (OS_nw_endpoint *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("interfaceName"));
    v22 = objc_claimAutoreleasedReturnValue();
    interfaceName = v5->_interfaceName;
    v5->_interfaceName = (NSString *)v22;

    v5->_cellular = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cellular"));
    v5->_expensive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("expensive"));
    v5->_constrained = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("constrained"));
    v5->_multipath = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("multipath"));
    v5->_usedTFO = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("usedTFO"));
    v5->_isUnlistedTracker = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isUnlistedTracker"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("networkProtocolName"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_atomic_copy(v5, v25, v24, 160);

    v5->_negotiatedTLSProtocolVersion = objc_msgSend(v4, "decodeIntForKey:", CFSTR("negotiatedTLSProtocolVersion"));
    v5->_negotiatedTLSCipherSuite = objc_msgSend(v4, "decodeIntForKey:", CFSTR("negotiatedTLSCipherSuite"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("idleAtTime"));
    v5->_idleAtTime = v26;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C812F8], CFSTR("establishmentReport"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        v28 = nw_establishment_report_create_from_dictionary();
        establishmentReport = v5->_establishmentReport;
        v5->_establishmentReport = (OS_nw_establishment_report *)v28;

      }
    }
    v5->_privacyStance = objc_msgSend(v4, "decodeIntForKey:", CFSTR("privacyStance"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("idleAtTime"));
    v5->_idleAtTime = v30;

  }
  return v5;
}

- (BOOL)_daemon_isDiscretionary
{
  return self->_discretionary;
}

- (BOOL)_daemon_isDataBudgetingEnabled
{
  return self->_dataBudgetingEnabled;
}

- (NSString)_daemon_interfaceName
{
  return self->_interfaceName;
}

- (double)_daemon_establishTime
{
  return self->_establishTime;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_subflowCounts
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD applier[4];
  id v9;

  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
  v2 = *(id *)(a1 + 40);
  if (v2 && (v3 = (void *)nw_connection_multipath_copy_subflow_counts(), (v4 = v3) != 0))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", xpc_dictionary_get_count(v3));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    applier[0] = MEMORY[0x1E0C809B0];
    applier[1] = 3221225472;
    applier[2] = __41____CFN_ConnectionMetrics__subflowCounts__block_invoke;
    applier[3] = &unk_1E14FB748;
    v6 = v5;
    v9 = v6;
    xpc_dictionary_apply(v4, applier);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
