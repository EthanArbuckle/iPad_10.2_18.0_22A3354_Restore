@implementation FCCTimeOfDayRule

- (FCCTimeOfDayRule)initWithMinimumDayDuration:(double)a3 secondsBeforeEndOfDay:(double)a4
{
  FCCTimeOfDayRule *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FCCTimeOfDayRule;
  result = -[FCCTimeOfDayRule init](&v7, sel_init);
  if (result)
  {
    result->_minimumDayDuration = a3;
    result->_secondsBeforeEndOfDay = a4;
  }
  return result;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FCCPercentageOfDayRule: minimumDayDuration: %.1f, secondsBeforeEndOfDay: %.1f"), *(_QWORD *)&self->_minimumDayDuration, *(_QWORD *)&self->_secondsBeforeEndOfDay);
}

- (FCCTimeOfDayRule)initWithProtobuf:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(v4, "minimumDayDuration");
  v6 = v5;
  objc_msgSend(v4, "secondsBeforeEndOfDay");
  v8 = v7;

  return -[FCCTimeOfDayRule initWithMinimumDayDuration:secondsBeforeEndOfDay:](self, "initWithMinimumDayDuration:secondsBeforeEndOfDay:", v6, v8);
}

- (id)protobuf
{
  FCCTimeOfDayRuleProtobuf *v3;

  v3 = objc_alloc_init(FCCTimeOfDayRuleProtobuf);
  -[FCCTimeOfDayRuleProtobuf setMinimumDayDuration:](v3, "setMinimumDayDuration:", self->_minimumDayDuration);
  -[FCCTimeOfDayRuleProtobuf setSecondsBeforeEndOfDay:](v3, "setSecondsBeforeEndOfDay:", self->_secondsBeforeEndOfDay);
  return v3;
}

- (FCCTimeOfDayRule)initWithTransportData:(id)a3
{
  id v4;
  FCCTimeOfDayRuleProtobuf *v5;
  FCCTimeOfDayRule *v6;

  v4 = a3;
  v5 = -[FCCTimeOfDayRuleProtobuf initWithData:]([FCCTimeOfDayRuleProtobuf alloc], "initWithData:", v4);

  v6 = -[FCCTimeOfDayRule initWithProtobuf:](self, "initWithProtobuf:", v5);
  return v6;
}

- (id)transportData
{
  void *v2;
  void *v3;

  -[FCCTimeOfDayRule protobuf](self, "protobuf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)minimumDayDuration
{
  return self->_minimumDayDuration;
}

- (double)secondsBeforeEndOfDay
{
  return self->_secondsBeforeEndOfDay;
}

@end
