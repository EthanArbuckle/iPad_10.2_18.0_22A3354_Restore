@implementation ICAttachmentDrawingModel(ItemProviderWriting)

- (id)itemProviderWritingURL
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "attachment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D63AF0], "defaultPixelSize");
  objc_msgSend(v1, "attachmentPreviewImageWithMinSize:scale:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "orientedPreviewImageURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)itemProviderWritingData
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a1, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D63AF0], "defaultPixelSize");
  objc_msgSend(v2, "attachmentPreviewImageWithMinSize:scale:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPasswordProtected");

  if (v5)
  {
    objc_msgSend(a1, "attachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isAuthenticated");

    if (v7)
    {
      objc_msgSend(v3, "decryptedImageData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend(v3, "orientedPreviewImageURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dataWithContentsOfURL:options:error:", v10, 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

@end
