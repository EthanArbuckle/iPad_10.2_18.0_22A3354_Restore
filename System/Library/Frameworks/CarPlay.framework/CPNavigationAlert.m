@implementation CPNavigationAlert

- (id)_initWithTitleVariants:(id)a3 subtitleVariants:(id)a4 imageSet:(id)a5 primaryAction:(id)a6 secondaryAction:(id)a7 duration:(double)a8
{
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  CPNavigationAlert *v21;
  CPNavigationAlert *v22;
  objc_class *v23;
  CPImageSet *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  CPImageSet *imageSet;
  double v30;
  uint64_t v31;
  NSUUID *identifier;
  id v34;
  void *v35;
  id v36;
  objc_super v37;

  v36 = a3;
  v34 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (v17)
  {
    v19 = objc_opt_class();
    CPAssertAllowedClass(v17, v19, a2);
  }
  if (v18)
  {
    v20 = objc_opt_class();
    CPAssertAllowedClass(v18, v20, a2);
  }
  v37.receiver = self;
  v37.super_class = (Class)CPNavigationAlert;
  v21 = -[CPNavigationAlert init](&v37, sel_init, v34);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_titleVariants, a3);
    objc_storeStrong((id *)&v22->_subtitleVariants, a4);
    v23 = (objc_class *)objc_opt_class();
    v24 = (CPImageSet *)v16;
    -[CPImageSet lightContentImage](v24, "lightContentImage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    CPSanitizeImage(v25, v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPImageSet setLightContentImage:](v24, "setLightContentImage:", v26);

    -[CPImageSet darkContentImage](v24, "darkContentImage");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    CPSanitizeImage(v27, v23);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPImageSet setDarkContentImage:](v24, "setDarkContentImage:", v28);

    imageSet = v22->_imageSet;
    v22->_imageSet = v24;

    objc_storeStrong((id *)&v22->_primaryAction, a6);
    objc_storeStrong((id *)&v22->_secondaryAction, a7);
    v30 = fmax(a8, 5.0);
    if (a8 <= 0.0)
      v30 = 0.0;
    v22->_duration = v30;
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v31 = objc_claimAutoreleasedReturnValue();
    identifier = v22->_identifier;
    v22->_identifier = (NSUUID *)v31;

  }
  return v22;
}

- (CPNavigationAlert)initWithTitleVariants:(NSArray *)titleVariants subtitleVariants:(NSArray *)subtitleVariants image:(UIImage *)image primaryAction:(CPAlertAction *)primaryAction secondaryAction:(CPAlertAction *)secondaryAction duration:(NSTimeInterval)duration
{
  NSArray *v14;
  NSArray *v15;
  CPAlertAction *v16;
  CPAlertAction *v17;
  UIImage *v18;
  CPImageSet *v19;
  void *v20;
  CPNavigationAlert *v21;

  v14 = titleVariants;
  v15 = subtitleVariants;
  v16 = primaryAction;
  v17 = secondaryAction;
  if (image)
  {
    v18 = image;
    v19 = [CPImageSet alloc];
    CPImageByScalingImageToSize(v18, 24.0, 24.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    image = -[CPImageSet initWithImage:](v19, "initWithImage:", v20);
  }
  v21 = -[CPNavigationAlert _initWithTitleVariants:subtitleVariants:imageSet:primaryAction:secondaryAction:duration:](self, "_initWithTitleVariants:subtitleVariants:imageSet:primaryAction:secondaryAction:duration:", v14, v15, image, v16, v17, duration);

  return v21;
}

- (void)updateTitleVariants:(NSArray *)newTitleVariants subtitleVariants:(NSArray *)newSubtitleVariants
{
  NSArray *v7;
  NSArray *subtitleVariants;
  void *v9;
  void *v10;
  NSArray *v11;

  v11 = newTitleVariants;
  v7 = newSubtitleVariants;
  objc_storeStrong((id *)&self->_titleVariants, newTitleVariants);
  subtitleVariants = self->_subtitleVariants;
  self->_subtitleVariants = v7;

  -[CPNavigationAlert navigationAlertUpdateTarget](self, "navigationAlertUpdateTarget");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CPNavigationAlert navigationAlertUpdateTarget](self, "navigationAlertUpdateTarget");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_updateNavigationAlert:", self);

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  id v11;

  v4 = a3;
  -[CPNavigationAlert titleVariants](self, "titleVariants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kCPNavigationAlertTitlesKey"));

  -[CPNavigationAlert subtitleVariants](self, "subtitleVariants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kCPNavigationAlertSubtitlesKey"));

  -[CPNavigationAlert imageSet](self, "imageSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kCPNavigationAlertImageKey"));

  -[CPNavigationAlert primaryAction](self, "primaryAction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("kCPNavitationAlertPrimaryKey"));

  -[CPNavigationAlert secondaryAction](self, "secondaryAction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("kCPNavigationAlertSecondaryKey"));

  -[CPNavigationAlert duration](self, "duration");
  *(float *)&v10 = v10;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("kCPNavigationAlertDurationKey"), v10);
  -[CPNavigationAlert identifier](self, "identifier");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("kCPNavigationAlertIdentifierKey"));

}

