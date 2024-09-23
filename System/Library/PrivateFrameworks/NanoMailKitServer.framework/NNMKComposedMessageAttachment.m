@implementation NNMKComposedMessageAttachment

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NNMKComposedMessageAttachment)initWithCoder:(id)a3
{
  id v4;
  NNMKComposedMessageAttachment *v5;
  uint64_t v6;
  NSString *fileName;
  uint64_t v8;
  NSData *data;
  uint64_t v10;
  NSURL *url;
  uint64_t v12;
  NSString *mimeType;
  uint64_t v14;
  NSString *utiType;
  void *v16;

  v4 = a3;
  v5 = -[NNMKComposedMessageAttachment init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyFileName"));
    v6 = objc_claimAutoreleasedReturnValue();
    fileName = v5->_fileName;
    v5->_fileName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyFileData"));
    v8 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyFileURL"));
    v10 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyMimeType"));
    v12 = objc_claimAutoreleasedReturnValue();
    mimeType = v5->_mimeType;
    v5->_mimeType = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyUTIType"));
    v14 = objc_claimAutoreleasedReturnValue();
    utiType = v5->_utiType;
    v5->_utiType = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyFileSize"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_fileSize = objc_msgSend(v16, "unsignedIntValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *fileName;
  id v5;
  id v6;

  fileName = self->_fileName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", fileName, CFSTR("kNSCodingKeyFileName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_data, CFSTR("kNSCodingKeyFileData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_url, CFSTR("kNSCodingKeyFileURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mimeType, CFSTR("kNSCodingKeyMimeType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_utiType, CFSTR("kNSCodingKeyUTIType"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_fileSize);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("kNSCodingKeyFileSize"));

}

- (BOOL)prepareForArchiving
{
  NSURL *url;
  NSData *v4;
  id v5;
  NSData *data;
  NSData *v7;
  BOOL v8;
  void *v9;
  id v11;

  url = self->_url;
  if (!url)
    return self->_data != 0;
  v11 = 0;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", url, 0, &v11);
  v4 = (NSData *)objc_claimAutoreleasedReturnValue();
  v5 = v11;
  data = self->_data;
  self->_data = v4;

  v7 = self->_data;
  v8 = v7 != 0;
  if (!v7)
  {
    v9 = (void *)__logCategories;
    if (os_log_type_enabled((os_log_t)__logCategories, OS_LOG_TYPE_ERROR))
      -[NNMKComposedMessageAttachment prepareForArchiving].cold.1(v9, v5);
  }

  return v8;
}

- (void)logTransmission
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  -[NNMKComposedMessageAttachment utiType](self, "utiType");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  NNMKGreenTeaLog(CFSTR("Transmitted attachment(s): filetype %@"), v2, v3, v4, v5, v6, v7, v8, (uint64_t)v9);

}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
  objc_storeStrong((id *)&self->_fileName, a3);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSString)mimeType
{
  return self->_mimeType;
}

- (void)setMimeType:(id)a3
{
  objc_storeStrong((id *)&self->_mimeType, a3);
}

- (NSString)utiType
{
  return self->_utiType;
}

- (void)setUtiType:(id)a3
{
  objc_storeStrong((id *)&self->_utiType, a3);
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(unint64_t)a3
{
  self->_fileSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utiType, 0);
  objc_storeStrong((id *)&self->_mimeType, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
}

- (void)prepareForArchiving
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_22E161000, v3, OS_LOG_TYPE_ERROR, "Unable to read attachment url to prepare for archiving: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
