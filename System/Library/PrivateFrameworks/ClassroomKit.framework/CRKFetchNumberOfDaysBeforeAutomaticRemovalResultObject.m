@implementation CRKFetchNumberOfDaysBeforeAutomaticRemovalResultObject

- (CRKFetchNumberOfDaysBeforeAutomaticRemovalResultObject)initWithNumberOfDaysBeforeAutomaticRemoval:(int64_t)a3
{
  CRKFetchNumberOfDaysBeforeAutomaticRemovalResultObject *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRKFetchNumberOfDaysBeforeAutomaticRemovalResultObject;
  result = -[CATTaskResultObject init](&v5, sel_init);
  if (result)
    result->_numberOfDaysBeforeAutomaticRemoval = a3;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchNumberOfDaysBeforeAutomaticRemovalResultObject)initWithCoder:(id)a3
{
  id v4;
  CRKFetchNumberOfDaysBeforeAutomaticRemovalResultObject *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRKFetchNumberOfDaysBeforeAutomaticRemovalResultObject;
  v5 = -[CATTaskResultObject initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("numberOfDaysBeforeAutomaticRemoval"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_numberOfDaysBeforeAutomaticRemoval = objc_msgSend(v6, "integerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRKFetchNumberOfDaysBeforeAutomaticRemovalResultObject;
  v4 = a3;
  -[CATTaskResultObject encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[CRKFetchNumberOfDaysBeforeAutomaticRemovalResultObject numberOfDaysBeforeAutomaticRemoval](self, "numberOfDaysBeforeAutomaticRemoval", v6.receiver, v6.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("numberOfDaysBeforeAutomaticRemoval"));

}

- (int64_t)numberOfDaysBeforeAutomaticRemoval
{
  return self->_numberOfDaysBeforeAutomaticRemoval;
}

- (void)setNumberOfDaysBeforeAutomaticRemoval:(int64_t)a3
{
  self->_numberOfDaysBeforeAutomaticRemoval = a3;
}

@end
