@implementation ICTextAttachment(Printing)

- (id)imageForBounds:()Printing attributes:location:textContainer:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v6 = a5;
  objc_opt_class();
  objc_msgSend(v6, "textLayoutManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  ICDynamicCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(a1, "viewIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "existingAttachmentViewForIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    ICDynamicCast();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "prepareForPrinting");

    objc_msgSend(v10, "frame");
    v13 = v12;
    objc_msgSend(v10, "frame");
    objc_msgSend(v10, "setFrame:", v13);
    v14 = objc_msgSend(v10, "isHidden");
    objc_msgSend(v10, "setHidden:", 0);
    objc_opt_class();
    ICDynamicCast();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (!v15 || (objc_msgSend(v15, "imageForPrinting"), (v17 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(v10, "layoutIfNeeded");
      v18 = (id)objc_msgSend(v10, "snapshotViewAfterScreenUpdates:", 1);
      objc_msgSend(v10, "ic_imageRenderedFromLayer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "setHidden:", v14);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)imageForBounds:()Printing textContainer:characterIndex:
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v10 = a7;
  objc_opt_class();
  objc_msgSend(v10, "layoutManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  ICDynamicCast();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "viewForTextAttachment:", a1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    objc_msgSend(v12, "viewControllerForTextAttachment:", a1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "prepareForPrinting");

    objc_opt_class();
    ICDynamicCast();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "prepareForPrinting");

    objc_msgSend(v13, "setFrame:", 0.0, 0.0, a4, a5);
    v17 = objc_msgSend(v13, "isHidden");
    objc_msgSend(v13, "setHidden:", 0);
    objc_opt_class();
    ICDynamicCast();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (!v18 || (objc_msgSend(v18, "imageForPrinting"), (v20 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(v13, "layoutIfNeeded");
      v21 = (id)objc_msgSend(v13, "snapshotViewAfterScreenUpdates:", 1);
      objc_msgSend(v13, "ic_imageRenderedFromLayer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "setHidden:", v17);

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

@end
