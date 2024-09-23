@implementation GCDevicePhysicalInputSourceDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)sourceWithElementAliases:(id)a3 localizedName:(id)a4 symbol:(id)a5 direction:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithElementAliases:localizedName:symbol:direction:", v12, v11, v10, a6);

  return v13;
}

+ (id)sourceWithElementAliases:(id)a3 localizedName:(id)a4 symbol:(id)a5
{
  return (id)objc_msgSend(a1, "sourceWithElementAliases:localizedName:symbol:direction:", a3, a4, a5, 0);
}

+ (id)sourceWithElementAliases:(id)a3 localizedName:(id)a4 sfSymbolsName:(id)a5 direction:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  if (a5)
  {
    v10 = a4;
    v11 = a3;
    +[GCDevicePhysicalInputSymbolDescription symbolWithSFSymbolsName:](GCDevicePhysicalInputSymbolDescription, "symbolWithSFSymbolsName:", a5);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "sourceWithElementAliases:localizedName:symbol:direction:", v11, v10, v12, a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = a4;
    v12 = a3;
    objc_msgSend(a1, "sourceWithElementAliases:localizedName:symbol:direction:", v12, v11, 0, a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

+ (id)sourceWithElementAliases:(id)a3 localizedName:(id)a4 sfSymbolsName:(id)a5
{
  return (id)objc_msgSend(a1, "sourceWithElementAliases:localizedName:sfSymbolsName:direction:", a3, a4, a5, 0);
}

+ (id)sourceWithElementAliases:(id)a3 localizedName:(id)a4
{
  return (id)objc_msgSend(a1, "sourceWithElementAliases:localizedName:sfSymbolsName:", a3, a4, 0);
}

- (GCDevicePhysicalInputSourceDescription)initWithElementAliases:(id)a3 localizedName:(id)a4 symbol:(id)a5 direction:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  GCDevicePhysicalInputSourceDescription *v14;
  uint64_t v15;
  NSSet *elementAliases;
  uint64_t v17;
  NSString *elementLocalizedName;
  uint64_t v19;
  GCDevicePhysicalInputSymbolDescription *symbol;
  void *v22;
  objc_super v23;

  v11 = a5;
  v12 = a4;
  v13 = a3;
  if (!objc_msgSend(v13, "count"))
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDevicePhysicalInputSourceDescription.m"), 49, CFSTR("Invalid parameter not satisfying: %s"), "elementAliases.count > 0");

  }
  v23.receiver = self;
  v23.super_class = (Class)GCDevicePhysicalInputSourceDescription;
  v14 = -[GCDevicePhysicalInputSourceDescription init](&v23, sel_init);
  v15 = objc_msgSend(v13, "copy");

  elementAliases = v14->_elementAliases;
  v14->_elementAliases = (NSSet *)v15;

  v17 = objc_msgSend(v12, "copy");
  elementLocalizedName = v14->_elementLocalizedName;
  v14->_elementLocalizedName = (NSString *)v17;

  v19 = objc_msgSend(v11, "copy");
  symbol = v14->_symbol;
  v14->_symbol = (GCDevicePhysicalInputSymbolDescription *)v19;

  v14->_direction = a6;
  return v14;
}

- (GCDevicePhysicalInputSourceDescription)init
{
  -[GCDevicePhysicalInputSourceDescription doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return self;
}

- (GCDevicePhysicalInputSourceDescription)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  GCDevicePhysicalInputSourceDescription *v13;

  v4 = a3;
  v5 = objc_opt_class();
  +[NSSet setWithObjects:](&off_1F03A7348, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("elementAliases"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  +[NSSet setWithObjects:](&off_1F03A7348, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("elementLocalizedName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("symbol"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("direction"));

  v13 = -[GCDevicePhysicalInputSourceDescription initWithElementAliases:localizedName:symbol:direction:](self, "initWithElementAliases:localizedName:symbol:direction:", v7, v10, v11, v12);
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSSet *elementAliases;
  id v5;

  elementAliases = self->_elementAliases;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", elementAliases, CFSTR("elementAliases"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_elementLocalizedName, CFSTR("elementLocalizedName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_symbol, CFSTR("symbol"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_direction, CFSTR("direction"));

}

- (unint64_t)hash
{
  return -[NSSet hash](self->_elementAliases, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *elementLocalizedName;
  GCDevicePhysicalInputSymbolDescription *symbol;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  v7 = (objc_opt_isKindOfClass() & 1) != 0
    && -[NSSet isEqual:](self->_elementAliases, "isEqual:", v4[1])
    && ((elementLocalizedName = self->_elementLocalizedName, elementLocalizedName == (NSString *)v4[2])
     || -[NSString isEqual:](elementLocalizedName, "isEqual:"))
    && ((symbol = self->_symbol, symbol == (GCDevicePhysicalInputSymbolDescription *)v4[3])
     || -[GCDevicePhysicalInputSymbolDescription isEqual:](symbol, "isEqual:"))
    && self->_direction == v4[4];

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t direction;
  NSString *elementLocalizedName;
  GCDevicePhysicalInputSymbolDescription *symbol;
  void *v10;
  void *v11;

  -[NSSet allObjects](self->_elementAliases, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_opt_new();
  v6 = v5;
  direction = self->_direction;
  if ((direction & 1) != 0)
  {
    objc_msgSend(v5, "addObject:", CFSTR("up"));
    direction = self->_direction;
    if ((direction & 4) == 0)
    {
LABEL_3:
      if ((direction & 8) == 0)
        goto LABEL_4;
LABEL_9:
      objc_msgSend(v6, "addObject:", CFSTR("left"));
      if ((self->_direction & 2) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((direction & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v6, "addObject:", CFSTR("down"));
  direction = self->_direction;
  if ((direction & 8) != 0)
    goto LABEL_9;
LABEL_4:
  if ((direction & 2) != 0)
LABEL_5:
    objc_msgSend(v6, "addObject:", CFSTR("right"));
LABEL_6:
  elementLocalizedName = self->_elementLocalizedName;
  symbol = self->_symbol;
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR("|"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("[%@] '%@' '%@' %@"), v4, elementLocalizedName, symbol, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSSet)elementAliases
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)elementLocalizedName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (GCDevicePhysicalInputSymbolDescription)symbol
{
  return (GCDevicePhysicalInputSymbolDescription *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)direction
{
  return self->_direction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbol, 0);
  objc_storeStrong((id *)&self->_elementLocalizedName, 0);
  objc_storeStrong((id *)&self->_elementAliases, 0);
}

@end
