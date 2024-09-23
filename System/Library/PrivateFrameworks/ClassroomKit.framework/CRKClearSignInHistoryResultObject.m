@implementation CRKClearSignInHistoryResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKClearSignInHistoryResultObject)initWithCoder:(id)a3
{
  id v4;
  CRKClearSignInHistoryResultObject *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRKClearSignInHistoryResultObject;
  v5 = -[CATTaskResultObject initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("countOfRemovedRecords"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_countOfRemovedRecords = objc_msgSend(v6, "unsignedIntegerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRKClearSignInHistoryResultObject;
  v4 = a3;
  -[CATTaskResultObject encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CRKClearSignInHistoryResultObject countOfRemovedRecords](self, "countOfRemovedRecords", v6.receiver, v6.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("countOfRemovedRecords"));

}

- (unint64_t)countOfRemovedRecords
{
  return self->_countOfRemovedRecords;
}

- (void)setCountOfRemovedRecords:(unint64_t)a3
{
  self->_countOfRemovedRecords = a3;
}

@end
