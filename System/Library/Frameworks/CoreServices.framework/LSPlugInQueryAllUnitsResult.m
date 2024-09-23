@implementation LSPlugInQueryAllUnitsResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LSPlugInQueryAllUnitsResult)initWithPlugInUnits:(id)a3 forDatabaseWithUUID:(id)a4
{
  id v6;
  id v7;
  LSPlugInQueryAllUnitsResult *v8;
  uint64_t v9;
  NSArray *pluginUnits;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LSPlugInQueryAllUnitsResult;
  v8 = -[_LSQueryResult _init](&v12, sel__init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    pluginUnits = v8->_pluginUnits;
    v8->_pluginUnits = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_dbUUID, a4);
  }

  return v8;
}

- (LSPlugInQueryAllUnitsResult)initWithCoder:(id)a3
{
  id v4;
  LSPlugInQueryAllUnitsResult *v5;
  uint64_t v6;
  NSArray *pluginUnits;
  uint64_t v8;
  NSUUID *dbUUID;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LSPlugInQueryAllUnitsResult;
  v5 = -[_LSQueryResult initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "ls_decodeArrayWithValuesOfClass:forKey:", objc_opt_class(), CFSTR("pluginUnits"));
    v6 = objc_claimAutoreleasedReturnValue();
    pluginUnits = v5->_pluginUnits;
    v5->_pluginUnits = (NSArray *)v6;

    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dbUUID"));
    v8 = objc_claimAutoreleasedReturnValue();
    dbUUID = v5->_dbUUID;
    v5->_dbUUID = (NSUUID *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *pluginUnits;
  id v5;

  pluginUnits = self->_pluginUnits;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", pluginUnits, CFSTR("pluginUnits"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dbUUID, CFSTR("dbUUID"));

}

- (NSArray)pluginUnits
{
  return self->_pluginUnits;
}

- (NSUUID)dbUUID
{
  return self->_dbUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dbUUID, 0);
  objc_storeStrong((id *)&self->_pluginUnits, 0);
}

@end
