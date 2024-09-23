@implementation MRUMirroringMenuModuleItem

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRUMirroringMenuModuleItem;
  if (-[CCUIMenuModuleItem isEqual:](&v9, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[MRUMirroringMenuModuleItem symbolName](self, "symbolName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "symbolName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MRUMirroringMenuModuleItem;
  v3 = -[CCUIMenuModuleItem hash](&v7, sel_hash);
  -[MRUMirroringMenuModuleItem symbolName](self, "symbolName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (void)setSymbolName:(id)a3
{
  objc_storeStrong((id *)&self->_symbolName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolName, 0);
}

@end
