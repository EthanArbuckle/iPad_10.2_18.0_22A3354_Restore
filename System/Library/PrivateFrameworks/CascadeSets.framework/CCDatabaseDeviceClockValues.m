@implementation CCDatabaseDeviceClockValues

- (CCDatabaseDeviceClockValues)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (CCDatabaseDeviceClockValues)initWithDeviceRowId:(id)a3 missingAtomsImplied:(BOOL)a4
{
  id v7;
  CCDatabaseDeviceClockValues *v8;
  CCDatabaseDeviceClockValues *v9;
  NSMutableIndexSet *v10;
  NSMutableIndexSet *present;
  NSMutableIndexSet *v12;
  NSMutableIndexSet *tombstoned;
  NSMutableIndexSet *v14;
  NSMutableIndexSet *missing;
  objc_super v17;

  v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CCDatabaseDeviceClockValues;
  v8 = -[CCDatabaseDeviceClockValues init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_deviceRowId, a3);
    v9->_max = 0;
    v10 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x24BDD1698]);
    present = v9->_present;
    v9->_present = v10;

    v12 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x24BDD1698]);
    tombstoned = v9->_tombstoned;
    v9->_tombstoned = v12;

    if (!a4)
    {
      v14 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x24BDD1698]);
      missing = v9->_missing;
      v9->_missing = v14;

    }
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_max);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("max: %@, present: %@, tombstoned: %@, missing: %@"), v4, self->_present, self->_tombstoned, self->_missing);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)updateMax:(unint64_t)a3
{
  if (self->_max < a3)
    self->_max = a3;
}

- (NSNumber)deviceRowId
{
  return self->_deviceRowId;
}

- (unint64_t)max
{
  return self->_max;
}

- (NSMutableIndexSet)present
{
  return self->_present;
}

- (NSMutableIndexSet)tombstoned
{
  return self->_tombstoned;
}

- (NSMutableIndexSet)missing
{
  return self->_missing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_missing, 0);
  objc_storeStrong((id *)&self->_tombstoned, 0);
  objc_storeStrong((id *)&self->_present, 0);
  objc_storeStrong((id *)&self->_deviceRowId, 0);
}

@end
