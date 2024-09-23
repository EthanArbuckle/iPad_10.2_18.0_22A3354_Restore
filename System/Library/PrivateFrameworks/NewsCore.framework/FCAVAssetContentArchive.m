@implementation FCAVAssetContentArchive

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
    -[NTPBAVAsset identifier](self->_avAsset, "identifier");
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

  -[NTPBAVAsset identifier](self->_avAsset, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  FCDescription *v3;
  void *v4;

  v3 = -[FCDescription initWithObject:]([FCDescription alloc], "initWithObject:", self);
  -[FCDescription addField:object:](v3, "addField:object:", CFSTR("avAsset"), self->_avAsset);
  -[FCDescription descriptionString](v3, "descriptionString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCAVAssetContentArchive)initWithCoder:(id)a3
{
  id v4;
  FCAVAssetContentArchive *v5;
  uint64_t v6;
  NTPBAVAsset *avAsset;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCAVAssetContentArchive;
  v5 = -[FCAVAssetContentArchive init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("avAsset"));
    v6 = objc_claimAutoreleasedReturnValue();
    avAsset = v5->_avAsset;
    v5->_avAsset = (NTPBAVAsset *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_avAsset, CFSTR("avAsset"));
}

- (id)unarchiveIntoContentContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  FCContentUnarchiveResult *v7;

  objc_msgSend(a3, "internalContentContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "avAssetCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "importAVAsset:", self->_avAsset);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[FCContentUnarchiveResult initWithInterestToken:storageSize:]([FCContentUnarchiveResult alloc], "initWithInterestToken:storageSize:", v6, -[FCAVAssetContentArchive storageSize](self, "storageSize"));
  return v7;
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
  -[NTPBAVAsset identifier](self->_avAsset, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FCContentManifest initWithAVAssetIDs:](v3, "initWithAVAssetIDs:", v5);

  return v6;
}

- (int64_t)storageSize
{
  return -[NTPBAVAsset size](self->_avAsset, "size");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avAsset, 0);
}

@end
