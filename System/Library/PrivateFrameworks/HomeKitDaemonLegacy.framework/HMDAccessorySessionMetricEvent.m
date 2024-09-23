@implementation HMDAccessorySessionMetricEvent

- (HMDAccessorySessionMetricEvent)initWithAccessory:(id)a3 sessionMetric:(id)a4
{
  id v6;
  id v7;
  HMDAccessorySessionMetricEvent *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSString *topErrorDomain;
  void *v22;
  void *v23;
  double v24;
  uint64_t v25;
  NSString *accessoryTransport;
  uint64_t v27;
  NSString *expectedTransport;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSUUID *homeUUID;
  objc_super v36;

  v6 = a3;
  v7 = a4;
  v36.receiver = self;
  v36.super_class = (Class)HMDAccessorySessionMetricEvent;
  v8 = -[HMDHAPMetrics initWithHMDAccessory:](&v36, sel_initWithHMDAccessory_, v6);
  if (v8)
  {
    objc_msgSend(v6, "metricLoggingTransportDetails");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v8->_accessory, v6);
    v8->_isHomeThreadCapable = objc_msgSend(v7, "isHomeThreadCapable");
    v8->_isPrimaryThreadCapable = objc_msgSend(v7, "isPrimaryResidentThreadCapable");
    v8->_isThreadNetworkUp = objc_msgSend(v7, "isThreadNetworkUp");
    v8->_isPrimary = objc_msgSend(v7, "isFromPrimary");
    objc_msgSend(v7, "activeSessionDurationSec");
    v11 = v10;
    objc_msgSend(v7, "submissionIntervalSec");
    v8->_percentageDurationActiveSession = vcvtmd_u64_f64(v11 / v12 * 100.0);
    objc_msgSend(v7, "reachableDurationSec");
    v14 = v13;
    objc_msgSend(v7, "submissionIntervalSec");
    v8->_percentDurationReachable = vcvtmd_u64_f64(v14 / v15 * 100.0);
    objc_msgSend(v7, "sessionCheckIntervalSec");
    v8->_sessionCheckIntervalSec = v16;
    v8->_sessionFailures = objc_msgSend(v7, "sessionFailures");
    objc_msgSend(v7, "submissionIntervalSec");
    v8->_submissionIntervalSec = v17;
    v8->_successfulSessionRetries = objc_msgSend(v7, "successfulSessionRetries");
    objc_msgSend(v7, "topError");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_topErrorCode = objc_msgSend(v18, "code");

    objc_msgSend(v7, "topError");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "domain");
    v20 = objc_claimAutoreleasedReturnValue();
    topErrorDomain = v8->_topErrorDomain;
    v8->_topErrorDomain = (NSString *)v20;

    v8->_numActiveSessionClients = objc_msgSend(v6, "numActiveSessionClients");
    if (objc_msgSend(v6, "isReachable"))
    {
      v8->_lastSeenSecondsAgo = 0;
      v8->_lastSeenWithLowBattery = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastSeenDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "timeIntervalSinceDate:", v23);
      v8->_lastSeenSecondsAgo = (unint64_t)v24;

      v8->_lastSeenWithLowBattery = objc_msgSend(v6, "isLowBattery");
    }
    objc_msgSend(v7, "accessoryTransport");
    v25 = objc_claimAutoreleasedReturnValue();
    accessoryTransport = v8->_accessoryTransport;
    v8->_accessoryTransport = (NSString *)v25;

    objc_msgSend(v7, "expectedTransport");
    v27 = objc_claimAutoreleasedReturnValue();
    expectedTransport = v8->_expectedTransport;
    v8->_expectedTransport = (NSString *)v27;

    v8->_isThreadAccessory = objc_msgSend(v9, "isThreadAccessory");
    objc_msgSend(v7, "sessionInfo");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_numIPAddresses = objc_msgSend(v29, "numIPAddresses");

    objc_msgSend(v7, "sessionInfo");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_numIPAddressesTried = objc_msgSend(v30, "numIPAddressesTried");

    objc_msgSend(v7, "sessionInfo");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_numBonjourNames = objc_msgSend(v31, "numBonjourNames");

    v8->_bonjourUpdateForced = objc_msgSend(v7, "isBonjourUpdateForced");
    objc_msgSend(v6, "home");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "uuid");
    v33 = objc_claimAutoreleasedReturnValue();
    homeUUID = v8->_homeUUID;
    v8->_homeUUID = (NSUUID *)v33;

  }
  return v8;
}

