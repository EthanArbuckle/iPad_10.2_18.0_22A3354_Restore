@implementation ATXTimeEventAction

- (ATXTimeEventAction)initWithTitle:(id)a3 compactTitle:(id)a4 identifier:(id)a5 symbolName:(id)a6 colorName:(id)a7 options:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  ATXTimeEventAction *v19;
  uint64_t v20;
  NSString *title;
  uint64_t v22;
  NSString *compactTitle;
  uint64_t v24;
  NSString *identifier;
  uint64_t v26;
  NSString *symbolName;
  uint64_t v28;
  NSString *colorName;
  ATXTimeEventAction *v30;
  objc_super v32;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v32.receiver = self;
  v32.super_class = (Class)ATXTimeEventAction;
  v19 = -[ATXTimeEventAction init](&v32, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v14, "copy");
    title = v19->_title;
    v19->_title = (NSString *)v20;

    v22 = objc_msgSend(v15, "copy");
    compactTitle = v19->_compactTitle;
    v19->_compactTitle = (NSString *)v22;

    v24 = objc_msgSend(v16, "copy");
    identifier = v19->_identifier;
    v19->_identifier = (NSString *)v24;

    v26 = objc_msgSend(v17, "copy");
    symbolName = v19->_symbolName;
    v19->_symbolName = (NSString *)v26;

    v28 = objc_msgSend(v18, "copy");
    colorName = v19->_colorName;
    v19->_colorName = (NSString *)v28;

    v19->_options = a8;
    v30 = v19;
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *symbolName;
  id v5;

  symbolName = self->_symbolName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", symbolName, CFSTR("symbol"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_colorName, CFSTR("symbolColorName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_compactTitle, CFSTR("compactTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_options, CFSTR("options"));

}

- (ATXTimeEventAction)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  ATXTimeEventAction *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("compactTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("symbol"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("symbolColorName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("options"));

  v11 = -[ATXTimeEventAction initWithTitle:compactTitle:identifier:symbolName:colorName:options:](self, "initWithTitle:compactTitle:identifier:symbolName:colorName:options:", v5, v6, v7, v8, v9, v10);
  return v11;
}

- (id)compactTitleUsingETAIfPossibleWithMinutes:(double)a3 style:(int64_t)a4
{
  id v7;
  id v8;
  void *v9;

  if (a3 < 1.0 || (self->_options & 2) == 0)
  {
    -[ATXTimeEventAction compactTitle](self, "compactTitle", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v7, "setMinute:", (uint64_t)a3);
    v8 = objc_alloc_init(MEMORY[0x1E0CB3570]);
    objc_msgSend(v8, "setUnitsStyle:", a4);
    objc_msgSend(v8, "stringFromDateComponents:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)compactTitle
{
  return self->_compactTitle;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (NSString)colorName
{
  return self->_colorName;
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorName, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_compactTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
