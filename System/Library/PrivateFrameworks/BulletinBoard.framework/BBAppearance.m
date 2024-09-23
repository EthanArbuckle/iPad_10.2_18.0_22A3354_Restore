@implementation BBAppearance

+ (BBAppearance)appearanceWithTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setTitle:", v4);

  return (BBAppearance *)v5;
}

- (BOOL)isEqual:(id)a3
{
  BBAppearance *v4;
  BBAppearance *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  BOOL v11;

  v4 = (BBAppearance *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      -[BBAppearance title](self, "title");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[BBAppearance title](v5, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (BSEqualObjects())
      {
        -[BBAppearance image](self, "image");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[BBAppearance image](v5, "image");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (BSEqualObjects())
        {
          v10 = -[BBAppearance style](self, "style");
          v11 = v10 == -[BBAppearance style](v5, "style");
        }
        else
        {
          v11 = 0;
        }

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  -[BBAppearance title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[BBAppearance image](self, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = v6 ^ -[BBAppearance style](self, "style");

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[BBAppearance title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v5);

  -[BBAppearance image](self, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v6);

  objc_msgSend(v4, "setStyle:", -[BBAppearance style](self, "style"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BBAppearance)initWithCoder:(id)a3
{
  id v4;
  BBAppearance *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BBAppearance;
  v5 = -[BBAppearance init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBAppearance setTitle:](v5, "setTitle:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("image"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBAppearance setImage:](v5, "setImage:", v7);

    -[BBAppearance setStyle:](v5, "setStyle:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("style")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[BBAppearance title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("title"));

  -[BBAppearance image](self, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("image"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[BBAppearance style](self, "style"), CFSTR("style"));
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
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
