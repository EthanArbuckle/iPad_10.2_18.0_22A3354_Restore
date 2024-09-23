@implementation MSAttachmentItem

- (MSAttachmentItem)initWithContentID:(id)a3 uttype:(id)a4 data:(id)a5 additionalMarkup:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  MSAttachmentItem *v14;
  uint64_t v15;
  NSString *contentID;
  uint64_t v17;
  NSData *data;
  uint64_t v19;
  NSString *additionalMarkup;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)MSAttachmentItem;
  v14 = -[MSAttachmentItem init](&v22, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    contentID = v14->_contentID;
    v14->_contentID = (NSString *)v15;

    objc_storeStrong((id *)&v14->_uttype, a4);
    v17 = objc_msgSend(v12, "copy");
    data = v14->_data;
    v14->_data = (NSData *)v17;

    v19 = objc_msgSend(v13, "copy");
    additionalMarkup = v14->_additionalMarkup;
    v14->_additionalMarkup = (NSString *)v19;

  }
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[MSAttachmentItem contentID](self, "contentID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_contentID"));

  -[MSAttachmentItem uttype](self, "uttype");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_uttype"));

  -[MSAttachmentItem data](self, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("EFPropertyKey_data"));

  -[MSAttachmentItem additionalMarkup](self, "additionalMarkup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("EFPropertyKey_additionalMarkup"));

}

- (MSAttachmentItem)initWithCoder:(id)a3
{
  id v4;
  MSAttachmentItem *v5;
  uint64_t v6;
  NSString *contentID;
  uint64_t v8;
  UTType *uttype;
  uint64_t v10;
  NSData *data;
  uint64_t v12;
  NSString *additionalMarkup;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MSAttachmentItem;
  v5 = -[MSAttachmentItem init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_contentID"));
    v6 = objc_claimAutoreleasedReturnValue();
    contentID = v5->_contentID;
    v5->_contentID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_uttype"));
    v8 = objc_claimAutoreleasedReturnValue();
    uttype = v5->_uttype;
    v5->_uttype = (UTType *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_data"));
    v10 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_additionalMarkup"));
    v12 = objc_claimAutoreleasedReturnValue();
    additionalMarkup = v5->_additionalMarkup;
    v5->_additionalMarkup = (NSString *)v12;

  }
  return v5;
}

- (NSString)contentID
{
  return self->_contentID;
}

- (UTType)uttype
{
  return self->_uttype;
}

- (NSData)data
{
  return self->_data;
}

- (NSString)additionalMarkup
{
  return self->_additionalMarkup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalMarkup, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_uttype, 0);
  objc_storeStrong((id *)&self->_contentID, 0);
}

@end
