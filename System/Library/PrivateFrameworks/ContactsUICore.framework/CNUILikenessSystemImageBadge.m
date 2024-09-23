@implementation CNUILikenessSystemImageBadge

- (CNUILikenessSystemImageBadge)initWithSystemImageNamed:(id)a3
{
  id v4;
  CNUILikenessSystemImageBadge *v5;
  CNUILikenessSystemImageBadge *v6;
  NSData *imageData;
  uint64_t v8;
  UIImage *image;
  CNUILikenessSystemImageBadge *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNUILikenessSystemImageBadge;
  v5 = -[CNUILikenessSystemImageBadge init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_badgeType = 0;
    imageData = v5->_imageData;
    v5->_imageData = 0;

    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    image = v6->_image;
    v6->_image = (UIImage *)v8;

    v10 = v6;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  CNUILikenessSystemImageBadge *v4;
  NSData *imageData;
  UIImage *image;
  BOOL v7;

  v4 = (CNUILikenessSystemImageBadge *)a3;
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
