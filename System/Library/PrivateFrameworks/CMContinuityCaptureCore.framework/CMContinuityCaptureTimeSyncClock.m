@implementation CMContinuityCaptureTimeSyncClock

- (CMContinuityCaptureTimeSyncClock)initWithClockIdentifier:(unint64_t)a3
{
  void *v4;
  CMContinuityCaptureTimeSyncClock *v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB70C8]), "initWithClockIdentifier:", a3);
  v5 = -[CMContinuityCaptureTimeSyncClock initWithClock:](self, "initWithClock:", v4);

  return v5;
}

- (CMContinuityCaptureTimeSyncClock)initWithClock:(id)a3
{
  id v5;
  CMContinuityCaptureTimeSyncClock *v6;
  CMContinuityCaptureTimeSyncClock *v7;
  uint64_t v8;
  uint64_t v9;
  NSString *clockDeviceUID;
  unint64_t v11;
  CMContinuityCaptureTimeSyncClock *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CMContinuityCaptureTimeSyncClock;
  v6 = -[CMContinuityCaptureTimeSyncClock init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_ptpClock, a3);
    -[TSgPTPClock addClient:](v7->_ptpClock, "addClient:", v7);
    v8 = objc_msgSend(v5, "clockIdentifier");
    objc_msgSend(MEMORY[0x24BEB70C0], "timeSyncAudioClockDeviceUIDForClockIdentifier:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    clockDeviceUID = v7->_clockDeviceUID;
    v7->_clockDeviceUID = (NSString *)v9;

    if (!v7->_ptpClock || !v7->_clockDeviceUID)
    {
      v12 = 0;
      goto LABEL_6;
    }
    v11 = *MEMORY[0x24BEB70E8];
    v7->_clockIdentifier = v8;
    v7->_grandMasterIdentifier = v11;
  }
  v12 = v7;
LABEL_6:

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[TSgPTPClock removeClient:](self->_ptpClock, "removeClient:", self);
  -[CMContinuityCaptureTimeSyncClock stopEmittingHeartBeatSignposts](self, "stopEmittingHeartBeatSignposts");
  v3.receiver = self;
  v3.super_class = (Class)CMContinuityCaptureTimeSyncClock;
  -[CMContinuityCaptureTimeSyncClock dealloc](&v3, sel_dealloc);
}

- (void)didChangeLockStateTo:(int)a3 forClock:(id)a4
{
  id v6;
  NSObject *v7;
  int v8;
  CMContinuityCaptureTimeSyncClock *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  CMContinuityCaptureLog(2);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543874;
    v9 = self;
    v10 = 2048;
    v11 = objc_msgSend(v6, "clockIdentifier");
    v12 = 1024;
    v13 = a3;
    _os_log_impl(&dword_227C5D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ clock %lld changed lock state to %d", (uint8_t *)&v8, 0x1Cu);
  }

}

- (void)didBeginClockGrandmasterChangeWithGrandmasterID:(unint64_t)a3 localPort:(unsigned __int16)a4 forClock:(id)a5
{
  id v7;
  NSObject *v8;
  int v9;
  CMContinuityCaptureTimeSyncClock *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  CMContinuityCaptureLog(2);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543874;
    v10 = self;
    v11 = 2048;
    v12 = objc_msgSend(v7, "clockIdentifier");
    v13 = 2048;
    v14 = a3;
    _os_log_impl(&dword_227C5D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ clock %lld will change grandmaster to %lld", (uint8_t *)&v9, 0x20u);
  }

}

- (void)didEndClockGrandmasterChangeWithGrandmasterID:(unint64_t)a3 localPort:(unsigned __int16)a4 forClock:(id)a5
{
  id v7;
  NSObject *v8;
  int v9;
  CMContinuityCaptureTimeSyncClock *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  CMContinuityCaptureLog(2);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543874;
    v10 = self;
    v11 = 2048;
    v12 = objc_msgSend(v7, "clockIdentifier");
    v13 = 2048;
    v14 = a3;
    _os_log_impl(&dword_227C5D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ clock %lld did change grandmaster to %lld", (uint8_t *)&v9, 0x20u);
  }

}

- (BOOL)isConnectedToPeer
{
  return -[TSgPTPClock lockState](self->_ptpClock, "lockState") != 0;
}

- (unint64_t)domainTimeForMachAbsoluteTime:(unint64_t)a3
{
  return -[TSgPTPClock convertFromMachAbsoluteToDomainTime:grandmasterUsed:](self->_ptpClock, "convertFromMachAbsoluteToDomainTime:grandmasterUsed:", a3, &self->_grandMasterIdentifier);
}

- (unint64_t)machAbsoluteTimeForDomainTime:(unint64_t)a3
{
  __int16 v4;

  v4 = 0;
  return -[TSgPTPClock convertFromDomainToMachAbsoluteTime:grandmasterUsed:portNumber:](self->_ptpClock, "convertFromDomainToMachAbsoluteTime:grandmasterUsed:portNumber:", a3, &self->_grandMasterIdentifier, &v4);
}

- (unint64_t)clockIdentifier
{
  return self->_clockIdentifier;
}

- (void)setClockIdentifier:(unint64_t)a3
{
  self->_clockIdentifier = a3;
}

- (NSString)clockDeviceUID
{
  return self->_clockDeviceUID;
}

- (void)setClockDeviceUID:(id)a3
{
  objc_storeStrong((id *)&self->_clockDeviceUID, a3);
}

- (unint64_t)grandMasterIdentifier
{
  return self->_grandMasterIdentifier;
}

- (void)setGrandMasterIdentifier:(unint64_t)a3
{
  self->_grandMasterIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartBeatTimer, 0);
  objc_storeStrong((id *)&self->_clockDeviceUID, 0);
  objc_storeStrong((id *)&self->_ptpClock, 0);
}

@end
