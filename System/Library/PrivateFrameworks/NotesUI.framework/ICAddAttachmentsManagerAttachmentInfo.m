@implementation ICAddAttachmentsManagerAttachmentInfo

- (ICAddAttachmentsManagerAttachmentInfo)initWithFileURL:(id)a3
{
  id v4;
  ICAddAttachmentsManagerAttachmentInfo *v5;
  ICAddAttachmentsManagerAttachmentInfo *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICAddAttachmentsManagerAttachmentInfo;
  v5 = -[ICAddAttachmentsManagerAttachmentInfo init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ICAddAttachmentsManagerAttachmentInfo setMediaURL:](v5, "setMediaURL:", v4);

  return v6;
}

- (void)setMediaURL:(id)a3
{
  id v5;
  uint64_t v6;
  int v7;
  id v8;
  id v9;
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;

  v5 = a3;
  objc_storeStrong((id *)&self->_mediaURL, a3);
  v33 = 0;
  v6 = *MEMORY[0x1E0C99A70];
  v32 = 0;
  v7 = objc_msgSend(v5, "getResourceValue:forKey:error:", &v33, v6, &v32);
  v8 = v33;
  if (v7)
  {
    v9 = v32;
    -[ICAddAttachmentsManagerAttachmentInfo setTitle:](self, "setTitle:", v8);
  }
  else
  {
    v10 = (objc_class *)MEMORY[0x1E0CB3998];
    v11 = v32;
    v9 = (id)objc_msgSend([v10 alloc], "initWithURL:resolvingAgainstBaseURL:", v5, 0);

    objc_msgSend(v9, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastPathComponent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAddAttachmentsManagerAttachmentInfo setTitle:](self, "setTitle:", v13);

  }
  v31 = 0;
  v14 = *MEMORY[0x1E0C99AD0];
  v30 = 0;
  v15 = objc_msgSend(v5, "getResourceValue:forKey:error:", &v31, v14, &v30);
  v16 = v31;
  v17 = v30;
  v18 = v17;
  if (v15)
    -[ICAddAttachmentsManagerAttachmentInfo setMediaUTI:](self, "setMediaUTI:", v16);
  else
    NSLog(CFSTR("Error reading attachment file type: %@"), v17);
  -[ICAddAttachmentsManagerAttachmentInfo mediaUTI](self, "mediaUTI");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v19, "length"))
  {
LABEL_13:

    goto LABEL_14;
  }
  v20 = (void *)MEMORY[0x1E0CEC3F8];
  -[ICAddAttachmentsManagerAttachmentInfo mediaUTI](self, "mediaUTI");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "typeWithIdentifier:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "conformsToType:", *MEMORY[0x1E0CEC570]);

  if (v23)
  {
    v24 = objc_alloc(MEMORY[0x1E0CD0DB8]);
    -[ICAddAttachmentsManagerAttachmentInfo mediaURL](self, "mediaURL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v24, "initWithURL:", v25);

    objc_msgSend(v19, "documentAttributes");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x1E0CD0E98]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v27, "length"))
    {
      -[ICAddAttachmentsManagerAttachmentInfo setTitle:](self, "setTitle:", v27);
    }
    else
    {
      -[ICAddAttachmentsManagerAttachmentInfo title](self, "title");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringByDeletingPathExtension");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAddAttachmentsManagerAttachmentInfo setTitle:](self, "setTitle:", v29);

    }
    goto LABEL_13;
  }
LABEL_14:

}

- (id)attachmentIfExistsForAccount:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
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
  void *v19;

  v4 = a3;
  -[ICAddAttachmentsManagerAttachmentInfo attachment](self, "attachment");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "note");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "account");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    v9 = v6;
    if (v8 != v4)
    {
      v10 = (void *)MEMORY[0x1E0D639F0];
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "UUIDString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "managedObjectContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v10, "newObjectWithIdentifier:context:", v12, v13);

      objc_msgSend(v4, "persistentStore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "assignToPersistentStore:", v14);

      objc_msgSend(v6, "typeUTI");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTypeUTI:", v15);

      objc_msgSend(v6, "urlString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setUrlString:", v16);

      objc_msgSend(v6, "title");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTitle:", v17);

      objc_msgSend(v6, "creationDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setCreationDate:", v18);

      objc_msgSend(v6, "modificationDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setModificationDate:", v19);

      objc_msgSend(v9, "updateChangeCountWithReason:", CFSTR("Created attachment"));
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)mediaSize
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v7;
  uint64_t v8;
  int v9;
  id v10;
  id v11;
  unint64_t v12;
  id v13;
  id v14;

  -[ICAddAttachmentsManagerAttachmentInfo mediaData](self, "mediaData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICAddAttachmentsManagerAttachmentInfo mediaData](self, "mediaData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");

    return v5;
  }
  else
  {
    -[ICAddAttachmentsManagerAttachmentInfo mediaURL](self, "mediaURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v8 = *MEMORY[0x1E0C99998];
    v13 = 0;
    v9 = objc_msgSend(v7, "getResourceValue:forKey:error:", &v14, v8, &v13);
    v10 = v14;
    v11 = v13;

    v12 = 0;
    if (v9)
      v12 = objc_msgSend(v10, "unsignedLongLongValue");

    return v12;
  }
}

