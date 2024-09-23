@implementation HKDataCollectorState

- (HKDataCollectorState)init
{
  HKDataCollectorState *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKDataCollectorState;
  result = -[HKDataCollectorState init](&v3, sel_init);
  if (result)
  {
    result->_collectionType = 0;
    result->_priority = 0;
  }
  return result;
}

- (HKDataCollectorState)initWithType:(unint64_t)a3 priority:(int64_t)a4
{
  HKDataCollectorState *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKDataCollectorState;
  result = -[HKDataCollectorState init](&v7, sel_init);
  if (result)
  {
    result->_collectionType = a3;
    result->_priority = a4;
  }
  return result;
}

- (id)cloneWithNewType:(unint64_t)a3
{
  *((_QWORD *)self + 1) = a3;
  return self;
}

- (id)cloneWithNewPriority:(int64_t)a3
{
  *((_QWORD *)self + 2) = a3;
  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[HKDataCollectorState initWithType:priority:](+[HKDataCollectorState allocWithZone:](HKDataCollectorState, "allocWithZone:", a3), "initWithType:priority:", self->_collectionType, self->_priority);
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_priority == v4[2] && self->_collectionType == v4[1];

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  HKDataCollectionTypeToString(self->_collectionType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@, priority %ld>"), v4, self->_priority);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t priority;
  id v5;

  priority = self->_priority;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", priority, CFSTR("HKDataCollectorStatePriorityKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_collectionType, CFSTR("HKDataCollectorStateTypeKey"));

}

- (HKDataCollectorState)initWithCoder:(id)a3
{
  id v4;
  HKDataCollectorState *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HKDataCollectorState;
  v5 = -[HKDataCollectorState init](&v7, sel_init);
  if (v5)
  {
    v5->_priority = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HKDataCollectorStatePriorityKey"));
    v5->_collectionType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HKDataCollectorStateTypeKey"));
  }

  return v5;
}

- (unint64_t)collectionType
{
  return self->_collectionType;
}

- (int64_t)priority
{
  return self->_priority;
}

@end
