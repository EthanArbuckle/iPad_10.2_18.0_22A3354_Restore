@implementation ICTableTextAttachment(UI)

- (uint64_t)attachmentSizeForTextContainer:()UI
{
  return objc_msgSend(a1, "attachmentSizeForTextContainer:proposedLineFragment:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
}

- (double)attachmentSizeForTextContainer:()UI proposedLineFragment:
{
  id v12;
  double v13;
  double v14;
  void *v15;
  char isKindOfClass;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect v32;

  v12 = a7;
  if (!v12)
  {
    objc_msgSend(a1, "lastAttachmentSize");
    v14 = v26;
    goto LABEL_18;
  }
  objc_msgSend(a1, "availableWidthForTextContainer:", v12);
  v14 = v13;
  objc_msgSend(a1, "setLastAvailableWidth:");
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    objc_msgSend(v12, "layoutManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_opt_class();
      objc_msgSend(v12, "layoutManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      ICCheckedDynamicCast();
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      objc_msgSend(v18, "viewControllerForTextAttachment:", a1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      ICCheckedDynamicCast();
      v20 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
      v32.origin.x = a2;
      v32.origin.y = a3;
      v32.size.width = a4;
      v32.size.height = a5;
      if (!CGRectIsNull(v32))
        objc_msgSend(v20, "setProposedLineFragmentRect:", a2, a3, a4, a5);
      objc_msgSend(v20, "intrinsicSize");
      goto LABEL_15;
    }
  }
  objc_msgSend(v12, "textLayoutManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v22 = objc_opt_isKindOfClass();

  if ((v22 & 1) != 0)
  {
    objc_opt_class();
    objc_msgSend(v12, "textLayoutManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "tableViewControllerForAttachment:createIfNeeded:", a1, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_msgSend(v12, "size");
  if (v27 >= v14 * 3.0)
    v28 = v14 * 3.0;
  else
    v28 = v27;
  objc_msgSend(a1, "attachment");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "tableModel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "previewInAvailableSize:shouldDraw:", 0, v14, v28);
LABEL_15:
  v29 = v24;
  v30 = v25;

  if (v14 >= v29)
    v14 = v29;
  objc_msgSend(a1, "setLastAttachmentSize:", v14, v30);
LABEL_18:

  return v14;
}

- (uint64_t)attachmentViewClassForTextContainer:()UI
{
  return objc_opt_class();
}

- (uint64_t)attachmentViewControllerClass
{
  return objc_opt_class();
}

- (uint64_t)supportsDraggingWithoutSelecting
{
  return 0;
}

- (double)availableWidthForTextContainer:()UI
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = a1;
  v19.super_class = (Class)&off_1F04856A0;
  objc_msgSendSuper2(&v19, sel_availableWidthForTextContainer_, v4);
  v6 = v5;
  objc_opt_class();
  objc_msgSend(v4, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_msgSend(v9, "ic_isRTL");
    objc_msgSend(v9, "textContainerInset");
    if (v10)
      v13 = v12;
    else
      v13 = v11;
    objc_msgSend(v9, "bounds");
    v15 = v14 - v13 * 2.0;
    objc_msgSend(v4, "lineFragmentPadding");
    v17 = v15 - v16 * 2.0;
    if (v6 < v17 + -50.0)
      v6 = v17;
  }

  return v6;
}

- (void)placeView:()UI withFrame:inParentView:characterIndex:layoutManager:
{
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  objc_super v33;
  objc_super v34;

  v18 = a7;
  v19 = a8;
  v20 = a10;
  objc_opt_class();
  objc_msgSend(v19, "superview");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    if (objc_msgSend(v22, "ic_isRTL"))
    {
      objc_msgSend(v22, "textContainer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v34.receiver = a1;
      v34.super_class = (Class)&off_1F04856A0;
      objc_msgSendSuper2(&v34, sel_availableWidthForTextContainer_, v23);
      v25 = v24;

      objc_msgSend(v22, "textContainer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "availableWidthForTextContainer:", v26);
      v28 = v27;

      if (a4 > v25)
      {
        objc_msgSend(v22, "textContainerInset");
        v30 = v28 - a4 + v29;
        objc_msgSend(v22, "textContainer");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "lineFragmentPadding");
        a2 = v30 + v32;

      }
    }
  }
  v33.receiver = a1;
  v33.super_class = (Class)&off_1F04856A0;
  objc_msgSendSuper2(&v33, sel_placeView_withFrame_inParentView_characterIndex_layoutManager_, v18, v19, a9, v20, a2, a3, a4, a5);

}

@end
