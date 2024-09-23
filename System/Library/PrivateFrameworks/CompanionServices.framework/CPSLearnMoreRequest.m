@implementation CPSLearnMoreRequest

- (int64_t)authType
{
  return 13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *URL;
  id v5;

  URL = self->_URL;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", URL, CFSTR("URL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_image, CFSTR("image"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_titleText, CFSTR("titleText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subtitleText, CFSTR("subtitleText"));

}

- (CPSLearnMoreRequest)initWithCoder:(id)a3
{
  id v4;
  CPSLearnMoreRequest *v5;
  void *v6;
  uint64_t v7;
  NSURL *URL;
  void *v9;
  uint64_t v10;
  UIImage *image;
  void *v12;
  uint64_t v13;
  NSString *titleText;
  void *v15;
  uint64_t v16;
  NSString *subtitleText;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CPSLearnMoreRequest;
  v5 = -[CPSLearnMoreRequest init](&v19, sel_init);
  if (v5)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("URL"));
    v7 = objc_claimAutoreleasedReturnValue();
    URL = v5->_URL;
    v5->_URL = (NSURL *)v7;

    getUIImageClass();
    objc_opt_self();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("image"));
    v10 = objc_claimAutoreleasedReturnValue();
    image = v5->_image;
    v5->_image = (UIImage *)v10;

    objc_opt_self();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, CFSTR("titleText"));
    v13 = objc_claimAutoreleasedReturnValue();
    titleText = v5->_titleText;
    v5->_titleText = (NSString *)v13;

    objc_opt_self();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v15, CFSTR("subtitleText"));
    v16 = objc_claimAutoreleasedReturnValue();
    subtitleText = v5->_subtitleText;
    v5->_subtitleText = (NSString *)v16;

  }
  return v5;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
  objc_storeStrong((id *)&self->_titleText, a3);
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (void)setSubtitleText:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
