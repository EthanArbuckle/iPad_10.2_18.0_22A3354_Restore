@implementation DMFUpdateDeclarationsRequest

+ (id)permittedPlatforms
{
  return &unk_1E6EF4F58;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFUpdateDeclarationsRequest)initWithCoder:(id)a3
{
  id v4;
  DMFUpdateDeclarationsRequest *v5;
  void *v6;
  uint64_t v7;
  NSString *organizationIdentifier;
  void *v9;
  uint64_t v10;
  NSString *syncToken;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSArray *upsertDeclarations;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSArray *removeDeclarations;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)DMFUpdateDeclarationsRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v41, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("organizationIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    organizationIdentifier = v5->_organizationIdentifier;
    v5->_organizationIdentifier = (NSString *)v7;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("syncToken"));
    v10 = objc_claimAutoreleasedReturnValue();
    syncToken = v5->_syncToken;
    v5->_syncToken = (NSString *)v10;

    v39 = (void *)MEMORY[0x1E0C99E60];
    v37 = objc_opt_class();
    v35 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    objc_msgSend(v39, "setWithObjects:", v37, v35, v12, v13, v14, v15, v16, v17, v18, v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("upsertDeclarations"));
    v21 = objc_claimAutoreleasedReturnValue();
    upsertDeclarations = v5->_upsertDeclarations;
    v5->_upsertDeclarations = (NSArray *)v21;

    v40 = (void *)MEMORY[0x1E0C99E60];
    v38 = objc_opt_class();
    v36 = objc_opt_class();
    v23 = objc_opt_class();
    v24 = objc_opt_class();
    v25 = objc_opt_class();
    v26 = objc_opt_class();
    v27 = objc_opt_class();
    v28 = objc_opt_class();
    v29 = objc_opt_class();
    v30 = objc_opt_class();
    objc_msgSend(v40, "setWithObjects:", v38, v36, v23, v24, v25, v26, v27, v28, v29, v30, objc_opt_class(), 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v31, CFSTR("removeDeclarations"));
    v32 = objc_claimAutoreleasedReturnValue();
    removeDeclarations = v5->_removeDeclarations;
    v5->_removeDeclarations = (NSArray *)v32;

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
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DMFUpdateDeclarationsRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  -[DMFUpdateDeclarationsRequest organizationIdentifier](self, "organizationIdentifier", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("organizationIdentifier"));

  -[DMFUpdateDeclarationsRequest syncToken](self, "syncToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("syncToken"));

  -[DMFUpdateDeclarationsRequest upsertDeclarations](self, "upsertDeclarations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("upsertDeclarations"));

  -[DMFUpdateDeclarationsRequest removeDeclarations](self, "removeDeclarations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("removeDeclarations"));

}

- (NSString)organizationIdentifier
{
  return self->_organizationIdentifier;
}

- (void)setOrganizationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)syncToken
{
  return self->_syncToken;
}

- (void)setSyncToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)upsertDeclarations
{
  return self->_upsertDeclarations;
}

- (void)setUpsertDeclarations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)removeDeclarations
{
  return self->_removeDeclarations;
}

- (void)setRemoveDeclarations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removeDeclarations, 0);
  objc_storeStrong((id *)&self->_upsertDeclarations, 0);
  objc_storeStrong((id *)&self->_syncToken, 0);
  objc_storeStrong((id *)&self->_organizationIdentifier, 0);
}

@end
