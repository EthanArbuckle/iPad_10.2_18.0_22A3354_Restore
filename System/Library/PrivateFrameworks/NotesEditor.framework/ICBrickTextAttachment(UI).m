@implementation ICBrickTextAttachment(UI)

- (double)attachmentSizeForTextContainer:()UI
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  double v16;
  void *v17;
  _BOOL8 v18;
  void *v19;

  v4 = a3;
  objc_msgSend(v4, "textLayoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    objc_msgSend(v4, "textLayoutManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    objc_msgSend(a1, "viewIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "existingAttachmentViewForIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "attachmentSizeForTextContainer:", v4);
    v12 = v11;

  }
  else
  {
    objc_msgSend(v4, "layoutManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v4, "layoutManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "viewForLayoutManager:", v15);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "attachmentSizeForTextContainer:", v4);
    }
    else
    {
      objc_msgSend(a1, "attachment");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "preferredViewSize") == 1;

      v19 = (void *)MEMORY[0x1E0D64AF0];
      objc_msgSend(a1, "attachment");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "sizeForAttachment:usesSmallSize:", v7, v18);
    }
    v12 = v16;
  }

  return v12;
}

- (uint64_t)attachmentViewClassForTextContainer:()UI
{
  return objc_opt_class();
}

@end
