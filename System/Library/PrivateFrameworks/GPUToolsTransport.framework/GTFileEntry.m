@implementation GTFileEntry

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTFileEntry)initWithPath:(id)a3 fileSize:(unint64_t)a4
{
  id v7;
  GTFileEntry *v8;
  GTFileEntry *v9;
  NSString *destination;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GTFileEntry;
  v8 = -[GTFileEntry init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_path, a3);
    destination = v9->_destination;
    v9->_destination = 0;

    v9->_fileSize = a4;
  }

  return v9;
}

- (GTFileEntry)initWithLink:(id)a3 destination:(id)a4
{
  id v7;
  id v8;
  GTFileEntry *v9;
  GTFileEntry *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GTFileEntry;
  v9 = -[GTFileEntry init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_path, a3);
    objc_storeStrong((id *)&v10->_destination, a4);
    v10->_fileSize = 0;
  }

  return v10;
}

- (GTFileEntry)initWithCoder:(id)a3
{
  id v4;
  GTFileEntry *v5;
  uint64_t v6;
  NSString *path;
  uint64_t v8;
  NSString *destination;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GTFileEntry;
  v5 = -[GTFileEntry init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("path"));
    v6 = objc_claimAutoreleasedReturnValue();
    path = v5->_path;
    v5->_path = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("destination"));
    v8 = objc_claimAutoreleasedReturnValue();
    destination = v5->_destination;
    v5->_destination = (NSString *)v8;

    v5->_fileSize = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("fileSize"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *path;
  id v5;

  path = self->_path;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", path, CFSTR("path"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_destination, CFSTR("destination"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_fileSize, CFSTR("fileSize"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GTFileEntry path](self, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GTFileEntry destination](self, "destination");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, Path: %@, Destination: %@, Size: %lu>"), v5, self, v6, v7, -[GTFileEntry fileSize](self, "fileSize"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)path
{
  return self->_path;
}

- (NSString)destination
{
  return self->_destination;
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
