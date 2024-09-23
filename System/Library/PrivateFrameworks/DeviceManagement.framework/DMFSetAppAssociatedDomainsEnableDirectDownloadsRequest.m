@implementation DMFSetAppAssociatedDomainsEnableDirectDownloadsRequest

+ (id)permittedPlatforms
{
  return &unk_1E6EF4D78;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFSetAppAssociatedDomainsEnableDirectDownloadsRequest)initWithCoder:(id)a3
{
  id v4;
  DMFSetAppAssociatedDomainsEnableDirectDownloadsRequest *v5;
  void *v6;
  uint64_t v7;
  NSNumber *associatedDomainsEnableDirectDownloads;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DMFSetAppAssociatedDomainsEnableDirectDownloadsRequest;
  v5 = -[DMFAppRequest initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("associatedDomainsEnableDirectDownloads"));
    v7 = objc_claimAutoreleasedReturnValue();
    associatedDomainsEnableDirectDownloads = v5->_associatedDomainsEnableDirectDownloads;
    v5->_associatedDomainsEnableDirectDownloads = (NSNumber *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DMFSetAppAssociatedDomainsEnableDirectDownloadsRequest;
  v4 = a3;
  -[DMFAppRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[DMFSetAppAssociatedDomainsEnableDirectDownloadsRequest associatedDomainsEnableDirectDownloads](self, "associatedDomainsEnableDirectDownloads", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("associatedDomainsEnableDirectDownloads"));

}

- (NSNumber)associatedDomainsEnableDirectDownloads
{
  return self->_associatedDomainsEnableDirectDownloads;
}

- (void)setAssociatedDomainsEnableDirectDownloads:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedDomainsEnableDirectDownloads, 0);
}

@end
