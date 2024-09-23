@implementation CorrectionsProfilesPersistedState

- (CorrectionsProfilesPersistedState)initWithCoder:(id)a3
{
  id v4;
  CorrectionsProfilesPersistedState *v5;
  uint64_t v6;
  NSString *digest;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSDictionary *correctionsProfiles;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CorrectionsProfilesPersistedState;
  v5 = -[CorrectionsProfilesPersistedState init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("digest"));
    v6 = objc_claimAutoreleasedReturnValue();
    digest = v5->_digest;
    v5->_digest = (NSString *)v6;

    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("correctionsProfiles"));
    v12 = objc_claimAutoreleasedReturnValue();
    correctionsProfiles = v5->_correctionsProfiles;
    v5->_correctionsProfiles = (NSDictionary *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *digest;
  id v5;

  digest = self->_digest;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", digest, CFSTR("digest"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_correctionsProfiles, CFSTR("correctionsProfiles"));

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p digest='%@' profiles=%@"), objc_opt_class(), self, self->_digest, self->_correctionsProfiles);
}

- (NSDictionary)correctionsProfiles
{
  return self->_correctionsProfiles;
}

- (void)setCorrectionsProfiles:(id)a3
{
  objc_storeStrong((id *)&self->_correctionsProfiles, a3);
}

- (NSString)digest
{
  return self->_digest;
}

- (void)setDigest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digest, 0);
  objc_storeStrong((id *)&self->_correctionsProfiles, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
