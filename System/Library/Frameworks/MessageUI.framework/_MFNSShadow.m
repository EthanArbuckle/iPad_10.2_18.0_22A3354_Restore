@implementation _MFNSShadow

- (_MFNSShadow)initWithShadow:(id)a3
{
  id v5;
  _MFNSShadow *v6;
  _MFNSShadow *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MFNSShadow;
  v6 = -[_MFNSShadow init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_shadow, a3);

  return v7;
}

- (_MFNSShadow)initWithCoder:(id)a3
{
  id v4;
  _MFNSShadow *v5;
  NSShadow *v6;
  NSShadow *shadow;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_MFNSShadow;
  v5 = -[_MFNSShadow init](&v10, sel_init);
  if (v5)
  {
    v6 = (NSShadow *)objc_alloc_init(MEMORY[0x1E0DC1298]);
    shadow = v5->_shadow;
    v5->_shadow = v6;

    objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("offset"));
    -[NSShadow setShadowOffset:](v5->_shadow, "setShadowOffset:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("blurRadius"));
    -[NSShadow setShadowBlurRadius:](v5->_shadow, "setShadowBlurRadius:");
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("color")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("color"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSShadow setShadowColor:](v5->_shadow, "setShadowColor:", v8);

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[NSShadow shadowOffset](self->_shadow, "shadowOffset");
  objc_msgSend(v6, "encodeCGSize:forKey:", CFSTR("offset"));
  -[NSShadow shadowBlurRadius](self->_shadow, "shadowBlurRadius");
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("blurRadius"));
  -[NSShadow shadowColor](self->_shadow, "shadowColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NSShadow shadowColor](self->_shadow, "shadowColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("color"));

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSShadow)shadow
{
  return self->_shadow;
}

- (void)setShadow:(id)a3
{
  objc_storeStrong((id *)&self->_shadow, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadow, 0);
}

@end
