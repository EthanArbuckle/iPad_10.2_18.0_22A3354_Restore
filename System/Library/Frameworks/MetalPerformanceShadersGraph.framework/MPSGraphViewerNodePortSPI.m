@implementation MPSGraphViewerNodePortSPI

- (MPSGraphViewerNodePortSPI)initWithName:(id)a3 dataType:(unsigned int)a4 shape:(id)a5 valueRef:(unint64_t)a6
{
  id v11;
  id v12;
  MPSGraphViewerNodePortSPI *v13;
  MPSGraphViewerNodePortSPI *v14;
  objc_super v16;

  v11 = a3;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MPSGraphViewerNodePortSPI;
  v13 = -[MPSGraphViewerNodePortSPI init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_name, a3);
    v14->_dataType = a4;
    objc_storeStrong((id *)&v14->_shape, a5);
    v14->_valueRef = a6;
  }

  return v14;
}

- (MPSGraphViewerNodePortSPI)initWithJSONDictionary:(id)a3
{
  id v4;
  MPSGraphViewerNodePortSPI *v5;
  uint64_t v6;
  NSString *name;
  void *v8;
  uint64_t v9;
  NSArray *shape;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MPSGraphViewerNodePortSPI;
  v5 = -[MPSGraphViewerNodePortSPI init](&v13, sel_init);
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

    objc_msgSend(v4, "objectForKey:", CFSTR("valueRef"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_valueRef = objc_msgSend(v11, "unsignedIntValue");

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
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraphViewerNodePortSPI name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MPSGraphViewerNodePortSPI name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("name"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MPSGraphViewerNodePortSPI dataType](self, "dataType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("dataType"));

  -[MPSGraphViewerNodePortSPI shape](self, "shape");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MPSGraphViewerNodePortSPI shape](self, "shape");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("shape"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MPSGraphViewerNodePortSPI valueRef](self, "valueRef"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("valueRef"));

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
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

- (unint64_t)valueRef
{
  return self->_valueRef;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shape, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
