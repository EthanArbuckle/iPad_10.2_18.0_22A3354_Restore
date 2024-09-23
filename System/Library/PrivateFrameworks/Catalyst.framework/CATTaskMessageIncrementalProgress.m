@implementation CATTaskMessageIncrementalProgress

- (CATTaskMessageIncrementalProgress)initWithTaskUUID:(id)a3 completedUnitCount:(int64_t)a4 totalUnitCount:(int64_t)a5
{
  CATTaskMessageIncrementalProgress *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CATTaskMessageIncrementalProgress;
  result = -[CATTaskMessage initWithTaskUUID:](&v8, sel_initWithTaskUUID_, a3);
  if (result)
  {
    result->_completedUnitCount = a4;
    result->_totalUnitCount = a5;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CATTaskMessageIncrementalProgress)initWithCoder:(id)a3
{
  id v4;
  CATTaskMessageIncrementalProgress *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CATTaskMessageIncrementalProgress;
  v5 = -[CATTaskMessage initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("completedUnitCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_completedUnitCount = objc_msgSend(v6, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalUnitCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_totalUnitCount = objc_msgSend(v7, "integerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CATTaskMessageIncrementalProgress;
  v4 = a3;
  -[CATTaskMessage encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[CATTaskMessageIncrementalProgress completedUnitCount](self, "completedUnitCount", v7.receiver, v7.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("completedUnitCount"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[CATTaskMessageIncrementalProgress totalUnitCount](self, "totalUnitCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("totalUnitCount"));

}

- (int64_t)completedUnitCount
{
  return self->_completedUnitCount;
}

- (void)setCompletedUnitCount:(int64_t)a3
{
  self->_completedUnitCount = a3;
}

- (int64_t)totalUnitCount
{
  return self->_totalUnitCount;
}

- (void)setTotalUnitCount:(int64_t)a3
{
  self->_totalUnitCount = a3;
}

@end
