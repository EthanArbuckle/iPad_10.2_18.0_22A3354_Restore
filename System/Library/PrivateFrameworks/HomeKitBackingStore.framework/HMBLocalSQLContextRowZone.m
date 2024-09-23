@implementation HMBLocalSQLContextRowZone

- (HMBLocalSQLContextRowZone)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMBLocalSQLContextRowZone;
  return -[HMBLocalSQLContextRowZone init](&v3, sel_init);
}

- (HMBLocalSQLContextRowZone)initWithZoneRow:(unint64_t)a3
{
  HMBLocalSQLContextRowZone *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMBLocalSQLContextRowZone;
  result = -[HMBLocalSQLContextRowZone init](&v5, sel_init);
  if (result)
    result->_zoneRow = a3;
  return result;
}

- (HMBLocalSQLContextRowZone)initWithZoneRow:(unint64_t)a3 name:(id)a4 token:(id)a5
{
  id v8;
  id v9;
  HMBLocalSQLContextRowZone *v10;
  HMBLocalSQLContextRowZone *v11;
  HMBLocalZoneIDRow *v12;
  HMBLocalZoneID *identifier;
  objc_super v15;

  v8 = a4;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMBLocalSQLContextRowZone;
  v10 = -[HMBLocalSQLContextRowZone init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_zoneRow = a3;
    v12 = -[HMBLocalZoneIDRow initWithName:token:]([HMBLocalZoneIDRow alloc], "initWithName:token:", v8, v9);
    identifier = v11->_identifier;
    v11->_identifier = (HMBLocalZoneID *)v12;

  }
  return v11;
}

- (id)debugDescription
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[HMBLocalSQLContextRowZone zoneRow](self, "zoneRow");
  -[HMBLocalSQLContextRowZone identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%lu: %@>"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[HMBLocalSQLContextRowZone zoneRow](self, "zoneRow");
  -[HMBLocalSQLContextRowZone identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%lu.%@>"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (HMBLocalZoneID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (unint64_t)zoneRow
{
  return self->_zoneRow;
}

- (void)setZoneRow:(unint64_t)a3
{
  self->_zoneRow = a3;
}

- (NSUUID)replication
{
  return self->_replication;
}

- (void)setReplication:(id)a3
{
  objc_storeStrong((id *)&self->_replication, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replication, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
