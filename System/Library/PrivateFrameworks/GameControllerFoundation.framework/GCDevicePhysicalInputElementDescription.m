@implementation GCDevicePhysicalInputElementDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)descriptionWithIdentifier:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setIdentifier:", v3);

  return v4;
}

- (GCDevicePhysicalInputElementDescription)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GCDevicePhysicalInputElementDescription;
  return -[GCDevicePhysicalInputViewDescription init](&v3, sel_init);
}

- (GCDevicePhysicalInputElementDescription)initWithCoder:(id)a3
{
  id v4;
  GCDevicePhysicalInputElementDescription *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSSet *aliases;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSString *localizedName;
  uint64_t v16;
  GCDevicePhysicalInputSymbolDescription *symbol;

  v4 = a3;
  v5 = -[GCDevicePhysicalInputElementDescription init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v6 = objc_claimAutoreleasedReturnValue();
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  v8 = objc_opt_class();
  +[NSSet setWithObjects:](&off_1F03A7348, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("aliases"));
  v10 = objc_claimAutoreleasedReturnValue();
  aliases = v5->_aliases;
  v5->_aliases = (NSSet *)v10;

  v12 = objc_opt_class();
  +[NSSet setWithObjects:](&off_1F03A7348, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("localizedName"));
  v14 = objc_claimAutoreleasedReturnValue();
  localizedName = v5->_localizedName;
  v5->_localizedName = (NSString *)v14;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("symbol"));
  v16 = objc_claimAutoreleasedReturnValue();

  symbol = v5->_symbol;
  v5->_symbol = (GCDevicePhysicalInputSymbolDescription *)v16;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_aliases, CFSTR("aliases"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedName, CFSTR("localizedName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_symbol, CFSTR("symbol"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;

  objc_opt_class();
  v4 = (id *)objc_opt_new();
  objc_storeStrong(v4 + 2, self->_identifier);
  objc_storeStrong(v4 + 3, self->_aliases);
  objc_storeStrong(v4 + 4, self->_localizedName);
  objc_storeStrong(v4 + 5, self->_symbol);
  return v4;
}

- (BOOL)validate:(id *)a3
{
  const __CFString **v5;
  uint64_t *v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (self->_identifier)
  {
    if (-[NSSet count](self->_aliases, "count"))
      return 1;
    if (a3)
    {
      v8 = *MEMORY[0x1E0CB2D68];
      v9 = CFSTR("Element must have one or more 'aliases'.");
      v5 = &v9;
      v6 = &v8;
      goto LABEL_8;
    }
  }
  else if (a3)
  {
    v10 = *MEMORY[0x1E0CB2D68];
    v11[0] = CFSTR("Element must have an 'identifier'.");
    v5 = (const __CFString **)v11;
    v6 = &v10;
LABEL_8:
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v5, v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError errorWithDomain:code:userInfo:](&off_1F03A6B68, "errorWithDomain:code:userInfo:", CFSTR("GCDevicePhysicalInputError"), 0, v7);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *identifier;
  NSSet *aliases;
  NSString *localizedName;
  GCDevicePhysicalInputSymbolDescription *symbol;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ((identifier = self->_identifier, identifier == (NSString *)v4[2])
     || -[NSString isEqual:](identifier, "isEqual:"))
    && ((aliases = self->_aliases, aliases == (NSSet *)v4[3]) || -[NSSet isEqual:](aliases, "isEqual:"))
    && ((localizedName = self->_localizedName, localizedName == (NSString *)v4[4])
     || -[NSString isEqual:](localizedName, "isEqual:")))
  {
    symbol = self->_symbol;
    if (symbol == (GCDevicePhysicalInputSymbolDescription *)v4[5])
      v9 = 1;
    else
      v9 = -[GCDevicePhysicalInputSymbolDescription isEqual:](symbol, "isEqual:");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)description
{
  NSString *identifier;
  void *v4;
  void *v5;
  void *v6;

  identifier = self->_identifier;
  -[NSSet allObjects](self->_aliases, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Element '%@' [%@] '%@'"), identifier, v5, self->_localizedName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSSet)aliases
{
  return self->_aliases;
}

- (void)setAliases:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (GCDevicePhysicalInputSymbolDescription)symbol
{
  return self->_symbol;
}

- (void)setSymbol:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbol, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_aliases, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
