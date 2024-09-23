@implementation MPSGraphViewerNodePropertyStringSPI

+ (id)type
{
  return CFSTR("string");
}

- (MPSGraphViewerNodePropertyStringSPI)initWithName:(id)a3 value:(id)a4
{
  id v7;
  id v8;
  MPSGraphViewerNodePropertyStringSPI *v9;
  MPSGraphViewerNodePropertyStringSPI *v10;
  uint64_t v11;
  NSData *stringUTF8Data;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MPSGraphViewerNodePropertyStringSPI;
  v9 = -[MPSGraphViewerNodePropertyStringSPI init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_stringValue, a4);
    -[NSString dataUsingEncoding:](v10->_stringValue, "dataUsingEncoding:", 4);
    v11 = objc_claimAutoreleasedReturnValue();
    stringUTF8Data = v10->_stringUTF8Data;
    v10->_stringUTF8Data = (NSData *)v11;

  }
  return v10;
}

- (BOOL)isSplat
{
  return 0;
}

- (BOOL)isEnum
{
  return 0;
}

- (id)enumCases
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)shape
{
  NSData *stringUTF8Data;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  stringUTF8Data = self->_stringUTF8Data;
  if (stringUTF8Data)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSData length](stringUTF8Data, "length"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v4;
}

- (unsigned)dataType
{
  return 8;
}

- (unint64_t)dataLength
{
  unint64_t result;

  result = (unint64_t)self->_stringUTF8Data;
  if (result)
    return objc_msgSend((id)result, "length");
  return result;
}

- (id)dataWithRange:(_NSRange)a3
{
  void *stringUTF8Data;

  stringUTF8Data = self->_stringUTF8Data;
  if (stringUTF8Data)
  {
    objc_msgSend(stringUTF8Data, "subdataWithRange:", a3.location, a3.length);
    stringUTF8Data = (void *)objc_claimAutoreleasedReturnValue();
  }
  return stringUTF8Data;
}

- (MPSGraphViewerNodePropertyStringSPI)initWithJSONDictionary:(id)a3
{
  id v4;
  MPSGraphViewerNodePropertyStringSPI *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *stringValue;
  uint64_t v10;
  NSData *stringUTF8Data;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MPSGraphViewerNodePropertyStringSPI;
  v5 = -[MPSGraphViewerNodePropertyStringSPI init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "objectForKey:", CFSTR("value"));
    v8 = objc_claimAutoreleasedReturnValue();
    stringValue = v5->_stringValue;
    v5->_stringValue = (NSString *)v8;

    -[NSString dataUsingEncoding:](v5->_stringValue, "dataUsingEncoding:", 4);
    v10 = objc_claimAutoreleasedReturnValue();
    stringUTF8Data = v5->_stringUTF8Data;
    v5->_stringUTF8Data = (NSData *)v10;

  }
  return v5;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  NSString *stringValue;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPSGraphViewerNodePropertyStringSPI type](MPSGraphViewerNodePropertyStringSPI, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("type"));

  -[MPSGraphViewerNodePropertyStringSPI name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("name"));

  stringValue = self->_stringValue;
  if (stringValue)
    objc_msgSend(v3, "setObject:forKey:", stringValue, CFSTR("value"));
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_stringUTF8Data, 0);
}

@end
