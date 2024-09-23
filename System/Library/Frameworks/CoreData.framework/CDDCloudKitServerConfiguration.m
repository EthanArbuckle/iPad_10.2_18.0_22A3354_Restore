@implementation CDDCloudKitServerConfiguration

- (CDDCloudKitServerConfiguration)init
{
  CDDCloudKitServerConfiguration *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CDDCloudKitServerConfiguration;
  v2 = -[CDDCloudKitServerConfiguration init](&v4, sel_init);
  if (v2)
  {
    v2->_storeDirectoryPath = (NSString *)(id)objc_msgSend(-[NSArray lastObject](NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1), "lastObject"), "stringByAppendingPathComponent:", CFSTR("com.apple.coredatad"));
    v2->_machServiceName = +[NSCloudKitMirroringDelegate cloudKitMachServiceName](NSCloudKitMirroringDelegate, "cloudKitMachServiceName");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CDDCloudKitServerConfiguration;
  -[CDDCloudKitServerConfiguration dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  CDDCloudKitServerConfiguration *v4;
  CDDCloudKitServerConfiguration *v5;
  objc_super v7;

  v4 = +[CDDCloudKitServerConfiguration allocWithZone:](CDDCloudKitServerConfiguration, "allocWithZone:", a3);
  if (!v4)
    return 0;
  v7.receiver = v4;
  v7.super_class = (Class)CDDCloudKitServerConfiguration;
  v5 = -[CDDCloudKitServerConfiguration init](&v7, sel_init);
  if (v5)
  {
    v5->_storeDirectoryPath = self->_storeDirectoryPath;
    v5->_machServiceName = self->_machServiceName;
  }
  return v5;
}

- (id)description
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CDDCloudKitServerConfiguration;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", -[CDDCloudKitServerConfiguration description](&v5, sel_description));
  objc_msgSend(v3, "appendFormat:", CFSTR("\nstoreDirectoryPath: %@"), self->_storeDirectoryPath);
  objc_msgSend(v3, "appendFormat:", CFSTR("\nmachServiceName: %@"), self->_machServiceName);
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CDDCloudKitServerConfiguration)initWithCoder:(id)a3
{
  CDDCloudKitServerConfiguration *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CDDCloudKitServerConfiguration;
  v4 = -[CDDCloudKitServerConfiguration init](&v6, sel_init);
  if (v4)
  {
    v4->_storeDirectoryPath = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storeDirectoryPath"));
    v4->_machServiceName = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("machServiceName"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_storeDirectoryPath, CFSTR("storeDirectoryPath"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_machServiceName, CFSTR("machServiceName"));
}

@end
