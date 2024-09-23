@implementation FPKnownFolderPathMatchingLocation

- (FPKnownFolderPathMatchingLocation)initWithParentItemIdentifier:(id)a3 filename:(id)a4
{
  id v6;
  id v7;
  FPKnownFolderPathMatchingLocation *v8;
  uint64_t v9;
  NSString *parentItemIdentifier;
  uint64_t v11;
  NSString *filename;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FPKnownFolderPathMatchingLocation;
  v8 = -[FPKnownFolderPathMatchingLocation init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    parentItemIdentifier = v8->_parentItemIdentifier;
    v8->_parentItemIdentifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    filename = v8->_filename;
    v8->_filename = (NSString *)v11;

  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FPKnownFolderPathMatchingLocation)initWithCoder:(id)a3
{
  id v4;
  FPKnownFolderPathMatchingLocation *v5;
  uint64_t v6;
  NSString *parentItemIdentifier;
  uint64_t v8;
  NSString *filename;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FPKnownFolderPathMatchingLocation;
  v5 = -[FPKnownFolderPathMatchingLocation init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_parentItemIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    parentItemIdentifier = v5->_parentItemIdentifier;
    v5->_parentItemIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_filename"));
    v8 = objc_claimAutoreleasedReturnValue();
    filename = v5->_filename;
    v5->_filename = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *parentItemIdentifier;
  id v5;

  parentItemIdentifier = self->_parentItemIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", parentItemIdentifier, CFSTR("_parentItemIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_filename, CFSTR("_filename"));

}

- (id)description
{
  void *v2;
  NSString *parentItemIdentifier;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  parentItemIdentifier = self->_parentItemIdentifier;
  -[NSString fp_obfuscatedPath](self->_filename, "fp_obfuscatedPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<p:%@ n:\"%@\">"), parentItemIdentifier, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)parentItemIdentifier
{
  return self->_parentItemIdentifier;
}

- (NSString)filename
{
  return self->_filename;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_parentItemIdentifier, 0);
}

@end
