@implementation CPMessageListItemTrailingConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPMessageListItemTrailingConfiguration)initWithCoder:(id)a3
{
  id v4;
  CPMessageListItemTrailingConfiguration *v5;
  uint64_t v6;
  CPImageSet *trailingImageSet;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPMessageListItemTrailingConfiguration;
  v5 = -[CPMessageListItemTrailingConfiguration init](&v9, sel_init);
  if (v5)
  {
    v5->_trailingItem = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kCPMessageListItemTrailingConfigurationItemKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPMessageListItemTrailingConfigurationImageSetKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    trailingImageSet = v5->_trailingImageSet;
    v5->_trailingImageSet = (CPImageSet *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[CPMessageListItemTrailingConfiguration trailingItem](self, "trailingItem"), CFSTR("kCPMessageListItemTrailingConfigurationItemKey"));
  -[CPMessageListItemTrailingConfiguration trailingImageSet](self, "trailingImageSet");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kCPMessageListItemTrailingConfigurationImageSetKey"));

}

- (CPMessageListItemTrailingConfiguration)initWithTrailingItem:(CPMessageTrailingItem)trailingItem trailingImage:(UIImage *)trailingImage
{
  UIImage *v6;
  CPMessageListItemTrailingConfiguration *v7;
  CPMessageListItemTrailingConfiguration *v8;
  CPImageSet *v9;
  CPImageSet *trailingImageSet;
  objc_super v12;

  v6 = trailingImage;
  v12.receiver = self;
  v12.super_class = (Class)CPMessageListItemTrailingConfiguration;
  v7 = -[CPMessageListItemTrailingConfiguration init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_trailingItem = trailingItem;
    if (v6)
    {
      v9 = -[CPImageSet initWithImage:treatmentBlock:]([CPImageSet alloc], "initWithImage:treatmentBlock:", v6, &__block_literal_global_65_0);
      trailingImageSet = v8->_trailingImageSet;
      v8->_trailingImageSet = v9;

    }
  }

  return v8;
}

id __77__CPMessageListItemTrailingConfiguration_initWithTrailingItem_trailingImage___block_invoke(uint64_t a1, void *a2)
{
  return CPImageByScalingImageToSize(a2, 30.0, 30.0);
}

- (UIImage)trailingImage
{
  void *v2;
  void *v3;

  -[CPMessageListItemTrailingConfiguration trailingImageSet](self, "trailingImageSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (CPMessageTrailingItem)trailingItem
{
  return self->_trailingItem;
}

- (CPImageSet)trailingImageSet
{
  return self->_trailingImageSet;
}

- (void)setTrailingImageSet:(id)a3
{
  objc_storeStrong((id *)&self->_trailingImageSet, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingImageSet, 0);
}

@end
