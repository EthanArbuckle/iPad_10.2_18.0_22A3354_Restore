@implementation DMFAppRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFAppRequest)initWithCoder:(id)a3
{
  id v4;
  DMFAppRequest *v5;
  void *v6;
  uint64_t v7;
  NSString *bundleIdentifier;
  void *v9;
  uint64_t v10;
  NSNumber *storeItemIdentifier;
  void *v12;
  uint64_t v13;
  NSURL *manifestURL;
  void *v15;
  uint64_t v16;
  NSString *personaIdentifier;
  void *v18;
  uint64_t v19;
  NSString *sourceIdentifier;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)DMFAppRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v22, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("bundleIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v7;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("storeItemIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    storeItemIdentifier = v5->_storeItemIdentifier;
    v5->_storeItemIdentifier = (NSNumber *)v10;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("manifestURL"));
    v13 = objc_claimAutoreleasedReturnValue();
    manifestURL = v5->_manifestURL;
    v5->_manifestURL = (NSURL *)v13;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("personaIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    personaIdentifier = v5->_personaIdentifier;
    v5->_personaIdentifier = (NSString *)v16;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("sourceIdentifier"));
    v19 = objc_claimAutoreleasedReturnValue();
    sourceIdentifier = v5->_sourceIdentifier;
    v5->_sourceIdentifier = (NSString *)v19;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DMFAppRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  -[DMFAppRequest bundleIdentifier](self, "bundleIdentifier", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bundleIdentifier"));

  -[DMFAppRequest storeItemIdentifier](self, "storeItemIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("storeItemIdentifier"));

  -[DMFAppRequest manifestURL](self, "manifestURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("manifestURL"));

  -[DMFAppRequest personaIdentifier](self, "personaIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("personaIdentifier"));

  -[DMFAppRequest sourceIdentifier](self, "sourceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("sourceIdentifier"));

}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)storeItemIdentifier
{
  return self->_storeItemIdentifier;
}

- (void)setStoreItemIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSURL)manifestURL
{
  return self->_manifestURL;
}

- (void)setManifestURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)personaIdentifier
{
  return self->_personaIdentifier;
}

- (void)setPersonaIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void)setSourceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_personaIdentifier, 0);
  objc_storeStrong((id *)&self->_manifestURL, 0);
  objc_storeStrong((id *)&self->_storeItemIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
