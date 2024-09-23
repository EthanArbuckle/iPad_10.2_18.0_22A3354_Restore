@implementation PHRecentsItem

- (PHRecentsItem)initWithItem:(id)a3
{
  id v4;
  PHRecentsItem *v5;
  uint64_t v6;
  UIImage *image;
  void *v8;
  NSString *v9;
  NSString *localizedCount;
  void *v11;
  NSString *v12;
  NSString *localizedSubtitle;
  void *v14;
  NSString *v15;
  NSString *localizedTitle;
  void *v17;
  NSString *v18;
  NSString *localizedValidHandlesTitle;
  void *v20;
  NSString *v21;
  NSString *localizedSenderIdentityTitle;
  uint64_t v23;
  NSDate *date;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PHRecentsItem;
  v5 = -[PHRecentsItem init](&v26, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "image"));
    image = v5->_image;
    v5->_image = (UIImage *)v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedCount"));
    v9 = (NSString *)objc_msgSend(v8, "copy");
    localizedCount = v5->_localizedCount;
    v5->_localizedCount = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedSubtitle"));
    v12 = (NSString *)objc_msgSend(v11, "copy");
    localizedSubtitle = v5->_localizedSubtitle;
    v5->_localizedSubtitle = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedTitle"));
    v15 = (NSString *)objc_msgSend(v14, "copy");
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedValidHandlesTitle"));
    v18 = (NSString *)objc_msgSend(v17, "copy");
    localizedValidHandlesTitle = v5->_localizedValidHandlesTitle;
    v5->_localizedValidHandlesTitle = v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedSenderIdentityTitle"));
    v21 = (NSString *)objc_msgSend(v20, "copy");
    localizedSenderIdentityTitle = v5->_localizedSenderIdentityTitle;
    v5->_localizedSenderIdentityTitle = v21;

    v5->_verified = objc_msgSend(v4, "verified");
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "date"));
    date = v5->_date;
    v5->_date = (NSDate *)v23;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  UIImage *image;
  id v5;
  NSString *v6;
  void *v7;
  NSString *localizedCount;
  NSString *v9;
  void *v10;
  NSString *localizedSubtitle;
  NSString *v12;
  void *v13;
  NSString *localizedTitle;
  NSString *v15;
  void *v16;
  NSString *localizedValidHandlesTitle;
  NSString *v18;
  void *v19;
  NSDate *date;
  NSString *v21;
  void *v22;
  NSString *localizedSenderIdentityTitle;
  NSString *v24;
  void *v25;
  _BOOL8 verified;
  NSString *v27;
  id v28;

  image = self->_image;
  v5 = a3;
  v6 = NSStringFromSelector("image");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v5, "encodeObject:forKey:", image, v7);

  localizedCount = self->_localizedCount;
  v9 = NSStringFromSelector("localizedCount");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v5, "encodeObject:forKey:", localizedCount, v10);

  localizedSubtitle = self->_localizedSubtitle;
  v12 = NSStringFromSelector("localizedSubtitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v5, "encodeObject:forKey:", localizedSubtitle, v13);

  localizedTitle = self->_localizedTitle;
  v15 = NSStringFromSelector("localizedTitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  objc_msgSend(v5, "encodeObject:forKey:", localizedTitle, v16);

  localizedValidHandlesTitle = self->_localizedValidHandlesTitle;
  v18 = NSStringFromSelector("localizedValidHandlesTitle");
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  objc_msgSend(v5, "encodeObject:forKey:", localizedValidHandlesTitle, v19);

  date = self->_date;
  v21 = NSStringFromSelector("date");
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  objc_msgSend(v5, "encodeObject:forKey:", date, v22);

  localizedSenderIdentityTitle = self->_localizedSenderIdentityTitle;
  v24 = NSStringFromSelector("localizedSenderIdentityTitle");
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  objc_msgSend(v5, "encodeObject:forKey:", localizedSenderIdentityTitle, v25);

  verified = self->_verified;
  v27 = NSStringFromSelector("verified");
  v28 = (id)objc_claimAutoreleasedReturnValue(v27);
  objc_msgSend(v5, "encodeBool:forKey:", verified, v28);

}

- (PHRecentsItem)initWithCoder:(id)a3
{
  id v4;
  PHRecentsItem *v5;
  uint64_t v6;
  NSString *v7;
  void *v8;
  uint64_t v9;
  UIImage *image;
  uint64_t v11;
  NSString *v12;
  void *v13;
  uint64_t v14;
  NSString *localizedCount;
  uint64_t v16;
  NSString *v17;
  void *v18;
  uint64_t v19;
  NSString *localizedSubtitle;
  uint64_t v21;
  NSString *v22;
  void *v23;
  uint64_t v24;
  NSString *localizedTitle;
  uint64_t v26;
  NSString *v27;
  void *v28;
  uint64_t v29;
  NSString *localizedValidHandlesTitle;
  uint64_t v31;
  NSString *v32;
  void *v33;
  uint64_t v34;
  NSDate *date;
  uint64_t v36;
  NSString *v37;
  void *v38;
  uint64_t v39;
  NSString *localizedSenderIdentityTitle;
  NSString *v41;
  void *v42;
  objc_super v44;

  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)PHRecentsItem;
  v5 = -[PHRecentsItem init](&v44, "init");
  if (v5)
  {
    v6 = objc_opt_class(UIImage);
    v7 = NSStringFromSelector("image");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v8));
    image = v5->_image;
    v5->_image = (UIImage *)v9;

    v11 = objc_opt_class(NSString);
    v12 = NSStringFromSelector("localizedCount");
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, v13));
    localizedCount = v5->_localizedCount;
    v5->_localizedCount = (NSString *)v14;

    v16 = objc_opt_class(NSString);
    v17 = NSStringFromSelector("localizedSubtitle");
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v16, v18));
    localizedSubtitle = v5->_localizedSubtitle;
    v5->_localizedSubtitle = (NSString *)v19;

    v21 = objc_opt_class(NSString);
    v22 = NSStringFromSelector("localizedTitle");
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v21, v23));
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v24;

    v26 = objc_opt_class(NSString);
    v27 = NSStringFromSelector("localizedValidHandlesTitle");
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v26, v28));
    localizedValidHandlesTitle = v5->_localizedValidHandlesTitle;
    v5->_localizedValidHandlesTitle = (NSString *)v29;

    v31 = objc_opt_class(NSDate);
    v32 = NSStringFromSelector("date");
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v31, v33));
    date = v5->_date;
    v5->_date = (NSDate *)v34;

    v36 = objc_opt_class(NSString);
    v37 = NSStringFromSelector("localizedSenderIdentityTitle");
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v36, v38));
    localizedSenderIdentityTitle = v5->_localizedSenderIdentityTitle;
    v5->_localizedSenderIdentityTitle = (NSString *)v39;

    v41 = NSStringFromSelector("verified");
    v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
    v5->_verified = objc_msgSend(v4, "decodeBoolForKey:", v42);

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PHRecentsItem initWithItem:](+[PHRecentsItem allocWithZone:](PHRecentsItem, "allocWithZone:", a3), "initWithItem:", self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[PHRecentsItem initWithItem:](+[PHMutableRecentsItem allocWithZone:](PHMutableRecentsItem, "allocWithZone:", a3), "initWithItem:", self);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (NSString)localizedCount
{
  return self->_localizedCount;
}

- (void)setLocalizedCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (void)setLocalizedSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)localizedValidHandlesTitle
{
  return self->_localizedValidHandlesTitle;
}

- (void)setLocalizedValidHandlesTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)localizedSenderIdentityTitle
{
  return self->_localizedSenderIdentityTitle;
}

- (void)setLocalizedSenderIdentityTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)verified
{
  return self->_verified;
}

- (void)setVerified:(BOOL)a3
{
  self->_verified = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_localizedSenderIdentityTitle, 0);
  objc_storeStrong((id *)&self->_localizedValidHandlesTitle, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_localizedCount, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
