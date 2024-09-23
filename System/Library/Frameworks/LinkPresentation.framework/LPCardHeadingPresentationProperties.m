@implementation LPCardHeadingPresentationProperties

- (LPCardHeadingPresentationProperties)initWithStyle:(int64_t)a3 topCaption:(id)a4 bottomCaption:(id)a5 icon:(id)a6
{
  id v10;
  id v11;
  id v12;
  LPCardHeadingPresentationProperties *v13;
  LPCardHeadingPresentationProperties *v14;
  LPCaptionBarPresentationProperties *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  LPCardHeadingPresentationProperties *v23;
  objc_super v25;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v25.receiver = self;
  v25.super_class = (Class)LPCardHeadingPresentationProperties;
  v13 = -[LPCardHeadingPresentationProperties init](&v25, sel_init);
  v14 = v13;
  if (v13)
  {
    -[LPWebLinkPresentationProperties setStyle:](v13, "setStyle:", a3);
    v15 = objc_alloc_init(LPCaptionBarPresentationProperties);
    -[LPWebLinkPresentationProperties setCaptionBar:](v14, "setCaptionBar:", v15);

    -[LPWebLinkPresentationProperties captionBar](v14, "captionBar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setLeadingIcon:", v12);

    -[LPWebLinkPresentationProperties captionBar](v14, "captionBar");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "top");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "leading");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setText:", v10);

    -[LPWebLinkPresentationProperties captionBar](v14, "captionBar");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bottom");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "leading");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setText:", v11);

    v23 = v14;
  }

  return v14;
}

- (LPCardHeadingPresentationProperties)initWithStyle:(int64_t)a3 topCaption:(id)a4 attributedBottomCaption:(id)a5 icons:(id)a6
{
  id v10;
  id v11;
  id v12;
  LPCardHeadingPresentationProperties *v13;
  LPCardHeadingPresentationProperties *v14;
  LPCaptionBarPresentationProperties *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  LPCardHeadingPresentationProperties *v26;
  objc_super v28;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v28.receiver = self;
  v28.super_class = (Class)LPCardHeadingPresentationProperties;
  v13 = -[LPCardHeadingPresentationProperties init](&v28, sel_init);
  v14 = v13;
  if (v13)
  {
    -[LPWebLinkPresentationProperties setStyle:](v13, "setStyle:", a3);
    v15 = objc_alloc_init(LPCaptionBarPresentationProperties);
    -[LPWebLinkPresentationProperties setCaptionBar:](v14, "setCaptionBar:", v15);

    objc_msgSend(v12, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPWebLinkPresentationProperties captionBar](v14, "captionBar");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setLeadingIcon:", v16);

    if ((unint64_t)objc_msgSend(v12, "count") >= 2)
    {
      objc_msgSend(v12, "subarrayWithRange:", 1, objc_msgSend(v12, "count") - 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPWebLinkPresentationProperties captionBar](v14, "captionBar");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setAdditionalLeadingIcons:", v18);

    }
    -[LPWebLinkPresentationProperties captionBar](v14, "captionBar");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "top");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "leading");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setText:", v10);

    -[LPWebLinkPresentationProperties captionBar](v14, "captionBar");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bottom");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "leading");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAttributedText:", v11);

    v26 = v14;
  }

  return v14;
}

@end
