@implementation DIDocUploadSettings

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[DIDocUploadSettings certificateChain](self, "certificateChain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("certificateChain"));

  -[DIDocUploadSettings encryptionVersion](self, "encryptionVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("encryptionVersion"));

  -[DIDocUploadSettings recipient](self, "recipient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("recipient"));

  objc_msgSend(v7, "encodeBool:forKey:", -[DIDocUploadSettings base64EncodingEnabled](self, "base64EncodingEnabled"), CFSTR("base64EncodingEnabled"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[DIDocUploadSettings container](self, "container"), CFSTR("container"));

}

- (DIDocUploadSettings)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  DIDocUploadSettings *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("certificateChain"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("encryptionVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recipient"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("base64EncodingEnabled"));
  v12 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("container"));

  v13 = 0;
  if (v8 && v10)
  {
    self = -[DIDocUploadSettings initWithCertificateChain:container:recipient:encryptionVersion:base64EncodingEnabled:](self, "initWithCertificateChain:container:recipient:encryptionVersion:base64EncodingEnabled:", v8, v12, v10, v9, v11);
    v13 = self;
  }

  return v13;
}

- (DIDocUploadSettings)initWithCertificateChain:(id)a3 container:(int64_t)a4 recipient:(id)a5 encryptionVersion:(id)a6 base64EncodingEnabled:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  DIDocUploadSettings *v16;
  DIDocUploadSettings *v17;
  objc_super v19;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)DIDocUploadSettings;
  v16 = -[DIDocUploadSettings init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_certificateChain, a3);
    v17->_container = a4;
    objc_storeStrong((id *)&v17->_recipient, a5);
    objc_storeStrong((id *)&v17->_encryptionVersion, a6);
    v17->_base64EncodingEnabled = a7;
  }

  return v17;
}

- (DIDocUploadSettings)initWithCertificateChain:(id)a3 recipient:(id)a4 encryptionVersion:(id)a5 base64EncodingEnabled:(BOOL)a6
{
  return -[DIDocUploadSettings initWithCertificateChain:container:recipient:encryptionVersion:base64EncodingEnabled:](self, "initWithCertificateChain:container:recipient:encryptionVersion:base64EncodingEnabled:", a3, 0, a4, a5, a6);
}

- (DIDocUploadSettings)initWithCertificateChain:(id)a3 container:(int64_t)a4 recipient:(id)a5 encryptionVersion:(id)a6
{
  return -[DIDocUploadSettings initWithCertificateChain:container:recipient:encryptionVersion:base64EncodingEnabled:](self, "initWithCertificateChain:container:recipient:encryptionVersion:base64EncodingEnabled:", a3, a4, a5, a6, 0);
}

- (DIDocUploadSettings)initWithCertificateChain:(id)a3 recipient:(id)a4 encryptionVersion:(id)a5
{
  return -[DIDocUploadSettings initWithCertificateChain:recipient:encryptionVersion:base64EncodingEnabled:](self, "initWithCertificateChain:recipient:encryptionVersion:base64EncodingEnabled:", a3, a4, a5, 0);
}

- (DIDocUploadSettings)initWithContainer:(int64_t)a3
{
  id v5;
  DIDocUploadSettings *v6;

  v5 = objc_alloc_init(MEMORY[0x24BDBCE30]);
  v6 = -[DIDocUploadSettings initWithCertificateChain:container:recipient:encryptionVersion:base64EncodingEnabled:](self, "initWithCertificateChain:container:recipient:encryptionVersion:base64EncodingEnabled:", v5, a3, &stru_24C2D5A40, &stru_24C2D5A40, 1);

  return v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[DIDocUploadSettings encryptionVersion](self, "encryptionVersion");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = CFSTR("nil");
  -[DIDocUploadSettings recipient](self, "recipient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[DIDocUploadSettings base64EncodingEnabled](self, "base64EncodingEnabled"))
    v8 = CFSTR("true");
  else
    v8 = CFSTR("false");
  -[DIDocUploadSettings certificateChain](self, "certificateChain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("DIDocUploadSettings: encryptionVersion=%@, recipient=%@, base64EncodingEnabled=%@, certificateChain=%@, container=%lu"), v6, v7, v8, v10, -[DIDocUploadSettings container](self, "container"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSArray)certificateChain
{
  return self->_certificateChain;
}

- (NSString)recipient
{
  return self->_recipient;
}

- (NSString)encryptionVersion
{
  return self->_encryptionVersion;
}

- (int64_t)container
{
  return self->_container;
}

- (BOOL)base64EncodingEnabled
{
  return self->_base64EncodingEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionVersion, 0);
  objc_storeStrong((id *)&self->_recipient, 0);
  objc_storeStrong((id *)&self->_certificateChain, 0);
}

@end
