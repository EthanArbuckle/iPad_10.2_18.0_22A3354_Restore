@implementation DDUIInfoPlist

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[NSDictionary allValues](self->_browsesByIdentifier, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary allValues](self->_advertisesByIdentifier, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p; browses: %@; advertises: %@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSDictionary)browsesByIdentifier
{
  return self->_browsesByIdentifier;
}

- (void)setBrowsesByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_browsesByIdentifier, a3);
}

- (NSDictionary)advertisesByIdentifier
{
  return self->_advertisesByIdentifier;
}

- (void)setAdvertisesByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_advertisesByIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advertisesByIdentifier, 0);
  objc_storeStrong((id *)&self->_browsesByIdentifier, 0);
}

@end
