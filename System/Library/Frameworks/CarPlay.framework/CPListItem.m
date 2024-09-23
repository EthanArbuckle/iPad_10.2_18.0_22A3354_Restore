@implementation CPListItem

+ (CGSize)maximumImageSize
{
  int HasMapsEntitlement;
  double v3;
  double v4;
  CGSize result;

  HasMapsEntitlement = CPCurrentProcessHasMapsEntitlement();
  v3 = 44.0;
  if (HasMapsEntitlement)
    v3 = 30.0;
  v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPListItem)initWithText:(NSString *)text detailText:(NSString *)detailText
{
  NSString *v7;
  NSString *v8;
  CPListItem *v9;
  uint64_t v10;
  NSUUID *identifier;
  objc_super v13;

  v7 = text;
  v8 = detailText;
  v13.receiver = self;
  v13.super_class = (Class)CPListItem;
  v9 = -[CPListItem init](&v13, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v10 = objc_claimAutoreleasedReturnValue();
    identifier = v9->_identifier;
    v9->_identifier = (NSUUID *)v10;

    objc_storeStrong((id *)&v9->_text, text);
    objc_storeStrong((id *)&v9->_detailText, detailText);
    v9->_enabled = 1;
  }

  return v9;
}

- (CPListItem)initWithText:(NSString *)text detailText:(NSString *)detailText image:(UIImage *)image
{
  UIImage *v8;
  CPListItem *v9;
  CPListItem *v10;
  CPImageSet *v11;
  CPListItem *v12;
  uint64_t v13;
  CPImageSet *imageSet;
  _QWORD v16[4];
  CPListItem *v17;

  v8 = image;
  v9 = -[CPListItem initWithText:detailText:](self, "initWithText:detailText:", text, detailText);
  v10 = v9;
  if (v8 && v9)
  {
    v11 = [CPImageSet alloc];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __44__CPListItem_initWithText_detailText_image___block_invoke;
    v16[3] = &unk_24C77D488;
    v12 = v10;
    v17 = v12;
    v13 = -[CPImageSet initWithImage:treatmentBlock:](v11, "initWithImage:treatmentBlock:", v8, v16);
    imageSet = v12->_imageSet;
    v12->_imageSet = (CPImageSet *)v13;

  }
  return v10;
}

id __44__CPListItem_initWithText_detailText_image___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  double v4;
  void *v5;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "maximumImageSize");
  CPImageByScalingImageToSize(v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CPListItem)initWithText:(NSString *)text detailText:(NSString *)detailText image:(UIImage *)image accessoryImage:(UIImage *)accessoryImage accessoryType:(CPListItemAccessoryType)accessoryType
{
  UIImage *v12;
  CPListItem *v13;
  CPListItem *v14;
  CPImageSet *v15;
  CPListItem *v16;
  uint64_t v17;
  CPImageSet *accessoryImageSet;
  _QWORD v20[4];
  CPListItem *v21;

  v12 = accessoryImage;
  v13 = -[CPListItem initWithText:detailText:image:](self, "initWithText:detailText:image:", text, detailText, image);
  v14 = v13;
  if (v13)
  {
    if (v12)
    {
      v15 = [CPImageSet alloc];
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __73__CPListItem_initWithText_detailText_image_accessoryImage_accessoryType___block_invoke;
      v20[3] = &unk_24C77D488;
      v16 = v14;
      v21 = v16;
      v17 = -[CPImageSet initWithImage:treatmentBlock:](v15, "initWithImage:treatmentBlock:", v12, v20);
      accessoryImageSet = v16->_accessoryImageSet;
      v16->_accessoryImageSet = (CPImageSet *)v17;

      v16->_accessoryType = 0;
    }
    else
    {
      v13->_accessoryType = accessoryType;
    }
  }

  return v14;
}

id __73__CPListItem_initWithText_detailText_image_accessoryImage_accessoryType___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  double v4;
  void *v5;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "maximumImageSize");
  CPImageByScalingImageToSize(v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CPListItem)initWithText:(NSString *)text detailText:(NSString *)detailText image:(UIImage *)image showsDisclosureIndicator:(BOOL)showsDisclosureIndicator
{
  return -[CPListItem initWithText:detailText:image:accessoryImage:accessoryType:](self, "initWithText:detailText:image:accessoryImage:accessoryType:", text, detailText, image, 0, 1);
}

