@implementation NoteAttachmentObject(ICLegacyAttachment)

- (id)identifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "contentID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ic_md5");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)title
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "fileURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)fileURL
{
  void *v1;
  id v2;
  NSObject *v3;
  id v5;

  v5 = 0;
  objc_msgSend(a1, "attachmentDataFileURLWithError:", &v5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v5;
  if (v2)
  {
    v3 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[NoteAttachmentObject(ICLegacyAttachment) fileURL].cold.1((uint64_t)v2, v3);

  }
  return v1;
}

- (id)typeUTI
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "fileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mimeType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICLegacyAttachmentUtilities typeUTIFromFileURL:mimeType:](ICLegacyAttachmentUtilities, "typeUTIFromFileURL:mimeType:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)cidURL
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "contentID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C99E98];
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "contentID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("cid:%@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (uint64_t)isDeletedOrInTrash
{
  void *v3;
  uint64_t v4;

  if ((objc_msgSend(a1, "isDeleted") & 1) != 0)
    return 1;
  objc_msgSend(a1, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDeletedOrInTrash");

  return v4;
}

- (uint64_t)isHiddenFromIndexing
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "note");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "note");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isHiddenFromIndexing");

  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)fileURL
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1BD918000, a2, OS_LOG_TYPE_ERROR, "Error getting legacy attachment file URL: %@", (uint8_t *)&v2, 0xCu);
}

@end
