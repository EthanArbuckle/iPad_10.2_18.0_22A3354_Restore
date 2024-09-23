@implementation CPAlertAction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPAlertAction)initWithTitle:(NSString *)title style:(CPAlertActionStyle)style handler:(CPAlertActionHandler)handler
{
  NSString *v9;
  CPAlertActionHandler v10;
  CPAlertAction *v11;
  CPAlertAction *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  NSUUID *identifier;
  objc_super v18;

  v9 = title;
  v10 = handler;
  v18.receiver = self;
  v18.super_class = (Class)CPAlertAction;
  v11 = -[CPAlertAction init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_title, title);
    v12->_style = style;
    v13 = MEMORY[0x212BA7CA8](v10);
    v14 = v12->_handler;
    v12->_handler = (id)v13;

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v15 = objc_claimAutoreleasedReturnValue();
    identifier = v12->_identifier;
    v12->_identifier = (NSUUID *)v15;

  }
  return v12;
}

- (CPAlertAction)initWithTitle:(NSString *)title color:(UIColor *)color handler:(CPAlertActionHandler)handler
{
  UIColor *v8;
  CPAlertAction *v9;
  CPAlertAction *v10;
  uint64_t v11;
  UIColor *v12;

  v8 = color;
  v9 = -[CPAlertAction initWithTitle:style:handler:](self, "initWithTitle:style:handler:", title, 0, handler);
  v10 = v9;
  if (v8 && v9)
  {
    CPSanitizedBackgroundColor(v8);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v10->_color;
    v10->_color = (UIColor *)v11;

  }
  return v10;
}

- (CPAlertAction)initWithCoder:(id)a3
{
  id v4;
  CPAlertAction *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSUUID *identifier;
  uint64_t v10;
  UIColor *color;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPAlertAction;
  v5 = -[CPAlertAction init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPAlertActionTitleKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    v5->_style = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kCPAlertActionStyleKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPAlertActionIdentifierKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPAlertActionColorKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    color = v5->_color;
    v5->_color = (UIColor *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CPAlertAction title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kCPAlertActionTitleKey"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[CPAlertAction style](self, "style"), CFSTR("kCPAlertActionStyleKey"));
  -[CPAlertAction identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kCPAlertActionIdentifierKey"));

  -[CPAlertAction color](self, "color");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kCPAlertActionColorKey"));

}

- (NSString)title
{
  return self->_title;
}

- (CPAlertActionStyle)style
{
  return self->_style;
}

- (CPAlertActionHandler)handler
{
  return self->_handler;
}

- (UIColor)color
{
  return self->_color;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
