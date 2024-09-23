@implementation ICPDFTextAttachment(UI)

- (double)attachmentSizeForTextContainer:()UI
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  CGPDFPage *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  CGPDFPage *v29;
  void *v30;
  void *v31;
  double v32;

  v4 = a3;
  if (objc_msgSend(a1, "effectiveAttachmentViewSizeForTextContainer:", v4) == 1)
  {
    if (ICInternalSettingsIsTextKit2Enabled())
    {
      objc_msgSend(v4, "textLayoutManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
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

LABEL_16:
        goto LABEL_17;
      }
    }
    else
    {
      objc_msgSend(v4, "layoutManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v21 = objc_opt_isKindOfClass();

      if ((v21 & 1) != 0)
      {
        objc_opt_class();
        objc_msgSend(v4, "layoutManager");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "viewForLayoutManager:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        ICCheckedDynamicCast();
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "attachmentSizeForTextContainer:", v4);
        v12 = v24;
        goto LABEL_16;
      }
    }
    v30 = (void *)MEMORY[0x1E0D64AF0];
    objc_msgSend(a1, "attachment");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "sizeForAttachment:usesSmallSize:", v31, 1);
    v12 = v32;

  }
  else
  {
    objc_msgSend(a1, "availableWidthForTextContainer:", v4);
    v12 = v13;
    if (ICInternalSettingsIsTextKit2Enabled())
    {
      objc_msgSend(v4, "textLayoutManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v15 = objc_opt_isKindOfClass();

      if ((v15 & 1) != 0)
      {
        objc_msgSend(v4, "textLayoutManager");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        objc_msgSend(a1, "viewIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "existingAttachmentViewForIdentifier:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        ICCheckedDynamicCast();
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = (CGPDFPage *)objc_msgSend(v18, "page");
        if (v19)
          CGPDFPageGetBoxRect(v19, kCGPDFCropBox);

        goto LABEL_16;
      }
    }
    else
    {
      objc_msgSend(v4, "layoutManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v26 = objc_opt_isKindOfClass();

      if ((v26 & 1) != 0)
      {
        objc_opt_class();
        objc_msgSend(v4, "layoutManager");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "viewForLayoutManager:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        ICCheckedDynamicCast();
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = (CGPDFPage *)objc_msgSend(v7, "page");
        if (v29)
          CGPDFPageGetBoxRect(v29, kCGPDFCropBox);
        goto LABEL_16;
      }
    }
  }
LABEL_17:

  return v12;
}

- (id)attachmentViewClassForTextContainer:()UI
{
  objc_msgSend(a1, "effectiveAttachmentViewSizeForTextContainer:");
  return (id)objc_opt_class();
}

@end