- (CPListItem)initWithCoder:(id)a3
{
  id v4;
  CPListItem *v5;
  uint64_t v6;
  NSString *text;
  uint64_t v8;
  NSUUID *identifier;
  uint64_t v10;
  NSString *detailText;
  uint64_t v12;
  CPImageSet *imageSet;
  uint64_t v14;
  CPImageSet *accessoryImageSet;
  float v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CPListItem;
  v5 = -[CPListItem init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPListItemTextKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPListItemIdentifierKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPListItemDetailTextKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    detailText = v5->_detailText;
    v5->_detailText = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPListItemImageKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    imageSet = v5->_imageSet;
    v5->_imageSet = (CPImageSet *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPListItemAccessoryImageSetKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    accessoryImageSet = v5->_accessoryImageSet;
    v5->_accessoryImageSet = (CPImageSet *)v14;

    v5->_explicitContent = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kCPListItemExplicitLabelKey"));
    v5->_accessoryType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kCPListItemAccessoryTypeKey"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("kCPListItemProgressBarKey"));
    v5->_playbackProgress = v16;
    v5->_playing = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kCPListItemPlayingKey"));
    v5->_playingIndicatorLocation = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kCPListItemPlayingIndicatorLocationKey"));
    v5->_enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kCPListItemEnabledKey"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  id v10;

  v10 = a3;
  -[CPListItem text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v4, CFSTR("kCPListItemTextKey"));

  -[CPListItem identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("kCPListItemIdentifierKey"));

  -[CPListItem detailText](self, "detailText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v6, CFSTR("kCPListItemDetailTextKey"));

  -[CPListItem imageSet](self, "imageSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("kCPListItemImageKey"));

  -[CPListItem accessoryImageSet](self, "accessoryImageSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("kCPListItemAccessoryImageSetKey"));

  objc_msgSend(v10, "encodeBool:forKey:", -[CPListItem isExplicitContent](self, "isExplicitContent"), CFSTR("kCPListItemExplicitLabelKey"));
  objc_msgSend(v10, "encodeInteger:forKey:", -[CPListItem accessoryType](self, "accessoryType"), CFSTR("kCPListItemAccessoryTypeKey"));
  -[CPListItem playbackProgress](self, "playbackProgress");
  *(float *)&v9 = v9;
  objc_msgSend(v10, "encodeFloat:forKey:", CFSTR("kCPListItemProgressBarKey"), v9);
  objc_msgSend(v10, "encodeBool:forKey:", -[CPListItem isPlaying](self, "isPlaying"), CFSTR("kCPListItemPlayingKey"));
  objc_msgSend(v10, "encodeInteger:forKey:", -[CPListItem playingIndicatorLocation](self, "playingIndicatorLocation"), CFSTR("kCPListItemPlayingIndicatorLocationKey"));
  objc_msgSend(v10, "encodeBool:forKey:", -[CPListItem isEnabled](self, "isEnabled"), CFSTR("kCPListItemEnabledKey"));

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *detailText;
  CPImageSet *imageSet;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v12.receiver = self;
  v12.super_class = (Class)CPListItem;
  -[CPListItem description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPListItem identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPListItem text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  detailText = self->_detailText;
  imageSet = self->_imageSet;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[CPListItem accessoryType](self, "accessoryType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: {identifier: %@, text: %@, detailText: %@, image: %@, accessory: %@}"), v4, v5, v6, detailText, imageSet, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (UIImage)image
{
  void *v2;
  void *v3;

  -[CPListItem imageSet](self, "imageSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (UIImage)accessoryImage
{
  void *v2;
  void *v3;

  -[CPListItem accessoryImageSet](self, "accessoryImageSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)setEnabled:(BOOL)enabled
{
  if (self->_enabled != enabled)
  {
    self->_enabled = enabled;
    -[CPListItem _setNeedsUpdate](self, "_setNeedsUpdate");
  }
}

- (void)setText:(NSString *)text
{
  NSString *v5;

  v5 = text;
  if (!-[NSString isEqualToString:](self->_text, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_text, text);
    -[CPListItem _setNeedsUpdate](self, "_setNeedsUpdate");
  }

}

- (void)_setNeedsUpdate
{
  id v3;

  -[CPListItem listTemplate](self, "listTemplate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setItemNeedsUpdate:", self);

}

- (void)setDetailText:(NSString *)detailText
{
  NSString *v5;

  v5 = detailText;
  if (!-[NSString isEqualToString:](self->_detailText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_detailText, detailText);
    -[CPListItem _setNeedsUpdate](self, "_setNeedsUpdate");
  }

}

- (void)setImage:(UIImage *)image
{
  UIImage *v4;
  CPImageSet *v5;
  CPImageSet *v6;
  CPImageSet *imageSet;
  _QWORD v8[5];

  v4 = image;
  if (v4)
  {
    v5 = [CPImageSet alloc];
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __23__CPListItem_setImage___block_invoke;
    v8[3] = &unk_24C77D488;
    v8[4] = self;
    v6 = -[CPImageSet initWithImage:treatmentBlock:](v5, "initWithImage:treatmentBlock:", v4, v8);
    imageSet = self->_imageSet;
    self->_imageSet = v6;
LABEL_5:

    -[CPListItem _setNeedsUpdate](self, "_setNeedsUpdate");
    goto LABEL_6;
  }
  imageSet = self->_imageSet;
  if (imageSet)
  {
    self->_imageSet = 0;
    goto LABEL_5;
  }
LABEL_6:

}

id __23__CPListItem_setImage___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  double v4;
  void *v5;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "maximumImageSize");
  CPImageByScalingImageToSize(v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setAccessoryImage:(UIImage *)accessoryImage
{
  UIImage *v4;
  CPImageSet *v5;
  CPImageSet *v6;
  CPImageSet *accessoryImageSet;
  CPImageSet *v8;
  _QWORD v9[5];

  v4 = accessoryImage;
  if (v4)
  {
    v5 = [CPImageSet alloc];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __32__CPListItem_setAccessoryImage___block_invoke;
    v9[3] = &unk_24C77D488;
    v9[4] = self;
    v6 = -[CPImageSet initWithImage:treatmentBlock:](v5, "initWithImage:treatmentBlock:", v4, v9);
    accessoryImageSet = self->_accessoryImageSet;
    self->_accessoryImageSet = v6;

    self->_accessoryType = 0;
LABEL_5:
    -[CPListItem _setNeedsUpdate](self, "_setNeedsUpdate");
    goto LABEL_6;
  }
  v8 = self->_accessoryImageSet;
  if (v8)
  {
    self->_accessoryImageSet = 0;

    goto LABEL_5;
  }
LABEL_6:

}

id __32__CPListItem_setAccessoryImage___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  double v4;
  void *v5;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "maximumImageSize");
  CPImageByScalingImageToSize(v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setPlaying:(BOOL)playing
{
  if (self->_playing != playing)
  {
    self->_playing = playing;
    -[CPListItem _setNeedsUpdate](self, "_setNeedsUpdate");
  }
}

- (void)setPlaybackProgress:(CGFloat)playbackProgress
{
  self->_playbackProgress = playbackProgress;
  -[CPListItem _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)setPlayingIndicatorLocation:(CPListItemPlayingIndicatorLocation)playingIndicatorLocation
{
  if (self->_playingIndicatorLocation != playingIndicatorLocation)
  {
    self->_playingIndicatorLocation = playingIndicatorLocation;
    -[CPListItem _setNeedsUpdate](self, "_setNeedsUpdate");
  }
}

- (void)setExplicitContent:(BOOL)explicitContent
{
  if (self->_explicitContent != explicitContent)
  {
    self->_explicitContent = explicitContent;
    -[CPListItem _setNeedsUpdate](self, "_setNeedsUpdate");
  }
}

- (void)setAccessoryType:(CPListItemAccessoryType)accessoryType
{
  if (self->_accessoryType != accessoryType)
  {
    self->_accessoryType = accessoryType;
    -[CPListItem _setNeedsUpdate](self, "_setNeedsUpdate");
  }
}

- (void)setShowsDisclosureIndicator:(BOOL)a3
{
  self->_showsDisclosureIndicator = a3;
  if (a3)
    self->_accessoryType = 1;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[CPListItem text](self, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[CPListItem detailText](self, "detailText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[CPListItem identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPListItem text](self, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", v6))
    {
      objc_msgSend(v4, "detailText");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPListItem detailText](self, "detailText");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (CPListItemAccessoryType)accessoryType
{
  return self->_accessoryType;
}

- (BOOL)isExplicitContent
{
  return self->_explicitContent;
}

- (CGFloat)playbackProgress
{
  return self->_playbackProgress;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (CPListItemPlayingIndicatorLocation)playingIndicatorLocation
{
  return self->_playingIndicatorLocation;
}

- (void)handler
{
  return self->_handler;
}

- (void)setHandler:(void *)handler
{
  objc_setProperty_nonatomic_copy(self, a2, handler, 40);
}

- (NSString)text
{
  return self->_text;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)userInfo
{
  objc_storeStrong(&self->_userInfo, userInfo);
}

- (NSString)detailText
{
  return self->_detailText;
}

- (BOOL)showsDisclosureIndicator
{
  return self->_showsDisclosureIndicator;
}

- (CPImageSet)imageSet
{
  return self->_imageSet;
}

- (void)setImageSet:(id)a3
{
  objc_storeStrong((id *)&self->_imageSet, a3);
}

- (CPImageSet)accessoryImageSet
{
  return self->_accessoryImageSet;
}

- (void)setAccessoryImageSet:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryImageSet, a3);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (CPListTemplate)listTemplate
{
  return (CPListTemplate *)objc_loadWeakRetained((id *)&self->_listTemplate);
}

- (void)setListTemplate:(id)a3
{
  objc_storeWeak((id *)&self->_listTemplate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_listTemplate);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_accessoryImageSet, 0);
  objc_storeStrong((id *)&self->_imageSet, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end
