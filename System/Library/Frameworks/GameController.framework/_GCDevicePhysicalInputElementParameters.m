@implementation _GCDevicePhysicalInputElementParameters

- (uint64_t)identifier
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

- (uint64_t)aliases
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (uint64_t)localizedName
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (uint64_t)symbol
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

+ (id)parametersWithIdentifier:(id)a3
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  v4 = (_QWORD *)objc_opt_new();
  v5 = objc_msgSend(v3, "copy");

  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_GCDevicePhysicalInputElementParameters;
  v4 = -[_GCDevicePhysicalInputViewParameters copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 1, self->_identifier);
  objc_storeStrong(v4 + 2, self->_aliases);
  objc_storeStrong(v4 + 3, self->_localizedName);
  objc_storeStrong(v4 + 4, self->_symbol);
  return v4;
}

- (unint64_t)hash
{
  if (self)
    self = (_GCDevicePhysicalInputElementParameters *)self->_identifier;
  return -[_GCDevicePhysicalInputElementParameters hash](self, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *identifier;
  NSSet *aliases;
  NSString *localizedName;
  GCDevicePhysicalInputSymbolDescription *symbol;
  char v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_GCDevicePhysicalInputElementParameters;
  if (-[_GCDevicePhysicalInputViewParameters isEqual:](&v11, sel_isEqual_, v4)
    && ((identifier = self->_identifier, identifier == (NSString *)v4[1])
     || -[NSString isEqual:](identifier, "isEqual:"))
    && ((aliases = self->_aliases, aliases == (NSSet *)v4[2]) || -[NSSet isEqual:](aliases, "isEqual:"))
    && ((localizedName = self->_localizedName, localizedName == (NSString *)v4[3])
     || -[NSString isEqual:](localizedName, "isEqual:")))
  {
    symbol = self->_symbol;
    if (symbol == (GCDevicePhysicalInputSymbolDescription *)v4[4])
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

- (void)setIdentifier:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 8);
}

- (void)setAliases:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 16);
}

- (void)setLocalizedName:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 24);
}

- (void)setSymbol:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbol, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_aliases, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
