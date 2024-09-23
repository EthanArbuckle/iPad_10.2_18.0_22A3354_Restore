@implementation GKPlayerEmailInternal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_501 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_501, &__block_literal_global_502);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_500;
}

void __48__GKPlayerEmailInternal_secureCodedPropertyKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("address");
  v2[1] = CFSTR("verified");
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_500;
  secureCodedPropertyKeys_sSecureCodedKeys_500 = v0;

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[GKPlayerEmailInternal address](self, "address");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v5, "address");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToString:", v7);
    }
    else
    {
      -[GKPlayerEmailInternal addressSHA1](self, "addressSHA1");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addressSHA1");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", v9);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[GKPlayerEmailInternal address](self, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[GKPlayerEmailInternal address](self, "address");
  else
    -[GKPlayerEmailInternal addressSHA1](self, "addressSHA1");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  return v5;
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_storeStrong((id *)&self->_address, a3);
}

- (NSString)addressSHA1
{
  return self->_addressSHA1;
}

- (void)setAddressSHA1:(id)a3
{
  objc_storeStrong((id *)&self->_addressSHA1, a3);
}

- (NSString)addressPrefix
{
  return self->_addressPrefix;
}

- (void)setAddressPrefix:(id)a3
{
  objc_storeStrong((id *)&self->_addressPrefix, a3);
}

- (BOOL)verified
{
  return self->_verified;
}

- (void)setVerified:(BOOL)a3
{
  self->_verified = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressPrefix, 0);
  objc_storeStrong((id *)&self->_addressSHA1, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end
