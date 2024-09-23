@implementation MICandidateContainer

- (MICandidateContainer)initWithContainerURL:(id)a3 identifier:(id)a4 metadata:(id)a5
{
  id v9;
  id v10;
  id v11;
  MICandidateContainer *v12;
  MICandidateContainer *v13;
  uint64_t v14;
  NSString *identifier;
  uint64_t v16;
  NSDictionary *metadata;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MICandidateContainer;
  v12 = -[MICandidateContainer init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_rootURL, a3);
    v14 = objc_msgSend(v10, "copy");
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    metadata = v13->_metadata;
    v13->_metadata = (NSDictionary *)v16;

  }
  return v13;
}

- (int64_t)estimatedSize
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;

  -[MICandidateContainer metadata](self, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("StaticDiskUsage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "longLongValue");
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0D3AD58], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MICandidateContainer rootURL](self, "rootURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "diskUsageForURL:", v7);

  }
  return v5;
}

- (BOOL)isAppleApp
{
  void *v2;
  char v3;

  -[MICandidateContainer identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("com.apple."));

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[MICandidateContainer rootURL](self, "rootURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MICandidateContainer identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MICandidateContainer metadata](self, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithContainerURL:identifier:metadata:", v5, v6, v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  MICandidateContainer *v4;
  MICandidateContainer *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  char v14;

  v4 = (MICandidateContainer *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MICandidateContainer rootURL](self, "rootURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MICandidateContainer rootURL](v5, "rootURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if (v8
        && (-[MICandidateContainer identifier](self, "identifier"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            -[MICandidateContainer identifier](v5, "identifier"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v11 = objc_msgSend(v9, "isEqual:", v10),
            v10,
            v9,
            v11))
      {
        -[MICandidateContainer metadata](self, "metadata");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[MICandidateContainer metadata](v5, "metadata");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqual:", v13);

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[MICandidateContainer rootURL](self, "rootURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[MICandidateContainer identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[MICandidateContainer metadata](self, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (NSURL)rootURL
{
  return self->_rootURL;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_rootURL, 0);
}

@end
