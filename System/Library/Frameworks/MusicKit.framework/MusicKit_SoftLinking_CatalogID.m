@implementation MusicKit_SoftLinking_CatalogID

- (MusicKit_SoftLinking_CatalogID)initWithValue:(id)a3 kind:(int64_t)a4
{
  id v6;
  MusicKit_SoftLinking_CatalogID *v7;
  uint64_t v8;
  NSString *value;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MusicKit_SoftLinking_CatalogID;
  v7 = -[MusicKit_SoftLinking_CatalogID init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    value = v7->_value;
    v7->_value = (NSString *)v8;

    v7->_kind = a4;
  }

  return v7;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  unint64_t kind;
  __CFString *v8;

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p"), v5, self);

  objc_msgSend(v6, "appendFormat:", CFSTR("; value = \"%@\"), self->_value);
  kind = self->_kind;
  if (kind > 8)
    v8 = 0;
  else
    v8 = off_24CD1D320[kind];
  objc_msgSend(v6, "appendFormat:", CFSTR("; kind = %@"), v8);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (NSString)value
{
  return self->_value;
}

- (int64_t)kind
{
  return self->_kind;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
