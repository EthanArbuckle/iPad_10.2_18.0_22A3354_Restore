@implementation MSAttachmentInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSAttachmentInfo)initWithURL:(id)a3 filename:(id)a4
{
  id v7;
  id v8;
  MSAttachmentInfo *v9;
  MSAttachmentInfo *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MSAttachmentInfo;
  v9 = -[MSAttachmentInfo init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    objc_storeStrong((id *)&v10->_filename, a4);
  }

  return v10;
}

- (MSAttachmentInfo)initWithCoder:(id)a3
{
  id v4;
  MSAttachmentInfo *v5;
  uint64_t v6;
  NSURL *url;
  uint64_t v8;
  NSString *filename;
  MSAttachmentInfo *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MSAttachmentInfo;
  v5 = -[MSAttachmentInfo init](&v12, sel_init);
  if (v5)
  {
    if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    {
      v10 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_url"));
    v6 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_filename"));
    v8 = objc_claimAutoreleasedReturnValue();
    filename = v5->_filename;
    v5->_filename = (NSString *)v8;

  }
  v10 = v5;
LABEL_6:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (self->_url)
  {
    -[MSAttachmentInfo url](self, "url");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_url"));

  }
  if (self->_filename)
  {
    -[MSAttachmentInfo filename](self, "filename");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_filename"));

  }
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
