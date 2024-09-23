@implementation DRPasteAnnouncementEndpoint

- (id)_initWithLocalizedName:(id)a3
{
  id v4;
  DRPasteAnnouncementEndpoint *v5;
  uint64_t v6;
  NSString *localizedName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DRPasteAnnouncementEndpoint;
  v5 = -[DRPasteAnnouncementEndpoint init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DRPasteAnnouncementEndpoint)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  DRPasteAnnouncementEndpoint *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[DRPasteAnnouncementEndpoint _initWithLocalizedName:](self, "_initWithLocalizedName:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *localizedName;

  localizedName = self->_localizedName;
  if (localizedName)
    objc_msgSend(a3, "encodeObject:forKey:", localizedName, CFSTR("localizedName"));
}

- (id)localizedName
{
  return self->_localizedName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end
