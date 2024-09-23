@implementation ICGalleryTextAttachment(UI)

- (double)attachmentSizeForTextContainer:()UI
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  char isKindOfClass;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;

  v4 = a3;
  if (objc_msgSend(a1, "effectiveAttachmentViewSizeForTextContainer:", v4) != 1)
  {
    objc_msgSend(a1, "availableWidthForTextContainer:", v4);
    v14 = v13;
    if (ICInternalSettingsIsTextKit2Enabled())
    {
      objc_msgSend(v4, "textLayoutManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v4, "textLayoutManager");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        objc_msgSend(a1, "viewIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "existingAttachmentViewForIdentifier:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        ICDynamicCast();
        v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
        objc_msgSend(a1, "attachment");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[ICGalleryAttachmentView sizeOfViewForAttachment:textViewContentWidth:existingView:](ICGalleryAttachmentView, "sizeOfViewForAttachment:textViewContentWidth:existingView:", v28, v10, v14);
        v12 = v29;

        goto LABEL_13;
      }
    }
    else
    {
      objc_msgSend(v4, "layoutManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v25 = objc_opt_isKindOfClass();

      if ((v25 & 1) != 0)
      {
        objc_opt_class();
        objc_msgSend(v4, "layoutManager");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        ICCheckedDynamicCast();
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        objc_msgSend(v7, "viewForTextAttachmentNoCreate:", a1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        ICDynamicCast();
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_12;
      }
    }
    v31 = (void *)MEMORY[0x1E0D64BF0];
    objc_msgSend(a1, "attachment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "sizeOfViewForAttachment:textViewContentWidth:", v7, v14);
    goto LABEL_16;
  }
  if (!ICInternalSettingsIsTextKit2Enabled())
  {
    objc_msgSend(v4, "layoutManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v20 = objc_opt_isKindOfClass();

    if ((v20 & 1) != 0)
    {
      objc_opt_class();
      objc_msgSend(v4, "layoutManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "viewForLayoutManager:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      ICCheckedDynamicCast();
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "attachmentSizeForTextContainer:", v4);
LABEL_16:
      v12 = v23;
      goto LABEL_17;
    }
LABEL_14:
    v30 = (void *)MEMORY[0x1E0D64AF0];
    objc_msgSend(a1, "attachment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "sizeForAttachment:usesSmallSize:", v7, 1);
    goto LABEL_16;
  }
  objc_msgSend(v4, "textLayoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v6 = objc_opt_isKindOfClass();

  if ((v6 & 1) == 0)
    goto LABEL_14;
  objc_msgSend(v4, "textLayoutManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(a1, "viewIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "existingAttachmentViewForIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "attachmentSizeForTextContainer:", v4);
  v12 = v11;
LABEL_13:

LABEL_17:
  return v12;
}

- (id)attachmentViewClassForTextContainer:()UI
{
  objc_msgSend(a1, "effectiveAttachmentViewSizeForTextContainer:");
  return (id)objc_opt_class();
}

- (id)supportedPresentationSizes
{
  if (supportedPresentationSizes_onceToken[0] != -1)
    dispatch_once(supportedPresentationSizes_onceToken, &__block_literal_global_30);
  return (id)supportedPresentationSizes_supportedSizes;
}

@end
