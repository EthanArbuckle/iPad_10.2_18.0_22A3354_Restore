@implementation NNMKAttachment

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NNMKAttachment)initWithCoder:(id)a3
{
  id v4;
  NNMKAttachment *v5;
  uint64_t v6;
  NSString *contentId;
  uint64_t v8;
  NSString *messageId;
  uint64_t v10;
  NSString *fileName;
  uint64_t v12;
  NSString *url;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NNMKAttachment;
  v5 = -[NNMKAttachment init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyContentId"));
    v6 = objc_claimAutoreleasedReturnValue();
    contentId = v5->_contentId;
    v5->_contentId = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyMessageId"));
    v8 = objc_claimAutoreleasedReturnValue();
    messageId = v5->_messageId;
    v5->_messageId = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyFileName"));
    v10 = objc_claimAutoreleasedReturnValue();
    fileName = v5->_fileName;
    v5->_fileName = (NSString *)v10;

    v5->_fileSize = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kNSCodingKeyFileSize"));
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kNSCodingKeyType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeyContentURL"));
    v12 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNSCodingKeySyncState"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_syncState = objc_msgSend(v14, "unsignedIntegerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *contentId;
  id v5;
  id v6;

  contentId = self->_contentId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", contentId, CFSTR("kNSCodingKeyContentId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_messageId, CFSTR("kNSCodingKeyMessageId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fileName, CFSTR("kNSCodingKeyFileName"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_fileSize, CFSTR("kNSCodingKeyFileSize"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("kNSCodingKeyType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_url, CFSTR("kNSCodingKeyContentURL"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_syncState);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("kNSCodingKeySyncState"));

}

- (BOOL)isActionable
{
  return objc_msgSend((id)objc_opt_class(), "isTypeActionable:", -[NNMKAttachment type](self, "type"));
}

- (BOOL)isImage
{
  unint64_t v2;

  v2 = -[NNMKAttachment type](self, "type");
  return v2 == 5 || v2 == 22;
}

+ (BOOL)isTypeActionable:(unint64_t)a3
{
  return (a3 < 0x18) & (0xB00010u >> a3);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ContentID: %@, File Name: %@, File Size: %ld, Type: %d"), self->_contentId, self->_fileName, self->_fileSize, self->_type);
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSString)contentId
{
  return self->_contentId;
}

- (void)setContentId:(id)a3
{
  objc_storeStrong((id *)&self->_contentId, a3);
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
  objc_storeStrong((id *)&self->_fileName, a3);
}

- (NSString)mimePartNumber
{
  return self->_mimePartNumber;
}

- (void)setMimePartNumber:(id)a3
{
  objc_storeStrong((id *)&self->_mimePartNumber, a3);
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(unint64_t)a3
{
  self->_fileSize = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)messageId
{
  return self->_messageId;
}

- (void)setMessageId:(id)a3
{
  objc_storeStrong((id *)&self->_messageId, a3);
}

- (unint64_t)syncState
{
  return self->_syncState;
}

- (void)setSyncState:(unint64_t)a3
{
  self->_syncState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageId, 0);
  objc_storeStrong((id *)&self->_mimePartNumber, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_contentId, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
