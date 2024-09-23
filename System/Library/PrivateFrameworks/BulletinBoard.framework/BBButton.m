@implementation BBButton

+ (id)buttonWithTitle:(id)a3 action:(id)a4
{
  return (id)objc_msgSend(a1, "buttonWithTitle:action:identifier:", a3, a4, 0);
}

+ (id)buttonWithTitle:(id)a3 action:(id)a4 identifier:(id)a5
{
  return (id)objc_msgSend(a1, "buttonWithTitle:image:action:identifier:", a3, 0, a4, a5);
}

+ (id)buttonWithTitle:(id)a3 glyphData:(id)a4 action:(id)a5 identifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  +[BBImage imageWithData:](BBImage, "imageWithData:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "buttonWithTitle:image:action:identifier:", v12, v13, v11, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)buttonWithTitle:(id)a3 image:(id)a4 action:(id)a5 identifier:(id)a6
{
  unint64_t v11;
  unint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v17;

  v11 = (unint64_t)a3;
  v12 = (unint64_t)a4;
  v13 = a5;
  v14 = a6;
  if (!(v11 | v12))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("BBButton.m"), 45, CFSTR("%@-buttonWithTitle:action: requires a title or image (or both)"), a1);

  }
  v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:image:action:identifier:", v11, v12, v13, v14);

  return v15;
}

- (BBButton)initWithTitle:(id)a3 image:(id)a4 action:(id)a5 identifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BBButton *v14;
  BBButton *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BBButton;
  v14 = -[BBButton init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    -[BBButton setTitle:](v14, "setTitle:", v10);
    -[BBButton setImage:](v15, "setImage:", v11);
    -[BBButton setAction:](v15, "setAction:", v12);
    -[BBButton setIdentifier:](v15, "setIdentifier:", v13);
  }

  return v15;
}

- (NSData)glyphData
{
  void *v2;
  void *v3;

  -[BBButton image](self, "image");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (BOOL)isEqual:(id)a3
{
  BBButton *v4;
  BBButton *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v15;

  v4 = (BBButton *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      -[BBButton title](self, "title");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[BBButton title](v5, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (BSEqualStrings())
      {
        -[BBButton image](self, "image");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[BBButton image](v5, "image");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (BSEqualObjects())
        {
          -[BBButton action](self, "action");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[BBButton action](v5, "action");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (BSEqualObjects())
          {
            -[BBButton identifier](self, "identifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[BBButton identifier](v5, "identifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = BSEqualObjects();

          }
          else
          {
            v13 = 0;
          }

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[BBButton title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[BBButton image](self, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[BBButton action](self, "action");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[BBButton identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[BBButton title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBButton action](self, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; title: \"%@\"; action: %@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BBButton)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BBButton *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("image"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("action"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[BBButton initWithTitle:image:action:identifier:](self, "initWithTitle:image:action:identifier:", v5, v6, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[BBButton title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("title"));

  -[BBButton image](self, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("image"));

  -[BBButton action](self, "action");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("action"));

  -[BBButton identifier](self, "identifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("identifier"));

}

- (id)replacementObjectForCoder:(id)a3
{
  void *v4;
  void *v5;

  -[NSObject bb_objectCache](self, "bb_objectCache", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cacheObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)awakeAfterUsingCoder:(id)a3
{
  void *v4;
  void *v5;

  -[NSObject bb_objectCache](self, "bb_objectCache", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cacheObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (BBImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BBAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
