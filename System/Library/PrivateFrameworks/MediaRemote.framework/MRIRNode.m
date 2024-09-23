@implementation MRIRNode

- (NSString)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ (%p): "), v5, self);

  -[MRIRNode avOutputDeviceIdentifier](self, "avOutputDeviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("avOutputDeviceIdentifier: %@"), v7);

  -[MRIRNode rapportIdentifier](self, "rapportIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", rapportIdentifier: %@"), v8);

  -[MRIRNode idsIdentifier](self, "idsIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", idsIdentifier: %@"), v9);

  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  MRIRNode *v4;
  MRIRNode *v5;
  MRIRNode *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (MRIRNode *)a3;
  v5 = v4;
  if (self == v4)
  {
    v9 = 1;
  }
  else if (-[MRIRNode conformsToProtocol:](v4, "conformsToProtocol:", &unk_1EE2F5B00))
  {
    v6 = v5;
    -[MRIRNode avOutputDeviceIdentifier](self, "avOutputDeviceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRIRNode avOutputDeviceIdentifier](v6, "avOutputDeviceIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == v8)
      v9 = 1;
    else
      v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MRIRNode avOutputDeviceIdentifier](self, "avOutputDeviceIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)avOutputDeviceIdentifier
{
  return self->_avOutputDeviceIdentifier;
}

- (void)setAvOutputDeviceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_avOutputDeviceIdentifier, a3);
}

- (NSString)rapportIdentifier
{
  return self->_rapportIdentifier;
}

- (void)setRapportIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_rapportIdentifier, a3);
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (void)setIdsIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_idsIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_rapportIdentifier, 0);
  objc_storeStrong((id *)&self->_avOutputDeviceIdentifier, 0);
}

@end
