@implementation BMResourceSpecifier

- (void)encodeWithCoder:(id)a3
{
  unint64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_descriptors, CFSTR("descriptors"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_type);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSString hash](self->_name, "hash");
  v6 = v5 ^ -[NSArray hash](self->_descriptors, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && self->_type == v4[1]
    && -[NSString isEqual:](self->_name, "isEqual:", v4[2]))
  {
    v5 = -[NSArray isEqual:](self->_descriptors, "isEqual:", v4[4]);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BMResourceSpecifier)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  BMResourceSpecifier *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("descriptors"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = (void *)MEMORY[0x1E0C9AA60];
  if (v7)
    v9 = (void *)v7;
  v10 = v9;

  v11 = -[BMResourceSpecifier _initWithType:name:descriptors:](self, "_initWithType:name:descriptors:", v5, v6, v10);
  if (!v11)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB2D50];
    v17[0] = CFSTR("Decoding failure");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("Biome"), -1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v14);

  }
  return v11;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)type
{
  return self->_type;
}

- (BMResourceSpecifier)initWithType:(unint64_t)a3 name:(id)a4
{
  return (BMResourceSpecifier *)-[BMResourceSpecifier _initWithType:name:descriptors:](self, "_initWithType:name:descriptors:", a3, a4, MEMORY[0x1E0C9AA60]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptors, 0);
  objc_storeStrong((id *)&self->_shortDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  uint64_t v3;

  switch(self->_type)
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<BMResource: unknown/%@>"), self->_name, v3);
      break;
    case 1uLL:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<BMResource: stream/%@>"), self->_name, v3);
      break;
    case 2uLL:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<BMResource: view/%@>"), self->_name, v3);
      break;
    case 3uLL:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<BMResource: database/%@>"), self->_name, v3);
      break;
    case 4uLL:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<BMResource: set/%@>"), self->_name, v3);
      break;
    case 5uLL:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<BMResource: %@>"), self->_name, v3);
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<BMResource: unknown(%lu):%@>"), self->_type, self->_name);
      break;
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_initWithType:(unint64_t)a3 name:(id)a4 descriptors:(id)a5
{
  id v8;
  id v9;
  BMResourceSpecifier *v10;
  BMResourceSpecifier *v11;
  uint64_t v12;
  NSString *name;
  uint64_t v14;
  NSArray *descriptors;
  BMResourceSpecifier *v16;
  NSObject *v17;
  objc_super v19;

  v8 = a4;
  v9 = a5;
  if ((BMIdentifierIsPathSafe(v8) & 1) != 0)
  {
    v19.receiver = self;
    v19.super_class = (Class)BMResourceSpecifier;
    v10 = -[BMResourceSpecifier init](&v19, sel_init);
    v11 = v10;
    if (v10)
    {
      v10->_type = a3;
      v12 = objc_msgSend(v8, "copy");
      name = v11->_name;
      v11->_name = (NSString *)v12;

      v14 = objc_msgSend(v9, "copy");
      descriptors = v11->_descriptors;
      v11->_descriptors = (NSArray *)v14;

    }
    self = v11;
    v16 = self;
  }
  else
  {
    __biome_log_for_category(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[BMResourceSpecifier _initWithType:name:descriptors:].cold.1((uint64_t)v8, v17);

    v16 = 0;
  }

  return v16;
}

- (NSString)shortDescription
{
  return self->_shortDescription;
}

- (NSArray)descriptors
{
  return self->_descriptors;
}

- (void)_initWithType:(uint64_t)a1 name:(NSObject *)a2 descriptors:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AEB31000, a2, OS_LOG_TYPE_ERROR, "Invalid resource name %@", (uint8_t *)&v2, 0xCu);
}

@end
