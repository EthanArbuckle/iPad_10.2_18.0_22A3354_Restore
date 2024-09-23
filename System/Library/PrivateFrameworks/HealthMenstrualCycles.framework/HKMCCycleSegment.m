@implementation HKMCCycleSegment

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("Type"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_days.start, CFSTR("DaysStart"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_days.duration, CFSTR("DaysDuration"));

}

- (HKMCCycleSegment)initWithCoder:(id)a3
{
  id v4;
  HKMCCycleSegment *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HKMCCycleSegment;
  v5 = -[HKMCCycleSegment init](&v7, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Type"));
    v5->_days.start = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("DaysStart"));
    v5->_days.duration = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("DaysDuration"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_menstruationSegmentWithDays:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithType:days:", 0, a3.var0, a3.var1);
}

+ (id)_fertileWindowSegmentWithDays:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithType:days:", 1, a3.var0, a3.var1);
}

- (id)_initWithType:(int64_t)a3 days:(id)a4
{
  int64_t var1;
  int64_t var0;
  id result;
  objc_super v8;

  var1 = a4.var1;
  var0 = a4.var0;
  v8.receiver = self;
  v8.super_class = (Class)HKMCCycleSegment;
  result = -[HKMCCycleSegment init](&v8, sel_init);
  if (result)
  {
    *((_QWORD *)result + 2) = var1;
    *((_QWORD *)result + 3) = a3;
    *((_QWORD *)result + 1) = var0;
  }
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_type);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromHKDayIndexRange();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p type:%@ days:%@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)hk_redactedDescription
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), self);
}

- (BOOL)isEqual:(id)a3
{
  HKMCCycleSegment *v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v11;

  v4 = (HKMCCycleSegment *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v5 = -[HKMCCycleSegment type](self, "type"), v5 == -[HKMCCycleSegment type](v4, "type")))
    {
      v6 = -[HKMCCycleSegment days](self, "days");
      v8 = v7;
      v11 = v6 == -[HKMCCycleSegment days](v4, "days") && v8 == v9;
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  return self->_days.start ^ self->_type ^ self->_days.duration;
}

- (int64_t)type
{
  return self->_type;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)days
{
  int64_t duration;
  int64_t start;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  duration = self->_days.duration;
  start = self->_days.start;
  result.var1 = duration;
  result.var0 = start;
  return result;
}

@end
