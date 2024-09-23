@implementation SLSheetImagePreviewView

- (SLSheetImagePreviewView)initWithFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SLSheetImagePreviewView;
  return -[SLSheetImagePreviewView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

+ (id)fallbackPreviewImage
{
  void *v2;
  CGContext *CurrentContext;
  id v4;
  uint64_t v5;
  void *v6;
  CGSize v8;
  CGRect v9;

  v2 = (void *)fallbackPreviewImage___fallbackPreviewImage;
  if (!fallbackPreviewImage___fallbackPreviewImage)
  {
    v8.width = 100.0;
    v8.height = 100.0;
    UIGraphicsBeginImageContext(v8);
    CurrentContext = UIGraphicsGetCurrentContext();
    UIGraphicsPushContext(CurrentContext);
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.87, 1.0);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v4, "CGColor"));

    v9.origin.x = 0.0;
    v9.origin.y = 0.0;
    v9.size.width = 100.0;
    v9.size.height = 100.0;
    CGContextFillRect(CurrentContext, v9);
    UIGraphicsPopContext();
    UIGraphicsGetImageFromCurrentImageContext();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)fallbackPreviewImage___fallbackPreviewImage;
    fallbackPreviewImage___fallbackPreviewImage = v5;

    UIGraphicsEndImageContext();
    v2 = (void *)fallbackPreviewImage___fallbackPreviewImage;
  }
  return v2;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_image, a3);
  v5 = a3;
  -[SLSheetImagePreviewView imageView](self, "imageView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v5);

}

- (BOOL)generatePreviewImageFromAttachments
{
  return 0;
}

- (CGSize)intrinsicContentSize
{
  uint64_t v2;
  void *v4;
  uint64_t v5;
  double v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  CGSize result;

  -[SLSheetImagePreviewView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "verticalSizeClass");

  if (v5 == 1)
  {
    v6 = 60.0;
  }
  else
  {
    -[SLSheetImagePreviewView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "horizontalSizeClass") == 1;

    v6 = dbl_1BCDBBD00[v8];
  }
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[SLSheetImagePreviewView traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v10, "horizontalSizeClass"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[SLSheetImagePreviewView traitCollection](self, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v13, "verticalSizeClass"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v2, 7, CFSTR("SLSheetImagePreviewView intrinsicContentSize horizontalSizeClass %@ verticalSizeClass %@"));

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", v6, v6, v11, v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v2, 7, CFSTR("SLSheetImagePreviewView intrinsicContentSize returning %@"));

  v14 = v6;
  v15 = v6;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  v5 = a3;
  _SLLog(v3, 7, CFSTR("SLSheetImagePreviewView traitCollectionDidChange:"));
  v11.receiver = self;
  v11.super_class = (Class)SLSheetImagePreviewView;
  -[SLSheetImagePreviewView traitCollectionDidChange:](&v11, sel_traitCollectionDidChange_, v5);
  -[SLSheetImagePreviewView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "horizontalSizeClass");
  if (v7 == objc_msgSend(v5, "horizontalSizeClass"))
  {
    -[SLSheetImagePreviewView traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "verticalSizeClass");
    v10 = objc_msgSend(v5, "verticalSizeClass");

    if (v9 == v10)
      goto LABEL_6;
  }
  else
  {

  }
  _SLLog(v3, 7, CFSTR("SLSheetImagePreviewView traitCollectionDidChange: now invalidatingIntrinsicContentSize"));
  -[SLSheetImagePreviewView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
LABEL_6:

}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (NSArray)principalAttachments
{
  return self->_principalAttachments;
}

- (void)setPrincipalAttachments:(id)a3
{
  objc_storeStrong((id *)&self->_principalAttachments, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_principalAttachments, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
