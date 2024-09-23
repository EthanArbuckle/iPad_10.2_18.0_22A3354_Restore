@implementation SUUILibraryItemState

- (SUUILibraryItemState)initWithApplication:(id)a3
{
  id v4;
  SUUILibraryItemState *v5;
  SUUILibraryItemState *v6;
  uint64_t v7;
  NSString *bundleIdentifier;
  uint64_t v9;
  NSString *bundleVersion;
  uint64_t v11;
  NSNumber *storeAccountIdentifier;
  NSString *storePlatformKind;
  uint64_t v14;
  NSNumber *storeVersionIdentifier;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SUUILibraryItemState;
  v5 = -[SUUILibraryItemState init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_availability = 2;
    objc_msgSend(v4, "valueForProperty:", *MEMORY[0x24BEB2A60]);
    v7 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v6->_bundleIdentifier;
    v6->_bundleIdentifier = (NSString *)v7;

    objc_msgSend(v4, "valueForProperty:", *MEMORY[0x24BEB2A68]);
    v9 = objc_claimAutoreleasedReturnValue();
    bundleVersion = v6->_bundleVersion;
    v6->_bundleVersion = (NSString *)v9;

    objc_msgSend(v4, "valueForProperty:", *MEMORY[0x24BEB2A78]);
    v11 = objc_claimAutoreleasedReturnValue();
    storeAccountIdentifier = v6->_storeAccountIdentifier;
    v6->_storeAccountIdentifier = (NSNumber *)v11;

    storePlatformKind = v6->_storePlatformKind;
    v6->_storePlatformKind = (NSString *)CFSTR("iosSoftware");

    objc_msgSend(v4, "valueForProperty:", *MEMORY[0x24BEB2A88]);
    v14 = objc_claimAutoreleasedReturnValue();
    storeVersionIdentifier = v6->_storeVersionIdentifier;
    v6->_storeVersionIdentifier = (NSNumber *)v14;

  }
  return v6;
}

- (NSString)itemStateVariantIdentifier
{
  const __CFString *v2;
  const __CFString *v3;
  __CFString *v4;

  if ((self->_avTypes & 5) == 0)
    return (NSString *)0;
  v2 = CFSTR("rent_HD");
  v3 = CFSTR("rent");
  if (!self->_rental)
  {
    v2 = CFSTR("buy_HD");
    v3 = CFSTR("buy");
  }
  if (self->_highDefinition)
    v4 = (__CFString *)v2;
  else
    v4 = (__CFString *)v3;
  return (NSString *)v4;
}

- (id)newJavaScriptRepresentation
{
  id v3;
  void *v4;
  NSString *bundleIdentifier;
  NSString *bundleVersion;
  NSNumber *storeAccountIdentifier;
  void *v8;
  NSString *storeFlavorIdentifier;
  NSNumber *storeVersionIdentifier;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = v3;
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier)
    objc_msgSend(v3, "setObject:forKey:", bundleIdentifier, CFSTR("bundleId"));
  bundleVersion = self->_bundleVersion;
  if (bundleVersion)
    objc_msgSend(v4, "setObject:forKey:", bundleVersion, CFSTR("version"));
  if (self->_highDefinition)
    objc_msgSend(v4, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("isHD"));
  if (self->_preview)
    objc_msgSend(v4, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("preview"));
  if (self->_rental)
    objc_msgSend(v4, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("rental"));
  storeAccountIdentifier = self->_storeAccountIdentifier;
  if (storeAccountIdentifier)
  {
    -[NSNumber stringValue](storeAccountIdentifier, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("ownerDSID"));

  }
  storeFlavorIdentifier = self->_storeFlavorIdentifier;
  if (storeFlavorIdentifier)
    objc_msgSend(v4, "setObject:forKey:", storeFlavorIdentifier, CFSTR("flavor"));
  storeVersionIdentifier = self->_storeVersionIdentifier;
  if (storeVersionIdentifier)
  {
    -[NSNumber stringValue](storeVersionIdentifier, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("versionExternalId"));

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v5 + 8) = self->_availability;
  *(_QWORD *)(v5 + 16) = self->_avTypes;
  v6 = -[NSString copyWithZone:](self->_bundleIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSString copyWithZone:](self->_bundleVersion, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  *(_BYTE *)(v5 + 40) = self->_highDefinition;
  *(_BYTE *)(v5 + 41) = self->_preview;
  *(_BYTE *)(v5 + 42) = self->_rental;
  v10 = -[NSNumber copyWithZone:](self->_storeAccountIdentifier, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  v12 = -[NSString copyWithZone:](self->_storeFlavorIdentifier, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v12;

  v14 = -[NSString copyWithZone:](self->_storePlatformKind, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v14;

  v16 = -[NSNumber copyWithZone:](self->_storeVersionIdentifier, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v16;

  return (id)v5;
}

- (int64_t)availability
{
  return self->_availability;
}

- (void)setAvailability:(int64_t)a3
{
  self->_availability = a3;
}

- (unint64_t)AVTypes
{
  return self->_avTypes;
}

- (void)setAVTypes:(unint64_t)a3
{
  self->_avTypes = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isHighDefinition
{
  return self->_highDefinition;
}

- (void)setHighDefinition:(BOOL)a3
{
  self->_highDefinition = a3;
}

- (BOOL)isPreview
{
  return self->_preview;
}

- (void)setPreview:(BOOL)a3
{
  self->_preview = a3;
}

- (BOOL)isRental
{
  return self->_rental;
}

- (void)setRental:(BOOL)a3
{
  self->_rental = a3;
}

- (NSNumber)storeAccountIdentifier
{
  return self->_storeAccountIdentifier;
}

- (void)setStoreAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)storeFlavorIdentifier
{
  return self->_storeFlavorIdentifier;
}

- (void)setStoreFlavorIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)storePlatformKind
{
  return self->_storePlatformKind;
}

- (void)setStorePlatformKind:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)storeVersionIdentifier
{
  return self->_storeVersionIdentifier;
}

- (void)setStoreVersionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeVersionIdentifier, 0);
  objc_storeStrong((id *)&self->_storePlatformKind, 0);
  objc_storeStrong((id *)&self->_storeFlavorIdentifier, 0);
  objc_storeStrong((id *)&self->_storeAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
