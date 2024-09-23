@implementation ASDAlertAction

- (ASDAlertAction)initWithTitle:(id)a3
{
  return -[ASDAlertAction initWithTitle:style:](self, "initWithTitle:style:", a3, 0);
}

- (ASDAlertAction)initWithTitle:(id)a3 style:(int64_t)a4
{
  id v7;
  ASDAlertAction *v8;
  uint64_t v9;
  NSUUID *identifier;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASDAlertAction;
  v8 = -[ASDAlertAction init](&v12, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = objc_claimAutoreleasedReturnValue();
    identifier = v8->_identifier;
    v8->_identifier = (NSUUID *)v9;

    objc_storeStrong((id *)&v8->_title, a3);
    v8->_style = a4;
  }

  return v8;
}

+ (id)actionWithTitle:(id)a3
{
  id v3;
  ASDAlertAction *v4;

  v3 = a3;
  v4 = -[ASDAlertAction initWithTitle:]([ASDAlertAction alloc], "initWithTitle:", v3);

  return v4;
}

+ (id)actionWithTitle:(id)a3 style:(int64_t)a4
{
  id v5;
  ASDAlertAction *v6;

  v5 = a3;
  v6 = -[ASDAlertAction initWithTitle:style:]([ASDAlertAction alloc], "initWithTitle:style:", v5, a4);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDAlertAction)initWithCoder:(id)a3
{
  id v4;
  ASDAlertAction *v5;
  uint64_t v6;
  NSUUID *identifier;
  uint64_t v8;
  NSString *title;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASDAlertAction;
  v5 = -[ASDAlertAction init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    v5->_style = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("style"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_style, CFSTR("style"));

}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
