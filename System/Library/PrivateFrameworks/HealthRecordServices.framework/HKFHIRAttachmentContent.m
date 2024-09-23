@implementation HKFHIRAttachmentContent

- (HKFHIRAttachmentContent)initWithContent:(id)a3 contentType:(id)a4
{
  id v6;
  id v7;
  HKFHIRAttachmentContent *v8;
  uint64_t v9;
  NSData *content;
  uint64_t v11;
  NSString *contentType;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKFHIRAttachmentContent;
  v8 = -[HKFHIRAttachmentContent init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    content = v8->_content;
    v8->_content = (NSData *)v9;

    v11 = objc_msgSend(v7, "copy");
    contentType = v8->_contentType;
    v8->_contentType = (NSString *)v11;

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  HKFHIRAttachmentContent *v6;
  HKFHIRAttachmentContent *v7;
  NSData *content;
  NSData *v9;
  uint64_t v10;
  NSData *v11;
  char v12;
  NSString *contentType;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSString *v18;
  void *v19;

  v6 = (HKFHIRAttachmentContent *)a3;
  if (self == v6)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      content = self->_content;
      -[HKFHIRAttachmentContent content](v7, "content");
      v9 = (NSData *)objc_claimAutoreleasedReturnValue();
      if (content == v9)
        goto LABEL_9;
      -[HKFHIRAttachmentContent content](v7, "content");
      v10 = objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        v12 = 0;
LABEL_17:

        goto LABEL_18;
      }
      v3 = (void *)v10;
      v11 = self->_content;
      -[HKFHIRAttachmentContent content](v7, "content");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSData isEqual:](v11, "isEqual:", v4))
      {
LABEL_9:
        contentType = self->_contentType;
        -[HKFHIRAttachmentContent contentType](v7, "contentType");
        v14 = objc_claimAutoreleasedReturnValue();
        if (contentType == (NSString *)v14)
        {

          v12 = 1;
        }
        else
        {
          v15 = (void *)v14;
          -[HKFHIRAttachmentContent contentType](v7, "contentType");
          v16 = objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            v17 = (void *)v16;
            v18 = self->_contentType;
            -[HKFHIRAttachmentContent contentType](v7, "contentType");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = -[NSString isEqualToString:](v18, "isEqualToString:", v19);

          }
          else
          {

            v12 = 0;
          }
        }
        if (content == v9)
          goto LABEL_17;
      }
      else
      {
        v12 = 0;
      }

      goto LABEL_17;
    }
    v12 = 0;
  }
LABEL_18:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSData hash](self->_content, "hash");
  return -[NSString hash](self->_contentType, "hash") ^ v3;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p, attachment contentType %@ items>"), v5, self, self->_contentType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKFHIRAttachmentContent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HKFHIRAttachmentContent *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Content"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ContentType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[HKFHIRAttachmentContent initWithContent:contentType:](self, "initWithContent:contentType:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *content;
  id v5;

  content = self->_content;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", content, CFSTR("Content"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contentType, CFSTR("ContentType"));

}

- (NSData)content
{
  return self->_content;
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

@end
