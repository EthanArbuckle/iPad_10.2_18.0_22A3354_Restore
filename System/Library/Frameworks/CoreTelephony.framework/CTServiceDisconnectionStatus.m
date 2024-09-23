@implementation CTServiceDisconnectionStatus

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", contextType=%d"), -[CTServiceDisconnectionStatus contextType](self, "contextType"));
  -[CTServiceDisconnectionStatus apnName](self, "apnName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", apnName=%@"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(", activationFailure=%d"), -[CTServiceDisconnectionStatus activationFailure](self, "activationFailure"));
  -[CTServiceDisconnectionStatus connectionMask](self, "connectionMask");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", connectionMask=%@"), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(", error=%d"), -[CTServiceDisconnectionStatus error](self, "error"));
  -[CTServiceDisconnectionStatus rawCauseCode](self, "rawCauseCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", rawCauseCode=%@"), v6);

  -[CTServiceDisconnectionStatus pdp](self, "pdp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", pdp=%@"), v7);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
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

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setContextType:", -[CTServiceDisconnectionStatus contextType](self, "contextType"));
  -[CTServiceDisconnectionStatus apnName](self, "apnName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setApnName:", v6);

  objc_msgSend(v4, "setActivationFailure:", -[CTServiceDisconnectionStatus activationFailure](self, "activationFailure"));
  -[CTServiceDisconnectionStatus connectionMask](self, "connectionMask");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setConnectionMask:", v8);

  objc_msgSend(v4, "setError:", -[CTServiceDisconnectionStatus error](self, "error"));
  -[CTServiceDisconnectionStatus rawCauseCode](self, "rawCauseCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setRawCauseCode:", v10);

  -[CTServiceDisconnectionStatus pdp](self, "pdp");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setPdp:", v12);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", -[CTServiceDisconnectionStatus contextType](self, "contextType"), CFSTR("contextType"));
  -[CTServiceDisconnectionStatus apnName](self, "apnName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("apnName"));

  objc_msgSend(v4, "encodeBool:forKey:", -[CTServiceDisconnectionStatus activationFailure](self, "activationFailure"), CFSTR("activationFailure"));
  -[CTServiceDisconnectionStatus connectionMask](self, "connectionMask");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("connectionMask"));

  objc_msgSend(v4, "encodeInt:forKey:", -[CTServiceDisconnectionStatus error](self, "error"), CFSTR("error"));
  -[CTServiceDisconnectionStatus rawCauseCode](self, "rawCauseCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("rawCauseCode"));

  -[CTServiceDisconnectionStatus pdp](self, "pdp");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("pdp"));

}

- (CTServiceDisconnectionStatus)initWithCoder:(id)a3
{
  id v4;
  CTServiceDisconnectionStatus *v5;
  uint64_t v6;
  NSString *apnName;
  uint64_t v8;
  NSNumber *connectionMask;
  uint64_t v10;
  NSNumber *rawCauseCode;
  uint64_t v12;
  NSNumber *pdp;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CTServiceDisconnectionStatus;
  v5 = -[CTServiceDisconnectionStatus init](&v15, sel_init);
  if (v5)
  {
    v5->_contextType = objc_msgSend(v4, "decodeIntForKey:", CFSTR("contextType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("apnName"));
    v6 = objc_claimAutoreleasedReturnValue();
    apnName = v5->_apnName;
    v5->_apnName = (NSString *)v6;

    v5->_activationFailure = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("activationFailure"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("connectionMask"));
    v8 = objc_claimAutoreleasedReturnValue();
    connectionMask = v5->_connectionMask;
    v5->_connectionMask = (NSNumber *)v8;

    v5->_error = objc_msgSend(v4, "decodeIntForKey:", CFSTR("error"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rawCauseCode"));
    v10 = objc_claimAutoreleasedReturnValue();
    rawCauseCode = v5->_rawCauseCode;
    v5->_rawCauseCode = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pdp"));
    v12 = objc_claimAutoreleasedReturnValue();
    pdp = v5->_pdp;
    v5->_pdp = (NSNumber *)v12;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int)contextType
{
  return self->_contextType;
}

- (void)setContextType:(int)a3
{
  self->_contextType = a3;
}

- (NSString)apnName
{
  return self->_apnName;
}

- (void)setApnName:(id)a3
{
  objc_storeStrong((id *)&self->_apnName, a3);
}

- (BOOL)activationFailure
{
  return self->_activationFailure;
}

- (void)setActivationFailure:(BOOL)a3
{
  self->_activationFailure = a3;
}

- (NSNumber)connectionMask
{
  return self->_connectionMask;
}

- (void)setConnectionMask:(id)a3
{
  objc_storeStrong((id *)&self->_connectionMask, a3);
}

- (int)error
{
  return self->_error;
}

- (void)setError:(int)a3
{
  self->_error = a3;
}

- (NSNumber)rawCauseCode
{
  return self->_rawCauseCode;
}

- (void)setRawCauseCode:(id)a3
{
  objc_storeStrong((id *)&self->_rawCauseCode, a3);
}

- (NSNumber)pdp
{
  return self->_pdp;
}

- (void)setPdp:(id)a3
{
  objc_storeStrong((id *)&self->_pdp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pdp, 0);
  objc_storeStrong((id *)&self->_rawCauseCode, 0);
  objc_storeStrong((id *)&self->_connectionMask, 0);
  objc_storeStrong((id *)&self->_apnName, 0);
}

@end
