@implementation CPVoiceControlState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPVoiceControlState)initWithIdentifier:(NSString *)identifier titleVariants:(NSArray *)titleVariants image:(UIImage *)image repeats:(BOOL)repeats
{
  NSString *v11;
  NSArray *v12;
  UIImage *v13;
  CPVoiceControlState *v14;
  CPVoiceControlState *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  uint64_t v25;
  objc_super v27;

  v11 = identifier;
  v12 = titleVariants;
  v13 = image;
  v27.receiver = self;
  v27.super_class = (Class)CPVoiceControlState;
  v14 = -[CPVoiceControlState init](&v27, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_identifier, identifier);
    objc_storeStrong((id *)&v15->_titleVariants, titleVariants);
    -[UIImage images](v13, "images");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[UIImage duration](v13, "duration");
      if (v17 < 0.3)
      {
        v18 = (void *)MEMORY[0x24BDF6AC8];
        -[UIImage images](v13, "images");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v18;
        v21 = v19;
        v22 = 0.3;
LABEL_7:
        objc_msgSend(v20, "animatedImageWithImages:duration:", v21, v22);
        v25 = objc_claimAutoreleasedReturnValue();

        v13 = (UIImage *)v25;
        goto LABEL_8;
      }
      -[UIImage duration](v13, "duration");
      if (v23 > 5.0)
      {
        v24 = (void *)MEMORY[0x24BDF6AC8];
        -[UIImage images](v13, "images");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 5.0;
        v20 = v24;
        v21 = v19;
        goto LABEL_7;
      }
    }
LABEL_8:
    objc_storeStrong((id *)&v15->_image, v13);
    v15->_repeats = repeats;
  }

  return v15;
}

- (CPVoiceControlState)initWithCoder:(id)a3
{
  id v4;
  CPVoiceControlState *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *titleVariants;
  uint64_t v13;
  UIImage *image;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CPVoiceControlState;
  v5 = -[CPVoiceControlState init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPVoiceControlIdentifierKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("kCPVoiceControlTitlesKey"));
    v11 = objc_claimAutoreleasedReturnValue();
    titleVariants = v5->_titleVariants;
    v5->_titleVariants = (NSArray *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPVoiceControlAnimatedImageKey"));
    v13 = objc_claimAutoreleasedReturnValue();
    image = v5->_image;
    v5->_image = (UIImage *)v13;

    v5->_repeats = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kCPVoiceControlStateImageRepeatsKey"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CPVoiceControlState identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("kCPVoiceControlIdentifierKey"));

  -[CPVoiceControlState titleVariants](self, "titleVariants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("kCPVoiceControlTitlesKey"));

  -[CPVoiceControlState image](self, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("kCPVoiceControlAnimatedImageKey"));

  objc_msgSend(v7, "encodeBool:forKey:", -[CPVoiceControlState repeats](self, "repeats"), CFSTR("kCPVoiceControlStateImageRepeatsKey"));
}

- (NSArray)titleVariants
{
  return self->_titleVariants;
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)repeats
{
  return self->_repeats;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_titleVariants, 0);
}

@end