- (BOOL)isPhoto
{
  void *v2;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;

  -[ICAddAttachmentsManagerAttachmentInfo attachment](self, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[ICAddAttachmentsManagerAttachmentInfo attachment](self, "attachment");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "attachmentType") == 3)
    {
      v5 = 1;
LABEL_8:

      goto LABEL_9;
    }
  }
  v6 = (void *)MEMORY[0x1E0D639F0];
  -[ICAddAttachmentsManagerAttachmentInfo mediaUTI](self, "mediaUTI");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "typeUTIIsImage:", v7) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    -[ICAddAttachmentsManagerAttachmentInfo image](self, "image");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8 != 0;

  }
  if (v4)
    goto LABEL_8;
LABEL_9:

  return v5;
}

- (BOOL)isVideo
{
  void *v2;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  -[ICAddAttachmentsManagerAttachmentInfo attachment](self, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[ICAddAttachmentsManagerAttachmentInfo attachment](self, "attachment");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "attachmentType") == 5)
    {
      v5 = 1;
LABEL_5:

      goto LABEL_6;
    }
  }
  v6 = (void *)MEMORY[0x1E0D639F0];
  -[ICAddAttachmentsManagerAttachmentInfo mediaUTI](self, "mediaUTI");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "typeUTIIsPlayableMovie:", v7);

  if (v4)
    goto LABEL_5;
LABEL_6:

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)ICAddAttachmentsManagerAttachmentInfo;
  -[ICAddAttachmentsManagerAttachmentInfo description](&v33, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAddAttachmentsManagerAttachmentInfo attachment](self, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[ICAddAttachmentsManagerAttachmentInfo attachment](self, "attachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ attachment:%@"), v3, v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  -[ICAddAttachmentsManagerAttachmentInfo title](self, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    -[ICAddAttachmentsManagerAttachmentInfo title](self, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ title:%@"), v3, v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v11;
  }
  -[ICAddAttachmentsManagerAttachmentInfo mediaURL](self, "mediaURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    -[ICAddAttachmentsManagerAttachmentInfo mediaURL](self, "mediaURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ mediaURL:%@"), v3, v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v15;
  }
  -[ICAddAttachmentsManagerAttachmentInfo mediaUTI](self, "mediaUTI");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    -[ICAddAttachmentsManagerAttachmentInfo mediaUTI](self, "mediaUTI");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%@ mediaUTI:%@"), v3, v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v19;
  }
  -[ICAddAttachmentsManagerAttachmentInfo mediaData](self, "mediaData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = (void *)MEMORY[0x1E0CB3940];
    -[ICAddAttachmentsManagerAttachmentInfo mediaData](self, "mediaData");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("%@ mediaData:%@"), v3, v22);
    v23 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v23;
  }
  -[ICAddAttachmentsManagerAttachmentInfo mediaFilenameExtension](self, "mediaFilenameExtension");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v25 = (void *)MEMORY[0x1E0CB3940];
    -[ICAddAttachmentsManagerAttachmentInfo mediaFilenameExtension](self, "mediaFilenameExtension");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", CFSTR("%@ mediaFilenameExtension:%@"), v3, v26);
    v27 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v27;
  }
  -[ICAddAttachmentsManagerAttachmentInfo image](self, "image");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v29 = (void *)MEMORY[0x1E0CB3940];
    -[ICAddAttachmentsManagerAttachmentInfo image](self, "image");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithFormat:", CFSTR("%@ attachment:%@"), v3, v30);
    v31 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v31;
  }
  return v3;
}

- (void)deleteTemporaryImageFileIfNecessary
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "mediaURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_1AC7A1000, a3, OS_LOG_TYPE_ERROR, "Failed to delete temporary image file at %@. Error: %@", (uint8_t *)&v6, 0x16u);

}

- (ICAttachment)attachment
{
  return self->_attachment;
}

- (void)setAttachment:(id)a3
{
  objc_storeStrong((id *)&self->_attachment, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSURL)mediaURL
{
  return self->_mediaURL;
}

- (NSString)mediaUTI
{
  return self->_mediaUTI;
}

- (void)setMediaUTI:(id)a3
{
  objc_storeStrong((id *)&self->_mediaUTI, a3);
}

- (NSData)mediaData
{
  return self->_mediaData;
}

- (void)setMediaData:(id)a3
{
  objc_storeStrong((id *)&self->_mediaData, a3);
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (NSString)mediaFilenameExtension
{
  return self->_mediaFilenameExtension;
}

- (void)setMediaFilenameExtension:(id)a3
{
  objc_storeStrong((id *)&self->_mediaFilenameExtension, a3);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (NSAttributedString)attributedContentText
{
  return self->_attributedContentText;
}

- (void)setAttributedContentText:(id)a3
{
  objc_storeStrong((id *)&self->_attributedContentText, a3);
}

- (BOOL)usesTemporaryFile
{
  return self->_usesTemporaryFile;
}

- (void)setUsesTemporaryFile:(BOOL)a3
{
  self->_usesTemporaryFile = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedContentText, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_mediaFilenameExtension, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_mediaData, 0);
  objc_storeStrong((id *)&self->_mediaUTI, 0);
  objc_storeStrong((id *)&self->_mediaURL, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_attachment, 0);
}

@end
