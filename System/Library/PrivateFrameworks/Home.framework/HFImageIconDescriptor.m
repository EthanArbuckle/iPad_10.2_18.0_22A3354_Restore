@implementation HFImageIconDescriptor

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HFImageIconDescriptor *v5;
  HFImageIconDescriptor *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = (HFImageIconDescriptor *)a3;
  if (v5 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[HFImageIconDescriptor imageIdentifier](self, "imageIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFImageIconDescriptor imageIdentifier](v6, "imageIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v7, "isEqualToString:", v8)
        || (v9 = -[HFImageIconDescriptor isSystemImage](self, "isSystemImage"),
            v9 != -[HFImageIconDescriptor isSystemImage](v6, "isSystemImage")))
      {
        v10 = 0;
LABEL_15:

        goto LABEL_16;
      }
      -[HFImageIconDescriptor imageSymbolConfiguration](self, "imageSymbolConfiguration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11
        || (-[HFImageIconDescriptor imageSymbolConfiguration](v6, "imageSymbolConfiguration"),
            (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[HFImageIconDescriptor imageSymbolConfiguration](self, "imageSymbolConfiguration");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFImageIconDescriptor imageSymbolConfiguration](v6, "imageSymbolConfiguration");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v12, "isEqualToConfiguration:", v13);

        if (v11)
        {
LABEL_14:

          goto LABEL_15;
        }
      }
      else
      {
        v10 = 1;
      }

      goto LABEL_14;
    }
    v10 = 0;
  }
LABEL_16:

  return v10;
}

- (BOOL)isSystemImage
{
  return self->_isSystemImage;
}

- (UIImageSymbolConfiguration)imageSymbolConfiguration
{
  return self->_imageSymbolConfiguration;
}

- (NSString)imageIdentifier
{
  return self->_imageIdentifier;
}

- (HFImageIconDescriptor)initWithSymbolIconConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HFImageIconDescriptor *v7;

  v4 = a3;
  objc_msgSend(v4, "systemImageName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[HFImageIconDescriptor initWithSystemImageNamed:configuration:](self, "initWithSystemImageNamed:configuration:", v5, v6);
  return v7;
}

- (HFImageIconDescriptor)initWithSystemImageNamed:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  HFImageIconDescriptor *v9;
  HFImageIconDescriptor *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFImageIconDescriptor;
  v9 = -[HFImageIconDescriptor init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_imageIdentifier, a3);
    v10->_isSystemImage = 1;
    objc_storeStrong((id *)&v10->_imageSymbolConfiguration, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_imageIdentifier, 0);
}

- (NSString)description
{
  _BOOL4 isSystemImage;
  void *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  isSystemImage = self->_isSystemImage;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFImageIconDescriptor imageIdentifier](self, "imageIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (isSystemImage)
  {
    -[HFImageIconDescriptor imageSymbolConfiguration](self, "imageSymbolConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p, \"%@\", %@>"), v6, self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p, \"%@\">"), v6, self, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v10;
}

- (HFImageIconDescriptor)initWithSystemImageNamed:(id)a3
{
  return -[HFImageIconDescriptor initWithSystemImageNamed:configuration:](self, "initWithSystemImageNamed:configuration:", a3, 0);
}

- (BOOL)isDemoModeDescriptor
{
  return self->_isDemoModeDescriptor;
}

- (HFImageIconDescriptor)imageIconDescriptorWithUpdatedImageSymbolConfiguration:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (!-[HFImageIconDescriptor isSystemImage](self, "isSystemImage"))
    NSLog(CFSTR("Call with system images only!"));
  if (-[HFImageIconDescriptor isSystemImage](self, "isSystemImage"))
  {
    v5 = objc_alloc((Class)objc_opt_class());
    -[HFImageIconDescriptor imageIdentifier](self, "imageIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithSystemImageNamed:configuration:", v6, v4);

  }
  else
  {
    v7 = 0;
  }

  return (HFImageIconDescriptor *)v7;
}

- (HFImageIconDescriptor)initWithImageIdentifier:(id)a3
{
  id v5;
  HFImageIconDescriptor *v6;
  void *v7;
  objc_super v9;
  _QWORD v10[11];

  v10[10] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFImageIconDescriptor;
  v6 = -[HFImageIconDescriptor init](&v9, sel_init);
  if (v6)
  {
    v10[0] = CFSTR("HFImageIconIdentifierAppleTVRegular");
    v10[1] = CFSTR("HFImageIconIdentifierAppleTVSmall");
    v10[2] = CFSTR("HFImageIconIdentifierServiceCarbonDioxideSensorOn");
    v10[3] = CFSTR("HFImageIconIdentifierServiceCarbonDioxideSensorOff");
    v10[4] = CFSTR("HFImageIconIdentifierServiceCarbonMonoxideSensorOn");
    v10[5] = CFSTR("HFImageIconIdentifierServiceCarbonMonoxideSensorOff");
    v10[6] = CFSTR("HFCAPackageIconIdentifierAirport");
    v10[7] = CFSTR("HFImageIconIdentifierGeneric");
    v10[8] = CFSTR("HFCAPackageIconIdentifierCarbonMonoxideSensor");
    v10[9] = CFSTR("HFCAPackageIconIdentifierCarbonDioxideSensor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_shouldForceLTR = objc_msgSend(v7, "containsObject:", v5);

    objc_storeStrong((id *)&v6->_imageIdentifier, a3);
  }

  return v6;
}

- (HFImageIconDescriptor)initWithDemoModeImageIdentifier:(id)a3
{
  id v5;
  HFImageIconDescriptor *v6;
  HFImageIconDescriptor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFImageIconDescriptor;
  v6 = -[HFImageIconDescriptor init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_imageIdentifier, a3);
    v7->_isDemoModeDescriptor = 1;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HFImageIconDescriptor imageIdentifier](self, "imageIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)iconDescriptorByMergingWithIconDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HFImageIconDescriptor *v7;
  HFImageIconDescriptor *v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFImageIconDescriptor identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", v6))
      v7 = self;
    else
      v7 = 0;
    v8 = v7;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)compare:(id)a3
{
  return 0;
}

- (BOOL)shouldForceLTR
{
  return self->_shouldForceLTR;
}

- (void)setIsDemoModeDescriptor:(BOOL)a3
{
  self->_isDemoModeDescriptor = a3;
}

@end
