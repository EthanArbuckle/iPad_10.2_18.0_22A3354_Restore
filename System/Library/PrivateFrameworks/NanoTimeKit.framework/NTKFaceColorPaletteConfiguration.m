@implementation NTKFaceColorPaletteConfiguration

- (NTKFaceColorPaletteConfiguration)initWithPigmentEditOption:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NTKFaceColorPaletteConfiguration *v8;

  v5 = a3;
  objc_msgSend(v5, "optionName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorFraction");
  v8 = -[NTKFaceColorPaletteConfiguration initWithColorOption:collectionName:colorFraction:](self, "initWithColorOption:collectionName:colorFraction:", v6, v7);

  if (v8)
    objc_storeStrong((id *)&v8->_pigmentEditOption, a3);

  return v8;
}

- (NTKFaceColorPaletteConfiguration)initWithColorOption:(id)a3 collectionName:(id)a4
{
  return -[NTKFaceColorPaletteConfiguration initWithColorOption:collectionName:colorFraction:](self, "initWithColorOption:collectionName:colorFraction:", a3, a4, 0.5);
}

- (NTKFaceColorPaletteConfiguration)initWithColorOption:(id)a3 collectionName:(id)a4 colorFraction:(double)a5
{
  id v8;
  id v9;
  NTKFaceColorPaletteConfiguration *v10;
  NTKFaceColorPaletteConfiguration *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NTKFaceColorPaletteConfiguration;
  v10 = -[NTKFaceColorPaletteConfiguration init](&v13, sel_init);
  v11 = v10;
  if (v10)
    -[NTKFaceColorPaletteConfiguration setColorName:collectionName:colorFraction:](v10, "setColorName:collectionName:colorFraction:", v8, v9, a5);

  return v11;
}

- (NSString)formattedCollectionName
{
  void *v3;
  int v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;
  NSString *formattedCollectionName;
  NSString *v9;

  if (!self->_formattedCollectionName)
  {
    -[NTKFaceColorPaletteConfiguration collectionName](self, "collectionName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "containsString:", CFSTR("."));

    -[NTKFaceColorPaletteConfiguration collectionName](self, "collectionName");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
    {
      -[NSString stringByReplacingOccurrencesOfString:withString:](v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("/"));
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      formattedCollectionName = self->_formattedCollectionName;
      self->_formattedCollectionName = v7;

    }
    else
    {
      v9 = self->_formattedCollectionName;
      self->_formattedCollectionName = v5;
      v6 = v9;
    }

  }
  return self->_formattedCollectionName;
}

- (void)setPigmentEditOption:(id)a3
{
  id v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  objc_storeStrong((id *)&self->_pigmentEditOption, a3);
  v5 = a3;
  objc_msgSend(v5, "optionName");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorFraction");
  v8 = v7;

  -[NTKFaceColorPaletteConfiguration setColorName:collectionName:colorFraction:](self, "setColorName:collectionName:colorFraction:", v9, v6, v8);
}

- (void)setColorName:(id)a3 collectionName:(id)a4 colorFraction:(double)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSString *v12;
  NSString *v13;
  NSString *colorOption;
  NSString *v15;
  NSString *v16;
  double *p_colorFraction;
  NSString *v18;
  NSString *formattedCollectionName;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v20 = 0;
  v21 = 0;
  +[NTKPigmentEditOption effectiveNamesFromName:effectiveCollectionName:effectiveOptionName:](NTKPigmentEditOption, "effectiveNamesFromName:effectiveCollectionName:effectiveOptionName:", v8, &v21, &v20);
  v10 = v21;
  v11 = v20;
  v12 = (NSString *)v8;
  v13 = v12;
  if (v11)
  {
    v13 = (NSString *)v11;

  }
  colorOption = self->_colorOption;
  if (v13 != colorOption)
    objc_storeStrong((id *)&self->_colorOption, v13);
  v15 = (NSString *)v9;
  v16 = v15;
  if (v10)
  {
    v16 = (NSString *)v10;

  }
  if (v16 == self->_collectionName)
  {
    p_colorFraction = &self->_colorFraction;
    if (self->_colorFraction == a5)
    {
      formattedCollectionName = self->_formattedCollectionName;
      self->_formattedCollectionName = 0;

      if (v13 == colorOption)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_collectionName, v16);
    p_colorFraction = &self->_colorFraction;
    if (self->_colorFraction == a5)
      goto LABEL_12;
  }
  *p_colorFraction = a5;
LABEL_12:
  v18 = self->_formattedCollectionName;
  self->_formattedCollectionName = 0;

LABEL_13:
  -[NTKFaceColorPaletteConfiguration handleContentChanged](self, "handleContentChanged");
LABEL_14:

}

