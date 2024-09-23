@implementation ICDrawingTextAttachment(UI)

- (double)attachmentSizeForTextContainer:()UI
{
  id v4;
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
  double v15;
  double v16;

  v4 = a3;
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) != 0)
  {
    objc_opt_class();
    objc_msgSend(v4, "textLayoutManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "viewIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "existingAttachmentViewForIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_opt_class();
    objc_msgSend(v4, "layoutManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewForTextAttachment:", a1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(a1, "attachment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "drawingModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "drawing");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fullBounds");

  if (v8)
  {
    objc_opt_class();
    ICCheckedDynamicCast();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "boundsForDisplay");
  }
  else
  {
    objc_msgSend(a1, "attachment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "drawingModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "drawing");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "bounds");
  }

  objc_msgSend(a1, "availableWidthForTextContainer:", v4);
  v16 = v15;

  return v16;
}

- (uint64_t)attachmentViewClassForTextContainer:()UI
{
  return objc_opt_class();
}

- (ICDrawingInlineAttachmentView)newlyCreatedViewForManualRenderingInTextContainer:()UI
{
  id v4;
  ICDrawingInlineAttachmentView *v5;

  v4 = a3;
  v5 = -[ICDrawingInlineAttachmentView initWithTextAttachment:textContainer:forManualRendering:]([ICDrawingInlineAttachmentView alloc], "initWithTextAttachment:textContainer:forManualRendering:", a1, v4, 1);

  return v5;
}

- (double)availableWidthForTextContainer:()UI
{
  id v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  objc_super v11;

  v11.receiver = a1;
  v11.super_class = (Class)&off_1F04914E0;
  v3 = a3;
  objc_msgSendSuper2(&v11, sel_availableWidthForTextContainer_, v3);
  v5 = v4;
  objc_opt_class();
  objc_msgSend(v3, "textView", v11.receiver, v11.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "bounds");
    v5 = v9;
  }

  return v5;
}

- (void)placeView:()UI withFrame:inParentView:characterIndex:layoutManager:
{
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  double v23;
  objc_super v24;

  v18 = a10;
  v19 = a8;
  v20 = a7;
  objc_opt_class();
  objc_msgSend(v19, "superview");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0.0;
  if (!v22)
    v23 = a2;
  v24.receiver = a1;
  v24.super_class = (Class)&off_1F04914E0;
  objc_msgSendSuper2(&v24, sel_placeView_withFrame_inParentView_characterIndex_layoutManager_, v20, v19, a9, v18, v23, a3, a4, a5);

}

@end
