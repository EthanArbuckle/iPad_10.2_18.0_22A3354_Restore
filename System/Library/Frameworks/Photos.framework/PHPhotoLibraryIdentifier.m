@implementation PHPhotoLibraryIdentifier

- (NSString)archivalStringRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  -[PHPhotoLibraryIdentifier uuid](self, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPhotoLibraryIdentifier containerIdentifier](self, "containerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPhotoLibraryIdentifier domain](self, "domain");
  PLPhotoLibraryIdentifierEncodeArchivalStringRepresentationFromIdentifierProperties();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (PHPhotoLibraryIdentifier)initWithArchivalStringRepresentation:(id)a3
{
  id v4;
  PHPhotoLibraryIdentifier *v5;
  int v6;
  id v7;
  id v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PHPhotoLibraryIdentifier;
  v5 = -[PHPhotoLibraryIdentifier init](&v11, sel_init);
  if (v5)
  {
    v6 = PLPhotoLibraryIdentifierDecodeIdentifierPropertiesFromArchivalStringRepresentation();
    v7 = 0;
    v8 = 0;
    if (v6)
    {
      objc_storeStrong((id *)&v5->_uuid, 0);
      objc_storeStrong((id *)&v5->_containerIdentifier, 0);
      v5->_domain = 0;
    }
    if (!v5->_uuid)
    {
      PLPhotoKitGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v4;
        _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_ERROR, "Failed to create identifier from invalid string encoding: %@", buf, 0xCu);
      }

      v5 = 0;
    }

  }
  return v5;
}

- (PHPhotoLibraryIdentifier)initWithPLLibraryIdentifier:(id)a3
{
  id v5;
  PHPhotoLibraryIdentifier *v6;
  PHPhotoLibraryIdentifier *v7;
  uint64_t v8;
  NSString *uuid;
  uint64_t v10;
  NSString *containerIdentifier;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PHPhotoLibraryIdentifier;
  v6 = -[PHPhotoLibraryIdentifier init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pl_libraryIdentifier, a3);
    -[PLPhotoLibraryIdentifier uuid](v7->_pl_libraryIdentifier, "uuid");
    v8 = objc_claimAutoreleasedReturnValue();
    uuid = v7->_uuid;
    v7->_uuid = (NSString *)v8;

    -[PLPhotoLibraryIdentifier containerIdentifier](v7->_pl_libraryIdentifier, "containerIdentifier");
    v10 = objc_claimAutoreleasedReturnValue();
    containerIdentifier = v7->_containerIdentifier;
    v7->_containerIdentifier = (NSString *)v10;

    v7->_domain = -[PLPhotoLibraryIdentifier domain](v7->_pl_libraryIdentifier, "domain");
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  PHPhotoLibraryIdentifier *v4;
  PHPhotoLibraryIdentifier *v5;
  void *v6;
  void *v7;
  int IsEqual;
  void *v9;
  void *v10;
  int v11;
  int64_t v12;
  BOOL v13;

  v4 = (PHPhotoLibraryIdentifier *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PHPhotoLibraryIdentifier uuid](self, "uuid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHPhotoLibraryIdentifier uuid](v5, "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      IsEqual = PLObjectIsEqual();

      if (IsEqual
        && (-[PHPhotoLibraryIdentifier containerIdentifier](self, "containerIdentifier"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            -[PHPhotoLibraryIdentifier containerIdentifier](v5, "containerIdentifier"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v11 = PLObjectIsEqual(),
            v10,
            v9,
            v11))
      {
        v12 = -[PHPhotoLibraryIdentifier domain](self, "domain");
        v13 = v12 == -[PHPhotoLibraryIdentifier domain](v5, "domain");
      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PHPhotoLibraryIdentifier uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (int64_t)domain
{
  return self->_domain;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PHPhotoLibraryIdentifier;
  -[PHPhotoLibraryIdentifier description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPhotoLibraryIdentifier archivalStringRepresentation](self, "archivalStringRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(": [%@]"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PLPhotoLibraryIdentifier *pl_libraryIdentifier;
  id v5;
  id v6;

  pl_libraryIdentifier = self->_pl_libraryIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", pl_libraryIdentifier, CFSTR("pl_libraryIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uuid, CFSTR("uuid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_containerIdentifier, CFSTR("containerIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_domain);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("domain"));

}

- (PHPhotoLibraryIdentifier)initWithCoder:(id)a3
{
  id v4;
  PHPhotoLibraryIdentifier *v5;
  uint64_t v6;
  PLPhotoLibraryIdentifier *pl_libraryIdentifier;
  uint64_t v8;
  NSString *uuid;
  uint64_t v10;
  NSString *containerIdentifier;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PHPhotoLibraryIdentifier;
  v5 = -[PHPhotoLibraryIdentifier init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pl_libraryIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    pl_libraryIdentifier = v5->_pl_libraryIdentifier;
    v5->_pl_libraryIdentifier = (PLPhotoLibraryIdentifier *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
    v8 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("containerIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    containerIdentifier = v5->_containerIdentifier;
    v5->_containerIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("domain"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_domain = objc_msgSend(v12, "integerValue");

  }
  return v5;
}

- (PLPhotoLibrarySearchCriteria)librarySearchCriteria
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0D719D8]);
  -[PHPhotoLibraryIdentifier uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUuid:", v4);

  -[PHPhotoLibraryIdentifier containerIdentifier](self, "containerIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContainerIdentifier:", v5);

  return (PLPhotoLibrarySearchCriteria *)v3;
}

- (PLPhotoLibraryIdentifier)pl_libraryIdentifier
{
  return (PLPhotoLibraryIdentifier *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_pl_libraryIdentifier, 0);
}

+ (NSString)defaultApplicationContainerIdentifier
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (id)defaultApplicationLibraryIdentifierWithContainerIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(a1, "defaultApplicationContainerIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  PLPhotoLibraryIdentifierEncodeArchivalStringRepresentationFromIdentifierProperties();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithArchivalStringRepresentation:", v8);

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
