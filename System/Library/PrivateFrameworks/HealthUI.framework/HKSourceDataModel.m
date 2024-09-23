@implementation HKSourceDataModel

- (HKSourceDataModel)initWithSource:(id)a3
{
  id v5;
  HKSourceDataModel *v6;
  HKSourceDataModel *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKSourceDataModel;
  v6 = -[HKSourceDataModel init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_source, a3);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HKSourceDataModel *v4;

  v4 = -[HKSourceDataModel initWithSource:](+[HKSourceDataModel allocWithZone:](HKSourceDataModel, "allocWithZone:", a3), "initWithSource:", self->_source);
  -[HKSourceDataModel setIcon:](v4, "setIcon:", self->_icon);
  -[HKSourceDataModel setInstalled:](v4, "setInstalled:", self->_installed);
  -[HKSourceDataModel setPurposeStrings:](v4, "setPurposeStrings:", self->_purposeStrings);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HKSource *source;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    source = self->_source;
    objc_msgSend(v4, "source");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HKSource isEqual:](source, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return -[HKSource hash](self->_source, "hash");
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HKSource bundleIdentifier](self->_source, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p bundleIdentifier:%@ installed:%i icon:%@>"), v4, self, v5, self->_installed, self->_icon);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HKSource)source
{
  return self->_source;
}

- (BOOL)installed
{
  return self->_installed;
}

- (void)setInstalled:(BOOL)a3
{
  self->_installed = a3;
}

- (UIImage)icon
{
  return (UIImage *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIcon:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDictionary)purposeStrings
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPurposeStrings:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purposeStrings, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

@end
