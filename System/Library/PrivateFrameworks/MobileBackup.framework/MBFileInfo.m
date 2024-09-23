@implementation MBFileInfo

+ (id)fileInfoWithRestorable:(id)a3
{
  return -[MBFileInfo _initWithAbsolutePath:extendedAttributes:isDirectory:priority:]([MBFileInfo alloc], "_initWithAbsolutePath:extendedAttributes:isDirectory:priority:", objc_msgSend(a3, "absolutePath"), objc_msgSend(a3, "extendedAttributes"), (objc_msgSend(a3, "type") & 0xF000) == 0x4000, objc_msgSend(a3, "priority"));
}

+ (id)fileInfoWithAbsolutePath:(id)a3 mode:(unsigned __int16)a4 priority:(unint64_t)a5
{
  return -[MBFileInfo _initWithAbsolutePath:extendedAttributes:isDirectory:priority:]([MBFileInfo alloc], "_initWithAbsolutePath:extendedAttributes:isDirectory:priority:", a3, 0, (a4 & 0xF000) == 0x4000, a5);
}

- (id)_initWithAbsolutePath:(id)a3 extendedAttributes:(id)a4 isDirectory:(BOOL)a5 priority:(unint64_t)a6
{
  MBFileInfo *v10;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MBFileInfo;
  v10 = -[MBFileInfo init](&v13, sel_init);
  if (v10)
  {
    v10->_path = (NSString *)objc_msgSend(a3, "copy");
    v11 = objc_msgSend(a4, "copy");
    v10->_isDirectory = a5;
    v10->_extendedAttributes = (NSDictionary *)v11;
    v10->_priority = a6;
  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MBFileInfo)initWithCoder:(id)a3
{
  MBFileInfo *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MBFileInfo;
  v4 = -[MBFileInfo init](&v7, sel_init);
  if (v4)
  {
    v4->_path = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("path"));
    v4->_isDirectory = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("isDirectory"));
    v4->_priority = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("priority"));
    v5 = objc_opt_class();
    v4->_extendedAttributes = (NSDictionary *)(id)objc_msgSend(a3, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v5, objc_opt_class(), CFSTR("extendedAttributes"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_path, CFSTR("path"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_isDirectory, CFSTR("isDirectory"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_priority, CFSTR("priority"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_extendedAttributes, CFSTR("extendedAttributes"));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MBFileInfo;
  -[MBFileInfo dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[MBFileInfo _initWithAbsolutePath:extendedAttributes:isDirectory:priority:]([MBFileInfo alloc], "_initWithAbsolutePath:extendedAttributes:isDirectory:priority:", self->_path, self->_extendedAttributes, self->_isDirectory, self->_priority);
}

- (id)description
{
  void *v3;
  id v4;
  const char *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)MBFileInfo;
  v4 = -[MBFileInfo description](&v7, sel_description);
  v5 = "isDir ";
  if (!self->_isDirectory)
    v5 = "";
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%spriority %ld %@ xattr %@)"), v4, v5, self->_priority, self->_path, self->_extendedAttributes);
}

- (NSString)path
{
  return self->_path;
}

- (NSDictionary)extendedAttributes
{
  return self->_extendedAttributes;
}

- (BOOL)isDirectory
{
  return self->_isDirectory;
}

- (unint64_t)priority
{
  return self->_priority;
}

@end
