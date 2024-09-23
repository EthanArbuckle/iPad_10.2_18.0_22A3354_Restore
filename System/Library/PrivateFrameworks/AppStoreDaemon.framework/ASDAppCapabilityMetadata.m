@implementation ASDAppCapabilityMetadata

+ (id)metadataWithAction:(int64_t)a3 entitlements:(id)a4 infoPlist:(id)a5
{
  void *v6;

  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setAction:", a3);
  objc_msgSend(v6, "setFeatures:", 0);
  return v6;
}

+ (id)metadataWithAction:(int64_t)a3 bundleID:(id)a4 capabilities:(id)a5
{
  id v7;
  id v8;
  void *v9;
  _BOOL8 v10;
  int v11;
  uint64_t v12;

  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setAction:", a3);
  objc_msgSend(v9, "setBundleID:", v8);

  v10 = (objc_msgSend(v7, "containsObject:", CFSTR("a")) & 1) != 0
     || objc_msgSend(v7, "containsObject:", CFSTR("supports-alternate-distribution"));
  v11 = objc_msgSend(v7, "containsObject:", CFSTR("is-custom-browser-engine-app"));
  if (objc_msgSend(v7, "containsObject:", CFSTR("uses-non-webkit-browser-engine")) | v11)
    v12 = v10 | 2;
  else
    v12 = v10;
  objc_msgSend(v9, "setFeatures:", v12);

  return v9;
}

- (BOOL)supportsFeatureA
{
  return self->_features & 1;
}

- (void)setSupportsFeatureA:(BOOL)a3
{
  self->_features = self->_features & 0xFFFFFFFFFFFFFFFELL | a3;
}

- (BOOL)supportsFeatureB
{
  return (LOBYTE(self->_features) >> 1) & 1;
}

- (void)setSupportsFeatureB:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  self->_features = self->_features & 0xFFFFFFFFFFFFFFFDLL | v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ASDAppCapabilityMetadata *v5;
  uint64_t v6;
  NSString *bundleID;

  v5 = -[ASDAppCapabilityMetadata init](+[ASDAppCapabilityMetadata allocWithZone:](ASDAppCapabilityMetadata, "allocWithZone:"), "init");
  v5->_action = self->_action;
  v6 = -[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  bundleID = v5->_bundleID;
  v5->_bundleID = (NSString *)v6;

  v5->_features = self->_features;
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDAppCapabilityMetadata)initWithCoder:(id)a3
{
  id v4;
  ASDAppCapabilityMetadata *v5;
  uint64_t v6;
  NSString *bundleID;

  v4 = a3;
  v5 = -[ASDAppCapabilityMetadata init](self, "init");
  if (v5)
  {
    v5->_action = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("A"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("B"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    v5->_features = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("C"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t action;
  id v5;

  action = self->_action;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", action, CFSTR("A"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleID, CFSTR("B"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_features, CFSTR("C"));

}

- (id)description
{
  __CFString *v3;
  void *v4;

  if (-[NSString length](self->_bundleID, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), self->_bundleID);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1E37C1320;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@Action: %ld Features: %ld"), v3, self->_action, self->_features);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)supportsFeatureC
{
  return self->_supportsFeatureC;
}

- (void)setSupportsFeatureC:(BOOL)a3
{
  self->_supportsFeatureC = a3;
}

- (int64_t)features
{
  return self->_features;
}

- (void)setFeatures:(int64_t)a3
{
  self->_features = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
