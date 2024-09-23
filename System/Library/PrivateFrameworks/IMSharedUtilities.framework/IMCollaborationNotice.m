@implementation IMCollaborationNotice

+ (id)noticeWithGUIDString:(id)a3 sender:(id)a4 metadata:(id)a5 date:(id)a6 dateViewed:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  IMCollaborationNotice *v16;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = -[IMCollaborationNotice initWithGUIDString:sender:metadata:date:dateViewed:]([IMCollaborationNotice alloc], "initWithGUIDString:sender:metadata:date:dateViewed:", v15, v14, v13, v12, v11);

  return v16;
}

- (IMCollaborationNotice)initWithGUIDString:(id)a3 sender:(id)a4 metadata:(id)a5 date:(id)a6 dateViewed:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  IMCollaborationNotice *v17;
  IMCollaborationNotice *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)IMCollaborationNotice;
  v17 = -[IMCollaborationNotice init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_guidString, a3);
    objc_storeStrong((id *)&v18->_senderHandle, a4);
    objc_storeStrong((id *)&v18->_date, a6);
    objc_storeStrong((id *)&v18->_dateViewed, a7);
    objc_storeStrong((id *)&v18->_metadata, a5);
  }

  return v18;
}

- (BOOL)wantsEphemeralDismissal
{
  void *v2;
  uint64_t v3;

  -[IMCollaborationNotice metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type");

  return (v3 & 0xFFFFFFFFFFFFFFFELL) != 8;
}

- (BOOL)isEqual:(id)a3
{
  IMCollaborationNotice *v4;
  IMCollaborationNotice *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  char v20;

  v4 = (IMCollaborationNotice *)a3;
  if (v4 == self)
  {
    v20 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[IMCollaborationNotice guidString](self, "guidString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMCollaborationNotice guidString](v5, "guidString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if (!v8)
        goto LABEL_10;
      -[IMCollaborationNotice senderHandle](self, "senderHandle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMCollaborationNotice senderHandle](v5, "senderHandle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v11)
        goto LABEL_10;
      -[IMCollaborationNotice metadata](self, "metadata");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMCollaborationNotice metadata](v5, "metadata");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);

      if (!v14)
        goto LABEL_10;
      -[IMCollaborationNotice date](self, "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMCollaborationNotice date](v5, "date");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isEqualToDate:", v16);

      if (v17)
      {
        -[IMCollaborationNotice dateViewed](self, "dateViewed");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMCollaborationNotice dateViewed](v5, "dateViewed");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isEqualToDate:", v19);

      }
      else
      {
LABEL_10:
        v20 = 0;
      }

    }
    else
    {
      v20 = 0;
    }
  }

  return v20;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;

  -[IMCollaborationNotice guidString](self, "guidString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[IMCollaborationNotice senderHandle](self, "senderHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[IMCollaborationNotice date](self, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[IMCollaborationNotice metadata](self, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[IMCollaborationNotice dateViewed](self, "dateViewed");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");

  return v12;
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
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[IMCollaborationNotice guidString](self, "guidString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("id"));

  -[IMCollaborationNotice senderHandle](self, "senderHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("s"));

  -[IMCollaborationNotice metadata](self, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("m"));

  -[IMCollaborationNotice date](self, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("d"));

  -[IMCollaborationNotice dateViewed](self, "dateViewed");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("ds"));

}

- (IMCollaborationNotice)initWithCoder:(id)a3
{
  id v4;
  IMCollaborationNotice *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IMCollaborationNotice;
  v5 = -[IMCollaborationNotice init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("id"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMCollaborationNotice setGuidString:](v5, "setGuidString:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("s"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMCollaborationNotice setSenderHandle:](v5, "setSenderHandle:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("m"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMCollaborationNotice setMetadata:](v5, "setMetadata:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("d"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMCollaborationNotice setDate:](v5, "setDate:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ds"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMCollaborationNotice setDateViewed:](v5, "setDateViewed:", v10);

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[IMCollaborationNotice guidString](self, "guidString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGuidString:", v5);

  -[IMCollaborationNotice senderHandle](self, "senderHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSenderHandle:", v6);

  -[IMCollaborationNotice metadata](self, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMetadata:", v7);

  -[IMCollaborationNotice date](self, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDate:", v8);

  -[IMCollaborationNotice dateViewed](self, "dateViewed");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDateViewed:", v9);

  return v4;
}

- (NSString)guidString
{
  return self->_guidString;
}

- (void)setGuidString:(id)a3
{
  objc_storeStrong((id *)&self->_guidString, a3);
}

- (NSString)senderHandle
{
  return self->_senderHandle;
}

- (void)setSenderHandle:(id)a3
{
  objc_storeStrong((id *)&self->_senderHandle, a3);
}

- (IMCollaborationNoticeMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (NSDate)dateViewed
{
  return self->_dateViewed;
}

- (void)setDateViewed:(id)a3
{
  objc_storeStrong((id *)&self->_dateViewed, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateViewed, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_senderHandle, 0);
  objc_storeStrong((id *)&self->_guidString, 0);
}

@end
