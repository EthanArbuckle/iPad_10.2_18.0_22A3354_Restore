@implementation MRUpdateActiveSystemEndpointRequest

- (MRUpdateActiveSystemEndpointRequest)initWithOutputDeviceUID:(id)a3 type:(int64_t)a4 reason:(id)a5
{
  id v8;
  id v9;
  MRUpdateActiveSystemEndpointRequest *v10;
  uint64_t v11;
  NSString *outputDeviceUID;
  uint64_t v13;
  NSString *reason;
  objc_super v16;

  v8 = a3;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MRUpdateActiveSystemEndpointRequest;
  v10 = -[MRUpdateActiveSystemEndpointRequest init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    outputDeviceUID = v10->_outputDeviceUID;
    v10->_outputDeviceUID = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    reason = v10->_reason;
    v10->_reason = (NSString *)v13;

    v10->_type = a4;
  }

  return v10;
}

- (MRUpdateActiveSystemEndpointRequest)initWithOutputDeviceUID:(id)a3 reason:(id)a4
{
  return -[MRUpdateActiveSystemEndpointRequest initWithOutputDeviceUID:type:reason:](self, "initWithOutputDeviceUID:type:reason:", a3, 0, a4);
}

- (MRUpdateActiveSystemEndpointRequest)initWithProtobuf:(id)a3
{
  id v4;
  MRUpdateActiveSystemEndpointRequest *v5;
  void *v6;
  uint64_t v7;
  NSString *outputDeviceUID;
  void *v9;
  uint64_t v10;
  NSString *reason;
  double v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MRUpdateActiveSystemEndpointRequest;
  v5 = -[MRUpdateActiveSystemEndpointRequest init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "outputDeviceUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    outputDeviceUID = v5->_outputDeviceUID;
    v5->_outputDeviceUID = (NSString *)v7;

    v5->_changeType = (int)objc_msgSend(v4, "changeType");
    objc_msgSend(v4, "reason");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    reason = v5->_reason;
    v5->_reason = (NSString *)v10;

    v5->_pairedDeviceSync = objc_msgSend(v4, "pairedDeviceSync");
    v5->_type = objc_msgSend(v4, "type");
    objc_msgSend(v4, "disableDuration");
    v5->_disableDuration = v12;
    v5->_demoteWhenSyncingToCompanion = objc_msgSend(v4, "demoteWhenSyncingToCompanion");
  }

  return v5;
}

