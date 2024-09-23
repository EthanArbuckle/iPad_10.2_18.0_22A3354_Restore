@implementation GCDeviceLight

- (GCDeviceLight)initWithColor:(id)a3
{
  id v5;
  GCDeviceLight *v6;
  GCDeviceLight *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GCDeviceLight;
  v6 = -[GCDeviceLight init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_color, a3);

  return v7;
}

- (id)description
{
  return +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@ - color=%@>"), objc_opt_class(), self->_color);
}

- (GCColor)color
{
  return self->_color;
}

- (void)setColor:(GCColor *)color
{
  objc_setProperty_nonatomic_copy(self, a2, color, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCDeviceLight)initWithCoder:(id)a3
{
  id v4;
  GCDeviceLight *v5;
  uint64_t v6;
  GCColor *color;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GCDeviceLight;
  v5 = -[GCDeviceLight init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("color"));
    v6 = objc_claimAutoreleasedReturnValue();
    color = v5->_color;
    v5->_color = (GCColor *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_color, CFSTR("color"));
}

@end
