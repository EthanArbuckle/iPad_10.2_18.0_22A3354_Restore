@implementation DACarKeyGenericCrossPlatformSharingData

- (DACarKeyGenericCrossPlatformSharingData)initWithSharingIdentifier:(id)a3 friendKeyIdentifier:(id)a4 sharingMessageType:(int64_t)a5 message:(id)a6
{
  id v11;
  id v12;
  id v13;
  DACarKeyGenericCrossPlatformSharingData *v14;
  DACarKeyGenericCrossPlatformSharingData *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)DACarKeyGenericCrossPlatformSharingData;
  v14 = -[DACarKeyGenericCrossPlatformSharingData init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_sharingIdentifier, a3);
    objc_storeStrong((id *)&v15->_friendKeyIdentifier, a4);
    v15->_messageType = a5;
    objc_storeStrong((id *)&v15->_message, a6);
  }

  return v15;
}

- (DACarKeyGenericCrossPlatformSharingData)initWithDictionary:(id)a3
{
  id v4;
  DACarKeyGenericCrossPlatformSharingData *v5;
  uint64_t v6;
  NSString *sharingIdentifier;
  uint64_t v8;
  NSString *friendKeyIdentifier;
  void *v10;
  void *v11;
  uint64_t v12;
  NSData *message;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DACarKeyGenericCrossPlatformSharingData;
  v5 = -[DACarKeyGenericCrossPlatformSharingData init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sharingId"));
    v6 = objc_claimAutoreleasedReturnValue();
    sharingIdentifier = v5->_sharingIdentifier;
    v5->_sharingIdentifier = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("friendKeyId"));
    v8 = objc_claimAutoreleasedReturnValue();
    friendKeyIdentifier = v5->_friendKeyIdentifier;
    v5->_friendKeyIdentifier = (NSString *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sharingDataType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_messageType = objc_msgSend(v10, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sharingData"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    kmlUtilDataForHexString(v11);
    v12 = objc_claimAutoreleasedReturnValue();
    message = v5->_message;
    v5->_message = (NSData *)v12;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  DACarKeyGenericCrossPlatformSharingData *v5;
  uint64_t v6;
  NSString *sharingIdentifier;
  uint64_t v8;
  NSString *friendKeyIdentifier;
  uint64_t v10;
  NSData *message;

  v5 = -[DACarKeyGenericCrossPlatformSharingData init](+[DACarKeyGenericCrossPlatformSharingData allocWithZone:](DACarKeyGenericCrossPlatformSharingData, "allocWithZone:"), "init");
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_sharingIdentifier, "copyWithZone:", a3);
    sharingIdentifier = v5->_sharingIdentifier;
    v5->_sharingIdentifier = (NSString *)v6;

    v8 = -[NSString copyWithZone:](self->_friendKeyIdentifier, "copyWithZone:", a3);
    friendKeyIdentifier = v5->_friendKeyIdentifier;
    v5->_friendKeyIdentifier = (NSString *)v8;

    v5->_messageType = self->_messageType;
    v10 = -[NSData copyWithZone:](self->_message, "copyWithZone:", a3);
    message = v5->_message;
    v5->_message = (NSData *)v10;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[DACarKeyGenericCrossPlatformSharingData sharingIdentifier](self, "sharingIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("sharingId"));

  -[DACarKeyGenericCrossPlatformSharingData friendKeyIdentifier](self, "friendKeyIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("friendKeyId"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[DACarKeyGenericCrossPlatformSharingData messageType](self, "messageType"), CFSTR("sharingDataType"));
  -[DACarKeyGenericCrossPlatformSharingData message](self, "message");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("sharingData"));

}

- (DACarKeyGenericCrossPlatformSharingData)initWithCoder:(id)a3
{
  id v4;
  DACarKeyGenericCrossPlatformSharingData *v5;
  uint64_t v6;
  NSString *sharingIdentifier;
  uint64_t v8;
  NSString *friendKeyIdentifier;
  uint64_t v10;
  NSData *message;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DACarKeyGenericCrossPlatformSharingData;
  v5 = -[DACarKeyGenericCrossPlatformSharingData init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharingId"));
    v6 = objc_claimAutoreleasedReturnValue();
    sharingIdentifier = v5->_sharingIdentifier;
    v5->_sharingIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("friendKeyId"));
    v8 = objc_claimAutoreleasedReturnValue();
    friendKeyIdentifier = v5->_friendKeyIdentifier;
    v5->_friendKeyIdentifier = (NSString *)v8;

    v5->_messageType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sharingDataType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharingData"));
    v10 = objc_claimAutoreleasedReturnValue();
    message = v5->_message;
    v5->_message = (NSData *)v10;

  }
  return v5;
}

- (id)encodeWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a3);
}

+ (id)decodeWithData:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;

  v5 = decodeWithData_error__pred;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&decodeWithData_error__pred, &__block_literal_global_3);
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", decodeWithData_error__allowedClasses, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __64__DACarKeyGenericCrossPlatformSharingData_decodeWithData_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)decodeWithData_error__allowedClasses;
  decodeWithData_error__allowedClasses = v0;

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Sharing ID            : %@\n"), self->_sharingIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Friend Key ID         : %@\n"), self->_friendKeyIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v5);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Message Type          : %ld\n"), self->_messageType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v6);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Message               : %@\n"), self->_message);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v7);

  return v3;
}

- (id)asDictionary
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_sharingIdentifier, CFSTR("sharingId"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_friendKeyIdentifier, CFSTR("friendKeyId"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_messageType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("sharingDataType"));

  kmlUtilHexStringFromData(self->_message);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("sharingData"));

  return v3;
}

- (NSString)sharingIdentifier
{
  return self->_sharingIdentifier;
}

- (NSString)friendKeyIdentifier
{
  return self->_friendKeyIdentifier;
}

- (int64_t)messageType
{
  return self->_messageType;
}

- (NSData)message
{
  return self->_message;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_friendKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_sharingIdentifier, 0);
}

@end