- (void)setColorOption:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSString isEqualToString:](self->_colorOption, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_colorOption, a3);
    -[NTKFaceColorPaletteConfiguration handleContentChanged](self, "handleContentChanged");
  }

}

- (void)setCollectionName:(id)a3
{
  NSString *formattedCollectionName;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_collectionName, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_collectionName, a3);
    formattedCollectionName = self->_formattedCollectionName;
    self->_formattedCollectionName = 0;

    -[NTKFaceColorPaletteConfiguration handleContentChanged](self, "handleContentChanged");
  }

}

- (void)setColorFraction:(double)a3
{
  if (self->_colorFraction != a3)
  {
    self->_colorFraction = a3;
    -[NTKFaceColorPaletteConfiguration handleContentChanged](self, "handleContentChanged");
  }
}

- (void)handleContentChanged
{
  NSString *uniqueId;
  id v4;

  uniqueId = self->_uniqueId;
  self->_uniqueId = 0;

  -[NTKFaceColorPaletteConfiguration delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configurationDidChange:", self);

}

- (id)uniqueId
{
  NSString *uniqueId;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSString *v8;
  NSString *v9;

  uniqueId = self->_uniqueId;
  if (!uniqueId)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[NTKFaceColorPaletteConfiguration collectionName](self, "collectionName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceColorPaletteConfiguration colorOption](self, "colorOption");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceColorPaletteConfiguration colorFraction](self, "colorFraction");
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@.%@:%0.2f"), v5, v6, v7);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v9 = self->_uniqueId;
    self->_uniqueId = v8;

    uniqueId = self->_uniqueId;
  }
  return uniqueId;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[NTKFaceColorPaletteConfiguration colorOption](self, "colorOption");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColorOption:", v5);

  -[NTKFaceColorPaletteConfiguration collectionName](self, "collectionName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCollectionName:", v6);

  -[NTKFaceColorPaletteConfiguration colorFraction](self, "colorFraction");
  objc_msgSend(v4, "setColorFraction:");
  -[NTKFaceColorPaletteConfiguration pigmentEditOption](self, "pigmentEditOption");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setPigmentEditOption:", v8);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;

  v4 = a3;
  -[NTKFaceColorPaletteConfiguration colorOption](self, "colorOption");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorOption");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    -[NTKFaceColorPaletteConfiguration collectionName](self, "collectionName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collectionName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[NTKFaceColorPaletteConfiguration colorFraction](self, "colorFraction");
      v10 = v9;
      objc_msgSend(v4, "colorFraction");
      v12 = v10 == v11;
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NTKPigmentEditOption)pigmentEditOption
{
  return self->_pigmentEditOption;
}

- (NSString)colorOption
{
  return self->_colorOption;
}

- (NSString)collectionName
{
  return self->_collectionName;
}

- (double)colorFraction
{
  return self->_colorFraction;
}

- (NTKFaceColorPaletteConfigurationDelegate)delegate
{
  return (NTKFaceColorPaletteConfigurationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_collectionName, 0);
  objc_storeStrong((id *)&self->_colorOption, 0);
  objc_storeStrong((id *)&self->_pigmentEditOption, 0);
  objc_storeStrong((id *)&self->_uniqueId, 0);
  objc_storeStrong((id *)&self->_formattedCollectionName, 0);
}

@end
