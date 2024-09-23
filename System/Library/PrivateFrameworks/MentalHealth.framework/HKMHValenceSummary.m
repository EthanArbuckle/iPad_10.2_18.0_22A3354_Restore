@implementation HKMHValenceSummary

- (HKMHValenceSummary)initWithCountPleasant:(int64_t)a3 countNeutral:(int64_t)a4 countUnpleasant:(int64_t)a5 dayIndexRange:(id)a6
{
  HKMHValenceSummary *result;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HKMHValenceSummary;
  result = -[HKMHValenceSummary init](&v10, sel_init, a3, a4, a5, a6.var0, a6.var1);
  if (result)
  {
    result->_countPleasant = a3;
    result->_countNeutral = a4;
    result->_countUnpleasant = a5;
  }
  return result;
}

- (HKMHValenceSummary)initWithDayIndexRange:(id)a3
{
  return -[HKMHValenceSummary initWithCountPleasant:countNeutral:countUnpleasant:dayIndexRange:](self, "initWithCountPleasant:countNeutral:countUnpleasant:dayIndexRange:", 0, 0, 0, a3.var0, a3.var1);
}

- (int64_t)totalCount
{
  return self->_countNeutral + self->_countPleasant + self->_countUnpleasant;
}

- (void)_addValence:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) <= 6)
    ++*(Class *)((char *)&self->super.isa + qword_2416EF140[a3 - 1]);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v7 = self->_countPleasant == v5[1]
      && self->_countNeutral == v5[2]
      && self->_countUnpleasant == v5[3]
      && self->_dayIndexRange.start == v5[4]
      && self->_dayIndexRange.duration == v5[5];

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  int8x16_t v2;

  v2 = veorq_s8(*(int8x16_t *)&self->_countNeutral, (int8x16_t)self->_dayIndexRange);
  return *(_QWORD *)&veor_s8(*(int8x8_t *)v2.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v2, v2, 8uLL)) ^ self->_countPleasant;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_countPleasant);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_countNeutral);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_countUnpleasant);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromHKDayIndexRange();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p Counts pleasant:%@ neutral:%@ unpleasant:%@ day index range:%@>"), v4, self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMHValenceSummary)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CountPleasant"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CountUnpleasant"));
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CountNeutral"));
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("DayIndexRangeStart"));
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("DayIndexRangeDuration"));

  return -[HKMHValenceSummary initWithCountPleasant:countNeutral:countUnpleasant:dayIndexRange:](self, "initWithCountPleasant:countNeutral:countUnpleasant:dayIndexRange:", v5, v7, v6, v8, v9);
}

- (void)encodeWithCoder:(id)a3
{
  int64_t countPleasant;
  id v5;

  countPleasant = self->_countPleasant;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", countPleasant, CFSTR("CountPleasant"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_countNeutral, CFSTR("CountNeutral"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_countUnpleasant, CFSTR("CountUnpleasant"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_dayIndexRange.start, CFSTR("DayIndexRangeStart"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_dayIndexRange.duration, CFSTR("DayIndexRangeDuration"));

}

- ($0AC6E346AE4835514AAA8AC86D8F4844)dayIndexRange
{
  int64_t duration;
  int64_t start;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  duration = self->_dayIndexRange.duration;
  start = self->_dayIndexRange.start;
  result.var1 = duration;
  result.var0 = start;
  return result;
}

- (int64_t)countPleasant
{
  return self->_countPleasant;
}

- (void)setCountPleasant:(int64_t)a3
{
  self->_countPleasant = a3;
}

- (int64_t)countNeutral
{
  return self->_countNeutral;
}

- (void)setCountNeutral:(int64_t)a3
{
  self->_countNeutral = a3;
}

- (int64_t)countUnpleasant
{
  return self->_countUnpleasant;
}

- (void)setCountUnpleasant:(int64_t)a3
{
  self->_countUnpleasant = a3;
}

@end
