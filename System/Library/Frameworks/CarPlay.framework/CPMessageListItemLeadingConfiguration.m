@implementation CPMessageListItemLeadingConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPMessageListItemLeadingConfiguration)initWithCoder:(id)a3
{
  id v4;
  CPMessageListItemLeadingConfiguration *v5;
  uint64_t v6;
  CPImageSet *leadingImageSet;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPMessageListItemLeadingConfiguration;
  v5 = -[CPMessageListItemLeadingConfiguration init](&v9, sel_init);
  if (v5)
  {
    v5->_unread = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kCPMessageListItemLeadingConfigurationUnreadKey"));
    v5->_leadingItem = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kCPMessageListItemLeadingConfigurationItemKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPMessageListItemLeadingConfigurationImageSetKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    leadingImageSet = v5->_leadingImageSet;
    v5->_leadingImageSet = (CPImageSet *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[CPMessageListItemLeadingConfiguration isUnread](self, "isUnread"), CFSTR("kCPMessageListItemLeadingConfigurationUnreadKey"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[CPMessageListItemLeadingConfiguration leadingItem](self, "leadingItem"), CFSTR("kCPMessageListItemLeadingConfigurationItemKey"));
  -[CPMessageListItemLeadingConfiguration leadingImageSet](self, "leadingImageSet");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kCPMessageListItemLeadingConfigurationImageSetKey"));

}

- (CPMessageListItemLeadingConfiguration)initWithLeadingItem:(CPMessageLeadingItem)leadingItem leadingImage:(UIImage *)leadingImage unread:(BOOL)unread
{
  UIImage *v8;
  CPMessageListItemLeadingConfiguration *v9;
  CPMessageListItemLeadingConfiguration *v10;
  CPImageSet *v11;
  CPImageSet *leadingImageSet;
  objc_super v14;

  v8 = leadingImage;
  v14.receiver = self;
  v14.super_class = (Class)CPMessageListItemLeadingConfiguration;
  v9 = -[CPMessageListItemLeadingConfiguration init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_unread = unread;
    v9->_leadingItem = leadingItem;
    if (v8)
    {
      v11 = -[CPImageSet initWithImage:treatmentBlock:]([CPImageSet alloc], "initWithImage:treatmentBlock:", v8, &__block_literal_global_22);
      leadingImageSet = v10->_leadingImageSet;
      v10->_leadingImageSet = v11;

    }
  }

  return v10;
}

id __81__CPMessageListItemLeadingConfiguration_initWithLeadingItem_leadingImage_unread___block_invoke(uint64_t a1, void *a2)
{
  return CPImageByScalingImageToSize(a2, 30.0, 30.0);
}

- (UIImage)leadingImage
{
  void *v2;
  void *v3;

  -[CPMessageListItemLeadingConfiguration leadingImageSet](self, "leadingImageSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (BOOL)isUnread
{
  return self->_unread;
}

- (CPMessageLeadingItem)leadingItem
{
  return self->_leadingItem;
}

- (CPImageSet)leadingImageSet
{
  return self->_leadingImageSet;
}

- (void)setLeadingImageSet:(id)a3
{
  objc_storeStrong((id *)&self->_leadingImageSet, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leadingImageSet, 0);
}

@end
