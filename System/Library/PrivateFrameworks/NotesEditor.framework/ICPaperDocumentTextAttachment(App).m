@implementation ICPaperDocumentTextAttachment(App)

- (id)viewProviderForParentView:()App location:textContainer:
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

- (id)imageForBounds:()App attributes:location:textContainer:
{
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;

  v12 = a9;
  objc_opt_class();
  objc_msgSend(v12, "textLayoutManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  ICDynamicCast();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(a1, "viewIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "existingAttachmentViewForIdentifier:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    ICDynamicCast();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "prepareForPrinting");

    objc_msgSend(v16, "setFrame:", 0.0, 0.0, a4, a5);
    v18 = objc_msgSend(v16, "isHidden");
    objc_msgSend(v16, "setHidden:", 0);
    objc_msgSend(v16, "layoutIfNeeded");
    v19 = (id)objc_msgSend(v16, "snapshotViewAfterScreenUpdates:", 1);
    objc_msgSend(v16, "ic_imageRenderedFromLayer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setHidden:", v18);

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)imageForBounds:()App textContainer:characterIndex:
{
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  objc_super v25;

  v14 = a7;
  objc_opt_class();
  objc_msgSend(v14, "layoutManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v25.receiver = a1;
    v25.super_class = (Class)&off_1F0492C50;
    objc_msgSendSuper2(&v25, sel_imageForBounds_textContainer_characterIndex_, v14, a8, a2, a3, a4, a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = v17;
    }
    else
    {
      objc_msgSend(a1, "viewProviderForParentView:characterIndex:layoutManager:", 0, a8, v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "view");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "setFrame:", 0.0, 0.0, a4, a5);
      v21 = objc_msgSend(v20, "isHidden");
      objc_msgSend(v20, "setHidden:", 0);
      objc_msgSend(v20, "layoutIfNeeded");
      v22 = (id)objc_msgSend(v20, "snapshotViewAfterScreenUpdates:", 1);
      objc_msgSend(v20, "ic_imageRenderedFromLayer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setHidden:", v21);
      v18 = v23;

    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (double)viewCornerRadius
{
  return 16.0;
}

@end
