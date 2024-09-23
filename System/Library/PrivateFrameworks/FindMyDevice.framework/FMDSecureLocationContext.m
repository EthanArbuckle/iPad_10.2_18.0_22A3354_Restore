@implementation FMDSecureLocationContext

- (FMDSecureLocationContext)initWithCoder:(id)a3
{
  id v4;
  FMDSecureLocationContext *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FMDSecureLocationContext;
  v5 = -[FMDSecureLocationContext init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("findMyId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDSecureLocationContext setFindMyId:](v5, "setFindMyId:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mode"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDSecureLocationContext setMode:](v5, "setMode:", v7);

    -[FMDSecureLocationContext setStopMonitoringActivePolicy:](v5, "setStopMonitoringActivePolicy:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("stopMonitoringActivePolicy")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[FMDSecureLocationContext findMyId](self, "findMyId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("findMyId"));

  -[FMDSecureLocationContext mode](self, "mode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("mode"));

  objc_msgSend(v6, "encodeBool:forKey:", -[FMDSecureLocationContext stopMonitoringActivePolicy](self, "stopMonitoringActivePolicy"), CFSTR("stopMonitoringActivePolicy"));
}

- (void)setMode:(id)a3
{
  objc_storeStrong((id *)&self->_mode, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[FMDSecureLocationContext findMyId](self, "findMyId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMDSecureLocationContext mode](self, "mode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("findMyId %@ mode %@ stopMonitoringActivePolicy %i"), v4, v5, -[FMDSecureLocationContext stopMonitoringActivePolicy](self, "stopMonitoringActivePolicy"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)findMyId
{
  return self->_findMyId;
}

- (void)setFindMyId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)mode
{
  return self->_mode;
}

- (BOOL)stopMonitoringActivePolicy
{
  return self->_stopMonitoringActivePolicy;
}

- (void)setStopMonitoringActivePolicy:(BOOL)a3
{
  self->_stopMonitoringActivePolicy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mode, 0);
  objc_storeStrong((id *)&self->_findMyId, 0);
}

@end
