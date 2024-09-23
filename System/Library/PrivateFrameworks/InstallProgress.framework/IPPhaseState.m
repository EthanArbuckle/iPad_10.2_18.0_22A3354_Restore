@implementation IPPhaseState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IPPhaseState)initWithCoder:(id)a3
{
  id v4;
  IPPhaseState *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)IPPhaseState;
  v5 = -[IPPhaseState init](&v7, sel_init);
  if (v5)
  {
    v5->_totalUnitCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("totalUnitCount"));
    v5->_completedUnitCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("completedUnitCount"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t totalUnitCount;
  id v5;

  totalUnitCount = self->_totalUnitCount;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", totalUnitCount, CFSTR("totalUnitCount"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_completedUnitCount, CFSTR("completedUnitCount"));

}

@end
