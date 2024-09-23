@implementation CKPassMediaObject

- (CKPassMediaObject)initWithTransfer:(id)a3 context:(id)a4 forceInlinePreview:(BOOL)a5
{
  CKPassMediaObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKPassMediaObject;
  v5 = -[CKMediaObject initWithTransfer:context:forceInlinePreview:](&v10, sel_initWithTransfer_context_forceInlinePreview_, a3, a4, a5);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v8 = -[CKPassMediaObject icon](v5, "icon");
  }
  return v5;
}

- (id)title
{
  void *v4;
  void *v5;
  objc_super v6;

  if (-[CKMediaObject transcoderPreviewGenerationFailed](self, "transcoderPreviewGenerationFailed"))
  {
    v6.receiver = self;
    v6.super_class = (Class)CKPassMediaObject;
    -[CKMediaObject title](&v6, sel_title);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CKPassbookMediaObject pass](self, "pass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKPassKitHelper localizedNameForPass:](CKPassKitHelper, "localizedNameForPass:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
}

- (id)subtitle
{
  void *v4;
  void *v5;
  objc_super v6;

  if (-[CKMediaObject transcoderPreviewGenerationFailed](self, "transcoderPreviewGenerationFailed"))
  {
    v6.receiver = self;
    v6.super_class = (Class)CKPassMediaObject;
    -[CKMediaObject subtitle](&v6, sel_subtitle);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CKPassbookMediaObject pass](self, "pass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKPassKitHelper organizationNameForPass:](CKPassKitHelper, "organizationNameForPass:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
}

- (UIImage)icon
{
  UIImage *v3;
  UIImage *icon;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat width;
  CGFloat height;
  UIImage *v22;
  UIImage *v23;
  objc_super v25;
  CGSize v26;

  if (-[CKMediaObject transcoderPreviewGenerationFailed](self, "transcoderPreviewGenerationFailed"))
  {
    v25.receiver = self;
    v25.super_class = (Class)CKPassMediaObject;
    -[CKMediaObject icon](&v25, sel_icon);
    v3 = (UIImage *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    icon = self->_icon;
    if (!icon)
    {
      -[CKPassbookMediaObject pass](self, "pass");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKPassKitHelper mailAttachmentIconForPass:](CKPassKitHelper, "mailAttachmentIconForPass:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v7 = *MEMORY[0x1E0C9D648];
        v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "genericDocumentIcon");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "size");
        v12 = v11;
        v14 = v13;

        objc_msgSend(v6, "size");
        v17 = v12 / v15;
        v18 = 0.0;
        if (v15 == 0.0)
          v17 = 0.0;
        if (v16 != 0.0)
          v18 = v14 / v16;
        v19 = fmax(v17, v18);
        v26.width = v15 * v19;
        width = v26.width;
        v26.height = v16 * v19;
        height = v26.height;
        UIGraphicsBeginImageContextWithOptions(v26, 0, 0.0);
        objc_msgSend(v6, "drawInRect:", v7, v8, width, height);
        UIGraphicsGetImageFromCurrentImageContext();
        v22 = (UIImage *)objc_claimAutoreleasedReturnValue();
        v23 = self->_icon;
        self->_icon = v22;

        UIGraphicsEndImageContext();
      }

      icon = self->_icon;
    }
    v3 = icon;
  }
  return v3;
}

- (id)generateThumbnailFillToSize:(CGSize)a3 contentAlignmentInsets:(UIEdgeInsets)a4
{
  double height;
  double width;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  id v19;
  id v20;

  height = a3.height;
  width = a3.width;
  if (-[CKMediaObject transcoderPreviewGenerationFailed](self, "transcoderPreviewGenerationFailed", a3.width, a3.height, a4.top, a4.left, a4.bottom, a4.right))
  {
    _IMWarn();
    v7 = 0;
  }
  else
  {
    -[CKPassMediaObject passView](self, "passView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "snapshotOfFrontFace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "size");
    v12 = width / v11;
    v13 = v11 == 0.0;
    v14 = 0.0;
    if (v13)
      v12 = 0.0;
    if (v10 != 0.0)
      v14 = height / v10;
    v15 = fmax(v12, v14);
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "scale");
    v18 = v17 / v15;

    v19 = objc_alloc(MEMORY[0x1E0CEA638]);
    v20 = objc_retainAutorelease(v9);
    v7 = (void *)objc_msgSend(v19, "initWithCGImage:scale:orientation:", objc_msgSend(v20, "CGImage"), 0, v18);

  }
  return v7;
}

- (id)passView
{
  void *v3;
  void *v4;
  void *v5;

  if (-[CKMediaObject transcoderPreviewGenerationFailed](self, "transcoderPreviewGenerationFailed"))
  {
    _IMWarn();
    v3 = 0;
  }
  else
  {
    if (passView_onceToken != -1)
      dispatch_once(&passView_onceToken, &__block_literal_global_131);
    -[CKPassbookMediaObject pass](self, "pass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKPassKitHelper passViewForPass:content:](CKPassKitHelper, "passViewForPass:content:", v4, 5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setSuppressedContent:", 6);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBackgroundColor:", v5);

  }
  return v3;
}

uint64_t __29__CKPassMediaObject_passView__block_invoke()
{
  uint64_t result;

  result = MEMORY[0x193FF3C18](CFSTR("PKPassView"), CFSTR("PassKitUI"));
  sPKPassViewClass = result;
  return result;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
}

@end
