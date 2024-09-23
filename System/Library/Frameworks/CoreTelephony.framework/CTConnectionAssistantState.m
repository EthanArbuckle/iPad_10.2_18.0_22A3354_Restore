@implementation CTConnectionAssistantState

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  const char *v6;
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
  _BOOL4 v19;
  const char *v20;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", version=%llu"), -[CTConnectionAssistantState version](self, "version"));
  -[CTConnectionAssistantState stewieState](self, "stewieState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", stewieState=%@"), v4);

  v5 = -[CTConnectionAssistantState internetInterface](self, "internetInterface");
  if (v5 > 2)
    v6 = "???";
  else
    v6 = off_1E1533E60[v5];
  objc_msgSend(v3, "appendFormat:", CFSTR(", internetInterface=%s"), v6);
  -[CTConnectionAssistantState currentTarget](self, "currentTarget");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", currentTarget=%@"), v7);

  -[CTConnectionAssistantState backupTargets](self, "backupTargets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", backupTargets=%@"), v8);

  -[CTConnectionAssistantState targetVisibility](self, "targetVisibility");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", targetVisibility=%@"), v9);

  -[CTConnectionAssistantState locationState](self, "locationState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", locationState=%@"), v10);

  -[CTConnectionAssistantState serviceIntervals](self, "serviceIntervals");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", serviceIntervals=%@"), v11);

  -[CTConnectionAssistantState silenceInterval](self, "silenceInterval");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", silenceInterval=%@"), v12);

  -[CTConnectionAssistantState connectionState](self, "connectionState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", connectionState=%@"), v13);

  -[CTConnectionAssistantState conversationState](self, "conversationState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", conversationState=%@"), v14);

  -[CTConnectionAssistantState roadsideConversationState](self, "roadsideConversationState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", roadsideConversationState=%@"), v15);

  -[CTConnectionAssistantState iso3166Alpha3CountryCode](self, "iso3166Alpha3CountryCode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", iso3166Alpha3CountryCode=%@"), v16);

  -[CTConnectionAssistantState connectionClosedState](self, "connectionClosedState");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", connectionClosedState=%@"), v17);

  -[CTConnectionAssistantState tryOutState](self, "tryOutState");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", tryOutState=%@"), v18);

  v19 = -[CTConnectionAssistantState isEmergencyVoiceCallCapable](self, "isEmergencyVoiceCallCapable");
  v20 = "no";
  if (v19)
    v20 = "yes";
  objc_msgSend(v3, "appendFormat:", CFSTR(", isEmergencyVoiceCallCapable=%s"), v20);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setVersion:", -[CTConnectionAssistantState version](self, "version"));
  -[CTConnectionAssistantState stewieState](self, "stewieState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setStewieState:", v7);

  objc_msgSend(v5, "setInternetInterface:", -[CTConnectionAssistantState internetInterface](self, "internetInterface"));
  -[CTConnectionAssistantState currentTarget](self, "currentTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setCurrentTarget:", v9);

  -[CTConnectionAssistantState backupTargets](self, "backupTargets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setBackupTargets:", v11);

  -[CTConnectionAssistantState targetVisibility](self, "targetVisibility");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
  objc_msgSend(v5, "setTargetVisibility:", v13);

  -[CTConnectionAssistantState locationState](self, "locationState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copyWithZone:", a3);
  objc_msgSend(v5, "setLocationState:", v15);

  -[CTConnectionAssistantState serviceIntervals](self, "serviceIntervals");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copyWithZone:", a3);
  objc_msgSend(v5, "setServiceIntervals:", v17);

  -[CTConnectionAssistantState silenceInterval](self, "silenceInterval");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copyWithZone:", a3);
  objc_msgSend(v5, "setSilenceInterval:", v19);

  -[CTConnectionAssistantState connectionState](self, "connectionState");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "copyWithZone:", a3);
  objc_msgSend(v5, "setConnectionState:", v21);

  -[CTConnectionAssistantState conversationState](self, "conversationState");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "copyWithZone:", a3);
  objc_msgSend(v5, "setConversationState:", v23);

  -[CTConnectionAssistantState roadsideConversationState](self, "roadsideConversationState");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "copyWithZone:", a3);
  objc_msgSend(v5, "setRoadsideConversationState:", v25);

  -[CTConnectionAssistantState iso3166Alpha3CountryCode](self, "iso3166Alpha3CountryCode");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v26, "copyWithZone:", a3);
  objc_msgSend(v5, "setIso3166Alpha3CountryCode:", v27);

  -[CTConnectionAssistantState connectionClosedState](self, "connectionClosedState");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v28, "copyWithZone:", a3);
  objc_msgSend(v5, "setConnectionClosedState:", v29);

  -[CTConnectionAssistantState tryOutState](self, "tryOutState");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v30, "copyWithZone:", a3);
  objc_msgSend(v5, "setTryOutState:", v31);

  objc_msgSend(v5, "setIsEmergencyVoiceCallCapable:", -[CTConnectionAssistantState isEmergencyVoiceCallCapable](self, "isEmergencyVoiceCallCapable"));
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
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
  id v18;

  v18 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[CTConnectionAssistantState version](self, "version"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v4, CFSTR("version"));

  -[CTConnectionAssistantState stewieState](self, "stewieState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v5, CFSTR("stewieState"));

  objc_msgSend(v18, "encodeInteger:forKey:", -[CTConnectionAssistantState internetInterface](self, "internetInterface"), CFSTR("internetInterface"));
  -[CTConnectionAssistantState currentTarget](self, "currentTarget");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v6, CFSTR("currentTarget"));

  -[CTConnectionAssistantState backupTargets](self, "backupTargets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v7, CFSTR("backupTargets"));

  -[CTConnectionAssistantState targetVisibility](self, "targetVisibility");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v8, CFSTR("targetVisibility"));

  -[CTConnectionAssistantState locationState](self, "locationState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v9, CFSTR("locationState"));

  -[CTConnectionAssistantState serviceIntervals](self, "serviceIntervals");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v10, CFSTR("serviceIntervals"));

  -[CTConnectionAssistantState silenceInterval](self, "silenceInterval");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v11, CFSTR("silenceInterval"));

  -[CTConnectionAssistantState connectionState](self, "connectionState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v12, CFSTR("connectionState"));

  -[CTConnectionAssistantState conversationState](self, "conversationState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v13, CFSTR("conversationState"));

  -[CTConnectionAssistantState roadsideConversationState](self, "roadsideConversationState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v14, CFSTR("roadsideConversationState"));

  -[CTConnectionAssistantState iso3166Alpha3CountryCode](self, "iso3166Alpha3CountryCode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v15, CFSTR("iso3166Alpha3CountryCode"));

  -[CTConnectionAssistantState connectionClosedState](self, "connectionClosedState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v16, CFSTR("connectionClosedState"));

  objc_msgSend(v18, "encodeBool:forKey:", -[CTConnectionAssistantState isEmergencyVoiceCallCapable](self, "isEmergencyVoiceCallCapable"), CFSTR("isEmergencyVoiceCallCapable"));
  -[CTConnectionAssistantState tryOutState](self, "tryOutState");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v17, CFSTR("tryOutState"));

}

- (CTConnectionAssistantState)initWithCoder:(id)a3
{
  id v4;
  CTConnectionAssistantState *v5;
  void *v6;
  uint64_t v7;
  CTStewieState *stewieState;
  uint64_t v9;
  CTCATarget *currentTarget;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *backupTargets;
  uint64_t v16;
  CTCATargetVisibility *targetVisibility;
  uint64_t v18;
  CTCALocationState *locationState;
  uint64_t v20;
  CTCAServiceIntervals *serviceIntervals;
  uint64_t v22;
  CTCASilenceInterval *silenceInterval;
  uint64_t v24;
  CTCAConnectionState *connectionState;
  uint64_t v26;
  CTCAConversationState *conversationState;
  uint64_t v28;
  CTCARoadsideConversationState *roadsideConversationState;
  uint64_t v30;
  NSString *iso3166Alpha3CountryCode;
  uint64_t v32;
  CTCAConnectionClosedState *connectionClosedState;
  uint64_t v34;
  CTCATryOutState *tryOutState;
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)CTConnectionAssistantState;
  v5 = -[CTConnectionAssistantState init](&v37, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("version"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_version = objc_msgSend(v6, "unsignedLongLongValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stewieState"));
    v7 = objc_claimAutoreleasedReturnValue();
    stewieState = v5->_stewieState;
    v5->_stewieState = (CTStewieState *)v7;

    v5->_internetInterface = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("internetInterface"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentTarget"));
    v9 = objc_claimAutoreleasedReturnValue();
    currentTarget = v5->_currentTarget;
    v5->_currentTarget = (CTCATarget *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("backupTargets"));
    v14 = objc_claimAutoreleasedReturnValue();
    backupTargets = v5->_backupTargets;
    v5->_backupTargets = (NSArray *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("targetVisibility"));
    v16 = objc_claimAutoreleasedReturnValue();
    targetVisibility = v5->_targetVisibility;
    v5->_targetVisibility = (CTCATargetVisibility *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locationState"));
    v18 = objc_claimAutoreleasedReturnValue();
    locationState = v5->_locationState;
    v5->_locationState = (CTCALocationState *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceIntervals"));
    v20 = objc_claimAutoreleasedReturnValue();
    serviceIntervals = v5->_serviceIntervals;
    v5->_serviceIntervals = (CTCAServiceIntervals *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("silenceInterval"));
    v22 = objc_claimAutoreleasedReturnValue();
    silenceInterval = v5->_silenceInterval;
    v5->_silenceInterval = (CTCASilenceInterval *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("connectionState"));
    v24 = objc_claimAutoreleasedReturnValue();
    connectionState = v5->_connectionState;
    v5->_connectionState = (CTCAConnectionState *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("conversationState"));
    v26 = objc_claimAutoreleasedReturnValue();
    conversationState = v5->_conversationState;
    v5->_conversationState = (CTCAConversationState *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("roadsideConversationState"));
    v28 = objc_claimAutoreleasedReturnValue();
    roadsideConversationState = v5->_roadsideConversationState;
    v5->_roadsideConversationState = (CTCARoadsideConversationState *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iso3166Alpha3CountryCode"));
    v30 = objc_claimAutoreleasedReturnValue();
    iso3166Alpha3CountryCode = v5->_iso3166Alpha3CountryCode;
    v5->_iso3166Alpha3CountryCode = (NSString *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("connectionClosedState"));
    v32 = objc_claimAutoreleasedReturnValue();
    connectionClosedState = v5->_connectionClosedState;
    v5->_connectionClosedState = (CTCAConnectionClosedState *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tryOutState"));
    v34 = objc_claimAutoreleasedReturnValue();
    tryOutState = v5->_tryOutState;
    v5->_tryOutState = (CTCATryOutState *)v34;

    v5->_isEmergencyVoiceCallCapable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isEmergencyVoiceCallCapable"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (CTStewieState)stewieState
{
  return self->_stewieState;
}

- (void)setStewieState:(id)a3
{
  objc_storeStrong((id *)&self->_stewieState, a3);
}

- (int64_t)internetInterface
{
  return self->_internetInterface;
}

- (void)setInternetInterface:(int64_t)a3
{
  self->_internetInterface = a3;
}

- (CTCATarget)currentTarget
{
  return self->_currentTarget;
}

- (void)setCurrentTarget:(id)a3
{
  objc_storeStrong((id *)&self->_currentTarget, a3);
}

- (NSArray)backupTargets
{
  return self->_backupTargets;
}

- (void)setBackupTargets:(id)a3
{
  objc_storeStrong((id *)&self->_backupTargets, a3);
}

- (CTCATargetVisibility)targetVisibility
{
  return self->_targetVisibility;
}

- (void)setTargetVisibility:(id)a3
{
  objc_storeStrong((id *)&self->_targetVisibility, a3);
}

- (CTCALocationState)locationState
{
  return self->_locationState;
}

- (void)setLocationState:(id)a3
{
  objc_storeStrong((id *)&self->_locationState, a3);
}

- (CTCAServiceIntervals)serviceIntervals
{
  return self->_serviceIntervals;
}

- (void)setServiceIntervals:(id)a3
{
  objc_storeStrong((id *)&self->_serviceIntervals, a3);
}

- (CTCASilenceInterval)silenceInterval
{
  return self->_silenceInterval;
}

- (void)setSilenceInterval:(id)a3
{
  objc_storeStrong((id *)&self->_silenceInterval, a3);
}

- (CTCAConnectionState)connectionState
{
  return self->_connectionState;
}

- (void)setConnectionState:(id)a3
{
  objc_storeStrong((id *)&self->_connectionState, a3);
}

- (CTCAConversationState)conversationState
{
  return self->_conversationState;
}

- (void)setConversationState:(id)a3
{
  objc_storeStrong((id *)&self->_conversationState, a3);
}

- (CTCARoadsideConversationState)roadsideConversationState
{
  return self->_roadsideConversationState;
}

- (void)setRoadsideConversationState:(id)a3
{
  objc_storeStrong((id *)&self->_roadsideConversationState, a3);
}

- (NSString)iso3166Alpha3CountryCode
{
  return self->_iso3166Alpha3CountryCode;
}

- (void)setIso3166Alpha3CountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_iso3166Alpha3CountryCode, a3);
}

- (CTCAConnectionClosedState)connectionClosedState
{
  return self->_connectionClosedState;
}

- (void)setConnectionClosedState:(id)a3
{
  objc_storeStrong((id *)&self->_connectionClosedState, a3);
}

- (CTCATryOutState)tryOutState
{
  return self->_tryOutState;
}

- (void)setTryOutState:(id)a3
{
  objc_storeStrong((id *)&self->_tryOutState, a3);
}

- (BOOL)isEmergencyVoiceCallCapable
{
  return self->_isEmergencyVoiceCallCapable;
}

- (void)setIsEmergencyVoiceCallCapable:(BOOL)a3
{
  self->_isEmergencyVoiceCallCapable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tryOutState, 0);
  objc_storeStrong((id *)&self->_connectionClosedState, 0);
  objc_storeStrong((id *)&self->_iso3166Alpha3CountryCode, 0);
  objc_storeStrong((id *)&self->_roadsideConversationState, 0);
  objc_storeStrong((id *)&self->_conversationState, 0);
  objc_storeStrong((id *)&self->_connectionState, 0);
  objc_storeStrong((id *)&self->_silenceInterval, 0);
  objc_storeStrong((id *)&self->_serviceIntervals, 0);
  objc_storeStrong((id *)&self->_locationState, 0);
  objc_storeStrong((id *)&self->_targetVisibility, 0);
  objc_storeStrong((id *)&self->_backupTargets, 0);
  objc_storeStrong((id *)&self->_currentTarget, 0);
  objc_storeStrong((id *)&self->_stewieState, 0);
}

@end
