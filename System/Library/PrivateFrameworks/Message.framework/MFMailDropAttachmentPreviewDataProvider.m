@implementation MFMailDropAttachmentPreviewDataProvider

- (void)fetchDataForAttachment:(id)a3 consumer:(id)a4 progress:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  _BOOL8 v13;
  id v14;

  v14 = a3;
  v9 = a4;
  v10 = a5;
  v11 = a6;
  if (v14)
  {
    objc_msgSend(v14, "readFromDisk");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12 != 0;
    if (v12)
    {
      objc_msgSend(v9, "appendData:", v12);
      objc_msgSend(v10, "setCompletedUnitCount:", objc_msgSend(v10, "totalUnitCount"));
    }

  }
  else
  {
    v13 = 0;
  }
  (*((void (**)(id, _BOOL8, _QWORD, _QWORD))v11 + 2))(v11, v13, 0, 0);

}

- (id)storageLocationForAttachment:(id)a3 withMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_class();
  objc_msgSend(v6, "part");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fullResolutionStorageLocationForAttachmentWithMimePart:withMessage:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v12.receiver = self;
    v12.super_class = (Class)MFMailDropAttachmentPreviewDataProvider;
    -[MFAttachmentLibraryDataProvider storageLocationForAttachment:withMessage:](&v12, sel_storageLocationForAttachment_withMessage_, v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

+ (id)fullResolutionStorageLocationForAttachmentWithMimePart:(id)a3 withMessage:(id)a4
{
  return 0;
}

+ (id)fullResolutionAttachmentForAttachment:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFMailDropAttachmentPreviewDataProvider fullResolutionAttachmentURLForAttachmentURL:](MFMailDropAttachmentPreviewDataProvider, "fullResolutionAttachmentURLForAttachmentURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[MFAttachmentManager defaultManager](MFAttachmentManager, "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attachmentForURL:error:", v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)fullResolutionAttachmentURLForAttachmentURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setScheme:", CFSTR("x-attach-maildrop-image"));
    objc_msgSend(v4, "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
