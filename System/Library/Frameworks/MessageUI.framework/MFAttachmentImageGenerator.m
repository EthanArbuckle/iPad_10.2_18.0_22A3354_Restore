@implementation MFAttachmentImageGenerator

- (MFAttachmentImageGenerator)initWithAttachment:(id)a3
{
  id v4;
  double v5;
  double v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  MFAttachmentImageGenerator *v29;
  uint64_t v30;
  NSString *displayString;
  double v32;
  objc_super v34;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultHeight");
  v6 = v5;
  v7 = objc_msgSend(v4, "isPass");
  if (!v7)
    goto LABEL_18;
  objc_msgSend(v4, "passWithError:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_18;
  v9 = (void *)objc_msgSend(objc_alloc((Class)getPKPassViewClass[0]()), "initWithPass:content:", v8, 5);
  objc_msgSend(v9, "setSuppressedContent:", 6);
  objc_msgSend(v9, "snapshotOfFrontFace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "size");
  v6 = v11;

  if (!v10)
  {
LABEL_18:
    objc_msgSend(v4, "contentTypeIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_6;
    v13 = objc_alloc_init(MEMORY[0x1E0D96D38]);
    objc_msgSend(v4, "fileName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setName:", v14);

    objc_msgSend(v13, "setUTI:", v12);
    objc_msgSend(v13, "icons");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
LABEL_6:
      v16 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "imageNamed:inBundle:", CFSTR("downloadinprogress"), v17);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  objc_msgSend(v10, "size");
  v19 = v18;
  v21 = v20;
  if (!sDownloadFont)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 12.0);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)sDownloadFont;
    sDownloadFont = v22;

  }
  objc_msgSend(v4, "fileName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "_legacy_sizeWithFont:forWidth:lineBreakMode:", sDownloadFont, 5, 150.0);
  v26 = v25;
  v28 = v27;
  if (v25 >= v19)
    v19 = v25;
  v34.receiver = self;
  v34.super_class = (Class)MFAttachmentImageGenerator;
  v29 = -[MFAttachmentImageGenerator initWithFrame:](&v34, sel_initWithFrame_, 0.0, 0.0, v19, v6);
  if (v29)
  {
    objc_msgSend(v4, "setImageDimensions:", v19, v6);
    v29->_textSize.width = v26;
    v29->_textSize.height = v28;
    v30 = objc_msgSend(v24, "copy");
    displayString = v29->_displayString;
    v29->_displayString = (NSString *)v30;

    objc_storeStrong((id *)&v29->_image, v10);
    v32 = 48.0;
    if (v7)
      v32 = v21;
    v29->_maxImageHeight = v32;
    -[MFAttachmentImageGenerator setOpaque:](v29, "setOpaque:", 0);
  }

  return v29;
}

+ (double)defaultHeight
{
  return 72.0;
}

+ (id)pngDataForAttachment:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAttachment:", v4);
  objc_msgSend(v5, "pngData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)imageForAttachment:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAttachment:", v4);
  objc_msgSend(v5, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (CGRect)imageRectForAttachment:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAttachment:", v4);
  objc_msgSend(v5, "imageRect");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)pngData
{
  CGFloat v3;
  CGFloat v4;
  void *v5;
  UIImage *v6;
  void *v7;
  CGSize v9;

  -[MFAttachmentImageGenerator bounds](self, "bounds");
  v9.width = v3;
  v9.height = v4;
  UIGraphicsBeginImageContextWithOptions(v9, 0, 0.0);
  -[MFAttachmentImageGenerator layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "renderInContext:", UIGraphicsGetCurrentContext());

  UIGraphicsGetImageFromCurrentImageContext();
  v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  UIImagePNGRepresentation(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)image
{
  return self->_image;
}

- (CGRect)imageRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double maxImageHeight;
  double v9;
  double v10;
  CGRect result;

  -[MFAttachmentImageGenerator bounds](self, "bounds");
  v4 = v3;
  -[UIImage size](self->_image, "size");
  v7 = v5;
  maxImageHeight = self->_maxImageHeight;
  if (v6 <= maxImageHeight)
    maxImageHeight = v6;
  else
    v7 = v5 * (maxImageHeight / v6);
  v9 = (v4 - v7) * 0.5;
  v10 = 5.0;
  result.size.height = maxImageHeight;
  result.size.width = v7;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;

  -[MFAttachmentImageGenerator bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  -[MFAttachmentImageGenerator imageRect](self, "imageRect");
  v7 = v6;
  v9 = v8;
  -[UIImage drawInRect:](self->_image, "drawInRect:");
  objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "set");

  -[NSString _legacy_drawAtPoint:forWidth:withFont:lineBreakMode:](self->_displayString, "_legacy_drawAtPoint:forWidth:withFont:lineBreakMode:", sDownloadFont, 5, (v5 - self->_textSize.width) * 0.5, v7 + v9 + 5.0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
}

@end
