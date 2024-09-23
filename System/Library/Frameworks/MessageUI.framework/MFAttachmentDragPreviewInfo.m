@implementation MFAttachmentDragPreviewInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MFAttachmentDragPreviewInfo image](self, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("imageData"));

  objc_msgSend(v5, "encodeBool:forKey:", -[MFAttachmentDragPreviewInfo isInlineImage](self, "isInlineImage"), CFSTR("inlineImage"));
  -[MFAttachmentDragPreviewInfo center](self, "center");
  objc_msgSend(v5, "encodeCGPoint:forKey:", CFSTR("center"));
  -[MFAttachmentDragPreviewInfo displaySize](self, "displaySize");
  objc_msgSend(v5, "encodeCGSize:forKey:", CFSTR("displaySize"));

}

- (MFAttachmentDragPreviewInfo)initWithCoder:(id)a3
{
  id v4;
  MFAttachmentDragPreviewInfo *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MFAttachmentDragPreviewInfo;
  v5 = -[MFAttachmentDragPreviewInfo init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageData"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAttachmentDragPreviewInfo setImage:](v5, "setImage:", v6);

    -[MFAttachmentDragPreviewInfo setIsInlineImage:](v5, "setIsInlineImage:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("inlineImage")));
    objc_msgSend(v4, "decodeCGPointForKey:", CFSTR("center"));
    -[MFAttachmentDragPreviewInfo setCenter:](v5, "setCenter:");
    objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("displaySize"));
    -[MFAttachmentDragPreviewInfo setDisplaySize:](v5, "setDisplaySize:");
  }

  return v5;
}

- (id)targetedDragPreviewInContainer:(id)a3 centerOffset:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v29[2];
  CGRect v30;
  CGRect v31;

  y = a4.y;
  x = a4.x;
  v29[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[MFAttachmentDragPreviewInfo center](self, "center");
  v9 = v8;
  -[MFAttachmentDragPreviewInfo center](self, "center");
  v11 = v10;
  v12 = objc_alloc(MEMORY[0x1E0DC3890]);
  -[MFAttachmentDragPreviewInfo image](self, "image");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithImage:", v13);

  -[MFAttachmentDragPreviewInfo displaySize](self, "displaySize");
  if (v16 != *MEMORY[0x1E0C9D820] || v15 != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    -[MFAttachmentDragPreviewInfo displaySize](self, "displaySize");
    v19 = v18;
    -[MFAttachmentDragPreviewInfo displaySize](self, "displaySize");
    objc_msgSend(v14, "setFrame:", 0.0, 0.0, v19, v20);
  }
  if (-[MFAttachmentDragPreviewInfo isInlineImage](self, "isInlineImage"))
  {
    objc_msgSend(v14, "frame");
    v31 = CGRectInset(v30, 0.0, 1.0);
    objc_msgSend(v14, "setFrame:", v31.origin.x, v31.origin.y, v31.size.width, v31.size.height);
    objc_msgSend(v14, "setContentMode:", 2);
    v21 = objc_alloc_init(MEMORY[0x1E0DC3768]);
  }
  else
  {
    v22 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(v14, "frame");
    objc_msgSend(v22, "valueWithCGRect:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_alloc(MEMORY[0x1E0DC3768]);
    v29[0] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (id)objc_msgSend(v24, "initWithTextLineRects:", v25);

  }
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3770]), "initWithContainer:center:", v7, x + v9, y + v11);
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D88]), "initWithView:parameters:target:", v14, v21, v26);

  return v27;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (BOOL)isInlineImage
{
  return self->_isInlineImage;
}

- (void)setIsInlineImage:(BOOL)a3
{
  self->_isInlineImage = a3;
}

- (CGPoint)center
{
  double x;
  double y;
  CGPoint result;

  x = self->_center.x;
  y = self->_center.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  self->_center = a3;
}

- (CGSize)displaySize
{
  double width;
  double height;
  CGSize result;

  width = self->_displaySize.width;
  height = self->_displaySize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setDisplaySize:(CGSize)a3
{
  self->_displaySize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

@end
