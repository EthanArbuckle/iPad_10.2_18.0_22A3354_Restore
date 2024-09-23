@implementation QLThumbnailReplyAttachment

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (QLThumbnailReplyAttachment)initWithData:(id)a3 contentType:(id)a4
{
  id v7;
  id v8;
  QLThumbnailReplyAttachment *v9;
  QLThumbnailReplyAttachment *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)QLThumbnailReplyAttachment;
  v9 = -[QLThumbnailReplyAttachment init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_data, a3);
    objc_storeStrong((id *)&v10->_contentType, a4);
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[QLThumbnailReplyAttachment data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("data"));

  -[QLThumbnailReplyAttachment contentType](self, "contentType");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("contentType"));

}

- (QLThumbnailReplyAttachment)initWithCoder:(id)a3
{
  id v4;
  QLThumbnailReplyAttachment *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)QLThumbnailReplyAttachment;
  v5 = -[QLThumbnailReplyAttachment init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLThumbnailReplyAttachment setData:](v5, "setData:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLThumbnailReplyAttachment setContentType:](v5, "setContentType:", v7);

  }
  return v5;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (UTType)contentType
{
  return (UTType *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContentType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
