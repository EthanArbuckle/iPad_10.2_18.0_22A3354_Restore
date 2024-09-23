@implementation CTTetheringStatus

- (id)description
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

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTTetheringStatus carrierEnabled](self, "carrierEnabled");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", carrierEnabled=%@"), v4);

  -[CTTetheringStatus userAuthenticated](self, "userAuthenticated");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", userAuthenticated=%@"), v5);

  -[CTTetheringStatus asserted](self, "asserted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", asserted=%@"), v6);

  -[CTTetheringStatus activationFailure](self, "activationFailure");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", activationFailure=%@"), v7);

  -[CTTetheringStatus misPdpMaxHosts](self, "misPdpMaxHosts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", misPdpMaxHosts=%@"), v8);

  -[CTTetheringStatus connectionAvailabilityStatus](self, "connectionAvailabilityStatus");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", connectionAvailabilityStatus=%@"), v9);

  -[CTTetheringStatus connectionStatus](self, "connectionStatus");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", connectionStatus=%@"), v10);

  -[CTTetheringStatus context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", context=%@"), v11);

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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTTetheringStatus carrierEnabled](self, "carrierEnabled");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setCarrierEnabled:", v6);

  -[CTTetheringStatus userAuthenticated](self, "userAuthenticated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setUserAuthenticated:", v8);

  -[CTTetheringStatus asserted](self, "asserted");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setAsserted:", v10);

  -[CTTetheringStatus activationFailure](self, "activationFailure");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setActivationFailure:", v12);

  -[CTTetheringStatus misPdpMaxHosts](self, "misPdpMaxHosts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setMisPdpMaxHosts:", v14);

  -[CTTetheringStatus connectionAvailabilityStatus](self, "connectionAvailabilityStatus");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setConnectionAvailabilityStatus:", v16);

  -[CTTetheringStatus connectionStatus](self, "connectionStatus");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setConnectionStatus:", v18);

  -[CTTetheringStatus context](self, "context");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setContext:", v20);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[CTTetheringStatus carrierEnabled](self, "carrierEnabled");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("carrierEnabled"));

  -[CTTetheringStatus userAuthenticated](self, "userAuthenticated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("userAuthenticated"));

  -[CTTetheringStatus asserted](self, "asserted");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("asserted"));

  -[CTTetheringStatus activationFailure](self, "activationFailure");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("activationFailure"));

  -[CTTetheringStatus misPdpMaxHosts](self, "misPdpMaxHosts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("misPdpMaxHosts"));

  -[CTTetheringStatus connectionAvailabilityStatus](self, "connectionAvailabilityStatus");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("connectionAvailabilityStatus"));

  -[CTTetheringStatus connectionStatus](self, "connectionStatus");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("connectionStatus"));

  -[CTTetheringStatus context](self, "context");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("context"));

}

- (CTTetheringStatus)initWithCoder:(id)a3
{
  id v4;
  CTTetheringStatus *v5;
  uint64_t v6;
  NSNumber *carrierEnabled;
  uint64_t v8;
  NSNumber *userAuthenticated;
  uint64_t v10;
  NSNumber *asserted;
  uint64_t v12;
  NSNumber *activationFailure;
  uint64_t v14;
  NSNumber *misPdpMaxHosts;
  uint64_t v16;
  CTDataConnectionAvailabilityStatus *connectionAvailabilityStatus;
  uint64_t v18;
  CTDataConnectionStatus *connectionStatus;
  uint64_t v20;
  CTXPCServiceSubscriptionContext *context;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CTTetheringStatus;
  v5 = -[CTTetheringStatus init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("carrierEnabled"));
    v6 = objc_claimAutoreleasedReturnValue();
    carrierEnabled = v5->_carrierEnabled;
    v5->_carrierEnabled = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userAuthenticated"));
    v8 = objc_claimAutoreleasedReturnValue();
    userAuthenticated = v5->_userAuthenticated;
    v5->_userAuthenticated = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("asserted"));
    v10 = objc_claimAutoreleasedReturnValue();
    asserted = v5->_asserted;
    v5->_asserted = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activationFailure"));
    v12 = objc_claimAutoreleasedReturnValue();
    activationFailure = v5->_activationFailure;
    v5->_activationFailure = (NSNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("misPdpMaxHosts"));
    v14 = objc_claimAutoreleasedReturnValue();
    misPdpMaxHosts = v5->_misPdpMaxHosts;
    v5->_misPdpMaxHosts = (NSNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("connectionAvailabilityStatus"));
    v16 = objc_claimAutoreleasedReturnValue();
    connectionAvailabilityStatus = v5->_connectionAvailabilityStatus;
    v5->_connectionAvailabilityStatus = (CTDataConnectionAvailabilityStatus *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("connectionStatus"));
    v18 = objc_claimAutoreleasedReturnValue();
    connectionStatus = v5->_connectionStatus;
    v5->_connectionStatus = (CTDataConnectionStatus *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("context"));
    v20 = objc_claimAutoreleasedReturnValue();
    context = v5->_context;
    v5->_context = (CTXPCServiceSubscriptionContext *)v20;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)carrierEnabled
{
  return self->_carrierEnabled;
}

- (void)setCarrierEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_carrierEnabled, a3);
}

- (NSNumber)userAuthenticated
{
  return self->_userAuthenticated;
}

- (void)setUserAuthenticated:(id)a3
{
  objc_storeStrong((id *)&self->_userAuthenticated, a3);
}

- (NSNumber)asserted
{
  return self->_asserted;
}

- (void)setAsserted:(id)a3
{
  objc_storeStrong((id *)&self->_asserted, a3);
}

- (NSNumber)activationFailure
{
  return self->_activationFailure;
}

- (void)setActivationFailure:(id)a3
{
  objc_storeStrong((id *)&self->_activationFailure, a3);
}

- (NSNumber)misPdpMaxHosts
{
  return self->_misPdpMaxHosts;
}

- (void)setMisPdpMaxHosts:(id)a3
{
  objc_storeStrong((id *)&self->_misPdpMaxHosts, a3);
}

- (CTDataConnectionAvailabilityStatus)connectionAvailabilityStatus
{
  return self->_connectionAvailabilityStatus;
}

- (void)setConnectionAvailabilityStatus:(id)a3
{
  objc_storeStrong((id *)&self->_connectionAvailabilityStatus, a3);
}

- (CTDataConnectionStatus)connectionStatus
{
  return self->_connectionStatus;
}

- (void)setConnectionStatus:(id)a3
{
  objc_storeStrong((id *)&self->_connectionStatus, a3);
}

- (CTXPCServiceSubscriptionContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_connectionStatus, 0);
  objc_storeStrong((id *)&self->_connectionAvailabilityStatus, 0);
  objc_storeStrong((id *)&self->_misPdpMaxHosts, 0);
  objc_storeStrong((id *)&self->_activationFailure, 0);
  objc_storeStrong((id *)&self->_asserted, 0);
  objc_storeStrong((id *)&self->_userAuthenticated, 0);
  objc_storeStrong((id *)&self->_carrierEnabled, 0);
}

@end
