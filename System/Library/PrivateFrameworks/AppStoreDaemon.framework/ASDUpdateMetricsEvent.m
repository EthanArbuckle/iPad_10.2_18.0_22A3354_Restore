@implementation ASDUpdateMetricsEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDUpdateMetricsEvent)initWithDictionary:(id)a3
{
  id v4;
  ASDUpdateMetricsEvent *v5;
  uint64_t v6;
  NSNumber *available;
  uint64_t v8;
  NSNumber *discovery;
  uint64_t v10;
  NSNumber *purchaseStart;
  uint64_t v12;
  NSNumber *purchaseComplete;
  uint64_t v14;
  NSNumber *downloadStart;
  uint64_t v16;
  NSNumber *downloadComplete;
  uint64_t v18;
  NSNumber *installStart;
  uint64_t v20;
  NSNumber *installComplete;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ASDUpdateMetricsEvent;
  v5 = -[ASDUpdateMetricsEvent init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("a"));
    v6 = objc_claimAutoreleasedReturnValue();
    available = v5->_available;
    v5->_available = (NSNumber *)v6;

    objc_msgSend(v4, "objectForKey:", CFSTR("d"));
    v8 = objc_claimAutoreleasedReturnValue();
    discovery = v5->_discovery;
    v5->_discovery = (NSNumber *)v8;

    objc_msgSend(v4, "objectForKey:", CFSTR("ps"));
    v10 = objc_claimAutoreleasedReturnValue();
    purchaseStart = v5->_purchaseStart;
    v5->_purchaseStart = (NSNumber *)v10;

    objc_msgSend(v4, "objectForKey:", CFSTR("pc"));
    v12 = objc_claimAutoreleasedReturnValue();
    purchaseComplete = v5->_purchaseComplete;
    v5->_purchaseComplete = (NSNumber *)v12;

    objc_msgSend(v4, "objectForKey:", CFSTR("ds"));
    v14 = objc_claimAutoreleasedReturnValue();
    downloadStart = v5->_downloadStart;
    v5->_downloadStart = (NSNumber *)v14;

    objc_msgSend(v4, "objectForKey:", CFSTR("dc"));
    v16 = objc_claimAutoreleasedReturnValue();
    downloadComplete = v5->_downloadComplete;
    v5->_downloadComplete = (NSNumber *)v16;

    objc_msgSend(v4, "objectForKey:", CFSTR("is"));
    v18 = objc_claimAutoreleasedReturnValue();
    installStart = v5->_installStart;
    v5->_installStart = (NSNumber *)v18;

    objc_msgSend(v4, "objectForKey:", CFSTR("ic"));
    v20 = objc_claimAutoreleasedReturnValue();
    installComplete = v5->_installComplete;
    v5->_installComplete = (NSNumber *)v20;

  }
  return v5;
}

- (ASDUpdateMetricsEvent)initWithCoder:(id)a3
{
  id v4;
  ASDUpdateMetricsEvent *v5;
  uint64_t v6;
  NSNumber *available;
  uint64_t v8;
  NSNumber *discovery;
  uint64_t v10;
  NSNumber *purchaseStart;
  uint64_t v12;
  NSNumber *purchaseComplete;
  uint64_t v14;
  NSNumber *downloadStart;
  uint64_t v16;
  NSNumber *downloadComplete;
  uint64_t v18;
  NSNumber *installStart;
  uint64_t v20;
  NSNumber *installComplete;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ASDUpdateMetricsEvent;
  v5 = -[ASDUpdateMetricsEvent init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("a"));
    v6 = objc_claimAutoreleasedReturnValue();
    available = v5->_available;
    v5->_available = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("d"));
    v8 = objc_claimAutoreleasedReturnValue();
    discovery = v5->_discovery;
    v5->_discovery = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ps"));
    v10 = objc_claimAutoreleasedReturnValue();
    purchaseStart = v5->_purchaseStart;
    v5->_purchaseStart = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pc"));
    v12 = objc_claimAutoreleasedReturnValue();
    purchaseComplete = v5->_purchaseComplete;
    v5->_purchaseComplete = (NSNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ds"));
    v14 = objc_claimAutoreleasedReturnValue();
    downloadStart = v5->_downloadStart;
    v5->_downloadStart = (NSNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dc"));
    v16 = objc_claimAutoreleasedReturnValue();
    downloadComplete = v5->_downloadComplete;
    v5->_downloadComplete = (NSNumber *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("is"));
    v18 = objc_claimAutoreleasedReturnValue();
    installStart = v5->_installStart;
    v5->_installStart = (NSNumber *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ic"));
    v20 = objc_claimAutoreleasedReturnValue();
    installComplete = v5->_installComplete;
    v5->_installComplete = (NSNumber *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *available;
  id v5;

  available = self->_available;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", available, CFSTR("a"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_discovery, CFSTR("d"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_purchaseStart, CFSTR("ps"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_purchaseComplete, CFSTR("pc"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_downloadStart, CFSTR("ds"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_downloadComplete, CFSTR("dc"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_installStart, CFSTR("is"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_installComplete, CFSTR("ic"));

}

+ (id)relativeMetricsKeys
{
  _QWORD v3[8];

  v3[7] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("d");
  v3[1] = CFSTR("ps");
  v3[2] = CFSTR("pc");
  v3[3] = CFSTR("ds");
  v3[4] = CFSTR("dc");
  v3[5] = CFSTR("is");
  v3[6] = CFSTR("ic");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSNumber)available
{
  return self->_available;
}

- (void)setAvailable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)discovery
{
  return self->_discovery;
}

- (void)setDiscovery:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)purchaseStart
{
  return self->_purchaseStart;
}

- (void)setPurchaseStart:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)purchaseComplete
{
  return self->_purchaseComplete;
}

- (void)setPurchaseComplete:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)downloadStart
{
  return self->_downloadStart;
}

- (void)setDownloadStart:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)downloadComplete
{
  return self->_downloadComplete;
}

- (void)setDownloadComplete:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)installStart
{
  return self->_installStart;
}

- (void)setInstallStart:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)installComplete
{
  return self->_installComplete;
}

- (void)setInstallComplete:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installComplete, 0);
  objc_storeStrong((id *)&self->_installStart, 0);
  objc_storeStrong((id *)&self->_downloadComplete, 0);
  objc_storeStrong((id *)&self->_downloadStart, 0);
  objc_storeStrong((id *)&self->_purchaseComplete, 0);
  objc_storeStrong((id *)&self->_purchaseStart, 0);
  objc_storeStrong((id *)&self->_discovery, 0);
  objc_storeStrong((id *)&self->_available, 0);
}

@end