- (_MRUpdateActiveSystemEndpointRequestProtobuf)protobuf
{
  _MRUpdateActiveSystemEndpointRequestProtobuf *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(_MRUpdateActiveSystemEndpointRequestProtobuf);
  -[MRUpdateActiveSystemEndpointRequest outputDeviceUID](self, "outputDeviceUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRUpdateActiveSystemEndpointRequestProtobuf setOutputDeviceUID:](v3, "setOutputDeviceUID:", v4);

  -[_MRUpdateActiveSystemEndpointRequestProtobuf setChangeType:](v3, "setChangeType:", -[MRUpdateActiveSystemEndpointRequest changeType](self, "changeType"));
  -[MRUpdateActiveSystemEndpointRequest reason](self, "reason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRUpdateActiveSystemEndpointRequestProtobuf setReason:](v3, "setReason:", v5);

  -[_MRUpdateActiveSystemEndpointRequestProtobuf setPairedDeviceSync:](v3, "setPairedDeviceSync:", -[MRUpdateActiveSystemEndpointRequest isPairedDeviceSync](self, "isPairedDeviceSync"));
  -[_MRUpdateActiveSystemEndpointRequestProtobuf setType:](v3, "setType:", -[MRUpdateActiveSystemEndpointRequest type](self, "type"));
  -[MRUpdateActiveSystemEndpointRequest disableDuration](self, "disableDuration");
  -[_MRUpdateActiveSystemEndpointRequestProtobuf setDisableDuration:](v3, "setDisableDuration:");
  -[_MRUpdateActiveSystemEndpointRequestProtobuf setDemoteWhenSyncingToCompanion:](v3, "setDemoteWhenSyncingToCompanion:", -[MRUpdateActiveSystemEndpointRequest demoteWhenSyncingToCompanion](self, "demoteWhenSyncingToCompanion"));
  return v3;
}

- (id)description
{
  void *v3;
  __CFString *v4;
  __CFString *v5;
  int64_t v6;
  const __CFString *v7;
  __CFString *v8;
  void *v9;
  unint64_t v10;
  __CFString *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;

  -[MRUpdateActiveSystemEndpointRequest outputDeviceUID](self, "outputDeviceUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CFSTR("Update");
  if (!v3)
    v4 = CFSTR("Clear");
  v5 = v4;

  v6 = -[MRUpdateActiveSystemEndpointRequest changeType](self, "changeType");
  v7 = CFSTR("Deferrable");
  if (v6 != 1)
    v7 = 0;
  if (v6)
    v8 = (__CFString *)v7;
  else
    v8 = CFSTR("Immediate");
  v9 = (void *)-[__CFString copy](v8, "copy");
  v10 = -[MRUpdateActiveSystemEndpointRequest type](self, "type");
  v11 = 0;
  if (v10 <= 5)
    v11 = off_1E30CD418[v10];
  v12 = (void *)-[__CFString copy](v11, "copy");
  v13 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[MRUpdateActiveSystemEndpointRequest outputDeviceUID](self, "outputDeviceUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUpdateActiveSystemEndpointRequest clientBundleIdentifier](self, "clientBundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUpdateActiveSystemEndpointRequest reason](self, "reason");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MRUpdateActiveSystemEndpointRequest demoteWhenSyncingToCompanion](self, "demoteWhenSyncingToCompanion"))
    v17 = CFSTR("YES");
  else
    v17 = CFSTR("NO");
  -[MRUpdateActiveSystemEndpointRequest disableDuration](self, "disableDuration");
  v19 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("outputDevice = <%@>, client = <%@>, reason = <%@>, operation = <%@>, changeType = <%@>, type = <%@>, demote = <%@> disableDuration = <%lf>"), v14, v15, v16, v5, v9, v12, v17, v18);

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = objc_alloc_init((Class)objc_opt_class());
  -[MRUpdateActiveSystemEndpointRequest outputDeviceUID](self, "outputDeviceUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setOutputDeviceUID:", v7);

  objc_msgSend(v5, "setChangeType:", -[MRUpdateActiveSystemEndpointRequest changeType](self, "changeType"));
  -[MRUpdateActiveSystemEndpointRequest reason](self, "reason");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setReason:", v9);

  -[MRUpdateActiveSystemEndpointRequest clientBundleIdentifier](self, "clientBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setClientBundleIdentifier:", v11);

  objc_msgSend(v5, "setPairedDeviceSync:", -[MRUpdateActiveSystemEndpointRequest isPairedDeviceSync](self, "isPairedDeviceSync"));
  objc_msgSend(v5, "setDemoteWhenSyncingToCompanion:", -[MRUpdateActiveSystemEndpointRequest demoteWhenSyncingToCompanion](self, "demoteWhenSyncingToCompanion"));
  objc_msgSend(v5, "setType:", -[MRUpdateActiveSystemEndpointRequest type](self, "type"));
  -[MRUpdateActiveSystemEndpointRequest disableDuration](self, "disableDuration");
  objc_msgSend(v5, "setDisableDuration:");
  return v5;
}

