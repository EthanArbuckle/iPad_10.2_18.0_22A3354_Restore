@implementation ASVBadgeDescription

+ (id)descriptionForSize:(CGSize)a3
{
  double height;
  double width;
  ASVBadgeDescription *v5;
  double v6;

  height = a3.height;
  width = a3.width;
  v5 = [ASVBadgeDescription alloc];
  if (width >= height)
    v6 = height;
  else
    v6 = width;
  return -[ASVBadgeDescription initWithSizeClass:](v5, "initWithSizeClass:", v6 >= 280.0);
}

- (ASVBadgeDescription)initWithSizeClass:(unint64_t)a3
{
  ASVBadgeDescription *v4;
  ASVBadgeDescription *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  UIImage *badgeImage;
  double v10;
  uint64_t v11;
  double v12;
  void *v13;
  uint64_t v14;
  ASVBadgeDescription *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)ASVBadgeDescription;
  v4 = -[ASVBadgeDescription init](&v17, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_badgeSizeClass = a3;
    if (a3 == 1)
    {
      v13 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AssetViewer"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "imageNamed:inBundle:", CFSTR("Badge-Large"), v7);
      v14 = objc_claimAutoreleasedReturnValue();
      badgeImage = v5->_badgeImage;
      v5->_badgeImage = (UIImage *)v14;
      v12 = 20.0;
      v10 = 16.0;
      v11 = 0x4051800000000000;
    }
    else
    {
      if (a3)
      {
LABEL_7:
        v15 = v5;
        goto LABEL_8;
      }
      v6 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AssetViewer"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "imageNamed:inBundle:", CFSTR("Badge-Small"), v7);
      v8 = objc_claimAutoreleasedReturnValue();
      badgeImage = v5->_badgeImage;
      v5->_badgeImage = (UIImage *)v8;
      v10 = 8.0;
      v11 = 0x4041800000000000;
      v12 = 8.0;
    }

    v5->_shadowSize = v10;
    *(_QWORD *)&v5->_badgeSize.width = v11;
    *(_QWORD *)&v5->_badgeSize.height = v11;
    v5->_badgeOffset.x = v12;
    v5->_badgeOffset.y = v12;
    goto LABEL_7;
  }
LABEL_8:

  return v5;
}

- (CGSize)badgeSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_badgeSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)shadowSize
{
  return self->_shadowSize;
}

- (CGPoint)badgeOffset
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_badgeOffset, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (unint64_t)badgeSizeClass
{
  return self->_badgeSizeClass;
}

- (UIImage)badgeImage
{
  return (UIImage *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeImage, 0);
}

@end
