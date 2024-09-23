@implementation MADEmbeddingResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADEmbeddingResult)initWithVersion:(unint64_t)a3 data:(id)a4 type:(unint64_t)a5 shape:(id)a6
{
  id v11;
  id v12;
  MADEmbeddingResult *v13;
  MADEmbeddingResult *v14;
  objc_super v16;

  v11 = a4;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)MADEmbeddingResult;
  v13 = -[MADEmbeddingResult init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_version = a3;
    objc_storeStrong((id *)&v13->_data, a4);
    v14->_type = a5;
    objc_storeStrong((id *)&v14->_shape, a6);
  }

  return v14;
}

- (MADEmbeddingResult)initWithVersion:(unint64_t)a3 data:(id)a4 type:(unint64_t)a5
{
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  MADEmbeddingResult *v13;
  unint64_t type;
  _QWORD v16[2];
  uint8_t buf[4];
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = v8;
  if (a5 == 2)
  {
    v10 = (unint64_t)objc_msgSend(v8, "length") >> 2;
    goto LABEL_5;
  }
  if (a5 == 1)
  {
    v10 = (unint64_t)objc_msgSend(v8, "length") >> 1;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10, &unk_1E97F1750);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[MADEmbeddingResult initWithVersion:data:type:shape:](self, "initWithVersion:data:type:shape:", a3, v9, a5, v12);

    v13 = self;
    goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    type = self->_type;
    *(_DWORD *)buf = 67109120;
    v18 = type;
    _os_log_impl(&dword_1D461A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Embedding has unknown element type (%d); cannot derive count",
      buf,
      8u);
  }
  v13 = 0;
LABEL_9:

  return v13;
}

- (MADEmbeddingResult)initWithCoder:(id)a3
{
  id v4;
  MADEmbeddingResult *v5;
  uint64_t v6;
  NSData *data;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *shape;
  objc_super v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MADEmbeddingResult;
  v5 = -[MADEmbeddingResult init](&v14, sel_init);
  if (v5)
  {
    v5->_version = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Version"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Data"));
    v6 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v6;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Type"));
    v8 = (void *)MEMORY[0x1E0C99E60];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("Shape"));
    v11 = objc_claimAutoreleasedReturnValue();
    shape = v5->_shape;
    v5->_shape = (NSArray *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", self->_version, CFSTR("Version"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_data, CFSTR("Data"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, CFSTR("Type"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shape, CFSTR("Shape"));

}

- (unint64_t)count
{
  unint64_t type;
  unint64_t v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  type = self->_type;
  if (type == 2)
    return -[NSData length](self->_data, "length") >> 2;
  if (type == 1)
    return -[NSData length](self->_data, "length") >> 1;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v5 = self->_type;
    v6[0] = 67109120;
    v6[1] = v5;
    _os_log_impl(&dword_1D461A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Embedding has unknown element type (%d); cannot derive count",
      (uint8_t *)v6,
      8u);
  }
  return 0;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("version: %d, "), self->_version);
  objc_msgSend(v3, "appendFormat:", CFSTR("type: %d, "), self->_type);
  objc_msgSend(v3, "appendFormat:", CFSTR("shape: %@, "), self->_shape);
  objc_msgSend(v3, "appendFormat:", CFSTR("data: %@>"), self->_data);
  return v3;
}

- (unint64_t)version
{
  return self->_version;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSData)data
{
  return self->_data;
}

- (NSArray)shape
{
  return self->_shape;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shape, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
