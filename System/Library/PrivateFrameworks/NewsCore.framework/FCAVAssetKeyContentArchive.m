@implementation FCAVAssetKeyContentArchive

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6)
  {
    -[NTPBAVAssetKey identifier](self->_avAssetKey, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6[1], "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
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

  -[NTPBAVAssetKey identifier](self->_avAssetKey, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  FCDescription *v3;
  void *v4;

  v3 = -[FCDescription initWithObject:]([FCDescription alloc], "initWithObject:", self);
  -[FCDescription addField:object:](v3, "addField:object:", CFSTR("avAssetKey"), self->_avAssetKey);
  -[FCDescription descriptionString](v3, "descriptionString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCAVAssetKeyContentArchive)initWithCoder:(id)a3
{
  id v4;
  FCAVAssetKeyContentArchive *v5;
  uint64_t v6;
  NTPBAVAssetKey *avAssetKey;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCAVAssetKeyContentArchive;
  v5 = -[FCAVAssetKeyContentArchive init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("avAssetKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    avAssetKey = v5->_avAssetKey;
    v5->_avAssetKey = (NTPBAVAssetKey *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_avAssetKey, CFSTR("avAssetKey"));
}

- (id)unarchiveIntoContentContext:(id)a3
{
  void *v4;
  void *v5;
  FCContentUnarchiveResult *v6;
  int64_t v7;

  objc_msgSend(a3, "internalContentContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "avAssetKeyCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "importAVAssetKey:", self->_avAssetKey);

  v6 = [FCContentUnarchiveResult alloc];
  v7 = -[FCAVAssetKeyContentArchive storageSize](self, "storageSize");
  return -[FCContentUnarchiveResult initWithInterestToken:storageSize:](v6, "initWithInterestToken:storageSize:", MEMORY[0x1E0C9AA60], v7);
}

- (id)manifest
{
  FCContentManifest *v3;
  void *v4;
  void *v5;
  FCContentManifest *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = [FCContentManifest alloc];
  -[NTPBAVAssetKey identifier](self->_avAssetKey, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FCContentManifest initWithAVAssetKeyIDs:](v3, "initWithAVAssetKeyIDs:", v5);

  return v6;
}

- (int64_t)storageSize
{
  void *v2;
  int64_t v3;

  -[NTPBAVAssetKey keyData](self->_avAssetKey, "keyData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avAssetKey, 0);
}

@end
