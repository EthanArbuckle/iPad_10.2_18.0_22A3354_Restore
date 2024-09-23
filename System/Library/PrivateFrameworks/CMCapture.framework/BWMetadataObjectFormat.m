@implementation BWMetadataObjectFormat

+ (id)formatWithMetadataIdentifiers:(id)a3
{
  BWMetadataObjectFormat *v4;
  _QWORD *v5;
  objc_super v7;

  v4 = [BWMetadataObjectFormat alloc];
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)BWMetadataObjectFormat;
    v5 = objc_msgSendSuper2(&v7, sel_init);
    if (v5)
      v5[1] = objc_msgSend(a3, "copy");
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
    return 1;
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && -[NSArray isEqualToArray:](self->_metadataIdentifiers, "isEqualToArray:", *((_QWORD *)a3 + 1));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWMetadataObjectFormat;
  -[BWMetadataObjectFormat dealloc](&v3, sel_dealloc);
}

+ (void)initialize
{
  objc_opt_class();
}

- (unsigned)mediaType
{
  return 1835365473;
}

- (unint64_t)hash
{
  return -[NSArray hash](self->_metadataIdentifiers, "hash");
}

- (id)description
{
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("MetadataIdentifiers: "));
  v4 = -[NSArray count](self->_metadataIdentifiers, "count");
  if (v4 >= 1)
  {
    v5 = 0;
    v6 = v4 - 1;
    v7 = v4;
    do
    {
      objc_msgSend(v3, "appendString:", -[NSArray objectAtIndexedSubscript:](self->_metadataIdentifiers, "objectAtIndexedSubscript:", v5));
      if (v5 < v6)
        objc_msgSend(v3, "appendString:", CFSTR(", "));
      ++v5;
    }
    while (v7 != v5);
  }
  return v3;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %@"), NSStringFromClass(v4), self, -[BWMetadataObjectFormat description](self, "description"));
}

@end
