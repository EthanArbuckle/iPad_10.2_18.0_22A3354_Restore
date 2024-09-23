@implementation BMFileAttributes

- (NSString)filename
{
  return self->_filename;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *path;
  id v5;
  void *v6;
  id v7;

  path = self->_path;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", path, CFSTR("path"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_mode);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("mode"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_protectionClass);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("prot"));

}

- (unint64_t)hash
{
  return self->_mode ^ -[NSString hash](self->_path, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (NSString)path
{
  return self->_path;
}

- (BOOL)isEqual:(id)a3
{
  BMFileAttributes *v4;
  BMFileAttributes *v5;
  BMFileAttributes *v6;
  BOOL v7;

  v4 = (BMFileAttributes *)a3;
  v5 = v4;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_class();
    v7 = (objc_opt_isKindOfClass() & 1) != 0
      && -[NSString isEqual:](v6->_path, "isEqual:", self->_path)
      && v6->_mode == self->_mode;

  }
  return v7;
}

- (BMFileAttributes)initWithPath:(id)a3 mode:(unint64_t)a4 protectionClass:(unint64_t)a5
{
  id v9;
  BMFileAttributes *v10;
  uint64_t v11;
  NSString *path;
  uint64_t v13;
  NSString *filename;
  void *v16;
  objc_super v17;

  v9 = a3;
  if (!objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMFileHandle.m"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path.length"));

  }
  v17.receiver = self;
  v17.super_class = (Class)BMFileAttributes;
  v10 = -[BMFileAttributes init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v9, "copy");
    path = v10->_path;
    v10->_path = (NSString *)v11;

    -[NSString lastPathComponent](v10->_path, "lastPathComponent");
    v13 = objc_claimAutoreleasedReturnValue();
    filename = v10->_filename;
    v10->_filename = (NSString *)v13;

    v10->_mode = a4;
    v10->_protectionClass = a5;
  }

  return v10;
}

- (BMFileAttributes)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *path;
  NSString *v7;
  NSString *filename;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  BMFileAttributes *v14;
  void *v15;
  void *v16;
  const __CFString **v17;
  uint64_t *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("path"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  path = self->_path;
  self->_path = v5;

  -[NSString lastPathComponent](self->_path, "lastPathComponent");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  filename = self->_filename;
  self->_filename = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9 || (unint64_t)objc_msgSend(v9, "unsignedIntegerValue") >= 4)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2D50];
    v25[0] = CFSTR("Invalid access mode");
    v16 = (void *)MEMORY[0x1E0C99D80];
    v17 = (const __CFString **)v25;
    v18 = &v24;
LABEL_8:
    objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 2, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v20);

    v14 = 0;
    goto LABEL_9;
  }
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  self->_mode = v11;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mode"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v12;
  if (!v12 || (unint64_t)objc_msgSend(v12, "unsignedIntegerValue") >= 7)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0CB2D50];
    v23 = CFSTR("Invalid protection class");
    v16 = (void *)MEMORY[0x1E0C99D80];
    v17 = &v23;
    v18 = &v22;
    goto LABEL_8;
  }
  v13 = objc_msgSend(v10, "unsignedIntegerValue");

  self->_protectionClass = v13;
  v14 = self;
LABEL_9:

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (unint64_t)protectionClass
{
  return self->_protectionClass;
}

@end
