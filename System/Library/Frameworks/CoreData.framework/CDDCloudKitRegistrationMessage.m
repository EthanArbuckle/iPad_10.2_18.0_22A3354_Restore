@implementation CDDCloudKitRegistrationMessage

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CDDCloudKitRegistrationMessage;
  -[CDDCloudKitMessage dealloc](&v3, sel_dealloc);
}

- (CDDCloudKitRegistrationMessage)initWithCoder:(id)a3
{
  CDDCloudKitRegistrationMessage *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CDDCloudKitRegistrationMessage;
  v4 = -[CDDCloudKitMessage initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    v4->_bundleIdentifier = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
    v4->_storeFileHandle = (NSFileHandle *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fileHandle"));
    v4->_storePath = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storePath"));
    v4->_storeFileProtectionClass = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storeFileProtectionClass"));
    v4->_storeType = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storeType"));
    v4->_storeConfigurationName = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storeConfigurationName"));
    v4->_containerIdentifier = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("containerIdentifier"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CDDCloudKitRegistrationMessage;
  -[CDDCloudKitMessage encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("bundleIdentifier"));
  if ((-[NSFileHandle fileDescriptor](self->_storeFileHandle, "fileDescriptor") & 0x80000000) == 0)
    objc_msgSend(a3, "encodeObject:forKey:", self->_storeFileHandle, CFSTR("fileHandle"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_storePath, CFSTR("storePath"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_storeFileProtectionClass, CFSTR("storeFileProtectionClass"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_storeType, CFSTR("storeType"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_storeConfigurationName, CFSTR("storeConfigurationName"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_containerIdentifier, CFSTR("containerIdentifier"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
