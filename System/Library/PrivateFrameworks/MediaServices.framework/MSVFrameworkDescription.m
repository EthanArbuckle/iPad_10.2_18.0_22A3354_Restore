@implementation MSVFrameworkDescription

- (NSString)name
{
  return self->_name;
}

- (MSVFrameworkDescription)initWithName:(id)a3 uuid:(id)a4 version:(id)a5 root:(BOOL)a6 debug:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  MSVFrameworkDescription *v15;
  uint64_t v16;
  NSString *name;
  uint64_t v18;
  NSUUID *uuid;
  uint64_t v20;
  NSString *version;
  objc_super v23;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v23.receiver = self;
  v23.super_class = (Class)MSVFrameworkDescription;
  v15 = -[MSVFrameworkDescription init](&v23, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    name = v15->_name;
    v15->_name = (NSString *)v16;

    v18 = objc_msgSend(v13, "copy");
    uuid = v15->_uuid;
    v15->_uuid = (NSUUID *)v18;

    v20 = objc_msgSend(v14, "copy");
    version = v15->_version;
    v15->_version = (NSString *)v20;

    v15->_root = a6;
    v15->_debug = a7;
  }

  return v15;
}

- (BOOL)isRoot
{
  return self->_root;
}

- (NSString)version
{
  return self->_version;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (BOOL)isDebug
{
  return self->_debug;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (id)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[NSString UTF8String](self->_name, "UTF8String");
  -[NSUUID UUIDString](self->_uuid, "UUIDString");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("YES");
  if (self->_root)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (!self->_debug)
    v7 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("name: %-40s; uuid: %@; version: %@; isRoot: %@; isDebug: %@"),
    v4,
    v5,
    self->_version,
    v8,
    v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
