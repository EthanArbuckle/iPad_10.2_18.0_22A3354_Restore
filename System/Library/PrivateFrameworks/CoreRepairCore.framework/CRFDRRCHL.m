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
    handleForCategory(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_21456CB18(v20);

    v19 = 0;
  }

  return v19;
}

- (CRFDRRCHL)init
{
  objc_msgSend_raise_format_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB0], (uint64_t)CFSTR("Please use initWithTime"));

  return 0;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;

  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_repairDateStr(self, a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_repairDate(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_repairCenter(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataClasses(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_properties(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v31, (uint64_t)CFSTR("[CRRepairHistory: timeStr:%@: repairDate:%@ repairCenter:%@: dataClasses:%@: properties:%@:]"), v32, v6, v10, v14, v22, v30);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
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
