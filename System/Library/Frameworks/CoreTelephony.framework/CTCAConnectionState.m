@implementation CTCAConnectionState

- (id)description
{
  void *v3;
  unint64_t v4;
  const char *v5;
  unint64_t v6;
  const char *v7;
  unint64_t v8;
  const char *v9;
  unint64_t v10;
  const char *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CTCAConnectionState connectionStatus](self, "connectionStatus");
  if (v4 > 3)
    v5 = "???";
  else
    v5 = off_1E1533D48[v4];
  objc_msgSend(v3, "appendFormat:", CFSTR(", connectionStatus=%s"), v5);
  v6 = -[CTCAConnectionState syncStatus](self, "syncStatus");
  if (v6 > 2)
    v7 = "???";
  else
    v7 = off_1E1533D68[v6];
  objc_msgSend(v3, "appendFormat:", CFSTR(", syncStatus=%s"), v7);
  v8 = -[CTCAConnectionState registrationStatus](self, "registrationStatus");
  if (v8 > 2)
    v9 = "???";
  else
    v9 = off_1E1533D80[v8];
  objc_msgSend(v3, "appendFormat:", CFSTR(", registrationStatus=%s"), v9);
  v10 = -[CTCAConnectionState congestionStatus](self, "congestionStatus");
  if (v10 > 4)
    v11 = "???";
  else
    v11 = off_1E1533D98[v10];
  objc_msgSend(v3, "appendFormat:", CFSTR(", congestionStatus=%s"), v11);
  -[CTCAConnectionState rssi](self, "rssi");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", rssi=%@"), v12);

  -[CTCAConnectionState currentTransmissionProgress](self, "currentTransmissionProgress");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", currentTransmissionProgress=%@"), v13);

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

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setConnectionStatus:", -[CTCAConnectionState connectionStatus](self, "connectionStatus"));
  objc_msgSend(v5, "setSyncStatus:", -[CTCAConnectionState syncStatus](self, "syncStatus"));
  objc_msgSend(v5, "setRegistrationStatus:", -[CTCAConnectionState registrationStatus](self, "registrationStatus"));
  objc_msgSend(v5, "setCongestionStatus:", -[CTCAConnectionState congestionStatus](self, "congestionStatus"));
  -[CTCAConnectionState rssi](self, "rssi");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setRssi:", v7);

  -[CTCAConnectionState currentTransmissionProgress](self, "currentTransmissionProgress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setCurrentTransmissionProgress:", v9);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", -[CTCAConnectionState connectionStatus](self, "connectionStatus"), CFSTR("connectionStatus"));
  objc_msgSend(v6, "encodeInteger:forKey:", -[CTCAConnectionState syncStatus](self, "syncStatus"), CFSTR("syncStatus"));
  objc_msgSend(v6, "encodeInteger:forKey:", -[CTCAConnectionState registrationStatus](self, "registrationStatus"), CFSTR("registrationStatus"));
  objc_msgSend(v6, "encodeInteger:forKey:", -[CTCAConnectionState congestionStatus](self, "congestionStatus"), CFSTR("congestionStatus"));
  -[CTCAConnectionState rssi](self, "rssi");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("rssi"));

  -[CTCAConnectionState currentTransmissionProgress](self, "currentTransmissionProgress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("currentTransmissionProgress"));

}

- (CTCAConnectionState)initWithCoder:(id)a3
{
  id v4;
  CTCAConnectionState *v5;
  uint64_t v6;
  NSNumber *rssi;
  uint64_t v8;
  CTCATransmissionProgress *currentTransmissionProgress;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTCAConnectionState;
  v5 = -[CTCAConnectionState init](&v11, sel_init);
  if (v5)
  {
    v5->_connectionStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("connectionStatus"));
    v5->_syncStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("syncStatus"));
    v5->_registrationStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("registrationStatus"));
    v5->_congestionStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("congestionStatus"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rssi"));
    v6 = objc_claimAutoreleasedReturnValue();
    rssi = v5->_rssi;
    v5->_rssi = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentTransmissionProgress"));
    v8 = objc_claimAutoreleasedReturnValue();
    currentTransmissionProgress = v5->_currentTransmissionProgress;
    v5->_currentTransmissionProgress = (CTCATransmissionProgress *)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)connectionStatus
{
  return self->_connectionStatus;
}

- (void)setConnectionStatus:(int64_t)a3
{
  self->_connectionStatus = a3;
}

- (int64_t)syncStatus
{
  return self->_syncStatus;
}

- (void)setSyncStatus:(int64_t)a3
{
  self->_syncStatus = a3;
}

- (int64_t)registrationStatus
{
  return self->_registrationStatus;
}

- (void)setRegistrationStatus:(int64_t)a3
{
  self->_registrationStatus = a3;
}

- (int64_t)congestionStatus
{
  return self->_congestionStatus;
}

- (void)setCongestionStatus:(int64_t)a3
{
  self->_congestionStatus = a3;
}

- (NSNumber)rssi
{
  return self->_rssi;
}

- (void)setRssi:(id)a3
{
  objc_storeStrong((id *)&self->_rssi, a3);
}

- (CTCATransmissionProgress)currentTransmissionProgress
{
  return self->_currentTransmissionProgress;
}

- (void)setCurrentTransmissionProgress:(id)a3
{
  objc_storeStrong((id *)&self->_currentTransmissionProgress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTransmissionProgress, 0);
  objc_storeStrong((id *)&self->_rssi, 0);
}

@end
