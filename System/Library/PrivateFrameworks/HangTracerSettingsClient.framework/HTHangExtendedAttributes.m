@implementation HTHangExtendedAttributes

- (HTHangExtendedAttributes)initWithFilePath:(id)a3
{
  id v4;
  HTHangExtendedAttributes *v5;
  HTHangExtendedAttributes *v6;
  uint64_t v7;
  NSString *hangID;
  uint64_t v9;
  NSString *bundleID;
  uint64_t v11;
  NSString *creationDate;
  uint64_t v13;
  NSString *duration;
  uint64_t v15;
  NSString *processPath;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HTHangExtendedAttributes;
  v5 = -[HTHangExtendedAttributes init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    -[HTHangExtendedAttributes getExtendedAttributeNamed:forFileAtPath:](v5, "getExtendedAttributeNamed:forFileAtPath:", *MEMORY[0x24BE3F350], v4);
    v7 = objc_claimAutoreleasedReturnValue();
    hangID = v6->_hangID;
    v6->_hangID = (NSString *)v7;

    -[HTHangExtendedAttributes getExtendedAttributeNamed:forFileAtPath:](v6, "getExtendedAttributeNamed:forFileAtPath:", *MEMORY[0x24BE3F338], v4);
    v9 = objc_claimAutoreleasedReturnValue();
    bundleID = v6->_bundleID;
    v6->_bundleID = (NSString *)v9;

    -[HTHangExtendedAttributes getExtendedAttributeNamed:forFileAtPath:](v6, "getExtendedAttributeNamed:forFileAtPath:", *MEMORY[0x24BE3F340], v4);
    v11 = objc_claimAutoreleasedReturnValue();
    creationDate = v6->_creationDate;
    v6->_creationDate = (NSString *)v11;

    -[HTHangExtendedAttributes getExtendedAttributeNamed:forFileAtPath:](v6, "getExtendedAttributeNamed:forFileAtPath:", *MEMORY[0x24BE3F348], v4);
    v13 = objc_claimAutoreleasedReturnValue();
    duration = v6->_duration;
    v6->_duration = (NSString *)v13;

    -[HTHangExtendedAttributes getExtendedAttributeNamed:forFileAtPath:](v6, "getExtendedAttributeNamed:forFileAtPath:", *MEMORY[0x24BE3F358], v4);
    v15 = objc_claimAutoreleasedReturnValue();
    processPath = v6->_processPath;
    v6->_processPath = (NSString *)v15;

  }
  return v6;
}

- (id)getExtendedAttributeNamed:(id)a3 forFileAtPath:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  id v8;
  ssize_t v9;
  size_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  id v14;
  void *v15;

  v5 = a3;
  v6 = objc_retainAutorelease(a4);
  v7 = (const char *)objc_msgSend(v6, "fileSystemRepresentation");
  v8 = objc_retainAutorelease(v5);
  v9 = getxattr(v7, (const char *)objc_msgSend(v8, "UTF8String"), 0, 0x2710uLL, 0, 0);
  if (v9 == -1)
  {
    v15 = 0;
  }
  else
  {
    v10 = v9;
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    v13 = (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    v14 = objc_retainAutorelease(v11);
    getxattr(v12, v13, (void *)objc_msgSend(v14, "mutableBytes"), v10, 0, 0);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v14, 4);

  }
  return v15;
}

- (NSString)hangID
{
  return self->_hangID;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)creationDate
{
  return self->_creationDate;
}

- (NSString)duration
{
  return self->_duration;
}

- (NSString)processPath
{
  return self->_processPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processPath, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_hangID, 0);
}

@end
