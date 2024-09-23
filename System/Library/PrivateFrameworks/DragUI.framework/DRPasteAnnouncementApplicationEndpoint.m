@implementation DRPasteAnnouncementApplicationEndpoint

- (DRPasteAnnouncementApplicationEndpoint)initWithLocalizedName:(id)a3 persistentIdentifier:(id)a4
{
  id v6;
  DRPasteAnnouncementApplicationEndpoint *v7;
  uint64_t v8;
  NSData *persistentIdentifier;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)DRPasteAnnouncementApplicationEndpoint;
  v7 = -[DRPasteAnnouncementEndpoint _initWithLocalizedName:](&v11, sel__initWithLocalizedName_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    persistentIdentifier = v7->_persistentIdentifier;
    v7->_persistentIdentifier = (NSData *)v8;

  }
  return v7;
}

+ (id)homeScreenEndpoint
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__DRPasteAnnouncementApplicationEndpoint_homeScreenEndpoint__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (homeScreenEndpoint_onceToken != -1)
    dispatch_once(&homeScreenEndpoint_onceToken, block);
  return (id)homeScreenEndpoint_sharedInstance;
}

void __60__DRPasteAnnouncementApplicationEndpoint_homeScreenEndpoint__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  DRPasteAnnouncementApplicationEndpoint *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("SYSTEM_APP_NAME"), CFSTR("Home Screen"), CFSTR("Localizable"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", CFSTR("com.apple.springboard"), 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "persistentIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[DRPasteAnnouncementApplicationEndpoint initWithLocalizedName:persistentIdentifier:]([DRPasteAnnouncementApplicationEndpoint alloc], "initWithLocalizedName:persistentIdentifier:", v5, v2);
  v4 = (void *)homeScreenEndpoint_sharedInstance;
  homeScreenEndpoint_sharedInstance = (uint64_t)v3;

  *(_BYTE *)(homeScreenEndpoint_sharedInstance + 16) |= 1u;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DRPasteAnnouncementApplicationEndpoint)initWithCoder:(id)a3
{
  id v4;
  DRPasteAnnouncementApplicationEndpoint *v5;
  uint64_t v6;
  NSData *persistentIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DRPasteAnnouncementApplicationEndpoint;
  v5 = -[DRPasteAnnouncementEndpoint initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("persistentIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    persistentIdentifier = v5->_persistentIdentifier;
    v5->_persistentIdentifier = (NSData *)v6;

    *(_BYTE *)&v5->_flags = *(_BYTE *)&v5->_flags & 0xFE | objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isHomeScreen"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSData *persistentIdentifier;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)DRPasteAnnouncementApplicationEndpoint;
  -[DRPasteAnnouncementEndpoint encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  persistentIdentifier = self->_persistentIdentifier;
  if (persistentIdentifier)
  {
    objc_msgSend(v4, "encodeObject:forKey:", persistentIdentifier, CFSTR("persistentIdentifier"));
    objc_msgSend(v4, "encodeBool:forKey:", *(_BYTE *)&self->_flags & 1, CFSTR("isHomeScreen"));
  }

}

- (BOOL)isSimilarToApplicationEndpoint:(id)a3
{
  id v3;
  void *v4;
  void *v6;
  DRPasteAnnouncementApplicationEndpoint *v7;

  v3 = a3;
  objc_msgSend(v3, "persistentIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = objc_msgSend(v4, "isEqualToData:", self->_persistentIdentifier);

  if ((_DWORD)self)
  {
    self = (DRPasteAnnouncementApplicationEndpoint *)objc_alloc(MEMORY[0x24BDC1590]);
    objc_msgSend(v3, "persistentIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[DRPasteAnnouncementApplicationEndpoint initWithPersistentIdentifier:](self, "initWithPersistentIdentifier:", v6);

    objc_opt_class();
    LOBYTE(self) = objc_opt_isKindOfClass();

  }
  return self & 1;
}

- (NSData)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
}

@end
