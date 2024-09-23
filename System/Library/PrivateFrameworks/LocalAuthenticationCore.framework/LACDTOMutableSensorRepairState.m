@implementation LACDTOMutableSensorRepairState

- (LACDTOMutableSensorRepairState)initWithFlag:(int64_t)a3
{
  LACDTOMutableSensorRepairState *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LACDTOMutableSensorRepairState;
  result = -[LACDTOMutableSensorRepairState init](&v5, sel_init);
  if (result)
    result->_repairFlag = a3;
  return result;
}

+ (id)nullInstance
{
  LACDTOMutableSensorRepairState *v2;

  v2 = objc_alloc_init(LACDTOMutableSensorRepairState);
  -[LACDTOMutableSensorRepairState setRepairFlag:](v2, "setRepairFlag:", 0);
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_257089968))
  {
    v5 = v4;
    v6 = -[LACDTOMutableSensorRepairState repairFlag](self, "repairFlag");
    v7 = objc_msgSend(v5, "repairFlag");

    v8 = v6 == v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  int64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = -[LACDTOMutableSensorRepairState repairFlag](self, "repairFlag");
  if ((unint64_t)(v6 - 1) > 2)
    v7 = CFSTR("Unknown");
  else
    v7 = off_2510C2210[v6 - 1];
  objc_msgSend(v5, "stringWithFormat:", CFSTR("repairFlag: %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR("; "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p; %@>"), v4, self, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (int64_t)repairFlag
{
  return self->_repairFlag;
}

- (void)setRepairFlag:(int64_t)a3
{
  self->_repairFlag = a3;
}

@end
