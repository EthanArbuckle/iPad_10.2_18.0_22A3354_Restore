@implementation CTDataSettings

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", cellularDataEnabled=%d"), -[CTDataSettings isCellularDataEnabled](self, "isCellularDataEnabled"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", airplaneModeEnabled=%d"), -[CTDataSettings isAirplaneModeEnabled](self, "isAirplaneModeEnabled"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", cellularDataCapable=%d"), -[CTDataSettings isCellularDataCapable](self, "isCellularDataCapable"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setCellularDataEnabled:", -[CTDataSettings isCellularDataEnabled](self, "isCellularDataEnabled"));
  objc_msgSend(v4, "setAirplaneModeEnabled:", -[CTDataSettings isAirplaneModeEnabled](self, "isAirplaneModeEnabled"));
  objc_msgSend(v4, "setCellularDataCapable:", -[CTDataSettings isCellularDataCapable](self, "isCellularDataCapable"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[CTDataSettings isCellularDataEnabled](self, "isCellularDataEnabled"), CFSTR("cellularDataEnabled"));
  objc_msgSend(v4, "encodeBool:forKey:", -[CTDataSettings isAirplaneModeEnabled](self, "isAirplaneModeEnabled"), CFSTR("airplaneModeEnabled"));
  objc_msgSend(v4, "encodeBool:forKey:", -[CTDataSettings isCellularDataCapable](self, "isCellularDataCapable"), CFSTR("cellularDataCapable"));

}

- (CTDataSettings)initWithCoder:(id)a3
{
  id v4;
  CTDataSettings *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTDataSettings;
  v5 = -[CTDataSettings init](&v7, sel_init);
  if (v5)
  {
    -[CTDataSettings setCellularDataEnabled:](v5, "setCellularDataEnabled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cellularDataEnabled")));
    -[CTDataSettings setAirplaneModeEnabled:](v5, "setAirplaneModeEnabled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("airplaneModeEnabled")));
    -[CTDataSettings setCellularDataCapable:](v5, "setCellularDataCapable:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cellularDataCapable")));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isCellularDataEnabled
{
  return self->_cellularDataEnabled;
}

- (void)setCellularDataEnabled:(BOOL)a3
{
  self->_cellularDataEnabled = a3;
}

- (BOOL)isAirplaneModeEnabled
{
  return self->_airplaneModeEnabled;
}

- (void)setAirplaneModeEnabled:(BOOL)a3
{
  self->_airplaneModeEnabled = a3;
}

- (BOOL)isCellularDataCapable
{
  return self->_cellularDataCapable;
}

- (void)setCellularDataCapable:(BOOL)a3
{
  self->_cellularDataCapable = a3;
}

@end
