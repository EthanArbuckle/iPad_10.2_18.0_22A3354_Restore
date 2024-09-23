@implementation MPSGraphViewerNodePropertyEnumSPI

+ (id)type
{
  return CFSTR("enum");
}

- (MPSGraphViewerNodePropertyEnumSPI)initWithName:(id)a3 type:(id)a4 cases:(id)a5 value:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  MPSGraphViewerNodePropertyEnumSPI *v14;
  MPSGraphViewerNodePropertyEnumSPI *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MPSGraphViewerNodePropertyEnumSPI;
  v14 = -[MPSGraphViewerNodePropertyEnumSPI init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_name, a3);
    objc_storeStrong((id *)&v15->_enumCases, a5);
    objc_storeStrong((id *)&v15->_enumType, a4);
    v15->_enumValue = a6;
  }

  return v15;
}

- (BOOL)isEnum
{
  return 1;
}

- (BOOL)isSplat
{
  return 0;
}

- (id)shape
{
  return &unk_1E0E9B650;
}

- (unsigned)dataType
{
  return 64;
}

- (unint64_t)dataLength
{
  return 8;
}

- (id)dataWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v5;
  void *v6;

  length = a3.length;
  location = a3.location;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &self->_enumValue, 8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subdataWithRange:", location, length);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (MPSGraphViewerNodePropertyEnumSPI)initWithJSONDictionary:(id)a3
{
  id v4;
  MPSGraphViewerNodePropertyEnumSPI *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSArray *enumCases;
  uint64_t v10;
  NSString *enumType;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MPSGraphViewerNodePropertyEnumSPI;
  v5 = -[MPSGraphViewerNodePropertyEnumSPI init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "objectForKey:", CFSTR("enumCases"));
    v8 = objc_claimAutoreleasedReturnValue();
    enumCases = v5->_enumCases;
    v5->_enumCases = (NSArray *)v8;

    objc_msgSend(v4, "objectForKey:", CFSTR("enumType"));
    v10 = objc_claimAutoreleasedReturnValue();
    enumType = v5->_enumType;
    v5->_enumType = (NSString *)v10;

    objc_msgSend(v4, "objectForKey:", CFSTR("enumValue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_enumValue = objc_msgSend(v12, "unsignedIntegerValue");

  }
  return v5;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSString *enumType;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPSGraphViewerNodePropertyEnumSPI type](MPSGraphViewerNodePropertyEnumSPI, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("type"));

  -[MPSGraphViewerNodePropertyEnumSPI name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("name"));

  if (self->_enumCases)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = self->_enumCases;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "jsonDictionary", (_QWORD)v16);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v11);

        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("enumCases"));
  }
  enumType = self->_enumType;
  if (enumType)
    objc_msgSend(v3, "setObject:forKey:", enumType, CFSTR("enumType"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_enumValue, (_QWORD)v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("enumValue"));

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)enumType
{
  return self->_enumType;
}

- (NSArray)enumCases
{
  return self->_enumCases;
}

- (unint64_t)enumValue
{
  return self->_enumValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enumCases, 0);
  objc_storeStrong((id *)&self->_enumType, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
