@implementation PKVectorTimestampElement

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  BOOL v7;

  v4 = a3;
  v5 = -[PKVectorTimestampElement clock](self, "clock");
  if (v5 == objc_msgSend(v4, "clock"))
  {
    v6 = -[PKVectorTimestampElement subclock](self, "subclock");
    v7 = v6 == objc_msgSend(v4, "subclock");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[PKVectorTimestampElement clock](self, "clock");
  return v3 ^ (-[PKVectorTimestampElement subclock](self, "subclock") << 16);
}

- (unint64_t)clock
{
  return self->_clock;
}

- (void)setClock:(unint64_t)a3
{
  self->_clock = a3;
}

- (unint64_t)subclock
{
  return self->_subclock;
}

- (void)setSubclock:(unint64_t)a3
{
  self->_subclock = a3;
}

@end
