@implementation MFAttachmentManager(Utilities)

- (uint64_t)sizeForScale:()Utilities imagesOnly:forContext:
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(a1, "attachmentsForContext:", a5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v12, "isDisplayableImage"))
        {
          v13 = objc_msgSend(v12, "scaledFileSizeForScale:", a3);
        }
        else
        {
          if ((a4 & 1) != 0)
            continue;
          v13 = objc_msgSend(v12, "decodedFileSize");
        }
        v8 += v13;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return v8;
}

- (void)attachmentForCID:()Utilities isDisplayableImage:
{
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(id, void *);

  v9 = a4;
  objc_msgSend(a1, "attachmentForCID:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v6, "isDisplayableImage"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v9[2](v9, v8);
  if (v7)

}

- (void)attachmentForCID:()Utilities isBasicImage:
{
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(id, void *);

  v9 = a4;
  objc_msgSend(a1, "attachmentForCID:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v6, "isBasicImage"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v9[2](v9, v8);
  if (v7)

}

- (void)hasAttachmentForCID:()Utilities completionHandler:
{
  void *v6;
  void (**v7)(id, BOOL);

  v7 = a4;
  objc_msgSend(a1, "attachmentForCID:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v6 != 0);

}

- (void)filenameAndURLForAttachmentForCID:()Utilities completionHandler:
{
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(id, void *, void *);

  v9 = a4;
  objc_msgSend(a1, "attachmentForCID:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, v7, v8);

}

@end
