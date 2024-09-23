@implementation CRFDRRCHL

- (CRFDRRCHL)initWithrepairDateStr:(id)a3 repairDate:(id)a4 repairCenter:(id)a5 dataClasses:(id)a6 properties:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  CRFDRRCHL *v17;
  id *p_isa;
  CRFDRRCHL *v19;
  NSObject *v20;
  id v22;
  objc_super v23;

  v13 = a3;
  v22 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v13)
  {
    v23.receiver = self;
    v23.super_class = (Class)CRFDRRCHL;
    v17 = -[CRFDRRCHL init](&v23, sel_init);
    p_isa = (id *)&v17->super.isa;
    if (v17)
    {
      objc_storeStrong((id *)&v17->_repairDateStr, a3);
      objc_storeStrong(p_isa + 2, a4);
      objc_storeStrong(p_isa + 3, a5);
      objc_storeStrong(p_isa + 4, a6);
      objc_storeStrong(p_isa + 5, a7);
    }
    self = p_isa;
    v19 = self;
  }
  else
  {
    sub_22AC82A9C(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_22AC85AA0(v20);

    v19 = 0;
  }

  return v19;
}

- (CRFDRRCHL)init
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Please use initWithTime"));

  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[CRFDRRCHL repairDateStr](self, "repairDateStr");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRFDRRCHL repairDate](self, "repairDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRFDRRCHL repairCenter](self, "repairCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRFDRRCHL dataClasses](self, "dataClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRFDRRCHL properties](self, "properties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[CRRepairHistory: timeStr:%@: repairDate:%@ repairCenter:%@: dataClasses:%@: properties:%@:]"), v4, v5, v6, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)repairDateStr
{
  return self->_repairDateStr;
}

- (void)setRepairDateStr:(id)a3
{
  objc_storeStrong((id *)&self->_repairDateStr, a3);
}

- (NSDate)repairDate
{
  return self->_repairDate;
}

- (void)setRepairDate:(id)a3
{
  objc_storeStrong((id *)&self->_repairDate, a3);
}

- (NSString)repairCenter
{
  return self->_repairCenter;
}

- (void)setRepairCenter:(id)a3
{
  objc_storeStrong((id *)&self->_repairCenter, a3);
}

- (NSSet)dataClasses
{
  return self->_dataClasses;
}

- (void)setDataClasses:(id)a3
{
  objc_storeStrong((id *)&self->_dataClasses, a3);
}

- (NSSet)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->_properties, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_dataClasses, 0);
  objc_storeStrong((id *)&self->_repairCenter, 0);
  objc_storeStrong((id *)&self->_repairDate, 0);
  objc_storeStrong((id *)&self->_repairDateStr, 0);
}

@end
