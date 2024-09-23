@implementation ICInlineTextAttachment(UI)

- (id)viewProviderForParentView:()UI location:textContainer:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_opt_class();
  objc_msgSend(v8, "textLayoutManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  ICDynamicCast();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "viewProviderForTextAttachment:parentView:location:", a1, v10, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (double)attachmentBoundsForAttributes:()UI location:textContainer:proposedLineFragment:position:
{
  id v20;
  id v21;
  id v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  double v37;
  double v38;
  double v39;
  objc_super v41;

  v20 = a11;
  v41.receiver = a1;
  v41.super_class = (Class)&off_1F0483218;
  v21 = a10;
  v22 = a9;
  objc_msgSendSuper2(&v41, sel_attachmentBoundsForAttributes_location_textContainer_proposedLineFragment_position_, v22, v21, v20, a2, a3, a4, a5, a6, a7);
  v24 = v23;
  objc_msgSend(v20, "textView", v41.receiver, v41.super_class);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "viewProviderForParentView:location:textContainer:", v25, v21, v20);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  ICDynamicCast();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  ICDynamicCast();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "tk2TextView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v30, "textStorage");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v32, "styler");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "authorHighlightsController");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "isPerformingHighlightUpdatesForTextStorage:", v32);

  if (v36)
    objc_msgSend(v28, "updateHighlightsWithAttributes:", v22);
  else
    objc_msgSend(v28, "updateStyleWithAttributes:", v22);

  objc_msgSend(v20, "size");
  v38 = v37;
  objc_msgSend(v20, "lineFragmentPadding");
  objc_msgSend(v28, "setTextContainerWidth:", v38 + v39 * -2.0);
  if (v28)
  {
    objc_msgSend(v28, "baselineOffsetFromBottom");
    objc_msgSend(v28, "intrinsicContentSize");
    objc_msgSend(v28, "intrinsicContentSize");
    v24 = 0.0;
  }

  return v24;
}

- (id)viewProviderForParentView:()UI characterIndex:layoutManager:
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a5;
  v9 = a3;
  objc_opt_class();
  ICDynamicCast();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "viewProviderForTextAttachment:parentView:characterIndex:", a1, v9, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (double)attachmentBoundsForTextContainer:()UI proposedLineFragment:glyphPosition:characterIndex:
{
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  objc_super v29;

  v18 = a9;
  objc_opt_class();
  objc_msgSend(v18, "layoutManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v20, "viewForTextAttachment:initialCharacterIndex:", a1, a10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    ICDynamicCast();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "size");
    v24 = v23;
    objc_msgSend(v18, "lineFragmentPadding");
    objc_msgSend(v22, "setTextContainerWidth:", v24 + v25 * -2.0);
    v26 = 0.0;
    if (v22)
      objc_msgSend(v22, "baselineOffsetFromBottom");
    objc_msgSend(v21, "frame");
    objc_msgSend(v21, "frame");

  }
  else
  {
    v29.receiver = a1;
    v29.super_class = (Class)&off_1F0483218;
    objc_msgSendSuper2(&v29, sel_attachmentBoundsForTextContainer_proposedLineFragment_glyphPosition_characterIndex_, v18, a10, a2, a3, a4, a5, a6, a7);
    v26 = v27;
  }

  return v26;
}

- (uint64_t)attachmentViewControllerClass
{
  return objc_opt_class();
}

@end
