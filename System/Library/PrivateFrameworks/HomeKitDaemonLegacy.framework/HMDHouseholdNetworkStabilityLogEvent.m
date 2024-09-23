@implementation HMDHouseholdNetworkStabilityLogEvent

- (HMDHouseholdNetworkStabilityLogEvent)initWithHomeUUID:(id)a3 numStabilityReporters:(unint64_t)a4 WifiAssociations:(unint64_t)a5 wifiDisassociations:(unint64_t)a6 apChanges:(unint64_t)a7 gatewayChanges:(unint64_t)a8 numReadWrites:(unint64_t)a9 numReadErrors:(unint64_t)a10 numWriteErrors:(unint64_t)a11 numSessionErrors:(unint64_t)a12 numNetworkSignatures:(unint64_t)a13
{
  HMDHouseholdNetworkStabilityLogEvent *result;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)HMDHouseholdNetworkStabilityLogEvent;
  result = -[HMMHomeLogEvent initWithHomeUUID:](&v19, sel_initWithHomeUUID_, a3);
  if (result)
  {
    result->_numStabilityReporters = a4;
    result->_numWifiAssociations = a5;
    result->_numWifiDisassociations = a6;
    result->_numAPChanges = a7;
    result->_numGatewayChanges = a8;
    result->_numReadWrites = a9;
    result->_numReadErrors = a10;
    result->_numWriteErrors = a11;
    result->_numSessionErrors = a12;
    result->_numNetworkSignatures = a13;
  }
  return result;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.network.stability.household");
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
  void *v14;
  _QWORD v15[10];
  _QWORD v16[12];

  v16[10] = *MEMORY[0x1E0C80C00];
  v15[0] = CFSTR("numStabilityReporters");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHouseholdNetworkStabilityLogEvent numStabilityReporters](self, "numStabilityReporters"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v14;
  v15[1] = CFSTR("numWifiAssociations");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHouseholdNetworkStabilityLogEvent numWifiAssociations](self, "numWifiAssociations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v3;
  v15[2] = CFSTR("numWifiDisassociations");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHouseholdNetworkStabilityLogEvent numWifiDisassociations](self, "numWifiDisassociations"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v4;
  v15[3] = CFSTR("numWifiAPChanges");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHouseholdNetworkStabilityLogEvent numAPChanges](self, "numAPChanges"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v5;
  v15[4] = CFSTR("numGatewayChanges");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHouseholdNetworkStabilityLogEvent numGatewayChanges](self, "numGatewayChanges"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v6;
  v15[5] = CFSTR("numReadWrites");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHouseholdNetworkStabilityLogEvent numReadWrites](self, "numReadWrites"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v7;
  v15[6] = CFSTR("numReadErrors");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHouseholdNetworkStabilityLogEvent numReadErrors](self, "numReadErrors"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[6] = v8;
  v15[7] = CFSTR("numWriteErrors");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHouseholdNetworkStabilityLogEvent numWriteErrors](self, "numWriteErrors"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[7] = v9;
  v15[8] = CFSTR("numSessionErrors");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHouseholdNetworkStabilityLogEvent numSessionErrors](self, "numSessionErrors"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[8] = v10;
  v15[9] = CFSTR("numNetworkSignatures");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDHouseholdNetworkStabilityLogEvent numNetworkSignatures](self, "numNetworkSignatures"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[9] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 2;
}

- (unint64_t)numStabilityReporters
{
  return self->_numStabilityReporters;
}

- (unint64_t)numWifiAssociations
{
  return self->_numWifiAssociations;
}

- (unint64_t)numWifiDisassociations
{
  return self->_numWifiDisassociations;
}

- (unint64_t)numAPChanges
{
  return self->_numAPChanges;
}

- (unint64_t)numGatewayChanges
{
  return self->_numGatewayChanges;
}

- (unint64_t)numReadWrites
{
  return self->_numReadWrites;
}

- (unint64_t)numReadErrors
{
  return self->_numReadErrors;
}

- (unint64_t)numWriteErrors
{
  return self->_numWriteErrors;
}

- (unint64_t)numSessionErrors
{
  return self->_numSessionErrors;
}

- (unint64_t)numNetworkSignatures
{
  return self->_numNetworkSignatures;
}

@end
