@implementation HKGradient

- (HKGradient)initWithColors:(id)a3 locations:(id)a4
{
  id v7;
  id v8;
  HKGradient *v9;
  HKGradient *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKGradient;
  v9 = -[HKGradient init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_colors, a3);
    objc_storeStrong((id *)&v10->_locations, a4);
  }

  return v10;
}

- (HKGradient)initWithTopColor:(id)a3 bottomColor:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  HKGradient *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v12[0] = a3;
  v12[1] = a4;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[HKGradient initWithColors:locations:](self, "initWithColors:locations:", v9, &unk_1E9CE9BA8);
  return v10;
}

+ (id)defaultGradient
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "blueColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithTopColor:bottomColor:", v3, v4);

  return v5;
}

- (UIColor)topColor
{
  void *v2;
  void *v3;

  -[HKGradient colors](self, "colors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (UIColor)bottomColor
{
  void *v2;
  void *v3;

  -[HKGradient colors](self, "colors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (BOOL)isEqualToHKGradient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  if (v4)
  {
    -[HKGradient colors](self, "colors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "colors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToArray:", v6))
    {
      -[HKGradient locations](self, "locations");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "locations");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToArray:", v8);

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

- (BOOL)isEqual:(id)a3
{
  HKGradient *v4;
  BOOL v5;

  v4 = (HKGradient *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[HKGradient isEqualToHKGradient:](self, "isEqualToHKGradient:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HKGradient colors](self, "colors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HKGradient locations](self, "locations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    -[HKGradient colors](self, "colors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
    objc_msgSend(v5, "setColors:", v7);

    -[HKGradient locations](self, "locations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
    objc_msgSend(v5, "setLocations:", v9);

  }
  return v5;
}

- (NSArray)colors
{
  return self->_colors;
}

- (void)setColors:(id)a3
{
  objc_storeStrong((id *)&self->_colors, a3);
}

- (NSArray)locations
{
  return self->_locations;
}

- (void)setLocations:(id)a3
{
  objc_storeStrong((id *)&self->_locations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_colors, 0);
}

@end
