@implementation ICReaderDelegateUtilities

+ (id)fileWrapperForURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  ICLegacyAttachmentFileWrapper *v7;
  void *v8;
  void *v9;
  int v10;
  ICLegacyAttachmentFileWrapper *v11;
  id v12;
  void *v13;
  id v15;

  v3 = a3;
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("cid"));

  if (v6)
  {
    v7 = -[ICLegacyAttachmentFileWrapper initWithCIDURL:]([ICLegacyAttachmentFileWrapper alloc], "initWithCIDURL:", v3);
LABEL_10:
    v11 = v7;
    goto LABEL_11;
  }
  if (!objc_msgSend(v3, "isFileURL"))
  {
    v7 = -[ICRemoteFileWrapper initWithRemoteURL:]([ICRemoteFileWrapper alloc], "initWithRemoteURL:", v3);
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isReadableFileAtPath:", v9);

  if (!v10)
  {
    v7 = -[ICLocalFileWrapper initWithLocalURL:]([ICLocalFileWrapper alloc], "initWithLocalURL:", v3);
    goto LABEL_10;
  }
  v15 = 0;
  v11 = (ICLegacyAttachmentFileWrapper *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3650]), "initWithURL:options:error:", v3, 0, &v15);
  v12 = v15;
  v13 = v12;
  if (v12)
  {
    NSLog(CFSTR("Error creating file wrapper for attachment with URL %@: %@"), v3, v12);

    v11 = 0;
  }

LABEL_11:
  return v11;
}

+ (id)sharedInstance
{
  if (sharedInstance_once != -1)
    dispatch_once(&sharedInstance_once, &__block_literal_global_2);
  return (id)sharedInstance_sharedInstance;
}

void __43__ICReaderDelegateUtilities_sharedInstance__block_invoke()
{
  ICReaderDelegateUtilities *v0;
  void *v1;

  v0 = objc_alloc_init(ICReaderDelegateUtilities);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (id)fileWrapperForURL:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "fileWrapperForURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
