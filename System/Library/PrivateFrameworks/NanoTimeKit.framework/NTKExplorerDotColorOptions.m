@implementation NTKExplorerDotColorOptions

- (id)copyWithZone:(_NSZone *)a3
{
  NTKExplorerDotColorOptions *v4;
  NTKExplorerDotColorOptions *v5;

  v4 = objc_alloc_init(NTKExplorerDotColorOptions);
  v5 = v4;
  if (v4)
  {
    -[NTKExplorerDotColorOptions setConnectedDotColor:](v4, "setConnectedDotColor:", self->_connectedDotColor);
    -[NTKExplorerDotColorOptions setConnectedDotBackgroundColor:](v5, "setConnectedDotBackgroundColor:", self->_connectedDotBackgroundColor);
    -[NTKExplorerDotColorOptions setNoServiceDotColor:](v5, "setNoServiceDotColor:", self->_noServiceDotColor);
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  UIColor *connectedDotColor;
  id v5;

  connectedDotColor = self->_connectedDotColor;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", connectedDotColor, CFSTR("connectedDotColorKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_connectedDotBackgroundColor, CFSTR("connectedDotBackgroundColorKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_noServiceDotColor, CFSTR("noServiceDotColor"));

}

- (NTKExplorerDotColorOptions)initWithCoder:(id)a3
{
  id v4;
  NTKExplorerDotColorOptions *v5;
  uint64_t v6;
  UIColor *connectedDotColor;
  uint64_t v8;
  UIColor *connectedDotBackgroundColor;
  uint64_t v10;
  UIColor *noServiceDotColor;

  v4 = a3;
  v5 = -[NTKExplorerDotColorOptions init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("connectedDotColorKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    connectedDotColor = v5->_connectedDotColor;
    v5->_connectedDotColor = (UIColor *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("connectedDotBackgroundColorKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    connectedDotBackgroundColor = v5->_connectedDotBackgroundColor;
    v5->_connectedDotBackgroundColor = (UIColor *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("noServiceDotColor"));
    v10 = objc_claimAutoreleasedReturnValue();
    noServiceDotColor = v5->_noServiceDotColor;
    v5->_noServiceDotColor = (UIColor *)v10;

  }
  return v5;
}

- (UIColor)connectedDotColor
{
  return self->_connectedDotColor;
}

- (void)setConnectedDotColor:(id)a3
{
  objc_storeStrong((id *)&self->_connectedDotColor, a3);
}

- (UIColor)connectedDotBackgroundColor
{
  return self->_connectedDotBackgroundColor;
}

- (void)setConnectedDotBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_connectedDotBackgroundColor, a3);
}

- (UIColor)noServiceDotColor
{
  return self->_noServiceDotColor;
}

- (void)setNoServiceDotColor:(id)a3
{
  objc_storeStrong((id *)&self->_noServiceDotColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noServiceDotColor, 0);
  objc_storeStrong((id *)&self->_connectedDotBackgroundColor, 0);
  objc_storeStrong((id *)&self->_connectedDotColor, 0);
}

@end
