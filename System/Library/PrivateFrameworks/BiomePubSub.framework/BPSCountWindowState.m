@implementation BPSCountWindowState

- (BPSCountWindowState)initWithCapacity:(unint64_t)a3 currentCount:(unint64_t)a4 identifier:(id)a5 aggregate:(id)a6 completed:(BOOL)a7
{
  BPSCountWindowState *result;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BPSCountWindowState;
  result = -[BPSWindowState initWithIdentifier:aggregate:completed:](&v10, sel_initWithIdentifier_aggregate_completed_, a5, a6, a7);
  if (result)
  {
    result->_capacity = a3;
    result->_currentCount = a4;
  }
  return result;
}

- (id)metadata
{
  return -[BPSCountWindowMetadata initWithCurrentCount:]([BPSCountWindowMetadata alloc], "initWithCurrentCount:", -[BPSCountWindowState currentCount](self, "currentCount"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BPSCountWindowState;
  v4 = a3;
  -[BPSWindowState encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[BPSCountWindowState capacity](self, "capacity", v7.receiver, v7.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("capacity"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[BPSCountWindowState currentCount](self, "currentCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("currentCount"));

}

- (BPSCountWindowState)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BPSCountWindowState *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("capacity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6
      && (v9.receiver = self,
          v9.super_class = (Class)BPSCountWindowState,
          (self = -[BPSWindowState initWithCoder:](&v9, sel_initWithCoder_, v4)) != 0))
    {
      -[BPSCountWindowState setCapacity:](self, "setCapacity:", objc_msgSend(v5, "unsignedIntegerValue"));
      -[BPSCountWindowState setCurrentCount:](self, "setCurrentCount:", objc_msgSend(v6, "unsignedIntegerValue"));
      self = self;
      v7 = self;
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (void)setCapacity:(unint64_t)a3
{
  self->_capacity = a3;
}

- (unint64_t)currentCount
{
  return self->_currentCount;
}

- (void)setCurrentCount:(unint64_t)a3
{
  self->_currentCount = a3;
}

@end
