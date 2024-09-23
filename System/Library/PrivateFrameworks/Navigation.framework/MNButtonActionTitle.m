@implementation MNButtonActionTitle

- (MNButtonActionTitle)initWithAction:(unint64_t)a3 withTitle:(id)a4 buttonDisplay:(int)a5
{
  id v8;
  MNButtonActionTitle *v9;
  MNButtonActionTitle *v10;
  void *v11;
  uint64_t v12;
  NSString *title;
  uint64_t v14;
  GEOComposedString *formattedTitle;
  MNButtonActionTitle *v16;
  objc_super v18;

  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MNButtonActionTitle;
  v9 = -[MNButtonActionTitle init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_action = a3;
    objc_msgSend(v8, "formatStrings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = objc_claimAutoreleasedReturnValue();
    title = v10->_title;
    v10->_title = (NSString *)v12;

    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0D26FD8]), "initWithGeoFormattedString:", v8);
    formattedTitle = v10->_formattedTitle;
    v10->_formattedTitle = (GEOComposedString *)v14;

    v10->_buttonDisplay = a5;
    v16 = v10;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNButtonActionTitle)initWithCoder:(id)a3
{
  id v4;
  MNButtonActionTitle *v5;
  uint64_t v6;
  NSString *title;
  MNButtonActionTitle *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MNButtonActionTitle;
  v5 = -[MNButtonActionTitle init](&v10, sel_init);
  if (v5)
  {
    v5->_action = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_action"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    v5->_buttonDisplay = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_buttonDisplay"));
    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t action;
  id v5;

  action = self->_action;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", action, CFSTR("_action"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("_title"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_buttonDisplay, CFSTR("_buttonDisplay"));

}

- (unint64_t)action
{
  return self->_action;
}

- (GEOComposedString)formattedTitle
{
  return self->_formattedTitle;
}

- (NSString)title
{
  return self->_title;
}

- (int)buttonDisplay
{
  return self->_buttonDisplay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_formattedTitle, 0);
}

@end
