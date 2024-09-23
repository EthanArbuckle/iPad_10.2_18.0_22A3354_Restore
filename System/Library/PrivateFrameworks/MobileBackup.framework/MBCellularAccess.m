@implementation MBCellularAccess

+ (id)expensiveCellularAccess
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setAllowsExpensiveNetworkAccess:", 1);
  return v2;
}

+ (id)inexpensiveCellularAccess
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setAllowsExpensiveNetworkAccess:", 0);
  return v2;
}

- (MBCellularAccess)init
{
  MBCellularAccess *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MBCellularAccess;
  result = -[MBCellularAccess init](&v3, sel_init);
  if (result)
    *(_WORD *)&result->_allowsExpensiveNetworkAccess = 256;
  return result;
}

- (MBCellularAccess)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  MBCellularAccess *v5;
  void *v6;
  void *v7;
  char v8;
  MBCellularAccess *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MBCellularAccess;
  v5 = -[MBCellularAccess init](&v11, sel_init);
  if (!v5)
    goto LABEL_9;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("allowsExpensiveNetworkAccess"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_11:

    v9 = 0;
    goto LABEL_12;
  }
  v5->_allowsExpensiveNetworkAccess = objc_msgSend(v6, "BOOLValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("allowsConstrainedNetworkAccess"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = 1;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = v7;
    goto LABEL_11;
  }
  v8 = objc_msgSend(v7, "BOOLValue");
LABEL_8:
  v5->_allowsConstrainedNetworkAccess = v8;

LABEL_9:
  v9 = v5;
LABEL_12:

  return v9;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("allowsExpensiveNetworkAccess");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MBCellularAccess allowsExpensiveNetworkAccess](self, "allowsExpensiveNetworkAccess"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("allowsConstrainedNetworkAccess");
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MBCellularAccess allowsConstrainedNetworkAccess](self, "allowsConstrainedNetworkAccess"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int v6;
  _BOOL4 v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5 = -[MBCellularAccess allowsExpensiveNetworkAccess](self, "allowsExpensiveNetworkAccess"),
        v5 == objc_msgSend(v4, "allowsExpensiveNetworkAccess")))
  {
    v7 = -[MBCellularAccess allowsConstrainedNetworkAccess](self, "allowsConstrainedNetworkAccess");
    v6 = v7 ^ objc_msgSend(v4, "allowsConstrainedNetworkAccess") ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (MBCellularAccess)initWithCoder:(id)a3
{
  id v4;
  MBCellularAccess *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MBCellularAccess;
  v5 = -[MBCellularAccess init](&v7, sel_init);
  if (v5)
  {
    -[MBCellularAccess setAllowsExpensiveNetworkAccess:](v5, "setAllowsExpensiveNetworkAccess:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsExpensiveNetworkAccess")));
    -[MBCellularAccess setAllowsConstrainedNetworkAccess:](v5, "setAllowsConstrainedNetworkAccess:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsConstrainedNetworkAccess")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[MBCellularAccess allowsExpensiveNetworkAccess](self, "allowsExpensiveNetworkAccess"), CFSTR("allowsExpensiveNetworkAccess"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MBCellularAccess allowsConstrainedNetworkAccess](self, "allowsConstrainedNetworkAccess"), CFSTR("allowsConstrainedNetworkAccess"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setAllowsExpensiveNetworkAccess:", -[MBCellularAccess allowsExpensiveNetworkAccess](self, "allowsExpensiveNetworkAccess"));
  objc_msgSend(v4, "setAllowsConstrainedNetworkAccess:", -[MBCellularAccess allowsConstrainedNetworkAccess](self, "allowsConstrainedNetworkAccess"));
  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%s: %p; allowsExpensiveNetworkAccess=%d, allowsConstrainedNetworkAccess=%d>"),
               class_getName(v4),
               self,
               -[MBCellularAccess allowsExpensiveNetworkAccess](self, "allowsExpensiveNetworkAccess"),
               -[MBCellularAccess allowsConstrainedNetworkAccess](self, "allowsConstrainedNetworkAccess"));
}

- (BOOL)allowsExpensiveNetworkAccess
{
  return self->_allowsExpensiveNetworkAccess;
}

- (void)setAllowsExpensiveNetworkAccess:(BOOL)a3
{
  self->_allowsExpensiveNetworkAccess = a3;
}

- (BOOL)allowsConstrainedNetworkAccess
{
  return self->_allowsConstrainedNetworkAccess;
}

- (void)setAllowsConstrainedNetworkAccess:(BOOL)a3
{
  self->_allowsConstrainedNetworkAccess = a3;
}

@end
