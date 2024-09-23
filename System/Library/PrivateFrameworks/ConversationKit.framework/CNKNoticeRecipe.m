@implementation CNKNoticeRecipe

- (CNKNoticeRecipe)initWithTitle:(id)a3 subtitle:(id)a4 image:(id)a5 primaryActionTitle:(id)a6 secondaryActionTitle:(id)a7 type:(int64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  CNKNoticeRecipe *v18;
  CNKNoticeRecipe *v19;
  uint64_t v20;
  NSUUID *uuid;
  id v24;
  objc_super v25;

  v24 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)CNKNoticeRecipe;
  v18 = -[CNKNoticeRecipe init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_title, a3);
    objc_storeStrong((id *)&v19->_subtitle, a4);
    objc_storeStrong((id *)&v19->_image, a5);
    objc_storeStrong((id *)&v19->_primaryActionTitle, a6);
    objc_storeStrong((id *)&v19->_secondaryActionTitle, a7);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v20 = objc_claimAutoreleasedReturnValue();
    uuid = v19->_uuid;
    v19->_uuid = (NSUUID *)v20;

    v19->_type = a8;
  }

  return v19;
}

- (CNKNoticeRecipe)initWithCoder:(id)a3
{
  id v4;
  CNKNoticeRecipe *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *title;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSString *subtitle;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  NSUUID *uuid;
  uint64_t v21;
  UIImage *image;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSString *primaryActionTitle;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSString *secondaryActionTitle;
  void *v31;
  CNKNoticeRecipe *v32;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)CNKNoticeRecipe;
  v5 = -[CNKNoticeRecipe init](&v34, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_title);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_subtitle);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v12;

    v14 = objc_opt_class();
    NSStringFromSelector(sel_image);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      goto LABEL_9;
    v17 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuidString"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "initWithUUIDString:", v18);
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v19;

    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithData:", v16);
    image = v5->_image;
    v5->_image = (UIImage *)v21;

    v23 = objc_opt_class();
    NSStringFromSelector(sel_primaryActionTitle);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v23, v24);
    v25 = objc_claimAutoreleasedReturnValue();
    primaryActionTitle = v5->_primaryActionTitle;
    v5->_primaryActionTitle = (NSString *)v25;

    v27 = objc_opt_class();
    NSStringFromSelector(sel_secondaryActionTitle);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v27, v28);
    v29 = objc_claimAutoreleasedReturnValue();
    secondaryActionTitle = v5->_secondaryActionTitle;
    v5->_secondaryActionTitle = (NSString *)v29;

    NSStringFromSelector(sel_type);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", v31);

    if (!v5->_title || !v5->_subtitle || !v5->_uuid || !v5->_image)
    {
LABEL_9:

      v32 = 0;
      goto LABEL_10;
    }

  }
  v32 = v5;
LABEL_10:

  return v32;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  id v5;
  void *v6;
  NSString *subtitle;
  void *v8;
  NSString *primaryActionTitle;
  void *v10;
  NSString *secondaryActionTitle;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int64_t type;
  id v17;

  title = self->_title;
  v5 = a3;
  NSStringFromSelector(sel_title);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", title, v6);

  subtitle = self->_subtitle;
  NSStringFromSelector(sel_subtitle);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", subtitle, v8);

  primaryActionTitle = self->_primaryActionTitle;
  NSStringFromSelector(sel_primaryActionTitle);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", primaryActionTitle, v10);

  secondaryActionTitle = self->_secondaryActionTitle;
  NSStringFromSelector(sel_secondaryActionTitle);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", secondaryActionTitle, v12);

  -[NSUUID UUIDString](self->_uuid, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v13, CFSTR("uuidString"));

  UIImagePNGRepresentation(self->_image);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_image);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v14, v15);

  type = self->_type;
  NSStringFromSelector(sel_type);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", type, v17);

}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)primaryActionTitle
{
  return self->_primaryActionTitle;
}

- (NSString)secondaryActionTitle
{
  return self->_secondaryActionTitle;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_secondaryActionTitle, 0);
  objc_storeStrong((id *)&self->_primaryActionTitle, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
