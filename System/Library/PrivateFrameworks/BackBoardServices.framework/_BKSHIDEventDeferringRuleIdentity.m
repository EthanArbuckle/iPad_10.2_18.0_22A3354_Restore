@implementation _BKSHIDEventDeferringRuleIdentity

- (_BKSHIDEventDeferringRuleIdentity)initWithSeed:(unsigned int)a3 pid:(int)a4
{
  _BKSHIDEventDeferringRuleIdentity *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_BKSHIDEventDeferringRuleIdentity;
  result = -[_BKSHIDEventDeferringRuleIdentity init](&v7, sel_init);
  if (result)
  {
    result->_seed = a3;
    result->_pid = a4;
  }
  return result;
}

- (unint64_t)hash
{
  return self->_pid ^ self->_seed;
}

- (BOOL)isEqual:(id)a3
{
  _BKSHIDEventDeferringRuleIdentity *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (_BKSHIDEventDeferringRuleIdentity *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    v6 = v5 == objc_opt_class() && self->_seed == v4->_seed && self->_pid == v4->_pid;
  }

  return v6;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t pid;
  id v5;

  pid = self->_pid;
  v5 = a3;
  objc_msgSend(v5, "encodeInt:forKey:", pid, CFSTR("pid"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_seed, CFSTR("seed"));

}

- (_BKSHIDEventDeferringRuleIdentity)initWithCoder:(id)a3
{
  id v4;
  _BKSHIDEventDeferringRuleIdentity *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_BKSHIDEventDeferringRuleIdentity;
  v5 = -[_BKSHIDEventDeferringRuleIdentity init](&v7, sel_init);
  if (v5)
  {
    v5->_pid = objc_msgSend(v4, "decodeIntForKey:", CFSTR("pid"));
    v5->_seed = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("seed"));
  }

  return v5;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __66___BKSHIDEventDeferringRuleIdentity_appendDescriptionToFormatter___block_invoke;
  v3[3] = &unk_1E1EA0988;
  v3[4] = self;
  objc_msgSend(a3, "appendCustomFormatWithName:block:", 0, v3);
}

- (unsigned)seed
{
  return self->_seed;
}

- (int)pid
{
  return self->_pid;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
