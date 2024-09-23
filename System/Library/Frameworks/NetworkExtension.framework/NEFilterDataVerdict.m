@implementation NEFilterDataVerdict

- (NEFilterDataVerdict)initWithCoder:(id)a3
{
  id v4;
  NEFilterDataVerdict *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NEFilterDataVerdict;
  v5 = -[NEFilterVerdict initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_passBytes = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("PassBytes"));
    v5->_peekBytes = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("PeekBytes"));
    v5->_statisticsReportFrequency = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("StatisticsReportFrequency"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NEFilterDataVerdict;
  v4 = a3;
  -[NEFilterVerdict encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", -[NEFilterDataVerdict passBytes](self, "passBytes", v5.receiver, v5.super_class), CFSTR("PassBytes"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[NEFilterDataVerdict peekBytes](self, "peekBytes"), CFSTR("PeekBytes"));
  objc_msgSend(v4, "encodeInt:forKey:", -[NEFilterDataVerdict statisticsReportFrequency](self, "statisticsReportFrequency"), CFSTR("StatisticsReportFrequency"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NEFilterDataVerdict;
  v4 = -[NEFilterVerdict copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setPassBytes:", -[NEFilterDataVerdict passBytes](self, "passBytes"));
  objc_msgSend(v4, "setPeekBytes:", -[NEFilterDataVerdict peekBytes](self, "peekBytes"));
  objc_msgSend(v4, "setStatisticsReportFrequency:", -[NEFilterDataVerdict statisticsReportFrequency](self, "statisticsReportFrequency"));
  return v4;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  NEFilterReportFrequency v8;
  const __CFString *v9;
  objc_super v11;

  v5 = *(_QWORD *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)NEFilterDataVerdict;
  -[NEFilterVerdict descriptionWithIndent:options:](&v11, sel_descriptionWithIndent_options_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEFilterDataVerdict passBytes](self, "passBytes"), CFSTR("passBytes"), v5, a4);
  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEFilterDataVerdict peekBytes](self, "peekBytes"), CFSTR("peekBytes"), v5, a4);
  v8 = -[NEFilterDataVerdict statisticsReportFrequency](self, "statisticsReportFrequency");
  objc_opt_self();
  if ((unint64_t)(v8 - 1) > 2)
    v9 = CFSTR("none");
  else
    v9 = off_1E3CC0610[v8 - 1];
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v9, CFSTR("statisticsReportFrequency"), v5, a4);
  return v7;
}

- (int64_t)filterAction
{
  int64_t result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NEFilterDataVerdict;
  result = -[NEFilterVerdict filterAction](&v4, sel_filterAction);
  if (!result)
  {
    if (-[NEFilterVerdict drop](self, "drop")
      || self && self->super._remediate
      || -[NEFilterDataVerdict passBytes](self, "passBytes") != -1)
    {
      return 4;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (NEFilterReportFrequency)statisticsReportFrequency
{
  return self->_statisticsReportFrequency;
}

- (void)setStatisticsReportFrequency:(NEFilterReportFrequency)statisticsReportFrequency
{
  self->_statisticsReportFrequency = statisticsReportFrequency;
}

- (unint64_t)passBytes
{
  return self->_passBytes;
}

- (void)setPassBytes:(unint64_t)a3
{
  self->_passBytes = a3;
}

- (unint64_t)peekBytes
{
  return self->_peekBytes;
}

- (void)setPeekBytes:(unint64_t)a3
{
  self->_peekBytes = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NEFilterDataVerdict)needRulesVerdict
{
  void *v2;

  +[NEFilterDataVerdict allowVerdict](NEFilterDataVerdict, "allowVerdict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedRules:", 1);
  return (NEFilterDataVerdict *)v2;
}

+ (NEFilterDataVerdict)allowVerdict
{
  NEFilterDataVerdict *v2;

  v2 = -[NEFilterVerdict initWithDrop:remediate:]([NEFilterDataVerdict alloc], "initWithDrop:remediate:", 0, 0);
  -[NEFilterDataVerdict setPassBytes:](v2, "setPassBytes:", -1);
  return v2;
}

+ (NEFilterDataVerdict)dropVerdict
{
  return -[NEFilterVerdict initWithDrop:remediate:]([NEFilterDataVerdict alloc], "initWithDrop:remediate:", 1, 0);
}

+ (NEFilterDataVerdict)remediateVerdictWithRemediationURLMapKey:(NSString *)remediationURLMapKey remediationButtonTextMapKey:(NSString *)remediationButtonTextMapKey
{
  NSString *v5;
  NSString *v6;
  NEFilterDataVerdict *v7;
  const char *v8;
  NEFilterDataVerdict *v9;
  SEL v10;

  v5 = remediationURLMapKey;
  v6 = remediationButtonTextMapKey;
  v7 = -[NEFilterVerdict initWithDrop:remediate:]([NEFilterDataVerdict alloc], "initWithDrop:remediate:", 1, 1);
  v9 = v7;
  if (v7)
  {
    objc_setProperty_atomic(v7, v8, v5, 16);
    objc_setProperty_atomic(v9, v10, v6, 24);
  }

  return v9;
}

+ (NEFilterDataVerdict)dataVerdictWithPassBytes:(NSUInteger)passBytes peekBytes:(NSUInteger)peekBytes
{
  NEFilterDataVerdict *v6;

  v6 = -[NEFilterVerdict initWithDrop:remediate:]([NEFilterDataVerdict alloc], "initWithDrop:remediate:", 0, 0);
  -[NEFilterDataVerdict setPassBytes:](v6, "setPassBytes:", passBytes);
  -[NEFilterDataVerdict setPeekBytes:](v6, "setPeekBytes:", peekBytes);
  return v6;
}

+ (NEFilterDataVerdict)pauseVerdict
{
  NEFilterDataVerdict *v2;
  objc_super v4;

  v2 = [NEFilterDataVerdict alloc];
  if (v2)
  {
    v4.receiver = v2;
    v4.super_class = (Class)NEFilterVerdict;
    v2 = objc_msgSendSuper2(&v4, sel_init);
    if (v2)
      v2->super._pause = 1;
  }
  return v2;
}

@end
