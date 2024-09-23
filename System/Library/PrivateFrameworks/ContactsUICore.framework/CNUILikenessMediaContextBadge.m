@implementation CNUILikenessMediaContextBadge

- (CNUILikenessMediaContextBadge)initWithImageData:(id)a3
{
  id v5;
  CNUILikenessMediaContextBadge *v6;
  CNUILikenessMediaContextBadge *v7;
  UIImage *image;
  CNUILikenessMediaContextBadge *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNUILikenessMediaContextBadge;
  v6 = -[CNUILikenessMediaContextBadge init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_imageData, a3);
    image = v7->_image;
    v7->_image = 0;

    v7->_badgeType = 2;
    v9 = v7;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  CNUILikenessMediaContextBadge *v4;
  NSData *imageData;
  UIImage *image;
  BOOL v7;

  v4 = (CNUILikenessMediaContextBadge *)a3;
  v7 = 1;
  if (self != v4)
  {
    if ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (imageData = self->_imageData, (unint64_t)imageData | (unint64_t)v4->_imageData)
      && !-[NSData isEqual:](imageData, "isEqual:")
      || (image = self->_image, (unint64_t)image | (unint64_t)v4->_image)
      && !-[UIImage isEqual:](image, "isEqual:"))
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", self->_imageData);
  return objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", self->_image) - v3 + 32 * v3 + 16337;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (UIImage)image
{
  return self->_image;
}

- (unint64_t)badgeType
{
  return self->_badgeType;
}

- (void)setBadgeType:(unint64_t)a3
{
  self->_badgeType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
}

@end
