@implementation DAMessageFetchAttachmentRequest

- (DAMessageFetchAttachmentRequest)initWithAttachmentName:(id)a3 andMessageServerID:(id)a4
{
  id v6;
  id v7;
  DAMessageFetchAttachmentRequest *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DAMessageFetchAttachmentRequest;
  v8 = -[DAMessageFetchAttachmentRequest init](&v12, sel_init);
  if (v8)
  {
    v9 = (void *)objc_msgSend(v6, "copy");
    -[DAMessageFetchAttachmentRequest setAttachmentName:](v8, "setAttachmentName:", v9);

    v10 = (void *)objc_msgSend(v7, "copy");
    -[DAMessageFetchAttachmentRequest setMessageID:](v8, "setMessageID:", v10);

  }
  return v8;
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[DAMessageFetchAttachmentRequest messageID](self, "messageID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAMessageFetchAttachmentRequest attachmentName](self, "attachmentName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@\n%@"), v4, v5);

  v7 = objc_msgSend(v6, "hash");
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    -[DAMessageFetchAttachmentRequest messageID](self, "messageID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "messageID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 != v8)
    {
      -[DAMessageFetchAttachmentRequest messageID](self, "messageID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "messageID");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v9, "isEqual:", v3))
      {
        v10 = 0;
LABEL_11:

LABEL_12:
        goto LABEL_13;
      }
      v16 = v9;
    }
    -[DAMessageFetchAttachmentRequest attachmentName](self, "attachmentName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attachmentName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 == v12)
    {
      v10 = 1;
    }
    else
    {
      -[DAMessageFetchAttachmentRequest attachmentName](self, "attachmentName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "attachmentName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v13, "isEqualToString:", v14);

    }
    v9 = v16;
    if (v7 == v8)
      goto LABEL_12;
    goto LABEL_11;
  }
  v10 = 0;
LABEL_13:

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)DAMessageFetchAttachmentRequest;
  -[DAMessageFetchAttachmentRequest description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAMessageFetchAttachmentRequest messageID](self, "messageID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAMessageFetchAttachmentRequest attachmentName](self, "attachmentName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ messageID \"%@\", attachmentName \"%@\"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)attachmentName
{
  return self->_attachmentName;
}

- (void)setAttachmentName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentName, 0);
  objc_storeStrong((id *)&self->_messageID, 0);
}

@end
