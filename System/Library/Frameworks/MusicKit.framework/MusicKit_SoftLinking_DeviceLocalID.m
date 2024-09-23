@implementation MusicKit_SoftLinking_DeviceLocalID

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseID, 0);
}

- (MusicKit_SoftLinking_DeviceLocalID)initWithValue:(int64_t)a3 databaseID:(id)a4
{
  id v6;
  MusicKit_SoftLinking_DeviceLocalID *v7;
  MusicKit_SoftLinking_DeviceLocalID *v8;
  uint64_t v9;
  NSString *databaseID;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MusicKit_SoftLinking_DeviceLocalID;
  v7 = -[MusicKit_SoftLinking_DeviceLocalID init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_value = a3;
    v9 = objc_msgSend(v6, "copy");
    databaseID = v8->_databaseID;
    v8->_databaseID = (NSString *)v9;

  }
  return v8;
}

- (int64_t)value
{
  return self->_value;
}

- (NSString)databaseID
{
  return self->_databaseID;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p"), v5, self);

  objc_msgSend(v6, "appendFormat:", CFSTR("; value = \"%lld\"), self->_value);
  objc_msgSend(v6, "appendFormat:", CFSTR("; databaseID = \"%@\"), self->_databaseID);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

@end
