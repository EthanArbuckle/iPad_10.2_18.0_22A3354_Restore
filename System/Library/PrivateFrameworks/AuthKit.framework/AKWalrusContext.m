@implementation AKWalrusContext

- (AKWalrusContext)initWithCoder:(id)a3
{
  id v4;
  AKWalrusContext *v5;
  uint64_t v6;
  NSUUID *identifier;
  uint64_t v8;
  NSString *altDSID;

  v4 = a3;
  v5 = -[AKWalrusContext init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    v5->_cliMode = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_cliMode"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_altDSID"));
    v8 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("_identifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_cliMode, CFSTR("_cliMode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_altDSID, CFSTR("_altDSID"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_BYTE *)(v4 + 8) = self->_cliMode;
  v5 = -[NSString copy](self->_altDSID, "copy");
  v6 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v5;

  v7 = -[NSUUID copy](self->_identifier, "copy");
  v8 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v7;

  return (id)v4;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WalrusContext:%@, altDSID: %@, cliMode: %i"), self->_identifier, self->_altDSID, self->_cliMode);
}

- (NSUUID)_identifier
{
  return self->_identifier;
}

- (BOOL)cliMode
{
  return self->_cliMode;
}

- (void)setCliMode:(BOOL)a3
{
  self->_cliMode = a3;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