- (void)perform:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  MRUpdateActiveSystemEndpointMessage *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99D68];
  v8 = a3;
  objc_msgSend(v7, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRUpdateActiveSystemEndpointRequest outputDeviceUID](self, "outputDeviceUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[MRUpdateActiveSystemEndpointRequest outputDeviceUID](self, "outputDeviceUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    v15 = CFSTR("Update");
  else
    v15 = CFSTR("Clear");
  v16 = (void *)objc_msgSend(CFSTR("UserSelected"), "copy");
  v17 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("%@%@ActiveEndpoint"), v15, v16);

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), v17, v11);
  v19 = v18;
  if (v12)
    objc_msgSend(v18, "appendFormat:", CFSTR(" for %@"), v12);
  -[MRUpdateActiveSystemEndpointRequest reason](self, "reason");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[MRUpdateActiveSystemEndpointRequest reason](self, "reason");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "appendFormat:", CFSTR(" because %@"), v21);

  }
  _MRLogForCategory(0xAuLL);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v40 = v19;
    _os_log_impl(&dword_193827000, v22, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  -[MRUpdateActiveSystemEndpointRequest clientBundleIdentifier](self, "clientBundleIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bundleIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUpdateActiveSystemEndpointRequest setClientBundleIdentifier:](self, "setClientBundleIdentifier:", v25);

  }
  v26 = -[MRUpdateActiveSystemEndpointMessage initWithRequest:]([MRUpdateActiveSystemEndpointMessage alloc], "initWithRequest:", self);
  v27 = (void *)MRGetSharedService();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __58__MRUpdateActiveSystemEndpointRequest_perform_completion___block_invoke;
  v33[3] = &unk_1E30CD3A8;
  v34 = v12;
  v35 = v17;
  v36 = v11;
  v37 = v9;
  v38 = v6;
  v28 = v6;
  v29 = v9;
  v30 = v11;
  v31 = v17;
  v32 = v12;
  MRMediaRemoteServiceUpdateActiveSystemEndpointUID(v27, v26, v8, v33);

}

void __58__MRUpdateActiveSystemEndpointRequest_perform_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  MRUpdateActiveSystemEndpointResponse *v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  id v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = a1[4];
  _MRLogForCategory(0xAuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v3)
  {
    v13 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (!v13)
        goto LABEL_14;
      v15 = a1[5];
      v14 = a1[6];
      v16 = (void *)a1[4];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceDate:", a1[7]);
      v25 = 138544130;
      v26 = v15;
      v27 = 2114;
      v28 = v14;
      v29 = 2114;
      v30 = v16;
      v31 = 2048;
      v32 = v17;
      v18 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v19 = v6;
      v20 = 42;
    }
    else
    {
      if (!v13)
        goto LABEL_14;
      v21 = a1[5];
      v22 = a1[6];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceDate:", a1[7]);
      v25 = 138543874;
      v26 = v21;
      v27 = 2114;
      v28 = v22;
      v29 = 2048;
      v30 = v23;
      v18 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v19 = v6;
      v20 = 32;
    }
    _os_log_impl(&dword_193827000, v19, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v25, v20);
    goto LABEL_13;
  }
  v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (!v7)
      goto LABEL_14;
    v9 = a1[5];
    v8 = a1[6];
    v10 = a1[4];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", a1[7]);
    v25 = 138544386;
    v26 = v9;
    v27 = 2114;
    v28 = v8;
    v29 = 2114;
    v30 = v3;
    v31 = 2114;
    v32 = v10;
    v33 = 2048;
    v34 = v12;
    _os_log_error_impl(&dword_193827000, v6, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v25, 0x34u);
LABEL_13:

    goto LABEL_14;
  }
  if (v7)
    __94__MRAVDiscoverySessionHelper_searchAVOutputDeviceForUID_timeout_identifier_reason_completion___block_invoke_cold_1(a1, (uint64_t)v3, v6);
LABEL_14:

  if (a1[8])
  {
    v24 = -[MRUpdateActiveSystemEndpointResponse initWithError:]([MRUpdateActiveSystemEndpointResponse alloc], "initWithError:", v3);
    (*(void (**)(void))(a1[8] + 16))();

  }
}

- (NSString)outputDeviceUID
{
  return self->_outputDeviceUID;
}

- (void)setOutputDeviceUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)changeType
{
  return self->_changeType;
}

- (void)setChangeType:(int64_t)a3
{
  self->_changeType = a3;
}

- (NSString)clientBundleIdentifier
{
  return self->_clientBundleIdentifier;
}

- (void)setClientBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isPairedDeviceSync
{
  return self->_pairedDeviceSync;
}

- (void)setPairedDeviceSync:(BOOL)a3
{
  self->_pairedDeviceSync = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (BOOL)demoteWhenSyncingToCompanion
{
  return self->_demoteWhenSyncingToCompanion;
}

- (void)setDemoteWhenSyncingToCompanion:(BOOL)a3
{
  self->_demoteWhenSyncingToCompanion = a3;
}

- (double)disableDuration
{
  return self->_disableDuration;
}

- (void)setDisableDuration:(double)a3
{
  self->_disableDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_outputDeviceUID, 0);
}

@end