- (CPNavigationAlert)initWithCoder:(id)a3
{
  id v4;
  CPNavigationAlert *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *titleVariants;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *subtitleVariants;
  void *v16;
  objc_class *v17;
  CPImageSet *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  CPImageSet *imageSet;
  uint64_t v24;
  CPAlertAction *primaryAction;
  uint64_t v26;
  CPAlertAction *secondaryAction;
  float v28;
  uint64_t v29;
  NSUUID *identifier;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)CPNavigationAlert;
  v5 = -[CPNavigationAlert init](&v32, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kCPNavigationAlertTitlesKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    titleVariants = v5->_titleVariants;
    v5->_titleVariants = (NSArray *)v9;

    v11 = (void *)MEMORY[0x24BDBCF20];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("kCPNavigationAlertSubtitlesKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    subtitleVariants = v5->_subtitleVariants;
    v5->_subtitleVariants = (NSArray *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPNavigationAlertImageKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    v18 = v16;
    -[CPImageSet lightContentImage](v18, "lightContentImage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    CPSanitizeImage(v19, v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPImageSet setLightContentImage:](v18, "setLightContentImage:", v20);

    -[CPImageSet darkContentImage](v18, "darkContentImage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    CPSanitizeImage(v21, v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPImageSet setDarkContentImage:](v18, "setDarkContentImage:", v22);

    imageSet = v5->_imageSet;
    v5->_imageSet = v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPNavitationAlertPrimaryKey"));
    v24 = objc_claimAutoreleasedReturnValue();
    primaryAction = v5->_primaryAction;
    v5->_primaryAction = (CPAlertAction *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPNavigationAlertSecondaryKey"));
    v26 = objc_claimAutoreleasedReturnValue();
    secondaryAction = v5->_secondaryAction;
    v5->_secondaryAction = (CPAlertAction *)v26;

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("kCPNavigationAlertDurationKey"));
    v5->_duration = v28;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPNavigationAlertIdentifierKey"));
    v29 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v29;

  }
  return v5;
}

- (UIImage)image
{
  void *v2;
  void *v3;

  -[CPNavigationAlert imageSet](self, "imageSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v12.receiver = self;
  v12.super_class = (Class)CPNavigationAlert;
  -[CPNavigationAlert description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPNavigationAlert identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPNavigationAlert duration](self, "duration");
  v7 = v6;
  -[CPNavigationAlert titleVariants](self, "titleVariants");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPNavigationAlert subtitleVariants](self, "subtitleVariants");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {UUID: %@, duration: %f, title variants: %@, subtitle variants, %@}"), v4, v5, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSArray)titleVariants
{
  return self->_titleVariants;
}

- (NSArray)subtitleVariants
{
  return self->_subtitleVariants;
}

- (CPImageSet)imageSet
{
  return self->_imageSet;
}

- (CPAlertAction)primaryAction
{
  return self->_primaryAction;
}

- (CPAlertAction)secondaryAction
{
  return self->_secondaryAction;
}

- (NSTimeInterval)duration
{
  return self->_duration;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (CPNavigationAlertUpdating)navigationAlertUpdateTarget
{
  return (CPNavigationAlertUpdating *)objc_loadWeakRetained((id *)&self->_navigationAlertUpdateTarget);
}

- (void)setNavigationAlertUpdateTarget:(id)a3
{
  objc_storeWeak((id *)&self->_navigationAlertUpdateTarget, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navigationAlertUpdateTarget);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_secondaryAction, 0);
  objc_storeStrong((id *)&self->_primaryAction, 0);
  objc_storeStrong((id *)&self->_imageSet, 0);
  objc_storeStrong((id *)&self->_subtitleVariants, 0);
  objc_storeStrong((id *)&self->_titleVariants, 0);
}

@end