- (HMDAccessorySessionMetricEvent)initWithAccessory:(id)a3 expectedTransport:(id)a4 homeUUID:(id)a5 topErrorDomain:(id)a6 topErrorCode:(int64_t)a7 sessionFailureCount:(unint64_t)a8
{
  id v15;
  id v16;
  id v17;
  HMDAccessorySessionMetricEvent *v18;
  HMDAccessorySessionMetricEvent *v19;
  objc_super v21;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HMDAccessorySessionMetricEvent;
  v18 = -[HMDHAPMetrics initWithHMDAccessory:](&v21, sel_initWithHMDAccessory_, a3);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_expectedTransport, a4);
    objc_storeStrong((id *)&v19->_homeUUID, a5);
    objc_storeStrong((id *)&v19->_topErrorDomain, a6);
    v19->_topErrorCode = a7;
    v19->_sessionFailures = a8;
  }

  return v19;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeAccessory.Session");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  HMDAccessorySessionMetricEvent *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  int v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySessionMetricEvent accessory](self, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metricLoggingTransportDetails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessoryProtocol");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("accessoryProtocol"));

  -[HMDAccessorySessionMetricEvent accessoryTransport](self, "accessoryTransport");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("accessoryTransport"));

  -[HMDAccessorySessionMetricEvent expectedTransport](self, "expectedTransport");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("expectedTransport"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "isAccessoryBatteryPowered"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("isAccessoryBatteryPowered"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "isAccessoryBridged"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("isAccessoryBridged"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "isThreadAccessory"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("isThreadAccessory"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDAccessorySessionMetricEvent isHomeThreadCapable](self, "isHomeThreadCapable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("isHomeThreadCapable"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDAccessorySessionMetricEvent isPrimaryThreadCapable](self, "isPrimaryThreadCapable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("isPrimaryResidentThreadCapable"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDAccessorySessionMetricEvent isThreadNetworkUp](self, "isThreadNetworkUp"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("isThreadNetworkUp"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDAccessorySessionMetricEvent isPrimary](self, "isPrimary"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("isPrimary"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDAccessorySessionMetricEvent percentageDurationActiveSession](self, "percentageDurationActiveSession"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("percentageDurationActiveSession"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDAccessorySessionMetricEvent percentDurationReachable](self, "percentDurationReachable"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("percentDurationReachable"));

  v18 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDAccessorySessionMetricEvent sessionCheckIntervalSec](self, "sessionCheckIntervalSec");
  objc_msgSend(v18, "numberWithDouble:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("sessionCheckInterval"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDAccessorySessionMetricEvent sessionFailures](self, "sessionFailures"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("sessionFailures"));

  v21 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDAccessorySessionMetricEvent submissionIntervalSec](self, "submissionIntervalSec");
  objc_msgSend(v21, "numberWithDouble:", floor(v22));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("submissionInterval"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDAccessorySessionMetricEvent successfulSessionRetries](self, "successfulSessionRetries"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("successfulSessionRetries"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDAccessorySessionMetricEvent topErrorCode](self, "topErrorCode"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("topErrorCode"));

  -[HMDAccessorySessionMetricEvent topErrorDomain](self, "topErrorDomain");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("topErrorDomain"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDAccessorySessionMetricEvent numActiveSessionClients](self, "numActiveSessionClients"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("numActiveSessionClients"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDAccessorySessionMetricEvent lastSeenSecondsAgo](self, "lastSeenSecondsAgo"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("lastSeenSecondsAgo"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDAccessorySessionMetricEvent lastSeenWithLowBattery](self, "lastSeenWithLowBattery"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("lastSeenWithLowBattery"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDAccessorySessionMetricEvent numIPAddresses](self, "numIPAddresses"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("numIPAddressesResolved"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDAccessorySessionMetricEvent numIPAddressesTried](self, "numIPAddressesTried"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("numIPAddressesTried"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDAccessorySessionMetricEvent numBonjourNames](self, "numBonjourNames"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("numBonjourNamesSeen"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDAccessorySessionMetricEvent bonjourUpdateForced](self, "bonjourUpdateForced"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("bonjourUpdateForced"));

  v34 = (void *)MEMORY[0x1D17BA0A0]();
  v35 = self;
  HMFGetOSLogHandle();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 138544130;
    v42 = v37;
    v43 = 2112;
    v44 = v38;
    v45 = 2112;
    v46 = v39;
    v47 = 2112;
    v48 = v3;
    _os_log_impl(&dword_1CD062000, v36, OS_LOG_TYPE_DEBUG, "%{public}@Serialized HMDAccessorySessionMetricEvent for accessory: %@/%@ - %@", (uint8_t *)&v41, 0x2Au);

  }
  objc_autoreleasePoolPop(v34);

  return (NSDictionary *)v3;
}

- (NSUUID)homeUUID
{
  return self->_homeUUID;
}

- (BOOL)isHomeThreadCapable
{
  return self->_isHomeThreadCapable;
}

- (BOOL)isPrimaryThreadCapable
{
  return self->_isPrimaryThreadCapable;
}

- (BOOL)isThreadNetworkUp
{
  return self->_isThreadNetworkUp;
}

- (BOOL)isPrimary
{
  return self->_isPrimary;
}

- (unint64_t)percentageDurationActiveSession
{
  return self->_percentageDurationActiveSession;
}

- (unint64_t)percentDurationReachable
{
  return self->_percentDurationReachable;
}

- (double)sessionCheckIntervalSec
{
  return self->_sessionCheckIntervalSec;
}

- (unint64_t)sessionFailures
{
  return self->_sessionFailures;
}

- (double)submissionIntervalSec
{
  return self->_submissionIntervalSec;
}

- (unint64_t)successfulSessionRetries
{
  return self->_successfulSessionRetries;
}

- (int64_t)topErrorCode
{
  return self->_topErrorCode;
}

- (NSString)topErrorDomain
{
  return self->_topErrorDomain;
}

- (unint64_t)numActiveSessionClients
{
  return self->_numActiveSessionClients;
}

- (unint64_t)lastSeenSecondsAgo
{
  return self->_lastSeenSecondsAgo;
}

- (BOOL)lastSeenWithLowBattery
{
  return self->_lastSeenWithLowBattery;
}

- (NSString)accessoryTransport
{
  return self->_accessoryTransport;
}

- (NSString)expectedTransport
{
  return self->_expectedTransport;
}

- (BOOL)isThreadAccessory
{
  return self->_isThreadAccessory;
}

- (unint64_t)numIPAddresses
{
  return self->_numIPAddresses;
}

- (unint64_t)numIPAddressesTried
{
  return self->_numIPAddressesTried;
}

- (unint64_t)numBonjourNames
{
  return self->_numBonjourNames;
}

- (BOOL)bonjourUpdateForced
{
  return self->_bonjourUpdateForced;
}

- (HMDAccessory)accessory
{
  return (HMDAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_expectedTransport, 0);
  objc_storeStrong((id *)&self->_accessoryTransport, 0);
  objc_storeStrong((id *)&self->_topErrorDomain, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
}

@end
