@implementation AVTCoreModelColorsPicker

- (AVTCoreModelColorsPicker)initWithTitle:(id)a3 primaryColors:(id)a4 extendedColors:(id)a5 alwaysShowExtended:(BOOL)a6 colorCategory:(int64_t)a7 destination:(int64_t)a8 pairing:(id)a9 options:(id)a10
{
  _BOOL8 v11;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  AVTCoreModelColorsPicker *v24;

  v11 = a6;
  v16 = (void *)MEMORY[0x1E0CB3A28];
  v17 = a10;
  v18 = a9;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  objc_msgSend(v16, "UUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "UUIDString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[AVTCoreModelColorsPicker initWithTitle:primaryColors:extendedColors:identifier:alwaysShowExtended:colorCategory:destination:pairing:options:](self, "initWithTitle:primaryColors:extendedColors:identifier:alwaysShowExtended:colorCategory:destination:pairing:options:", v21, v20, v19, v23, v11, a7, a8, v18, v17);

  return v24;
}

- (AVTCoreModelColorsPicker)initWithTitle:(id)a3 primaryColors:(id)a4 extendedColors:(id)a5 identifier:(id)a6 alwaysShowExtended:(BOOL)a7 colorCategory:(int64_t)a8 destination:(int64_t)a9 pairing:(id)a10 options:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  AVTCoreModelColorsPicker *v20;
  uint64_t v21;
  NSString *identifier;
  uint64_t v23;
  NSString *title;
  id v27;
  id v28;
  objc_super v29;

  v28 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v27 = a10;
  v19 = a11;
  v29.receiver = self;
  v29.super_class = (Class)AVTCoreModelColorsPicker;
  v20 = -[AVTCoreModelColorsPicker init](&v29, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v18, "copy");
    identifier = v20->_identifier;
    v20->_identifier = (NSString *)v21;

    v23 = objc_msgSend(v28, "copy");
    title = v20->_title;
    v20->_title = (NSString *)v23;

    objc_storeStrong((id *)&v20->_primaryColors, a4);
    objc_storeStrong((id *)&v20->_extendedColors, a5);
    v20->_alwaysShowExtended = a7;
    v20->_destination = a9;
    v20->_colorCategory = a8;
    objc_storeStrong((id *)&v20->_pairing, a10);
    objc_storeStrong((id *)&v20->_options, a11);
  }

  return v20;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)AVTCoreModelColorsPicker;
  -[AVTCoreModelColorsPicker description](&v17, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[AVTCoreModelColorsPicker identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" identifier: %@"), v5);

  -[AVTCoreModelColorsPicker title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" title: %@"), v6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AVTCoreModelColorsPicker colorCategory](self, "colorCategory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" category: %@"), v7);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AVTCoreModelColorsPicker destination](self, "destination"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" destination: %@"), v8);

  -[AVTCoreModelColorsPicker primaryColors](self, "primaryColors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[AVTCoreModelColorsPicker primaryColors](self, "primaryColors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "avt_description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" primary colors: %@"), v11);

  }
  -[AVTCoreModelColorsPicker extendedColors](self, "extendedColors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[AVTCoreModelColorsPicker extendedColors](self, "extendedColors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "avt_description");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" extended colors: %@"), v14);

  }
  if (-[AVTCoreModelColorsPicker alwaysShowExtended](self, "alwaysShowExtended"))
    objc_msgSend(v4, "appendString:", CFSTR(" alwaysShowExtended"));
  v15 = (void *)objc_msgSend(v4, "copy");

  return (NSString *)v15;
}

- (BOOL)isEmpty
{
  void *v3;
  BOOL v4;
  void *v5;

  -[AVTCoreModelColorsPicker primaryColors](self, "primaryColors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 0;
  }
  else
  {
    -[AVTCoreModelColorsPicker extendedColors](self, "extendedColors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "count") == 0;

  }
  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (AVTCoreModelPickerOptions)options
{
  return self->_options;
}

- (AVTCoreModelPairing)pairing
{
  return self->_pairing;
}

- (NSArray)primaryColors
{
  return self->_primaryColors;
}

- (NSArray)extendedColors
{
  return self->_extendedColors;
}

- (int64_t)destination
{
  return self->_destination;
}

- (BOOL)alwaysShowExtended
{
  return self->_alwaysShowExtended;
}

- (int64_t)colorCategory
{
  return self->_colorCategory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extendedColors, 0);
  objc_storeStrong((id *)&self->_primaryColors, 0);
  objc_storeStrong((id *)&self->_pairing, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
