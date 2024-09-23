@implementation ICAttachmentModel(UI)

- (void)genericListThumbnailCreator
{
  const void *v1;

  if (objc_msgSend(a1, "hasThumbnailImage"))
    v1 = &__block_literal_global_30;
  else
    v1 = 0;
  return _Block_copy(v1);
}

- (void)genericBrickThumbnailCreator
{
  const void *v1;

  if (objc_msgSend(a1, "hasThumbnailImage"))
    v1 = &__block_literal_global_8_0;
  else
    v1 = 0;
  return _Block_copy(v1);
}

+ (uint64_t)fileIconForURL:()UI withPreferredSize:
{
  return objc_msgSend(a1, "fileIconForURL:withPreferredSize:uti:", a3, 0);
}

+ (id)fileIconForURL:()UI withPreferredSize:uti:
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a6;
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CEA538], "interactionControllerWithURL:", a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
      objc_msgSend(v10, "setUTI:", v9);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v11, "icons", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v26;
LABEL_6:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v16);
        objc_msgSend(v17, "size");
        if (v18 == a1)
        {
          objc_msgSend(v17, "size");
          if (v19 <= a2)
            break;
        }
        objc_msgSend(v17, "size");
        if (v20 <= a1)
        {
          objc_msgSend(v17, "size");
          if (v21 == a2)
            break;
        }
        if (v14 == ++v16)
        {
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          if (v14)
            goto LABEL_6;
          goto LABEL_15;
        }
      }
      v22 = v17;

      if (v22)
        goto LABEL_18;
    }
    else
    {
LABEL_15:

    }
    objc_msgSend(v11, "icons");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "lastObject");
    v22 = (id)objc_claimAutoreleasedReturnValue();

LABEL_18:
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)quicklookPreviewItems
{
  void *v1;
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "attachment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)activityItems
{
  void *v2;
  void *v3;
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
  ICAttachmentActivityItemSource *v15;
  void *v16;
  ICAttachmentActivityItemSource *v17;
  void *v18;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "media");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "attachmentModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "attachment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "media");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mediaURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "generateHardLinkURLIfNecessaryForURL:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v21[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((url) != nil)", "-[ICAttachmentModel(UI) activityItems]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "url");
      v12 = (void *)MEMORY[0x1E0C9AA60];
    }
  }
  else
  {
    objc_msgSend(v5, "URL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      v12 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_8;
    }
    objc_msgSend(a1, "attachment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_8:
  v15 = [ICAttachmentActivityItemSource alloc];
  objc_msgSend(a1, "attachment");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[ICAttachmentActivityItemSource initWithAttachment:](v15, "initWithAttachment:", v16);
  objc_msgSend(v12, "arrayByAddingObject:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)fileIconWithPreferredSize:()UI
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void *)objc_opt_class();
  objc_msgSend(a1, "attachment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "media");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mediaURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileIconForURL:withPreferredSize:", v9, a2, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
