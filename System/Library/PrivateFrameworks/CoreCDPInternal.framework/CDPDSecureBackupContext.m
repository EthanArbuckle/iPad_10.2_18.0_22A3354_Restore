@implementation CDPDSecureBackupContext

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[CDPDSecureBackupContext localSecret](self, "localSecret");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("YES");
  if (v4)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  -[CDPDSecureBackupContext recoverySecret](self, "recoverySecret");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v5 = CFSTR("NO");
  -[CDPDSecureBackupContext preRecordUUID](self, "preRecordUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<CDPDSecureBackupContext: local: %@ remote: %@ preRecord: %@>"), v6, v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)localSecret
{
  return self->_localSecret;
}

- (void)setLocalSecret:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)localSecretType
{
  return self->_localSecretType;
}

- (void)setLocalSecretType:(unint64_t)a3
{
  self->_localSecretType = a3;
}

- (CDPDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)recoverySecret
{
  return self->_recoverySecret;
}

- (void)setRecoverySecret:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)silentRecovery
{
  return self->_silentRecovery;
}

- (void)setSilentRecovery:(BOOL)a3
{
  self->_silentRecovery = a3;
}

- (BOOL)octagonCapableRecordsExist
{
  return self->_octagonCapableRecordsExist;
}

- (void)setOctagonCapableRecordsExist:(BOOL)a3
{
  self->_octagonCapableRecordsExist = a3;
}

- (NSString)recoveryKey
{
  return self->_recoveryKey;
}

- (void)setRecoveryKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)usePreviouslyCachedRecoveryKey
{
  return self->_usePreviouslyCachedRecoveryKey;
}

- (void)setUsePreviouslyCachedRecoveryKey:(BOOL)a3
{
  self->_usePreviouslyCachedRecoveryKey = a3;
}

- (NSString)telemetryDeviceSessionID
{
  return self->_telemetryDeviceSessionID;
}

- (void)setTelemetryDeviceSessionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)telemetryFlowID
{
  return self->_telemetryFlowID;
}

- (void)setTelemetryFlowID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)usePreviouslyCachedSecret
{
  return self->_usePreviouslyCachedSecret;
}

- (void)setUsePreviouslyCachedSecret:(BOOL)a3
{
  self->_usePreviouslyCachedSecret = a3;
}

- (CDPDCircleJoinResult)circleJoinResult
{
  return self->_circleJoinResult;
}

- (void)setCircleJoinResult:(id)a3
{
  objc_storeStrong((id *)&self->_circleJoinResult, a3);
}

- (NSString)preRecordUUID
{
  return self->_preRecordUUID;
}

- (void)setPreRecordUUID:(id)a3
{
  objc_storeStrong((id *)&self->_preRecordUUID, a3);
}

- (BOOL)synchronous
{
  return self->_synchronous;
}

- (void)setSynchronous:(BOOL)a3
{
  self->_synchronous = a3;
}

- (BOOL)nonViableRequiresRepair
{
  return self->_nonViableRequiresRepair;
}

- (void)setNonViableRequiresRepair:(BOOL)a3
{
  self->_nonViableRequiresRepair = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preRecordUUID, 0);
  objc_storeStrong((id *)&self->_circleJoinResult, 0);
  objc_storeStrong((id *)&self->_telemetryFlowID, 0);
  objc_storeStrong((id *)&self->_telemetryDeviceSessionID, 0);
  objc_storeStrong((id *)&self->_recoveryKey, 0);
  objc_storeStrong((id *)&self->_recoverySecret, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_localSecret, 0);
}

@end
