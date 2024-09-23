@implementation MPSGraphViewerNodePropertyDataSPI

+ (id)type
{
  return CFSTR("data");
}

- (MPSGraphViewerNodePropertyDataSPI)initWithName:(id)a3 dataType:(unsigned int)a4 shape:(id)a5
{
  id v9;
  id v10;
  MPSGraphViewerNodePropertyDataSPI *v11;
  MPSGraphViewerNodePropertyDataSPI *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MPSGraphViewerNodePropertyDataSPI;
  v11 = -[MPSGraphViewerNodePropertyDataSPI init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_name, a3);
    v12->_dataType = a4;
    objc_storeStrong((id *)&v12->_shape, a5);
    v12->_isSplat = 0;
  }

  return v12;
}

- (MPSGraphViewerNodePropertyDataSPI)initWithJSONDictionary:(id)a3
{
  id v4;
  MPSGraphViewerNodePropertyDataSPI *v5;
  uint64_t v6;
  NSString *name;
  void *v8;
  uint64_t v9;
  NSArray *shape;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MPSGraphViewerNodePropertyDataSPI;
  v5 = -[MPSGraphViewerNodePropertyDataSPI init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "objectForKey:", CFSTR("dataType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_dataType = objc_msgSend(v8, "unsignedIntValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("shape"));
    v9 = objc_claimAutoreleasedReturnValue();
    shape = v5->_shape;
    v5->_shape = (NSArray *)v9;

    objc_msgSend(v4, "objectForKey:", CFSTR("isSplat"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isSplat = objc_msgSend(v11, "BOOLValue");

  }
  return v5;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPSGraphViewerNodePropertyDataSPI type](MPSGraphViewerNodePropertyDataSPI, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("type"));

  -[MPSGraphViewerNodePropertyDataSPI name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("name"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MPSGraphViewerNodePropertyDataSPI dataType](self, "dataType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("dataType"));

  -[MPSGraphViewerNodePropertyDataSPI shape](self, "shape");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("shape"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSplat);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("isSplat"));

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isSplat
{
  return self->_isSplat;
}

- (void)setSplatValue:(id)a3
{
  self->_isSplat = 1;
  objc_storeStrong((id *)&self->_raw, a3);
}

- (void)setValue:(id)a3
{
  self->_isSplat = 0;
  objc_storeStrong((id *)&self->_raw, a3);
}

- (unint64_t)dataLength
{
  return -[NSData length](self->_raw, "length");
}

- (id)dataWithRange:(_NSRange)a3
{
  return -[NSData subdataWithRange:](self->_raw, "subdataWithRange:", a3.location, a3.length);
}

- (BOOL)isEnum
{
  return 0;
}

- (id)enumCases
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (NSString)name
{
  return self->_name;
}

- (unsigned)dataType
{
  return self->_dataType;
}

- (NSArray)shape
{
  return self->_shape;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shape, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_raw, 0);
}

@end
