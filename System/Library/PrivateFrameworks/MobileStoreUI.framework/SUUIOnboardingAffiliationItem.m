@implementation SUUIOnboardingAffiliationItem

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setFillColor:", self->_fillColor);
  objc_msgSend(v4, "setIdentifier:", self->_identifier);
  objc_msgSend(v4, "setImageName:", self->_imageName);
  objc_msgSend(v4, "setImageTreatment:", self->_imageTreatment);
  objc_msgSend(v4, "setImageURL:", self->_imageURL);
  objc_msgSend(v4, "setTitle:", self->_title);
  objc_msgSend(v4, "setUserAffinityCount:", self->_userAffinityCount);
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)SUUIOnboardingAffiliationItem;
  -[SUUIOnboardingAffiliationItem description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: [%@, %@]"), v4, self->_identifier, self->_title);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    -[SUUIOnboardingAffiliationItem identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqualToString:", v8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (void)setFillColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)imageTreatment
{
  return self->_imageTreatment;
}

- (void)setImageTreatment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)userAffinityCount
{
  return self->_userAffinityCount;
}

- (void)setUserAffinityCount:(int64_t)a3
{
  self->_userAffinityCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_imageTreatment, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
}

@end
