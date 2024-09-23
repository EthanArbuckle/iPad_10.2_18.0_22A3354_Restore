@implementation NSPDNSQuery

- (NSPDNSQuery)initWithName:(id)a3 recordType:(int64_t)a4 recordClass:(int64_t)a5
{
  id v9;
  NSPDNSQuery *v10;
  NSPDNSQuery *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NSPDNSQuery;
  v10 = -[NSPDNSQuery init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_name, a3);
    v11->_recordType = a4;
    v11->_recordClass = a5;
  }

  return v11;
}

- (id)copyStateDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0C99D80]);
  -[NSPDNSQuery name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSPDNSResourceRecord typeToString:](NSPDNSResourceRecord, "typeToString:", -[NSPDNSQuery recordType](self, "recordType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithObjectsAndKeys:", v4, CFSTR("name"), v5, CFSTR("type"), 0);

  return v6;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)recordType
{
  return self->_recordType;
}

- (int64_t)recordClass
{
  return self->_recordClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
