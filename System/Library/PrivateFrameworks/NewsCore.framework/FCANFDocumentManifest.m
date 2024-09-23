@implementation FCANFDocumentManifest

- (FCANFDocumentManifest)initWithNonImageResourceIDs:(id)a3 optimalImageResourceIDs:(id)a4 smallestImageResourceIDs:(id)a5
{
  id v8;
  id v9;
  id v10;
  FCANFDocumentManifest *v11;
  uint64_t v12;
  NSArray *nonImageResourceIDs;
  uint64_t v14;
  NSArray *optimalImageResourceIDs;
  uint64_t v16;
  NSArray *smallestImageResourceIDs;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)FCANFDocumentManifest;
  v11 = -[FCANFDocumentManifest init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    nonImageResourceIDs = v11->_nonImageResourceIDs;
    v11->_nonImageResourceIDs = (NSArray *)v12;

    v14 = objc_msgSend(v9, "copy");
    optimalImageResourceIDs = v11->_optimalImageResourceIDs;
    v11->_optimalImageResourceIDs = (NSArray *)v14;

    v16 = objc_msgSend(v10, "copy");
    smallestImageResourceIDs = v11->_smallestImageResourceIDs;
    v11->_smallestImageResourceIDs = (NSArray *)v16;

  }
  return v11;
}

- (id)description
{
  FCDescription *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = -[FCDescription initWithObject:]([FCDescription alloc], "initWithObject:", self);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[FCANFDocumentManifest nonImageResourceIDs](self, "nonImageResourceIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCDescription addField:object:](v3, "addField:object:", CFSTR("nonImageResourceIDs"), v6);

  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[FCANFDocumentManifest optimalImageResourceIDs](self, "optimalImageResourceIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCDescription addField:object:](v3, "addField:object:", CFSTR("optimalImageResourceIDs"), v9);

  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[FCANFDocumentManifest smallestImageResourceIDs](self, "smallestImageResourceIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCDescription addField:object:](v3, "addField:object:", CFSTR("smallestImageResourceIDs"), v12);

  -[FCDescription descriptionString](v3, "descriptionString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCANFDocumentManifest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  FCANFDocumentManifest *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("nonImageResourceIDs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("optimalImageResourceIDs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("smallestImageResourceIDs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v8 = v5;
  else
    v8 = (void *)MEMORY[0x1E0C9AA60];
  if (v6)
    v9 = v6;
  else
    v9 = (void *)MEMORY[0x1E0C9AA60];
  if (v7)
    v10 = v7;
  else
    v10 = (void *)MEMORY[0x1E0C9AA60];
  v11 = -[FCANFDocumentManifest initWithNonImageResourceIDs:optimalImageResourceIDs:smallestImageResourceIDs:](self, "initWithNonImageResourceIDs:optimalImageResourceIDs:smallestImageResourceIDs:", v8, v9, v10);

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[FCANFDocumentManifest nonImageResourceIDs](self, "nonImageResourceIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("nonImageResourceIDs"));

  -[FCANFDocumentManifest optimalImageResourceIDs](self, "optimalImageResourceIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("optimalImageResourceIDs"));

  -[FCANFDocumentManifest smallestImageResourceIDs](self, "smallestImageResourceIDs");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("smallestImageResourceIDs"));

}

- (NSArray)nonImageResourceIDs
{
  return self->_nonImageResourceIDs;
}

- (NSArray)optimalImageResourceIDs
{
  return self->_optimalImageResourceIDs;
}

- (NSArray)smallestImageResourceIDs
{
  return self->_smallestImageResourceIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smallestImageResourceIDs, 0);
  objc_storeStrong((id *)&self->_optimalImageResourceIDs, 0);
  objc_storeStrong((id *)&self->_nonImageResourceIDs, 0);
}

@end
