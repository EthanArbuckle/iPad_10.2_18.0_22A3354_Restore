@implementation ICInlineCanvasTextAttachment(MultiSceneSupport)

- (double)attachmentBoundsForAttributes:()MultiSceneSupport location:textContainer:proposedLineFragment:position:
{
  id v20;
  id v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  double x;
  objc_super v32;
  CGRect v33;

  v20 = a10;
  v21 = a11;
  v32.receiver = a1;
  v32.super_class = (Class)&off_1F0489F30;
  objc_msgSendSuper2(&v32, sel_attachmentBoundsForAttributes_location_textContainer_proposedLineFragment_position_, a9, v20, v21, a2, a3, a4, a5, a6, a7);
  v23 = v22;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    objc_opt_class();
    ICDynamicCast();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "tk2TextView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v21, "textLayoutManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "documentRange");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "location");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v26, "offsetFromLocation:toLocation:", v28, v20);

      objc_msgSend(v25, "_pk_boundsForDrawingTextAttachment:characterIndex:", a1, v29);
      x = v33.origin.x;
      if (!CGRectIsEmpty(v33))
        v23 = x;

    }
  }

  return v23;
}

- (double)attachmentBoundsForTextContainer:()MultiSceneSupport proposedLineFragment:glyphPosition:characterIndex:
{
  id v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  objc_super v35;
  CGRect v36;

  v16 = a9;
  v17 = *MEMORY[0x1E0C9D628];
  v18 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v19 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v20 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  objc_opt_class();
  objc_msgSend(v16, "layoutManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    objc_msgSend(v22, "textView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_opt_class();
      objc_msgSend(v22, "textView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v16, "layoutManager");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "_boundsForDrawingTextAttachment:characterIndex:layoutManager:", a1, a10, v26);
        v17 = v27;
        v18 = v28;
        v19 = v29;
        v20 = v30;

      }
    }
  }
  v36.origin.x = v17;
  v36.origin.y = v18;
  v36.size.width = v19;
  v36.size.height = v20;
  if (CGRectIsEmpty(v36))
  {
    v35.receiver = a1;
    v35.super_class = (Class)&off_1F0489F30;
    objc_msgSendSuper2(&v35, sel_attachmentBoundsForTextContainer_proposedLineFragment_glyphPosition_characterIndex_, v16, a10, a2, a3, a4, a5, a6, a7);
    v17 = v31;
  }

  return v17;
}

@end
