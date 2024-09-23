@implementation EDMessageAttachmentMetadata

- (EDMessageAttachmentMetadata)initWithGlobalMessageID:(int64_t)a3 name:(id)a4 mimePart:(id)a5 attachmentID:(id)a6 remoteURL:(id)a7
{
  id v13;
  __CFString *v14;
  id v15;
  id v16;
  EDMessageAttachmentMetadata *v17;
  EDMessageAttachmentMetadata *v18;
  NSObject *v19;
  objc_super v21;
  uint8_t buf[4];
  int64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = (__CFString *)a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)EDMessageAttachmentMetadata;
  v17 = -[EDMessageAttachmentMetadata init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_globalMessageID = a3;
    objc_storeStrong((id *)&v17->_name, a4);
    if (-[__CFString isEqualToString:](v14, "isEqualToString:", &stru_1E94A4508))
    {
      EDAttachmentsLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v23 = a3;
        _os_log_impl(&dword_1D2F2C000, v19, OS_LOG_TYPE_DEFAULT, "Updating MIME part number to 1 for globalMessageID: %lld", buf, 0xCu);
      }

      v14 = CFSTR("1");
    }
    objc_storeStrong((id *)&v18->_mimePartNumber, v14);
    objc_storeStrong((id *)&v18->_attachmentID, a6);
    objc_storeStrong((id *)&v18->_remoteURL, a7);
  }

  return v18;
}

- (EDMessageAttachmentMetadata)initWithGlobalMessageID:(int64_t)a3 attachmentID:(id)a4
{
  return -[EDMessageAttachmentMetadata initWithGlobalMessageID:name:mimePart:attachmentID:remoteURL:](self, "initWithGlobalMessageID:name:mimePart:attachmentID:remoteURL:", a3, 0, 0, a4, 0);
}

- (NSString)ef_publicDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("globalMessageID: %lld@"), -[EDMessageAttachmentMetadata globalMessageID](self, "globalMessageID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[EDMessageAttachmentMetadata mimePartNumber](self, "mimePartNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("mimePartNumber: %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  -[EDMessageAttachmentMetadata attachmentID](self, "attachmentID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("attachmentID: %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v11, "isInternal");

  if ((_DWORD)v10)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    -[EDMessageAttachmentMetadata name](self, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("name: %@"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v14);

    v15 = (void *)MEMORY[0x1E0CB3940];
    -[EDMessageAttachmentMetadata remoteURL](self, "remoteURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("remoteURL: %@"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v17);

  }
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v15;
  void *v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "globalMessageID");
    if (v6 == -[EDMessageAttachmentMetadata globalMessageID](self, "globalMessageID"))
    {
      objc_msgSend(v5, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDMessageAttachmentMetadata name](self, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (EFStringsAreEqual())
      {
        objc_msgSend(v5, "mimePartNumber");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[EDMessageAttachmentMetadata mimePartNumber](self, "mimePartNumber");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (EFStringsAreEqual())
        {
          objc_msgSend(v5, "attachmentID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[EDMessageAttachmentMetadata attachmentID](self, "attachmentID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (EFObjectsAreEqual())
          {
            objc_msgSend(v5, "remoteURL");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[EDMessageAttachmentMetadata remoteURL](self, "remoteURL");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = EFObjectsAreEqual();

          }
          else
          {
            v13 = 0;
          }

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)setMimePartNumber:(id)a3
{
  __CFString *v4;
  NSObject *v5;
  NSString *mimePartNumber;
  int v7;
  int64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  if (-[__CFString isEqualToString:](v4, "isEqualToString:", &stru_1E94A4508))
  {
    EDAttachmentsLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134217984;
      v8 = -[EDMessageAttachmentMetadata globalMessageID](self, "globalMessageID");
      _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "Updating MIME part number to 1 for globalMessageID: %lld", (uint8_t *)&v7, 0xCu);
    }

    v4 = CFSTR("1");
  }
  mimePartNumber = self->_mimePartNumber;
  self->_mimePartNumber = &v4->isa;

}

- (NSString)mimePartNumber
{
  return self->_mimePartNumber;
}

- (int64_t)globalMessageID
{
  return self->_globalMessageID;
}

- (NSString)name
{
  return self->_name;
}

- (NSNumber)attachmentID
{
  return self->_attachmentID;
}

- (void)setAttachmentID:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentID, a3);
}

- (NSURL)remoteURL
{
  return self->_remoteURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteURL, 0);
  objc_storeStrong((id *)&self->_attachmentID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_mimePartNumber, 0);
}

@end
